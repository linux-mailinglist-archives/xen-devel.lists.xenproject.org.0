Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874687CDFB
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 22:14:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsuwi-0002BC-FT; Wed, 31 Jul 2019 20:11:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=92Dq=V4=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hsuwh-0002B7-3l
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 20:11:35 +0000
X-Inumbo-ID: 647c96b2-b3cf-11e9-8980-bc764e045a96
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 647c96b2-b3cf-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 20:11:33 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id h18so67845930qtm.9
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=fx6poZvcIH28vk19LoDAyZkQ2MtXHV2aB1kp0pdvtUs=;
 b=Co01p48siHQH2uxScyLOfz3p1kUkwBBbtPeCGKr1ZHOjxaQQzv2/dh+MtnGeI5ctlW
 stdtepQ4kl4QDyKGQanFp6b9u39UDJTGFZFVrPUHsZggHVzKJLPH+ktAkDBwfFlwzI7D
 sxm0VNpmlgcfQXmZbKylWAiI5uiqzNcW/reGLTde9VzSTApN7oRdQnMe1SjPqm69rFxu
 s3wCF9CiJhnvZcTzYzQSkQRWvT4dXIrzr5efeULSCgk//qM7s1Uu/MSttYwkry5uuHao
 2u3bRo3gtIIqFn1LgHkHl+lYEN29+8TZNIotsaSCRPpLsMrGiXqcZLObYh6yc7+0iysF
 C8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fx6poZvcIH28vk19LoDAyZkQ2MtXHV2aB1kp0pdvtUs=;
 b=CA9BD9fa2Y56cCysHqc+3b4djaJJ19rvnWLT1fnd+n3PxquS53augw4t++JgnSrqs1
 MRWhvAizE2Kgj3qAzd4U4aFBdrDV16KEvW841YUg8NSIYbpTBopCEH47/GtKD2o6eXVE
 cu/ni0ra3L+41wsH8u8GndNe6TY+lFAouGBw5HS10KZxVT8uYW4UAJiPdqV794m0DLnN
 2I659I7UkkIvvZp1DVSTrH6waGw/7WmcFTinh4Opz4M42eJjDXiljXLtdy+c/5aYCWaE
 vmNtSbcYvPtlMsA52VSIqY2gTXcfKrFZKiSVaddEDzmwTyDCpSp3/jMZpbrTWcQ71oJN
 ZKbQ==
X-Gm-Message-State: APjAAAUhazXOA4z0+xeTZYoNe0RhEjUi6AJnuJEhZE72NV/P6AsVPgsp
 CdhFgFuTwZKuxm5EyFA+Pbzc1UvCC/tPZ2sw2dy3pQ/u1kcOfw==
X-Google-Smtp-Source: APXvYqx/PkO3Z7YqsumcMXmBOOKX1DpWSJQ87WqpQd8rC4jv1XJU8yLU/b/YwhprkL1FJJL8LT6xP1q9FVIRnJu6w4c=
X-Received: by 2002:ac8:60a:: with SMTP id d10mr84997923qth.31.1564603893099; 
 Wed, 31 Jul 2019 13:11:33 -0700 (PDT)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 31 Jul 2019 13:11:22 -0700
Message-ID: <CAMmSBy_60jh+YXMVEm0PnEnD-MP4R1A5AKEKWL62V_1bc2L5cw@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] [BUG] Assertion failed: !blk->legacy_dev
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkhCgpBbmRyZXcgcmVtaW5kZWQgbWUgdGhhdCBFVkUgaGFzIGEgd2VpcmQgaW4tdHJlZSBwYXRj
aCBmb3IgWGVuJ3MgcWVtdQp0byBkZWFsIHdpdGggYW4gaXNzdWUgd2UgY2FuJ3QgcXVpdGUgZXhw
bGFpbjoKICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9sZi1lZGdlL2V2ZS9ibG9iL21hc3Rlci9wa2cv
eGVuLXRvb2xzL3BhdGNoZXMtNC4xMi4wLzAxLXJlbW92ZS1hc3NlcnQucGF0Y2gKClRoZSB3YXkg
dGhpcyBwcm9ibGVtIG1hbmlmZXN0cyBpdHNlbGYgaXMgKnNvbWV0aW1lIGFmdGVyKiBhbiBIVk0g
ZG9tYWluCndpdGggYSBxY293MiBkaXNrIGF0dGFjaGVkIGdldCBzdGFydGVkIHdlIGdldCBRRU1V
IGZhaWxpbmcgd2l0aDoKICAgIEFzc2VydGlvbiBmYWlsZWQ6ICFibGstPmxlZ2FjeV9kZXYKKC94
ZW4vdG9vbHMvcWVtdS14ZW4vYmxvY2svYmxvY2stYmFja2VuZC5jOiBibGtfZ2V0X2F0dGFjaGVk
X2Rldl9pZDoKOTAzKQoKVGhlIGRvbWFpbiBjb25maWd1cmF0aW9uIGlzIHN1cGVyLCBwbGFpbiB2
YW5pbGxhIChzZWUgeGwuY2ZnIGJlbG93KSBhbmQgdGhlIG1vc3QKYW5ub3lpbmcgdGhpbmcgaXMg
dGhhdCBhZnRlciBpbnNwZWN0aW5nIHFlbXUgc291cmNlIEkgY2FuJ3QgcG9zc2libHkgdW5kZXJz
dGFuZApob3cgdGhpcyBpcyBoYXBwZW5pbmcuIEFmdGVyIGFsbCwgIGJsa19hdHRhY2hfZGV2X2xl
Z2FjeSgpIGlzCmxpdGVyYWxseSB0aGUgb25seSBwbGFjZQp3aGVyZSB0aGF0IHZhcmlhYmxlIGlz
IGJlaW5nIHNldCB0byB0cnVlIGFuZCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgaG93IGRvIHdl
CmVuZCB1cCB0aGVyZS4KCk5vdywgeW91IG1heSBzYXkgdGhhdCBkaXNhYmxpbmcgdGhhdCBhc3Nl
cnRpb24gaXMgbm90IHRoZSByaWdodCBmaXggLS0Kd2hpY2ggSSB3b3VsZAp0b3RhbGx5IGFncmVl
IHdpdGguIEhvd2V2ZXIsIHdlJ3ZlIGJlZW4gcnVubmluZyBsaWtlIHRoaXMgZm9yIGEgZmV3IG1v
bnRocyBub3cKYW5kIGl0IGRvZXNuJ3Qgc2VlbSB0byBiZSBjYXVzaW5nIGFueSBraW5kIG9mIGNh
c2NhZGluZyBlcnJvcnMuCgpUaGFua3MsClJvbWFuLgoKbmFtZSA9ICJyb21hbi1jb250YWluZXIu
MSIKdHlwZSA9ICJodm0iCnV1aWQgPSAiZjk4YjQ1MWEtNjdlMi00MzIzLTkxOTQtMDMyM2NmY2Fm
MzE5IgptZW1vcnkgPSAxMDI0Cm1heG1lbSA9IDEwMjQKdmNwdXMgPSAxCm1heGNwdXMgPSAxCmJv
b3QgPSAiZGMiCmRpc2sgPSBbJy9wZXJzaXN0L3NoYTUxMi01MGMxODFmNjg0ZmY3ZDg2MzA3ZTU3
Mzk4YTRiYTdjYTM4ZjFmMTg5OTZlNzE5MjlmZTI5MTc1OGRlNmI5YmNkLDgseHZkYSxydyddCnZp
ZiA9IFtdCnNlcmlhbCA9IFsncHR5J10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
