Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B5AFEB58
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 16:10:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038261.1410745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVV1-0001HB-Pi; Wed, 09 Jul 2025 14:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038261.1410745; Wed, 09 Jul 2025 14:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVV1-0001EW-Mw; Wed, 09 Jul 2025 14:10:15 +0000
Received: by outflank-mailman (input) for mailman id 1038261;
 Wed, 09 Jul 2025 14:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4lF=ZW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uZVV0-0001EQ-FK
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 14:10:14 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bb6efeb-5cce-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 16:10:09 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so31250925e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 07:10:09 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b471b97f10sm16197047f8f.57.2025.07.09.07.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 07:10:07 -0700 (PDT)
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
X-Inumbo-ID: 6bb6efeb-5cce-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752070208; x=1752675008; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7yxZDft27QlncaD7+P3N/keVUbjJ4aYtGZEt6XX0uQ=;
        b=DhpCFGKsfC5UwlRKCEXhGz7vFYu/ZCg4Kl42N8y75ihNP6zN15QNYsQImNk7hn05XE
         G6QBlURh6Qo39mLMl4cZ3dRCCAK3xFNy9eU1vdsW+JN2F+SaHN1N5HtUKDErXVjFGbZ4
         s9UMCDtyf64YglAxpuJyfCVzAUxfMnk1byPsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070208; x=1752675008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7yxZDft27QlncaD7+P3N/keVUbjJ4aYtGZEt6XX0uQ=;
        b=XciMtp3mOlvKvxPeeIwq2PP93dgfxwWjn0S2HZz6Dv9nXE3qGSisjrpMOeYCOD/QUZ
         rYuDMDQc/uapkOu7J35aJPIoQx15EGH7CuLgR6Csq49Msgs5BNnWvxbK8ot9sXMlo62k
         ZvQHGjrnkar09TJpa47gJJIiUWTZiwZJq89gzXQUaFDr3dQRsj4aHpe24DvpSTT7zvj1
         CrGU2CeI8t2SOtgvgzFBUpXJjuB/Ds1ciG/RuXIwh4znh79ij/XYKUEClJtwGJcG3OPM
         Y/ZjQaRG2YYeFnW6T/KcKZGc4/ywsdRByxIBZ9Rkbh1wV+MINBS3UFeZq1lOOcwYEoL0
         nCYw==
X-Forwarded-Encrypted: i=1; AJvYcCVQVQlCU9WXTDnSfUmOLXo20co4eNS3+f5vAvEKPd7uXFJ9E9xfXCEDtDM6rMGH47uFlrDJBdCdmDs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiP4PJWALe+U5PYB/iKgRKNSG+MNCn6xqJWX96yWuATtytCStW
	W2fNAH1c87i8IgUE7WF0iu9t1INa+jErxU1U51/rinU5EbQIzHwYLZFWCxMC1liDFIE=
X-Gm-Gg: ASbGncsERX0t+hFAQ+1bKijjQL6jgJ6ZmZpbbYHm3dS1eHnVAJhiiBTjHO906uYfGTQ
	yoWy7KwySvRaLB8QxcHTPKFHpMVYJnns+crZANoJwmEAMfQMd7cK+PLKUn76zYLJIXnuNbrgicO
	lUNyJxWav+DrljyOGLxiKvg4M6wP1uTiE5svB54ozOapy+ZiuL9aqF2bPui2cJ0ypYpQpyaD1bW
	5QNOJY9JPqc66tsEUtjklUpn/oa6/J5H6JAcBwqcHVGWP139TXFaGjz8mAEBaDcpeS59Chycjmn
	L5i8xpX3rtrZ/MYL6RxTT/qpIs5eT06C4iguS/OOz5og5XIWjzuYwdyfvEe8VUXVEwX/2yCI1Ot
	tjIdjbcrPoY/M314s9EOh1cNVwOAaVQ==
X-Google-Smtp-Source: AGHT+IGcitIGKoC0BnoNzpGDy7AjpMmGrS+3HXAfg/CZRGEVv8EHnN5UPWimvopBsnxJfgX7/S+99w==
X-Received: by 2002:a05:600c:450e:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-454d53260demr26494555e9.12.1752070208399;
        Wed, 09 Jul 2025 07:10:08 -0700 (PDT)
Date: Wed, 9 Jul 2025 16:10:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
	alejandro.garciavallejo@amd.com, Jason.Andryuk@amd.com
Subject: Re: [PATCH 0/2] Xen real-time x86
Message-ID: <aG54PiX4hzIAfYA6@macbook.local>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
 <aGzu4A_nk3dAScxt@macbook.local>
 <6d283128-4aaf-4f52-8e96-7a4ebe292be3@suse.com>
 <alpine.DEB.2.22.394.2507081000490.605088@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2507081000490.605088@ubuntu-linux-20-04-desktop>

On Tue, Jul 08, 2025 at 10:11:18AM -0700, Stefano Stabellini wrote:
> On Tue, 8 Jul 2025, Jan Beulich wrote:
> > On 08.07.2025 12:11, Roger Pau Monné wrote:
> > > On Mon, Jul 07, 2025 at 05:06:53PM -0700, Stefano Stabellini wrote:
> > >  Interrupt forwarding
> > > from Xen into HVM/PVH guests uses a softirq to do the injection, which
> > > means there's a non-deterministic window of latency between when the
> > > interrupt is received by Xen, as to when it's injected to the guest,
> > > because the softirq might not get processed right after being set as
> > > pending (there might be other softirqs to process, or simply Xen might
> > > be busy doing some other operation).
> > > 
> > > I think you want to look into adding a new command line option or
> > > similar, that allows selecting whether guest IRQs are deferred to a
> > > softirq for injection, or are injected as part of the processing done
> > > in the IRQ handler itself.
> > > 
> > > Otherwise there will always be a non-deterministic amount of latency
> > > on x86 w.r.t. HVM/PVH passthrough guest interrupts.  Haven't you seen
> > > some weird/unexpected variance when doing this passthrough interrupt
> > > latency measurements on x86?
> 
> While this is not great and I agree with Roger that it should be
> improved (I'll try to do so), in a well configured system I expect that
> there should be no other softirqs on the RTOS vCPU/pCPU so it shouldn't
> matter much if it is raise as a softirq or not?

Possibly - if the physical CPU where the interrupt is injected is also
the one where the target vCPU is running it won't make much of a
difference whether injection to the guest is deferred to a softirq, as
softirqs must always be processed before returning to guest context.

So I would think that when using the interrupt-follows-vCPU Xen model,
where interrupts are moved around to follow the vCPUs they target,
this extra latency would only be seen when the interrupt is delivered
to a CPU different than the one where the target guest vCPU is
running, which is never in your scenario because you pin vCPUs.

Roger.

