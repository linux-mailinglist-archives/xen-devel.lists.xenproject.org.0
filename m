Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6CD7EF1EC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 12:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635076.990807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xC1-0003oG-Ii; Fri, 17 Nov 2023 11:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635076.990807; Fri, 17 Nov 2023 11:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xC1-0003la-Fp; Fri, 17 Nov 2023 11:39:25 +0000
Received: by outflank-mailman (input) for mailman id 635076;
 Fri, 17 Nov 2023 11:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3xBz-0003lS-US
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 11:39:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3dc98c5-853d-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 12:39:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.11; Fri, 17 Nov
 2023 11:39:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.010; Fri, 17 Nov 2023
 11:39:20 +0000
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
X-Inumbo-ID: f3dc98c5-853d-11ee-98dc-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXTJyuf5EQL5L7knLmhhLxi7YNqZO4agApaZ7yY/KuzC1+GCzpLUh+A5hIj8vXzh1kBygxgQuNmlLxx9bbWn4m11FGLqDu7tC1Ef5Z2f9Sd7n7imin6XhkRIGeaFVczghOoo/zOOVDDOeYEROwPlIk4lvq3A1GYyBCuPYQzeD5Mx6zxxV6gtDqLiIDZk7AKZyEmWtYUWaz6/t9la8aA13aN38udSgu3p9zejLkqLKTqUhtOuLRLTrPmJo5DBEOL9VYrbTAO1Wskyph37nZHIfUYcTsuleeMM3215VYPFqSnRm2spQF4oBo0CWj8gdbyjLMS1raPucJINBxzeBpBiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy4UtCTwjIpla34dHFXHMEV+J0x9hnovQCzacCqo3Ug=;
 b=e2qapYBffWKiO28TBdxBllI1ULwuxmq8+nze+BR+6+rqF4oLHdtfUV1HQt+AzUKVOob6d89d7i8KQ6wtlx3uQpyR9Lcb+porzVy57VHG3hYK86eioyxG5ZSxAyIL2y+O3n4ITCEqeM860+nzPdFkmQuYWCw//1FxRgReYH2D93YDzixm4TsPtEwYTou56PZ2ooETfvNbUea426T1/RiqWehoHVBKurSl0PlwhDE711FW03GHMAIYjv/u2MyXXiymF3rSup1bUuYx2rAqqtKhvYTkUvZ+BkarOmrkOfPYP+LJY5BfylSSNEG69n5+FQaiFC5O06O9TjeelRPUeYWetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy4UtCTwjIpla34dHFXHMEV+J0x9hnovQCzacCqo3Ug=;
 b=OHANToCTZ5tN2ilJ7Fp1ZMiQj2TkAlibO20uRJmRI2iF2gy6xlSU1NB9IYdbu+SQbQtorqqbv+lBclQDSIIgi/Jcapdrrfwpp4Ck8RCyoD+99LUIrvHg5/QmcaXSMqqE8ybAnLLNJy0fzUiumjre8BwmVNMdR36bkVvxGJifzICxCv4cunXF44doBRipUet/tnFY/j32FMJU0OPjw3W5rFm0VarQd1NEUWmFJU4cJkuumT/TxVP39hQs4yg3qborRixGDeYYVVE1GoiIgL5L2CDEAAt6zYQnMabWCn2TSX6x/4LnOnov/dvr7IanP0XekffyJp+HeG2Gu0XAW3QPHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <683af6f7-1110-4d5a-9d42-6893398fae84@suse.com>
Date: Fri, 17 Nov 2023 12:39:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Devise macros to encapsulate (x & -x)
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Consulting <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper3 <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Roger Pau <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
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
In-Reply-To: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa0a871-94cd-41c8-46fe-08dbe761d66f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RwDA6mU7SiJEqCWpFDTFEmDPymkBswAiwEl9VDCO7RA67ppVKNgCHFQykuh7+OZaAh+72/V0qt2ayl0S7dZjfXR6kRWmuon+Qr7hJwzEILwdkzHWE0cSQrFU8rgsEGA4Fs79VqYqdu4NtieO1MXxFvYfBKievzQ2Aj5w86xB805lyrEmUxQhP7nSGSksA52/7L/mj6EDkudlM9eAtbBpuFkScTCW+qlGoZ5fk0ToqEihtXLZzFCn2TZsJ43KYhCfPJa+Ao3eU2U612jaC/JgdA0E/XxsPQpDH2toIIBAwq0dmE5BZV0dirZyQ55v3WGAxO8HooyRJC+6EsVRs0SqSfOGKjSUbyPf3noh+GnCPm1/FdUMEptmZDptQvI73G/tF5DvAKbGBwxNIkXP8EuDuQM/68Oe+zwsT38f9FpXu6W65htKtlfIJoUTZJxTQ2JfO9uoFjt/1BJF+XwELJlE/nd4ysur9U2wVSryPeAij2H+v3nHkJQib0PBK4OdGhjAgKFkk1vTBvF+IuCOR2DA5VcGSK8UYqYjzeMrCZMvo5RDd5LHbvpXHw8jNnUSRVPdsRBOzoONalUfSwSTHoVCtG9eTLzpSqmbCViQsdCjdR3mNZ5ubMDhHEVAZVva6hyYhE6d1AVuwxsBaf53G1Spsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(53546011)(6506007)(6512007)(6486002)(36756003)(38100700002)(6666004)(2906002)(26005)(31696002)(31686004)(86362001)(5660300002)(8676002)(8936002)(4326008)(7416002)(2616005)(478600001)(316002)(6916009)(66556008)(54906003)(66476007)(66946007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTl6Nm9KcHl5UWwrckFTeGM3U3NJa09jREtnRE4wVW5hTEVuYUhuYlRRa3B1?=
 =?utf-8?B?OTJPNWc5dmF4RjJTeG5aSE9jTkVRb0pRNEoya1VuMmlqOWJmRDY5eEZKN1NT?=
 =?utf-8?B?UWZvK2plK2R0M09aYlBhVnZabmVJdUxPOTJrbjN1KzM5K0QyaFlEMy9YL2ZG?=
 =?utf-8?B?WlViRWFOR3NSZTFTMjZwYnRYdkJENk5OWUhUMHBRaytWQjZrQnp5TXJZcmFv?=
 =?utf-8?B?dTFaVmVXZ0VIUHRpc2hLemYzbWduU016MFlKOUJkTlY1MjlIb0E0QzFub3JM?=
 =?utf-8?B?SjA1ck1Cc1hhZDdsVmRXNVZWMmFyaHluQnlvcVEwbTlsTmhPQ0tyYzJNUndT?=
 =?utf-8?B?S2JTOFUxUjMzVldBamFLQzVMN1pnRkhhZzlGZUVnMkdha2Q4di9kMm1melBq?=
 =?utf-8?B?cEx1d1FxYjEybUliNXpLTm00YitQKzRNN0M4UmJPN1UzN0xIalhCcDlRYnhi?=
 =?utf-8?B?dzM5WWh1ZXNJSUx3NnVua3gzbDhLR3d1L0tZK0x3dTVuWW4vWjBBanU5cU44?=
 =?utf-8?B?OHcxTFR2elVQbWVDUzFHU1RveE41WTAyeThoNXN3MndXdUZrMlBiRnF4Nisw?=
 =?utf-8?B?VkpSWHdjL01aQzZKazNsZnlDcThDVUNkOEhnOUNCcW5RT2c4bXM2MmptMkxl?=
 =?utf-8?B?eFBCNk1KOXBOcjRoU29EbStxUGMzNTFIWGdpN1dWU1ErTkRnVVRXL2VyQ1NZ?=
 =?utf-8?B?eml3cEo4dVBPaWo4dGl5SldKMWJEenlRYWE2dytQSm1TTUVsbWNZekZCaEZu?=
 =?utf-8?B?aVdmVnZHMXpZdU9CTzNtcVJpUTZ5b1ROc2xEclJObzc5Z2RNVWxTSHVsdk1F?=
 =?utf-8?B?aEdVMi9iNXhTbysxak1rYldVczBQTWhkSUkrL2poQ3NKR3R4T21mRHhUMXJp?=
 =?utf-8?B?RjVFR2JnaDVVS1l6Q20yQllBdGFSdXRwZCtWdE0xMXA3djJMdDJBa01idHMz?=
 =?utf-8?B?djRRdmI5M2FLOG9RZTFMQ3pLYm1lUmZUWHZXcmlsV1J4RVZlTHVTcDZVM3d6?=
 =?utf-8?B?eWt0MVEvSkdZOGdCYlIzNkFSb2Zwdkt4V0t0cStBOFVmY2NsNjhSdEdUdGli?=
 =?utf-8?B?OThIV0J3WXBkVkNBRFhZWjRUTWh3VENrSVNQSDE1ZjVkdkZNcHI4WDFleVNM?=
 =?utf-8?B?OVB1cFVsbzJpdnNXUVZFVXc5dmNTeVJhQzZ3Zi9RZVZCc3NBeWJDKzBaSHVB?=
 =?utf-8?B?OHBGK2kxUDVmWTJMNnJnR21mOVhDSTJmMUFaVmtuUXM1TmNmNWtCWldLeS9C?=
 =?utf-8?B?U3pxTkordnR3QWE2Q2hJTElxeFFEVUhKdnJVSGxrM0U2T1pOVkUrL1YrbHYy?=
 =?utf-8?B?UVl2ampYUmQxaGl0eXJYaXc0MG9RSjYvVW9kQklFellzcjBIRmRiQiszMWk1?=
 =?utf-8?B?VjcwbnY0R1NlUVh2YlpuamR5cFhMcXV1aFZpU1RLWGZ6UmpYSzRpSWJLd3Yx?=
 =?utf-8?B?Mmh1dzhyZTRhd2ZIb3dlU1Izem1iQ3czc0pCQlBlMktzZ2FCTW5IWGl2a1Qx?=
 =?utf-8?B?dk9IaGM0ZHg3ZXNUMXdPaWtzenFBTGZidDBidkRVTVdJdU0rTVE4UVFCcGJu?=
 =?utf-8?B?bG1EZ1lOM21FYTNQOEZZZEM2ZW9WUHJRRWlVK1FJSE1EMlVyVFMrNEU0UGM4?=
 =?utf-8?B?NHk0UzRQNEhzRVRuT3JZMEN0dnFjM3dNQjNBdGdXRGVLRUlMdk5IVXdzQW5P?=
 =?utf-8?B?ZFQxdWttckhjV3dmNEgyMFpsQzlUVEFtUXMyZUpJYUMwVGIrZWRVL0FTOCtZ?=
 =?utf-8?B?aXlDYndvREpKZmpaRUd1OEZDUTBLbUZBUWV1dy9DSllqRDFvRkhLWndGZytt?=
 =?utf-8?B?TkV1SjZsUmg1ZjNoai8yLzc5TE9XWFErWERVZEFRMWxhSVRkOFBwa2VPU2hN?=
 =?utf-8?B?bStqZENicUk3ZmtCbDJHRWFjRjRxaER6T3hBZ0lZMkhUb3NNcU02L2IxQWpo?=
 =?utf-8?B?YTNUQ1NubWRYMVcvNTR3OVJCWVJ2aU02and3U0s0bHc5cHZVWGhvVE5HM2kx?=
 =?utf-8?B?WVlWcUU5MzB1MGRLeTBoN21tenZDZnM1LytLckxBSXk4clgwcGFreWRxWUt2?=
 =?utf-8?B?MkRHQmF5MWVNOWVySFpMMFJiRysrN2lPa2g2U3l0TE1ZQ3MwY1Mrak82Rllk?=
 =?utf-8?Q?fgc0K3xg+8lqxrKccqnbGYFNk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa0a871-94cd-41c8-46fe-08dbe761d66f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 11:39:19.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLO58AsBlb4sT5rx4XEeFauFQH3JQrkRzQzPiiTXBtjmqB8v5ctTZH0azcglbxxU6qvASNSFXbaO2CP9Ne5DbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771

On 17.11.2023 11:17, Nicola Vetrini wrote:
> Hi all,
> 
> As discussed in this thread [1], which is about complying with MISRA C 
> Rule 10.1,
> a macro was introduced to encapsulate a well-known construct:
> 
> /*
>   * Given an unsigned integer argument, expands to a mask where just the 
> least
>   * significant nonzero bit of the argument is set, or 0 if no bits are 
> set.
>   */
> #define ISOLATE_LSB(x) ((x) & -(x))
> 
> This macro has a gained some calls in the subsequent patches in that 
> thread, but concerns were raised around the fact that it would be better 
> to devise a macro that evaluates its argument only once. A proposed 
> solution is this (thanks to Jan Beulich):
> 
> #define ISOLATE_LSB(x) ({ \
>       typeof(x) x_ = (x); \
>       x_ & -x_; \
> })
> 
> However, it can't be used in all call sites that the previous macro 
> would have once that series is committed, as can be seen in [2]. 
> Therefore, while the implementation looks ok,
> a case has been made to have separate macros, of which the latter form 
> is preferred.
> 
> The following points require some thought:
> 
> - where the single evaluation macro should be placed?
>    One proposed location is xen/include/xen/bitops.h

Or next to the existing one in macros.h. I can see pros and cons for either.

> - is the proposed form actually the best, or maybe it could be an inline 
> function?

How would you make such a function type generic?

Jan

