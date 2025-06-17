Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E111DADC36A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 09:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017854.1394858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQps-0003Ib-9s; Tue, 17 Jun 2025 07:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017854.1394858; Tue, 17 Jun 2025 07:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQps-0003HZ-5b; Tue, 17 Jun 2025 07:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1017854;
 Tue, 17 Jun 2025 07:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VPhx=ZA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRQpq-00031F-Rh
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 07:34:22 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c46ec44-4b4d-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 09:34:21 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so3652449f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 00:34:22 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a57b15015fsm7488323f8f.95.2025.06.17.00.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 00:34:21 -0700 (PDT)
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
X-Inumbo-ID: 7c46ec44-4b4d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750145662; x=1750750462; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/lgz/gActmKMq+HBrVyBXjFkXG0GLK33eVDEVDlgvc=;
        b=rNpsD5KUv3sN+C5s2xKwox3zpzjSvAeatXKvAN3PqBSh2l7aCoIzX0tEN/A8SqhaYq
         LjNX2MC7btAVHRo2/RuJj68efnt0GyekaebFSfFQSmFILfh7bvOHFJmHHgw6+a8IDtuc
         7RcpOAvY6vUo9jftrvXLUgBGa2SJU9cCRI4uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750145662; x=1750750462;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/lgz/gActmKMq+HBrVyBXjFkXG0GLK33eVDEVDlgvc=;
        b=Gk/xvKa/BmUgnx8x3dUOkTsur88C1LoNT1Xo4ONGgNowVAwH34AS2BpNQU8yroAxnR
         h+ZkmU3rrNiHpurGQSJ5O8TQnoWzZr8xvfjKQTRnf8XhVtBoo2reXxgi27G5BMrsC/JO
         qGO6Xrtt+JdhMl6vQUCFqMXdKCezCPc7J/8NMR5UG3MG8+ALobZG76sApdCxMP7Ilfy0
         hog1vHarEw5BpXBz4kwExfmrw420iR6TXFmKPsQc85s+cpuxizsgHtnGj3ofI7OvBy0L
         s9w7hPbnJUrzxHuCsAixYX6RhAlPWRba0jEDiO9kbSrFiGDvKXyQVqPcSC1aazrzbAzE
         xr9A==
X-Gm-Message-State: AOJu0Yy9RU2wUkPVhzOLjFZN2UTCNEUQIn6StFxflRIF3IcndXs2yJwr
	go2tXXQEwGwOORPcFVLTadgkeDaFvNWP7VRHHrjA50UKZ2JOC/XivyVXWoTq8Zt1F1U=
X-Gm-Gg: ASbGnctbQSy3ea6d92B71hJuVpDAZyW8Y8wbrkC1dbqgE9A0ze850SKsF5u+wC8UEFv
	shq8sWTLmxjOFXsnX9m+6KBln+zjV19rfQCJ/nOhixA+dytdWaC0yis3yBiwAtHv9ORNKHLKVmt
	OFBXNQ8ULi2/QkcjWeZOvrJSFsYbCo7U0WCZKopE/ZQnqU7EjpJIxLPzRRC2XqYYlDAQ4Gx6lMj
	puNLFnHKMGUGBhSc15pN6jNs+WNWL5bVLnT/7QI1dH5lq6/NKhCQ28XR60ZeJHQ+v039HXd4Dlm
	PnriRSGS1nmd42LlXIixPmC1lt6hqFxwFntc93bxq8pTCYZQOFN7EPVs5WTb7w1QqlfVTs7aY8T
	xfQy5eFcosA31j4/KDUzPvpKiJkxenQ==
X-Google-Smtp-Source: AGHT+IGW3YfSmdFOQsnAznjxQYSOz95paO7wFu72AY1IIpRokbzL1fJO2xkHmoQzrvs7ZUEBMur8zg==
X-Received: by 2002:a05:6000:288a:b0:3a5:3a3b:6a3a with SMTP id ffacd0b85a97d-3a572e5856amr9878648f8f.54.1750145661536;
        Tue, 17 Jun 2025 00:34:21 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:34:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] x86/HVM: restrict use of pinned cache attributes as
 well as associated flushing
Message-ID: <aFEafHmL7Bn8iNz9@macbook.local>
References: <35ba8ca3-ed00-491e-a782-2974597cfdb3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35ba8ca3-ed00-491e-a782-2974597cfdb3@suse.com>

On Wed, Jun 11, 2025 at 12:19:30PM +0200, Jan Beulich wrote:
> We don't permit use of uncachable memory types elsewhere unless a domain
> meets certain criteria. Enforce this also during registration of pinned
> cache attribute ranges.
> 
> Furthermore restrict cache flushing to just
> - registration of uncachable ranges,
> - de-registration of cachable ranges.
> 
> While there, also (mainly by calling memory_type_changed())
> - take CPU self-snoop as well as IOMMU snoop into account (albeit the
>   latter still is a global property rather than a per-domain one),
> - avoid flushes when the domain isn't running yet (which ought to be the
>   common case).
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

