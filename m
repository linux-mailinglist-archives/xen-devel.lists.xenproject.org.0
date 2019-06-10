Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CF03BA5A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 19:08:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haNkk-0003wK-Ff; Mon, 10 Jun 2019 17:06:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m4ix=UJ=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1haNki-0003wC-89
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 17:06:36 +0000
X-Inumbo-ID: 1a3ffe9b-8ba2-11e9-8980-bc764e045a96
Received: from mail-yw1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a3ffe9b-8ba2-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 17:06:35 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id u134so4065476ywf.6
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2019 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Vje8YmigL88CApqMVg8lm21+8/TTptrY7+BNd0rUmag=;
 b=KKxBq1SGUwDnCUYSRhkldgBWy69P4pbkdsDwhHfwhKIqZARHKfvKvsbtuvnepq9jmt
 vM8GOUWix679sfUpgxUPMqqq6ihS9OTZRzJDF0Kf+Kjs9WYxAjiYkTRZj4/znOIWoyxt
 1u+x8r83hYjPdpDQ4F1SU56nz3tnHnFrXjV/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Vje8YmigL88CApqMVg8lm21+8/TTptrY7+BNd0rUmag=;
 b=Aq3uG/L/PkvJwGSBOfmnbZZU4yUPabmdEJoUfygXXS15J5D2cteARNZUT/qnfqu0FP
 MDiNdleVD3dvPxlxc+SMK5sZm9RE1D4mztz4WfJs+OxtBMzP6ad5INr6erXZ1tYCEXmq
 oujVZa30YHpDS/NxlfASCYpzJwPqMKvp5q9p3U6kL5iH7K8WOejVMl7Mw6eDuDok9An3
 90QJhIIT5RW4U7CoH3s0B9ZeXK3oMQqNK6IF5uNK8xAehAxR6MM3ecL1n9dSJKMnwwXi
 66gW4G7+DqF/HVxyuRp/r90NPH+XRgFCJLEmF2/jozEXdWpccsk9LnBxf/pt+owvwiGL
 uIVw==
X-Gm-Message-State: APjAAAXaRU46gXlmJow3R3nuO6vg1RiHHbvSOptbAbZfeSkcZSobs/+v
 xcvn5bxc999bYyekq0gVs7wLlw==
X-Google-Smtp-Source: APXvYqzlmvrFsV0idzomhVAUBKBQoRP2cYYMn/AqC+NxsCLUDiIV261BLVZw4wlDNnuu2W4kgKAjog==
X-Received: by 2002:a81:5e0a:: with SMTP id s10mr21856208ywb.175.1560186395058; 
 Mon, 10 Jun 2019 10:06:35 -0700 (PDT)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:3d7a:9971:564f:2532])
 by smtp.gmail.com with ESMTPSA id n64sm3152786ywe.76.2019.06.10.10.06.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 10:06:34 -0700 (PDT)
Date: Mon, 10 Jun 2019 12:06:34 -0500
From: Doug Goldstein <cardoe@cardoe.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20190610170634.vfqti433ignt2qvr@doug-macbook.localdomain>
Mail-Followup-To: Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20190610163246.90567-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610163246.90567-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4] automation: add clang and lld 8 tests to
 gitlab
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDY6MzI6NDZQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFVzaW5nIGNsYW5nIGFuZCBsbGQgOCByZXF1aXJlcyBpbnN0YWxsaW5nIHRoZSBw
YWNrYWdlcyBmcm9tIHRoZQo+IG9mZmljaWFsIGxsdm0gYXB0IHJlcG9zaXRvcmllcywgc28gbW9k
aWZ5IHRoZSBEZWJpYW4gRG9ja2VyIGZpbGVzIGZvcgo+IHN0cmV0Y2ggYW5kIHVuc3RhYmxlIHRv
IGFkZCB0aGUgbGx2bSByZXBvIGFuZCBpbnN0YWxsIGNsYW5nIGFuZCBsbGQKPiBmcm9tIGl0Lgo+
IAo+IEFsc28gYWRkIHNvbWUgam9icyB0byB0ZXN0IGJ1aWxkaW5nIFhlbiB3aXRoIGNsYW5nIDgg
YW5kIGxsZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KCkFja2VkLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
