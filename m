Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F5A8548F8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 13:13:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680697.1058766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raE8C-0001fc-WE; Wed, 14 Feb 2024 12:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680697.1058766; Wed, 14 Feb 2024 12:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raE8C-0001dG-TH; Wed, 14 Feb 2024 12:12:52 +0000
Received: by outflank-mailman (input) for mailman id 680697;
 Wed, 14 Feb 2024 12:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raE8B-0001d1-AT
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 12:12:51 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f42ab65-cb32-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 13:12:50 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5600c43caddso6514553a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 04:12:50 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170906454b00b00a36f9941d6dsm2236035ejq.112.2024.02.14.04.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 04:12:49 -0800 (PST)
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
X-Inumbo-ID: 5f42ab65-cb32-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707912770; x=1708517570; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9/LsC7QZmntGdTY3iDGNcgIvQvzAOpsEBfxLTw7/29I=;
        b=gPkK0O0m38Ew3Mhmm3Z6AKrUidHPF0MOcgvvnuLo0Svy41GK8sfDA+GakAtcgZsJNs
         kanCaZ6pxMDKDpT9Z47dmSmTc2o4CbPlgJaItGA1eyUYeWt57siBMaSFVc1Ogp5xIFaN
         3jgm/JfoyUrY9agNPWwSyOQiAyb7IOLRgdg6kLTpyIN+4epY5ShahiEBicwU3vr9adZj
         h5EKQo8wjKvF69J8MVHqXzupuBwajd6ky4TbopZ0Px1nfzjT/3dWEqsTlsrGuVEI1nRP
         xiFEgqj7Aq6toAYz873umpY5GsIp+Plwp/yFMlHmFBv3vfxsZnTsubmAyEghR+U0oQsN
         2aQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707912770; x=1708517570;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/LsC7QZmntGdTY3iDGNcgIvQvzAOpsEBfxLTw7/29I=;
        b=pZobQJ932YSQBzxEeyO79f/pNov8OkYKZlMqKv7kKxnEUN7Q5n3I4Joiel2HPOehZe
         8BN1xoAWUgg1cZwTm3J672Rx56bUYrY1C2uZwQ46ShnfBUhl2VWVHlCin121RfQp0JqB
         TsTAhXLpNgffEKSrc5zLk3Ea0UueFEF9gUpoFRPfgeIcbP//+k52fJ8osV+kzDP3mSzX
         csLVAIa2pmEd+sNSe96fI9o6SxoadZdLoDgHNEBInuNQsv+ZFzzIIg/1b537ADU4/BOI
         wrVx2mjhbe+460eZ/nsYwV5Xqs8/1DVFgqKlJZoJoS5kqtIbF6X3mGpp6UQUjqYRcozc
         c8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqTwDRT5C61lqnGUj2pxKOeYpcg6ZJ2XysJSHVFTC3H4hjVAi8qlHr1mTe4KMFY/KHOTOlrdE5oaCaaQ5n2P1IFC0B/PwPDZl5GlnQ67E=
X-Gm-Message-State: AOJu0Yxk/X5jflqZFIlcmGBLGq5g1XLOXkdmwJHU7zf6zhP3oDNHhFl7
	/PJXDrvX/VMdt5deESObmPVNqDnXQZeAEbOo/ma/q8or67Dfm291
X-Google-Smtp-Source: AGHT+IHag1yX4ZW/iL0HTPZQ8Kj4HYJdQD4SfJ8rblj0HMB9qTLW5Ksl2gRR5jGjmyStx8KZDtN+Cg==
X-Received: by 2002:a17:906:3b56:b0:a3c:8a77:e67d with SMTP id h22-20020a1709063b5600b00a3c8a77e67dmr1536965ejf.59.1707912769731;
        Wed, 14 Feb 2024 04:12:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKJd49HtDBikmzlizfcS+OvKQPFXHBflQuxd8gKnmO5Yin9Eb/V2C7nZygU3NU2sOxQ8gT8lVI6JQbIH0CSJZgSJLD4myyTDCVJLFdt6EfvsA/WL+gcZiI8Pfu02oReRAfUSkVnApJ79EjrH2oXDDqg9WAtWvks0wuE/o/XZV5iOBCO9CNo2dlAuipOY8hAkcrlcdsPMUmh+lANfWnDZMYbQ8q+T5QSYbkSLh1cMKiYgFvv8am3AHjUExDv+fGwHsKaZRw69psLV4KDdIZVvczOozx3eGyrjhnSxEjHCiVAuHaamHBY1o=
Message-ID: <7b52a0ea4630abdaf3704f82c2619215e5bfa694.camel@gmail.com>
Subject: Re: [PATCH v4 16/30] xen/riscv: introduce p2m.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 13:12:48 +0100
In-Reply-To: <5e5887b2-5eb4-4a81-90f6-246553c28863@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <c2a2e872f8c32d81c3d3f428f0273819dd7df081.1707146506.git.oleksii.kurochko@gmail.com>
	 <5e5887b2-5eb4-4a81-90f6-246553c28863@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTAyLTEyIGF0IDE2OjE2ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwNS4wMi4yMDI0IDE2OjMyLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogT2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+Cj4gCj4g
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiB3aXRoIHR3byBtb3Jl
IG5pdHM6Cj4gCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi94ZW4vYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wMm0uaAo+ID4gQEAgLTAsMCArMSwxMDIgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCj4gPiArI2lmbmRlZiBfX0FTTV9SSVNDVl9QMk1f
SF9fCj4gPiArI2RlZmluZSBfX0FTTV9SSVNDVl9QMk1fSF9fCj4gPiArCj4gPiArI2luY2x1ZGUg
PGFzbS9wYWdlLWJpdHMuaD4KPiA+ICsKPiA+ICsjZGVmaW5lIHBhZGRyX2JpdHMgUEFERFJfQklU
Uwo+ID4gKwo+ID4gKy8qCj4gPiArICogTGlzdCBvZiBwb3NzaWJsZSB0eXBlIGZvciBlYWNoIHBh
Z2UgaW4gdGhlIHAybSBlbnRyeS4KPiA+ICsgKiBUaGUgbnVtYmVyIG9mIGF2YWlsYWJsZSBiaXQg
cGVyIHBhZ2UgaW4gdGhlIHB0ZSBmb3IgdGhpcwo+ID4gcHVycG9zZSBpcyAyIGJpdHMuCj4gPiAr
ICogU28gaXQncyBwb3NzaWJsZSB0byBvbmx5IGhhdmUgNCBmaWVsZHMuIElmIHdlIHJ1biBvdXQg
b2YgdmFsdWUKPiA+IGluIHRoZQo+ID4gKyAqIGZ1dHVyZSwgaXQncyBwb3NzaWJsZSB0byB1c2Ug
aGlnaGVyIHZhbHVlIGZvciBwc2V1ZG8tdHlwZSBhbmQKPiA+IGRvbid0IHN0b3JlCj4gPiArICog
dGhlbSBpbiB0aGUgcDJtIGVudHJ5Lgo+ID4gKyAqLwo+ID4gK3R5cGVkZWYgZW51bSB7Cj4gPiAr
wqDCoMKgIHAybV9pbnZhbGlkID0gMCzCoMKgwqAgLyogTm90aGluZyBtYXBwZWQgaGVyZSAqLwo+
ID4gK8KgwqDCoCBwMm1fcmFtX3J3LMKgwqDCoMKgwqDCoMKgwqAgLyogTm9ybWFsIHJlYWQvd3Jp
dGUgZG9tYWluIFJBTSAqLwo+ID4gK30gcDJtX3R5cGVfdDsKPiA+ICsKPiA+ICsjaW5jbHVkZSA8
eGVuL3AybS1jb21tb24uaD4KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIGludCBnZXRfcGFnZV9h
bmRfdHlwZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGRvbWFpbiAqZG9tYWluLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyB0eXBlKQo+
ID4gK3sKPiA+ICvCoMKgwqAgQlVHX09OKCJ1bmltcGxlbWVudGVkIik7Cj4gPiArwqDCoMKgIHJl
dHVybiAtRUlOVkFMOwo+ID4gK30KPiA+ICsKPiA+ICsvKiBMb29rIHVwIGEgR0ZOIGFuZCB0YWtl
IGEgcmVmZXJlbmNlIGNvdW50IG9uIHRoZSBiYWNraW5nIHBhZ2UuCj4gPiAqLwo+ID4gK3R5cGVk
ZWYgdW5zaWduZWQgaW50IHAybV9xdWVyeV90Owo+ID4gKyNkZWZpbmUgUDJNX0FMTE9DwqDCoMKg
ICgxdTw8MCnCoMKgIC8qIFBvcHVsYXRlIFBvRCBhbmQgcGFnZWQtb3V0Cj4gPiBlbnRyaWVzICov
Cj4gPiArI2RlZmluZSBQMk1fVU5TSEFSRcKgICgxdTw8MSnCoMKgIC8qIEJyZWFrIENvVyBzaGFy
aW5nICovCj4gPiArCj4gPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFn
ZV9mcm9tX2dmbigKPiA+ICvCoMKgwqAgc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBn
Zm4sIHAybV90eXBlX3QgKnQsCj4gPiBwMm1fcXVlcnlfdCBxKQo+ID4gK3sKPiA+ICvCoMKgwqAg
QlVHX09OKCJ1bmltcGxlbWVudGVkIik7Cj4gPiArwqDCoMKgIHJldHVybiBOVUxMOwo+ID4gK30K
PiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgbWVtb3J5X3R5cGVfY2hhbmdlZChzdHJ1Y3Qg
ZG9tYWluICpkKQo+ID4gK3sKPiA+ICvCoMKgwqAgQlVHX09OKCJ1bmltcGxlbWVudGVkIik7Cj4g
PiArfQo+ID4gKwo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgaW50IGd1ZXN0X3BoeXNtYXBfbWFy
a19wb3B1bGF0ZV9vbl9kZW1hbmQoc3RydWN0Cj4gPiBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcg
Z2ZuLAo+IAo+IFRoaXMgbGluZSBsb29rcyB0byBiZSB0b28gbG9uZy4KPiAKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZAo+
ID4gaW50IG9yZGVyKQo+ID4gK3sKPiA+ICvCoMKgwqAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4g
K30KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIGludCBndWVzdF9waHlzbWFwX2FkZF9lbnRyeShz
dHJ1Y3QgZG9tYWluICpkLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBnZm5fdCBnZm4sCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1mbl90IG1mbiwKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQg
bG9uZyBwYWdlX29yZGVyLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwMm1fdHlwZV90IHQpCj4gCj4gSW5kZW50YXRpb24gaXNuJ3Qg
cXVpdGUgcmlnaHQgaGVyZS4KPiAKPiBJJ2xsIHNlZSBhYm91dCBkZWFsaW5nIHdpdGggdGhvc2Ug
d2hpbGUgY29tbWl0dGluZy4KVGhhbmtzIGEgbG90LgoKfiBPbGVrc2lpCg==


