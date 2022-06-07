Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AAE53FE69
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 14:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343189.568364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyY2e-0008FW-4c; Tue, 07 Jun 2022 12:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343189.568364; Tue, 07 Jun 2022 12:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyY2e-0008CG-1C; Tue, 07 Jun 2022 12:10:36 +0000
Received: by outflank-mailman (input) for mailman id 343189;
 Tue, 07 Jun 2022 12:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dSew=WO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nyY2c-0007DE-DA
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 12:10:34 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d345eab2-e65a-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 14:10:32 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654603825043241.9183558585422;
 Tue, 7 Jun 2022 05:10:25 -0700 (PDT)
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
X-Inumbo-ID: d345eab2-e65a-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; t=1654603829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hwOfAdb7lnmi4VyDM1Cwqj1a7LBQkH8uZDBoAPczEghKnfrxb7y2fL0TQg1HsoTr+iTXRrkukrxa8igHLY41cfGYae4bUApmTlXRaBogjS45rU8jxQCtkM1LdNot72bmTOiStc2V4N9hKKidie3/iP2U7mTfdAOejMcUzSEeoOI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654603829; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/Yts9vn3EFors/IAA0m0XFxstC3Nquu1IHMlw8qecvA=; 
	b=Y0KAR+cWeuWYNg4vvDbt3xjyQk7wG89SInpzzVQR/KymdXY1haIDqgSXbIuJm/5gQvQNCxWb5IXrCevTdqHMCF9+W0Bs6KiqpSKsHza5XEnBTMYlJ7lIQXW1kZV8BqgjSy5hzHagZicq/yyry6btX+mKo+jKJaaJOrG1sOp0XuE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654603829;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/Yts9vn3EFors/IAA0m0XFxstC3Nquu1IHMlw8qecvA=;
	b=Gn/mcWNFYQ5qKluQ/zoXwjBA6S9WwuIG285O+cwJvls5ATkIcRGiJGzGcXS/jtBu
	NsH/Uuc9bTzlDEB6Ypk3q/VrrriMtJrOSVZpDmI5+eD5W0NYjI7fJbxJRDxSa7dkjn0
	2zKdLPFVthzDYO2ITtJrkMYv/6X7O9y5/vC5wqLA=
Message-ID: <32993db2-360d-1d08-b31a-0a29ef23dd98@apertussolutions.com>
Date: Tue, 7 Jun 2022 08:08:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/3] xsm: only search for a policy file when needed
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-2-dpsmith@apertussolutions.com>
 <f8697e9f-6b48-0c1b-8d5a-2d36dafa75b4@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <f8697e9f-6b48-0c1b-8d5a-2d36dafa75b4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 6/1/22 02:08, Jan Beulich wrote:
> On 31.05.2022 17:08, Daniel P. Smith wrote:
>> It is possible to select a few different build configurations that results in
>> the unnecessary walking of the boot module list looking for a policy module.
>> This specifically occurs when the flask policy is enabled but either the dummy
>> or the SILO policy is selected as the enforcing policy. This is not ideal for
>> configurations like hyperlaunch and dom0less when there could be a number of
>> modules to be walked or doing an unnecessary device tree lookup.
>>
>> This patch introduces the policy_file_required flag for tracking when an XSM
>> policy module requires a policy file.
> 
> In light of the "flask=late" aspect of patch 2, I'd like to suggest to
> slightly alter wording here: "... requires looking for a policy file."

ack

>> --- a/xen/xsm/xsm_core.c
>> +++ b/xen/xsm/xsm_core.c
>> @@ -55,19 +55,31 @@ static enum xsm_bootparam __initdata xsm_bootparam =
>>      XSM_BOOTPARAM_DUMMY;
>>  #endif
>>  
>> +static bool __initdata policy_file_required =
>> +    IS_ENABLED(CONFIG_XSM_FLASK_DEFAULT);
> 
> The variable may then also want renaming, to e.g. "find_policy_file".

ack

v/r,
dps

