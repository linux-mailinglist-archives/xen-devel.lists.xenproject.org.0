Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F95664AE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 10:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360664.590078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8dWD-0003uv-QW; Tue, 05 Jul 2022 08:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360664.590078; Tue, 05 Jul 2022 08:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8dWD-0003rn-ND; Tue, 05 Jul 2022 08:02:49 +0000
Received: by outflank-mailman (input) for mailman id 360664;
 Tue, 05 Jul 2022 08:02:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8dWC-0003rh-7t
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 08:02:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8dWB-0007Ua-40; Tue, 05 Jul 2022 08:02:47 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.0.187])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8dWA-0008Tl-Up; Tue, 05 Jul 2022 08:02:47 +0000
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
	bh=xNuzSen0qi/55KIWt9lgEbU1IbUI3o2yeUpsQRbzYqs=; b=vb2SmmWrFzSFnk+eL5QyVXCOZp
	VyrRf4UXEOIASY90ytyIm0AL8J+Ri+R60+KGHhBXt0fYR3yLEWhs51NsFwDUTYr19bNKamTyEa2Mz
	30k2GeofvyCxiZ2BS2AbrPRB12zI3dGhwl4luZmT3oj1W3mhMjau7d+4QLA8LsRX9E4U=;
Message-ID: <620f2259-25eb-bdac-b894-ca1a661a8d3a@xen.org>
Date: Tue, 5 Jul 2022 09:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2] Xen: fix EFI stub wchar_t size warning of arm32
 building
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220705035405.1283032-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220705035405.1283032-1-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 05/07/2022 04:54, Wei Chen wrote:
> Xen uses "-fshort-wchar" in CFLAGS for EFI common code. Arm32
> is using stub.c of EFI common code for EFI stub functions. But
> "-fshort-wchar" CFLAG will cause a warning when build stub.c
> for Arm32:
> "arm-linux-gnueabihf-ld: warning: arch/arm/efi/built_in.o uses
> 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of
> wchar_t values across objects may fail"
> 
> This is because the "-fshort-wchar" flag causes GCC to generate
> code that is not binary compatible with code generated without
> that flag. Why this warning hasn't been triggered in Arm64 is
> because Arm64 does not use wchar type directly in any code for
> parameters, variables and return values. And in EFI code, wchar
> has been replaced by CHAR16 (the UEFI "abstraction" of wchar_t).
> CHAR16 has been specified as unsigned short type in typedef, the
> "-fshort-wchar" flag will not affect CHAR16. So Arm64 object
> files are exactly the same with "-fshort-wchar" and without
> "-fshort-wchar".
> 
> We are also not using wchar in Arm32 codes, but Arm32 will embed
> ABI information in ".ARM.attributes" section. This section stores
> some object file attributes, like ABI version, CPU arch and etc.
> And wchar size is described in this section by "Tag_ABI_PCS_wchar_t"
> too. Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
> but for object files without "-fshort-wchar" is 4. Arm32 GCC
> ld will check this tag, and throw above warning when it finds
> the object files have different Tag_ABI_PCS_wchar_t values.
> 
> As gnu-efi-3.0 use the GCC option "-fshort-wchar" to force wchar
> to use short integers (2 bytes) instead of integers (4 bytes).
> So keep "-fshort-wchar" for Xen EFI code is reasonable. In this
> patch, we add "-fno-short-wchar" to override "-fshort-wchar" for Arm
> architecutres without EFI enabled to remove above warning.
> 
> Reported-and-Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

