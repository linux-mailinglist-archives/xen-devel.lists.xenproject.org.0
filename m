Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA589E195A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847891.1262931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQDi-000438-34; Tue, 03 Dec 2024 10:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847891.1262931; Tue, 03 Dec 2024 10:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQDi-00040l-03; Tue, 03 Dec 2024 10:33:30 +0000
Received: by outflank-mailman (input) for mailman id 847891;
 Tue, 03 Dec 2024 10:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5n8R=S4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tIQDg-00040f-M0
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:33:28 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083b9076-b162-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 11:33:27 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa545dc7105so822429266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 02:33:27 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c2c44sm607854366b.29.2024.12.03.02.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 02:33:26 -0800 (PST)
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
X-Inumbo-ID: 083b9076-b162-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733222007; x=1733826807; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YyYtfOOLljpob3nWI63TVA0dLSLbyIvSyPKWxvhWjjc=;
        b=iZ7WUUhf/U/7vy/FC6+kS0CKJiHD2lSwZne3xhYvGKp0AL9jyFnbVktiOYzemY0ZZb
         wC+LFOerE7PHhBzHnla4m16pv2K+muVoNLJpDmVZmecG5aOQKvXxUqbEbGtj1F4FaNOv
         cb7zsWa0OdFb86591deVRR9e8RDaFjeN+ECxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222007; x=1733826807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YyYtfOOLljpob3nWI63TVA0dLSLbyIvSyPKWxvhWjjc=;
        b=GHD2rDoTaf/HigadJ+ZHyTifaGcM3dp1leuxvQdUGDmtpcYFgENQpJ7vWRDbclCAgN
         0BtXZqvBQ89LyLEbB3Eh5uZsQf1xUfcBPJKrPZb5SZYa9PrqRCEehlraqZ/1RIBPUHJT
         ErvWtN4pjxBdf/b6s7pn5Qieh7iIqfn9WL3C4faqdjRzMHAFeSSmSscPLDjZJHK9P5NT
         Y3Qn6tVno6rY8wPCl1xgA/d9kxiBgqW4WkbJD1vHsallAw7k+rN1s2Xb0uRX28tmSYY6
         3f1/6Myx2p8eAeiPdt6AYBwenK1Nc4sPaxGLb8xHFdQo+eayxmj0YvovjpdunwppI/+a
         Qerg==
X-Gm-Message-State: AOJu0YzjdeYTnGmSA2YU2IlptqSTWWwhZqW4DIARundxZIjLyyhl4UpZ
	+sH052Vo2s35wBBbCGd4licMPo2xLfMotFo4oq919eexvSruKTFzUHnzB0T0ZmIhAAEXm64Ieqa
	M
X-Gm-Gg: ASbGncutjVIAOCtqQ/K48Vr5O1XJqVOZTFil8LvezJ4xpV5EuBjJrAuoQlkrrYZDftd
	wtxKVSh9QqbNlKNxG9FFV0cYo9+mWF660+TioP1z/ZidPDKusE3BNmOrOXbtFW24IG2bb9AE1hh
	RsmCW5JSYnpweaO2BrLrIrfK6i8rH6e7MCU0DlLMC2tR9BdxD2YtBoCaY8DhYgUk7jhJ2hfHV1y
	lWtrFfY7nRTUZwpxO0rfP74n6q7JEshuQG/ya3vfdn9s4RUVDt66X8LJyE=
X-Google-Smtp-Source: AGHT+IHdMGhIdkiMGB1EYtSz6w1pCoc4vdzRf+9uVvw71l72PmoCb10pDlrXjOpxEJlRZ5XKvaf4rA==
X-Received: by 2002:a17:906:30cb:b0:aa5:297a:ac65 with SMTP id a640c23a62f3a-aa5f7d4ec91mr139169266b.19.1733222007144;
        Tue, 03 Dec 2024 02:33:27 -0800 (PST)
Date: Tue, 3 Dec 2024 11:33:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: Update to FreeBSD 14.2
Message-ID: <Z07eder0WbVFiVIU@macbook>
References: <20241203082658.134073-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203082658.134073-1-andrew.cooper3@citrix.com>

On Tue, Dec 03, 2024 at 08:26:58AM +0000, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

