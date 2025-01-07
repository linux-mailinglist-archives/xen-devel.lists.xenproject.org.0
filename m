Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047FA047CF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 18:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866719.1278068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVD8E-0003bp-OE; Tue, 07 Jan 2025 17:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866719.1278068; Tue, 07 Jan 2025 17:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVD8E-0003Yf-Jy; Tue, 07 Jan 2025 17:12:42 +0000
Received: by outflank-mailman (input) for mailman id 866719;
 Tue, 07 Jan 2025 17:12:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVD8D-0003XJ-Bg
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 17:12:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98f2507c-cd1a-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 18:12:39 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 694CA21133;
 Tue,  7 Jan 2025 17:12:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB09B13763;
 Tue,  7 Jan 2025 17:12:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id v/YnN4VgfWeXawAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jan 2025 17:12:37 +0000
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
X-Inumbo-ID: 98f2507c-cd1a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736269958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2hPVAC7vYnQwzpm7rrw2cgP4FPWGLvFSvfZro8cmU2E=;
	b=sGR4u6vtc/lzvhBnlntteK1Hz6nJIxVvgzVikPX6emsK1hkei/LZvnHeDYY8WvZIEun0Cx
	tYby2Z5kczpSoQSjDGYPdE7RUIymPaP6mhYYEhFRXgfqWL09vkgB2s4qHV4SODlETX2A+o
	pXl1coPEq6QdS3nn5vrh5ytXM5uz0nk=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=sGR4u6vt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736269958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2hPVAC7vYnQwzpm7rrw2cgP4FPWGLvFSvfZro8cmU2E=;
	b=sGR4u6vtc/lzvhBnlntteK1Hz6nJIxVvgzVikPX6emsK1hkei/LZvnHeDYY8WvZIEun0Cx
	tYby2Z5kczpSoQSjDGYPdE7RUIymPaP6mhYYEhFRXgfqWL09vkgB2s4qHV4SODlETX2A+o
	pXl1coPEq6QdS3nn5vrh5ytXM5uz0nk=
Message-ID: <79aff4ad-49d0-4d77-96d3-8b82fae6166e@suse.com>
Date: Tue, 7 Jan 2025 18:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] xen: add new domctl get_changed_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-6-jgross@suse.com>
 <781daba7-5d6f-4d86-bce4-c5aa9d135513@suse.com>
 <81221a18-d6f8-418d-841a-8aa43420df09@suse.com>
 <099376ce-0cd7-423a-b3fe-d9e0a8505c85@suse.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <099376ce-0cd7-423a-b3fe-d9e0a8505c85@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y23Qfxej6hvkHLUroM0jJUHf"
X-Rspamd-Queue-Id: 694CA21133
X-Spam-Level: 
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_SOME(0.00)[];
	HAS_ATTACHMENT(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.41
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y23Qfxej6hvkHLUroM0jJUHf
Content-Type: multipart/mixed; boundary="------------MksvpfXbwYdx3YjypSy2Sa0Q";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <79aff4ad-49d0-4d77-96d3-8b82fae6166e@suse.com>
Subject: Re: [PATCH v6 5/7] xen: add new domctl get_changed_domain
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-6-jgross@suse.com>
 <781daba7-5d6f-4d86-bce4-c5aa9d135513@suse.com>
 <81221a18-d6f8-418d-841a-8aa43420df09@suse.com>
 <099376ce-0cd7-423a-b3fe-d9e0a8505c85@suse.com>
In-Reply-To: <099376ce-0cd7-423a-b3fe-d9e0a8505c85@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------MksvpfXbwYdx3YjypSy2Sa0Q
Content-Type: multipart/mixed; boundary="------------zO2iINRJdxqdl5as8tpau5hP"

--------------zO2iINRJdxqdl5as8tpau5hP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDEuMjUgMTg6MDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMS4yMDI1
IDE3OjQ4LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDcuMDEuMjUgMTc6MjgsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAxLjIwMjUgMTE6MTcsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4gKysrIGIv
eGVuL2NvbW1vbi9kb21haW4uYw0KPj4+PiBAQCAtMTg1LDYgKzE4NSw3NiBAQCBzdGF0aWMg
dm9pZCBkb21haW5fY2hhbmdlZF9zdGF0ZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+
PiAgICAgICAgdW5sb2NrX2RvbV9leGNfaGFuZGxlcihoZGwpOw0KPj4+PiAgICB9DQo+Pj4+
ICAgIA0KPj4+PiArc3RhdGljIHZvaWQgc2V0X2RvbWFpbl9zdGF0ZV9pbmZvKHN0cnVjdCB4
ZW5fZG9tY3RsX2dldF9kb21haW5fc3RhdGUgKmluZm8sDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4+Pj4gK3sN
Cj4+Pj4gKyAgICBpbmZvLT5zdGF0ZSA9IFhFTl9ET01DVExfR0VURE9NU1RBVEVfU1RBVEVf
RVhJU1Q7DQo+Pj4+ICsgICAgaWYgKCBkLT5pc19zaHV0X2Rvd24gKQ0KPj4+PiArICAgICAg
ICBpbmZvLT5zdGF0ZSB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX1NIVVRET1dO
Ow0KPj4+PiArICAgIGlmICggZC0+aXNfZHlpbmcgPT0gRE9NRFlJTkdfZHlpbmcgKQ0KPj4+
PiArICAgICAgICBpbmZvLT5zdGF0ZSB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRF
X0RZSU5HOw0KPj4+PiArICAgIGlmICggZC0+aXNfZHlpbmcgPT0gRE9NRFlJTkdfZGVhZCAp
DQo+Pj4+ICsgICAgICAgIGluZm8tPnN0YXRlIHw9IFhFTl9ET01DVExfR0VURE9NU1RBVEVf
U1RBVEVfREVBRDsNCj4+Pj4gKyAgICBpbmZvLT51bmlxdWVfaWQgPSBkLT51bmlxdWVfaWQ7
DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gK2ludCBnZXRfZG9tYWluX3N0YXRlKHN0cnVjdCB4
ZW5fZG9tY3RsX2dldF9kb21haW5fc3RhdGUgKmluZm8sIHN0cnVjdCBkb21haW4gKmQsDQo+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICBkb21pZF90ICpkb21pZCkNCj4+Pj4gK3sNCj4+
Pj4gKyAgICB1bnNpZ25lZCBpbnQgZG9tOw0KPj4+PiArICAgIGludCByYyA9IC1FTk9FTlQ7
DQo+Pj4+ICsgICAgc3RydWN0IGRvbWFpbiAqaGRsOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYg
KCBpbmZvLT5wYWQwIHx8IGluZm8tPnBhZDEgKQ0KPj4+PiArICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggZCApDQo+Pj4+ICsgICAgew0KPj4+PiAr
ICAgICAgICBzZXRfZG9tYWluX3N0YXRlX2luZm8oaW5mbywgZCk7DQo+Pj4+ICsNCj4+Pj4g
KyAgICAgICAgcmV0dXJuIDA7DQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgLyoN
Cj4+Pj4gKyAgICAgKiBPbmx5IGRvbWFpbiByZWdpc3RlcmVkIGZvciBWSVJRX0RPTV9FWEMg
ZXZlbnQgaXMgYWxsb3dlZCB0byBxdWVyeQ0KPj4+PiArICAgICAqIGRvbWFpbnMgaGF2aW5n
IGNoYW5nZWQgc3RhdGUuDQo+Pj4+ICsgICAgICovDQo+Pj4+ICsgICAgaWYgKCAhZG9tYWlu
X2hhbmRsZXNfZ2xvYmFsX3ZpcnEoY3VycmVudC0+ZG9tYWluLCBWSVJRX0RPTV9FWEMpICkN
Cj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FQUNDRVM7DQo+Pj4+ICsNCj4+Pj4gKyAgICBoZGwg
PSBsb2NrX2RvbV9leGNfaGFuZGxlcigpOw0KPj4+DQo+Pj4gSW5zdGVhZCBvZiBsZWF2aW5n
IGEgc21hbGwgd2luZG93IGZvciByYWNlcyBiZXR3ZWVuIHRoZSBpZigpIGFuZCB0aGlzDQo+
Pj4gZnVuY3Rpb24gY2FsbCwgY2FuJ3QgeW91IHNpbXBseSBjb21wYXJlIGhkbCBhZ2FpbnN0
IGN1cnJlbnQtPmRvbWFpbj8NCj4+DQo+PiBHb29kIGlkZWEuDQo+Pg0KPj4+DQo+Pj4+ICsg
ICAgd2hpbGUgKCBkb21fc3RhdGVfY2hhbmdlZCApDQo+Pj4+ICsgICAgew0KPj4+PiArICAg
ICAgICBkb20gPSBmaW5kX2ZpcnN0X2JpdChkb21fc3RhdGVfY2hhbmdlZCwgRE9NSURfTUFT
SyArIDEpOw0KPj4+PiArICAgICAgICBpZiAoIGRvbSA+PSBET01JRF9GSVJTVF9SRVNFUlZF
RCApDQo+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4gKyAgICAgICAgaWYgKCB0ZXN0
X2FuZF9jbGVhcl9iaXQoZG9tLCBkb21fc3RhdGVfY2hhbmdlZCkgKQ0KPj4+DQo+Pj4gQXMg
dGhpcyBpcyBub3cgcnVubmluZyB1bmRlciBsb2NrLCBkb2VzIGl0IHJlYWxseSBuZWVkIHRv
IGJlIHRlc3QtYW5kLWNsZWFyPw0KPj4+IFdoYXQgbWVjaGFuaXNtIHdvdWxkIGFsbG93IHRo
ZSBmbGFnIHRvIGJlIGNsZWFyZWQgYmV0d2VlbiB0aGUgZmluZC0xc3QgYW5kDQo+Pj4gaGVy
ZT8gUGx1cywgbGlrZSBmb3IgcGF0Y2ggNCwgSSB0aGluayBpdCBjb3VsZCBiZSBfX2NsZWFy
X2JpdCgpIGhlcmUuDQo+Pg0KPj4gSXQgaXMgb25seSB1bmRlciByZWFkX2xvY2soKSwgc28g
dGhlcmUgYXJlIGNvbmN1cnJlbnQgY2FsbHMgcG9zc2libGUuDQo+PiBJIGRvbid0IHRoaW5r
IHdlIHdhbnQgdG8gdXNlIHdyaXRlX2xvY2soKSBoZXJlLCBkbyB3ZT8NCj4gDQo+IFByb2Jh
Ymx5IG5vdDsgSSBoYXZlIHRvIGFkbWl0IEkgZGlkbid0IGV2ZW4gcGF5IGF0dGVudGlvbiB0
byB0aGlzIGFzcGVjdC4NCj4gVGhlbiB0aGUgc2V0X2JpdCgpIGluIGRvbWFpbl9jaGFuZ2Vk
X3N0YXRlKCkgYWxzbyBuZWVkIHRvIHJlbWFpbiBhcyBpcyAoaW4NCj4gcGF0Y2ggNCBJIHRo
aW5rIGl0IHdhcykuDQoNClRoaXMgb25lIG5lZWRzIHRvIHN0YXksIGJ1dCB0aGUgb25lIGlu
IGRvbWFpbl9pbml0X3N0YXRlcygpIGNhbiBiZSBjaGFuZ2VkDQp0byB0aGUgbm9uLWF0b21p
YyB2YXJpYW50IGFnYWluLg0KDQoNCkp1ZXJnZW4NCg==
--------------zO2iINRJdxqdl5as8tpau5hP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zO2iINRJdxqdl5as8tpau5hP--

--------------MksvpfXbwYdx3YjypSy2Sa0Q--

--------------y23Qfxej6hvkHLUroM0jJUHf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd9YIUFAwAAAAAACgkQsN6d1ii/Ey/D
vwf/Sh0LKJx+APLg/PwqVQozWjwZrVG1jn1Y0wsI2PfFQoSEX7TsWExgDkYA/hAfC9/S/YRlQrGX
/3OSLjr5xh6LsrI1BAimcodoQeJSIfvAtFmBl9FvInm+kAVlG0cvYDG/Ge4oQb35oT0EYIhIL7Rh
wBKSw6jsGfdrnlK57aVxOVQw644dWQQuCEsbeZeOrXd6e77D81w8IuipPMb8TNTcgEPChCsQKlVC
rw1INqbN/0TLyUFlws15QbU+aTOXWxbg3PCCrMVsrUFpU/sHxuRDJKhqFCM/oj9SZc/SwD7F+f0r
EVzsBviF78MwNaxO/mt7313uBt4I4PRzTtkuqp0ueA==
=5SEU
-----END PGP SIGNATURE-----

--------------y23Qfxej6hvkHLUroM0jJUHf--

