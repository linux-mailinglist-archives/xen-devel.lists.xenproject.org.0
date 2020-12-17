Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4112DCD72
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 09:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55754.97152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpoPR-00076F-GN; Thu, 17 Dec 2020 08:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55754.97152; Thu, 17 Dec 2020 08:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpoPR-00075q-Cs; Thu, 17 Dec 2020 08:13:13 +0000
Received: by outflank-mailman (input) for mailman id 55754;
 Thu, 17 Dec 2020 08:13:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YGc=FV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpoPP-00075l-TS
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 08:13:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b7e1d7d-c1fc-4cbb-8b8f-3b001e5fe4e9;
 Thu, 17 Dec 2020 08:13:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBC02AC79;
 Thu, 17 Dec 2020 08:13:09 +0000 (UTC)
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
X-Inumbo-ID: 1b7e1d7d-c1fc-4cbb-8b8f-3b001e5fe4e9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608192790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qnws3/6vo3B1EvPC08I1gLRMm+PbjpnSkBWcFzv6WQ=;
	b=rTR9PA/x39myenr6Kn1w1SvjfecwlQGEFyznu8IkpPzhY8HfAj/KGy3WMml+3EOvj0qy/X
	Ud90jBsMQ3LQTYbAo2f72stUYCK6rOrBbqw40+VylO/0tXtq+HtoWgQdC6eRd1prCMxD0c
	NVXh2GlD9PZU5wvnLOD5ToBRgXjnIrc=
Subject: Re: arm32 tools/flask build failure
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: iwj@xenproject.org, anthony.perard@citrix.com, wl@xen.org,
 dgdegra@tycho.nsa.gov, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2012151823480.4040@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2012161753100.4040@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <215dee92-634e-73c3-f000-928deda5ab3d@suse.com>
Date: Thu, 17 Dec 2020 09:13:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012161753100.4040@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.12.2020 02:54, Stefano Stabellini wrote:
> On Tue, 15 Dec 2020, Stefano Stabellini wrote:
>> Hi all,
>>
>> I am building Xen tools for ARM32 using qemu-user. I am getting the
>> following error building tools/flask. Everything else works fine. It is
>> worth noting that make -j1 works fine, it is only make -j4 that fails.
>>
>> I played with .NOTPARALLEL but couldn't get it to work. Anyone has any
>> ideas?
>>
>> Cheers,
>>
>> Stefano
>>
>>
>> make[2]: Leaving directory '/build/tools/flask/utils'
>> make[1]: Leaving directory '/build/tools/flask'
>> make[1]: Entering directory '/build/tools/flask'
>> /usr/bin/make -C policy all
>> make[2]: Entering directory '/build/tools/flask/policy'
>> make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
>> /build/tools/flask/policy/Makefile.common:115: *** target pattern contains no '%'.  Stop.
>> make[2]: Leaving directory '/build/tools/flask/policy'
>> make[1]: *** [/build/tools/flask/../../tools/Rules.mk:160: subdir-all-policy] Error 2
>> make[1]: Leaving directory '/build/tools/flask'
>> make: *** [/build/tools/flask/../../tools/Rules.mk:155: subdirs-all] Error 2
> 
> 
> The fix seems to be turning the problematic variable:
> 
> POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)
> 
> into a rule.

At a first glance this looks like just papering over the issue. When
I had looked at it yesterday after seeing your mail, I didn't even
spot this "interesting" make recursion. What I'd like to understand
first is where the % is coming from - the error message clearly
suggests that there's a % in the filename. Yet

.PHONY: xenversion
xenversion:
	@echo $(XEN_FULLVERSION)

doesn't make clear to me where the % might be coming from. Of course
there's nothing at all precluding e.g. $(XEN_VENDORVERSION) to
contain a % character, but I don't think that's what you're running
into.

> --- a/tools/flask/policy/Makefile.common
> +++ b/tools/flask/policy/Makefile.common
> @@ -35,7 +35,6 @@ OUTPUT_POLICY ?= $(BEST_POLICY_VER)
>  #
>  ########################################
>  
> -POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)
>  POLICY_LOADPATH = /boot
>  
>  # List of policy versions supported by the hypervisor
> @@ -112,17 +111,19 @@ POLICY_SECTIONS += $(USERS)
>  POLICY_SECTIONS += $(ALL_CONSTRAINTS)
>  POLICY_SECTIONS += $(ISID_DEFS) $(DEV_OCONS)
>  
> -all: $(POLICY_FILENAME)
> +policy:

This is a phony target, isn't it? It then also needs marking so.
However, ...

> -install: $(POLICY_FILENAME)
> +all: policy
> +
> +install: policy
>  	$(INSTALL_DIR) $(DESTDIR)/$(POLICY_LOADPATH)
>  	$(INSTALL_DATA) $^ $(DESTDIR)/$(POLICY_LOADPATH)
>  
>  uninstall:
>  	rm -f $(DESTDIR)/$(POLICY_LOADPATH)/$(POLICY_FILENAME)
>  
> -$(POLICY_FILENAME): $(FLASK_BUILD_DIR)/policy.conf
> -	$(CHECKPOLICY) $(CHECKPOLICY_PARAM) $^ -o $@
> +policy: $(FLASK_BUILD_DIR)/policy.conf
> +	$(CHECKPOLICY) $(CHECKPOLICY_PARAM) $^ -o xenpolicy-"$$($(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)"

... wouldn't it make sense to latch the version into an output
file, and use that as the target? Along the lines of

xenversion:
	$(MAKE) -C $(XEN_ROOT)/xen --no-print-directory $@ >$@

but possibly utilizing move-if-changed. This would then result in
more "conventional" make recursion.

Jan

