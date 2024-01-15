Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0117582D5F0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 10:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667249.1038323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJGs-0001wf-RA; Mon, 15 Jan 2024 09:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667249.1038323; Mon, 15 Jan 2024 09:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJGs-0001uh-NT; Mon, 15 Jan 2024 09:28:42 +0000
Received: by outflank-mailman (input) for mailman id 667249;
 Mon, 15 Jan 2024 09:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TGva=IZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPJGq-0001uU-Mm
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 09:28:40 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76a93505-b388-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 10:28:38 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-558ac3407eeso4245776a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 01:28:38 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 gc9-20020a170906c8c900b00a26f1f36708sm5057649ejb.78.2024.01.15.01.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 01:28:37 -0800 (PST)
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
X-Inumbo-ID: 76a93505-b388-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705310918; x=1705915718; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7+IfC7nTCHh8oZHfuYjonPeTJCBGQBnZJJ9mWA4ybBg=;
        b=Zr870K9TLJCqYtxacLyr91grGluxidRGfm3S/k9AqcaHuJkmAtJpXx5lOyatvdHIPa
         5yBgAwu5ACMAgvj9Fphly6Phk2QobWPX7BIKJ+YKFW527vGbqmeKtLRXMK5OTggJrSDM
         R7I2OrPxLas/DaGPPWNtnpSMGR//YSPYIvMJQ/DWnwwSpi9Ol3JzMXseWFDS577LREUI
         hE8jdlc4gNrRxbxu0xTk9Pzku7GDpd2wxX5079ipbD69fTZGPb7s20t3N1ImLANEqVmJ
         lXSsXXUZ3uxFfjemPISC5dPxy4vYGWr89wA7xI0X3WR8hJ+MwaKvRDV6N5xOjIQPQiU5
         o5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705310918; x=1705915718;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+IfC7nTCHh8oZHfuYjonPeTJCBGQBnZJJ9mWA4ybBg=;
        b=EoJD1avFzkOvmWgV+vXWQv531FAy+HehZ5hAJX6KB7EFMU0bpRb/DzuSscVCmRwkUF
         9Yj4xxrugaheloyJOALDiWzvGNdbckP3SiM8WjDOpctB41oSxGF3wM88T8Q7+6m2kKIh
         xuRAc1v0pQZPnTjzcPoSQFleSY2twBu7oqTP4L2SRBBXDT4sWQTqNSc3LlZ077BEB76d
         Fk2H2oKx5EhPUu4Kw7MnQf5OunKk+O0RUoVxEMddfKUW9h1rfOkdEaDJ1Sc8KtcQKPfR
         y1GoIt1Gr9p6vZAd0DZfcKO6DqatiW7UF2JeSdelbLIrG3JGkm7BJAhiK5WM7SPfJdyd
         Zyww==
X-Gm-Message-State: AOJu0YyRlED0+xQO+G8ZA6hov8SMNBy/LTzfFs+fi4bqdCtJ9JLUHNSW
	QrNDYJZiTvr0Do+IndJQraI=
X-Google-Smtp-Source: AGHT+IENWWoOp+qDp5OV+psCAvRpeIdzwELhzYM+fK26FoIdeZc0ze5Dh0IHEWV2vllccJbQQuoQww==
X-Received: by 2002:a17:907:a0d3:b0:a2d:474e:8236 with SMTP id hw19-20020a170907a0d300b00a2d474e8236mr1504953ejc.134.1705310917851;
        Mon, 15 Jan 2024 01:28:37 -0800 (PST)
Message-ID: <68d40ce9945939ce707707a07417d2fbe538509b.camel@gmail.com>
Subject: Re: [PATCH v3 09/34] xen/riscv: introduce system.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 15 Jan 2024 11:28:36 +0200
In-Reply-To: <8ca3cc48-47d4-4200-b373-a92a732b59b8@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <e577e055932d05ec34f01db57d1b2d2b1be5418d.1703255175.git.oleksii.kurochko@gmail.com>
	 <8ca3cc48-47d4-4200-b373-a92a732b59b8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gVGh1LCAyMDI0LTAxLTExIGF0IDE3OjAwICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyMi4xMi4yMDIzIDE2OjEyLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3lzdGVtLmgKPiA+IEBA
IC0wLDAgKzEsOTAgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5ICovCj4gPiArCj4gPiArI2lmbmRlZiBfQVNNX1JJU0NWX0JBUlJJRVJfSAo+ID4gKyNkZWZp
bmUgX0FTTV9SSVNDVl9CQVJSSUVSX0gKPiAKPiBzL0JBUlJJRVIvU1lTVEVNLyA/ClllcywgaXQg
c2hvdWxkIGJlIFNZU1RFTS4gVGhhbmtzIGZvciBub3RpY2luZyB0aGF0LgoKPiAKPiBXaXRoIHRo
YXQgdGFrZW4gY2FyZSBvZiAod2hpY2ggSSdkIGJlIGhhcHB5IHRvIGRvIHdoaWxlIGNvbW1pdHRp
bmcpCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KVGhhbmtzIGEg
bG90LiBJJ2xsIGJlIGhhcHB5IHdpdGggdGhhdC4KCj4gCj4gPiArI2luY2x1ZGUgPHhlbi9zdGRi
b29sLmg+Cj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9jc3IuaD4KPiA+ICsKPiA+ICsjaWZuZGVm
IF9fQVNTRU1CTFlfXwo+ID4gKwo+ID4gKyNkZWZpbmUgUklTQ1ZfRkVOQ0UocCwgcykgXAo+ID4g
K8KgwqDCoCBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoICJmZW5jZSAiICNwICIsIiAjcyA6IDogOiAi
bWVtb3J5IiApCj4gPiArCj4gPiArLyogVGhlc2UgYmFycmllcnMgbmVlZCB0byBlbmZvcmNlIG9y
ZGVyaW5nIG9uIGJvdGggZGV2aWNlcyBvcgo+ID4gbWVtb3J5LiAqLwo+ID4gKyNkZWZpbmUgbWIo
KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJJU0NWX0ZFTkNFKGlvcncs
IGlvcncpCj4gPiArI2RlZmluZSBybWIoKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBSSVNDVl9GRU5DRShpciwgaXIpCj4gPiArI2RlZmluZSB3bWIoKcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSSVNDVl9GRU5DRShvdywgb3cpCj4gPiArCj4gPiArLyog
VGhlc2UgYmFycmllcnMgZG8gbm90IG5lZWQgdG8gZW5mb3JjZSBvcmRlcmluZyBvbiBkZXZpY2Vz
LCBqdXN0Cj4gPiBtZW1vcnkuICovCj4gPiArI2RlZmluZSBzbXBfbWIoKcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBSSVNDVl9GRU5DRShydywgcncpCj4gPiArI2RlZmluZSBzbXBfcm1i
KCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJJU0NWX0ZFTkNFKHIsIHIpCj4gPiArI2Rl
ZmluZSBzbXBfd21iKCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJJU0NWX0ZFTkNFKHcs
IHcpCj4gPiArI2RlZmluZSBzbXBfbWJfX2JlZm9yZV9hdG9taWMoKSBzbXBfbWIoKQo+ID4gKyNk
ZWZpbmUgc21wX21iX19hZnRlcl9hdG9taWMoKcKgIHNtcF9tYigpCj4gPiArCj4gPiArLyoKPiA+
ICsjZGVmaW5lIHNtcF9zdG9yZV9yZWxlYXNlKHAsIHYpwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiAr
ZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCBjb21waWxldGltZV9hc3NlcnRfYXRvbWlj
X3R5cGUoKnApOyBcCj4gPiArwqDCoMKgIFJJU0NWX0ZFTkNFKHJ3LCB3KTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIFdSSVRFX09OQ0UoKnAsIHYpO8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK30gd2hpbGUgKDApCj4gPiArCj4g
PiArI2RlZmluZSBzbXBfbG9hZF9hY3F1aXJlKHApwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwK
PiA+ICsoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgdHlwZW9mKCpwKSBwMSA9IFJF
QURfT05DRSgqcCk7wqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIGNvbXBpbGV0aW1lX2Fzc2VydF9h
dG9taWNfdHlwZSgqcCk7IFwKPiA+ICvCoMKgwqAgUklTQ1ZfRkVOQ0Uocixydyk7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIHAxO8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4g
K30pCj4gPiArKi8KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbG9jYWxf
c2F2ZV9mbGFncyh2b2lkKQo+ID4gK3sKPiA+ICvCoMKgwqAgcmV0dXJuIGNzcl9yZWFkKHNzdGF0
dXMpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfaXJxX2VuYWJs
ZSh2b2lkKQo+ID4gK3sKPiA+ICvCoMKgwqAgY3NyX3NldChzc3RhdHVzLCBTU1RBVFVTX1NJRSk7
Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9pcnFfZGlzYWJsZSh2
b2lkKQo+ID4gK3sKPiA+ICvCoMKgwqAgY3NyX2NsZWFyKHNzdGF0dXMsIFNTVEFUVVNfU0lFKTsK
PiA+ICt9Cj4gPiArCj4gPiArI2RlZmluZSBsb2NhbF9pcnFfc2F2ZSh4KcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gKyh7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCB4ID0gY3NyX3Jl
YWRfY2xlYXIoQ1NSX1NTVEFUVVMsIFNTVEFUVVNfU0lFKTvCoMKgIFwKPiA+ICvCoMKgwqAgbG9j
YWxfaXJxX2Rpc2FibGUoKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+ID4gK30pCj4gPiArCj4gPiArc3RhdGljIGlubGluZSB2b2lkIGxv
Y2FsX2lycV9yZXN0b3JlKHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4gPiArewo+ID4gKwljc3Jfc2V0
KENTUl9TU1RBVFVTLCBmbGFncyAmIFNTVEFUVVNfU0lFKTsKPiA+ICt9Cj4gPiArCj4gPiArc3Rh
dGljIGlubGluZSBib29sIGxvY2FsX2lycV9pc19lbmFibGVkKHZvaWQpCj4gPiArewo+ID4gK8Kg
wqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzID0gbG9jYWxfc2F2ZV9mbGFncygpOwo+ID4gKwo+ID4g
K8KgwqDCoCByZXR1cm4gKGZsYWdzICYgU1NUQVRVU19TSUUpICE9IDA7Cj4gCj4gSnVzdCBhcyBh
IHJlbWFyayAtIHdoZW4gdGhlIHJlc3VsdGluZyB0eXBlIGlzIGJvb2wsIHdlIGdlbmVyYWxseQo+
IHByZWZlciB0byBvbWl0IHRoZSAiIT0gMCIuClRoYW5rcy4gSSdsbCB0YWtlIGludG8gYWNjb3Vu
dCB0aGF0LgoKfiBPbGVrc2lpCg==


