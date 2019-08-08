Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EBA863F8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:10:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvj4j-00044F-HE; Thu, 08 Aug 2019 14:07:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=poDl=WE=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hvj4h-00044A-Hh
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:07:27 +0000
X-Inumbo-ID: d96f9f9d-b9e5-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d96f9f9d-b9e5-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 14:07:26 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v16so13089301lfg.11
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 07:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tV4SAX104fuwINJs4f/fwlVpV1AyIRhgfE036N6Kj/g=;
 b=Gmfr/37TiKWsMf5X2HwUdE3N4USPQ8JQz6oXTLz+xkhyKVMvmrS2dyqU+Xyl4EiwxN
 I0pdQRvTvRnpAcj0iCh+IVsQuVeGlNYl8vYxHWq6WuJyFGPglRfmtB0YAabsq8j3VgSF
 M73ebSSawlbxCi074lDhun/3vX+I/eADfy3pIJ7/U9e8CKJrOt4M0AWU6gBH9sOQJ9uI
 3ZujunlD9a70wfFfOFhXCZ2UqxVFbDz9jRYrIGY73OOM1bX0FrTtlAjJ7NnZTBQsX4ie
 PzOGFlRFdWUxVyTIC5iQh/CkriOpJVBzQdmfwK4S01NG3TvSQ2EIrOUOSViHolQ5ykfG
 ZVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tV4SAX104fuwINJs4f/fwlVpV1AyIRhgfE036N6Kj/g=;
 b=KH0tB0rE/BiIKSPtY/IWUofKEphWzC4K6WI2oVILkUYRrDd5XB1UK1fuLcrJAVZ2Y1
 DxHe3j/LMB4GDtDUosnGQKtt2ysQv0BNoz0+TJU7uYJWlkQF9b62vfhjvzQ3D2GyVTNj
 /YW5B7/CCqpSXbdzdu3J5TZJNd/W6ksCOes1U7uS2x+geK55avQk89udElpXo2tYSj5v
 97IGqb/Lblf+BUujahnbGVX1u4aTCs5SOE2KbuRPw6z6FVHmJOqax5zO5MiMzGOSfTWS
 gWjRa8+eJyEu17FYNSIVDV1bBeNg5TRI9bv/UKWkjqKpDSDzyvjjLbSZYl6xDZOxrRJQ
 6IhA==
X-Gm-Message-State: APjAAAW1DLpI7TG+aFQxdUQWfsH5sWpUvRFFvJ6Hsk1GRi3G9GuEV0tE
 6s/fpPUvXqrQwqLKngXIkyA=
X-Google-Smtp-Source: APXvYqyOgRElNxUa7R/IUtd3qYitYHISiVWDKX7LOMB0HdCOA9Harv97Vf0D+mU/afIWbOfZ4OMmUA==
X-Received: by 2002:ac2:4824:: with SMTP id 4mr1064026lft.161.1565273245127;
 Thu, 08 Aug 2019 07:07:25 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 z85sm18934589ljb.101.2019.08.08.07.07.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 07:07:24 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
 <a71ddd42-173d-32be-0674-47818316232e@gmail.com>
 <189da8d7-dee8-18f8-fbbf-699761f0b656@arm.com>
 <d92cecb0-397a-004f-aa80-e2761d9fadb5@gmail.com>
 <9c12cfb7c9b9b6c278f3f9e075d8ff117ac45190.camel@suse.com>
 <2476d08e-91cd-83ed-6637-9a801272570c@gmail.com>
Message-ID: <5ec9039f-5b97-cfd3-a5a2-9adbdb4a7808@gmail.com>
Date: Thu, 8 Aug 2019 17:07:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2476d08e-91cd-83ed-6637-9a801272570c@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDA2LjA4LjE5IDE2OjA5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IHAucC5zLiBJJ20gbG9v
a2luZyB0aHJvdWdoIGZyZWVydG9zIGFzIHdlbGwgdG8gZ2V0IHdpZGVyIGxvb2sgb24gdGhlIGF2
YWlsYWJsZSBhcHByb2FjaGVzCgpPSywgYmFzaWNhbGx5IEZyZWUtUlRPUyBkb2VzIG5vdCBhY2Nv
dW50IHRoZSBJUlEgdGltZSBzZXBhcmF0ZWx5LiBZZXQgaXRzIHNjaGVkdWxpbmcgaXMgdmVyeSBp
bXBsZW1lbnRhdGlvbiBkZXBlbmRlbnQuCkFueSBpZGVhcyBhYm91dCBvdGhlciBvcGVuLXNvdXJj
ZSBleGFtcGxlcyBhdmFpbGFibGUgZm9yIGludmVzdGlnYXRpb24/CgotLSAKU2luY2VyZWx5LApB
bmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
