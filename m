Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219C8843ADF
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 10:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673857.1048360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6jy-0000xY-9h; Wed, 31 Jan 2024 09:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673857.1048360; Wed, 31 Jan 2024 09:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6jy-0000um-6z; Wed, 31 Jan 2024 09:18:42 +0000
Received: by outflank-mailman (input) for mailman id 673857;
 Wed, 31 Jan 2024 09:18:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rV6jw-0000ue-Rp
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 09:18:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rV6jv-00010Y-La; Wed, 31 Jan 2024 09:18:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rV6jv-0002JS-EI; Wed, 31 Jan 2024 09:18:39 +0000
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
	bh=2A4dInAeKY4pI4uVLsSq9t6AkulXf1MnA3dt7v6K63A=; b=m3ulKwn/x4gxKuFlFbbBqGrJVm
	U55FDWATwq9TS+txQyYMyMCEbIG2bRkdcAND6hizxdZxSru9YLKqQJ704/fEnBFF6tmJGpsk1SeHV
	rSvzED3YSTYz4bu5+KDn0x3oW629ccbeX9usMha0QX8tg44acNTk5CHleF28dEGK+x/0=;
Message-ID: <c42df9e7-37ec-4835-b10e-307eefbe28fc@xen.org>
Date: Wed, 31 Jan 2024 09:18:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/*/asm-offset: Fix bad copy&paste from x86
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20240130222808.106006-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240130222808.106006-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 30/01/2024 22:28, Andrew Cooper wrote:
> All architectures have copy&pasted bad logic from x86.
> 
> OFFSET() having a trailing semi-colon within the macro expansion can be a
> problematic pattern.  It's benign in this case, but fix it anyway.
> 
> Perform style fixes for the other macros, and tame the mess of BLANK()
> position to be consistent (one BLANK() after each block) so the intermediate
> form is legible too.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With Jan's comments addressed on the Arm side as well:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

