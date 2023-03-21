Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A06C373E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512871.793203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pef63-0007By-B9; Tue, 21 Mar 2023 16:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512871.793203; Tue, 21 Mar 2023 16:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pef63-00079H-83; Tue, 21 Mar 2023 16:44:27 +0000
Received: by outflank-mailman (input) for mailman id 512871;
 Tue, 21 Mar 2023 16:44:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pef61-00079B-PV
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:44:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pef60-0001vW-PW; Tue, 21 Mar 2023 16:44:24 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pef60-000726-HR; Tue, 21 Mar 2023 16:44:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=HOdVSw2Iot42M4WodtXfxoqTSOTOe559RQCueu43VE8=; b=I/LCFazIA5O8tBogboXsuqm+y0
	fP3sk8krzV2O09Hp0K/Xmng0sUmvymKi8CsyLc+0byikd8oMAkCkaFwtah1jTIqTUEyH9IqnPIXPR
	+8iVOXJCieztcPt2S/x/PJ941T1joqoMnKPtL3q2LBZKauUc1wCjdNr2VoE68mZjlUN8=;
Message-ID: <c41b6b39-5ed3-cddb-18f8-41d895aceada@xen.org>
Date: Tue, 21 Mar 2023 16:44:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] move {,vcpu_}show_execution_state() declarations to
 common header
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <fc2156d8-76d7-b6d2-3d39-266dbbf4a0fb@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fc2156d8-76d7-b6d2-3d39-266dbbf4a0fb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/03/2023 11:55, Jan Beulich wrote:
> These are used from common code, so their signatures should be
> consistent across architectures. This is achieved / guaranteed easiest
> when their declarations are in a common header.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> There's no really good header to put the decls, imo; I wanted to avoid
> the already overcrowded sched.h. show_execution_state_nonconst(), being
> there solely for dump_execution_state(), could of course live in the
> upcoming xen/bug.h ...
> 
> Is there a reason that Arm (still) expands dump_execution_state() to
> WARN()? Without that moving x86's show_execution_state_nonconst()
> definition to common code would also make sense (it could be done
> anyway, but then at the expense of introducing dead code to Arm),
> perhaps (see also above) into the upcoming common/bug.c.

run_in_exception_handler() was only properly implemented a couple of 
years ago on Arm and we didn't switch dump_execution_state() to use it.

That said, the current implementation of run_in_exception_handler() 
would not be correct for dump_execution_state() because it clobbers 
x0/r0 on Arm.

This should be addressed with Oleksandr work to consolidate the bug 
infrastructure. So it would be fine to move the helper to common code now.

Alternatively this can be left as a clean-up because 
dump_executation_state() could now be common.

Anyway:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

