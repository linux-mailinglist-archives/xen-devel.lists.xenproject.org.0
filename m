Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E58908BC3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 14:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740677.1147773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI67k-0004XC-QW; Fri, 14 Jun 2024 12:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740677.1147773; Fri, 14 Jun 2024 12:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI67k-0004UM-NR; Fri, 14 Jun 2024 12:33:44 +0000
Received: by outflank-mailman (input) for mailman id 740677;
 Fri, 14 Jun 2024 12:33:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HBj=NQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sI67j-0004UG-83
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 12:33:43 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b3ee53-2a4a-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 14:33:41 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-421eab59723so16761625e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 05:33:41 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286eef9c1sm97139085e9.7.2024.06.14.05.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 05:33:40 -0700 (PDT)
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
X-Inumbo-ID: 54b3ee53-2a4a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718368420; x=1718973220; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UY+0Q1cbhl8LMp+0qpAzN+wviM6VWHTtrc+iPGIfLN4=;
        b=R6CYcfDbGY0KvRJbRMJckYgE3giT9KnYQeZA06St2/lp9VEd7xyl9Hhbozv8GETWhB
         vwoguDPQMswfZw3rGHCw6holTYv4l386Ao0vWWqvIwOty5fQHpVPLAMZ5tt6QP+NQr13
         GDBdmuO3xDoiIDkMQcOV9pk39lO8s8j63dHXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718368420; x=1718973220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UY+0Q1cbhl8LMp+0qpAzN+wviM6VWHTtrc+iPGIfLN4=;
        b=CSve/9CRuWT5NKts52LYsJZgJBZ2lnj7lfOwXawJrMGPASlIaNzPzP/9E2YthS7qEn
         bRcMeWDVnvKUk3c7m2yzTH87vhNcudKBfisqXj9DQrdfQHzozFwZAmXVJa/r0W4zrnBa
         nb1OLMmgTc5tjS9gHZ9KvEoTMCFX19PpvXZL1kpsFiZ5Cq7CXi3Dx6NS+Y0FQuge4ueK
         x6XRo3JIQSn3UWxYuHq59+r8FnpzDBic23FuRb+PZ/QbGcEiSDwdeWceTYZSmtCc67Mb
         9gOluG0dF1boDtCHCOUWhi6GZXEeTRfb5cZKWQ5md9oRlNf5CNoG32tua23LHKaKwp0K
         Lgew==
X-Gm-Message-State: AOJu0YxCMpR0Qj2ljF44M+YVKO/MTNVJ95dFPBZq7n8NvV/qjlfAEJGl
	hltMm3LQZAbYSaSW2R4OlJWr3gmL+rBOzayWtl20y76Nn1ppFmdLVBg3+uZJ5xg=
X-Google-Smtp-Source: AGHT+IFjRVqm27N9vvYzPCnFKysglqKWN/tSaeY921zK7mrVIi+Me9jWpQHn/sicD+CHV0TqPyIWgw==
X-Received: by 2002:a05:600c:a09:b0:422:648d:bdf1 with SMTP id 5b1f17b1804b1-423048491aemr22330025e9.34.1718368420418;
        Fri, 14 Jun 2024 05:33:40 -0700 (PDT)
Date: Fri, 14 Jun 2024 14:33:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 0/3] x86/irq: fixes for CPU hot{,un}plug
Message-ID: <Zmw4ox1anCgbUTxs@macbook>
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <ZmvxBDomxxBjOYEK@macbook>
 <0aa934d9f4bdc8ebfa832aa56e2fe9659236441d.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0aa934d9f4bdc8ebfa832aa56e2fe9659236441d.camel@gmail.com>

On Fri, Jun 14, 2024 at 01:52:59PM +0200, Oleksii K. wrote:
> On Fri, 2024-06-14 at 09:28 +0200, Roger Pau Monné wrote:
> > Sorry, forgot to add the for-4.19 tag and Cc Oleksii.
> > 
> > Since we have taken the start of the series, we might as well take
> > the
> > remaining patches (if other x86 maintainers agree) and attempt to
> > hopefully fix all the interrupt issues with CPU hotplug/unplug.
> > 
> > FTR: there are further issues when doing CPU hotplug/unplug from a
> > PVH
> > dom0, but those are out of the scope for 4.19, as I haven't even
> > started to diagnose what's going on.
> And this issues were before the current patch series was introduced?

Sure, the issues with PVH dom0 cpu hotplug/unplug are additional to
the ones fixed here.

Thanks, Roger.

