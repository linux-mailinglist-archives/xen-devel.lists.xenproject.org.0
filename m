Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75476A22CFF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 13:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879511.1289713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdTlR-0007dh-2f; Thu, 30 Jan 2025 12:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879511.1289713; Thu, 30 Jan 2025 12:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdTlQ-0007b8-Vb; Thu, 30 Jan 2025 12:35:20 +0000
Received: by outflank-mailman (input) for mailman id 879511;
 Thu, 30 Jan 2025 12:35:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oB=UW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tdTlO-0007b2-Vh
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 12:35:19 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7e2d40c-df06-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 13:35:16 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so455415f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 04:35:15 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cfccasm1865411f8f.92.2025.01.30.04.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 04:35:14 -0800 (PST)
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
X-Inumbo-ID: a7e2d40c-df06-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738240515; x=1738845315; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I927JtoZY1ZGIy4oBzZTc+NSe8DiCFpBKKs3zPkD0hc=;
        b=geIXiLHWENtZ5h3N1kEbHYYWQI0ltYMH6+rNvQSwpb+gB06BDE12sE2tOCwcHPASzj
         EIu5nsolA9IhofIzOei4PR6F6ww00WpWOiAm/+CPG6ZH8i0T73VACIUz2/MiYg/7tCdi
         leWNpBAGOXBdLBzn9wVC9TfIVFbeg/Z29b6o7FfNJ1ufkG6JNa8RmD4myxMpqCcd8ec/
         DNOKxSC9nembcbOOxdSDfEaIundMu/08tDmjjLCpP+YZTp0Q0gwmyxd/+FVorEGDrw9J
         vBSeGTacCwhjgzoTckcl4Pi4ul7Zm0RkwjVxaevV1vYbVGP6Uzzk4hkk2ez/tHVhNtM9
         wE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738240515; x=1738845315;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I927JtoZY1ZGIy4oBzZTc+NSe8DiCFpBKKs3zPkD0hc=;
        b=XdTBDzBuiGO+SP1BzcM75fIifR2aaNibpcSKTtccA18jIJiaHaZPZOL1dBN7O/LGzU
         fSlm4y55eGxzS/vED2Fg7FON/S73WIgs4a1OR7cb9BW+7ovLWXompmWNykRkuxq6aerL
         Ff55hMpvYhRbTqJAG9EO3rawCbZ3oG7uc9tHnuLi1yz4xvGaja8nBJzoUyF96jTruQcL
         XQlgzJAepBNZI8pjULcGFdKngw8ZOzoQ88ueHfjkxuRi6V7WNSk1GxIvIIXH9sd47jXR
         Hap7psVrgsdJiYeJ21keOavDf5QDX7JvC22L8QSpdYgKr2qp3N5BoVSVqgsa5ryv0tEw
         eTPg==
X-Forwarded-Encrypted: i=1; AJvYcCW2cjCUs+ddrWarmVtT/2WUnP+++UtzqDfpbL5BIs9YaUvrf2jmgYZ44N17xHgyrHOepPNXXBKPgp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyErkhXg3SlJSIsjpoAb7hh2DnVanxRbhh094BKPDkq4FZ7Nmh/
	0cHf3RuJZZE6n4NE8YkFqIV1HrzLwQPB6UFKVkeUT/KaXvxoqeEEurUVOAFCKVs=
X-Gm-Gg: ASbGncvBESb6vGyEtvdZ3JUImMIzHvF5iS/iAyHaIZySedffzAJR+g2024X1aSz0VZI
	o7xMdH79SHhlI5MTUsqqqZ536H5iUWWQ0K3KsY0eLZgjVtX82wroUAN723AblxpLlHpNupJexfI
	QAJQ8CJY1NCHc5qGSUcpcIsaVWjYT/pY6WflEc/15qAH07+AhoxTy8YM0EGjR9USCZppOAfg6AN
	tW+uCu1zxMbROiIuPc3/yEA3QWmpYqaqfa+lSDgE8KyB/2TN0oOEkS+VeGTx4hvHy4MjsWQI2tf
	B9Q7cj329sTCaEqN6pqRWPiWpG8SCGDiW8kR/GRn9weePL/NgRuRvXL+r/QMf3WuZ3YdwXEDUop
	9hHl1RgPIFDqztC41z/yjxomc4pOOWIBCtxHM2W32
X-Google-Smtp-Source: AGHT+IHvv88m4Iy886HAnkleAo7jlkX11/5fps0cYyXOR1kTjfxaxzK9MHAnaxyWcVmrWAe0DAkNYQ==
X-Received: by 2002:a5d:47c3:0:b0:386:3327:4f21 with SMTP id ffacd0b85a97d-38c5a9bf70dmr2988462f8f.27.1738240514513;
        Thu, 30 Jan 2025 04:35:14 -0800 (PST)
Message-ID: <5a7d969b-b2ab-4fac-b95e-4a536e2c8d5c@suse.com>
Date: Thu, 30 Jan 2025 13:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
 <686986a0-c981-4aa3-ae88-92a34368129e@oracle.com>
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
In-Reply-To: <686986a0-c981-4aa3-ae88-92a34368129e@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t5hcqb4cuk82BpuLqVi2z6GT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t5hcqb4cuk82BpuLqVi2z6GT
Content-Type: multipart/mixed; boundary="------------DOOB4yTA8AXW81Ct04V23JIP";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
Message-ID: <5a7d969b-b2ab-4fac-b95e-4a536e2c8d5c@suse.com>
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
 <686986a0-c981-4aa3-ae88-92a34368129e@oracle.com>
In-Reply-To: <686986a0-c981-4aa3-ae88-92a34368129e@oracle.com>

--------------DOOB4yTA8AXW81Ct04V23JIP
Content-Type: multipart/mixed; boundary="------------KM7UcZ5u8nA4LipWLXgJ5FBE"

--------------KM7UcZ5u8nA4LipWLXgJ5FBE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDEuMjUgMTk6NDYsIEhhcnNodmFyZGhhbiBKaGEgd3JvdGU6DQo+IA0KPiBPbiAz
MC8wMS8yNSAxMjoxMyBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDI5LjAxLjI1
IDE5OjM1LCBIYXJzaHZhcmRoYW4gSmhhIHdyb3RlOg0KPj4+DQo+Pj4gT24gMjkvMDEvMjUg
NDo1MiBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMjkuMDEuMjUgMTA6MTUs
IEhhcnNodmFyZGhhbiBKaGEgd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4gT24gMjkvMDEvMjUgMjoz
NCBQTSwgR3JlZyBLSCB3cm90ZToNCj4+Pj4+PiBPbiBXZWQsIEphbiAyOSwgMjAyNSBhdCAw
MjoyOTo0OFBNICswNTMwLCBIYXJzaHZhcmRoYW4gSmhhIHdyb3RlOg0KPj4+Pj4+PiBIaSBH
cmVnLA0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbiAyOS8wMS8yNSAyOjE4IFBNLCBHcmVnIEtIIHdy
b3RlOg0KPj4+Pj4+Pj4gT24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDI6MTM6MzRQTSArMDUz
MCwgSGFyc2h2YXJkaGFuIEpoYSB3cm90ZToNCj4+Pj4+Pj4+PiBIaSB0aGVyZSwNCj4+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4+IE9uIDI5LzAxLzI1IDI6MDUgUE0sIEdyZWcgS0ggd3JvdGU6DQo+
Pj4+Pj4+Pj4+IE9uIFdlZCwgSmFuIDI5LCAyMDI1IGF0IDAyOjAzOjUxUE0gKzA1MzAsIEhh
cnNodmFyZGhhbiBKaGEgd3JvdGU6DQo+Pj4+Pj4+Pj4+PiBIaSBBbGwsDQo+Pj4+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+Pj4gK3N0YWJsZQ0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IFRoZXJl
IHNlZW1zIHRvIGJlIHNvbWUgZm9ybWF0dGluZyBpc3N1ZXMgaW4gbXkgbG9nIG91dHB1dC4g
SQ0KPj4+Pj4+Pj4+Pj4gaGF2ZQ0KPj4+Pj4+Pj4+Pj4gYXR0YWNoZWQgaXQgYXMgYSBmaWxl
Lg0KPj4+Pj4+Pj4+PiBDb25mdXNlZCwgd2hhdCBhcmUgeW91IHdhbnRpbmcgdXMgdG8gZG8g
aGVyZSBpbiB0aGUgc3RhYmxlIHRyZWU/DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IHRoYW5r
cywNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gZ3JlZyBrLWgNCj4+Pj4+Pj4+PiBTaW5jZSwg
dGhpcyBpcyByZXByb2R1Y2libGUgb24gNS40LnkgSSBoYXZlIGFkZGVkIHN0YWJsZS4gVGhl
DQo+Pj4+Pj4+Pj4gY3VscHJpdA0KPj4+Pj4+Pj4+IGNvbW1pdCB3aGljaCB1cG9uIGdldHRp
bmcgcmV2ZXJ0ZWQgZml4ZXMgdGhpcyBpc3N1ZSBpcyBhbHNvDQo+Pj4+Pj4+Pj4gcHJlc2Vu
dCBpbg0KPj4+Pj4+Pj4+IDUuNC55IHN0YWJsZS4NCj4+Pj4+Pj4+IFdoYXQgY3VscHJpdCBj
b21taXQ/wqAgSSBzZWUgbm8gaW5mb3JtYXRpb24gaGVyZSA6KA0KPj4+Pj4+Pj4NCj4+Pj4+
Pj4+IFJlbWVtYmVyLCB0b3AtcG9zdGluZyBpcyBldmlsLi4uDQo+Pj4+Pj4+IE15IGFwb2xv
Z2llcywNCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhlIHN0YWJsZSB0YWcgdjUuNC4yODkgc2VlbXMg
dG8gZmFpbCB0byBib290IHdpdGggdGhlIGZvbGxvd2luZw0KPj4+Pj4+PiBwcm9tcHQgaW4g
YW4gaW5maW5pdGUgbG9vcDoNCj4+Pj4+Pj4gW8KgwqAgMjQuNDI3MjE3XSBtZWdhcmFpZF9z
YXMgMDAwMDo2NTowMC4wOiBtZWdhc2FzX2J1aWxkX2lvX2Z1c2lvbg0KPj4+Pj4+PiAzMjcz
IHNnZV9jb3VudCAoLTEyKSBpcyBvdXQgb2YgcmFuZ2UuIFJhbmdlIGlzOsKgIDAtMjU2DQo+
Pj4+Pj4+DQo+Pj4+Pj4+IFJldmVydGluZyB0aGUgZm9sbG93aW5nIHBhdGNoIHNlZW1zIHRv
IGZpeCB0aGUgaXNzdWU6DQo+Pj4+Pj4+DQo+Pj4+Pj4+IHN0YWJsZS01LjTCoMKgwqDCoMKg
IDogdjUuNC4yODXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSA1ZGYyOWE0NDVmM2ENCj4+
Pj4+Pj4geGVuL3N3aW90bGI6IGFkZA0KPj4+Pj4+PiBhbGlnbm1lbnQgY2hlY2sgZm9yIGRt
YSBidWZmZXJzDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEkgdHJpZWQgY2hhbmdpbmcgc3dpb3RsYiBn
cnViIGNvbW1hbmQgbGluZSBhcmd1bWVudHMgYnV0IHRoYXQgZGlkbid0DQo+Pj4+Pj4+IHNl
ZW0gdG8gaGVscCBtdWNoIHVuZm9ydHVuYXRlbHkgYW5kIHRoZSBlcnJvciB3YXMgc2VlbiBh
Z2Fpbi4NCj4+Pj4+Pj4NCj4+Pj4+PiBPaywgY2FuIHlvdSBzdWJtaXQgdGhpcyByZXZlcnQg
d2l0aCB0aGUgaW5mb3JtYXRpb24gYWJvdXQgd2h5IGl0DQo+Pj4+Pj4gc2hvdWxkDQo+Pj4+
Pj4gbm90IGJlIGluY2x1ZGVkIGluIHRoZSA1LjQueSB0cmVlIGFuZCBjYzogZXZlcnlvbmUg
aW52b2x2ZWQgYW5kDQo+Pj4+Pj4gdGhlbiB3ZQ0KPj4+Pj4+IHdpbGwgYmUgZ2xhZCB0byBx
dWV1ZSBpdCB1cC4NCj4+Pj4+Pg0KPj4+Pj4+IHRoYW5rcywNCj4+Pj4+Pg0KPj4+Pj4+IGdy
ZWcgay1oDQo+Pj4+Pg0KPj4+Pj4gVGhpcyBtaWdodCBiZSByZXByb2R1Y2libGUgb24gb3Ro
ZXIgc3RhYmxlIHRyZWVzIGFuZCBtYWlubGluZSBhcw0KPj4+Pj4gd2VsbCBzbw0KPj4+Pj4g
d2Ugd2lsbCBnZXQgaXQgZml4ZWQgdGhlcmUgYW5kIEkgd2lsbCBzdWJtaXQgdGhlIG5lY2Vz
c2FyeSBmaXggdG8NCj4+Pj4+IHN0YWJsZQ0KPj4+Pj4gd2hlbiBldmVyeXRoaW5nIGlzIHNv
cnRlZCBvdXQgb24gbWFpbmxpbmUuDQo+Pj4+DQo+Pj4+IFJpZ2h0LiBKdXN0IHJldmVydGlu
ZyBteSBwYXRjaCB3aWxsIHRyYWRlIG9uZSBlcnJvciB3aXRoIGFub3RoZXIgb25lDQo+Pj4+
ICh0aGUNCj4+Pj4gb25lIHdoaWNoIHRyaWdnZXJlZCBtZSB0byB3cml0ZSB0aGUgcGF0Y2gp
Lg0KPj4+Pg0KPj4+PiBUaGVyZSBhcmUgdHdvIHBvc3NpYmxlIHdheXMgdG8gZml4IHRoZSBp
c3N1ZToNCj4+Pj4NCj4+Pj4gLSBhbGxvdyBsYXJnZXIgRE1BIGJ1ZmZlcnMgaW4geGVuL3N3
aW90bGIgKHRvZGF5IDJNQiBhcmUgdGhlIG1heC4NCj4+Pj4gc3VwcG9ydGVkDQo+Pj4+ICDC
oMKgIHNpemUsIHRoZSBtZWdhcmFpZF9zYXMgZHJpdmVyIHNlZW1zIHRvIGVmZmVjdGl2ZWx5
IHJlcXVlc3QgNE1CKQ0KPj4+DQo+Pj4gVGhpcyBzZWVtcyByZWxhdGl2ZWx5IHNpbXBsZXIg
dG8gaW1wbGVtZW50IGJ1dCBJJ20gbm90IHN1cmUgd2hldGhlciBpdCdzDQo+Pj4gdGhlIG1v
c3Qgb3B0aW1hbCBhcHByb2FjaA0KPj4NCj4+IEp1c3QgbWFraW5nIHRoZSBzdGF0aWMgYXJy
YXkgbGFyZ2VyIHVzZWQgdG8gaG9sZCB0aGUgZnJhbWUgbnVtYmVycyBmb3INCj4+IHRoZQ0K
Pj4gYnVmZmVyIHNlZW1zIHRvIGJlIGEgd2FzdGUgb2YgbWVtb3J5IGZvciBtb3N0IGNvbmZp
Z3VyYXRpb25zLg0KPiBZZXAgZGVmaW5pdGVseSBub3QgcmVxdWlyZWQgaW4gbW9zdCBjYXNl
cy4NCj4+DQo+PiBJJ20gdGhpbmtpbmcgb2YgYW4gYWxsb2NhdGVkIGFycmF5IHVzaW5nIHRo
ZSBtYXggbmVlZGVkIHNpemUgKHJlcGxhY2UgYQ0KPj4gZm9ybWVyIGJ1ZmZlciB3aXRoIGEg
bGFyZ2VyIG9uZSBpZiBuZWVkZWQpLg0KPiANCj4gVGhpcyBzZWVtcyBsaWtlIHRoZSByaWdo
dCB3YXkgdG8gZ28uDQoNCkNhbiB5b3UgdHJ5IHRoZSBhdHRhY2hlZCBwYXRjaCwgcGxlYXNl
PyBJIGRvbid0IGhhdmUgYSBzeXN0ZW0gYXQgaGFuZA0Kc2hvd2luZyB0aGUgcHJvYmxlbS4N
Cg0KDQpKdWVyZ2VuDQo=
--------------KM7UcZ5u8nA4LipWLXgJ5FBE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-x86-xen-allow-larger-contiguous-memory-regions-in-PV.patch"
Content-Disposition: attachment;
 filename*0="0001-x86-xen-allow-larger-contiguous-memory-regions-in-PV.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjZmY0M2U5OTdmNzlhOTVkYzQ0ZTAyZGViYWVhZmU1ZjEyN2Y0MGJiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IFRodSwgMzAgSmFuIDIwMjUgMDk6NTY6NTcgKzAxMDAKU3ViamVjdDogW1BBVENI
XSB4ODYveGVuOiBhbGxvdyBsYXJnZXIgY29udGlndW91cyBtZW1vcnkgcmVnaW9ucyBpbiBQ
ViBndWVzdHMKClRvZGF5IGEgUFYgZ3Vlc3QgKGluY2x1ZGluZyBkb20wKSBjYW4gY3JlYXRl
IDJNQiBjb250aWd1b3VzIG1lbW9yeQpyZWdpb25zIGZvciBETUEgYnVmZmVycyBhdCBtYXgu
IFRoaXMgaGFzIGxlZCB0byBwcm9ibGVtcyBhdCBsZWFzdAp3aXRoIHRoZSBtZWdhcmFpZF9z
YXMgZHJpdmVyLCB3aGljaCB3YW50cyB0byBhbGxvY2F0ZSBhIDIuM01CIERNQQpidWZmZXIu
CgpUaGUgbGltaXRpbmcgZmFjdG9yIGlzIHRoZSBmcmFtZSBhcnJheSB1c2VkIHRvIGRvIHRo
ZSBoeXBlcmNhbGwgZm9yCm1ha2luZyB0aGUgbWVtb3J5IGNvbnRpZ3VvdXMsIHdoaWNoIGhh
cyA1MTIgZW50cmllcyBhbmQgaXMganVzdCBhCnN0YXRpYyBhcnJheSBpbiBtbXVfcHYuYy4K
CkluIGNhc2UgYSBjb250aWd1b3VzIG1lbW9yeSBhcmVhIGxhcmdlciB0aGFuIHRoZSBpbml0
aWFsbHkgc3VwcG9ydGVkCjJNQiBpcyByZXF1ZXN0ZWQsIGFsbG9jYXRlIGEgbGFyZ2VyIGJ1
ZmZlciBmb3IgdGhlIGZyYW1lIGxpc3QuIE5vdGUKdGhhdCBzdWNoIGFuIGFsbG9jYXRpb24g
aXMgdHJpZWQgb25seSBhZnRlciBtZW1vcnkgbWFuYWdlbWVudCBoYXMgYmVlbgppbml0aWFs
aXplZCBwcm9wZXJseSwgd2hpY2ggaXMgdGVzdGVkIHZpYSB0aGUgZWFybHlfYm9vdF9pcnFz
X2Rpc2FibGVkCmZsYWcuCgpGaXhlczogOWY0MGVjODRhNzk3ICgieGVuL3N3aW90bGI6IGFk
ZCBhbGlnbm1lbnQgY2hlY2sgZm9yIGRtYSBidWZmZXJzIikKU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KTm90ZSB0aGF0IHRoZSAiRml4ZXM6
IiB0YWcgaXMgbm90IHJlYWxseSBjb3JyZWN0LCBhcyB0aGF0IHBhdGNoIGRpZG4ndAppbnRy
b2R1Y2UgdGhlIHByb2JsZW0sIGJ1dCByYXRoZXIgbWFkZSBpdCB2aXNpYmxlLiBPVE9IIGl0
IGlzIHRoZSBiZXN0CmluZGljYXRvciB3ZSBoYXZlIHRvIGlkZW50aWZ5IGtlcm5lbCB2ZXJz
aW9ucyB0aGlzIHBhdGNoIHNob3VsZCBiZQpiYWNrcG9ydGVkIHRvLgotLS0KIGFyY2gveDg2
L3hlbi9tbXVfcHYuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYyBiL2FyY2gveDg2L3hl
bi9tbXVfcHYuYwppbmRleCA1NWE0OTk2ZDBjMDQuLjYyYWVjMjliODE3NCAxMDA2NDQKLS0t
IGEvYXJjaC94ODYveGVuL21tdV9wdi5jCisrKyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYwpA
QCAtMjIwMCw4ICsyMjAwLDEwIEBAIHZvaWQgX19pbml0IHhlbl9pbml0X21tdV9vcHModm9p
ZCkKIH0KIAogLyogUHJvdGVjdGVkIGJ5IHhlbl9yZXNlcnZhdGlvbl9sb2NrLiAqLwotI2Rl
ZmluZSBNQVhfQ09OVElHX09SREVSIDkgLyogMk1CICovCi1zdGF0aWMgdW5zaWduZWQgbG9u
ZyBkaXNjb250aWdfZnJhbWVzWzE8PE1BWF9DT05USUdfT1JERVJdOworI2RlZmluZSBNSU5f
Q09OVElHX09SREVSIDkgLyogMk1CICovCitzdGF0aWMgdW5zaWduZWQgaW50IGRpc2NvbnRp
Z19mcmFtZXNfb3JkZXIgPSBNSU5fQ09OVElHX09SREVSOworc3RhdGljIHVuc2lnbmVkIGxv
bmcgZGlzY29udGlnX2ZyYW1lc19lYXJseVsxVUwgPDwgTUlOX0NPTlRJR19PUkRFUl07Citz
dGF0aWMgdW5zaWduZWQgbG9uZyAqZGlzY29udGlnX2ZyYW1lcyA9IGRpc2NvbnRpZ19mcmFt
ZXNfZWFybHk7CiAKICNkZWZpbmUgVk9JRF9QVEUgKG1mbl9wdGUoMCwgX19wZ3Byb3QoMCkp
KQogc3RhdGljIHZvaWQgeGVuX3phcF9wZm5fcmFuZ2UodW5zaWduZWQgbG9uZyB2YWRkciwg
dW5zaWduZWQgaW50IG9yZGVyLApAQCAtMjMxOSwxOCArMjMyMSw0NCBAQCBpbnQgeGVuX2Ny
ZWF0ZV9jb250aWd1b3VzX3JlZ2lvbihwaHlzX2FkZHJfdCBwc3RhcnQsIHVuc2lnbmVkIGlu
dCBvcmRlciwKIAkJCQkgdW5zaWduZWQgaW50IGFkZHJlc3NfYml0cywKIAkJCQkgZG1hX2Fk
ZHJfdCAqZG1hX2hhbmRsZSkKIHsKLQl1bnNpZ25lZCBsb25nICppbl9mcmFtZXMgPSBkaXNj
b250aWdfZnJhbWVzLCBvdXRfZnJhbWU7CisJdW5zaWduZWQgbG9uZyAqaW5fZnJhbWVzLCBv
dXRfZnJhbWU7CisJdW5zaWduZWQgbG9uZyAqbmV3X2FycmF5LCAqb2xkX2FycmF5OwogCXVu
c2lnbmVkIGxvbmcgIGZsYWdzOwogCWludCAgICAgICAgICAgIHN1Y2Nlc3M7CiAJdW5zaWdu
ZWQgbG9uZyB2c3RhcnQgPSAodW5zaWduZWQgbG9uZylwaHlzX3RvX3ZpcnQocHN0YXJ0KTsK
IAotCWlmICh1bmxpa2VseShvcmRlciA+IE1BWF9DT05USUdfT1JERVIpKQotCQlyZXR1cm4g
LUVOT01FTTsKKwlpZiAodW5saWtlbHkob3JkZXIgPiBkaXNjb250aWdfZnJhbWVzX29yZGVy
KSkgeworCQlpZiAoZWFybHlfYm9vdF9pcnFzX2Rpc2FibGVkKQorCQkJcmV0dXJuIC1FTk9N
RU07CisKKwkJbmV3X2FycmF5ID0gdm1hbGxvYyhzaXplb2YodW5zaWduZWQgbG9uZykgKiAo
MVVMIDw8IG9yZGVyKSk7CisKKwkJaWYgKCFuZXdfYXJyYXkpCisJCQlyZXR1cm4gLUVOT01F
TTsKKworCQlzcGluX2xvY2tfaXJxc2F2ZSgmeGVuX3Jlc2VydmF0aW9uX2xvY2ssIGZsYWdz
KTsKKworCQlpZiAob3JkZXIgPiBkaXNjb250aWdfZnJhbWVzX29yZGVyKSB7CisJCQlpZiAo
ZGlzY29udGlnX2ZyYW1lcyA9PSBkaXNjb250aWdfZnJhbWVzX2Vhcmx5KQorCQkJCW9sZF9h
cnJheSA9IE5VTEw7CisJCQllbHNlCisJCQkJb2xkX2FycmF5ID0gZGlzY29udGlnX2ZyYW1l
czsKKwkJCWRpc2NvbnRpZ19mcmFtZXMgPSBuZXdfYXJyYXk7CisJCQlkaXNjb250aWdfZnJh
bWVzX29yZGVyID0gb3JkZXI7CisJCX0gZWxzZQorCQkJb2xkX2FycmF5ID0gbmV3X2FycmF5
OworCisJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnhlbl9yZXNlcnZhdGlvbl9sb2NrLCBm
bGFncyk7CisKKwkJdmZyZWUob2xkX2FycmF5KTsKKwl9CiAKIAltZW1zZXQoKHZvaWQgKikg
dnN0YXJ0LCAwLCBQQUdFX1NJWkUgPDwgb3JkZXIpOwogCiAJc3Bpbl9sb2NrX2lycXNhdmUo
Jnhlbl9yZXNlcnZhdGlvbl9sb2NrLCBmbGFncyk7CiAKKwlpbl9mcmFtZXMgPSBkaXNjb250
aWdfZnJhbWVzOworCiAJLyogMS4gWmFwIGN1cnJlbnQgUFRFcywgcmVtZW1iZXJpbmcgTUZO
cy4gKi8KIAl4ZW5femFwX3Bmbl9yYW5nZSh2c3RhcnQsIG9yZGVyLCBpbl9mcmFtZXMsIE5V
TEwpOwogCkBAIC0yMzU0LDEyICsyMzgyLDEyIEBAIGludCB4ZW5fY3JlYXRlX2NvbnRpZ3Vv
dXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyLAogCiB2
b2lkIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwg
dW5zaWduZWQgaW50IG9yZGVyKQogewotCXVuc2lnbmVkIGxvbmcgKm91dF9mcmFtZXMgPSBk
aXNjb250aWdfZnJhbWVzLCBpbl9mcmFtZTsKKwl1bnNpZ25lZCBsb25nICpvdXRfZnJhbWVz
LCBpbl9mcmFtZTsKIAl1bnNpZ25lZCBsb25nICBmbGFnczsKIAlpbnQgc3VjY2VzczsKIAl1
bnNpZ25lZCBsb25nIHZzdGFydDsKIAotCWlmICh1bmxpa2VseShvcmRlciA+IE1BWF9DT05U
SUdfT1JERVIpKQorCWlmICh1bmxpa2VseShvcmRlciA+IGRpc2NvbnRpZ19mcmFtZXNfb3Jk
ZXIpKQogCQlyZXR1cm47CiAKIAl2c3RhcnQgPSAodW5zaWduZWQgbG9uZylwaHlzX3RvX3Zp
cnQocHN0YXJ0KTsKQEAgLTIzNjcsNiArMjM5NSw4IEBAIHZvaWQgeGVuX2Rlc3Ryb3lfY29u
dGlndW91c19yZWdpb24ocGh5c19hZGRyX3QgcHN0YXJ0LCB1bnNpZ25lZCBpbnQgb3JkZXIp
CiAKIAlzcGluX2xvY2tfaXJxc2F2ZSgmeGVuX3Jlc2VydmF0aW9uX2xvY2ssIGZsYWdzKTsK
IAorCW91dF9mcmFtZXMgPSBkaXNjb250aWdfZnJhbWVzOworCiAJLyogMS4gRmluZCBzdGFy
dCBNRk4gb2YgY29udGlndW91cyBleHRlbnQuICovCiAJaW5fZnJhbWUgPSB2aXJ0X3RvX21m
bigodm9pZCAqKXZzdGFydCk7CiAKLS0gCjIuNDMuMAoK
--------------KM7UcZ5u8nA4LipWLXgJ5FBE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------KM7UcZ5u8nA4LipWLXgJ5FBE--

--------------DOOB4yTA8AXW81Ct04V23JIP--

--------------t5hcqb4cuk82BpuLqVi2z6GT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmebcgEFAwAAAAAACgkQsN6d1ii/Ey8O
2wf+KYF/+CGuTKb6asqmgU1uxGGhH8Dp53bAr5yPSpBU+7WPJdshtWLweZZdhk06j64ROxAkHemZ
ElulKH8aaLY9BJ5xwomAt21tA8PCYSRF5a0ZTzTu55jkGMCt3tjMEqj96wX92ggBvBK3+uLltH9x
mBlWofnoSAAtGLTBvufe0rlM18L3US8YRUgYCtuFxdE95uutw9uC/81zzzT3adKp4zvV1CDiJ4h6
6mmJDUTGPoyX2xYBEwnqQ6k87n/HXcFKUPZcmQD5e7Uo5y+VL3otOHf2HqNZ2pLjBdR8k7ZwAL12
LmU2XDBY6L8GYvb+OrGDHL8Ih782DMjHdil56H3DnA==
=7EMz
-----END PGP SIGNATURE-----

--------------t5hcqb4cuk82BpuLqVi2z6GT--

