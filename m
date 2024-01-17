Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F50F830665
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 13:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668456.1040683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ5Vq-0004no-Be; Wed, 17 Jan 2024 12:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668456.1040683; Wed, 17 Jan 2024 12:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ5Vq-0004kc-8S; Wed, 17 Jan 2024 12:59:22 +0000
Received: by outflank-mailman (input) for mailman id 668456;
 Wed, 17 Jan 2024 12:59:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKNn=I3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQ5Vp-0004kW-4p
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 12:59:21 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a9df651-b538-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 13:59:20 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e8cc3b738so2898755e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 04:59:20 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 e9-20020a05600c4e4900b0040e8c7b9411sm1179783wmq.19.2024.01.17.04.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 04:59:19 -0800 (PST)
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
X-Inumbo-ID: 3a9df651-b538-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705496360; x=1706101160; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTX1eUiRR4nspm5GZvpKIOvCezwaO1Tg0E+Cg+Y2+2E=;
        b=GjO5nVs5BqeQfkdR7sOReqWhzO54jpxwhQR2N+9eN3XaabKMq9Ur03Hh82GbGum1+v
         S6XYTCnRqbFMr2WptWeUJqekQ4OhBkkn/hqfpALneZQierPCUqdauLBpJ78p5486qv/L
         aNIjMZ8vAXIu+gF3//2uBWCw+v+3XMqWc70QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705496360; x=1706101160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTX1eUiRR4nspm5GZvpKIOvCezwaO1Tg0E+Cg+Y2+2E=;
        b=XmVlapDGsbhL4k1/uUAGQbOsrvqrquqZ3u4YNMBfsZzeDgfXLlFzeuZvHCmWLUBcK4
         XGCgK6AjgTGlVtIV28WxmsVsqKf7md8eJXSSK3p46uJezOZNEKJfARLgsNOt2gdEOv3Q
         cNJ1R6Zb/wXs4ENtfgthThS+0MB/7lsHFZUEgcxZZkQlez+AWhqmzraIDbMVQ/EqtwiM
         vJ1IV2N7kYafIJ/lm2OQVj2KVX6cWKwhin6O13a6OY2oJPu7OBudN7vJh70S1W3nC0Jp
         k4DcRz+0e9zqd+rdzkXhMoGNZxLr6mI5w/OlXwAjM8Z/+0hSoMreDg36K/7mMa2P89tE
         PcdQ==
X-Gm-Message-State: AOJu0YyFLYZ31c1bZadlPQfbChUQcM1HEQNlrXRqCY4nkJ7Vii59mzaE
	ihyEnhl65A5B/E7kJKy5TcZSx1GIIXvtDA==
X-Google-Smtp-Source: AGHT+IHKV+dSIdDNOW01n9+iRO8tbH08k3OgdudI647JE0YVzuS48lfht/LjeCM2qk14JTp5fpuSVQ==
X-Received: by 2002:a05:600c:1f09:b0:40e:6182:43ca with SMTP id bd9-20020a05600c1f0900b0040e618243camr5464292wmb.127.1705496359737;
        Wed, 17 Jan 2024 04:59:19 -0800 (PST)
Date: Wed, 17 Jan 2024 13:59:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <ZafPJvsIarRdy6BH@macbook>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <ZafC3apB4rjFUOXP@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZafC3apB4rjFUOXP@mail-itl>

On Wed, Jan 17, 2024 at 01:06:53PM +0100, Marek Marczykowski-Górecki wrote:
> On Tue, Jan 16, 2024 at 10:33:26AM +0100, Jan Beulich wrote:
> > ... as per
> > 
> > (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4a00000
> > 
> > there's an overlap with not exactly a hole, but with an
> > EfiACPIMemoryNVS region:
> > 
> > (XEN)  0000000100000-0000003159fff type=2 attr=000000000000000f
> > (XEN)  000000315a000-0000003ffffff type=7 attr=000000000000000f
> > (XEN)  0000004000000-0000004045fff type=10 attr=000000000000000f
> > (XEN)  0000004046000-0000009afefff type=7 attr=000000000000000f
> > 
> > (the 3rd of the 4 lines). Considering there's another region higher
> > up:
> > 
> > (XEN)  00000a747f000-00000a947efff type=10 attr=000000000000000f
> > 
> > I'm inclined to say it is poor firmware (or, far less likely, boot
> > loader) behavior to clobber a rather low and entirely arbitrary RAM
> > range, rather than consolidating all such regions near the top of
> > RAM below 4Gb.
> 
> FWIW, we have two more similar reports, with different motherboards and
> firmware versions, but the common factor is Threadripper CPU. It doesn't
> exclude firmware issue (it can be an issue in some common template, like
> edk2?), but makes it a bit less likely.
> 
> > There are further such odd regions, btw:
> > 
> > (XEN)  0000009aff000-0000009ffffff type=0 attr=000000000000000f
> > ...
> > (XEN)  000000b000000-000000b020fff type=0 attr=000000000000000f
> > 
> > If the kernel image was sufficiently much larger, these could become
> > a problem as well. Otoh if the kernel wasn't built with
> > CONFIG_PHYSICAL_START=0x1000000, i.e. to start at 16Mb, but at, say,
> > 2Mb, things should apparently work even with this unusual memory
> > layout (until the kernel would grow enough to again run into that
> > very region).
> 
> Shouldn't CONFIG_RELOCATABLE=y take care of this?

No, because PV doesn't use the native entry point.

> At least in the case
> of Qubes OS, it's enabled and the issue still happens.

I think for PV it should be possible to workaround this in Linux
itself, maybe by changing the pfn -> mfn relations of the kernel
area?

Those overlaps are not real, as the loaded kernel is scattered across
mfns, and those certainly belong to RAM regions in the memory map.

For PVH it's going to require some changes in Xen itself.

Roger.

