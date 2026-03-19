Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DyWDiLuu2liqQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:37:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892F12CB3B2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257058.1551499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Cd2-0003Gz-42; Thu, 19 Mar 2026 12:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257058.1551499; Thu, 19 Mar 2026 12:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Cd2-0003FW-1B; Thu, 19 Mar 2026 12:37:32 +0000
Received: by outflank-mailman (input) for mailman id 1257058;
 Thu, 19 Mar 2026 12:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6WKi=BT=bounce.vates.tech=bounce-md_30504962.69bbee02.v1-4a2b8f350ce14be786486e83321aca5e@srs-se1.protection.inumbo.net>)
 id 1w3Cd0-0003DN-H6
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 12:37:30 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61347543-2390-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 13:37:24 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fc4w30F2Tz5QkWpq
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 12:37:23 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4a2b8f350ce14be786486e83321aca5e; Thu, 19 Mar 2026 12:37:22 +0000
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
X-Inumbo-ID: 61347543-2390-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773923843; x=1774193843;
	bh=VasXoOCNPjEl5FNB56RHCMircohbyJZHP56MPTs32Ps=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kIhrt3JTlEqmWapdAvtE778Lc3c02FFTqSX8RSCm4L5OSwK120rOZexh/Fb+rXbVT
	 HLSjbHExGcs/5gBzLF3RCxemQjPs81labcdtJmV60yR7JCc/N1touvWEuG2kk1bDbq
	 LGyrYTqZzf0MAgG4cSoq7sDY4RVhhvSkVb8kpqEeOBv1jxLk/K7+2wGhT55OgqqIom
	 g1SAUMM0ENpp+T2sX3Zg/uFosBWH5QyTAgb6mCYd04RxXddsVIhiOCWQ9wYHkpOlzM
	 IIL7WhaRJTXl6mfViQ6X51ilCZ0cpmnFdehDZV51hDSlR1Xtez7GTP+CrLw3qaBfV+
	 0NnRzAW7oPGhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773923843; x=1774184343; i=anthony.perard@vates.tech;
	bh=VasXoOCNPjEl5FNB56RHCMircohbyJZHP56MPTs32Ps=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=McgI4Q2ciafGhCUGwzQ9eKKp5O1WsVaVkWaxHGH5xIXIfDqWy6QAsf4A90tHXrthn
	 4dPvSyB99+mtm4JycckY6pEAIwDLdsqrCtTA2qoiljuC3kf/BoKOEvNXVkK59WSnws
	 46UrwbRO9PJtRhMI6sLfn8y7gZgoKkc6d5I2rrV5DGp2gWuQflyupJeNdz8877ivB/
	 yE9r8PQEHFDitwnq5v7FCGDpJdXpABCMoQeXKlV9qggA5cM+L0fDV75qJDx14EWPYW
	 /oqjU/XcC6G3Ahwd2U76mMAljveZuTR2k5X/hvLREW8Z0agPy9FT1rv3PwVQQMg9n4
	 TJyMcrmJOZB3g==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2010/11]=20tools/xl:=20add=20xl=20commands=20for=20xenstore=20quota=20operations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773923841955
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <abvuAQJkihgFvSzj@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-11-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-11-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4a2b8f350ce14be786486e83321aca5e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 12:37:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCPT_COUNT_TWO(0.00)[2];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.797];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 892F12CB3B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 02:52:07PM +0100, Juergen Gross wrote:
> Add "xl xenstore-quota-get" and "xl xenstore-quota-set" commands for
> retrieving and setting global and per-domain Xenstore quota.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xl/Makefile      |  1 +
>  tools/xl/xl.h          |  2 +
>  tools/xl/xl_cmdtable.c | 10 +++++
>  tools/xl/xl_parse.c    | 25 ++++++++++++
>  tools/xl/xl_parse.h    |  1 +
>  tools/xl/xl_xsquota.c  | 88 ++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 127 insertions(+)
>  create mode 100644 tools/xl/xl_xsquota.c
> 
> diff --git a/tools/xl/Makefile b/tools/xl/Makefile
> index 973ff0e1a2..e4eed8be13 100644
> --- a/tools/xl/Makefile
> +++ b/tools/xl/Makefile
> @@ -24,6 +24,7 @@ XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
>  XL_OBJS += xl_info.o xl_console.o xl_misc.o
>  XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
>  XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o
> +XL_OBJS += xl_xsquota.o
>  
>  $(XL_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
>  $(XL_OBJS): CFLAGS += $(CFLAGS_XL)
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index 9000df00de..0efc07a6ba 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -217,6 +217,8 @@ int main_psr_mba_set(int argc, char **argv);
>  int main_psr_mba_show(int argc, char **argv);
>  #endif
>  int main_qemu_monitor_command(int argc, char **argv);
> +int main_xsquota_get(int argc, char **argv);
> +int main_xsquota_set(int argc, char **argv);
>  
>  void help(const char *command);
>  
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 06a0039718..3de12b12ae 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -649,6 +649,16 @@ const struct cmd_spec cmd_table[] = {
>        "-h print this help\n"
>      },
>  #endif
> +    { "xenstore-quota-get",
> +      &main_xsquota_get, 0, 0,
> +      "List global or domain specific Xenstore quota data",

Maybe saying "quota values" instead of "quota data" would be slightly
better. Or maybe even "quotas" would be enough.

> +      "<Domain>|-g",
> +    },
> +    { "xenstore-quota-set",
> +      &main_xsquota_set, 0, 1,
> +      "Set global or domain specific Xenstore quota data",
> +      "<Domain>|-g <quota>=<val>...",
> +    },
>  };
>  
>  const int cmdtable_len = ARRAY_SIZE(cmd_table);
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1a2ea8b5d5..934ad4eeef 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1314,6 +1314,31 @@ out:
>      return ret;
>  }
>  
> +int parse_xsquota_item(const char *buf, struct libxl_xs_quota_item *item)
> +{
> +    const char *eq;
> +    char *endptr;
> +
> +    eq = strchr(buf, '=');
> +    if (!eq) {
> +        fprintf(stderr, "Quota specification \"%s\" lacks \"=\".\n", buf);
> +        return ERROR_INVAL;
> +    }
> +    errno = 0;
> +    item->name = strndup(buf, eq - buf);
> +    if (!item->name)
> +        return ERROR_NOMEM;
> +    item->val = strtoul(eq + 1, &endptr, 0);
> +    if (errno || !eq[1] || *endptr) {

I think we also need to check that the value returned by strtoul() can
actually be stored in `item->val`. It would be misleading to accept a
quota value and store a different one.

> +        fprintf(stderr,
> +                "Quota specification \"%s\" uses illegal value \"%s\".\n",
> +                buf, eq);
> +        return ERROR_INVAL;
> +    }
> +
> +    return 0;
> +}
> +
>  void parse_config_data(const char *config_source,
>                         const char *config_data,
>                         int config_len,
> diff --git a/tools/xl/xl_parse.h b/tools/xl/xl_parse.h
> index fe0d586cdd..57bb43a067 100644
> --- a/tools/xl/xl_parse.h
> +++ b/tools/xl/xl_parse.h
> @@ -36,6 +36,7 @@ int parse_nic_config(libxl_device_nic *nic, XLU_Config **config, char *token);
>  int parse_vdispl_config(libxl_device_vdispl *vdispl, char *token);
>  int parse_vsnd_item(libxl_device_vsnd *vsnd, const char *spec);
>  int parse_vkb_config(libxl_device_vkb *vkb, char *token);
> +int parse_xsquota_item(const char *buf, struct libxl_xs_quota_item *item);
>  
>  int match_option_size(const char *prefix, size_t len,
>                        char *arg, char **argopt);
> diff --git a/tools/xl/xl_xsquota.c b/tools/xl/xl_xsquota.c
> new file mode 100644
> index 0000000000..eaf19feac8
> --- /dev/null
> +++ b/tools/xl/xl_xsquota.c
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: LGPL-2.1-only */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <libxl.h>
> +#include <libxlutil.h>
> +
> +#include "xl.h"
> +#include "xl_utils.h"
> +#include "xl_parse.h"
> +
> +int main_xsquota_get(int argc, char **argv)
> +{
> +    libxl_xs_quota_set q;
> +    unsigned int i;
> +    int rc;

You should call libxl_xs_quota_set_init(&q). (That would avoid a segv
later, when _disposed() is called.)

> +
> +    if (argc != 2) {
> +        fprintf(stderr, "Domain or \"-g\" must be specified.\n");
> +        return EXIT_FAILURE;
> +    }
> +
> +    if (!strcmp(argv[1], "-g")) {
> +        rc = libxl_xsquota_global_get(ctx, &q);
> +    } else {
> +        uint32_t domid = find_domain(argv[1]);
> +
> +        rc = libxl_xsquota_domain_get(ctx, domid, &q);
> +    }
> +
> +    if (rc) {
> +        fprintf(stderr, "Quota could not be obtained.\n");
> +        return EXIT_FAILURE;
> +    }
> +
> +    printf("Quota name           Quota value\n");
> +    printf("--------------------------------\n");
> +    for (i = 0; i < q.num_quota; i++)
> +        printf("%-20s %8u\n", q.quota[i].name, q.quota[i].val);
> +
> +    libxl_xs_quota_set_dispose(&q);
> +
> +    return EXIT_SUCCESS;
> +}
> +
> +int main_xsquota_set(int argc, char **argv)
> +{
> +    unsigned int i;
> +    libxl_xs_quota_set q;
> +    int rc = EXIT_FAILURE;
> +
> +    if (argc < 3) {
> +        fprintf(stderr, "Not enough parameters.\n");

I think you can call help("xenstore-quota-set") to provide the needed
info about what the parameters are.

> +        return EXIT_FAILURE;
> +    }
> +
> +    q.num_quota = argc - 2;
> +    q.quota = calloc(q.num_quota, sizeof(*q.quota));
> +    if (!q.quota) {
> +        fprintf(stderr, "Memory allocation failure!\n");
> +        goto err;
> +    }

There's `xcalloc() that can be use instead. It does check for memory
allocation failure.

(And that would avoid a segv in libxl_xs_quota_set_dispose() as
num_quota is set before quota is allocated.)


Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


