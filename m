Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB9431206
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211793.369450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNpX-0000zb-Pw; Mon, 18 Oct 2021 08:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211793.369450; Mon, 18 Oct 2021 08:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNpX-0000x1-Md; Mon, 18 Oct 2021 08:17:11 +0000
Received: by outflank-mailman (input) for mailman id 211793;
 Mon, 18 Oct 2021 08:17:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcNpW-0000wv-Ln
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:17:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c99a34cc-2feb-11ec-82ce-12813bfff9fa;
 Mon, 18 Oct 2021 08:17:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-vjAU4yskPVCO_q7GuvVcjQ-1; Mon, 18 Oct 2021 10:17:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 08:17:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:17:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0011.eurprd08.prod.outlook.com (2603:10a6:20b:b2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 08:17:05 +0000
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
X-Inumbo-ID: c99a34cc-2feb-11ec-82ce-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634545028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TT1Yg1Ui+3ajrltfvs1+MwffPu6AfveDBZrEEbldyUM=;
	b=XF85mcxQIDIsN51AULxMpGZmoQPWqsfefxSFz4Kz99mzw4EalHK1Q3bzpS/S0MOj0BEQyi
	4Aj7nFUamSQc+VJEcQVI0HTA3yUEa2Zh1V9ZgffdVQwLASRV6ugxRmioJ81ochMz6XMLzK
	i+z3CUCslvVbr2MeVeQBjXjcOuOLDUI=
X-MC-Unique: vjAU4yskPVCO_q7GuvVcjQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZCFdm5O798SMAaU8F8someSy4WdcVhiFXiquR1n4WL2edhSwJvC6baenV8L3EyLL7mPZ4uZsXAQZl24Iq5ffwB7tGQTerjMgJJ2IuOhTMNfK6zO4ofvAwFhceiD17Pn5klPjKhxUdXxEV3aIFg6detyRKm3nRFuj1VmS0lsnp4Fr6rjNdtpa9chHnN6zy2+BPRsJpvJlpFlR7NP3Mvxd0eM9UUqLTwKsic4jgrDyjxqCWj5g94xVPID0ff6GEMZXRVORU3xBFREn9V3JyxcnXicR+imFzweyx15NGWIe0HNkM702/FG/D7fmLl4t7UoEPWpwwnwbDC9OKwqKqwgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TT1Yg1Ui+3ajrltfvs1+MwffPu6AfveDBZrEEbldyUM=;
 b=cwC2RVbojiXzr/pmtvoWPBfzPBsrB92ewxK4lqnkCOoI813eIatTbnu6eYLGo/svLY99JYAU+GcBWtUKD4NfkAj4Ixj5ICbYxF2qHyleM/OEHgufLsKqjlv8+te0hqrfETFVldWFuwQt89hkNeUKGtN47+DjLOiQX15ngiKNLME2YpV9T4WpxdoDNvLcohiIvN4JQWBdpkDe2xFBEV5BejYY4NTWBN7InFXToPPLxJCUzvWb1/DO9xIzkDJ9gAUCVNoXNzB6IWv9VoSim5QpfyrXwtUpop7DAm4qrkOpWAxhTLibFzN9xLZEbr49vFDdeOVYvdLcckY9ZC8LAmTsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH] x86/PV: address odd UB in I/O emulation
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Cc: Rroach <2284696125@qq.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b9bbc584-db3c-0b03-0314-3dd907f645bc@suse.com>
Message-ID: <bea4ef0f-fe6d-a4f3-4929-4fc22c67c817@suse.com>
Date: Mon, 18 Oct 2021 10:17:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b9bbc584-db3c-0b03-0314-3dd907f645bc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0011.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db98a3a5-3676-40b6-7cbf-08d9920fac23
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2703FE13F8161E0344D0EB3BB3BC9@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tww85VxnFXBv5Hs7zapohbznhOl6XdIJYKG4ERH2ll1PjHlatlDj47EiMdeGrZTD8iLqsRZAIkxjr4/B0sP1hI4l9hMIAfjoZoTAf0Lr6FiS2aPtmEm3+0zz7qjohq5R/Y7dzQMvAEU9hsiC50huGNZXqO1KKRAVouFr0Ob7XjV0Be4ljaoVOJWQbEAEpHpW22WjDrCt91HsOQQPS6FJvPcdTo5yOvxHASmjqikZCEBKSqbf8x3fyudcdCjXB/Mkrw/aWwaEXGkjuw8dH7AjKfR1NXraS45fZdm7LelQHXAXpbZ1jeb6oYsblMsXOOByvCR78fiwucepRw2stLYPlMbq/9lCFP4sez988klYT/NrKxU6FeY/JzUesiZiWHroPi/5iFV8HqHUOxBOHYb4sgmxeycwl573vfayqZVmNnO4owXhhI5IqJ5da6D5f7Fo1oEYdNLRYEIG2bjsdDJQrSDYg+f4KKuqztpf5+JDDgygnW/NBHnnGcMsLmTao/S6ircKa+QdVLqLPMHWSqLj3n/XoiLvvEIBtRixopJgU7Baa57tP4OwEavwlyhl+mRmRa3w9zuoZNFFJ7lX51qum90L1U3K/7lz5btWMD/39JSzyhu2eCml2zH4UdlblcMndiZ4herLqGH4w+nYw2mn0VrZPfdA4o24Uso+xM6DPTykFsB5qTa+uvC0mDQCZN5ST9+/p2cYnxtYthMzWy9pKE8SivrD4QvcZP11NeV3jKGeL5wvSGEPDyyM8jcMG4Ee
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(2616005)(2906002)(508600001)(66556008)(4326008)(83380400001)(956004)(66476007)(53546011)(66946007)(31686004)(54906003)(16576012)(38100700002)(316002)(6486002)(8676002)(86362001)(31696002)(36756003)(110136005)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3NXWDFUcC9RM3ZVckVoeTFrQVJQc1pRd0dZVGFBWnFLWDA4czdvNUQ1WldJ?=
 =?utf-8?B?OFRMU3I1Ui9saHZDb1JPc2tZczVDZHduMFR4RFRpM0lIZnlxOTV6c2htRlJx?=
 =?utf-8?B?Q09qVVFnTm81blJNMFNDL3pyZXNHZWJ6N2JsQmZyMDY2cEI4eU1IekVxejda?=
 =?utf-8?B?a2g5cDBGNXVYd2NPblJkaXlIVGtBWTNDV3ZtWm5adjFWNWRGWk5SZ0xNTG9l?=
 =?utf-8?B?Nm56TUdlMDlIYnN4SFVEVnh0MVVYK2tCTVkwMlZwcFdpc05VMTNsQi9hcUhl?=
 =?utf-8?B?d0xsTFAzNUhEaGt0QjZoclNwRVZOQkRIVzRCbmttMGhlais5SVkyVlVQK0I2?=
 =?utf-8?B?TEFUMjVZVWlsNVA3MjVtOHR4eTE3YzFSbTQ2WmZEaWtoQkFQY3RpczMrQXBY?=
 =?utf-8?B?MmRSbW9SZHRmNXZDRFp4ZjlKNXk1ODFRMStjdm04Q0J0em44VTlCMFpqbUh5?=
 =?utf-8?B?dFQ5clhET200U210UEhvUHBPTTQ4ZG1ZYmRXRE50RWZkL1VhMlZ6azN5NXlG?=
 =?utf-8?B?djd6T1dsS0NMNnRCOXNBWm1YRGwyODB6eDExQnFpbkFxS3FyU1lNOWRTenBG?=
 =?utf-8?B?TEgwR0JkT3hkNlZaNndTREJNQTQvMFFZcU8yazRBTlBvRWFIYy9wOEFJenVH?=
 =?utf-8?B?SUhvQVVhZXQ0YmkwelJjbDBaNmQwUFhwNkEvYjdQQStKWkV5V1hxWGFmdlJO?=
 =?utf-8?B?c0xQMmN1b3JpQVpKL0NsRjJoZ012R2hkOUFBVUJ2dU1OY2xzck1ZOWdNSUJM?=
 =?utf-8?B?YmdWL3EzRVJLYTduSjJUTk9rWFo5T3FlL0xnWksxcVI4OHgxZ1lJeXdOV3Qr?=
 =?utf-8?B?Tm5sMi9CbjVCV1VSejE0YVAwNG9DbWtZODBtNUxtSVVJKzBSUVY5blVneml5?=
 =?utf-8?B?bW5IWmZlR3lCRFVyOHA3VnhZeFRDM3hORXhGbE9rUW55SUlrQWVKWEtEU2pS?=
 =?utf-8?B?RENTeWNOL2ZoSUNobktudDlxTFRZUmxhcjd6bkVlL2JjOWUxb3JBQkxYZHBl?=
 =?utf-8?B?V0xhL3VERlhvUkhrbTVIM0xLM2JtOG40eEJsZWlRY21oYndLWGVWRSsrK0NL?=
 =?utf-8?B?bGFqdDcxb2FsZzk3YVR2V05uS3hYSXdGdlh2dCsrcUdhUEJxb05qaWNQazU1?=
 =?utf-8?B?TThYSHpqL0lQQTFMR1hEU0hENzdKQnZXcTE2SitDWmwyZXhnL2hlQ2xNbDBE?=
 =?utf-8?B?V1RReHlRSWVnNHh1YndNeCtDWkoxVUN0ZS8vM05OWUdXYzRQb2thOVo0c1VX?=
 =?utf-8?B?Ry9GZXU5Z1BLNFppZi9Ca2JoM2pTVC9yTk9SWmR1YWdyU1pWUUFScjhsc2oy?=
 =?utf-8?B?Q0l1Wk9pQlQrZHNGd2JWcHZKUzVwbzZwVGJ3ZTdadjA3Z3JZZkR2VGZiVFJp?=
 =?utf-8?B?TTRCOGlWSVlKSE5pLzhISjNxem1PcmtyWEdSTGNiN2ZkRFlqNHYvUys1WGpM?=
 =?utf-8?B?Mnl0NlpEN2pLV2RGU2sxeE9ZVDF2TVNLNElOUU5MNEJhbG92UmtSRjQyN3Jl?=
 =?utf-8?B?bXUzdVdYcHlKdlBLdlI1OWgxbEdiOWVNT2pMb2NIZU4xc2VkRE9PamRCWlkx?=
 =?utf-8?B?Q3RlNldBQ0Fadkg2TkpEZEZLRHJtTll2Qml6bzE4Q1NXazFJTmdXQklHR0hs?=
 =?utf-8?B?ajJLZk9CMkxLY2pGVVovTCttczlsUEo1MFNKNlgxMmFaZzVoS09hNWJ4OU93?=
 =?utf-8?B?OVNMSFBIZVhIcDg4Uzk0WHZEajQrRFJaL0x2NFN6MVF3UXgxdTgrUmlLbUR4?=
 =?utf-8?Q?mSQ9Tt5ndoKcbIVtOin1juVxHVePXXJ1epWv2y6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db98a3a5-3676-40b6-7cbf-08d9920fac23
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:17:06.3635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4ck3dna+Rs8hCdjVRs8LcUaJJh30cLk1xebdixcEbWtr4bv7XiyBYo3PFs7usLtyRf8TP4SNbrijW8x6SVoHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 08.07.2021 09:21, Jan Beulich wrote:
> Compilers are certainly right in detecting UB here, given that fully
> parenthesized (to express precedence) the original offending expression
> was (((stub_va + p) - ctxt->io_emul_stub) + 5), which in fact exhibits
> two overflows in pointer calculations. We really want to calculate
> (p - ctxt->io_emul_stub) first, which is guaranteed to not overflow.
> 
> The issue was observed with clang 9 on 4.13.
> 
> The oddities are
> - the issue was detected on APPEND_CALL(save_guest_gprs), despite the
>   earlier similar APPEND_CALL(load_guest_gprs),
> - merely casting the original offending expression to long was reported
>   to also help.
> 
> While at it also avoid converting guaranteed (with our current address
> space layout) negative values to unsigned long (which has implementation
> defined behavior): Have stub_va be of pointer type. And since it's on an
> immediately adjacent line, also constify this_stubs.
> 
> Fixes: d89e5e65f305 ("x86/ioemul: Rewrite stub generation to be shadow stack compatible")
> Reported-by: Franklin Shen <2284696125@qq.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm not going to insist on the part avoiding implementation defined
> behavior here. If I am to drop that, it is less clear whether
> constifying this_stubs would then still be warranted.

While I did respond to all review comments by Andrew, this has not
lead to forward progress here.

Jan

> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -89,8 +89,8 @@ static io_emul_stub_t *io_emul_stub_setu
>          0xc3,       /* ret       */
>      };
>  
> -    struct stubs *this_stubs = &this_cpu(stubs);
> -    unsigned long stub_va = this_stubs->addr + STUB_BUF_SIZE / 2;
> +    const struct stubs *this_stubs = &this_cpu(stubs);
> +    const void *stub_va = (void *)this_stubs->addr + STUB_BUF_SIZE / 2;
>      unsigned int quirk_bytes = 0;
>      char *p;
>  
> @@ -98,7 +98,7 @@ static io_emul_stub_t *io_emul_stub_setu
>  #define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p += sizeof(b); })
>  #define APPEND_CALL(f)                                                  \
>      ({                                                                  \
> -        long disp = (long)(f) - (stub_va + p - ctxt->io_emul_stub + 5); \
> +        long disp = (void *)(f) - (stub_va + (p - ctxt->io_emul_stub) + 5); \
>          BUG_ON((int32_t)disp != disp);                                  \
>          *p++ = 0xe8;                                                    \
>          *(int32_t *)p = disp; p += 4;                                   \
> @@ -106,7 +106,7 @@ static io_emul_stub_t *io_emul_stub_setu
>  
>      if ( !ctxt->io_emul_stub )
>          ctxt->io_emul_stub =
> -            map_domain_page(_mfn(this_stubs->mfn)) + (stub_va & ~PAGE_MASK);
> +            map_domain_page(_mfn(this_stubs->mfn)) + PAGE_OFFSET(stub_va);
>  
>      p = ctxt->io_emul_stub;
>  
> @@ -141,7 +141,7 @@ static io_emul_stub_t *io_emul_stub_setu
>      block_speculation(); /* SCSB */
>  
>      /* Handy function-typed pointer to the stub. */
> -    return (void *)stub_va;
> +    return stub_va;
>  
>  #undef APPEND_CALL
>  #undef APPEND_BUFF
> 
> 


