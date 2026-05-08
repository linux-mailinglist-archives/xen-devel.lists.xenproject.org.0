Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BXsEhOg/WmwgQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 10:34:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884B24F3C14
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 10:34:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303288.1576747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLGej-0001eB-Nt; Fri, 08 May 2026 08:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303288.1576747; Fri, 08 May 2026 08:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLGej-0001bO-L7; Fri, 08 May 2026 08:33:57 +0000
Received: by outflank-mailman (input) for mailman id 1303288;
 Fri, 08 May 2026 08:33:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wLGeh-0001bI-Ri
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 08:33:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLGeh-00FZCC-3Y
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 10:33:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69fd9fe4-bab6-0a2a0a5309dd-0a2a4508e796-40
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 10:33:54 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69fd9ff2-63b5-0a2a45080019-d155d02cb05c-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 10:33:54 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-67389cf78b0so3174707a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 01:33:54 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac484dd7bsm47705566b.60.2026.05.08.01.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 01:33:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1778229234; x=1778834034; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i8pa6nW6L+PoRyM5QGx30dORKj2RFf8dclDZUh9rUiM=;
        b=dByTYzSuLEK/Y+7o2AFdAcSNrlbDnhQxCQNbvwYNbRvrpxtevUrhz2WeWVbSFbZ/3h
         +AQBWZBbsVghl+5Gi8ENJEhjUXWWFHWKiQqZrxKHZsC9Pxuo8/Tcr5MBDJ/OXPuzTEFd
         ffR2QQiN5tIi5lOT9pwy24GpKZ5A8ZsRKUtn1gAlq7oz0oyJjeO8um3TlcUqTBl0QnWf
         PtOH6dyBL2wtIz6FIwD9rc2KBCROscqzrsudkGUXXX1SwiTHY59z4sHa6hbZjG+mdp4M
         73YsgNFLfJm7oYzCGdNt9qyaiOehvi9tpCwd2KRRyB8kzk1rinLH0h9TADDZjQ3uIqan
         Bp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229234; x=1778834034;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8pa6nW6L+PoRyM5QGx30dORKj2RFf8dclDZUh9rUiM=;
        b=oLSLsPT3zS/tBfPu2EPg2NaOvulo0uVQD/dKjiv7NZ2vhdenzC1CvIvBQgmyXdGqr0
         WiXyzwgdmEWTPDX5lIkWVI5s3RB1NwMSiyrpQ3btUZFr167x4pOmaXqF7jevE4auETfs
         fNImMHGWdVoUh1pbtpZxJU9ymlLxDp3rCCH0v7CTSXRRxfBFqp5myQbWUs99u6VzSod3
         Iwg72E1vVr1099yS0QzA1yQjauCD1EUBTP8gI5tFPF/BYDh08GepRHictlTCorfTLXY1
         7/cwA+1HK2RvgG3taUl0bpqBqaU0a8P4Ek9WjpjMB/w7B2ZvzFc3mpADyiF6p1siQxxj
         ON9A==
X-Forwarded-Encrypted: i=1; AFNElJ+aAX8kHegxCJP6SGk0cDxqSEi3g2D7S9zHCtiQJcWqOkS6c9NwVuwarp9Z+c/0v0M1JcwX6fRux1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyyj0p/LWgi/axKitxf/CS1fFG7JRFB7Q2uhi/Gu5U3FiVy9B7W
	k55pyoJPcAJiduTa5wxDDC3VwM2XBcBKVXzfAlyROP0QoCVyA30neImC5LwksfMqQNk=
X-Gm-Gg: AeBDietLJhkBKpCD2d8/LebJCnLPD+LmpxrSBKU2dTqZM41ZWsYUTQ/5S4zh1AvM43m
	9vfguC32nRmy1yOhAjWQc8pD4GTdGNtS6HiiIRk3emhdMAjVBNzJD9Cg9fDx4OvLWNyMH96Atxk
	KF3/iaxOiu8sWpvtF9TqNLAMkpq6UlCnElIuYEvZFhYGGxpQBZPQ1bfjlaHV3HORVwNhWsSQwIU
	V306wN2Kglwr21/p2GzvTNcieZy2idY4Y9M7xD2x1bLvA6nmd0na7cMCFAl6wpvZCZuy5gaOxV4
	c3wUCvMkPq+5M7W4ZmuGbPh19TiFvMKcpLPI+cjb1z7lfnPIw/PZP6O1XYz6m9o92OhpdN0zjiM
	JKFxk9jfIp91Nl6ZbzKfg+U2pQf96qY9lGnOkZE0IB5AGLNF3iJOG6JrkhJPzxDr6Kcqz7j9lgn
	e5mRcS5hg7FuYHtrLAHgSre3aPB5aHlkke9kchMaqLZ1vl0iIQJe3Juf1YYkUy4SEFJed6o/PpI
	Z4ukE3FOFdxUjPtNlrqsf7YWDrRItG0PWU+fkAaAk+WoSioJYEEAw==
X-Received: by 2002:a17:906:478e:b0:bc9:e1b1:8edf with SMTP id a640c23a62f3a-bcaaa54ce58mr100836066b.12.1778229234147;
        Fri, 08 May 2026 01:33:54 -0700 (PDT)
Message-ID: <5cb54bd1-5981-4a46-9083-f7b527ca342f@suse.com>
Date: Fri, 8 May 2026 10:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix lazy mmu handling across context switch
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
Cc: kevin.brodsky@arm.com, mmarek@invisiblethingslab.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, xen-devel@lists.xenproject.org
References: <20260508080514.454607-1-jgross@suse.com>
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
In-Reply-To: <20260508080514.454607-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3Jq2hVC2vaJmzLdycTi38fj0"
X-purgate-ID: tlsNG-c1860d/1778229234-B6B74DB1-1846446D/0/0
X-purgate-type: clean
X-purgate-size: 11414
X-Rspamd-Queue-Id: 884B24F3C14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kevin.brodsky@arm.com,m:mmarek@invisiblethingslab.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3Jq2hVC2vaJmzLdycTi38fj0
Content-Type: multipart/mixed; boundary="------------Vt7oWIJw8gIt0eyJaT1vcDAe";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
Cc: kevin.brodsky@arm.com, mmarek@invisiblethingslab.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <5cb54bd1-5981-4a46-9083-f7b527ca342f@suse.com>
Subject: Re: [PATCH] x86/xen: Fix lazy mmu handling across context switch
References: <20260508080514.454607-1-jgross@suse.com>
In-Reply-To: <20260508080514.454607-1-jgross@suse.com>

--------------Vt7oWIJw8gIt0eyJaT1vcDAe
Content-Type: multipart/mixed; boundary="------------oDEGK9VJWMWYbdXgkX7jaAvL"

--------------oDEGK9VJWMWYbdXgkX7jaAvL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGxlYXNlIGRpc3JlZ2FyZCB0aGlzIHBhdGNoLiBJdCBpc24ndCBmaXhpbmcgdGhlIHJlYWwg
cHJvYmxlbS4NCg0KT24gMDguMDUuMjYgMTA6MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+
IFRoZSByZWNlbnQgcmV3b3JrIG9mIG1tdSBsYXp5IG1vZGUgaGFzIHJlc3VsdGVkIGluIHBy
b2JsZW1zIHdoZW4NCj4gcnVubmluZyBhcyBhIFhlbiBQViBndWVzdC4gRW5hYmxpbmcgbGF6
eSBtbXUgbW9kZSBmb3IgdGhlIG5ldyBjb250ZXh0DQo+IGR1cmluZyBjb250ZXh0IHN3aXRj
aCBpcyBkb25lIGZyb20gdGhlIGFyY2hfZW5kX2NvbnRleHRfc3dpdGNoKCkgaG9vaywNCj4g
YnV0IHdoZW4gY2FsbGluZyB0aGlzIGhvb2sgY3VycmVudCBoYXNuJ3QgYmVlbiBjaGFuZ2Vk
IHlldCwgc28gdGhlDQo+IGxhenkgbW11IG1vZGUgc3RhdGUgb2YgdGhlIHdyb25nIHRhc2sg
aXMgbW9kaWZpZWQuDQo+IA0KPiBBZGRpdGlvbmFsbHkgaXQgaXMgbXVjaCBjbGVhbmVyIHRv
IHVzZSBsYXp5X21tdV9tb2RlX3BhdXNlKCkgYW5kDQo+IGxhenlfbW11X21vZGVfcmVzdW1l
KCkgaW4gdGhlIFhlbiBjb250ZXh0IHN3aXRjaCBob29rcywgYXMgaXQgYXZvaWRzDQo+IGNv
bmRpdGlvbmFscyBpbiB0aG9zZSBob29rcy4NCj4gDQo+IEluIG9yZGVyIG5vdCBoYXZpbmcg
dG8gYWRkIGFub3RoZXIgaG9vayB0byBiZSBjYWxsZWQgYWZ0ZXIgc3dpdGNoaW5nDQo+IGN1
cnJlbnQsIG1vZGlmeSBsYXp5X21tdV9tb2RlX3Jlc3VtZSgpIHRvIHVzZSBhIG5ldyBzdWIt
ZnVuY3Rpb24gd2hpY2gNCj4gdGFrZXMgYSB0YXNrIHBvaW50ZXIgYXMgcGFyYW1ldGVyLiBU
aGlzIG5ldyBzdWItZnVuY3Rpb24gY2FuIHRoZW4gYmUNCj4gdXNlZCBpbiB0aGUgeGVuX2Vu
ZF9jb250ZXh0X3N3aXRjaCgpIGhvb2suDQo+IA0KPiBGaXhlczogMjkxYjNhYmVkNjU3ICgi
eDg2L3hlbjogdXNlIGxhenlfbW11X3N0YXRlIHdoZW4gY29udGV4dC1zd2l0Y2hpbmciKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IC0t
LQ0KPiAgIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyB8ICA3ICsrLS0tLS0NCj4gICBp
bmNsdWRlL2xpbnV4L3BndGFibGUuaCAgICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0
ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYw0KPiBpbmRleCBlZDJkN2Ez
NzU2Y2UuLjY3YmI2YmY2ZDI0MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYveGVuL2VubGln
aHRlbl9wdi5jDQo+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYw0KPiBAQCAt
NDI0LDkgKzQyNCw3IEBAIHN0YXRpYyB2b2lkIHhlbl9zdGFydF9jb250ZXh0X3N3aXRjaChz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnByZXYpDQo+ICAgew0KPiAgIAlCVUdfT04ocHJlZW1wdGli
bGUoKSk7DQo+ICAgDQo+IC0JaWYgKHRoaXNfY3B1X3JlYWQoeGVuX2xhenlfbW9kZSkgPT0g
WEVOX0xBWllfTU1VKSB7DQo+IC0JCWFyY2hfbGVhdmVfbGF6eV9tbXVfbW9kZSgpOw0KPiAt
CX0NCj4gKwlsYXp5X21tdV9tb2RlX3BhdXNlKCk7DQo+ICAgCWVudGVyX2xhenkoWEVOX0xB
WllfQ1BVKTsNCj4gICB9DQo+ICAgDQo+IEBAIC00MzYsOCArNDM0LDcgQEAgc3RhdGljIHZv
aWQgeGVuX2VuZF9jb250ZXh0X3N3aXRjaChzdHJ1Y3QgdGFza19zdHJ1Y3QgKm5leHQpDQo+
ICAgDQo+ICAgCXhlbl9tY19mbHVzaCgpOw0KPiAgIAlsZWF2ZV9sYXp5KFhFTl9MQVpZX0NQ
VSk7DQo+IC0JaWYgKF9fdGFza19sYXp5X21tdV9tb2RlX2FjdGl2ZShuZXh0KSkNCj4gLQkJ
YXJjaF9lbnRlcl9sYXp5X21tdV9tb2RlKCk7DQo+ICsJbGF6eV9tbXVfbW9kZV9yZXN1bWVf
dGFzayhuZXh0KTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgeGVu
X3N0b3JlX3RyKHZvaWQpDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BndGFibGUu
aCBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oDQo+IGluZGV4IGNkZDY4ZWQzYWUxYS4uODNh
MDk5YmYyMDM4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BndGFibGUuaA0KPiAr
KysgYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaA0KPiBAQCAtMzI2LDYgKzMyNiwyOCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgbGF6eV9tbXVfbW9kZV9wYXVzZSh2b2lkKQ0KPiAgIAkJYXJj
aF9sZWF2ZV9sYXp5X21tdV9tb2RlKCk7DQo+ICAgfQ0KPiAgIA0KPiArLyoqDQo+ICsgKiBs
YXp5X21tdV9tb2RlX3Jlc3VtZV90YXNrKCkgLSBSZXN1bWUgdGhlIGxhenkgTU1VIG1vZGUg
Zm9yIGEgc3BlY2lmaWMgdGFzay4NCj4gKyAqDQo+ICsgKiBMaWtlIGxhenlfbW11X21vZGVf
cmVzdW1lKCkgYmVsb3csIGJ1dCB3aXRoIGEgdGFzayBzcGVjaWZpZWQuDQo+ICsgKiBNdXN0
IGJlIGNhbGxlZCBvbmx5IGJ5IGxhenlfbW11X21vZGVfcmVzdW1lKCkgb3IgZHVyaW5nIGNv
bnRleHQgc3dpdGNoLg0KPiArICogTXVzdCBuZXZlciBiZSBjYWxsZWQgaW4gaW50ZXJydXB0
IGNvbnRleHQuDQo+ICsgKg0KPiArICogTXVzdCBtYXRjaCBhIGNhbGwgdG8gbGF6eV9tbXVf
bW9kZV9wYXVzZSgpLg0KPiArICoNCj4gKyAqIEhhcyBubyBlZmZlY3QgaWYgY2FsbGVkOg0K
PiArICogLSBXaGlsZSBwYXVzZWQgKGluc2lkZSBhbm90aGVyIHBhdXNlKCkvcmVzdW1lKCkg
cGFpcikNCj4gKyAqLw0KPiArc3RhdGljIGlubGluZSB2b2lkIGxhenlfbW11X21vZGVfcmVz
dW1lX3Rhc2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQ0KPiArew0KPiArCXN0cnVjdCBs
YXp5X21tdV9zdGF0ZSAqc3RhdGUgPSAmdGFzay0+bGF6eV9tbXVfc3RhdGU7DQo+ICsNCj4g
KwlWTV9XQVJOX09OX09OQ0Uoc3RhdGUtPnBhdXNlX2NvdW50ID09IDApOw0KPiArDQo+ICsJ
aWYgKC0tc3RhdGUtPnBhdXNlX2NvdW50ID09IDAgJiYgc3RhdGUtPmVuYWJsZV9jb3VudCA+
IDApDQo+ICsJCWFyY2hfZW50ZXJfbGF6eV9tbXVfbW9kZSgpOw0KPiArfQ0KPiArDQo+ICAg
LyoqDQo+ICAgICogbGF6eV9tbXVfbW9kZV9yZXN1bWUoKSAtIFJlc3VtZSB0aGUgbGF6eSBN
TVUgbW9kZS4NCj4gICAgKg0KPiBAQCAtMzQxLDE1ICszNjMsOCBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgbGF6eV9tbXVfbW9kZV9wYXVzZSh2b2lkKQ0KPiAgICAqLw0KPiAgIHN0YXRpYyBp
bmxpbmUgdm9pZCBsYXp5X21tdV9tb2RlX3Jlc3VtZSh2b2lkKQ0KPiAgIHsNCj4gLQlzdHJ1
Y3QgbGF6eV9tbXVfc3RhdGUgKnN0YXRlID0gJmN1cnJlbnQtPmxhenlfbW11X3N0YXRlOw0K
PiAtDQo+IC0JaWYgKGluX2ludGVycnVwdCgpKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gLQlW
TV9XQVJOX09OX09OQ0Uoc3RhdGUtPnBhdXNlX2NvdW50ID09IDApOw0KPiAtDQo+IC0JaWYg
KC0tc3RhdGUtPnBhdXNlX2NvdW50ID09IDAgJiYgc3RhdGUtPmVuYWJsZV9jb3VudCA+IDAp
DQo+IC0JCWFyY2hfZW50ZXJfbGF6eV9tbXVfbW9kZSgpOw0KPiArCWlmICghaW5faW50ZXJy
dXB0KCkpDQo+ICsJCWxhenlfbW11X21vZGVfcmVzdW1lX3Rhc2soY3VycmVudCk7DQo+ICAg
fQ0KPiAgICNlbHNlDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGxhenlfbW11X21vZGVfZW5h
YmxlKHZvaWQpIHt9DQoNCg==
--------------oDEGK9VJWMWYbdXgkX7jaAvL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------oDEGK9VJWMWYbdXgkX7jaAvL--

--------------Vt7oWIJw8gIt0eyJaT1vcDAe--

--------------3Jq2hVC2vaJmzLdycTi38fj0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn9n/EFAwAAAAAACgkQsN6d1ii/Ey/x
6gf+J/AVbxjJD4ti6UuIJFneskf3CRILQ7wRPiAmpCYPrfNgX1dIMcFi+mCI5dGoqjvb5KsqVCe5
F1gpJ5cPOudh5Ky0nAlR+Hv0e9nRzDs6nZdGh/mDQRRU8AN10C+du3mUAwldWGa3jaSbkegh8Ywp
2KKF/PN6Uy+zPKM1X9cPH2pXYoGFAkKxxUGPtJQtUumnACJtMhYTgEMHj3ysMO7PZicHMNqrFlb3
odeXUh7Uy80Z/rGBpuE/b5jsKYefVvpnGDxphAoJX6C/xTGSIe0eoi3XUThtIuuSkauRGLB4zCA1
02WVdKpLS27gtabxdsUth7kNBliUDHHTtfm9ptRaeg==
=Xx43
-----END PGP SIGNATURE-----

--------------3Jq2hVC2vaJmzLdycTi38fj0--

