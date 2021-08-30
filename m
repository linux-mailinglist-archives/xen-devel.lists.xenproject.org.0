Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D23FB5BA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 14:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175014.318943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKg8n-0001P3-Pj; Mon, 30 Aug 2021 12:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175014.318943; Mon, 30 Aug 2021 12:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKg8n-0001Lp-MY; Mon, 30 Aug 2021 12:11:53 +0000
Received: by outflank-mailman (input) for mailman id 175014;
 Mon, 30 Aug 2021 12:11:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krMZ=NV=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mKg8l-0001Lj-Nf
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 12:11:51 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74022d02-098b-11ec-ac84-12813bfff9fa;
 Mon, 30 Aug 2021 12:11:49 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630325501254689.7797100718451;
 Mon, 30 Aug 2021 05:11:41 -0700 (PDT)
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
X-Inumbo-ID: 74022d02-098b-11ec-ac84-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1630325504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ViDevVA+oIgN0e3sXZDWULScVQ1ucgXo2H5JhXBKmaFHRmueiwe2jqT8//vgI/IqFgqyzf9ThTWMdhMqP+q9BCDcmjN8WR4R8cVcqHj2Ru1PsOhJZ7/sy/0iKB7krEhXyYy9nbJLeE5xJriPdKjspTzDjn3S//hCJ+/1QbaAPTI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630325504; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=n26oXszCbgac13r2WTJKkRpMPzwVO0CtdexJMQLznJc=; 
	b=dSESxAQc5tRkCKQQ05kuTAZpHU7HxfBmQIHYDivUWB2Eki6v7cv0W00fc43faIxFcr4i9RVl+ngPSMeDNrPXqRi+rf11f3hQMigxuV5wkW+8f8GVTRpiYZxm52WMmTueFaaQr/Kj6Xjwd4TaE0LfIBFX61s56G40CDpW4kUz4K8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630325504;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=n26oXszCbgac13r2WTJKkRpMPzwVO0CtdexJMQLznJc=;
	b=Y8y/dXRB6ilLoiC+PtXPhwVWjAqAolUEYNlaxyns0Eo8hyAFc/Kjph73Xrb5SkaF
	v9kXsj2bKYsu6hbdPKg88xBjrNQlo1GkXLEUmAXjEKHaHY3mTsCdspk8YX1RkKXmrq/
	L+IzGVrqvk026RQH10UUeVXd/IR2x4t2rfQHOShI=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-8-dpsmith@apertussolutions.com>
 <bf13f9a0-dff6-033e-3632-8fc4f0533a20@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 7/7] xsm: removing facade that XSM can be
 enabled/disabled
Message-ID: <94d6914c-57d4-e63b-1abe-88ef14186344@apertussolutions.com>
Date: Mon, 30 Aug 2021 08:11:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bf13f9a0-dff6-033e-3632-8fc4f0533a20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/26/21 5:37 AM, Jan Beulich wrote:
> On 05.08.2021 16:06, Daniel P. Smith wrote:
>> The XSM facilities are always in use by Xen with the facade of being able to
>> turn XSM on and off. This option is in fact about allowing the selection of
>> which policies are available and which are used at runtime.  To provide this
>> facade a complicated serious of #ifdef's are used to selective include
> 
> Nit: It took me a moment to realize that the sentence reads oddly because
> you likely mean "series", not "serious".
> 
>> different headers or portions of headers. This series of #ifdef gyrations
>> switches between two different versions of the XSM hook interfaces and their
>> respective backing implementation.  All of this is done to provide a minimal
>> size/performance optimization for when alternative policies are disabled.
>>
>> To unwind the #ifdef gyrations a series of changes were necessary,
>>     * replace CONFIG_XSM with XSM_CONFIGURABLE to allow visibility of
>>       selecting alternate XSM policy modules to those that require it
>>     * adjusted CONFIG_XSM_SILO, CONFIG_XSM_FLASK, and the default module
>>       selection to sensible defaults
>>     * collapsed the "dummy/defualt" XSM interface and implementation with the
>>       "multiple policy" interface to provide a single inlined implementation
>>       that attempts to use a registered hook and falls back to the check from
>>       the dummy implementation
>>     * the collapse to a single interface broke code relying on the alternate
>>       interface, specifically SILO, this was reworked to remove the
>>       indirection/abstraction making SILO explicit in its access control
>>       decisions
>>     * with the change of the XSM hooks to fall back to enforcing the dummy
>>       policy, it is no longer necessary to fill NULL entries in the struct
>>       xsm_ops returned by an XSM module's init
> 
> It would be nice if some of this could be split. Is this really close to
> impossible?

I am looking into that now, especially after my points below.

>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -200,23 +200,15 @@ config XENOPROF
>>  
>>  	  If unsure, say Y.
>>  
>> -config XSM
>> -	bool "Xen Security Modules support"
>> -	default ARM
>> -	---help---
>> -	  Enables the security framework known as Xen Security Modules which
>> -	  allows administrators fine-grained control over a Xen domain and
>> -	  its capabilities by defining permissible interactions between domains,
>> -	  the hypervisor itself, and related resources such as memory and
>> -	  devices.
>> -
>> -	  If unsure, say N.
>> +config XSM_CONFIGURABLE
>> +    bool "Enable Configuring Xen Security Modules"
> 
> Is there a reason to change not only the prompt, but also the name of
> the Kconfig setting? This alone is the reason for some otherwise
> unnecessary code churn.

Yes, because this idea of "turning off" XSM needs to end externally and
internally. The XSM framework is always being used, it's just that it is
possible to build a configuration with support only for the
default/dummy policy, regardless of how the functions implementing the
default/dummy policy are being invoked.

> Also please correct indentation here.

Ack.

>>  config XSM_FLASK
>> -	def_bool y
>> -	prompt "FLux Advanced Security Kernel support"
>> -	depends on XSM
>> -	---help---
>> +	bool "FLux Advanced Security Kernel support"
>> +	default n
> 
> I don't understand this change in default (and as an aside, a default
> of "n" doesn't need spelling out): In the description you say "adjusted
> CONFIG_XSM_SILO, CONFIG_XSM_FLASK, and the default module selection to
> sensible defaults". If that's to describe this change, then I'm afraid
> I don't see why defaulting to "n" is more sensible once the person
> configuring Xen has chosen the configure XSM's (or XSM_CONFIGURABLE's)
> sub-options. If that's unrelated to the change here, then I'm afraid
> I'm missing justification altogether. (Same for SILO then.)

When an individual selects to be able to be to configure/select
alternative policy modules, they should be the ones to decide which
one(s) should be enabled and not have presumptuous selections provided
to them. IOW, the sensible default is to have no modules selected and
allow the user to enable the one(s) they want.

>> +	depends on XSM_CONFIGURABLE
>> +	select XSM_EVTCHN_LABELING
> 
> Neither this nor any prior patch introduces an option of this name,
> and there's also none in the present tree. All afaics; I may have
> overlooked something or typo-ed a "grep" command.

Ack, missed this in the previous patch. will clean it up there.

>> @@ -265,14 +258,14 @@ config XSM_SILO
>>  	  If unsure, say Y.
>>  
>>  choice
>> -	prompt "Default XSM implementation"
>> -	depends on XSM
>> +	prompt "Default XSM module"
>>  	default XSM_SILO_DEFAULT if XSM_SILO && ARM
>>  	default XSM_FLASK_DEFAULT if XSM_FLASK
>>  	default XSM_SILO_DEFAULT if XSM_SILO
>>  	default XSM_DUMMY_DEFAULT
>> +	depends on XSM_CONFIGURABLE
> 
> With the larger set of "default" lines I'd like to suggest to keep

Ack.

>> @@ -282,7 +275,7 @@ endchoice
>>  config LATE_HWDOM
>>  	bool "Dedicated hardware domain"
>>  	default n
>> -	depends on XSM && X86
>> +	depends on XSM_FLASK && X86
> 
> This change is not mentioned or justified in the description. In fact
> I think it is unrelated to the change here and hence would want breaking
> out.

Actually, if you read the help just below it specifically says to use
this feature requires having an XSM policy (legacy wording for XSM Flask
policy) to be able to do the proper fine grained delegation of the
permissions/accesses necessary for a hardware domain to work. This
should have been made XSM_FLASK when that KConfig option was added.
Dropping the XSM KConfig option just exposed this oversight. Ack that I
should have mentioned this in the commit message.

>>  	---help---
> 
> As you're changing these elsewhere, any chance of you also changing
> this one to just "help"?

Ack.

>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -19,545 +19,1023 @@
>>  #include <xen/sched.h>
>>  #include <xen/multiboot.h>
>>  #include <xsm/xsm-core.h>
>> -
>> -#ifdef CONFIG_XSM
>> +#include <xsm/dummy.h>
>> +#include <public/version.h>
>>  
>>  extern struct xsm_ops xsm_ops;
>>  
>> -static inline void xsm_security_domaininfo (struct domain *d,
>> -                                        struct xen_domctl_getdomaininfo *info)
>> +static inline void xsm_security_domaininfo(
>> +    struct domain *d,
>> +    struct xen_domctl_getdomaininfo *info)
>>  {
>> -    alternative_vcall(xsm_ops.security_domaininfo, d, info);
>> +    if ( xsm_ops.security_domaininfo )
>> +        alternative_vcall(xsm_ops.security_domaininfo, d, info);
> 
> Here and everywhere else, when !XSM_CONFIGURABLE you now needlessly
> force NULL checks to occur which are never going to be true. There's
> then also the dead indirect call and the associated patching data. I
> think this wants hiding in another pair of wrappers, which simply
> expand to nothing when !XSM_CONFIGURABLE - perhaps xsm_vcall() and
> xsm_call().


This has now come back full circle to the attempts made in v1 at
addressing the RFC comments collected at the developer's summit. The
calls xsm_vcall and xsm_call will not be simple since the different xsm
hooks take a different number of arguments. Therefore these calls will
have to become a series of macros to handle the varying number of
arguments, similar to alternative_call and elsewhere but instead of
being general purpose for use throughout the hypervisor they will create
a complication in the code that is dedicated to a single file under XSM.
Outside of a demonstrable significant performance impact that can be
measured, the goal for security relevant code should be simplicity and
ability to reason about correctness. Therefore without a demonstration
that there is an actual performance impact simplicity should be the goal
here, especially considering this effort has unmasked potential bugs
noted below that were masked by this kind of complication.

With that I would like to withdraw this patch and spin a v4 of this
patch set with that revives the dropping of the inlines done similar to
v1/v2. As requested above, I will look to see if any of the changes that
still applies could be split into dedicated commits.

<snip>

>> -static inline int xsm_set_target (xsm_default_t def, struct domain *d, struct domain *e)
>> +static inline int xsm_set_target(xsm_default_t action, struct domain *d,
>> +                                 struct domain *e)
>>  {
>> -    return alternative_call(xsm_ops.set_target, d, e);
>> +    if ( xsm_ops.set_target )
>> +        return alternative_call(xsm_ops.set_target, d, e);
>> +
>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>> +    return xsm_default_action(action, current->domain, NULL);
>>  }
> 
> While benign because xsm_default_action() does nothing for XSM_HOOK, I
> think there's an inconsistency here which rather wants correcting (in
> a prereq patch): The default hook should have been passed consistent
> arguments, no matter whether used because of !XSM or because of the
> module in use left the hook unset.
> 
> Of course such anomalies are much easier to notice (outside of review
> of patches introducing such) with you now placing both invocations
> next to each other.

This series assumes the logic is correct and is only focused on trying
to make XSM more maintainable. I would be glad to consider looking at
what the right security decisions should be in a subsequent patch set
but will be consider out of scope for this patch set.

>> -static inline int xsm_evtchn_interdomain (xsm_default_t def, struct domain *d1,
>> -                struct evtchn *chan1, struct domain *d2, struct evtchn *chan2)
>> +static inline int xsm_evtchn_interdomain(xsm_default_t action,
>> +                                         struct domain *d1,
>> +                                         struct evtchn *chan1,
>> +                                         struct domain *d2,
>> +                                         struct evtchn *chan2)
>>  {
>> -    return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2, chan2);
>> +    if ( xsm_ops.evtchn_interdomain )
>> +        return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2,
>> +                                chan2);
>> +
>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>> +    return xsm_default_action(action, d1, d2);
>>  }
> 
> There's another anomaly here: The first argument to xsm_default_action()
> typically is current->domain in similar functions. Here d1 gets passed in
> despite always being current->domain. I think the unnecessary parameter
> wants dropping (again in a prereq patch)) from the wrapper and hook, to
> avoid giving the wrong impression of both domains potentially being remote
> ones.

out of scope

>> -static inline int xsm_evtchn_send (xsm_default_t def, struct domain *d, struct evtchn *chn)
>> +static inline int xsm_evtchn_send(xsm_default_t action, struct domain *d,
>> +                                  struct evtchn *chn)
>>  {
>> -    return alternative_call(xsm_ops.evtchn_send, d, chn);
>> +    if ( xsm_ops.evtchn_send )
>> +        return alternative_call(xsm_ops.evtchn_send, d, chn);
>> +
>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>> +    return xsm_default_action(action, d, NULL);
> 
> This again looks wrong (and again is benign only because XSM_HOOK means
> xsm_default_action() ignores the other function parameters), wanting to
> follow the usual
> 
>     return xsm_default_action(action, current->domain, d);
> 
> pattern instead.

out of scope

>> -static inline int xsm_evtchn_reset (xsm_default_t def, struct domain *d1, struct domain *d2)
>> +static inline int xsm_evtchn_reset(xsm_default_t action, struct domain *d1,
>> +                                   struct domain *d2)
>>  {
>> -    return alternative_call(xsm_ops.evtchn_reset, d1, d2);
>> +    if ( xsm_ops.evtchn_reset )
>> +        return alternative_call(xsm_ops.evtchn_reset, d1, d2);
>> +
>> +    XSM_ASSERT_ACTION(XSM_TARGET);
>> +    return xsm_default_action(action, d1, d2);
> 
> See xsm_evtchn_interdomain() above.

out of scope

>> -static inline int xsm_grant_mapref (xsm_default_t def, struct domain *d1, struct domain *d2,
>> -                                                                uint32_t flags)
>> +static inline int xsm_grant_mapref(xsm_default_t action, struct domain *d1,
>> +                                   struct domain *d2, uint32_t flags)
>>  {
>> -    return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
>> +    if ( xsm_ops.grant_mapref )
>> +        return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
>> +
>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>> +    return xsm_default_action(action, d1, d2);
> 
> Again (more similar grant ones follow).

out of scope

>> -static inline int xsm_memory_adjust_reservation (xsm_default_t def, struct domain *d1, struct
>> -                                                                    domain *d2)
>> +static inline int xsm_memory_adjust_reservation(xsm_default_t action,
>> +                                                struct domain *d1,
>> +                                                struct domain *d2)
>>  {
>> -    return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
>> +    if ( xsm_ops.memory_adjust_reservation )
>> +        return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
>> +
>> +    XSM_ASSERT_ACTION(XSM_TARGET);
>> +    return xsm_default_action(action, d1, d2);
> 
> Again (more similar memory ones follow).

out of scope

>> -static inline int xsm_memory_pin_page(xsm_default_t def, struct domain *d1, struct domain *d2,
>> -                                      struct page_info *page)
>> +static inline int xsm_memory_pin_page(xsm_default_t action, struct domain *d1,
>> +                                      struct domain *d2, struct page_info *page)
>>  {
>> -    return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
>> +    if ( xsm_ops.memory_pin_page )
>> +        return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
>> +
>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>> +    return xsm_default_action(action, d1, d2);
> 
> This one has the same issue, but is more interesting: There's no
> similar hook/check for unpinning a page (nor does the same check
> get re-used there). Plus it's x86 (more precisely PV) specific.

out of scope

>> -static inline int xsm_map_gmfn_foreign (xsm_default_t def, struct domain *d, struct domain *t)
>> +static inline int xsm_map_gmfn_foreign(xsm_default_t action, struct domain *d,
>> +                                       struct domain *t)
>>  {
>> -    return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
>> +    if ( xsm_ops.map_gmfn_foreign )
>> +        return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
>> +
>> +    XSM_ASSERT_ACTION(XSM_TARGET);
>> +    return xsm_default_action(action, d, t);
> 
> This one is also interesting: There's no check at all here that
> current->domain has any permissions towards d or t. Interestingly
> even flask_map_gmfn_foreign() doesn't check this.

out of scope

>> -static inline int xsm_console_io (xsm_default_t def, struct domain *d, int cmd)
>> +static inline int xsm_console_io(xsm_default_t action, struct domain *d, int cmd)
>>  {
>> -    return alternative_call(xsm_ops.console_io, d, cmd);
>> +    if ( xsm_ops.console_io )
>> +        return alternative_call(xsm_ops.console_io, d, cmd);
>> +
>> +    XSM_ASSERT_ACTION(XSM_OTHER);
>> +    if ( d->is_console )
>> +        return xsm_default_action(XSM_HOOK, d, NULL);
>> +#ifdef CONFIG_VERBOSE_DEBUG
>> +    if ( cmd == CONSOLEIO_write )
>> +        return xsm_default_action(XSM_HOOK, d, NULL);
>> +#endif
>> +    return xsm_default_action(XSM_PRIV, d, NULL);
> 
> Same implication of d == current->domain here again. I guess I'll
> stop enumerating further ones.

out of scope

<snip>

>> -static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int op)
>> +static inline int xsm_pmu_op(xsm_default_t action, struct domain *d,
>> +                             unsigned int op)
>>  {
>> -    return alternative_call(xsm_ops.pmu_op, d, op);
>> +    if ( xsm_ops.pmu_op )
>> +        return alternative_call(xsm_ops.pmu_op, d, op);
>> +
>> +    XSM_ASSERT_ACTION(XSM_OTHER);
>> +    switch ( op )
>> +    {
>> +    case XENPMU_init:
>> +    case XENPMU_finish:
>> +    case XENPMU_lvtpc_set:
>> +    case XENPMU_flush:
>> +        return xsm_default_action(XSM_HOOK, d, current->domain);
>> +    default:
>> +        return xsm_default_action(XSM_PRIV, d, current->domain);
> 
> Urgh - isn't this the wrong way round? (Luckily vPMU isn't security
> supported, so no XSA would be needed.)

out of scope

<snip>

>> --- a/xen/xsm/silo.c
>> +++ b/xen/xsm/silo.c
>> @@ -17,6 +17,7 @@
>>   * You should have received a copy of the GNU General Public License along with
>>   * this program; If not, see <http://www.gnu.org/licenses/>.
>>   */
>> +#include <xsm/xsm-core.h>
>>  #include <xsm/dummy.h>
> 
> As already mentioned elsewhere - where possible please arrange #include-s
> alphabetically.

Ack.

>> @@ -124,16 +122,12 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>>          break;
>>      }
>>  
>> -    /*
>> -     * This handles three cases,
>> -     *   - dummy policy module was selected
>> -     *   - a policy module does not provide all handlers
>> -     *   - a policy module failed to init
>> -     */
>> -    xsm_fixup_ops(&xsm_ops);
>> -
>> -    if ( xsm_ops_registered != XSM_OPS_REGISTERED )
>> +    if ( xsm_ops_registered != XSM_OPS_REGISTERED ) {
> 
> Nit (style): Brace goes on its own line.

Ack

v/r,
dps


