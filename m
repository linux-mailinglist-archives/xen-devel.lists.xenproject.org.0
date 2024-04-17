Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C778A86E0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 17:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707610.1105678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6mu-0007Wo-TI; Wed, 17 Apr 2024 15:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707610.1105678; Wed, 17 Apr 2024 15:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6mu-0007Tc-QZ; Wed, 17 Apr 2024 15:01:28 +0000
Received: by outflank-mailman (input) for mailman id 707610;
 Wed, 17 Apr 2024 15:01:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rx6mt-0007TW-WA
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 15:01:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx6mt-0007tg-Pb; Wed, 17 Apr 2024 15:01:27 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx6mt-0006jv-Cv; Wed, 17 Apr 2024 15:01:27 +0000
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
	bh=Mz2BNOBbuoQMNw57CkNsIiWe2ZdYOkC9MWy5EmWJf8M=; b=Qe50fbdK7LDXZB87eJ18iHjl8G
	/+y8Z+kPt+oKk3513nkxyC9yAUE/fKdkG8R89YaIYGRojuDkngsY9umQO79ciN2AqZpfvHBgUAohQ
	Z4TQ+QOf+5JpziWspnsNU1M/ceKSMm+2L3I1FsINNnemOOdGw2tyVLppdAlAXlXr3SLE=;
Message-ID: <b76bc307-6cf6-443f-80de-d27852ede25f@xen.org>
Date: Wed, 17 Apr 2024 16:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs/misra: add R21.6 R21.14 R21.15 R21.16
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 16/04/2024 20:27, Stefano Stabellini wrote:
> Also add two specific project-wide deviations for R21.6 and R21.15.

In general, I am fine with add the two rules. However...

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 32b02905d1..9123c8edb5 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -387,6 +387,22 @@ Deviations related to MISRA C:2012 Rules:
>          of the Rule due to uses of this macro.
>        - Tagged as `deliberate` for ECLAIR.
>   
> +   * - R21.6
> +     - The use of snprintf() and vsnprintf() is justifiable as, despite
> +       the fact that such functions have the same names of the
> +       corresponding standard library functions, each configuration of
> +       Xen has a unique implementation for them; the code implementing
> +       such functions is subject to the analysis, so that any undefined
> +       or unspecified behavior associated to them falls under the
> +       responsibility of other MISRA guidelines
> +     - Tagged as `safe` for ECLAIR.

... this implies that ECLAIR should be modified. But this is not 
happening in this patch. Looking at history, we tend to keep 
deviations.rst in sync with ECLAIR, so I think it should be updated here 
too.

Cheers,

-- 
Julien Grall

