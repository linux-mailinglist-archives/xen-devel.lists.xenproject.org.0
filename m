Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A474815BB1C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 10:04:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2ANV-0000d2-SC; Thu, 13 Feb 2020 09:01:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=91ql=4B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j2ANU-0000cx-Nu
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:01:44 +0000
X-Inumbo-ID: 74749490-4e3f-11ea-bc8e-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74749490-4e3f-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 09:01:43 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w12so5643957wrt.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2020 01:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6WPXszQJc1LFcyZ+nWWqknVHHS20M5rPoehAR2SLd/g=;
 b=jHXc2yN/Fmw2/n9HwxGztZpOaMpi/y34zOlmiW9cAlZ+69j1D70XV1WtDyla2puUHk
 Kl05aX81eaEFmdlPeLYFOe+nu2dX7+nmYHeCylkPZDjnje5Mdxy/n47oxOMx1AH9y5iO
 /Uo6bdoCJg8Y1JtdmuCmuBjNV35iQVqWh51vQ/tKZELJhXBVkQB3bQqx+TdJmqxRvpY0
 8zSADxYq6gsWB7WvxRrMvYOgG9ByYPLIPATH4UC5/N9hafONvEz5NJVefrC6J56OgMlQ
 Yz1foK0SGYKj+WGZBoExCwG5rPMRgSyCKmAA6915QRrMfVr0UJgKAtVmhmtaLQWwCojF
 dIkg==
X-Gm-Message-State: APjAAAVg3qaQCnmZ4SL/7teIVndO29R+9oAA92AsJvhrQeqTsB0n8QT6
 mdwwTt4e4vx8C5GP2dS9byU=
X-Google-Smtp-Source: APXvYqyHTLlHezV8qllu7RFz2UQv+S7+jr3XmOc/v8fSpsT0CSBE/MWpXZmDtXSYE46h+jeTm7TiIQ==
X-Received: by 2002:adf:80cb:: with SMTP id 69mr19527661wrl.320.1581584502859; 
 Thu, 13 Feb 2020 01:01:42 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id y131sm2174905wmc.13.2020.02.13.01.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 01:01:42 -0800 (PST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200211093527.6811-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d11ca0a6-652a-13d8-864a-82893f0969cc@xen.org>
Date: Thu, 13 Feb 2020 10:01:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200211093527.6811-1-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen: make sure stop_machine_run() is always
 called in a tasklet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8wMi8yMDIwIDEwOjM1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IFdpdGggY29y
ZSBzY2hlZHVsaW5nIGFjdGl2ZSBpdCBpcyBtYW5kYXRvcnkgZm9yIHN0b3BfbWFjaGluZV9ydW4o
KSB0bwo+IGJlIGNhbGxlZCBpbiBhIHRhc2tsZXQgb25seSwgYXMgb3RoZXJ3aXNlIGEgc2NoZWR1
bGluZyBkZWFkbG9jayB3b3VsZAo+IG9jY3VyOiBzdG9wX21hY2hpbmVfcnVuKCkgZG9lcyBhIGNw
dSByZW5kZXp2b3VzIGJ5IGFjdGl2YXRpbmcgYSB0YXNrbGV0Cj4gb24gYWxsIG90aGVyIGNwdXMu
IEluIGNhc2Ugc3RvcF9tYWNoaW5lX3J1bigpIHdhcyBub3QgY2FsbGVkIGluIGFuIGlkbGUKPiB2
Y3B1IGl0IHdvdWxkIGJsb2NrIHNjaGVkdWxpbmcgdGhlIGlkbGUgdmNwdSBvbiBpdHMgc2libGlu
Z3Mgd2l0aCBjb3JlCj4gc2NoZWR1bGluZyBiZWluZyBhY3RpdmUsIHJlc3VsdGluZyBpbiBhIGhh
bmcuCgpUaGlzIHN1Z2dlc3RzIGl0IGlzIG5vdCBzYWZlIHRvIGNhbGwgc3RvcF9tYWNoaW5lX3J1
bigpIG91dHNpZGUgYSAKdGFza2xldCBidXQgc3RpbGwgdW5kZXIgImlkbGUgdkNQVSIgY29udGV4
dC4gSG93ZXZlciwgYWx0ZXJuYXRpdmUgCnBhdGNoaW5nIG9uIEFybSBkdXJpbmcgYm9vdCB3aWxs
IG5vdCBiZSBpbiBhIHRhc2tsZXQuIElzIGl0IGdvaW5nIHRvIGJlIApzYWZlPwoKCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
