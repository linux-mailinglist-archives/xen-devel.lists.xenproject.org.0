Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E766B6CAA03
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 18:11:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515367.798157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgpQp-0004KD-70; Mon, 27 Mar 2023 16:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515367.798157; Mon, 27 Mar 2023 16:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgpQp-0004IE-2O; Mon, 27 Mar 2023 16:10:51 +0000
Received: by outflank-mailman (input) for mailman id 515367;
 Mon, 27 Mar 2023 16:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pgpQn-0004Hs-Ho
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 16:10:49 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef431e0f-ccb9-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 18:10:47 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id h25so12153764lfv.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 09:10:47 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l17-20020ac25551000000b004cc9042c9cfsm4676568lfk.158.2023.03.27.09.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 09:10:46 -0700 (PDT)
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
X-Inumbo-ID: ef431e0f-ccb9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679933447;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jm0vGOJVMXpsgp1e2jXV2nmzYmRbltLbnCK4hDyAqn4=;
        b=qHq/8PKnuP8UbJuhJgLnpIQnmqfz7w0S3WZ+RDNJ0eeFw+R0S9hpkwLxii70vUfAOY
         VhsHj+a+vJWDFOrGdkv0mql2MnZ4R4b0c7mk2uCnaGd3olZBgXEQ/AVshXrC8Icg3Q6/
         AYR2FshsCilT7K9F8e9e5Q/kSH/jtISHsOjEk40b2CstVsOUvFBTOuSnCTM31PT9AWqg
         g7aa2n+mhZTCKxnsCQo8TRE9zBcKHXQFdiJLDNJ+lvwrFThhOgoS/kWAaMPZ7YUZ3u8I
         YC45xz8KM54cN+oknh0TrZaWJxrp9fq+r1k/Y9ItoAsvkmneaZJ4ki7cw4bh73DctxId
         o3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679933447;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jm0vGOJVMXpsgp1e2jXV2nmzYmRbltLbnCK4hDyAqn4=;
        b=5kYLUWne6ijK2NG5eFMuSomoBElkqS/CX7k+DRHXDX+Ikih6xpjsrztMyj2LpUi4Bp
         wmcHn2Q+IanoKbrpraUNJX0hqkq1Jrk4GMQWi+zU78cL3XZFy4nxkG9NKjLCSlc+N40Z
         V0Z/2h5gopAZYrWBIFt/aYVA8djR1SwdFkSXMPC8lEEjy4OWKjM/aaDyZFjQ5vktD5U9
         QTD3tjYXvgi9nOr3ju/AC3S7c/FO8Aq+DCh/1CteTU3Hft24Lz/bMsgwSOQkACeixUQX
         YAykeWcuKGoLk2QbGUadKh6W3nQoY034y/FVgJ0nooPZ51VUcEy5iBW6h6pIsOhMwpxY
         78KQ==
X-Gm-Message-State: AAQBX9dhyrwFwUZgr5latFnn9t7bE5IpJO85ZbXxmkIg+JZ7qn1ndELF
	Emdusn0q5cDqSyq6f2XCSKg=
X-Google-Smtp-Source: AKy350biPmaCaNkNTIcOUz5+3U8IrNVI+DdR7nrNkixdG4xy0CNX9B2hORxmW5Ra19uPZRLkzN85/w==
X-Received: by 2002:ac2:508d:0:b0:4e8:49f6:674f with SMTP id f13-20020ac2508d000000b004e849f6674fmr3819191lfm.36.1679933446652;
        Mon, 27 Mar 2023 09:10:46 -0700 (PDT)
Message-ID: <3febb233792329adf0cddf81efa8536a98b7151b.camel@gmail.com>
Subject: Re: [PATCH v8 5/5] xen/x86: switch x86 to use generic implemetation
 of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Mon, 27 Mar 2023 19:10:45 +0300
In-Reply-To: <9af94e49-ff66-5e7f-bf5f-ba4095cfed13@suse.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
	 <5e252e8dacea5c4f2fdbb4f7970e34a862987639.1678900513.git.oleksii.kurochko@gmail.com>
	 <9af94e49-ff66-5e7f-bf5f-ba4095cfed13@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

SGVsbG8gSmFuLAoKT24gVGh1LCAyMDIzLTAzLTE2IGF0IDEwOjUyICswMTAwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiBPbiAxNS4wMy4yMDIzIDE4OjIxLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+
ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHdlcmUgbWFkZToKPiA+ICogTWFrZSBHRU5FUklDX0JV
R19GUkFNRSBtYW5kYXRvcnkgZm9yIFg4Ngo+ID4gKiBVcGRhdGUgYXNtL2J1Zy5oIHVzaW5nIGdl
bmVyaWMgaW1wbGVtZW50YXRpb24gaW4gPHhlbi9idWcuaD4KPiA+ICogVXBkYXRlIGRvX2ludmFs
aWRfb3AgdXNpbmcgZ2VuZXJpYyBkb19idWdfZnJhbWUoKQo+ID4gKiBEZWZpbmUgQlVHX0RFQlVH
R0VSX1RSQVBfRkFUQUwgdG8KPiA+IGRlYnVnZ2VyX3RyYXBfZmF0YWwoWDg2X0VYQ19HUCxyZWdz
KQo+ID4gKiB0eXBlIG9mIGVpcCB2YXJpYWJsZSB3YXMgY2hhbmdlZCB0byAnY29uc3Qgdm9pZCAq
Jwo+ID4gKiBhZGQgJyNpbmNsdWRlIDx4ZW4vZGVidWdnZXIuaD4nCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPgo+ID4g
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IC0tLQo+ID4g
Q2hhbmdlcyBpbiBWODoKPiA+IMKgKiBtb3ZlIDx4ZW4vZGVidWdlci5oPiBmcm9tIDxhc20vYnVn
Lmg+IHRvIDxjb21tb24vYnVnLmM+IHRvIGZpeAo+ID4gY29tcGlsYXRpb24gaXNzdWUuCj4gPiDC
oMKgIFRoZSBmb2xsb3dpbmcgY29tcGlsYXRpb24gaXNzdWUgb2NjdXJzOgo+ID4gwqDCoMKgwqAg
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vc21wLmg6MTAsCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vaW5jbHVkZS94ZW4vc21w
Lmg6NCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaDoxMCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zeXN0ZW0uaDo2LAo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2F0b21pYy5oOjUsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4v
aW5jbHVkZS94ZW4vZ2Ric3R1Yi5oOjI0LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2RlYnVnZ2VyLmg6MTAsCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vaW5jbHVkZS94ZW4vZGVidWdnZXIu
aDoyNCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9idWcuaDo3LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZnJvbSAuL2luY2x1ZGUveGVuL2J1Zy5oOjE1LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZnJvbSAuL2luY2x1ZGUveGVuL2xpYi5oOjI3LAo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2luY2x1ZGUveGVuL3BlcmZjLmg6NiwKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gYXJjaC94ODYveDg2XzY0L2FzbS1v
ZmZzZXRzLmM6OToKPiA+IMKgwqDCoMKgIC4vaW5jbHVkZS94ZW4vY3B1bWFzay5oOiBJbiBmdW5j
dGlvbiAnY3B1bWFza19jaGVjayc6Cj4gPiDCoMKgwqDCoCAuL2luY2x1ZGUveGVuL2NwdW1hc2su
aDo4NDo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YKPiA+IGZ1bmN0aW9uICdBU1NF
UlQnIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgODQgfMKgwqDCoMKgwqDCoMKgwqAgQVNTRVJU
KGNwdSA8IG5yX2NwdV9pZHMpOwo+IAo+IEknbSBnb2luZyB0byBwb3N0IGEgcGF0Y2ggdG8gYWRk
cmVzcyB0aGlzIHNwZWNpZmljIGZhaWx1cmUuIEJ1dAo+IHNvbWV0aGluZwo+IHNpbWlsYXIgbWF5
IHRoZW4gc3VyZmFjZSBlbHNld2hlcmUuCj4gCj4gPiDCoMKgIEl0IGhhcHBlbnMgaW4gY2FzZSB3
aGVuIENPTkZJR19DUkFTSF9ERUJVRyBpcyBlbmFibGVkCj4gCj4gSSBoYXZlIHRvIGFkbWl0IHRo
YXQgSSBkb24ndCBzZWUgdGhlIGNvbm5lY3Rpb24gdG8gQ1JBU0hfREVCVUc6IEl0J3MKPiB0aGUK
PiBhc20vYXRvbWljLmggaW5jbHVzaW9uIHRoYXQncyBwcm9ibGVtYXRpYyBhZmFpY3MsIHlldCB0
aGF0Cj4gKG5lZWRsZXNzbHkpCj4gaGFwcGVucyBvdXRzaWRlIHRoZSByZXNwZWN0aXZlICNpZmRl
ZiBpbiB4ZW4vZ2Ric3R1Yi5oLgo+IAo+IElmIGFub3RoZXIgaW5zdGFuY2Ugb2YgdGhpcyBoZWFk
ZXIgaW50ZXJhY3Rpb24gaXNzdWUgd291bGQgc3VyZmFjZQo+IGRlc3BpdGUKPiBteSB0by1iZS1w
b3N0ZWQgcGF0Y2gsIEknZCBiZSBva2F5IHdpdGggZ29pbmcgdGhpcyByb3V0ZSBmb3IgdGhlCj4g
bW9tZW50Lgo+IEJ1dCBJIHRoaW5rIHRoZSByZWFsIGlzc3VlIGhlcmUgaXMgeGVuL2xpYi5oIGlu
Y2x1ZGluZyB4ZW4vYnVnLmguCj4gSW5zdGVhZAo+IG9mIHRoYXQsIHNvbWUgc3R1ZmYgdGhhdCdz
IHByZXNlbnRseSBpbiB4ZW4vbGliLmggc2hvdWxkIGluc3RlYWQgbW92ZQo+IHRvCj4geGVuL2J1
Zy5oLCBhbmQgdGhlIGluY2x1c2lvbiB0aGVyZSBiZSBkcm9wcGVkLiBBbnkgcGFydGllcyBhY3R1
YWxseQo+IHVzaW5nCj4gc3R1ZmYgZnJvbSB4ZW4vYnVnLmggKHhlbi9saWIuaCB0aGVuIHdvbid0
IGFueW1vcmUpIHNob3VsZCB0aGVuCj4gaW5jbHVkZQo+IHRoYXQgaGVhZGVyIHRoZW1zZWx2ZXMu
CkFzIGFsbCB5b3VyIHBhdGNoZXMgYXJlIGluIHRoZSBzdGFnaW5nLgoKQ2FuIEkgc2VuZCBhIG5l
dyBwYXRjaCB2ZXNyaW9uIHdpdGggPGFzbS9wcm9jZXNzb3IuaD4gcmVtb3ZlZCBpbgpjb21tb24v
YnVnLmMgYnV0IGxlYXZlIDx4ZW4vZGVidWdnZXIuaD4/IAoKU2hvdWxkIEkgd2FpdCBmb3IgeGVu
L2xpYi5oIHJld29ya2luZz8KPiAKPiBKYW4KPiAKPiA+IGFuZCB0aGUgcmVhc29uIGZvciB0aGF0
IGlzIHdoZW4KPiA+IMKgwqAgPHhlbi9saWIuaD4gaXMgaW5jbHVkZWQgaW4gPHg4Nl82NC9hc20t
b2Zmc2V0cy5jPjo5IHRoZSAibGF5b3V0Igo+ID4gb2YgPHhlbi9saWIuaD4gd291bGQgYmUKPiA+
IMKgwqAgdGhlIGZvbGxvd2luZzoKPiA+IMKgwqDCoMKgICNpbmNsdWRlIDx4ZW4vYnVnLmg+Ogo+
ID4gwqDCoMKgwqAgI2luY2x1ZGUgPGFzbS9idWcuaD46Cj4gPiDCoMKgwqDCoCAjaW5jbHVkZSA8
eGVuL2RlYnVnZ2VyLmg+Ogo+ID4gwqDCoMKgwqDCoMKgwqDCoCAuLi4uCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjcHVtYXNrLmg6Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC4uLi4KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEFTU0VSVChjcHUgPCBucl9jcHVfaWRzKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBjcHU7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC4uLi4gCj4gPiDCoMKgwqDCoCAuLi4uCj4gPiDCoMKgwqDCoCAj
ZGVmaW5lIEFTU0VSVCAuLi4KPiA+IMKgwqDCoMKgIC4uLi4KPiA+IMKgwqAgVGhlcmVieSBBU1NF
UlQgaXMgZGVmaW5lZCBhZnRlciBpdCB3YXMgdXNlZCBpbiA8eGVuL2NwdW1hc2suaD4uCj4gCn4g
T2xla3NpaQo=


