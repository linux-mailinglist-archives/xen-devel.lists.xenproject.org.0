Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28309567656
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 20:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361506.591068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8nBy-00034q-Md; Tue, 05 Jul 2022 18:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361506.591068; Tue, 05 Jul 2022 18:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8nBy-00032K-JD; Tue, 05 Jul 2022 18:22:34 +0000
Received: by outflank-mailman (input) for mailman id 361506;
 Tue, 05 Jul 2022 18:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJkg=XK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o8nBw-000329-Mu
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 18:22:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d48a75e-fc8f-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 20:22:30 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657045341126785.541076843804;
 Tue, 5 Jul 2022 11:22:21 -0700 (PDT)
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
X-Inumbo-ID: 6d48a75e-fc8f-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1657045347; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jwte+WeMH47M0VffBiB+WjagJkAx1HlOcCG71PBrM8WHM/UDAV1QFbPRCxMZGDStPBu920NSLssLeeJ89VbcMXO9Uxnfwy8ZqnfysyqXiVT7A0navHVpiB32yVYkNkfkv/5SaKfx4DYJYF/BMbqHEtVVL2WK00xcf4dQtaGgcWI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657045347; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Omgu0DEoeFPmQOIcUYF8shs0R/nLUy9MKTdQBW8vjJ4=; 
	b=J1VJpqfOLEYALrcC1gBiRz+fGlQ3Uv9ybFVUsGeTECBCzehi3f5w5sF+PCJF+eeKTJ42OxMwtWH9tHlI8Lcz9znAecVNIhIcp0InvxqiwIzOYLzCOA0Y7KJH5M6sS5l8AE27TqQ7QIvs2qxsx1RLtrU1oLpGJLAil66iiwkRXno=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657045347;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Omgu0DEoeFPmQOIcUYF8shs0R/nLUy9MKTdQBW8vjJ4=;
	b=toZzoQ1QARc31aCI7s3NDKFmxW7FgBgiG90tRuVGzS2pLMV8Hg8J5lgkHIoArgUI
	J3+deDaP2gCJrEIPuovBuWwU/fG7s/1JbFLgSyxkK6KsF3h15MEIfOvktL/OPgJi18v
	eKMXDQz8mofEwogdAOX4FQv4e25EN3R1XoBK8++k=
Message-ID: <92644952-48be-d25b-4471-121cfa14a5c0@apertussolutions.com>
Date: Tue, 5 Jul 2022 13:35:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Scott Davis <scott.davis@starlab.io>, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
 <20220630022110.31555-4-dpsmith@apertussolutions.com>
 <CAKf6xpsx2CkCuuHvJ5Zc+fC=4y9ha4Px0DYdUAY3oxe0_OhpRg@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v9 3/3] xsm: refactor flask sid alloc and domain check
In-Reply-To: <CAKf6xpsx2CkCuuHvJ5Zc+fC=4y9ha4Px0DYdUAY3oxe0_OhpRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/5/22 09:03, Jason Andryuk wrote:
> On Wed, Jun 29, 2022 at 10:22 PM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> The function flask_domain_alloc_security() is where a default sid should be
>> assigned to a domain under construction. For reasons unknown, the initial
>> domain would be assigned unlabeled_t and then fixed up under
>> flask_domain_create().  With the introduction of xenboot_t it is now possible
>> to distinguish when the hypervisor is in the boot state.
> 
> There is no "default label" which is why unlabeled_t was used.
> flask_domain_create() does permission checks before setting the label
> from the config.

The call to flask_domain_alloc_security() is in a shared code path for
both the hypervisor and toolstack domain creation. As such, there is no
label provided since it is not desirable to codify the domain label in
the general hypervisor code for when calling that shared path by the
hypervisor during setup. Since the function is responsible for
allocating the struct domain_security_struct{}, it is unwise to leave
the value uninitialized, zero/0, as that in a non-existent sid.
Therefore it implements a rudimentary assignment policy where if the
current domain is the idle domain, it assumes it is constructing one of
the system domains otherwise by default it assigns unlabeled_t.
Additionally, if a sid of 0 is provided by the toolstack, either by not
setting the sid or incorrectly setting the sid to 0, the result will be
that the security server will assign the label unlabeled_t to the
domain. This is what is meant by referring to it as the default label.

It should be noted that under the default policy, unlabeled_t is not a
valid type for a domain to run under. The result will be a failure as
there are no rules to allow the construction of domains with this type.

> flask_domain_alloc_security()
> - mallocs domain_security_struct
> - sets sid for system domains xen_t, domxen_t, domio_t
> - is called for all domains.

and you missed,
 - sets sid to unlabeled_t for all other domains.

The missed action along with the second action is what goes to the point
I was making in the commit message. This is because prior to the
introduction of xenboot_t, the only means to distinguish between
boot/setup time and runtime is if the domain id is a system domain id.
The basis for that limited distinction comes from the assumption that
domain_create() will block the use of a domain id from the reserved
range if the current domain is not the idle domain. For which, it should
be noted that there may be some unintended consequences. Whereas, with
the introduction of the xenboot_t label, there is a slightly stronger
binding to what state the construction of the domain is occurring.

> flask_domain_create()
> - special cases labeling dom0_t so it can only be done once.
> - otherwise, ensures current has permission to domain_create.
> - sets sid for both cases.
> - has the config->ssidref passed in.
> - is only called for non-system, non-idle domains.

I would clarify that last statement, 'is only called for domains which
require construction and assignment of resources', where assignment of
resources refers to resources that will be labeled based on domin's sid,
eg. domU_t_channel.

>> This commit looks to correct this by using a check to see if the hypervisor is
>> under the xenboot_t context in flask_domain_alloc_security(). If it is, then it
>> will inspect the domain's is_privileged field, and select the appropriate
>> default label, dom0_t or domU_t, for the domain. The logic for
>> flask_domain_create() was changed to allow the incoming sid to override the
>> default label.
>>
>> The base policy was adjusted to allow the idle domain under the xenboot_t
>> context to be able to construct domains of both types, dom0 and domU.
> 
> Your patch special cases flask_domain_alloc_security() to assign
> dom0/domU.  You already have a config and therefore config->ssidref,
> so that shouldn't be necessary since flask_domain_create() can use
> that ssidref.

As I stated above, flask_domain_alloc_security() contains an existing
policy for setting an initial value for the struct
security_domain_struct{} it is allocating based on assumptions that are
believed to be true. With the introduction of the xenboot_t transition,
a more solid set of assumptions can be made, which allows for a more
refined assignment policy.

Second, you are assuming there is a config that has a valid ssidref set.
Currently, dom0less does not support passing a sid in their
configuration. As I have reasoned the code and explained above, I do not
see how dom0less could construct a validly labeled domU, or more than
one domU with FLASK in enforcing mode. Based on my review, three
scenarios would play out for dom0less using FLASK,

1. The first domain to be constructed was a dom0.

The first domain would be created, labeled as dom0_t, the flag
dom0_created would be set to one, and then constructed. All subsequent
domains would fail creation because,
 - they would be labeled as unlabeled_t by flask_domain_alloc_security()
 - the parameter ssidref to flask_domain_create() would be 0
 - the !dom0_created check would fail
 - the call to avc_current_has_perm() would fail

With avc_current_has_perm() failing because ssidref's value of 0 will be
converted to unlabeled_t and the default/reference policy will deny
xenboot_t domain create of unlabeled_t.

The system will panic when the first domain creation failure occurrs.

2. The first domain is a domU and remaining may be either dom0 or domU.

The first domain would be created, incorrectly labeled as dom0_t, the
flag dom0_created would be set to one, and then constructed. All
subsequent domains will fail as they did in case 1, and again the system
will panic on the first domain creation failure.

3. A system with only a single domU.

The domain would be created, incorrectly labeled as dom0_t, the flag
dom0_created would be set to one, and then constructed. The system will
then finish and transition to running with the single domain, except
that domain will be fully privileged and not a domU as intended or expected.

> I don't see a precise reason for why this change is needed in the
> commit message.  I know you are working on hyperlaunch, but I'm
> guessing at the rationale for this change.  And hyperlaunch should be
> passing in a config with ssidref set instead of relying on the flask
> code to auto assign, so I'm not sure of why this change would be
> needed for hyperlaunch.

Apologies, I was attempting to be concise and hit the main points versus
a long diatribe.

While FLASK is not security supported, we should still ensure that
dom0less works completely as expected. Additionaly it should support
traditional intial domain, dom0less, and the upcoming hyperlaunch
without having to be special cased for each configuration. While
hyperlaunch will provide the ability to specify a sid in its
configuration, the initial domain and dom0less do not. Changing the XSM
interface to suit the single instance of the former versus the two
instances of the latter would seem slightly biased.

To summarize in another way,

FLASK has an internal sid assignement policy for when the hypervisor is
contstructing domains during boot. This is so the main hypervisor code
does not have to be made FLASK aware and potentially create a layering
violation. The current sid assignment policy is split between allocation
of the domain's security structure and the domain creation policy check.
The hypervisor has evolved since this policy was incorporated, seeing
the introduction of dom0less and soon hyperlaunch. This latest change
introduces a new security context for the hypervisor during setup along
with a domain transition for when the hypervisor moves to the running
state. With this new distinction is now possible to construct a more
informed initial sid assignment policy for domains conrstructed by the
hypervisor. The new assignment policy exapnds the existing policy to say
that if domain is not a system domain and the hypervisor is currently in
the boot/setup state, inspect the domain config to see if it is a
privileged domain, and set the label either dom0_t or domU_t accordingly.

The new initial sid assignment policy results in all of its logic being
centralized under the function flask_domain_alloc_security(). This
allows for the logic of flask_domain_create() to morph, were by the
parameter ssidref may now be treated simply as an override of the
initial sid assignment that a toolstack or a hypervisor domain builder,
such as hyperlaunch, may use to set the appropriate label.


> Is the issue with only having a single creation of dom0_t?  Can you
> change create_dom()'s dom0_cfg to specify the ssidref when creating
> dom0.  I guess that would need a new xsm_dom0_ssidref hook (or
> something) to hide away the flask code.  But that way there is less
> special casing in the code.  flask_domain_alloc_security() could be
> left unchanged, and flask_domain_create could() be streamlined to just
> check the passed in ssidref.  How does that sound?

As I noted above, coding in a flask label into main hypervisor code
would be a layering violation as it would assume the only XSM that would
ever use the struct domain_security_struct{}. This would defeat the
purpose of the introduction of struct domain_security_struct{} as it
previouly was assumed to be a flask security label.

Also previously mentioned, it goes beyond just dom0 config. Currently
dom0less does not have a way to specify the sid in a domU domain config.
This would mean another place with a flask label, domU_t, would have to
be codified into main hypervisor code.

IMHO, with a possible minor adjustment (see  below), the approach here
is the correct one. The two functions have distinct roles,
flask_domain_alloc_security() is for allocating the structure and
ensuring it is properly initialized. While flask_domain_create() is
where the check occurs if a domain of either the initially assigned type
or of the requested type, ssidref parameter, are allowed to be
constructed by the current domain. That is what is acheived here without
having to introduce a layering violation.

>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>  tools/flask/policy/modules/dom0.te |  3 +++
>>  tools/flask/policy/modules/domU.te |  3 +++
>>  xen/xsm/flask/hooks.c              | 34 ++++++++++++++++++------------
>>  3 files changed, 26 insertions(+), 14 deletions(-)
>>
>> diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
>> index 0a63ce15b6..2022bb9636 100644
>> --- a/tools/flask/policy/modules/dom0.te
>> +++ b/tools/flask/policy/modules/dom0.te
>> @@ -75,3 +75,6 @@ admin_device(dom0_t, ioport_t)
>>  admin_device(dom0_t, iomem_t)
>>
>>  domain_comms(dom0_t, dom0_t)
>> +
>> +# Allow they hypervisor to build domains of type dom0_t
>> +xen_build_domain(dom0_t)
>> diff --git a/tools/flask/policy/modules/domU.te b/tools/flask/policy/modules/domU.te
>> index b77df29d56..73fc90c3c6 100644
>> --- a/tools/flask/policy/modules/domU.te
>> +++ b/tools/flask/policy/modules/domU.te
>> @@ -13,6 +13,9 @@ domain_comms(domU_t, domU_t)
>>  migrate_domain_out(dom0_t, domU_t)
>>  domain_self_comms(domU_t)
>>
>> +# Allow they hypervisor to build domains of type domU_t
>> +xen_build_domain(domU_t)
>> +
>>  # Device model for domU_t.  You can define distinct types for device models for
>>  # domains of other types, or add more make_device_model lines for this type.
>>  declare_domain(dm_dom_t)
>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index 8c9cd0f297..caa0ae7d4c 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -182,7 +182,15 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>          dsec->sid = SECINITSID_DOMIO;
>>          break;
>>      default:
>> -        dsec->sid = SECINITSID_UNLABELED;
>> +        if ( domain_sid(current->domain) == SECINITSID_XENBOOT )

After some thinking while responding to the review, this check should
move to the top and be negated. When requesting an allocation, if that
request was not by the idle domain during startup, then it should
immediately set the sid to SECINITSID_UNLABELED and return immediately.
Making it past that check will mean that the request is from the idle
domain during setup and should apply the initial sid policy.

>> +        {
>> +            if ( d->is_privileged )
>> +                dsec->sid = SECINITSID_DOM0;
>> +            else
>> +                dsec->sid = SECINITSID_DOMU;
>> +        }
>> +        else
>> +            dsec->sid = SECINITSID_UNLABELED;
>>      }
>>
>>      dsec->self_sid = dsec->sid;
>> @@ -548,23 +556,21 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
>>  {
>>      int rc;
>>      struct domain_security_struct *dsec = d->ssid;
>> -    static int dom0_created = 0;
>>
>> -    if ( is_idle_domain(current->domain) && !dom0_created )
>> -    {
>> -        dsec->sid = SECINITSID_DOM0;
>> -        dom0_created = 1;
>> -    }
>> -    else
>> +    /*
>> +     * If domain has not already been labeled or a valid new label is provided,
>> +     * then use the provided label, otherwise use the existing label.
>> +     */
>> +    if ( dsec->sid == SECINITSID_UNLABELED || ssidref > 0 )
>>      {
>> -        rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
>> -                          DOMAIN__CREATE, NULL);
>> -        if ( rc )
>> -            return rc;
> 
> The old code returned here before...
> 
>> -
>>          dsec->sid = ssidref;
> 
> ... setting the sid.  That is more robust since if the function fails,
> the sid is not changed.  It's not a problem today as the
> xsm_domain_create() return value is checked, but it is more robust to
> restore that property.

You are right, my intent/assumption was to rely on the code calling an
access check to correctly handle a failure response. I should reverse
the logic and use ssidref as the temporary holder of the value to check,
and only place that value into the struct on a successful check.

> Regards,
> Jason

Thank you for looking at this.

v/r,
dps

