Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF50A67B62
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:51:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919716.1324099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tub5T-0006B0-9g; Tue, 18 Mar 2025 17:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919716.1324099; Tue, 18 Mar 2025 17:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tub5T-00069T-6A; Tue, 18 Mar 2025 17:50:47 +0000
Received: by outflank-mailman (input) for mailman id 919716;
 Tue, 18 Mar 2025 17:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tub5S-00068S-AZ
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:50:46 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 837e5f59-0421-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 18:50:44 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2255003f4c6so107324125ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:50:44 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73711578d15sm9894171b3a.82.2025.03.18.10.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:50:42 -0700 (PDT)
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
X-Inumbo-ID: 837e5f59-0421-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742320243; x=1742925043; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p0ZC3IBzZzaYzqfmFXtE+Vo/yyQqO+VOl8Gf/emR9pg=;
        b=iIt0/i+Xp8osBkcnAJHUki0Tq0VlR/clz/g76vzCXVHj4JkeQUdeU+Sd1ky82k0+9y
         dVTZ8Qe42QmKgJ3Me1P+W4+fcGU7s6C3FAPEFsuRt3o6pTtIVrK2+SS700/Qm6jMA+H8
         aog60EBC0lrTXbLbKWKMjSru3hPw7CCBUGPiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320243; x=1742925043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0ZC3IBzZzaYzqfmFXtE+Vo/yyQqO+VOl8Gf/emR9pg=;
        b=EGOJqOqrB4S4fw69ScXcu5XgQjqvY+OBnnm365evyMv3dWbROqn+YERPXKturHqf4b
         ihxV5z4BOv0NIUcIXZ3882mnMQPwGgPIoj6HvA3IbMnsQeg8RVRihpP4IAP+ZwsX1zho
         YMGnXy3fy9cESJJ0X1cCg/ADje7hmMJJTbPLGEDTXMjffAUEUOutrxDrN9QVZhyMDhIa
         /Do6gsp39J45RUnwBWORCU41U+Vsu2gcxeqle4KycNp4/0XEXa/QD5NDS+TeRIWG5bPE
         5EzVNI2molJ+U+GD0WPW3SaL5JBTwY1cqUBH6rv36DFmfDET/xS8FgUwFbQvozfWFajU
         rLwg==
X-Forwarded-Encrypted: i=1; AJvYcCW6DXLJlrIcpNBT8Tcp+XKxHzRwBIFeL1S+8ygkXif9SJGVXHh+DtVBpkbHwt4YGAfDyDdq77h2T7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZxH/SDSqcJqZBYv0Ml9uTGKO/993I3rHbMdptQYggFgh+BGIC
	okw19/EXUBb+VAyULSqpuPEg8AZYr3WxUlQB4s6QOzt4ug8ONqE44UK9NbIRZ8Y=
X-Gm-Gg: ASbGncv4JfxDL1tQ++jt/aFe6JV8bTYa+z5G5VvLK29Q3/gCVLXeomXwayGDpPBBP5Y
	L3nuweRPXamQhwvJJV6aUgN/73nJzF4mwTwZAXC5GZq6eI5oXtGWn8j6WOHM9Ms2Bhsu4jnZeRV
	JOxqD0Uw7tMOfvTHgNVpgjS8nLdkPnUgJfyC/nuk18Pz546OjPiQkpDf/mRIzJwWmha298ml4mw
	Y/hKw/TgUOitQfVLdxk6xgCa4hHpMnyGRdALf4CL4UdIc8z2k4M73679WuAZeVn5i1SiFI822wY
	6Z/xDnWTRd6dm0T8XxXMOHDE3SKmtwcn9IH2QZDPHssFi/Zdzg==
X-Google-Smtp-Source: AGHT+IGpt86ZMGbP+avm1GF8clF4Xs+B6jpjJ4xwM7+OGRPPBhRNcoCtmj2iqJY4XCP3Y1Y8fNt3iw==
X-Received: by 2002:a05:6a21:1644:b0:1ee:e2ac:5159 with SMTP id adf61e73a8af0-1f5c1201d48mr26369133637.19.1742320242958;
        Tue, 18 Mar 2025 10:50:42 -0700 (PDT)
Date: Tue, 18 Mar 2025 18:50:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/5] x86/xlat: fix UB pointer arithmetic in
 COMPAT_ARG_XLAT_VIRT_BASE
Message-ID: <Z9mybWM1a-9nvm-n@macbook.local>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-4-roger.pau@citrix.com>
 <8ad59d67-02f8-415c-93a0-2361e920c017@suse.com>
 <Z9mSub1DgzoP71-v@macbook.local>
 <06e00c30-90d4-42a1-a1d7-fadd63b9377e@suse.com>
 <Z9mjsLFkCCxMR84Z@macbook.local>
 <1e37eb58-21a0-49a1-b7fe-9c950b32e2e6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e37eb58-21a0-49a1-b7fe-9c950b32e2e6@suse.com>

On Tue, Mar 18, 2025 at 06:01:46PM +0100, Jan Beulich wrote:
> On 18.03.2025 17:47, Roger Pau Monné wrote:
> > On Tue, Mar 18, 2025 at 04:50:58PM +0100, Jan Beulich wrote:
> >> On 18.03.2025 16:35, Roger Pau Monné wrote:
> >>> On Tue, Mar 18, 2025 at 03:33:03PM +0100, Jan Beulich wrote:
> >>>> On 18.03.2025 10:19, Roger Pau Monne wrote:
> >>>>> --- a/xen/arch/x86/include/asm/x86_64/uaccess.h
> >>>>> +++ b/xen/arch/x86/include/asm/x86_64/uaccess.h
> >>>>> @@ -9,9 +9,9 @@
> >>>>>   * a secondary mapping installed, which needs to be used for such accesses in
> >>>>>   * the PV case, and will also be used for HVM to avoid extra conditionals.
> >>>>>   */
> >>>>> -#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) + \
> >>>>> -                                   (PERDOMAIN_ALT_VIRT_START - \
> >>>>> -                                    PERDOMAIN_VIRT_START))
> >>>>> +#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
> >>>>> +                                   (PERDOMAIN_VIRT_START - \
> >>>>> +                                    PERDOMAIN_ALT_VIRT_START))
> >>>>
> >>>> Aren't we then (still) dependent on ordering between PERDOMAIN_VIRT_START
> >>>> and PERDOMAIN_ALT_VIRT_START? Would
> >>>>
> >>>> #define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
> >>>>                                    PERDOMAIN_VIRT_START + \
> >>>>                                    PERDOMAIN_ALT_VIRT_START)
> >>>>
> >>>> perhaps be less fragile?
> >>>
> >>> PERDOMAIN_{ALT_,}VIRT_START are unsigned long, so this might work.
> >>>
> >>> Note however that even with your suggestion we are still dependant on
> >>> ARG_XLAT_START(v) > PERDOMAIN_ALT_VIRT_START, or else the '-' won't
> >>> work.  I think I prefer my proposed version, because it's clear that
> >>> PERDOMAIN_VIRT_START, ARG_XLAT_START(current) >
> >>> PERDOMAIN_ALT_VIRT_START.
> >>
> >> What makes that clear? Can't we move PERDOMAIN_ALT_VIRT_START pretty
> >> much at will?
> > 
> > We would need to adjust the calculations here again, if
> > PERDOMAIN_ALT_VIRT_START > PERDOMAIN_VIRT_START the subtraction would
> > lead to an underflow, and would also be UB pointer arithmetic?
> 
> With
> 
> #define ARG_XLAT_VIRT_START      PERDOMAIN_VIRT_SLOT(2)
> 
> I can't see how subtracting PERDOMAIN_VIRT_START could lead to an underflow.
> The idea of the expression suggested is to first subtract the area base (no
> underflow) and then add the other area's base (no overflow).

Oh, right, I was reading it wrong sorry, somehow I was (still) seeing
a pair of braces around PERDOMAIN_VIRT_START +
PERDOMAIN_ALT_VIRT_START when there are none.  Yes, I will adjust to
your suggestion.

Thanks, Roger.

