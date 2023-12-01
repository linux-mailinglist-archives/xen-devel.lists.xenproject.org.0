Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0E80044F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 08:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645307.1007419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xZy-00017P-FB; Fri, 01 Dec 2023 07:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645307.1007419; Fri, 01 Dec 2023 07:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xZy-00014w-CQ; Fri, 01 Dec 2023 07:04:50 +0000
Received: by outflank-mailman (input) for mailman id 645307;
 Fri, 01 Dec 2023 07:04:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8xZw-00014m-9a
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 07:04:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8dcd176-9017-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 08:04:46 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8372.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.11; Fri, 1 Dec
 2023 07:04:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 07:04:43 +0000
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
X-Inumbo-ID: e8dcd176-9017-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWpRE0mhI7d5uMWIdu5viJPHSD428m/5DH82VTstHI74VRvCBi+TDFuC6AjsNX2gyJbmxWe+FbGZrEqGKk+qoRDVGSWg9ZCe2awA2it5nroBFLV2dDzw1al/swZY1VvOkmnZwk0BzhRqV7R+zgtYYqtBwz3lDs69N69NiGRZYhUuXkb1ab6X97F4/R2RczpYkGYDIicSEgHSHOgGWKtKey9svc+z0RsEjA+Zue6S4mU42JSw8u3I+tPb7RwznQOQpXLkZsNaqo8n5Xk6NF5H7emFufRVF/ACTCMdk2mn4DZxNb32RQ2kJLceJ+ToBTmO+1/QH3sihM/Lv1y1F2mPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntrgcbQQr8qmSnAY61BdbyT006mCPiG2PgnYHyPvRrg=;
 b=ZZQnoHodgWVYBR+4QxLWlEEm2yTqPp3j3VxqdIWKxfBViUt5zKpAeQoSN7RUbxbrzPXBrNpB9+h5ZZ3yg5YMr5Ncy96EBhP+yljocs7WzGwpeyI1U0nIeSzn4z5X+dRXBFJJHy1hpDxIGZvinzFk1B9/TxRIIXtpgG9GX93O+6ZNEXOzmL0v+ryIyJhgKgm96ThUpwbNWFfYKEVamxEAjBUGpptXx0KKGqGbPCTWXKWx/kbQh0mZQMXWH5tpt0MXnx2tOLUt9K9wmya9/ws6mnioQKrN6mkF1sb/w9hzg7+6wdYpxyEs2okAnRp2PHL9mqfpTomu4PdygU0OcavnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntrgcbQQr8qmSnAY61BdbyT006mCPiG2PgnYHyPvRrg=;
 b=pb/xpthlwurzeqRwdENlWutNAnnHeiYLgiIE6xsIcCLIqve3W+0DdlzERkk3Q8wqYpLC+yyxVF2DOKn6cO4MguZLftfraxKCQqq2J0voFAKzG9s4CfMuLbRdmd11b16FTUaGq2rLLhSACTPFbyjhsGpvue1kSd/S8qTeCNctf1u5WSu2DKhe8hFs81CI+Ii8a3YbtqAx59UsLUECW3AmFPnEOzYrukX/v+SG7Ez3htbXpOfzJxhftok/BqNhe7yiKWAMn/+Zis4MncEmzruWSRBwJ86Gr20SCdIdUbglZAsV/rX0benGXgC0hE5UZfj0wu7a0MhkGVidMYUkrPvKsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <073e8dd7-2fb2-46ab-b513-3672a3ee74e1@suse.com>
Date: Fri, 1 Dec 2023 08:04:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>, Henry Wang
 <Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
 <20230815210650.2735671-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2311301429030.110490@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <alpine.DEB.2.22.394.2311301429030.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf322d3-3b97-46c6-4ab3-08dbf23bcb95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SxLrGasmu/5OQEuLeYU/fZOc52YbxNktJpMymMHddzwgfg1Fn+ZUtJZyflKxgvp7EhYWlKXsFKrZxKtpOxAOnl2dZaua0D6Q3X+mzY1/701Ry8LmWsUlR+HFFWr+VL/tZclexz7C5V3PDK1jVGkMlSohNwo+nFmJM/hAROQgoH5vH/0hMTyPwvkytvI44IWDNkYi+eZ7MBygvtCKn0gEpcEbAqLaGOV0Nv9ZxMubOsvHwicm1k/uQJpaffj/M0+y9BM53f7urtoY00L3LZax4rmJRTr6XThTq08FnYDU0o9UXFj3Zodkl8MaN6IeZDc3+rNtaa03YC0Yh5new5BC6n9HxWuAmhSwQkA4XV91ClppJ2vyX5BqO+N1kKJXhjL+8xeEwXLZh69Wx/WKvwtjVTJSmpjCiAcqrPFTMFgPf0JcjKvVGA7SWdKA1M9MVmI4NgJ66/i/+DxadK3BGaTPCh7lBMRbYWNkManG16GsZ2vWSI/Pe6I+C5+PGKH74KdSiaLmOF8n8yivKOGqJuV2v1yQJ8qPKlE8rqn2i40J1QETShEFr+WNY6Rx5QIHSkcPX11dXsM4b/CrAkKJtJmivV0DiwSwTNK33VuK9nfD4g+i+xClc3RahhmSGAj7khy+V86+4NQg7BOYZmhU7SqNyRgpMUcIoM414Ukca6AegFhBj8e2ZF1VZTrOBDKP35+K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66556008)(6486002)(6916009)(508600001)(66946007)(66476007)(316002)(54906003)(966005)(86362001)(38100700002)(2616005)(8936002)(4326008)(8676002)(6506007)(6512007)(53546011)(26005)(83380400001)(5660300002)(2906002)(31696002)(30864003)(7416002)(31686004)(41300700001)(36756003)(21314003)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm1vR3JtdTUwR2JoejhrV0N5QzU4V1lsdEVBMUhnekt3aUtQMGh2dFNZUXFV?=
 =?utf-8?B?Yk9KbXhlV3FOMjRMaEN1TGVpSXFFWW8reUFGc25yM3R2REM0V3QwMFpvd1RC?=
 =?utf-8?B?elU5ZUdEbFVEZTZvck9KNnFrMkFpblB2ZGpPWkVYWSs3ei9iazhaWVczdm5q?=
 =?utf-8?B?RFdRS25mUnlESkxCTTcrTnVZOEQ1QUNtaHFCL0NCQ1puelZETFVoTFk0ak9S?=
 =?utf-8?B?V2hXZlgwSldaS0FIYmtjU3VlWnYwRzQ1cjg3RVRuenpUUGFEMEUxZ2VVQ2lr?=
 =?utf-8?B?ODJEM1RXcFNSelR6RWRPMzdmcklDSG9kbVBBL0RhZElNc1lCNWFRTDJkUFE3?=
 =?utf-8?B?VjZmN3NDVkpEZnl6TWkvbWlNNlM0a3U4UWdDZ3FVU3JHVnFIVUpJb1o1cnBQ?=
 =?utf-8?B?aHBzS3BFM01IaVgwUWRGdExKVmVmN0F1dzVWQjVpMWhBM1k1QysyeEJIelo1?=
 =?utf-8?B?S2FEbEdDWFdCbGkzQjJaNlZJSitYZXF1bVRyUW84VTJGcVk4dG5rcmR5eFhJ?=
 =?utf-8?B?NFRmYXVYQzBoSFRqZTNzaVFrYUZJVnZBYVI5a2tTUmFaQ1VrWCtRdVhXQitq?=
 =?utf-8?B?ZmxMWVVrdEdXNnZaUGdkMCs5d1NsU0YvaHRldk9TckkzZkRuV3k3QnhtSXB5?=
 =?utf-8?B?YmlPYkMxRC9wM2RvOEk2Vm9TZTlWN0oyTDh0ZEI3SjJiSjVscmN3MFlka0lU?=
 =?utf-8?B?eTVIMzkvalFRZGZZZENEM09PVmMzZEVUMFZLUmxGLzRwK0IzZDFSb3FPMllx?=
 =?utf-8?B?REF2Kzc0ZkxlK1Nnb0h3NkV6RnEvaXk3V21tYklia3dRZGJ5dnBYMXVTY2J1?=
 =?utf-8?B?Q215NWdrOVQraG94MEdpVmZhdWYrcytPZ3VhdXZ0RFZrNUQzYTNQYW1LU3p1?=
 =?utf-8?B?Wjl3dTJvVm1Ib0hWVWE3N01OL2ZBUFplNTgrd3FpK21pR05ja2VWblVOM1d0?=
 =?utf-8?B?bW4rNGJwS0RoV1JRS1ZEQzdIZkhBTzdKWjZiSlduN2c2YURZU0RGVmFTZnpW?=
 =?utf-8?B?UG9rdGtLSUVhTnB3cEh1U0RJd20xS0NVUWE5WEJRV2Q5U3poamxEMzlQUkd1?=
 =?utf-8?B?azhJQnF1MEZKQ0lIajlNcE0xWEt4Z25sWDhoRitobTRHdkxsNVFjWGovYmFC?=
 =?utf-8?B?NjBVMDZ2aEliQTk0TlpSRHFodWRVZGtYR0xTN2lqcWpzbzVwUStuVGlpRlRr?=
 =?utf-8?B?aU1tMHQwTUpyVm9mNHo0NlFDY0R3cVBCVXNZT1krTUFSUjd3TGh0bGZtK0Er?=
 =?utf-8?B?a0U1QnNGbzAxcE03emI0cUwrVmZqbTlWODh4YStwK3JwLy9aOTNNUVlaUVBY?=
 =?utf-8?B?MHkzaW1rQzA4YkRWVlFVNU5kQlQ2UWJYUXBZeXBPRG9JaWpxdHZUbHpubDc4?=
 =?utf-8?B?YWE3VDNna0RJbmI0QTlQVjR0bE1tbDU4TDFYUm5QMkY2VTlxUkVOT1hLSkJu?=
 =?utf-8?B?NXRhV2NlL0ljVERQSFZ3bWpWNmdKM01SRmhJbFpTMy9XTTZVK1BiUUxYbDVq?=
 =?utf-8?B?VkFSaDdnTStYeExhblRwQ25HTVYzenppd0h2bWJoOFE0dTAzT1hiaE1CeEJC?=
 =?utf-8?B?c2tQSG4yOXUwL3NKbTlBQkhVdXIyeW5pTjk3Mzdoa24vUm5saWphN3A0dzRk?=
 =?utf-8?B?T2VZbWlyVmZWNS9oWTRrdlA0L1hzZVcxZWtYRVc2NWc0UXRNbEl6Mkxod1dB?=
 =?utf-8?B?RXBwSkxrZFE5UXdsNmRGRXJQMmd4SDh1LzdFdjZ5SWJ1U0hZMkZTNWZObU1p?=
 =?utf-8?B?aDlDejFFbkZ2UGVMNzFvVlhWL0VKbHY3WjhEUVdkOFV3TzFhbDZOSGUrY2Rq?=
 =?utf-8?B?UlgzRnlaTklIWGZDSU9pTGh1cUZlTm9wd3ZSWXgyYVIvZXlYaERuVTR2WjZk?=
 =?utf-8?B?NGNZQ3ZWSzl2L1hhaEZ4c1RuTzV4bFUxRHQ3Skw1cVczSWg5QjFaa3k0SUUy?=
 =?utf-8?B?L3RTdEk4VUhIeGthcmpSYytkRXFBSnE3Y2NmQlVJb1FXN3hlblBBZUNXRUd0?=
 =?utf-8?B?bUJETDh2VDBZWTVpd3cxVktaeEYySjJseDFNTXlVYkFiUktkMTBQM1E5SVJv?=
 =?utf-8?B?b04xaWxRcHF0MmJNMldkZnZ4M2oyR2xDL3oxUUpCL000NlVuYXZiQnVQR0JL?=
 =?utf-8?Q?M7HLctAUgWN2u79ln/Bl1ePwb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf322d3-3b97-46c6-4ab3-08dbf23bcb95
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 07:04:43.7116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T44mFoa1k591HL6s/ojcxYoWCjHCiuFbbaNOdtFGeUx/iiyEMdqI6J4IWla5ISTq/ThwnnkxSiGtL3PeKu0T2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8372

On 30.11.2023 23:30, Stefano Stabellini wrote:
> Hi everyone following this thread,
> 
> please see:
> https://marc.info/?l=xen-devel&m=170135718323946
> https://cryptpad.fr/form/#/2/form/view/7ByH95Vd7KiDOvN4wjV5iUGlMuZbkVdwk7cYpZdluWo/
> 
> For a vote on the usage of the word "broken"

So I did vote before becoming aware of this context. I would have voted
differently if I had known that this _alone_ is the context. Yet then
I'm also not going to change my vote, because as written _there_ it is
intended to be more general. If the wording of the text describing what
to vote on changed, things would be different.

Jan

> On Tue, 15 Aug 2023, Andrew Cooper wrote:
>> Recently in XenServer, we have encountered problems caused by both
>> XENVER_extraversion and XENVER_commandline having fixed bounds.
>>
>> More than just the invariant size, the APIs/ABIs also broken by typedef-ing an
>> array, and using an unqualified 'char' which has implementation-specific
>> signed-ness.
>>
>> Provide brand new ops, which are capable of expressing variable length
>> strings, and mark the older ops as broken.
>>
>> This fixes all issues around XENVER_extraversion being longer than 15 chars.
>> Further work beyond just this API is needed to remove other assumptions about
>> XENVER_commandline being 1023 chars long.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
>> CC: Daniel Smith <dpsmith@apertussolutions.com>
>> CC: Jason Andryuk <jandryuk@gmail.com>
>> CC: Henry Wang <Henry.Wang@arm.com>
>>
>> v3:
>>  * Modify dummy.h's xsm_xen_version() in the same way as flask.
>> v2:
>>  * Remove xen_capabilities_info_t from the stack now that arch_get_xen_caps()
>>    has gone.
>>  * Use an arbitrary limit check much lower than INT_MAX.
>>  * Use "buf" rather than "string" terminology.
>>  * Expand the API comment.
>>
>> Tested by forcing XENVER_extraversion to be 20 chars long, and confirming that
>> an untruncated version can be obtained.
>> ---
>>  xen/common/kernel.c          | 62 +++++++++++++++++++++++++++++++++++
>>  xen/include/public/version.h | 63 ++++++++++++++++++++++++++++++++++--
>>  xen/include/xlat.lst         |  1 +
>>  xen/include/xsm/dummy.h      |  3 ++
>>  xen/xsm/flask/hooks.c        |  4 +++
>>  5 files changed, 131 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
>> index f822480a8ef3..79c008c7ee5f 100644
>> --- a/xen/common/kernel.c
>> +++ b/xen/common/kernel.c
>> @@ -24,6 +24,7 @@
>>  CHECK_build_id;
>>  CHECK_compile_info;
>>  CHECK_feature_info;
>> +CHECK_varbuf;
>>  #endif
>>  
>>  enum system_state system_state = SYS_STATE_early_boot;
>> @@ -498,6 +499,59 @@ static int __init cf_check param_init(void)
>>  __initcall(param_init);
>>  #endif
>>  
>> +static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> +{
>> +    struct xen_varbuf user_str;
>> +    const char *str = NULL;
>> +    size_t sz;
>> +
>> +    switch ( cmd )
>> +    {
>> +    case XENVER_extraversion2:
>> +        str = xen_extra_version();
>> +        break;
>> +
>> +    case XENVER_changeset2:
>> +        str = xen_changeset();
>> +        break;
>> +
>> +    case XENVER_commandline2:
>> +        str = saved_cmdline;
>> +        break;
>> +
>> +    case XENVER_capabilities2:
>> +        str = xen_cap_info;
>> +        break;
>> +
>> +    default:
>> +        ASSERT_UNREACHABLE();
>> +        return -ENODATA;
>> +    }
>> +
>> +    sz = strlen(str);
>> +
>> +    if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
>> +        return -E2BIG;
>> +
>> +    if ( guest_handle_is_null(arg) ) /* Length request */
>> +        return sz;
>> +
>> +    if ( copy_from_guest(&user_str, arg, 1) )
>> +        return -EFAULT;
>> +
>> +    if ( user_str.len == 0 )
>> +        return -EINVAL;
>> +
>> +    if ( sz > user_str.len )
>> +        return -ENOBUFS;
>> +
>> +    if ( copy_to_guest_offset(arg, offsetof(struct xen_varbuf, buf),
>> +                              str, sz) )
>> +        return -EFAULT;
>> +
>> +    return sz;
>> +}
>> +
>>  long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>  {
>>      bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
>> @@ -711,6 +765,14 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>  
>>          return sz;
>>      }
>> +
>> +    case XENVER_extraversion2:
>> +    case XENVER_capabilities2:
>> +    case XENVER_changeset2:
>> +    case XENVER_commandline2:
>> +        if ( deny )
>> +            return -EPERM;
>> +        return xenver_varbuf_op(cmd, arg);
>>      }
>>  
>>      return -ENOSYS;
>> diff --git a/xen/include/public/version.h b/xen/include/public/version.h
>> index cbc4ef7a46e6..0dd6bbcb43cc 100644
>> --- a/xen/include/public/version.h
>> +++ b/xen/include/public/version.h
>> @@ -19,12 +19,20 @@
>>  /* arg == NULL; returns major:minor (16:16). */
>>  #define XENVER_version      0
>>  
>> -/* arg == xen_extraversion_t. */
>> +/*
>> + * arg == xen_extraversion_t.
>> + *
>> + * This API/ABI is broken.  Use XENVER_extraversion2 where possible.
>> + */
>>  #define XENVER_extraversion 1
>>  typedef char xen_extraversion_t[16];
>>  #define XEN_EXTRAVERSION_LEN (sizeof(xen_extraversion_t))
>>  
>> -/* arg == xen_compile_info_t. */
>> +/*
>> + * arg == xen_compile_info_t.
>> + *
>> + * This API/ABI is broken and truncates data.
>> + */
>>  #define XENVER_compile_info 2
>>  struct xen_compile_info {
>>      char compiler[64];
>> @@ -34,10 +42,20 @@ struct xen_compile_info {
>>  };
>>  typedef struct xen_compile_info xen_compile_info_t;
>>  
>> +/*
>> + * arg == xen_capabilities_info_t.
>> + *
>> + * This API/ABI is broken.  Use XENVER_capabilities2 where possible.
>> + */
>>  #define XENVER_capabilities 3
>>  typedef char xen_capabilities_info_t[1024];
>>  #define XEN_CAPABILITIES_INFO_LEN (sizeof(xen_capabilities_info_t))
>>  
>> +/*
>> + * arg == xen_changeset_info_t.
>> + *
>> + * This API/ABI is broken.  Use XENVER_changeset2 where possible.
>> + */
>>  #define XENVER_changeset 4
>>  typedef char xen_changeset_info_t[64];
>>  #define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
>> @@ -95,6 +113,11 @@ typedef struct xen_feature_info xen_feature_info_t;
>>   */
>>  #define XENVER_guest_handle 8
>>  
>> +/*
>> + * arg == xen_commandline_t.
>> + *
>> + * This API/ABI is broken.  Use XENVER_commandline2 where possible.
>> + */
>>  #define XENVER_commandline 9
>>  typedef char xen_commandline_t[1024];
>>  
>> @@ -110,6 +133,42 @@ struct xen_build_id {
>>  };
>>  typedef struct xen_build_id xen_build_id_t;
>>  
>> +/*
>> + * Container for an arbitrary variable length buffer.
>> + */
>> +struct xen_varbuf {
>> +    uint32_t len;                          /* IN:  size of buf[] in bytes. */
>> +    unsigned char buf[XEN_FLEX_ARRAY_DIM]; /* OUT: requested data.         */
>> +};
>> +typedef struct xen_varbuf xen_varbuf_t;
>> +
>> +/*
>> + * arg == xen_varbuf_t
>> + *
>> + * Equivalent to the original ops, but with a non-truncating API/ABI.
>> + *
>> + * These hypercalls can fail for a number of reasons.  All callers must handle
>> + * -XEN_xxx return values appropriately.
>> + *
>> + * Passing arg == NULL is a request for size, which will be signalled with a
>> + * non-negative return value.  Note: a return size of 0 may be legitimate for
>> + * the requested subop.
>> + *
>> + * Otherwise, the input xen_varbuf_t provides the size of the following
>> + * buffer.  Xen will fill the buffer, and return the number of bytes written
>> + * (e.g. if the input buffer was longer than necessary).
>> + *
>> + * Some subops may return binary data.  Some subops may be expected to return
>> + * textural data.  These are returned without a NUL terminator, and while the
>> + * contents is expected to be ASCII/UTF-8, Xen makes no guarentees to this
>> + * effect.  e.g. Xen has no control over the formatting used for the command
>> + * line.
>> + */
>> +#define XENVER_extraversion2 11
>> +#define XENVER_capabilities2 12
>> +#define XENVER_changeset2    13
>> +#define XENVER_commandline2  14
>> +
>>  #endif /* __XEN_PUBLIC_VERSION_H__ */
>>  
>>  /*
>> diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
>> index 9c41948514bf..a61ba85ed0ca 100644
>> --- a/xen/include/xlat.lst
>> +++ b/xen/include/xlat.lst
>> @@ -173,6 +173,7 @@
>>  ?	build_id                        version.h
>>  ?	compile_info                    version.h
>>  ?	feature_info                    version.h
>> +?	varbuf                          version.h
>>  ?	xenoprof_init			xenoprof.h
>>  ?	xenoprof_passive		xenoprof.h
>>  ?	flask_access			xsm/flask_op.h
>> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
>> index 8671af1ba4d3..a4a920f74e6e 100644
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -828,9 +828,12 @@ static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
>>          block_speculation();
>>          return 0;
>>      case XENVER_extraversion:
>> +    case XENVER_extraversion2:
>>      case XENVER_compile_info:
>>      case XENVER_capabilities:
>> +    case XENVER_capabilities2:
>>      case XENVER_changeset:
>> +    case XENVER_changeset2:
>>      case XENVER_pagesize:
>>      case XENVER_guest_handle:
>>          /* These MUST always be accessible to any guest by default. */
>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index 78225f68c15c..a671dcd0322e 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -1777,15 +1777,18 @@ static int cf_check flask_xen_version(uint32_t op)
>>          /* These sub-ops ignore the permission checks and return data. */
>>          return 0;
>>      case XENVER_extraversion:
>> +    case XENVER_extraversion2:
>>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>>                              VERSION__XEN_EXTRAVERSION, NULL);
>>      case XENVER_compile_info:
>>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>>                              VERSION__XEN_COMPILE_INFO, NULL);
>>      case XENVER_capabilities:
>> +    case XENVER_capabilities2:
>>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>>                              VERSION__XEN_CAPABILITIES, NULL);
>>      case XENVER_changeset:
>> +    case XENVER_changeset2:
>>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>>                              VERSION__XEN_CHANGESET, NULL);
>>      case XENVER_pagesize:
>> @@ -1795,6 +1798,7 @@ static int cf_check flask_xen_version(uint32_t op)
>>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>>                              VERSION__XEN_GUEST_HANDLE, NULL);
>>      case XENVER_commandline:
>> +    case XENVER_commandline2:
>>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>>                              VERSION__XEN_COMMANDLINE, NULL);
>>      case XENVER_build_id:
>> -- 
>> 2.30.2
>>


