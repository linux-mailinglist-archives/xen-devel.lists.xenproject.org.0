Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D784730C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 16:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675099.1050303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvMH-0002C5-7F; Fri, 02 Feb 2024 15:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675099.1050303; Fri, 02 Feb 2024 15:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvMH-00029d-4X; Fri, 02 Feb 2024 15:21:37 +0000
Received: by outflank-mailman (input) for mailman id 675099;
 Fri, 02 Feb 2024 15:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lYVL=JL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rVvMF-00029T-3I
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 15:21:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfd3d1d2-c1de-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 16:21:34 +0100 (CET)
Received: from [192.168.1.9] (net-188-218-67-100.cust.vodafonedsl.it
 [188.218.67.100])
 by support.bugseng.com (Postfix) with ESMTPSA id 378E04EE0737;
 Fri,  2 Feb 2024 16:21:33 +0100 (CET)
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
X-Inumbo-ID: bfd3d1d2-c1de-11ee-8a43-1f161083a0e0
Message-ID: <117db3f7-698b-47d5-905f-5346a21f0b54@bugseng.com>
Date: Fri, 2 Feb 2024 16:21:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] address violation of MISRA C:2012 Rule 13.1
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Doug Goldstein <cardoe@cardoe.com>
References: <cover.1706700228.git.maria.celeste.cesario@bugseng.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <cover.1706700228.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/24 10:37, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The Xen sources contain violations of MISRA C:2012 Rule 13.1 whose headline states:
> "Initializer lists shall not contain persistent side effects".
> 
> The file properties.json containing function and macro properties is introduced, as
> stated in v2 discussion. Some functions and macros are found to have properties that
> can be exploited by static analyzers. For this reason, the file docs/properties.json
> contains all the needed properties. A description of the json file is documented in
> docs/properties.rst.
> 
> Some persistent effects have been moved outside initializer lists to address violations
> of Rule 13.1.
> 
> Link to the discussion: https://lore.kernel.org/all/cover.1700844359.git.simone.ballarin@bugseng.com/T/#u
> 
> 
> Changes in v3:
> - change prefix from xen to xen/ns16550
> - add assignment of rc in xen/ns16550
> - use rc as controlling expression in the following if-statement
> - change commit prefix from xen/arm to xen
> - specify where saf-3-safe comments are applied in guestcopy.c
> - reword saf comments text
> 
> Maria Celeste Cesario (1):
>    eclair: add and manage properties
> 
> Simone Ballarin (3):
>    xen: add SAF deviation for debugging and logging effects
>    xen/ns16550: address violations of MISRA C:2012 Rule 13.1
>    xen/x86: address violations of MISRA C:2012 Rule 13.1
> 
>   .../eclair_analysis/ECLAIR/analysis.ecl       |   1 +
>   automation/eclair_analysis/prepare.sh         |   2 +
>   docs/misra/safe.json                          |  16 +
>   docs/properties.json                          | 841 ++++++++++++++++++
>   docs/properties.rst                           |  58 ++
>   xen/arch/arm/device.c                         |   1 +
>   xen/arch/arm/guestcopy.c                      |  16 +-
>   xen/arch/x86/hvm/hvm.c                        |   1 +
>   xen/arch/x86/io_apic.c                        |   9 +-
>   xen/arch/x86/mpparse.c                        |   3 +-
>   xen/arch/x86/setup.c                          |   3 +-
>   xen/common/sched/core.c                       |   3 +
>   xen/drivers/char/ns16550.c                    |   4 +-
>   13 files changed, 948 insertions(+), 10 deletions(-)
>   create mode 100644 docs/properties.json
>   create mode 100644 docs/properties.rst
> 

Sorry, patch "eclair: add and manage properties" is incomplete,
please ignore this series: v4 has already been submitted.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


