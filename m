Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA9AF6EE0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 11:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031899.1405630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGMS-0003ID-Ph; Thu, 03 Jul 2025 09:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031899.1405630; Thu, 03 Jul 2025 09:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGMS-0003Fv-MW; Thu, 03 Jul 2025 09:36:08 +0000
Received: by outflank-mailman (input) for mailman id 1031899;
 Thu, 03 Jul 2025 09:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eSYZ=ZQ=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uXGMR-0003F9-0U
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 09:36:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 240427d6-57f1-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 11:36:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F86212FC;
 Thu,  3 Jul 2025 02:35:50 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.57.66.247])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D5C33F58B;
 Thu,  3 Jul 2025 02:36:03 -0700 (PDT)
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
X-Inumbo-ID: 240427d6-57f1-11f0-a314-13f23c93f187
Date: Thu, 3 Jul 2025 10:36:00 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 2/4] tools/xl: allow resume command compilation for arm
Message-ID: <samojvqwyzyw5w5lhophijhjiaqh6uzgk5ixg23gowdbl7leae@hw3g24vf3zus>
References: <cover.1751020456.git.mykola_kvach@epam.com>
 <00c495b471c09a84601156b2b74a1ba897f51755.1751020456.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00c495b471c09a84601156b2b74a1ba897f51755.1751020456.git.mykola_kvach@epam.com>

Hi Mykola,

> On Fri, Jun 27, 2025 at 01:51:31PM +0000, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The "xl resume" command was previously excluded from ARM builds because
> system suspend/resume (e.g., `SYSTEM_SUSPEND`) via vPSCI was not
> implemented. On x86, the command is used for ACPI S3 suspend/resume.
> 
> This change enables compilation of `xl resume` on ARM regardless of the
> underlying implementation status, making the tool available for use in
> testing or for future support. The libxl infrastructure and handler
> functions are already present and usable.
> 
> Note: This does not imply full system suspend/resume support on ARM.
>       "xl suspend" command still not work for arm platforms.

NIT: Last sentence should perhaps be: 'The "xl suspend" command still
does not work on Arm platforms.'

> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  tools/include/libxl.h   |  1 -
>  tools/xl/xl.h           |  2 +-
>  tools/xl/xl_cmdtable.c  |  2 +-
>  tools/xl/xl_vmcontrol.c | 12 ++++++------
>  4 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index a8704e0268..0fda8bb616 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1134,7 +1134,6 @@ typedef struct libxl__ctx libxl_ctx;
>   * restoring or migrating a domain. In this case the related functions
>   * should be expected to return failure. That is:
>   *  - libxl_domain_suspend
> - *  - libxl_domain_resume
>   *  - libxl_domain_remus_start
>   */
>  #if defined(__arm__) || defined(__aarch64__)

The Macro being documented above, and defined below, this ^^^ section of
the diff, is called `LIBXL_HAVE_NO_SUSPEND_RESUME`. Now it no longer
indicates lack of support for libxl_domain_resume is it better renamed
something like `LIBXL_HAVE_NO_SUSPEND`?

> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index 45745f0dbb..5b0a481456 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -130,8 +130,8 @@ int main_migrate_receive(int argc, char **argv);
>  int main_save(int argc, char **argv);
>  int main_migrate(int argc, char **argv);
>  int main_suspend(int argc, char **argv);
> -int main_resume(int argc, char **argv);
>  #endif

NIT: Could take the opportunity to add comment after `#endif`?
+ #endif /* LIBXL_HAVE_NO_SUSPEND_RESUME */
(Or LIBXL_HAVE_NO_SUSPEND if renamed)

> +int main_resume(int argc, char **argv);
>  int main_dump_core(int argc, char **argv);
>  int main_pause(int argc, char **argv);
>  int main_unpause(int argc, char **argv);
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 06a0039718..4f662a4189 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -198,12 +198,12 @@ const struct cmd_spec cmd_table[] = {
>        "Suspend a domain to RAM",
>        "<Domain>",
>      },
> +#endif

NIT: Same as above.

>      { "resume",
>        &main_resume, 0, 1,
>        "Resume a domain from RAM",
>        "<Domain>",
>      },
> -#endif
>      { "dump-core",
>        &main_dump_core, 0, 1,
>        "Core dump a domain",
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index c813732838..ebacde5482 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -38,11 +38,6 @@ static void suspend_domain(uint32_t domid)
>      libxl_domain_suspend_only(ctx, domid, NULL);
>  }
>  
> -static void resume_domain(uint32_t domid)
> -{
> -    libxl_domain_resume(ctx, domid, 1, NULL);
> -}
> -
>  int main_suspend(int argc, char **argv)
>  {
>      int opt;
> @@ -55,6 +50,12 @@ int main_suspend(int argc, char **argv)
>  
>      return EXIT_SUCCESS;
>  }
> +#endif

NIT: Same as above.

> +
> +static void resume_domain(uint32_t domid)
> +{
> +    libxl_domain_resume(ctx, domid, 1, NULL);
> +}
>  
>  int main_resume(int argc, char **argv)
>  {
> @@ -68,7 +69,6 @@ int main_resume(int argc, char **argv)
>  
>      return EXIT_SUCCESS;
>  }
> -#endif
>  
>  static void pause_domain(uint32_t domid)
>  {

Many thanks,

Hari

