Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58BA4E4776
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 21:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293651.498921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWl4H-0004GQ-Qt; Tue, 22 Mar 2022 20:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293651.498921; Tue, 22 Mar 2022 20:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWl4H-0004EE-O2; Tue, 22 Mar 2022 20:25:25 +0000
Received: by outflank-mailman (input) for mailman id 293651;
 Tue, 22 Mar 2022 20:25:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWl4G-0004E8-L0
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 20:25:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWl4G-00064D-Ba; Tue, 22 Mar 2022 20:25:24 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.19.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWl4G-0007TA-4o; Tue, 22 Mar 2022 20:25:24 +0000
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
	bh=o6eUexAPgm0QthpRgN4d1XU717SkiJFlC+Cg4JkWoyk=; b=s/qcjNL9Wk9K0HPICpf+sk0r4l
	PREoZKsuoCUwo6zWIQ8mjCJSLEfN4d9Bgk+Lexwo3GQDJL9MvrTD1avHxtQ9VJJcQxaOpSDpojj0i
	mhln1aJl+4PSkSRnRVR3347IvxwOaWPxf0QZbRn/TkIdzE4nIk8C7VjtGPpf7dVCVDng=;
Message-ID: <965e651d-92b1-4d2d-3c05-98b905a772e3@xen.org>
Date: Tue, 22 Mar 2022 20:25:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 07/11] xen: generate hypercall interface related code
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310073420.15622-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/03/2022 07:34, Juergen Gross wrote:
> +table:                             pv32     pv64     hvm32    hvm64    arm
> +set_trap_table                     compat   do       -        -        -
> +mmu_update                         do:1     do:1     -        -        -
> +set_gdt                            compat   do       -        -        -
> +stack_switch                       do:2     do:2     -        -        -
> +set_callbacks                      compat   do       -        -        -
> +fpu_taskswitch                     do       do       -        -        -
> +sched_op_compat                    do       do       -        -        dep
> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +platform_op                        compat   do       compat   do       do
> +#endif
> +set_debugreg                       do       do       -        -        -
> +get_debugreg                       do       do       -        -        -
> +update_descriptor                  compat   do       -        -        -
> +memory_op                          compat   do       hvm      hvm      do
> +multicall                          compat:2 do:2     compat   do       do
> +update_va_mapping                  compat   do       -        -        -
> +set_timer_op                       compat   do       compat   do       -
> +event_channel_op_compat            do       do       -        -        dep
> +xen_version                        compat   do       compat   do       do
> +console_io                         do       do       do       do       do
> +physdev_op_compat                  compat   do       -        -        dep
> +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
> +grant_table_op                     compat   do       hvm      hvm      do
> +#endif
> +vm_assist                          do       do       do       do       do
> +update_va_mapping_otherdomain      compat   do       -        -        -
> +iret                               compat:1 do:1     -        -        -
> +vcpu_op                            compat   do       compat:1 do:1     do
> +set_segment_base                   do:2     do:2     -        -        -
> +#ifdef CONFIG_PV
> +mmuext_op                          compat:2 do:2     compat   do       -
> +#endif
> +xsm_op                             compat   do       compat   do       do
> +nmi_op                             compat   do       -        -        -
> +sched_op                           compat   do       compat   do       do
> +callback_op                        compat   do       -        -        -
> +#ifdef CONFIG_XENOPROF
> +xenoprof_op                        compat   do       -        -        -
> +#endif
> +event_channel_op                   do       do       do:1     do:1     do

On Arm, I expect this hypercall to be the most used one. So I would 
suggest to add ':1'.

Other than that the column for Arm looks good to me:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

