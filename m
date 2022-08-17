Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC815970B0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 16:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388966.625753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJqg-0004QX-FX; Wed, 17 Aug 2022 14:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388966.625753; Wed, 17 Aug 2022 14:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJqg-0004Ok-CE; Wed, 17 Aug 2022 14:16:46 +0000
Received: by outflank-mailman (input) for mailman id 388966;
 Wed, 17 Aug 2022 14:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xyl4=YV=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oOJqe-0004OX-FG
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 14:16:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36afbb2b-1e37-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 16:16:42 +0200 (CEST)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1660745797745977.3889293143588;
 Wed, 17 Aug 2022 07:16:37 -0700 (PDT)
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
X-Inumbo-ID: 36afbb2b-1e37-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1660745798; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n0xOp81c6xaSsCBtOQ7Nz4uVCrDX8oJQ0nCuE3l2jVej6LhawQMhb8w7ifTlg/IUZfX7FJbqGYtxGoBhmL1f38A5aQpwbNVfdoc0eb9EE9NRmOVWJY9QbcNRWe3JHHtAVe3NNkZDHtRYjZu28F3coVGw74rESoUiONvbzdoTTVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660745798; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UJCzSNRF6cteYvrdQtGXslVJA1S46wayPZVjNW86Cag=; 
	b=SX8KZB8dQw4I2C9J5iCyKFPc6krdV75HJg7agznZG2455lcCVzrtPSeq61N768+oaOi8jKatPWcdPOh2t6wVNS5irJ47sz1XhLhx4l108w0xiQfz3u4bBWfhdqw4vPfgpYvQfByS/t2ogVk16vwAn3sbTfAwmcOYKh/sEHMjrTc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660745798;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UJCzSNRF6cteYvrdQtGXslVJA1S46wayPZVjNW86Cag=;
	b=BEyhqMfcaxLdTqNpzelBRSDIz1m3fILXb39g+SgBNFZL7hXtnpvvEnSlR4AA7CDu
	3SxrsAdugCeUEeaj3Z/KCoA1iHouewfB/VcJsLsBcsWDMlpnNEfk1gf6QjorrqsDRWQ
	EwB3cZrcMV4yiZkjwKBPjp+PBVBeI2Bx/6EoXo9Q=
Message-ID: <c3682bb0-4241-d142-b131-1221d1a62b31@apertussolutions.com>
Date: Wed, 17 Aug 2022 10:15:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v12] xsm: refactor flask sid alloc and domain check
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220809140633.23537-1-dpsmith@apertussolutions.com>
 <CAKf6xpur5sESPxgDEmY=PsnDDmuZ898UbaAECccGuQuyetjHEQ@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <CAKf6xpur5sESPxgDEmY=PsnDDmuZ898UbaAECccGuQuyetjHEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/16/22 13:43, Jason Andryuk wrote:
> Hi,
> 
> I think you should change the title to "xsm/flask: Boot-time labeling
> for multiple domains".  Refactor implies no functional change, and
> this is a functional change.  With this, I think the commit message
> should be re-written to focus on the "why" of the new labeling policy.

I can rename and expand a bit further.

> On Tue, Aug 9, 2022 at 10:06 AM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> The function flask_domain_alloc_security() allocates the security context and
>> assigns an initial SID for the domain under construction. When it came to SID
>> assignment of the initial domain, flask_domain_alloc_security() would assign
>> unlabeled_t. Then in flask_domain_create() it would be switched to dom0_t.
>> This logic worked under the assumption that the first domain constructed would
>> be the hypervisor constructing dom0 and all other domains would be constructed
>> by a toolstack, which would provide a SID. The introduction of dom0less and
>> subsequently hyperlaunch violates this assumption, as non-privileged domain may
>> be constructed before the initial domain or no initial domain may be
>> constructed at all. It is not possible currently for dom0less to express domain
>> labels in the domain configuration, as such the FLASK policy must employ a
>> sensible initial SID assignment that can differentiate between hypervisor and
>> toolstack domain construction.  With the introduction of xenboot_t it is now
>> possible to distinguish when the hypervisor is in the boot state, and thus any
>> domain construction happening at this time is being initiated by the
>> hypervisor.
> 
> The problem this commit is addressing is "flask can only label a
> single dom0_t at boot, and this is incompatible with dom0less and
> hyperlaunch".
> 
> ISTM that dom0less device tree could gain a node for the security
> label, and Hyperlaunch already supports labels.  But a goal of this
> patch is to make it work without changing dom0less?  And it may be
> worth more directly stating that dom0less panics today since the domU
> fails to build with unlabeled_t.
> 
> Also a motivation was to align Flask labels to match the dummy policy
> with dom0/domU, correct?  That would be worth adding.

okay

>> This commit addresses the above situation by using a check to confirm if the
>> hypervisor is under the xenboot_t context in flask_domain_alloc_security().
>> When that is the case, it will inspect the domain's is_privileged field to
>> determine whether an initial label of dom0_t or domU_t should be set for the
>> domain. The logic for flask_domain_create() was changed to allow the incoming
>> SID to override the initial label.
> 
> AFAICT, the labeling policy needs to handle these three cases:
> 1) Traditional domain 0 (x86 or arm)
> Single domain - domid == 0 && privileged

On x86 it cannot be assumed that the domid for the initial domain is 
zero(0). See get_initial_domain_id() for which, afaict, is not a valid 
call under Arm.

> 2) dom0less (arm)
> Possibly a single dom0 - domid == 0 && privileged
> Multiple domUs - domid > 0 && not privileged
> Notably, it takes care not to create a domU with domid 0.

Just to be pedantic, this really should just be labeled as "arm domain 
construction". As I discovered during all of this, Arm is always capable 
of building multiple domains at boot. The dom0less construct is really 
just a mode of the domain builder to never construct/start the initial 
domain (dom0) if the dom0less flag is set, regardless if there is one 
defined in the DTB.

> 3) Hyperlaunch (x86 or arm)
> Potentially anything?  I don't know what you envision for this.

A simplistic way to state it is, remove all assumptions/conventions 
about domain construction by the hypervisor. Instead, require explicit 
declarations about what domains the hypervisor should construct.

> When it was only dom0, it was easy to put a heuristic in flask to
> label the first domain as dom0_t.  With dom0less, the heuristic can be
> expanded to include domid > 0 -> domU_t.  With hyperlaunch, I'm not
> sure.  Is there something it needs that wouldn't be covered?

In the current HL series, there is no binding/enforcement/validation of 
the boot configuration and requirements of the enforcing XSM module. For 
the case when FLASK is the enforcing XSM module, the domain 
configuration may not have provided labels for the domains. In this case 
it would mean either FLASK refuses/fails the domain create check if a 
SID ref is not provided or a sensible policy/heuristic must be codified.

> dom0_t being a singleton emphasized for me that using only
> is_privileged for the check isn't quite right.  Does hyperlaunch need
> domid != 0 && is_privileged to get assigned dom0_t?  That could still
> be done explicitly, but just not implicitly by the above.

I agree it is not quite right, but more so that it is leveraging the 
assumption from the basic policy module (dummy policy) that only the 
initial domain (dom0) will have is_privileged set. As stated above, 
domid !=0 and is_privileged being set already exists for PV shim, not 
something being introduced by HL. HL only expands the possibility for 
the configuration to be built outside PV shim.

With that said, unless I am missing something, the heuristic below will 
enforce the singleton. While it is possible that 
flask_domain_alloc_security() would allocate a security context for more 
than one domain containing the label of dom0_t. The 
flask_domain_create() check will only allow the first domain with this 
label to be created, regardless if the domain create was initiated by 
the hypervisor or by a runtime toolstack.

>> The base policy was adjusted to allow the idle domain under the xenboot_t
>> context the ability to construct domains of both types, dom0_t and domu_t.
> 
> I suppose if someone doesn't want to use domU_t/dom0_t, then they
> could remove the xenboot_t allow rules which would defacto require
> explicit labels.

Correct, this is why I pushed for the rules to be in the policy instead 
of in the code. If someone wants to use HL to do something custom, they 
can define their desired types, including dropping the dom0_t type, in 
policy and explicitly provided labels to domain in the boot configuration.

>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> 
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -182,7 +182,15 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>           dsec->sid = SECINITSID_DOMIO;
>>           break;
>>       default:
>> -        dsec->sid = SECINITSID_UNLABELED;
>> +        if ( domain_sid(current->domain) == SECINITSID_XENBOOT )
>> +        {
>> +            if ( d->is_privileged )
> 
> The policy outlined above would change this line to:
>      if ( d->is_privileged && d->domid == 0 )

As mentioned above, d->domid == 0, is not a valid assumption even before 
the introduction of HL.

>> +                dsec->sid = SECINITSID_DOM0;
>> +            else
>> +                dsec->sid = SECINITSID_DOMU;
>> +        }
>> +        else
>> +            dsec->sid = SECINITSID_UNLABELED;
>>       }
>>
>>       dsec->self_sid = dsec->sid;
>> @@ -550,20 +558,36 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
>>       struct domain_security_struct *dsec = d->ssid;
>>       static int dom0_created = 0;
>>
>> -    if ( is_idle_domain(current->domain) && !dom0_created )
> 
> This old check only applied at boot time to label the first domain as
> dom0_t, but it didn't restrict runtime labeling...
> 
>> +    /*
>> +     * The dom0_t label is expressed as a singleton label in the base policy.
>> +     * This cannot be enforced by the security server, therefore it will be
>> +     * enforced here.
>> +     */
>> +    if ( ssidref == SECINITSID_DOM0 )
>>       {
> 
> ...this new one restricts runtime labeling with dom0_t.  It's an
> unusual case, so making the code change is (probably) fine.   But it
> should at least be mentioned in the commit message.

Correct, this makes a stronger/hard enforcement that only one domain can 
ever be labeled as dom0_t. As mentioned, previously it was only checked 
when the idle domain was doing the construction. Which made it possible 
to construct multiple domains labeled as dom0_t, as long as the policy 
was altered to allow a domain type to construction domains of type 
dom0_t. IMHO, if there is a desire to enable configurations with 
multiple all-privileged domains, then that configuration should define a 
different domain type and use HL to have the initial domain constructed 
with that type. The type dom0_t is special, mostly to align with 
historical expectations/conventions, and should not be repurposed by 
custom FLASK policies.

> However, if the boot time policy adds "domid == 0" to the dom0_t
> assignment, then the dom0_created code can go away.

I disagree because "domid == 0" is not a valid check and IMHO the 
enforcement of dom0_t being a singleton should be as strong as possible.

> Regards,
> Jason

v/r,
dps

