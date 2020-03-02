Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E31766CD
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 23:21:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8tOS-0002xo-5o; Mon, 02 Mar 2020 22:18:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N5jH=4T=gmail.com=yyankovskyi@srs-us1.protection.inumbo.net>)
 id 1j8tOR-0002xj-6P
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 22:18:31 +0000
X-Inumbo-ID: befa2208-5cd3-11ea-902a-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id befa2208-5cd3-11ea-902a-bc764e2007e4;
 Mon, 02 Mar 2020 22:18:30 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a132so833191wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2020 14:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7SzOkQ6sd0S38QbCyvRBb51L6pZuZ/wIs7mZk/AE8Pw=;
 b=kgawhBRi1VrmDrFQgMsBn4QCL75ooMSD9VNmosY5S3toaV/UEeN1KOGOzB9S+PihJ2
 VgcendwtfFF8Yuro0+zjcX244T16q40fqWiIgydyr3QsTRB4Ah7hMJfeNJdeikmYMhaf
 8OsvnXkbeahCDsIwE0bc/Pf9vIggdDY+JQ9yu4QR6mavsRFL5PFtCafZFAwx+dB3OyWc
 FE82+w+okkwiBhn5h1tDzh/7lZ4Qxnnvq9RKZ5egWB+mGT4tj4dKLJM/7hIawNB0v3PI
 VTGgdzqMNReByXDKrZrjhjRIs3NcZJOcDYhejKvLlZCAM9YtiwYJo+mhJxk5HtME0bsJ
 RwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7SzOkQ6sd0S38QbCyvRBb51L6pZuZ/wIs7mZk/AE8Pw=;
 b=kFKdkKOx5hFaFrEAUoIBSbUHK0WUfo0d1wdwwfa0RjP7hgoayP4GSKEmSQISuW4TeE
 0WtkSjqcGm30xfw0kKxf+2q1VKLWEmYpzuYnDKfFnXDmKPUP0CwQcX4mjj2QlbMTkitn
 0uv4v28EPLaLK7Z7ed6owJa5upm+z9UF3H+uMpdkoZK079DKsVMpjKlvRJ6HSBP9cpBY
 XQgcHFLpA12lQQSADtNTot0aSkFcyvUVzOnXiG833AohB1ElfNkinqgKe00qvcUnoUom
 KWRxOwS/yYiOmLd+JrxmJCMxshSnkevLbsKkpfnx6woHgtlN7Vn2EFo7i8qB2ScjZsB8
 Rcpg==
X-Gm-Message-State: ANhLgQ2aLqQKWN45D72DlIESlylTYTGYF34sT0qrbxJiGHMs8krTYd9o
 4UqJIelB28d/2LQIai+9XpQ=
X-Google-Smtp-Source: ADFU+vtm3v5RKkFxeFN4fWtkHqhHV3daajsgvmUfin1v5VU2qsMSSgu8vFJ21B9gNTcGe2n5hYtiiw==
X-Received: by 2002:a1c:41c3:: with SMTP id o186mr480436wma.27.1583187509682; 
 Mon, 02 Mar 2020 14:18:29 -0800 (PST)
Received: from kbp1-lhp-F74019 (a81-14-236-68.net-htp.de. [81.14.236.68])
 by smtp.gmail.com with ESMTPSA id g187sm586933wma.5.2020.03.02.14.18.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 14:18:29 -0800 (PST)
Date: Tue, 3 Mar 2020 00:18:26 +0200
From: Yan Yankovskyi <yyankovskyi@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200302221826.GA18206@kbp1-lhp-F74019>
References: <20200229223035.GA28145@kbp1-lhp-F74019>
 <fba833c4-3173-0094-b4ec-53e9f42bfb3e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fba833c4-3173-0094-b4ec-53e9f42bfb3e@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Xen-devel] [PATCH] xen: Use 'unsigned int' instead of
 'unsigned'
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMiwgMjAyMCBhdCAxMDoxMSBKYW4gQmV1bGljaCB3cm90ZToKPiAuLi4gZXZ0
Y2huX3BvcnRfdCBoZXJlIGFuZCBlbHNld2hlcmUuCgpUaGVyZSBhcmUgc29tZSBpbnRlcmZhY2Vz
IHdpdGggc2lnbmVkIGludCBhcyBhIHR5cGUgZm9yIHBvcnQsIGUuZy4gaW4KaW5jbHVkZS94ZW4v
ZXZlbnRzLmguClNob3VsZCBJIGNyZWF0ZSBhZGRpdGlvbmFsIHBhdGNoIHRvIHJlc29sdmUgaW5j
b25zaXN0ZW5jeSB3aXRoIGV2dGNobgppbnRlcmZhY2U/Ck9yIHlvdSBzdWdnZXN0IGNvbWJpbmlu
ZyB0aGVzZSBjaGFuZ2VzIGludG8gdGhlIGV4aXN0aW5nIHBhdGNoPwoKQWxzbyBhcyBJIHVuZGVy
c3RhbmQgJ2V2dGNobicgYW5kICdwb3J0JyBhcmUgZXNzZW50aWFsbHkgdGhlIHNhbWUKZW50aXRp
ZXMgZnJvbSBwZXJzcGVjdGl2ZSBvZiBsb2NhbCBkb21haW4sIHJlbGF0ZWQgdG8gZWFjaCBvdGhl
ciByb3VnaGx5Cmxpa2UgY29ubmVjdGlvbiBhbmQgZmlsZSBkZXNjcmlwdG9yIHBhaXIuIFdoYXQg
ZG8geW91IHRoaW5rIGFib3V0CnJlbmFtaW5nIGFsbCAnZXZ0Y2huJyBhcmd1bWVudHMgYW5kIHZh
cmlhYmxlcyB0byAncG9ydCc/Ckl0IHdpbGwgZWxpbWluYXRlIGluY29uc2lzdGVuY2llcyBpbiB0
aGUgY29kZSwgZm9yIGV4YW1wbGUKaW4gaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2V2ZW50X2NoYW5u
ZWwuaCBhbmQgaW5jbHVkZS94ZW4vZXZlbnRzLmguCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
