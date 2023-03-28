Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9976CC8A0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 18:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515999.799473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phCbY-0005qq-22; Tue, 28 Mar 2023 16:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515999.799473; Tue, 28 Mar 2023 16:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phCbX-0005oC-VM; Tue, 28 Mar 2023 16:55:27 +0000
Received: by outflank-mailman (input) for mailman id 515999;
 Tue, 28 Mar 2023 16:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1phCbW-0005o3-Fa
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 16:55:26 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55b3844c-cd89-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 18:55:25 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id g17so16683138lfv.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 09:55:25 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m1-20020ac24241000000b004cb1de3f487sm5094215lfl.104.2023.03.28.09.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 09:55:24 -0700 (PDT)
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
X-Inumbo-ID: 55b3844c-cd89-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680022524;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tTFTZz5OtbOSc/QXArIuDNkh8+NovwbS/0gjjzGOaiw=;
        b=cVyURrKNfjJZjnY3jluHvjiiDxhcPPvF2ABTgsGeQ0SWkEUGRF80yLNlIUi/WgVDXo
         pUmye07FHGjT0jXerL32mZ7JSJjIb3+QLTRyqoMGK02VR54PR9XTw/xtgRU38wZxyf+d
         y6Pgoxmfw4WwUvcneZ69j+0konLhC320D8crSBIXji3ox15uPrQ794uIUZ/51NVfdn7r
         XsuDNyoGesVu2ZyieNfyDZCbvZ/keF2jKq4zNnOtauONSRhONmPOdJdhvs31WW4s4yRL
         TqDsk7M+JclB0VmjZUHnFCyhLXBgIV7mpmXbLsPpdxi8e7lMA0XtQHO2JnNcoZPKUSjK
         5a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680022524;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tTFTZz5OtbOSc/QXArIuDNkh8+NovwbS/0gjjzGOaiw=;
        b=XECygzKiW4Au1l6CqxxdkaY0iWhbxZKAS7RCCl3KmUWCRLH9ngICihB97xQE3x9wJ9
         juffKDkqN6MqCvRyU6tWC0fF+7sqENdBG3yKyGvNvuUEqw8vbvZ5RFxuOB6cYXxD8KUq
         pzfXPLNmtFysUwS+yIGD/vvitikBXpbXBMPPTzd8BnMRhqmuC/wGPxNz/Bv7T8imtIqb
         /ot7ei4rCIiIFB0Luj0zWuQzTfq1TpSQ+WrNY21LxRyJctBHxp29vFI3ikYnvsHgMsl1
         2A3gG8G/QLib4VC2/fQrqlPLok+O28rYN9lfSipGHeMOALSw6nBd5vzKOKk45B7zqLIy
         BEgA==
X-Gm-Message-State: AAQBX9c6dZp7bRF/CLbIzJjteCY/jyq8DSwiK1AviRD7iZrm9qXT66vf
	JJnngzDzI/01H0DjtLQXsXI=
X-Google-Smtp-Source: AKy350YZuD5oKTVksbuJ+ROeU4AYsNbBbtrZEzFtdcwWzkbipzY2N3k8TNWRgOkymxUeIInrYHZqhg==
X-Received: by 2002:a19:c51a:0:b0:4de:3c94:da15 with SMTP id w26-20020a19c51a000000b004de3c94da15mr5234417lfe.4.1680022524224;
        Tue, 28 Mar 2023 09:55:24 -0700 (PDT)
Message-ID: <4d0565dbc1711c2ebd122af2f6da69006be02ee5.camel@gmail.com>
Subject: Re: [PATCH v8 5/5] xen/x86: switch x86 to use generic implemetation
 of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Tue, 28 Mar 2023 19:55:23 +0300
In-Reply-To: <20063ebfc717b8281aaad4314213f26545f28273.camel@gmail.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
	 <5e252e8dacea5c4f2fdbb4f7970e34a862987639.1678900513.git.oleksii.kurochko@gmail.com>
	 <9af94e49-ff66-5e7f-bf5f-ba4095cfed13@suse.com>
	 <883d29a6bc888b4f78d5f20af4c2cf4b1b64e7c7.camel@gmail.com>
	 <20063ebfc717b8281aaad4314213f26545f28273.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

T24gVHVlLCAyMDIzLTAzLTI4IGF0IDE5OjM4ICswMzAwLCBPbGVrc2lpIHdyb3RlOgo+IE9uIFR1
ZSwgMjAyMy0wMy0yOCBhdCAxODozOCArMDMwMCwgT2xla3NpaSB3cm90ZToKPiA+IG9mZnNldHMu
cyBhcmNoL3g4Ni94ODZfNjQvYXNtLW9mZnNldHMuYwo+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmg6MjEsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmcm9tIC4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmg6MTgsCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1
aWQuaDoxNCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmg6MTAsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vc3lzdGVtLmg6NywKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9hdG9taWMuaDo1LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJv
bSAuL2luY2x1ZGUveGVuL2dkYnN0dWIuaDoyNCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9kZWJ1Z2dlci5oOjEwLAo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2luY2x1ZGUveGVuL2RlYnVn
Z2VyLmg6MjQsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vYXJj
aC94ODYvaW5jbHVkZS9hc20vYnVnLmg6NiwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGZyb20gLi9pbmNsdWRlL3hlbi9idWcuaDoxNSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2ZS5o
OjcsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vYXJjaC94ODYv
aW5jbHVkZS9hc20vYml0b3BzLmg6OCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZyb20gLi9pbmNsdWRlL3hlbi9iaXRvcHMuaDoxMDYsCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vc21wLmg6OCwKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9pbmNsdWRlL3hlbi9zbXAu
aDo0LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2luY2x1ZGUv
eGVuL3BlcmZjLmg6NywKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20g
YXJjaC94ODYveDg2XzY0L2FzbS1vZmZzZXRzLmM6OToKPiBBbmQgYWdhaW4gdGhlIHByb2JsZW0g
aXMgdGhhdCB4ODYncyA8YXNtL2J1Zy5oPiBpbmNsdWRlcwo+IDx4ZW4vZGVidWdnZXIuaD4gd2hp
Y2ggc29tZXdoZXJlIGluc2lkZSB1c2VzIEJVRygpIHdoaWNoIHdpbGwgYmUKPiBkZWZpbmVkIGFm
dGVyIHdlIHdpbGwgYmFjayBmb3IgeDg2J3MgPGFzbS9idWcuaD4gdG8gPHhlbi9idWcuaD4gd2hl
cmUKPiBCVUcoKSBpcyBkZWZpbmVkLgo+IAo+IFNvIGl0IGxvb2tzIGxpa2Ugd2UgY2FuJ3QgaW5j
bHVkZSB0byA8YXNtL2J1Zy5oPiBzb21ldGhpbmcgdGhhdCB3aWxsCj4gdXNlIGZ1bmN0aW9uYWxp
dHkgZGVmaW5lZCBpbiA8eGVuL2J1Zy5oPi4uLgo+IAo+IFRoZXJlYnkgSSBkb24ndCBzZWUgYmV0
dGVyIG9wdGlvbiB0aGF0IGluY2x1ZGUgPHhlbi9kZWJ1Z2dlci5oPiBpbgo+IDxjb21tb24vYnVn
LmM+IGluc3RlYWQgb2YgPGFzbS9idWcuaD4KCk9yIGFzIGFuIG9wdGlvbiB3ZSBjYW4gaW5jbHVk
ZSA8eGVuL2J1Zy5oPiBpbiA8YXNtL2J1Zy5oPiBpbnN0ZWFkIG9mCmluY2x1ZGUgPGFzbS9idWcu
aD4gaW4gPHhlbi9idWcuaD4gaXQgd2lsbCBhbGxvdyB1cyB0byByZXNvbHZlIGFuCmlzc3VlLi4u
CgpEbyB5b3UgdGhpbmsgdGhpcyBvcHRpb24gd2lsbCBiZSBiZXR0ZXI/Cgp+IE9sZWtzaWkK


