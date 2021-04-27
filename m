Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B920836C8E1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 17:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118650.224850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbPwL-0004MR-4Z; Tue, 27 Apr 2021 15:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118650.224850; Tue, 27 Apr 2021 15:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbPwL-0004M2-1R; Tue, 27 Apr 2021 15:47:57 +0000
Received: by outflank-mailman (input) for mailman id 118650;
 Tue, 27 Apr 2021 15:47:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbPwJ-0004Lx-V6
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 15:47:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df810926-be53-4f08-9e19-f6c2439c53f6;
 Tue, 27 Apr 2021 15:47:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C80E9B1F6;
 Tue, 27 Apr 2021 15:47:53 +0000 (UTC)
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
X-Inumbo-ID: df810926-be53-4f08-9e19-f6c2439c53f6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619538473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGx66DYCmZHHS7wXrnuhbCi8ZHHXXldxK8v9S5gA9Ig=;
	b=vQfGF+9HosuoWNXk4yG8UE2/d0SQ713DGwynRWOMiSRVjjwFo5V566S2C5wYVjOmcewnT8
	GzsBNFKJMqowOcMRsDJoupldNpO2u6FTkHoHqGja68nbqlZJElRFTRMl9kuAg0yKHmoQY3
	gbPJoOOBdEJ3SDY3ioaJwmJOtrwFqck=
Subject: Re: [PATCH 1/3] x86/hvm: Introduce experimental guest CET support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8bd932d-071a-4a5b-747c-02cbd5e296cd@suse.com>
Date: Tue, 27 Apr 2021 17:47:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210426175421.30497-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 19:54, Andrew Cooper wrote:
> For now, let VMs opt into using CET by setting cet_ss/ibt in the CPUID
> policy.  Also extend cr4 handling to permit CR4.CET being set, along with
> logic to interlock CR4.CET and CR0.WP.
> 
> Everything else will malfunction for now, but this will help adding support
> incrementally - there is a lot to do before CET will work properly.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Just one consideration:

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -232,7 +232,7 @@ XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mode Instruction Prevention */
>  XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspace */
>  XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable */
>  XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector Byte Manipulation Instrs */
> -XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
> +XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*h  CET - Shadow Stacks */
>  XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
>  XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
>  XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Instrs */
> @@ -267,7 +267,7 @@ XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS.
>  XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
>  XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
>  XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
> -XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
> +XEN_CPUFEATURE(CET_IBT,       9*32+20) /*h  CET - Indirect Branch Tracking */
>  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
>  XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
>  XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */

If by the time 4.16 finishes up the various todo items haven't been
taken care of, should we take note to undo these markings? I would
have suggested allowing them for debug builds only, but that's kind
of ugly to achieve in a public header.

Jan

