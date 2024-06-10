Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFA90219E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 14:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737271.1143492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGe8c-0006oD-Ox; Mon, 10 Jun 2024 12:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737271.1143492; Mon, 10 Jun 2024 12:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGe8c-0006lm-MF; Mon, 10 Jun 2024 12:28:38 +0000
Received: by outflank-mailman (input) for mailman id 737271;
 Mon, 10 Jun 2024 12:28:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGe8c-0006lg-26
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 12:28:38 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f589862a-2724-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 14:28:37 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2506fc3a6cfso2092772fac.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 05:28:37 -0700 (PDT)
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
X-Inumbo-ID: f589862a-2724-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718022516; x=1718627316; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XZpFk7tj5vBU7kedGp4MRZkG0MYQ3f9tJgmas/XFQB4=;
        b=Z8u9rfo1avRiAqSrRW7vqJ1g+UT5EgIqve1n5Z7ixdN7aQNpl9z8w3/OtTNVn9WALJ
         jO8G9kjPg+HfeUz1mUi20XjjLYNKABbrpkSSKomXg2o2dqa30YEDmF2U442GXIuAN6+f
         kgN1PiSV/Ktxv7Au4wGpTdDs7BXm3Z5b2ucBs06Z/FOius671RXCNJa7OTz+6fEig6GT
         gRNiMJy4d0EbW7ka4GWFAQQ4L3DblCDCbtEMjqkxLA95geFY/mTnFXG3QinyTJS+HNFC
         cz2XwiSNjkVyF8q8m+mjJ+hFFGI+BlvMDN/9m9MqcDfSPKLgdPLyD33Y98eoxQ7LMXQ+
         2Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718022516; x=1718627316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZpFk7tj5vBU7kedGp4MRZkG0MYQ3f9tJgmas/XFQB4=;
        b=NyxMIqaDugKCKG2XrsgWPAMpIv5Ox/5bpU9Wun3cXgmuRVW49mRR4MAkGRHOfy9UAd
         1RotjpifPYEV8FrKLomfX6BB9ZikLTUe6NXfOJTass93o8LJ/BRujCsQAlptuvjUjRLf
         knV96SDEhYBr+sRF+rhJpLXFsiARPKh3wbhmil6Ud+B7e4fdjq5sGLMQ9bcb3HuVyMeU
         mRcqZ07yf9oV9mPbL/Ik9j7MnlSIxlhn6Ga2QxfMip2y4HFo6GtFOe0ZJTZMiuqJGxQb
         /4Gs7m/5lQzs1gVdxPvrtP0XqkF9O0Nxa23C0A9AlEhnDgyLiHQtKV9+6/0P9b4gRmAm
         EFaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbBU12i4r7z9Pts3EPP9guKIRsUbcL/8MlsZU+BCCllFhq2LlwsZkVyMopnVWNljBpOc0npFp7ep9Jcy81G3SMSSJBkrbIyl4UD4IERYE=
X-Gm-Message-State: AOJu0YyscpmxsnTFJjJQ7bgKVaAjI5pguHVwABt7ElNsmMkcMjfN38Cc
	WFjSIGL+TDxAlPY5J2HUkPkxNR1C0ZCh8bwHNhHQ2vPpIS/VjW6uN07q3y+IpbJ1alFV62jb2zJ
	QQyX27/jE0Nge2v6vTAaFUhqpHqk=
X-Google-Smtp-Source: AGHT+IFQpiSoBvP/fudpUWzDtkazMIhrTAyiy5l3Pzjh3LHcTtWGonvAAbOpXOq6SVe8fAm7M/gXhh35NFWykhmEsVA=
X-Received: by 2002:a05:6871:711:b0:24f:d2b2:c38b with SMTP id
 586e51a60fabf-25464476177mr9584653fac.5.1718022515778; Mon, 10 Jun 2024
 05:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717356829.git.w1benny@gmail.com> <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
 <22eabe14-10c3-4095-91d3-b63911908cb2@suse.com> <CAKBKdXhZ4HOqThPMkwaWB5ZhQOc6gE=xsKzkoL4_h+M6y33dcQ@mail.gmail.com>
 <f3cd00f2-bdcb-4604-bdc2-fd13eddb8ea0@suse.com> <CAKBKdXje+_dd7kh3+aDJACw84+-1ozXt6N==KbA6Tgm7GeZEnQ@mail.gmail.com>
 <8961cf72-4eeb-4c47-9723-35da3e47d4d2@suse.com> <CAKBKdXiQhFeihx9HeuOv5cFe8K7H2O+GFUXy4ThF1X6ZGjCrig@mail.gmail.com>
 <093a45d0-da0b-44d1-902e-730eede80112@suse.com> <CAKBKdXjWmVJtCNWsGHnM_9TT2BZ6S=qyxYbYS7hsLWqb4vR16w@mail.gmail.com>
In-Reply-To: <CAKBKdXjWmVJtCNWsGHnM_9TT2BZ6S=qyxYbYS7hsLWqb4vR16w@mail.gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 10 Jun 2024 14:28:24 +0200
Message-ID: <CAKBKdXhb=AnPN=N_HvCkdjT7EhEYnEuNE6HwKF7fJau+5byJCA@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v5 07/10] xen: Make the maximum number of altp2m
 views configurable for x86
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> (when booted with altp2m=1)

Sorry, forgot to remove this statement before sending the email, it's
not really true.

I wanted to add that as I wrote in a previous email exchange - altp2m
should be ideally initialized only when it's requested - as opposed to
the current situation, when it's initialized in the domain_create.
However, that is more suited for 4.20.

P.

