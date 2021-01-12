Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57BA2F3B60
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 21:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65996.117020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPwD-0000LY-5f; Tue, 12 Jan 2021 20:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65996.117020; Tue, 12 Jan 2021 20:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPwD-0000L9-1y; Tue, 12 Jan 2021 20:06:45 +0000
Received: by outflank-mailman (input) for mailman id 65996;
 Tue, 12 Jan 2021 20:06:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v4LF=GP=cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1kzPwA-0000L4-3S
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 20:06:42 +0000
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 057b7287-b5c4-49e0-98a1-9f4873397190;
 Tue, 12 Jan 2021 20:06:40 +0000 (UTC)
Received: from 88-111-124-141.dynamic.dsl.as9105.com ([88.111.124.141]:57544
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kzPw6-000fDW-Sk (Exim 4.92.3)
 (return-path <amc96@cam.ac.uk>); Tue, 12 Jan 2021 20:06:39 +0000
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
X-Inumbo-ID: 057b7287-b5c4-49e0-98a1-9f4873397190
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk;
	 s=20180806.ppsw; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Wb0un0JdqSclajHJKwiKl85g7WZnt4jTGIJY5QsrR8=; b=QW6JoWQRmGNDbFot25ialNEfib
	J6LY7swnhNRJDRXqYpfsWgSFS7B0MEy5SibpWppaIypU3FcCnGct31NHfXdUdVikO8c68LWQJjDnO
	wyXdludCWoCrmSAttg81B1/tbGt7KlI0eOhq6wApmIVxLS9QRneuoRh5og+43bpqQCaQ=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
To: Jan Beulich <jbeulich@suse.com>
Cc: 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <julien@xen.org>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>,
 'Tamas K Lengyel' <tamas@tklengyel.com>,
 'Xen-devel' <xen-devel@lists.xenproject.org>, paul@xen.org
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-3-andrew.cooper3@citrix.com>
 <001601d69258$4d6a7c90$e83f75b0$@xen.org>
 <835893e1-fcd0-efa1-86ce-02af70dd1101@cam.ac.uk>
 <6eb3bf50-d1dc-e010-16d0-261f7562a140@suse.com>
From: Andrew Cooper <amc96@cam.ac.uk>
Message-ID: <bfe0f28b-4e16-fb39-7aee-b8f538b6f979@cam.ac.uk>
Date: Tue, 12 Jan 2021 20:06:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6eb3bf50-d1dc-e010-16d0-261f7562a140@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 12/01/2021 08:23, Jan Beulich wrote:
> On 11.01.2021 22:22, Andrew Cooper wrote:
>> On 24/09/2020 10:51, Paul Durrant wrote:
>>>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>>>> index a5d3ed8bda..912f07be47 100644
>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -4013,6 +4013,81 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>>>>      return 0;
>>>>  }
>>>>
>>>> +int gnttab_acquire_resource(
>>>> +    struct domain *d, unsigned int id, unsigned long frame,
>>>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>>>> +{
>>>> +    struct grant_table *gt = d->grant_table;
>>>> +    unsigned int i = nr_frames, tot_frames;
>>>> +    mfn_t tmp;
>>>> +    void **vaddrs = NULL;
>>>> +    int rc;
>>>> +
>>>> +    /* Input sanity. */
>>> Nit: inconsistency with full stops on single line comments.
>> The whole point of relaxing the style was because feedback over minutia
>> such as this was deemed detrimental to the community.
>>
>> If I ever see feedback like this, I will commit commit the patch there
>> and then.  This is the only way upstream Xen is going to turn into a
>> less toxic environment for contributors.
> Paul had clearly marked this as "nit". ./CODING_STYLE explicitly
> allows omission as well as presence of a full stop here. So while
> I agree with you that you'd be okay ignoring such a remark, I
> also agree with Paul giving the remark if he's found a nearby
> comment using the opposite variant.

A reply like that means "this needs changing".  This is how it is read
by people, even if it is not how it was intended.

Contributors do not know CODING_STYLE off by heart, and even if they
did, it is the responsibility of a reviewer not to mislead the
contributor, not the contributors responsibility to challenge incorrect
feedback.

As it stands, the reply requires change of something which is explicitly
permitted under CODING_STYLE.  The change to CODING_STYLE was made
specially to prevent feedback of this form to begin with.

This is not an ok use of anyone's time, nor is repeating the argument
which lead to CODING_STYLE being changed to begin with.

~Andrew

