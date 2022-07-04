Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDAF565437
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 13:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360258.589605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Kj5-0007oy-6S; Mon, 04 Jul 2022 11:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360258.589605; Mon, 04 Jul 2022 11:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Kj5-0007lt-30; Mon, 04 Jul 2022 11:58:51 +0000
Received: by outflank-mailman (input) for mailman id 360258;
 Mon, 04 Jul 2022 11:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nV5m=XJ=leemhuis.info=regressions@srs-se1.protection.inumbo.net>)
 id 1o8Kj3-0007ln-Nf
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 11:58:49 +0000
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [2a01:488:42:1000:50ed:8234::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a962794c-fb90-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 13:58:48 +0200 (CEST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1o8Kiw-0000tH-DU; Mon, 04 Jul 2022 13:58:42 +0200
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
X-Inumbo-ID: a962794c-fb90-11ec-a8e4-439420d8e422
Message-ID: <8756355c-b586-3d1b-531c-72a04a8c047a@leemhuis.info>
Date: Mon, 4 Jul 2022 13:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Ping: [PATCH] x86/PAT: have pat_enabled() properly reflect state
 when running on e.g. Xen
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Lutomirski <luto@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <9385fa60-fa5d-f559-a137-6608408f88b0@suse.com>
 <dff7bcd3-affc-9272-81e9-d686d9c997d5@suse.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <dff7bcd3-affc-9272-81e9-d686d9c997d5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1656935928;6fc7cd1e;
X-HE-SMSGID: 1o8Kiw-0000tH-DU

On 25.05.22 10:55, Jan Beulich wrote:
> On 28.04.2022 16:50, Jan Beulich wrote:
>> The latest with commit bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT
>> with pat_enabled()") pat_enabled() returning false (because of PAT
>> initialization being suppressed in the absence of MTRRs being announced
>> to be available) has become a problem: The i915 driver now fails to
>> initialize when running PV on Xen (i915_gem_object_pin_map() is where I
>> located the induced failure), and its error handling is flaky enough to
>> (at least sometimes) result in a hung system.
>>
>> Yet even beyond that problem the keying of the use of WC mappings to
>> pat_enabled() (see arch_can_pci_mmap_wc()) means that in particular
>> graphics frame buffer accesses would have been quite a bit less
>> performant than possible.
>>
>> Arrange for the function to return true in such environments, without
>> undermining the rest of PAT MSR management logic considering PAT to be
>> disabled: Specifically, no writes to the PAT MSR should occur.
>>
>> For the new boolean to live in .init.data, init_cache_modes() also needs
>> moving to .init.text (where it could/should have lived already before).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The Linux kernel regression tracker is pestering me because things are
> taking so long (effectively quoting him), and alternative proposals
> made so far look to have more severe downsides.

Has any progress been made with this patch? It afaics is meant to fix
this regression, which ideally should have been fixed weeks ago (btw:
adding a "Link:" tag pointing to it would be good):
https://lore.kernel.org/regressions/YnHK1Z3o99eMXsVK@mail-itl/

According to Juergen it's still needed:
https://lore.kernel.org/lkml/c5515533-29a9-9e91-5a36-45f00f25b37b@suse.com/

Or was a different solution found to fix that regression?

Ciao, Thorsten

