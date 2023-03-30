Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75636D1104
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 23:47:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516904.801787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi06y-0007IH-Fu; Thu, 30 Mar 2023 21:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516904.801787; Thu, 30 Mar 2023 21:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi06y-0007Ga-Cw; Thu, 30 Mar 2023 21:47:12 +0000
Received: by outflank-mailman (input) for mailman id 516904;
 Thu, 30 Mar 2023 21:47:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pi06x-0007GU-Gj
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 21:47:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pi06x-0003td-0C; Thu, 30 Mar 2023 21:47:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pi06w-0004hr-R2; Thu, 30 Mar 2023 21:47:10 +0000
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
	bh=97g3XpLbWw5XWFYatjuYCInqYISRqOwIfCv15mU9DD0=; b=nkoaAL713zUa+IHu6Zrjeih3Bp
	myZpbBofVmMrkf/vDNZTc0hJVnfulJnM3+sDhckqXABvFB3WzDQAgAXp4Cr/jAVbWZ4cEc4neJzZV
	DOh7F9I7KAgniQQeq721cv5+H/qLo0TUctvJy6b4zLKB75aSq/s9Y7gmanw5y1uWF60Y=;
Message-ID: <f8507422-884b-5510-444a-ee87bf97eba9@xen.org>
Date: Thu, 30 Mar 2023 22:47:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN v4 10/11] xen/arm: p2m: Use the pa_range_info table to
 support Arm_32 and Arm_64
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-11-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230321140357.24094-11-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/03/2023 14:03, Ayan Kumar Halder wrote:
>       /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
>       for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
> @@ -2324,14 +2323,13 @@ void __init setup_virt_paging(void)
>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
>           panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
>   
> -    val |= VTCR_PS(pa_range);
> +#ifdef CONFIG_ARM_64
>       val |= VTCR_TG0_4K;
> +    val |= VTCR_PS(pa_range);
>   
>       /* Set the VS bit only if 16 bit VMID is supported. */
>       if ( MAX_VMID == MAX_VMID_16_BIT )
>           val |= VTCR_VS;
> -    val |= VTCR_SL0(pa_range_info[pa_range].sl0);
> -    val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
>   
>       p2m_root_order = pa_range_info[pa_range].root_order;
>       p2m_root_level = 2 - pa_range_info[pa_range].sl0;

As mentioned in the next patch, this now wants to be outside of the 
ARM_64 specific section because at least the root order will be 
different. The root level is the same, but I think you would be better 
if this is moved out at the same time.

Cheers,

-- 
Julien Grall

