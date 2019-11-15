Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90674FE118
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:22:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdOl-0004Ao-QZ; Fri, 15 Nov 2019 15:20:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dUv=ZH=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iVdOk-0004Aj-OD
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:20:34 +0000
X-Inumbo-ID: 77be08b8-07bb-11ea-9631-bc764e2007e4
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77be08b8-07bb-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 15:20:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id n1so11360854wra.10
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 07:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=opyFnqAmbCKPGZ6r6pzPPWIAfa0IsJkSbwMrqNCdXE8=;
 b=b1dWFeeQYPFQpsCKWEZiHeu6s+IgwYnPWz+FeSUdiktq+uOYo/CHjs3DOcx8H3c4oA
 Gk2Ol1zSmZFEGw4ZgBzr3k4ZFL49vu58O9zuvgPTRtsPSfzB92ZfWpmYYjLMDbxTfTok
 8I6WH0flGo8qCc0SduO/B37wuKP67I8tsftH8EFN4w0n4y2qjFsGxfDGdv+GrxcCuHq1
 ogIKjB18eOfWwvJIC0VUbkuEmuokiSUVnO4ssBrAXABkt4LnIKpbbK6Mui+sDjPJWd83
 Ei0p0G0OvH3A2ahfD1Whe1yUgOMotZjE1obaaeHOI2cyWSHCiX/keBHuwIatKJzGhyb+
 LcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=opyFnqAmbCKPGZ6r6pzPPWIAfa0IsJkSbwMrqNCdXE8=;
 b=miBDH0RK0gWnMZ1wEZCHKZOz2DgeuTDcCt02Q4sd2OFQO6PpF2+PsIWOxqUHmt6MrZ
 JBLEJscOBJE1G8flS0KM5svqhR8LLlA/jbutoicB8ScYBYUlbZ6zOtFVrpTtCO0ufC0g
 XqRazpXyAQCo32uiAtoDzKiATdTY/l5fIfV3VjJwL8QcoTPEhf6rkpjwrOg3vaLqQQgq
 vNIDlMfN7BRDg7ODu2PGLkpThsrw7oWwFdheog3E/8r62X4UDZJ02bwl/Eiy5RWY5n3I
 g0A5Ssg6uhUdHGL/83yvgozys5aGMxMELPRSkcz4XQQLJ5tNxsBnJwjiRFNml4Xmb3EQ
 0Ujg==
X-Gm-Message-State: APjAAAXZc9cuJ9W8LeMfHlA7PV/oF29/5D2dw1razVTESFOkgMvvQZZ6
 nrsDKi0rV40GB0inJhNq5h7aTRTeqw3ZSQnszt4=
X-Google-Smtp-Source: APXvYqyXfJn5bF0uDGtYLXuEMeF10a54vpV32kXuB8KKU7x5ILW9JI86tFLVkAWciynF7iZXMHqAAy/rmFAWzTKBIxM=
X-Received: by 2002:a5d:6a8c:: with SMTP id s12mr10481593wru.353.1573831233314; 
 Fri, 15 Nov 2019 07:20:33 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhkB6M8sTMdSU2t+BQqfZ6jTQjU5k9Q3337Jx8APnowxZg@mail.gmail.com>
 <d981d5d9-6ee0-4bf6-6c76-a217be918aac@citrix.com>
 <CABfawhnyNcnizN1yr-GqiowJFbcWUAOxLegNUEELS84Ftfv6Eg@mail.gmail.com>
 <04b09c11-0983-f77a-055c-15cbb5b9ffd1@citrix.com>
In-Reply-To: <04b09c11-0983-f77a-055c-15cbb5b9ffd1@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 15 Nov 2019 08:19:56 -0700
Message-ID: <CABfawhma6ZW+DDfTr54CG9eF0=E1qHR_noWb6xETk_Bob7E3cg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [TESTDAY] Test report
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Juergen Gross <JGross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgNDo1NiBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDE0LzExLzIwMTkgMjI6MzYsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IE9uIFRodSwgTm92IDE0LCAyMDE5IGF0IDExOjM5IEFNIEFuZHJl
dyBDb29wZXIKPiA+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+PiBPbiAx
NC8xMS8yMDE5IDE4OjM0LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4+ICogQ29tbWVudHM6
IEFsbCB3b3JrcywgYWx0cDJtK2ludHJvc3BlY3Rpb24gcmVxdWlyZXMgdGhlIGVwdD1wbWw9MAo+
ID4+PiBib290IGZsYWcgc3BlY2lmaWVkIHRvIHdvcmthcm91bmQgYSBkZWFkbG9jayBpbiBYZW4K
PiA+PiBJcyB0aGlzIHNlcGFyYXRlIGZyb20gdGhlIGdlbmVyYWwgcHJvYmxlbSB3aXRoIEVQVCBB
L0QgYW5kCj4gPj4gd3JpdGUtcHJvdGVjdGluZyBwYWdldGFibGVzPwo+ID4+Cj4gPiBJdCBzb3Vu
ZHMgbGlrZSBpdCBpcywgaXQgaGFwcGVucyB3aXRob3V0IHdyaXRlLXByb3RlY3RpbmcgaW4tZ3Vl
c3QKPiA+IHBhZ2V0YWJsZXMuIEkgZGlkbid0IGhhdmUgdGltZSB0byBpbnZlc3RpZ2F0ZSB3aGVy
ZSB0aGUgZGVhZGxvY2sKPiA+IGhhcHBlbnMgYW5kIHNpbmNlIHRoZSB3b3JrYXJvdW5kIGlzIGZp
bmUgZm9yIHRoZSB1c2VjYXNlIGl0IHdhc24ndCBhCj4gPiBwcmlvcml0eSB0byBmaWd1cmUgb3V0
Lgo+Cj4gVGhpbmtpbmcgYWJvdXQgaXQsIFBNTCB3aWxsIGRvIHRoZSB3cm9uZyB0aGluZyAoZGVh
ZGxvY2tzIGFzaWRlKSBhcyBzb29uCj4gYXMgYW55IGFsdHAybSBnZm4gdHJhbnNsYXRpb25zIGFy
ZSB1c2VkLgo+Cj4gSSdkIGJlIHRlbXB0ZWQgdG8gd29yayBhcm91bmQgdGhlIGRlYWRsb2NrIGJ5
IGRpc2FibGluZyBwbWwgdGhlIG1vbWVudAo+IGFsdHAybSBpcyB0b3VjaGVkLiAgVGhhdCB3b3Vs
ZCBnaXZlIGEgc2lnaHRseSBsZXNzIGJhZCB1c2VyIGV4cGVyaWVuY2UsCj4gYW5kIHNob3VsZCBi
ZSBlYXN5IHRvIHNvcnQgZm9yIDQuMTMuCj4KPiBUaG91Z2h0cywgKGluYy4gSnVlcmdlbiBhcyBS
TSkgPwoKVGhhdCBzb3VuZHMgbGlrZSBhIGdvb2QgaWRlYSB0byBtZSwgdGhhdCB3YXkgeW91IGNh
biBrZWVwIHBtbCBmb3IKZ3Vlc3RzIHdoZXJlIGl0IGRvZXNuJ3QgY2F1c2UgYW4gaXNzdWUgaW5z
dGVhZCBvZiBkaXNhYmxpbmcgaXQgc3lzdGVtCndpZGUuCgpUYW1hcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
