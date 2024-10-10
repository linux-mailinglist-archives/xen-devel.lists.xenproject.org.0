Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7414E998BEB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 17:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816321.1230545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syvGw-0008OD-SB; Thu, 10 Oct 2024 15:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816321.1230545; Thu, 10 Oct 2024 15:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syvGw-0008LW-PS; Thu, 10 Oct 2024 15:40:14 +0000
Received: by outflank-mailman (input) for mailman id 816321;
 Thu, 10 Oct 2024 15:40:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irsw=RG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syvGw-0008LQ-7L
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 15:40:14 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efe181d7-871d-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 17:40:12 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a99650da839so178844166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 08:40:12 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7f2437csm103879666b.57.2024.10.10.08.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 08:40:11 -0700 (PDT)
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
X-Inumbo-ID: efe181d7-871d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728574811; x=1729179611; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vhbW0zBfmQD0EuNUwsdDuIFeu0hN4xx/kzFjHoc4NxQ=;
        b=lP+lXu4YyESIwzS17wSZvHnIbtnhrN7hzIkavNXF8FE+o48UfhQSrrVkaEG5mDv9wC
         zkZSgPRnTujBBjFQKM+GklgvBzqaNDRlCPYRGk9c6i7kGq2YPMbnEIAuDY8yHTRfFAdp
         XRWKeffJ232xDJwztiwK1gC2nxajr2TqJiPob01Y+g5AlWrYM0sh0piYWiKz+YT1qzgQ
         5a8xPJazHEn31PVa06tY8v8lTTiPIIkM5+tcZ/6MamNJXomY7fByalBzUXVAgInfxKgz
         eQBpvqzoTPQSdS95uitw1MhKnWSfnkgBxUKqM3BoP4RQm4PnhYkeAJF+JiDfSvQ3xIMf
         w1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574811; x=1729179611;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhbW0zBfmQD0EuNUwsdDuIFeu0hN4xx/kzFjHoc4NxQ=;
        b=KW+9iYGiYye/urpQ85fZ0x7S0gXhMJxWqopAO6ylWH62LEbOngSGRHyIRWkFxM7ZrO
         WI20c+LuCX2/4jGmXDGW0GCtILicqtvjL+n7nvhzkIZ6T4ochxCwNcbs2A0pIj12WK1i
         2vyJCGzrEqXbe60C3PENUELMM2PfmQ9zCVhx9s0BN8CYmdeMETygkRyYWHnpi5K2zD18
         ZqSuZizLUhXjVAt/ec58g/hThUqBZCmSxHCp0RLffbZdFd/jJdKlhFMe7zPxaCb8rIDM
         D2/cAASc20Eu5OCnVc/qaH5fHEKxhnLYr15tgIPFv+s8CHZXe6GmlvrsfdhohrgQSZq8
         IvjA==
X-Forwarded-Encrypted: i=1; AJvYcCVSpAA/0j6+cK+2pU+zDqORddcTMGxiKc1PsZ6UwoiyvYYmUvn5nCn303xrXIv2WT+0IP4UGmYDwk4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxl1+ZSy9h7jzBve2V9U7tO0tcYrPHjpVEzRcrGvJkAM80G4brF
	7mqrILbb87mI4kPs0NrYa9zkLOeUCqMYRXASf//TW5BIuDnAzS6X
X-Google-Smtp-Source: AGHT+IFoKLV4O1yDKoJdXj/39SLcIR8KmhXuX+cVNoNHyMYYyMF6CpsoQWXa6mjqnGa83kqSofQYzw==
X-Received: by 2002:a17:907:e65c:b0:a99:5773:3612 with SMTP id a640c23a62f3a-a998d202140mr614943966b.36.1728574811335;
        Thu, 10 Oct 2024 08:40:11 -0700 (PDT)
Message-ID: <1915f5c78a9282d4b00c330c59749f22e6dd4ef8.camel@gmail.com>
Subject: Re: [PATCH v3 0/6] Enable early bootup of AArch64 MPU systems
From: oleksii.kurochko@gmail.com
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Date: Thu, 10 Oct 2024 17:40:10 +0200
In-Reply-To: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

SGVsbG8gQXlhbiwKCkkgdGhpbmsgdGhhdCB3ZSBoYXZlIHRvIG1lbnRpb24gaW4gQ0hBTkdFTE9H
Lm1kIHRoYXQgZXhwZXJpbWVudGFsCnN1cHBvcnQgb2YgWGVuIHdpdGggTVBVIGZvciBBcm0gaXMg
YWRkZWQuICggaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseQp3aGF0IGlzIHRoaXMgcGF0Y2ggc2Vy
aWVzIGFib3V0ICkuCgpUaGFua3MuCgp+IE9sZWtzaWkKT24gVGh1LCAyMDI0LTEwLTEwIGF0IDE1
OjAzICswMTAwLCBBeWFuIEt1bWFyIEhhbGRlciB3cm90ZToKPiBXZSBoYXZlIGVuYWJsZWQgZWFy
bHkgYm9vdGluZyBvZiBSODIuCj4gCj4gQ2hhbmdlcyBmcm9tIHYyIDotCj4gMS4gQWRkZWQgYSBu
ZXcgcGF0Y2ggInhlbi9hcm06IFNraXAgaW5pdGlhbGl6aW5nIHRoZSBCU1Mgc2VjdGlvbiB3aGVu
Cj4gaXQgaXMgZW1wdHkiLgo+IDIuIFNwbGl0ICJ4ZW4vYXJtOiBtcHU6IENyZWF0ZSBib290LXRp
bWUgTVBVIHByb3RlY3Rpb24gcmVnaW9ucyIgaW50bwo+IDIgcGF0Y2hlcy4KPiAKPiBBeWFuIEt1
bWFyIEhhbGRlciAoNik6Cj4gwqAgeGVuL2FybTogU2tpcCBpbml0aWFsaXppbmcgdGhlIEJTUyBz
ZWN0aW9uIHdoZW4gaXQgaXMgZW1wdHkKPiDCoCB4ZW4vYXJtOiBtcHU6IEludHJvZHVjZSBjaG9p
Y2UgYmV0d2VlbiBNTVUgYW5kIE1QVQo+IMKgIHhlbi9hcm06IG1wdTogRGVmaW5lIFhlbiBzdGFy
dCBhZGRyZXNzIGZvciBNUFUgc3lzdGVtcwo+IMKgIHhlbi9hcm06IG1wdTogQ3JlYXRlIGJvb3Qt
dGltZSBNUFUgcHJvdGVjdGlvbiByZWdpb25zCj4gwqAgeGVuL2FybTogbXB1OiBFbmFibGUgTVBV
Cj4gwqAgeGVuL2FybTogbXB1OiBJbXBsZW1lbnQgYSBkdW1teSBlbmFibGVfc2Vjb25kYXJ5X2Nw
dV9tbQo+IAo+IMKgU1VQUE9SVC5tZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+IMKgeGVuL2FyY2gv
S2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKwo+IMKgeGVuL2FyY2gvYXJtL0tjb25maWfCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDI3ICsrLQo+IMKgeGVuL2FyY2gv
YXJtL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCAxICsKPiDCoHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsKPiDCoHhlbi9hcmNoL2FybS9hcm02NC9t
cHUvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPiDCoHhlbi9h
cmNoL2FybS9hcm02NC9tcHUvaGVhZC5TwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MTY1Cj4gKysrKysrKysrKysrKysrKysrKwo+IMKgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Fy
bTY0L21wdS9zeXNyZWdzLmggfMKgIDMwICsrKysKPiDCoHhlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9jb25maWcuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNCArLQo+IMKgeGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL21tLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAg
MiArCj4gwqB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L2FybTY0L21tLmjCoMKgwqDCoMKg
IHzCoCAyMiArKysKPiDCoHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUvbGF5b3V0LmjCoMKg
wqDCoMKgwqDCoCB8wqAgMzMgKysrKwo+IMKgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9t
bS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjAgKysrCj4gwqB4ZW4vYXJjaC9hcm0vcGxh
dGZvcm1zL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPiDC
oHhlbi9hcmNoL2FybS9zZXR1cC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxMyArKwo+IMKgeGVuL2FyY2gvYXJtL3hlbi5sZHMuU8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKwo+IMKgMTYgZmls
ZXMgY2hhbmdlZCwgMzI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2FybTY0L21wdS9NYWtlZmlsZQo+IMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TCj4gwqBjcmVhdGUgbW9kZSAx
MDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L21wdS9zeXNyZWdzLmgKPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L2FybTY0L21tLmgK
PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L2xheW91
dC5oCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9t
bS5oCj4gCgo=


