Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF97FB93
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXxY-0003Dp-Bo; Fri, 02 Aug 2019 13:51:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bRuE=V6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1htXxX-0003Dk-PS
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:51:03 +0000
X-Inumbo-ID: 9052b376-b52c-11e9-8980-bc764e045a96
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9052b376-b52c-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 13:51:02 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id h10so1467936ljg.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b8BpHOCOA0Q2KfxYmOWb415hLkHEDN/0wq2Ek5Vxr1M=;
 b=jQq1A5adTBprNtiB/K5A78gKkOjGzvdqe2fzaSatmSI/AM2SRwBHHDPYClP2fzvu9F
 qytBY2eURp4VcodHaBMLqXzMea1r+7jaP+W78ku1R8i/LEdxukAyKe8V/Jb150u/sFjW
 sFoS1aHylFVUMB8BxFQza69EJN2NOo6v9bVmr3nfEJwSKAxljHib3ayf6P8tOVZNkQ/7
 wr19XIlZdf+N1kfq2kQKb8zjJ2Dc2FAKAr7tghVBy1wVblRAkXJjkB43GzsqS7xMvJcc
 elSIvUd1Y5L6R9aQ73yLjRyQRlNqFRVpmc/a+rsBcxn52O4AnG+wbfWCfxk0M5RejM98
 duJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b8BpHOCOA0Q2KfxYmOWb415hLkHEDN/0wq2Ek5Vxr1M=;
 b=Pz1bNnUls+jmc/O51yieIcqSGUm8xrUwLpJaAS29q+nUqCshnPF6RmdDnM6flglkL9
 h9034JgEukzRfT7EhqkRLDCNG2wFQiZayn85s1kwKzzwnjhwTQuDwWAEg3zuArSJJlFQ
 HiOdaxC02Ppvq6QFuiomB35xgiiyhf8tJj9g1xQsiMLpcDARhw+VTBzjKLT02qQV9Amt
 xkUqeNaUrzL+zxmQDe7CWkCH5d6xlQMbuW3mpvtz3ews2RtsLl45HBB+AYN2NR2PlKQy
 e4xpAtHZItUZK/Tnz0aWNT1+PAsC9KNmzALzYJ+9Qg4zztKNeroQ320c4lVsEdqLE9iY
 XEVQ==
X-Gm-Message-State: APjAAAU5k3S440lDBfWaBZqNc9TKDQNtfmPPZfD8kcbqhjvpnfAgjAbF
 JeSwiUxXFCf2htvYSdo7WWo=
X-Google-Smtp-Source: APXvYqwhxGB+lvhb5hbdjl7Nx6rVdicfka0saSqiTx5eMqt8TANmo2/n0ZU1uWgBscrAauPrTCWYAg==
X-Received: by 2002:a2e:9701:: with SMTP id r1mr4702003lji.12.1564753860750;
 Fri, 02 Aug 2019 06:51:00 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 r24sm17266750ljb.72.2019.08.02.06.50.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 06:51:00 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-7-git-send-email-andrii.anisov@gmail.com>
 <c971845f-7305-22c2-081f-9faa36e4c8d2@arm.com>
 <63256c34-fab7-1fb8-3637-9c5a50d6d6bf@gmail.com>
 <8c7bc6d1-3482-ec5b-b3d9-c6562caf5711@arm.com>
 <c2a220ad-553f-272f-606f-2c569e299e10@gmail.com>
 <ed14fff5-5cc3-cb6c-2676-02b510b0553e@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <44d7b877-efc2-bef0-5bdc-db6485e5091a@gmail.com>
Date: Fri, 2 Aug 2019 16:50:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ed14fff5-5cc3-cb6c-2676-02b510b0553e@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 5/6] arm64: call enter_hypervisor_head only
 when it is needed
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMS4wOC4xOSAxMzoxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFsbCB0aGUgY29tbWl0
IG1lc3NhZ2UgaXMgYmFzZWQgb24gInBlcmZvcm1hbmNlIGltcHJvdmVtZW50Ii4uLi4gTm93IHlv
dSBhcmUgc2VsbGluZyBpdCBhcyB0aGlzIGlzIGNvbmZ1c2luZy4gCgpTb3JyeSBKdWxpZW4sIEkg
aGF2ZSBubyBtb3JlIGFyZ3VtZW50cyBmb3IgeW91LgpJJ2xsIGRyb3AgdGhlc2UgdHdvIHBhdGNo
ZXMgZm9yIHRoZSBuZXh0IGl0ZXJhdGlvbi4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3Yu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
