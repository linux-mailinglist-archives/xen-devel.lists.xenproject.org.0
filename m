Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50051F34B3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 09:16:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiYU4-0005cI-QE; Tue, 09 Jun 2020 07:15:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiYU2-0005cD-Pc
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 07:15:42 +0000
X-Inumbo-ID: 06aab8ac-aa21-11ea-b7bb-bc764e2007e4
Received: from mail-ej1-x630.google.com (unknown [2a00:1450:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06aab8ac-aa21-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 07:15:41 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id l12so17354323ejn.10;
 Tue, 09 Jun 2020 00:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=dR6VSL8FsoZcxWeIb/mhcOUcIF57a7JLajWczF+lmWw=;
 b=KMvNC5ljqgyLcJ02sqtJZ7QOYqZ2n8sq4ZgeeRqoPyhuQjlwgsVePgfB9/uipY43T+
 AXVDYcNzo5b97qrLh3SqWfRbJ7IHB14QAwe0CzJd6YI91anx2wRFuYHdZ7Jsp/lX88tv
 rdlLLLXNMWAgeCevmCZnX3ATfIYiNnHv+NYAg2C2aEaCKGmurSWlnxXIMQxInoIH3FpS
 yvAmG+8JFvk6fL0eF6agVtbmzHCbw7JpcGufXSqH8SJHzGdW2ZhP24pO4fidFUyVr7ei
 wmy9j1EQK9be4aott3bTzPzVkFriV/g7gx8ybVON4/HoZqSCSa8OQtV1zD24mySq084O
 +a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=dR6VSL8FsoZcxWeIb/mhcOUcIF57a7JLajWczF+lmWw=;
 b=b+zODnwSxJLwrv4FokBBeplhszAohKT0ai3RWfc+NUqQeb2WJfTzuePJIb7UTa0uZP
 pOX2nrt752f4IOVZeBxRswRcdQ8DYPrkkWdo+G+1/D2v1B5Oh7VI7ByFjGx9w4/AcIu+
 K/e4ZXrPFaHCfqb/dgfzc5jUp/jwlRIS34sNsmIu59pBRdYMfFMB4VknwqX9Ytw+C/jz
 vWy5DfXb1j7Dii45A/7HuUIn33SBCQrXJxVwbDvWGo2oTAy29lZVxB9ZQ6YwmeHDq2J/
 TMNLeRwMtIECiyXgMnqn+5doJaJFUvA5xW1k73gflHAhsqbJTK3h6Q34FN3cWdqsVHDj
 FtKQ==
X-Gm-Message-State: AOAM533ilDIUAWn88ikdJJgHycIhw3AflWmZGkuXc+FwtFi8O/mAbaTt
 b2xzUtTBMn1eQ/0VKTTn1FE=
X-Google-Smtp-Source: ABdhPJyglyZxvkIgWGYuKDQy1P8CAG+ARnFH4enif1uGe/3Ry7+IqfI0dQW4Pl1cFB2H9MOn6Zr97Q==
X-Received: by 2002:a17:906:af4d:: with SMTP id
 ly13mr23127932ejb.250.1591686940667; 
 Tue, 09 Jun 2020 00:15:40 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id q14sm15043555edj.47.2020.06.09.00.15.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 00:15:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Tamas K Lengyel'" <tamas.k.lengyel@gmail.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200608163934.313-1-paul@xen.org>
 <CABfawhn3HJCHonYKnMFPgUEN125SDBSXKcMFMWd2hG5SGKF8YQ@mail.gmail.com>
In-Reply-To: <CABfawhn3HJCHonYKnMFPgUEN125SDBSXKcMFMWd2hG5SGKF8YQ@mail.gmail.com>
Subject: RE: Xen 4.14 RC1
Date: Tue, 9 Jun 2020 08:15:38 +0100
Message-ID: <004d01d63e2d$c7de8db0$579ba910$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHItTXpd8sx0l1jqMKHNeE0LXFGcwMGQZxRqNK9tZA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-announce@lists.xenproject.org, xen-users@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
> Sent: 08 June 2020 21:03
> To: Xen-devel <xen-devel@lists.xenproject.org>; Paul Durrant <paul@xen.org>
> Cc: xen-users@lists.xenproject.org; xen-announce@lists.xenproject.org
> Subject: Re: Xen 4.14 RC1
> 
> On Mon, Jun 8, 2020 at 10:41 AM Paul Durrant <paul@xen.org> wrote:
> >
> > Hi all,
> >
> > Xen 4.14 RC1 is tagged. You can check that out from xen.git:
> >
> > git://xenbits.xen.org/xen.git 4.14.0-rc1
> >
> > For your convenience there is also a tarball at:
> > https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz
> >
> > And the signature is at:
> > https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz.sig
> >
> > Please send bug reports and test reports to xen-devel@lists.xenproject.org.
> > When sending bug reports, please CC relevant maintainers and me (paul@xen.org).
> >
> > As a reminder, there will be a Xen Test Day. Please see the test day schedule at
> > https://wiki.xenproject.org/wiki/Xen_Project_Test_Days and test instructions at
> > https://wiki.xenproject.org/wiki/Xen_4.14_RC_test_instructions.
> 
> Hi Paul,
> I'm sad to see this RC1 still missing patch:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00179.html

Hi Tamas,

  I don't see an ack for that one as yet. I'm happy to check and release-ack once the final patch is agreed.

> 
> The following even have the release-ack and yet are also missing:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00025.html
> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00028.html
> 

  These are indeed acked and release-acked and I trust they will make the next RC.

    Paul

> Without these patches I won't be testing or upgrading to 4.14 at all.
> 




