Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78692CFFBE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 19:23:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHtBE-0006OY-1h; Tue, 08 Oct 2019 17:21:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B2Bu=YB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iHtBC-0006OT-FR
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 17:21:46 +0000
X-Inumbo-ID: 1a23b33a-e9f0-11e9-9bee-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a23b33a-e9f0-11e9-9bee-bc764e2007e4;
 Tue, 08 Oct 2019 17:21:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a22so18439177ljd.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2019 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9qSMStuBzZYi/FfBTuQ0+pduW4/vs3F2BzlqVFFQg6A=;
 b=UXLdT5FvZ9M2AuB61Xee5I6ILXiq5+w0TSxw/POmdiJvDhqYuJXgpbvGX16G/4Qtey
 9RFSP/yHL/iiPRXoFvJpYz1bZxe9n9XRhYUxIwqlEu2Y4i+hki30tST+lnAtiooATjs0
 vb9ZuGU2O1iQtPkovc+CKKjhuNdKiqzNWEdEdKzXvvEHysYcoHIgdxgGYLHeuRXQ01BV
 Le2his4GglAls5XsgyTryNG8zRKHS1Hl5rveGh88Hly0h0umiVjQl05nZr4+FS41NrOs
 isQdAExgyyjB07wcWjDfY2RBBZBjNF2O/LiDX+5dPO1+8Xnc7o4vLJo1NzxAZiQIBcSQ
 rU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9qSMStuBzZYi/FfBTuQ0+pduW4/vs3F2BzlqVFFQg6A=;
 b=ojwRQ9qU2/m2TQPNb+uT+RwWRWDm/8v7LrvoN9K33bGPmDeVmcMdv1+MVd+3yX61yN
 Dq23dgzbb2D9KU1GL4W7kfVWQ91kvovKPT5sQT9Y4eNhLimFhMka0K2JTU2frOu5efmU
 eRB5WuBnGN9AXNvrVhj6mU4H0641mo4PdX0bV4XmaZFtJlejSWnD7zZros+1lls1FkVB
 Y4oSDQE8i+ul2sa1rkXbKGJhW5dWZfMdDM5uth6bKPkhBEBNHFWzCKMbtpKp9xO2pj21
 Lv4ZrS8FHDTzbzcwp1qQwfuLM/pW2QEu/DSXOqRlSMw21csZzC/yFP7uBzNaCOmsXlA1
 Vsjg==
X-Gm-Message-State: APjAAAUbntyEhQ0zsGpAt3Jzlfd6ao+VUnhEK8BIh0a4BG0PRwwQXNyw
 SmmUcLPBEGd8oIX6bYdFC0c=
X-Google-Smtp-Source: APXvYqyur5YxXvByb1tIig4dGVZM+bAfmeFjR2tF4T7x9n6XrM09FelDr6OFps6Dp1PvcdwjK7CpZg==
X-Received: by 2002:a05:651c:1127:: with SMTP id
 e7mr2618986ljo.186.1570555304654; 
 Tue, 08 Oct 2019 10:21:44 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id d28sm3910330lfq.88.2019.10.08.10.21.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 10:21:44 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <1569839671-772-1-git-send-email-olekstysh@gmail.com>
 <49a1c980-6e2c-5dcf-f17e-64b6432a8ea3@suse.com>
 <17cf0fd0-8a54-41fe-9372-e52e9e7cbb4d@gmail.com>
Message-ID: <99817215-4bec-0b44-d0f2-1691f533f842@gmail.com>
Date: Tue, 8 Oct 2019 20:21:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <17cf0fd0-8a54-41fe-9372-e52e9e7cbb4d@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for Xen 4.13] iommu/arm: Remove
 arch_iommu_populate_page_table() completely
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 paul.durrant@citrix.com, volodymyr_babchuk@epam.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLCBhbGwKCgpHZW50bGUgcmVtaW5kZXIuLi4KCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5
c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
