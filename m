Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLVDNg0TdGkL2AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 01:32:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958D57BAF0
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 01:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212660.1523686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRZP-00042k-EP; Sat, 24 Jan 2026 00:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212660.1523686; Sat, 24 Jan 2026 00:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRZP-00040B-BC; Sat, 24 Jan 2026 00:32:07 +0000
Received: by outflank-mailman (input) for mailman id 1212660;
 Sat, 24 Jan 2026 00:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vjRZN-0002cv-KP
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 00:32:05 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1adce5e6-f8bc-11f0-b15f-2bf370ae4941;
 Sat, 24 Jan 2026 01:32:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4E1DF44455;
 Sat, 24 Jan 2026 00:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB10C19421;
 Sat, 24 Jan 2026 00:32:01 +0000 (UTC)
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
X-Inumbo-ID: 1adce5e6-f8bc-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769214723;
	bh=O//6IAT1yQB0wLqStf9C+ud2gbZNX1Mja19bz1ohzPU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EOsLqlmTCewj6lWjSpMrVjzJeynDmyjc6amAxfy91UlJsYyxMuxQXbk1bZjehoIRQ
	 XcjLaEbGnfy1LLUqkhpPjMQF8jGUEq02RDL1+fDsjSpX08oUbo2RB6kKfdTEdbRYhl
	 JnOp/IcAZsuG0z+KXkrKVsQbhozm0xXkwnykxv3DG6c4bMRJO47aMrUWcQkcJkweUu
	 yUTgoAZMeSxYKSVMQ4uviYRgj9q4NeLO4XaQ+CxMGqISw+wFnbTK/RUSRwCjPy2ywp
	 1AfYKl2SgMUUn8h9i3QQJs2i4Bwc3IpQw0EnBv2hvh6WFlgsgo03iQ6Ea4qAAKKqBE
	 57WZIM/bkGv5w==
Date: Fri, 23 Jan 2026 16:32:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 4/4] scripts/config: hook to automation build script
In-Reply-To: <20260116043458.730728-5-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2601231631200.7192@ubuntu-linux-20-04-desktop>
References: <20260116043458.730728-1-dmukhin@ford.com> <20260116043458.730728-5-dmukhin@ford.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 958D57BAF0
X-Rspamd-Action: no action

On Thu, 15 Jan 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Use the new .config manipulation tool to toggle CONFIG_DEBUG in the
> Xen automation build script.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  automation/scripts/build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 7a81d229decd..ee1127c53dc5 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -27,7 +27,7 @@ else
>      # Start off with arch's defconfig
>      make -C xen defconfig
>  
> -    echo "CONFIG_DEBUG=${debug}" >> xen/.config
> +    xen/scripts/config --file xen/.config -${debug} DEBUG

I'd suggest to add:

debug="${debug:-n}"

before calling xen/scripts/config to avoid errors in case debug is not
set

I could make the change on commit if you are OK with it


>      if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
>          echo "${EXTRA_XEN_CONFIG}" >> xen/.config
> -- 
> 2.52.0
> 

