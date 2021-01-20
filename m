Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EE2FCD38
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 10:12:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71282.127530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29Wg-0006YL-Nm; Wed, 20 Jan 2021 09:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71282.127530; Wed, 20 Jan 2021 09:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29Wg-0006Xz-Kb; Wed, 20 Jan 2021 09:11:42 +0000
Received: by outflank-mailman (input) for mailman id 71282;
 Wed, 20 Jan 2021 09:11:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l29We-0006Xu-Fc
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 09:11:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 644164c2-ebdf-4154-9a46-d3053ba1d680;
 Wed, 20 Jan 2021 09:11:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B26DAAAE;
 Wed, 20 Jan 2021 09:11:38 +0000 (UTC)
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
X-Inumbo-ID: 644164c2-ebdf-4154-9a46-d3053ba1d680
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611133898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sfJnZU1jnrscntvQUch02z1b1riFO94uq2poCm5NGpo=;
	b=MhngadF55yE/4B9lTIsSu0W819FOiu5JJ/YAmAG71BeNeRkM4/LlovUlCbbInqDEmo+nRh
	xQ7Cz1MTrx54Q8uZgSbqjUnK8jI+i1xWErMZcuxlKkHdc5iz5tYg7fImpI+ovbmTwzyq+R
	+WSie+XhEW/CBJjFQM+1EcRzQOQDIwU=
Subject: Re: [PATCH 1/3] x86/smpboot: Re-position the call to tboot_wake_ap()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Marek Kasiewicz <marek.kasiewicz@3mdeb.com>,
 =?UTF-8?Q?Norbert_Kami=c5=84ski?= <norbert.kaminski@3mdeb.com>,
 Michal Zygowski <michal.zygowski@3mdeb.com>, Piotr Krol
 <piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Rich Persaud <persaur@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-2-andrew.cooper3@citrix.com>
 <20210119143814.xtijb2ggz5yz5xvj@Air-de-Roger>
 <46b505b8-7dbc-35da-f8e7-3329f0b69a44@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <961c9c23-3ca8-76fc-b4c6-d0f84ab2f6e3@suse.com>
Date: Wed, 20 Jan 2021 10:11:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <46b505b8-7dbc-35da-f8e7-3329f0b69a44@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.01.2021 15:55, Andrew Cooper wrote:
> On 19/01/2021 14:38, Roger Pau Monné wrote:
>> On Fri, Jan 15, 2021 at 11:10:44PM +0000, Andrew Cooper wrote:
>>> So all the moving parts are in one function.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
>>> CC: Norbert Kamiński <norbert.kaminski@3mdeb.com>
>>> CC: Michal Zygowski <michal.zygowski@3mdeb.com>
>>> CC: Piotr Krol <piotr.krol@3mdeb.co>
>>> CC: Krystian Hebel <krystian.hebel@3mdeb.com>
>>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> CC: Rich Persaud <persaur@gmail.com>
>>> CC: Christopher Clark <christopher.w.clark@gmail.com>
>>> ---
>>>  xen/arch/x86/smpboot.c | 10 ++++++++--
>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>>> index 67e727cebd..9eca452ce1 100644
>>> --- a/xen/arch/x86/smpboot.c
>>> +++ b/xen/arch/x86/smpboot.c
>>> @@ -426,6 +426,13 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>>      int maxlvt, timeout, i;
>>>  
>>>      /*
>>> +     * Some versions of tboot might be able to handle the entire wake sequence
>>> +     * on our behalf.
>>> +     */
>>> +    if ( tboot_in_measured_env() && tboot_wake_ap(phys_apicid, start_eip) )
>> I think you are missing a ! in front of tboot_wake_ap?
> 
> Oh - so I am.  That function is totally backwards.
> 
> Fixed.

And then

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

