Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2DCB33135
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 17:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092106.1448166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqCfW-0004x1-3E; Sun, 24 Aug 2025 15:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092106.1448166; Sun, 24 Aug 2025 15:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqCfV-0004tG-Vl; Sun, 24 Aug 2025 15:30:05 +0000
Received: by outflank-mailman (input) for mailman id 1092106;
 Sun, 24 Aug 2025 15:30:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGsQ=3E=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uqCfT-0004DC-Py
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 15:30:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 321f84fa-80ff-11f0-b898-0df219b8e170;
 Sun, 24 Aug 2025 17:29:59 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 66EC04EEBC47;
 Sun, 24 Aug 2025 17:29:58 +0200 (CEST)
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
X-Inumbo-ID: 321f84fa-80ff-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756049398;
	b=jIHdqR5OL8zAv2Fp6Etv+nWszJbm/9WFiYMLtc6plGN42Lbi1dO00+3UOQNeWzdEYEJO
	 MqZmWRuVnXoX6CLhn1tKqnfRgexrlsA90cQecBqquJmSekXYxOdrNyRgCIjRdGlENy7Nq
	 RCIsSTYpSpbq7gz0L+xESfir9nEEBvQolk5ED92h1AI5Xhjg3Qrx4QBwBJFJabzfAxJMD
	 Qf1YYt8oRMmmXQpP4Bbb9pyccRj7fFYB/JkSEKMzxz/JjLBrnF0MQowLe0mXu9hI2yuQA
	 Q6PwxXCYw7OwzTAiqcyX91+MFt3eT1S1ITSS49NPzcVtoQeVlS58Vw1WQlJV3F9gqM48r
	 PxboSKUAB/WGC74txyAhOCTADh3C61uQw11LyWYHy24xwHIf1v3GLtRGP8p1vuMRolKkf
	 S9ZIEpf+4ACJIXQ6rqxBTy9e/44TPU154ABtEy4TOq8WX0LUWWW+Ezyeu2k/6jctYHCs1
	 07g+NKuAeCg9VDhl1RVi97Ot+cSXq3wHt0ck8OXjmdDz8nxU+xTwCvBqssiQXy9u/u4qt
	 iJNZvUVGLwAxXWSsHbB26wFg+4bPxh9RvIV5ujZTmRxZjyzuZcw34JjhdAE+gxBZIr6ua
	 joEOmixlBJ4teQa1C+a2eP9fToOTEObfPdOf6d7QHTuBC2SUEqtAJFIPX7epU9g=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756049398;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=MCUvX3B9Iwr6vQD5jsAgjLmG5aHcQyONWJ4sz99hIrw=;
	b=zVRFwvHjIbZY/f66wxCjW+RQtQOv0wCorKJ+Z9tcBwMqtgR1YdPg9ocpAQntTUG7+B2e
	 lxkZ1BUeyVrdRrbnEwsb6KzUwWPb4umoxgzws62qIRKuTkqcXgfFUDuRTP0EYoWdPW4h+
	 +mY4Dpo3bIrsVfV4YaUoRt5pi5LniJKCUmvseV8TVOrmF8CBMES7/nPdUO91AmjMQ9ZY3
	 S4EcIRjikpuC2TnFoMe3Fjm3vKvtv8+mNHo96Njmf4bH8fbvm9YVSy9ii1cc25lk94bWe
	 v9SKfSmZ5bGW6UF2AVaUhPtrkCcX6lUg27iDUcM1ZOaSwZQKwMkmCvqRbM8zY+QmAslg8
	 GLzpt9kJC10QQIYzTj0cF8nUkdaupOYBvg7boHaQqunzjaupmxLZjKJxCDOUrvoIpD34F
	 XPYfjayAZElJYm7NXUJ1TIGer4WD/5O0+hcEuU071CfRsf6DlUSXA1blQ4qw/iOixo5ml
	 Ea4PYD/TToYq323JnQbEQyMO9gwmDYQ+uGGRU3LJ+/9RsWTyGAxxOlEbKqzWj+ySw2Q9W
	 TqFo7vsLqqDt5HGcrkJm6S35ucUJjOw+hXlKojDqFBQ7eSurK/UXhamcX+9+2Zm1E9rJK
	 FbXiCq2hzgTLCvCD6eRggBrt8DebrI0XOdnMEx/niBTsQ79cwi0H4OI3JEknS28=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756049398; bh=32dFdYTe6uUbBcPVrCiUiezIqb/pSSllr9qtHMAQ6xo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YdRDriJBMWCzeId5s+ro4j4yhjsnKPgsQBV7FPNo3lT578S5JI+N3IShTT7v3NHom
	 7YjnbRUGIP+BgOrt3rL1SiK6aS53k9rU/6BcMg3AExGSS9qotrQ8c4UkcMArmpY9xx
	 aXf/jtwH1EvNHMfoRkz5rwgoR/NBRwq/z5MlTbk8zyk1LuSaDed7yXD3Pce2othCy6
	 5bpTrPeQTqKhywGEoVtBwcu63qII8h0bZoXF8fYyNskFUHIoAjR4o/Ct2mwCpN6R+g
	 5qI6WYnrbz3XOGpPNwJ0pLrnY0V5oazVaVevxQA6afpmB8C9f/+I/2erng5/JyXoFe
	 +Ro/UjJN5mGBw==
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 17:29:58 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
In-Reply-To: <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
References: <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
Message-ID: <7d0b9e8e296ea07b966832b9a047baa7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-24 16:56, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 2.1 states: "A project shall not contain unreachable 
> code".
> Functions that are non-returning and are not explicitly annotated with
> the 'noreturn' attribute are considered a violation of this rule.
> 
> In certain cases, some functions might be non-returning in specific 
> build
> configurations due to call to '__builtin_unreachable()' in the 
> expansion
> of the macro 'BUG()':
>  - functions 'gicv3_do_LPI()' and 'gicv3_its_setup_collection()' when 
> the
> config CONFIG_HAS_ITS is not defined, it is intentionally used to catch
> and prevent any unintended execution of code that should only run when
> ITS is available;
>  - function 'prepare_acpi()' when the config CONFIG_ACPI is not 
> defined,
> to trigger an error if ACPI-related features are used incorrectly.
> 
> To account for that in specific builds, update the ECLAIR configuration
> to deviate these violations. Update deviations.rst file accordingly.
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2000738682
> ---

https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/jobs/11119212994

Build failure here

>  automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
>  docs/misra/deviations.rst                        | 13 +++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 7f3fd35a33..336aec58c2 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -41,6 +41,17 @@ not executable, and therefore it is safe for them to 
> be unreachable."
>  
> -call_properties+={"name(__builtin_unreachable)&&stmt(begin(any_exp(macro(name(ASSERT_UNREACHABLE)))))", 
> {"noreturn(false)"}}
>  -doc_end
> 
> +-doc_begin="The 'BUG()' macro is intentionally used in the 
> 'prepare_acpi()' function in specific build configuration
> +(when the config CONFIG_ACPI is not defined) to trigger an error if 
> ACPI-related features are used incorrectly."
> +-config=MC3A2.R2.1,reports+={deliberate, 
> "any_area(any_loc(file(^xen/arch/arm/include/asm/domain_build\\.h$))&&context(name(prepare_acpi)))"}
> +-doc_end
> +
> +-doc_begin="The 'BUG()' macro is intentionally used in 
> 'gicv3_do_LPI'() and 'gicv3_its_setup_collection()' functions
> +in specific build configuration (when the config CONFIG_HAS_ITS is not 
> defined) to catch and prevent any unintended
> +execution of code that should only run when ITS is available."
> +-config=MC3A2.R2.1,reports+={deliberate, 
> "any_area(any_loc(file(^xen/arch/arm/include/asm/gic_v3_its\\.h$))&&context(name(gicv3_do_LPI||gicv3_its_setup_collection)))"}
> +-doc_end
> +
>  -doc_begin="Proving compliance with respect to Rule 2.2 is generally 
> impossible:
>  see https://arxiv.org/abs/2212.13933 for details. Moreover, peer 
> review gives us
>  confidence that no evidence of errors in the program's logic has been 
> missed due
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 2119066531..96eb202502 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -97,6 +97,19 @@ Deviations related to MISRA C:2012 Rules:
>         Xen expects developers to ensure code remains safe and reliable 
> in builds,
>         even when debug-only assertions like `ASSERT_UNREACHABLE() are 
> removed.
> 
> +   * - R2.1
> +     - The 'BUG()' macro is intentionally used in the 'prepare_acpi()' 
> function
> +       in specific build configuration (when the config CONFIG_ACPI is 
> not
> +       defined) to trigger an error if ACPI-related features are used 
> incorrectly.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R2.1
> +     - The 'BUG()' macro is intentionally used in 'gicv3_do_LPI'() and
> +       'gicv3_its_setup_collection()' functions in specific build 
> configuration
> +       (when the config CONFIG_HAS_ITS is not defined) to catch and 
> prevent any
> +       unintended execution of code that should only run when ITS is 
> available.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R2.2
>       - Proving compliance with respect to Rule 2.2 is generally 
> impossible:
>         see `<https://arxiv.org/abs/2212.13933>`_ for details. 
> Moreover, peer

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

