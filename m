Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A689947813
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 11:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771872.1182303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1satn5-0002GK-Qu; Mon, 05 Aug 2024 09:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771872.1182303; Mon, 05 Aug 2024 09:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1satn5-0002ED-Ni; Mon, 05 Aug 2024 09:14:07 +0000
Received: by outflank-mailman (input) for mailman id 771872;
 Mon, 05 Aug 2024 09:14:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=006L=PE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1satn4-0002E7-FD
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 09:14:06 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fce43bf-530b-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 11:14:04 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52f01ec08d6so14557392e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 02:14:04 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba11015sm1057745e87.92.2024.08.05.02.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 02:14:03 -0700 (PDT)
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
X-Inumbo-ID: 0fce43bf-530b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722849244; x=1723454044; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yw6q5AGcWhKd7lizOSzsg9z2583TFXz8J61Yx95iWGM=;
        b=c37FZlBlCh/tup/B1zhU+cA99VVDcvjTuRtXLr6fpQr00a5h4xVn90zdB0Mzq/AErh
         KVEAcOZ3egeAPVmcri3RtE/4yjl7bw3usA360mnOiwUaYUDAPY/jjDBy7L1g5RPTVaZy
         VrUZqsg53FWRm5ZETkLZulf9XI6xKxfD/9iFHq7JSnVCGU0R76pJUOdgsrwdvQDBX+FN
         cRvLpFKJxOxv5vHy7bOMN5sd1czyM1psRx5mC8b5gY+7Mm//cLLFvAhwSSNwsgUKRIhh
         5Dp52Jc22AtP+sGvUyazITtCtqd/o2kHxYFE0YPFqvIoLodvL1623GPIHxpYQHT9OFCW
         gTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849244; x=1723454044;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yw6q5AGcWhKd7lizOSzsg9z2583TFXz8J61Yx95iWGM=;
        b=laRdt/13+iBuc+cQesTgTRXl5DjUOyNLpuMPscom87wDG6hB2desgqgv6VQdyuf77U
         QYzjQZvTK1sk5XTzbtnqgumVAhOYDQFBSJMspAs6TPQf1ZbibvCT4ywuMQDbbAMeIY+F
         EQwuEib7FKv5Poblv8aDv/rQmSVhUIhrQYeIuSwoiqaX7ruAPwPJrqrS+vF+r8PgehbP
         3Dm0kQ22bm9RN+uDie4xmAVDY9+p74HB/KCI733zfSMNU5mZZDYB6PoSIJkMfKzhwF78
         R5wm+EBtEPUi77LdWriftzVm3XG8H6rjhOeW0bsB6QeW69LDxBm0E9beMIK5xB5syLIY
         Cqyg==
X-Forwarded-Encrypted: i=1; AJvYcCWD3dORMSFUS49oobBZKTKJQCgcQiHZ0RSEsEuLGMI/v3Gl8PRIlV1mzBFusf/aojE8fC8T9MZWBi/vB0Ae9ggL27AN2+Y2wJiteVMq1YQ=
X-Gm-Message-State: AOJu0YyM0rc0by6SoUocYZD8A2n0lsgg37gQTDOqwSNslbIVtbEctfYC
	7rQLpbXLQrNVGzlNn8x9G/gGSk/m8R4AtoKMiYAkGFyRyQX4wO5w
X-Google-Smtp-Source: AGHT+IEZ4nmmHU3qzz9KXfHZ4ei1f3Ec4DVzpMxZH+hUk1BXAhOcSR9ZzFXyhP1f1S8AyfuUvDkjog==
X-Received: by 2002:a05:6512:130f:b0:52c:e11e:d493 with SMTP id 2adb3069b0e04-530bb381028mr7851176e87.26.1722849243540;
        Mon, 05 Aug 2024 02:14:03 -0700 (PDT)
Message-ID: <3a8545f9eb661df8082efc086161024d9601f7e1.camel@gmail.com>
Subject: Re: [PATCH v12 3/3] xen/riscv: refactor decode_trap_cause()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 05 Aug 2024 11:14:02 +0200
In-Reply-To: <361eb1c3-003b-47d2-bcd9-0f06e91bfd0a@suse.com>
References: <cover.1722605952.git.oleksii.kurochko@gmail.com>
	 <88e15908d6ac363934b6da52091443af28bd7291.1722605952.git.oleksii.kurochko@gmail.com>
	 <361eb1c3-003b-47d2-bcd9-0f06e91bfd0a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTA4LTA1IGF0IDA4OjIwICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwMi4wOC4yMDI0IDE1OjU0LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gVXNlIGFycmF5
X2FjY2Vzc19ub3NwZWMoKSB0byBwcmV2ZW50IGd1ZXN0IHNwZWN1bGF0aW9uLgo+ID4gCj4gPiBB
dm9pZCBkb3VibGUgYWNjZXNzIG9mIHRyYXBfY2F1c2VzW2NhdXNlXS4KPiA+IAo+ID4gU3VnZ2Vz
dGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4KPiAKPiBSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IHdpdGggLi4uCj4gCj4g
PiBAQCAtNDgsOSArNDksMTAgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmRlY29kZV90cmFwX2NhdXNl
KHVuc2lnbmVkCj4gPiBsb25nIGNhdXNlKQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBbQ0FVU0VfU1RP
UkVfR1VFU1RfUEFHRV9GQVVMVF0gPSAiR3Vlc3QgU3RvcmUvQU1PIFBhZ2UKPiA+IEZhdWx0IiwK
PiA+IMKgwqDCoMKgIH07Cj4gPiDCoAo+ID4gLcKgwqDCoCBpZiAoIGNhdXNlIDwgQVJSQVlfU0la
RSh0cmFwX2NhdXNlcykgJiYgdHJhcF9jYXVzZXNbY2F1c2VdICkKPiA+IC3CoMKgwqDCoMKgwqDC
oCByZXR1cm4gdHJhcF9jYXVzZXNbY2F1c2VdOwo+ID4gLcKgwqDCoCByZXR1cm4gIlVOS05PV04i
Owo+ID4gK8KgwqDCoCBjb25zdCBjaGFyICpyZXMgPSBjYXVzZSA8IEFSUkFZX1NJWkUodHJhcF9j
YXVzZXMpID8KPiA+IGFycmF5X2FjY2Vzc19ub3NwZWModHJhcF9jYXVzZXMsIGNhdXNlKQo+IAo+
IC4uLiB0aGUgb3Zlcmx5IGxvbmcgbGluZSBoZXJlIHN1aXRhYmx5IHdyYXBwZWQ7IGNvbW1vbmx5
IHdlJ2QgZG8gdGhpcwo+IGFzIC4uLgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiBOVUxMOwo+IAo+IMKgwqDCoCBjb25zdCBjaGFyICpy
ZXMgPSBjYXVzZSA8IEFSUkFZX1NJWkUodHJhcF9jYXVzZXMpCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID8gYXJyYXlfYWNjZXNzX25vc3BlYyh0cmFwX2NhdXNl
cywgY2F1c2UpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDog
TlVMTDsKPiAKPiBJIGd1ZXNzIEknbGwgYWRqdXN0IHRoaXMgd2hpbGUgY29tbWl0dGluZy4KSSB3
aWxsIGJlIGhhcHB5IHdpdGggdGhhdC4gVGhhbmtzIQoKfiBPbGVrc2lpCj4gCj4gSmFuCj4gCj4g
PiArwqDCoMKgIHJldHVybiByZXMgPzogIlVOS05PV04iOwo+ID4gwqB9Cj4gPiDCoAo+ID4gwqBz
dGF0aWMgY29uc3QgY2hhciAqZGVjb2RlX3Jlc2VydmVkX2ludGVycnVwdF9jYXVzZSh1bnNpZ25l
ZCBsb25nCj4gPiBpcnFfY2F1c2UpCj4gCgo=


