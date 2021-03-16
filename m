Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899233CC68
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 05:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98185.186188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM11r-0001p3-Bn; Tue, 16 Mar 2021 04:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98185.186188; Tue, 16 Mar 2021 04:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM11r-0001oe-8U; Tue, 16 Mar 2021 04:09:59 +0000
Received: by outflank-mailman (input) for mailman id 98185;
 Tue, 16 Mar 2021 04:09:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LlV3=IO=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lM11p-0001oZ-OX
 for xen-devel@lists.xen.org; Tue, 16 Mar 2021 04:09:57 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8319066c-6599-4f2b-a213-d71227e16644;
 Tue, 16 Mar 2021 04:09:56 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1615867780086180.53138227604438;
 Mon, 15 Mar 2021 21:09:40 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8319066c-6599-4f2b-a213-d71227e16644
ARC-Seal: i=1; a=rsa-sha256; t=1615867783; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IglvTLeIPX3ueH5OK3zWZvBTPMb4Nh/QPEjt6b5dRemjX3J+24zrzw5Zx+TFURBEi7OlDI2WRLaB0G1o+3RoA0+gWXnwxf77vRYtDQnZ0AbhvDVqEXGKzE8VsV4Xg0FZbxsvpryvw1XnLqZRX77naB/IeN0BCFqEbAxu/IwLDH8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1615867783; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=ErJk0DpONtsisG//WqPXEOOXFvbjn4LxdxKfTINfx1M=; 
	b=dRaSEe2rvIHdbi5bVWxSL76QPUArpKEobcMTzSK4mxajsMnXLXTLVQnoolnh1qtP1vFjYWIzkcD/HuJpuv5wHLeurkz2zl/zvjBLgG4srQxofKc51NeKWW4C+Ig7GTEBeb77lTUIzJ9oiy1sXe2gq3RAd9ZGcSpjw4wMOfvQpXQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615867783;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:From:Cc:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ErJk0DpONtsisG//WqPXEOOXFvbjn4LxdxKfTINfx1M=;
	b=tARHFBELEkTmt3zRu1fIGo+lI/8FyzkAWdZhLHqKslNrNZgIr3X5+a5BMKVZdSNm
	LbPBbj+hOvtfwMgQqEn/+bX1hXk4k9p6Jtgm/G22aD1Xc6B5ZhsvOHum/41y344hpvs
	uVbfJtmbFm9aid3R0Miz0KGiOh3aHS5t6CNU90is=
To: Xen-devel <xen-devel@lists.xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@xilinx.com,
 jgrall@amazon.com, iwj@xenproject.org, wl@xen.org, george.dunlap@citrix.com,
 jbeulich@suse.com, persaur@gmail.com, bertrand.marquis@arm.com,
 roger.pau@citrix.com, luca.fancellu@arm.com, adam.schwalm@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>, paul@xen.org
Message-ID: <2e7213c1-e01c-9d9d-3ac1-3086eb6889e5@apertussolutions.com>
Subject: Working Group Meeting for hyperlaunch
Date: Tue, 16 Mar 2021 00:09:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

All,

We have posted[1][2] the design documents for hyperlaunch and would
invite attendance at a working group call to discuss two agenda items.
The first item is a review of the documents and the second is a
discussion about bringing production-ready revisions of our previous
prototype in as patches to provide a near-term implementation of the
design. If possible please join us this Thursday 3/18 at
1700CET/1600GMT/1200EDT/0900PDT. Below are the call details.

[1]
https://lists.xenproject.org/archives/html/xen-devel/2021-03/msg00939.html
[2]
https://lists.xenproject.org/archives/html/xen-devel/2021-03/pdfCV4LaWCrTN.=
pdf

Call Details:

Daniel Smith's Meeting


Please join my meeting from your computer, tablet or smartphone.

https://www.gotomeet.me/apertussolutions

You can also dial in using your phone.
(For supported devices, tap a one-touch number below to join instantly.)

United States (Toll Free): 1 877 568 4106
- One-touch: tel:+18775684106,,691818141#

Access Code: 691-818-141


More phone numbers:
(For supported devices, tap a one-touch number below to join instantly.)

Austria (Toll Free): 0 800 202148
- One-touch: tel:+43800202148,,691818141#

Belarus (Toll Free): 8 820 0011 0400
- One-touch: tel:+37582000110400,,691818141#

Belgium (Toll Free): 0 800 78884
- One-touch: tel:+3280078884,,691818141#

Bulgaria (Toll Free): 00800 120 4417
- One-touch: tel:+3598001204417,,691818141#

Canada (Toll Free): 1 888 455 1389
- One-touch: tel:+18884551389,,691818141#

China (Toll Free): 4000 762962
- One-touch: tel:+864000762962,,691818141#

Czech Republic (Toll Free): 800 500448
- One-touch: tel:+420800500448,,691818141#

Denmark (Toll Free): 8025 3126
- One-touch: tel:+4580253126,,691818141#

Finland (Toll Free): 0 800 917656
- One-touch: tel:+358800917656,,691818141#

France (Toll Free): 0 805 541 047
- One-touch: tel:+33805541047,,691818141#

Germany (Toll Free): 0 800 184 4222
- One-touch: tel:+498001844222,,691818141#

Greece (Toll Free): 00 800 4414 3838
- One-touch: tel:+3080044143838,,691818141#

Hungary (Toll Free): (06) 80 986 255
- One-touch: tel:+3680986255,,691818141#

Iceland (Toll Free): 800 7204
- One-touch: tel:+3548007204,,691818141#

India (Toll Free): 18002669254
- One-touch: tel:18002669254,,691818141#

Ireland (Toll Free): 1 800 901 610
- One-touch: tel:+3531800901610,,691818141#

Italy (Toll Free): 800 793887
- One-touch: tel:800793887,,691818141#

Netherlands (Toll Free): 0 800 020 0182
- One-touch: tel:+318000200182,,691818141#

Norway (Toll Free): 800 69 046
- One-touch: tel:+4780069046,,691818141#

Poland (Toll Free): 00 800 1124759
- One-touch: tel:+488001124759,,691818141#

Portugal (Toll Free): 800 819 575
- One-touch: tel:+351800819575,,691818141#

Romania (Toll Free): 0 800 400 819
- One-touch: tel:+40800400819,,691818141#

Slovakia (Toll Free): 0 800 105 748
- One-touch: tel:+421800105748,,691818141#

Spain (Toll Free): 800 900 582
- One-touch: tel:+34800900582,,691818141#

Sweden (Toll Free): 0 200 330 905
- One-touch: tel:+46200330905,,691818141#

Switzerland (Toll Free): 0 800 002 348
- One-touch: tel:+41800002348,,691818141#

Ukraine (Toll Free): 0 800 60 9135
- One-touch: tel:+380800609135,,691818141#

United Kingdom (Toll Free): 0 800 169 0432
- One-touch: tel:+448001690432,,691818141#


New to GoToMeeting? Get the app now and be ready when your first meeting
starts: https://global.gotomeeting.com/install/691818141


