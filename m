Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F90FDFA3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:07:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcCy-00024K-PK; Fri, 15 Nov 2019 14:04:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bLue=ZH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iVcCx-00024F-8R
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:04:19 +0000
X-Inumbo-ID: d01e2f98-07b0-11ea-adbe-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d01e2f98-07b0-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 14:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573826658;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=XBsT3I+M+iy27S8VNQKCSH8wJ6Fmdu5aQp6DInuRX1g=;
 b=QbDxDPBAJ/utMjxkYdBLVrQhzJsOZ4x7Tc08BGH1xJeL/7M/1yHtpmdV
 Vx4e861U0DXou/OfX/2veo6ohe1iekriKsfqJEy8QJ7sHf9uPKTYpaVjw
 ICmNBJ2AH5+ONESX2r1wsEQkwO1EtW2bVlADtS8ck9aapwPr142FO5h1o s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b7KKqeq7ianWsN1tkuitldVX1rHAVaZMn44DyIcvFXuTTBQh6Lr3E1AAua5nb+XDegq6inf01z
 9SlORs0Cq6SIbacBUUabnl4Y5G2Nnw1hoji1KNHNZiVYncXoh0PVGHwzXPju2j97URVZjrPhnp
 jvG+9D1QZcUdXwQR04UQv+usY0lYVbz5LM17lWTaSz+5nB+7rgbgSE9zU+N7nJh+zAwncSYTES
 KERDVh49sciv2I+UEnJjzCdob30DXP05t3KafHLlU045g6uUWu+jh87it5Q7xxJKAHtg4JP8zo
 /6A=
X-SBRS: 2.7
X-MesageID: 8739120
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; d="scan'208,223";a="8739120"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
Date: Fri, 15 Nov 2019 14:04:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
Content-Type: multipart/mixed; boundary="------------24F85F7DFBCF0D3EC00021CA"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 IanJackson <ian.jackson@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--------------24F85F7DFBCF0D3EC00021CA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 11/15/19 1:55 PM, Andrew Cooper wrote:
> On 15/11/2019 12:39, Jan Beulich wrote:
>> On 15.11.2019 12:58, George Dunlap wrote:
>>> On 11/15/19 11:12 AM, Jan Beulich wrote:
>>>> On 15.11.2019 11:57, George Dunlap wrote:
>>>>> --- a/tools/libxc/xc_cpuid_x86.c
>>>>> +++ b/tools/libxc/xc_cpuid_x86.c
>>>>> @@ -579,52 +579,68 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid,
>>>>>      }
>>>>>      else
>>>>>      {
>>>>> -        /*
>>>>> -         * Topology for HVM guests is entirely controlled by Xen.  For now, we
>>>>> -         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
>>>>> -         */
>>>>> -        p->basic.htt = true;
>>>>> +        p->basic.htt = false;
>>>>>          p->extd.cmp_legacy = false;
>>>>>  
>>>>> -        /*
>>>>> -         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
>>>>> -         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
>>>>> -         * overflow.
>>>>> -         */
>>>>> -        if ( !(p->basic.lppp & 0x80) )
>>>>> -            p->basic.lppp *= 2;
>>>>> -
>>>> I appreciate you wanting to put all adjustments in a central place, but
>>>> at least it makes patch review more difficult. How about you latch
>>>> !getenv("XEN_LIBXC_DISABLE_FAKEHT") into a local boolean at the top of
>>>> the function and then the above would become
>>>>
>>>>         if ( !(p->basic.lppp & 0x80) )
>>>>             p->basic.lppp <<= fakeht;
>>>>
>>>> and e.g. ...
>>>>
>>>>>          switch ( p->x86_vendor )
>>>>>          {
>>>>>          case X86_VENDOR_INTEL:
>>>>>              for ( i = 0; (p->cache.subleaf[i].type &&
>>>>>                            i < ARRAY_SIZE(p->cache.raw)); ++i )
>>>>>              {
>>>>> -                p->cache.subleaf[i].cores_per_package =
>>>>> -                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
>>>> ... this
>>>>
>>>>                 p->cache.subleaf[i].cores_per_package =
>>>>                     (p->cache.subleaf[i].cores_per_package << fakeht) | fakeht;
>>> I'm afraid I think the code itself would then become more difficult to
>>> read;
>> Slightly, but yes.
>>
>>> and it seems a bit strange to be architecting our code based on
>>> limitations of the diff algorithm and/or diff viewer used.
>> It's not entirely uncommon to (also) consider how the resulting
>> diff would look like when putting together a change. And besides
>> the review aspect, there's also the archeology one - "git blame"
>> yields much more helpful results when code doesn't get moved
>> around more than necessary. But yes, there's no very clear "this
>> is the better option" here. I've taken another look at the code
>> before your change though - everything is already nicely in one
>> place with Andrew's most recent code reorg. So I'm now having an
>> even harder time seeing why you want to move things around again.
> 
> We don't.  I've recommend twice now to have a single "else if" hunk
> which is nearly empty, and much more obviously a gross "make it work for
> 4.13" bodge.

The results are a tiny bit better, but not much really (see attached).

 -George

--------------24F85F7DFBCF0D3EC00021CA
Content-Type: text/x-patch;
	name="0001-x86-Add-hack-to-disable-Fake-HT-mode.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-x86-Add-hack-to-disable-Fake-HT-mode.patch"

From f26c03ebc1b8ad91a61ce07fd5632ea63f158120 Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Thu, 14 Nov 2019 16:58:34 +0000
Subject: [PATCH] x86: Add hack to disable "Fake HT" mode

Changeset ca2eee92df44 ("x86, hvm: Expose host core/HT topology to HVM
guests") attempted to "fake up" a topology which would induce guest
operating systems to not treat vcpus as sibling hyperthreads.  This
involved (among other things) actually reporting hyperthreading as
available, but giving vcpus every other APICID.  The resulting cpu
featureset is invalid, but most operating systems on most hardware
managed to cope with it.

Unfortunately, Windows running on modern AMD hardware -- including
Ryzen 3xxx series processors, and reportedly EPYC "Rome" cpus -- gets
confused by the resulting contradictory feature bits and crashes
during installation.  (Linux guests have so far continued to cope.)

A "proper" fix is complicated and it's too late to fix it either for
4.13, or to backport to supported branches.  As a short-term fix,
implement an option to disable this "Fake HT" mode.  The resulting
topology reported will not be canonical, but experimentally continues
to work with Windows guests.

However, disabling this "Fake HT" mode has not been widely tested, and
will almost certainly break migration if applied inconsistently.

To minimize impact while allowing administrators to disable "Fake HT"
only on guests which are known not to work without it (i.e., Windows
guests) on affected hardware, add an environment variable which can be
set to disable the "Fake HT" mode on such hardware.

Reported-by: Steven Haigh <netwiz@crc.id.au>
Reported-by: Andreas Kinzler <hfp@posteo.de>
Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
This has been compile-tested only; I'm posting it early to get
feedback on the approach.

TODO: Prevent such guests from being migrated

Open questions:

- Is this the right place to put the `getenv` check?

- Is there any way we can make migration work, at least in some cases?

- Can we check for known-problematic models, and at least report a
  more useful error?

CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Anthony Perard <anthony.perard@citrix.com>
---
 tools/libxc/xc_cpuid_x86.c | 97 +++++++++++++++++++++++---------------
 1 file changed, 58 insertions(+), 39 deletions(-)

diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
index 312c481f1e..bc088e45f0 100644
--- a/tools/libxc/xc_cpuid_x86.c
+++ b/tools/libxc/xc_cpuid_x86.c
@@ -579,52 +579,71 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid,
     }
     else
     {
-        /*
-         * Topology for HVM guests is entirely controlled by Xen.  For now, we
-         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
-         */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
+        if ( !getenv("XEN_LIBXC_DISABLE_FAKEHT") ) {
+            /*
+             * Topology for HVM guests is entirely controlled by Xen.  For now, we
+             * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
+             */
+            p->basic.htt = true;
+            p->extd.cmp_legacy = false;
 
-        /*
-         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
-         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
-         * overflow.
-         */
-        if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
+            /*
+             * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
+             * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
+             * overflow.
+             */
+            if ( !(p->basic.lppp & 0x80) )
+                p->basic.lppp *= 2;
 
-        switch ( p->x86_vendor )
-        {
-        case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
+            switch ( p->x86_vendor )
             {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
+            case X86_VENDOR_INTEL:
+                for ( i = 0; (p->cache.subleaf[i].type &&
+                              i < ARRAY_SIZE(p->cache.raw)); ++i )
+                {
+                    p->cache.subleaf[i].cores_per_package =
+                        (p->cache.subleaf[i].cores_per_package << 1) | 1;
+                    p->cache.subleaf[i].threads_per_cache = 0;
+                }
+
+            case X86_VENDOR_AMD:
+            case X86_VENDOR_HYGON:
+                /*
+                 * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
+                 * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
+                 * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
+                 * - overflow,
+                 * - going out of sync with leaf 1 EBX[23:16],
+                 * - incrementing ApicIdCoreSize when it's zero (which changes the
+                 *   meaning of bits 7:0).
+                 */
+                if ( p->extd.nc < 0x7f )
+                {
+                    if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size != 0xf )
+                        p->extd.apic_id_size++;
+
+                    p->extd.nc = (p->extd.nc << 1) | 1;
+                }
+                break;
+
             }
-            break;
+        }
+        else
+        {
+            p->basic.htt = false;
+            p->extd.cmp_legacy = false;
 
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-            /*
-             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
-             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
-             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
-             * - overflow,
-             * - going out of sync with leaf 1 EBX[23:16],
-             * - incrementing ApicIdCoreSize when it's zero (which changes the
-             *   meaning of bits 7:0).
-             */
-            if ( p->extd.nc < 0x7f )
+            switch ( p->x86_vendor )
             {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size != 0xf )
-                    p->extd.apic_id_size++;
-
-                p->extd.nc = (p->extd.nc << 1) | 1;
+            case X86_VENDOR_INTEL:
+                for ( i = 0; (p->cache.subleaf[i].type &&
+                              i < ARRAY_SIZE(p->cache.raw)); ++i )
+                {
+                    p->cache.subleaf[i].cores_per_package = 0;
+                    p->cache.subleaf[i].threads_per_cache = 0;
+                }
+                break;
             }
-            break;
         }
 
         /*
-- 
2.24.0


--------------24F85F7DFBCF0D3EC00021CA
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------24F85F7DFBCF0D3EC00021CA--

