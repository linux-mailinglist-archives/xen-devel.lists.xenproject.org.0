Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29550310B80
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 14:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81700.151061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l80n1-0007vw-0F; Fri, 05 Feb 2021 13:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81700.151061; Fri, 05 Feb 2021 13:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l80n0-0007vY-TN; Fri, 05 Feb 2021 13:04:46 +0000
Received: by outflank-mailman (input) for mailman id 81700;
 Fri, 05 Feb 2021 13:04:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l80mz-0007vT-0N
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 13:04:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd61a216-b801-4886-8864-8f2437836436;
 Fri, 05 Feb 2021 13:04:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26F55AC9B;
 Fri,  5 Feb 2021 13:04:43 +0000 (UTC)
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
X-Inumbo-ID: cd61a216-b801-4886-8864-8f2437836436
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612530283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ao4EmPSYFr99nEYNECu1PQXBnTpacFV+NGYq7fH28qY=;
	b=Tk3y7qc8Ot0sENOuTE3a+N7z8lv61F28vkvfS7PQVedQuV2zFtPCp05o0pLPuGi7402A6M
	ug8qNz7c0yOrftbDxZEECP10Qf2eifrBdzwdIq5FIcfLfRtHMyJf0EUSEDqMN1mPvnwmqg
	Oya1l68p6T0EOyAMk4wRKaoBCU7dhYQ=
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_x86/PV=3a_conditionally_a?=
 =?UTF-8?Q?void_raising_=23GP_for_early_guest_MSR_accesses?=
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
 <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
 <cf24a63e-afe9-be6a-3ab9-cc65e19a7a0f@suse.com>
 <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>
 <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
 <7fdfac30-0c7f-f07d-fc7c-f7bb87b71a28@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <153ebca8-cffe-53da-420b-274ac0f535d9@suse.com>
Date: Fri, 5 Feb 2021 14:04:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7fdfac30-0c7f-f07d-fc7c-f7bb87b71a28@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.02.2021 12:32, Andrew Cooper wrote:
> On 05/02/2021 10:56, Jürgen Groß wrote:
>> On 05.02.21 11:14, Jan Beulich wrote:
>>> On 04.11.2020 11:50, Jan Beulich wrote:
>>>> On 03.11.2020 18:31, Andrew Cooper wrote:
>>>>> We should have the impacted MSRs handled explicitly, with a note
>>>>> stating
>>>>> this was a bug in Linux 4.14 and older.  We already have workaround
>>>>> for
>>>>> similar bugs in Windows, and it also gives us a timeline to eventually
>>>>> removing support for obsolete workarounds, rather than having a
>>>>> "now and
>>>>> in the future, we'll explicitly tolerate broken PV behaviour for
>>>>> one bug
>>>>> back in ancient linux".
>>>>
>>>> Comparing with Windows isn't very helpful; the patch here is
>>>> specifically about PV, and would help other OSes as well in
>>>> case they would have missed setting up exceptions early in
>>>> just the PV-on-Xen case. For the HVM case I'd indeed rather
>>>> see us go the route we've gone for Windows, if need be.
>>>
>>> As can be seen from this reply, we're not in agreement what to
>>> do here. But we need to do something. I'm not sure how to get
>>> unstuck discussions like this one ...
>>>
>>> Besides this suggestion of yours I also continue to have
>>> trouble seeing what good it will do to record an exception to
>>> inject into a guest when we know it didn't install a handler
>>> yet.
>>
>> As we need to consider backports of processor bug mitigations
>> in old guests, too, I think we need to have a "catch-all"
>> fallback.
>>
>> Not being able to run an old updated guest until we add handling
>> for a new MSR isn't a viable option IMO.
> 
> You're trading off against issuing XSAs for all the unknown quantities
> of sensitive in MSRs on all past and future platforms.  This has
> unbounded scope.
> 
> Xen's previous behaviour was astoundingly stupid, and yes - we're
> playing more than a decades worth of catchup in one release cycle.
> 
> I'll absolutely take "care/tweaks need to happen crossing the Xen
> 4.14=>4.15 boundary" over whack-a-mole for MSRs in the form of security
> advisories.

All of this reads as if someone was asking to re-introduce the
blind leaking of MSRs. I'm pretty sure though you realize that
this isn't the case, so I guess I'm confused ...

Note that while I have just disagreed with Jürgen's specific
case, I still think the conclusion is right: Where possible
_without_ reintroducing tjhe bad original behavior, we should
try to not put ourselves in the position of needing to update
Xen once guests want to access new MSRs (or even us simply
being unaware of present guests having rarely used code paths
leading to such MSR accesses).

Jan

