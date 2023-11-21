Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A587F2A26
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 11:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637675.993684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NqG-0003Ey-SG; Tue, 21 Nov 2023 10:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637675.993684; Tue, 21 Nov 2023 10:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NqG-0003CQ-Of; Tue, 21 Nov 2023 10:18:52 +0000
Received: by outflank-mailman (input) for mailman id 637675;
 Tue, 21 Nov 2023 10:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5NqE-0003B3-CD
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 10:18:50 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ba1c730-8857-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 11:18:47 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9139.eurprd04.prod.outlook.com (2603:10a6:102:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Tue, 21 Nov
 2023 10:18:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 10:18:45 +0000
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
X-Inumbo-ID: 5ba1c730-8857-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kc6ILKPo5FJMRjw3WRb/YPji8kxXTb40SJA7FQ3/xvBBKBgd2hw2pAivDj5wTevLZUfXGTuMpopUSMzl8Cj4zNc0g/Sej4U+j8bB3X8N8f5muIpGz8YpBZodh/RCmQHPrGlXBWXqI+rVhl+AaA2/sTEm502Y5Busdgw9//jwJ2z0U+tWHAr28GyZ0krT+IepNIGb6vbD9HLSI9pj6t05w5Px2SiTlMHODC6Dpv+KgGYpzkDW/F7jLU8qyd93UVT5589EbNwI1Yy17awKG7N9MDFcBBdZ4HYxwdqP/Af9WvArA36CwlAzuj/m1MzMqGU08qVQKVMz5u0Qh0yG5j9Pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQeS1ZoJ3k2wUTiC0cWnVta5QX9gq/h+9UUaSXk2kig=;
 b=dGV5Ryug1EXt9F/fD7xFvKvNjFKDtq+nDzB5YjBz5m/m+hql4UIs67Er07Dd0zKxa2iRJ69ypQEJ0/M0ZbcfdMgsbfk747v7GghcbXIBP5cc267ZW6TopY9zNwkCSAgybmO0orYcyltZxxXxl3j53wlaE9zcRENczp5UaDIFMunQZQyN5QJimC/u9f6//X13uRkhnTCM7DR58rbAVecNf2ydJSLgnEdYwEb13gSMLQkzCrihHZbk3VLPAP5d//O2W/WtwQj3YBLB4c87RrXxt1gdo+X+aDQKpKEmxI3AKTSjbjaOIQh18nxQ8hivQZfUIgJUuIQmn/Ca1EniGJKaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQeS1ZoJ3k2wUTiC0cWnVta5QX9gq/h+9UUaSXk2kig=;
 b=xePs7nXU/1eupUmHWnNfDIaz4PuTMagBqIPKumHAPXXNZi8kkoff3L303PGAnzVUGOUFFmqwuqt0vViUGgIHqbPH3+QKEfTeNm5l23wc0HhIPMSS7VbT3BqHvJQFWO+J6LAWX2zObsRxl/ncgCDCr619vAddjXsjJ8EDQ97voGdE8lNNs8Q+XE2xZIUztqP+3yruC9P0yp1aH2pGgrQyIPzJkEkhwyhGgZpMnSle6M3w7uc58HCdzFauZ1DpgywGY4eY2SP3TwssSQJyx71BWjYh2apUpBVZDjseymRwZ8kSikVLPFylksn3xQT5tXF8dOLRZIoND6fAIZW6/eViEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <764e7329-166a-4399-9e59-f69feca80137@suse.com>
Date: Tue, 21 Nov 2023 11:18:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <732f722b-fcdd-4a69-9c32-5c306e81c998@suse.com>
 <5fdbf9db5f45272bd25cf1b4b3184357@bugseng.com>
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
In-Reply-To: <5fdbf9db5f45272bd25cf1b4b3184357@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: edd22964-1dcf-4749-b20f-08dbea7b3e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uynKmWSI4Fq1KXlzIHcu9sRtd1ujXbPgyzIldK9AozvCjeywHX77Ym7mpS7Rwhcgoh5lNE3F7ZHzJC+CGksFErBkY3g85h24tI4k5ZTqveHkpvkvrVSDhduR176GW1fmGDn4yDpgyPWgumUJPmtSARPWT1j6Tlcr2zrOrcxaoHOGcwI1NrMlcVmM2IUKaitNw99UROV/39pMFXvWnQEdFrFTVp5yG00df9rstj6LjiUhBOzJz/G9mI9ElJ/PRh+19/xcsEmyXPxm/nORCS5T90rG8D1X17pixQOkMsbzFjFYWAyvLqF8M7BMFy2aw/rB/Yizk5xSl/OD2XYyMF1D8KS8aEFMdoSvIHAVWxs7rO9vFO9/bAT44OW8+o+X/7W5JOfvAsy2Wqjorlv5G1ThqcImmqXSmd8Bafg2fkVNzwHNvZb+boz1ATSE+RpQi8PaCbsturXh+hfOYpNw7kRFOoyoi8k1YqnJ6uWQLs7a5NAoMsIsc3NKA2l8iNId4k6vipDyzSBTFjrgv5QKmc81oycnHiWOXOQAjylakMnmL3g5u0lfW6w02MJHju5n+MK9OGcm58P6QqRy9ErDdMJLQB89k5TxWKHcRg8+NjUNJ0FxB3gLRE7n5/YHWjk8BArVXwHpRY1IyJvuyEzd51e0Ag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(26005)(478600001)(53546011)(6512007)(6666004)(6486002)(6506007)(31686004)(316002)(6916009)(2616005)(66946007)(66556008)(66476007)(54906003)(7416002)(8676002)(8936002)(4326008)(38100700002)(5660300002)(86362001)(2906002)(4001150100001)(41300700001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk1SU3NzQjRHem1Sd0tCTkwxYTBqdGNQTjlEUXVPNXJhY2t6MThPekpjbDA5?=
 =?utf-8?B?VEVKRG9zbGdoQ2VwemZac0I2Z0ZXWUhZVTh6MGtoS1ZwVFJ1TUhaUkg5MnBl?=
 =?utf-8?B?ZGZiNmMvUHRKOWUvdTlXSmJidW03c3c2dGZKQmpEZGZBQkVhS2xOVlFMR1N2?=
 =?utf-8?B?WEZ6eHM1V1lqUThObzZNM3VxNUU0NTJxS1RBeHcycjhxSXZmTERlUFJxdmxi?=
 =?utf-8?B?QVJWV1FCajhYallwS0FLQzlpZ1dnZ1JzNEpsVUZXcWZoZjdkd1lLcldWSVF5?=
 =?utf-8?B?OE1haldsR09GaG9PRzBXRmdEcmIwVTV6UStDeE9haXRVTjkyQ0tMV3Z6ejAy?=
 =?utf-8?B?c3pUQlhNczZsSjNsbDBmcWJldW5VWlZhMnhFS3Z0RFZZbEJMOVp4aG9CczJi?=
 =?utf-8?B?d2RQclNaOTd3cllFdzB3ejlYMG10R3EwV2ZKc3FMZ0NkeG5XakUvSWdYTE1G?=
 =?utf-8?B?cTFkek9GV3pmdzBmVE9zVDExZFBxZ0o5SGIxZkNGWCtYMC96L09XcFhXQVJv?=
 =?utf-8?B?NE9NbG1MeEZ4MGtZdHU5R2dLd1hraEtKTGFXbHRmZldRd0tWNHFRVFQyZ2FL?=
 =?utf-8?B?N0p6R1hKazJoeS9mOUJ2ZWwycm5RdmFDWUZEdDRjU3NIWFBWb0JGQVdvZzVI?=
 =?utf-8?B?czFxYTZvNytFTk5rekVYcC9lbDAvZ2FYSDdBQmRFTGF3Rk92YUtxVmx3MWxn?=
 =?utf-8?B?d1RVQWpiZ1VvOElIbXd6NVozaXlDRTNYZlRINThLTXI0YTA2bFpXeDZnenRK?=
 =?utf-8?B?bFdiTUhiSzlPcWoydzN2UGZZVTI4TzFKZDFDU0pHREo5VHBEZ2JwemhyM0Ey?=
 =?utf-8?B?RDNMNnI3a1NsMEdxSUM3OHcwdnJqdjBBbjhVb0o0UkFPRU42dStxWXR5Z0R6?=
 =?utf-8?B?RVk0dVNORzdmbjM5MTNLUHFsTlg2dGtXemQwQ3VnRHdBN0x6UWFiTVJhbkRH?=
 =?utf-8?B?aFhjaUl0amRKOTVRTFZwVjZ3ZjBOTlFTbkN0U3BxblNEQldBb0ZjQnRucDB1?=
 =?utf-8?B?QW5ZZkFhVWk0d1RkeFVtdkMyK1psQllZOGNsL2lKL0RaMFRwQmN1Zm0ra0tu?=
 =?utf-8?B?Sm5tQkRucEorbXAxK2pLcEpCZTAwNmsxUkRVWFFrTmlXY0s1eW9FOEhoKzZY?=
 =?utf-8?B?ZFlxYkVTc0FMWnF6RjRZM21WVGg4NWRTRTFCWS92S3RhcndTWnZScG5rczd4?=
 =?utf-8?B?OUQzNitIL1FLdUhHSDcvSUhwcTYzTDVISGlrUG5ndWRmZ21ZdlNXV0M4Y3JF?=
 =?utf-8?B?K2NoRmV6K1U3eTVkZXhWeDl4M0wzVXN6c3pNV1p4bzAvSHZ1VHVucktFbTBm?=
 =?utf-8?B?aHArbnlOWG00cjdlSVF1QmlMSThSYkpMcExWUGprT2c3SDg0Ni9rd2xKM0Qy?=
 =?utf-8?B?dG9LQXlVVDVsSGZrT0tIbXhXU0gzYVMvanNzR1ZiUDZMb0FtYllyVnZnUU50?=
 =?utf-8?B?WHhGY0hsZkZPdUE0dGhNa1kyYWxNc3czNnVtbzNydFRiTjQ2NCs1aHU0UDhS?=
 =?utf-8?B?QkRlVkQwbXhGemNOUUwvZS9xdlBkdFhDbFM5T3hQb0R0OVVkcitoYUxQWFVI?=
 =?utf-8?B?UUVZejhScDhYaG94WE9XS25JemRXZEZranA4L0hjOEJyQXUzcmk0QnRBSEc1?=
 =?utf-8?B?R0FObWU4R3VHMFdQZ1FuNGVhcDFoenVYVHBNUTFyWDAzc2M0TXVqd0tqcXFq?=
 =?utf-8?B?ZktvcFdaSFN6QVg4eWs4SitYa1V6SlJtQWFkdFMrZEFPZklWZnIraGpBd05O?=
 =?utf-8?B?cC9xeDNrZytOSERCdTcvZVdMYWMvMHIwcmpuWitTaXExOUtzVXRKcGNLdG1Z?=
 =?utf-8?B?VHVNdUtSVlZUYWFBUHZCNENYN2FINWVWWmN4TTJmYnc0bUFDNWRZeldJQTFE?=
 =?utf-8?B?QmdDNndVa0l5S2djcWFSTk9OdTlvcGg4ZlJDVkhSb2FQdmFIUUdxUTJDaUNs?=
 =?utf-8?B?eDNnWFRpdmRYcUk2M2xtditIak9wb09zb2pGZGxYdzkwaGVHTEg1QkhwcWhW?=
 =?utf-8?B?Nm5lbFY0K1ZsYlF5TTdmOFN0SVM3R0VvSnRpa3dVd3Y2MXZFNmVBVDJ2aXU1?=
 =?utf-8?B?NmtUMDdtZjNVOU9OQmRlVk5ZZ2ZkTkxLcUwwL0VxdUlsbjdmc2lIRktRR3lv?=
 =?utf-8?Q?qU7M8Hh2G41a3hWhk5CVrNkeq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd22964-1dcf-4749-b20f-08dbea7b3e2d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 10:18:45.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ma2jgnoi9mmtNsmMCTmUfjJ/792vyTqgQIe9C1V+op/bXO0m7rJXEYrUI0IKBpUqCf/Rq8v09+aw/6fb8EfZAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9139

On 21.11.2023 10:46, Nicola Vetrini wrote:
> On 2023-11-21 10:16, Jan Beulich wrote:
>> On 16.11.2023 10:08, Nicola Vetrini wrote:
>>> The comment-based justifications for MISRA C:2012 Rule 8.4 are 
>>> replaced
>>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>>>
>>> Add missing 'xen/compiler.h' #include-s where needed.
>>>
>>> The text in docs/misra/deviations.rst and docs/misra/safe.json
>>> is modified to reflect this change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> This patch should be applied after patch 2 of this series.
>>
>> Code changes look okay to me, but I'm afraid I don't understand the 
>> remark
>> above, and hence I fear I might be missing something.
> 
> Since on v2 it was observed that I forgot to state the dependency of 
> this patch on the R8.4 series, I added that comment here (otherwise 
> there would be no definition of asmlinkage).

IOW instead of "this series" you really meant to quote the title of that
other series?

Jan

