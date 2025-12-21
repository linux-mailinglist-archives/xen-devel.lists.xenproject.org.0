Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6070CD45D5
	for <lists+xen-devel@lfdr.de>; Sun, 21 Dec 2025 22:24:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191878.1511302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXQt0-0008Vi-MT; Sun, 21 Dec 2025 21:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191878.1511302; Sun, 21 Dec 2025 21:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXQt0-0008Si-GI; Sun, 21 Dec 2025 21:22:42 +0000
Received: by outflank-mailman (input) for mailman id 1191878;
 Sun, 21 Dec 2025 21:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+6Rm=63=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vXQsy-0008Sc-SV
 for xen-devel@lists.xenproject.org; Sun, 21 Dec 2025 21:22:40 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cca8ff2-deb3-11f0-9cce-f158ae23cfc8;
 Sun, 21 Dec 2025 22:22:38 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Sun, 21 Dec
 2025 21:22:35 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 21:22:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2cca8ff2-deb3-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FA3bDbe0P6LBLHZ1QbS5tfPhf0TuSA+5mZPKyzxeE5LRtspNWNUwYtItgeU+4ekEiBa6OETgRaDcXI9IFH/NXkztQmNf8FKCwAFruU/VZGpqGmepTYCOo6IGzaJxcCPpXaXGFIUJ6LG5E4ASS3D1VsxOJseqfluKMZLXloM3SmdqjKQZJhVZPWqIi4AK3CcTrthgxakv97CDJKkrR+WmSAPCWWYEJ9QPtEaa1WHGI49E8BhgKryIEC+KcQysu1EdbXvrEMlzmU4FthPGGMAi8xWUG5VUqcnhTkNO2QbAvaWs3iwk9r6oK5VmnqGNwrzkfgO0tTOJe8fDmIWQ/7sk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7tf16p5uVfKOGdFPvoAM40ttXm4vOTqWqvXPCz1Gi4=;
 b=ReL0J9GjytSN1gzzf10ppZabFMQyX5KwbTpo1Z7UB2PQMfvivascUmy6ND/5J1KytVQXU1YcYy06ZOLR3ubEzGeFvF0W/oQP4xAsFgAI38jqFIVMashHQAMP4awlkFbjCmnuW4926rQ1QoLFugTPplk5WCJMZqkHAa++zSf/xXpShD+78i8KzfFf5WfJP5AtNMQlAOh8+Yhv16YCGGR0NAxaM76aFsQzSkBJGO5gCxtxUfJTjj3xI5p7+QPxU0EcuXTrl+BR7lrdFZnQ+C1GUGuutIEXWa61OCyLpr/sgFnGFOj0msp+PSBMaVrZ7n8FtVXamuNtNjgwDWwCEG7wEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7tf16p5uVfKOGdFPvoAM40ttXm4vOTqWqvXPCz1Gi4=;
 b=scz49qmDR4k8F3tKgNBMgjCISj7NtCcOtCStDZkW4O+QWKBJMudrXU9SgA/r4vFn1ZQOPPwZyUSngA3iZaNG/Z26zZrGXOPzmjZPLFKxrHV1eJouv7dcLCCXT9siZ1fAqH+LYNVlllHI0enFvsj2E987W6z37hFJqUbYw5EoG/gXHq8kTFKPcv5ULcaoZ/IMwWwtLvgK9txvn9vn0Lv1OAlOqNI9L2+SpRPLjoXnPsNsqWXzBw9fAp/8zxWrsWfhKs9lUp+boLBkF9bQQJ5C6lylZrh928jazXqtjBU+JYcz1h8xHdC1tq74Lae33d5QDESYeIDiAV8C6TouykyecA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <571605ab-08fa-4cca-9462-5e4645431314@epam.com>
Date: Sun, 21 Dec 2025 23:19:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/domctl: add XEN_DOMCTL_CDF_ALL mask
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251111201627.3579504-1-grygorii_strashko@epam.com>
 <67f0d3e0-bd90-4817-a084-49d01d8305ff@epam.com>
 <570f1e3d-94ab-40a9-8d6c-c36615e5aa2b@vates.tech>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <570f1e3d-94ab-40a9-8d6c-c36615e5aa2b@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AS8PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: b597d1f5-c6c3-4f75-e358-08de40d70f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnB1R2tzaWlxdUoyVkRJTEVRUUV5RWxJSXNuOE1PV01CaHJmTjgzMCtaeGly?=
 =?utf-8?B?TEt5NmJQWFU5TmlpQnc5L0VjL0xUUllCT0VDTUwwelZFa1lvSWdoYzc1ZW9T?=
 =?utf-8?B?RUtIQktCS1JsZFRUcDFRL0xhTmJkNDV6Q0FhMGdNMkJnMFVCTzFYbjAvR3k2?=
 =?utf-8?B?cUkwVlEwSFlDQ3lHR2ZQa2sxSEdQV0VyU05XNGNhczd3eUVUc0FKcHFObFNB?=
 =?utf-8?B?UVhPSXRSdnYrSC90L3RYeU5QalMvT1c2WDZndmlsS2ZUVG80dGVvUjc3TFN3?=
 =?utf-8?B?Smw5WU9zQVZESytDL1RoZ1dVUHNJN1BOUSsyK3ZRK1h6ZDlwaTZ2cGViOXI0?=
 =?utf-8?B?d1F5YkdYNTJzUStPM2ZIQ2Nzbmw1cGFYV1IwV1pJcjFGdGhheXp4Y2VxTndW?=
 =?utf-8?B?VnJDaEdxdnRvRVB1N3BaSVNHSy8wWjFTcmhRblNIYVdmQXJOdTJoY0hUVUFu?=
 =?utf-8?B?Um1BcDRsN1g4VGxJYTFsVkRHdDI5ZkdHdnAxTHFMZkRiRWxCYmdPK1dUN1BH?=
 =?utf-8?B?Y2ZURk84TnQ5WUNtdDhlbm9kUHVQbWhMMWo2bHgxZm1EeGhpRXM4dHNhTXRl?=
 =?utf-8?B?QkdoOGhIM3dMN242MUE0KzNRZEUrSytjeFdzb1FEWVF6TkoyVDl2bnlqalZI?=
 =?utf-8?B?YTBxR3B6NVAvbmRSM0VZdWtoeDBiOE9DMG5NYWlmaU1PdzZsUTRPczZqL2Zq?=
 =?utf-8?B?bUFMQktLbkhnYmNHQzZTV08zeTBBcEc1MDkrNkFSVlRneVNxTHRNbWVWY1NC?=
 =?utf-8?B?S0NBUllEWVJYc0FwbDRVRzFFaFEwWHcwbGk3TGZaUHQ3anZRcDNmNm15T1hB?=
 =?utf-8?B?S1F2TXkrQzJFSXFUSVNJZzV3N3NkN1BvdjNiVFpwYk9uZzhiQWZzZnVHY2tr?=
 =?utf-8?B?Nml1bGF2cGxFUzR2NjZvODZKMGpGM3R2bWNEVVhOcG8zMUtsdk5jOGZxUWcz?=
 =?utf-8?B?Mk14ZGF4c3BtZmgxLzRKUDE2blY5TXJCQTVvRnBtNER5WWtUT0VISzhnT3Qw?=
 =?utf-8?B?enU1Ry9VOFB0ZEx6SmFscGdqSmFvdU1KcTdhVDFDdnV5R2N1blZheWo1MVdN?=
 =?utf-8?B?WElYM0xxbVpPeXZ2akZGRzFQTTh0SU1Gems5TStickNXdjczeW9RcjJtbXVZ?=
 =?utf-8?B?ZTk5dEp2Y1VJVVprczVGbkFNeHV5N3Nnai9HYnN4R0xnaC95NVhpaGVhRHQ3?=
 =?utf-8?B?V3Mxalc5U2ZVWStURXUzWUhIWUtGVG04Mk9CMi9HNDAwZ05nclczbzRCOVBv?=
 =?utf-8?B?Y1RpMzkwbElrMm1RcERpVnRNVG9qTzUzbjBPRk1jWFU4aXlHWnVYaEZWT1lG?=
 =?utf-8?B?SnNiNFlGNmhSQ2tldmtvOGkzRGkvTWZGUEl6NU12SmthRGpmSTFsRTViMkpF?=
 =?utf-8?B?WVB6SjVzTTRQWVJKaUxiczVnZTZmOEF6NHRLR0lGVnlscS9sSXlBZW1PTUFx?=
 =?utf-8?B?WHZCamw5MFQ4RGlBcUlUcEFsaGVDRjdMQTFDZGtyU3VJOWtVMGQzVmw2YmN1?=
 =?utf-8?B?akIvbElDaXdWc0lRS2ptU21ocDhFTmJ0cG5FTXA3M0NOb1pjdjdJM2NFZGZQ?=
 =?utf-8?B?Y041bzM0M2RGK0xLMlJlYTRidWtUMVA5TktrNStTWDA4NlIwQTkyYy82TWsz?=
 =?utf-8?B?TGtIOTlVa05oMGhMTzFNK1NmNlZ1WThRVDNkSVpiUVFYUGFXQ0kxdXdTWEhV?=
 =?utf-8?B?WVc3YWJYYkJvWmkwbzRLMFVSc0drcmpvOWNPSUcraC9wVU51bzRuc0JkdUwx?=
 =?utf-8?B?WHQ2aitVNFZhRm14MlFwOEhBNDUwK2t2WkdDZG1qTmdIQkJRcEdxc1l0QjZp?=
 =?utf-8?B?NEszaCtORWlCSExNM2FaajBzei9RU0NUbnd5Vm0wVGVNbEVEN0hOdDVyb0pS?=
 =?utf-8?B?UmpyQnl4ZzZveWFPeG5URlFWNmNlV1pqRUdBVEt5cUNxVGZabVpHb1VQTHcr?=
 =?utf-8?Q?6bg+sIev4sxtuFlcLYF/ukRKTWT4AOws?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YitNb1NvbmI3ak1FbCs2WjQ4eXVHTWZrNkhWR25wK201TGR0OGc3SmdjYWxF?=
 =?utf-8?B?R29TRlZJY1hjaU9IaWZONlNZYmZ3a2U1UlJTZkNjUkNyNUtRQjlaN0pUT2N0?=
 =?utf-8?B?NWNmODRrRmRSWFVqK0hFK3Y3M0xiZDVBcHZBUlI2UkRwMXVxOUlQcTdCdkVX?=
 =?utf-8?B?d01oQkZBVXlLcmtxRHhVNjNjN1hlTEE3RHZmV2NkL2NJelVOMTdyMEw0TFhz?=
 =?utf-8?B?YWJWNm9XTUNqT2NweS90b2VWMjlXbXhoZEZkdnFwU2grSFZlQklhbmNhQWNP?=
 =?utf-8?B?VFpCYzNic1Fva3M5SmhoR2FEN0NvOEhyRXUyNytLOWFjeFI3bkp6dWRlcGdS?=
 =?utf-8?B?SzJVdEdYOWhlb1pjYjMzNVVlN0dNc2lOYXBzS0xqQ0dpVHNrdHhzTTRmUXBY?=
 =?utf-8?B?L1pJajA3bVRucDZyOUZSdXVtNmtLMzFkYnhLdnlLQk5DWU9oVW1ESlJ4Y2pC?=
 =?utf-8?B?Nk5YdkhJN1BjZVcrZ3VWdGMraU5NRUYvcGRaR2NTS1JxbDdlRktla0xmdVpm?=
 =?utf-8?B?R3lpYTQzazJXdzRDZTNyUTJ1S1prK2poM3FMOHNuN1FncW5zMUNBS3E3Z2o3?=
 =?utf-8?B?ZmdFVDVha3llMFVNNUdXRis5NUVlaUFTUm9hcGR0YXk3V05XLzF1YjJCWWI5?=
 =?utf-8?B?cm5qd3Eya2FNeDBLUFkwSEVCZXFoakpVUGhjVWNDYmFVclBhOGt2TGxyUm1o?=
 =?utf-8?B?NlllcnozVmVFbGUwU29VelQveEY0R1M0TCtZSWU2d0FZYTFHU0JRMm9oN1Bo?=
 =?utf-8?B?cmpmUWVESnVCMW42b1NiOUJNczBxVnltK2hCUGJJcjgrMUw0LzFPb2JHMUl3?=
 =?utf-8?B?N2EzTXl2RzI3U2c2WHN1Y2N0TEVwQzk3bVErWlh4K25tRHpVaElPbmFZN2R6?=
 =?utf-8?B?SlBMb0FRbmxReVREaXQ4YXJmM2ZYQnREd1M1RHNCSnpxbGp6Q1huUXlSNzRX?=
 =?utf-8?B?c1NROFZabjllNkdTd1p1R3M3cC9TeHdDR1RZNzYvc0ZsQlh5QzB1RmQvNGMv?=
 =?utf-8?B?NUVVY0xLbkVqUTZ3dkhYSTViU2VTb2ZiWDZTRzlrQ3FLdHIrcm52NG1ONjFi?=
 =?utf-8?B?dEVwN1hwUFVqTmd0OWRUWlVlWXJLWFdrUTl5UERMTlc0ZkRRcStpU0ZoYjhm?=
 =?utf-8?B?bGtmTUtMSkhzbTY2SXJMcDVQT3dEUy8wNHUzSWdha2JYeVlEWE1SL3BabzUr?=
 =?utf-8?B?elpvcndHZm5YbHU3SWw4c2VOVTgzR3FzOUl4Q0xBOHozK1RobHNyNXV5eXNn?=
 =?utf-8?B?OFhBM3ByZlZ5SUNPbDFXS2tHeXdkUjZRR3lmSmYwL2UzdXlURm16U2hJMG9z?=
 =?utf-8?B?MmszUC9CY0pZS3k5ZWVKTDBscEdaR1dsNCtHUjRlMExsMFNvQzlLWXlOMGg1?=
 =?utf-8?B?b0pVWWJFL3hIUytNeFZJMDdxa3F0akl5c1Z0UmZwWUVlQlhNaHFiVXhYaGZu?=
 =?utf-8?B?UzJTVUlRSHZMdGxaZk0xWDM0ZFNhcnptaks5YXRneWpINk9tWWR5Rmsra2hK?=
 =?utf-8?B?SFFDa1VpZnpwS2tkWElIUFNnM28wakJTMzlXUlBkT1VpdER6WXpuQjd5NXo5?=
 =?utf-8?B?UmZZR0p4aXRPZWZ5c0ZzbjBJODdmNm01SGI0R3BaYUlXVDBuTUhrTVNTNmFl?=
 =?utf-8?B?SEd2MUo4b205b0IxVDcxa0c1Ukw1RVVGZkg4UldNUFRoWExnbXpUOXNBcDZJ?=
 =?utf-8?B?QXMySVN1MlgxanlmWUl4YmQxYUxJTXpYVHk5UkRheURSUExxYlI5OERiMmtH?=
 =?utf-8?B?MDdCZnJrRS9VTU1tY0FyYlVzU1NKUHl1MW9tNkNtZzZ4QVE4bUt3Si9TdmYz?=
 =?utf-8?B?TW1TTEpiUVZYbkR6NmhQYzI5ejNSbHAxanVUaTdic0t6dFZLOVM5K0hYeCs4?=
 =?utf-8?B?RnVwaXk2Nk9rN0NmNC9DYXY2Y0hpcUluc1psKzNJS2RsUldqQXlTZXBCcXZF?=
 =?utf-8?B?bG8xbm5vTnN3dURXMnRuNWovWk1jb2xOR1d1T3ByUENxOVdMMFErbVNiRGRa?=
 =?utf-8?B?OHJKQXpzcEFCbzBURVpoaFVOYWFhQTVSSVl6T1dUNHNiaTA0amdWUitEaXls?=
 =?utf-8?B?alFmaFpoZnVLa0pZbm9XVEJMQnZOS0Evazh0K3JEODlVN3p2VWI5MHJUWTZW?=
 =?utf-8?B?Z09RNFZBTWtPWW0zcXpPdHE4NDJsaVpTVXpKenZIWWJ2d2tPYmh3VXdlWWsz?=
 =?utf-8?B?bnViTGdPRGJXVVlwTVJtSU85Ri9wSW9YUEcxNWplKy9LOW9BZEdQdDdVMmR4?=
 =?utf-8?B?RjR3QkU5Zk4yelRnOGJja2JONG1ObzFyRUtDZWRVUlpsamlNa3p2dU5UWTl4?=
 =?utf-8?B?S3lWaElTRUNUMTZtRTBZcGVYODJlRDZmUDF2VFBaNzAvKzg4YllDWlpYQU5a?=
 =?utf-8?Q?ys0GF51dRz9umPcs=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b597d1f5-c6c3-4f75-e358-08de40d70f45
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 21:22:35.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQWhnNJXALOAnrkqmv0iSP/6+jBozm34J2D1qdo+lo4J7LVI0OlXtB/Mw5iWtNShCpaZQSyByAVkD3j/DMuv0ykVcmNaQOOcfA9NNeu2UNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7603



On 19.12.25 18:10, Teddy Astie wrote:
> Le 18/12/2025 à 16:21, Grygorii Strashko a écrit :
>>
>>
>> On 11.11.25 22:16, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Every XEN_DOMCTL_CDF_x flag:
>>> - is defined in public/domctl.h
>>> - explicitly listed in sanitise_domain_config() (common/domain.c) to form
>>> mask containing all supported DOMCTL_CDF flags for "Unknown CDF flags"
>>> check.
>>>
>>> So, it is required to modify two files every time XEN_DOMCTL_CDF_x flags
>>> set is modified.
>>>
>>> Simplify the things by introducing XEN_DOMCTL_CDF_ALL mask, so
>>> sanitise_domain_config() no need to be modified any more.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>
>> Seems nobody interested, sad, dropping from backlog.
>>
> 
> Sorry, I missed this one (I guess others have too).
> 
>>
>>>    xen/common/domain.c         | 7 +------
>>>    xen/include/public/domctl.h | 7 +++++++
>>>    2 files changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>> index 775c33928585..4f91316ad93e 100644
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -730,12 +730,7 @@ static int sanitise_domain_config(struct
>>> xen_domctl_createdomain *config)
>>>        bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
>>>        bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
>>> -    if ( config->flags &
>>> -         ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>> -           XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>>> -           XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
>>> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
>>> -           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
>>> +    if ( config->flags & ~XEN_DOMCTL_CDF_ALL )
>>>        {
>>>            dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>>>            return -EINVAL;
>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>> index 8f6708c0a7cd..94a8e3042cbf 100644
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -72,6 +72,13 @@ struct xen_domctl_createdomain {
>>>    /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
>>>    #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
>>> +#define
>>> XEN_DOMCTL_CDF_ALL                                                     \
>>> +        (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>>                               \
>>> +         XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>>>                  \
>>> +         XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
>>>                       \
>>> +         XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
>>>                      \
>>> +         XEN_DOMCTL_CDF_trap_unmapped_accesses)
>>> +
>>>        uint32_t flags;
>>>    #define _XEN_DOMCTL_IOMMU_no_sharept  0
>>
> 
> Given that we already have XEN_DOMCTL_CDF_MAX, we could base the check
> using it instead.
> Something like checking fls(config->flags) > fls(XEN_DOMCTL_CDF_MAX) ?

That's what I've tried first.
The problem is that there is possibility of CDF_X to be removed/deprecated, small, but still it is.
In such case fls() can't be used.
So using define which list allowed flags is safer from long term point of view.

-- 
Best regards,
-grygorii


