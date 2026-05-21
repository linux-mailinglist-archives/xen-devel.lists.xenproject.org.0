Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF15BktiD2o5JwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 21:51:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA0F5AB971
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 21:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315872.1585528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ9QJ-0001He-4y; Thu, 21 May 2026 19:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315872.1585528; Thu, 21 May 2026 19:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ9QJ-0001FJ-2F; Thu, 21 May 2026 19:51:15 +0000
Received: by outflank-mailman (input) for mailman id 1315872;
 Thu, 21 May 2026 19:51:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wQ9QG-0001FD-UJ
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:51:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ9QG-003jzv-0S
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 21:51:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0f6215-5cb7-0a2a0a5109dd-0a2a450ac93e-14
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 21:51:11 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0f622e-56b3-0a2a450a0019-ac6904fec5ae-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 21:51:11 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0EED760098;
 Thu, 21 May 2026 19:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7E41F00A3B;
 Thu, 21 May 2026 19:51:09 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779393069;
	bh=j0gao7VKBf6CWO8/YA2Kiau76clnv0hA6lBej/2KwDc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=S9A+4TjO9VK6fn5xQYfa/2L5LLE9RvkkSECE6839T+WlexhpFe8dx1DTovOU+SAfp
	 wPJdhgK5hf1zWIdrSUtE0a+Gumn9bQdSm2CS79F765oql/mOB1RdcH+HhMJO0UQnWb
	 JvkK8q86lAMHaQCuCo9ffiGl/0jFmsUmHpRtAsYsuHL96v1MVuiVYC6RTcO8TKyhl3
	 q28ooFQjJHIE9fMJRIbnIMf6rASdeXvxiojfq3+a0YI3hwUs/uHE3a/KQq3XPTWmyA
	 VIsPEH8DnI1tOhJ6HYmEtWlt8RG8SDOnJk7/rcfTO4uCfKOOxHMSSY38HFGHU8FRxJ
	 HqxMtwTa9DG3A==
Date: Thu, 21 May 2026 12:51:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] CI: collect certain intermediate files as artifacts
 (part 2)
In-Reply-To: <d23a061d-afbe-4b38-9352-de4b63d56396@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605211250590.182011@ubuntu-linux-20-04-desktop>
References: <d23a061d-afbe-4b38-9352-de4b63d56396@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1779393071-7035B8B7-37A23DE2/0/0
X-purgate-type: clean
X-purgate-size: 1521
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4FA0F5AB971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026, Jan Beulich wrote:
> Build issues may also surface for analysis jobs. Collect intermediate
> files (if any) there as well. Include xen/.config too, since it's not
> otherwise collected.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2536905486
> 
> --- a/automation/eclair_analysis/build.sh
> +++ b/automation/eclair_analysis/build.sh
> @@ -58,10 +58,21 @@ runtime_failures_docs() {
>  (
>    runtime_failures_docs
>  
> +  ret=0
> +  mkdir -p intermediates
>    make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>         "CROSS_COMPILE=${CROSS_COMPILE}"         \
>         "CC=${CC}"                               \
>         "CXX=${CXX}"                             \
>         "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
> -       -C xen
> +       -C xen || ret=$?
> +
> +  # Preserve Xen intermediate files.  Some may be there only upon build failure.
> +  for f in xen/.config xen/.xen-syms.* xen/.xen.efi.*; do
> +      if [[ -f $f ]]; then
> +          cp $f intermediates/
> +      fi
> +  done
> +
> +  exit $ret
>  )
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -18,6 +18,7 @@
>        - "${ECLAIR_OUTPUT_DIR}/*.txt"
>        - '*.log'
>        - '*.json'
> +      - intermediates/
>      reports:
>        codequality: gl-code-quality-report.json
>    rules:
> 

