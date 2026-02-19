Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIxmHrCtlmlkjQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 07:29:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE16615C629
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 07:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236063.1538853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsxWv-0006k8-NP; Thu, 19 Feb 2026 06:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236063.1538853; Thu, 19 Feb 2026 06:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsxWv-0006hF-KT; Thu, 19 Feb 2026 06:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1236063;
 Thu, 19 Feb 2026 06:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zdoi=AX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vsxWu-0006h8-6E
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 06:28:52 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 407edd8d-0d5c-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 07:28:49 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b8fd976e90cso90070466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 22:28:49 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc768ffc0sm543441666b.56.2026.02.18.22.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 22:28:48 -0800 (PST)
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
X-Inumbo-ID: 407edd8d-0d5c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771482529; x=1772087329; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xHkR2DNL8rqaZKFVAj81J2UIJJCt3Q5LF4NuA/QdKH0=;
        b=MPmWw0ckBKrMm8bOA1zx+kg0yfbpryEZCYOA1NGVZ7S0Onit5HF7WX4AKS5o4RgRzY
         cKCPwurJ+7S8836pRzLjHJqnB4qD9w/ezJFiPeEVXpxS8vkMEgxHPmEDguzDVtzyngJn
         KeNqinY85b+IUHe/FBRj3PAMHPGa7+6YENe7Kqm/arkBY273HTpjYhfU9FIYDSvLLhn8
         hDmoKWm1lTjIk7KRUMJBwrYKKDxVS3BkbKYfgb+9l/rQ+MZmLhi0tvMdU6hlrATbzZqN
         GDhBAUjTQuZ8Z8NDN85xuSpd+MWb6hUN7QhJsh//msNVNvjEr/9/VSELRlh1s9zri2SB
         +d6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771482529; x=1772087329;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHkR2DNL8rqaZKFVAj81J2UIJJCt3Q5LF4NuA/QdKH0=;
        b=OW+erK/kEjO9/zAasODqd7io4XQQ4rAVChOQr0d9lwrtZmVTpmCZRJInSItChFS+px
         1uKdpaRQvi4Ragnuf4Mrn6IKFAq94bGL1+tPG7r3cVGG4izdwQ5hpL5PCoa0BGXhXS5i
         XnKzhP56qhOXF985IcJd0zNkwQWC3ZKhpNh/lK7hCe4WqNT4czJmi+M2yPg/0dLhEgqo
         yZJM/7xZjWyBLLTykNuvBJN/TYWxtzf2f+wG8bo+Ctkws7DlSGz8BG54mat7k6JYHAZJ
         M4+0ATXu8WTO4BFoyxQ0vjHZlxlB1pOydscLF4DDnWxbfC+EUj1o2wx20isPR7NgOGX0
         TLhA==
X-Forwarded-Encrypted: i=1; AJvYcCVL1IX05Es0M4fRwBKBRieOnMHo5QRwtf9Lik+Wy4/iO2fg9Kx1iUfO2+9LzuvSDgZxJoKrL0b1d9c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK36mo6c8WSGdTg6DedQ1wb91bKBL8Y2RIZW1l15LNJUT6tKp+
	qqpsW1SmCXgx2Vxg+gQMQCClfwEb+gPUpd1cSzUEe3ngmtCB30m9VmpkIPeNDg2BLzU=
X-Gm-Gg: AZuq6aLimuMxseqilYAg0Jopyq9y9WrFQwBMmi1BGol0WByZL/yo2bawkRCDM5mCThH
	OUsyqeBmodjl4PEiffK7dyZxwbYFuwhd9ZZktFEMQh2H9hhISie+FFHTm+FRF8qEjmJnVz13E+A
	8BGtB1jAKZInHBXT6UwWHHHNmUOHb70bUo/TXdYD+doytKBZGxrs5rrT9fw8aiyACcukipfw9m5
	4/H4K3i3eYHcgzaLzMaiR5aG5n/IfkSPXesD2qh21rUB3YXP4CqXmPTRjP7wmFkeCm3xKqcuCKk
	yEnE5YBKaEidV5378p0dUsSAAdhtJ9NciZDMp9WedK8h3DYRU1EiYUQtwxVm4+IX+S9D3Gh+lqf
	K6YDKhFWzWBn63bVep1S2ZO0nCnrOxPxhwRApCCMzZSOWOHdkBSW1kKW0bLg8dKpFyAwSTQruNt
	NliwVQF1gBfDOFJyJ3+HUfimwx0J6mN6+YIe1o2b1fMFmZtriefffcHVFQuSPBAl6lu4kf065W6
	PuW8XOc22F+cSARc0h8VQS9jwTKTBhVSP6vH2hwjRmZs6Enhv88g5x6x/jy
X-Received: by 2002:a17:907:9808:b0:b90:48b:b53c with SMTP id a640c23a62f3a-b90048bb667mr697243266b.32.1771482528828;
        Wed, 18 Feb 2026 22:28:48 -0800 (PST)
Message-ID: <bae9c067-b5f0-4904-8eab-957ff793e140@suse.com>
Date: Thu, 19 Feb 2026 07:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/16] x86/msr: Inline rdmsr/wrmsr instructions
To: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 llvm@lists.linux.dev
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Xin Li <xin@zytor.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, andy.cooper@citrix.com
References: <20260218082133.400602-1-jgross@suse.com>
 <3D1FE2A7-F237-4232-9E39-6AFC75F3A4F0@zytor.com>
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
In-Reply-To: <3D1FE2A7-F237-4232-9E39-6AFC75F3A4F0@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iM0WWoZER14TV00iL3mHiqfS"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.13 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:llvm@lists.linux.dev,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:vkuznets@redhat.com,m:boris.ostrovsky@oracle.com,m:xen-devel@lists.xenproject.org,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:luto@kernel.org,m:peterz@infradead.org,m:xin@zytor.com,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:jpoimboe@kernel.org,m:andy.cooper@citrix.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,intel.com,google.com,microsoft.com,oracle.com,lists.xenproject.org,broadcom.com,infradead.org,zytor.com,gmail.com,citrix.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,lkml];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AE16615C629
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iM0WWoZER14TV00iL3mHiqfS
Content-Type: multipart/mixed; boundary="------------IF9DvLhbTUfw0F0uwtC2r0ls";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 llvm@lists.linux.dev
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Xin Li <xin@zytor.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, andy.cooper@citrix.com
Message-ID: <bae9c067-b5f0-4904-8eab-957ff793e140@suse.com>
Subject: Re: [PATCH v3 00/16] x86/msr: Inline rdmsr/wrmsr instructions
References: <20260218082133.400602-1-jgross@suse.com>
 <3D1FE2A7-F237-4232-9E39-6AFC75F3A4F0@zytor.com>
In-Reply-To: <3D1FE2A7-F237-4232-9E39-6AFC75F3A4F0@zytor.com>

--------------IF9DvLhbTUfw0F0uwtC2r0ls
Content-Type: multipart/mixed; boundary="------------L0CZrd40rvK39oWo3hvXsB63"

--------------L0CZrd40rvK39oWo3hvXsB63
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDIuMjYgMjE6MzcsIEguIFBldGVyIEFudmluIHdyb3RlOg0KPiBPbiBGZWJydWFy
eSAxOCwgMjAyNiAxMjoyMToxNyBBTSBQU1QsIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6DQo+PiBXaGVuIGJ1aWxkaW5nIGEga2VybmVsIHdpdGggQ09ORklHX1BB
UkFWSVJUX1hYTCB0aGUgcGFyYXZpcnQNCj4+IGluZnJhc3RydWN0dXJlIHdpbGwgYWx3YXlz
IHVzZSBmdW5jdGlvbnMgZm9yIHJlYWRpbmcgb3Igd3JpdGluZyBNU1JzLA0KPj4gZXZlbiB3
aGVuIHJ1bm5pbmcgb24gYmFyZSBtZXRhbC4NCj4+DQo+PiBTd2l0Y2ggdG8gaW5saW5lIFJE
TVNSL1dSTVNSIGluc3RydWN0aW9ucyBpbiB0aGlzIGNhc2UsIHJlZHVjaW5nIHRoZQ0KPj4g
cGFyYXZpcnQgb3ZlcmhlYWQuDQo+Pg0KPj4gVGhlIGZpcnN0IHBhdGNoIGlzIGEgcHJlcmVx
dWlzaXRlIGZpeCBmb3IgYWx0ZXJuYXRpdmUgcGF0Y2hpbmcuIEl0cw0KPj4gaXMgbmVlZGVk
IGR1ZSB0byB0aGUgaW5pdGlhbCBpbmRpcmVjdCBjYWxsIG5lZWRzIHRvIGJlIHBhZGRlZCB3
aXRoDQo+PiBOT1BzIGluIHNvbWUgY2FzZXMgd2l0aCB0aGUgZm9sbG93aW5nIHBhdGNoZXMu
DQo+Pg0KPj4gSW4gb3JkZXIgdG8gbWFrZSB0aGlzIGxlc3MgaW50cnVzaXZlLCBzb21lIGZ1
cnRoZXIgcmVvcmdhbml6YXRpb24gb2YNCj4+IHRoZSBNU1IgYWNjZXNzIGhlbHBlcnMgaXMg
ZG9uZSBpbiB0aGUgcGF0Y2hlcyAxLTYuDQo+Pg0KPj4gVGhlIG5leHQgNCBwYXRjaGVzIGFy
ZSBjb252ZXJ0aW5nIHRoZSBub24tcGFyYXZpcnQgY2FzZSB0byB1c2UgZGlyZWN0DQo+PiBp
bmxpbmluZyBvZiB0aGUgTVNSIGFjY2VzcyBpbnN0cnVjdGlvbnMsIGluY2x1ZGluZyB0aGUg
V1JNU1JOUw0KPj4gaW5zdHJ1Y3Rpb24gYW5kIHRoZSBpbW1lZGlhdGUgdmFyaWFudHMgb2Yg
UkRNU1IgYW5kIFdSTVNSIGlmIHBvc3NpYmxlLg0KPj4NCj4+IFBhdGNoZXMgMTEtMTMgYXJl
IHNvbWUgZnVydGhlciBwcmVwYXJhdGlvbnMgZm9yIG1ha2luZyB0aGUgcmVhbCBzd2l0Y2gN
Cj4+IHRvIGRpcmVjdGx5IHBhdGNoIGluIHRoZSBuYXRpdmUgTVNSIGluc3RydWN0aW9ucyBl
YXNpZXIuDQo+Pg0KPj4gUGF0Y2ggMTQgaXMgc3dpdGNoaW5nIHRoZSBwYXJhdmlydCBNU1Ig
ZnVuY3Rpb24gaW50ZXJmYWNlIGZyb20gbm9ybWFsDQo+PiBjYWxsIEFCSSB0byBvbmUgbW9y
ZSBzaW1pbGFyIHRvIHRoZSBuYXRpdmUgTVNSIGluc3RydWN0aW9ucy4NCj4+DQo+PiBQYXRj
aCAxNSBpcyBhIGxpdHRsZSBjbGVhbnVwIHBhdGNoLg0KPj4NCj4+IFBhdGNoIDE2IGlzIHRo
ZSBmaW5hbCBzdGVwIGZvciBwYXRjaGluZyBpbiB0aGUgbmF0aXZlIE1TUiBpbnN0cnVjdGlv
bnMNCj4+IHdoZW4gbm90IHJ1bm5pbmcgYXMgYSBYZW4gUFYgZ3Vlc3QuDQo+Pg0KPj4gVGhp
cyBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIHRvIHdvcmsgd2l0aCBYZW4gUFYgYW5kIG9uIGJh
cmUgbWV0YWwuDQo+Pg0KPj4gTm90ZSB0aGF0IHRoZXJlIGlzIG1vcmUgcm9vbSBmb3IgaW1w
cm92ZW1lbnQuIFRoaXMgc2VyaWVzIGlzIHNlbnQgb3V0DQo+PiB0byBnZXQgYSBmaXJzdCBp
bXByZXNzaW9uIGhvdyB0aGUgY29kZSB3aWxsIGJhc2ljYWxseSBsb29rIGxpa2UuDQo+IA0K
PiBEb2VzIHRoYXQgbWVhbiB5b3UgYXJlIGNvbnNpZGVyaW5nIHRoaXMgcGF0Y2hzZXQgYW4g
UkZDPyBJZiBzbywgeW91IHNob3VsZCBwdXQgdGhhdCBpbiB0aGUgc3ViamVjdCBoZWFkZXIu
DQoNCkl0IGlzIG9uZSBwb3NzaWJsZSBzb2x1dGlvbi4NCg0KPiANCj4+IFJpZ2h0IG5vdyB0
aGUgc2FtZSBwcm9ibGVtIGlzIHNvbHZlZCBkaWZmZXJlbnRseSBmb3IgdGhlIHBhcmF2aXJ0
IGFuZA0KPj4gdGhlIG5vbi1wYXJhdmlydCBjYXNlcy4gSW4gY2FzZSB0aGlzIGlzIG5vdCBk
ZXNpcmVkLCB0aGVyZSBhcmUgdHdvDQo+PiBwb3NzaWJpbGl0aWVzIHRvIG1lcmdlIHRoZSB0
d28gaW1wbGVtZW50YXRpb25zLiBCb3RoIHNvbHV0aW9ucyBoYXZlDQo+PiB0aGUgY29tbW9u
IGlkZWEgdG8gaGF2ZSByYXRoZXIgc2ltaWxhciBjb2RlIGZvciBwYXJhdmlydCBhbmQNCj4+
IG5vbi1wYXJhdmlydCB2YXJpYW50cywgYnV0IGp1c3QgdXNlIGEgZGlmZmVyZW50IG1haW4g
bWFjcm8gZm9yDQo+PiBnZW5lcmF0aW5nIHRoZSByZXNwZWN0aXZlIGNvZGUuIEZvciBtYWtp
bmcgdGhlIGNvZGUgb2YgYm90aCBwb3NzaWJsZQ0KPj4gc2NlbmFyaW9zIG1vcmUgc2ltaWxh
ciwgdGhlIGZvbGxvd2luZyB2YXJpYW50cyBhcmUgcG9zc2libGU6DQo+Pg0KPj4gMS4gUmVt
b3ZlIHRoZSBtaWNyby1vcHRpbWl6YXRpb25zIG9mIHRoZSBub24tcGFyYXZpcnQgY2FzZSwg
bWFraW5nDQo+PiAgICBpdCBzaW1pbGFyIHRvIHRoZSBwYXJhdmlydCBjb2RlIGluIG15IHNl
cmllcy4gVGhpcyBoYXMgdGhlDQo+PiAgICBhZHZhbnRhZ2Ugb2YgYmVpbmcgbW9yZSBzaW1w
bGUsIGJ1dCBtaWdodCBoYXZlIGEgdmVyeSBzbWFsbA0KPj4gICAgbmVnYXRpdmUgcGVyZm9y
bWFuY2UgaW1wYWN0IChwcm9iYWJseSBub3QgcmVhbGx5IGRldGVjdGFibGUpLg0KPj4NCj4+
IDIuIEFkZCB0aGUgc2FtZSBtaWNyby1vcHRpbWl6YXRpb25zIHRvIHRoZSBwYXJhdmlydCBj
YXNlLCByZXF1aXJpbmcNCj4+ICAgIHRvIGVuaGFuY2UgcGFyYXZpcnQgcGF0Y2hpbmcgdG8g
c3VwcG9ydCBhIHRvIGJlIHBhdGNoZWQgaW5kaXJlY3QNCj4+ICAgIGNhbGwgaW4gdGhlIG1p
ZGRsZSBvZiB0aGUgaW5pdGlhbCBjb2RlIHNuaXBwbGV0Lg0KPj4NCj4+IEluIGJvdGggY2Fz
ZXMgdGhlIG5hdGl2ZSBNU1IgZnVuY3Rpb24gdmFyaWFudHMgd291bGQgbm8gbG9uZ2VyIGJl
DQo+PiB1c2FibGUgaW4gdGhlIHBhcmF2aXJ0IGNhc2UsIGJ1dCB0aGlzIHdvdWxkIG1vc3Rs
eSBhZmZlY3QgWGVuLCBhcyBpdA0KPj4gd291bGQgbmVlZCB0byBvcGVuIGNvZGUgdGhlIFdS
TVNSL1JETVNSIGluc3RydWN0aW9ucyB0byBiZSB1c2VkDQo+PiBpbnN0ZWFkIHRoZSBuYXRp
dmVfKm1zciooKSBmdW5jdGlvbnMuDQo+Pg0KPj4gQ2hhbmdlcyBzaW5jZSBWMjoNCj4+IC0g
c3dpdGNoIGJhY2sgdG8gdGhlIHBhcmF2aXJ0IGFwcHJvYWNoDQo+Pg0KPj4gQ2hhbmdlcyBz
aW5jZSBWMToNCj4+IC0gVXNlIFhpbiBMaSdzIGFwcHJvYWNoIGZvciBpbmxpbmluZw0KPj4g
LSBTZXZlcmFsIG5ldyBwYXRjaGVzDQo+Pg0KPj4gSnVlcmdlbiBHcm9zcyAoMTYpOg0KPj4g
ICB4ODYvYWx0ZXJuYXRpdmU6IFN1cHBvcnQgYWx0X3JlcGxhY2VfY2FsbCgpIHdpdGggaW5z
dHJ1Y3Rpb25zIGFmdGVyDQo+PiAgICAgY2FsbA0KPj4gICBjb2NvL3RkeDogUmVuYW1lIE1T
UiBhY2Nlc3MgaGVscGVycw0KPj4gICB4ODYvc2V2OiBSZXBsYWNlIGNhbGwgb2YgbmF0aXZl
X3dybXNyKCkgd2l0aCBuYXRpdmVfd3Jtc3JxKCkNCj4+ICAgS1ZNOiB4ODY6IFJlbW92ZSB0
aGUgS1ZNIHByaXZhdGUgcmVhZF9tc3IoKSBmdW5jdGlvbg0KPj4gICB4ODYvbXNyOiBNaW5p
bWl6ZSB1c2FnZSBvZiBuYXRpdmVfKigpIG1zciBhY2Nlc3MgZnVuY3Rpb25zDQo+PiAgIHg4
Ni9tc3I6IE1vdmUgTVNSIHRyYWNlIGNhbGxzIG9uZSBmdW5jdGlvbiBsZXZlbCB1cA0KPj4g
ICB4ODYvb3Bjb2RlOiBBZGQgaW1tZWRpYXRlIGZvcm0gTVNSIGluc3RydWN0aW9ucw0KPj4g
ICB4ODYvZXh0YWJsZTogQWRkIHN1cHBvcnQgZm9yIGltbWVkaWF0ZSBmb3JtIE1TUiBpbnN0
cnVjdGlvbnMNCj4+ICAgeDg2L21zcjogVXNlIHRoZSBhbHRlcm5hdGl2ZXMgbWVjaGFuaXNt
IGZvciBXUk1TUg0KPj4gICB4ODYvbXNyOiBVc2UgdGhlIGFsdGVybmF0aXZlcyBtZWNoYW5p
c20gZm9yIFJETVNSDQo+PiAgIHg4Ni9hbHRlcm5hdGl2ZXM6IEFkZCBBTFRFUk5BVElWRV80
KCkNCj4+ICAgeDg2L3BhcmF2aXJ0OiBTcGxpdCBvZmYgTVNSIHJlbGF0ZWQgaG9va3MgaW50
byBuZXcgaGVhZGVyDQo+PiAgIHg4Ni9wYXJhdmlydDogUHJlcGFyZSBzdXBwb3J0IG9mIE1T
UiBpbnN0cnVjdGlvbiBpbnRlcmZhY2VzDQo+PiAgIHg4Ni9wYXJhdmlydDogU3dpdGNoIE1T
UiBhY2Nlc3MgcHZfb3BzIGZ1bmN0aW9ucyB0byBpbnN0cnVjdGlvbg0KPj4gICAgIGludGVy
ZmFjZXMNCj4+ICAgeDg2L21zcjogUmVkdWNlIG51bWJlciBvZiBsb3cgbGV2ZWwgTVNSIGFj
Y2VzcyBoZWxwZXJzDQo+PiAgIHg4Ni9wYXJhdmlydDogVXNlIGFsdGVybmF0aXZlcyBmb3Ig
TVNSIGFjY2VzcyB3aXRoIHBhcmF2aXJ0DQo+Pg0KPj4gYXJjaC94ODYvY29jby9zZXYvaW50
ZXJuYWwuaCAgICAgICAgICAgICAgfCAgIDcgKy0NCj4+IGFyY2gveDg2L2NvY28vdGR4L3Rk
eC5jICAgICAgICAgICAgICAgICAgIHwgICA4ICstDQo+PiBhcmNoL3g4Ni9oeXBlcnYvaXZt
LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPj4gYXJjaC94ODYvaW5jbHVkZS9h
c20vYWx0ZXJuYXRpdmUuaCAgICAgICAgfCAgIDYgKw0KPj4gYXJjaC94ODYvaW5jbHVkZS9h
c20vZnJlZC5oICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4+IGFyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggICAgICAgICAgIHwgIDEwIC0NCj4+IGFyY2gveDg2L2luY2x1ZGUv
YXNtL21zci5oICAgICAgICAgICAgICAgIHwgMzQ1ICsrKysrKysrKysrKysrKystLS0tLS0N
Cj4+IGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LW1zci5oICAgICAgIHwgMTQ4ICsr
KysrKysrKysNCj4+IGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmggICAgICAgICAg
IHwgIDY3IC0tLS0tDQo+PiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBlcy5o
ICAgICB8ICA1NyArKy0tDQo+PiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9xc3BpbmxvY2tfcGFy
YXZpcnQuaCB8ICAgNCArLQ0KPj4gYXJjaC94ODYva2VybmVsL2FsdGVybmF0aXZlLmMgICAg
ICAgICAgICAgfCAgIDUgKy0NCj4+IGFyY2gveDg2L2tlcm5lbC9jcHUvbXNoeXBlcnYuYyAg
ICAgICAgICAgIHwgICA3ICstDQo+PiBhcmNoL3g4Ni9rZXJuZWwva3ZtY2xvY2suYyAgICAg
ICAgICAgICAgICB8ICAgMiArLQ0KPj4gYXJjaC94ODYva2VybmVsL3BhcmF2aXJ0LmMgICAg
ICAgICAgICAgICAgfCAgNDIgKystDQo+PiBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jICAgICAg
ICAgICAgICAgICAgICB8ICAxNiArLQ0KPj4gYXJjaC94ODYva3ZtL3ZteC90ZHguYyAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4+IGFyY2gveDg2L2t2bS92bXgvdm14LmMgICAg
ICAgICAgICAgICAgICAgIHwgICA4ICstDQo+PiBhcmNoL3g4Ni9saWIveDg2LW9wY29kZS1t
YXAudHh0ICAgICAgICAgICB8ICAgNSArLQ0KPj4gYXJjaC94ODYvbW0vZXh0YWJsZS5jICAg
ICAgICAgICAgICAgICAgICAgfCAgMzUgKystDQo+PiBhcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2LmMgICAgICAgICAgICAgICB8ICA1MiArKystDQo+PiBhcmNoL3g4Ni94ZW4vcG11LmMg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQ0KPj4gdG9vbHMvYXJjaC94ODYvbGli
L3g4Ni1vcGNvZGUtbWFwLnR4dCAgICAgfCAgIDUgKy0NCj4+IHRvb2xzL29ianRvb2wvY2hl
Y2suYyAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4+IDI0IGZpbGVzIGNoYW5nZWQs
IDU3NiBpbnNlcnRpb25zKCspLCAyNjQgZGVsZXRpb25zKC0pDQo+PiBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQtbXNyLmgNCj4+DQo+IA0KPiBD
b3VsZCB5b3UgY2xhcmlmeSAqb24gdGhlIGhpZ2ggZGVzaWduIGxldmVsKiB3aGF0ICJnbyBi
YWNrIHRvIHRoZSBwYXJhdmlydCBhcHByb2FjaCIgbWVhbnMsIGFuZCB0aGUgbW90aXZhdGlv
biBmb3IgdGhhdD8NCg0KVGhpcyBpcyByZWxhdGVkIHRvIFYyIG9mIHRoaXMgc2VyaWVzLCB3
aGVyZSBJIHVzZWQgYSBzdGF0aWMgYnJhbmNoIGZvcg0Kc3BlY2lhbCBjYXNpbmcgWGVuIFBW
Lg0KDQpQZXRlciBaaWpsc3RyYSBjb21tZW50ZWQgb24gdGhhdCBhc2tpbmcgdG8gdHJ5IGhh
cmRlciB1c2luZyB0aGUgcHZfb3BzDQpob29rcyBmb3IgWGVuIFBWLCB0b28uDQoNCj4gTm90
ZSB0aGF0IGZvciBYZW4gKm1vc3QqIE1TUnMgZmFsbCBpbiBvbmUgb2YgdHdvIGNhdGVnb3Jp
ZXM6IHRob3NlIHRoYXQgYXJlIGRyb3BwZWQgZW50aXJlbHkgYW5kIHRob3NlIHRoYXQgYXJl
IGp1c3QgcGFzc2VkIHN0cmFpZ2h0IG9uIHRvIHRoZSBoYXJkd2FyZS4NCj4gDQo+IEkgZG9u
J3Qga25vdyBpZiBhbnlvbmUgY2FyZXMgYWJvdXQgb3B0aW1pemluZyBQViBYZW4gYW55bW9y
ZSwgYnV0IGF0IGxlYXN0IGluIHRoZW9yeSBYZW4gY2FuIHVuLXBhcmF2aXJ0dWFsaXplIG1v
c3Qgc2l0ZXMuDQoNClRoZSBwcm9ibGVtIHdpdGggdGhhdCBpcywgdGhhdCB0aGlzIHdvdWxk
IG5lZWQgdG8gYmUgdGFrZW4gY2FyZSBhdCB0aGUNCmNhbGxlcnMnIHNpdGVzLCAicG9pc29u
aW5nIiBhIGxvdCBvZiBjb2RlIHdpdGggWGVuIHNwZWNpZmljIHBhdGhzLiBPciB3ZSdkDQpu
ZWVkIHRvIHVzZSB0aGUgbmF0aXZlIHZhcmlhbnRzIGV4cGxpY2l0bHkgYXQgYWxsIHBsYWNl
cyB3aGVyZSBYZW4gUFYNCndvdWxkIGp1c3QgdXNlIHRoZSBNU1IgaW5zdHJ1Y3Rpb25zIGl0
c2VsZi4gQnV0IHBsZWFzZSBiZSBhd2FyZSwgdGhhdA0KdGhlcmUgYXJlIHBsYW5zIHRvIGlu
dHJvZHVjZSBhIGh5cGVyY2FsbCBmb3IgWGVuIHRvIHNwZWVkIHVwIE1TUiBhY2Nlc3NlcywN
CndoaWNoIHdvdWxkIHJlZHVjZSB0aGUgInBhc3NlZCB0aHJvdWdoIHRvIGhhcmR3YXJlIiBj
YXNlcyB0byAwLg0KDQoNCkp1ZXJnZW4NCg==
--------------L0CZrd40rvK39oWo3hvXsB63
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------L0CZrd40rvK39oWo3hvXsB63--

--------------IF9DvLhbTUfw0F0uwtC2r0ls--

--------------iM0WWoZER14TV00iL3mHiqfS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmWrZ8FAwAAAAAACgkQsN6d1ii/Ey/x
Vgf9GNkMNv8ezbKDeFj0xYtdTYX2S1GrlV6rXyDgpg0M3mQBgVE2yh1rPyeRxG/Xow7fPeYvu6Wn
y/MUTm8BSevH+TFzFX0qZbm+rGfMWRK5DZj2aPhkz80vuJcYKKtsP7sG7M8gQAuIVKh0P7gam8WR
pJslPMIXDntG506kNq81nKET47SGPEmliUdFgY47kZv3Rky/F7Tx3J59kMA2GxYtkwLa+w4Pvn5V
qOo1fuHYjajMFU++hpm2fwPX/2X4mSDKJJEGkRkGtgdeWGMEahC6b4xFO8TCSVvwvl4sHRIDFCi3
aYWk5cPP1n6YQAYY9zjTRr7ywnjTWf06N9g2Kys27g==
=8M17
-----END PGP SIGNATURE-----

--------------iM0WWoZER14TV00iL3mHiqfS--

