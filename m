Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AE3AD3DFB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 17:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011089.1389404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1JY-00062V-Lo; Tue, 10 Jun 2025 15:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011089.1389404; Tue, 10 Jun 2025 15:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1JY-00060D-JD; Tue, 10 Jun 2025 15:55:04 +0000
Received: by outflank-mailman (input) for mailman id 1011089;
 Tue, 10 Jun 2025 15:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnHp=YZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uP1JW-000606-VC
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 15:55:02 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4400e071-4613-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 17:55:00 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-450cf214200so52458055e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:55:00 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45306f76ab3sm97444285e9.14.2025.06.10.08.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 08:54:59 -0700 (PDT)
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
X-Inumbo-ID: 4400e071-4613-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749570900; x=1750175700; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8m9YJLg+99E6gsjvnhPs/q0c77TaqWDCxuVDceHeKE=;
        b=BS7ZLxamJYgG0bwk2Y3dweoePcpg7UzpK8YoLNUPiTmQIhF78++y5cin+fuIONCA3k
         On/ZaNNnYWmZ8ijt/f14qLjAAHbMuf0v3mD76oHix/3b+qLrXTDwH9YH5uJhp4PDl7Uz
         8qQXyvD2KCTDbN6gfwOy9QgsaSkD9j7pFsYjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570900; x=1750175700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8m9YJLg+99E6gsjvnhPs/q0c77TaqWDCxuVDceHeKE=;
        b=icNDnJWHEDwvYxSlO9A6tYWqOzAIkpdOyDBq1xFi7yk+LxLPorAb8oZrncFd4wVN4a
         zcyK+/YUU8Yz3Q/l0KyEgfsKVJeQBWahwxU6ec/qbI65qlF91EHEnmfC/PcnfZmNzhis
         cJZHWYjtMDOrOktu9Z4FC25rX6aqq7v4UoLChYCAcISVpZG3FWOBkz9+Eftw3PNcPP0n
         XFVscE0qp1yMpeGVk9T4KNYCJWcU2A2rStLAa7qveOdAqdVIpZ9qOiyFcT617bmSh3+k
         PDokhTxRIPCa33RZA6u4UiDks2av8QQszt7i/NA2GFiuDXrSZtnAmCb68v95s3uRJ3Vj
         mEIA==
X-Gm-Message-State: AOJu0YzTitBRCGiNITU7q9NJnWbEvvRN4otq9T563DyuZLTk6sEtSBpJ
	9G8Lh5MO5y2Agk1bYtPTmvS6vC8DR06FOELA9fF0prksR6jk1RiqjtizMrWT6j7EsTY=
X-Gm-Gg: ASbGnct0H7KLDrrkLw6qgOllE3RmC9zaLr0pCV4r9ZJrmiFVjm6hVY7sANjHPR2Yab1
	HzU7S7iaSMDEp+GHFS+S3jUdd1VOFlADznzZFD9toWhHQXrpWn/zhgkT+m+bwX4BGaU2Ebngs37
	+8C2+AirDEz1eLj4DNgoKy812C+rv3i7hO3Qq98y8GF+Xs11XKxPj90sd3XT3GXceZEmEubAGDx
	hNgVxv9xXE/ekIPZIO7Lnl2ReSR9TZMjVEi3JIali2QdIGl1jRrevF0xcMoiTsu3TB+JhV9cV0r
	bBnZs+S0BEiwFWo3vydWXkGK10NxpV00bn91+rRoA11JynmzZJh5QS0D3UkvrAwjBuT3Btih7cl
	427W66C/oj7dtOjHpndgyIrTfMqC7PRuZSGs=
X-Google-Smtp-Source: AGHT+IHX3fZh8SXwWc9Rzzj68Tf1HCvap96gRTGbYg+Qk6rPEuVjdfRx5txUzADQwvYxF2QaY/+2wQ==
X-Received: by 2002:a05:600c:528a:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4530efe68f4mr89593305e9.12.1749570900294;
        Tue, 10 Jun 2025 08:55:00 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:54:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/HVM: restrict use of pinned cache attributes as
 well as associated flushing
Message-ID: <aEhVU3ZsJrBxRyZf@macbook.local>
References: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>
 <aEa5J_TlSAdS9-m_@macbook.local>
 <6e9e84eb-f98b-4c06-8952-03aecc82c0ea@suse.com>
 <aEgMe1i4Rpmnz8M9@macbook.local>
 <5f8d694f-e712-4869-879f-80b2c4907a45@suse.com>
 <aEgyAaHxC-Um1pNj@macbook.local>
 <3470dcc8-f08a-4a00-8760-b3564d78e638@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3470dcc8-f08a-4a00-8760-b3564d78e638@suse.com>

On Tue, Jun 10, 2025 at 04:13:40PM +0200, Jan Beulich wrote:
> On 10.06.2025 15:24, Roger Pau Monné wrote:
> > IMO the added complexity here is not worth the performance
> > improvement, not without a clear justification that it's needed.
> 
> Well, okay, I'll simply consider the patch in this shape rejected then.
> I don't see much value in wasting further time on it.

The code is already there, so I think there's value in this patch.
Did you see my suggestion in the email yo uare replying to about not
needing to add the is_iommu_enabled(d) || cache_flush_permitted(d)
checks?

With that dropped (if it's indeed OK), I would be fine with Acking the
patch.

Thanks, Roger.

