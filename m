Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10466828617
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 13:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664572.1034647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNBIX-0003pR-Re; Tue, 09 Jan 2024 12:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664572.1034647; Tue, 09 Jan 2024 12:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNBIX-0003ns-P5; Tue, 09 Jan 2024 12:33:37 +0000
Received: by outflank-mailman (input) for mailman id 664572;
 Tue, 09 Jan 2024 12:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OpKn=IT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNBIW-0003nm-Pa
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 12:33:36 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e7a90a9-aeeb-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 13:33:35 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2adc52f213so193588766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 04:33:35 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 s11-20020a170906284b00b00a26a443e98esm980225ejc.169.2024.01.09.04.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 04:33:34 -0800 (PST)
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
X-Inumbo-ID: 4e7a90a9-aeeb-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704803615; x=1705408415; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IyxkpNpxmmoM8pUBVXYC5P1cH29+Fb4jlVEiXLzonEQ=;
        b=qUTUyNCPohZSAV+gIXLsL+MqZyqHxUXyRWYlwM4YKqbu9ORYoz8Rgeld/4I6orKasl
         /RJ9TlUxsJxnGmlAnA+gKTRE7gO2pQVCXNsD+ZXEzrCshlkI2u9EmWC6rhiOrkXe4qtU
         d/OdDc2bu0zQvN/VikcK71J0XJljB1I2x2T+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704803615; x=1705408415;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyxkpNpxmmoM8pUBVXYC5P1cH29+Fb4jlVEiXLzonEQ=;
        b=UE+XA/wXkF88JamGHCvWChqXvMpt0n8stheOWtd12rKZzGbhgcj80Om9zzrAJZXRfB
         Y0MRk3WjEVlYJEVxSlipyCC4gjLFUyp5MX1cYZK6cLa0olM9WgemNMFBXINshHqXEn13
         W38je6a/AsVi/BuHoNPnoex6oocbb0c8QQAMT3HZzbppU7evcSqkZiuHjI4rRm6rsB+c
         GlfLgpV7/p3IepdVmRof3WQq5vOcg6bl7ZZbYKvQ+Vb9Xu8Fit5IdmlTDmhTA8ryDaew
         X3gvFi2VizMOCTrnPA3Tw6NEyYTc2gjYcj+JqxqhnTeKRh92pdMRFF0ea0rn3Eq3GXIj
         P+pw==
X-Gm-Message-State: AOJu0YxCxsJOi/AGBNAygdXkuwNVJct4HxTxet+thGOwmHHu8B2iecfJ
	n/iL5uiyrMtH+FD5Q9iXD42I4AJCEGPi0w==
X-Google-Smtp-Source: AGHT+IHmAvzQJel65Lpz89Grc023zBNuhgG7qOINUtTPDWEqRhtYqIw3ulUCUjK/JMKhkUqbEFN2LQ==
X-Received: by 2002:a17:906:2c05:b0:a27:7da8:aaee with SMTP id e5-20020a1709062c0500b00a277da8aaeemr482126ejh.12.1704803614852;
        Tue, 09 Jan 2024 04:33:34 -0800 (PST)
Date: Tue, 9 Jan 2024 13:33:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/5] x86/HVM: split restore state checking from state
 loading
Message-ID: <ZZ09HcsL2irocO4T@macbook>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
 <05e69eea-79cc-4b3c-861b-855fa67c878a@suse.com>
 <ZYGqbboWvjVOGZkb@macbook>
 <48b5a33e-19c8-49fd-9682-17056e0acb00@suse.com>
 <ZZ0fVDLQb__IvgT3@macbook>
 <77a1fdf8-f02d-4125-832c-f022d8750c87@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77a1fdf8-f02d-4125-832c-f022d8750c87@suse.com>

On Tue, Jan 09, 2024 at 11:58:48AM +0100, Jan Beulich wrote:
> On 09.01.2024 11:26, Roger Pau Monné wrote:
> > On Tue, Dec 19, 2023 at 04:24:02PM +0100, Jan Beulich wrote:
> >> On 19.12.2023 15:36, Roger Pau Monné wrote:
> >>> On Mon, Dec 18, 2023 at 03:39:55PM +0100, Jan Beulich wrote:
> >>>> @@ -291,50 +295,91 @@ int hvm_load(struct domain *d, hvm_domai
> >>>>      if ( !hdr )
> >>>>          return -ENODATA;
> >>>>  
> >>>> -    rc = arch_hvm_load(d, hdr);
> >>>> -    if ( rc )
> >>>> -        return rc;
> >>>> +    rc = arch_hvm_check(d, hdr);
> >>>
> >>> Shouldn't this _check function only be called when real == false?
> >>
> >> Possibly. In v4 I directly transformed what I had in v3:
> >>
> >>     ASSERT(!arch_hvm_check(d, hdr));
> >>
> >> I.e. it is now the call above plus ...
> >>
> >>>> +    if ( real )
> >>>> +    {
> >>>> +        struct vcpu *v;
> >>>> +
> >>>> +        ASSERT(!rc);
> >>
> >> ... this assertion. Really the little brother of the call site assertion
> >> you're asking for (see above).
> >>
> >>>> +        arch_hvm_load(d, hdr);
> >>>>  
> >>>> -    /* Down all the vcpus: we only re-enable the ones that had state saved. */
> >>>> -    for_each_vcpu(d, v)
> >>>> -        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
> >>>> -            vcpu_sleep_nosync(v);
> >>>> +        /*
> >>>> +         * Down all the vcpus: we only re-enable the ones that had state
> >>>> +         * saved.
> >>>> +         */
> >>>> +        for_each_vcpu(d, v)
> >>>> +            if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
> >>>> +                vcpu_sleep_nosync(v);
> >>>> +    }
> >>>> +    else if ( rc )
> >>>> +        return rc;
> > 
> > The issue I see with this is that when built with debug=n the call to
> > arch_hvm_check() with real == true is useless, as the result is never
> > evaluated - IOW: would be clearer to just avoid the call altogether.
> 
> Which, besides being imo slightly worse for then having two call sites,
> puts me in a difficult position: It may not have been here, but on
> another patch (but I think it was an earlier version of this one)
> where Andrew commented on
> 
>     ASSERT(func());
> 
> as generally being a disliked pattern, for having a "side effect" in
> the expression of an assertion.

I was going to suggest to add the pure attribute to the function, but
it does have side effects as it prints to the console.

> Plus the call isn't pointless even in
> release builds, because of the log messages issued: Them appearing
> twice in close succession might be a good hint of something fishy
> going on.

Why do you mention the messages appearing twice?  Won't the first
check call return error and thus should prevent the caller from
attempting to load the state?

Thanks, Roger.

