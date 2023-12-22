Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AB381CE4B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 19:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659684.1029409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGk4A-0001T6-14; Fri, 22 Dec 2023 18:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659684.1029409; Fri, 22 Dec 2023 18:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGk49-0001R5-UM; Fri, 22 Dec 2023 18:16:09 +0000
Received: by outflank-mailman (input) for mailman id 659684;
 Fri, 22 Dec 2023 18:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGk48-0001Qg-GS
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 18:16:08 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c633603-a0f6-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 19:16:06 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e6a806e4aso801708e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 10:16:06 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a19ee10000000b0050d12f6c533sm597137lfb.189.2023.12.22.10.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 10:16:04 -0800 (PST)
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
X-Inumbo-ID: 2c633603-a0f6-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703268965; x=1703873765; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DsX2dperMp2qLzV8cdhEvBvzWC1vT6De4vqI0jnXKCY=;
        b=QfnJtRxJ4bH+YapfvXHGRlGUnfQ2YldzFJ8ZpSKb+GE4MsVSjo/Mj4oK8xXUw9P1zb
         /mHIFn2LswGHORJjpJLh8erGQ4cBQh+cX3m+qmP4FB2YVufs9z+CgyBlmB4DpXazk+jm
         z5gXYAeMn2j99KBGWQqdDlUS4A3xf+Gtkmiqrp1SFiH07GX/DT/zNIhCbiM5FXG1dZGN
         IYRUglsmfP5pqRwYlgIp8XIFoljraVLY4OEEJG2qE/yEnH9JCvX/7t/peTVtVylN0PvM
         e5It8DMMioTE49h8Zq0gmN3Jv9bqi1HbQUXCQpgUFwdkp465If0lM2BR2eISfFUOSSLH
         I0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703268965; x=1703873765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsX2dperMp2qLzV8cdhEvBvzWC1vT6De4vqI0jnXKCY=;
        b=J/e1J7VbGLvUBC383/axGqpS8vG4RrTvUAsIgfU1lyuuYpyMAzoJAywnoG/O7EyjOi
         mCXIUgSuCIOZwWsITI/7bK+3sP+QzjvXt1cpYOqAO/6v7ywvYBBDg0EIdNgdFGyAa7Ln
         VOVdE8l+Pwxu4AX52K97l83iAhGx3C67svXOQSnbczDPmCv105B6bA2CZeYXlA7j2Lw/
         pU7zqlCeH7xzpbu76OmdqQ0Oof5iiAaEI/d7N2nft6Ck26+dOgt/5IaONFxuJI80cMIy
         bgrQ5eJRlCBEfyqfgLbbD0pKA3L13yr8KD8PXCVPEBajcqtzVTg0o0fMuIBBbt/cNAQV
         g11A==
X-Gm-Message-State: AOJu0YytgBQ5obp6l5CrgH5mIEoua9Xp0u2ZXjaH7Qm99u1dPXAVTeRZ
	gULlyQs/5oZPAD+i1M7Va1aNTf8bv34=
X-Google-Smtp-Source: AGHT+IHGdwLEjHez4Z86GpXF7rF3JUD7Ubs/N4QFq72FOdWsZ1IGfzjShrfcswLqH9XxBPNmMgw71w==
X-Received: by 2002:a19:5f54:0:b0:50e:6878:a70b with SMTP id a20-20020a195f54000000b0050e6878a70bmr843506lfj.54.1703268964772;
        Fri, 22 Dec 2023 10:16:04 -0800 (PST)
Message-ID: <feb344194bf7422e774b70e34083188bff6fdbff.camel@gmail.com>
Subject: Re: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>
Date: Fri, 22 Dec 2023 20:16:03 +0200
In-Reply-To: <3231bf55d5da1d3e1eb03a43759932d8ebcca8de.camel@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
	 <3231bf55d5da1d3e1eb03a43759932d8ebcca8de.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gRnJpLCAyMDIzLTEyLTIyIGF0IDE4OjMyICswMjAwLCBPbGVrc2lpIHdyb3RlOgo+ID4gKwo+
ID4gK3N0cnVjdCBwYWdlX2luZm8KPiA+ICt7Cj4gPiArwqDCoMKgIC8qIEVhY2ggZnJhbWUgY2Fu
IGJlIHRocmVhZGVkIG9udG8gYSBkb3VibHktbGlua2VkIGxpc3QuICovCj4gPiArwqDCoMKgIHN0
cnVjdCBwYWdlX2xpc3RfZW50cnkgbGlzdDsKPiA+ICsKPiA+ICvCoMKgwqAgLyogUmVmZXJlbmNl
IGNvdW50IGFuZCB2YXJpb3VzIFBHQ194eHggZmxhZ3MgYW5kIGZpZWxkcy4gKi8KPiA+ICvCoMKg
wqAgdW5zaWduZWQgbG9uZyBjb3VudF9pbmZvOwo+ID4gKwo+ID4gK8KgwqDCoCAvKiBDb250ZXh0
LWRlcGVuZGVudCBmaWVsZHMgZm9sbG93Li4uICovCj4gPiArwqDCoMKgIHVuaW9uIHsKPiA+ICvC
oMKgwqDCoMKgwqDCoCAvKiBQYWdlIGlzIGluIHVzZTogKChjb3VudF9pbmZvICYgUEdDX2NvdW50
X21hc2spICE9IDApLgo+ID4gKi8KPiA+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgewo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogVHlwZSByZWZlcmVuY2UgY291bnQgYW5kIHZhcmlvdXMg
UEdUX3h4eCBmbGFncyBhbmQKPiA+IGZpZWxkcy4gKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGxvbmcgdHlwZV9pbmZvOwo+ID4gK8KgwqDCoMKgwqDCoMKgIH0gaW51c2U7
Cj4gPiArwqDCoMKgwqDCoMKgwqAgLyogUGFnZSBpcyBvbiBhIGZyZWUgbGlzdDogKChjb3VudF9p
bmZvICYgUEdDX2NvdW50X21hc2spCj4gPiA9PQo+ID4gMCkuICovCj4gPiArwqDCoMKgwqDCoMKg
wqAgdW5pb24gewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIEluZGV4IG9mIHRoZSBmaXJzdCAqcG9zc2libHkqIHVuc2NydWJiZWQgcGFn
ZQo+ID4gaW4KPiA+IHRoZSBidWRkeS4KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIE9uZSBtb3JlIGJpdCB0aGFuIG1heGltdW0gcG9zc2libGUgb3JkZXIgdG8KPiA+IGFj
Y29tbW9kYXRlCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBJTlZBTElE
X0RJUlRZX0lEWC4KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4g
KyNkZWZpbmUgSU5WQUxJRF9ESVJUWV9JRFggKCgxVUwgPDwgKE1BWF9PUkRFUiArIDEpKSAtIDEp
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmlyc3Rf
ZGlydHk6TUFYX09SREVSICsgMTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyogRG8gVExCcyBuZWVkIGZsdXNoaW5nIGZvciBzYWZldHkgYmVmb3JlIG5leHQKPiA+
IHBhZ2UKPiA+IHVzZT8gKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9v
bCBuZWVkX3RsYmZsdXNoOjE7Cj4gPiArCj4gPiArI2RlZmluZSBCVUREWV9OT1RfU0NSVUJCSU5H
wqDCoMKgIDAKPiA+ICsjZGVmaW5lIEJVRERZX1NDUlVCQklOR8KgwqDCoMKgwqDCoMKgIDEKPiA+
ICsjZGVmaW5lIEJVRERZX1NDUlVCX0FCT1JUwqDCoMKgwqDCoCAyCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgc2NydWJfc3RhdGU6MjsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHVuc2lnbmVkIGxvbmcgdmFsOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBm
cmVlOwo+ID4gKwo+ID4gK8KgwqDCoCB9IHU7Cj4gPiArCj4gPiArwqDCoMKgIHVuaW9uIHsKPiA+
ICvCoMKgwqDCoMKgwqDCoCAvKiBQYWdlIGlzIGluIHVzZSwgYnV0IG5vdCBhcyBhIHNoYWRvdy4g
Ki8KPiA+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLyogT3duZXIgb2YgdGhpcyBwYWdlICh6ZXJvIGlmIHBhZ2UgaXMgYW5vbnltb3VzKS4gKi8K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkb21haW4gKmRvbWFpbjsKPiA+ICvC
oMKgwqDCoMKgwqDCoCB9IGludXNlOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgIC8qIFBhZ2Ug
aXMgb24gYSBmcmVlIGxpc3QuICovCj4gPiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIE9yZGVyLXNpemUgb2YgdGhlIGZyZWUgY2h1bmsgdGhp
cyBwYWdlIGlzIHRoZSBoZWFkCj4gPiBvZi4gKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHVuc2lnbmVkIGludCBvcmRlcjsKPiA+ICvCoMKgwqDCoMKgwqDCoCB9IGZyZWU7Cj4gPiArCj4g
PiArwqDCoMKgIH0gdjsKPiA+ICsKPiA+ICvCoMKgwqAgdW5pb24gewo+ID4gK8KgwqDCoMKgwqDC
oMKgIC8qCj4gPiArwqDCoMKgwqDCoMKgwqDCoCAqIFRpbWVzdGFtcCBmcm9tICdUTEIgY2xvY2sn
LCB1c2VkIHRvIGF2b2lkIGV4dHJhIHNhZmV0eQo+ID4gZmx1c2hlcy4KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgICogT25seSB2YWxpZCBmb3I6IGEpIGZyZWUgcGFnZXMsIGFuZCBiKSBwYWdlcyB3aXRo
IHplcm8KPiA+IHR5cGUgY291bnQKPiA+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKg
wqDCoMKgwqAgdWludDMyX3QgdGxiZmx1c2hfdGltZXN0YW1wOwo+ID4gK8KgwqDCoCB9Owo+ID4g
K8KgwqDCoCB1aW50NjRfdCBwYWQ7CkkgdGhpbmsgaXQgY2FuIGJlIHJlbW92ZWQgdG9vLiBUaGUg
Y2hhbmdlcyB3ZXJlbid0IHNhdmVkLiAoIEp1c3QKYW5vdGhlciBvbmUgcmVtaW5kZXIgZm9yIG1l
ICkuCgpTb3JyeSBmb3IgdGhlIGNvbnZlbmllbmNlLgoKfiBPbGVrc2lpCj4gCg==


