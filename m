Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHVRDCJ8gGnE8wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 11:27:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9DCAE49
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 11:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218512.1527264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmr9S-0000D2-Bi; Mon, 02 Feb 2026 10:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218512.1527264; Mon, 02 Feb 2026 10:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmr9S-00009j-7R; Mon, 02 Feb 2026 10:27:26 +0000
Received: by outflank-mailman (input) for mailman id 1218512;
 Mon, 02 Feb 2026 10:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yWnE=AG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vmr9Q-00008L-Qf
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 10:27:24 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c24a703e-0021-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 11:27:22 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-658ad86082dso7478058a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 02:27:22 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8de3d734aesm688456966b.7.2026.02.02.02.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 02:27:21 -0800 (PST)
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
X-Inumbo-ID: c24a703e-0021-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770028041; x=1770632841; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l+3o+MHKL82BTRKdVCIUQ3bcYUyRbNh1DNTmf0Cc978=;
        b=AjYOxELJ0BYHCIjUOWtI23FocD3XRk5WRP9kuecsueHin/93LOacQP7Z9H1h1+2kH2
         nLFRaEzqDFZNuGM0/naz56FLm9ZGZCyNx+lzwCKrjEUtpLiJQAt0q5+QNQAOZ4CuLGkG
         GuMgybjaFIm3FA+amXpAKABN8lIlp6GDZ5sdy+hsKRTGbB2Frqi9qZPuyGr3EiErs+cT
         m/vb5ERzOAm4CK6fPRfIK7kuor5wxfFgehn7/d9rX5EDCiLHo8yRAYCOrqTBRp70ae3W
         Uy4Gvu7xd0ARA7WPi/IhJdwLH7Z6afNXzA72wN9CiXpnN36zfOWmdbG7K0cJzYEtatt/
         OVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028041; x=1770632841;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+3o+MHKL82BTRKdVCIUQ3bcYUyRbNh1DNTmf0Cc978=;
        b=adRslhmwXCFrP4m7XHCiJpT9LCTTwb2qEWc0mhjxaeTeGapnp9egCXjCVIHIPM14Xb
         e8QJfhijSBoHIzlKTwkBiF+8A0/zNAfUgAHZ6XnXFcSGTEs6xpyfi3cOxCo43Ire+PFL
         irlGA0JoNLzEqUE+08Qdub60qNWW+TG6kp6Bqr0aorQWPOgWCZc3tdMiSA+w5FlRSTlS
         cJ9Q422MoxnpvNRwyL61lvtTZbQryodks3cjgFi/rIZTGNYdQNoHMO5V4Qd+w2fcGW99
         TTYP16rh6qfXFZf29Ak9s4MnEkROPdeCbbD6DAW3A55gwLhDoM2fOuwwJd+pnWKDOlQc
         jANA==
X-Forwarded-Encrypted: i=1; AJvYcCVSgvZp0tPJt7oMLBIxckwY7/vgwpW3JsYi8tXevTDUL4bN281j8dq3Uc3nptHvNjwZ/meifMlJBJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuhTIpvXAum6Mg0hxRy79SFoeyM4kjJOjeiPzSQmOYSGiyH6cC
	3j3km51+7mYBnoRcYBWk8RfmZtl6MbsZh42baGR/hWd8mbskZDM9SJFqq8DSTch2Hu0=
X-Gm-Gg: AZuq6aLshF5i7FmmRSNNlIQd1BWCjWyHUSD6YSfcTHpUekonlWC78O4Uj3FhX2xZRHY
	XhmdaeKW70RYO2X346oNXoU0NeXrvURqL4NIn+gPny8NzztpLjcmw4NtTBllf/nLdvJD89sJevQ
	4jFZoADYUp/+iuG4DvFqUxlee084IVnPLpebt01IRERWVn9Hct4xwa2nqM0cs1cYdop+S6GqXW0
	5jV/SDa8ZIgBv6kgkmRD/fYrE2Zjjl6CkVCzblm/gO4S/+7Gd4JXacFnOAuczmg/oc/Vdj1DfFz
	T7ZMHhMgg9jkq+Y1GUdOsBJhE8zV/34IZkyQPFmzAreqF0/vTuo1/EY8OR6r8/Dj/6Dj3D0SeEz
	OojEYmG/J/f6AwwQzO6K3UiURNIju/fobUhCYnUEjFWVa2tGMpCfCo6nGDjvsIXmXFPWOwCfLxv
	PgOhoECmyGeOEAGneWhBw+GLH35NBQCsICT+KfdGf1FnOD3BmFxmH/C37BGwVqyY//moGsTAphF
	ba9W9o746HZQG4Y/+Nrv5YEgCMg/Reg1A7rxg==
X-Received: by 2002:a17:906:d54e:b0:b87:6af7:c186 with SMTP id a640c23a62f3a-b8dff8674d3mr755283566b.54.1770028041362;
        Mon, 02 Feb 2026 02:27:21 -0800 (PST)
Message-ID: <0afb8dc5-6ab9-4f61-af3a-8424835386e4@suse.com>
Date: Mon, 2 Feb 2026 11:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] x86: Cleanups around slow_down_io()
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-block@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Denis Efremov <efremov@linux.com>,
 Jens Axboe <axboe@kernel.dk>
References: <20260119182632.596369-1-jgross@suse.com>
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
In-Reply-To: <20260119182632.596369-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EFFtuyAw2mxdAKPsAqPioBPH"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-block@vger.kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:boris.ostrovsky@oracle.com,m:xen-devel@lists.xenproject.org,m:efremov@linux.com,m:axboe@kernel.dk,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 95C9DCAE49
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EFFtuyAw2mxdAKPsAqPioBPH
Content-Type: multipart/mixed; boundary="------------DPiBTuW4WhK0KFF1cKCxJjmg";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-block@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Denis Efremov <efremov@linux.com>,
 Jens Axboe <axboe@kernel.dk>
Message-ID: <0afb8dc5-6ab9-4f61-af3a-8424835386e4@suse.com>
Subject: Re: [PATCH v4 0/6] x86: Cleanups around slow_down_io()
References: <20260119182632.596369-1-jgross@suse.com>
In-Reply-To: <20260119182632.596369-1-jgross@suse.com>

--------------DPiBTuW4WhK0KFF1cKCxJjmg
Content-Type: multipart/mixed; boundary="------------liiRpZ2LGHl5C0gioM2bJdPR"

--------------liiRpZ2LGHl5C0gioM2bJdPR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZz8NCg0KT24gMTkuMDEuMjYgMTk6MjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFdo
aWxlIGxvb2tpbmcgYXQgcGFyYXZpcnQgY2xlYW51cHMgSSBzdHVtYmxlZCBvdmVyIHNsb3df
ZG93bl9pbygpIGFuZA0KPiB0aGUgcmVsYXRlZCBSRUFMTFlfU0xPV19JTyBkZWZpbmUuDQo+
IA0KPiBEbyBzZXZlcmFsIGNsZWFudXBzLCByZXN1bHRpbmcgaW4gYSBkZWxldGlvbiBvZiBS
RUFMTFlfU0xPV19JTyBhbmQgdGhlDQo+IGlvX2RlbGF5KCkgcGFyYXZpcnQgZnVuY3Rpb24g
aG9vay4NCj4gDQo+IFBhdGNoIDQgaXMgcmVtb3ZpbmcgdGhlIGNvbmZpZyBvcHRpb25zIGZv
ciBzZWxlY3RpbmcgdGhlIGRlZmF1bHQgZGVsYXkNCj4gbWVjaGFuaXNtIGFuZCBzZXRzIHRo
ZSBkZWZhdWx0IHRvICJubyBkZWxheSIuIFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gb2YNCj4g
cmVtb3ZpbmcgdGhlIGlvX2RlbGF5KCkgZnVuY3Rpb25hbGl0eSBjb21wbGV0ZWx5LCBhcyBz
dWdnZXN0ZWQgYnkgSW5nbw0KPiBNb2xuYXIuDQo+IA0KPiBQYXRjaCA1IGlzIGFkZGluZyBh
biBhZGRpdGlvbmFsIGNvbmZpZyBvcHRpb24gYWxsb3dpbmcgdG8gYXZvaWQNCj4gYnVpbGRp
bmcgaW9fZGVsYXkuYyAoZGVmYXVsdCBpcyBzdGlsbCB0byBidWlsZCBpdCkuDQo+IA0KPiBD
aGFuZ2VzIGluIFYyOg0KPiAtIHBhdGNoZXMgMiBhbmQgMyBvZiBWMSBoYXZlIGJlZW4gYXBw
bGllZA0KPiAtIG5ldyBwYXRjaGVzIDQgYW5kIDUNCj4gDQo+IENoYW5nZXMgaW4gVjM6DQo+
IC0gcmViYXNlIHRvIHRpcC9tYXN0ZXIga2VybmVsIGJyYW5jaA0KPiANCj4gQ2hhbmdlcyBp
biBWNDoNCj4gLSBhZGQgcGF0Y2ggMSBhcyBwcmVyZXEgcGF0Y2ggdG8gdGhlIHNlcmllcw0K
PiANCj4gSnVlcmdlbiBHcm9zcyAoNik6DQo+ICAgIHg4Ni9pcnFmbGFnczogRml4IGJ1aWxk
IGZhaWx1cmUNCj4gICAgeDg2L3BhcmF2aXJ0OiBSZXBsYWNlIGlvX2RlbGF5KCkgaG9vayB3
aXRoIGEgYm9vbA0KPiAgICBibG9jay9mbG9wcHk6IERvbid0IHVzZSBSRUFMTFlfU0xPV19J
TyBmb3IgZGVsYXlzDQo+ICAgIHg4Ni9pbzogUmVtb3ZlIFJFQUxMWV9TTE9XX0lPIGhhbmRs
aW5nDQo+ICAgIHg4Ni9pb19kZWxheTogU3dpdGNoIGlvX2RlbGF5KCkgZGVmYXVsdCBtZWNo
YW5pc20gdG8gIm5vbmUiDQo+ICAgIHg4Ni9pb19kZWxheTogQWRkIGNvbmZpZyBvcHRpb24g
Zm9yIGNvbnRyb2xsaW5nIGJ1aWxkIG9mIGlvX2RlbGF5Lg0KPiANCj4gICBhcmNoL3g4Ni9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrDQo+ICAgYXJjaC94ODYvS2Nv
bmZpZy5kZWJ1ZyAgICAgICAgICAgICAgICB8IDMwIC0tLS0tLS0tLS0NCj4gICBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS9mbG9wcHkuaCAgICAgICAgIHwgMzEgKysrKysrKystLQ0KPiAgIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL2lvLmggICAgICAgICAgICAgfCAxOSArKysrLS0tDQo+ICAg
YXJjaC94ODYvaW5jbHVkZS9hc20vaXJxZmxhZ3MuaCAgICAgICB8ICA2ICstDQo+ICAgYXJj
aC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQtYmFzZS5oICB8ICA2ICsrDQo+ICAgYXJjaC94
ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaCAgICAgICB8IDExIC0tLS0NCj4gICBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBlcy5oIHwgIDIgLQ0KPiAgIGFyY2gveDg2L2tl
cm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgMyArLQ0KPiAgIGFyY2gveDg2L2tlcm5l
bC9jcHUvdm13YXJlLmMgICAgICAgICAgfCAgMiArLQ0KPiAgIGFyY2gveDg2L2tlcm5lbC9p
b19kZWxheS5jICAgICAgICAgICAgfCA4MSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gICBhcmNoL3g4Ni9rZXJuZWwva3ZtLmMgICAgICAgICAgICAgICAgIHwgIDggKy0tDQo+
ICAgYXJjaC94ODYva2VybmVsL3BhcmF2aXJ0LmMgICAgICAgICAgICB8ICAzICstDQo+ICAg
YXJjaC94ODYva2VybmVsL3NldHVwLmMgICAgICAgICAgICAgICB8ICA0ICstDQo+ICAgYXJj
aC94ODYveGVuL2VubGlnaHRlbl9wdi5jICAgICAgICAgICB8ICA2ICstDQo+ICAgZHJpdmVy
cy9ibG9jay9mbG9wcHkuYyAgICAgICAgICAgICAgICB8ICAyIC0NCj4gICAxNiBmaWxlcyBj
aGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAxNTkgZGVsZXRpb25zKC0pDQo+IA0KDQo=
--------------liiRpZ2LGHl5C0gioM2bJdPR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------liiRpZ2LGHl5C0gioM2bJdPR--

--------------DPiBTuW4WhK0KFF1cKCxJjmg--

--------------EFFtuyAw2mxdAKPsAqPioBPH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmAfAgFAwAAAAAACgkQsN6d1ii/Ey/2
zAf+IkVIvbIONVNOIsFijpcb0ksuCVfDZvIq2cPAb9rfEt4SV/Fv87G1BkwNCtKbrpMKsTjK2E8V
YxPglU6me8lcaWM/t2j74OrYLM0B0yfhTzS6I5AbtpGIMsQxiITsr//ZP64nl5N5/YvNKpLhvAkG
rqdkNYFQh4GB5FgSl079/ebN9POZERI4nOBDWTiJ69297xhtHXPambNil4kLLpNyi+I0vETf6+05
0pPWs7hQsNqqHWfyCdehYqc+H8ZZkY2Jg0uanT5Qv1kWieoCWahhlRcpKyz9tMoIofilTuPuAkGu
XnCl3azsTfUBNhgwDBPjw50R1tSidPTjMLavCd43jA==
=T21t
-----END PGP SIGNATURE-----

--------------EFFtuyAw2mxdAKPsAqPioBPH--

