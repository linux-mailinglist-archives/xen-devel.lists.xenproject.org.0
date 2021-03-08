Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F73311E3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 16:16:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95014.179188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJHbE-0007RZ-Ik; Mon, 08 Mar 2021 15:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95014.179188; Mon, 08 Mar 2021 15:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJHbE-0007RA-FQ; Mon, 08 Mar 2021 15:15:12 +0000
Received: by outflank-mailman (input) for mailman id 95014;
 Mon, 08 Mar 2021 15:15:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJHbD-0007R5-KT
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 15:15:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbfa2ff5-d30e-432b-974a-e1e7d8d87101;
 Mon, 08 Mar 2021 15:15:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 898ACAE15;
 Mon,  8 Mar 2021 15:15:09 +0000 (UTC)
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
X-Inumbo-ID: bbfa2ff5-d30e-432b-974a-e1e7d8d87101
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615216509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NY9P1lEQ4kCt/hDvkCiZv1Pj4mvjOxZ1tK9OA1fVxHo=;
	b=Vo9nwKuWJKmgY257dOoFBjkgyqeLPmIM4RayT8Vi87vWxTBMYg6pnx3dZevbADQ08JfuiB
	oT8sV/gkJwBLjHvWncM0xSEWNQzTMTujo7hCkW9Fc7TE3rc14Wvt6lRCuDTaww+jzPtKxx
	llnp2t7LNOrtlJsblrR8BZk+8/4HIqc=
Subject: Re: [PATCH for-4.15] vtd: make sure QI/IR are disabled before
 initialisation
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 kevin.tian@intel.com, xen-devel@lists.xenproject.org,
 Ian Jackson <iwj@xenproject.org>
References: <1615186802-5908-1-git-send-email-igor.druzhinin@citrix.com>
 <de357605-ef0c-82ba-0ae2-ef96f1dd23f3@suse.com>
 <ce950c68-1d44-bcbd-b071-131777b87a38@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6cd440c3-414b-dc66-0212-1e727fc7655d@suse.com>
Date: Mon, 8 Mar 2021 16:15:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ce950c68-1d44-bcbd-b071-131777b87a38@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 15:52, Igor Druzhinin wrote:
> On 08/03/2021 08:18, Jan Beulich wrote:
>> On 08.03.2021 08:00, Igor Druzhinin wrote:
>>> BIOS might pass control to Xen leaving QI and/or IR in enabled and/or
>>> partially configured state. In case of x2APIC code path where EIM is
>>> enabled early in boot - those are correctly disabled by Xen before any
>>> attempt to configure. But for xAPIC that step is missing which was
>>> proven to cause QI initialization failures on some ICX based platforms
>>> where QI is left pre-enabled and partially configured by BIOS.
>>
>> And those systems then tell us to avoid use of x2APIC? I would have
>> expected that on modern systems we wouldn't see such quirky firmware
>> behavior anymore. Anyway, half a sentence to this effect might help
>> here, as without such firmware behavior the only way to run into
>> this ought to be use of "no-x2apic" on the command line. Which in
>> turn might require justification (and potentially a fix elsewhere in
>> the code to make use of that option unnecessary).
>>
>>> Unify the behaviour between x2APIC and xAPIC code paths keeping that in
>>> line with what Linux does.
>>>
>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with some editing of the description. If no other need for a v2
>> arises, I suppose whatever you come up with could be folded in
>> while committing.
> 
> How about:
> 
> "... But for xAPIC that step is missing which was proven to cause QI 
> initialization failures on some ICX based platforms where QI is left 
> pre-enabled and partially configured by BIOS. That problem becomes hard 
> to avoid since those platforms are shipped with x2APIC opt out being 
> advertised by default at the same time by firmware.
> ..."

SGTM.

Thanks, Jan

