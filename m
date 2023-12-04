Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA3803142
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 12:08:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646817.1009395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6nw-0002Hg-WA; Mon, 04 Dec 2023 11:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646817.1009395; Mon, 04 Dec 2023 11:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6nw-0002F6-TJ; Mon, 04 Dec 2023 11:08:00 +0000
Received: by outflank-mailman (input) for mailman id 646817;
 Mon, 04 Dec 2023 11:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA6nv-0002Ey-0g
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 11:07:59 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 618a2a45-9295-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 12:07:58 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c0e7b8a9bso3049585e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 03:07:58 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 fs16-20020a05600c3f9000b0040b48690c49sm14566216wmb.6.2023.12.04.03.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 03:07:57 -0800 (PST)
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
X-Inumbo-ID: 618a2a45-9295-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701688077; x=1702292877; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7lhafCnEiofrBS1RDO84DPiXLdaGcbdNs2AXD0AY3o=;
        b=ZaQJnqGLgZszxTWRaeg8+6tLXf35j+4sbUBpaKnTtfyHOIT+RUoSgCks6t75Kz385t
         /6eJCA4yyaxRfqmupIIlHhJQHJi0Aa8QE7NYwBmh62pk+pF7PAlr+VuWJTCcehLBFzq9
         Ds1qo3lbQKIcbhe0yVaOun3f5j/7xybyAaoKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701688077; x=1702292877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7lhafCnEiofrBS1RDO84DPiXLdaGcbdNs2AXD0AY3o=;
        b=aVBIIGkFfgS0IXzY4wSKTkwo+jiCko6ZvE6UlicbKzsdQurDaoKDBg0ukiVkaDx28z
         SweIPHRMocwkCLibVVtJdgd5Dnk5hAYq9HzwujB5S6aLZJu9ktmjLcff9IdaDQuOujxb
         DzKldIo5tWG9O3QnKdA3m1YI1PobcpqamdGP2/VAyzVOFYKktXoWsplc6pYcM6IHcW/y
         H+UgG+HzuEtS9B3WPjpDg+31uFTX96CDMpeB0g5JPj3t/MUcg9Fbh9eFaWZ1PRURX2Xq
         e0ikRV2R79OvDYwEqyc6quOAjQGiDAWy2sKBydspmLvynEEroL2FEfIkfsKVRvlbaEPx
         LvLg==
X-Gm-Message-State: AOJu0YxWVy4aSBJmdKIIzQ4XdJiYeQw9HqMrtY8k8pqdXJ/3zHrdtcvE
	lR8/idzXHsz1YAUL4uF4YoqMwg==
X-Google-Smtp-Source: AGHT+IHd7JIrdOpgUrcbNrgkxV2XLo/Vnt/E/DjrBrxqsiBvlTrz/cfbeE5+zeYEmczgiCBLvph7QQ==
X-Received: by 2002:a05:600c:181d:b0:40b:5e59:ccdb with SMTP id n29-20020a05600c181d00b0040b5e59ccdbmr2511915wmp.188.1701688077591;
        Mon, 04 Dec 2023 03:07:57 -0800 (PST)
Date: Mon, 4 Dec 2023 12:07:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Neowutran <xen@neowutran.ovh>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZW2zDPBm8oYi7bjm@macbook>
References: <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
 <ZV1Rz+FmmyWFHiM9@mattapan.m5p.com>
 <ZV8d2ZiiiBBNySgc@macbook>
 <ZWFKtrBl2kpdvjBC@mattapan.m5p.com>
 <ZWRS5qUTjkoD22MF@macbook>
 <ZW0lDEso5c+GUAQr@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZW0lDEso5c+GUAQr@mattapan.m5p.com>

On Sun, Dec 03, 2023 at 05:02:04PM -0800, Elliott Mitchell wrote:
> On Mon, Nov 27, 2023 at 09:27:18AM +0100, Roger Pau Monn
> > On Fri, Nov 24, 2023 at 05:15:34PM -0800, Elliott Mitchell wrote:
> > > On Thu, Nov 23, 2023 at 10:39:37AM +0100, Roger Pau Monn
> > > > On Tue, Nov 21, 2023 at 04:56:47PM -0800, Elliott Mitchell wrote:
> > > > > It was insisted that full logs be sent to xen-devel.  Perhaps I am
> > > > > paranoid, but I doubt I would have been successful at scrubbing all
> > > > > hardware serial numbers.  As such, I was willing to post substantial
> > > > > sections, but not everything.
> > > > 
> > > > Can you please point out which hardware serial numbers are you
> > > > referring to, and where are they printed in Xen dmesg?
> > > 
> > > I didn't confirm the presence of hardware serial numbers getting into
> > > Xen's dmesg, but there was a lot of data and many hexadecimal numbers.
> > > With 4000 lines of output, checking for concerning data is troublesome.
> > 
> > 4000 lines of output from Xen dmesg seems quite suspicious.  Xen dmesg
> > on a fully booted box is ~400 lines on my local box.  That might get
> > quite longer if you have a box with a lot of memory region, or a lot
> > of CPUs.
> 
> That was from 4 boots with differing settings.  Since it was full console
> log, it also had the initial Linux kernel boot messages.  Each log was
> ~1000 lines.

I think this is unfair.  People on the list was willing to go over
your 1000 lines of log in order to help solve your issue, and you
couldn't go over them to assert your claims about it containing
sensitive information?

> > > There was enough for alarms to trigger.
> > 
> > That's fine, but without pointing out which information is sensitive,
> > it's very unlikely such concerns will ever get fixed.
> > 
> > Could you at least go over the log and point out the first instance of
> > such line that you consider contains sensitive information?
> 
> I would have been more comfortable with getting some guidance on which
> portions were desired or which could be left out.  No need for Linux's
> boot messages, what would cut things down by half.

IIRC the specific request was for Xen logs, so yes, you could have
left out the Linux side, at least until asked for.

> memory map, lots more goes.
> 
> It is easier to be comfortable with 40 line sections than 1000 line
> sections.

I don't think that's really feasible, it's unclear how much you would
trim, and whether such trimming could remove important information to
help debug the issue.

Again, it would be very helpful for us to get pointed out at what
sensitive information is being printed, so that it can be removed.

Thanks, Roger.

