Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C576C26
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:56:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1aB-0007Dv-Da; Fri, 26 Jul 2019 14:52:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr1aA-0007Dk-8S
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:52:30 +0000
X-Inumbo-ID: fd20deda-afb4-11e9-8980-bc764e045a96
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fd20deda-afb4-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:52:28 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id k20so105292459ios.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tSo/54iI+rFyguS4q6m6ipSlCdmJTu5d5UB8+mmvRJ8=;
 b=UW6KnhXApd5kQrK64uWXCWCn4f6CUY57ikCnvn18g1C/9eMxBXiQgmuLTGxJwWSzjQ
 bY4HOTYeTRjEQKoTzT/SmcSVHYb8iLjZ5F9/HQV0Rx55xfHyeTc+rmCmBDP1gD/NkldK
 1PRI9/0L2KpZfOMpssf3rWN6VYk7lMq7/c8FtGI0SAyqqDubiX3AGSHPgcJPqt5Oijj+
 orusaw4gbw3Ut8OXWt5mZ4Z7dk1NS401byVjGaWk8XDAHIdvjOtd0oSzfZH1UTGAR4bj
 Zs/2ItQMJQepRQEY2fw22MxsaOwAuMuu3mGh7VF1Xg+Bw9dQ/huM1YsUyngC1OhZQ4fg
 BCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tSo/54iI+rFyguS4q6m6ipSlCdmJTu5d5UB8+mmvRJ8=;
 b=bGDpMvVJcKWtkFW2zkusDc5Jm4mmMK/N1pBXAtAkR4dyDysJlLg/wT0sSrKmlWWXf/
 hnPcGilYEcXxFzZIcF537/5ev27JLzNtRR4tai49svoz19+6jb6+t9XislkTnMNHFyMC
 hMptI+qdun5NPAVrR2Jlt70qZ8g5ZhC3NkvDi4FmNLwEubXZHrGOx0e2MGXFrEc7p+4k
 FEtk9AudNT3VN/3jsjlqN5bZMh0opiRptYXpxGDttZQG6GZo8fJRZknZBgT69Ceu6DUY
 xRhipKgiFSFUklgoYgOJmVdfg//Qov88gzcp1vfu8GqWuhPceTgDtGrr9nyefnX8LqqQ
 PHDQ==
X-Gm-Message-State: APjAAAXnBYoCgXzSn3OMNnExlKltbixH6ScbQaMb69Yyh88s/eIbfbhm
 xBzjfFgifGTHxrUzCT62TXHf3BwS4l4SBcVZF+o=
X-Google-Smtp-Source: APXvYqzDxtVUJ7Bs1yBmDH8FZaeLVp+GuE7cDvP/2HdRw9xUZOmf6ytQ8sQAOanlEuEiiGhv1BWLWnZFcnKFS0usR8s=
X-Received: by 2002:a6b:ba88:: with SMTP id
 k130mr84751595iof.212.1564152748381; 
 Fri, 26 Jul 2019 07:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
In-Reply-To: <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 17:52:17 +0300
Message-ID: <CAOcoXZamx2qeFB7GKrcwir9GfWxOzsPcf-KGB0-vDNBxfuZd2g@mail.gmail.com>
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, 
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxsLAoKT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgODoyNCBQTSBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gPiAgICAtIExpbmUgMTM5OiBUaGUgeyBh
cmUgY29tbW9ubHkgb24gdGhlIHNhbWUgbGluZSBhcyBzdHJ1Y3Qgb3IgZGVmaW5pdGlvbi4KPgo+
IEFjY29yZGluZyB0byBDT0RJTkdfU1RZTEUgdGhhdCdzIG5vdCBob3cgaXQgc2hvdWxkIGJlLgoK
QWxsIHN1Y2ggY2FzZXMgc2hvdWxkIGJlIGV4cGxpY2l0bHkgc3RhdGVkIGluIHRoZSBDT0RJTkdf
U1RZTEUgZG9jdW1lbnQuCgpUaGFua3MKCj4gVGFtYXMKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
