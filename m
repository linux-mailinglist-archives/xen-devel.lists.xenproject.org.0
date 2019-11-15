Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A6CFE259
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 17:10:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVe7x-0002Sn-35; Fri, 15 Nov 2019 16:07:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVe7v-0002Sf-LT
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 16:07:15 +0000
X-Inumbo-ID: fb1a6f7a-07c1-11ea-984a-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb1a6f7a-07c1-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 16:07:11 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q28so8417056lfa.5
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 08:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cxe93CM3kKAdw5raDe756tFpVv8WUPx7yYd/SmEGMac=;
 b=UpyxV+7V9zzS/l/F/T3PFeDPiXtqF2duMF8BYAS6wtVfGqYVkECleUA7y2RJemQlYP
 DxMiM54axkonXENLYJPeY2KU9/Hn2DQyHigoUxFiSX7sbXvSzleJ73W6/KEcFtgRtgGQ
 NoQHthjl7zqfD/ptO4HXRztZAtTdMqSTmcPjzbp18yJIXHU7XFhlAy6KUNQRII96yQ0n
 BNmlCGa1ok3aoM0f2JoMxS057b0JQPNQmlV+wziGO3UOZ7b0vOduu0iY3iuTd6frO57J
 /7lIWNN0f9vw7JnHt1ZZm/Ka5NeCa/2V/m8Mr3KIuwpWIzltXsImQTm6vtZ6nbjt+fw3
 Xt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cxe93CM3kKAdw5raDe756tFpVv8WUPx7yYd/SmEGMac=;
 b=FPvxPcQgmwljYsGZHS2xs3+uM6CRxqy+ErgVm1UVUC7RvaofNmZhfvQ01tT5Pxergv
 Xw362V65U8yJU1/MZ7jTs99INyLykh7NYqjWuK8fGcGzz5C4EqAe18C7DNLmgIdgVFH8
 bgCxcwBPvvHcemwiXpO/7ZDykudtdSMARCTOlHCExdITb7UMVIxNDM2k/+NsoUmrht19
 etnGQ6BybJGqgw8fVKx3dzuiJDSJSAXVdA0Ub7I4GyV3YDPUw3RreD47nJZzI/Zft71b
 R9mn3G+92B+3D/ilWS0t0tktihxMIaXvPHAep7LGyWs5sBoKtqou52i0DKnxY+Z8zaF6
 u3OA==
X-Gm-Message-State: APjAAAXG10C4zza88mnM/9HdHiD5je1FV5y3Hkypc+cq0EB+WYJIJyrQ
 VVa7eHkhA4rsJ3weY0K1B9hvZ+1LeUto5vr/HJk=
X-Google-Smtp-Source: APXvYqyuBf56c5RauGm8OEmXwme0RLmz0qE0DZe27HKAbV4qbz0rPWBfWZzNQ5eXTSNdasj5XZmKzhDwl9eti8MgnO8=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr11687358lfp.5.1573834030674; 
 Fri, 15 Nov 2019 08:07:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <5773984ae9308500183adde21cf25837bba39f7f.1570456846.git.rosbrookn@ainfosec.com>
 <ce6a58af-d269-5b70-b1bc-df5a7620c4b5@citrix.com>
 <CAEBZRSeDo2RO-VptW8hYOzh93M04pxxVL16dqoAcrLGm0MbFuA@mail.gmail.com>
 <9576102c-c20f-7d65-5b93-bd2632fde462@citrix.com>
 <CAEBZRSe_jGO3Gi1DPb9-mGoLKODTP4i02EPogSN5xD-sgvcUig@mail.gmail.com>
 <08de2754-c742-06df-3ac9-72ca81019e08@citrix.com>
 <CAEBZRSdEVLOjEAsOntzkz4A82H+nm2=EPq5KXTx39BU7rQForA@mail.gmail.com>
 <fa45954a-8285-d5bf-c775-029061c2b137@citrix.com>
In-Reply-To: <fa45954a-8285-d5bf-c775-029061c2b137@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 15 Nov 2019 11:06:59 -0500
Message-ID: <CAEBZRScYf=G1ro_0Fu3kJ0g6KnOcS5LE4H1a0fRs0woHuZSk4Q@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 11/24] golang/xenlight: define
 CpuidPolicyList builtin type
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiB0aGUgd2hvbGUgSSB0aGluayBzZW5kaW5nIHYyIGVhcmxpZXIgaXMgYmV0dGVyLCBzaW5j
ZSBJJ2xsIGhhdmUgdGhlCj4gZGlzY3Vzc2lvbnMgbW9yZSByZWNlbnRseSBpbiBteSBoZWFkLCBh
bmQgc28gd2lsbCAoaG9wZWZ1bGx5KSBiZSBhYmxlIHRvCj4gZ2V0IGFuIEFjayBvciBSLWIgbW9y
ZSBxdWlja2x5Lgo+Cj4gV2hlbiB0aGUgZGV2ZWxvcG1lbnQgd2luZG93IGlzIG9wZW4sIHN0dWZm
IGNhbiBiZSBjaGVja2VkIGluIGFzIGl0J3MKPiByZXZpZXdlZCwgbWFraW5nIHRoZSB3aG9sZSB0
aGluZyBlYXNpZXIuCj4KPiBUbyBiZSBjbGVhciwgdGhpcyBpcyBmb3IgdGltZXMgd2hlbiB0aGUg
cmV2aWV3IG9mIHRoZSB3aG9sZSBzZXJpZXMgaXMKPiB0YWtpbmcgbG9uZ2VyIHRoYW4gYSBmZXcg
ZGF5cy4gIElmIEkgcmV2aWV3IDMgcGF0Y2hlcyBvZiBhIDYtcGF0Y2gKPiBzZXJpZXMgb25lIGRh
eSwgcHJvYmFibHkgYmV0dGVyIHRvIGdpdmUgbWUgYSBjaGFuY2UgdG8gZmluaXNoIHRoZSBuZXh0
Cj4gZGF5IGJlZm9yZSBzZW5kaW5nIHZOKzEuIDotKSAgQnV0IGlmIEkgc3RhbGwgZm9yIGEgZmV3
IGRheXMsIGdvIGFoZWFkCj4gYW5kIHJlc2VuZC4KCk9rYXkgdGhhbmtzIGZvciB0aGUgY2xhcmlm
aWNhdGlvbi4gSSdsbCBwbGFuIG9uIHNlbmRpbmcgdjIgb25jZSBJIG1ha2UKdGhlc2UgY2hhbmdl
cyB0byBDcHVpZFBvbGljeUxpc3QuCgotTlIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
