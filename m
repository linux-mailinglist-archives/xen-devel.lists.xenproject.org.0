Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD017A896
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 16:12:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9s92-0005kb-Hj; Thu, 05 Mar 2020 15:10:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YpA2=4W=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j9s90-0005kS-S2
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:10:39 +0000
X-Inumbo-ID: 786e1f7a-5ef3-11ea-8eb5-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 786e1f7a-5ef3-11ea-8eb5-bc764e2007e4;
 Thu, 05 Mar 2020 15:10:38 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id cq8so6475704edb.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2020 07:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cx0kIX0h2ckGsJg00b6R8CEvwgw/GaEZS9nlACb3J+w=;
 b=a5ra6mAmC75HIBC67a7X1pwgT5ykQS7VmDewvInJE8QAEIEMnj76c/wKUKMKRs13ic
 30qQeoKnlknz/VHIU8JDnNCGYGHOaSu0m3DHl1ZRMRtHd1e/bA7UgmyMX6W1FiyiOLi4
 8fyh6ni2dxQ+R8taO7CeH2vkuNjW32hKvjJ57gqVXeVy6OPHRJdixitSOmzz2cbd5mlN
 T5sfm6qX+TgUzjkVnEbyxJPFPNli9mGi78koc6XWvGxMu1sKMNblZte98CBSyDRAplnN
 dCwigghN9xlRs4sddj2yXGT6q46i544KxfO+50Mjm8smiQK5EreTHrMiV2f172as+JMA
 rJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cx0kIX0h2ckGsJg00b6R8CEvwgw/GaEZS9nlACb3J+w=;
 b=bAiSCSMPgiMNUOyQuoAdSZ22pW/f/HD61CLxkD0tvldYGtTH1S+aLKOLNWWWAOha1f
 UCxo/mZLFH1fPK5kZVq0PBNvCe2KQ3wl4rC1mua/YQSgUMdaBEjd/nbnPY9EWKgw5djT
 BU2n430BCExAFqnnZsnwCohbfXIGc1BkKPEPTKWe9Rm6fREddjGnMgLVmKax3tQOoAm5
 s3MU5QFFe55CbW86JMe8EV7CciIjAY63semrMsBnncyl5lY15O4dswiey5iTT/GJUjXl
 ZeFCRq9cR47dBnm5cDYplfXXGkz+muZH8iHilh5BOFkkuEF4pXmh38YdzAjpdZFGJCyb
 iehQ==
X-Gm-Message-State: ANhLgQ1/XxG5Zj87i8XHdMHcVChEpG10uxRmPk2rOkmYwkTifohTb51Q
 W4ht0i4LW5DUbODMMP0xsACEMUjaKEI=
X-Google-Smtp-Source: ADFU+vuVRsT3bPmGBWqAyXpRLgXUvTXNl5xKWsArh4STgkPVni+dEu7yF8RqKh45JYLtWtuzNdEh5w==
X-Received: by 2002:a17:906:57c7:: with SMTP id
 u7mr7722510ejr.135.1583421037241; 
 Thu, 05 Mar 2020 07:10:37 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id l19sm839864eja.8.2020.03.05.07.10.27
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 07:10:36 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id r7so7480686wro.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2020 07:10:27 -0800 (PST)
X-Received: by 2002:a05:6000:2:: with SMTP id
 h2mr11264554wrx.182.1583421018893; 
 Thu, 05 Mar 2020 07:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
In-Reply-To: <20200305124504.3564-6-pdurrant@amzn.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 5 Mar 2020 08:09:42 -0700
X-Gmail-Original-Message-ID: <CABfawhkGxrj_bT2JwD5g7QPDYHYLCojuFPt8+p813REhyaiTSA@mail.gmail.com>
Message-ID: <CABfawhkGxrj_bT2JwD5g7QPDYHYLCojuFPt8+p813REhyaiTSA@mail.gmail.com>
To: pdurrant@amzn.com
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgNSwgMjAyMCBhdCA1OjQ1IEFNIDxwZHVycmFudEBhbXpuLmNvbT4gd3JvdGU6
Cj4KPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4KPiAuLi4gdG8g
Y292ZXIgeGVuaGVhcCBhbmQgUEdDX2V4dHJhIHBhZ2VzLgo+Cj4gUEdDX2V4dHJhIHBhZ2VzIGFy
ZSBpbnRlbmRlZCB0byBob2xkIGRhdGEgc3RydWN0dXJlcyB0aGF0IGFyZSBhc3NvY2lhdGVkCj4g
d2l0aCBhIGRvbWFpbiBhbmQgbXkgYmUgbWFwcGVkIGJ5IHRoYXQgZG9tYWluLiBUaGV5IHNob3Vs
ZCBub3QgYmUgdHJlYXRlZAo+IGFzICdub3JtYWwnIGd1ZXN0IHBhZ2VzIChpLmUuIFJBTSBvciBw
YWdlIHRhYmxlcykuIEhlbmNlLCBpbiBtYW55IGNhc2VzCj4gd2hlcmUgY29kZSBjdXJyZW50bHkg
dGVzdHMgaXNfeGVuX2hlYXBfcGFnZSgpIGl0IHNob3VsZCBhbHNvIGNoZWNrIGZvcgo+IHRoZSBQ
R0NfZXh0cmEgYml0IGluICdjb3VudF9pbmZvJy4KPgo+IFRoaXMgcGF0Y2ggdGhlcmVmb3JlIGRl
ZmluZXMgaXNfc3BlY2lhbF9wYWdlKCkgdG8gY292ZXIgYm90aCBjYXNlcyBhbmQKPiBjb252ZXJ0
cyB0ZXN0cyBpZiBpc194ZW5faGVhcF9wYWdlKCkgdG8gaXNfc3BlY2lhbF9wYWdlKCkgd2hlcmUK
PiBhcHByb3ByaWF0ZS4KCkluIGNvbnRleHQgb2YgVk0gZm9ya2luZywgYXJlIHRoZXNlIHBhZ2Vz
IG9ubHkgdXNlZCBieSBzb21lIHR5cGUgb2YgUFYKbWVjaGFuaXNtPyBJZiBub3QsIHdvdWxkIHdl
IG5lZWQgdG8gZ2V0IHRoZW0gY29waWVkIHNvbWVob3cgb3IgYXJlCnRoZXNlIHNldHVwIGR1cmlu
ZyB0aGUgcmVndWxhciBjcmVhdGVkb21haW4gcm91dGluZT8gQ2FuIHRoZXkgYmUKY29waWVkIG9u
LWRlbWFuZCwgaWUuIGRvIHRoZXNlIHBhZ2VzIHBhc3MgYSBwMm1faXNfcmFtKCkgY2hlY2s/CgpU
aGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
