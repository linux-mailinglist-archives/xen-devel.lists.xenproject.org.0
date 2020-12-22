Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADEC2E0967
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 12:14:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57766.101213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfcl-0006M8-HE; Tue, 22 Dec 2020 11:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57766.101213; Tue, 22 Dec 2020 11:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfcl-0006Ll-E7; Tue, 22 Dec 2020 11:14:39 +0000
Received: by outflank-mailman (input) for mailman id 57766;
 Tue, 22 Dec 2020 11:14:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krfcj-0006Le-N6
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 11:14:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb75bc38-dde4-4b13-989c-1d9c8f80d788;
 Tue, 22 Dec 2020 11:14:36 +0000 (UTC)
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
X-Inumbo-ID: eb75bc38-dde4-4b13-989c-1d9c8f80d788
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608635676;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=5rvv4xrCVB2pJJnTiYSTe9lX91AycbCVAJTQD+wWHSs=;
  b=hFnLLdJzoDx4DNvgZURTkeUkdCQiOBLZRI4lP3g6tZ7IAoaLWO9IdHM0
   rtJ2A5EK6L6b2GhVIFmfPqkNd39TLZ8juHhv83oik5HG4L92j3t+6CYah
   VUiv5xaDSrGzfW9qc39Z+0bbGEnouDh5pGLYqULgKiRi5mHNip7YJAtiJ
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZrAqm0flu03ilPafD0q9i8gsMoiCsNChBDL1SFIwA12VuJLDnRpBIL3BSMfFfIpUsA2uS28hz0
 svrETz8EuB6m2C9U9qDdrd5QSrhCfkq/Z3/93RWGuHbmYD4jp/mOakl4y2Y0aDAjsybgqQEVI3
 lcbLLnGalG35pBwpMz+Dsx4dvKUSu5YH0b51E7lMUXIK27BGi+qV45v5HZaGLnlMT4D1OxE5Op
 zQRNhPkrDfAXx0YuyrJX52Suggph1canS3ZhuaVVcAkAjGpLwhycyOLFC6yQMBXqtqiJleW25U
 A+4=
X-SBRS: 5.2
X-MesageID: 34094141
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,438,1599537600"; 
   d="scan'208";a="34094141"
Subject: Re: Hypercall fault injection (Was [PATCH 0/3] xen/domain: More
 structured teardown)
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Juergen
 Gross" <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Tamas
 K Lengyel" <tamas@tklengyel.com>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <ac552c84-144c-c213-7985-84d92cbb5601@citrix.com>
 <983a3fef-c80f-ec2a-bf3c-5e054fc6a7a9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <760969b0-743e-fdd7-3577-72612e3a88b7@citrix.com>
Date: Tue, 22 Dec 2020 11:14:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <983a3fef-c80f-ec2a-bf3c-5e054fc6a7a9@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 22/12/2020 10:00, Jan Beulich wrote:
> On 21.12.2020 20:36, Andrew Cooper wrote:
>> Hello,
>>
>> We have some very complicated hypercalls, createdomain, and max_vcpus a
>> close second, with immense complexity, and very hard-to-test error handling.
>>
>> It is no surprise that the error handling is riddled with bugs.
>>
>> Random failures from core functions is one way, but I'm not sure that
>> will be especially helpful.  In particular, we'd need a way to exclude
>> "dom0 critical" operations so we've got a usable system to run testing on.
>>
>> As an alternative, how about adding a fault_ttl field into the hypercall?
>>
>> The exact paths taken in {domain,vcpu}_create() are sensitive to the
>> hardware, Xen Kconfig, and other parameters passed into the
>> hypercall(s).  The testing logic doesn't really want to care about what
>> failed; simply that the error was handled correctly.
>>
>> So a test for this might look like:
>>
>> cfg = { ... };
>> while ( xc_create_domain(xch, cfg) < 0 )
>>     cfg.fault_ttl++;
>>
>>
>> The pro's of this approach is that for a specific build of Xen on a
>> piece of hardware, it ought to check every failure path in
>> domain_create(), until the ttl finally gets higher than the number of
>> fail-able actions required to construct a domain.  Also, the test
>> doesn't need changing as the complexity of domain_create() changes.
>>
>> The main con will mostly likely be the invasiveness of code in Xen, but
>> I suppose any fault injection is going to be invasive to a certain extent.
> While I like the idea in principle, the innocent looking
>
> cfg = { ... };
>
> is quite a bit of a concern here as well: Depending on the precise
> settings, paths taken in the hypervisor may heavily vary, and hence
> such a test will only end up being useful if it covers a wide
> variety of settings. Even if the number of tests to execute turned
> out to still be manageable today, it may quickly turn out not
> sufficiently scalable as we add new settings controllable right at
> domain creation (which I understand is the plan).

Well - there are two aspects here.

First, 99% of all VMs in practice are one of 3 or 4 configurations.  An
individual configuration is O(n) time complexity to test with fault_ttl,
depending on the size of Xen's logic, and we absolutely want to be able
to test these deterministically and to completion.

For the plethora of other configurations, I agree that it is infeasible
to test them all.  However, a hypercall like this is easy to wire up
into a fuzzing harness.

TBH, I was thinking of something like
https://github.com/intel/kernel-fuzzer-for-xen-project with a PVH Xen
and XTF "dom0" poking just this hypercall.  All the other complicated
bits of wiring AFL up appear to have been done.

Perhaps when we exhaust that as a source of bugs, we move onto fuzzing
the L0 Xen, because running on native will give it more paths to
explore.  We'd need some way of reporting path/trace data back to AFL in
dom0 which might require a bit plumbing.

~Andrew

