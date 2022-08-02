Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D710587D5C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379344.612718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsEM-0007PU-5d; Tue, 02 Aug 2022 13:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379344.612718; Tue, 02 Aug 2022 13:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsEM-0007MR-2Z; Tue, 02 Aug 2022 13:46:42 +0000
Received: by outflank-mailman (input) for mailman id 379344;
 Tue, 02 Aug 2022 13:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BjeM=YG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oIsEK-0007ML-No
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:46:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 876db1ef-1269-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 15:46:39 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165944799215444.62213470260542;
 Tue, 2 Aug 2022 06:46:32 -0700 (PDT)
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
X-Inumbo-ID: 876db1ef-1269-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1659447995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UAecsNSH/tdR5FqFKu5+vSulXcduOpWv0WnQeYHC7GIxr3sCCU/GhJm5ew7CQhsRGv9WIMco/n1D9wwBq7+lA5hB2OTY+FSvGzketzkBiMVs+U3Az4/04CHtuepga0ZtzHmkpu0ZYAzmCKyF5tzjs97KoiyyXVtTniaw4nOzKcA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659447995; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=pSHdW71YjyQJrPRLA7Axi3pNShj14h62KFt5Ko4YHGg=; 
	b=O8MQ9Z5xHAdj7c4ug0QcjePQqDsch0KLkzjAbzNTLKE9oV1yFv8l+/ss4T07tUUJyiHpSXED/yya5zsuyQb0IInVRPPS7BwKPdo3Z76deMwU4mmFYA5by5J35jQhwC3ozEzS7qxuoOXELQ23euW4D163VUr4SjrDKuUkwzP+yq8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659447995;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pSHdW71YjyQJrPRLA7Axi3pNShj14h62KFt5Ko4YHGg=;
	b=kGju2fK+foZBsNZPF24ZCnQ/Acivudau+/xf39eC6wrDhPhZnMbZ1p9m3BLj0nAT
	puHpidnC1qBU+MJyOzEh6fd8dO0j9FBqevwJd4mt1aeYlWPZAK7CvUMC13IhHLcflwU
	6YzMAmis08LDog/y2VoQ7QPgWQHay0UvC+5xzTec=
Message-ID: <cec57d2c-3b95-72c5-2437-ee358536bbfb@apertussolutions.com>
Date: Tue, 2 Aug 2022 09:45:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v10 0/3] Adds starting the idle domain privileged
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: jandryuk@gmail.com, xen-devel@lists.xenproject.org
References: <20220801184928.28522-1-dpsmith@apertussolutions.com>
 <52f7e4b2-f4c8-b1cf-60d0-548a6db8b4b7@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <52f7e4b2-f4c8-b1cf-60d0-548a6db8b4b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/2/22 02:15, Jan Beulich wrote:
> On 01.08.2022 20:49, Daniel P. Smith wrote:
>> This series makes it so that the idle domain is started privileged under the
>> default policy, which the SILO policy inherits, and under the flask policy. It
>> then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
>> by an XSM policy to transition the idle domain to its running privilege level.
>>
>> Patch 3 is an important one, as first it addresses the issue raised under an
>> RFC late last year by Jason Andryuk regarding the awkward entanglement of
>> flask_domain_alloc_security() and flask_domain_create(). Second, it helps
>> articulate why it is that the hypervisor should go through the access control
>> checks, even when it is doing the action itself. The issue at hand is not that
>> the hypervisor could be influenced to go around these check. The issue is these
>> checks provides a configurable way to express the execution flow that the
>> hypervisor should enforce. Specifically with this change, it is now possible
>> for an owner of a dom0less or hyperlaunch system to express a policy where the
>> hypervisor will enforce that no dom0 will be constructed, regardless of what
>> boot construction details were provided to it. Likewise, an owner that does not
>> want to see dom0less or hyperlaunch to be used can enforce that the hypervisor
>> will only construct a dom0 domain. This can all be accomplished without the
>> need to rebuild the hypervisor with these features enabled or disabled.
>>
>> Changes in v10:
>> - rewrote patch 3 commit message
>> - fixed typos in patch 3
>> - reworked logic in flask_domain_create() to be simpler and not result in
>>   changing the domain security struct before the access check fails
>>
>> Changes in v9:
>> - added missing Rb/Tb to patch 1
>> - corrected the flask policy macro in patch 2 to allow domain create
>> - added patch 3 to address allowing the hypervisor create more than 1 domain
>>
>> Changes in v8:
>> - adjusted panic messages in arm and x86 setup.c to be less than 80cols
>> - fixed comment line that went over 80col
>> - added line in patch #1 commit message to clarify the need is for domain
>>   creation
>>
>> Changes in v7:
>> - adjusted error message in default and flask xsm_set_system_active hooks
>> - merged panic messages in arm and x86 setup.c to a single line
>>
>> Changes in v6:
>> - readded the setting of is_privileged in flask_set_system_active()
>> - clarified comment on is_privileged in flask_set_system_active()
>> - added ASSERT on is_privileged and self_sid in flask_set_system_active()
>> - fixed err code returned on Arm for xsm_set_system_active() panic message
>>
>> Changes in v5:
>> - dropped setting is_privileged in flask_set_system_active()
>> - added err code returned by xsm_set_system_active() to panic message
>>
>> Changes in v4:
>> - reworded patch 1 commit messaged
>> - fixed whitespace to coding style
>> - fixed comment to coding style
>>
>> Changes in v3:
>> - renamed *_transition_running() to *_set_system_active()
>> - changed the XSM hook set_system_active() from void to int return
>> - added ASSERT check for the expected privilege level each XSM policy expected
>> - replaced a check against is_privileged in each arch with checking the return
>>   value from the call to xsm_set_system_active()
>>
>> Changes in v2:
>> - renamed flask_domain_runtime_security() to flask_transition_running()
>> - added the missed assignment of self_sid
>>
>> Daniel P. Smith (3):
>>   xsm: create idle domain privileged and demote after setup
>>   flask: implement xsm_set_system_active
> 
> Against what tree is this series? These two patches look to be in staging
> already (and they have been there for almost a month), so if there are
> incremental changes to make, please send incremental patches. Otherwise
> please clarify whether ...

No changes in the first two patches, just forgot to rebase on stable. I
will resend patch 3 standalone, which turns out to be good, as there is
one more adjustment I feel is needed after looking back at hyperlaunch
test cases.

v/r,
dps

