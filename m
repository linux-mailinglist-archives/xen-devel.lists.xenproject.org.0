Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515A3D10E0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 16:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159372.293156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6CuU-00036X-HO; Wed, 21 Jul 2021 14:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159372.293156; Wed, 21 Jul 2021 14:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6CuU-00033r-Dg; Wed, 21 Jul 2021 14:09:18 +0000
Received: by outflank-mailman (input) for mailman id 159372;
 Wed, 21 Jul 2021 14:09:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMML=MN=gmail.com=neilsikka@srs-us1.protection.inumbo.net>)
 id 1m6CuS-00033V-Uc
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:09:17 +0000
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fff51233-af47-4075-83fd-70097ea44725;
 Wed, 21 Jul 2021 14:09:16 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id bm6so2200583qkb.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 07:09:16 -0700 (PDT)
Received: from [192.168.50.139] ([70.21.11.5])
 by smtp.gmail.com with ESMTPSA id h2sm11814761qkf.106.2021.07.21.07.09.13
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 07:09:14 -0700 (PDT)
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
X-Inumbo-ID: fff51233-af47-4075-83fd-70097ea44725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=user-agent:mime-version:content-transfer-encoding:subject:from:date
         :to:message-id;
        bh=6lU79icndgYGTdF0HrcQYMNalGRF8Sb6TQ21ogp432I=;
        b=fGBbJxbijuJIBl87y1J8xVn0m4NvzvvKmShuxB8PVLcD6slpbPHg1wLmabK++RfZ1w
         uQMhTzHReKSAL5xd2ZrvvI6SI/7+XLmUUjne7mInsX/OeF39ijN2b+sDEUO1ATjpfrAb
         5uh8kJFlXLxbQKZrJ/29JlOeD4ZQJE3UxHvPk3dq2+3FXXL7M58NmmKUeuEH4R0y6hF0
         aADd+GMfJn+XPXvuGPiUQozu9nRuBEIS8AHBCnhsgrRsYsadY8IJV2PPLZFKCegFyRx/
         BTZIdK8ink95KpuvhOUrXmF8xKvoNXGUemqgRFo0CTonHK4E7W6GkuYGOGCcbhtEcxXY
         Igsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:mime-version
         :content-transfer-encoding:subject:from:date:to:message-id;
        bh=6lU79icndgYGTdF0HrcQYMNalGRF8Sb6TQ21ogp432I=;
        b=jhEMpfHGFv25oxWa9CWSn9bY9Bd4zEpmGac6p8ltP1b1k+KRdAjM+IHYTApm1W4loI
         s90WwDWt/ouyE68UJGcQ+daiVO5MdU8AsXefcVXBG+AYnL1HbD5XKjcufZQ+vc5uc4tb
         qbT82UEQX6UZMd+LtOPfeqskohAJTs7kqlO40oxREK3XwyrAuz7Nmy6d6hqOKJXKKZkq
         afwAVEH3l3pyQOoEw3oOTvZe/AGeTcJDwzKuKo6LNSN3XVpAC2VkUiqAqiP5iTbUh17b
         q19Uv+UPBcban7nxF5HSgsonoxgTZm2PzDBrlGyteSG3rShtfvaj11ctAFARMivg9xBl
         zSrA==
X-Gm-Message-State: AOAM530tIGZA4ZKB4IhBhdDhgHV1VVGLNh9QiS3m1UPbcKudDrXi73FD
	98570LTwGfiUFlS5eG8l6a79ciDCElavnA==
X-Google-Smtp-Source: ABdhPJz86IkFCc0Pr1TWzOGzAbvKbzom6PP70Dp7RZAg4nf25Yq12obLppksCaEdnGce8vJTtWpASQ==
X-Received: by 2002:a05:620a:13f8:: with SMTP id h24mr26328233qkl.350.1626876555454;
        Wed, 21 Jul 2021 07:09:15 -0700 (PDT)
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="----NGT4NTL0PVI3F2P6H7UPG5E6D4HOOH"
Content-Transfer-Encoding: 7bit
X-Local-Message-Id: <01743e5a-56bc-463d-a788-c74e94557aa5@gmail.com>
Subject: Xen DomUs with empty state
From: Neil Sikka <neilsikka@gmail.com>
Date: Wed, 21 Jul 2021 10:09:11 -0400
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <01743e5a-56bc-463d-a788-c74e94557aa5@gmail.com>

------NGT4NTL0PVI3F2P6H7UPG5E6D4HOOH
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

Hello,
I am running xen 4=2E13=2E0 hosting many DomUs started in a short am=
ount of time, but not all of them are accounted for by xentop:

183 domains=
: 2 running, 0 blocked, 92 paused, 0 crashed, 0 dying, 0 shutdown

Only 94 =
of the 183 VMs are accounted for, and the STATE column for many of the VMs =
shows "------"=2E I have 56 physical CPUs=2E Why am I seeing this discrepan=
cy and empty status columns?

Thanks,
Neil
------NGT4NTL0PVI3F2P6H7UPG5E6D4HOOH
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<br></div>
<div dir=3D"auto">I am running xen 4=2E1=
3=2E0 hosting many DomUs started in a short amount of time, but not all of =
them are accounted for by xentop:<br><br></div>
<div dir=3D"auto">183 domai=
ns: 2 running, 0 blocked, 92 paused, 0 crashed, 0 dying, 0 shutdown<br><br>=
</div>
<div dir=3D"auto">Only 94 of the 183 VMs are accounted for, and the =
STATE column for many of the VMs shows "------"=2E I have 56 physical CPUs=
=2E Why am I seeing this discrepancy and empty status columns?<br><br></div=
>
<div dir=3D"auto">Thanks,<br></div>
<div dir=3D"auto">Neil</div>

------NGT4NTL0PVI3F2P6H7UPG5E6D4HOOH--


