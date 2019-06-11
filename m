Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023ED3D1F6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 18:13:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hajME-00012f-V4; Tue, 11 Jun 2019 16:10:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XVUa=UK=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hajMD-00012U-O4
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 16:10:45 +0000
X-Inumbo-ID: 76b7c63f-8c63-11e9-8980-bc764e045a96
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 76b7c63f-8c63-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 16:10:44 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a9so9749622lff.7
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c1HvLrGmjxXx1vrQZ9gP6aqfUALYnYWDdpnieesJ21E=;
 b=SF7UKm/l4CeejZAcKA7hgxMelzefaU0Oic50wDSXUOfmmzHhcuaPko0eavZlUinptC
 V2mBBUhDNbDis+jcHbHjpHbL3ny3QtGaYV/ctOIcLcRLfsfOjY3jo/CnTfcoBi3AvCWE
 OLSM4GP4wsr/jvzsIiMQlgQojUlT2I6XS9TLNqDz3xK2hMpbuRgIqgU5Y8MT/1i9ATGF
 s1gwnWZLbRaocEjdfO8UVSyZbTdkFghPFY8j62V9UZ07Dj5R0fkIhKeJD+quxGabxC3q
 wuMTt5sBD72L0f0TO3jMPSsVDUb0bBeH49RsQfuqyg6zp9z5g7rS+r5QdBiGO9VDw0oT
 HoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c1HvLrGmjxXx1vrQZ9gP6aqfUALYnYWDdpnieesJ21E=;
 b=kk3jEYFhB4j8s97boHL/DUhgb0ZnkUav5QMWoy6i/dXweJlV9cA+KyReiEWBRaTAgg
 7D8rm2OVWrFAX0Xt1+pRy5eL2ZCJY3gWXIuZ0wdZTKsyaZ5YvImSBXkcFjzlzNv5cauS
 Vf61uVoBqD4K1ams54eL700jk3LGzLwZPDNCLj1GCzipmXML3a8LSxlo1t/ynQy9kfco
 +AJCRIq1l6bQgy+aGEL6u2Pw9aYoCvXegG9uzK0+C9ieqHKgBDHFjH88HrOFUDS21I2m
 6+1cLhGivFDBxvGosPCRCebFQVEpikjX2id0BE7mzGuJVifZKIRqpHFBDYrBqaeWqYvz
 QUAg==
X-Gm-Message-State: APjAAAXkR5z01aPdv1WEW+mleF2ZJHKtLM9EOznD2uLeCor7VBXGRAaV
 oaZg95bRT01NAs9xrsa+XvA=
X-Google-Smtp-Source: APXvYqwlTdOJjls6o1OM6f0Tv2c8bzlT7EzvOejDQOIyaIhq4tWGGr4VH5PFJa6k6pQ5m8cCB7b+NA==
X-Received: by 2002:ac2:59c9:: with SMTP id x9mr37680188lfn.52.1560269442782; 
 Tue, 11 Jun 2019 09:10:42 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 b25sm220970lfq.11.2019.06.11.09.10.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 09:10:42 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1559217748-25426-1-git-send-email-andrii.anisov@gmail.com>
 <98f2248a-1053-5c41-0242-6707fa2d1a7d@arm.com>
 <c94b88a1-ff72-4c61-d690-05ed28df780e@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <859e3a4b-f1f4-4d0f-7248-fb76440eebe5@gmail.com>
Date: Tue, 11 Jun 2019 19:10:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c94b88a1-ff72-4c61-d690-05ed28df780e@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu/arm: add missing return
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMS4wNi4xOSAxODoxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBBY2tlZC1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBOb3cgY29tbWl0dGVkLCB0aGFu
ayB5b3UhCgpUaGFuayB5b3UuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
