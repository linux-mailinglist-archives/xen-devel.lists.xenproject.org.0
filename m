Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88734DE0DB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 19:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292180.496246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVH7p-0001o3-Ny; Fri, 18 Mar 2022 18:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292180.496246; Fri, 18 Mar 2022 18:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVH7p-0001kd-Ks; Fri, 18 Mar 2022 18:14:57 +0000
Received: by outflank-mailman (input) for mailman id 292180;
 Fri, 18 Mar 2022 18:14:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVH7n-0001kX-Td
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 18:14:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVH7n-0007qp-Cn; Fri, 18 Mar 2022 18:14:55 +0000
Received: from [54.239.6.185] (helo=[192.168.15.239])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVH7n-0006AO-5y; Fri, 18 Mar 2022 18:14:55 +0000
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
	bh=XbPLyCjUOg10ZAMRen5wN1VndU41gtFE4jklhfjIEX8=; b=NKxeFhEsGMMjOELPByvO86Ke7N
	3a0PlRM6sAs44jKvs8pjLkXknvZSgzx9NVeQvAYU+GtnIhYGpUMLcRTDkZMBQ3j5hZKicMo0BjGdu
	M4YCm90bLO1niTStncDwUogb/mrm5AyBq9igWREIQ3mhw6TvEhuAtDHYbCDl2A7WFWUQ=;
Message-ID: <bdb328d5-5fc4-e001-9bd6-6542d8f93c71@xen.org>
Date: Fri, 18 Mar 2022 18:14:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v11 1/3] xen/arm64: io: Emulate instructions (with invalid
 ISS) on MMIO region
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220317140046.64563-1-ayankuma@xilinx.com>
 <20220317140046.64563-2-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220317140046.64563-2-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 17/03/2022 14:00, Ayan Kumar Halder wrote:
> When an instruction is trapped in Xen due to translation fault, Xen
> checks if the ISS is invalid (for data abort) or it is an instruction
> abort. If so, Xen tries to resolve the translation fault using p2m page
> tables. In case of data abort, Xen will try to map the mmio region to
> the guest (ie tries to emulate the mmio region).
> 
> If the ISS is not valid and it is a data abort, then Xen tries to
> decode the instruction. In case of ioreq, Xen  saves the decoding state,
> rn and imm9 to vcpu_io. Whenever the vcpu handles the ioreq successfully,
> it will read the decoding state to determine if the instruction decoded
> was a ldr/str post indexing (ie INSTR_LDR_STR_POSTINDEXING). If so, it
> uses these details to post increment rn.
> 
> In case of mmio handler, if the mmio operation was successful, then Xen
> retrives the decoding state, rn and imm9. For state ==
> INSTR_LDR_STR_POSTINDEXING, Xen will update rn.
> 
> If there is an error encountered while decoding/executing the instruction,
> Xen will forward the abort to the guest.
> 
> Also, the logic to infer the type of instruction has been moved from
> try_handle_mmio() to try_decode_instruction() which is called before.
> try_handle_mmio() is solely responsible for handling the mmio operation.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

