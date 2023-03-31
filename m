Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA86D2988
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 22:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517041.802037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLTo-00018B-DH; Fri, 31 Mar 2023 20:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517041.802037; Fri, 31 Mar 2023 20:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLTo-00015u-99; Fri, 31 Mar 2023 20:36:12 +0000
Received: by outflank-mailman (input) for mailman id 517041;
 Fri, 31 Mar 2023 20:36:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1piLTn-00015o-1q
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 20:36:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1piLTm-00016m-6L; Fri, 31 Mar 2023 20:36:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1piLTm-0006ZI-0p; Fri, 31 Mar 2023 20:36:10 +0000
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
	bh=tigIOCtjuThVy+YSAtJCvw+OV15EKijP7ezekp+330E=; b=hml9q3uQ+E3A30KE3aPqJjTY+v
	Du6MM3ctOK9PL64xaTr8fj5KPZVq4PpaBJmEjKa3EGEwiqbhpCaEHxH16KXLmM2a5bCTsjYcoowkv
	ckZ3hEryESzYiYKqxBEzos+YvfCAbnLIh7L7dEvwZCTlAjWBNJtnJVp9cHAUonspuNtk=;
Message-ID: <a5e7a9df-590b-4c59-d064-b73bbe7e828b@xen.org>
Date: Fri, 31 Mar 2023 21:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v9 3/5] xen: change <asm/bug.h> to <xen/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
 <67e4c153cecb5757c7b55a4cffc8c7bb6b10c0d0.1680086655.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <67e4c153cecb5757c7b55a4cffc8c7bb6b10c0d0.1680086655.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 29/03/2023 11:50, Oleksii Kurochko wrote:
> The idea of the patch is to change all <asm/bug.h> to <xen/bug.h> and
> keep Xen compilable with adding only minimal amount of changes:
> 1. It was added "#include <xen/types.h>" to ARM's "<asm/bug.h>" as it
>    uses uint_{16,32}t in 'struct bug_frame'.
> 2. It was added '#define BUG_FRAME_STRUCT' which means that ARM hasn't
>    been switched to generic implementation yet.
> 3. It was added '#define BUG_FRAME_STRUCT' which means that x86 hasn't
>    been switched to generic implementation yet.
> 4. BUGFRAME_* and _start_bug_frame[], _stop_bug_frame_*[] were removed
>    for ARM & x86 to deal with compilation errors such as:
>        redundant redeclaration of ...
> 5. Remove BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH from
>    x86's <asm.bug.h> to not to produce #undef for them and #define again
>    with the same values as in <xen/bug.h>. These #undef and #define will
>    be anyway removed in the patch [2]
> 6. Remove <asm/bug.h> from <x86/acpi/cpufreq/cpufreq.c> and
>    <drivers/cpufreq/cpufreq.c> as nothing from <xen/bug.h> are used in
>    <*/cpufreq.c>
> 
> In the following two patches x86 and ARM archictectures will be
> switched fully:
> [1] xen/arm: switch ARM to use generic implementation of bug.h
> [2] xen/x86: switch x86 to use generic implemetation of bug.h
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

