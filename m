Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BA376B8F9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 17:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574401.899639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQraS-0004HJ-PA; Tue, 01 Aug 2023 15:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574401.899639; Tue, 01 Aug 2023 15:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQraS-0004FZ-Li; Tue, 01 Aug 2023 15:47:04 +0000
Received: by outflank-mailman (input) for mailman id 574401;
 Tue, 01 Aug 2023 15:47:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zpAT=DS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qQraQ-0004FT-E7
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 15:47:02 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6f932fa-3082-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 17:47:00 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe1344b707so9256552e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 08:47:00 -0700 (PDT)
Received: from [192.168.203.100] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h11-20020ac25d6b000000b004fa4323ec97sm2598283lft.301.2023.08.01.08.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 08:46:59 -0700 (PDT)
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
X-Inumbo-ID: a6f932fa-3082-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690904819; x=1691509619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bniAvYrttii6JtZVaUgncqBFmgEinZ4rXQ+fm8PB9kg=;
        b=ZJKeBfHafaJxkInQPtZo2jLn5+oBpZPPbLramUa4mjweG+/A8Rkz3QeZlxuwzbCqGp
         h+EumFUhN2K1lxeL/cTvenJmaFuNyPebG3T+U/681RaIV/uRDGh2eP7y/e7dYdlLGbng
         t2KUuGb4FVd0ggOrvVp/tbvZdKy2498FBVvvsnHvi9FwSVjYcbkULki3hdfE/2OYpgnu
         F1ZJbz774SwD9XYX3dJm5ubguugPE1FTMo0np4eb3A4AaT+CnfJyYlsZ6JUe9q7ePlzZ
         6pdIBQne703MnsaOKcFqKzI+m7H7IqSfSQU5brlAXXTIOBiJRrCxBOvmTLnxGAewfvDf
         Burw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690904819; x=1691509619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bniAvYrttii6JtZVaUgncqBFmgEinZ4rXQ+fm8PB9kg=;
        b=YndycwssFGHpcZh/EmFGWn0POjRElJrJzWN0a5txrNmAfgf1WCazuVQT1eSXfio5RZ
         QAgcy+NSh4fEtS3o76Zc0VMgOEdQRuiDuvQX814Et9NBkvhAeGFwuQZzLqE04zsV5RSC
         k7EMDTpyleMRuQ3xEiOuEb7TbAuxBAM4VIOWOjo+aAvVk68AHnastC+YZIIUjFetpCYd
         nh4Nq4DdL8eOXSxW8687aHnJmZ/ywH3Y+H6Qd1CUs7LvyW2mpfBjOo59I25edh6ZVaic
         fFypjrQDkzhTfkSLr1e32p21POJWxyUB2fFPG0+kyQ9nTTX9qlazlAKwV/CkAw4QkPJ5
         YIuA==
X-Gm-Message-State: ABy/qLbcVnIKilqujNqDxjPqGDyYkBDX827qb4WJ7LDkAME6Z+ya6liW
	8cIhYmOYu5a6yr9STU8zUsQ=
X-Google-Smtp-Source: APBJJlF8SVc1mEaiapCKbhRbQlHODk4BafmyiZn4aarAubtNFjjCBPNmWk3lo+m0M+dq6vCdXtCU4g==
X-Received: by 2002:ac2:5306:0:b0:4fe:25bc:71f5 with SMTP id c6-20020ac25306000000b004fe25bc71f5mr2470828lfh.11.1690904819377;
        Tue, 01 Aug 2023 08:46:59 -0700 (PDT)
Message-ID: <261b20991738cc14cb62ef248901d02fd1c002a1.camel@gmail.com>
Subject: Re: [PATCH v6 2/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 01 Aug 2023 18:46:58 +0300
In-Reply-To: <45d03ac2-94f5-d05f-fc7c-7402b3e6eaf6@suse.com>
References: <cover.1690899325.git.oleksii.kurochko@gmail.com>
	 <ba5b82958dd7e0a144f7534105bf1e5e61541204.1690899325.git.oleksii.kurochko@gmail.com>
	 <45d03ac2-94f5-d05f-fc7c-7402b3e6eaf6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

T24gVHVlLCAyMDIzLTA4LTAxIGF0IDE2OjUwICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwMS4wOC4yMDIzIDE2OjMwLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gQEAgLTU0LDMg
KzcwLDE3IEBAIEVOVFJZKHJlc2V0X3N0YWNrKQo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqAg
cmV0Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKgIC5zZWN0aW9uIC50ZXh0LmlkZW50LCAiYXgi
LCAlcHJvZ2JpdHMKPiA+ICsKPiA+ICtFTlRSWSh0dXJuX29uX21tdSkKPiA+ICvCoMKgwqDCoMKg
wqDCoCBzZmVuY2Uudm1hCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAgbGnCoMKgwqDCoMKgIHQw
LCBSVl9TVEFHRTFfTU9ERQo+ID4gK8KgwqDCoMKgwqDCoMKgIHNsbGnCoMKgwqAgdDAsIHQwLCBT
QVRQX01PREVfU0hJRlQKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoCBsYcKgwqDCoMKgwqAgdDEs
IHN0YWdlMV9wZ3RibF9yb290Cj4gPiArwqDCoMKgwqDCoMKgwqAgc3JswqDCoMKgwqAgdDEsIHQx
LCBQQUdFX1NISUZUCj4gCj4gSSB0aGluayBpdCB3b3VsZCBiZSBnb29kIHRvIGJlIGNvbnNpc3Rl
bnQgaW4gdGhlIHVzZSBvZiBwc2V1ZG8gaW5zbnM6Cj4gQWJvdmUgeW91IHVzZSBzbGxpLCBzbyBo
ZXJlIGl0IHdvdWxkIHdhbnQgdG8gYmUgc3JsaSAob3IgdGhlIG90aGVyCj4gd2F5IGFyb3VuZCku
Ck9vcHMsIEkgb3Zlcmxvb2tlZCB0aGF0LgpXaGVuIEkgZXhhbWluZWQgdGhlIGRpc2Fzc2VtYmxl
ciwgaXQgYXV0b21hdGljYWxseSB0cmFuc2Zvcm1lZCBpdCB0bwonc3JsaScsCnNvIEkgZm9yZ290
IHRvIGNoYW5nZSBpdC4KCkl0IHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlhdGUgdG8gdXNlICdzcmxp
Jy4KCkknbGwgd2FpdCBmb3IgYW55IGFkZGl0aW9uYWwgY29tbWVudHMsIGFuZCBpZiB0aGVyZSBh
cmUgbm9uZSwgSSdsbCBzZW5kCmEgbmV3IHBhdGNoIHNlcmllcyB2ZXJzaW9uLgoKVGhhbmtzLgoK
fiBPbGVrc2lpCj4gCj4gPiArwqDCoMKgwqDCoMKgwqAgb3LCoMKgwqDCoMKgIHQxLCB0MSwgdDAK
PiA+ICvCoMKgwqDCoMKgwqDCoCBjc3J3wqDCoMKgIENTUl9TQVRQLCB0MQo+ID4gKwo+ID4gK8Kg
wqDCoMKgwqDCoMKgIGpywqDCoMKgwqDCoCBhMAo+IAoKCg==


