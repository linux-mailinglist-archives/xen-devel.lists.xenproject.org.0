Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3053A22905
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 08:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879390.1289598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdOWJ-0002tC-OP; Thu, 30 Jan 2025 06:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879390.1289598; Thu, 30 Jan 2025 06:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdOWJ-0002rk-LZ; Thu, 30 Jan 2025 06:59:23 +0000
Received: by outflank-mailman (input) for mailman id 879390;
 Thu, 30 Jan 2025 06:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oB=UW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tdOWI-0002re-A2
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 06:59:22 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba8e917a-ded7-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 07:59:20 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so232261f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 22:59:20 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244ecd6sm12030725e9.28.2025.01.29.22.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 22:59:19 -0800 (PST)
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
X-Inumbo-ID: ba8e917a-ded7-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738220360; x=1738825160; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3vUZSw8zKtk8bflc7Hn4PYmWr1l5R9zJUD1wFwtUDP4=;
        b=bwWhZH9waP690z9B4AIJGXRNQKWLkvCBX4Q+GDE5d6/M8KrvgzZkBG6NjCx7WGHlpt
         1gEVOoaEGAEbD67du2ZHYHze16CwgBAdEc0vAYvDP5YV/jKtyuYbgfBKopA/vOLtmNOM
         EdAVcBqO2EL7P2qygYgiQfUNpMqlTRPaeBeSNhkzLg7NZ2dwDv29/MkasKxzeCfJWnGV
         8+Q9pOogaAJ4zGfwOBHT1CV5PERWl8haE/KB5p8rSYhyr22HfKPzb7QJA/CZt7Q9K7cp
         JIckYKg+ZYBSSo2gDwug4pMH9uIViva4Egvi/JVJaseP56O1FY8DpiRKwi2030pSLjon
         fl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738220360; x=1738825160;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vUZSw8zKtk8bflc7Hn4PYmWr1l5R9zJUD1wFwtUDP4=;
        b=vzgvknH5rKJ4uQ3nCcJ+4CihOn6W0xyfqA/8+Mipkn6OBJwIB+M7duueoIJg+MW4r+
         j6GNmw2fdcuiW3KD75M7SrYJc3a55uxH6+F9PmQjAI/1X+LYIJm/uEPsHyNsqL1r/Ydq
         aJPglRTKuuHpDOqWifVni+Paf9LiJJWvoQhtBcfR6ja3+OU6qGSQP381MvnNQMp6JoOo
         fy3bHHrXPU8eBgwWvB+CddTg4H43zC3KR2M38jNGmK1UeTfMLULwn0AKaJJEIrU4y/gd
         67rxUrCrZWcU14R/zqS3qFGfhNicgszU0uxXVFx8m7JB2QR5BDdRjb9OnPSbJVvhrK40
         DcAA==
X-Forwarded-Encrypted: i=1; AJvYcCVcCfjVu/fNSWiHoYRpqsQ5HaAYhfppy56ecAmhQ47Qu1oVIaA5hzaNqeAjqFqnNUUzZ8F7DYGS7YI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAjbRHjTjWu+trwgQrM5+j/hq0Kbb5xznN1tWCH7xduUnNyNBm
	cgsrMMEkKhE5aaVzZA7kFbY3D+7jWBPdVZrkQaLGsSEBh9IWg9lLA9zRfZNHUgc=
X-Gm-Gg: ASbGncso95/8QwYUxI63X8aGJxOGRbXIZY3v2g1/G4aB7lhNlO2rczS7P5fzR56ieCh
	9kvSSFHROriGjgfW6kfj7gaQfoQ5i9zsRIxn0+X4C39DyrfHIEiqzB76XS1+RqSTivbDeArIDY9
	QSJKT0Lt2bmndP8iCw2GC4A9fDlxx2zjOpODDpj1LnUeR+0bj461RlQpacne2boUn97wl+gyq3/
	cYClPOCYqD+L2tlhj9AMsOWjz7nTTH74UQ1TRl5lRBu4v4V7JNEsfsUMjohNQvWEcvysamUDbtT
	aGSLHZnISVjHVoMVjmTQ7L1duz7BrC2XCpoAlRIwM3owKvTUsxLDoxek7lMoGGx1UUFOvDJLR4t
	32lq5m9fwA8vb5kiI6b6n7CwKFoEseqDEsyGRYfXl
X-Google-Smtp-Source: AGHT+IHclpz0w0BdhFnnJJQiTZ6ZuPVAz4nSrLm/cqjyr4pJ+MB3dOMhMEDwHs5k3NHTbryrf7ZwIw==
X-Received: by 2002:a5d:648b:0:b0:38a:5ce8:df51 with SMTP id ffacd0b85a97d-38c51931b2cmr4609634f8f.2.1738220359569;
        Wed, 29 Jan 2025 22:59:19 -0800 (PST)
Message-ID: <ec1a28a9-cef1-45e3-9b71-30de5bf07d7f@suse.com>
Date: Thu, 30 Jan 2025 07:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Konrad Wilk
 <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
 <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
 <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
 <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
 <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
 <alpine.DEB.2.22.394.2501291401290.11632@ubuntu-linux-20-04-desktop>
 <827aceff-28ed-4922-b841-b7dd06c082b1@oracle.com>
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
In-Reply-To: <827aceff-28ed-4922-b841-b7dd06c082b1@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R9pSUZP1L7Z0s9E5YDFcGXjz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R9pSUZP1L7Z0s9E5YDFcGXjz
Content-Type: multipart/mixed; boundary="------------xDA2CyasAnQcwjbl1oDfweUl";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Konrad Wilk
 <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
Message-ID: <ec1a28a9-cef1-45e3-9b71-30de5bf07d7f@suse.com>
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
 <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
 <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
 <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
 <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
 <alpine.DEB.2.22.394.2501291401290.11632@ubuntu-linux-20-04-desktop>
 <827aceff-28ed-4922-b841-b7dd06c082b1@oracle.com>
In-Reply-To: <827aceff-28ed-4922-b841-b7dd06c082b1@oracle.com>

--------------xDA2CyasAnQcwjbl1oDfweUl
Content-Type: multipart/mixed; boundary="------------Kd30efzWJ5zAtpSsZKNw3Zjw"

--------------Kd30efzWJ5zAtpSsZKNw3Zjw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDEuMjUgMDY6MjcsIEhhcnNodmFyZGhhbiBKaGEgd3JvdGU6DQo+IA0KPiBPbiAz
MC8wMS8yNSAzOjMxIEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBXZWQs
IDI5IEphbiAyMDI1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+IE9uIDI5LjAxLjI1IDE5
OjM1LCBIYXJzaHZhcmRoYW4gSmhhIHdyb3RlOg0KPj4+PiBPbiAyOS8wMS8yNSA0OjUyIFBN
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4gT24gMjkuMDEuMjUgMTA6MTUsIEhhcnNo
dmFyZGhhbiBKaGEgd3JvdGU6DQo+Pj4+Pj4gT24gMjkvMDEvMjUgMjozNCBQTSwgR3JlZyBL
SCB3cm90ZToNCj4+Pj4+Pj4gT24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDI6Mjk6NDhQTSAr
MDUzMCwgSGFyc2h2YXJkaGFuIEpoYSB3cm90ZToNCj4+Pj4+Pj4+IEhpIEdyZWcsDQo+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4gT24gMjkvMDEvMjUgMjoxOCBQTSwgR3JlZyBLSCB3cm90ZToNCj4+
Pj4+Pj4+PiBPbiBXZWQsIEphbiAyOSwgMjAyNSBhdCAwMjoxMzozNFBNICswNTMwLCBIYXJz
aHZhcmRoYW4gSmhhIHdyb3RlOg0KPj4+Pj4+Pj4+PiBIaSB0aGVyZSwNCj4+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+Pj4gT24gMjkvMDEvMjUgMjowNSBQTSwgR3JlZyBLSCB3cm90ZToNCj4+Pj4+
Pj4+Pj4+IE9uIFdlZCwgSmFuIDI5LCAyMDI1IGF0IDAyOjAzOjUxUE0gKzA1MzAsIEhhcnNo
dmFyZGhhbiBKaGENCj4+Pj4+Pj4+Pj4+IHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+IEhpIEFsbCwN
Cj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+ICtzdGFibGUNCj4+Pj4+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4+Pj4+IFRoZXJlIHNlZW1zIHRvIGJlIHNvbWUgZm9ybWF0dGluZyBpc3N1ZXMgaW4g
bXkgbG9nIG91dHB1dC4gSQ0KPj4+Pj4+Pj4+Pj4+IGhhdmUNCj4+Pj4+Pj4+Pj4+PiBhdHRh
Y2hlZCBpdCBhcyBhIGZpbGUuDQo+Pj4+Pj4+Pj4+PiBDb25mdXNlZCwgd2hhdCBhcmUgeW91
IHdhbnRpbmcgdXMgdG8gZG8gaGVyZSBpbiB0aGUgc3RhYmxlDQo+Pj4+Pj4+Pj4+PiB0cmVl
Pw0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IHRoYW5rcywNCj4+Pj4+Pj4+Pj4+DQo+Pj4+
Pj4+Pj4+PiBncmVnIGstaA0KPj4+Pj4+Pj4+PiBTaW5jZSwgdGhpcyBpcyByZXByb2R1Y2li
bGUgb24gNS40LnkgSSBoYXZlIGFkZGVkIHN0YWJsZS4gVGhlDQo+Pj4+Pj4+Pj4+IGN1bHBy
aXQNCj4+Pj4+Pj4+Pj4gY29tbWl0IHdoaWNoIHVwb24gZ2V0dGluZyByZXZlcnRlZCBmaXhl
cyB0aGlzIGlzc3VlIGlzIGFsc28NCj4+Pj4+Pj4+Pj4gcHJlc2VudCBpbg0KPj4+Pj4+Pj4+
PiA1LjQueSBzdGFibGUuDQo+Pj4+Pj4+Pj4gV2hhdCBjdWxwcml0IGNvbW1pdD/CoCBJIHNl
ZSBubyBpbmZvcm1hdGlvbiBoZXJlIDooDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBSZW1lbWJl
ciwgdG9wLXBvc3RpbmcgaXMgZXZpbC4uLg0KPj4+Pj4+Pj4gTXkgYXBvbG9naWVzLA0KPj4+
Pj4+Pj4NCj4+Pj4+Pj4+IFRoZSBzdGFibGUgdGFnIHY1LjQuMjg5IHNlZW1zIHRvIGZhaWwg
dG8gYm9vdCB3aXRoIHRoZSBmb2xsb3dpbmcNCj4+Pj4+Pj4+IHByb21wdCBpbiBhbiBpbmZp
bml0ZSBsb29wOg0KPj4+Pj4+Pj4gW8KgwqAgMjQuNDI3MjE3XSBtZWdhcmFpZF9zYXMgMDAw
MDo2NTowMC4wOiBtZWdhc2FzX2J1aWxkX2lvX2Z1c2lvbg0KPj4+Pj4+Pj4gMzI3MyBzZ2Vf
Y291bnQgKC0xMikgaXMgb3V0IG9mIHJhbmdlLiBSYW5nZSBpczrCoCAwLTI1Ng0KPj4+Pj4+
Pj4NCj4+Pj4+Pj4+IFJldmVydGluZyB0aGUgZm9sbG93aW5nIHBhdGNoIHNlZW1zIHRvIGZp
eCB0aGUgaXNzdWU6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gc3RhYmxlLTUuNMKgwqDCoMKgwqAg
OiB2NS40LjI4NcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIDVkZjI5YTQ0NWYzYSB4ZW4v
c3dpb3RsYjoNCj4+Pj4+Pj4+IGFkZA0KPj4+Pj4+Pj4gYWxpZ25tZW50IGNoZWNrIGZvciBk
bWEgYnVmZmVycw0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEkgdHJpZWQgY2hhbmdpbmcgc3dpb3Rs
YiBncnViIGNvbW1hbmQgbGluZSBhcmd1bWVudHMgYnV0IHRoYXQgZGlkbid0DQo+Pj4+Pj4+
PiBzZWVtIHRvIGhlbHAgbXVjaCB1bmZvcnR1bmF0ZWx5IGFuZCB0aGUgZXJyb3Igd2FzIHNl
ZW4gYWdhaW4uDQo+Pj4+Pj4+Pg0KPj4+Pj4+PiBPaywgY2FuIHlvdSBzdWJtaXQgdGhpcyBy
ZXZlcnQgd2l0aCB0aGUgaW5mb3JtYXRpb24gYWJvdXQgd2h5IGl0DQo+Pj4+Pj4+IHNob3Vs
ZA0KPj4+Pj4+PiBub3QgYmUgaW5jbHVkZWQgaW4gdGhlIDUuNC55IHRyZWUgYW5kIGNjOiBl
dmVyeW9uZSBpbnZvbHZlZCBhbmQgdGhlbg0KPj4+Pj4+PiB3ZQ0KPj4+Pj4+PiB3aWxsIGJl
IGdsYWQgdG8gcXVldWUgaXQgdXAuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IHRoYW5rcywNCj4+Pj4+
Pj4NCj4+Pj4+Pj4gZ3JlZyBrLWgNCj4+Pj4+PiBUaGlzIG1pZ2h0IGJlIHJlcHJvZHVjaWJs
ZSBvbiBvdGhlciBzdGFibGUgdHJlZXMgYW5kIG1haW5saW5lIGFzIHdlbGwgc28NCj4+Pj4+
PiB3ZSB3aWxsIGdldCBpdCBmaXhlZCB0aGVyZSBhbmQgSSB3aWxsIHN1Ym1pdCB0aGUgbmVj
ZXNzYXJ5IGZpeCB0byBzdGFibGUNCj4+Pj4+PiB3aGVuIGV2ZXJ5dGhpbmcgaXMgc29ydGVk
IG91dCBvbiBtYWlubGluZS4NCj4+Pj4+IFJpZ2h0LiBKdXN0IHJldmVydGluZyBteSBwYXRj
aCB3aWxsIHRyYWRlIG9uZSBlcnJvciB3aXRoIGFub3RoZXIgb25lICh0aGUNCj4+Pj4+IG9u
ZSB3aGljaCB0cmlnZ2VyZWQgbWUgdG8gd3JpdGUgdGhlIHBhdGNoKS4NCj4+Pj4+DQo+Pj4+
PiBUaGVyZSBhcmUgdHdvIHBvc3NpYmxlIHdheXMgdG8gZml4IHRoZSBpc3N1ZToNCj4+Pj4+
DQo+Pj4+PiAtIGFsbG93IGxhcmdlciBETUEgYnVmZmVycyBpbiB4ZW4vc3dpb3RsYiAodG9k
YXkgMk1CIGFyZSB0aGUgbWF4Lg0KPj4+Pj4gc3VwcG9ydGVkDQo+Pj4+PiAgIMKgIHNpemUs
IHRoZSBtZWdhcmFpZF9zYXMgZHJpdmVyIHNlZW1zIHRvIGVmZmVjdGl2ZWx5IHJlcXVlc3Qg
NE1CKQ0KPj4+PiBUaGlzIHNlZW1zIHJlbGF0aXZlbHkgc2ltcGxlciB0byBpbXBsZW1lbnQg
YnV0IEknbSBub3Qgc3VyZSB3aGV0aGVyIGl0J3MNCj4+Pj4gdGhlIG1vc3Qgb3B0aW1hbCBh
cHByb2FjaA0KPj4+IEp1c3QgbWFraW5nIHRoZSBzdGF0aWMgYXJyYXkgbGFyZ2VyIHVzZWQg
dG8gaG9sZCB0aGUgZnJhbWUgbnVtYmVycyBmb3IgdGhlDQo+Pj4gYnVmZmVyIHNlZW1zIHRv
IGJlIGEgd2FzdGUgb2YgbWVtb3J5IGZvciBtb3N0IGNvbmZpZ3VyYXRpb25zLg0KPj4+DQo+
Pj4gSSdtIHRoaW5raW5nIG9mIGFuIGFsbG9jYXRlZCBhcnJheSB1c2luZyB0aGUgbWF4IG5l
ZWRlZCBzaXplIChyZXBsYWNlIGENCj4+PiBmb3JtZXIgYnVmZmVyIHdpdGggYSBsYXJnZXIg
b25lIGlmIG5lZWRlZCkuDQo+PiBZb3UgYXJlIHJlZmVycmluZyB0byBkaXNjb250aWdfZnJh
bWVzIGFuZCBNQVhfQ09OVElHX09SREVSIGluDQo+PiBhcmNoL3g4Ni94ZW4vbW11X3B2LmMs
IHJpZ2h0PyBJIGFtIG5vdCBzdXBlciBmYW1pbGlhciB3aXRoIHRoYXQgY29kZSBidXQNCj4+
IGl0IGxvb2tzIGxpa2UgYSBnb29kIHdheSB0byBnby4NCj4gDQo+IFRoaXMgcmVqZWN0ZWQg
cGF0Y2ggd29ya3Mgb24gTUFYX0NPTlRJR19PUkRFUiBhbmQgZG91YmxlcyB0aGUgYnVmZmVy
DQo+IHNpemUgYnV0IHRoYXQgaXMgdW5kZXNpcmFibGUgaW4gbW9zdCBzaXR1YXRpb25zOg0K
PiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yODk0N2Q0Zi1hYjMyLTRhNTct
OGRiYi1lMzdmYTQxODNhNjlAc3VzZS5jb20vdC8NCj4gDQo+IFdoYXQgbmVlZHMgdG8gYmUg
ZG9uZSBpcyB0aGUgYnVmZmVyIHNpemUgd2lsbCBvbmx5IGJlIGRvdWJsZWQgd2hlbiBuZWVk
ZWQuDQoNCkknbGwgd3JpdGUgYSBwYXRjaC4NCg0KDQpKdWVyZ2VuDQo=
--------------Kd30efzWJ5zAtpSsZKNw3Zjw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Kd30efzWJ5zAtpSsZKNw3Zjw--

--------------xDA2CyasAnQcwjbl1oDfweUl--

--------------R9pSUZP1L7Z0s9E5YDFcGXjz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmebI0YFAwAAAAAACgkQsN6d1ii/Ey9Q
7Qf+LWTnMYryvXfc4ZSxFaTHA/vVKwR7FlXapp5udMLr+N8+5naPL+r2+ehDFNFZxFTOa4YQJKrB
1+orHe8yNAeiJa1GxnKzAZCFKWErO4NMKob/u1UVfgktlth5/NU86mXs8tsBVhdgaE5oQpfKhboU
NFBXY3eFm7if2UZixmDxoMeeWQf8RCL31jGP56LhQx4HkAHx8myIsuW97wenlp1AqOW24WHkVjbq
u7y8HT+zagviFZ99iufjBc3dlrVz6tca36YwgLXbzzlAz0H8DqSkc5N2iUBnd6UiA+9nFmmINjXc
GliP7bzEZInw4m1q7ZUtS2oQW/OWYlISQ4gOCwY5rw==
=GzUk
-----END PGP SIGNATURE-----

--------------R9pSUZP1L7Z0s9E5YDFcGXjz--

