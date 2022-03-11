Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034B4D6884
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 19:37:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289217.490710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSk8y-0006T6-Oc; Fri, 11 Mar 2022 18:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289217.490710; Fri, 11 Mar 2022 18:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSk8y-0006Qw-KJ; Fri, 11 Mar 2022 18:37:40 +0000
Received: by outflank-mailman (input) for mailman id 289217;
 Fri, 11 Mar 2022 18:37:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSk8x-0006Qq-Tv
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 18:37:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSk8x-0006yx-0H; Fri, 11 Mar 2022 18:37:39 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.95.172.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSk8w-0007Ns-QL; Fri, 11 Mar 2022 18:37:38 +0000
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
	bh=CZ63bL1kLAFWObhhg+hdAzn1RIjFwUrgLCaNdMJq8o4=; b=pH2XgbtNW7id6PMDCQKeTjc02+
	55KfRtJTpIqxQOHplY5zGdU2gKgBoVUj/bqXQzqG57u4QZjHf6DGHcAcW7XxFc9NP36G23Y7vpqYk
	M1dwT2zfGazVc68ovbEmHba7/vIulDdwUYyVUiie/v37g1xVPSKOCBGwWkI/ulmkJJMw=;
Message-ID: <7bfe438f-a200-8c80-c81d-632d90fe8430@xen.org>
Date: Fri, 11 Mar 2022 18:37:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN v10 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, stefanos@xilinx.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, paul@xen.org, roger.pau@citrix.com
References: <20220310174501.62040-1-ayankuma@xilinx.com>
 <20220310174501.62040-5-ayankuma@xilinx.com>
 <alpine.DEB.2.22.394.2203101813030.3261@ubuntu-linux-20-04-desktop>
 <347bda39-2eed-6139-222d-3924bf286f08@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <347bda39-2eed-6139-222d-3924bf286f08@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/03/2022 13:21, Ayan Kumar Halder wrote:
> enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>                                mmio_info_t *info)
> {
>      struct vcpu *v = current;
>      const struct mmio_handler *handler = NULL;
>      int rc;
> 
>      ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> 
>      if ( !info->dabt.valid )
>      {
>          ASSERT_UNREACHABLE();
>          return IO_ABORT;
>      }
> 
>      handler = find_mmio_handler(v->domain, info->gpa);
>      if ( !handler )
>      {
> 
> #ifdef CONFIG_IOREQ_SERVER
> 
>      struct vcpu_io *vio = &v->io;
>      const struct instr_details instr = info->dabt_instr;
>      struct hsr_dabt dabt = info->dabt;
>      ioreq_t p = {
>          .type = IOREQ_TYPE_COPY,
>          .addr = info->gpa,
>          .size = 1 << info->dabt.size,
>          .count = 1,
>          .dir = !info->dabt.write,
>          /*
>           * On x86, df is used by 'rep' instruction to tell the direction
>           * to iterate (forward or backward).
>           * On Arm, all the accesses to MMIO region will do a single
>           * memory access. So for now, we can safely always set to 0.
>           */
>          .df = 0,
>          .data = get_user_reg(regs, info->dabt.reg),
>          .state = STATE_IOREQ_READY,
>      };
>      struct ioreq_server *s = NULL;
>      enum io_state rc;
> 
>      if ( vio->req.state != STATE_IOREQ_NONE )
>      {
>          gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
>          return IO_ABORT;
>      }
> 
>      s = ioreq_server_select(v->domain, &p);
>      if ( !s )
>          return IO_UNHANDLED;
> 
>      if ( instr.state == INSTR_CACHE )
>      {
>          return IO_HANDLED;
>      }
> 
>      rc = try_fwd_ioserv(vio, &p, s);
>      if ( rc == IO_HANDLED )
>          return handle_ioserv(regs, v);
> 
> #endif
>          return rc;
>      }
> 
> I am not be inclined to have "#ifdef CONFIG_IOREQ_SERVER" in 
> xen/xen/arch/arm/io.c as the file is generic.

+1. I much prefer your first approach.

Cheers,

-- 
Julien Grall

