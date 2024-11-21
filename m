Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09569D4B3E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841346.1256832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4zD-0001M5-71; Thu, 21 Nov 2024 11:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841346.1256832; Thu, 21 Nov 2024 11:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4zD-0001JC-4O; Thu, 21 Nov 2024 11:04:35 +0000
Received: by outflank-mailman (input) for mailman id 841346;
 Thu, 21 Nov 2024 11:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tE4zC-0001J6-9A
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:04:34 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60598ab0-a7f8-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 12:04:28 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cef772621eso1017214a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:04:28 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cff5fc4c81sm1669080a12.74.2024.11.21.03.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 03:04:27 -0800 (PST)
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
X-Inumbo-ID: 60598ab0-a7f8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYwNTk4YWIwLWE3ZjgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg3MDY4LjM2MTA3Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732187068; x=1732791868; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gKWTJKkOXf+hc7colOQ5XONjN0bpky/NtpvB9PGwIEI=;
        b=FUknSULt7ZF9wgVdxuQ79mX9VhdB2Zp+2n5kCqWNIH630f3uCL5bCcWIPaKZWdPSx6
         pf7apgJebxMtGBKT50cUcXO0i/cYfmGBx2Aj+0uHqhslGQ1jdbhymdNpU/Uf++V+l7QT
         Bp0rw5ATdpDMmxiK58xzJcJiv0KDIoxAOn4hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732187068; x=1732791868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKWTJKkOXf+hc7colOQ5XONjN0bpky/NtpvB9PGwIEI=;
        b=mXjAPIaUO3UrF2kXCBd1Psofd6vqpZxc1JhHasRROfsqVyfeM1CUAnHOqrhA+9uUM+
         cSuEwT4Lt8pq47LXO+QQr3QR2mQntPJaqB2KSaiIbl/DeFXwbf9/mL4MVIgOIe4JtZaQ
         yMHiFzqrMtj+4dupA98pIQL7K9KwmdrsRvrlE/OL6KfVksK9HF90VlFQGjctX0yhd4ja
         ew5c2VEVaqQk4HqJ+M8kSWxqPNDfTRK+oTBjUTefyDVHMdug5fz+v1Sk9F/hlJRQXb/F
         Dj15NNiMf+oKVTZKJbxDp6pSzL5rOdcd+o73TPklywLcsaGkOAchqmXS2EI8zllWBIdf
         zEKA==
X-Forwarded-Encrypted: i=1; AJvYcCWTV/L2CMUvYX2VahKDT/PcPQG4BS5emFtvB9fR48B+oPqA8lTmF9+9RWbhT1JiMxh80LXqtURQqxE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzv9eKaeRk2F30JGIgRWDyoNPBM9oka7lnW5yxgDuiEjEB5FMsh
	fcP1Kt+rh1ZJWair8bs+a/WKRZmI6nvlrPg9Ow+I3/3YMvOVZKtkhgkbVC9dklU=
X-Google-Smtp-Source: AGHT+IFkT9NNIPJqtMfmoLh8Zw23JSWyh4tss8meXHSfpoShQis73sWaRozMJSBRsqdOmpMvo1L0og==
X-Received: by 2002:a50:d79b:0:b0:5d0:a43:cf40 with SMTP id 4fb4d7f45d1cf-5d00a43d055mr1079044a12.4.1732187067759;
        Thu, 21 Nov 2024 03:04:27 -0800 (PST)
Date: Thu, 21 Nov 2024 12:04:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/irq: fix calculation of max PV dom0 pIRQs
Message-ID: <Zz8Tugu22NPzAQUo@macbook>
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-2-roger.pau@citrix.com>
 <b849f46d-501a-4083-aecd-fdf0c4319eda@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b849f46d-501a-4083-aecd-fdf0c4319eda@suse.com>

On Thu, Nov 21, 2024 at 11:49:44AM +0100, Jan Beulich wrote:
> On 20.11.2024 12:35, Roger Pau Monne wrote:
> > The current calculation of PV dom0 pIRQs uses:
> > 
> > n = min(fls(num_present_cpus()), dom0_max_vcpus());
> > 
> > The usage of fls() is wrong, as num_present_cpus() already returns the number
> > of present CPUs, not the bitmap mask of CPUs.
> 
> Hmm. Perhaps that use of fls() should have been accompanied by a comment, but
> I think it might have been put there intentionally, to avoid linear growth.
> Which isn't to say that I mind the adjustment, especially now that we don't
> use any clustered modes anymore for I/O interrupts. I'm merely questioning
> the Fixes: tag, and with that whether / how far to backport.

Hm, sorry I've assumed the fls() was a typo.  It seems wrong to cap
dom0 vCPUs with the fls of the present CPUs number.  For consistency,
if the intention was to use fls to limit growth, I would have expected
to also be applied to the dom0 number of vCPUs.  And a comment would
have been nice indeed :).

In any case this is hurting XenServer now: we got reports of pIRQ
exhaustion on some systems.

Thanks, Roger.

