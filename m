Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E65866C5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 11:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378615.611899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRYm-0007xN-2T; Mon, 01 Aug 2022 09:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378615.611899; Mon, 01 Aug 2022 09:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRYl-0007v3-Vg; Mon, 01 Aug 2022 09:17:59 +0000
Received: by outflank-mailman (input) for mailman id 378615;
 Mon, 01 Aug 2022 09:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+DYs=YF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oIRYk-0007uw-2x
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 09:17:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d46d4bea-117a-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 11:17:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 77D6733870;
 Mon,  1 Aug 2022 09:17:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 427B513A72;
 Mon,  1 Aug 2022 09:17:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mHrODkSa52K2RAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Aug 2022 09:17:56 +0000
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
X-Inumbo-ID: d46d4bea-117a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659345476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PxsDc5m20e5Eci47Dxy8fK2iaZniJKvQH6LB2YF1EWI=;
	b=ouMb/1n+bdAG6raHuwP5UhQVumEvIPWpSYjei03GWh/zuGHmcxJ+qnm11mjzsdZL6DL9+j
	hF9aPCMWJ7bdbHotPcGnT/Wc/s2kyNqes5Kx4NetFVMGgIiq62iwE8smTDsVp05kiDkWO6
	Zb41OKhX2DiNUKZZDe/v3WNlH9b7yhI=
Message-ID: <c4e52add-d877-02df-abd3-52b7b98d7df0@suse.com>
Date: Mon, 1 Aug 2022 11:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] tools: allow vchan XenStore paths more then 64
 bytes long
Content-Language: en-US
To: Dmytro Semenets <dmitry.semenets@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
 <20220713150311.4152528-2-dmitry.semenets@gmail.com>
 <124efe96-ed51-6312-75a8-1248724b619e@suse.com>
 <CACM97VVkUQE7rW2BD+cDkPAc2=RivWj2XrXXNUBJt5zXEqMtAg@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <CACM97VVkUQE7rW2BD+cDkPAc2=RivWj2XrXXNUBJt5zXEqMtAg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2eISXCCW8aR0xJafqa0ie0Mt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2eISXCCW8aR0xJafqa0ie0Mt
Content-Type: multipart/mixed; boundary="------------I8282SLi00U1vrM0W8o4438c";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dmytro Semenets <dmitry.semenets@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
Message-ID: <c4e52add-d877-02df-abd3-52b7b98d7df0@suse.com>
Subject: Re: [PATCH v2 2/4] tools: allow vchan XenStore paths more then 64
 bytes long
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
 <20220713150311.4152528-2-dmitry.semenets@gmail.com>
 <124efe96-ed51-6312-75a8-1248724b619e@suse.com>
 <CACM97VVkUQE7rW2BD+cDkPAc2=RivWj2XrXXNUBJt5zXEqMtAg@mail.gmail.com>
In-Reply-To: <CACM97VVkUQE7rW2BD+cDkPAc2=RivWj2XrXXNUBJt5zXEqMtAg@mail.gmail.com>

--------------I8282SLi00U1vrM0W8o4438c
Content-Type: multipart/mixed; boundary="------------i09rm9VRC3tE7gCHKpcoM9qw"

--------------i09rm9VRC3tE7gCHKpcoM9qw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDguMjIgMTE6MTEsIERteXRybyBTZW1lbmV0cyB3cm90ZToNCj4g0L/QvSwgMSDQ
sNCy0LMuIDIwMjIg0LMuINCyIDExOjU5LCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Og0KPj4NCj4+IE9uIDEzLjA3LjIyIDE3OjAzLCBkbWl0cnkuc2VtZW5ldHNAZ21haWwu
Y29tIHdyb3RlOg0KPj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pg0KPj4+IEN1cnJlbnQgdmNoYW4gaW1w
bGVtZW50YXRpb24sIHdoaWxlIGRlYWxpbmcgd2l0aCBYZW5TdG9yZSBwYXRocywNCj4+PiBh
bGxvY2F0ZXMgNjQgYnl0ZXMgYnVmZmVyIG9uIHRoZSBzdGFjayB3aGljaCBtYXkgbm90IGJl
IGVub3VnaCBmb3INCj4+PiBzb21lIHVzZS1jYXNlcy4gTWFrZSB0aGUgYnVmZmVyIGxvbmdl
ciB0byByZXNwZWN0IG1heGltdW0gYWxsb3dlZA0KPj4+IFhlblN0b3JlIHBhdGggb2YgWEVO
U1RPUkVfQUJTX1BBVEhfTUFYLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+
IFNpZ25lZC1vZmYtYnk6IERteXRybyBTZW1lbmV0cyA8ZG15dHJvX3NlbWVuZXRzQGVwYW0u
Y29tPg0KPj4+IC0tLQ0KPj4+ICAgIHRvb2xzL2xpYnMvdmNoYW4vaW5pdC5jIHwgMjggKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnMvdmNoYW4vaW5pdC5jIGIvdG9vbHMvbGlicy92Y2hhbi9pbml0LmMNCj4+PiBp
bmRleCA5MTk1YmQzYjk4Li4zODY1OGYzMGFmIDEwMDY0NA0KPj4+IC0tLSBhL3Rvb2xzL2xp
YnMvdmNoYW4vaW5pdC5jDQo+Pj4gKysrIGIvdG9vbHMvbGlicy92Y2hhbi9pbml0LmMNCj4+
PiBAQCAtMjQ5LDcgKzI0OSw3IEBAIHN0YXRpYyBpbnQgaW5pdF94c19zcnYoc3RydWN0IGxp
YnhlbnZjaGFuICpjdHJsLCBpbnQgZG9tYWluLCBjb25zdCBjaGFyKiB4c19iYXNlDQo+Pj4g
ICAgICAgIGludCByZXQgPSAtMTsNCj4+PiAgICAgICAgc3RydWN0IHhzX2hhbmRsZSAqeHM7
DQo+Pj4gICAgICAgIHN0cnVjdCB4c19wZXJtaXNzaW9ucyBwZXJtc1syXTsNCj4+PiAtICAg
ICBjaGFyIGJ1Zls2NF07DQo+Pj4gKyAgICAgY2hhciAqYnVmOw0KPj4+ICAgICAgICBjaGFy
IHJlZlsxNl07DQo+Pj4gICAgICAgIGNoYXIqIGRvbWlkX3N0ciA9IE5VTEw7DQo+Pj4gICAg
ICAgIHhzX3RyYW5zYWN0aW9uX3QgeHNfdHJhbnMgPSBYQlRfTlVMTDsNCj4+PiBAQCAtMjU5
LDYgKzI1OSwxMiBAQCBzdGF0aWMgaW50IGluaXRfeHNfc3J2KHN0cnVjdCBsaWJ4ZW52Y2hh
biAqY3RybCwgaW50IGRvbWFpbiwgY29uc3QgY2hhciogeHNfYmFzZQ0KPj4+ICAgICAgICBp
ZiAoIWN0cmwtPnhzX3BhdGgpDQo+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIC0xOw0KPj4+
DQo+Pj4gKyAgICAgYnVmID0gbWFsbG9jKFhFTlNUT1JFX0FCU19QQVRIX01BWCk7DQo+Pj4g
KyAgICAgaWYgKCFidWYpIHsNCj4+PiArICAgICAgICAgICAgIGZyZWUoY3RybCk7DQo+Pj4g
KyAgICAgICAgICAgICByZXR1cm4gMDsNCj4+PiArICAgICB9DQo+Pj4gKw0KPj4+ICAgICAg
ICB4cyA9IHhzX29wZW4oMCk7DQo+Pj4gICAgICAgIGlmICgheHMpDQo+Pj4gICAgICAgICAg
ICAgICAgZ290byBmYWlsOw0KPj4+IEBAIC0yODAsMTQgKzI4NiwxNCBAQCByZXRyeV90cmFu
c2FjdGlvbjoNCj4+PiAgICAgICAgICAgICAgICBnb3RvIGZhaWxfeHNfb3BlbjsNCj4+Pg0K
Pj4+ICAgICAgICBzbnByaW50ZihyZWYsIHNpemVvZiByZWYsICIlZCIsIHJpbmdfcmVmKTsN
Cj4+PiAtICAgICBzbnByaW50ZihidWYsIHNpemVvZiBidWYsICIlcy9yaW5nLXJlZiIsIHhz
X2Jhc2UpOw0KPj4+ICsgICAgIHNucHJpbnRmKGJ1ZiwgWEVOU1RPUkVfQUJTX1BBVEhfTUFY
LCAiJXMvcmluZy1yZWYiLCB4c19iYXNlKTsNCj4+PiAgICAgICAgaWYgKCF4c193cml0ZSh4
cywgeHNfdHJhbnMsIGJ1ZiwgcmVmLCBzdHJsZW4ocmVmKSkpDQo+Pj4gICAgICAgICAgICAg
ICAgZ290byBmYWlsX3hzX29wZW47DQo+Pj4gICAgICAgIGlmICgheHNfc2V0X3Blcm1pc3Np
b25zKHhzLCB4c190cmFucywgYnVmLCBwZXJtcywgMikpDQo+Pj4gICAgICAgICAgICAgICAg
Z290byBmYWlsX3hzX29wZW47DQo+Pj4NCj4+PiAgICAgICAgc25wcmludGYocmVmLCBzaXpl
b2YgcmVmLCAiJWQiLCBjdHJsLT5ldmVudF9wb3J0KTsNCj4+PiAtICAgICBzbnByaW50Zihi
dWYsIHNpemVvZiBidWYsICIlcy9ldmVudC1jaGFubmVsIiwgeHNfYmFzZSk7DQo+Pj4gKyAg
ICAgc25wcmludGYoYnVmLCBYRU5TVE9SRV9BQlNfUEFUSF9NQVgsICIlcy9ldmVudC1jaGFu
bmVsIiwgeHNfYmFzZSk7DQo+Pj4gICAgICAgIGlmICgheHNfd3JpdGUoeHMsIHhzX3RyYW5z
LCBidWYsIHJlZiwgc3RybGVuKHJlZikpKQ0KPj4+ICAgICAgICAgICAgICAgIGdvdG8gZmFp
bF94c19vcGVuOw0KPj4+ICAgICAgICBpZiAoIXhzX3NldF9wZXJtaXNzaW9ucyh4cywgeHNf
dHJhbnMsIGJ1ZiwgcGVybXMsIDIpKQ0KPj4+IEBAIC0zMDMsNiArMzA5LDcgQEAgcmV0cnlf
dHJhbnNhY3Rpb246DQo+Pj4gICAgICAgIGZyZWUoZG9taWRfc3RyKTsNCj4+PiAgICAgICAg
eHNfY2xvc2UoeHMpOw0KPj4+ICAgICBmYWlsOg0KPj4+ICsgICAgIGZyZWUoYnVmKTsNCj4+
PiAgICAgICAgcmV0dXJuIHJldDsNCj4+PiAgICB9DQo+Pj4NCj4+PiBAQCAtNDE5LDEzICs0
MjYsMjAgQEAgc3RydWN0IGxpYnhlbnZjaGFuICpsaWJ4ZW52Y2hhbl9jbGllbnRfaW5pdChz
dHJ1Y3QgeGVudG9vbGxvZ19sb2dnZXIgKmxvZ2dlciwNCj4+PiAgICB7DQo+Pj4gICAgICAg
IHN0cnVjdCBsaWJ4ZW52Y2hhbiAqY3RybCA9IG1hbGxvYyhzaXplb2Yoc3RydWN0IGxpYnhl
bnZjaGFuKSk7DQo+Pj4gICAgICAgIHN0cnVjdCB4c19oYW5kbGUgKnhzID0gTlVMTDsNCj4+
PiAtICAgICBjaGFyIGJ1Zls2NF07DQo+Pj4gKyAgICAgY2hhciAqYnVmOw0KPj4+ICAgICAg
ICBjaGFyICpyZWY7DQo+Pj4gICAgICAgIGludCByaW5nX3JlZjsNCj4+PiAgICAgICAgdW5z
aWduZWQgaW50IGxlbjsNCj4+Pg0KPj4+ICAgICAgICBpZiAoIWN0cmwpDQo+Pj4gICAgICAg
ICAgICAgICAgcmV0dXJuIDA7DQo+Pj4gKw0KPj4+ICsgICAgIGJ1ZiA9IG1hbGxvYyhYRU5T
VE9SRV9BQlNfUEFUSF9NQVgpOw0KPj4+ICsgICAgIGlmICghYnVmKSB7DQo+Pj4gKyAgICAg
ICAgICAgICBmcmVlKGN0cmwpOw0KPj4+ICsgICAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4g
KyAgICAgfQ0KPj4+ICsNCj4+PiAgICAgICAgY3RybC0+cmluZyA9IE5VTEw7DQo+Pj4gICAg
ICAgIGN0cmwtPmV2ZW50ID0gTlVMTDsNCj4+PiAgICAgICAgY3RybC0+Z250dGFiID0gTlVM
TDsNCj4+PiBAQCAtNDM2LDggKzQ1MCw5IEBAIHN0cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVu
dmNoYW5fY2xpZW50X2luaXQoc3RydWN0IHhlbnRvb2xsb2dfbG9nZ2VyICpsb2dnZXIsDQo+
Pj4gICAgICAgIGlmICgheHMpDQo+Pj4gICAgICAgICAgICAgICAgZ290byBmYWlsOw0KPj4+
DQo+Pj4gKw0KPj4+ICAgIC8vIGZpbmQgeGVuc3RvcmUgZW50cnkNCj4+PiAtICAgICBzbnBy
aW50ZihidWYsIHNpemVvZiBidWYsICIlcy9yaW5nLXJlZiIsIHhzX3BhdGgpOw0KPj4+ICsg
ICAgIHNucHJpbnRmKGJ1ZiwgWEVOU1RPUkVfQUJTX1BBVEhfTUFYLCAiJXMvcmluZy1yZWYi
LCB4c19wYXRoKTsNCj4+PiAgICAgICAgcmVmID0geHNfcmVhZCh4cywgMCwgYnVmLCAmbGVu
KTsNCj4+PiAgICAgICAgaWYgKCFyZWYpDQo+Pj4gICAgICAgICAgICAgICAgZ290byBmYWls
Ow0KPj4+IEBAIC00NDUsNyArNDYwLDcgQEAgc3RydWN0IGxpYnhlbnZjaGFuICpsaWJ4ZW52
Y2hhbl9jbGllbnRfaW5pdChzdHJ1Y3QgeGVudG9vbGxvZ19sb2dnZXIgKmxvZ2dlciwNCj4+
PiAgICAgICAgZnJlZShyZWYpOw0KPj4+ICAgICAgICBpZiAoIXJpbmdfcmVmKQ0KPj4+ICAg
ICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+PiAtICAgICBzbnByaW50ZihidWYsIHNpemVv
ZiBidWYsICIlcy9ldmVudC1jaGFubmVsIiwgeHNfcGF0aCk7DQo+Pj4gKyAgICAgc25wcmlu
dGYoYnVmLCBYRU5TVE9SRV9BQlNfUEFUSF9NQVgsICIlcy9ldmVudC1jaGFubmVsIiwgeHNf
cGF0aCk7DQo+Pj4gICAgICAgIHJlZiA9IHhzX3JlYWQoeHMsIDAsIGJ1ZiwgJmxlbik7DQo+
Pj4gICAgICAgIGlmICghcmVmKQ0KPj4+ICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+
PiBAQCAtNDc1LDYgKzQ5MCw3IEBAIHN0cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVudmNoYW5f
Y2xpZW50X2luaXQoc3RydWN0IHhlbnRvb2xsb2dfbG9nZ2VyICpsb2dnZXIsDQo+Pj4gICAg
IG91dDoNCj4+PiAgICAgICAgaWYgKHhzKQ0KPj4+ICAgICAgICAgICAgICAgIHhzX2Nsb3Nl
KHhzKTsNCj4+PiArICAgICBmcmVlKGJ1Zik7DQo+Pj4gICAgICAgIHJldHVybiBjdHJsOw0K
Pj4+ICAgICBmYWlsOg0KPj4+ICAgICAgICBsaWJ4ZW52Y2hhbl9jbG9zZShjdHJsKTsNCj4+
DQo+PiBJIHRoaW5rIHlvdSBhcmUgbGVha2luZyBidWYgaW4gY2FzZSBvZiAiZ290byBmYWls
Ii4NCj4gTm8uIEZpbGUgd2l0aCBwYXRjaCBkb2Vzbid0IGhhdmUgZm9sbG93cyBsaW5lczoN
Cj4gICAgICBjdHJsID0gTlVMTDsNCj4gICAgICBnb3RvIG91dDsNCj4gfQ0KDQpPaCwgd2hh
dCBhIG5hc3R5IGNvbnRyb2wgZmxvdyENCg0KWW91IGFyZSByaWdodCwgc29ycnkgZm9yIHRo
ZSBub2lzZS4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------i09rm9VRC3tE7gCHKpcoM9qw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------i09rm9VRC3tE7gCHKpcoM9qw--

--------------I8282SLi00U1vrM0W8o4438c--

--------------2eISXCCW8aR0xJafqa0ie0Mt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLnmkMFAwAAAAAACgkQsN6d1ii/Ey/L
PAf/bJsSqJsBknvqGY1avz5eZxd/AuHgD9Z71wpEw4U+923aXBAuwBAIUMJQ6gfc9hraiRcHsTSM
lUdot80pfzNiAnm8ZWCqCmMtHCxR08YEcVWVyRKeaJ5yBCvKSU4TixJSuGn8hvdOXW1TK4V8/ZWm
m4tEmMSfQkDHnBnUMvqgUYlOemOGOzo8qHpRkLEBtD+JjPpo3WpBvgnLBXDLJX+GQpQvvnMUbwHG
dwPZu/FstXtzIbbEUqZUzkki7POLs4j/QqCC35XMltTGHf0/MGqimy4p/tsQzax6rAZC9VzHlXa7
ERLNJfEbwVV/qngPS859ckyteqPqGxcvjm/AEJonUA==
=n8Zu
-----END PGP SIGNATURE-----

--------------2eISXCCW8aR0xJafqa0ie0Mt--

