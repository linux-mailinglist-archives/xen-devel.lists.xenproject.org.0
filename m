Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3783AD39E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 22:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144986.266791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luL7r-0004Bh-7b; Fri, 18 Jun 2021 20:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144986.266791; Fri, 18 Jun 2021 20:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luL7r-00048j-3Z; Fri, 18 Jun 2021 20:30:03 +0000
Received: by outflank-mailman (input) for mailman id 144986;
 Fri, 18 Jun 2021 20:30:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjTI=LM=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1luL7o-0003yP-V2
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 20:30:01 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a62f856-a8a6-49c5-9ec4-8928bff86b4c;
 Fri, 18 Jun 2021 20:29:59 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1624048080467885.5781318434639;
 Fri, 18 Jun 2021 13:28:00 -0700 (PDT)
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
X-Inumbo-ID: 1a62f856-a8a6-49c5-9ec4-8928bff86b4c
ARC-Seal: i=1; a=rsa-sha256; t=1624048081; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VyxdgyLR87Wd5m3aw3r+KDkbfngFMbHFqQQfOQL9T7sOYkHn5oqWpwKJVS24TCkRAja8bduEfLPlMU4lVZPmxFaUJmIq9QClWPIAX3V6N7YlRPk5z3H9qN79LY5pxKoUArAXw0HySqKFmCJPItB1g7U2bpuUZMH79zLrfoXJAn0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1624048081; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=kDdALYAB/s1jcxETPetMlY2UomHy8r2GG7UtLQiV0mQ=; 
	b=PL2fKmMhB2y19A8ZS6w7tfgNNND2YE7wG6KNsNYrjHGyfeFeUgHQPAcL2RA3FiMhBVBgg9ArEhGyws59BxHsHhtyda8V9gKZs/QF0l9KGnEarXO2tQ0rgD1MHjNqrofl4clvXtIBsUBJ5+BzRV0IR4C3X3vgT/t82nxX2WkUOLo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624048081;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kDdALYAB/s1jcxETPetMlY2UomHy8r2GG7UtLQiV0mQ=;
	b=U2hq3b0RXDrOOR/qoiYaedJL4F0hXo6bWFsVDTDbsbQBXWdK9/EtixZv2pvpmNZ3
	c22Z4FeGBFhD56rff43+rH4MZKnbRWmwYOP2wWdDNFMqrsrTdi7k5XXVoxLixKsF8f/
	AkmdOdywWiAPzXgH+OhqA+HkqcPnSCMsOGJaD+Lo=
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <c8bd347f-cf14-8b86-81f7-51c035c5c972@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
Message-ID: <ff0c9f42-f45e-e78e-35b9-c030011eed8f@apertussolutions.com>
Date: Fri, 18 Jun 2021 16:27:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <c8bd347f-cf14-8b86-81f7-51c035c5c972@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/18/21 8:26 AM, Jan Beulich wrote:
> On 18.06.2021 01:39, Daniel P. Smith wrote:
>> The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_XSM_SILO and !CONFIG_XSM_FLASK
>> is whether the XSM hooks in dummy.h are called as static inline functions or as function
>> pointers to static functions. As such this commit,
>>  * eliminates CONFIG_XSM
> 
> Following from what Andrew has said (including him mentioning your
> changing of certain Kconfig option defaults), I'm not convinced this is
> a good move. This still ought to serve as the overall XSM-yes-or-no
> setting. If internally you make said two variants match in behavior,
> that's a different thing.

Apologies that I did not express this clearly. What I was attempting to
say is the fact of the matter is that there is no logical behavior
difference between "XSM no" and "XSM yes with dummy policy". The only
difference is the mechanics of how the dummy functions get called.
Specifically via macro magic the dummy functions are either flipped into
static inline declarations that are then included into the code where
they are invoked or the macro magic has them ending up in the dummy.c
XSM module where they are wrapped in macro generated functions that are
set as the functions in the dummy xsm_ops structure. Thus it is always
the same logic being invoked, it is just mechanics of how you get to the
logic.


>>  * introduces CONFIG_XSM_EVTCHN_LABELING as replacement for enabling event channel labels
> 
> Is this mode needed as separate functionality at all? Nothing defines
> XSM_NEED_GENERIC_EVTCHN_SSID anywhere. _If_ XSM went away as a separate
> setting, then imo this one should go away as well.
> 
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -197,22 +197,33 @@ config XENOPROF
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
>>  
>> -	  If unsure, say N.
>> +choice
>> +	prompt "Default XSM module"
>> +	default XSM_SILO_DEFAULT if XSM_SILO && ARM
>> +	default XSM_FLASK_DEFAULT if XSM_FLASK
>> +	default XSM_SILO_DEFAULT if XSM_SILO
>> +	default XSM_DUMMY_DEFAULT
>> +	config XSM_DUMMY_DEFAULT
>> +		bool "Match non-XSM behavior"
>> +	config XSM_FLASK_DEFAULT
>> +		bool "FLux Advanced Security Kernel" if XSM_FLASK
>> +	config XSM_SILO_DEFAULT
>> +		bool "SILO" if XSM_SILO
>> +endchoice
> 
> This did live after the individual options it depends on for a reason,
> and you don't say anywhere why you need to move it up. The way you
> have it, with the default command line kconfig tool, users will be
> presented with dependent options before having chosen the settings of
> the dependency ones. That's because this tool, to a degree, moves
> linearly through the options it has parsed.

Yes, this is specifically why I moved it up. Clearly we have different
approaches to how we like to interact with configurations, which is not
bad thing. I personally found it awkward the other way but can easily
move it back.

>> @@ -261,25 +271,12 @@ config XSM_SILO
>>  
>>  	  If unsure, say Y.
>>  
>> -choice
>> -	prompt "Default XSM implementation"
>> -	depends on XSM
>> -	default XSM_SILO_DEFAULT if XSM_SILO && ARM
>> -	default XSM_FLASK_DEFAULT if XSM_FLASK
>> -	default XSM_SILO_DEFAULT if XSM_SILO
>> -	default XSM_DUMMY_DEFAULT
>> -	config XSM_DUMMY_DEFAULT
>> -		bool "Match non-XSM behavior"
>> -	config XSM_FLASK_DEFAULT
>> -		bool "FLux Advanced Security Kernel" if XSM_FLASK
>> -	config XSM_SILO_DEFAULT
>> -		bool "SILO" if XSM_SILO
>> -endchoice
>> +endmenu
>>  
>>  config LATE_HWDOM
>>  	bool "Dedicated hardware domain"
>>  	default n
>> -	depends on XSM && X86
>> +	depends on XSM_FLASK && X86
> 
> I don't think this is a compatible change. I'm not going to exclude that
> this is how it was meant, but as it stands LATE_HWDOM right now doesn't
> really require FLASK, and could e.g. also go with SILO or dummy. If you
> _mean_ to change this, then your description needs to say so (and ideally
> it would then be split out, so - if this is actually a bug - it could
> also be backported).

Actually this is the root cause that started all of this work. If you
want to get technical, LATE_HWDOM does not rely on XSM at all. The issue
is that you cannot use it as it was originally intended, to run Xen
without a classic dom0 while still having all existing capabilities.
Specifically the hardware domain does not have the ability to assign the
pass-through devices for which it is in control. This is were Flask
comes in to enable assigning specific privileges to labels and then
constructing domains with those labels, In particular it grants the
ability to do pass-through assignment to the label assigned to the
hardware domain. With the upcoming XSM-Roles patch set, these privileges
are assigned to roles and it becomes possible to assign the necessary
roles to the hardware domain.

v/r,
dps



