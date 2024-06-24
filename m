Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8891440D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:59:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746187.1153172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLebD-0005tl-LM; Mon, 24 Jun 2024 07:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746187.1153172; Mon, 24 Jun 2024 07:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLebD-0005rX-Ik; Mon, 24 Jun 2024 07:58:51 +0000
Received: by outflank-mailman (input) for mailman id 746187;
 Mon, 24 Jun 2024 07:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLebB-0005rM-Sc
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:58:49 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96e8dd5c-31ff-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 09:58:49 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so2090629e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:58:49 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63cd109sm928601e87.116.2024.06.24.00.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 00:58:48 -0700 (PDT)
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
X-Inumbo-ID: 96e8dd5c-31ff-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719215928; x=1719820728; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bzgh9U0V5X5k4TZc0szT7NP9q6c6SGTdFISDhBH2NvA=;
        b=Tc9JX/SCwsfFXDT5+N0jrykKsVWb25zIXNUZW6+FL//Ol6xcW2G6kfl3S/zyGgk9PG
         TtPuoWLVGckC92Ph72ZKuqkLYo/0fG4a9NRq1ylTpccWoogKDWRUFRFbnID+hJkIHIx+
         DafxqJUg9aZnt2EkssUZkee7oxKsK4KTY+MrcquiA5b7pRvbp3wP/21d2htCBbjk12tg
         dUl5e2Z0jKzcou2UqA0crqpvXlwZj11dLuqs4ntwZem4lQtO8XGz4Brf8/mj8fXylNOe
         l9oYVQaswtuQQTWtumYQGu3OCvsMuSBGticGrMPcVCcH5VPnpqCAo/LCGEKoq06+sgGH
         EI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215928; x=1719820728;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bzgh9U0V5X5k4TZc0szT7NP9q6c6SGTdFISDhBH2NvA=;
        b=Vr2qGVsjRKUP4gZn3zzvqCCXQv+d53j0RyfBTZm1iYy99tgvAvwZB4r5upv9IM0GHy
         eT2Php4INUCshrP6c5AM2pvf+rpppBCzhq9h6WwMhSFtzv28Vn+4jsCzGa+BvL4rApu2
         oY0aJZPvRTGFtc9ODQp9LzrKPVk6PmHX0LvUZ5VmVqh4udw1y3rHH2m7r0MbPNetZeA2
         wBMI9ohc9r1dOoNxelmTVnuH2hOFbrXY8mSqdYWoMtKCpakM8oOPH3Cy7iGqaSsibfNw
         C54hvF6qy7+8fzmpE2W1LykHwmyWUtumjU1LqnlXzBC3bqVFiYVepTDS6LmtKz+lwqcg
         fhAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvC0bOrFOfdnT+v3MVW7lQpMEt/Umes38TX+6jrQAGTEh9J+S27C1jxR5+LNKOnx2RoyW4YGWKLlwrTePu3+cc18s4DpLjZy+EF00MfTk=
X-Gm-Message-State: AOJu0Yx8D/F2tZZpAVY+cACv+panCZgkaPgnQxuQVzs79+Wv3RZq4Tuf
	D7H38XPwmJNPhQzquFMYaPnfJbx6MqhyZaY64CH7aqxvWenapubN
X-Google-Smtp-Source: AGHT+IGUCKHRMlLn7HmONKhovaIf3k6RBKZXkGbaWNgDXCbW8Wa1TfsJOFsNIq1v4Qj5YuoetaJQMQ==
X-Received: by 2002:a05:6512:607:b0:52c:d84b:93b2 with SMTP id 2adb3069b0e04-52ce18341f9mr1957411e87.15.1719215928317;
        Mon, 24 Jun 2024 00:58:48 -0700 (PDT)
Message-ID: <e3bea61f8823deec6f4742fe5ef73ea4291593e6.camel@gmail.com>
Subject: Re: [PATCH for-4.19? 0/3] xen: build adjustments for
 __read_mostly/__ro_after_init
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, George Dunlap
 <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Date: Mon, 24 Jun 2024 09:58:47 +0200
In-Reply-To: <20240621201928.319293-1-andrew.cooper3@citrix.com>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

T24gRnJpLCAyMDI0LTA2LTIxIGF0IDIxOjE5ICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
IEluIGFpZCBvZiBnZXR0aW5nIHRoZSBSSVNDLVYgYnVpbGQgd29ya2luZyB3aXRob3V0IGludHJv
ZHVjaW5nIG1vcmUKPiB0ZWNobmljYWwKPiBkZWJ0LsKgIEl0J3MgZG9uZSBieSBtYWtpbmcgUFBD
IHNoZWQgaXQncyBjb3B5IG9mIHNhaWQgdGVjaG5pY2FsIGRlYnQuCj4gCj4gQnVpbGQgdGVzdGVk
IHF1aXRlIHRob3JvdWdobHksIGluY2x1ZGluZyBpbiBHaXRsYWIuClJlbGVhc2UtQWNrZWQtYnk6
IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPgoKfiBPbGVrc2lp
Cj4gCj4gQW5kcmV3IENvb3BlciAoMyk6Cj4gwqAgeGVuL3Jpc2N2OiBEcm9wIGxlZ2FjeSBfX3Jv
X2FmdGVyX2luaXQgZGVmaW5pdGlvbgo+IMKgIHhlbi9wcGM6IEFkanVzdCBwcGM2NF9kZWZjb25m
aWcKPiDCoCB4ZW4vcHBjOiBBdm9pZCB1c2luZyB0aGUgbGVnYWN5IF9fcmVhZF9tb3N0bHkvX19y
b19hZnRlcl9pbml0Cj4gwqDCoMKgIGRlZmluaXRpb25zCj4gCj4gwqB4ZW4vYXJjaC9wcGMvY29u
Zmlncy9wcGM2NF9kZWZjb25maWcgfCA2IC0tLS0tLQo+IMKgeGVuL2FyY2gvcHBjL2luY2x1ZGUv
YXNtL2NhY2hlLmjCoMKgwqDCoCB8IDMgLS0tCj4gwqB4ZW4vYXJjaC9wcGMvbW0tcmFkaXguY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4gwqB4ZW4vYXJjaC9wcGMvc3R1YnMuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNyArKysrKysrCj4gwqB4ZW4vYXJjaC9y
aXNjdi9tbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0KPiDCoHhl
bi9jb21tb24vYXJnby5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAx
ICsKPiDCoHhlbi9jb21tb24vY3B1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMSArCj4gwqB4ZW4vY29tbW9uL2RlYnVndHJhY2UuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMSArCj4gwqB4ZW4vY29tbW9uL2RvbWFpbi5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDEgKwo+IMKgeGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDIgKysKPiDCoHhlbi9jb21tb24va2V5aGFuZGxlci5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPiDCoHhlbi9jb21tb24vbWVtb3J5LmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4gwqB4ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4gwqB4ZW4vY29tbW9uL3BkeC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKwo+IMKgeGVuL2Nv
bW1vbi9yYWRpeC10cmVlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKwo+IMKgeGVu
L2NvbW1vbi9yYW5kb20uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICst
Cj4gwqB4ZW4vY29tbW9uL3JjdXBkYXRlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxICsKPiDCoHhlbi9jb21tb24vc2NoZWQvY29yZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCAxICsKPiDCoHhlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCAxICsKPiDCoHhlbi9jb21tb24vc2NoZWQvY3JlZGl0LmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMSArCj4gwqB4ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMSArCj4gwqB4ZW4vY29tbW9uL3NodXRkb3duLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAxICsKPiDCoHhlbi9jb21tb24vc3BpbmxvY2suY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDEgKwo+IMKgeGVuL2NvbW1vbi90aW1lci5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4gwqB4ZW4vY29tbW9uL3ZlcnNpb24uY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArLS0KPiDCoHhlbi9jb21tb24vdmlydHVh
bF9yZWdpb24uY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKwo+IMKgeGVuL2NvbW1vbi92bWFwLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0KPiDCoHhlbi9kcml2
ZXJzL2NoYXIvY29uc29sZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPiDCoHhlbi9kcml2
ZXJzL2NoYXIvbnMxNjU1MC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPiDCoHhlbi9kcml2
ZXJzL2NoYXIvc2VyaWFsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQo+IMKgeGVuL2lu
Y2x1ZGUveGVuL2NhY2hlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKysKPiDCoHhl
bi9pbmNsdWRlL3hlbi9oeXBmcy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPiDC
oDMyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAoK



