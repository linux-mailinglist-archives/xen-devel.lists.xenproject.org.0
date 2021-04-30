Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107DF36F89A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 12:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120450.227788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcQbI-0005et-ES; Fri, 30 Apr 2021 10:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120450.227788; Fri, 30 Apr 2021 10:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcQbI-0005eU-Ai; Fri, 30 Apr 2021 10:42:24 +0000
Received: by outflank-mailman (input) for mailman id 120450;
 Fri, 30 Apr 2021 10:42:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcQbG-0005eM-IE
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 10:42:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b7b3f7b-f070-484d-b2d3-8181dd4bfb8b;
 Fri, 30 Apr 2021 10:42:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 854C9B20E;
 Fri, 30 Apr 2021 10:42:20 +0000 (UTC)
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
X-Inumbo-ID: 2b7b3f7b-f070-484d-b2d3-8181dd4bfb8b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619779340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qju5zYIfdgnu78L+Gk2M7lZddq0lNK5l5W+IlSBkRk=;
	b=nlol86ckJiwp/cjWSsEiLHJcXGMFt0cdL5GSh7ArFCw/p2JRKVmygs2pNDxRChTpFGSsYF
	ze1SYRsT/YBh5PTGwGIALeZmRviAC3U8Q+zcFThvbum9/E0ylLbc3i6xAVhBxWgPON50pM
	MJLX32SseZUKqaKMcBZXFc9SJr4mjuo=
Subject: Re: [PATCH] x86: Always have CR4.PKE set in HVM context
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210429221223.28348-1-andrew.cooper3@citrix.com>
 <4781e8f1-d70b-2736-364c-eeed61869031@suse.com>
 <5b1938c7-408a-5912-7e66-b5e207e268bd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1150e1b5-c6a1-7685-8775-0e4039dbc903@suse.com>
Date: Fri, 30 Apr 2021 12:42:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5b1938c7-408a-5912-7e66-b5e207e268bd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.04.2021 12:21, Andrew Cooper wrote:
> On 30/04/2021 10:08, Jan Beulich wrote:
>> On 30.04.2021 00:12, Andrew Cooper wrote:
>>> The sole user of read_pkru() is the emulated pagewalk, and guarded behind
>>> guest_pku_enabled() which restricts the path to HVM (hap, even) context only.
>>>
>>> The commentary in read_pkru() concerning _PAGE_GNTTAB overlapping with
>>> _PAGE_PKEY_BITS is only applicable to PV guests.
>>>
>>> The context switch path, via write_ptbase() unconditionally writes CR4 on any
>>> context switch.
>>>
>>> Therefore, we can guarantee to separate CR4.PKE between PV and HVM context at
>>> no extra cost.  Set PKE in mmu_cr4_features on boot, so it becomes set in HVM
>>> context, and clear it in pv_make_cr4().
>>>
>>> Rename read_pkru() to rdpkru() now that it is a simple wrapper around the
>>> instruction.  This saves two CR4 writes on every pagewalk, which typically
>>> occur more than one per emulation.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> The changes looks perfectly fine to me, but I still feel urged to make
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> conditional upon my "x86emul: support RDPKRU/WRPKRU" (submitted exactly
>> half a year ago) going in first, unless there were to be review comments
>> making extensive rework necessary. In the absence of such review
>> feedback, I consider it pretty inappropriate for me to do rebasing work
>> (no matter that this would be largely mechanical afaics) here for a
>> patch which has been pending and effectively ignored for so long. (The
>> main thing that immediately struck me as odd was "The sole user of
>> read_pkru() is ...".)
> 
> So the observation about "sole user" occurred to me too, right after I
> sent this.  Then I thought "surely Jan has spotted this and done a patch
> for it".
> 
> Presumably you're talking about "x86emul: support RDPKRU/WRPKRU" from
> Oct 30th ?  I found that via the archives, but I literally don't have a
> copy in my inbox.

Odd. Was that then the time of your severe email issues, and were your
IT folks not even able to make sure pending email got delivered
afterwards (or at least enumerate what emails got discarded)? If I had
got a reply saying the mail couldn't be delivered, I surely would have
resent it.

Just to be sure - you seem to have got a copy of "x86emul: de-duplicate
scatters to the same linear address", as I seem to recall you responding
there, albeit not with an ack or anything I could actually act upon (and
this might have been in irc). That was sent just a few days later, and
suffers a similar stall. And while in a ping I did say I would commit it
without ack, I'm really hesitant to do so there. I've put it on next
week's community meeting's agenda, just in case.

> If I do the rebase, are you happy for this patch to stay as it is (so
> the complicated change concerning context switching doesn't get more
> complicated), and so we're not knowingly adding new constructs which
> need immediate changes?

Well, the answer is not just "yes", but in reality I wouldn't mind
doing the rebasing myself, if only I knew it wasn't for the purpose of
waiting another half year for an ack (or otherwise).

Jan

