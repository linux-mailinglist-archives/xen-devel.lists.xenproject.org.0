Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFAE74AD9B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 11:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560300.876111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhS3-0003RV-J2; Fri, 07 Jul 2023 09:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560300.876111; Fri, 07 Jul 2023 09:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhS3-0003PG-FX; Fri, 07 Jul 2023 09:08:31 +0000
Received: by outflank-mailman (input) for mailman id 560300;
 Fri, 07 Jul 2023 09:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcIV=CZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qHhS2-0003PA-A2
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 09:08:30 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5c03290-1ca5-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 11:08:27 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so2573403e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 02:08:27 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a2e2405000000b002b6ed0067c9sm677827ljk.116.2023.07.07.02.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 02:08:26 -0700 (PDT)
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
X-Inumbo-ID: d5c03290-1ca5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688720907; x=1691312907;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l5iyUwA+ap5Ftmsa8KDclgqU099yAaHoaPEMIz8CkiY=;
        b=hskvuzitWLro3xz/eH9p/aMlwNpvhad9Gzc/el/6ol8LCISh+rUUUinfFjg9OvKWNw
         SzBd1dbLDKauy9NEZ3bjL01+IgOVdv0efqN7WT2CRPmtqoDlcni3qyFTzJcQGrhTba4r
         9TI4Sh4XOyBifcwXZivDbasRE5MUbdXTMdzMNNU5uOUbWu29eRdBVa/saXuvT+K6ww03
         WOAK4v2irp7Fn5FUT9CLRXPE/ZF4xtV/nMPUe0w4M9F1GvVFLZqhQg0PCY4JwxhhbB4t
         fO3wRG+5S1sq3X3FIG7f00/Rnqa4eq561wB6swP1ailw4XPzkDe+6yNXgREPleNVGlQJ
         HcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688720907; x=1691312907;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5iyUwA+ap5Ftmsa8KDclgqU099yAaHoaPEMIz8CkiY=;
        b=iCKKlazGJkM1JLsEs+icsjpk6LZ2pFWD/mP6vY2buTbC59Q+p1jRbtoWnFQyaJ1pvZ
         gkD6N23OjbBmuuz9CUOgzKI34uqguxeEWSq4vmRMJDMsrhw6R7yRKy7Lkz3ZWbi7dyY6
         3gDCkpG//zefD2JPaOeqngYQUe/oms6fDuJs+r0e69u1TaI4hRDug05HAPd7RTqYT+zN
         J+lXEmKvaI1bl5izM8/YItpQE4AOT2OGbwkzZr9gRQiArLyoVetDPmzw7z+5YMVQ26eZ
         BjH3/196dwIdWtuvGgSfFHTwZsNsHpiR3jssfCshUC+8ABPaX0CRc7x7yXrWvWd8QHDq
         atzw==
X-Gm-Message-State: ABy/qLbmXrunRdSo/JRXPgmUOYTOpHekt0V0B8ndTh6XAs7MNfNidPvf
	roHUw86vrSfpMzIY/9phnBo=
X-Google-Smtp-Source: APBJJlFtP5R0dgQ2G/YHxPMc6vDzjacxfRoc9VqmNGpw5Temq7ZYYNn6c7e1f0eJfFVvzZZQllJ+/w==
X-Received: by 2002:a2e:b6d4:0:b0:2b6:a85e:4c3d with SMTP id m20-20020a2eb6d4000000b002b6a85e4c3dmr3104305ljo.32.1688720906882;
        Fri, 07 Jul 2023 02:08:26 -0700 (PDT)
Message-ID: <ba2694c1e64b6bdf493170c72564ae72d701b700.camel@gmail.com>
Subject: Re: [PATCH v2 2/6] xen/riscv: introduce reset_stack() function
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 07 Jul 2023 12:08:26 +0300
In-Reply-To: <98f1cb38-673a-c66f-96be-ba2cb6ff242f@suse.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
	 <6024617719467cd2da8ae03b81ddc899f2ba4311.1687178053.git.oleksii.kurochko@gmail.com>
	 <98f1cb38-673a-c66f-96be-ba2cb6ff242f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

T24gVGh1LCAyMDIzLTA3LTA2IGF0IDEzOjE3ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxOS4wNi4yMDIzIDE1OjM0LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIGEveGVu
L2FyY2gvcmlzY3YvcmlzY3Y2NC9oZWFkLlMKPiA+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L3Jpc2N2
NjQvaGVhZC5TCj4gPiBAQCAtMjcsOCArMjcsMTYgQEAgRU5UUlkoc3RhcnQpCj4gPiDCoMKgwqDC
oMKgwqDCoMKgIGFkZMKgwqDCoMKgIHQzLCB0MywgX19TSVpFT0ZfUE9JTlRFUl9fCj4gPiDCoMKg
wqDCoMKgwqDCoMKgIGJsdHXCoMKgwqAgdDMsIHQ0LCAuTF9jbGVhcl9ic3MKPiA+IMKgCj4gPiAr
wqDCoMKgwqDCoMKgwqAgamFswqDCoMKgwqAgcmVzZXRfc3RhY2sKPiA+ICsKPiA+ICvCoMKgwqDC
oMKgwqDCoCB0YWlswqDCoMKgIHN0YXJ0X3hlbgo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgIC5z
ZWN0aW9uIC50ZXh0LCAiYXgiLCAlcHJvZ2JpdHMKPiA+ICsKPiA+ICtFTlRSWShyZXNldF9zdGFj
aykKPiA+IMKgwqDCoMKgwqDCoMKgwqAgbGHCoMKgwqDCoMKgIHNwLCBjcHUwX2Jvb3Rfc3RhY2sK
PiA+IMKgwqDCoMKgwqDCoMKgwqAgbGnCoMKgwqDCoMKgIHQwLCBTVEFDS19TSVpFCj4gPiDCoMKg
wqDCoMKgwqDCoMKgIGFkZMKgwqDCoMKgIHNwLCBzcCwgdDAKPiA+IMKgCj4gPiAtwqDCoMKgwqDC
oMKgwqAgdGFpbMKgwqDCoCBzdGFydF94ZW4KPiA+ICvCoMKgwqDCoMKgwqDCoCByZXQKPiA+ICsK
PiAKPiBMb29raW5nIGF0IHBhdGNoIDQgeW91IHdpbGwgd2FudCB0byBhZGQgYSBjb21tZW50IGhl
cmUgdG8gZW1waGFzaXplCj4gdGhhdCBhMCBhbmQgYTEgaGF2ZSB0byByZW1haW4gdW5jbG9iYmVy
ZWQuClRoYW5rcyBmb3IgYSBub3RlLiBJJ2xsIGFkZCBpdCBpbiB0aGUgbmV3IHBhdGNoIHZlcnNp
b24KCn4gT2xla3NpaQoK


