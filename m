Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2FD710968
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 12:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539509.840460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27nZ-0004qm-Vv; Thu, 25 May 2023 10:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539509.840460; Thu, 25 May 2023 10:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27nZ-0004oa-TB; Thu, 25 May 2023 10:02:21 +0000
Received: by outflank-mailman (input) for mailman id 539509;
 Thu, 25 May 2023 10:02:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q27nY-0004n3-2u
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 10:02:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q27nX-00021m-HJ; Thu, 25 May 2023 10:02:19 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.224]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q27nX-0000U3-99; Thu, 25 May 2023 10:02:19 +0000
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
	bh=+ujPelSO20CPR8bWPE/O1k8/qxE3zzgkrkPbPkX6ELg=; b=4GQ7foU/SfmM6f+0WtaKltqSkQ
	326Vdx60tRQvR5xQAXM4Z/izgxobfaS1lG7iUpxpP7WVxdTI/1FssLU0WIc5YslMUuO1SIo2WS0Aj
	QleYGA4ZAF5Tgzkjzi0jxCBtnu0rZ7sxTGJKeGUWmL2fqrOf3tSbCaPZtFphc3+noe7o=;
Message-ID: <af5588fe-6c76-6cb2-2d35-9caf0914de15@xen.org>
Date: Thu, 25 May 2023 11:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [XEN v7 06/11] xen: dt: Replace u64 with uint64_t as the callback
 function parameters for dt_for_each_range()
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com, michal.orzel@amd.com
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
 <20230518143920.43186-7-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230518143920.43186-7-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 18/05/2023 15:39, Ayan Kumar Halder wrote:
> In the callback functions invoked by dt_for_each_range() ie handle_pci_range(),
> map_range_to_domain(), 'u64' should be replaced with 'uint64_t' as the data type
> for the parameters. The reason being Xen coding style mentions that u32/u64
> should be avoided.
> 
> Also dt_for_each_range() invokes the callback functions with 'uint64_t'
> arguments. Thus, is_bar_valid() needs to change the parameter types accordingly.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

