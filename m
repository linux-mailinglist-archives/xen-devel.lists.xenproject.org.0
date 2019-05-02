Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAD211BCC
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 16:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMD2V-0005tp-5n; Thu, 02 May 2019 14:50:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mTkF=TC=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hMD2T-0005tj-Je
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:50:21 +0000
X-Inumbo-ID: 9b6be952-6ce9-11e9-843c-bc764e045a96
Received: from mail-io1-xd36.google.com (unknown [2607:f8b0:4864:20::d36])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b6be952-6ce9-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 14:50:20 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id r71so2365912iod.11
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=skROSN+X5JvleeDa8GNkeKSdJb15HmkxQ8XFHsI6Sao=;
 b=P8aQ1jM3msLhJq8RGBIqgZwlIl2j992VKXv8U/1vKZ2adBgkGnPFMQKhT9uvXII+YM
 gPLT0+8VtO0iuTguoxN3/KuNeiyUAERPkJJos2yQbCj0sBbSGL770VYpqM2V3w4nArf5
 VgoFHWx9udSjUCfxRNKgWUvanv1T3EnHdJSQ18iSgvyS9gsj1IVVMiaHrIq35cMiVCkB
 KFvrM4j1wq4fZA02LvXG3754366jc82gdCH2jx1wd/ccOv0GfT7kJAikdPtQpDwPKM92
 3y2AJWH8FZ9bT646GvZhtZhbH2oO2PGFSoM01bmGsYx84YdEV4irdxKXCpPpka7JpoKn
 pnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=skROSN+X5JvleeDa8GNkeKSdJb15HmkxQ8XFHsI6Sao=;
 b=qo7kkuRJhyyaT3I9damGHLo4AkQIEPb6j5K8DQCnaI92R7Ws9pBLRfKHuUVugX4Q+v
 fH1m1pPlXHXvFn4pofwucEqCdqItt7O5iXYX8f8qpmVgbSfyWtiXtAjPjZS7SsVMVZ9r
 LrX4S+vrfMe5uubGbWntcXxQkpwTgR2bZ3fF61wMc88LuVd8DI0IJPSd0+C4qi7ga9sV
 BhSSdotAwODu9JeBwCXacx+EqKFNIUrp2Ex32pEtrkHEqwcljcFQHa2Nl95sSJm6qbRf
 rcnS/aOqDN5gvUxIfzqMBC/y8g3vCEmXCfqDl6IAy0lRjZzhpWS/w4fQS1lAAPrh/rKI
 au7g==
X-Gm-Message-State: APjAAAXbnCP6OWF54l7o/DgHpz29OdKtFsPSJyuSWSpeb1TtCEKfshw+
 rRlGXgKJpWBvQoUFYAcAvgBmjklN0H4YKLhtK7r75w==
X-Google-Smtp-Source: APXvYqykmZBvsMoUfz++rVx8rfVr6ELMARiFw5/ansJWHm4wVzHIXww8SK/Rj4f0o5+barDqRpLxEiZfEnZeiUXHhVo=
X-Received: by 2002:a5e:9b05:: with SMTP id j5mr2864973iok.158.1556808619660; 
 Thu, 02 May 2019 07:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
In-Reply-To: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 2 May 2019 17:50:08 +0300
Message-ID: <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
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
Cc: Artem_Mygaiev@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkaW5nIFhlbiBtYWludGFpbmVycyB0byB0aGlzIGVtYWlsIENDLgoKVGhhbmtzCgpPbiBUaHUs
IE1heSAyLCAyMDE5IGF0IDU6MDggUE0gVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21h
aWwuY29tPiB3cm90ZToKPgo+IEhpIEFsbCwKPgo+IFBsZWFzZSBiZSBhd2FyZSB0aGF0IHdlIGhh
dmUgdHJpZWQgWGVuIEFSTTY0IGJ1aWxkIHdpdGgKPiBDT05GSUdfQ09WRVJBR0UgZmVhdHVyZSBl
bmFibGVkLiBUaGUgYnVpbGQgZW52aXJvbm1lbnQgaXMgbmV4dDoKPiBYZW4gVmVyc2lvbnMgdGVz
dGVkOiB4ZW4tNC4xMi1zdGFibGUsIHhlbi00LjEzLXN0YWdpbmcKPiBCb2FyZDogSDNVTENCLCBS
LUNhciBIMyBWZXIuMi4wCj4gUG9reTogWW9jdG8gUHJvamVjdCBSZWZlcmVuY2UgRGlzdHJvIDIu
NC4yCj4gQ29tcGlsZXI6IGFhcmNoNjQtcG9reS1saW51eC1nY2MgKExpbmFybyBHQ0MgNy4yLTIw
MTcuMTEpIDcuMi4xCj4KPiBCb3RoIFhlbiB2ZXJzaW9ucyAoNC4xMiBhbmQgc3RhZ2luZykgcmV0
dXJuICJVbmV4cGVjdGVkIFRyYXA6IERhdGEKPiBBYm9ydCIgaXNzdWUgaW4gY2FzZSBvZiAneGVu
Y292IHJlc2V0JyBvciAneGVuY292IHJlYWQnIGNhbGxzOgo+Cj4gcm9vdEBoM3VsY2I6fiMgeGVu
Y292IHJlc2V0Cj4gKFhFTikgRGF0YSBBYm9ydCBUcmFwLiBTeW5kcm9tZT0weDcKPiAoWEVOKSBX
YWxraW5nIEh5cGVydmlzb3IgVkEgMHgzNjE3MDAgb24gQ1BVMyB2aWEgVFRCUiAweDAwMDAwMDAw
NzgyNjYwMDAKPiAoWEVOKSAwVEhbMHgwXSA9IDB4MDAwMDAwMDA3ODI2NWY3Zgo+IChYRU4pIDFT
VFsweDBdID0gMHgwMDAwMDAwMDc4MjYyZjdmCj4gKFhFTikgMk5EWzB4MV0gPSAweDAwNDAwMDAw
NzgyNWZmN2YKPiAoWEVOKSAzUkRbMHgxNjFdID0gMHgwMDYwMDAwMDc4MWUxZjdlCj4gKFhFTikg
Q1BVMzogVW5leHBlY3RlZCBUcmFwOiBEYXRhIEFib3J0Cj4KPiBBdHRhY2hpbmcgdGhlIG5leHQg
bG9nIGZpbGVzICh6aXBwZWQgaW4KPiB4ZW5fd2l0aF9jb25maWdfY292ZXJhZ2VfbG9ncy56aXAp
IHdpdGggdGhlIGRldGFpbHM6Cj4gLSBhbGwgdGhlIHJ1bi10aW1lIGV4Y2VwdGlvbiBkZXRhaWxz
IChyY2FyaDNfY29uZmlnX2NvdmVyYWdlX3RyYXAubG9nKTsKPiAtIHhlbiBwYWNrYWdlIGJ1aWxk
IGxvZyBmaWxlIHdpdGggY29tcGlsYXRpb24gb3B0aW9ucyAoY29tcGlsYXRpb24ubG9nKTsKPiAt
IHhlbiBoeXBlcnZpc29yIC5jb25maWcgZmlsZSB1c2VkIGZvciB0aGUgYnVpbGQgKHhlbl9kb3Rf
Y29uZmlnLmxvZyk7Cj4KPiBQbGVhc2Ugc2hhcmUgYW55IGNvbW1lbnRzIG9yIGlkZWFzIGFib3V0
IHRoZSBpc3N1ZS4KPgo+IFRoYW5rcywKPiBWaWt0b3IgTWl0aW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
