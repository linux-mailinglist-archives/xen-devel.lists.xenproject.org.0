Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ5sMf4Z5mkprgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 14:20:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0990B42A970
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 14:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285765.1567009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEnbH-0003Ce-Gd; Mon, 20 Apr 2026 12:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285765.1567009; Mon, 20 Apr 2026 12:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEnbH-0003AV-Ds; Mon, 20 Apr 2026 12:19:39 +0000
Received: by outflank-mailman (input) for mailman id 1285765;
 Mon, 20 Apr 2026 12:19:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wEnbF-0003AP-Ag
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 12:19:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEnbE-008Kpx-Ng
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:19:36 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e619cb-e002-0a2a0a5209dd-0a2a45078092-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 14:19:36 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e619d8-229c-0a2a45070019-d155d02fe17e-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 14:19:36 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6746d0b2b4aso2335510a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 05:19:36 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-672c4d5babcsm2026949a12.23.2026.04.20.05.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 05:19:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1776687576; x=1777292376; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MHRIw34ZrmzU/Sj1GJ2quPOQCirKAg0tT1ITdGCo6pY=;
        b=C9RKSFcw+9VKP62MGkvE3MxJOarxo/DptP8CiC5gOPV+WhVpdfSJoKffUx/66qdvlT
         LKagjMjMo4PdeJjsEWNqPHZbR/wyxxrgN91yIkm6HnVKmSu/rPQVVgI0a4moE5e5E4PB
         SibPF9KwGDgk5IGHa2T+1cFYlq9fuulm1UUQ+152fTbY0h0Jy02SRfRVpX26KYidOLeK
         vDsLpeGh8/fIBBz5/L65u9J5txTg+ozQ1qpZwXA/CA2gdK5DLYnF6h+lpn0gR41hLf5X
         SFELh7tWLpAR4D/tLk00gFH7nbziKDsu75ha5xUfG6OCPeZbJsdMtF8QLMmhajCloAOn
         jo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776687576; x=1777292376;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHRIw34ZrmzU/Sj1GJ2quPOQCirKAg0tT1ITdGCo6pY=;
        b=MBXlBBMCOGbR7jOJO1qA91HWFCL/6PwXz1Tw7F6ln/6nuTnGzwkiMKYINZBraH7se5
         Brg/AW1vxsYSIxvCGRhFlmcqOoRJsw4GyiB/Z55hzt8ACWcCdHMwNSKp2EJayeKJPSE5
         F5luOzeoLLpusWZENtjDvfTC5N28lvZlk+vpp+H9d27qUy0mGsFxP/s1wvk+/aUquKLh
         sqSuS25KTuYnWHoFUFc4CFmcH40vkGD3ZdWQ3Kwsik7gIF1YUkm+8AV30Laka3G4BMMN
         oh6TKTdDv+s2UfAXlmWOifkC5Ux/DAEHxUiqGd9kDb4htz988sJoOtfuYNLjGqIWy8za
         BKiw==
X-Gm-Message-State: AOJu0Yxiu6Z3/l2hhRUWmZzDKsbg1EoUIDYAvOTlWG406iVOocc9RE6q
	aOQpIbGRyKLtnC4tVbWcu7V2lV0AQCu+fZoCyBNzP07Yfe2EmN1EBIugTvIg6rS2u1I=
X-Gm-Gg: AeBDiesdgwV2efo9vU1FY73UMV3DaGveLS+7h/+/3D6WsXhnNr2vVnHUsi3xvix3cyS
	6uAY9aQFMe7yxjuIMQ1xbaLXhmbBlb6pxWYTC7PD6TNGjRv0RzwEhz3E3+Y71Y2JSxpEK748qqA
	HDkQTE0N281S9hTH5IpYYq2Q2Tl13Bi0O0Vne/dYTT1QEM15+pZouOLuU90w0snh/FVpr0uLzI2
	qHPZ5ISYJYA1SrTcXHmNDYDkPyLFpc+bm25ieT9VmSGOZU95SR4HenrbrYc/iiaJZVUob8nMeXX
	bEVEga9LS2GOvvNWJD4qKRJvTJQ2uAO3XmC+Qf07BN+OPTzPpKL7ycw+G1wQGVYUCKjelwCx2G8
	EaDiYNtLo2MnUb6DWrYzKHmUrnJT1nVv3uWfxgYoda6OZ1K2J3Y/jJEuU3PK67bcc70PmqeWspD
	OOv/HM6I7Ymi4ZpTfzjoL8SFcY8okWnllV2cxT+5k5UADD3ZEtPcCx4Rza5qF2SoSKG3e4B5Tte
	DhZBBoZHEOm46n/ZEluY17t4tVeBLr1uYG2AnBpG2fOUpm04NCh96xzTdIV5+HC
X-Received: by 2002:a05:6402:24a2:b0:670:8d90:e861 with SMTP id 4fb4d7f45d1cf-672bfd82177mr5622166a12.6.1776687575858;
        Mon, 20 Apr 2026 05:19:35 -0700 (PDT)
Message-ID: <f6cf1d46-9d2e-4b52-a6b9-fb45d01b874f@suse.com>
Date: Mon, 20 Apr 2026 14:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device DMA
 memory
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
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
In-Reply-To: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------034tgJUdS8obTrCAMQuKOO5H"
X-purgate-ID: tlsNG-ef75cf/1776687576-1585EC48-5F5CF2C9/0/0
X-purgate-type: clean
X-purgate-size: 8412
X-Spamd-Result: default: False [-1.42 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.67)[subject];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:peng.fan@nxp.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0990B42A970
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------034tgJUdS8obTrCAMQuKOO5H
Content-Type: multipart/mixed; boundary="------------xAm466dmUFDzKs0FzPVhHxO0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Message-ID: <f6cf1d46-9d2e-4b52-a6b9-fb45d01b874f@suse.com>
Subject: Re: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device DMA
 memory
References: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
In-Reply-To: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>

--------------xAm466dmUFDzKs0FzPVhHxO0
Content-Type: multipart/mixed; boundary="------------y5RAGzWBaBlt2a08ULXbC0V9"

--------------y5RAGzWBaBlt2a08ULXbC0V9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDQuMjYgMTc6MDgsIFBlbmcgRmFuIChPU1MpIHdyb3RlOg0KPiBGcm9tOiBQZW5n
IEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gDQo+IE9uIEFSTTY0LCBhcmNoX3N5bmNfZG1h
X2Zvcl97Y3B1LGRldmljZX0oKSBhc3N1bWVzIHRoYXQgdGhlDQo+IHBoeXNpY2FsIGFkZHJl
c3MgcGFzc2VkIGluIHJlZmVycyB0byBub3JtYWwgUkFNIHRoYXQgaXMgcGFydCBvZiB0aGUN
Cj4ga2VybmVsIGxpbmVhcihkaXJlY3QpIG1hcHBpbmcsIGFzIGl0IHVuY29uZGl0aW9uYWxs
eSBkZXJpdmVzIGEgQ1BVDQo+IHZpcnR1YWwgYWRkcmVzcyB2aWEgcGh5c190b192aXJ0KCku
DQo+IA0KPiBXaXRoIFhlbiBzd2lvdGxiLCBkZXZpY2VzIG1heSB1c2UgcGVyLWRldmljZSBj
b2hlcmVudCBETUEgbWVtb3J5LA0KPiBzdWNoIGFzIHJlc2VydmVkLW1lbW9yeSByZWdpb25z
IGRlc2NyaWJlZCBieSAnc2hhcmVkLWRtYS1wb29sJywNCj4gd2hpY2ggYXJlIGFzc2lnbmVk
IHRvIGRldi0+ZG1hX21lbS4gVGhlc2UgcmVnaW9ucyBtYXkgYmUgbWFya2VkDQo+IG5vLW1h
cCBpbiBEVCBhbmQgdGhlcmVmb3JlIGFyZSBub3QgcGFydCBvZiB0aGUga2VybmVsIGxpbmVh
ciBtYXAuDQo+IEluIHN1Y2ggY2FzZXMsIHBmbl92YWxpZCgpIHN0aWxsIHJldHVybnMgdHJ1
ZSwgYnV0IHBoeXNfdG9fdmlydCgpDQo+IGlzIG5vdCB2YWxpZCBhbmQgY2FjaGUgbWFpbnRl
bmFuY2UgdmlhIGFyY2hfc3luY19kbWFfKiB3aWxsIGZhdWx0Lg0KPiANCj4gUHJldmVudCB0
aGlzIGJ5IGV4Y2x1ZGluZyBkZXZpY2VzIHdpdGggYSBwcml2YXRlIERNQSBtZW1vcnkgcG9v
bA0KPiAoZGV2LT5kbWFfbWVtKSBmcm9tIHRoZSBhcmNoX3N5bmNfZG1hXyogZmFzdCBwYXRo
LCBhbmQgYWx3YXlzDQo+IGZhbGwgYmFjayB0byB4ZW5fZG1hX3N5bmNfKiBmb3IgdGhvc2Ug
ZGV2aWNlcyB0byBhdm9pZCBpbnZhbGlkDQo+IHBoeXNfdG9fdmlydCgpIGNvbnZlcnNpb25z
IGZvciBuby1tYXAgRE1BIG1lbW9yeSB3aGlsZSBwcmVzZXJ2aW5nIHRoZQ0KPiBleGlzdGlu
ZyBmYXN0IHBhdGggZm9yIG5vcm1hbCwgbGluZWFyLW1hcHBlZCBSQU0uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gLS0tDQo+ICAgZHJp
dmVycy94ZW4vc3dpb3RsYi14ZW4uYyB8IDE3ICsrKysrKysrKysrKystLS0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVuL3N3
aW90bGIteGVuLmMNCj4gaW5kZXggMmNiZjJiNTg4ZjViMjBjZmJmOWU4M2E4MzM5ZGMyMjA5
MmM5NTU5YS4uYjE0NDVkZjk5ZDlhOGYxZDE4YTgzYjhjNDEzYmFkYTZlNTU3OTIwOSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYw0KPiArKysgYi9kcml2ZXJz
L3hlbi9zd2lvdGxiLXhlbi5jDQo+IEBAIC0xOTUsNiArMTk1LDExIEBAIHhlbl9zd2lvdGxi
X2ZyZWVfY29oZXJlbnQoc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwgdm9pZCAq
dmFkZHIsDQo+ICAgfQ0KPiAgICNlbmRpZiAvKiBDT05GSUdfWDg2ICovDQo+ICAgDQo+ICtz
dGF0aWMgaW5saW5lIGJvb2wgZGV2X2hhc19wcml2YXRlX2RtYV9wb29sKHN0cnVjdCBkZXZp
Y2UgKmRldikNCj4gK3sNCj4gKwlyZXR1cm4gZGV2ICYmIGRldi0+ZG1hX21lbTsNCj4gK30N
Cj4gKw0KDQpJIGRvbid0IHRoaW5rIHRoaXMgd2lsbCBjb21waWxlIG9uIHg4Ni4NCg0KDQpK
dWVyZ2VuDQo=
--------------y5RAGzWBaBlt2a08ULXbC0V9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------y5RAGzWBaBlt2a08ULXbC0V9--

--------------xAm466dmUFDzKs0FzPVhHxO0--

--------------034tgJUdS8obTrCAMQuKOO5H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnmGdYFAwAAAAAACgkQsN6d1ii/Ey/8
Agf/YSSbznJg1CLAGP+RXd36++PsFDci/UUxCHrYwPyRzg9pDXHXnJ2KRuxP9wsrQdywHFkHNY7j
DU7Z6yVyIfrJHr6jnWVHi0IgJ4GReVR7BsRVoRKjFq+CkF7kEUceeuWMp0lFAaAtu5avoVAEXApN
l06NqUBNO1GWqeBt6NYDKUvW6dmEotsuXghWtc8u+YVcr1n8ZbmWRP+kyZyqLDu7pWHOdH1qYjro
SkU+aznBm1eVntwX2skc5Z9sjr71hdYYNRLyis9B1X+TIy57Z+R5TOG1dPH7oRUpq7tQ464KZHkC
92FKMGAK3twb5YcG0ENBxOlUAQKsOB7mt6hXrhi5Ww==
=UOv5
-----END PGP SIGNATURE-----

--------------034tgJUdS8obTrCAMQuKOO5H--

