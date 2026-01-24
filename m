Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gmHEGPMSdGkX2AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 01:31:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8617BAC2
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 01:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212634.1523677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRYg-0003HL-6b; Sat, 24 Jan 2026 00:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212634.1523677; Sat, 24 Jan 2026 00:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRYg-0003Dz-3U; Sat, 24 Jan 2026 00:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1212634;
 Sat, 24 Jan 2026 00:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vjRYe-0002cu-F8
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 00:31:20 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fef138d9-f8bb-11f0-9ccf-f158ae23cfc8;
 Sat, 24 Jan 2026 01:31:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 382D643494;
 Sat, 24 Jan 2026 00:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9550FC4CEF1;
 Sat, 24 Jan 2026 00:31:14 +0000 (UTC)
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
X-Inumbo-ID: fef138d9-f8bb-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769214676;
	bh=eV+iTs5JAo2L8emmyYjwyqZdVboesjN+J4LDPH4qRnk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rOkZraYXDAZqLHhYsEgtkM9g8o2JIGTQEZNRKs6KbhJBVbX49LN9QhlVAdJ0epMAR
	 ehj5kgAYR8XltPrSStt746rP431Go6G7Mz6bo6qZWCYjM9jUeduHgec5xRyRkcc8b/
	 QpqR3PNuBAIfsKcAqmnNPneWf4rCgxvtDW5+0hq1BKWWJnIVIk5qzjbGn0ZdhZ7/GB
	 O/G+7c9+NabpTG+NPbteDC8/Gl0rgmiJUM7jXLrqcKjMrVgcZZYrE1w4YeDbsLQaxY
	 LB0SQeFhLM1u8dlPW5PHyZ2svxpwAuNQcZ0dtN/7u7gRD7pk5GRxFkg2+SK1eSgxDs
	 E/KZ8qH4eGmXw==
Date: Fri, 23 Jan 2026 16:31:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 3/4] scripts/config: add -y|-n flags
In-Reply-To: <20260116043458.730728-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2601231630590.7192@ubuntu-linux-20-04-desktop>
References: <20260116043458.730728-1-dmukhin@ford.com> <20260116043458.730728-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,xen.org:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4C8617BAC2
X-Rspamd-Action: no action

On Thu, 15 Jan 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add alias -y ("yes") to --enable and -n ("no") to --disable a Kconfig
> option for better scripting experience.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/config | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/scripts/config b/xen/scripts/config
> index 1050812aae8d..1ede964320cf 100755
> --- a/xen/scripts/config
> +++ b/xen/scripts/config
> @@ -16,8 +16,8 @@ Manipulate options in a .config file from the command line.
>  Usage:
>  $myname options command ...
>  commands:
> -	--enable|-e option   Enable option
> -	--disable|-d option  Disable option
> +	--enable|-e|-y|--yes    option   Enable option
> +	--disable|-d|-n|--no    option   Disable option
>  	--set-str option string
>  	                     Set option to "string"
>  	--set-val option value
> @@ -166,11 +166,11 @@ while [ "$1" != "" ] ; do
>  		;;
>  	esac
>  	case "$CMD" in
> -	--enable|-e)
> +	--enable|-e|-y|--yes)
>  		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=y"
>  		;;
>  
> -	--disable|-d)
> +	--disable|-d|-n|--no)
>  		set_var "${CONFIG_}$ARG" "# ${CONFIG_}$ARG is not set"
>  		;;
>  
> -- 
> 2.52.0
> 

