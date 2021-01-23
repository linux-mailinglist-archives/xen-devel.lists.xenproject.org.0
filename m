Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D76301564
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 14:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73306.132139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3IsD-0000of-Il; Sat, 23 Jan 2021 13:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73306.132139; Sat, 23 Jan 2021 13:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3IsD-0000oJ-ER; Sat, 23 Jan 2021 13:22:41 +0000
Received: by outflank-mailman (input) for mailman id 73306;
 Sat, 23 Jan 2021 13:22:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l3IsB-0000oD-7u
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 13:22:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l3IsA-00074R-6d; Sat, 23 Jan 2021 13:22:38 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l3Is9-0006BM-Qq; Sat, 23 Jan 2021 13:22:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7T1exBXi/j/fhZ2RfiQf032YwMX1mDT9ra5fW7Pd1GA=; b=aoaiZbJ0wXN5THIONfBDSfbYvA
	NHlyKSwdOBBwJ5y2Z/uaZzXE52S2cPTmsRqmP0euCwZj1RyegNn2akFugleGsEj+1usqdru7FXEs4
	CXIwMWv8FWdZWIH8CK0hRb/TiumVQoGrY6e922hLZQl73ghVmEcZn7JyankwczJ9BLEQ=;
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
 <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
 <e2ee99fc-e3f8-bdaf-fe4a-d048da34731a@suse.com>
 <b4abbe2f-5e3d-5f43-80b8-cfa3fd97061e@citrix.com>
 <CAPD2p-nZyf_i_bGh5sSs2fC4S7nxB1Mk_zbSKtqF=zvBOp3X+Q@mail.gmail.com>
 <2dcbe286-4112-e4b3-dc12-9691154365b3@suse.com>
 <448a6ef3-2cbd-da9c-e4ef-88122d246833@gmail.com>
 <18c21c64-d350-482a-c778-c8478d3daf2c@suse.com>
 <c8315e16-6130-e990-3d16-d0d42b2f92c4@gmail.com>
 <ec041f81-4b80-5ffb-8219-6732f50bef36@suse.com>
 <f6f1ffdd-619d-017e-6820-276814056845@gmail.com>
 <257224ea-4ba3-302e-e198-e92c8c1036b3@suse.com>
 <898d609c-8652-e43d-4400-27986cc37371@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9523a20e-0b26-51b4-a13a-5767584389cf@xen.org>
Date: Sat, 23 Jan 2021 13:22:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <898d609c-8652-e43d-4400-27986cc37371@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan & Oleksandr,

On 13/01/2021 15:06, Oleksandr wrote:
> 
> On 12.01.21 13:58, Jan Beulich wrote:
> 
> Hi Jan.
> 
>> On 11.01.2021 09:23, Oleksandr wrote:
>>> On 11.01.21 09:41, Jan Beulich wrote:
>>>> If you could also provide your exact .config, I could see whether I
>>>> can repro here with some of the gcc5 versions I have laying around.
>>> Please see attached
>> Builds perfectly fine with 5.4.0 here.
> 
> Thank you for testing.
> 
> 
> I wonder whether I indeed missed something. I have switched to 5.4.0 
> again (from 9.3.0) and rechecked, a build issue was still present.
> I even downloaded 5.4.0 sources and built them to try to build Xen, and 
> got the same effect.  What I noticed is that for non-debug builds the 
> build issue wasn't present.
> Then I decided to build today's staging 
> (414be7b66349e7dca42bc1fd47c2b2f5b2d27432 xen/memory: Fix compat 
> XENMEM_acquire_resource for size requests) instead of 9-day's old one when
> I had initially reported about that build issue 
> (7ba2ab495be54f608cb47440e1497b2795bd301a x86/p2m: Fix 
> paging_gva_to_gfn() for nested virt). Today's staging builds perfectly 
> fine with 5.4.0.
> It seems that commit in the middle 
> (994f6478a48a60e3b407c7defc2d36a80f880b04 xsm/dummy: harden against 
> speculative abuse) indirectly fixes that weird build issue with 5.4.0...

The gitlab CI reported a similar issue today (see [1]) when building 
with randconfig ([2]). This is happening on Debian sid with GCC 9.3.

Note that the default compiler on sid is GCC 10.2.1. So you will have to 
install the package gcc-9 and then use CC=gcc-9 make <...>.


 From a local repro, I get the following message:

ld: ld: prelink.o: in function `xenmem_add_to_physmap_batch':
/root/xen/xen/common/memory.c:942: undefined reference to 
`xenmem_add_to_physmap_one'
/root/xen/xen/common/memory.c:942:(.text+0x22145): relocation truncated 
to fit: R_X86_64_PLT32 against undefined symbol `xenmem_add_to_physmap_one'
prelink-efi.o: in function `xenmem_add_to_physmap_batch':
/root/xen/xen/common/memory.c:942: undefined reference to 
`xenmem_add_to_physmap_one'
make[2]: *** [Makefile:215: /root/xen/xen/xen.efi] Error 1
make[2]: *** Waiting for unfinished jobs....
ld: /root/xen/xen/.xen-syms.0: hidden symbol `xenmem_add_to_physmap_one' 
isn't defined
ld: final link failed: bad value


This points to the call in xenmem_add_to_physmap_batch(). I have played 
a bit with the .config options. I was able to get it built as soon as I 
disabled CONFIG_COVERAGE=y.

So maybe the optimizer is not clever enough on GCC 9 when building with 
coverage enabled?

With the diff below applied (borrowed from 
xenmem_add_to_physmap_batch()), I can build without tweaking the .config 
[1]:

diff --git a/xen/common/memory.c b/xen/common/memory.c
index ccb4d49fc6..5cfd36a53d 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -903,6 +903,12 @@ static int xenmem_add_to_physmap_batch(struct 
domain *d,
  {
      union add_to_physmap_extra extra = {};

+    if ( !paging_mode_translate(d) )
+    {
+        ASSERT_UNREACHABLE();
+        return -EACCES;
+    }
+
      if ( unlikely(xatpb->size < extent) )
          return -EILSEQ;

Cheers,

[1] https://gitlab.com/xen-project/xen/-/jobs/981624525
[2] https://pastebin.com/vTbQXXV9


https://gitlab.com/xen-project/xen/-/jobs/981624525

> 
> 

-- 
Julien Grall

