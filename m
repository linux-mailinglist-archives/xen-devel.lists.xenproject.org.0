Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333EB10E3C3
	for <lists+xen-devel@lfdr.de>; Sun,  1 Dec 2019 23:13:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibXQ4-0004Bj-BI; Sun, 01 Dec 2019 22:10:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3l3R=ZX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ibXQ3-0004Be-FO
 for xen-devel@lists.xenproject.org; Sun, 01 Dec 2019 22:10:19 +0000
X-Inumbo-ID: 5b966706-1487-11ea-a406-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b966706-1487-11ea-a406-12813bfff9fa;
 Sun, 01 Dec 2019 22:10:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n1so41849906wra.10
 for <xen-devel@lists.xenproject.org>; Sun, 01 Dec 2019 14:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qDw9x1jJieKSf+Iuh9GFBvdkvOyRTxUjmoT+gRKpZh8=;
 b=b45RawQud898CkECPU5HWVZwGJMhGCDe6K4dFN8/+zOUcMftuTqSayAGq56NMrpJSu
 fFxEkK5zV+FU3dn71Pf3UicTtxTxRJrTnvmIDkIkHha9XqNudUg2zx1xRp2wm5dfTMy6
 GDzgp70WWPw00NLosZ/TbHW4YfV+zlYXvAOFTEz18Ec1FcyAfH5X03qTdSwT6eP94uKG
 MYTgwC/sighAQFFN5ByZvGNiQyge7Ev0clcJZPA/gmFFTq8JKsGd/hRfa0ehQH9t8mZy
 tdK3qt47QRKyHx0l0YqnfZEYCZpQ1Yg0ZKI+cv8UE7NBeGrDSqUrrzv6xaymcAI2qy+O
 LgmQ==
X-Gm-Message-State: APjAAAXI8f7RrbIpDqf1ZfiOHrOtBJKyIMUVtz+njIplhpcnMgjzjKXH
 O0FYQQy3RHEBuxgkBs1HRdc=
X-Google-Smtp-Source: APXvYqy36pxqkJpFZYsbhPwoCz/cnK8C40/uQWprB4y32a1Q7l+QnYiqB+9ZkW+r0yXw9yhdy+ldOw==
X-Received: by 2002:adf:c50a:: with SMTP id q10mr26871391wrf.374.1575238217513; 
 Sun, 01 Dec 2019 14:10:17 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id k7sm927331wmi.19.2019.12.01.14.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 14:10:16 -0800 (PST)
Date: Sun, 1 Dec 2019 22:10:15 +0000
From: Wei Liu <wl@xen.org>
To: Julian Tuminaro <julian.tuminaro@gmail.com>
Message-ID: <20191201221014.dwnckzxhedcj44m3@debian>
References: <20191130081118.18676-1-julian.tuminaro@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191130081118.18676-1-julian.tuminaro@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] Fix the KDD_LOG statements to use
 appropriate format specifier for printing uint64_t
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
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jenish Rakholiya <rjenish@cmu.edu>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBOb3YgMzAsIDIwMTkgYXQgMDM6MTE6MThBTSAtMDUwMCwgSnVsaWFuIFR1bWluYXJv
IHdyb3RlOgo+IFByZXZpb3VzIGNvbW1pdCBpbiBrZGQuYyBoYWQgYSBzbWFsbCBpc3N1ZSB3aGlj
aCBsZWFkIHRvIHdhcm5pbmcvZXJyb3Igd2hpbGUgY29tcGlsaW5nCj4gb24gMzItYml0IHN5c3Rl
bXMgZHVlIHRvIG1pc21hdGNoIG9mIHR5cGUgc2l6ZSB3aGlsZSBkb2luZyB0eXBlIGNhc3QgZnJv
bSB1aW50NjRfdCB0bwo+IHZvaWQgKgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplbmlzaCBSYWtob2xp
eWEgPHJqZW5pc2hAY211LmVkdT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpYW4gVHVtaW5hcm8gPGp0
dW1pbmFyQGFuZHJldy5jbXUuZWR1Pgo+IC0tLQo+ICB0b29scy9kZWJ1Z2dlci9rZGQva2RkLmMg
fCAxMSArKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9kZWJ1Z2dlci9rZGQva2RkLmMgYi90
b29scy9kZWJ1Z2dlci9rZGQva2RkLmMKPiBpbmRleCA2ZDNmZWJlZmRhLi4zZWJkYTliMTJjIDEw
MDY0NAo+IC0tLSBhL3Rvb2xzL2RlYnVnZ2VyL2tkZC9rZGQuYwo+ICsrKyBiL3Rvb2xzL2RlYnVn
Z2VyL2tkZC9rZGQuYwo+IEBAIC02MTMsNyArNjEzLDcgQEAgc3RhdGljIHZvaWQgZ2V0X29zX2lu
Zm9fNjQoa2RkX3N0YXRlICpzKQo+ICAgICAgaWR0MF9hZGRyIHw9ICgoYnVmID4+IDMyKSAmIDB4
ZmZmZjAwMDApOwo+ICAgICAgaWR0MF9hZGRyIHw9IChidWYgJiAweGZmZmYpOwo+ICAKPiAtICAg
IEtERF9MT0cocywgImlkdDAgYWRkcjogJXBcbiIsICh2b2lkICopaWR0MF9hZGRyKTsKPiArICAg
IEtERF9MT0cocywgImlkdDAgYWRkcjogMHglIlBSSXg2NCJcbiIsIGlkdDBfYWRkcik7Cj4gIAo+
ICAgICAgLyoKPiAgICAgICAqIGdldCB0aGUgcGFnZSBzdGFydCBhbmQgbG9vayBmb3IgIk1aIiBm
aWxlIGhlYWRlciAtIHdlIGxpbWl0IHRoZSBzZWFyY2gKPiBAQCAtNjIxLDcgKzYyMSw2IEBAIHN0
YXRpYyB2b2lkIGdldF9vc19pbmZvXzY0KGtkZF9zdGF0ZSAqcykKPiAgICAgICAqLwo+ICAKPiAg
ICAgIGJhc2UgPSBpZHQwX2FkZHIgJiB+KFBBR0VfU0laRSAtIDEpOwo+IC0gICAgS0REX0xPRyhz
LCAiJXBcbiIsICh2b2lkICopYmFzZSk7CgpEaWQgeW91IGFjdHVhbGx5IGludGVuZCB0byBkZWxl
dGUgdGhpcyBsaW5lPwoKQW55d2F5LCBJIGhhdmUgcHVzaGVkIHRoaXMgcGF0Y2ggd2l0aCBUaW0n
cyBhY2sgdG8gdW5ibG9jayBvdXIgQ0kuCgpJZiB5b3Ugd2FudCB0byBhZGQgdGhpcyBiYWNrLCBw
bGVhc2Ugc3VibWl0IGFub3RoZXIgcGF0Y2guCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
