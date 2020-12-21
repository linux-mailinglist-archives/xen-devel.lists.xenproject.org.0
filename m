Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A807A2E0119
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 20:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57549.100758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krQzK-0008Bx-Fi; Mon, 21 Dec 2020 19:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57549.100758; Mon, 21 Dec 2020 19:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krQzK-0008Bb-Ck; Mon, 21 Dec 2020 19:36:58 +0000
Received: by outflank-mailman (input) for mailman id 57549;
 Mon, 21 Dec 2020 19:36:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krQzJ-0008BW-90
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 19:36:57 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d8e2bc6-8054-48f2-a7ca-ff45a52cfb11;
 Mon, 21 Dec 2020 19:36:56 +0000 (UTC)
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
X-Inumbo-ID: 9d8e2bc6-8054-48f2-a7ca-ff45a52cfb11
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608579416;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XSBbOSphSVpF1JAj9O9NNctyNMu5unIHAn8w0blBlIE=;
  b=RjNTEGzUz8MfWBzfc/DGqK7odxDC4ySY7bDW6wnZwzbyHCMymCMkKMnj
   Vnou+nBvV1bwO4lYyd6dwqGDZY5ARqPjTitY5ZiSNbuGpb0GjNOvVnqau
   nU30Z0yWkaQJnY/wW/Hamsu+5QMX+65hsddUYjR1ERb0nzGxLdiq3OEZs
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xjvuXya0pJaFcAuDjBsgh0/u3geMOaHQjIzIPcVQ8t1Gb9Ntg9A+3/ws1MTEMiVNuw7BtTXCAZ
 OKBEm3IWabkL/9fL4XqdqnzTOp3+dZVNZTBklN8Slk8jJt1tXJHEikmxz1YewQLU5lbIzBi+S3
 MrA8PLWRUNp2xl4CFj5cASej4zF2GC1GppdjrvdvFbbyJ7idjzy0nveGSyWnGg2Bfqc/dPULZv
 bPNeoQay3GxuQoep0qiivA+TKp2SYRos3Z+Fr3P9SApJK9QFt1R6HEKqaSZfTx+awC/sUCwaMY
 ziI=
X-SBRS: 5.2
X-MesageID: 33693178
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,437,1599537600"; 
   d="scan'208";a="33693178"
Subject: Hypercall fault injection (Was [PATCH 0/3] xen/domain: More
 structured teardown)
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ac552c84-144c-c213-7985-84d92cbb5601@citrix.com>
Date: Mon, 21 Dec 2020 19:36:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201221181446.7791-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

Hello,

We have some very complicated hypercalls, createdomain, and max_vcpus a
close second, with immense complexity, and very hard-to-test error handling.

It is no surprise that the error handling is riddled with bugs.

Random failures from core functions is one way, but I'm not sure that
will be especially helpful.  In particular, we'd need a way to exclude
"dom0 critical" operations so we've got a usable system to run testing on.

As an alternative, how about adding a fault_ttl field into the hypercall?

The exact paths taken in {domain,vcpu}_create() are sensitive to the
hardware, Xen Kconfig, and other parameters passed into the
hypercall(s).  The testing logic doesn't really want to care about what
failed; simply that the error was handled correctly.

So a test for this might look like:

cfg = { ... };
while ( xc_create_domain(xch, cfg) < 0 )
    cfg.fault_ttl++;


The pro's of this approach is that for a specific build of Xen on a
piece of hardware, it ought to check every failure path in
domain_create(), until the ttl finally gets higher than the number of
fail-able actions required to construct a domain.  Also, the test
doesn't need changing as the complexity of domain_create() changes.

The main con will mostly likely be the invasiveness of code in Xen, but
I suppose any fault injection is going to be invasive to a certain extent.

Fault injection like this would also want pairing with some other plans
I had for dalloc() & friends which wrap the current allocators, and
count (in struct domain) the number and/or size of domain allocations,
so we can a) check for leaks, and b) report how much memory a domain
object (and all its decendent objects) actually takes (seeing as we
don't know this value at all).

Thoughts?

~Andrew

