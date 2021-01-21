Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38D2FED2B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72124.129565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bAk-0000bJ-1s; Thu, 21 Jan 2021 14:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72124.129565; Thu, 21 Jan 2021 14:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bAj-0000au-Uk; Thu, 21 Jan 2021 14:42:53 +0000
Received: by outflank-mailman (input) for mailman id 72124;
 Thu, 21 Jan 2021 14:42:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bAj-0000ap-4j
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 14:42:53 +0000
Received: from mail-wm1-f51.google.com (unknown [209.85.128.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5059f505-d4f6-4dab-966d-38cf2c1a11c8;
 Thu, 21 Jan 2021 14:42:52 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id s24so5081378wmj.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 06:42:52 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y24sm7928711wmi.47.2021.01.21.06.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 06:42:50 -0800 (PST)
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
X-Inumbo-ID: 5059f505-d4f6-4dab-966d-38cf2c1a11c8
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RoErxl0mV69MjGVurZepFvKKyeBAyqCyki9Fexhbxck=;
        b=XO7j5Vae6Nvlx/lnaAiSSksRsQmO5mOJj+7Er94A/oWm8VhDwJf/BoLISPBLFsCETE
         lLlA/e2y7na7D7Qo7WPlDMkBbXJ6Rd7z5EZtlwkUUtoYBFfB/CleL+D8ubuLRU6hGP1v
         +Wmb90oEFGkxO4skBtVTYtOM8GjmYVA+K3vF+7XFiZz1OkfXyJ+JDAYBUCIRyaFVRBH6
         4WT2VhbWtJ99jiNwVoMfNiKjYjvHXbN4VlL9g2i8huti4bkLiJmAoI1wbwdGzWeCHAUt
         8ICP9IABQ/1nCKPfpEXe7v0ARHNnB1SqJZ+6SvmXufFK2FLgZwGwP/kI6RSe503b80Cb
         NH/g==
X-Gm-Message-State: AOAM533AtQ07RRPb7610KsPA9Z97kU5rEC/RzHT9yr5aQGiUoOpwwHBA
	oAOKcRHZKI7d6zl2YJ76+e4=
X-Google-Smtp-Source: ABdhPJwuk1oeCOxJjMEeWz7FvjNauWPoXL3qz/AaJPhBED2YyltXaLdaRZqbvjGd9tAG/CgSOgkJ3A==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr8948271wmb.108.1611240171307;
        Thu, 21 Jan 2021 06:42:51 -0800 (PST)
Date: Thu, 21 Jan 2021 14:42:49 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 3/7] libxl: stop setting 'vdevfn' in pci_struct_fill()
Message-ID: <20210121144249.pjwikn7uccxbkqpy@liuwe-devbox-debian-v2>
References: <20210105174642.2754-1-paul@xen.org>
 <20210105174642.2754-4-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105174642.2754-4-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Jan 05, 2021 at 05:46:38PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> There are only two call-sites. One always sets it to 0 (which is unnecessary
> as the structure is already initialized to zero) and the other can simply set
> the 'vdevfn' field directly (after proper structure initialization), avoiding
> the need for a local variable.
> 
> A subsequent patch will also make use of pci_struct_fill() in a context
> where 'vdevfn' may already have been set.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

