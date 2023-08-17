Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB977F094
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 08:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585136.916152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWWd7-0004Ma-OR; Thu, 17 Aug 2023 06:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585136.916152; Thu, 17 Aug 2023 06:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWWd7-0004K8-Lh; Thu, 17 Aug 2023 06:37:13 +0000
Received: by outflank-mailman (input) for mailman id 585136;
 Thu, 17 Aug 2023 06:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWWd5-0004K2-U9
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 06:37:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e4d4bfb-3cc8-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 08:37:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 06:37:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 06:37:09 +0000
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
X-Inumbo-ID: 7e4d4bfb-3cc8-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vz90i84v+fi3L524iXtP33V5O7ciyf6n7KPCzZDLVJIaTuCGbqIR/JV4+MtMYnH+yFyakMN401g0DwOhNIS4KsgJNZ1zq6h/VvYy1pAvBlz7dLp26fS0h3U1YH4lZ/N9dHuXVVxR9NZJZ5dUn9DVvdNNzWTxNR4s1u2UcQvlAjLx8q7y1rgPlL9D8frTi/B0RR3mUE5eSsJvfbynK7TZ3mMesWRx3k1e+fvDNl7vEDHrchgK9k7zl7CM3eMcStHFXMkF7aGEL2uPEr2mvc7BIQSjYfVljUA7E0n+yf0ffb1grJRiDvYMdTXY6GVnJkvMZXtpRSLeLekdv2kqjCfVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgQ/JnBa+rmrmqj/nxwdwlFzgW+t5lJOR66odM4vAYU=;
 b=W8RAxJUxb8mxrhMeqnmbi/xBQ3Uy0gsfP5M6K04v1zOI/ahH9zxMfQBI5poHyrM5sxfgalnB9BQep0mMkFF+2v6sqeWzKpHixCytE9qneFEvkGtOu/+0p+wwogwXGK7UVuPQqQPVbY0E2r4W+g/86UhrQPZpubNoAAnAsWMTdQhqm/lNTLlB2VH6IRBO3kBxuFfT3vyAJONJXRTX9MILowWzSMfYPr62hFxg8jtJK8IbakX5Y9c7O+f81OOf7qGkkwWK8yc6ZSBadQ+TSZddsmY/zX8Ywo6GwIVYqq2yZ6H/VVtyCHTezW4O8tW+/p94/RhwHVVgXrdzFDgd9DGdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgQ/JnBa+rmrmqj/nxwdwlFzgW+t5lJOR66odM4vAYU=;
 b=HSlP0V0akdTEUs60T2OjGcWohmNYEvjk+l8NY84D9wIk4F5Dv2+7HMK5As8X2uLlgSR/852FLRR/LeMHGImhjkMMEvqg4oocQRRt4OCG8ggcCddJKS8lbvoR0b1+yj+i4S5RuVp2fWzv5oA8XWFGLIIkAd8ehknddtnIAcz0+l2iiGVzJ1SXMZvkqkZI1+iV4/dMh2IfNcBRVcOb1b+/YWjLn/YOMI/uFcH7GqFXn+3BqL1VsJXO/JsBgzrK2vLUOLkLWsv7E6GewmaJH7t1Wq9CcGiHzoufrWkNgcWlfiR488CzcerZJ6FaLfZf+5arMM4vZLiIex6nqwjDM53IeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09f5a9e2-ed6b-eabe-2016-5961285eda26@suse.com>
Date: Thu, 17 Aug 2023 08:37:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
 <6413e634-62a1-b2b3-47d7-6467926db392@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6413e634-62a1-b2b3-47d7-6467926db392@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a5feda-7d53-48bd-bb99-08db9eec61bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N/glKUUJvoP5PtzoPNSFTx7AL2iUA7zXBV5D6zpa/wm7368buwyrlFMRKIfRJppbBFKsci+WXj4spT9hJ/50ILUCGmKqyQlW4P+7ROvq0kAtjrEg92EwUCsePZBQwDHz6dxx50rDXNjaEk2a5hScaS8OpYLuCgqaFhj10Q0LzGV77WgPbd1bNtv0eW1fReaCr/KhOCgqRmJZVRneDUdbjDmDaMi3I8vIk5d2nijiVMIxGgSiya4otW8O1hTRwpNBs9RjSUmCEHOgbn/GIqly3hpAFZ1W9g6bi0ABG1bQfu35BN49yFDedkFbHVPyuRpI3SC85W6/IuRDe0a4QOShazBC3+uCdYjdRCE57iH/OOisK3kgK0y8ALEwzE06VzfqAq5CMuU2gHclq8pmmZDGiYR7L4u9YDnH5S2LEzknnJFZCWU4j/1ZsUTsN4L5lqGccFFIPPfuq6amS38aDRfwu2BiyPpRY083rWnWoe4k8FzC1PdLY60l4N1Lv2rvu3DPTCvej87gVJvF4d2xNIwp1oldcbTdpFcv70/bXLvxuatLLMasmLt3FJIjE3NLepQ+HeEmc/cqptbAF7dUwsCrx5JY4uI5gWe6Q/BW7tQVjPAPzi2zNyw5LCGVQZ4QWH6y7tB3dfT2px9q6LzGu+nv5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39850400004)(136003)(366004)(451199024)(1800799009)(186009)(316002)(54906003)(6916009)(66556008)(66946007)(66476007)(31686004)(5660300002)(41300700001)(38100700002)(4326008)(8936002)(8676002)(26005)(2906002)(4744005)(83380400001)(478600001)(86362001)(53546011)(6512007)(31696002)(36756003)(6506007)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjJtcnQrUXdaOGJqYlJ6cHgzWXRBaTNEU2VtK0U4ZmlwYjZ2U3BiUFp4dnlX?=
 =?utf-8?B?OHUvUDNBNEpuZ1hrU21KQktuQWhCeWFmN0VTNENZeUl3RnFHeFFRYXdWVTVB?=
 =?utf-8?B?ZVZ0Nk01TkJxZU1LQWh5a1M5bjlNWlNnM2pMcGVGeGJhNW9qMTRRbERDdEZB?=
 =?utf-8?B?U1JuRVpBWnRWZ05HclBIRG1uT04wT1FHOU52cjloS0I2eHdtZHBybHhFdUcz?=
 =?utf-8?B?UzRFcWhkNmk2cmVzR0xRYU9vTDY4bDEzUldiMjFSOHlvT2tuZzIvRjJVL0Vn?=
 =?utf-8?B?MlZlQzBjVklKazcyUndvK0ZRbU0wMm04QmlNY1VzM292YTk3MkZFcERwTkdP?=
 =?utf-8?B?c3dZRVYzVktTbytnNnc2cUFBT0laQkYvakc1VFpVNEJxQWZFK2R2UXd5N2RY?=
 =?utf-8?B?K0lKTVMwRFR0YXVSb3JtRUMvSEZRK3hzWXBHbklwaHRRQ1FIajZJa0lsY2Fr?=
 =?utf-8?B?T3pUS0VhMXJCUmRabnJua2g5eFpCWFB2TUNDc1l0UmJjSUwreW16dkZKK0RD?=
 =?utf-8?B?RTVSYnhlb0VGVWhRdFc2TkJSSmx4cDhPd0ttdnRlNzd3UHdqVGVzank5MGli?=
 =?utf-8?B?Q2V3a0lSb3c0eWw3aVM2VFI4bmNRZDQxM1pWZERqRU13bW90SlE3SnNvWVFi?=
 =?utf-8?B?dXlscmFGTm1SSlhZV3czMm1hS2h5emRTdXdLNmFYeFYrL3hkaTk5YklWSGJE?=
 =?utf-8?B?ODlPWk53aEJPWUZxeGM1VVdNQUh0VVNaVHV5MGRSYjRiMWdsbkwxbnpPMHQ5?=
 =?utf-8?B?NTBlUG1SSXd6RlRzU1p1MWgwK3l1M3Z6WUdFVXBQOStQRTZ6VDNrVVluVmxY?=
 =?utf-8?B?ZVo4cjZVWWVyU0YyNzZZU1E2bXZLNVl2YW9aeW94aDlOMnA4Z2VoS0M5c3R2?=
 =?utf-8?B?U09JeGpzZW45L3ExaUwvTEJtTVdGdHJmTy9ZY1dsQmVpSEh0ZWNheEpJZXo3?=
 =?utf-8?B?aU1sdmZGMURHNVhSSVlLNmZNV1pXZVl5a1hlNVE4Sy9ZVm1mNlVpNFErelJm?=
 =?utf-8?B?NWpYdlJlSUtpMFpoazFSTUZYZWxnZEo1aTQ1VDM2RWtoU0orcHplTHNyMlJo?=
 =?utf-8?B?M1J4L3hySm9qS1NvODhmUVlmWk1CRDJCcWdycEp3eHAvZXE5Q2szWUJFY3Mw?=
 =?utf-8?B?bEFKejJQRE80NlRFOEdYTGVMeGwwKy8vYU9pRnZ1NGJwQlVJVjVEcWo4K3p4?=
 =?utf-8?B?dFhSREMzN2JtSnN4aFhEb0oybnlyQkRHVlY5L1hiVVJhL2grSjNXUUZLWjhx?=
 =?utf-8?B?UjJsQW56QVNLV1NJUVMxLzBRaUtJNHExa010OWR2ZnVtMWt4cHIvY0F5Zi96?=
 =?utf-8?B?MVJuSXpPNUtNUG1FM0ljWnVzcUppUDJBV09RdEM1UDdCaWdnTDFCQWVHRkty?=
 =?utf-8?B?c1Iwcjc1TE9EU0hWN05HWVBNRDV4V0Y3R25ZaWo3OWZEdmkvUmNHbFlBaEUx?=
 =?utf-8?B?VjB5aitBSGJ5NFdtZVlQU3Y3TmcvTExxaE9RUTFrbEZKKzdoU00zWExrdHV4?=
 =?utf-8?B?VEtDdWE0Wm1lZHczY2RNaEdvTHllZExxNXl6OG11aGdrYVdZQm4rVWFzRTZB?=
 =?utf-8?B?Z3dZWXBkMm9RQTQ2UWVQYW5sWjN6ZTdlQzFVS0daRTNHRXdKOTJVVHBtaE9I?=
 =?utf-8?B?NnBSbkVRSHE5ZmhDUUxUbE9ZY0YrWUh0UWRYbVdJVE5BbjhVcVBZNWh3dkhP?=
 =?utf-8?B?cFYwTXhwWE1JcllrN3dJcE9GMUVBL0xGVkxMVmJzdy9GSEhFbklhM3AxZTJJ?=
 =?utf-8?B?Y1FkakZ2UlRENTRaaGd4Z1NaTkd0ZnIvWW5TOHV0NVRyZ2FwZXU3TFYyZXJC?=
 =?utf-8?B?WnBpa3RxYmx2S1NEakE3WDVrS3QveHNoNzJETXByaFpLWTgwUURKRVg4QWhS?=
 =?utf-8?B?MHZaVzVOREtLNzJvWENISDBNTTRrdXVjVHhTZnNwSC9YTXFFbTdWOTRaNUsx?=
 =?utf-8?B?TTdYSjUzR3hlT0NMR3AwYXJqQmt1OUJQeEQ1OVBXR2VxeWVoalllR3c4T3JM?=
 =?utf-8?B?bEZYWkNUYkdTNXJ5TWN3aHFrNWE4WjVRRTV0eWNVYmhySHZ4WmpwMGdpenBt?=
 =?utf-8?B?OU1TS25mT3ViTkpzWDRUTVdVeU5TMzhDMEYzYzNYTU1CM2MrVnhKSzRtNXNG?=
 =?utf-8?Q?3L4i1Z1fXP6JcM7hDk6L9oZbB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a5feda-7d53-48bd-bb99-08db9eec61bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 06:37:09.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6cdaOsWCGIJVDwCFSULmhnJF14FmixOgp6eeuakUcHbPu/AZA3YUMaZNAK1INrM3quzDeVkpeVcYvkCwz2bcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8695

On 16.08.2023 18:40, Andrew Cooper wrote:
> On 16/08/2023 10:51 am, Jan Beulich wrote:
>> Old gcc won't cope with initializers involving unnamed struct/union
>> fields.
>>
>> Fixes: 3e033172b025 ("x86/iommu: pass full IO-APIC RTE for remapping table update")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although

Thanks.

>> --- a/xen/drivers/passthrough/vtd/intremap.c
>> +++ b/xen/drivers/passthrough/vtd/intremap.c
>> @@ -432,8 +432,7 @@ unsigned int cf_check io_apic_read_remap
>>  void cf_check io_apic_write_remap_rte(
>>      unsigned int apic, unsigned int pin, uint64_t rte)
>>  {
>> -    struct IO_xAPIC_route_entry new_rte = { .raw = rte };
>> -    struct IO_xAPIC_route_entry old_rte = { };
>> +    struct IO_xAPIC_route_entry old_rte = { }, new_rte;
> 
> Any chance we can make this = {} while at it?

Sure, no problem at all. To be honest it's not really clear to me whether
we prefer either form, and if so which one.

Jan

