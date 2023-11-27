Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA57F9BAB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 09:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641676.1000442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Wxj-0006AI-Cm; Mon, 27 Nov 2023 08:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641676.1000442; Mon, 27 Nov 2023 08:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Wxj-00067j-9z; Mon, 27 Nov 2023 08:27:27 +0000
Received: by outflank-mailman (input) for mailman id 641676;
 Mon, 27 Nov 2023 08:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j1wO=HI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7Wxh-00065t-K3
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 08:27:25 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca3d9019-8cfe-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 09:27:24 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b3e7f2fd9so14724905e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 00:27:24 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e16-20020adffc50000000b003313902cef5sm11188853wrs.93.2023.11.27.00.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 00:27:23 -0800 (PST)
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
X-Inumbo-ID: ca3d9019-8cfe-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701073643; x=1701678443; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DpW6mh75EPA88+Q0go1842xRQrpcvbKU0AZ/YBs8l10=;
        b=uUDxpY+ZD4Sp1XwIDO7U4vuPtN6+XODmROCqNGciXCNOv3tqpFn3ljNsgC+eG32Bez
         +uMiSqDo0syt5qUlSgEK05mLu5WhjhlLG7IVbcaK6E8H/OVB2pXH7xqLWJ2fdhH4rX5g
         S+CQze0Xi29PVZGMe7fjGkIYfE2zmkzimBBOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073643; x=1701678443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpW6mh75EPA88+Q0go1842xRQrpcvbKU0AZ/YBs8l10=;
        b=rpxqRi+CWF70x0lABUkxOFp6ZfCwjV4e76T3uStg8x6j4wwrY3hrH2WjXEmHGtdMKh
         ukxZCnKyzN33voXa2SzvF8lW2YF4gBe/P3RzSLC2IFPsxFic2PgELP/oEGCpZKrUYzWt
         Cd1xsjrkra3++9zie5uuuUZou2myODV/9lhDT1r5Iu5q9KU/HEYE6LyI/6hCxGx+WNQq
         Ltg0JoVJUwY4Tg71h7IfNVH1glTIqJO3xpOnpujBkcx39+tjrNgTSB+CbF5ZhBpfbKSA
         9yt6ApnSydOc/KGZ7eTjB4bk1mijMiE2Muwgc6Zgl+4sKsrOt3XKPQ4hoL7sAj7OUo6C
         UY9g==
X-Gm-Message-State: AOJu0Ywt9wthP3QOMxsA/r7kDH0/8DjTj/Ve7O4H2DEtr0QNY6I0nh+c
	rygvu5doFydRmMwzzPZNJIxnlg==
X-Google-Smtp-Source: AGHT+IFtK9fQvA6bM1No8GZVJsNh5SkNHM0rXNyt7Hkok8gO+TzYYdgXQExxv9kWZ3dUlogdjcdB7w==
X-Received: by 2002:a05:600c:4ecf:b0:40b:47dc:9bb3 with SMTP id g15-20020a05600c4ecf00b0040b47dc9bb3mr598096wmq.14.1701073643670;
        Mon, 27 Nov 2023 00:27:23 -0800 (PST)
Date: Mon, 27 Nov 2023 09:27:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Neowutran <xen@neowutran.ovh>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZWRS5qUTjkoD22MF@macbook>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
 <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
 <ZV1Rz+FmmyWFHiM9@mattapan.m5p.com>
 <ZV8d2ZiiiBBNySgc@macbook>
 <ZWFKtrBl2kpdvjBC@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWFKtrBl2kpdvjBC@mattapan.m5p.com>

On Fri, Nov 24, 2023 at 05:15:34PM -0800, Elliott Mitchell wrote:
> On Thu, Nov 23, 2023 at 10:39:37AM +0100, Roger Pau Monné wrote:
> > On Tue, Nov 21, 2023 at 04:56:47PM -0800, Elliott Mitchell wrote:
> > > It was insisted that full logs be sent to xen-devel.  Perhaps I am
> > > paranoid, but I doubt I would have been successful at scrubbing all
> > > hardware serial numbers.  As such, I was willing to post substantial
> > > sections, but not everything.
> > 
> > Can you please point out which hardware serial numbers are you
> > referring to, and where are they printed in Xen dmesg?
> 
> I didn't confirm the presence of hardware serial numbers getting into
> Xen's dmesg, but there was a lot of data and many hexadecimal numbers.
> With 4000 lines of output, checking for concerning data is troublesome.

4000 lines of output from Xen dmesg seems quite suspicious.  Xen dmesg
on a fully booted box is ~400 lines on my local box.  That might get
quite longer if you have a box with a lot of memory region, or a lot
of CPUs.

> There was enough for alarms to trigger.

That's fine, but without pointing out which information is sensitive,
it's very unlikely such concerns will ever get fixed.

Could you at least go over the log and point out the first instance of
such line that you consider contains sensitive information?

The primary way we have to diagnose and solve issues reported by users
is based on Xen dmesg, so if it's impossible to provide it for privacy
reasons that's an issue that we need to address.

Regards, Roger.

