Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756C71FF7FE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwoQ-0001jP-O7; Thu, 18 Jun 2020 15:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTxy=77=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jlwoO-0001jG-UH
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:50:44 +0000
X-Inumbo-ID: 77e3b1c0-b17b-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77e3b1c0-b17b-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 15:50:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r7so6605700wro.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 08:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=lT/7EcXsvOOiTprb3aYSPlNH1XuyuZBC0soAOJPxS3k=;
 b=OjBcL4bplMOHQG2ee/6u6IS0yYbsSfHjTTBO83JIZyo1LDgdgm7NsPg0qNLUMonpbb
 auxTix0Y1elhf8uVO2qxKfnKF9LrpOfZ4Xt4UiImJpRqpDHvLnZaf2GYHpUfpaFZbnga
 96HAj95olu8uT/ARKl02w3d2dkaEREPrDE+vACyzGSXX8FBV5XC3wR19bSxeMhkA7Vvv
 FRacu3qVNbLiX51oBRYYgpejsYxIzFN3RRCHgtV1fPgj7z2/pXGoTGvEhuE5JRPZ7H+B
 5RDBxuqXzbA5HFETbgqfl8hhddgQIv1O0sBl+Ww45v1eJAwiah6sOUHxR/A1NTe+ZMkb
 syMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=lT/7EcXsvOOiTprb3aYSPlNH1XuyuZBC0soAOJPxS3k=;
 b=XpuLkjctfKnydl6Y74sRRevfHANV7sPfZH67WbPQJ6JXb1JZFnhhKr/6oZ1TyvvBKI
 0EAyURjvXBFibiHNRgUzUN8DyIfU5wGvmw7KPCslgkb3PDEW4JrenAFqgqVRIDRiWb2y
 u95wq30l9gHm7U3wa4YywsQw7+RQolwWHNNarGrnhU+i53NIldiZ5altGY4TsGD00L5V
 Q8JXkRV097weIK4AJJUwjowATkO7UMXihNhqXf5HeqTk/g+7iahE3pb+OEDbQ7c+yurI
 ywXYd25LDLNLySBifQxSDOC3HaZYgtA8RwLroiHIPc5cPeREGgLdor5IOldK4+YDbM+l
 S9oA==
X-Gm-Message-State: AOAM531sdNP1+Hag/uVPgPjer4zF0gItaB+8Xvg39TmrGVn6jQtteNWA
 CzJmJCQs5L8rZra8WXpL5uE=
X-Google-Smtp-Source: ABdhPJwyo0PlQA9bUpwg4NRH66zpkHTf3KnkFLNV/+jAKE0DCJzh0eAS2rMdP79w8X65EOUt3+MQ8Q==
X-Received: by 2002:adf:db47:: with SMTP id f7mr5496496wrj.101.1592495443576; 
 Thu, 18 Jun 2020 08:50:43 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id b18sm3936992wrn.88.2020.06.18.08.50.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jun 2020 08:50:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 "'Anthony Perard'" <anthony.perard@citrix.com>,
 "'Andrew Cooper'" <Andrew.Cooper3@citrix.com>
References: <000401d640c9$7b14e760$713eb620$@xen.org>	<20200612151931.1083-1-ian.jackson@eu.citrix.com>
 <24299.36041.946061.376335@mariner.uk.xensource.com>
In-Reply-To: <24299.36041.946061.376335@mariner.uk.xensource.com>
Subject: RE: [XEN PATCH for-4.14 0/2] tools: Update/reset autogenerated files
Date: Thu, 18 Jun 2020 16:50:41 +0100
Message-ID: <006601d64588$39208670$ab619350$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGI6gSxEetYUPUyGoePfPOSoDqDyQGre5JTAfp36mWpXAyOoA==
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
Cc: xen-devel@lists.xenproject.org, 'Nick Rosbrook' <rosbrookn@gmail.com>,
 'Samuel Thibault' <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 18 June 2020 16:48
> To: Wei Liu <wl@xen.org>; Anthony Perard <anthony.perard@citrix.com>; Andrew Cooper
> <Andrew.Cooper3@citrix.com>; Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Samuel Thibault <samuel.thibault@ens-lyon.org>; Nick Rosbrook
> <rosbrookn@gmail.com>
> Subject: Re: [XEN PATCH for-4.14 0/2] tools: Update/reset autogenerated files
> 
> Ian Jackson writes ("[XEN PATCH for-4.14 0/2] tools: Update/reset autogenerated files"):
> > We commit the output of autogen.sh, and the outputs of flex and bison,
> > to help people without recent versions of the corresponding tools.
> >
> > Our usual practice hitherto has been to declare a version of Debian
> > that we are tracking, and have committers run autogen.sh, or make -C
> > tools/libxl clean && make -C tools/libxl all, on that version of
> > Debian.
> >
> > Patches to osstest to detect violations of this rule would be welcome.
> >
> > After 4.14 we can perhaps revisit which of these files should be
> > committed and how they should be managed.
> 
> Ping.
> 

You can consider this...

Release-acked-by: Paul Durrant <paul@xen.org>

...once the appropriate maintainer acks are given.

> Ian.


