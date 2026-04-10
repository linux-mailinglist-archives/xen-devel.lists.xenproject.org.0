Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAevHSEV2Wm7lwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:20:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B750B3D920C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279306.1563800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDdz-000824-A5; Fri, 10 Apr 2026 15:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279306.1563800; Fri, 10 Apr 2026 15:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDdz-00080P-6K; Fri, 10 Apr 2026 15:19:39 +0000
Received: by outflank-mailman (input) for mailman id 1279306;
 Fri, 10 Apr 2026 15:19:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wBDdw-00080D-RO
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:19:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBDdw-00DLbO-7I
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:19:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69d914f5-2eae-0a2a0a5409dd-0a2a4508a860-30
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:19:36 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jgross@suse.com>)
 id 69d91507-fab6-0a2a45080019-d1558029cdb3-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:19:36 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso23188255e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:19:36 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d531f229sm109721765e9.3.2026.04.10.08.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 08:19:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1775834375; x=1776439175; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/a0Bl0+zer2HheR2JzE8quq1PQz0zduAtvU5Ar8MgWQ=;
        b=fTUbzC3iX4BrpILou3F43YqmCCZUecbTI3hvD6lnWPPjrkzk3W3dDLcs5BzQ2vFEws
         JyDUosbMWs5invBqw3B5gmjcbABkVLK2qeYro7RT40GKfo5zR6pjpp/s/NX8DnB45Djo
         TtjY5reR1TItuheRXa6PfSCFvSDG7pKozCnXUlgLmm2AgFoUkBVackWWEFs4f4TBj0WV
         Tqz0QtRctpzlGvyc8moYEro0OTYV13Z+8CjUm560T6Aa6R/JfeyfmGnc9jHlCQxMAc/4
         DB1NEUseU3QtLbu51pp6MN05l1G1Cr8/vzbvTDibGurb68I7w4Xu+iXKfzHr34UxDYBa
         ML0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775834375; x=1776439175;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/a0Bl0+zer2HheR2JzE8quq1PQz0zduAtvU5Ar8MgWQ=;
        b=pS0w6mJkCWUQSi3jHxrZByqADH/2q7OUPCXa0G4dYOrDKUrHM/1GmANsJhJaEjDKsi
         4ezd8HtyLYt9/XcO+Suf1+WP6ghuvk/RLPkoCq4qMli9tKhnpeG4Q5fLYrnXT6qiemip
         3GFebkvYZeMAzKXSkSAgJYsqK/fqH6AY/glmpsWUGI/ZF0dL13kiw6WkoOP4ae2Ugqki
         FQkNt5GWf6mmYXMYihKdFwHOvEKzs3LTeSed++vKj6TEFzlFmosjcx2YGGWEoSxCiXvW
         DoJi7Sa0sSczKdB7fM8Sap60fRd+WRP0AQyFv1SCAWCQdAs9rXfS+7Drlk4HRB/PFDHr
         yFlg==
X-Forwarded-Encrypted: i=1; AJvYcCXjGQ0wJxVJgDbaS1OSroDdDHnLUT4vUEYHwoSt/u+l9ZLr9BqYlkyNc7HZCGlZQuI/X+Li534klGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqDmE1ntfjaH15W/mpVLHSWcIpy4JqvaO0ml1e2IyNBwyzQQJg
	CpMDkYqRnm+gKxo2E60kegycP69K6JzmjO+dNul+gnM4J0e7/84ig6Chr37RNvEHkNY=
X-Gm-Gg: AeBDiesPQLJ8qo2FTfiDcHJIQJet/72eaUWJ7IHv1t9IJYOUqF4tPqEWgWocyGTb4vq
	2gna3ZLiPrSAJpE134o9bvSYWjSHYGHHel9jsAJajvsKP3wPoofzNxbto79eWuBi5ZBzLerJW/+
	dLTMc9iqjdtuEBACAUH/CTgBKKhjNZ6KRkydnRErqTrXqHcS9RBm6bQ/i5HpR0UeUZpOsvIFyVI
	8m5Enjhi7OjtV+hJzo1pWYRiPFJPaH0CGiKOFkCf3J/VpYigM+thIGvhASoT012UtEx7zNYrbXe
	gjqCFmBZQY71xdgLcvBNfVBYewaS9ciPNgYl7PFqTX3TYdnhS8MRcRlcAaHWmlSDgGTu8pIHwDs
	qlsWNdWco2KbyQMA+Y2iSASPLAzxgpfeyVVBqsXubXnQ3H6GRvdehCiiC1KAtrXiviNkd0NoxKR
	X+oXmompGxwK5JPNYyhYVdtEWhI2QGhIEb1cSdpNDRaRmC3oWXj4W5X+4FzmkhjNH4U5MxLtcCI
	6ffdEfZpgs4bWYsbSTysPoamd1uhC22kUd5FcbGu8puI2XrxquVmg==
X-Received: by 2002:a05:600c:871a:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488d67f0b8fmr47492705e9.9.1775834375391;
        Fri, 10 Apr 2026 08:19:35 -0700 (PDT)
Message-ID: <ac3e1b58-3f81-406d-824d-4cdae7c7a76c@suse.com>
Date: Fri, 10 Apr 2026 17:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
 <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
 <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
 <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>
 <ff983469-db32-46fb-a18a-aed3cda06209@suse.com>
 <ad43c0a3-a0bc-4943-b617-83200ac91ccc@epam.com>
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
In-Reply-To: <ad43c0a3-a0bc-4943-b617-83200ac91ccc@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WRoAP1gvq8CcDShwNVvfAsI3"
X-purgate-ID: tlsNG-c1860d/1775834376-76350497-3A3554C2/0/0
X-purgate-type: clean
X-purgate-size: 8787
X-Spamd-Result: default: False [-2.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii_moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
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
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B750B3D920C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WRoAP1gvq8CcDShwNVvfAsI3
Content-Type: multipart/mixed; boundary="------------uPUMaKxhkCeEy0PJUEOYG2r6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <ac3e1b58-3f81-406d-824d-4cdae7c7a76c@suse.com>
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
 <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
 <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
 <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>
 <ff983469-db32-46fb-a18a-aed3cda06209@suse.com>
 <ad43c0a3-a0bc-4943-b617-83200ac91ccc@epam.com>
In-Reply-To: <ad43c0a3-a0bc-4943-b617-83200ac91ccc@epam.com>

--------------uPUMaKxhkCeEy0PJUEOYG2r6
Content-Type: multipart/mixed; boundary="------------3Z0Bw1l2baHeIDOAtzdwlHtX"

--------------3Z0Bw1l2baHeIDOAtzdwlHtX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDQuMjYgMTc6MTIsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiANCj4gT24g
MTAvMDQvMjAyNiAxNToxNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDEwLjA0LjI2
IDE0OjEzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIDEwLjA0LjI2IDE0OjA0LCBP
bGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+Pj4gSGkgSnVlcmdlbiwNCj4+Pj4NCj4+Pj4g
RHVyaW5nIG91ciBzYWZldHkgY2VydGlmaWNhdGlvbiBhbmFseXNpcyB3b3JrLCB3ZSBpZGVu
dGlmaWVkIHRoaXMgYXMgYSANCj4+Pj4gcG90ZW50aWFsDQo+Pj4+IGlzc3VlLiBXaGlsZSB3
ZSBoYXZlbid0IGVuY291bnRlcmVkIHRoaXMgcHJvYmxlbSBpbiBwcmFjdGljZSB5ZXQsIGl0
IGNvdWxkIA0KPj4+PiBvY2N1cg0KPj4+PiBpbiB0aGUgZnV0dXJlLCBzbyBJIGJlbGlldmUg
aXQgc2hvdWxkIGJlIGFkZHJlc3NlZCBwcm9hY3RpdmVseS4NCj4+Pg0KPj4+IEZvciBiZWlu
ZyBhYmxlIHRvIG9jY3VyIGluIGZ1dHVyZSwgdGhlIGhhbmRsaW5nIG9mIHJlbW92aW5nIGEg
Y3B1IGZyb20gYQ0KPj4+IGNwdXBvb2wgd291bGQgbmVlZCB0byBiZSBjaGFuZ2VkLiBDb25z
aWRlcmluZyB0aGUgcmVmdXNhbCB0byByZW1vdmUgdGhlDQo+Pj4gbGFzdCBjcHUgZnJvbSBh
IHBvcHVsYXRlZCBjcHVwb29sIGlzIG9uIHB1cnBvc2UgKHRoaXMgYXZvaWRzIGxlYXZpbmcg
YQ0KPj4+IGRvbWFpbiB3aXRob3V0IGFueSBjcHUgdG8gcnVuIG9uKSwgYWRkaW5nIHRoZSBj
b2RlIGFzIHlvdSBzdWdnZXN0IHdvdWxkDQo+Pj4ganVzdCBiZSBhbiBhZGRpdGlvbiB3aXRo
b3V0IGFueSBiZW5lZml0Lg0KPj4+DQo+Pj4gSXQgaXNuJ3QgZG9pbmcgYW55IGhhcm0gKG90
aGVyIHRoYW4gYWRkaW5nIGNvZGUgd2l0aG91dCBwdXJwb3NlKSwgc28gSQ0KPj4+IHdvbid0
IGV4cGxpY2l0bHkgTkFLIHRoZSBwYXRjaCwgYnV0IEkgd29uJ3QgQWNrIGl0IGVpdGhlci4N
Cj4+DQo+PiBPbmUgZnVydGhlciByZW1hcms6IEkgd291bGQgYWNrIHRoZSBhZGRpdGlvbiBv
ZiBhbiBBU1NFUlQobGlzdF9lbXB0eShyZXBscSkpDQo+PiBpbnN0ZWFkIG9mIHRoZSBjb25k
aXRpb25hbCBzZXRfdGltZXIoKSBjYWxsLg0KPj4NCj4gWW91J3JlIHJpZ2h0OiB3aXRoIHRo
ZSBjdXJyZW50IGNwdXBvb2wgc2VtYW50aWNzLCB3aGVuIHRoZSB0aW1lciBpcyByZS0gDQo+
IGluaXRpYWxpemVkIGluIHRoaXMgcGF0aCwgcmVwbHEgaXMgZXhwZWN0ZWQgdG8gYmUgZW1w
dHkuIEluIHRoYXQgY2FzZSB0aGVyZSBpcyANCj4gbm90aGluZyB0byByZS1hcm0sIGFuZCB0
aGUgdGltZXIgY2FuIGJlIHByb2dyYW1tZWQgbGF0ZXIgd2hlbiBhIG5ldyANCj4gcmVwbGVu
aXNobWVudCBldmVudCBpcyBxdWV1ZWQuDQo+IA0KPiBOb3cgSSBzZWUgdGhhdCBpdCB3b3Vs
ZCBwcm9iYWJseSBiZSBiZXR0ZXIgdG8gdXBkYXRlIHRoZSBjcHVwb29sIGxvZ2ljIHRvIA0K
PiBwcm9oaWJpdCByZW1vdmluZyB0aGUgbGFzdCBwQ1BVIGZyb20gYSBjcHVwb29sLiBJbiB0
aGF0IGNhc2UsIHRoaXMgZml4IOKAlCBldmVuIA0KPiB3aXRoIHRoZSBBU1NFUlQg4oCUIHNl
ZW1zIHRvIGJlIG5vIGxvbmdlciByZWxldmFudC4NCj4gDQo+IEkgdGhpbmsgSSdkIHJhdGhl
ciBwb3N0IGFuIHVwZGF0ZSBmb3IgdGhlIGNwdXBvb2wgc2VtYW50aWNzIGFuZCBkcm9wIHRo
aXMgcGF0Y2guIA0KPiBPciBJIGNhbiBzZW5kIGEgdjMgd2l0aCB0aGUgQVNTRVJUIGlmIHlv
dSB0aGluayB0aGF0IGlzIHN0aWxsIHJlYXNvbmFibGUuDQoNClRoZSBjcHVwb29sIHNlbWFu
dGljcyBhcmUgYWxyZWFkeSBleGlzdGluZy4gSSBoYXZlIHdyaXR0ZW4gaXQgdGhpcyB3YXkg
d2hlbiBJDQppbnRyb2R1Y2VkIGNwdXBvb2xzLg0KDQoNCkp1ZXJnZW4NCg==
--------------3Z0Bw1l2baHeIDOAtzdwlHtX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------3Z0Bw1l2baHeIDOAtzdwlHtX--

--------------uPUMaKxhkCeEy0PJUEOYG2r6--

--------------WRoAP1gvq8CcDShwNVvfAsI3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnZFQYFAwAAAAAACgkQsN6d1ii/Ey9G
swf/Z10r4UGFu04AWBsmF/wgKwxBR/tFi4t/9wQiaxaDaPSoRURJpQMjVf6/b2Mb4uuawn9qD+A4
+kbnyPhcikwQzD+iTqblnIFgd7GqRD7gTt2nMz3zTp+FhZRyjHRVMVsZvx5oLmndYitET5WObXXK
o1R5lbTB1AWfPVzo1r4xAA9DZF1XDln+WUQevn4fAyhkuEFLrGEBfnim0uLhLzSjJuMRMjBZe2NX
iV24dzIPJtSZxCdz6DJDQHdcBQoSjgWlS5lTSt4mSZ3Rl6joOS637jHj4y0cz1FuNh/CeLxR7frX
nsi/Ln2gISDrF1HqvIwJZpAZDEiQTdbZYcvIK1W8OA==
=kNoT
-----END PGP SIGNATURE-----

--------------WRoAP1gvq8CcDShwNVvfAsI3--

