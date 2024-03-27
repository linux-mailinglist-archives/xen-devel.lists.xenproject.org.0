Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F6488E909
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:29:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698631.1090581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpVDY-0004pa-LL; Wed, 27 Mar 2024 15:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698631.1090581; Wed, 27 Mar 2024 15:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpVDY-0004nA-I9; Wed, 27 Mar 2024 15:29:32 +0000
Received: by outflank-mailman (input) for mailman id 698631;
 Wed, 27 Mar 2024 15:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cny1=LB=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1rpVDX-0004n4-Af
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:29:31 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce096217-ec4e-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 16:29:30 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a46f0da1b4fso880731066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 08:29:30 -0700 (PDT)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a170906411000b00a4655976025sm5546248ejk.82.2024.03.27.08.29.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Mar 2024 08:29:29 -0700 (PDT)
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
X-Inumbo-ID: ce096217-ec4e-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711553370; x=1712158170; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDI/GjmcSQUKjpBzVonLr28hXzTP6U8GNPFMf2MZnuE=;
        b=CBmx227J7vZ0qIwDniK5qVjiBiPy9mKvnNMe28tJs6BojWmf4wA0zVglKs+w7f3TuA
         euNfO3FADd8iYd7jlhKJpUt5Va4O8ovXJ0BjkqcaEBiEhfwc2b0NoRVy992GkML5jX/3
         HxVuc1RbkJhoraEs62djymyazHAZHF3pewQIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553370; x=1712158170;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDI/GjmcSQUKjpBzVonLr28hXzTP6U8GNPFMf2MZnuE=;
        b=JyXSPE1KZar/wZoH03z5twEkjC68MybeCg3YmyjXXAQeCFYky9Y7TANChI5X/9Scuf
         LFwLmePomM0kp44K+mCYabdWA3S4SUtT6NdQR3OOSoYKT0Au5B+Vyt77OZOnaOfVONrI
         PG37Cnsng02gBXqQYN+S3QT6vMQViLoF7cdaEKCcVg/nnLJYLq3dhT9ib5piJ7y9YM7R
         2nR2+PkrAmjrP1JnKEfZIY+WtfoA1fgtk3eH43keHJxLdssHYUQcYS1bpaQa74cufnmC
         HHZ5kIWSxX1e2o4TLHqDm4KZCrHTtShUKQaMWig8tD0CVzmv6uLuv33GyEIhdAZYosdE
         jbBA==
X-Forwarded-Encrypted: i=1; AJvYcCVbrBwFMvg4DD+or1kxqU1KRrAoLdThlKh+k/3NDpYurqo5bFqGQdFeeXYl/p2wO3J92EW0hoYpuiI5AQHS2K9nYw7gCwjSbPxsXUobo00=
X-Gm-Message-State: AOJu0YyVrNLCSRDK5hngyZjOMSdZr49Hvr7kY/Iy4pmrNKwX9yfLjOEV
	t74hlWLcO8QjqyAATgG3RaxpwYIRJUuMGegYwrE/IgdWT5IozqncyHHVdURAfbg=
X-Google-Smtp-Source: AGHT+IFs1t00YIQ9M+P5FFPZF5nJ+3cPn451JDwrv0ntl1Iho9b6LlmCt8qP0Qj7MgZ+/Yy/PfBDlA==
X-Received: by 2002:a17:906:3ad5:b0:a46:5d40:eb97 with SMTP id z21-20020a1709063ad500b00a465d40eb97mr2078171ejd.70.1711553369957;
        Wed, 27 Mar 2024 08:29:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: preparations for 4.17.4
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <8fbb0ac1-e72b-4532-8d46-d79b751d8c96@citrix.com>
Date: Wed, 27 Mar 2024 15:29:18 +0000
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Scott <dave@recoil.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA44D427-4483-41DC-AA2A-469E41AC5246@cloud.com>
References: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
 <6feb56fe-769d-4809-b16f-6fc4d5477747@citrix.com>
 <93172b11-c737-400e-9d2e-daafee8f1cbc@citrix.com>
 <c08666ad-2baa-407f-943a-a47d1aba345f@suse.com>
 <8fbb0ac1-e72b-4532-8d46-d79b751d8c96@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)



> On 27 Mar 2024, at 14:42, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On 27/03/2024 2:06 pm, Jan Beulich wrote:
>> On 27.03.2024 15:01, Andrew Cooper wrote:
>>> It occurs to me that these want considering:
>>>=20
>>> b6cf604207fd - tools/oxenstored: Use Map instead of Hashtbl for =
quotas
>>> 098d868e52ac - tools/oxenstored: Make Quota.t pure
>>>=20
>>> while 4.17 is still in general support.  These came from a =
performance
>>> regression we investigated.
>>>=20
>>> I've done the backport to 4.17 and they're not entirely trivial =
(owing
>>> to the major source reformat in 4.18) so can commit them if you'd =
prefer.
>> Didn't you bring these up for 4.18.1 already, and I said that I'd =
leave
>> this for the maintainers to decide? Same here, in any event. Cc-ing =
them
>> both, just in case.
>=20
> I could have sworn that I remembered requested this before, but =
couldn't
> remember where.
>=20
> I'll see about poking people for an answer.
>=20
> ~Andrew

I understand we have backport; so I support upstreaming it.=20

=E2=80=94 C=

