Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ACE3D5001
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jul 2021 22:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160848.295351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7l1u-0001Xj-FM; Sun, 25 Jul 2021 20:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160848.295351; Sun, 25 Jul 2021 20:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7l1u-0001Vu-CF; Sun, 25 Jul 2021 20:47:22 +0000
Received: by outflank-mailman (input) for mailman id 160848;
 Sun, 25 Jul 2021 20:47:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uk94=MR=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m7l1s-0001Vl-V5
 for xen-devel@lists.xenproject.org; Sun, 25 Jul 2021 20:47:21 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8061b522-ed89-11eb-95d8-12813bfff9fa;
 Sun, 25 Jul 2021 20:47:19 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1627246031852574.667026235216;
 Sun, 25 Jul 2021 13:47:11 -0700 (PDT)
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
X-Inumbo-ID: 8061b522-ed89-11eb-95d8-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1627246033; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F6zz9fTE4sYUzMPwv1UTZhN2/DQbcLGTilYX6soEjmoMkYF30miX8GQtr6czJFDgkm/qjIMjAPmOVSjyDfEY7Efo+y/Md0q4D3Ht6B7ZNMFEgAhq6U6lqWw3MIgGUUhOIt9lQtujYIy5muAYZtjsrUo52JXyxh/fDYT1GOn2MDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627246033; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=CKrBufg6MB5+iFrVnARAdi22f0rXilfH/nP4BlPmyM8=; 
	b=PQ2KEvCu48pHUfoyFXYJYL1H6e7iNOOshTK6TMm9bJ9/0Z8RFue1dXFcs+E9jbYvtqkGzabStlg73vIciDq/lbwLmIJDdYMadBStWAu1sewuMdzmVF7c7BE9KHsCR5mRGfk8fHd2OfSXSFYmeepzibTsBkSqMCXhyiG5HDNKdcc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627246033;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CKrBufg6MB5+iFrVnARAdi22f0rXilfH/nP4BlPmyM8=;
	b=rTjihLNk7Op9JxvsVoOnGcTYVmA3npoQsiS9kC5ysXo3rkF8vrgxAAKwnITlJlRC
	/XKBtBnEO1YoR94WlXKx0RzE1MXdt+fv7SfuKSbOT7HOdpsC6sI0Gyae8J0r4o3IOMn
	AdwDt44yknqAAnovj91UmOXbfdbyXVsGdgOx+6q0=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-7-dpsmith@apertussolutions.com>
 <e4aea947-ae36-7791-dd95-94ce0e60a62a@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 06/10] xsm: enable xsm to always be included
Message-ID: <9be23243-3f1d-fd63-944a-fccfa12fc54d@apertussolutions.com>
Date: Sun, 25 Jul 2021 16:47:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e4aea947-ae36-7791-dd95-94ce0e60a62a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/19/21 6:24 AM, Jan Beulich wrote:
> On 12.07.2021 22:32, Daniel P. Smith wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -200,23 +200,20 @@ config XENOPROF
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
>> +menu "Xen Security Modules"
> 
> I remain unconvinced of the removal of this top level option. I don't
> view my concern on code size / performance as "unreasonable" (as Andrew
> did call it) when comparing with the current !XSM configuration, and I
> also remain to be convinced of people who had to simply answer 'n' to
> the XSM kconfig prompt being happy to make an informed decision for all
> the (previously sub-)options that they will now be prompted for. As
> said before - it is one thing to re-work what exactly !XSM means
> internally (and the conversion away from inline functions may very well
> be a win; we simply don't know without you showing e.g. bloat-o-meter
> like data). It is another to require in-depth knowledge to configure
> Xen that previously wasn't required.

For me personally a concern about code size / performance itself is not
"unreasonable" but I would say it is a bit disingenuous to use it to
defend a position that the security framework should be special
conditioned and kept convoluted considering, 1) other subsystems, e.g.
iommu, do not appear to me to have the same subjugation requiring a
special case of one hook set over another, 2) the architecture (Arm)
which IMHO has the greatest concern over code size / performance is also
the architecture with the only security supported configuration that
requires an XSM enabled configuration, 3) this approach effectively
requires the maintaining of two sets of hook handlers which increases
work and risk for vulnerability introduction, and 4) based on the
discussions at the Developers Summit, no one seemed to be aware that the
only logical difference between !XSM and XSM was the invocation
mechanism, inline vs call-site, let alone that XSM_HOOK represented no
control check.

To bring context to the discussion, after applying the clean up patches
(everything up to the patch dropping !XSM) of the patch set, the
bloat-o-meter shows a 0.18% increase going from !XSM to XSM (without
SILO and Flask). IMHO this increase does not justify keeping the
convoluted gyrations being done to swap in an optimized security hook
when no other security module is enabled. In fact we should be working
to make the security framework clear and concise. I am all for
maximizing performance while doing so but the end goal is for it to be
clear and concise so that it can be reasoned about by everybody.

As to your position that this increases configuration complexity, I
would have to strongly disagree. I have worked to ensure no new
configuration steps are necessary. The default config will only have XSM
and the default/dummy policy enabled unless on Arm which will enable
SILO and make it the default policy. Prior to this if XSM was enabled,
the default policy was forced to Flask. While I am an advocate for
Flask, I do not agree this is a reasonable configuration. It now works
such that,
    - if you enable only SILO, it is set as the default
    - if you enable only Flask, it is set as the default
    - if you enable both SILO & Flask, it uses SILO as the default
Which basically works such that if one selects a policy, then it assumes
that policy is desired to be used, and when more than one is selected it
will default to the one that functions most like classic Dom0 model.
IMHO this is much more intuitive. Now one alternative I am thinking
about that might be a bit of a compromise is to move the default policy
selection up to the same level as XSM menu. That would make it so one
could immediately see what the default policy is but must go into the
XSM menu if they want to alter what policy modules are available.

> Keeping the top-level option would then also make it unnecessary to
> alter some of the (prior sub-)options' defaults.

I would beg to differ, it now makes the builder have to explicitly enter
that sub-option if they desire to enable an alternate security model,
e.g. have explicit intent instead of having the potential for accidental
selection.

> As to Andrew previously having said
> 
> "There is no such thing as !XSM even in staging right now.
> 
>  All over Xen, we have calls to xsm_*() functions which, even in the !XSM
>  case, contain a non-trivial security policy."
> 
> Yes, this is one possible viewpoint, which I simply do not share. I view
> the xsm_*() calls in the !XSM case as simple surrogates, not anything that
> deserves the name "module". This is actually supported by the help text
> of the XSM Kconfig option saying "which allows administrators fine-grained
> control": There's nothing fine-grained with what currently is !XSM.

IMHO that is a very unfortunate viewpoint. An xsm_*() call is an access
control check point where a decision needs to be made on whether an
access to a resource should be allowed. In a kernel with a monolithic
access control there would still be an implicit or an explicit access
check necessary at this location. What XSM does is makes all the access
check locations to be explicit checks where the decision can be handled
by different access control frameworks to be plugged in to implement the
security architecture that the implementer requires.

>> -	  If unsure, say N.
>> +config XSM_EVTCHN_LABELING
>> +	bool "Enables security labeling of event channels"
> 
> Does this really need to have a prompt, instead of simply being
> selected by the module(s) needing it? IOW what do users gain when they
> answer y here but n for XSM_FLASK?
> 
> Furthermore, if the prompt is to remain, then I'll have to again
> raise the question of ordering of options: This way, via e.g. the
> "syncconfig" or "oldconfig" targets, I'd be asked for the setting here
> when, if I'd then also set XSM_FLASK=y, the question was in vein - the
> option will be set to y anyway.
> 
>> +	default n
> 
> May I ask to omit "default n" lines. I'm unaware of anything good they
> do.

It has been dropped

>> @@ -265,24 +262,26 @@ config XSM_SILO
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
>>  	config XSM_DUMMY_DEFAULT
>> -		bool "Match non-XSM behavior"
>> +		bool "Classic Dom0 behavior"
>>  	config XSM_FLASK_DEFAULT
>>  		bool "FLux Advanced Security Kernel" if XSM_FLASK
>>  	config XSM_SILO_DEFAULT
>>  		bool "SILO" if XSM_SILO
>> +
>>  endchoice
> 
> Nit: I see only two consistent formatting options here: Either there is
> a blank line ahead of "endchoice" and after "choice", or there are none
> in both places. I don't mind which one it is, but I do mind
> inconsistencies getting introduced.

ack

v/r,
dps


