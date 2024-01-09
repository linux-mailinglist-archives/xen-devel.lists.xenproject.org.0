Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32382895B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664743.1034870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNENG-00009A-1O; Tue, 09 Jan 2024 15:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664743.1034870; Tue, 09 Jan 2024 15:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNENF-00006h-Tu; Tue, 09 Jan 2024 15:50:41 +0000
Received: by outflank-mailman (input) for mailman id 664743;
 Tue, 09 Jan 2024 15:50:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rNEND-00006b-Qx
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:50:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNEND-000314-Kv; Tue, 09 Jan 2024 15:50:39 +0000
Received: from [15.248.2.151] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNEND-0001Vn-E0; Tue, 09 Jan 2024 15:50:39 +0000
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
	bh=peRqcZSmXsmG1QrIEOkzCTVBqwdXs+OLvD2zPyypUV4=; b=DsMWgqhe0byJX2Vj0lU3X3bQC4
	oxZJIEuiNWZCG1DPcXjIXkgdNIm5c6nyItoMbVTb6KdkbIH7BwgCuK13cVI1wEkYXSd6m+8BpQLOl
	n2MKHIu83ULY6Bgul/D33+jCF8s8m2uQRcNNY4ljdHn+Oyn67XoL2iWCmxECm30RRPyQ=;
Message-ID: <6fe36a67-b798-42a7-8eab-07b154cfd781@xen.org>
Date: Tue, 9 Jan 2024 15:50:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18 v1] xen/common: Don't dereference overlay_node
 after checking that it is NULL
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <6b2db92de764b6031647926d27cb14dd455eff7d.1704809355.git.javi.merino@cloud.com>
 <e579994b-80ff-42db-bf57-6c6068fca902@xen.org>
 <4pfn6xyqw2eum4hokedzeqzvteyrwjokynt2zxq6wesaxfwzsp@cfk6iab3etey>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4pfn6xyqw2eum4hokedzeqzvteyrwjokynt2zxq6wesaxfwzsp@cfk6iab3etey>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Javi,

On 09/01/2024 15:42, Javi Merino wrote:
> On Tue, Jan 09, 2024 at 03:31:55PM +0000, Julien Grall wrote:
>> Hi Javi,
>>
>> Title: Any reason this is titled for-4.18? Shouldn't this patch also be
>> merged in staging?
> 
> This is for staging and 4.18.  If the tag "for-4.18" meant "this is
> only for 4.18", then that's not what I meant.  Sorry for that.

We usually use "for-4.XX" during code freeze to indicate whether a patch 
should be part of the upcoming relase of the next week. Hence my confusion.

Outside of the code freeze, we sometimes add the tag "Backport: 4.XX+" 
just above the Signed-off-by in addition to the Fixes tag to indicate 
how far the backport should go. The Fixes tag is also sufficient.

As a side node, this is fixing experimental code. So in general we would 
not backport such patch (we only do backport for supported features). 
This is because there are no guarantee that an experimental would not 
crash Xen.

Although, the tag is still useful for downstream that may have decided 
to take the patch in (I think AMD/Xilinx is using them) and accept some 
of the risks.

Stefano is the person doing the backport for Arm. So I will let him 
decide whether he wants to backport it.

Cheers,

-- 
Julien Grall

