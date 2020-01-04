Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5900F1303BE
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 18:16:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inmy9-0000hZ-A2; Sat, 04 Jan 2020 17:12:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vM5p=2Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1inmy7-0000hU-A0
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 17:12:07 +0000
X-Inumbo-ID: 5551a6be-2f15-11ea-88e7-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5551a6be-2f15-11ea-88e7-bc764e2007e4;
 Sat, 04 Jan 2020 17:12:06 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j26so46772256ljc.12
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jan 2020 09:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iY2XUqN85i1DFM5b7ScwDiC6kAoz8q+KODJoF48fl18=;
 b=F565LU1F3V1nLm92IScITmH+GX9EfqVRHP74OWE9jzuf1rCedGBc+nOvm+r/96ewdH
 uUMdTLcelxdl3zpVlKJOJ0a1zgcDuM1LN/jm7oSwXynprwhIqyIjXD3Fk2LQ6TrvqTD9
 dk3qsax3DKAWpUB9cddm6Du4RKPOy3c3GtsDokW8hThkQWpSmDz5cB0dXO7Jd8cP5qJU
 asXpdk1e2FiGAR94rm5C41EP8E4iMUSPASmASmleM5fz8UjQIpheBwv3jvQBjYG06hGZ
 k+UAF7UUWzfmQDRrr3+sVxToRBha/ac/UtgUQlDJ9uihTAYcOzqYyzkSO5S6dOmMnlp3
 OndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iY2XUqN85i1DFM5b7ScwDiC6kAoz8q+KODJoF48fl18=;
 b=A+9RK68bvOchixQ6iEW6Xa8rthaSzyM88wkFM84wu94ssCVNUzPzhZ0vP1NbHEhrko
 r5tZCK0PJEBxRKiMtnbdQs49Db1OMMd0sdhTPqiz+oXiVGftrA4EtY1ZtY9lok2FFVLQ
 4wFbxtCiPXGATIGoNlPChDzWu07bKe8sxbC/E+6POV+SDd1y6PJVloru5HwLqdpSjzQk
 m4dBLwG46kuu+pnv8M6JEGtLJknYnVxL3EvHVUlopRDrTme1jOGe6os4OY5EDtSOxDnR
 9fvqBweLfvRuDAFNpyFg6d3xcb8+jayHzB0oo12rxiWSwq1VouPOeckakDfKYUMfSg+E
 k5ag==
X-Gm-Message-State: APjAAAU+xIFr1/NJqg82CSo1udTQomOdbE6UkKw+efcEhVdFxSNH1m6H
 fG/lwlIq9XddTcbtcXHcXuFiII3/LEJGUVZIWQ4=
X-Google-Smtp-Source: APXvYqx1bWkWCYzia/8mwXRXNen8h1wHjagX8VqdREOEsWy0PorFq0qe7bVYOeXyU0JOK2vJlKsvAvJKhNmxUba5+O0=
X-Received: by 2002:a2e:b177:: with SMTP id a23mr51330731ljm.202.1578157925431; 
 Sat, 04 Jan 2020 09:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
In-Reply-To: <20191227163224.4113837-1-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 4 Jan 2020 12:11:54 -0500
Message-ID: <CAEBZRSeW+Sk4R_y2U9x21Br3dcFcv2TjKo_qipveaqdqqjPT=g@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 1/9] golang/xenlight: Don't try to marshall
 zero-length arrays
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
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBUaGUgY3VycmVudCBmcm9tQyBhcnJheSBjb2RlIHdpbGwgZG8gdGhlICJtYWdpYyIgY2FzdGlu
ZyBhbmQKPiBtYXJ0aWFsbGluZyBldmVuIHdoZW4gbnVtX2ZvbyB2YXJpYWJsZSBpcyAwLiAgR28g
Y3Jhc2hlcyB3aGVuIGRvaW5nCj4gdGhlIGNhc3QuCj4KPiBGdXJ0aGVybW9yZSwgdGhlIGN1cnJl
bnQgdG9DIGFycmF5IGNvZGUgd2lsbCBjb252ZXJ0IGEgbmlsIHNsaWNlIGludG8KPiBhIHplcm8t
bGVuZ3RoIG1hbGxvYy4gIFRoZSByZXN1bHRpbmcgcG9pbnRlciBpcyBub24tTlVMTCwgYW5kIGNv
bmZ1c2VzCj4gbGlieGwuCj4KPiBPbmx5IGRvIGFycmF5IG1hcnNoYWxsaW5nIGlmIHRoZSBudW1i
ZXIgb2YgZWxlbWVudHMgaXMgbm9uLXplcm87Cj4gb3RoZXJ3aXNlLCBsZWF2ZSB0aGUgdGFyZ2V0
IHBvaW50ZXIgZW1wdHkgKG5pbCBmb3IgR28gc2xpY2VzLCBOVUxMIGZvcgo+IEMgYXJyYXlzKS4K
Pgo+IFRoZSB0b0MgaGFsZiBvZiB0aGlzIHNob3VsZCBiZSBmb2xkZWQgaW50byAiZ29sYW5nL3hl
bmxpZ2h0Ogo+IGltcGxlbWVudCBhcnJheSBHbyB0byBDIG1hcnNoYWxpbmciLgoKTG9va3MgZ29v
ZCB0byBtZS4gSSB3aWxsIG1ha2UgdGhlIHRvQyBjaGFuZ2Ugd2hlbiBJIHNlbmQgdjUgb2YgbXkg
c2VyaWVzLgoKLU5SCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
