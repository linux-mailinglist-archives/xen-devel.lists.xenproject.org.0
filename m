Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB6D687346
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 03:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488500.756606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNP6k-0004pX-Rs; Thu, 02 Feb 2023 02:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488500.756606; Thu, 02 Feb 2023 02:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNP6k-0004my-Oi; Thu, 02 Feb 2023 02:13:50 +0000
Received: by outflank-mailman (input) for mailman id 488500;
 Thu, 02 Feb 2023 02:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3oZ9=56=koconnor.net=kevin@srs-se1.protection.inumbo.net>)
 id 1pNP6j-0004ms-Er
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 02:13:49 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a0c366f-a29f-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 03:13:48 +0100 (CET)
Received: by mail-qv1-xf34.google.com with SMTP id x18so237884qvl.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 18:13:48 -0800 (PST)
Received: from localhost ([64.18.11.67]) by smtp.gmail.com with ESMTPSA id
 d12-20020a05620a204c00b007201df7ff47sm6813568qka.45.2023.02.01.18.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 18:13:46 -0800 (PST)
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
X-Inumbo-ID: 3a0c366f-a29f-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=koconnor.net; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqmz7hu2G9r/RJV/8jS2mx0R656hA6RTcJf6/8HTqaY=;
        b=baI0Ri1uaTAy7OVcrgqlkjfEVxnbv/d/D57DrefkM6vzmBFg5cMAFSunTAKp3qNWSF
         0rb5BWRrxTsAX3ih7Ln+hhctf7eRxPFKVT+V0CmQ/GIbejuBhxNXgIBNu4MZc0jAW6e9
         NK0wp3ROS8bNgUAhpDS98ROaEGLM0zGqVCO5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mqmz7hu2G9r/RJV/8jS2mx0R656hA6RTcJf6/8HTqaY=;
        b=tyrNhoZ154WIFZF7EG1QVkSP7WfXHvU8Qcw6oPeC0rXbCOFF11B7iHm8sv25jlLH+Q
         E9uwDhJkujDri3qr5YIFzhrHHZ3wqhnEhez/17Ram8cPft5Oo4q7lD6iR5LruTlCFohW
         qFSa0r4nmjT3mkHfgbgjVE4WJzNAp6kWAd1ZtG6Xjfu7VdEZEWWJangrg//Naoaz0cEc
         4jeOXIndJrHBftJMgQSeXbjshRaoqWmpn2Pr7j9YlbxY/CgVFi3koQYbtGTMBxAyNQD3
         bV7xFjrMGnGgJZJbDbpP26qOS1cYu0BOsXPPGSbtwI/bYPZLKYbfVJlX2Sbypn5NNvLV
         XZdg==
X-Gm-Message-State: AO0yUKV5KlThGd9Z43HPqLw0EBH4KkYm/Ad0r20AVAbQPdGgobEo0I2A
	DhTniv7/bjmHVJfJMHlZtf30xQ==
X-Google-Smtp-Source: AK7set81ROSrZYyNA3Puq1cqPfaXketVTob01gsC5RRs9n4SXF9f3GSnPc5BNKsdHUb/wxPFQQbCUQ==
X-Received: by 2002:a0c:fa07:0:b0:53a:3a20:4200 with SMTP id q7-20020a0cfa07000000b0053a3a204200mr6544477qvn.31.1675304027070;
        Wed, 01 Feb 2023 18:13:47 -0800 (PST)
Date: Wed, 1 Feb 2023 21:13:45 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: David Woodhouse <dwmw2@infradead.org>
Cc: seabios <seabios@seabios.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: Re: [SeaBIOS] [SeaBIOS PATCH] xen: require Xen info structure at
 0x1000 to detect Xen
Message-ID: <Y9scWQ/ASMCrY/uM@morn>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>

On Fri, Jan 20, 2023 at 11:33:19AM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When running under Xen, hvmloader places a table at 0x1000 with the e820
> information and BIOS tables. If this isn't present, SeaBIOS will 
> currently panic.
> 
> We now have support for running Xen guests natively in QEMU/KVM, which
> boots SeaBIOS directly instead of via hvmloader, and does not provide
> the same structure.
> 
> As it happens, this doesn't matter on first boot. because although we
> set PlatformRunningOn to PF_QEMU|PF_XEN, reading it back again still
> gives zero. Presumably because in true Xen, this is all already RAM. But
> in QEMU with a faithfully-emulated PAM config in the host bridge, it's
> still in ROM mode at this point so we don't see what we've just written.
> 
> On reboot, however, the region *is* set to RAM mode and we do see the
> updated value of PlatformRunningOn, do manage to remember that we've
> detected Xen in CPUID, and hit the panic.
> 
> It's not trivial to detect QEMU vs. real Xen at the time xen_preinit()
> runs, because it's so early. We can't even make a XENVER_extraversion
> hypercall to look for hints, because we haven't set up the hypercall
> page (and don't have an allocator to give us a page in which to do so).
> 
> So just make Xen detection contingent on the info structure being
> present. If it wasn't, we were going to panic anyway. That leaves us
> taking the standard QEMU init path for Xen guests in native QEMU,
> which is just fine.

Thanks.  I committed this change.

-Kevin

