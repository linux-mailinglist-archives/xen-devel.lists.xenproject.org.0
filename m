Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0F98D230
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 13:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808720.1220716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svxTv-0002lM-BZ; Wed, 02 Oct 2024 11:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808720.1220716; Wed, 02 Oct 2024 11:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svxTv-0002it-8R; Wed, 02 Oct 2024 11:25:23 +0000
Received: by outflank-mailman (input) for mailman id 808720;
 Wed, 02 Oct 2024 11:25:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tl1C=Q6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svxTu-0002in-5T
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 11:25:22 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0121d835-80b1-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 13:25:20 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fac63abf63so36461611fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 04:25:18 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f9d461982asm18872011fa.109.2024.10.02.04.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 04:25:17 -0700 (PDT)
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
X-Inumbo-ID: 0121d835-80b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727868318; x=1728473118; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eqrFAfrzjZeDi8Pum9/LInoq0D3Apz8MP5tO7H6DGz8=;
        b=bI2UOz1aCccYs0DzRjK0aMD+3d4DHM2yTjpueWM65Nf6NNrM6ypVtQqWr/OM0UKldf
         yvSlIInd2yeHB+Eo7Q2ICCLKfDcNY1LZgrtYqln1+1Vdgd0shRcGD9DtCNpSzTHC61pU
         BWv2dGM79O87uHkffT2x/0TN0EWkhIxO/GSGLDnkfW7nfmTWI50oHykh2ej41sgZinZT
         d9B5ur4EhxYqck2wrRv8YlsUsICviU2APVTGafK7irGzoH/Xa28vQI/iMV/I6fTN8UKl
         +4TrTHhRsaVqD4ueciJIVECaL9HrSmTbvSmx08cVI4rFz+GK4bjtijarhpp7Qpjj1rHo
         bLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868318; x=1728473118;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqrFAfrzjZeDi8Pum9/LInoq0D3Apz8MP5tO7H6DGz8=;
        b=RNNcRj1U3bRGc14+VnawojwS8DZyVsBWPw+4EXvrBg+qJUiezRioEL1ySUgf1KBure
         eaNcyk6gA3Zmolf1F5UQVf5k0iN3UR4b3FMB2lBp8IUyiUJVNhUn+DMtrTcpkIfWNiPO
         to6DY7pkKRk08wXYnjFUBEDX3A9DCPZPL4NIuX7Bm0BODZTvoT3BCbPZlQ8qpZrGFAgb
         8+ZThctccUaLvT/BF4sLl1emCazLWT63+VPnGJgAlKj7oYawvh9ScBR95JcTGBg7dWAB
         0oGZNk2sB63T2U59F4SMVEe0lcUC5rvg5tX1VtKhdeAHHhFIhLUcyjHImekGIADzbn0x
         6HoA==
X-Forwarded-Encrypted: i=1; AJvYcCUO8pmRI9wu2//I03/zcfEcjmpfGOQF2GmnyDLQFQJM7M06Vk8Dvo7WDzDsMVLyL9g3UoF5WQEMVnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdOl/rLSI0ceU7C3jvJa39wxWAZh90MK515T9UMJ3p3779XxyR
	JbfPvB2xvrA6nXzUDomACmvaGwaMc3mFv4AjnEEjCbeW3A56CUp/
X-Google-Smtp-Source: AGHT+IE+4OfmtUbxgfRf7Oc5y8U7QWo98tR5EtvrcUbR0NO/wImC14LBHZawaDIS7DSVInPZO+eUrw==
X-Received: by 2002:a2e:a99f:0:b0:2fa:e4ae:3342 with SMTP id 38308e7fff4ca-2fae4ae38cemr10095771fa.12.1727868317937;
        Wed, 02 Oct 2024 04:25:17 -0700 (PDT)
Message-ID: <418443ea4017c401d944971898cb298ef2f826d6.camel@gmail.com>
Subject: Re: [PATCH v1 3/3] xen/riscv: register Xen's load address as a boot
 module
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 02 Oct 2024 13:25:16 +0200
In-Reply-To: <178b61bc-d3e5-4c9d-a8c0-88363911bc8f@suse.com>
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
	 <2bd3589f322d30e93d81d091ca64439048c068fc.1727708665.git.oleksii.kurochko@gmail.com>
	 <178b61bc-d3e5-4c9d-a8c0-88363911bc8f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTEwLTAxIGF0IDE3OjQ5ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAzMC4wOS4yMDI0IDE3OjA4LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gQEAgLTI2LDYg
KzI3LDggQEAgdW5zaWduZWQgY2hhciBfX2luaXRkYXRhCj4gPiBjcHUwX2Jvb3Rfc3RhY2tbU1RB
Q0tfU0laRV0KPiA+IMKgdm9pZCBfX2luaXQgbm9yZXR1cm4gc3RhcnRfeGVuKHVuc2lnbmVkIGxv
bmcgYm9vdGNwdV9pZCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhZGRyX3QgZHRiX2FkZHIpCj4gPiDCoHsKPiA+ICvC
oMKgwqAgc3RydWN0IGJvb3Rtb2R1bGUgKnhlbl9ib290bW9kdWxlOwo+IAo+IFdpdGgganVzdCB0
aGUgdXNlcyBiZWxvdyB0aGlzIGNhbiBiZSBwb2ludGVyLXRvLWNvbnN0LiBRdWVzdGlvbiBvZgo+
IGNvdXJzZQo+IGlzIHdoZXRoZXIgeW91IGFscmVhZHkga25vdyBvZiBmdXJ0aGVyIHVzZXMuCkl0
IGNvdWxkIGJlIGRyb3BwZWQgYXMgaXQgaXMgdXNlZCBvbmx5IGZvciBCVUdfT04oIXhlbl9ib290
bW9kdWxlKSBhcwppdCBsb29rcyB0byBtZSBhIGxpdHRsZSBiaXQgYmV0dGVyIHRoZW46CiAgICBC
VUdfT04oIWFkZF9ib290X21vZHVsZShCT09UTU9EX1hFTiwgdmlydF90b19tYWRkcihfc3RhcnQp
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgKF9lbmQgLSBfc3RhcnQpLCBmYWxzZSkpOwpC
dXQgSSBhbSBva2F5IHRvIGRyb3AgeGVuX2Jvb3Rtb2R1bGUgdmFyaWFibGUuCgo+IAo+ID4gQEAg
LTQ0LDYgKzQ3LDEzIEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIHN0YXJ0X3hlbih1bnNpZ25lZCBs
b25nCj4gPiBib290Y3B1X2lkLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiUGxl
YXNlIGNoZWNrIHlvdXIgYm9vdGxvYWRlci5cbiIsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGR0Yl9hZGRyLCBCT09UX0ZEVF9WSVJUX1NJWkUpOwo+ID4gwqAKPiA+ICvCoMKgwqAg
LyogUmVnaXN0ZXIgWGVuJ3MgbG9hZCBhZGRyZXNzIGFzIGEgYm9vdCBtb2R1bGUuICovCj4gPiAr
wqDCoMKgIHhlbl9ib290bW9kdWxlID0gYWRkX2Jvb3RfbW9kdWxlKEJPT1RNT0RfWEVOLAo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB2aXJ0X3RvX21hZGRyKF9zdGFydCksCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIChwYWRkcl90KShfZW5kIC0gX3N0YXJ0KSwKPiA+IGZhbHNlKTsKPiAKPiBUaGVyZSdzIG5v
IHJlYWwgbmVlZCBmb3IgdGhlIGNhc3QsIGlzIHRoZXJlPyBQbHVzIGlmIGFueXRoaW5nLCBpdAo+
IHdvdWxkIGJlCj4gbW9yZSB0byBzaXplX3QgdGhhbiB0byBwYWRkcl90LgpJbiB0aGlzIGNhc2Ug
dGhlIGNhc3QgaXNuJ3QgcmVhbGx5IG5lZWRlZC4gSSB3aWxsIGRyb3AgaXQuCgpUaGFua3MuCgp+
IE9sZWtzaWkK


