Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6EF467B62
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 17:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237846.412495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtBRq-0002DN-SB; Fri, 03 Dec 2021 16:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237846.412495; Fri, 03 Dec 2021 16:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtBRq-0002BZ-O7; Fri, 03 Dec 2021 16:30:10 +0000
Received: by outflank-mailman (input) for mailman id 237846;
 Fri, 03 Dec 2021 16:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mtBRp-0002BT-7i
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 16:30:09 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 467cc671-5456-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 17:30:07 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:51008)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mtBRe-000xOG-gZ (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 16:29:58 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E9EB41FC8B;
 Fri,  3 Dec 2021 16:29:57 +0000 (GMT)
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
X-Inumbo-ID: 467cc671-5456-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d54208f3-160a-90be-586b-659200029302@srcf.net>
Date: Fri, 3 Dec 2021 16:29:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-2-andrew.cooper3@citrix.com>
 <da06dfe42adad13650755650518a232dd41ac46e.camel@suse.com>
 <8e3f7318-2fb4-0011-f582-268816ebb59c@suse.com>
 <db0443d4fc414e17e0bba075043f8ae60b062860.camel@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
In-Reply-To: <db0443d4fc414e17e0bba075043f8ae60b062860.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/2021 09:07, Dario Faggioli wrote:
> On Mon, 2021-09-27 at 09:51 +0200, Jan Beulich wrote:
>> On 24.09.2021 16:51, Dario Faggioli wrote:
>>> On Mon, 2021-09-20 at 18:25 +0100, Andrew Cooper wrote:
>>>
>>>> There is one buggy race record, TRC_RTDS_BUDGET_BURN.  As it must
>>>> remain
>>>> __packed (as cur_budget is misaligned), change bool has_extratime
>>>> to
>>>> uint32_t
>>>> to compensate.
>>>>
>>> Mmm... maybe my understanding of data alignment inside structs is a
>>> bit
>>> lacking, but what the actual issue here, and what would we need to
>>> do
>>> to fix it (where, by fix, I mean us being able to get rid of the
>>> `__packed`)?
>>>
>>> If rearranging fields is not enough, we can think about making
>>> priority_level and has_extratime smaller, or even combining them in
>>> just one field and decode the information in xentrace.
>> I guess Andrew has tried to avoid re-arranging field order so that
>> the consumer side doesn't need to also change.
>>
> Right, but is it really worth it, in this case?
>
> Aren't we (very very likely) in control, by having them here in the
> tree, of all the consumers? And is is this a stable ABI?
>
> Also, both xentrace_format and xenalyze are being modified in this
> series anyway...
>
> Maybe there's still something I'm missing, but if we've getting rid of
> those ugly bitfields and __packed attributes, it seems to me that doing
> it completely --i.e., including in this case-- is worth the small
> change in the tools.

This patch needs backporting to stable trees.  We shouldn't be changing
the ABI, even if its stability is unclear.

Which means patch 2 needs altering to avoid ABI changes.  /sigh

~Andre

