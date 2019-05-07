Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B351661D
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 16:58:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO1V1-0005RV-W4; Tue, 07 May 2019 14:55:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iMQz=TH=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1hO1V0-0005RQ-Fp
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 14:55:18 +0000
X-Inumbo-ID: 1fff141b-70d8-11e9-843c-bc764e045a96
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1fff141b-70d8-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 14:55:17 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id l25so19017555eda.9
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2019 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJk8fp8mSUdbliBCbFe2BOJvnOxM3deAiKxW1O6aBuo=;
 b=MvrnTbU4e5voYMhh+GtgHBFxxQD+MPN4PqI6HbotFS5hMJBLDgrSTyNBd+Tb5JmUuj
 YVEV9LUXSFkWNKG+VEZt1xYVzyKiers6tWDAET0I4OeOMOMISPzfSParB+AZZzQasOL1
 ZsqXrtndZ8pwfwgM9nIu0y2IiX3SBy1UZqlMTqvKk2LVLoBf5v7hzzgT+V43IBGGF9n7
 fzTzAb8yQ+XRtG1m3neEukZRVPDFilSBt5jTa/qBAaCjjCIsPVxr6yyjOb9Gk9MfMbKx
 yqXIkrv4iODcnnWqZtHFYLZxEiQnUdjrCIN2dxUifJnJu2sZP+7EWmXuprNtNBpOPL82
 fOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJk8fp8mSUdbliBCbFe2BOJvnOxM3deAiKxW1O6aBuo=;
 b=QjdDE03nL8bktvBjN+1Q0sSnbBezvo31PmhDcjC+LqyMppG8vr8srOkRbi2IFcLmi1
 XcGm6aRQeI2Ar5zp0uymE5GG/Azqd6nOUzMlZK5a+089Bsuy4Zu/P9iCIGNsyNoIU2Tb
 LR1nGVyhCvjTaeJ/XrI4nU1izdG86JSRQ0hHNpY9xtmEw6vfml+v2HgFCs06s9m+WZKl
 bohOEbvmAErjEeZP32kdpu9OCxeMBv1XnjVc818BYdZfYa2/+HeD5j96cVChh5G2GmHk
 eRTg9uV9m4hwSbMj0iAa5xOov3FLJNYldJw0HAbRqrklqp0CL6ZPYttpKFHHHLDdUUiC
 WYXA==
X-Gm-Message-State: APjAAAUS/sa1VHmAm7c+LljbOvhZTus98m3fHleKAQ3kHlLeTmQX97h/
 8WEqS8Ux5oBvWXF8nA5sQhHAAc8PA0kKJclkixMENktBk4Y=
X-Google-Smtp-Source: APXvYqw4/Bpwg+il+y39yapTW0wDohUG07J05r1ZXxx4X5/PbkyMihMZA+pt73usMNfugMM7ocd5oYYr+ZtJKshCyqg=
X-Received: by 2002:a50:9958:: with SMTP id l24mr34060667edb.92.1557240916017; 
 Tue, 07 May 2019 07:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <vm38DtaWfYfOKuJdFi97GKwVhfrcA_zNOlg8JBws649kHxCZIAvsacvlzD3mhKXcQayhbWuGTO0sclmj1xvNmj72jdAe3Qw4XUrGt6MFcpI=@protonmail.com>
In-Reply-To: <vm38DtaWfYfOKuJdFi97GKwVhfrcA_zNOlg8JBws649kHxCZIAvsacvlzD3mhKXcQayhbWuGTO0sclmj1xvNmj72jdAe3Qw4XUrGt6MFcpI=@protonmail.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Tue, 7 May 2019 15:55:04 +0100
Message-ID: <CAFLBxZZko=RFfP=RjMLW6MGyBmDdo2My82GDt6tdjuXxgq_6xQ@mail.gmail.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: [Xen-devel] Improve build system for offline environments
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCAxOjU1IFBNIE1hdGhpZXUgVGFycmFsCjxtYXRoaWV1LnRh
cnJhbEBwcm90b25tYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IEFzIHN0YXRlZCBieSB0aGUg
ZG9jdW1lbnRhdGlvbjoKPiAiX1hlbiBQcm9qZWN0IGRvd25sb2FkcyB2YXJpb3VzIGRlcGVuZGVu
Y2llcyBhdCBidWlsZCB0aW1lXyIKPgo+IFRoaXMgbWFrZXMgWGVuIGEgZGlmZmljdWx0IHByb2pl
Y3QgdG8gd29yayB3aXRoIGluIGFuIG9mZmxpbmUgZW52aXJvbm1lbnQuCgpUaGVyZSBhcmUgbG90
cyBvZiBwZW9wbGUgd2hvIHdvdWxkIGxpa2UgdG8gc2VlIHRoaXMgY2hhbmdlZC4gIEl0J3MKanVz
dCBub3QgY2xlYXI6CgoxLiBXaGF0IHRoZSBiZXN0IHNvbHV0aW9uIHdvdWxkIGJlLCBhbmQKMi4g
V2hvIHdvdWxkIGRvIHRoZSB3b3JrLgoKRldJVyBJIHRoaW5rIG1vc3QgZGlzdHJvcyBoYXZlIGxv
Y2tlZC1vZmYgYnVpbGQgc3lzdGVtcy4gIEhvdyBpdCdzCm5vcm1hbGx5IGRvbmUgaXM6CgoxLiBE
aXNhYmxlIG1vc3QgZnVuY3Rpb25hbGl0eSAoc2VhYmlvcywgb3ZtZiwgJmMpIGFuZCBidWlsZCBp
dCBpbiBhCnNlcGFyYXRlIHBhY2thZ2UKMi4gRm9yIHN1YnRyZWVzIHlvdSBkbyBuZWVkLCBtYWtl
IGEgdGFyYmFsbCBhbmQgdW4tdGFyIHRoZW0gYXMgcGFydCBvZgp0aGUgYnVpbGQgcHJvY2Vzcy4K
CllvdSBjYW4gdGFrZSBhIGxvb2sgYXQgaG93IHRoaXMgaXMgZG9uZSBmb3IgdGhlIHRoZSBDZW50
T1MgWGVuIHBhY2thZ2VzIGhlcmU6CgpodHRwczovL2dpdGh1Yi5jb20vQ2VudE9TLXZpcnQ3L3hl
bgoKPiBUaGFua3MgdG8gdGhlIElSQyBjaGFubmVsLCBJIGhlYXJkIG9mIHRoZSBjb21tYW5kCj4g
YG1ha2Ugc3VidHJlZS1mb3JjZS11cGRhdGUtYWxsYAo+IChXZSBjb3VsZCBkb2N1bWVudCB0aGlz
IG9wdGlvbiBpbiB0aGUgd2lraSAiQ29tcGlsaW5nIFhlbiBGcm9tIFNvdXJjZSIpCj4KPiBIb3dl
dmVyLCB0aGUgb3ZlcmFsbCBwcm9jZXNzIHN0YXlzIHByb2JsZW1hdGljOgo+Cj4gMS4gdGhlIHRh
cmdldCAnc3VidHJlZS1mb3JjZS11cGRhdGUtYWxsJyBpbXBsaWVzIHRoYXQgeW91IGNhbiBydW4g
YSAuL2NvbmZpZ3VyZSwKPiBvdGhlcndpc2UgeW91IHdpbGwgZ2V0IHRoZSBmb2xsb3dpbmcgZXJy
b3I6Cj4KPiBtYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgJ34veGVuL3Rvb2xzLycKPiB+L3hl
bi90b29scy8uLi90b29scy9SdWxlcy5tazoyNTg6ICoqKiBZb3UgaGF2ZSB0byBydW4gLi9jb25m
aWd1cmUgYmVmb3JlIGJ1aWxkaW5nIG9yIGluc3RhbGxpbmcgdGhlIHRvb2xzLiBTdG9wLgo+Cj4g
VGhpcyBpcyBzb21ldGltZXMgbm90IHBvc3NpYmxlIGJlY2F1c2UgeW91IGFyZSBpbiBhIGRvd25s
b2FkLW9yaWVudGVkCj4gYW5kIGxvY2tlZCBlbnZpcm9ubWVudCwgYW5kIHRoZXJlZm9yZSBsYWNr
IHRoZSBzeXN0ZW0gZGVwZW5kZW5jaWVzIHJlcXVpcmVkIGZvciB0aGUgY29uZmlndXJlLgo+Cj4g
QWxzbyB5b3UgZG9uJ3QgaGF2ZSB0aGUgcm9vdCBwcml2aWxlZ2VzIHRvIGluc3RhbGwgdGhlbS4K
CkJ1dCBpdCB3aWxsICphbHNvKiBmYWlsIHRvIGJ1aWxkIChzYXkpIHFlbXUgaW4gdGhpcyBzaXR1
YXRpb24sIHNpbmNlCml0J3MgaW4gdGhlIHRvb2xzIGRpcmVjdG9yeSwgd29uJ3QgaXQ/ICBJZiB0
aGUgZG93bmxvYWQgZmFpbHMgZHVlIHRvCmBjb25maWd1cmVgIGZhaWxpbmcsIGhvdyB3b3VsZCB0
aGUgYnVpbGQgc3VjY2VlZCBldmVuIGlmIGRvd25sb2FkCmRpZG4ndCBkZXBlbmQgb24gYGNvbmZp
Z3VyZWA/Cgo+IFRoaXMgaXMgd2h5IEkgd291bGQgbGlrZSB0byBzdGFydCBhIGRpc2N1c3Npb24g
b24gaG93IHRvCj4gaW1wcm92ZSB0aGUgc2l0dWF0aW9uIGZvciB0aG9zZSB3b3JraW5nIGluIGFu
IGFpci1nYXBwZWQgbmV0d29yayBlbnZpcm9ubWVudC4KCkFueSBjaGFuY2UgeW91IGNvdWxkIG1h
a2UgaXQgdG8gdGhlIFhlbiBEZXZlbG9wZXIgU3VtbWl0PyAgV2UnbGwKcHJvYmFibHkgaGF2ZSBh
IHNlc3Npb24gb24gaG93IHRvIGltcHJvdmUgdGhlIGJ1aWxkIHN5c3RlbToKCmh0dHBzOi8vZGVz
aWduLXNlc3Npb25zLnhlbnByb2plY3Qub3JnL3VpZC9kaXNjdXNzaW9uL2Rpc2NfQ3FqWDhmemVR
N01xaWZrQ1ljekUvdmlldwoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
