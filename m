Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9EC17A9F6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 17:01:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9su4-0001bD-Pm; Thu, 05 Mar 2020 15:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YpA2=4W=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j9su3-0001b8-Vg
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:59:16 +0000
X-Inumbo-ID: 4316517e-5efa-11ea-b74d-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4316517e-5efa-11ea-b74d-bc764e2007e4;
 Thu, 05 Mar 2020 15:59:15 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id n18so7371852edw.9
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2020 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n6bQtE4olv7uyLE7UpHat5pBvsEW9aeIE+sOENuC3h4=;
 b=bzwezNd9PvbKfMyAVnPTKfVxnLnvVoNlBzOvGwfqiAYjuABJci1yYu9sjRyCCg4SUD
 L3ld2kLYxXSNaas/V14uKWLTPJVW8R8gaNDxqJ5DmAiaGP+e0dgfQFCBFnOF86xfVc3h
 7bzJAnpJGVwHl0aQbZmvpJRIfmETMyGvZxQwO3XY+MXXvpJOvuOBDTHZrUqjdJQhWhPK
 XmKoCbAQCX/sOqCz3QWHLyyTKDvBS6Xy6NVvOfA+lFkvrotZqdB22IcNYXLehXCiF8lV
 x+Tds841rSOsSD/mk8Dp3XYUjK+t8ZpVVEbPcQ1elSwjWtE0CfaK+iwlAZ2hriHxedL1
 ozQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n6bQtE4olv7uyLE7UpHat5pBvsEW9aeIE+sOENuC3h4=;
 b=p7LLkTmG98rkFkmT1+6tD1OjRaCLoLyh8tVAqItL7D/5JO1rqIEwn7N3LxDVmPVswe
 rqCN+G/MZ4yECAgMJsaS0i8RqnBtbmyLQBaUzv63qP1TtmO3FJIodMM8Z/2N33Rm6Meu
 vdqB3kRw9IHKHwBZWGbCutq/BnLPXSFThH8C16gZys5alzPhwTWFOzTutdCT3ttmk83Z
 wohQZN2AhgZgwXd1li6sqhtD6TSx1ER2wwD6pIRWMYsxMbjPPlTILHUuQ9rBnpX/Glga
 vTfNhORso07F4gFSxrRYbfYf+5M2hbuyo5aLciAEDR+9o1x+jkmIzxyqAE1M8BOVI7Ka
 HHfA==
X-Gm-Message-State: ANhLgQ1MbuCz0Rrt2pcZga5LNFqdUAv1JvgGFhSI6vgHZYEqTgJFJ4xB
 m0CvuZJqmCrL5NK0y3WxJ328z8726TA=
X-Google-Smtp-Source: ADFU+vumem9f8JOS/Wc/Ls/34eCXCsdjTqye5EWBfKEWXzK4OO/QlotSApm4V0HS0vYI0LMyF56RvQ==
X-Received: by 2002:a17:906:e9b:: with SMTP id
 p27mr7874850ejf.62.1583423954262; 
 Thu, 05 Mar 2020 07:59:14 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id s21sm45546edw.73.2020.03.05.07.59.13
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 07:59:13 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id a132so6930273wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2020 07:59:13 -0800 (PST)
X-Received: by 2002:a1c:6583:: with SMTP id z125mr7305646wmb.51.1583423952816; 
 Thu, 05 Mar 2020 07:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <CABfawhkGxrj_bT2JwD5g7QPDYHYLCojuFPt8+p813REhyaiTSA@mail.gmail.com>
 <38dc7e483b0e4599834372a92ddc909c@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <38dc7e483b0e4599834372a92ddc909c@EX13D32EUC003.ant.amazon.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 5 Mar 2020 08:58:36 -0700
X-Gmail-Original-Message-ID: <CABfawhmUpbsKY9vZG8E5D76NvVNq+5abM72ZQAN_wPzCqSUyUA@mail.gmail.com>
Message-ID: <CABfawhmUpbsKY9vZG8E5D76NvVNq+5abM72ZQAN_wPzCqSUyUA@mail.gmail.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 "pdurrant@amzn.com" <pdurrant@amzn.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgNSwgMjAyMCBhdCA4OjM4IEFNIER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFt
YXpvbi5jby51az4gd3JvdGU6Cj4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBG
cm9tOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gPiBTZW50OiAwNSBN
YXJjaCAyMDIwIDE1OjEwCj4gPiBUbzogcGR1cnJhbnRAYW16bi5jb20KPiA+IENjOiBYZW4tZGV2
ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az47IEphbiBCZXVsaWNoCj4gPiA8amJldWxpY2hAc3VzZS5jb20+OyBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVu
Lm9yZz47IFJvZ2VyIFBhdSBNb25uw6kKPiA+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uCj4gPiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBL
b25yYWQgUnplc3p1dGVrIFdpbGsKPiA+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltIERlZWdhbiA8dGltQHhl
bi5vcmc+Cj4gPiBTdWJqZWN0OiBSRTogW0VYVEVSTkFMXVtQQVRDSCB2MyA1LzZdIG1tOiBhZGQg
J2lzX3NwZWNpYWxfcGFnZScgbWFjcm8uLi4KPiA+Cj4gPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9y
aWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuCj4gPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBz
ZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPiA+Cj4gPgo+ID4KPiA+IE9uIFRo
dSwgTWFyIDUsIDIwMjAgYXQgNTo0NSBBTSA8cGR1cnJhbnRAYW16bi5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gPiA+Cj4g
PiA+IC4uLiB0byBjb3ZlciB4ZW5oZWFwIGFuZCBQR0NfZXh0cmEgcGFnZXMuCj4gPiA+Cj4gPiA+
IFBHQ19leHRyYSBwYWdlcyBhcmUgaW50ZW5kZWQgdG8gaG9sZCBkYXRhIHN0cnVjdHVyZXMgdGhh
dCBhcmUgYXNzb2NpYXRlZAo+ID4gPiB3aXRoIGEgZG9tYWluIGFuZCBteSBiZSBtYXBwZWQgYnkg
dGhhdCBkb21haW4uIFRoZXkgc2hvdWxkIG5vdCBiZSB0cmVhdGVkCj4gPiA+IGFzICdub3JtYWwn
IGd1ZXN0IHBhZ2VzIChpLmUuIFJBTSBvciBwYWdlIHRhYmxlcykuIEhlbmNlLCBpbiBtYW55IGNh
c2VzCj4gPiA+IHdoZXJlIGNvZGUgY3VycmVudGx5IHRlc3RzIGlzX3hlbl9oZWFwX3BhZ2UoKSBp
dCBzaG91bGQgYWxzbyBjaGVjayBmb3IKPiA+ID4gdGhlIFBHQ19leHRyYSBiaXQgaW4gJ2NvdW50
X2luZm8nLgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIHRoZXJlZm9yZSBkZWZpbmVzIGlzX3NwZWNp
YWxfcGFnZSgpIHRvIGNvdmVyIGJvdGggY2FzZXMgYW5kCj4gPiA+IGNvbnZlcnRzIHRlc3RzIGlm
IGlzX3hlbl9oZWFwX3BhZ2UoKSB0byBpc19zcGVjaWFsX3BhZ2UoKSB3aGVyZQo+ID4gPiBhcHBy
b3ByaWF0ZS4KPiA+Cj4gPiBJbiBjb250ZXh0IG9mIFZNIGZvcmtpbmcsIGFyZSB0aGVzZSBwYWdl
cyBvbmx5IHVzZWQgYnkgc29tZSB0eXBlIG9mIFBWCj4gPiBtZWNoYW5pc20/IElmIG5vdCwgd291
bGQgd2UgbmVlZCB0byBnZXQgdGhlbSBjb3BpZWQgc29tZWhvdyBvciBhcmUKPiA+IHRoZXNlIHNl
dHVwIGR1cmluZyB0aGUgcmVndWxhciBjcmVhdGVkb21haW4gcm91dGluZT8gQ2FuIHRoZXkgYmUK
PiA+IGNvcGllZCBvbi1kZW1hbmQsIGllLiBkbyB0aGVzZSBwYWdlcyBwYXNzIGEgcDJtX2lzX3Jh
bSgpIGNoZWNrPwo+Cj4gUEdDX2V4dHJhIGRvbWhlYXAgcGFnZXMgYXJlIGludGVuZGVkIGFzIGRp
cmVjdCByZXBsYWNlbWVudHMgZm9yIHNoYXJlZCB4ZW5oZWFwIHBhZ2VzIGFuZCBzaG91bGQgYmUg
dHJlYXRlZCB0aGUgc2FtZSB3YXkuIFRodXMgdGhleSBkbyBub3QgZm9ybSBwYXJ0IG9mIHRoZSBt
aWdyYXRpb24gc3RyZWFtLiBUaGVpciBwMm0gdHlwZSBkZXBlbmRzIGVudGlyZWx5IG9uIGhvdyB0
aGV5IGFyZSBhZGRlZCB0byB0aGUgcDJtLCBhcyBpdCBpcyBmb3IgYW55IG90aGVyIHBhZ2UuCgpP
SywgdGhhbmtzLiBGb3IgdGhlIG1lbV9zaGFyaW5nIGJpdHM6CgpBY2tlZC1ieTogVGFtYXMgSyBM
ZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
