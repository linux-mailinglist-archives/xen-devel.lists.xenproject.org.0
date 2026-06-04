Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wuQgEAcaIWq1/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 08:24:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D2963D3D9
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 08:24:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=bugseng.com (policy=none);
	arc=pass ("bugseng.com:s=openarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327429.1592390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV1Ug-0007bv-Dm; Thu, 04 Jun 2026 06:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327429.1592390; Thu, 04 Jun 2026 06:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV1Ug-0007Z7-AR; Thu, 04 Jun 2026 06:23:54 +0000
Received: by outflank-mailman (input) for mailman id 1327429;
 Thu, 04 Jun 2026 06:23:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wV1Ue-0007Z1-NC
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 06:23:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV1Ud-008nzz-K1
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 08:23:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a2119c5-2eae-0a2a0a5409dd-0a2a4506d7a6-44
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:23:51 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a2119f7-7371-0a2a45060019-a237832fc464-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:23:51 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id EB02C4EE441E;
 Thu,  4 Jun 2026 08:23:50 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1780554231;
	b=QBZADWzZfxFlRVOJgKJZfL3xmGDipvoilkebsOjT+9LFDHx/uJQgvZTEvVzmSxd/3NMk
	 UqOUkdLdvkpVs/y2z3QIbworoq59cLkw1oib1UXiUj18McQqCvNoP+gOAxFbH2bDYLTB6
	 lnUrzKwvqFKsiQ+SfcADiGWMuKhQnZwHhx0WpSe8GKFPXDbbtu5FJceZIYAtr6/r3Bygs
	 iM5Ffk/MUIrth/lmm2LF/ZntqnOYM4IUZVDyVdCSwbxy3+g8K54qmjmY80bBh7pYidtNx
	 8jFftXpdZh6SHJh1VjIIxxPWHer6VJx7Vdpigdt3OIPcxZLmgw0udwbGE9EdYYQGZrDPf
	 NhBVZ1qWSEWrN42LkhAGJquzRIRtWk7+fGutYZhF6Ogp92ALg4YHgnNMqFHYkEuHGzxO/
	 zfXDXxk0pK3ysMsxDRoJ0XQWILNPZVNjHlKrLo69P7mgStO5f57CWK0BHaGKM8NJELYVr
	 hiLEMgAPmvKNsaNwUFKS36aiwyWQukMUeAT+bUPxqx+vyHGuRB6nRseUha1XSpfyCoM+1
	 PLGBKywQNDXWb3u81duiCLvZWeOOWNtutwTGYO6t64wTmJrH/MvD/akHh9k1JtH/QUbxI
	 XbjBtiu8nb0f96nrYnXixOyn+4TEFKRiAWqM0QnrrRUyb2L3xdZDzNSmJr3MRPk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1780554231;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=wpRW8U+4ZquNMOfcE/qcP8H4Q49TTxFxWiEPQcHVf4I=;
	b=Isf5qnWmR4D9sBE8kHCuGr3HFFGf33y6mgIn3gpWgQFeO4Z4+dGIR09+y+1zcIAmrj7r
	 y1ujjVQxPV/CDkO6zwA3JW881VxKzLyvAnVfahmHx9OjPSdKt7pzFzzTEv/BR17i2mXdW
	 FWqQmNRflqYC4kiPPlv1dVyYBidZ5M6JuwKbhv55a9vnQq4h9CEw+9Fqa/hu0eFdRgL3F
	 1dv3yom8Rl0gemg3j1ZdAIplUr5vks7jqMkxgAm7OCwnQQJe+bMW2N0TD5zmXmytFjdVJ
	 F/Wwk2CKiBAVH/qwQ8dCOSinrtWLXYDkEZ9nPhD5qSqOCvyZ9IwxtXGW5+zr6P9nrxNVq
	 gmiUvD/IwhbcDS+q3TZhoOPjXzyiEBjY4pNty0N7E0lCo+W8I6XBdmOIaA5wP/GlkIiGr
	 tRAqrWvw98BamRxWnBxc1AFUPIxC6ZU07iWrQR0xXSzYmeWjz5f5iBT7mlxJE37D78sEn
	 OV5e/sBkf95x/jQoInwCwuzuvtcoEurqD2wvpsqAdJOID8Q2v94SjtQnH0tZXq1F/nZdb
	 0PqFAgS89qsvTKj5h7CkiTnXLJrc14Pw4PIftm+lmIs9TQ/MeaR46Amk5q32vpKFXsKHJ
	 8PaI13RLaBH18gH7W66Cg7NOW2OBwHl8cWEmp8sFFqgaOJkn37VLYXONiv1w4Zk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 04 Jun 2026 08:23:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH 3/3] misra: deviate MISRA C Rule 5.5 for ARM SMMU fault
 handlers
In-Reply-To: <9a9f7757613143c1b1e9806a134df7b3afb5ca54.1779709902.git.dmytro_prokopchuk1@epam.com>
References: <cover.1779709902.git.dmytro_prokopchuk1@epam.com>
 <9a9f7757613143c1b1e9806a134df7b3afb5ca54.1779709902.git.dmytro_prokopchuk1@epam.com>
Message-ID: <6c3253f01170f436d388718b124c2340@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780554231-85B6DD75-46EF229F/0/0
X-purgate-type: clean
X-purgate-size: 4402
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,bugseng.com:mid,bugseng.com:from_mime,bugseng.com:url,linkedin.com:url,b.sc:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92D2963D3D9

On 2026-05-25 14:05, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
> names".
> 
> Update ECLAIR configuration to deviate intentional identifier and
> macro name clashes by specifying the macros that should be ignored.
> This includes 'arm_smmu_global_fault' and 'arm_smmu_context_fault',
> where the original ARM SMMU handler returns irqreturn_t, while the
> same-named macro redirects later uses to a Xen wrapper with the
> void interrupt-handler signature expected by Xen 'request_irq()'.
> 
> Update deviations.rst and rules.rst accordingly.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>  docs/misra/deviations.rst                        | 7 +++++++
>  docs/misra/rules.rst                             | 4 ++++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 7aa64796ba..419a23ce8e 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -144,6 +144,12 @@ ARM SMMU driver calls by reordering the handler 
> and flags arguments."
>  
> -config=MC3A2.R5.5,ignored_macros+="name(request_irq)&&loc(file(^xen/drivers/passthrough/arm/smmu\\.c$))"
>  -doc_end
> 
> +-doc_begin="Clashes between ARM SMMU fault handler functions and macro 
> names in 'xen/drivers/passthrough/arm/smmu.c' are deliberate.
> +The original ARM SMMU handler returns irqreturn_t, while the macro 
> redirects later uses to a Xen wrapper with the
> +void interrupt-handler signature expected by Xen 'request_irq()'."
> +-config=MC3A2.R5.5,ignored_macros+="name(arm_smmu_global_fault||arm_smmu_context_fault)&&loc(file(^xen/drivers/passthrough/arm/smmu\\.c$))"
> +-doc_end
> +
>  -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>  depending on the guest."
>  
> -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 01f141b73f..15c88b82f4 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -192,6 +192,13 @@ Deviations related to MISRA C:2012 Rules:
>         reordering the handler and flags arguments.
>       - ECLAIR has been configured to ignore this macro.
> 
> +   * - R5.5
> +     - Clashes between the ARM SMMU fault handler functions and macro 
> names are
> +       intentional. The original ARM SMMU handler returns irqreturn_t, 
> while
> +       the macro redirects later uses to a Xen wrapper with the void
> +       interrupt-handler signature expected by Xen 'request_irq()'.
> +     - ECLAIR has been configured to ignore these macros.
> +
>     * - R5.6
>       - The type ret_t is deliberately defined multiple times depending 
> on the
>         type of guest to service.
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 097c20432e..88d2c5fa7c 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -230,6 +230,10 @@ maintainers if you want to suggest a change.
>         the macro is a local compatibility wrapper that adapts ARM SMMU 
> driver
>         call to Xen's request_irq() argument order.
> 
> +       Clashes between ARM SMMU fault handler functions and macro 
> names are
> +       allowed because the macros redirect ARM SMMU driver uses to a 
> Xen interrupt
> +       wrapper with the handler signature expected by request_irq().
> +
>     * - `Rule 5.6 
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
>       - Required
>       - A typedef name shall be a unique identifier

Seeing the growing number of exceptions for R5.5 and 5.6 for one reason 
or another in deviations.ecl, I wonder whether a more structured 
approach to the configuration would be better (e.g., a JSON file that is 
then processed just before the build to produce an ECL file fragment 
evaluated in the the right place). The change itself is fine, but I 
think this would tidy up a bit the file from these targeted exceptions.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

