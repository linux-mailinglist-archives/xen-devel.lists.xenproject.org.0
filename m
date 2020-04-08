Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208341A214D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 14:06:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM9Sm-0007nm-HE; Wed, 08 Apr 2020 12:05:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jM9Sl-0007nh-0u
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 12:05:47 +0000
X-Inumbo-ID: 46a98926-7991-11ea-81da-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46a98926-7991-11ea-81da-12813bfff9fa;
 Wed, 08 Apr 2020 12:05:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C0CFBAB89;
 Wed,  8 Apr 2020 12:05:43 +0000 (UTC)
Subject: Re: [XEN PATCH v4 08/18] xen/build: introduce if_changed and
 if_changed_rule
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-9-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45e19a69-2f9e-a264-0129-539d362487a4@suse.com>
Date: Wed, 8 Apr 2020 14:05:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-9-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:30, Anthony PERARD wrote:
> The if_changed macro from Linux, in addition to check if any files
> needs an update, check if the command line has changed since the last
> invocation. The latter will force a rebuild if any options to the
> executable have changed.
> 
> if_changed_rule checks dependencies like if_changed, but execute
> rule_$(1) instead of cmd_$(1) when a target needs to be rebuilt. A rule_
> macro can call more than one cmd_ macro. One of the cmd_ macro in a
> rule need to be call using a macro that record the command line, so
> cmd_and_record is introduced. It is similar to cmd_and_fixup from
> Linux but without a call to fixdep which we don't have yet. (We will
> later replace cmd_and_record by cmd_and_fixup.)
> 
> Example of a rule_ macro:
> define rule_cc_o_c
>     $(call cmd_and_record,cc_o_o)
>     $(call cmd,objcopy)
> endef
> 
> This needs one of the call to use cmd_and_record, otherwise no .*.cmd
> file will be created, and the target will keep been rebuilt.
> 
> In order for if_changed to works correctly, we need to load the .%.cmd
> files that the macro generates, this is done by adding targets in to
> the $(targets) variable. We use intermediate_targets to add %.init.o
> dependency %.o to target since there aren't in obj-y.
> 
> We also add $(MAKECMDGOALS) to targets so that when running for
> example `make common/memory.i`, make will load the associated .%.cmd
> dependency file.
> 
> Beside the if_changed*, we import the machinery used for a "beautify
> output". The important one is when running make with V=2 which help to
> debug the makefiles by printing why a target is been rebuilt, via the
> $(echo-why) macro.
> 
> if_changed and if_changed_rule aren't used yet.
> 
> Most of this code is copied from Linux v5.4, including the
> documentation.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/docs/misc/xen-makefiles/makefiles.rst
> +++ b/docs/misc/xen-makefiles/makefiles.rst
> @@ -85,3 +85,102 @@ Compilation flags
>  
>  	CFLAGS-y specifies options for compiling with $(CC).
>  	AFLAGS-y specifies assembler options.
> +
> +
> +Build system infrastructure
> +===========================
> +
> +This chapter describe some of the macro used when building Xen.
> +
> +Macros
> +------
> +
> +
> +    if_changed
> +	if_changed is the infrastructure used for the following commands.
> +
> +	Usage::
> +
> +		target: source(s) FORCE
> +			$(call if_changed,ld/objcopy/...)
> +
> +	When the rule is evaluated, it is checked to see if any files
> +	need an update, or the command line has changed since the last
> +	invocation. The latter will force a rebuild if any options
> +	to the executable have changed.
> +	Any target that utilises if_changed must be listed in $(targets),
> +	otherwise the command line check will fail, and the target will
> +	always be built.
> +	if_changed may be used in conjunction with custom commands as
> +	defined in "Custom commands".
> +
> +	Note: It is a typical mistake to forget the FORCE prerequisite.
> +	Another common pitfall is that whitespace is sometimes
> +	significant; for instance, the below will fail (note the extra space
> +	after the comma)::
> +
> +		target: source(s) FORCE
> +
> +	**WRONG!**	$(call if_changed, ld/objcopy/...)
> +
> +        Note:
> +	      if_changed should not be used more than once per target.
> +              It stores the executed command in a corresponding .cmd

... the odd mixing of tabs and spaces here taken care of (I didn't
check if there are more) and ...

> +
> +        file and multiple calls would result in overwrites and

... the apparently stray blank like here dropped.

Jan

