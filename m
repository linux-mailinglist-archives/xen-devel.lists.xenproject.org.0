Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17073BA26
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 16:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554360.865509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qChlU-0004wb-Cx; Fri, 23 Jun 2023 14:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554360.865509; Fri, 23 Jun 2023 14:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qChlU-0004u2-9h; Fri, 23 Jun 2023 14:27:56 +0000
Received: by outflank-mailman (input) for mailman id 554360;
 Fri, 23 Jun 2023 14:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNVC=CL=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qChlS-0004tw-NL
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 14:27:54 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22736f85-11d2-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 16:27:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C7117828571D;
 Fri, 23 Jun 2023 09:27:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HF0ZM3S5eC_1; Fri, 23 Jun 2023 09:27:49 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5732B8285A11;
 Fri, 23 Jun 2023 09:27:49 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BplJPdri-zzU; Fri, 23 Jun 2023 09:27:49 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D3EAE828571D;
 Fri, 23 Jun 2023 09:27:48 -0500 (CDT)
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
X-Inumbo-ID: 22736f85-11d2-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5732B8285A11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687530469; bh=GxV8eMSByDnTreP66FXs7edl3xtHz/0BHkjJas6RxrA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=J7ENgDGtZSnOoaY26RzOB5ISHmuO7av/wvlX7qGo7kS4gXxwOcGVKbgm7j+SAVB1D
	 iA34zIaEFk2bEO9PHuW86tCc8dpaCKTO8lN80iboUn5XdAl4ZL9//mZafJZdzMElaS
	 1njcZwLxe/Ha+QNZ+CLaNQcRmIgUng/lNyD4Ah8M=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <0c3f4685-83a6-659a-075b-d5a16b8fa416@raptorengineering.com>
Date: Fri, 23 Jun 2023 09:27:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/3] Early serial on Power
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
 <497fae66-a67c-cd0c-c198-5e54f8ba180a@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <497fae66-a67c-cd0c-c198-5e54f8ba180a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/23/23 1:42 AM, Jan Beulich wrote:
> On 22.06.2023 22:57, Shawn Anastasio wrote:
>> Changes in v2:
>>   - Split main patch into two - one for basic C environment setup and
>>     one for serial
>>   - Mark OpenFirmware functions and early_printk functions as __init and
>>     change boot-of.o to boot-of.init.o in Makefile
>>   - Change <xen/lib.h> include to <xen/stdarg.h> and drop skeleton
>>     headers that are no longer necessary for build as a result
> 
> What is this about? There's no change to non-ppc files here
> according to ...
> 
>>  automation/gitlab-ci/test.yaml           |  20 ++++
>>  automation/scripts/qemu-smoke-ppc64le.sh |  27 +++++
>>  xen/arch/ppc/Kconfig.debug               |   5 +
>>  xen/arch/ppc/Makefile                    |   3 +
>>  xen/arch/ppc/boot-of.c                   | 100 +++++++++++++++++
>>  xen/arch/ppc/configs/ppc64_defconfig     |   1 +
>>  xen/arch/ppc/early_printk.c              |  28 +++++
>>  xen/arch/ppc/include/asm/asm-defns.h     |  53 +++++++++
>>  xen/arch/ppc/include/asm/boot.h          |  23 ++++
>>  xen/arch/ppc/include/asm/byteorder.h     |  12 ++
>>  xen/arch/ppc/include/asm/early_printk.h  |  15 +++
>>  xen/arch/ppc/include/asm/msr.h           |  51 +++++++++
>>  xen/arch/ppc/include/asm/processor.h     | 136 +++++++++++++++++++++++
>>  xen/arch/ppc/include/asm/types.h         |  21 ++++
>>  xen/arch/ppc/ppc64/Makefile              |   1 +
>>  xen/arch/ppc/ppc64/asm-offsets.c         |  55 +++++++++
>>  xen/arch/ppc/ppc64/head.S                |  55 +++++----
>>  xen/arch/ppc/ppc64/of-call.S             |  83 ++++++++++++++
>>  xen/arch/ppc/setup.c                     |  28 +++++
>>  19 files changed, 697 insertions(+), 20 deletions(-)
> 
> ... this. Plus lib.h already includes stdarg.h.

Sorry, that was a bit ambiguous on my part. I meant that I changed

  #include <xen/lib.h>

to

  #include <xen/stdarg.h>

in arch/ppc/boot-of.c to reduce the number of headers
that I needed to create in arch/ppc/include/asm in order for the build
to work. lib.h includes (directly and indirectly) many things from asm/
but stdarg.h is mostly standalone.

> Jan

Thanks,
Shawn

