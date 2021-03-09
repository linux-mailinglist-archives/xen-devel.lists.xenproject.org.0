Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B65332EE7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 20:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95725.180707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJhv6-0006Ro-6e; Tue, 09 Mar 2021 19:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95725.180707; Tue, 09 Mar 2021 19:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJhv6-0006RP-2x; Tue, 09 Mar 2021 19:21:28 +0000
Received: by outflank-mailman (input) for mailman id 95725;
 Tue, 09 Mar 2021 19:21:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rN=IH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lJhv4-0006RK-7U
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 19:21:26 +0000
Received: from mail-wm1-f49.google.com (unknown [209.85.128.49])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95461b36-423c-4b1c-895f-93714183a77a;
 Tue, 09 Mar 2021 19:21:25 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id w7so3366944wmb.5
 for <xen-devel@lists.xenproject.org>; Tue, 09 Mar 2021 11:21:25 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g16sm26083731wrs.76.2021.03.09.11.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:21:23 -0800 (PST)
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
X-Inumbo-ID: 95461b36-423c-4b1c-895f-93714183a77a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XaUbM1s2vULgWR55ZOqlUQD6eY53ou7f9+9PCI2clD0=;
        b=ZHIIVrUQf2bDXpWpCAevymRkHkukVyHQQqkhkKjhy3fBtVSXsNxnvsDmngxd3F5lOO
         d9b4OHSbLS9uuF6HsmYLCSJ6m6a5MKKqgo3h6OiXsOYhU6lfQ1QEJSWGQEv7ZzPe6oca
         89ADJcm6EMy+qoHS7YoAsfR/gK/OO9EBs1AW/d9pWr17L17CY2gt6byOooGo0VDqEWfd
         ys+lM9CSuJuvumOH/+GTkV6Ne+2TkS2Ua1tvWolwmujBrHIM8L7a+nfg1zpYC6D7fVbH
         URijszW118kr8hBFPDdUJnSa3Z9Qds/yzNfYK2R668X1r1F+tmbgGLIP3S82gmihTz1H
         i2Vg==
X-Gm-Message-State: AOAM530pFuQLXgP6/r+586o2bQs5IxGbV4SOnihEo6mJcvmg+lRDZGRu
	p2ONkPqZ93p+ye1XZ1ot/6qMqD6GMX8=
X-Google-Smtp-Source: ABdhPJybj8KVxHc9eoBHXJBS0OedLKzYeOSpv/dZeMyzxEWyGSuCpemgUjxj7vfSrjCeOmGypsIZmQ==
X-Received: by 2002:a05:600c:4f55:: with SMTP id m21mr5688867wmq.11.1615317684275;
        Tue, 09 Mar 2021 11:21:24 -0800 (PST)
Date: Tue, 9 Mar 2021 19:21:22 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Message-ID: <20210309192122.ym7xwduz4ddauks5@liuwe-devbox-debian-v2>
References: <20210225122940.9310-1-andyhsu@amazon.com>
 <CEC939E8-3F18-46A0-B7B6-ECBE97678DAC@amazon.com>
 <33c5f0f0-0e6e-a42c-46a5-405000715c1c@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33c5f0f0-0e6e-a42c-46a5-405000715c1c@xen.org>

On Tue, Mar 09, 2021 at 02:34:56PM +0000, Paul Durrant wrote:
> On 09/03/2021 14:10, Hsu, Chiahao wrote:
> > ﻿On 25.02.21, 13:29, "Hsu, Chiahao" <andyhsu@amazon.com> wrote:
> > 
> >      In order to support live migration of guests between kernels
> >      that do and do not support 'feature-ctrl-ring', we add a
> >      module parameter that allows the feature to be disabled
> >      at run time, instead of using hardcode value.
> >      The default value is enable.
> > 
> >      Signed-off-by: ChiaHao Hsu <andyhsu@amazon.com>
> 
> You should directly CC maintainers, and also I don't see netdev in the To
> list... Did you send it there? I suspect not, since I don't see 'net-next'
> in the prefix.

I think it would be better to resend this series.

See Documentation/networking/netdev-FAQ.rst.

Wei.

> 
>   Paul

