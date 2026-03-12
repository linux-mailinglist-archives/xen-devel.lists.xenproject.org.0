Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDHxOB3lsmktQwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:09:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B972753B9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252690.1549292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iaY-00081Z-Ho; Thu, 12 Mar 2026 16:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252690.1549292; Thu, 12 Mar 2026 16:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iaY-0007zS-Eb; Thu, 12 Mar 2026 16:08:42 +0000
Received: by outflank-mailman (input) for mailman id 1252690;
 Thu, 12 Mar 2026 16:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iaX-0007zM-Ct
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:08:41 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbea4dea-1e2d-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 17:08:40 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b9382e59c0eso192883466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:08:40 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b972e14ab67sm141547666b.44.2026.03.12.09.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:08:38 -0700 (PDT)
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
X-Inumbo-ID: bbea4dea-1e2d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773331719; x=1773936519; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0WdEqqlF87tUnD1zgBx+Ug45tY1vEgZU7Vdh3Mx3GY=;
        b=ast/eHi10vlS/xsQSo+a2WPGmZKuA+v5c3JLWK4C2RWr66kG/fqA40vIM84wEZOeyc
         iBVDg1yqao0t0YuL94RB1b79R4IDx087OsY3KrBGAeDbztqeqNtFm8hbwhTBGzDDYq39
         QRZpFJosVT65Liyz408uonPPUIcLFQpjsYguE1gk0Nkh3o+ymm9nHJ1C7luNtVq6S8BT
         DceKD1DBOSG9gbkgaBi9Fyut+y4D01fXG8nEm3eMAZxae6teccIa+vSIZU88FcyWPlle
         69xp+k+vJOp/aC6bQkB5aMohbbKr8+10rW2NkG3fWUxbXlPEnspMBPkj126xb6oBgNO4
         erqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331719; x=1773936519;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0WdEqqlF87tUnD1zgBx+Ug45tY1vEgZU7Vdh3Mx3GY=;
        b=axZJUhIV7WNXHCP3UZpg19s0ZtEs7hmH/QjqR/4ctx8bgMa3f6kwAniH5ZfInx9Fnc
         zshkDiskBiWpK/6y5eQqyquI0DuMzMuRYa4IF58Rmtg9QZtgr0vz6m15e6NaMUffCBKN
         +Aojt9o2Q7fIV4dveMcKhkUZTNZOP//rg9hAZFIZaG8c1gT/TXu75sxjMBqF/59rkqln
         gl2V0itoJmZYJa7aGJUxYYR9wMp1rZU+DYl+9RKSTipzEBuxNvPO7679P6mxVhs4KKPK
         jAK3mHRl84djVPPbxOqJArmBhmAQbBNNVBHmhOZrBYejYG4HpiFkstOoKQKdS+40SHEA
         iAsw==
X-Forwarded-Encrypted: i=1; AJvYcCXwsFpu8dao42PDuzvsi2ZwR2IgpNCdr56DrMDg/eRhczVkhBJUGeru2bDJmWqDoBNAIbO8ZV7M6CE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjctwB4BTG7Qtln9sztnJfuYPgGf2cU1GWUB5i5zYL454tG+1u
	GLTMTkJvaoKQFiSF9YWUY5HWXQNpbz+Dv/NjGtdZI25HZ7QctQxtar95wlrMN1Gyzh+lY/LW50q
	d1rVh
X-Gm-Gg: ATEYQzwAGZWukQyLosrKKdkhzO/D++rsailjFtwnPUNrVq+RIqCbPKohiVkLn4/Uvxq
	85XiHEZKl6w4VWULpJWKD9U2bN0Hb1f9wxZgU6QX2eazAPv4bSUFjPd77K+wmPBS2cQ4tHpS7p/
	4Xl+NjDrKaw9YuFMkpWO0WmqQ/GmFrhNJbnjnVV/u3RMgdvbCzz/dvHjXZ3n9hGQYeKu7FSrKwb
	wyPUFl0MSpnmmdS2q+45ozW60fCXWr3lTJEwdr3bsSCDreAJ8ahNlcLzH/4kjOZqhS/9tjGjnsX
	IALEvAR4ryiG5BzH+mJwrRQ3Qv7MiUPLVT5meHzEm+ajJWAAyxtrsT8l1IbBHWBDNYQ/lCBgX7t
	By2dWsOy/vZtvVzBuOvhaYhO8GFo55yciJtqGNizihiFqibsSgr6yWdtU4W7pT9HJdiuIxtLrTe
	DQoULHeh8k3w2yeUzLRn0sk89mrXENUfnMKgNjIE02tIidLrYt72jscLrvgF7t1QkZOMRck7UGd
	HuGcK03P/Ot9Wb4idYeOVBupFF6xB1vtD2DCpFoPpxvzDPHmkrKIQ==
X-Received: by 2002:a17:907:1c16:b0:b87:7485:b4bf with SMTP id a640c23a62f3a-b9764b41327mr3198666b.0.1773331719210;
        Thu, 12 Mar 2026 09:08:39 -0700 (PDT)
Message-ID: <40510d6c-ad72-439b-93a3-1a61be45a0e8@suse.com>
Date: Thu, 12 Mar 2026 17:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] tools/xs-clients: add some man pages and fixes
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260312155102.2862824-1-jgross@suse.com>
 <5dc86501-dd23-494b-ad40-ee59aab3dabe@citrix.com>
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
In-Reply-To: <5dc86501-dd23-494b-ad40-ee59aab3dabe@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CdpBLASn0aGBPVGYLQM4bab1"
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 57B972753B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CdpBLASn0aGBPVGYLQM4bab1
Content-Type: multipart/mixed; boundary="------------oN2vc4gMI5LK6dwpney9izlX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <40510d6c-ad72-439b-93a3-1a61be45a0e8@suse.com>
Subject: Re: [PATCH v2 0/8] tools/xs-clients: add some man pages and fixes
References: <20260312155102.2862824-1-jgross@suse.com>
 <5dc86501-dd23-494b-ad40-ee59aab3dabe@citrix.com>
In-Reply-To: <5dc86501-dd23-494b-ad40-ee59aab3dabe@citrix.com>

--------------oN2vc4gMI5LK6dwpney9izlX
Content-Type: multipart/mixed; boundary="------------TddWtYRmd0n87FVkXqkIftJl"

--------------TddWtYRmd0n87FVkXqkIftJl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjYgMTc6MDIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEyLzAzLzIw
MjYgMzo1MCBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEp1ZXJnZW4gR3Jvc3MgKDgp
Og0KPj4gICAgZG9jczogYWRkIC1oIHBhcmFtZXRlciBkZXNjcmlwdGlvbiB0byB4ZW5zdG9y
ZS0qIG1hbiBwYWdlcw0KPj4gICAgZG9jczogYWRkIG1hbiBwYWdlIGZvciB4ZW5zdG9yZS1l
eGlzdHMNCj4+ICAgIGRvY3M6IGFkZCBtYW4gcGFnZSBmb3IgeGVuc3RvcmUtbGlzdA0KPj4g
ICAgZG9jczogYWRkIG1hbiBwYWdlIGZvciB4ZW5zdG9yZS1ybQ0KPj4gICAgZG9jczogYWRk
IG1hbiBwYWdlIGZvciB4ZW5zdG9yZS13YXRjaA0KPj4gICAgdG9vbHMveHMtY2xpZW50czog
ZG9uJ3QgZXhpdCB3aXRoIGVycm9yIHdoZW4gdXNpbmcgLWggcGFyYW1ldGVyDQo+PiAgICB0
b29scy94cy1jbGllbnRzOiBmaXggdXNhZ2UgaW5mb3JtYXRpb24gb2YgeGVuc3RvcmUtZXhp
c3RzDQo+PiAgICB0b29scy94cy1jbGllbnRzOiBmaXggb3V0cHV0IG9mICJ4ZW5zdG9yZS1s
aXN0IC1wIC8iDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCg0KVGhhbmtzLg0KDQo+IA0KPiBUd28gbWlub3IgY29tbWVu
dHMsIGJvdGggb2Ygd2hpY2ggSSBjYW4gZml4IG9uIGNvbW1pdCBpZiB5b3UncmUgaGFwcHk/
DQo+IChXaXRoIHRoZSBwYXRjaCA2IGtub2NrLW9uIHRvIHBhdGNoIDcpLg0KDQpZZXMsIHN1
cmUuDQoNCg0KSnVlcmdlbg0K
--------------TddWtYRmd0n87FVkXqkIftJl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------TddWtYRmd0n87FVkXqkIftJl--

--------------oN2vc4gMI5LK6dwpney9izlX--

--------------CdpBLASn0aGBPVGYLQM4bab1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmy5QYFAwAAAAAACgkQsN6d1ii/Ey+e
BQf/dPkvSfnBepbZiVw//HT2TDN9BiL7R8W+TycazhewwoNptr0v89hfQFeYnRsDFUlEDxDwSkq5
tjtHc6+1JSiiD5LNVSeLY7RsZTjm+5/2BBI0iAwhsm9duUr7BZj1/meI+fz9NnGx6uS4EdvOmI4Y
VpQgncsv6+Xa/EMKj+XIUsxHPMS4j12DJO3yMl67Kn4kmNsuBe50l5w5YTUKry3uOOLaWzLtJwUE
2Y3xforDcIHJJOxiidGbf/1R6Ejd2ntmuYJQ8vp+Mgx/BwEDNn34D0Yms4KQATHQ3o3WfI12RlaL
UxpyPN1HGLOvQ7cwJhF74VAfBuWgXVXs38Ft7ngWOg==
=GIMY
-----END PGP SIGNATURE-----

--------------CdpBLASn0aGBPVGYLQM4bab1--

