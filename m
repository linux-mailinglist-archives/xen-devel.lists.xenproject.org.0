Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC896A182B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 09:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500830.772346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTgR-0000WT-NH; Fri, 24 Feb 2023 08:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500830.772346; Fri, 24 Feb 2023 08:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTgR-0000UY-JJ; Fri, 24 Feb 2023 08:44:03 +0000
Received: by outflank-mailman (input) for mailman id 500830;
 Fri, 24 Feb 2023 08:44:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zq+K=6U=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pVTgP-0000US-JD
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 08:44:01 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 610ee3a5-b41f-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 09:43:59 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id l1so12825810wry.10
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 00:43:58 -0800 (PST)
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
X-Inumbo-ID: 610ee3a5-b41f-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2EgoVdi6H/nhOUeWbxCOetGZj3TT2b1P2f2aTsnhBqg=;
        b=KrKh5G88XuV2tVEz37woXRMrQ7wk0TasR59eHR0OTD1fi3BkAgpFfGyziCNR4h7EnG
         xJamV9eqPZOxGHEJ0Ovu++HkDunEPLQH8dciO8KnqxEnQImM/5pl0088JCx1lqEVHMtU
         iBmcFUKnK3tHQ1F4fXQswwrVSG9nOKo+/ilIEg1xOo+q1Hf8wmvR8N0yTRuAR1kJbN1x
         1fF/GMhBOA7Hld9qnzWbLvIFhNKpcq2xIA4O/PY58XlI6rlk8IQUu2aw/Ws8Fx4TOd5E
         t8pLXb5BcUu94zs9Z54c9MHhfyHHn9A/vNAYFdTEF4IjEFaBQxZ25InAcBUX8Po9oghu
         zafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EgoVdi6H/nhOUeWbxCOetGZj3TT2b1P2f2aTsnhBqg=;
        b=1gnq1hlqT0GTV5a++nfTwWvOqHfVn+14LCwK5BCQy/RWHaxwC6ONy9VCkXBGafByip
         2pgfer4Rj4zL2Mzormfv5DNbDFetslmIjBmjo1TGo3NnKL4qNzvGNscjzYdrwF1AH85I
         L74jOXUsVPTJ55Z8ZZ0kw4N07gUX762HXAQgiPTE5vWdAgMnwlPiG4/Eq86bACIUXt3x
         JI5vD8Dm9su7VI73BxFjbAHrbNfM/hGulg3pGgk/F6Rv7CG4VXmWhN8WPh9J4QSpXcTP
         gmq7EtPukGIqkVlYMtPrNC3HyeF9gnkGo+890xA5PeNRi4FWYb7tT3S589gOVPBkQKtB
         n6/w==
X-Gm-Message-State: AO0yUKVhFBox23aZ/Df6sQ/EvClLa45S3Waoz0fluehmkIWoiyIbt169
	RjMpR1/RF6Tpxl3aokzoJ9cR09hMOd3NVTUJzF8/2A==
X-Google-Smtp-Source: AK7set+YKZYAqq9uXV/Tl7dtS7r4igRwKMrAxy4c2sAr3reGTTa35Iqc0/0ZNe2S+Qa/AX4aQZX1Z2NuBexLWCoWOdQ=
X-Received: by 2002:adf:e255:0:b0:2c5:5465:7ce4 with SMTP id
 bl21-20020adfe255000000b002c554657ce4mr1087182wrb.3.1677228238225; Fri, 24
 Feb 2023 00:43:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <aed4b3a97e7ab2db85fc53fd157de82e0a1be8cb.1677079672.git.jens.wiklander@linaro.org>
 <CDBEDCB0-89D5-432A-A57E-EDC9B91F25FC@arm.com>
In-Reply-To: <CDBEDCB0-89D5-432A-A57E-EDC9B91F25FC@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 24 Feb 2023 09:43:47 +0100
Message-ID: <CAHUa44EGb0ego8twnsSOCYNgqF4fng_Quf92x8LpNi2oo87+qg@mail.gmail.com>
Subject: Re: [XEN PATCH v7 05/20] xen/arm: ffa: add remaining SMC function IDs
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

On Thu, Feb 23, 2023 at 4:28 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Adds the remaining SMC function IDs from FF-A 1.1 specification.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> All number are coherent with the spec.

Thanks for verifying.

>
> I guess you did not include the notification ones because you do not plan to support them for now ?

That's correct.

>
> Anyway:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks,
Jens

>
> Cheers
> Bertrand
>
> > ---
> > xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
> > 1 file changed, 34 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 824153c9303a..aa6cdbe0a4f9 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -59,7 +59,41 @@
> > /* Function IDs */
> > #define FFA_ERROR                       0x84000060U
> > #define FFA_SUCCESS_32                  0x84000061U
> > +#define FFA_SUCCESS_64                  0xC4000061U
> > +#define FFA_INTERRUPT                   0x84000062U
> > #define FFA_VERSION                     0x84000063U
> > +#define FFA_FEATURES                    0x84000064U
> > +#define FFA_RX_ACQUIRE                  0x84000084U
> > +#define FFA_RX_RELEASE                  0x84000065U
> > +#define FFA_RXTX_MAP_32                 0x84000066U
> > +#define FFA_RXTX_MAP_64                 0xC4000066U
> > +#define FFA_RXTX_UNMAP                  0x84000067U
> > +#define FFA_PARTITION_INFO_GET          0x84000068U
> > +#define FFA_ID_GET                      0x84000069U
> > +#define FFA_SPM_ID_GET                  0x84000085U
> > +#define FFA_MSG_WAIT                    0x8400006BU
> > +#define FFA_MSG_YIELD                   0x8400006CU
> > +#define FFA_MSG_RUN                     0x8400006DU
> > +#define FFA_MSG_SEND2                   0x84000086U
> > +#define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
> > +#define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
> > +#define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
> > +#define FFA_MSG_SEND_DIRECT_RESP_64     0xC4000070U
> > +#define FFA_MEM_DONATE_32               0x84000071U
> > +#define FFA_MEM_DONATE_64               0xC4000071U
> > +#define FFA_MEM_LEND_32                 0x84000072U
> > +#define FFA_MEM_LEND_64                 0xC4000072U
> > +#define FFA_MEM_SHARE_32                0x84000073U
> > +#define FFA_MEM_SHARE_64                0xC4000073U
> > +#define FFA_MEM_RETRIEVE_REQ_32         0x84000074U
> > +#define FFA_MEM_RETRIEVE_REQ_64         0xC4000074U
> > +#define FFA_MEM_RETRIEVE_RESP           0x84000075U
> > +#define FFA_MEM_RELINQUISH              0x84000076U
> > +#define FFA_MEM_RECLAIM                 0x84000077U
> > +#define FFA_MEM_FRAG_RX                 0x8400007AU
> > +#define FFA_MEM_FRAG_TX                 0x8400007BU
> > +#define FFA_MSG_SEND                    0x8400006EU
> > +#define FFA_MSG_POLL                    0x8400006AU
> >
> > struct ffa_ctx {
> >     uint32_t guest_vers;
> > --
> > 2.34.1
> >
>

