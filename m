Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E24213DE
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 08:51:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRWen-00012p-Gv; Fri, 17 May 2019 06:47:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FnXM=TR=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRWel-00012k-QT
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 06:47:51 +0000
X-Inumbo-ID: aff9a7c6-786f-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aff9a7c6-786f-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 06:47:51 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 188so5249600ljf.9
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 23:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lVil98LabFnCWB8FMhd9/0QQQIgdeMBv/KOcvV6pkGg=;
 b=eF6mPoqDMEpVz4vqEviAhQvIw+ErckMM9E3wyWR0Zduxm6gxxz++RFQUkw94Ahjl0m
 BTnJKh9WWGturdc00Txg8RU5FcVWGSpJ1P3RHQYZGKWu6aldC/NIu7EaYvwpkKodAaFS
 wFjuDBhq+CiSMprlmLFl/1s6gzvdcCV5i3dLTlJweYli84oIUKW+Ml9CVvtwR7T48bzo
 g3LL8KjKY8VGIXvIZVnPpk84oszgCbqcf8b1BqCWPalpx7wuikhxbKUZal/yRFAqaKsD
 C0TmDFuOEJ0gjo+0TfiKSTD7m58HoGVUhK8JvYEg2+ON9CYWquDOwfnOy80Yx5Ot7LzN
 4WvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lVil98LabFnCWB8FMhd9/0QQQIgdeMBv/KOcvV6pkGg=;
 b=BuvJms73JGM/kTiRTxeqYGzdvCW+h1a7kHlaMA+0oSWaWYtKpQv8jkBljRBNtovI0q
 XqdAuCf9nZgNQHV1lK4cu2M5RHHfn6yOuxHAyZXGPMgael71gBOiAWYwqK4o+wUP+NvI
 +FuP9+62ERQci77sN3V5VWev25keuqnfRYB3fY2pgaAd6Q2bMawfnDlSO+OSyL6Lc/OF
 aYP83IsMYh7LvMhDoiYu/QYLZbZXLEcsXd03SgD/aHT/H0EMyRjbPk/EHyS4nB9vB3vQ
 nFAXEzir6X/0u6E5pWFVxxFB4JzlsVfjpr/z2TPSp6LFvjgBG1adyhqlUAaOqkn/j4Pg
 gELw==
X-Gm-Message-State: APjAAAUulqWzhtUGWF3D/slcyqiMAUTQ4MJRLniT14UAfgIedAXDsVXM
 fL5NEp11vpYfgiUvl/hGALc=
X-Google-Smtp-Source: APXvYqygRTCYOE3RiKLvdo4I9pyIv6Oi4owttobzSPo4NxZi274pZEOADUNrDv1T+vxXfLXbQCcAcQ==
X-Received: by 2002:a2e:90d1:: with SMTP id o17mr13177696ljg.187.1558075669550; 
 Thu, 16 May 2019 23:47:49 -0700 (PDT)
Received: from localhost (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id h25sm1238719ljb.80.2019.05.16.23.47.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 23:47:48 -0700 (PDT)
Date: Fri, 17 May 2019 09:47:46 +0300
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190517064745.GA14853@localhost>
References: <20190516132016.8032-1-viktor.mitin.19@gmail.com>
 <37a3a6c6-7de4-e496-5619-00f31e8e338f@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37a3a6c6-7de4-e496-5619-00f31e8e338f@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Xen-devel] [PATCH v2] coverage: filter out libfdt.o and
 libelf.o
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDY6NDA6MTRQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IE5vIG5lZWQgdG8gcmVzZW5kIHRoZSBwYXRjaCwgSSBjYW4gZG8gdGhlIG1vZGlm
aWNhdGlvbiB3aGVuIEkgd2lsbCBjb21taXQgdGhlIHBhdGNoLgo+IAoKSGkgSnVsaWVuLAoKVGhh
bmsgeW91IGZvciBkZXRhaWxlZCBkZXNjcmlwdGlvbiBwcm92aWRlZC4gCldpbGwgdGFrZSBpbnRv
IGNvbnNpZGVyYXRpb24gYWxsIHRoZSBub3Rlcy4KClRoYW5rcwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
