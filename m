Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA745CB68
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 18:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230491.398441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwRS-0001z7-Rc; Wed, 24 Nov 2021 17:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230491.398441; Wed, 24 Nov 2021 17:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwRS-0001xJ-OG; Wed, 24 Nov 2021 17:52:22 +0000
Received: by outflank-mailman (input) for mailman id 230491;
 Wed, 24 Nov 2021 17:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jHA0=QL=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mpwRR-0001vC-Ru
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 17:52:21 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44829c70-4d4f-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 18:52:20 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49306)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mpwRO-0006Gh-i0 (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 24 Nov 2021 17:52:18 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 6962A1FA84;
 Wed, 24 Nov 2021 17:52:18 +0000 (GMT)
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
X-Inumbo-ID: 44829c70-4d4f-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9fd0c2f4-1b8f-bcd3-93bd-eea47b61e445@srcf.net>
Date: Wed, 24 Nov 2021 17:52:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: Ian Jackson <iwj@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20211124161649.83189-1-roger.pau@citrix.com>
 <24990.26451.287618.213116@mariner.uk.xensource.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max
 policies
In-Reply-To: <24990.26451.287618.213116@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/11/2021 16:24, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max policies"):
>> Shrinking max policies can lead to failures in migration as previous
>> versions of Xen didn't shrink the number of leaves in any case, so
>> it's possible for a guest created on previous versions of Xen that
>> pass CPUID data on the migration stream to contain a max leaf number
>> greatest than the one present on the max policies in versions of Xen
>> containing 540d911c28.
>>
>> Such failure was seen by osstest when doing a migration from Xen
>> 4.15 to Xen 4.16-rc on a pair of equal boxes, the noceras.
>>
>> Fix this by preventing any shrinking of the max CPUID policies, so
>> that previously built guest CPUID policies are compatible.
>>
>> Fixes: 540d911c28 ('x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ...
>> This is a regression from Xen 4.15, so should be considered for Xen
>> 4.16. The main risks would be to mess up with the CPUID policy in a
>> different way, that would also lead to brokenness. Strictly speaking
>> the change here removes the shrinking of max leaves and restores the
>> previous behavior, but it's obviously not completely risk free.
>>
>> It has proven to fix the regression seen on the noceras.
> Ouch.
>
> Questions from my RM hat:
>
> Is there a workaround ?

No.

The safety check being tripped is intended to prevent the VM crashing on
resume, and is functioning correctly.

> What proportion of machines do we think this might affect ?

Any pre-xsave machines (~2012 and older), and any newer machines booted
with no-xsave.

All AMD machines are actually broken by this, except that failure is
being masked by other changes in 4.16.  Future AMD machines will break
in the same way.

> Jan, Andy, do you have an opinion ?

The reversion doesn't go far enough.

While the shrinking of the max policies manifests as a concrete breakage
here, there is further breakage caused by shrinking the default
policies, because it renders some cpuid= settings in VM config files broken.

There is still no feedback or error checking from individual cpuid=
settings, so this will manifest as the VM admin settings silently no
longer taking effect.


I recommend a full and complete reversion of 540d911c28.  The
justification for it in the first place is especially weak because it is
explicitly contrary to how real hardware behaves, and this is the 3rd
ABI breakage it has caused, with more expected in the future based on
the analysis of what has gone wrong so far.

~Andrew

