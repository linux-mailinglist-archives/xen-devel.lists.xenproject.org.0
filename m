Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D844FA65559
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917179.1322147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCFK-00056g-Vc; Mon, 17 Mar 2025 15:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917179.1322147; Mon, 17 Mar 2025 15:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCFK-00054i-S1; Mon, 17 Mar 2025 15:19:18 +0000
Received: by outflank-mailman (input) for mailman id 917179;
 Mon, 17 Mar 2025 15:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tuCFJ-00054c-O7
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:19:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30adacb3-0343-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 16:19:16 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C8E1E1F74C;
 Mon, 17 Mar 2025 15:19:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F7B4139D2;
 Mon, 17 Mar 2025 15:19:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YZqmGXI92Gc2AQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 17 Mar 2025 15:19:14 +0000
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
X-Inumbo-ID: 30adacb3-0343-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742224756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YqpeHhvxLAE/okgqWDT3g8KrfgNixyOahq42Tssowmc=;
	b=DiLaKQ3/i848KCPeWGGM4I7hpesYq/2sXbmajeiisL6/9ZVFfo2sG+p6QpT4Eqquht39rW
	9siSyylcsiQHM460nCh/wqJG3RyHReDhK3nXE3eAllPeV6X0taJV+adQezYDqpwqv60jJK
	57dz14mE7HOOuW6UuRRHyiqZpOuVZBg=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=CNODgBeX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742224754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YqpeHhvxLAE/okgqWDT3g8KrfgNixyOahq42Tssowmc=;
	b=CNODgBeXC1PNzuGLj3er5JMYUviD47elcZ6CccDv1wlejPaI3Y+pBgHVIBeczcH8/YKyFw
	AnDU/YQPTjjsOkdeSgwV9Q5FrfIO5SdmnpeFZ81WkElkRO5f+Ncg8BM+lDikfCWHuRcG+T
	1oeIRvDUiFQdwf/jyqdkj+mBAabGanU=
Message-ID: <ba2b9493-f794-497a-9f5c-1a714bdc79e5@suse.com>
Date: Mon, 17 Mar 2025 16:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/23] xsm/dummy: Allow XS_PRIV to call get_hvm_param
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-15-jason.andryuk@amd.com>
 <6d6c2a2b-630c-404e-9257-e353464f2400@suse.com>
 <9c4e6e33-6381-47a8-a631-5ded21cf240c@amd.com>
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
In-Reply-To: <9c4e6e33-6381-47a8-a631-5ded21cf240c@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yCNQMTu9Dqzh1HcD65vAqnda"
X-Rspamd-Queue-Id: C8E1E1F74C
X-Spam-Score: -6.41
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yCNQMTu9Dqzh1HcD65vAqnda
Content-Type: multipart/mixed; boundary="------------EhnF7uW9zW0ZE4mv7FRQsNG8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Message-ID: <ba2b9493-f794-497a-9f5c-1a714bdc79e5@suse.com>
Subject: Re: [PATCH 14/23] xsm/dummy: Allow XS_PRIV to call get_hvm_param
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-15-jason.andryuk@amd.com>
 <6d6c2a2b-630c-404e-9257-e353464f2400@suse.com>
 <9c4e6e33-6381-47a8-a631-5ded21cf240c@amd.com>
In-Reply-To: <9c4e6e33-6381-47a8-a631-5ded21cf240c@amd.com>
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

--------------EhnF7uW9zW0ZE4mv7FRQsNG8
Content-Type: multipart/mixed; boundary="------------Gf9OQar8aRdEMsD22LfQYuFy"

--------------Gf9OQar8aRdEMsD22LfQYuFy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDMuMjUgMTU6NTAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDMt
MTcgMTA6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDYuMDMuMjAyNSAyMzowMywg
SmFzb24gQW5kcnl1ayB3cm90ZToNCj4+PiBUaGlzIGlzIHVzZWZ1bCBmb3IgYSBjb21iaW5l
ZCBoYXJkd2FyZS94ZW5zdG9yZSBkb21haW4gdGhhdCB3aWxsIHJ1bg0KPj4+IGluaXQtZG9t
MGxlc3MgYW5kIHhlbnN0b3JlZC7CoCBpbml0LWRvbTBsZXNzIGNhbGxzIHhjX2h2bV9wYXJh
bV9nZXQoKSB0bw0KPj4+IHJldHJpZXZlIHRoZSB4ZW5zdG9yZSBldmVudCBjaGFubmVsIGFu
ZCBwZm4gdG8gY29uZmlndXJlIHhlbnN0b3JlIGZvciBhDQo+Pj4gZ3Vlc3QuwqAgV2l0aCBh
IGh5cGVydmlzb3ItYWxsb2NhdGVkIGV2ZW50IGNoYW5uZWwgYW5kIHBhZ2UsIHRoZQ0KPj4+
IHNldF9odm1fcGFyYW0gaXMgbm90IG5lZWRlZCwgYW5kIHRoZSBub3JtYWwgZG9taWQgcGVy
bWlzc2lvbnMgd2lsbCBhbGxvdw0KPj4+IHhlbnN0b3JlZCB0byBjb25uZWN0Lg0KPj4+DQo+
Pj4gU2ltaWxhcmx5LCBhIGh5cGVybGF1bmNoLWVkIHhlbnN0b3JlIHN0dWJkb20gbmVlZHMg
dG8gcmVhZCBhIGRvbWFpbidzDQo+Pj4geGVuc3RvcmUgZXZlbnQgY2hhbm5lbCBvdXQgb2Yg
aHZtX3BhcmFtLg0KPj4+DQo+Pj4gVGhpcyBhbGxvd3MgcmVhZGluZyBidXQgbm90IG1vZGlm
eWluZyB0aGUgZ3Vlc3QsIHNvIGFsbG93IHRoZSBwZXJtaXNzaW9uLg0KPj4+DQo+Pj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KPj4N
Cj4+IFNpbmNlIHRoaXMgaXMgZXhwb3NpbmcgdGhlIGVudGlyZSBwYXJhbSBzcGFjZSB0byBY
ZW5zdG9yZSwgd2hhdCBJJ20gbWlzc2luZw0KPj4gaXMgYSBzZWN1cml0eSBkaXNjdXNzaW9u
IGZvciBleGlzdGluZyBhcyB3ZWxsIGFzIHBvdGVudGlhbCBmdXR1cmUgcGFyYW1zLg0KPj4g
VGhlcmUgY291bGQgd2VsbCBiZSBzb21lIHRoYXQgYmV0dGVyIHdvdWxkbid0IGJlIGF2YWls
YWJsZSBmb3IgWGVuc3Ryb3JlIHRvDQo+PiBmZXRjaC4NCj4gDQo+IEkgY2FuJ3Qgc3BlYWsg
Zm9yIGZ1dHVyZSBwYXJhbWV0ZXJzLCBidXQgZXhpc3RpbmcgSFZNX1BBUkFNcyBkaWRuJ3Qg
c2VlbSANCj4gc2Vuc2l0aXZlIHRvIG1lLsKgIFRoZSBzYWZlc3QgY2hvaWNlIGlzIHRvIGp1
c3QgcGFzcyB0aGUgaW5kZXggdG8geHNtX2h2bV9wYXJhbSgpIA0KPiBhbmQgYWxsb3cganVz
dCBIVk1fUEFSQU1fU1RPUkVfRVZUQ0hOIChhbmQgSFZNX1BBUkFNX1NUT1JFX1BGTikgZm9y
IHRoZSB4ZW5zdG9yZSANCj4gZG9tYWluLg0KPiANCj4gVGhpcyB3b3JrcyBmb3IgQVJNIGFu
ZCB4ODYgSFZNL1BWSC7CoCBQViBkb2Vzbid0IGhhdmUgYSB3YXkgdG8gZGV0ZXJtaW5lIGEg
DQo+IGRvbWFpbidzIGV2ZW50IGNoYW5uZWwgcG9ydCwgRldJQ1QuDQoNCkZvciB3aGF0IGFy
ZSB5b3UgbmVlZGluZyBIVk1fUEFSQU1fU1RPUkVfUEZOPyBUaGUgR05UVEFCX1JFU0VSVkVE
X1hFTlNUT1JFDQpncmFudCBpZCBzaG91bGQgYmUgZW5vdWdoIHRvIG1hcCB0aGUgZ3Vlc3Qn
cyBYZW5zdG9yZSBwYWdlPw0KDQpBbmQgd2l0aCB0aGF0IEknZCByYXRoZXIgc3VnZ2VzdCB0
byBleHBhbmQgc3RydWN0IHhlbnN0b3JlX2RvbWFpbl9pbnRlcmZhY2UNCndpdGggdGhlIGV2
ZW50IGNoYW5uZWwgcG9ydCBhbmQgbGV0IHRoZSBjb21wb25lbnQgZG9pbmcgdGhlIHNlZWRp
bmcgb2YgdGhlDQpncmFudCB0YWJsZSB3cml0ZSB0aGUgcG9ydCBpbnRvIHRoZSBzdHJ1Y3Qu
DQoNClRoaXMgd291bGQgZW5hYmxlIFhlbnN0b3JlIHRvIGp1c3QgbWFwIHRoZSBndWVzdCdz
IFhlbnN0b3JlIHBhZ2UgYW5kIHJlYWQNCnRoZSBldmVudCBjaGFubmVsIHBvcnQgZnJvbSBp
dC4gTm8gYWRkaXRpb25hbCBoeXBlcmNhbGwgcGVybWlzc2lvbiBuZWVkZWQuDQpBbmQgdGhp
cyB3b3VsZCBldmVuIHdvcmsgd2l0aCBQViBkb21haW5zLiBBbmQgYXMgdGhlIFhlbnN0b3Jl
IHBhZ2UgaXMgemVyb2VkDQppbml0aWFsbHksIGFueSBldmVudCBjaGFubmVsIHBvcnQgIT0g
MCBjb3VsZCBiZSByZWdhcmRlZCB0byBiZSB2YWxpZCAoYSBndWVzdA0KY2hvb3NpbmcgdG8g
d3JpdGUgYSBib2d1cyB2YWx1ZSB0aGVyZSB3b3VsZCBqdXN0IHNob290IGl0c2VsZiBpbiB0
aGUgZm9vdCBieQ0KaGFybWluZyBpdHMgb3duIFhlbnN0b3JlIGNvbm5lY3Rpb24pLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------Gf9OQar8aRdEMsD22LfQYuFy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Gf9OQar8aRdEMsD22LfQYuFy--

--------------EhnF7uW9zW0ZE4mv7FRQsNG8--

--------------yCNQMTu9Dqzh1HcD65vAqnda
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfYPXEFAwAAAAAACgkQsN6d1ii/Ey/n
2wf8DNZGYrHUzV4C007WMCb9yK+NL7yh311aoj5ovn27Bp43dbqD3JFQ1+k24wN+s+ZMcNNSfiI5
qHIPYpnFkmRYsox2ZS6EfcX00A9ZW4QdJR7q6W1ImtD1pAI/8IWfyuuxN85SRgJQqYYueyjLQayH
OR4XBj2cSHD4X1clF/eeoHjhzz6dyLuB72gfLRR3shOhMvcnrwlym1Gn9cF3tgXY2Mp4XgN6w836
MHWAoE83+9QCzL7CFf8C137ELmb4XEsxz+rUXL8+VTTkVOVmogeUDYilqyRkr1NW4fnYFRgVq317
/Yz3dO2L0eExBRk4zvjeYk511Ek/x49A37pdIg/0fg==
=02St
-----END PGP SIGNATURE-----

--------------yCNQMTu9Dqzh1HcD65vAqnda--

