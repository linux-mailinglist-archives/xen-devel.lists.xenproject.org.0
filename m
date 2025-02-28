Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C4A49985
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 13:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898706.1307215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnzct-0007R5-Df; Fri, 28 Feb 2025 12:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898706.1307215; Fri, 28 Feb 2025 12:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnzct-0007OA-AK; Fri, 28 Feb 2025 12:37:59 +0000
Received: by outflank-mailman (input) for mailman id 898706;
 Fri, 28 Feb 2025 12:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zu1c=VT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnzcs-0007O2-9B
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 12:37:58 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d641190b-f5d0-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 13:37:57 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e08064b4ddso2668861a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 04:37:57 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3b4aa13sm2419563a12.7.2025.02.28.04.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 04:37:55 -0800 (PST)
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
X-Inumbo-ID: d641190b-f5d0-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740746276; x=1741351076; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lUi7TDWm5DZEk1+vj+Gomi1jwfuwvI4mo++EyAzIHw=;
        b=DmCVH0BnqzkM0u0wIbNBzNQXUOFfrRvA2m0qPW0nWbbnRFk7/uAaSYmySK5uiEMY0G
         baRRHhtLGPEwOe7ILgRkjL/v/dyBL9caFKCRmiZ40BaiejgJUI9dG4ePXrZD6V3RJW0C
         gxOSPAGYRED2OwXPUlWulyCDOOygbKw1ZJjhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746276; x=1741351076;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lUi7TDWm5DZEk1+vj+Gomi1jwfuwvI4mo++EyAzIHw=;
        b=JYWpEeihRsabEQipgQ5RCV3LBoVlG2iZhX46xC9A6kJxKTfBCq6GCpUm7EnYh1zBEp
         Ru3FRfFATekKdPPYzlWBsIF17J+z5cjizbEmOkI9/Uhl0PfptPoWkFO7GM0OyosMSUys
         McOWFe9YIWO84EtHVV9h5kbljCyFWDI99nOuwjgmD29bmbeFHDvMHpMlHAXIQIIfY27Q
         Q3R3PWLZQkbJ9qFfP02/Niqd0CTwIBo4ytUALeTLgppnstOLWmyIbQOKTKywh+/A+VWi
         i3hyKw+Z4Z2kf3E16H7oOCI8hUEsDPFZFQEtiZh3lkHljbP8O+e30+xT4uDV7VtaBdGO
         7DXA==
X-Forwarded-Encrypted: i=1; AJvYcCVDbwPafRdl1Avglo6o9uWDzy5pFVmROPkI1xIVZ+nhuj0S7425ADbu4gn+1+dJJQl2SY93kRZB9QQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYXTNxPXzrKmwiahsCQWyt57kHrxq7RlifUzoJkfre8/IUn/Tu
	9aUqjGkcd35ZkdUNiijW9V5EAm2PW8Ot1DVMuifX2QwwOHtoq84XonD4+xcigY0=
X-Gm-Gg: ASbGncvFibbkXiFcdkiitV6Gu29lgvkc7i6O4bSOiSiPWuDMaonfGV+NNCkxpCYoKTA
	Ldu7rD7y2G+wAdcLqXYLZS1ts+uGCYcntHyAhWPv+wsnIe6pITyjacSi27cyydJEmq2FwiE2maq
	3xbHHbCyz7oKUGV+N8ROqpeQ9q4j9suuQog+vYvIBOxQoe8/R3FcrQvI4VJkRPOz7Xuh0pLFbRb
	DHthCPlnp+ZIOj4mgMtxMsIDQ7ureXP9fBYyzQNfuERJj1tXCAMdJfb8whn6rvsEFsRIFThnkvT
	gzcaK0wvDtIUW0ifjOVe+DwuXekJbaE=
X-Google-Smtp-Source: AGHT+IFXqFX+dmK6Tf53q9lL5WTgrMJLcEbkciCEYtLtRd65bqdRe2AXfvwUSIAwNgfqJo2GPKXk9Q==
X-Received: by 2002:a05:6402:268a:b0:5e4:a438:a50c with SMTP id 4fb4d7f45d1cf-5e4d6b69085mr2364147a12.20.1740746276267;
        Fri, 28 Feb 2025 04:37:56 -0800 (PST)
Date: Fri, 28 Feb 2025 13:37:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2] xen: Add support for XenServer 6.1 platform device
Message-ID: <Z8GuItUuhbF1UZ9V@macbook.local>
References: <20250225140400.23992-1-frediano.ziglio@cloud.com>
 <20250227145016.25350-1-frediano.ziglio@cloud.com>
 <a14c6897-075c-4b2c-8906-75eb96d5c430@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a14c6897-075c-4b2c-8906-75eb96d5c430@citrix.com>

On Thu, Feb 27, 2025 at 03:41:54PM +0000, Andrew Cooper wrote:
> On 27/02/2025 2:50 pm, Frediano Ziglio wrote:
> > On XenServer on Windows machine a platform device with ID 2 instead of
> > 1 is used.
> >
> > This device is mainly identical to device 1 but due to some Windows
> > update behaviour it was decided to use a device with a different ID.
> >
> > This causes compatibility issues with Linux which expects, if Xen
> > is detected, to find a Xen platform device (5853:0001) otherwise code
> > will crash due to some missing initialization (specifically grant
> > tables). Specifically from dmesg
> >
> >     RIP: 0010:gnttab_expand+0x29/0x210
> >     Code: 90 0f 1f 44 00 00 55 31 d2 48 89 e5 41 57 41 56 41 55 41 89 fd
> >           41 54 53 48 83 ec 10 48 8b 05 7e 9a 49 02 44 8b 35 a7 9a 49 02
> >           <8b> 48 04 8d 44 39 ff f7 f1 45 8d 24 06 89 c3 e8 43 fe ff ff
> >           44 39
> >     RSP: 0000:ffffba34c01fbc88 EFLAGS: 00010086

I think the back trace might be more helpful here rather than the raw
code?

Not sure if it helps, but there's a document in upstream Xen
repository that lists the IDs:

https://xenbits.xen.org/docs/unstable/man/xen-pci-device-reservations.7.html

It would be good to record the information you have gathered about the
different devices somewhere.  Maybe xen-pci-device-reservations would
be a good place to list the intended usage of those device IDs, as
right now it just lists the allocated ranges, but no information about
what's the purpose of each device.

> >     ...
> >
> > The device 2 is presented by Xapi adding device specification to
> > Qemu command line.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> I'm split about this.  It's just papering over the bugs that exist
> elsewhere in the Xen initialisation code.
> 
> But, if we're going to take this approach, then 0xc000 needs adding too,
> which is the other device ID you might find when trying to boot Linux in
> a VM configured using a Windows template.

Won't adding 0xc000 cause issues?  As then the xenpci driver will bind
to two devices on the same system (either 0001 or 0002, and
additionally c000).  As it's my understanding that the device with ID
c000 will be present in conjunction with either a device with ID 0001
or 0002.

Thanks, Roger.

