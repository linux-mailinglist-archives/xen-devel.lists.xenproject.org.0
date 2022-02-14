Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C624B542C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272402.467229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcwf-0002hE-Ib; Mon, 14 Feb 2022 15:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272402.467229; Mon, 14 Feb 2022 15:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcwf-0002fP-Dp; Mon, 14 Feb 2022 15:07:17 +0000
Received: by outflank-mailman (input) for mailman id 272402;
 Mon, 14 Feb 2022 15:07:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJcwd-0002fJ-OC
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:07:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cac7cc50-8da7-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 16:07:14 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-GreIISL0OCKkiCRpqOyasg-1; Mon, 14 Feb 2022 16:07:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB6042.eurprd04.prod.outlook.com (2603:10a6:10:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 15:07:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 15:07:11 +0000
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
X-Inumbo-ID: cac7cc50-8da7-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644851234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pzk0tjXrAVW6CIJLvTgm+wl5lvjKLf+2s1odUlMiRco=;
	b=DwKqu1M12CI9AK/ZhBuwNbIcthtJGzeYiW8YoCS0hetXPzRiDMufRPlqC0j7/iQYImc0on
	l9e3wggpyWcCr4t4O2AAFy3jUGAqaE8Tn4W9EbPqq64cQBrbd2lNy0kTSDdZgonhsn5wTt
	GFYRNk5qgs9Sddka6VpUPxw1AHbbKC8=
X-MC-Unique: GreIISL0OCKkiCRpqOyasg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLcOncue5CbWmESgicSnWAtTv2M7TzBMANERfAMWdreYavzXkkXMn36MIYZ7k4ff6vjRnrlXu0jHUliHk1Tb5/GTRNtelildo1KGx0/Pike22pzAOGxaXdGjDGYHSvo/wjc1IphrWDNNzNBhOJIMP20IcqXmynqczkSYlkciZ8u82Gn7GTEtsuZT1iuPrVNMrnU8JQItwYWSk5E+cfna95zS6OPt6hrItIN5+GEs6VfS6ZJ7Mj6MtSApio01JpUxbOEAbkLWrWzyKrm7m6f5h/xXyrT3GPt7cjQcKj+/9GfKnVA/9O4iKM2Qb5tdIVN7zW0zh84CK4pIpLmMOHImkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pzk0tjXrAVW6CIJLvTgm+wl5lvjKLf+2s1odUlMiRco=;
 b=fkFb8lMGqNNBo6LdoXdQ6BiL/AKKQGE3giUnukEyHCSGIrNDUUSJQl1U/Hsu8/WqFNWBQeMgSmNeqyqrFGVcqakawu6SlafitUhQpDvW1J7G9UyRSL9py5i9OBPPzWoGdBm6LWrJMTTyaRqigqK2xDe3KHbKTSneCiWRoxnXxzrBXwsKtHSWCe45CoyrlaSQYcT6eEXIdfCXrB8enG21FqVjB/+hgK+PJxGWqFWwbHI20bqwVutDxhz4gY5PPrw+C+wIwNi7Jhds+VqUcluqvltxnUmwXuRH+qIyaDOhdBj60Wn6vXlpOcTT7qBbAMQ7jTdG6bEHIFsQ4ZU6jFzj0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e7f3193-dee6-1ff4-0c68-081032e240d2@suse.com>
Date: Mon, 14 Feb 2022 16:07:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on
 top of SPEC_CTRL
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220201164651.6369-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0244.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fd5d33f-2d09-490a-2593-08d9efcbad25
X-MS-TrafficTypeDiagnostic: DBBPR04MB6042:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB604203D3D7C3FCBEA34C5594B3339@DBBPR04MB6042.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fXI5wgQQHHxkOIx5ZlM7zJn3ucj68XrgBhJbhaoEXyoXil9XUUQzsb6amBS9NYiPuIv04cWWUh+eyDd3Fflm9Z89gubtcCEPPOLcRUM7WmkOByf44bTmHOkgdfQ7TQ5Yzl0M0xhF605bssCgkbwEa8vKCjDd7oSi0SvwOEWE/gpCM3I6hJDIl0xjuhvfl5STwnx7IUfExcMmOvYim9Yr/87d9RmBvjjlj+hdQjof9OuR87iidshFIY1U1t51kxFvoOf5z8p90MyrYUT++7Yu1JBmiG1UR9novQwnSAlSWXUvFcedfJul9fFx4JSjYdiyKRrYh/vK9iOVHT0roMPTmE1F+uHxC+dblBQE0eeh/aZjJI5zMSQ3Y/jEQc66WB6PImPeygOhtCgRYVsb5+4bWrBSIwlAntdxaQpyrSo8qwA3ObduIbnXIOi6fR3u6o9fzFwxuEw4lB7643nB6rBOHwYbJh5P5rAZ0Rz1+QiuPIsndLcCh99fRZydQXy+UT6gfBrPkVRkGhhwRR0BgJyn3fDN7hWveiIz5nTfMsMgKcMqJjla3wNCcUTZEuQOrKfkev9q2VOnoEwVLzTk3eiHrOaJ4xqdpo+Fp5WxDEFirwgfYvcmaQXGNH1X84q+TioUgcuKHHMjrWnRC3jDsz2MCJImr96TXoOsLi58VknBLVYIrhaaPY3yGo2UACMKc37F1HhGlEfWr1kvPWl34cqGrp/kWY3r4ccvaQZVpMz7ni4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(5660300002)(38100700002)(6506007)(6916009)(54906003)(316002)(36756003)(31686004)(6486002)(8676002)(66556008)(2616005)(8936002)(4326008)(31696002)(6512007)(508600001)(66946007)(186003)(26005)(2906002)(66476007)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JNaUYvYlJEOGI2MGovVkZXb2tZMER6ckFHSFlra0s4dnF1N29yZllpRk9L?=
 =?utf-8?B?YkQxYWx3N2svVG9LS0V3OG4reDZsM0VrbEZvaVlmS1VlTGJUQzRmeGFHSEJ2?=
 =?utf-8?B?QnR0cWFrNFg0aTl3R29IaHMvdkFuSnVYWWVLSE9PSmp3bFlrWmk0SHE3QkJI?=
 =?utf-8?B?czZQN0k1QzhEK21ZcWdTQWEwRzh4Um9qWmUwUWR1OXNaZmpndWlZS2JwQVRU?=
 =?utf-8?B?TXNXMGxwVGFyV1NUTTRNMVVaRXZmdHU4dWxsUWY5YXNIZWlnZUE4Yy9NZ3hL?=
 =?utf-8?B?RWtTWTU1SmtISlhtaG0zV0ZpV0dLbG51WG5TSXhDUytxeWFacG0zNndiTHpI?=
 =?utf-8?B?MVJWTk1iTTUyREF1YVdkVHE5b0ErTTFhUEdmRit4eGx2aVM4MER4cVZDZE14?=
 =?utf-8?B?cEVNTEZYdmtRcFlxMFJ1azBYNVZPTDFnMXM5REZrakFjNVh3a1NJQzlDcEc2?=
 =?utf-8?B?TjdXa3diRDMvMjJzNTJtRGJQeis2bEVaeFBYWnJIRWN5c2FFbnk1UHBIeWpz?=
 =?utf-8?B?Qy9EUW5IckpvNlJyZDZtUHJkaGFzSmQ0NWF2T096cGg3bVZreC9Ha1hyUytC?=
 =?utf-8?B?dS9qekxoRWtCcVR2SmxrZzdhS2l0QVFvT0JmOERpNDV3VndHajh1bVdBeCt4?=
 =?utf-8?B?dS91UWdoOVh4TkxqWVREdlNBYlYxc0VPVUp1OFlIWkMyTDd6U3djLzhEZWps?=
 =?utf-8?B?QnlrOGRxR0MreVBBSFJURzRZRDFXd3E0SmIvbmNsMEM5cmwxdTNadGRVcTMx?=
 =?utf-8?B?K2o4c1EzQlptK1c5RnQveUpwT2Y5NU41M0RDclRsQ3V2OWkxVzEzdzhkTHd0?=
 =?utf-8?B?S1lWNWdzVENkV0t2ZFdBMmlCTGRaMEJpb2pkYWNqV3ZZQUQySzJJL1ovajU2?=
 =?utf-8?B?MG4ycDZOZ1BTbGRSR0tpRkdaRmQ3MGhBVUZMbjZYMTNQVWZLajd6NGdQQU9I?=
 =?utf-8?B?VEZ4eEVsT0VPZ1JYc0ZCMGRoQnBUblJaMFFZdHRXSG5qdXFrS0s2bkt6akFs?=
 =?utf-8?B?RGp5Ky92bVRYeFBuR3AxaEVrNnl1K3RnUE5VdlpoWGRKWFB4dlVBMGtrc3VY?=
 =?utf-8?B?TWdwci83Q1pibWN0RUZjcHh1alV3Uk5XU0hjU2FVUXBBT3JaVG1jQVAxUXNw?=
 =?utf-8?B?bVJWanQ2ZFlzaE1sRDFhN004aGt5ZWpVSmtFd2xheUJBNVhicDVRcUFBMnBY?=
 =?utf-8?B?aGxKSEh6dEdmUDVqenJvZElVcGdIYVR2TWNaNlZpQVViRW9VbEd1aitpK2F1?=
 =?utf-8?B?c003b2ppM3E1VGxKd1BybzF5cDdoN1Nvd0xkSERoV2NTeWxhamNlMGdPUFVU?=
 =?utf-8?B?aHRHSVRjOWNNS01MaVVsUFB3RUR4RkpxUFJWMVQ4UFJSUkM5U3A3WElRaFJo?=
 =?utf-8?B?NzBQVm1ZUlYyQi9zenlqSGVoNDVqeGRnVldTZWVZR3Z0cVZES0E3cTA0Y0hN?=
 =?utf-8?B?cmdPWXFWejhDTElnTkF1bm5lc3FrVVRnekdBaUsyNEFPTkdaWHo1TXplaWtr?=
 =?utf-8?B?bi9WZjFKcE00ekVKQklZZUlvOTZoSWJVa1dWZVB4SExBYngrbTVkUGp3UXU5?=
 =?utf-8?B?bEx6TUVOMmpoL3RNRW1sUVR3WnFucmpuZlhuQ1NKd0hYWStJSDhDQ0diWElD?=
 =?utf-8?B?NWZFTG04Wmg0QklCcE5pQTlIL0xQV2xiWVpjdVVGdWQ4R0NIN2NQUEdLZnV2?=
 =?utf-8?B?Yi82Uk8xQTBZRE53TnY4UE1KV28zSy9pY3pEWDArL0YxMFVaZDRqSDVoQmRY?=
 =?utf-8?B?cmVtNE9rK1NKMVlzZU9Cc3dJU3lvR3NGVXJoN3piNENXQkZlZ3lzeDZkRHAz?=
 =?utf-8?B?UmhMU0xraEhKZFljVXl3MmxQWFRERVQ3d3J4bHlhWUdzTHMxT2ZLSEs5NXg1?=
 =?utf-8?B?N0FyRVdtNXFMS3ZaTW9DaFNoSGhnQ2RsRzdrN2FBVkduVGJ5Z0E3Qi9yZnpH?=
 =?utf-8?B?TzQ0NDN6dllscGhvMzY2ZGg5U283aVFhK3VSM3ZVUXFnU0dSTUtrbEFjb3lP?=
 =?utf-8?B?Mm8rKzJsV0JsVE1FT0FudnZsOVNrYkFXL1lCcVA2SG52eWdzQytsUWdwNjl0?=
 =?utf-8?B?ZVFXZFduaFpxL2p6RFZnV2hiMWF0VTFha3pxUnJyNjdsckZneUw2TFhMdkxW?=
 =?utf-8?B?bHBmdzBtcElUL1AwRndXbk13V1JjTThGRDdrQkhickNybjEvVGMrVjdJWE1r?=
 =?utf-8?Q?/p152F+otJ4r0LT86ZFdyVQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd5d33f-2d09-490a-2593-08d9efcbad25
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:07:11.3646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSMsEROMOly1nPImCCbwTRd5DwTqyDKNUh/bNbAnleDcUicRlmdtBQoEYwaYpPjOPUq56MzI6+rAVouLbdGiMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6042

On 01.02.2022 17:46, Roger Pau Monne wrote:
> Use the logic to set shadow SPEC_CTRL values in order to implement
> support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
> guests. This includes using the spec_ctrl vCPU MSR variable to store
> the guest set value of VIRT_SPEC_CTRL.SSBD.

This leverages the guest running on the OR of host and guest values,
aiui. If so, this could do with spelling out.

> Note that VIRT_SSBD is only set in the HVM max CPUID policy, as the
> default should be to expose SPEC_CTRL only and support VIRT_SPEC_CTRL
> for migration compatibility.

I'm afraid I don't understand this last statement: How would this be
about migration compatibility? No guest so far can use VIRT_SPEC_CTRL,
and a future guest using it is unlikely to be able to cope with the
MSR "disappearing" during migration.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2273,8 +2273,9 @@ to use.
>  * `pv=` and `hvm=` offer control over all suboptions for PV and HVM guests
>    respectively.
>  * `msr-sc=` offers control over Xen's support for manipulating `MSR_SPEC_CTRL`
> -  on entry and exit.  These blocks are necessary to virtualise support for
> -  guests and if disabled, guests will be unable to use IBRS/STIBP/SSBD/etc.
> +  and/or `MSR_VIRT_SPEC_CTRL` on entry and exit.  These blocks are necessary to

Why would Xen be manipulating an MSR it only brings into existence for its
guests?

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -543,6 +543,13 @@ static void __init calculate_hvm_max_policy(void)
>          __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
>          __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
>      }
> +    else
> +        /*
> +         * If SPEC_CTRL is available VIRT_SPEC_CTRL can also be implemented as
> +         * it's a subset of the controls exposed in SPEC_CTRL (SSBD only).
> +         * Expose in the max policy for compatibility migration.
> +         */
> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);

This means even Intel guests can use the feature then? I thought it was
meanwhile deemed bad to offer such cross-vendor features?

Additionally, is SPEC_CTRL (i.e. IBRS) availability enough? Don't you
need AMD_SSBD as a prereq (which may want expressing in gen-cpuid.py)?

> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -291,6 +291,7 @@ struct vcpu_msrs
>  {
>      /*
>       * 0x00000048 - MSR_SPEC_CTRL
> +     * 0xc001011f - MSR_VIRT_SPEC_CTRL
>       *
>       * For PV guests, this holds the guest kernel value.  It is accessed on
>       * every entry/exit path.
> @@ -301,7 +302,10 @@ struct vcpu_msrs
>       * For SVM, the guest value lives in the VMCB, and hardware saves/restores
>       * the host value automatically.  However, guests run with the OR of the
>       * host and guest value, which allows Xen to set protections behind the
> -     * guest's back.
> +     * guest's back.  Use such functionality in order to implement support for
> +     * VIRT_SPEC_CTRL as a shadow value of SPEC_CTRL and thus store the value
> +     * of VIRT_SPEC_CTRL in this field, taking advantage of both MSRs having
> +     * compatible layouts.

I guess "shadow value" means more like an alternative value, but
(see above) this is about setting for now just one bit behind the
guest's back.

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -395,12 +395,13 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>       * mitigation support for guests.
>       */
>  #ifdef CONFIG_HVM
> -    printk("  Support for HVM VMs:%s%s%s%s%s\n",
> +    printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
>             (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
>              boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
>              boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
>              opt_eager_fpu)                           ? ""               : " None",
>             boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
> +           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
>             boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
>             boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");

The output getting longish, can the two SC_MSR_HVM dependent items
perhaps be folded, e.g. by making it "MSR_{,VIRT_}SPEC_CTRL"?

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
>  XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
>  XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
>  XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
> -XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
> +XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!s MSR_VIRT_SPEC_CTRL.SSBD */

What is the ! intended to cover here? From guest perspective the
MSR acts entirely normally afaict.

Jan


