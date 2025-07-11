Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7B0B0160E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 10:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040658.1412031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua97u-0001lD-Fv; Fri, 11 Jul 2025 08:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040658.1412031; Fri, 11 Jul 2025 08:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua97u-0001is-DH; Fri, 11 Jul 2025 08:29:02 +0000
Received: by outflank-mailman (input) for mailman id 1040658;
 Fri, 11 Jul 2025 08:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3oyx=ZY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ua97s-0001im-N9
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 08:29:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1149fbcd-5e31-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 10:28:48 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id ABC674EE3C41;
 Fri, 11 Jul 2025 10:28:47 +0200 (CEST)
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
X-Inumbo-ID: 1149fbcd-5e31-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1752222527;
	b=gtvzwf/AfKg6isb/I+g7Y3Ngv8wQfu6iLUmRyxgF4nyKcMJsCbnBA5n2r4Y7tHS5R9sv
	 yaYeeS0jXeKM8A9VqU5LiFUwcHYqZE9ViCSEH+lfYgtBeaeO7cc1i+bpPzajhs111d33t
	 54st6KevfMm8t3LAtxyvY/khkpZqyBckp2EcwDXrGbJyDtD+jxvPc6pEQAEUWs0mb1p4x
	 BDKBiYd3Gt7Jbzi+qQjjOhUw39A/oNkIwEbSP0cASrLNgqN3/wHJGTXBIJyFVXRfyR9gT
	 8n4X3XG0V1tPDgNcVVJGCS5mb1n7uB4zjxx4tbDCD30qfSKfleNuvQbcoN/PsZytthywD
	 TQA31W0akEgVSAiFrgk8Ywk+mIGLssfYEiUlxCpjaEIG1pcQCBl3RJirvqdgwE6xdHRMU
	 pvQZqe01A4LLyd/M/qJi50veDuOsVe3xU9O1mFMe5OxwG7iBJV8c9snA9fJ3kmkcHKDAc
	 K8JvFMwPiSZCQoNN6MJPpDOfn3pLl+QdqAXpA9oQMfDQvXs7rj2rBw5MDFRvHFug+kx7i
	 QvQtUulYXbN1RK1bhj3MCy4SKlR2qxS6VTNvXUn9fERGf1Zou2d0wLBbjW8JWKVr0V08X
	 7JBnHxXdRa5lmSXIWcb+9BhAYxrBfMBi/sZHn1wco27qCy/pW/f/QT+/vbO0XlQ=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1752222527;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=/Kqh9Py0V9oXMbVBGjyBBSjbnWO3ME2/AlKtVLqAo/M=;
	b=e/kVZ8TPrBS+7QZIjacLTTdUPB3fZlxjLsDN8epepPgfpMxNmZIFUIAh/GJtcsAw36By
	 NNT3Qf6yD9dgNI/SO2XqUulAEP4uGY/6INZD2eswFdfvZuaqkU/jYxf5IIblDiscUGa9m
	 qHrtJFu7WDw/2OkFNCwiRRp/LZBk6gs79oYVU/0F8zxy5oJtj0of0LPmzmLDFjqKqFpik
	 +TVUDe1/XRD4ctfj9y2KD59H6U/qeJG0U6gPzTNzFoxIgGMaSEUl7kpQN+DHkQ49l+oSe
	 vWovDIiBUKBZZuMXU5iwtsDjIUC9h4oZcVWViCr7dIQfidQe0FdU0wGjLTOcV/Nnjv1oo
	 WbmQ1ftU4b9UuEN/gqVRo8oIB4CsHXMaYNehqMTNK1DyJBjVL8yiKhnKTnkxODBW0G+yz
	 NtIIRbkyxCz2/UiojrvRcYatxEDqKaQ3z9Eb5d6VgxEl2dTHrrK33ZlQdWHhBiiixm4lC
	 eh+bcpfKQjHRE9U2XL02pNBXjj3IxW5ZXDjvHvRsYJlL9H7kzw/NHhLZH61xQEAzHctb0
	 UhuhVHTZYQnRDcAEui4frFYCCxRz1E8NAwINRv3Gkzzbm/6+m7eCKMTgEmwcx1Os5gN5r
	 pv/+Srtp4+2sN+gm1MNgVsZ31zfBh1j5YGOPY3ba2xCcDUI1OGFisOi4lymiX5U=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1752222527; bh=vsTswWKJV1z1I/dZu03mN2t1xmmsbW18ke6jRS+BAuU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=evYsSmuXfZihAfOdcqx3E8gBzVDRiE8fCzVwMW385RJbqWSQONzFGJgchXf/OVmAF
	 LyTB2PPuP8cIdSLBhS4ikrBDtVV1R5qDwix1xmGapXiNgn4b3W3ODFAGXzbJwGAASP
	 oJEt1fZ0wreyDiKBMWXmwv4O2gZgs68TF7plljXPnwm4qeCu3ibNglZoiiYOiHU3Ip
	 EEpVhtvkQkD3Rz0JUfBCEgIhxM6hJF3wOHG5fca9LH8PuUhgF8Zlw4xa8xZNN9KeDi
	 e3MraOYv1lut0gBESaHuHPuLUlkmJXJZ/kqPAB0+7s4JtSkMjitoBO7bZaUzeOaIyO
	 AJ4iryoDEVaIQ==
MIME-Version: 1.0
Date: Fri, 11 Jul 2025 10:28:47 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
In-Reply-To: <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
Message-ID: <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-09 23:38, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 5.5 states that: "Identifiers shall
> be distinct from macro names".
> 
> Update ECLAIR configuration to deviate:
> - clashes in 'xen/include/xen/bitops.h';
> - clashes in 'xen/include/xen/irq.h';
> - clashes in 'xen/common/grant_table.c'.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>  docs/misra/deviations.rst                        | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index e8f513fbc5..a5d7b00094 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -117,6 +117,14 @@ it defines would (in the common case) be already 
> defined. Peer reviewed by the c
>  -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>  -doc_end
> 
> +-doc_begin="Clashes between function names and macros are deliberate 
> for bitops functions, pirq_cleanup_check, update_gnttab_par and 
> parse_gnttab_limit functions
> +and needed to have a function-like macro that acts as a wrapper for 
> the function to be called. Before calling the function,
> +the macro adds additional checks or adjusts the number of parameters 
> depending on the configuration."
> +-config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}

Bitops violations are not inside "xen/include/xen/bitops.h", but rather 
"xen/arch/x86/include/asm/bitops.h"

> +-config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&context(name(pirq_cleanup_check)&&kind(function)))"}

I would rather do (untested)

-config=MC3A2.R5.5,reports+={deliberate, 
"all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}

> +-config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&context(name(update_gnttab_par||parse_gnttab_limit)&&kind(function)))"}
> +-doc_end
> +

same as above

>  -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>  depending on the guest."
>  
> -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 0d56d45b66..fe05e4062e 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -142,6 +142,14 @@ Deviations related to MISRA C:2012 Rules:
>         memmove.
>       - Tagged as `deliberate` for ECLAIR.
> 
> +   * - R5.5
> +     - Clashes between function names and macros are deliberate for 
> bitops functions,
> +       pirq_cleanup_check, update_gnttab_par and parse_gnttab_limit 
> functions and needed
> +       to have a function-like macro that acts as a wrapper for the 
> function to be
> +       called. Before calling the function, the macro adds additional 
> checks or
> +       adjusts the number of parameters depending on the 
> configuration.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R5.6
>       - The type ret_t is deliberately defined multiple times depending 
> on the
>         type of guest to service.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

