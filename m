Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E31808CC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 21:09:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBl9L-0004VA-Nf; Tue, 10 Mar 2020 20:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QuO/=43=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jBl9K-0004V5-Ji
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 20:06:46 +0000
X-Inumbo-ID: aa9735b6-630a-11ea-92cf-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa9735b6-630a-11ea-92cf-bc764e2007e4;
 Tue, 10 Mar 2020 20:06:45 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q9so5351009lfc.10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 13:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h5NbWVOwP2YhCXQpPtTgA514O6PRvSKzrnzDR2AA1lI=;
 b=ZvcXlz+RM4JL5F4hE5s96tzlkU8bv/dagEztoacxcklZ2hWjVE3l9crDgfh2n6QcTD
 Q7dLmvapXf/B3cxp+swOnAjBTt3sd4bKKB1Fv5WNQW1glXxPdiX9Rl/HqzGqWv7Z3jhd
 X5Zo2kr7uv0QNdsLGGM7j2Ifmz0abQ/CXJv10lwa2BjhDuQY0IbtBm+MLveDKnvIdr68
 bhCGG3pySMiIGD4ef9h1I8EoATBICQtGYkdM4wI1efchlGnqsjdbgKLrrAFl51PttaDb
 Z2+oIRWn7vdgnTbIlZE/IqVVv7SI4QKdSn7mH1o9R6W8+owE1ivPHiVZxUDrjzYsX40M
 K/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5NbWVOwP2YhCXQpPtTgA514O6PRvSKzrnzDR2AA1lI=;
 b=O4auaFJelq/jw8Gfm1nLUtG9ioa+FxLwSfGjpRN0qJ80/130asiHJopUihnvH0wnHK
 krd0pSuV4vAD2R3yTk73PAYx9+NSqagrujCqozGz0u8dIV7y2NA+uEh1+80lSf4COeH7
 xrmzw2kMHIvh+AQDpnIbtViGVPdclIYhBhJBx/lQlGv70J0wCjs7HDXMEiLBSMCMnT7A
 GdVmfHz8vdf7RC3r69c3v0lZCnKBqQdp9Md5jo2UUf/iyIO5xsax5+rMGz6tKaHKCASg
 amJ6Q+9b+BNIDXUFI1N2mwKANjvxiBbZKM/r9GREpioQhWug2eqalTHivUXDHhqKhIkC
 eOYA==
X-Gm-Message-State: ANhLgQ0lqktIXB/00P6GAo4SCvau+LcgG21nv+azDO85PWG9egnpEJ9T
 J8532eHhmTsotXwbkPGfzIvR+KeXA/r6oVYVNjY=
X-Google-Smtp-Source: ADFU+vsVUFnOY1Rxf4OVv2GIdHw3KUAZbnI7h66m90VJVbYgRzbUeBDIX8wEH++aYcESE/9V+bZ2ABD3/rlx70iglkI=
X-Received: by 2002:a19:6d0d:: with SMTP id i13mr2956029lfc.105.1583870804600; 
 Tue, 10 Mar 2020 13:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200310132904.16992-1-jandryuk@gmail.com>
 <24167.46462.266537.781520@mariner.uk.xensource.com>
In-Reply-To: <24167.46462.266537.781520@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 10 Mar 2020 16:06:33 -0400
Message-ID: <CAKf6xpseFVzvfZhm=0GqLkGyPe4vqtMpAKA5JgzLzAafxTqb3w@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH] scripts: Use stat to check lock claim
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMTE6NDMgQU0gSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gSmFzb24gQW5kcnl1ayB3cml0ZXMgKCJbUEFUQ0hdIHNj
cmlwdHM6IFVzZSBzdGF0IHRvIGNoZWNrIGxvY2sgY2xhaW0iKToKPiA+IFJlcGxhY2UgdGhlIHBl
cmwgbG9ja2luZyBjaGVjayB3aXRoIHN0YXQoMSkuICBTdGF0IGlzIGFibGUgdG8gZnN0YXQKPiA+
IHN0ZGluIChmaWxlIGRlc2NyaXB0b3IgMCkgd2hlbiBwYXNzZWQgJy0nIGFzIGFuIGFyZ3VtZW50
LiAgVGhpcyBpcyBub3cKPiA+IHVzZWQgdG8gY2hlY2sgJF9sb2NrZmQuICBzdGF0KDEpIHN1cHBv
cnQgZm9yICctJyB3YXMgaW50cm9kdWNlZCB0bwo+ID4gY29yZXV0aWxzIGluIDIwMDkuCj4gPgo+
ID4gQWZ0ZXIgQSByZWxlYXNlcyBpdHMgbG9jaywgc2NyaXB0IEIgd2lsbCByZXR1cm4gZnJvbSBm
bG9jayBhbmQgZXhlY3V0ZQo+ID4gc3RhdC4gIFNpbmNlIHRoZSBsb2NrZmlsZSBoYXMgYmVlbiBy
ZW1vdmVkIGZyb20gQSwgc3RhdCBwcmludHMgYW4gZXJyb3IKPiA+IHRvIHN0ZGVyciBhbmQgZXhp
dHMgbm9uLXplcm8uICAnfHwgOicgaXMgbmVlZGVkIHRvIHNxdWFzaCB0aGUgbm9uLXplcm8KPiA+
IGV4aXQgc3RhdHVzIC0gb3RoZXJ3aXNlIHRoZSBzY3JpcHQgdGVybWluYXRlcyBzaW5jZSBgc2V0
IC1lYCBpcyBlbmFibGVkLgo+ID4gc3RkZXJyIG5lZWRzIHRvIGJlIHJlZGlyZWN0ZWQgdG8gL2Rl
di9udWxsIG90aGVyd2lzZQo+ID4gL3Zhci9sb2cveGVuL3hlbi1ob3RwbHVnLmxvZyB3aWxsIGdl
dCBmaWxsZWQgd2l0aCAiTm8gc3VjaCBmaWxlIG9yCj4gPiBkaXJlY3RvcnkiIG1lc3NhZ2VzLgo+
Cj4gVGhhbmtzLiAgVGhpcyBpcyBsb29raW5nIGdvb2QuCj4KPiBJIGhhdmUgdHdvIG5pdHM6Cj4K
PiA+IFdoaWxlIGhlcmUsIHJlcGxhY2Ugc29tZSB0YWJzIHdpdGggc3BhY2VzIHRvIG1hdGNoIHRo
ZSByZXN0IG9mIHRoZSBmaWxlLgo+Cj4gUGxlYXNlIGNhbiB5b3UgZG8gdGhpcyBpbiBhIHNlcGFy
YXRlIHBhdGNoLCBpZGVhbGx5IGJlZm9yZWhhbmQuICAoSQo+IGRvbid0IHRoaW5rIHRoaXMgaXMg
YSBibG9ja2VyIGluIHRoaXMgY2FzZSwgZ2l2ZW4gaG93IHNtYWxsIHRoaXMgcGF0Y2gKPiBpcy4p
CgpTdXJlLCBJIGNhbiBkbyB0aGF0LgoKPiA+ICsgICAgICAgIHN0YXQ9JCggc3RhdCAtTCAtYyAn
JUQuJWknIC0gJF9sb2NrZmlsZSAwPCYkX2xvY2tmZCAyPi9kZXYvbnVsbCB8fCA6ICkKPiA+ICsg
ICAgICAgIGlmIFsgLW4gIiRzdGF0IiBdOyB0aGVuCj4gPiArICAgICAgICAgICAgZmRfc3RhdD0k
KCBlY2hvICIkc3RhdCIgfCBzZWQgLW4gJzFwJyApCj4gPiArICAgICAgICAgICAgZmlsZV9zdGF0
PSQoIGVjaG8gIiRzdGF0IiB8IHNlZCAtbiAnMnAnICkKPiA+ICsgICAgICAgICAgICBpZiBbICIk
ZmRfc3RhdCIgPSAiJGZpbGVfc3RhdCIgXSA7IHRoZW4gYnJlYWs7IGZpCj4KPiBJIHRoaW5rIHlv
dSBkb24ndCBuZWVkIHNlZCBoZXJlOgo+Cj4gJCBscyAtbGkgdCB1Cj4gODQ0MzA3IC1ydy1ydy1y
LS0gMSBpd2ogaXdqIDExNzg0NCBPY3QgMzEgMTI6NTAgdAo+IDgyNjQxNyAtcnctci0tci0tIDEg
aXdqIGl3aiAgIDE3NjUgSmFuIDMxICAyMDE5IHUKPiAkIGJhc2ggLWMgJ3g9JCggc3RhdCAtTCAt
YyAiJUQuJWkiIHQgdSAyPi9kZXYvbnVsbCB8fCA6ICk7IGVjaG8gJHt4JQo+ICp9ID0gJHt4IyoK
PiB9Jwo+IGZlMDQuODQ0MzA3ID0gZmUwNC44MjY0MTcKPiAkCj4KPiBUaGUgc3ludGF4ICh3aXRo
IG5ld2xpbmVzIHdpdGhpbiB0aGUgJHsgfSkgaXMgYSBiaXQgb2RkIGJ1dCBub3QKPiBpbnZva2lu
ZyBzZWQgaGVyZSB3aWxsIGJlIGZhc3Rlci4KCldoZW4gdGhlIGxvY2tmaWxlIGlzIHJlbW92ZWQs
IHdlIG9ubHkgaGF2ZSBvbmUgbGluZSBvZiBvdXRwdXQuICBUaGUKYWJvdmUgY29uc3RydWN0cyBk
byBub3RoaW5nIGluIHRoYXQgY2FzZSwgc28gdGhlIHN1YnN0aXR1dGVkIHZhbHVlcwphcmUgaWRl
bnRpY2FsLiAgKFRoYXQgd2FzIG9uZSBiZW5lZml0IG9mIHNlZCBjb21iaW5lZCB3aXRoIGVuc3Vy
ZQp0aGVyZSB3YXMgc29tZSBvdXRwdXQpLgoKVGhpcyBjb3VsZCBiZSB3b3JrZWQgYXJvdW5kIGJ5
IGRvaW5nCiAgaWYgc3RhdD0kKCBzdGF0IC1MIC4uLi4pIDsgdGhlbgpEcm9wcGluZyBgfHwgOmAg
dG8gZW5zdXJlIG9ubHkgc3VjY2Vzc2Z1bCBleGVjdXRpb25zIGFyZSBwcm9jZXNzZWQuClNpbmNl
IGl0J3MgaW4gYW4gImlmIiwgYHNldCAtZWAgZG9lc24ndCB0ZXJtaW5hdGUgdGhlIHNjcmlwdC4K
Cj4gQWx0ZXJuYXRpdmVseSwgaWYgeW91IGRvbid0IG1pbmQgdXNpbmcgLS1wcmludGYgaW5zdGVh
ZCBvZiAtYywKPgo+ICQgYmFzaCAtYyAneD0kKCBzdGF0IC1MIC0tZm9ybWF0ICIlRC4laSAiIHQg
dSAyPi9kZXYvbnVsbCB8fCA6ICk7IGVjaG8gJHt4JSUgKn0gPSAke3gjKiB9Jwo+IGZlMDQuODQ0
MzA3ID0gZmUwNC44MjY0MTcKPiAkCj4KPiBJIGRvbid0IGtub3cgd2hlbiAtLWZvcm1hdCB3YXMg
aW50cm9kdWNlZC4KCkxvb2tzIGxpa2UgLS1wcmludGYgd2FzIGludHJvZHVjZWQgaW4gMjAwNS4g
IEkgdGhpbmsgSSBwcmVmZXIgdGhpcyB0bwpoYXZpbmcgdGhlIG5ld2xpbmVzLiAgWW91IHN0aWxs
IGhhdmUgc29tZSBvZiB0aGUgc3RyaW5nIHN1YnN0aXR1dGlvbgpjb25jZXJucywgYnV0IEkgdGhp
bmsgdGhpbmsgcmVseWluZyBvbiBhIHN1Y2Nlc3NmdWwgc3RhdCgxKSBjYWxsIHRvCmdpdmUgdHdv
IG91dHB1dCB2YWx1ZXMgaXMgcmVhc29uYWJsZS4KCj4gSSdtIHNvcnJ5IHRvIGJvdW5jZSB0aGUg
cGF0Y2ggb3ZlciBzdWNoIGEgc21hbGwgdGhpbmcsIGJ1dCB0aGlzIGlzCj4gcGF0aCBpcyBhbHJl
YWR5IHF1aXRlIHNsb3cgYW5kIGlzIGNyaXRpY2FsIGZvciBkb21haW4gY3JlYXRpb24gYW5kIEkK
PiB3b3VsZCBwcmVmZXIgbm90IHRvIGFkZCAodHdvKSBhZGRpdGlvbmFsIHN1YnByb2Nlc3MgaW52
b2NhdGlvbnMgaGVyZS4KCk5vIHdvcnJpZXMuCgpSZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
