Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM5aKRSNiWnP+gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 08:30:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E777C10C72E
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 08:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1224959.1531411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpLir-0002HS-E7; Mon, 09 Feb 2026 07:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1224959.1531411; Mon, 09 Feb 2026 07:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpLir-0002Ez-Au; Mon, 09 Feb 2026 07:30:17 +0000
Received: by outflank-mailman (input) for mailman id 1224959;
 Mon, 09 Feb 2026 07:30:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DrmV=AN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vpLip-0002Er-5l
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 07:30:15 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bbadcd6-0589-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 08:30:12 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-658f1fde4bfso7936891a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Feb 2026 23:30:12 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8eda74972esm352882366b.8.2026.02.08.23.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Feb 2026 23:30:11 -0800 (PST)
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
X-Inumbo-ID: 2bbadcd6-0589-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770622212; x=1771227012; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j9DYld0Uy2UOWEXBoqFW6AHlxUvtXWpFOXPJCePl8EU=;
        b=QBek1P17atBKkOw7AjnvQ30Bum+7zqVUCZxCXFlTvf5inFD6R5eMqD4oQCOJsyhscb
         Izh7HUheics/nRi7y67liIKrrWUwFMgcfuE6faMCKMxDvtdgoZsoaG8mj71eNUiYnmoZ
         3OALVsSyWrw8P5mUghHQajSzQZwsUhbwzp/wqay14BMc+zIVJFvChEioC3pDotoNv4XW
         2I8aHlDTErHM30fMpax/++G/nZ9YJxSzKxgh2agy8JDSa7O1dPlES1vxs3tdceD1r+/i
         PHdzni0Bp/aBBBSxxo27yMqaX1MViwX2lZQiU7gyeIb9x4OCpwONrfz7Mpj78asNBQKW
         e/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770622212; x=1771227012;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9DYld0Uy2UOWEXBoqFW6AHlxUvtXWpFOXPJCePl8EU=;
        b=nnybMJ+plWF/WIj0D4lJDs+1HZxFHUChrXMsCHH5ppJRh7nJ69GrfCuOTKT0JZp1OL
         OFmCTwWTZ3krtsBVCoEXWpbnfZe4JITwgsAThZUOCB0SNpFhyXVi4rnyeKIVnDpaxn5W
         dsxytPdU3aFgO6zKLMVGuDkUTQZC1Fa4owHA69SPGLxu7owJYDUeVeNGmihAJ8mY1RVm
         +M7W1XKWPHOPr82KG1P8A9Ucy6w8RvE0+IlmKP3lPzfhFGNN9o6xF61PU3d/8EtV+5i0
         JzSCHiVhjNPy5m+pALwp/AKlbvQZBTiNyBz16FsRZX4FPFtZcTAGxzZgOpvWpODb9ERn
         8xYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZDLQ9d6/MswIfDE0v/VjhKf8sBG9NIh1h+BPnt1g7ikot001T4gOouAn6pH+j3J9rx9dLcUnk8bY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4qo0MWGOCxBnNQPSUurRi27VNq3ShplpsQr0ThXgu6zuz4qtw
	+HQKpM23sjOv+l4EDa93urgbTz3Rp1aEO6MPC2VBB4irWTPzQCTREeddu1xmw0kt0Jo=
X-Gm-Gg: AZuq6aJXc1aZipY3fORULRnlRN+pFz3JmUK4Jw6gIJSRedXZpQ7lcZmhEwC18/0rsZL
	In/tuMWbzy/P0AxfOtKsivTGlHWqpj/HCRPTx3E42Kz3NU0peIKBkE6IzRy/M9iiEIJ+Lhs9NnP
	Lqv5ObQnvT+W90IIONRwMgdHM+lycdug8+GClQVtQ7ACqyLB40Ab5kNdMCwuDj121S6QsyqlX1D
	ftxOMreqMJ+yX1vfLX3RIKyEIxM74U2uqYHhjtVbJOCEncvH+8YORQi4TJ1IsOFbFVnyfs1Gyp3
	3FxlB4jTDrtuqdRIoRPThrOhcsEtgG6xJexEpv8h9XpyiIu9AxAEu+t3MCspAGNHjjrjB2kKU7V
	gZunjhufj4s6ffY3dVZntzKrTm5JGoDgR2Vp9IRJVgNhI7yq839M2c3nJs23NDkCSUl+WQ9iDlZ
	mV3YE2t5QCdJS6nQczcwQ38ZJt4IwnOD4xLK7KFZ1Oq2HOzi71PiLVpi7yNCee4kymIo80Ohq5k
	anG6S7zsCFoqhyGevBuHiC6TzP/gY8CrRfMDQ==
X-Received: by 2002:a17:907:a07:b0:b87:1ffc:bfc0 with SMTP id a640c23a62f3a-b8edb9aeaeamr659093366b.20.1770622212170;
        Sun, 08 Feb 2026 23:30:12 -0800 (PST)
Message-ID: <bcbccd13-880d-43e5-be20-b462546e1dca@suse.com>
Date: Mon, 9 Feb 2026 08:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: better handle backend crash
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Peng Jiang <jiang.peng9@zte.com.cn>, Qiu-ji Chen <chenqiuji666@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
References: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
 <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>
 <261c3ced-7f40-4c2f-93da-0e020f9bcf3a@suse.com>
 <e1060ba2-7985-4e80-9d84-fb738758e3b3@suse.com> <aYYdgXMKnMCfXob7@mail-itl>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <aYYdgXMKnMCfXob7@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C4JZ8hebH6MhCvpPobfGKOrT"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.91)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:linux-kernel@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:jiang.peng9@zte.com.cn,m:chenqiuji666@gmail.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,epam.com,zte.com.cn,gmail.com,amd.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E777C10C72E
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C4JZ8hebH6MhCvpPobfGKOrT
Content-Type: multipart/mixed; boundary="------------hVQRiz2GlU9dM0IIIra60Nfu";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Peng Jiang <jiang.peng9@zte.com.cn>, Qiu-ji Chen <chenqiuji666@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Message-ID: <bcbccd13-880d-43e5-be20-b462546e1dca@suse.com>
Subject: Re: [PATCH] xen/xenbus: better handle backend crash
References: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
 <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>
 <261c3ced-7f40-4c2f-93da-0e020f9bcf3a@suse.com>
 <e1060ba2-7985-4e80-9d84-fb738758e3b3@suse.com> <aYYdgXMKnMCfXob7@mail-itl>
In-Reply-To: <aYYdgXMKnMCfXob7@mail-itl>

--------------hVQRiz2GlU9dM0IIIra60Nfu
Content-Type: multipart/mixed; boundary="------------WhEgGKVIhCkkgcZTuxwpCjOb"

--------------WhEgGKVIhCkkgcZTuxwpCjOb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDIuMjYgMTc6NTcsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMDg6MDI6MzVBTSArMDEwMCwgSsO8cmdlbiBH
cm/DnyB3cm90ZToNCj4+IE9uIDI2LjAxLjI2IDA4OjA4LCBKw7xyZ2VuIEdyb8OfIHdyb3Rl
Og0KPj4+IE9uIDE3LjExLjI1IDEyOjA2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+PiBP
biAwMi4xMS4yNSAwNDoyMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0K
Pj4+Pj4gV2hlbiB0aGUgYmFja2VuZCBkb21haW4gY3Jhc2hlcywgY29vcmRpbmF0ZWQgZGV2
aWNlIGNsZWFudXAgaXMgbm90DQo+Pj4+PiBwb3NzaWJsZSAoYXMgaXQgaW52b2x2ZXMgd2Fp
dGluZyBmb3IgdGhlIGJhY2tlbmQgc3RhdGUgY2hhbmdlKS4gSW4gdGhhdA0KPj4+Pj4gY2Fz
ZSwgdG9vbHN0YWNrIGZvcmNlZnVsbHkgcmVtb3ZlcyBmcm9udGVuZCB4ZW5zdG9yZSBlbnRy
aWVzLg0KPj4+Pj4geGVuYnVzX2Rldl9jaGFuZ2VkKCkgaGFuZGxlcyB0aGlzIGNhc2UsIGFu
ZCB0cmlnZ2VycyBkZXZpY2UgY2xlYW51cC4NCj4+Pj4+IEl0J3MgcG9zc2libGUgdGhhdCB0
b29sc3RhY2sgbWFuYWdlcyB0byBjb25uZWN0IG5ldyBkZXZpY2UgaW4gdGhhdA0KPj4+Pj4g
cGxhY2UsIGJlZm9yZSB4ZW5idXNfZGV2X2NoYW5nZWQoKSBub3RpY2VzIHRoZSBvbGQgb25l
IGlzIG1pc3NpbmcuIElmDQo+Pj4+PiB0aGF0IGhhcHBlbnMsIG5ldyBvbmUgd29uJ3QgYmUg
cHJvYmVkIGFuZCB3aWxsIGZvcmV2ZXIgcmVtYWluIGluDQo+Pj4+PiBYZW5idXNTdGF0ZUlu
aXRpYWxpc2luZy4NCj4+Pj4+DQo+Pj4+PiBGaXggdGhpcyBieSBjaGVja2luZyBiYWNrZW5k
LWlkIGFuZCBpZiBpdCBjaGFuZ2VzLCBjb25zaWRlciBpdA0KPj4+Pj4gdW5wbHVnK3BsdWcg
b3BlcmF0aW9uLiBJdCdzIGltcG9ydGFudCB0aGF0IGNsZWFudXAgb24gc3VjaCB1bnBsdWcN
Cj4+Pj4+IGRvZXNuJ3QgbW9kaWZ5IHhlbnN0b3JlIGVudHJpZXMgKGVzcGVjaWFsbHkgdGhl
ICJzdGF0ZSIga2V5KSBhcyBpdA0KPj4+Pj4gYmVsb25nIHRvIHRoZSBuZXcgZGV2aWNlIHRv
IGJlIHByb2JlZCAtIGNoYW5naW5nIGl0IHdvdWxkIGRlcmFpbA0KPj4+Pj4gZXN0YWJsaXNo
aW5nIGNvbm5lY3Rpb24gdG8gdGhlIG5ldyBiYWNrZW5kIChtb3N0IGxpa2VseSwgY2xvc2lu
ZyB0aGUNCj4+Pj4+IGRldmljZSBiZWZvcmUgaXQgd2FzIGV2ZW4gY29ubmVjdGVkKS4gSGFu
ZGxlIHRoaXMgY2FzZSBieSBzZXR0aW5nIG5ldw0KPj4+Pj4geGVuYnVzX2RldmljZS0+dmFu
aXNoZWQgZmxhZyB0byB0cnVlLCBhbmQgY2hlY2sgaXQgYmVmb3JlIGNoYW5naW5nIHN0YXRl
DQo+Pj4+PiBlbnRyeS4NCj4+Pj4+DQo+Pj4+PiBBbmQgZXZlbiBpZiB4ZW5idXNfZGV2X2No
YW5nZWQoKSBjb3JyZWN0bHkgZGV0ZWN0cyB0aGUgZGV2aWNlIHdhcw0KPj4+Pj4gZm9yY2Vm
dWxseSByZW1vdmVkLCB0aGUgY2xlYW51cCBoYW5kbGluZyBpcyBzdGlsbCByYWN5LiBTaW5j
ZSB0aGlzIHdob2xlDQo+Pj4+PiBoYW5kbGluZyBkb2Vzbid0IGhhcHBlbmQgaW4gYSBzaW5n
bGUgeGVuc3RvcmUgdHJhbnNhY3Rpb24sIGl0J3MgcG9zc2libGUNCj4+Pj4+IHRoYXQgdG9v
bHN0YWNrIG1pZ2h0IHB1dCBhIG5ldyBkZXZpY2UgdGhlcmUgYWxyZWFkeS4gQXZvaWQgcmUt
Y3JlYXRpbmcNCj4+Pj4+IHRoZSBzdGF0ZSBrZXkgKHdoaWNoIGluIHRoZSBjYXNlIG9mIGxv
b3NpbmcgdGhlIHJhY2Ugd291bGQgYWN0dWFsbHkNCj4+Pj4+IGNsb3NlIG5ld2x5IGF0dGFj
aGVkIGRldmljZSkuDQo+Pj4+Pg0KPj4+Pj4gVGhlIHByb2JsZW0gZG9lcyBub3QgYXBwbHkg
dG8gZnJvbnRlbmQgZG9tYWluIGNyYXNoLCBhcyB0aGlzIGNhc2UNCj4+Pj4+IGludm9sdmVz
IGNvb3JkaW5hdGVkIGNsZWFudXAuDQo+Pj4+Pg0KPj4+Pj4gUHJvYmxlbSBvcmlnaW5hbGx5
IHJlcG9ydGVkIGF0DQo+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwv
YU9adml2eVo5WWhWV0RMTkBtYWlsLWl0bC9ULyN0LA0KPj4+Pj4gaW5jbHVkaW5nIHJlcHJv
ZHVjdGlvbiBzdGVwcy4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+
Pj4+DQo+Pj4+IFNvcnJ5IEkgZGlkbid0IGdldCBlYXJsaWVyIHRvIHRoaXMuDQo+Pj4+DQo+
Pj4+IE15IG1haW4gcHJvYmxlbSB3aXRoIHRoaXMgcGF0Y2ggaXMgdGhhdCBpdCBpcyBiYXNp
Y2FsbHkganVzdCBwYXBlcmluZyBvdmVyDQo+Pj4+IGEgbW9yZSBnZW5lcmFsIHByb2JsZW0u
DQo+Pj4+DQo+Pj4+IFlvdSBhcmUganVzdCBtYWtpbmcgdGhlIHByb2JsZW0gbXVjaCBtb3Jl
IGltcHJvYmFibGUsIGJ1dCBub3QgaW1wb3NzaWJsZSB0bw0KPj4+PiBvY2N1ciBhZ2Fpbi4g
SW4gY2FzZSB0aGUgbmV3IGRyaXZlciBkb21haW4gaGFzIHRoZSBzYW1lIGRvbWlkIGFzIHRo
ZSBvbGQgb25lDQo+Pj4+IHlvdSBjYW4gc3RpbGwgaGF2ZSB0aGUgc2FtZSByYWNlLg0KPj4+
Pg0KPj4+PiBUaGUgY2xlYW4gd2F5IHRvIGhhbmRsZSB0aGF0IHdvdWxkIGJlIHRvIGFkZCBh
IHVuaXF1ZSBJZCBpbiBYZW5zdG9yZSB0byBlYWNoDQo+Pj4+IGRldmljZSBvbiB0aGUgYmFj
a2VuZCBzaWRlLCB3aGljaCBjYW4gYmUgdGVzdGVkIG9uIHRoZSBmcm9udGVuZCBzaWRlIHRv
DQo+Pj4+IG1hdGNoLiBJbiBjYXNlIGl0IGRvZXNuJ3QgbWF0Y2gsIGFuIG9sZCBkZXZpY2Ug
d2l0aCB0aGUgc2FtZSBraW5kIGFuZCBkZXZpZA0KPj4+PiBjYW4gYmUgY2xlYW5lZCB1cC4N
Cj4+Pj4NCj4+Pj4gVGhlIHVuaXF1ZSBJZCB3b3VsZCBvYnZpb3VzbHkgbmVlZCB0byBiZSBz
ZXQgYnkgdGhlIFhlbiB0b29scyBpbnNpZGUgdGhlDQo+Pj4+IHRyYW5zYWN0aW9uIHdyaXRp
bmcgdGhlIGluaXRpYWwgYmFja2VuZCBYZW5zdG9yZSBub2RlcywgYXMgZG9pbmcgdGhhdCBm
cm9tDQo+Pj4+IHRoZSBiYWNrZW5kIHdvdWxkIGFkZCBhbm90aGVyIHBvdGVudGlhbCBhbWJp
Z3VpdHkgYnkgdGhlIGRyaXZlciBkb21haW4NCj4+Pj4gY2hvb3NpbmcgdGhlIHNhbWUgdW5p
cXVlIGlkIGFzIHRoZSBwcmV2aW91cyBvbmUgZGlkLg0KPj4+Pg0KPj4+PiBUaGUgcXVlc3Rp
b24gaXMgd2hldGhlciBzb21ldGhpbmcgbGlrZSB5b3VyIHBhdGNoIHNob3VsZCBiZSB1c2Vk
IGFzIGENCj4+Pj4gZmFsbGJhY2sgaW4gY2FzZSB0aGVyZSBpcyBubyB1bmlxdWUgSWQgb24g
dGhlIGJhY2tlbmQgc2lkZSBvZiB0aGUgZGV2aWNlDQo+Pj4+IGR1ZSB0byBhIHRvbyBvbGQg
WGVuIHZlcnNpb24uDQo+Pj4NCj4+PiBJIHRoaW5rIEkgaGF2ZSBmb3VuZCBhIHNvbHV0aW9u
IHdoaWNoIGlzIG11Y2ggbW9yZSBzaW1wbGUsIGFzIGl0IGRvZXNuJ3QNCj4+PiBuZWVkIGFu
eSBjaGFuZ2Ugb2YgdGhlIHByb3RvY29sIG9yIGFueSBhZGRpdGlvbiBvZiBuZXcgaWRlbnRp
ZmllcnMuDQo+Pj4NCj4+PiBXaGVuIGNyZWF0aW5nIGEgbmV3IFBWIGRldmljZSwgWGVuIHRv
b2xzIHdpbGwgYWx3YXlzIHdyaXRlIGFsbCBnZW5lcmljDQo+Pj4gZnJvbnRlbmQtIGFuZCBi
YWNrZW5kLW5vZGVzLiBUaGlzIGluY2x1ZGVzIHRoZSBmcm9udGVuZCBzdGF0ZSwgd2hpY2gg
aXMNCj4+PiBpbml0aWFsaXplZCBhcyBYZW5idXNTdGF0ZUluaXRpYWxpc2luZy4NCj4+Pg0K
Pj4+IFRoZSBMaW51eCBrZXJuZWwncyB4ZW5idXMgZHJpdmVyIGlzIGFscmVhZHkgc3Rvcmlu
ZyB0aGUgbGFzdCBrbm93biBzdGF0ZQ0KPj4+IG9mIGEgeGVuYnVzIGRldmljZSBpbiBzdHJ1
Y3QgeGVuYnVzX2RldmljZS4gV2hlbiBjaGFuZ2luZyB0aGUgc3RhdGUsIHRoZQ0KPj4+IHhl
bmJ1cyBkcml2ZXIgaXMgZXZlbiByZWFkaW5nIHRoZSBzdGF0ZSBmcm9tIFhlbnN0b3JlIChl
dmVuIGlmIG9ubHkgZm9yDQo+Pj4gbWFraW5nIHN1cmUgdGhlIHBhdGggaXMgc3RpbGwgZXhp
c3RpbmcpLiBTbyBhbGwgd2hhdCBpcyBuZWVkZWQgaXMgdG8gY2hlY2ssDQo+Pj4gd2hldGhl
ciB0aGUgcmVhZCBjdXJyZW50IHN0YXRlIGlzIG1hdGNoaW5nIHRoZSBsb2NhbGx5IHNhdmVk
IHN0YXRlLiBJZiBpdA0KPj4+IGlzIG5vdCBtYXRjaGluZyBBTkQgdGhlIHJlYWQgc3RhdGUg
aXMgWGVuYnVzU3RhdGVJbml0aWFsaXNpbmcsIHlvdSBjYW4gYmUNCj4+PiBzdXJlIHRoYXQg
dGhlIGJhY2tlbmQgaGFzIGJlZW4gcmVwbGFjZWQuDQo+Pj4NCj4+PiBIYW5kbGluZyB0aGlz
IHdpbGwgbmVlZCB0byBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIG9mIHhlbmJ1c19zd2l0Y2hf
c3RhdGUoKQ0KPj4+IGluIGFsbCByZWxhdGVkIGRyaXZlcnMsIGJ1dCB0aGlzIGlzIGp1c3Qg
YSBtb3JlIG9yIGxlc3MgbWVjaGFuaWNhbCBjaGFuZ2UuDQo+Pj4NCj4+PiBJJ2xsIHByZXBh
cmUgYSBwYXRjaCBzZXJpZXMgZm9yIHRoYXQuDQo+Pg0KPj4gSW4gdGhlIGVuZCB0aGUgcmVz
dWx0IGlzIG1vcmUgbGlrZSB5b3VyIHBhdGNoLCBhdm9pZGluZyB0aGUgbmVlZCB0byBtb2Rp
ZnkNCj4+IGFsbCBkcml2ZXJzLg0KPj4NCj4+IEkganVzdCBhZGRlZCBteSBpZGVhIHRvIHlv
dXIgcGF0Y2ggYW5kIG1vZGlmaWVkIHNvbWUgb2YgeW91ciBjb2RlIHRvIGJlIG1vcmUNCj4+
IHNpbXBsZS4gSSBfdGhpbmtfIEkgaGF2ZSBjb3ZlcmVkIGFsbCBwb3NzaWJsZSBzY2VuYXJp
b3Mgbm93LCByZXN1bHRpbmcgaW4NCj4+IHRoZSBuZWVkIHRvIGtlZXAgdGhlIGJhY2tlbmQg
aWQgY2hlY2sgaW4gY2FzZSB0aGUgYmFja2VuZCBkaWVkIGR1cmluZyB0aGUNCj4+IGVhcmx5
IGluaXQgcGhhc2Ugb2YgdGhlIGRldmljZS4NCj4+DQo+PiBDb3VsZCB5b3UgcGxlYXNlIHZl
cmlmeSB0aGUgYXR0YWNoZWQgcGF0Y2ggaXMgd29ya2luZyBmb3IgeW91Pw0KPiANCj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2ghDQo+IA0KPiBJIHJhbiBpdCB0aHJvdWdoIHJlbGV2YW50IHRl
c3RzLCBhbmQgSSBnb3QgaW5jb25zaXN0ZW50IHJlc3VsdHMuDQo+IFNwZWNpZmljYWxseSwg
c29tZXRpbWVzLCB0aGUgZG9tVSBoYW5ncyAoYWN0dWFsbHksIGp1c3Qgb25lIHZDUFUgc3Bp
bnMNCj4gaW5zaWRlIHhlbndhdGNoIHRocmVhZCkuIExhc3QgY29uc29sZSBtZXNzYWdlcyBh
cmU6DQo+IA0KPiAgICAgIHN5c3RlbWRbNjI2XTogU3RhcnRpbmcgZGNvbmYuc2VydmljZSAt
IFVzZXIgcHJlZmVyZW5jZXMgZGF0YWJhc2UuLi4NCj4gICAgICBnbm9tZS1rZXlyaW5nLWRh
ZW1vbls5NzVdOiDikJtbMDsxOzM5bWNvdWxkbid0IGFjY2VzcyBjb250cm9sIHNvY2tldDog
L3J1bi91c2VyLzEwMDAva2V5cmluZy9jb250cm9sOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J54pCbWzBtDQo+ICAgICAgZ25vbWUta2V5cmluZy1kYWVtb25bOTc1XTog4pCbWzA7MTsz
ODo1OjE4NW1kaXNjb3Zlcl9vdGhlcl9kYWVtb246IDDikJtbMG0NCj4gICAgICB4ZW4gdmlm
LTA6IHhlbmJ1czogc3RhdGUgcmVzZXQgb2NjdXJyZWQsIHJlY29ubmVjdGluZw0KPiAgICAg
IGdub21lLWtleXJpbmctZGFlbW9uWzk3NF06IOKQm1swOzE7MzltY291bGRuJ3QgYWNjZXNz
IGNvbnRyb2wgc29ja2V0OiAvcnVuL3VzZXIvMTAwMC9rZXlyaW5nL2NvbnRyb2w6IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnnikJtbMG0NCj4gICAgICBnbm9tZS1rZXlyaW5nLWRhZW1v
bls5NzZdOiDikJtbMDsxOzM5bWNvdWxkbid0IGFjY2VzcyBjb250cm9sIHNvY2tldDogL3J1
bi91c2VyLzEwMDAva2V5cmluZy9jb250cm9sOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
4pCbWzBtDQo+ICAgICAgZ25vbWUta2V5cmluZy1kYWVtb25bOTc2XTog4pCbWzA7MTszODo1
OjE4NW1kaXNjb3Zlcl9vdGhlcl9kYWVtb246IDDikJtbMG0NCj4gICAgICBnbm9tZS1rZXly
aW5nLWRhZW1vbls5NzRdOiDikJtbMDsxOzM4OjU6MTg1bWRpc2NvdmVyX290aGVyX2RhZW1v
bjogMOKQm1swbQ0KPiAgICAgIHhlbiB2aWYtMDogeGVuYnVzOiBzdGF0ZSByZXNldCBvY2N1
cnJlZCwgcmVjb25uZWN0aW5nDQo+ICAgICAgc3lzdGVtZFs2MjZdOiBTdGFydGVkIGRjb25m
LnNlcnZpY2UgLSBVc2VyIHByZWZlcmVuY2VzIGRhdGFiYXNlLg0KPiAgICAgIHhlbl9uZXRm
cm9udDogSW5pdGlhbGlzaW5nIFhlbiB2aXJ0dWFsIGV0aGVybmV0IGRyaXZlcg0KPiAgICAg
IHZpZiB2aWYtMDogeGVuYnVzOiBzdGF0ZSByZXNldCBvY2N1cnJlZCwgcmVjb25uZWN0aW5n
DQo+IA0KPiBBbmQgdGhlIGNhbGwgdHJhY2Ugb2YgdGhlIHNwaW5uaW5nIHhlbndhdGNoIHRo
cmVhZCBpczoNCj4gDQo+ICAgICAgdGFzazp4ZW53YXRjaCAgICAgICAgc3RhdGU6RCBzdGFj
azowICAgICBwaWQ6NjQgICAgdGdpZDo2NCAgICBwcGlkOjIgICAgICB0YXNrX2ZsYWdzOjB4
Mjg4MDQwIGZsYWdzOjB4MDAwODAwMDANCj4gICAgICBDYWxsIFRyYWNlOg0KPiAgICAgICA8
VEFTSz4NCj4gICAgICAgX19zY2hlZHVsZSsweDJmMy8weDc4MA0KPiAgICAgICBzY2hlZHVs
ZSsweDI3LzB4ODANCj4gICAgICAgeHNfd2FpdF9mb3JfcmVwbHkrMHhhYi8weDFmMA0KPiAg
ICAgICA/IF9fcGZ4X2F1dG9yZW1vdmVfd2FrZV9mdW5jdGlvbisweDEwLzB4MTANCj4gICAg
ICAgeHNfdGFsa3YrMHhlYy8weDIwMA0KPiAgICAgICB4c19zaW5nbGUrMHg0YS8weDcwDQo+
ICAgICAgIHhlbmJ1c19nYXRoZXIrMHhlNC8weDFhMA0KPiAgICAgICB4ZW5idXNfcmVhZF9k
cml2ZXJfc3RhdGUrMHg0Mi8weDcwDQo+ICAgICAgIHhlbm5ldF9idXNfY2xvc2UrMHgxMTMv
MHgyYzAgW3hlbl9uZXRmcm9udF0NCj4gICAgICAgPyBfX3BmeF9hdXRvcmVtb3ZlX3dha2Vf
ZnVuY3Rpb24rMHgxMC8weDEwDQo+ICAgICAgIHhlbm5ldF9yZW1vdmUrMHgxNi8weDgwIFt4
ZW5fbmV0ZnJvbnRdDQo+ICAgICAgIHhlbmJ1c19kZXZfcmVtb3ZlKzB4NzEvMHhmMA0KPiAg
ICAgICBkZXZpY2VfcmVsZWFzZV9kcml2ZXJfaW50ZXJuYWwrMHgxOWMvMHgyMDANCj4gICAg
ICAgYnVzX3JlbW92ZV9kZXZpY2UrMHhjNi8weDEzMA0KPiAgICAgICBkZXZpY2VfZGVsKzB4
MTYwLzB4M2UwDQo+ICAgICAgIGRldmljZV91bnJlZ2lzdGVyKzB4MTcvMHg2MA0KPiAgICAg
ICB4ZW5idXNfZGV2X2NoYW5nZWQuY29sZCsweDVlLzB4NmINCj4gICAgICAgPyBfX3BmeF94
ZW53YXRjaF90aHJlYWQrMHgxMC8weDEwDQo+ICAgICAgIHhlbndhdGNoX3RocmVhZCsweDky
LzB4MWMwDQo+ICAgICAgID8gX19wZnhfYXV0b3JlbW92ZV93YWtlX2Z1bmN0aW9uKzB4MTAv
MHgxMA0KPiAgICAgICBrdGhyZWFkKzB4ZmMvMHgyNDANCj4gICAgICAgPyBfX3BmeF9rdGhy
ZWFkKzB4MTAvMHgxMA0KPiAgICAgICByZXRfZnJvbV9mb3JrKzB4ZjUvMHgxMTANCj4gICAg
ICAgPyBfX3BmeF9rdGhyZWFkKzB4MTAvMHgxMA0KPiAgICAgICByZXRfZnJvbV9mb3JrX2Fz
bSsweDFhLzB4MzANCj4gICAgICAgPC9UQVNLPg0KPiAgICAgIHRhc2s6eGVuYnVzICAgICAg
ICAgIHN0YXRlOlMgc3RhY2s6MCAgICAgcGlkOjYzICAgIHRnaWQ6NjMgICAgcHBpZDoyICAg
ICAgdGFza19mbGFnczoweDIwODA0MCBmbGFnczoweDAwMDgwMDAwDQo+ICAgICAgQ2FsbCBU
cmFjZToNCj4gICAgICAgPFRBU0s+DQo+ICAgICAgIF9fc2NoZWR1bGUrMHgyZjMvMHg3ODAN
Cj4gICAgICAgPyBfX3BmeF94ZW5idXNfdGhyZWFkKzB4MTAvMHgxMA0KPiAgICAgICBzY2hl
ZHVsZSsweDI3LzB4ODANCj4gICAgICAgeGVuYnVzX3RocmVhZCsweDFhOC8weDIwMA0KPiAg
ICAgICA/IF9fcGZ4X2F1dG9yZW1vdmVfd2FrZV9mdW5jdGlvbisweDEwLzB4MTANCj4gICAg
ICAga3RocmVhZCsweGZjLzB4MjQwDQo+ICAgICAgID8gX19wZnhfa3RocmVhZCsweDEwLzB4
MTANCj4gICAgICAgcmV0X2Zyb21fZm9yaysweGY1LzB4MTEwDQo+ICAgICAgID8gX19wZnhf
a3RocmVhZCsweDEwLzB4MTANCj4gICAgICAgcmV0X2Zyb21fZm9ya19hc20rMHgxYS8weDMw
DQo+ICAgICAgIDwvVEFTSz4NCj4gDQo+ICh0ZWNobmljYWxseSwgYHRvcGAgc2F5cyBpdCdz
IHRoZSB4ZW5idXMgdGhyZWFkIHNwaW5uaW5nLCBidXQgaXQgbG9va3MNCj4gbGlrZSB0aGUg
YWN0dWFsIGlzc3VlIGlzIGluIHhlbndhdGNoIG9uZSkNCj4gDQo+IE5vdGUgdGhhdCBvdGhl
ciB4ZW53YXRjaCBhY3Rpb25zIGluIHRoaXMgZG9tVSBhcmUgbm90IGV4ZWN1dGVkLCBmb3IN
Cj4gZXhhbXBsZSBgeGwgc3lzcnFgIGRvZXMgbm90aGluZy4gTm90IHN1cnByaXNpbmcsIGdp
dmVuIHhlbndhdGNoIHRocmVhZA0KPiBpcyBidXN5Li4uIEZvcnR1bmF0ZWx5LCBpdCBibG9j
a3Mgb25seSBhIHNpbmdsZSB2Q1BVLCBzbyBJJ20gYWJsZSB0bw0KPiBpbnRlcmFjdCB3aXRo
IHRoZSBkb21VIG92ZXIgY29uc29sZSAodG8gZ2V0IHRoZSBhYm92ZSB0cmFjZXMpLg0KPiAN
Cj4gSXQgaXNuJ3QgYSByZWxpYWJsZSBmYWlsdXJlLCBpbiB0aGlzIHRlc3QgcnVuIGl0IGZh
aWxlZCBvbmNlLCBvdXQgb2YgNA0KPiByZWxhdGVkIHRlc3RzLg0KPiANCj4gVGhlIHNwZWNp
ZmljIHRlc3QgaXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9RdWJlc09TL3F1YmVzLWNvcmUtYWRt
aW4vYmxvYi9tYWluL3F1YmVzL3Rlc3RzL2ludGVnL25ldHdvcmsucHkjTDIzNA0KPiBJbiBz
aG9ydDoNCj4gMS4gU3RhcnQgYSBkb21VDQo+IDIuIFBhdXNlIGl0DQo+IDMuIEF0dGFjaCBu
ZXR3b3JrIChiYWNrZW5kIGlzICE9IGRvbTApDQo+IDQuIFVucGF1c2UNCj4gDQo+IFRCSCwg
SSdtIG5vdCBzdXJlIHdoeSB0aGUgInN0YXRlIHJlc2V0IG9jY3VycmVkIiBtZXNzYWdlIGlz
IHRyaWdnZXJlZCBhdA0KPiBhbGwsIEkgdGhpbmsgaXQgc2hvdWxkbid0IGJlIGluIHRoaXMg
Y2FzZS4uLg0KPiANCg0KVGhhbmtzIGZvciB0aGUgdGVzdC4NCg0KSSBndWVzcyB0aGUgaGFu
ZyBoYXBwZW5zIGR1ZSB0byB4ZW5uZXRfYnVzX2Nsb3NlKCkgd2FpdGluZyBmb3IgYSBzdGF0
ZQ0KY2hhbmdlIHdoaWNoIHdvbid0IGhhcHBlbiBhdCBhbGwsIGFzIGl0IGlzIGFscmVhZHkg
WGVuYnVzU3RhdGVJbml0aWFsaXNpbmcuDQoNClRoZSByaWdodCB0aGluZyB0byBkbyB3b3Vs
ZCBiZSB0byBhZGQgdGhlIHhlbmJ1c19kZXZpY2UgcG9pbnRlciB0byB0aGUNCnBhcmFtZXRl
cnMgb2YgeGVuYnVzX3JlYWRfZHJpdmVyX3N0YXRlKCksIGluIG9yZGVyIHRvIGJlIGFibGUg
dG8gcmV0dXJuDQpYZW5idXNTdGF0ZVVua25vd24gaW4gY2FzZSB0aGUgZGV2aWNlIGhhcyB2
YW5pc2hlZC4NCg0KSSdsbCBhZGQgYSBwYXRjaCBmb3IgdGhhdC4NCg0KDQpKdWVyZ2VuDQo=

--------------WhEgGKVIhCkkgcZTuxwpCjOb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------WhEgGKVIhCkkgcZTuxwpCjOb--

--------------hVQRiz2GlU9dM0IIIra60Nfu--

--------------C4JZ8hebH6MhCvpPobfGKOrT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmJjQMFAwAAAAAACgkQsN6d1ii/Ey95
Jgf8DpH1RfoHUsEV2w4IlmMxSoUdNU1Uw9GFG6v56eFo40smywACKXmmqjGR0FaUeuqBln4d6xgt
9d2aLze5P9LEs8oeFYf4k2/GyrFn0meDibZ5a4rqbLoMedKeolXtBRF59y6zf3oqp0dTqImc8XJg
uoFYw8dX92inkS0Cz2PXszFvE3HHmCVih94//wk1UoO4EuoPyc9RYm1NPmAYdvTUkf947pPByra6
cfcAnZMvjIDzizZ3lTWPWn5icfgvnPm31FhrYX3SrsmyTm6+v5NHFw2qs8HTCTHuARaB5d1TzOay
QL5C3GDxZQQyZofReDfvfcXtEGVHulXwHJZTDlIUhA==
=elE0
-----END PGP SIGNATURE-----

--------------C4JZ8hebH6MhCvpPobfGKOrT--

