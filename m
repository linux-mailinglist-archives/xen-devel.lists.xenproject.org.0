Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7132B1B0F26
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 17:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXve-0001mD-8j; Mon, 20 Apr 2020 15:01:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UDoD=6E=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jQXvd-0001m8-4q
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 15:01:45 +0000
X-Inumbo-ID: d936394e-8317-11ea-b58d-bc764e2007e4
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d936394e-8317-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 15:01:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id u16so3174540wmc.5
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ffQMkShY/21xVg5iLV5KNIlCzyK/hZzdotYmiBh3NVw=;
 b=WgOT1IYhWk8wUPg3n4DLM+Drl2yavFIjiygv/z096X4bMe9I1fZsLuGVZUR7u8+K2t
 S/1PpjzknJYjf0PGluwZqpkzjbqtlmlaO1XVc8l7R8iVpCHcbTJzmQYbHqTVqzYfOtU1
 31keHCn52yCmW2SPX5cQLriFByeL8GdvwdQUoudDMx7Dily0jt2LqR5hBV/j4dhLKMEY
 JFB9T5tTW+O5yBCk7rIFHAssLzvfR1aS7Q8Gu/0lVkhE71dBZqKFbH+R0IjcE216nhMU
 ILJ1r8z7ijdO4XEK12bw6SlpeBFRjr6Ph9wNmAtN1qNGukhfk/6erCMqHXyUXUaKCvCl
 Ke9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ffQMkShY/21xVg5iLV5KNIlCzyK/hZzdotYmiBh3NVw=;
 b=FnudXhMo35/oZDqi5nus+CXcCcK/U/bcwQUn12AOhW87woOspP6cCHtB3fMisKmrgt
 nYPui4njRcKIs85k1N1NTCKnWr27MPrBUqE00EybjFuqA06VPTpovCi6aLRIULOUw/JT
 CUpGI/19C+8QDgirqd6CYfZypOGBRv09VasRa6woLgAVb8LahVpHE7N3Dry3pSgs80DN
 8QzxGsZB9Vu81dDy6I5ya0WyPPuzTR+ypsPWbQ0j0kvCDIBUbX41WD0oObxBcAlx7+Gn
 7Aoni4YEqZhiShSSXZeeyCxlkVl3eyA1xuMFmLqVBbiH1n8P9th81NDg8xPMSCS3Az65
 qiIA==
X-Gm-Message-State: AGi0Pubm83nsJpKb+avDccAbGu0dH36BGQswaU174inHmtk/s5TpPD0Y
 J0ws+4ynpnQSmLcVmBlIfVg=
X-Google-Smtp-Source: APiQypKGAp4L4yQFbQxgbStiIUzd/FFARkLJ2QemlYDpaNupVnL/0+O7bdBtbX/UF3qL6x7/b6ytng==
X-Received: by 2002:a1c:e1c1:: with SMTP id
 y184mr18618597wmg.143.1587394903662; 
 Mon, 20 Apr 2020 08:01:43 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id s14sm1698966wme.33.2020.04.20.08.01.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 08:01:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>, "'Jan Beulich'" <jbeulich@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
 <002801d61302$dbd21950$93764bf0$@xen.org>
 <410df70e-6e21-2d0a-8148-62ccf2a24366@xen.org>
In-Reply-To: <410df70e-6e21-2d0a-8148-62ccf2a24366@xen.org>
Subject: RE: [PATCH 0/3] xenoprof: XSA-313 follow-up
Date: Mon, 20 Apr 2020 16:01:41 +0100
Message-ID: <004301d61724$9a5c9ab0$cf15d010$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKUpBz832WsrmfTrWwwQFYKS8h7/QHBHudWATlYg7ym7SqU4A==
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
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 20 April 2020 15:15
> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>; =
xen-devel@lists.xenproject.org
> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian
> Jackson' <ian.jackson@eu.citrix.com>; 'Stefano Stabellini' =
<sstabellini@kernel.org>; 'Wei Liu'
> <wl@xen.org>
> Subject: Re: [PATCH 0/3] xenoprof: XSA-313 follow-up
>=20
> Hi Paul,
>=20
> On 15/04/2020 09:50, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 15 April 2020 09:45
> >> To: xen-devel@lists.xenproject.org
> >> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Ian
> Jackson
> >> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano =
Stabellini
> >> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> >> Subject: [PATCH 0/3] xenoprof: XSA-313 follow-up
> >>
> >> Patch 1 was considered to become part of the XSA, but it was then
> >> decided against. The other two are a little bit of cleanup, albeit
> >> there's certainly far more room for tidying. Yet then again Paul,
> >> in his mail from Mar 13, was asking whether we shouldn't drop
> >> xenoprof altogether, at which point cleaning up the code would be
> >> wasted effort.
> >>
> >
> > That's still my opinion. This is a large chunk of (only passively =
maintained) code which I think is
> of very limited value (since it relates to an old tool, and it only =
works for PV domains).
>=20
> While there are no active user we are aware of, this is an example on
> how to implement a profiler backend with Xen. So I would agree with
> Andrew here.
>=20
> IIRC, the reason behind your request is it makes difficult for your
> xenheap work. Am I correct? If so, do you have a thread explaining the
> issues?

After shared info and grant table, it is the only other occurrence of a =
xenheap page shared with a non-system domain. Also, it cannot be =
trivially replaced with an 'extra' domheap page because its assignment =
changes. Thus a whole bunch of cleanup work that I was hoping to do =
(largely in domain_relinquish_resources and free_domheap_pages) is =
either ruled out, or would have to special-case this type of page.
Also, I am unconvinced that PV guests are sufficiently common these days =
(apart from dom0) that profiling them is of any real use.

  Paul


