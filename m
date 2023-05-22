Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2770C5CC
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 21:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538068.837818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Aw2-00019h-0Q; Mon, 22 May 2023 19:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538068.837818; Mon, 22 May 2023 19:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Aw1-00016O-TA; Mon, 22 May 2023 19:11:09 +0000
Received: by outflank-mailman (input) for mailman id 538068;
 Mon, 22 May 2023 19:11:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iirr=BL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1q1Avz-00016D-U5
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 19:11:08 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62eab82e-f8d4-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 21:11:01 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16847826465641012.4911080837867;
 Mon, 22 May 2023 12:10:46 -0700 (PDT)
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
X-Inumbo-ID: 62eab82e-f8d4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1684782647; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TI/LPNqVMPHQLTqxPnbta7GkraYlp4fhOsfKXhPKbph+SQmynfRzGypC+swalw2w44SFnfVVdECHWNB6eQo30LXhmH2S0YlniQbCCunVRbqklqRYB3w0zdTatIbT1GhrBH26UDL0+6z7KPw9hom8KJMPoipG3nKOoKw1Tvuo/uc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684782647; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=XAgV32Qod+z5MHCfvaT/mP1HVEx9HWoewIm0vYR7fa4=; 
	b=OsBxectFPE1ytTAJlvJOXOV0ZzpfAtgh4dcyB9faGxZjX7b2OD8J/2epAI4FeAVMt3/X2VRVXRuLWMUb0bHUuaSWE+PTAxkK/KtdNdO8M6CflqF0huQ3/G864RIJRY4ppImF/Sn4fODTeJSpVIdlC/SBK/7aAwgTHreRQlDYD0Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684782647;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XAgV32Qod+z5MHCfvaT/mP1HVEx9HWoewIm0vYR7fa4=;
	b=WRvQ6tECHHjI1Ayv2WDUAew+SkLDfZ5J8VesDdK/kOOMNMMeRHU3H07vMDXmCPYc
	RS/ntmg4VDoNoVisukTiJ4ML85RE0G8LhT+2otIA2GXGbWe8lwMiXP5JJt5zhylk6KE
	sDufutK74Ialpe0MGwfnMdsVlM5aC+t05ktzuMLs=
Message-ID: <aed5a8d6-42ae-200b-0bd7-ce6e7a5f02d8@apertussolutions.com>
Date: Mon, 22 May 2023 15:10:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230519114824.12482-1-dpsmith@apertussolutions.com>
 <4a8c30bd-ebe7-3800-37ae-9e3e6c37a7d0@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] maintainers: add regex matching for xsm
In-Reply-To: <4a8c30bd-ebe7-3800-37ae-9e3e6c37a7d0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/22/23 05:23, Jan Beulich wrote:
> On 19.05.2023 13:48, Daniel P. Smith wrote:
>> XSM is a subsystem where it is equally important of how and where its hooks are
>> called as is the implementation of the hooks. The people best suited for
>> evaluating the how and where are the XSM maintainers and reviewers. This
>> creates a challenge as the hooks are used throughout the hypervisor for which
>> the XSM maintainers and reviewers are not, and should not be, a reviewer for
>> each of these subsystems in the MAINTAINERS file. Though the MAINTAINERS file
>> does support the use of regex matches, 'K' identifier, that are applied to both
>> the commit message and the commit delta. Adding the 'K' identifier will declare
>> that any patch relating to XSM require the input from the XSM maintainers and
>> reviewers. For those that use the get_maintianers script, the 'K' identifier
>> will automatically add the XSM maintainers and reviewers.
> 
> With, aiui, a fair chance of false positives when e.g. XSM hook invocations
> are only in patch context. Much like ...

I was torn between matching lines with `xsm_` and matching lines with 
the first non-whitespace character being a `+` and having `xsm_`. In the 
end, I opted for the former because the concern is not just a change to 
the line with the XSM hook, but the changing context around the hook. As 
a result, yes, there will be false positives as well as the potentially 
false negatives as a relevant context change may happen far enough 
outside the diff scope. Regardless, the end result will be an increased 
awareness at the cost of some noise. INHO I find this to be a better 
situation than the current place we are at today.

>> Any one not using
>> get_maintainers, it will be their responsibility to ensure that if their work
>> touches and XSM hook, to ensure the XSM maintainers and reviewers are copied.
> 
> ... manual intervention is needed in the case of not using the script, I
> think people should also be at least asked to see about avoiding stray Cc-s
> in that case. Unless of course I'm misreading get_maintainers.pl (my Perl
> isn't really great) or the script would be adjusted to only look at added/
> removed lines (albeit even that would leave a certain risk of false
> positives).
> 
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -674,6 +674,8 @@ F:	tools/flask/
>>   F:	xen/include/xsm/
>>   F:	xen/xsm/
>>   F:	docs/misc/xsm-flask.txt
>> +K:  xsm_.*
>> +K:  \b(xsm|XSM)\b
> 
> Nit: Please make padding match that of adjacent lines.
s
Apologies, I didn't catch expandtab was on, will resubmit with hard tabs 
in place.

v/r,
dps

