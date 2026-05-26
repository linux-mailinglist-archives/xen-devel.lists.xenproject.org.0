Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHT/OkVtFWojVAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:52:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4221D5D3B76
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319750.1587224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoS0-0005rF-0e; Tue, 26 May 2026 09:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319750.1587224; Tue, 26 May 2026 09:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoRz-0005od-Tl; Tue, 26 May 2026 09:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1319750;
 Tue, 26 May 2026 09:51:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wRoRy-0005oX-D2
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:51:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoRx-009wq3-L0
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:51:49 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a156d2c-2eae-0a2a0a5409dd-0a2a4505acfa-46
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:51:49 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a156d33-aaa8-0a2a45050019-d155d02dd9c6-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:51:47 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-68852b58d87so1052719a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:51:47 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-688bb622cd4sm4975170a12.28.2026.05.26.02.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 02:51:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779789107; x=1780393907; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E6E/V8Nupfq7xure3YUTLzImoDv683GDToL6vzbGOrk=;
        b=b+KyaTGO2n/dOfVloCy6vhBoAxYlYb8R+dqnk53iz5kniY+PV76qpTyGNjFnriZmxF
         sicNWvwgr9v8zO8L8wXucX6F9cxgx5AC1gAYtJT4p0kGRGWI39D5vTQpKrwSbNhcKErY
         GLSDsadcQ/ngMDxJ0tISL0x6Bf7Qs7LhBLPw9w8YF28ayhmjexck9Z1X1a9mylpU0R2I
         fIbD6I5VCg4fVMnDx26thm6xUPf0k0ZkkNrqrrjllGryx8wNgbKnykogMAjP4JEtn+el
         LbC/FAuLh+GOLNeBAwLzve6MY5aOSC9QGwUnrH9BKgrsVBRXXtGupOoDd/udq4dB4icx
         cjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789107; x=1780393907;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6E/V8Nupfq7xure3YUTLzImoDv683GDToL6vzbGOrk=;
        b=XPydBgSuJq7TKk6Kwo+/d/wPhE66PHmPOMxot944iLr5gCldDB+1BR5yoBfv0bwY+j
         f2wjijaUDpR0pGSKS/HF4PviZmBNz3W8Q2DafrqzUTdmRlyP08XVE493H2rVv4VJqrzp
         7qApPhWpLH68/cX0nXJzRm4QMzAppyJP2BR5KujpRQD9G1F3RKdWsfoVEVMeymJLNbbI
         8vTM5QYr/rUIzcjZKF1bMNR8TopSDvBYxWNFdMtMuzLzmJVFzMbMQQxg+J9HAvrIKKsU
         9lc7G7fZZKoebVUn/zwvhLPpnDOve+O6pjydza/+4bOtkVToC3BoLt4ujgCmhI4usXJ6
         tgfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eydQz4h3VZYXej6BpITVRxXR6/bBngusLUQ8tb1/d3s22xVzE95Dp5tzdCsogsNQ8cAOtI2BOrHY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPCP7bTQLM4+vdy66XG7bZiK2syD5E4T5Rm7Jw5BXjUawtPcjR
	erFs4d6u9eD7ejhRVRQQxfwce3U0c+MBGHlikTtGBOOCReYPKMtkgS+4MnRUnzhuBmk=
X-Gm-Gg: Acq92OFzgeGmgjynKeVm4SEL9ICB8KBV6UV6Bjz5+aHjPmE9ZP1nM8IUEkKioQqmW9S
	d05z9yz0JSECMiER8+r0coH8rbuZi5ey3KXb83ZGX+5lbeaTKOjpPw5Ojv9atDKbHTnUx1UAJKG
	WqSBDeiszg3iWyUVVVCycHaJPD5iFjhW178vvqmHj9gPf2xFkmL2bSExrDlaoNlKn1DQXBIy9pY
	lzCzaPG71OQ+OjcsmSY9fpH7HE152Dn2DtsK+O5cjT987CJ6h/R+qQY5nCdwbjv6SD2EOhUD/bC
	CnmvJU803Ny/VxC5mJWWC79yVgXwAlqQ6nNGtLUwloS/bRdOKH6kMbFAvIfukU2DvQKO1LA5e+/
	1m4T1nJpXRuZWgb59Z5UT3L+/xNHQg/jgpk+DLWARumQSfpNmpFyDS5hwehUzSCy9JeVsne4Afk
	+uqluCe3RwChP7vlRxbRNyXuV2EcqYrcITnglQs10cLrZBB2K4N4Hr0ZKQMY5FU4vZNTr+sfEdy
	E+yBjB4waojseC5w+Gtoev4U93GzLNEkL0mBQzwb+fFvSiIbJXlbQ==
X-Received: by 2002:a05:6402:5293:b0:67f:97eb:b0ef with SMTP id 4fb4d7f45d1cf-6889c476e4cmr9239454a12.15.1779789107312;
        Tue, 26 May 2026 02:51:47 -0700 (PDT)
Message-ID: <c47a38fb-9945-4d0f-8d19-bd455c591245@suse.com>
Date: Tue, 26 May 2026 11:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] x86/asm: move inline string functions to
 <asm/string_inline.h>
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, kernel test robot <lkp@intel.com>
References: <20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com>
 <20260520-pvh-kasan-inline-v3-1-bede769c6ec7@igalia.com>
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
In-Reply-To: <20260520-pvh-kasan-inline-v3-1-bede769c6ec7@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mhJR1jnrYbl28dTfrgzwtzfE"
X-purgate-ID: tlsNG-c201ff/1779789107-E2193443-87D84596/0/0
X-purgate-type: clean
X-purgate-size: 10518
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mfo@igalia.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:lkp@intel.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,suse.com:mid,suse.com:dkim,intel.com:email,igalia.com:email];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,oracle.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.664];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4221D5D3B76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mhJR1jnrYbl28dTfrgzwtzfE
Content-Type: multipart/mixed; boundary="------------G04jG51tG4wXBZwiRrrI7T7Y";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, kernel test robot <lkp@intel.com>
Message-ID: <c47a38fb-9945-4d0f-8d19-bd455c591245@suse.com>
Subject: Re: [PATCH v3 1/4] x86/asm: move inline string functions to
 <asm/string_inline.h>
References: <20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com>
 <20260520-pvh-kasan-inline-v3-1-bede769c6ec7@igalia.com>
In-Reply-To: <20260520-pvh-kasan-inline-v3-1-bede769c6ec7@igalia.com>

--------------G04jG51tG4wXBZwiRrrI7T7Y
Content-Type: multipart/mixed; boundary="------------xLcLPnETSHv627VKGGo8W0Cg"

--------------xLcLPnETSHv627VKGGo8W0Cg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDUuMjYgMjM6MTIsIE1hdXJpY2lvIEZhcmlhIGRlIE9saXZlaXJhIHdyb3RlOg0K
PiBJbiBuZXh0IHBhdGNoLCBpbmxpbmUgc3RyaW5nIGZ1bmN0aW9ucyBhcmUgaW5jbHVkZWQg
ZnJvbSAnYm9vdC9zdHJpbmcuYycuDQoNClBsZWFzZSBkb24ndCB1c2UgIkluIG5leHQgcGF0
Y2giLiBZb3UgY2FuJ3QgYmUgc3VyZSB0aGUgcGF0Y2hlcyBvZiBhDQpzZXJpZXMgYXJlIGdv
aW5nIHRvIGJlIGNvbW1pdHRlZCBhbGwgdG9nZXRoZXIuDQoNCkEgYmV0dGVyIGFsdGVybmF0
aXZlIHdvcmRpbmcgd291bGQgYmUgIkluIGEgZnV0dXJlIHBhdGNoIi4NCg0KPiBVc2luZyB0
aGUgaGVhZGVyIDxhc20vc3RyaW5nLmg+IGlzIHByb2JsZW1hdGljIGZvciBhIGNvdXBsZSBv
ZiByZWFzb25zICgqKQ0KPiAoaS5lLiwgYnVpbGQgZXJyb3JzKSwgd2hpY2ggY2FuIGJlIGFk
ZHJlc3NlZCwgYnV0IGludHJvZHVjZSB1bm5lY2Vzc2FyeQ0KPiBjb21wbGV4aXR5IGFuZCBy
ZWdyZXNzaW9uIHJpc2sgKGJleW9uZCB0aGVzZSBfZm91bmRfIGNvdXBsZSBvZiByZWFzb25z
KS4NCj4gDQo+IFVzaW5nIGEgbmV3IGhlYWRlciA8YXNtL3N0cmluZ19pbmxpbmUuaD4gaXMg
c2ltcGxlciBhbmQgdHJhbnNwYXJlbnQgdG8NCj4gZXhpc3RpbmcgdXNlcnMgb2YgPGFzbS9z
dHJpbmcuaD4sIHdpdGggbGVzcyBjaGFuZ2VzIHRvICdib290L3N0cmluZy5jJw0KPiBhbmQg
aXRzIHVzZXJzIChlZyAnYm9vdC9jb21wcmVzc2VkL3N0cmluZy5jJyBhbmQgJ3B1cmdhdG9y
eS9wdXJnYXRvcnkucm8nKSwNCj4gd2hpY2ggbWluaW1pemUgcmVncmVzc2lvbiByaXNrLg0K
PiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KDQpJJ2QgcmF0aGVy
IHB1dCB0aGUgZm9vdG5vdGUgYmVsb3cgYWZ0ZXIgdGhlICItLS0iIGxpbmUsIGFzIGl0IGlz
IG1vcmUNCmludGVyZXN0aW5nIGZvciB0aGUgcmV2aWV3ZXIgdGhhbiB0aGUgY29uc3VtZXIg
b2YgImdpdCBsb2ciIG9yICJnaXQgc2hvdyIuDQoNCk5vdGUgdGhhdCBvdGhlcnMgbWlnaHQg
ZGlzYWdyZWUsIHRob3VnaC4NCg0KPiAoKikgUmVhc29ucyBub3QgdG8gaW5jbHVkZSA8YXNt
L3N0cmluZy5oPiBpbiAnYm9vdC9zdHJpbmcuYyc6DQo+IA0KPiAxKSAnYm9vdC9zdHJpbmcu
YycgaXMgYnVpbHQgZm9yIDE2LWJpdC9yZWFsIG1vZGUgdGh1cyBzb21lIHR5cGUgYW5kIHdv
cmQNCj4gc2l6ZSBlcnJvcnMgaGFwcGVuIHdoZW4gPGFzbS9zdHJpbmcuaD4gaW5jbHVkZSwg
ZS5nLiwgPGFzbS9zdHJpbmdfNjQuaD4uDQo+IA0KPiBUaGlzIGNhbiBiZSBhZGRyZXNzZWQg
d2l0aCAnI2lmbmRlZiBfU0VUVVAnIChkZWZpbmVkIGJ5ICdib290L01ha2VmaWxlJykuDQo+
IA0KPiAyKSAnYm9vdC9zdHJpbmcuYycgaXMgaW5jbHVkZWQgYnkgJ2Jvb3QvY29tcHJlc3Nl
ZC9zdHJpbmcuYycgd2hpY2ggaXMNCj4gdGhlIHNvdXJjZSBvZiAncHVyZ2F0b3J5L3N0cmlu
Zy5vJywgbGlua2VkIGJ5ICdwdXJnYXRvcnkvcHVyZ2F0b3J5LnJvJw0KPiAoQ09ORklHX0tF
WEVDX0ZJTEUpLg0KPiANCj4gSW4gNjRCSVQsIDxhc20vc3RyaW5nLmg+IGluY2x1ZGVzIDxh
c20vc3RyaW5nXzY0Lmg+LCB3aGljaCByZWZlcmVuY2VzDQo+IF9fbWVtc2V0KCkgYW5kIF9f
bWVtbW92ZSgpIHdpdGggS0NGSV9SRUZFUkVOQ0UoKSwgaWUsIF9fQUREUkVTU0FCTEUoKTsN
Cj4gaG93ZXZlciwgJ3B1cmdhdG9yeS9wdXJnYXRvcnkucm8nIGlzIG5vdCBsaW5rZWQgd2l0
aCBpbXBsZW1lbnRhdGlvbnMuDQo+IA0KPiBTbywgQ09ORklHX0tFWEVDX0ZJTEUgYW5kIENP
TkZJR19DRkkgd2l0aG91dCBDT05GSUdfS0FTQU4gaGl0IGVycm9yczoNCj4gDQo+ICAgID4+
IGxkLmxsZDogZXJyb3I6IHVuZGVmaW5lZCBzeW1ib2w6IF9fbWVtc2V0DQo+ICAgICAgID4+
PiByZWZlcmVuY2VkIGJ5IHN0cmluZy5jDQo+ICAgICAgID4+PiAgICAgICAgICAgICAgIGFy
Y2gveDg2L3B1cmdhdG9yeS9wdXJnYXRvcnkucm86XA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAoX19VTklRVUVfSURfYWRkcmVzc2FibGVfX19tZW1zZXRfMCkNCj4gICAgLS0NCj4g
ICAgPj4gbGQubGxkOiBlcnJvcjogdW5kZWZpbmVkIHN5bWJvbDogX19tZW1tb3ZlDQo+ICAg
ICAgID4+PiByZWZlcmVuY2VkIGJ5IHN0cmluZy5jDQo+ICAgICAgID4+PiAgICAgICAgICAg
ICAgIGFyY2gveDg2L3B1cmdhdG9yeS9wdXJnYXRvcnkucm86XA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAoX19VTklRVUVfSURfYWRkcmVzc2FibGVfX19tZW1tb3ZlXzEpDQo+IA0K
PiAoTm90ZTogdGhpcyBpcyBub3QgaGl0IHdpdGggQ09ORklHX0tBU0FOIGJlY2F1c2UgJ2Jv
b3QvY29tcHJlc3NlZC9zdHJpbmcuYycNCj4gYWRkcyBhbGlhc2VzIF9fbWVtc2V0KCkvX19t
ZW1tb3ZlKCkgdG8gbWVtc2V0KCkvbWVtbW92ZSgpIGluIHRoYXQgY2FzZS4pDQo+IA0KPiBU
aGlzIGNhbiBiZSBhZGRyZXNzZWQgd2l0aCAnQ0ZMQUdTX3N0cmluZy5vIDo9IC1EX19ESVNB
QkxFX0VYUE9SVFMnIHNvIHRvDQo+IGRpc2FibGUgS0NGSV9SRUZFUkVOQ0UoKSBpbiAncHVy
Z2F0b3J5L01ha2VmaWxlJyAoaXQgcmVtb3ZlcyBDQ19GTEFHU19DRkkNCj4gYW55d2F5KS4N
Cj4gDQo+IC4uLg0KPiANCj4gSG93ZXZlciwgc2luY2UgYSBjaGFuZ2UgaW4gdGhpcyBzZXJp
ZXMgd291bGQgbmVlZCBtb3JlIGNoYW5nZXMgdG8gYWRkcmVzcw0KPiBlcnJvcnMgaXQgY2F1
c2VzLCBpdCBpcyByZWFzb25hYmxlIHRvIGNoYW5nZSB0aGUgc2VyaWVzIG5vdCB0byBjYXVz
ZSB0aGVtLA0KPiBieSB1c2luZyBhIHNlcGFyYXRlIGhlYWRlciB3aXRoIF9qdXN0XyBpbmxp
bmUgc3RyaW5nIGZ1bmN0aW9ucy4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4NCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9vZS1rYnVpbGQtYWxsLzIwMjYwNTE0MDkyMi5xN0lsVXY3by1sa3BAaW50ZWwuY29tLw0K
PiBTaWduZWQtb2ZmLWJ5OiBNYXVyaWNpbyBGYXJpYSBkZSBPbGl2ZWlyYSA8bWZvQGlnYWxp
YS5jb20+DQoNCldpdGggKGF0IGxlYXN0KSBteSBmaXJzdCByZW1hcmsgYWRkcmVzc2VkOg0K
DQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1
ZXJnZW4NCg==
--------------xLcLPnETSHv627VKGGo8W0Cg
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xLcLPnETSHv627VKGGo8W0Cg--

--------------G04jG51tG4wXBZwiRrrI7T7Y--

--------------mhJR1jnrYbl28dTfrgzwtzfE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmoVbTIFAwAAAAAACgkQsN6d1ii/Ey/y
Zgf5ATlUGhA4A6bzI1paPnuf1yy/kyhy0R/RePLpm/7L3xAjB6sasDf7YbW3PzTN9F0xuCkQURzF
IDPOKTnxOJR+VSBLofuexkFkXYzHh5QpXw7P2MP2jtKPUU2vRYbHPxTjW/3QumwUjub4yAC8H4bn
dkskA71G2S5bNiBCVBX7y0N2cbP5/TlXndT8eQolFASfJs8cuzS6M4DMACDLqy/YXfUtlw9jG9ZG
0RsWK2m5oav98vG0dNB47PE3iaWWxQq69Gw34s/CAPffSixk8IvZzmxP2QZg6jLoINJ0KwtRfzC/
7n/juipr++EDKTd87g/89+LfF985RkF+MQkXs6f61g==
=1xpJ
-----END PGP SIGNATURE-----

--------------mhJR1jnrYbl28dTfrgzwtzfE--

