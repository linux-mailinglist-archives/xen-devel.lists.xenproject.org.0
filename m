Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3EBAB5374
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 13:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982736.1369082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEnUL-0005Nw-74; Tue, 13 May 2025 11:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982736.1369082; Tue, 13 May 2025 11:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEnUL-0005LH-30; Tue, 13 May 2025 11:07:57 +0000
Received: by outflank-mailman (input) for mailman id 982736;
 Tue, 13 May 2025 11:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wJrs=X5=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEnUJ-000551-VY
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 11:07:55 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84d23aa9-2fea-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 13:07:55 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-7fd35b301bdso6189470a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 04:07:55 -0700 (PDT)
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
X-Inumbo-ID: 84d23aa9-2fea-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747134474; x=1747739274; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWtT3Cwc4X+aVigDHquJY93P7hxQPAIPhRkOpXj2QFE=;
        b=DJnnyuIkRQIyKtIASgkKBAsHQSZlaA2s6CTfTvh69B84KF4TqeXZt1ndKMSVh13b0l
         BmLOlWWTRNMj475/YML+oKYF51A0MDEJbEfSwm+JNq5dUM00my9AyWb04+GFRIyXYMur
         4yI4YmQxt4c0nJAWEgx0cMTZUXf+G0nXSuQu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134474; x=1747739274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWtT3Cwc4X+aVigDHquJY93P7hxQPAIPhRkOpXj2QFE=;
        b=llCcfARjVSGWtBwNCzbdZxjSrQEFwmlnoTEq1W72IzSGFWh6R7hq88Q35V+WHdxp60
         8oy6zDaldsS2eriEJNfaWgI7T8g7pXd3K8vSHP6S4kiW66l/+q0PQ3UNs3Xc7J/TgNt9
         NKASlFfIMsDokzcD3JbG14S/xbHQYak7ZjWbyPcWfZALrxBJH+FyhIVYrmcVHJ80RnHm
         uDqWiyYePIV/m7aUPUMiX2yy56yb0zHA5xmbBRrEa2o7on3uRUvS48RxnEnwP6UD8Jqb
         MBV767bWR0KYLEcPLug1Cx9P2x0XN8DLLL0fkhBUIJmQJmQ6Np60PJk9P0nrbBQfaWnr
         5mSg==
X-Gm-Message-State: AOJu0YzBYNXIv5dKL0c9fPAOjFnxNfzQPvel4HPFlWttguDae5rKCUBV
	xd4ze7ycsjRA8bV0mp+z58mAAJG+3JY0+onSbZXgG3UeXfE4pZpcBV2nhLq2dLoJF0rkv7rUsOg
	hwGWrfifZNGFvKja0T7sR85RwUdYbFoeN+eFvwKpzXXErZf2FWjc=
X-Gm-Gg: ASbGncu3oLQf5SEmx+CsWDDgTxl04etWn1fdOrbDgydzV6mzvLUrlkGfu40a0fa05si
	8bFYMOTWHZPMHYZ74EBx0UYL9UCnB/VosOAubOJ7cO6mOILGlEE5HD+WExQyWFCHBkfe6M5ElVB
	FUbEgF7xVwEPSY+gd69hF5gkg8sHbkMJg=
X-Google-Smtp-Source: AGHT+IGFhkssudvMoEV5UDej/dkEy2tsJm7UjkPESCXKUVYK08Iy9A+gPnrvRLQoLTKnXcIt3pyqzJRxlTZ9ueCDspY=
X-Received: by 2002:a17:902:e54f:b0:224:191d:8a79 with SMTP id
 d9443c01a7336-22fc8c7b6bbmr236553225ad.27.1747134474006; Tue, 13 May 2025
 04:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250512195628.1728455-1-kevin.lampis@cloud.com> <b00ae1e3-9812-411a-aaa5-b191c94a16a2@suse.com>
In-Reply-To: <b00ae1e3-9812-411a-aaa5-b191c94a16a2@suse.com>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Tue, 13 May 2025 12:07:42 +0100
X-Gm-Features: AX0GCFst6uEFDyH-dMAM5W1YmQhM6BJ4Hmhlsse4VB0cj5foOIm-QJFlxOz3oB4
Message-ID: <CAHaoHxY9XaAmxXB1VmKkJTKsfmxJ0HrQ7SE820GNpzeAjiZN0w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add lockdown mode
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 11:41=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> You want to go into more detail here, specifically to describe the criter=
ia
> of "specifically safe". The command line doc may also want updating.

I do not have a quick answer for you please bear with me.

