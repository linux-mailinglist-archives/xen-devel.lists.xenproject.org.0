Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C566AFE7F9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 13:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038059.1410580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZTB8-0000wu-3f; Wed, 09 Jul 2025 11:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038059.1410580; Wed, 09 Jul 2025 11:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZTB8-0000uG-0H; Wed, 09 Jul 2025 11:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1038059;
 Wed, 09 Jul 2025 11:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8N5c=ZW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uZTB5-0000uA-IK
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 11:41:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a51dd6e7-5cb9-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 13:41:26 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 17B7E4EE9BC6;
 Wed,  9 Jul 2025 13:41:25 +0200 (CEST)
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
X-Inumbo-ID: a51dd6e7-5cb9-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1752061285;
	b=rWrvLUV8JmtiT/gBYuUuiAx98dzSSQj0qmV0wm9dyZTmkFyMGDuFvsMamr2PLxDgzUdM
	 LiMkCSZM+9w4kM34L2axpwbRV6e9GWPE+PXiu4Rm6C5SFcBO1sFDtEpfT2sE+ZZJAhXE7
	 F6H0kkvgIuwnkLCJ3HaOPF1vwjavLUtz35XDwu2IXB/6Pn4OspTNjBFN5UoxK41slqKuT
	 7U3AaJ4upOlHsgjJH4Qgd68pNAUPqsyW6Dn2Rp4W3NQ3F500ZJzcbez40HLyLYGUofA+H
	 5C0efY/NG69TgDf3Zc7Ty3EMPlAlsnH/YUl+nfs8iJOtlyVzuFzCu0bBZiKwCn1p4Lpzi
	 g9lBAh5MgDYpVQmhGjZOT8V2EQsF79hS2QOrdXt/QkK1uQam48tTh6A32Ze8PImO4ZivW
	 rNwoMDGvR0dtT5mLHbOBAIMehDe1Qm8iL70JyYUICMO/KK22heuhPUu2br3S/e9/cA0Ud
	 PKmOWCtycPFKTw+E4JJ3ba/n9ctp3By9brF4Kxr7/69OEgvKXWiTtBlGQ+1LHimhCsQWR
	 EmCUZoZBbFkS/7LNCQvp8rBOT4RAGzOK4OmgVJkKbVUP3QO/Ll9Iq8IWj8xXd0pkYd5JW
	 3Kr25Ytw2wD7Yy+AjZwBy9AA+DYBEv6MEUoLjvVGW239z4fV+iKkl+2a3oepSW8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1752061285;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZhJNMBiic0c9LsCA/J6sklVgJBzmhChnnumDCFVj4Kc=;
	b=cHYd9LctLIXamErbtv3gOs005QEeo70GrvNaP6+kTcnKw9cLuTCwJdwTcWzmlnC0X9gC
	 0gJuYAA6FcDWfL/+9lZOr4N6ycP06tjzCWEMQ8dyjcGfdIYLJflf98ooCqEGdKn9+umlq
	 Npzltx6KQYa3CDK5rknW4OD8yUBCoYHKJeFaj2+YJYEWq5ExSYY5nE24n7giBNl5WDXqA
	 OoTcwjgroynrjeDhhCVbFyKW5eIKUQSyagHG4gjALwsH/CbKjK4B4uQtj/18tL3WBRFao
	 cNcM4oyp5PkRA8lhjKITD2dFp+ukQqPh49Y47hTjaIKMRJCA0qEbqFNoWD9kOmwTJudci
	 Uqtrw9cX5t4nIUN6yb08J/5IwCVzIhExURTzMlmz6mRkXxyEx3+siYS54TkZDjpi4H5Dc
	 Jr5VOBeMVk4oJxCwvo09kp63zYPnGPONA5DMc0zDXeDJIekrA8NzG6wqmu+aUrnkcagn/
	 R+7tN68JXOtT3CzgHwoV0X4hwSUnnggRnWH0wSHtZIgbIda43O594zLvn10IcMb0j7tWY
	 wkqkGWXog7rp2Bulmkr486Z4v3os2epVVEuYINjqIql2MqzoVjqRM3Hrg8l/0BadroG86
	 Zb+SAPZPcLMYougk57dwvdJIdi0tItstB+QxTJrobvodGEpSo0L6LfJmu5CTqjQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1752061285; bh=vn99FMD2GNMj6AOGl5OwyrGnNis9vd+xmvRWldTXxBM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bs3hazvkJk1XsRCX9ZdPMKg3rT8Ne4gSn8EAJ43yI+GynmYSrCXzywFNFUzIHP71A
	 E/PhlLYoe6UUAkdPx9CAl0uZ/H5ilZ1UOvGml/MP8c4PX/ZrI0I7406WCDHbytHOW/
	 1drBxGuzfa632iwA2Gz8aS8bvq1Hgxcs/MLIhvQeVLuOyfFmmgj1jIF62v/zqPFQoJ
	 HvTSNmSRz4JBrIzfMqmxAyf0ZjUs7TGB6drQ0j47IUZZk42naTJ1vS5sdg+QQ5WxT+
	 CCzJu3ljtvCsqkLghRHUFQIV3A526/mQeDiQR7F/3Tel0nspLilpjsPAPxY0f6YCW/
	 eq0ezeDdHaYYg==
MIME-Version: 1.0
Date: Wed, 09 Jul 2025 13:41:25 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] acpi/pm-op: make do_pm_op() decl available in pm-op.c
In-Reply-To: <be5994d5-5e8b-4d9a-b08d-2a7f11a78e3a@suse.com>
References: <be5994d5-5e8b-4d9a-b08d-2a7f11a78e3a@suse.com>
Message-ID: <6a6f8dd1d0cc5ccb907032911607f345@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-09 12:10, Jan Beulich wrote:
> This addresses a Misra rule 8.4 ("A compatible declaration shall be
> visible when an object or function with external linkage is defined")
> violation.
> 
> Fixes: a16f2b3e0669 ("xen/pmstat: introduce CONFIG_PM_OP")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>


Perhaps a comment with the offending function would have been helpful 
(do_pm_op).

> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -5,6 +5,7 @@
>  #include <xen/errno.h>
>  #include <xen/guest_access.h>
>  #include <xen/lib.h>
> +#include <xen/pmstat.h>
>  #include <xen/sched.h>
> 
>  #include <acpi/cpufreq/cpufreq.h>

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

