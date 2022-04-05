Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9A4F3D44
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 21:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299248.509787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nboUs-0004Kr-O3; Tue, 05 Apr 2022 19:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299248.509787; Tue, 05 Apr 2022 19:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nboUs-0004Im-Kb; Tue, 05 Apr 2022 19:05:46 +0000
Received: by outflank-mailman (input) for mailman id 299248;
 Tue, 05 Apr 2022 19:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJD=UP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nboUq-0004Ig-13
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 19:05:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 622dda24-b513-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 21:05:41 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1649185534824477.55970434746814;
 Tue, 5 Apr 2022 12:05:34 -0700 (PDT)
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
X-Inumbo-ID: 622dda24-b513-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1649185537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GS7QuAwmBjT/oam7Say+Itw4rL08uaWEi7WJpBdfPsBFF698RsDaLg+YS6pDwQ/LIuz+NL71gxqLdz7y5Hxpz1CKPZErDqjEsJ/PnHo7nVr76RUtLVefYa7W6WgnNWDohit4TWqR4uDaTsz5oQu6KAE9GL8dpP20Vyb/sVB1DjY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1649185537; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=h0Bu3q2il3h4w2l6bVulQEvszTw4APO06U4gQ4mjIYQ=; 
	b=O3RMWfoLQQPB+KxNdbo8Se97SXgHP3H8KkCG0AI+qrYBje9zG58yCVDwN+iifjiRBYHt7xZCbVxL6eRXQXF5NC1D4CZgI54f2xfBpWg4FPHkvEwaxMe5xBN7yIFXma68w6TlZ3xvKZwFbQfa0XeogrjHi+zWIOEM6A0bxy0vWTU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649185537;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=h0Bu3q2il3h4w2l6bVulQEvszTw4APO06U4gQ4mjIYQ=;
	b=curDslOLouPb9RkMICDiZBA8PmKh2RCrY9UypM4F4dlHMMgj0umck+4v3wu02rza
	jFl1IdSXEpatMNvsio32+ubJK8EWmjJAtLOZbUHpU3elwkcOOkCG1ygus0yMFr6a41l
	xTm+nGHeypW09LEfjJqEYEhfNZ4h+qZ7rh28+lRs=
Message-ID: <9ba16d0b-6b31-0ca1-08b2-abe35f608a20@apertussolutions.com>
Date: Tue, 5 Apr 2022 15:05:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Scott Davis <scott.davis@starlab.io>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
 <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
 <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
In-Reply-To: <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/5/22 13:17, Jason Andryuk wrote:
> On Mon, Apr 4, 2022 at 11:34 AM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> On 3/31/22 09:16, Jason Andryuk wrote:
>>> On Wed, Mar 30, 2022 at 3:05 PM Daniel P. Smith
>>> <dpsmith@apertussolutions.com> wrote:
>>>>
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
>>>> +{
>>>> +    if ( is_system_domain(d) )
>>>> +    {
>>>> +        d->is_privileged = true;
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    return -EPERM;
>>>> +}
>>>
>>> These look sufficient for the default policy, but they don't seem
>>> sufficient for Flask.  I think you need to create a new XSM hook.  For
>>> Flask, you would want the demote hook to transition xen_boot_t ->
>>> xen_t.  That would start xen_boot_t with privileges that are dropped
>>> in a one-way transition.  Does that require all policies to then have
>>> xen_boot_t and xen_t?  I guess it does unless the hook code has some
>>> logic to skip the transition.
>>
>> I am still thinking this through but my initial concern for Flask is
>> that I don't think we want dedicated domain transitions directly in
>> code. My current thinking would be to use a Kconfig to use xen_boot_t
>> type as the initial sid for the idle domain which would then require the
>> default policy to include an allowed transition from xen_boot_t to
>> xen_t. Then rely upon a boot domain to issue an xsm_op to do a relabel
>> transition for the idle domain with an assertion that the idle domain is
>> no longer labeled with its initial sid before Xen transitions its state
>> to SYS_STATE_active. The one wrinkle to this is whether I will be able
>> to schedule the boot domain before allowing Xen to transition into
>> SYS_STATE_active.
> 
> That is an interesting approach.  While it would work, I find it
> unusual that a domain would relabel Xen.  I think Xen should be
> responsible for itself and not rely on a domain for this operation.

The boot domain is not a general domain as no domain can/should be
created with its domid or flask label post transition to
SYS_STATE_active. Its purpose was specifically meant to be a natural way
to push out complicated pre-execution domain configuration from having
to be in they hypervisor code. Therefore in a way it can be considered a
user provided de-privileged part of the hypervisor.

With that said, I just realized a flaw in the basis of my position. What
is the difference between codifying a check that the idle domain is not
the boot label versus codifying a transition from the boot label to the
running label? None really, both will require some knowledge that there
is a boot label and some running label. Combine with the fact that the
idle domain really shouldn't have any other label than xen_t. I will
work out how to incorporate the domain transition.

>>> For the default policy, you could start by creating the system domains
>>> as privileged and just have a single hook to drop privs.  Then you
>>> don't have to worry about the "elevate" hook existing.  The patch 2
>>> asserts could instead become the location of xsm_drop_privs calls to
>>> have a clear demarcation point.  That expands the window with
>>> privileges though.  It's a little simpler, but maybe you don't want
>>> that.  However, it seems like you can only depriv once for the Flask
>>> case since you want it to be one-way.
>>
>> This does simplify the solution and since today we cannot differentiate
>> between hypervisor setup and hypervisor initiated domain construction
>> contexts, it does not run counter to what I have proposed. As for flask,
>> again I do not believe codifying a domain transition bound to a new XSM
>> op is the appropriate approach.
> 
> This hard coded domain transition does feel a little weird.  But it
> seems like a natural consequence of trying to use Flask to
> deprivilege.  I guess the transition could be behind a
> dom0less/hyperlaunch Kconfig option.  I just don't see a way around it
> in some fashion with Flask enforcing.
> 
> Another idea: Flask could start in permissive and only transition to
> enforcing at the deprivilege point.  Kinda gross, but it works without
> needing a transition.
> 
> To reiterate, XSM isn't really appropriate to enforce anything
> internal to Xen.  We are working around the need to go through hook
> points during correct operation.  Code exec in Xen means all bets are
> off.  Memory writes to Xen data mean the XSM checks can be disabled
> (flip Flask to permissive) or bypassed (set d->is_privileged or change
> d->ssid).  We shouldn't lose sight of this when we talk about
> deprivileging the idle domain.

I would far prefer a transition than trying to reason about whether
flask should be in permissive or enforcing based on this state change in
combination of command line setting.

v/r
dps

