Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18176AB51
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 10:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573831.898775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQl5S-00038k-3i; Tue, 01 Aug 2023 08:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573831.898775; Tue, 01 Aug 2023 08:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQl5S-00036f-0n; Tue, 01 Aug 2023 08:50:38 +0000
Received: by outflank-mailman (input) for mailman id 573831;
 Tue, 01 Aug 2023 08:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zpAT=DS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qQl5Q-00036Z-MG
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 08:50:36 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a5e2ab2-3048-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 10:50:34 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe0d5f719dso8918939e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 01:50:34 -0700 (PDT)
Received: from [192.168.203.100] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a197505000000b004fb738796casm2459971lfe.40.2023.08.01.01.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 01:50:32 -0700 (PDT)
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
X-Inumbo-ID: 7a5e2ab2-3048-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690879834; x=1691484634;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=euq1qPdtfnAaXo3+i1yckJxd7MWbpEfx+jqJg8HWVv0=;
        b=ePa6RAL5LAxnlVC1eUbu8IZbvWhzulAtxvVyDHJ0LGmEWS1gbzRAcjZWKnuS0zGPG7
         Nd1A3a5UwgVIP0RMYn97Tz7JKhdc8vqcWq4oQKvMz4XDcYpQMrpYs/HmMHdT7OFMipTA
         EU2CrENjRjAdOEYHElekiGK03MfKFa8zljxj50dWdEE2dHD4b5OMdzC0Ty7ydvU46Y0T
         HMddIiFIV9au8f8MU7r64qAoZgiF9+RmNWNMC5psj6+Mkj6+0avzZqDCf0ObvsMHgsE1
         uGGwYCd7EXhPywwu/lQH6C54wBfU4KMajkbo3kvBeGiJpXmU3rXak+KpX5uYYMJvFXok
         eiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690879834; x=1691484634;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euq1qPdtfnAaXo3+i1yckJxd7MWbpEfx+jqJg8HWVv0=;
        b=foLEKTjH6zgFXYY2rRunswll16nz4Fn+F12hcNC9i+ItmVxBd/eL49axEduz/mZBbF
         6LtD3XqJwwosLcAWO7KMaTaKscassKMOP9bYpo8f331z8HLFLO870ucAEU0DyCCULjTG
         MIZBkX56huhYE9yJcoOmSCCXoGKhXQtBb6SvXGPSk/9Ke/HrKh3battYB0QYwFmUe/fN
         ZwxWgmVmayAuI7rANBrpujsNwJba7AieMUsWPtqn3L0kG8Uu3zqQwl1UJ52GWdQqYKph
         451IclfksYel0htlL2g8/J9MeL79qeuWA69cMCItwTOBwIEKvKSf6URcb5yb4dasBNA0
         /mEg==
X-Gm-Message-State: ABy/qLb1tp73rFtmuamg1moVao3qZNgRijChuXPHB++QFAV7ZL5vpeFb
	t9HDZq7kSdXaLDd7kKM5am0=
X-Google-Smtp-Source: APBJJlHAlOnZJh6Sprr38MD3TiMWYKeUD4U5eIteWw0pal75KsZsrE+Oy7ZQgaxhlcIalUHITsaOMQ==
X-Received: by 2002:a05:6512:b8b:b0:4fe:cc0:348 with SMTP id b11-20020a0565120b8b00b004fe0cc00348mr2130059lfv.66.1690879833536;
        Tue, 01 Aug 2023 01:50:33 -0700 (PDT)
Message-ID: <0bcbcb53db1f0c9ae279347c3f5c762e5324dd15.camel@gmail.com>
Subject: Re: [PATCH v5 2/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 01 Aug 2023 11:50:32 +0300
In-Reply-To: <911eba8e-a92b-896c-e5dc-e54dcd570664@suse.com>
References: <cover.1690464789.git.oleksii.kurochko@gmail.com>
	 <ab2e719bbe071c3d5c4e3341573c0848dfcee3ee.1690464789.git.oleksii.kurochko@gmail.com>
	 <911eba8e-a92b-896c-e5dc-e54dcd570664@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

T24gTW9uLCAyMDIzLTA3LTMxIGF0IDE2OjA3ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyNy4wNy4yMDIzIDE1OjM4LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIGEveGVu
L2FyY2gvcmlzY3YvcmlzY3Y2NC9oZWFkLlMKPiA+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L3Jpc2N2
NjQvaGVhZC5TCj4gPiBAQCAtMzksNiArMzksMjMgQEAgRU5UUlkoc3RhcnQpCj4gPiDCoMKgwqDC
oMKgwqDCoMKgIGphbMKgwqDCoMKgIGNhbGNfcGh5c19vZmZzZXQKPiA+IMKgwqDCoMKgwqDCoMKg
wqAgbXbCoMKgwqDCoMKgIHMyLCBhMAo+ID4gwqAKPiA+ICvCoMKgwqDCoMKgwqDCoCBqYWzCoMKg
wqDCoCBzZXR1cF9pbml0aWFsX3BhZ2V0YWJsZXMKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoCAv
KiBDYWxjdWxhdGUgcHJvcGVyIFZBIGFmdGVyIGp1bXAgZnJvbSAxOjEgbWFwcGluZyAqLwo+ID4g
K8KgwqDCoMKgwqDCoMKgIGxhwqDCoMKgwqDCoCB0MCwgLkxfcHJpbWFyeV9zd2l0Y2hlZAo+ID4g
K8KgwqDCoMKgwqDCoMKgIHN1YsKgwqDCoMKgIHQwLCB0MCwgczIKPiA+ICsKPiA+ICvCoMKgwqDC
oMKgwqDCoCBtdsKgwqDCoMKgwqAgYTAsIHQwCj4gPiArwqDCoMKgwqDCoMKgwqAgamFswqDCoMKg
wqAgdHVybl9vbl9tbXUKPiAKPiBBbnkgcmVhc29uIHlvdSBkb24ndCBkbyB0aGUgY2FsY3VsYXRp
b24gcmlnaHQgaW4gYTA/ClByb2JhYmx5IGl0IHdhcyBiZWZvcmUuIEJ1dCB5b3UgYXJlIHJpZ2h0
IHRoZXJlIGlzIG5vIGFueSBzZW5zZSBpbgp1c2luZyBvZiB0MCBpbiB0aGUgY3VycmVudCBjb2Rl
LgpJJ2xsIHVwZGF0ZSB0aGF0LiBUaGFua3MuCgo+IAo+ID4gQEAgLTU0LDMgKzcxLDE4IEBAIEVO
VFJZKHJlc2V0X3N0YWNrKQo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqAgcmV0Cj4gPiDCoAo+
ID4gK8KgwqDCoMKgwqDCoMKgIC5zZWN0aW9uIC50ZXh0LmlkZW50LCAiYXgiLCAlcHJvZ2JpdHMK
PiA+ICsKPiA+ICtFTlRSWSh0dXJuX29uX21tdSkKPiA+ICvCoMKgwqDCoMKgwqDCoCBzZmVuY2Uu
dm1hCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAgbGnCoMKgwqDCoMKgIHQwLCBSVl9TVEFHRTFf
TU9ERQo+ID4gK8KgwqDCoMKgwqDCoMKgIGxpwqDCoMKgwqDCoCB0MSwgU0FUUF9NT0RFX1NISUZU
Cj4gPiArwqDCoMKgwqDCoMKgwqAgc2xswqDCoMKgwqAgdDAsIHQwLCB0MQo+IAo+IENhbid0IHRo
ZSBsYXN0IHR3byBiZSBmb2xkZWQgdG8KPiAKPiDCoMKgwqDCoMKgwqDCoCBzbGxpwqDCoMKgwqAg
dDAsIHQwLCBTQVRQX01PREVfU0hJRlQKPiAKPiAoSSBkb24ndCByZWNhbGwgd2hhdCBsaSdzIHZh
bGlkIHZhbHVlIHJhbmdlIGlzLCBzbyBJJ20gbm90IHN1cmUgaWYKPiAKPiDCoMKgwqDCoMKgwqDC
oCBsacKgwqDCoMKgwqAgdDAsIFJWX1NUQUdFMV9NT0RFIDw8IFNBVFBfTU9ERV9TSElGVAo+IAo+
IHdvdWxkIGJlIGFuIG9wdGlvbi4pCkJvdGggb2Ygb3B0aW9ucyB3aWxsIHdvcmsgYnV0IEkgcHJl
ZmVyIHRvIHVzZSBTTExJIGFzIExJIGV4cGFuZHMgaW50byBhCnBvdGVudGlhbGx5IGxvbmcgYW5k
IGluZWZmaWNpZW50IHNoaWZ0LWFuZC1hZGQgc2VxdWVuY2UgKCBidXQgaW4gdGhpcwpjYXNlIEkg
dGhpbmsgdGhpcyBpcyBub3Qgc28gaW1wb3J0YW50ICkuCj4gCj4gRXZlcnl0aGluZyBlbHNlIGxv
b2tzIGdvb2QgdG8gbWUgbm93LCBidXQgd2lsbCBvZiBjb3Vyc2Ugd2FudCBhCj4gbWFpbnRhaW5l
ciBsb29raW5nIG92ZXIuCldvdWxkIGl0IGJlIGJldHRlciB0byBzZW5kIGEgbmV3IHZlcnNpb24g
bm93IG9yIHdhaXQgZm9yIGEgcmVzcG9uc2UKZnJvbSBvdGhlciBtYWludGFpbmVycz8KCn4gT2xl
a3NpaQo=


