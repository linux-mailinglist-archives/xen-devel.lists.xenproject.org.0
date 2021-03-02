Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0407329BB0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 12:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92269.174096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH30j-00072a-1b; Tue, 02 Mar 2021 11:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92269.174096; Tue, 02 Mar 2021 11:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH30i-00072B-Um; Tue, 02 Mar 2021 11:16:16 +0000
Received: by outflank-mailman (input) for mailman id 92269;
 Tue, 02 Mar 2021 11:16:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lH30h-000726-0b
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 11:16:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a60960a-f6db-4878-9b97-759ce7e0c4a1;
 Tue, 02 Mar 2021 11:16:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDED9ABF4;
 Tue,  2 Mar 2021 11:16:12 +0000 (UTC)
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
X-Inumbo-ID: 4a60960a-f6db-4878-9b97-759ce7e0c4a1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614683773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9LzKs6jtTA0+43+bDdsyzXetTlbJKjal/V5TPQ+4HY8=;
	b=OL9ppcCjnnRWUSaJlQownA93CXIX/DWoskuvzcz0jW2Wa8VCCUXcOBwql2NsQuhIhue1VE
	+112XkAtOyewXtEyQDMm7shmw52Ki+LWACysri3gpxcvo9hdyA9sLuI2aDNIflBQUxlDDR
	h88NxaFjxZAggi20sV2H4RvOMIQu12U=
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20210301162357.76527-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bfd185bf-489f-d858-c459-7630cbe7b462@suse.com>
Date: Tue, 2 Mar 2021 12:16:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301162357.76527-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.03.2021 17:23, Roger Pau Monne wrote:
> Introduce an option to allow selecting the legacy behavior for
> accesses to MSRs not explicitly handled. Since commit
> 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> handled by Xen result in the injection of a #GP to the guest. This is
> a behavior change since previously a #GP was only injected if
> accessing the MSR on the real hardware will also trigger a #GP.
> 
> This seems to be problematic for some guests, so introduce an option
> to fallback to this legacy behavior. The main difference between what
> was previously done is that the hardware MSR value is not leaked to
> the guests on reads.

Looking at the WRMSR behavior for PV, what you introduce isn't
matching 4.14 behavior: If rdmsr_safe() failed, all that effected
was the issuing of a log message. The behavior you propose is
better, no question, but it shouldn't be described as matching
legacy behavior then.

Somewhat related to this I wonder whether MSR reads and writes
wouldn't better be controllable independently. It seems quite
likely that a kernel may have an issue only with reads.

Additionally I wonder whether it is a good idea to let these
events go silently.

> Note that this option is not made available to dom0. I'm not sure
> whether it makes sense to do so, since anyone updating Xen to such
> newer version will also likely pair it with a newish kernel that
> doesn't require such workarounds.

No, that's not an option imo. It was a Dom0 where I ran into the
problem causing me to submit "x86/PV: conditionally avoid raising
#GP for early guest MSR accesses". While I could upgrade that
system, I have reasons for not doing so. And while I could put a
more modern kernel on there, I'd prefer if the distro kernel
continued to work. (That's leaving aside that for unrelated
reasons building and using my own, newer kernel there is quite a
bit more difficult than on all other of my test systems.)

> RFC because there's still some debate as to how we should solve the
> MSR issue, this is one possible way, but IMO we need to make a
> decision soon-ish because of the release timeline.

Generally I think it would be far better from a user pov if
things worked out of the box, at least in cases where it can be
made work. Arguably for Solaris this isn't going to be possible
(leaving aside the non-option of fully returning back to original
behavior), but for the old-Linux-PV case I still think my proposed
change is better in this regard. I realize Andrew said (on irc)
that this is making the behavior even weaker. I take a different
perspective: Considering a guest will install exception handlers
at some point, I continue to fail to see what good it will do to
try to inject a #GP(0) when we know the guest will die because of
not having a handler registered just yet. It is a kernel flaw,
yes, but they ended up living with it merely because of our odd
prior behavior, so we can't put all the blame on them.

This isn't to say that I'm against propagating exceptions where
there's no alternative to delivering one. Also I'm certainly open
to further tighten the condition of when to zap such an exception
(e.g. only as long as there's no handler _and_ the guest is still
in UP mode, assuming of course this would still address the
observed issue).

> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2861,6 +2861,17 @@ No MCA capabilities in above list are enabled.
>  
>  =back
>  
> +=item B<msr_legacy_handling=BOOLEAN>
> +
> +Select whether to use the legacy behaviour for accesses to MSRs not explicitly
> +handled by Xen instead of injecting a #GP to the guest.  Such legacy access
> +mode will force Xen to replicate the behaviour from the hardware it's currently
> +running on in order to decide whether a #GP is injected to the guest.  Note
> +that the guest is never allowed access to unhandled MSRs, this option only
> +changes whether a #GP might be injected or not.

This description is appropriate for reads, but not for writes:
Whether a write would fault can only be known by trying a write,
yet for safety reasons we can't risk doing more than a read. An
option might be to make writes fault is the to be written value
differs from that which the probing read has returned (i.e. the
same condition which originally had caused a log message to appear
in 4.14 for PV guests).

> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -644,6 +644,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                 ("vuart", libxl_vuart_type),
>                                ])),
> +    ("arch_x86", Struct(None, [("msr_legacy_handling", libxl_defbool),
> +                              ])),

Seeing this I'm wondering whether the entire set of arch_*
shouldn't be within a union. But afaics this would have further
implications on code elsewhere, so surely wouldn't want doing
right now.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -852,6 +852,9 @@ int arch_domain_create(struct domain *d,
>  
>      domain_cpu_policy_changed(d);
>  
> +    d->arch.msr_legacy_handling = config->arch.domain_flags &
> +                                  XEN_X86_LEGACY_MSR_HANDLING;

Somewhere you'd also need to refuse processing requests with any
of the other 31 bits set.

Jan

