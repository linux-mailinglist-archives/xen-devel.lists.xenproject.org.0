Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314AD3489D3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 08:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101270.193561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPK6M-00015n-II; Thu, 25 Mar 2021 07:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101270.193561; Thu, 25 Mar 2021 07:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPK6M-00015O-Ev; Thu, 25 Mar 2021 07:08:18 +0000
Received: by outflank-mailman (input) for mailman id 101270;
 Thu, 25 Mar 2021 07:08:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQ/e=IX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPK6K-00015J-O5
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 07:08:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6857fe41-3b7d-47bf-9ecc-6a851b137786;
 Thu, 25 Mar 2021 07:08:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CD96AA55;
 Thu, 25 Mar 2021 07:08:14 +0000 (UTC)
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
X-Inumbo-ID: 6857fe41-3b7d-47bf-9ecc-6a851b137786
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616656094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgZHR1EBcLhZNXGcPKJoWbDmcpDE8wHbJ8Vo9rYETcA=;
	b=mS9WUcJ6CpiFivruTNKxUvapyp/UjJRIlCpfdDigqx9pKXiAkFTaw9ZN8fF9cgMatzpi6I
	HHwnGof82lXPa/M+vV2jnY7BFQ8pD1G3QVHiZpsMIKJBzXE1mfMwqRj3YFCdTF9h6BGlW8
	NhMEAsKhVeXmMPOPT4WeSgQVv2VI48o=
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
To: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210324172608.302316-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
Date: Thu, 25 Mar 2021 08:08:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324172608.302316-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.03.2021 18:26, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> Missed one from my list when creating the other series
> 
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monne <roger.pau@citrix.com>
> ---
>  CHANGELOG.md | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 15a22d6bde..49832ae017 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -18,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - x86_emulate: Expanded testing for several instruction classes
>   - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
>   - CI loop: Add dom0less aarch64 smoke test
> + - Factored out HVM-specific shadow code, allowing PV shim to be slimmer

But shadow code doesn't get included by default in shim-exclusive
builds (and others are unlikely to disable HVM).

Also, just to mention it - some of the patches in the direction
of !HVM builds getting smaller are still pending. They've been
acked (for the most part at least), but couldn't be posted in
time (sitting behind the PV guest accessors changes, which were
waiting for a decision security-wise).

Jan

