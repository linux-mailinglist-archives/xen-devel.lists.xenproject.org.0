Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553085F51B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 10:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684294.1064043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5oL-0000TS-Ah; Thu, 22 Feb 2024 09:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684294.1064043; Thu, 22 Feb 2024 09:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5oL-0000RT-7B; Thu, 22 Feb 2024 09:56:13 +0000
Received: by outflank-mailman (input) for mailman id 684294;
 Thu, 22 Feb 2024 09:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MkW+=J7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rd5oJ-0000RL-MV
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 09:56:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b0c1feb-d168-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 10:56:10 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E273221FCB;
 Thu, 22 Feb 2024 09:56:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C31E13A8C;
 Thu, 22 Feb 2024 09:56:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eJ94IDka12WGBgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 22 Feb 2024 09:56:09 +0000
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
X-Inumbo-ID: 9b0c1feb-d168-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708595770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bhBvpF6rC4GRr7UEGIKWfHyqFYFYRBZM7h4JhhQ9DLk=;
	b=U07aJ8QyP+Eju4qSrerUHLKB9WEdVG3Qz1Ndf8KVkEbUkat8VACe07A3kd8alH0fMP9vun
	T+ibQCW3q4RUfY6drtMI4FSVgmBVjBSbW975OlaRruahjgYXVQ7gaInW/t/q7+oxcG5LeO
	NP6GUIRAHWIUrY69s5cxci4+KClV8Lg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708595769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bhBvpF6rC4GRr7UEGIKWfHyqFYFYRBZM7h4JhhQ9DLk=;
	b=Mm9JU0slxnfX90szfxYw1tyUgAObiMHxtCvKakkObic+4HEoA1rhlCYuDsJbGqamvzJYXL
	0fi1m1EtBRV89lSkZFnpy+VmhBg+RdDaK3LNB++L7HJD566URheT2am7eBXHzL2dkqDlCR
	UrzfrHIO3ngGzRL02Pus6RwGHrsDmYw=
Message-ID: <2e02fe28-d964-46fe-b5ba-4b5e0998979e@suse.com>
Date: Thu, 22 Feb 2024 10:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stats on Xen tarball downloads
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>
References: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
 <ZdMt88BSNMYtq39n@macbook> <36229344-e2e2-46e1-839b-b7b3b0843f23@suse.com>
 <CA+zSX=YvTgEMC0S5OqSFvxfVDeruiO=FphyVx5fv75oT-QW01A@mail.gmail.com>
 <0936a6c5-bac2-4de2-9155-1722d3bb28ca@xen.org> <ZdcYo3sGHVYaP6kM@macbook>
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
In-Reply-To: <ZdcYo3sGHVYaP6kM@macbook>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6w0HBUR4SwheZVelV9f7w0eb"
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Mm9JU0sl
X-Spamd-Result: default: False [-6.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E273221FCB
X-Spam-Level: 
X-Spam-Score: -6.20
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6w0HBUR4SwheZVelV9f7w0eb
Content-Type: multipart/mixed; boundary="------------0JYDU4o3Bg3NJ1vFNpOXoia0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>
Message-ID: <2e02fe28-d964-46fe-b5ba-4b5e0998979e@suse.com>
Subject: Re: Stats on Xen tarball downloads
References: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
 <ZdMt88BSNMYtq39n@macbook> <36229344-e2e2-46e1-839b-b7b3b0843f23@suse.com>
 <CA+zSX=YvTgEMC0S5OqSFvxfVDeruiO=FphyVx5fv75oT-QW01A@mail.gmail.com>
 <0936a6c5-bac2-4de2-9155-1722d3bb28ca@xen.org> <ZdcYo3sGHVYaP6kM@macbook>
In-Reply-To: <ZdcYo3sGHVYaP6kM@macbook>
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

--------------0JYDU4o3Bg3NJ1vFNpOXoia0
Content-Type: multipart/mixed; boundary="------------my0Avvjrsjnt4pg8df8a0JI5"

--------------my0Avvjrsjnt4pg8df8a0JI5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDIuMjQgMTA6NDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdlZCwg
RmViIDIxLCAyMDI0IGF0IDEwOjUzOjQ5UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cj4+IEhpIEdlb3JnZSwNCj4+DQo+PiBPbiAyMS8wMi8yMDI0IDAyOjU1LCBHZW9yZ2UgRHVu
bGFwIHdyb3RlOg0KPj4+IE9uIE1vbiwgRmViIDE5LCAyMDI0IGF0IDY6MzjigK9QTSBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBPbiAxOS4w
Mi4yMDI0IDExOjMxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4gT24gTW9uLCBG
ZWIgMTksIDIwMjQgYXQgMDY6MDE6NTRQTSArMDgwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToN
Cj4+Pj4+PiBPbmUgb2YgdGhlIHF1ZXN0aW9ucyB3ZSBoYWQgd2l0aCByZXNwZWN0IHRvIGNo
YW5naW5nIG91ciByZWxlYXNlDQo+Pj4+Pj4gcHJhY3RpY2UgKGZvciBpbnN0YW5jZSwgbWFr
aW5nIHRoZSBwcm9jZXNzIG1vcmUgbGlnaHQtd2VpZ2h0IHNvIHRoYXQNCj4+Pj4+PiB3ZSBj
b3VsZCBkbyBhIHBvaW50IHJlbGVhc2UgYWZ0ZXIgZXZlcnkgWFNBKSB3YXMsICJIb3cgbWFu
eSBwZW9wbGUgYXJlDQo+Pj4+Pj4gYWN0dWFsbHkgdXNpbmcgdGhlIHRhcmJhbGxzPyINCj4+
Pj4+DQo+Pj4+PiBXaGF0IHdvdWxkIHRoaXMgbW9yZSBsaWdodHdlaWdodCBwcm9jZXNzIGlu
dm9sdmUgZnJvbSBhIGRvd25zdHJlYW0NCj4+Pj4+IFBvVj8gIElPVzogaW4gd2hhdCB3b3Vs
ZCB0aGUgY29udGVudHMgb2YgdGhlIHRhcmJhbGwgY2hhbmdlIGNvbXBhcmVkDQo+Pj4+PiB0
byB0aGUgY3VycmVudCByZWxlYXNlcz8NCj4+Pj4NCj4+Pj4gICBGcm9tIGFsbCBwcmlvciBk
aXNjdXNzaW9uIG15IGNvbmNsdXNpb24gd2FzICJubyB0YXJiYWxsIGF0IGFsbCIuDQo+Pj4N
Cj4+PiBPciBhdCB2ZXJ5IGxlYXN0LCB0aGUgdGFyYmFsbCB3b3VsZCBiZSBhIHNpbXBsZSBg
Z2l0IGFyY2hpdmVgIG9mIGENCj4+PiByZWxlYXNlIHRhZy4gICBSaWdodCBub3cgdGhlIHRh
cmJhbGwgY3JlYXRpb24gaGFzIGEgbnVtYmVyIG9mDQo+Pj4gYW5ub3lpbmdseSBtYW51YWwg
cGFydHMgYWJvdXQgaXQuDQo+PiBBdCB0aGUgbW9tZW50IHdlIGhhdmUgdGhlIGZvbGxvd2lu
ZyBzdGVwczoNCj4+DQo+PiAxKSBDaGVja291dCB0YWcNCj4+IDIpIENyZWF0ZSB0aGUgdGFy
YmFsbA0KPj4gMykgQ2hlY2sgdGhlIHNvdXJjZSB0YXJiYWxsIGNhbiBidWlsZA0KPj4gNCkg
U2lnbiB0aGUgdGFyYmFsbA0KPj4gNSkgVXBsb2FkIGl0DQo+Pg0KPj4gSSBtYW5hZ2VkIHRv
IHNjcmlwdCBpdCBzbyBJIGhhdmUgb25seSB0d28gY29tbWFuZHMgdG8gZXhlY3V0ZSAobW9z
dGx5DQo+PiBiZWNhdXNlIEkgYnVpbGQgYW5kIHNpZ24gb24gYSBkaWZmZXJlbnQgaG9zdCku
DQo+Pg0KPj4gQUZBSVUsIHlvdXIgY29tbWFuZCAnZ2l0IGFyY2hpdmUnIHdpbGwgb25seSBy
ZXBsYWNlIDIuIEFtIEkgY29ycmVjdD8gSWYgc28sDQo+PiBpdCBpcyBub3QgZW50aXJlbHkg
Y2xlYXIgaG93IHlvdXIgcHJvcG9zYWwgaXMgZ29pbmcgdG8gbWFrZSBpdCBiZXR0ZXIuDQo+
IA0KPiBJTU8gYnVpbGRpbmcgZm9yIHJlbGVhc2UgdGFyYmFsbHMgaXMgZWFzaWVyIHRoYW4g
ZnJvbSBhIGdpdCBjaGVja291dA0KPiAob3IgYXJjaGl2ZSkuICBJdCdzIGEgYml0IGFubm95
aW5nIHRvIGhhdmUgdG8gcHJlLWRvd25sb2FkIHRoZQ0KPiBleHRlcm5hbCBwcm9qZWN0IHNv
dXJjZXMsIG5vdyBldmVuIG1vcmUgYXMgUUVNVSBpcyB1c2luZyBnaXQNCj4gc3VibW9kdWxl
cy4NCj4gDQo+IE1vc3QgZGlzdHJvIGJpbmFyeSBidWlsZGVycyBoYXZlIGluZnJhc3RydWN0
dXJlIHRvIGRlYWwgd2l0aCBhbGwgdGhpcywNCj4gYnV0IHJlcXVpcmVzIGEgYml0IG1vcmUg
bG9naWMgaW4gdGhlIHJlY2lwZSB0aGFuIGEgcGxhaW4ganVzdCBmZXRjaCBhDQo+IHRhcmJh
bGwgYW5kIGJ1aWxkIGZyb20gaXQuDQoNCkkgaGF2ZSBhbiB1bmZpbmlzaGVkIHBhdGNoIHNl
cmllcyBseWluZyBhcm91bmQgZG9pbmcgdGhlIGRvd25sb2FkIHN0ZXBzDQpfYmVmb3JlXyBz
dGFydGluZyB0aGUgYnVpbGQuIFRoaXMgaW5jbHVkZXMgbWFrZSB0YXJnZXRzIGZvciBkb3du
bG9hZGluZw0KdGhlIHJlcXVpcmVkIGNvbXBvbmVudHMsIG9yIGFsbCBjb21wb25lbnRzIGlm
IGNvbmZpZ3VyZSBzaG91bGQgYmUgY2FsbGVkDQphZnRlcndhcmRzLg0KDQpDcmVhdGluZyB0
aGUgdGFyYmFsbCBhZnRlciBoYXZpbmcgZG93bmxvYWRlZCBhbGwgY29tcG9uZW50cyBpcyB0
cml2aWFsLg0KDQpUaGVyZSBhcmUgYSBmZXcgYnVncyBpbiB0aGUgc2VyaWVzIEkgZGlkbid0
IGhhdmUgdGltZSB5ZXQgdG8gZml4LiBJZiBzb21lb25lDQppcyBpbnRlcmVzdGVkIGluIHdv
cmtpbmcgb24gaXQsIEkgY2FuIHBvc3QgdGhlIHNlcmllcy4NCg0KDQpKdWVyZ2VuDQoNCg==

--------------my0Avvjrsjnt4pg8df8a0JI5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------my0Avvjrsjnt4pg8df8a0JI5--

--------------0JYDU4o3Bg3NJ1vFNpOXoia0--

--------------6w0HBUR4SwheZVelV9f7w0eb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmXXGjkFAwAAAAAACgkQsN6d1ii/Ey9D
SQf/bBGRDg4IfNts7O/O3/IjATd1gE+u40uohi0T5DJCo0Wkbk1/LDSrV1O7XH8fM5rnBUDp1V49
cawYUwSzQ0pwQ8jhiEpy7R3OenX0/OGE1S+Ew2KsWLiTxnt3VhVkFYmI7cQ08tRzFTsukYPnaTUV
S4iuWS612B4YjxJm/ucDjHsn5o0AhLYBm4x6QjQrjowuRGi7C0fwKsEmmRNojNw7QF0+NEnKceCf
yOECU+JYAuTSo4re8uJhNeWDyI6eCt6Uv0yhv93ZVJgF0UQo6GLp2BUNiRfyK8xyBx8rUtt9UGTP
74+9hzqPIa9wA9C/bb16UDh5hjCm4ZNI4GGtwxRNHQ==
=Pi3o
-----END PGP SIGNATURE-----

--------------6w0HBUR4SwheZVelV9f7w0eb--

