Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A926CC834
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 18:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515991.799463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phCLH-0003Dm-KW; Tue, 28 Mar 2023 16:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515991.799463; Tue, 28 Mar 2023 16:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phCLH-0003BZ-HL; Tue, 28 Mar 2023 16:38:39 +0000
Received: by outflank-mailman (input) for mailman id 515991;
 Tue, 28 Mar 2023 16:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1phCLG-0003BT-2V
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 16:38:38 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc7abeba-cd86-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 18:38:36 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id bi9so16582876lfb.12
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 09:38:36 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a19f005000000b004e856a4159bsm5141675lfc.20.2023.03.28.09.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 09:38:35 -0700 (PDT)
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
X-Inumbo-ID: fc7abeba-cd86-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680021516;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Xi9lhOFO1DiFWfu8sd6p8mLqaBqFlDxbeLPfqhB0gY=;
        b=TjHlT2e3yyF8JXuqDULfYso5nr8pje+1Cf5Ib8YlUc+GuQj0cTetGnS53WgzoxnAaQ
         up3qyDPj8sofXmeN3UeB6qDEP20LZgLw1rTgQ/WSphYdwCzUEXKTM/hw690I3Kzs7kjX
         RUky/kWmW3ruZ9gihe6F0fc0uUeTDNkgTTwk0g/9y6hBvUIHo09FQCmrG4EflS4aYgkN
         dUsYLCS/jhLASdT+ZVy4VuonER+PlR0oLRI33ZAolfsTe89gJGISPEQfyDwM0em9uCCM
         wVazLU1rw+l1emcPs0BniKZhq/hUN0vv+QW2FwYG9EVe+2kRMhpmzDJkaee8PE8vSbeR
         TurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680021516;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Xi9lhOFO1DiFWfu8sd6p8mLqaBqFlDxbeLPfqhB0gY=;
        b=uCrr+fR1C06mGwRv3I5tB9J8+Qn0/bhynlOty/KEKadY/PBBGy9y4koOzvg6afRy/Z
         GIwlU5QomBIIyrkWxKjim8U1/sTkFK9GO43DgNrt33rnkaiphi++C0AMyWgI4LO59y6j
         cpn6t6Uw3j6v2Ih+h5OHHTJLPTZf6jecl7e6PHgTrP2tHcpmWgBsAgD11c/tT2wh6/6c
         Rp7/y6b43BmfrcGzmuzgc8f+SPbTIkdRJGsCBJX70FAwhlA+q4N3zqXQwSIB78kYAwmU
         FFaLhpko+s+zQ47voj5iH/uehlh+ywIUdQW+Qy8BkcJUIu9LPiogaDDolvr+gHpY8bq/
         nWqA==
X-Gm-Message-State: AAQBX9fPMJjZD1ofN8XHUejVWMJTLtbbZ70x3VOewSO3wk127HRUjVUq
	cxEfbH0feA3vItEjcS2YpMg=
X-Google-Smtp-Source: AKy350Ycw8t4AVeavxFVfdryc9r91XMXWeaoa0w1zOlFVkEmG2nS0HFJIVwwatcvOvWKZa0SUBoA7A==
X-Received: by 2002:ac2:43bc:0:b0:4b5:3505:d7f9 with SMTP id t28-20020ac243bc000000b004b53505d7f9mr4071773lfl.35.1680021515957;
        Tue, 28 Mar 2023 09:38:35 -0700 (PDT)
Message-ID: <20063ebfc717b8281aaad4314213f26545f28273.camel@gmail.com>
Subject: Re: [PATCH v8 5/5] xen/x86: switch x86 to use generic implemetation
 of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Tue, 28 Mar 2023 19:38:34 +0300
In-Reply-To: <883d29a6bc888b4f78d5f20af4c2cf4b1b64e7c7.camel@gmail.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
	 <5e252e8dacea5c4f2fdbb4f7970e34a862987639.1678900513.git.oleksii.kurochko@gmail.com>
	 <9af94e49-ff66-5e7f-bf5f-ba4095cfed13@suse.com>
	 <883d29a6bc888b4f78d5f20af4c2cf4b1b64e7c7.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

T24gVHVlLCAyMDIzLTAzLTI4IGF0IDE4OjM4ICswMzAwLCBPbGVrc2lpIHdyb3RlOgo+IG9mZnNl
dHMucyBhcmNoL3g4Ni94ODZfNjQvYXNtLW9mZnNldHMuYwo+IEluIGZpbGUgaW5jbHVkZWQgZnJv
bSAuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oOjIxLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZyb20gLi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaDoxOCwKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1aWQu
aDoxNCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vYXJjaC94ODYv
aW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oOjEwLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zeXN0ZW0uaDo3LAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hdG9t
aWMuaDo1LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9pbmNsdWRl
L3hlbi9nZGJzdHViLmg6MjQsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJv
bSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2RlYnVnZ2VyLmg6MTAsCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2luY2x1ZGUveGVuL2RlYnVnZ2VyLmg6MjQsCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2J1Zy5oOjYsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2luY2x1
ZGUveGVuL2J1Zy5oOjE1LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20g
Li9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2ZS5oOjcsCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2JpdG9wcy5oOjgs
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2luY2x1ZGUveGVuL2Jp
dG9wcy5oOjEwNiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vYXJj
aC94ODYvaW5jbHVkZS9hc20vc21wLmg6OCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmcm9tIC4vaW5jbHVkZS94ZW4vc21wLmg6NCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmcm9tIC4vaW5jbHVkZS94ZW4vcGVyZmMuaDo3LAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gYXJjaC94ODYveDg2XzY0L2FzbS1vZmZzZXRzLmM6OToK
QW5kIGFnYWluIHRoZSBwcm9ibGVtIGlzIHRoYXQgeDg2J3MgPGFzbS9idWcuaD4gaW5jbHVkZXMK
PHhlbi9kZWJ1Z2dlci5oPiB3aGljaCBzb21ld2hlcmUgaW5zaWRlIHVzZXMgQlVHKCkgd2hpY2gg
d2lsbCBiZQpkZWZpbmVkIGFmdGVyIHdlIHdpbGwgYmFjayBmb3IgeDg2J3MgPGFzbS9idWcuaD4g
dG8gPHhlbi9idWcuaD4gd2hlcmUKQlVHKCkgaXMgZGVmaW5lZC4KClNvIGl0IGxvb2tzIGxpa2Ug
d2UgY2FuJ3QgaW5jbHVkZSB0byA8YXNtL2J1Zy5oPiBzb21ldGhpbmcgdGhhdCB3aWxsCnVzZSBm
dW5jdGlvbmFsaXR5IGRlZmluZWQgaW4gPHhlbi9idWcuaD4uLi4KClRoZXJlYnkgSSBkb24ndCBz
ZWUgYmV0dGVyIG9wdGlvbiB0aGF0IGluY2x1ZGUgPHhlbi9kZWJ1Z2dlci5oPiBpbgo8Y29tbW9u
L2J1Zy5jPiBpbnN0ZWFkIG9mIDxhc20vYnVnLmg+Cgp+IE9sZWtzaWkK


