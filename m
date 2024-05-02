Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0468B9686
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 10:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715647.1117422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2RsI-0005EG-Kl; Thu, 02 May 2024 08:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715647.1117422; Thu, 02 May 2024 08:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2RsI-0005Bb-Hd; Thu, 02 May 2024 08:33:06 +0000
Received: by outflank-mailman (input) for mailman id 715647;
 Thu, 02 May 2024 08:33:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ua+q=MF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s2RsH-0005BV-KK
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 08:33:05 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9750a8f5-085e-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 10:33:03 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so9570441e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 01:33:03 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o3-20020ac24943000000b0051e12a2c07bsm95803lfi.20.2024.05.02.01.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 01:33:01 -0700 (PDT)
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
X-Inumbo-ID: 9750a8f5-085e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714638782; x=1715243582; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6uVKy1VOU+bFcQfhFvZNp5OKrzQp5GFDpm3cDxnm8rI=;
        b=kA2mSkN7BbLeRo1d9ra46jG19EAGkvaEcZlcC0g8nI/DXh4Z+QbFIT8nJImqeOC6/2
         gQfQnMiqQuSr7VNFDnPUFBqvuiHiDWG1Q5wL3UdPomAZ17Zhxgm26NWcusmeIMwUPE4w
         sBG3cSm5c9pveSApSLuT+rymajSNzFSyu8legV13z9+edPW3Fg20ObscWQF4YTxIpj6w
         hpOojHwFjUhzbOjz0f6wk/qUI0yrMas6Ocg+4lbyE3Ion/gQqzgEGmocmPQVf2WBOkcx
         QwRiT8QTfSKsIezgDMvHHB1Mh2Mrmtskq2rmaiN61qQH+ugQ8nePYD9SkDc06MYK5AvZ
         M6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714638782; x=1715243582;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uVKy1VOU+bFcQfhFvZNp5OKrzQp5GFDpm3cDxnm8rI=;
        b=Hso+4rlANTFH/TB1ddnATb2u8smnZTPQOisyKb9qrvFfMkrltSXF8a9s4VG0ngToq1
         NpHjsFaZKqKpFYFmQbUwRTP8hUpTv8TuRCDYWb8TrYKX+PU2WQrzQ86V/br1ghxCALuf
         0KVv9ZAzyPzCN3U33vrsGn3ISoyVXIhjZbpGu/LX8zNimJIt+Sgyxsnx76wFW9poAd3U
         HTF3fB58R/IcYnXcmb3pu5qK0G0icalJ6nuYA6oGaTcmiNDavmRIhqtVitC9Uet6OYhu
         X9M2x/YFYQAtSlLq6fc4x6ED3r176ZVwXx2mwZGaSDgV9TeHi4ld8rTGpS1qzW3pnAjV
         T2yA==
X-Forwarded-Encrypted: i=1; AJvYcCWi2rl3bVFBfSZJzDjBWgX/iBjLtdomJf9FzGRdnPl/Cx8rvs6zsnVq9OKbSSfa+m0g45xKQvdrTrsdTKml8sHG1YKwAZ+lh3VeeMR3MxA=
X-Gm-Message-State: AOJu0YwgrwoWGflvlrzqW61FrhRtV6iCl2gaan85FWbZvz1pyyBEzRTG
	E3cVYmicCE4U9YON40IoQeP0A/bpvKO93/+WDv0hJL+fhe04+NWL
X-Google-Smtp-Source: AGHT+IHhut/JYAmyK42SUVj9T+RxnUBAni7Z/MI2KEJKojOsjd5tkUEi06agrSY228IWRN8H16FZGw==
X-Received: by 2002:ac2:58e5:0:b0:51e:eac7:d69b with SMTP id v5-20020ac258e5000000b0051eeac7d69bmr1496378lfo.27.1714638782174;
        Thu, 02 May 2024 01:33:02 -0700 (PDT)
Message-ID: <845de338f4c77f31b91f03028235997b2d0386c8.camel@gmail.com>
Subject: Re: [PATCH v8 08/17] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 02 May 2024 10:33:00 +0200
In-Reply-To: <d40ec2a0-fb14-48f1-804b-9ef18f35b7d5@suse.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
	 <4967a5fcbef0901ef34d8954a48ded369b1ea2b1.1713347222.git.oleksii.kurochko@gmail.com>
	 <d40ec2a0-fb14-48f1-804b-9ef18f35b7d5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTA0LTI5IGF0IDE1OjQ1ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxNy4wNC4yMDI0IDEyOjA0LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmgKPiA+IEBA
IC0wLDAgKzEsMjgxIEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSAqLwo+ID4gKy8qCj4gPiArICogVGFrZW4gYW5kIG1vZGlmaWVkIGZyb20gTGludXguCj4g
PiArICoKPiA+ICsgKiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgd2VyZSBkb25lOgo+ID4gKyAqIC0g
KiBhdG9taWMjI3ByZWZpeCMjXyp4Y2hnXyooYXRvbWljIyNwcmVmaXgjI190ICp2LCBjX3Qgbikg
d2VyZQo+ID4gdXBkYXRlZAo+ID4gKyAqwqDCoMKgwqAgdG8gdXNlX18qeGNoZ19nZW5lcmljKCkK
PiA+ICsgKiAtIGRyb3AgY2FzdHMgaW4gd3JpdGVfYXRvbWljKCkgYXMgdGhleSBhcmUgdW5uZWNl
c3NhcnkKPiA+ICsgKiAtIGRyb3AgaW50cm9kdWN0aW9uIG9mIFdSSVRFX09OQ0UoKSBhbmQgUkVB
RF9PTkNFKCkuCj4gPiArICrCoMKgIFhlbiBwcm92aWRlcyBBQ0NFU1NfT05DRSgpCj4gPiArICog
LSByZW1vdmUgemVyby1sZW5ndGggYXJyYXkgYWNjZXNzIGluIHJlYWRfYXRvbWljKCkKPiA+ICsg
KiAtIGRyb3AgZGVmaW5lcyBzaW1pbGFyIHRvIHBhdHRlcm4KPiA+ICsgKsKgwqAgI2RlZmluZSBh
dG9taWNfYWRkX3JldHVybl9yZWxheGVkwqDCoCBhdG9taWNfYWRkX3JldHVybl9yZWxheGVkCj4g
PiArICogLSBtb3ZlIG5vdCBSSVNDLVYgc3BlY2lmaWMgZnVuY3Rpb25zIHRvIGFzbS1nZW5lcmlj
L2F0b21pY3MtCj4gPiBvcHMuaAo+ID4gKyAqIAo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAwNyBS
ZWQgSGF0LCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCj4gPiArICogQ29weXJpZ2h0IChDKSAy
MDEyIFJlZ2VudHMgb2YgdGhlIFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYQo+ID4gKyAqIENvcHly
aWdodCAoQykgMjAxNyBTaUZpdmUKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgVmF0ZXMgU0FT
Cj4gPiArICovCj4gPiArCj4gPiArI2lmbmRlZiBfQVNNX1JJU0NWX0FUT01JQ19ICj4gPiArI2Rl
ZmluZSBfQVNNX1JJU0NWX0FUT01JQ19ICj4gPiArCj4gPiArI2luY2x1ZGUgPHhlbi9hdG9taWMu
aD4KPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNtL2NtcHhjaGcuaD4KPiA+ICsjaW5jbHVkZSA8YXNt
L2ZlbmNlLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9pby5oPgo+ID4gKyNpbmNsdWRlIDxhc20vc3lz
dGVtLmg+Cj4gPiArCj4gPiArdm9pZCBfX2JhZF9hdG9taWNfc2l6ZSh2b2lkKTsKPiA+ICsKPiA+
ICsvKgo+ID4gKyAqIExlZ2FjeSBmcm9tIExpbnV4IGtlcm5lbC4gRm9yIHNvbWUgcmVhc29uIHRo
ZXkgd2FudGVkIHRvIGhhdmUKPiA+IG9yZGVyZWQKPiA+ICsgKiByZWFkL3dyaXRlIGFjY2Vzcy4g
VGhlcmVieSByZWFkKiBpcyB1c2VkIGluc3RlYWQgb2YgcmVhZCpfY3B1KCkKPiA+ICsgKi8KPiA+
ICtzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkIHJlYWRfYXRvbWljX3NpemUoY29uc3Qgdm9sYXRp
bGUgdm9pZCAqcCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCAqcmVzLAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2l6ZSkKPiA+ICt7
Cj4gPiArwqDCoMKgIHN3aXRjaCAoIHNpemUgKQo+ID4gK8KgwqDCoCB7Cj4gPiArwqDCoMKgIGNh
c2UgMTogKih1aW50OF90ICopcmVzID0gcmVhZGIocCk7IGJyZWFrOwo+ID4gK8KgwqDCoCBjYXNl
IDI6ICoodWludDE2X3QgKilyZXMgPSByZWFkdyhwKTsgYnJlYWs7Cj4gPiArwqDCoMKgIGNhc2Ug
NDogKih1aW50MzJfdCAqKXJlcyA9IHJlYWRsKHApOyBicmVhazsKPiA+ICsjaWZuZGVmIENPTkZJ
R19SSVNDVl8zMgo+ID4gK8KgwqDCoCBjYXNlIDg6ICoodWludDMyX3QgKilyZXMgPSByZWFkcShw
KTsgYnJlYWs7Cj4gPiArI2VuZGlmCj4gPiArwqDCoMKgIGRlZmF1bHQ6IF9fYmFkX2F0b21pY19z
aXplKCk7IGJyZWFrOwo+ID4gK8KgwqDCoCB9Cj4gPiArfQo+ID4gKwo+ID4gKyNkZWZpbmUgcmVh
ZF9hdG9taWMocCkgKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIHVuaW9uIHsgdHlwZW9mKCoo
cCkpIHZhbDsgY2hhciBjW3NpemVvZigqKHApKV07IH0geF87wqDCoCBcCj4gPiArwqDCoMKgIHJl
YWRfYXRvbWljX3NpemUocCwgeF8uYywgc2l6ZW9mKCoocCkpKTvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCB4Xy52YWw7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ICt9KQo+ID4gKwo+ID4gK3N0YXRpYyBhbHdheXNfaW5saW5l
IHZvaWQgX3dyaXRlX2F0b21pYyh2b2xhdGlsZSB2b2lkICpwLAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdW5zaWduZWQgbG9uZyB4LCB1bnNpZ25lZAo+ID4gaW50IHNpemUpCj4gPiArewo+ID4g
K8KgwqDCoCBzd2l0Y2ggKCBzaXplICkKPiA+ICvCoMKgwqAgewo+ID4gK8KgwqDCoCBjYXNlIDE6
IHdyaXRlYih4LCBwKTsgYnJlYWs7Cj4gPiArwqDCoMKgIGNhc2UgMjogd3JpdGV3KHgsIHApOyBi
cmVhazsKPiA+ICvCoMKgwqAgY2FzZSA0OiB3cml0ZWwoeCwgcCk7IGJyZWFrOwo+ID4gKyNpZm5k
ZWYgQ09ORklHX1JJU0NWXzMyCj4gPiArwqDCoMKgIGNhc2UgODogd3JpdGVxKHgsIHApOyBicmVh
azsKPiA+ICsjZW5kaWYKPiA+ICvCoMKgwqAgZGVmYXVsdDogX19iYWRfYXRvbWljX3NpemUoKTsg
YnJlYWs7Cj4gPiArwqDCoMKgIH0KPiA+ICt9Cj4gPiArCj4gPiArI2RlZmluZSB3cml0ZV9hdG9t
aWMocCwgeCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPiA+ICsoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCB0eXBlb2YoKihwKSkgeF8gPSAoeCk7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiAr
wqDCoMKgIF93cml0ZV9hdG9taWMoKHApLCB4Xywgc2l6ZW9mKCoocCkpKTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiAKPiBOaXQ6IFRoZXJlIGFyZSBzdGlsbCBleGNlc3MgcGFyZW50
aGVzZXMgaGVyZS4KPiAKPiA+ICvCoMKgwqAgeF87wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPiAKPiBXaHkgaXMgdGhpcz8gVGhlIG1hY3JvIGlzbid0IHN1cHBvc2Vk
IHRvICJyZXR1cm4iIGEgdmFsdWUsIGlzIGl0PwpZb3UgYXJlIHJpZ2h0LiB3cml0ZV9hdG9taWMo
KSBpc24ndCBzdXBwb3NlZCB0byByZXR1cm4gYSB2YWx1ZSwgc28KInhfOyIgY2FuIGJlIGRyb3Bw
ZWQuCgo+IAo+ID4gK30pCj4gPiArCj4gPiArc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZCBfYWRk
X3NpemVkKHZvbGF0aWxlIHZvaWQgKnAsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxv
bmcgeCwgdW5zaWduZWQgaW50Cj4gPiBzaXplKQo+ID4gK3sKPiA+ICvCoMKgwqAgc3dpdGNoICgg
c2l6ZSApCj4gPiArwqDCoMKgIHsKPiA+ICvCoMKgwqAgY2FzZSAxOgo+ID4gK8KgwqDCoCB7Cj4g
PiArwqDCoMKgwqDCoMKgwqAgdm9sYXRpbGUgdWludDhfdCAqcHRyID0gKHZvbGF0aWxlIHVpbnQ4
X3QgKilwOwo+IAo+IEhlcmUgYW5kIGJlbG93OiBXaHkgdGhlIGNhc3RzPwpZZXMsIHRoZXkgYXJl
IG5vdCBuZWVkZWQuIEluaXRpYWxseSBJIGRlY2lkZWQgdGhhdCBpdCBjb3VsZCBiZSBhCmNvbXBp
bGF0aW9uIGlzc3VlLgoKfiBPbGVrc2lpCg==


