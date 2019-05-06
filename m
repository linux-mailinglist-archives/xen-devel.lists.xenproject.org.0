Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808814A35
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:50:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd2J-0007Ge-0U; Mon, 06 May 2019 12:48:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2G-0007GY-Sn
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:00 +0000
X-Inumbo-ID: 2d40677d-6ffd-11e9-843c-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d40677d-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:47:59 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z124so2900778lfd.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yEKYYDBloaGKLVtD8nvRXq1KsydcPaQ5yzCYTjM1VPM=;
 b=HrXKiXJezNAsePkTqLb88pR3aVp+bcMOykb0oCKbCdoUPFPoZe5RD69t4BjWedWiVb
 vR66cfc+6N7WG6JTiYS8hUYKysuf/bDME/aSOvvf/aWhMF30LgI1R+AnzKOWgfLQI4I6
 mmJJRBPVWSkSxxAhkjmMHnVQnlDy/BojYVoDhAVqGvDwCfgs3XxwvxhW0Je2jcc/csGE
 9EURTNIyCJhsbAHPtqrkFZXE+LK1Snz0/MbxUZB9bEoqR7mBy9bbGBLPWCYrWsGD6KRc
 F2LNoal6VXt0Pp93NSyNQBAh0gnIsbDqxV9hHd8HdYpfp6U1slkEmbOjv+s0Efj2mKR5
 h06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yEKYYDBloaGKLVtD8nvRXq1KsydcPaQ5yzCYTjM1VPM=;
 b=lrG0V4UDZeQSgtKLmfj/MYPZU9QOQULOV6kd86wxOmBQcvtPR8e8dEWMp/FOJgwd3j
 DfvY99Hmxv33b/FzVgy1ToPSSzTedLjD2QBVM697VVuk5mb1FusQxSTbdABkHOG5877H
 dx6H18eLOTFcVZXb5OkG7Rs/6uQ7cSm0E5RyIQzatKXdmmaMA1u/s5kRlBrfr9tU5SUo
 rhS6vjzH7dkEZj32c6b2ByozncIK8odFa4RCzQvICadpvkJR07kLCi6G60dPccvJAj11
 3+TI2TMAN5UOIc2Ia7+Q1xaUmjiyhQJqWuF6zp/ZYydtqX9w8D0ZEAH/s9CxwYwfU/YG
 t7TA==
X-Gm-Message-State: APjAAAWaypERNGlEoZ1rKbatP8mZhEBTFd3V6uh2hvS/vjpQhMuu3/Oe
 QidN3s6bfOB4TJp++Gpm3vA=
X-Google-Smtp-Source: APXvYqyI+GdsSzOvb+eqlnJtVXM1azgHELBROEpDRYBW53kZ40tHy4fNtn4DtPh6ppU8hm55dfn1lA==
X-Received: by 2002:a05:6512:25e:: with SMTP id
 b30mr4855378lfo.9.1557146878141; 
 Mon, 06 May 2019 05:47:58 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 u26sm1924008lje.56.2019.05.06.05.47.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:47:57 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-2-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <4ab25d13-9d88-5971-c52d-81418a76b917@gmail.com>
Date: Mon, 6 May 2019 15:47:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-2-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 01/12] xen/arm: lpae: Add a macro to
 generate offsets from an address
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZXJlIGFyZSBmZXcg
cGxhY2VzIHJlcXVpcmluZyB0byBnZW5lcmF0ZSBvZmZzZXRzIGZyb20gYW4gYWRkcmVzcy4KPiBS
YXRoZXIgdGhhbiBvcGVuLWNvZGluZyBldmVyeXdoZXJlLCB3ZSBjYW4gaW50cm9kdWNlIGEgbWFj
cm8gdG8gZG8gdGhlCj4gam9iIGZvciB1cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3AybS5jICAg
ICAgICAgfCAyMyArKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFy
bS9scGFlLmggfCAgOSArKysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgMjAgZGVsZXRpb25zKC0pCgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJp
aV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
