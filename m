Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64903BFA32
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 21:39:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDZYf-0000NT-Qg; Thu, 26 Sep 2019 19:36:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eR0+=XV=gmail.com=aford173@srs-us1.protection.inumbo.net>)
 id 1iDZYd-0000NO-Ql
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 19:36:07 +0000
X-Inumbo-ID: e1e992be-e094-11e9-bf31-bc764e2007e4
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by localhost (Halon) with ESMTPS
 id e1e992be-e094-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 19:36:06 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q1so9730539ion.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 12:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uv8sypDhr4ui+8J14AcrUpiwkTC+Ius1tZ05+vuLNHk=;
 b=lFVH4DJZInfXaRXpqmiMEK9WpeSM/1iq4W9bn5uziJHuNnpDS5uJfwrrSMkKUYaoWu
 tjIzRew236DgZA4ISwubGuuzdkMEJIbQ8yLo4Gw4blLNNqTUJXJQc2T8EmFOMMaE/MZN
 TWI21uIOpWZV0B6kiTUPUzXP+86XUqzfSXBes1IbztoB6sCaCe2+0vHVrK7I1YSyHTRf
 vUusvWxQUo6svZWbb5qWyg1vE5i/0/5lEgToMxkxJ7QF/bNuxlBlDbD6OXf3ku60x8mI
 qYDnylEQgvdyDcRtg2M6u1XUP8jT9lELn92+Mho67HMmT8OkOdOtqWogr7E2TIwC5RUe
 rt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uv8sypDhr4ui+8J14AcrUpiwkTC+Ius1tZ05+vuLNHk=;
 b=c4vN2FmgIosFunsoaJlf3uGQwRdCTcvaFx2WunOxmqo4sBrpHHOzRdd0rthgHCzFCR
 o2ZRxBLRBaGe2nnaV82K85TMwZVPAnjRuYhRMU4MBbT33D1YwsfesB7igbth4UxkFlSF
 +WmbjFyoeNmwZp/Z0ROiYDtGGyH+A0ZXYGTcSDNtYphAlTA/IbFSkLPxUTwIblqxnSAP
 BQ7/enAAIKn2bhW7K1r9v72KPXdTyDO14ojynNDCGnUAechmWnAxDG8sPRAfz5N5eotg
 n7/Uk8tOglKLxK7nnX2SYF+fw2H/eZ4lb/KYI/GlX3TDnt2UGiYa+Se/3kbSmxbVIPHh
 oy/Q==
X-Gm-Message-State: APjAAAXxFClD6npU2jLfyPWfeOvv1ZkyIKq0nFGvdcL7ljSdonQHaJ7i
 X11FYr0LhxoQTdDihMEjHc0SlmWcrt3CXlfH7s8=
X-Google-Smtp-Source: APXvYqz6Gzzz4fph8SDTgwR3nXuuRIG8y0wd6XvcO9/S+doLjWzArUyv9IHucQgjs6f3GvWFnHs+ZCUo69B6L3/gML4=
X-Received: by 2002:a92:9912:: with SMTP id p18mr378753ili.78.1569526565531;
 Thu, 26 Sep 2019 12:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
In-Reply-To: <20190926160433.GD32311@linux.ibm.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 26 Sep 2019 14:35:53 -0500
Message-ID: <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [Xen-devel] [PATCH v2 00/21] Refine memblock API
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTE6MDQgQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51
eC5pYm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDg6
MDk6NTJBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkg
YXQgMTA6MTcgQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOToxNyBBTSBBZGFtIEZvcmQgPGFmb3Jk
MTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gSSB0cmllZCBjbWE9MjU2TSBhbmQg
bm90aWNlZCB0aGUgY21hIGR1bXAgYXQgdGhlIGJlZ2lubmluZyBkaWRuJ3QKPiA+ID4gPiBjaGFu
Z2UuICBEbyB3ZSBuZWVkIHRvIHNldHVwIGEgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgbGlrZQo+ID4g
PiA+IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8KPiA+ID4KPiA+ID4gSSBkb24ndCB0aGlu
ayBzby4KPiA+ID4KPiA+ID4gV2VyZSB5b3UgYWJsZSB0byBpZGVudGlmeSB3aGF0IHdhcyB0aGUg
ZXhhY3QgY29tbWl0IHRoYXQgY2F1c2VkIHN1Y2ggcmVncmVzc2lvbj8KPiA+Cj4gPiBJIHdhcyBh
YmxlIHRvIG5hcnJvdyBpdCBkb3duIHRoZSA5MmQxMmY5NTQ0YjcgKCJtZW1ibG9jazogcmVmYWN0
b3IKPiA+IGludGVybmFsIGFsbG9jYXRpb24gZnVuY3Rpb25zIikgdGhhdCBjYXVzZWQgdGhlIHJl
Z3Jlc3Npb24gd2l0aAo+ID4gRXRuYXZpdi4KPgo+Cj4gQ2FuIHlvdSBwbGVhc2UgdGVzdCB3aXRo
IHRoaXMgY2hhbmdlOgo+CgpUaGF0IGFwcGVhcnMgdG8gaGF2ZSBmaXhlZCBteSBpc3N1ZS4gIEkg
YW0gbm90IHN1cmUgd2hhdCB0aGUgaW1wYWN0CmlzLCBidXQgaXMgdGhpcyBhIHNhZmUgb3B0aW9u
PwoKCmFkYW0KCj4gZGlmZiAtLWdpdCBhL21tL21lbWJsb2NrLmMgYi9tbS9tZW1ibG9jay5jCj4g
aW5kZXggN2Q0ZjYxYS4uMWY1YTBlYiAxMDA2NDQKPiAtLS0gYS9tbS9tZW1ibG9jay5jCj4gKysr
IGIvbW0vbWVtYmxvY2suYwo+IEBAIC0xMzU2LDkgKzEzNTYsNiBAQCBzdGF0aWMgcGh5c19hZGRy
X3QgX19pbml0IG1lbWJsb2NrX2FsbG9jX3JhbmdlX25pZChwaHlzX2FkZHJfdCBzaXplLAo+ICAg
ICAgICAgICAgICAgICBhbGlnbiA9IFNNUF9DQUNIRV9CWVRFUzsKPiAgICAgICAgIH0KPgo+IC0g
ICAgICAgaWYgKGVuZCA+IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQpCj4gLSAgICAgICAgICAgICAg
IGVuZCA9IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQ7Cj4gLQo+ICBhZ2FpbjoKPiAgICAgICAgIGZv
dW5kID0gbWVtYmxvY2tfZmluZF9pbl9yYW5nZV9ub2RlKHNpemUsIGFsaWduLCBzdGFydCwgZW5k
LCBuaWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFn
cyk7Cj4KPiA+IEkgYWxzbyBub3RpY2VkIHRoYXQgaWYgSSBjcmVhdGUgYSByZXNlcnZlZCBtZW1v
cnkgbm9kZSBhcyB3YXMgZG9uZSBvbmUKPiA+IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIHRoZSAz
RCBzZWVtcyB0byB3b3JrIGFnYWluLCBidXQgd2l0aG91dCBpdCwgSQo+ID4gd2FzIGdldHRpbmcg
ZXJyb3JzIHJlZ2FyZGxlc3Mgb2YgdGhlICdjbWE9MjU2TScgb3Igbm90Lgo+ID4gSSBkb24ndCBo
YXZlIGEgcHJvYmxlbSB1c2luZyB0aGUgcmVzZXJ2ZWQgbWVtb3J5LCBidXQgSSBndWVzcyBJIGFt
IG5vdAo+ID4gc3VyZSB3aGF0IHRoZSBhbW91bnQgc2hvdWxkIGJlLiAgSSBrbm93IGZvciB0aGUg
dmlkZW8gZGVjb2RpbmcgMTA4MHAsCj4gPiBJIGhhdmUgaGlzdG9yaWNhbGx5IHVzZWQgY21hPTEy
OE0sIGJ1dCB3aXRoIHRoZSAzRCBhbHNvIG5lZWRpbmcgc29tZQo+ID4gbWVtb3J5IGFsbG9jYXRp
b24sIGlzIHRoYXQgZW5vdWdoIG9yIHNob3VsZCBJIHVzZSAyNTZNPwo+ID4KPiA+IGFkYW0KPgo+
IC0tCj4gU2luY2VyZWx5IHlvdXJzLAo+IE1pa2UuCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
