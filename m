Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28752D38C
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 04:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVnru-00048t-F8; Wed, 29 May 2019 01:59:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YOWO=T5=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hVnrs-00048m-N6
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 01:59:04 +0000
X-Inumbo-ID: 55a57310-81b5-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 55a57310-81b5-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 01:59:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559095143; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=qBjrKX+o0f+CqPV0JrkQ5LLZAZZ+gp3vWMTCVKnIhDw=;
 b=FUOcHrbd2/FvPYrMukuXaXVjvnE2xFaZyk+sZz/uF8wsSUN/K6YTNYMeimoz14+16PCfdsPr
 ocpMfqM/GQFx8GD7Sy70YkU1jd9WI5PqwVHTxkaK2mHEDo2iIHgWmLWSDgcVR5+XHvXe8dnx
 +dUE6gmc1+uu8WzLGFDtZB8FPTI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mxa.mailgun.org with ESMTP id 5cede766.7f3087261a30-smtp-out-n03;
 Wed, 29 May 2019 01:59:02 -0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id q26so625030lfc.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2019 18:59:02 -0700 (PDT)
X-Gm-Message-State: APjAAAXSeXledkGy4x82cFl2xu0XssviwMFI4ccXXXj8BENHHdNNg9M4
 Il/hYOyRNgSaMezXfMallYKbZYMoSKXDUanhuU4=
X-Google-Smtp-Source: APXvYqxK98P+oYZ2liAiHdbdAkSpMK2l91PnIpBqFz+bEai/qrwsVNiIYSLYwc4aPJvIYMCkt1wzNPRp4TUCWdGQ7hQ=
X-Received: by 2002:a19:ee0a:: with SMTP id g10mr28617348lfb.127.1559095141378; 
 Tue, 28 May 2019 18:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
 <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
In-Reply-To: <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 28 May 2019 18:58:25 -0700
X-Gmail-Original-Message-ID: <CABfawhkGCiRcCWrk4yKsNV88RJHrfV-_5-YyWe=NPKGcJbNb=A@mail.gmail.com>
Message-ID: <CABfawhkGCiRcCWrk4yKsNV88RJHrfV-_5-YyWe=NPKGcJbNb=A@mail.gmail.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBAVGFtYXMsIGlmIHlvdSBjb3VsZCBjaGVjayB0aGUgdHJhcHMgaW1wbGVtZW50YXRpb24uCgpJ
IGhhZCBhIHF1aWNrIGxvb2sgYW5kIGl0IHNlZW1zIGxpa2UgeW91IGZvcmdvdCB0byBzZXQgdGhl
IG1lbV9hY2Nlc3MKcGVybWlzc2lvbnMgb24gdGhlIHBhZ2VzLiBZb3UgbmVlZCB0aGUgcmVtYXBw
ZWQgZ2ZuJ3MgdG8gYmUgbWFya2VkCmV4ZWN1dGUtb25seSBpbiB0aGUgYWx0cDJtX2lkeCB2aWV3
LCBhbmQgdGhlaXIgYWN0dWFsIGdmbiBjb21wbGV0ZWx5CmluYWNjZXNzaWJsZSBpbiBhbHRwMm1f
aWR4LiBZb3UgbmVlZCB0byBzd2FwIHRoZSB2aWV3cyB3aGVuIHRob3NlCm1lbW9yeSBhY2Nlc3Mg
cGVybWlzc2lvbnMgYXJlIHZpb2xhdGVkIGFjY29yZGluZ2x5IHRvIHRoZSBob3N0cDJtIG9yCnRv
IHRoZSBhbHRwMm1faWRyIHZpZXcuIFdpdGhvdXQgdGhhdCBwYXRjaGd1YXJkIGlzIGdvaW5nIHRv
IGJsdWVzY3JlZW4KeW91LgoKQWxzbywgaWYgeW91IGNvcHkgY29kZSBmcm9tIHRoZSBEUkFLVlVG
IGNvZGUtYmFzZSBwbGVhc2UgbWFrZSBzdXJlIHlvdQphcHBseSB0aGUgbGljZW5zZSB0aGF0IGNv
bWVzIHdpdGggdGhhdCBjb2RlIChpdCdzIG5vdCBwbGFpbiBHUEwpLgoKVGhhbmtzLApUYW1hcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
