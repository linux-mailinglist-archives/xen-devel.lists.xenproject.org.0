Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC5915955
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 23:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746951.1154183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLrhW-0006Kp-2f; Mon, 24 Jun 2024 21:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746951.1154183; Mon, 24 Jun 2024 21:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLrhV-0006It-WD; Mon, 24 Jun 2024 21:58:14 +0000
Received: by outflank-mailman (input) for mailman id 746951;
 Mon, 24 Jun 2024 21:58:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sLrhU-0006IX-Dl
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 21:58:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sLrhT-00037z-Op; Mon, 24 Jun 2024 21:58:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sLrhT-0001Ik-I6; Mon, 24 Jun 2024 21:58:11 +0000
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
	bh=H2j+7aMJ5xz3pCbaLK6VeloBVc6DOQDWWUBIkFegLIM=; b=niRBluwOJB/Ds7NBAIIAPJdHkr
	cBYVOr1gyA+oOCxxcpcnU7bKUngKUNh9omFPn8JGvnOz1QI+tjAN4hyjPoqKGLtFrv87KEtdDpAi8
	2Bp5ysaV+7lmwpa4Wfe4tP4+tZE0pok+avI03bj7BujWAyqUsnp+dAd7tMtTuEaWdSME=;
Message-ID: <6f94d071-f90f-485d-a8aa-a0c8a726ce34@xen.org>
Date: Mon, 24 Jun 2024 22:58:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
Content-Language: en-GB
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240621191434.5046-1-tamas@tklengyel.com>
 <20240621191434.5046-2-tamas@tklengyel.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240621191434.5046-2-tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/06/2024 20:14, Tamas K Lengyel wrote:
> The build integration script for oss-fuzz targets.

Do you have any details how this is meant and/or will be used?

I also couldn't find a cover letter. For series with more than one 
patch, it is recommended to have one as it help threading and could also 
give some insight on what you are aiming to do.

> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>   scripts/oss-fuzz/build.sh | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>   create mode 100755 scripts/oss-fuzz/build.sh
> 
> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> new file mode 100755
> index 0000000000..48528bbfc2
> --- /dev/null
> +++ b/scripts/oss-fuzz/build.sh

Depending on the answer above, we may want to consider to create the 
directory oss-fuzz under automation or maybe tools/fuzz/.

> @@ -0,0 +1,22 @@
> +#!/bin/bash -eu
> +# Copyright 2024 Google LLC

I am a bit confused with this copyright. Is this script taken from 
somewhere?

> +#
> +# Licensed under the Apache License, Version 2.0 (the "License");
> +# you may not use this file except in compliance with the License.
> +# You may obtain a copy of the License at
> +#
> +#      http://www.apache.org/licenses/LICENSE-2.0
> +#
> +# Unless required by applicable law or agreed to in writing, software
> +# distributed under the License is distributed on an "AS IS" BASIS,
> +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> +# See the License for the specific language governing permissions and
> +# limitations under the License.
> +#
> +################################################################################
> +
> +cd xen
> +./configure clang=y --disable-stubdom --disable-pvshim --disable-docs --disable-xen

Looking at the help from ./configure, 'clang=y' is not mentioned and it 
doesn't make any difference in the config.log. Can you clarify why this 
was added?

> +make clang=y -C tools/include
> +make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instruction_emulator

Who will be defining $OUT?

Cheers,

-- 
Julien Grall

