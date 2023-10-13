Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BE17C87E9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 16:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616587.958718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJET-00038C-Ky; Fri, 13 Oct 2023 14:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616587.958718; Fri, 13 Oct 2023 14:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJET-00035L-Gp; Fri, 13 Oct 2023 14:33:41 +0000
Received: by outflank-mailman (input) for mailman id 616587;
 Fri, 13 Oct 2023 14:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVAw=F3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qrJER-00035C-Tu
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 14:33:39 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f9365af-69d5-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 16:33:38 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9ba081173a3so360883966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 07:33:38 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p6-20020a1709061b4600b0098e2969ed44sm12363199ejg.45.2023.10.13.07.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 07:33:37 -0700 (PDT)
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
X-Inumbo-ID: 7f9365af-69d5-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697207618; x=1697812418; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FmSVxW0sKWh03ge/ZJ3GZGuT3+zkVH4gU9pBgkwRYF0=;
        b=gXNYpigXKZdRPAvaW3wADHb9Ws613Ua0rs08a9GBECgg19/WicLrf1UNv/wSM4rvf3
         0tPq/8TK/vAnT6DZ2R1Lx4RALa93f/6hVv3bqpCa61yFyMryynIzxKBT53YCjrO3izXn
         elp9XDnHEos5Ss82PmnPtztdLDkdk97q4zg6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697207618; x=1697812418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FmSVxW0sKWh03ge/ZJ3GZGuT3+zkVH4gU9pBgkwRYF0=;
        b=l0RojzURZmAnKong9+e9/GO7tqHKZkneec9oECRY8yynoQd3gQs7wt15a0k8gfV+U5
         AFfLaeSuRAJ0AtetHH5ubXlBYbnLvfxdcvuiXg1T/dN/Ogt+jtn8a9MTI0htu31jxuNz
         Nlxyms85psn8pVOvekYzAnd2KdTev05ppFYTsFVbr4lL26R5+oGIzlZYaSE27Fu6+ybc
         DFlOWDoYez9g9aYFVM6dtkg7nNl+Y26VL7KPuBjjkWxGeCwN4ZfV3cG8hBP+vmiWrkGq
         Z6L2vuDXpyUlS637+6nB43AWB5kijDC2rpSmcB3fuTsOHEZvxR4K7zHwPo9AnNLmTsRC
         uAcA==
X-Gm-Message-State: AOJu0Yy4u9e7iiuBeG9Yg30W+Hs3sSL4YfVAOQhPKaUUD5BJvA8xOl6R
	+br0OQx+QGPq+ETnz1dx1i0qch/pnPytXF5FZyQ=
X-Google-Smtp-Source: AGHT+IE0y5MGWRDknIp01Ud2ByT4CZvhq68jIQAmywS53KE3r6WPM/G14NyLnTt4YxyHAqk2IhLjyA==
X-Received: by 2002:a17:906:191:b0:9ba:13f1:5a62 with SMTP id 17-20020a170906019100b009ba13f15a62mr14351874ejb.34.1697207618068;
        Fri, 13 Oct 2023 07:33:38 -0700 (PDT)
Message-ID: <65295541.170a0220.81347.68b5@mx.google.com>
X-Google-Original-Message-ID: <ZSlVPuf0xp+FE9Ie@EMEAENGAAD19049.>
Date: Fri, 13 Oct 2023 15:33:34 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.18][PATCH v2] x86/amd: Address AMD erratum #1485
References: <20231013131846.175702-1-alejandro.vallejo@cloud.com>
 <42d8ac8d-522e-424a-b002-9a0508f318da@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42d8ac8d-522e-424a-b002-9a0508f318da@citrix.com>

On Fri, Oct 13, 2023 at 09:40:52PM +0800, Andrew Cooper wrote:
> On 13/10/2023 9:18 pm, Alejandro Vallejo wrote:
> > diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> > index 4f27187f92..085c4772d7 100644
> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > @@ -1167,6 +1167,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
> >  	if (c->x86 == 0x10)
> >  		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
> >  
> > +	/* Fix for AMD erratum #1485 */
> > +	if (!cpu_has_hypervisor && c->x86 == 0x19 && is_zen4_uarch()) {
> > +		rdmsrl(MSR_AMD64_BP_CFG, value);
> > +		#define ZEN4_BP_CFG_SHARED_BTB_FIX (1ull << 5)
> > +		wrmsrl(MSR_AMD64_BP_CFG,
> > +		       value | ZEN4_BP_CFG_SHARED_BTB_FIX);
> 
> A #define indented like that is weird.  I tend to either opencode it
> directly in the "value |" expression, or have a local variable called
> chickenbit.
Ok, I don't mind either way. I'll just go with the chickenbit.

> 
> This will surely be a core scope MSR rather than thread scope,
It is, though I doubt it matters a whole lot. The writes are consistent
anyway.

> at which
> point the write ought to be conditional on seeing the chickenbit
> clear (hence needing to refer to the value at least twice, so use a
> local variable).
I have serious doubts such a conditional would do much for boot times, but
sure.

> 
> It probably also wants a note about non-atomic RMW, and how it's safe in
> practice.  (See the Zenbleed comment).
Fair enough.

> 
> Otherwise, LGTM.
> 
> As this is just cribbing from an existing example, I'm happy to adjust
> on commit, but it's probably better to double check in the PPR and retest.
> 
> ~Andrew

Let me send a v3 after re-testing with the conditional in place

Thanks,
Alejandro

