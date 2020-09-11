Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9052B26693E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 21:54:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGp6t-00051l-Eu; Fri, 11 Sep 2020 19:53:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27I=CU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGp6s-00051g-0W
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 19:53:26 +0000
X-Inumbo-ID: 8ede112c-92c8-4676-9e3c-c5be67edfb8a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ede112c-92c8-4676-9e3c-c5be67edfb8a;
 Fri, 11 Sep 2020 19:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599854003;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IsBoztbusVwRN+pj5wmZFUoiDLsxaHnQdzfpC+4xHPY=;
 b=BOwRoBi80bjO0/8Y2JPXxDLRArmh+ijbDaGWKVyzBLJ0/NqiY+Qo570r
 PnUr/uY8Z75bNHDS4h4qaYWDyOPLN2X8zwhiIybLs8XXyjUDrWFjsHVxA
 I+MUV5RZl3OjQ4frodV6RThZariZVqfp6V3k4BwDYXgv8Q7xZFf/u9jE+ I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7j/dbgb2B49FyywqL4T5iL+39FoJB/SqtsbwSv0jCUkODnRVuhevjDOQb725pnKz3dysixfgew
 6t/Nh3SkHAg08aPa9diZkd/6nnbZAa+snMd7rlws/7VcUXoK8AffMzVCvX1NaYGg/l8Zl6+Wci
 HgZlVV9GZvKzSEMpAEksuFDpcDrtNGHCaR/uaSlbcB6XS5dq/sW8DdA1R8J2NP3hW5+RZt1fKK
 xatBKemdpKhiEvltnk9AmWdC63dOtqlcQFl/I9gQkQarcv/kacvStLe46S6HVU7Zgg5FExS7XR
 vW4=
X-SBRS: 2.7
X-MesageID: 27507290
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,417,1592884800"; d="scan'208";a="27507290"
Subject: Re: Adopting the Linux Kernel Memory Model in Xen?
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "committers@xenproject.org"
 <committers@xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>
References: <1bc70974-2efb-2e73-34bf-bdd3c1d0ef96@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <58ab227d-4899-4dd2-de49-b5cd1d449f94@citrix.com>
Date: Fri, 11 Sep 2020 20:53:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1bc70974-2efb-2e73-34bf-bdd3c1d0ef96@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/09/2020 17:33, Julien Grall wrote:
> Hi all,
>
> At the moment, Xen doesn't have a formal memory model. Instead, we are
> relying on intuitions. This can lead to heated discussion on what can
> a processor/compiler do or not.
>
> We also have some helpers that nearly do the same (such as
> {read,write}_atomic() vs ACCESS_ONCE()) with no clear understanding
> where to use which.
>
> In the past few years, Linux community spent a lot of time to write
> down their memory model and make the compiler communities aware of it
> (see [1], [2]).
>
> There are a few reasons I can see for adopting LKMM:
>    - Xen borrows a fair amount of code from Linux;
>    - There are efforts to standardize it;
>    - This will allow us to streamline the discussion.
>
> Any thoughts?

It might not be formally written down, but we inherited an old version
of it from Linux directly, and memory-barriers.txt is often referred to,
and I have fixed our helpers several times to not have a semantic
difference vs Linux.

We even import some drivers verbatim, and they certainly are expecting
to use LKMM.


Memory ordering is a phenomenally complicated topic and getting it wrong
usually results in very subtle memory corruption issues.  The Xen
community does not have the expertise to invent something custom.  LKMM
is already familiar to most people liable to contribute in areas where
it is likely to matter.

I don't mind how we go about formally stating that we use LKMM, but as
far as I'm concerned, we already use it, and any semantic deviation is a
bug needing fixing in Xen.

~Andrew

