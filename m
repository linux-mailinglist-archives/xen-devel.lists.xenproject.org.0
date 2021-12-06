Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A3469B4E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:11:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239218.414626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFe3-0001qD-Km; Mon, 06 Dec 2021 15:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239218.414626; Mon, 06 Dec 2021 15:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFe3-0001o5-GC; Mon, 06 Dec 2021 15:11:11 +0000
Received: by outflank-mailman (input) for mailman id 239218;
 Mon, 06 Dec 2021 15:11:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gMFW=QX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muFe2-0001cz-EY
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:11:10 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9ed6934-56a6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 16:11:03 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40882)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muFdu-000l6E-nT (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 06 Dec 2021 15:11:02 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 249A51FDB9;
 Mon,  6 Dec 2021 15:11:02 +0000 (GMT)
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
X-Inumbo-ID: b9ed6934-56a6-11ec-8a4d-196798b21f7b
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <211f1b19-5f36-3153-bdc3-d904193b3643@srcf.net>
Date: Mon, 6 Dec 2021 15:11:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211206130855.15372-1-andrew.cooper3@citrix.com>
 <9ac98bc7-5b39-3c88-556b-53a5fdeb2445@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/boot: Restrict directmap permissions for
 .text/.rodata
In-Reply-To: <9ac98bc7-5b39-3c88-556b-53a5fdeb2445@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 13:58, Jan Beulich wrote:
> On 06.12.2021 14:08, Andrew Cooper wrote:
>> While we've been diligent to ensure that the main text/data/rodata mappings
>> have suitable restrictions, their aliases via the directmap were left fully
>> RW.  Worse, we even had pieces of code making use of this as a feature.
>>
>> Restrict the permissions, as we have no legitimate need for writeability of
>> these areas via the directmap alias.
> Where do we end up reading .text and/or .rodata through the directmap? Can't
> we zap the mappings altogether?

I felt it was safer to keep readability via the directmap.

I'm not aware of any logic we have which reads the directmap in order,
but it ought to be possible.

> As to superpage shattering - I understand this is not deemed to be an issue
> in the common case since, with Xen moved as high up below 4G as possible,
> it wouldn't normally live inside a 1G mapping anyway? This may want calling
> out here. Plus, in non-EFI, non-XEN_ALIGN_2M builds isn't this going to
> shatter a 2M page at the tail of .rodata?

cpu0_stack has already shattered down to 4k, which is likely in the same
superpage as rodata in a non-2M build.

But at the end of the day, it is a security/performance tradeoff.

memcpy(__va(__pa(divide_error)), "\x0f\x0b", 2);
asm ("div %ecx" :: "c" (0));

is an especially low barrier for an attacker who has a partial write gadget.

The security benefits are substantial, and the perf downsides are a
handful of extra pagetables, and a handful of pagewalks taking extra
steps, in non-fast paths (i.e. distinctly marginal).

It occurs to me while writing this that the same applies to livepatches.

>
>> Note that the pagetables and cpu0_stack do get written through their directmap
>> alias, so we can't just read-only the whole image.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> Ever so slightly RFC, as it has only had light testing.
>>
>> Notes:
>>  * The stubs are still have RX via one alias, RW via another, and these need
>>    to stay.  Hardening options include splitting the stubs so the SYSCALL ones
>>    can be read-only after setup, and/or expanding the stub size to 4k per CPU
>>    so we really can keep the writeable alias as not present when the stub
>>    isn't in active use.
>>  * Future CPUs with Protection Key Supervisor (Sapphire Rapids and later)
>>    would be able to inhibit writeability outside of a permitted region, and
>>    because the protection key is per logical thread, we woulnd't need to
>>    expand the stubs to 4k per CPU.
> I'm afraid I don't follow: The keys still apply to entire pages, don't they?
> This would still allow write access by all 16 CPUs sharing a page for their
> stubs.

It would be all stubs, because there are only 16 protection keys and we
wouldn't want to interleave adjacent stub mappings.

The logic would now be:

pks_allow_write_access();
write new stub;
pks_revoke_write_access();

so as to limit writeability of any stub to just the critical intending
to modify it.

This way, an unrelated buggy hypercall couldn't write into the stub.

>>  * At the time of writing, PV Shim still makes use of .rodata's read/write
>>    alias in the directmap to patch the hypercall table, but that runs earlier
>>    on boot.  Also, there are patches out to address this.
> I did consider committing that change, but it wasn't clear to me whether
> there were dependencies on earlier parts of the series that it's part of.

I've got a dis-entangled version in my CET series.

https://github.com/andyhhp/xen/commit/8d55e1c8ff1d979c985b3fb75c23627348c15209

which needed some header file adjustments to build.

But yes - I too was thinking that it ought to be committed.

~Andrew

