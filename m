Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1491A976F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:50:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdkG-0001Ym-IT; Wed, 15 Apr 2020 08:50:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbih=57=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jOdkF-0001UD-Er
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:50:07 +0000
X-Inumbo-ID: 1ab1409c-7ef6-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x52a.google.com (unknown [2a00:1450:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ab1409c-7ef6-11ea-b4f4-bc764e2007e4;
 Wed, 15 Apr 2020 08:50:06 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w4so3592961edv.13
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2020 01:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=XiZHh3PsZ9aCCUeq41r8dePjo3PdgqgTlNLjjspHWUI=;
 b=PRwthg+VMECmp8hsjrIGpNHmHwiFyf+9cgFttZmtmt7vH6MIwGEWnfISCpYzdmZ5iC
 R7LYYo80ELTsDxYNrouUMSGOa7dJUu4RQbC3QGKE/tY+JUsSu7SkrvnO3t1sz5/+zBoP
 ot5+DY7qPuV85TxlzX4hS8QlgX2dOKnKDVReV4sTqbf88g/5R73j+kurDYOfSxCR0iQe
 7VUkxFp7tbyqRzTJD1H0zXq0Wk6fapqqFlmqn0mV8xu2eHr8bDRJdNTfF91oNbwQLBIE
 r0XsL0qoHqY9slP5srgOPYuEfV578lu7kB9vLnuL7dRH+HVcPNfHm9joN4X/mA3l5AQs
 ip0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=XiZHh3PsZ9aCCUeq41r8dePjo3PdgqgTlNLjjspHWUI=;
 b=nQIDC4AbQ+qlukOX0Ggc9XDflSkT7/Heh6/d1mDvKBozjet8V6QXCmHOkY2kTibVHr
 dpxeitwILJb9vjzf/HSIb/Ca+7EBO3a/BPWSkTZxZpzm4pzBJbnlPYiiALKSA7r9pdSd
 csx2iXKAJoFEx1tOvZ44DNFFp2JBepnL1CRXBjf0KieJIHkBv2JlMNEWYUxcZpU69fMB
 ASDIi715HTi3Z/FP0PPDBlfDRVoHE8yWMimehm9taDtDBLd1gWMWK92qMw4S+RMfXMle
 HjO7TMDXGf9yMIuXCukCR2cITl7Ujtk1Z7aADn76ARbYsoIpLQhc7IKrPqOGVc2tV45D
 OVFg==
X-Gm-Message-State: AGi0PuYKDYWIwD5wx8WMUmQJWsJHAO73LLj5ei2qB84oE90yOJJ2F7Kx
 /D+P14qnEPb0tqng1TA3IMRB4pUFBag=
X-Google-Smtp-Source: APiQypJCA/5uXvQTdRXaVkME/T91gxP8V6S57RyWahfsfYIYeTp6IQE90wwyglYRojgUhMxgCBkKVQ==
X-Received: by 2002:a05:6402:17ad:: with SMTP id
 j13mr23287422edy.46.1586940605927; 
 Wed, 15 Apr 2020 01:50:05 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id x22sm1831787ejb.53.2020.04.15.01.50.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 01:50:05 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
In-Reply-To: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
Subject: RE: [PATCH 0/3] xenoprof: XSA-313 follow-up
Date: Wed, 15 Apr 2020 09:50:03 +0100
Message-ID: <002801d61302$dbd21950$93764bf0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKUpBz832WsrmfTrWwwQFYKS8h7/ab8vN2g
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 15 April 2020 09:45
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: [PATCH 0/3] xenoprof: XSA-313 follow-up
>=20
> Patch 1 was considered to become part of the XSA, but it was then
> decided against. The other two are a little bit of cleanup, albeit
> there's certainly far more room for tidying. Yet then again Paul,
> in his mail from Mar 13, was asking whether we shouldn't drop
> xenoprof altogether, at which point cleaning up the code would be
> wasted effort.
>=20

That's still my opinion. This is a large chunk of (only passively =
maintained) code which I think is of very limited value (since it =
relates to an old tool, and it only works for PV domains).

  Paul


