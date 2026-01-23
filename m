Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P/fF03QcmnKpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:35:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74DE6F21D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211993.1523357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj64V-0003zv-3y; Fri, 23 Jan 2026 01:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211993.1523357; Fri, 23 Jan 2026 01:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj64V-0003xD-0t; Fri, 23 Jan 2026 01:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1211993;
 Fri, 23 Jan 2026 01:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CMz=74=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vj64T-0003x7-8J
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 01:34:45 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0808ac5-f7fb-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 02:34:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 21DC660018;
 Fri, 23 Jan 2026 01:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF65C116C6;
 Fri, 23 Jan 2026 01:34:39 +0000 (UTC)
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
X-Inumbo-ID: b0808ac5-f7fb-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132080;
	bh=LlvnuZHkkUZjU6oP7cNdF9crsDaCmlhOCHbPp+sdGsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ss2BXayqDqDF0pxpkCCBrvWUu9Ma+I3nCplVBLIDKUjVFSGeocXMlffF61A/mIzoT
	 ma0RGQ4MnLyY//Z2iaSimdYhPv9S5g2nVx/fRJGdrHR/KCHpwBZjrrJbYstdo3+2p3
	 Uf8/E84uaWO851obducsG88rTiGdkUyFS9k5LfwplvaZHOWNmfzpLkPwdR37y19emX
	 o8bMHpC3JYyVfA6TQB+AonY3g0vmBPlYpSabC3/Kf7SMonmrD7eqFQbB5yuh9eEoNt
	 fbPglAt9jA42ksgL1SJYeGCRXYbTmO58HnZ9qnZtlcC/mMj2ybxpgvMCJXj/ScKqME
	 BY/x6TJfY95MQ==
Date: Thu, 22 Jan 2026 17:34:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v8 2/5] xen: arm: smccc: add INVALID_PARAMETER error
 code
In-Reply-To: <8b964d9b6a50053d8a2e485a672b0fd3bc2e0c7c.1769020872.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601221734300.7192@ubuntu-linux-20-04-desktop>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com> <8b964d9b6a50053d8a2e485a672b0fd3bc2e0c7c.1769020872.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:url,epam.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.931];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D74DE6F21D
X-Rspamd-Action: no action

On Wed, 21 Jan 2026, Oleksii Moisieiev wrote:
> According to the "7.1 Return Codes" section of DEN0028 [1]
> INVALID_PARAMETER code (-3) is returned when one of the call
> parameters has a non-supported value.
> Adding this error code to the common smccc header file.
> 
> [1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> 
> 
>  xen/arch/arm/include/asm/smccc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
> index 441b3ab65d..478444fb09 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
>                         0x3FFF)
>  
>  /* SMCCC error codes */
> +#define ARM_SMCCC_INVALID_PARAMETER     (-3)
>  #define ARM_SMCCC_NOT_REQUIRED          (-2)
>  #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
>  #define ARM_SMCCC_NOT_SUPPORTED         (-1)
> -- 
> 2.34.1
> 

