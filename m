Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C34F192E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 18:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298437.508411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbPGF-0006i5-4n; Mon, 04 Apr 2022 16:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298437.508411; Mon, 04 Apr 2022 16:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbPGF-0006fz-1j; Mon, 04 Apr 2022 16:08:59 +0000
Received: by outflank-mailman (input) for mailman id 298437;
 Mon, 04 Apr 2022 16:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIUK=UO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nbPGD-0006ft-PW
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 16:08:57 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 860d1298-b431-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 18:08:55 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16490885294596.815381100868194;
 Mon, 4 Apr 2022 09:08:49 -0700 (PDT)
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
X-Inumbo-ID: 860d1298-b431-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1649088530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IqltzyDTMoMCJck8JCdciMNuUM4dWgxr3rD6CjjkbhSv5CLYSj9wjys86bBTfFEYJ/G7O9IrKUe6hzyfoLOk2wg7NQGZSj4VfqW3F6o3hjQWIUgfU8iM31bCRhcTi4UGlqhhC6zv9anh4AIKx2hvZdqjMJdVauJTH3kPkXAdCXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1649088530; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=wEGmTbZbTeSywAGWzSGIGmVktXD6+SpKk0rLTi/T1DA=; 
	b=bbBb5ckY2JzxSlCpd/8c25Fa+/Dz2GHFEqmm5Tnx09tdrDdHt+fb7xWJPCE+CqXxpAQ3v5AN3GC6dV4NBP5uvtYKXuxZyT9TsU1b0p/+lwxTDXAoVA/mqWX4sgE+1ONx2MB1waJZMudJK6kMA4zqwX8rysgvfAjYtTy+wstP10k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649088530;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wEGmTbZbTeSywAGWzSGIGmVktXD6+SpKk0rLTi/T1DA=;
	b=twBZYUAuqM2hrzuiDXeAPNqVBu/jDrIX1qH2eX0E4BDnRWrTKAIBnIvBzBTcFHCD
	XlDjX0DBH92JcfqD/te8BMQSeDC0Ft5ixKCN3v3z532v/FeiL302UqFK/A42jjC8OiX
	O0TDA5gfyt/oq+CVK2vhVERVJYP9ILRvZ8lCsTPU=
Message-ID: <cd178295-4c8b-6710-3050-011fcee378b1@apertussolutions.com>
Date: Mon, 4 Apr 2022 12:08:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, scott.davis@starlab.io,
 jandryuk@gmail.com, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
 <25c10763-36fa-34d4-05b6-655c08fdfee7@apertussolutions.com>
 <YksK9hIbJbOXkIYd@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
In-Reply-To: <YksK9hIbJbOXkIYd@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/4/22 11:12, Roger Pau Monné wrote:
> On Mon, Apr 04, 2022 at 10:21:18AM -0400, Daniel P. Smith wrote:
>> On 3/31/22 08:36, Roger Pau Monné wrote:
>>> On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
>>>> There are now instances where internal hypervisor logic needs to make resource
>>>> allocation calls that are protected by XSM checks. The internal hypervisor logic
>>>> is represented a number of system domains which by designed are represented by
>>>> non-privileged struct domain instances. To enable these logic blocks to
>>>> function correctly but in a controlled manner, this commit introduces a pair
>>>> of privilege escalation and demotion functions that will make a system domain
>>>> privileged and then remove that privilege.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>>  xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
>>>
>>> I'm not sure this needs to be in xsm code, AFAICT it could live in a
>>> more generic file.
>>
>> From my perspective this is access control logic, thus why I advocate
>> for it to be under XSM. A personal goal is to try to get all security,
>> i.e. access control, centralized to the extent that it doing so does not
>> make the code base unnecessarily complicated.
> 
> Maybe others have a different opinion, but IMO setting is_privileged
> is not XSM specific. It happens to solve an XSM issue, but that's no
> reason to place it in the xsm code base.

I think this deserves a separate more dedicated thread as I would take
the position that Xen privilege model is at best fractured because
is_control_domain() (and underlying is_privileged),
is_hardware_domain,() and is_xenstore_domain() are used independent of
XSM. Perhaps the discussion can be had when I get back to the XSM Roles
patches to enable disaggregating Xen with hyperlaunch (or at a Xen
Summit design session).

>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>>>> index e22d6160b5..157e57151e 100644
>>>> --- a/xen/include/xsm/xsm.h
>>>> +++ b/xen/include/xsm/xsm.h
>>>> @@ -189,6 +189,28 @@ struct xsm_operations {
>>>>  #endif
>>>>  };
>>>>  
>>>> +static always_inline int xsm_elevate_priv(struct domain *d)
>>>
>>> I don't think it needs to be always_inline, using just inline would be
>>> fine IMO.
>>>
>>> Also this needs to be __init.
>>
>> AIUI always_inline is likely the best way to preserve the speculation
>> safety brought in by the call to is_system_domain().
> 
> There's nothing related to speculation safety in is_system_domain()
> AFAICT. It's just a plain check against d->domain_id. It's my
> understanding there's no need for any speculation barrier there
> because d->domain_id is not an external input.

Hmmm, this actually raises a good question. Why is is_control_domain(),
is_hardware_domain, and others all have evaluate_nospec() wrapping the
check of a struct domain element while is_system_domain() does not?

> In any case this function should be __init only, at which point there
> are no untrusted inputs to Xen.

I thought it was agreed that __init on inline functions in headers had
no meaning?

