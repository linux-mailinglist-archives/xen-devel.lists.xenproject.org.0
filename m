Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113391B1F95
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 09:12:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQn4T-0005nR-Hy; Tue, 21 Apr 2020 07:11:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQn4S-0005nM-DE
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 07:11:52 +0000
X-Inumbo-ID: 5eeeeaa4-839f-11ea-910d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5eeeeaa4-839f-11ea-910d-12813bfff9fa;
 Tue, 21 Apr 2020 07:11:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48291AC53;
 Tue, 21 Apr 2020 07:11:49 +0000 (UTC)
Subject: Re: [PATCH] x86: Enumeration for Control-flow Enforcement Technology
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200420190829.17874-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c085f0c-134d-ae56-c529-60ea8e61b1be@suse.com>
Date: Tue, 21 Apr 2020 09:11:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420190829.17874-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 21:08, Andrew Cooper wrote:
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -229,6 +229,7 @@ XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mode Instruction Prevention */
>  XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspace */
>  XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable */
>  XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector Byte Manipulation Instrs */
> +XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
>  XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
>  XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
>  XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Instrs */
> @@ -255,6 +256,7 @@ XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single
>  XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
>  XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
>  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
> +XEN_CPUFEATURE(CET_IBT,       6*32+20) /*   CET - Indirect Branch Tracking */

s/6/9/, moved up a line, and then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I take it you intentionally don't mean to add #CP related bits yet,
first and foremost TRAP_control_flow or some such, as well as its
error code bits? Nor definitions for the bits within the MSRs you
add, nor XSAVE pieces?

Jan

