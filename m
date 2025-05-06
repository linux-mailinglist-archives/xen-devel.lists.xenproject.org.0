Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75CAACB79
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977606.1364565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLU8-0003IB-Ml; Tue, 06 May 2025 16:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977606.1364565; Tue, 06 May 2025 16:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLU8-0003Fo-Jv; Tue, 06 May 2025 16:49:36 +0000
Received: by outflank-mailman (input) for mailman id 977606;
 Tue, 06 May 2025 16:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sZVp=XW=bounce.vates.tech=bounce-md_30504962.681a3d8c.v1-27e1172defaa4476915b7f165b02826a@srs-se1.protection.inumbo.net>)
 id 1uCLU7-0003Fi-3T
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:49:35 +0000
Received: from mail137-14.atl71.mandrillapp.com
 (mail137-14.atl71.mandrillapp.com [198.2.137.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ce942c7-2a9a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:49:25 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-14.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4ZsPW01ZkHz705qnc
 for <xen-devel@lists.xenproject.org>; Tue,  6 May 2025 16:49:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 27e1172defaa4476915b7f165b02826a; Tue, 06 May 2025 16:49:16 +0000
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
X-Inumbo-ID: 0ce942c7-2a9a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1746550156; x=1746820156;
	bh=94gLD2TU1RziIJLzd2SkFBfyeSw38UC4+1m8vKkod+s=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gvSxgsxmUAqSdu50SPG1dOvguybcl5hcgVq5Y8yiKHe1JeZyaoTqKqD2kjAHBp52L
	 Six+6R1WAbTl2PDPDepXgDcIhN6urQctIPtQaxfXrqLq0xZTrzigEdElgWCQm4hLIJ
	 vr9scK2cWjK9QpV5b6Gp39M3DhwhViYS2fIaxIvQJZBrQPNU4PJmU3OHFtWkxdvGzM
	 E9P+xgsUQ7sxNhECxFCJ14w0T+8LO9cysXA5ra74hthgHkFTiCuu4rcoNTvH5i3duu
	 Zbtwrmr/UiGoMtvalIX9MIrcgSdKD1m5O/Y2HHV8IbDzwrrjG/TTSwJNmHYSset8gH
	 NAZ0FnDVB98uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1746550156; x=1746810656; i=teddy.astie@vates.tech;
	bh=94gLD2TU1RziIJLzd2SkFBfyeSw38UC4+1m8vKkod+s=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=p423RydLrFi3K7uY16uxnU0iJW7Vwn9W5YSNQjUV1QFbAebofG9xXhunvx13zAbxL
	 sdL97jbcVTP/Z4HTWqPfslvT7AkFH8QvwLUBxap/7Hlwju/TbO10QlMDmynPoLoWJF
	 DBEuHFNKcqVL9SbDMCYs/8zYYSss0HoCY4eUBz5qjT0RfdM/jaywtA49rvDUSW3uSQ
	 /vbkQpcclssiVSDEypomd1X2pimv/nWMWOoZyHQONPCj/lV98YYFI0Ibrcz8CRXvyK
	 4BLR+JgNMuZJj+jJYyMtLm1bSPmYbORVxgdSxHSK58ssNsnm3fMkGRIAc56Nl7CotD
	 iUmdKHV+N6XgA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=203/4]=20Add=20lockdown=20mode?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1746550154364
Message-Id: <c853b996-76ea-405c-aee0-b4a26dc149fa@vates.tech>
To: "Kevin Lampis" <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
Cc: "Ross Lagerwall" <ross.lagerwall@citrix.com>
References: <20250506162510.1676425-1-kevin.lampis@cloud.com>
In-Reply-To: <20250506162510.1676425-1-kevin.lampis@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.27e1172defaa4476915b7f165b02826a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250506:md
Date: Tue, 06 May 2025 16:49:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Kevin,

Le 06/05/2025 =C3=A0 18:32, Kevin Lampis a =C3=A9crit=C2=A0:
> The intention of lockdown mode is to prevent attacks from a rogue dom0
> userspace from compromising the system. Lockdown mode can be controlled b=
y a
> Kconfig option and a command-line parameter.

What is the effective effect of such mode ? How does it protect the 
hypervisor from Dom0 ?
(I can't find the PATCH 4/4 which seems to give a explanation)

  It is also enabled automatically
> when Secure Boot is enabled and it cannot be disabled in that case.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> ---
>   xen/arch/x86/setup.c       |  1 +
>   xen/common/Kconfig         |  8 ++++++
>   xen/common/Makefile        |  1 +
>   xen/common/kernel.c        |  3 +++
>   xen/common/lockdown.c      | 52 ++++++++++++++++++++++++++++++++++++++
>   xen/include/xen/lockdown.h |  9 +++++++
>   6 files changed, 74 insertions(+)
>   create mode 100644 xen/common/lockdown.c
>   create mode 100644 xen/include/xen/lockdown.h
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 2518954124..276957c4ed 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -15,6 +15,7 @@
>   #include <xen/kexec.h>
>   #include <xen/keyhandler.h>
>   #include <xen/lib.h>
> +#include <xen/lockdown.h>
>   #include <xen/multiboot.h>
>   #include <xen/nodemask.h>
>   #include <xen/numa.h>
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 4bec78c6f2..63ff37d046 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -596,4 +596,12 @@ config BUDDY_ALLOCATOR_SIZE
>   =09  Amount of memory reserved for the buddy allocator to serve Xen hea=
p,
>   =09  working alongside the colored one.
>   
> +config LOCKDOWN_DEFAULT
> +=09bool "Enable lockdown mode by default"
> +=09default n
> +=09help
> +=09  Lockdown mode prevents attacks from a rogue dom0 userspace from
> +=09  compromising the system. This is automatically enabled when Secure
> +=09  Boot is enabled.
> +
>   endmenu
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 98f0873056..b00a8a925a 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_KEXEC) +=3D kexec.o
>   obj-$(CONFIG_KEXEC) +=3D kimage.o
>   obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o livepatch_elf.o
>   obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
> +obj-y +=3D lockdown.o
>   obj-$(CONFIG_VM_EVENT) +=3D mem_access.o
>   obj-y +=3D memory.o
>   obj-y +=3D multicall.o
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index 8b63ca55f1..6658db9514 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -216,6 +216,9 @@ static void __init _cmdline_parse(const char *cmdline=
)
>    */
>   void __init cmdline_parse(const char *cmdline)
>   {
> +    /* Call this early since it affects command-line parsing */
> +    lockdown_init(cmdline);
> +
>       if ( opt_builtin_cmdline[0] )
>       {
>           printk("Built-in command line: %s\n", opt_builtin_cmdline);
> diff --git a/xen/common/lockdown.c b/xen/common/lockdown.c
> new file mode 100644
> index 0000000000..935911dfd0
> --- /dev/null
> +++ b/xen/common/lockdown.c
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/efi.h>
> +#include <xen/kernel.h>
> +#include <xen/lockdown.h>
> +#include <xen/param.h>
> +#include <xen/string.h>
> +
> +static bool __ro_after_init lockdown =3D IS_ENABLED(CONFIG_LOCKDOWN_DEFA=
ULT);
> +ignore_param("lockdown");
> +
> +bool is_locked_down(void)
> +{
> +    return lockdown;
> +}
> +
> +void __init lockdown_init(const char *cmdline)
> +{
> +    if ( efi_secure_boot )
> +    {
> +        printk("Enabling lockdown mode because Secure Boot is enabled\n"=
);
> +        lockdown =3D true;
> +    }
> +    else
> +    {
> +        while ( *cmdline )
> +        {
> +            size_t param_len, name_len;
> +            int ret;
> +
> +            cmdline +=3D strspn(cmdline, " \n\r\t");
> +            param_len =3D strcspn(cmdline, " \n\r\t");
> +            name_len =3D strcspn(cmdline, "=3D \n\r\t");
> +
> +            if ( !strncmp(cmdline, "lockdown", max(name_len, strlen("loc=
kdown"))) ||
> +                 !strncmp(cmdline, "no-lockdown", max(name_len, strlen("=
no-lockdown"))) )
> +            {
> +                ret =3D parse_boolean("lockdown", cmdline, cmdline + par=
am_len);
> +                if ( ret >=3D 0 )
> +                {
> +                    lockdown =3D ret;
> +                    printk("Lockdown mode set from command-line\n");
> +                    break;
> +                }
> +            }
> +
> +            cmdline +=3D param_len;
> +        }
> +    }
> +
> +    printk("Lockdown mode is %s\n", lockdown ? "enabled" : "disabled");
> +}

With
> Kevin Lampis (1):
>   Disallow most command-line options when lockdown mode is enabled

I am not convinced of the efficiency of being able to toggle lockdown 
(including disabling it) mode from command-line. In case the userland 
can hijack the cmdline, I can't see what would prevent it from setting 
no-lockdown, which will disable the lockdown mode (also overriding 
CONFIG_LOCKDOWN_DEFAULT).

> diff --git a/xen/include/xen/lockdown.h b/xen/include/xen/lockdown.h
> new file mode 100644
> index 0000000000..b2baa31caa
> --- /dev/null
> +++ b/xen/include/xen/lockdown.h
> @@ -0,0 +1,9 @@
> +#ifndef XEN__LOCKDOWN_H
> +#define XEN__LOCKDOWN_H
> +
> +#include <xen/types.h>
> +
> +bool is_locked_down(void);
> +void lockdown_init(const char *cmdline);
> +
> +#endif /* XEN__LOCKDOWN_H */

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



