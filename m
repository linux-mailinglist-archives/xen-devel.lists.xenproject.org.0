Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC32913525
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 18:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745889.1152933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sL3mi-0005RJ-W3; Sat, 22 Jun 2024 16:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745889.1152933; Sat, 22 Jun 2024 16:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sL3mi-0005Pn-T9; Sat, 22 Jun 2024 16:40:16 +0000
Received: by outflank-mailman (input) for mailman id 745889;
 Sat, 22 Jun 2024 16:40:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Zwp=NY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1sL3mh-0005Ph-DQ
 for xen-devel@lists.xenproject.org; Sat, 22 Jun 2024 16:40:15 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17f12dec-30b6-11ef-b4bb-af5377834399;
 Sat, 22 Jun 2024 18:40:11 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57d07673185so2821067a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 22 Jun 2024 09:40:11 -0700 (PDT)
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
X-Inumbo-ID: 17f12dec-30b6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719074411; x=1719679211; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5K/9DHneEBGpiQrfpPObWq9/9aSOcT/XXUeMIfFd2Hw=;
        b=lx4tHvb01HfXkZZI1CRQXXCQ1/kUOkj9ikC4XnyGIov2Ro9FL6LTXIDCMtLAh/zz5b
         2UT6UWeuGeHbPXGeGcU2nqwi7lcJGeBT2JYzLGRb5OlGMclKx3vH1UVLhfs+K/Y1NvUb
         kP/lPuS/8xMSVt5hVyqCAmk2ZF48LstPz1YVny+SOjr7BFMsCBkV/GnC/vgTJbwqbkWH
         sUL2DG9LXPGAUgJmevSHKzwfw7fMcKd6yC9a6ZojPT0LMhRNaZBwtMKLpeEO+rqRy8y8
         HxMlm7DRkA7k2HlKfaoM3qad5sy6lPZjT9yJejEBRjq2Jpq2j0w4CpT7UUHBC8GV95Gd
         F2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719074411; x=1719679211;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5K/9DHneEBGpiQrfpPObWq9/9aSOcT/XXUeMIfFd2Hw=;
        b=k8fcWWXnYTmbWE1jXvWRRKxN0W04spjqnJj7Rlj+t4H57o2Pu3il993ePx1EEXbe53
         SrTbCFWJZ/UibYW3C56SImXEiZspGQS/oPhrWewppuIEOxj2P00rbi+EFFiwKdEZ6qsP
         tEZLBYky5uLxnxDiHaP+VjL13eZ2e2tsWLQHVP7j1vc+deQ/Ms7nhfYJfSPYAPQzBDtp
         9UoNxNyglheE7aSWgZylt2GFSA2C6s6fTudE1wsGhaULhT+5XxlDhcltXR5pBnzbomIT
         ZTVqnVxNyTO16lroB3tpKnxDKIkNDsPVnzIPHqBwg8il24F/QNTI+KmA1Csowe+uf3xr
         wIzA==
X-Gm-Message-State: AOJu0Yz+Cb4hNSyxlGqrJeAAqLm2cJNO4CeCvhgq8GrIJUoGGLNLGUMC
	9Wx0QQ9/pFTrTefhMZXml4XTU7qzO3MF0RR2Mo0wHZI6bZN1pmOGWAI7bf7kbDpinSdq5nCL9IY
	iadwXEgT7NvEO7sZ3erKTCzOGO1KvSC9U
X-Google-Smtp-Source: AGHT+IHOimMf5G6fqS/qCMY8X/4XtbFwx6kGOlAk2aNg3BtmbGgm+0D8gIDvxzYYIbqQcQjLbR6p+VubA2YAdCgLw3s=
X-Received: by 2002:a50:9f42:0:b0:57c:5503:940b with SMTP id
 4fb4d7f45d1cf-57d4a28175cmr524372a12.15.1719074410476; Sat, 22 Jun 2024
 09:40:10 -0700 (PDT)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 22 Jun 2024 12:39:58 -0400
Message-ID: <CAKf6xptZay+suSB4Kf2jutt_W_KFqM1_grND=hQv1Rids7srpQ@mail.gmail.com>
Subject: Xen vkb uevent/modalias fix (Debian installer bug)
To: xen-devel <xen-devel@lists.xenproject.org>, 983357@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"

Hi,

A commit to address the Xen virtual keyboard large uevent/modalias
failure has been merged into upstream linux for the upcoming 6.10
release:
https://git.kernel.org/torvalds/c/0774d19038c496f0c3602fb505c43e1b2d8eed85

This should address https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=983357
and https://github.com/systemd/systemd/issues/22944

It has already been backported to these stable releases:
6.9.3
6.8.12
6.6.33
6.1.95

It is queued for these future releases (assuming number holds):
5.15.162
5.10.221
5.4.279
4.19.317

Regards,
Jason

