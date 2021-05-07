Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8A3761FC
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 10:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123826.233645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levqJ-0003Do-NL; Fri, 07 May 2021 08:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123826.233645; Fri, 07 May 2021 08:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levqJ-0003Ai-K4; Fri, 07 May 2021 08:28:15 +0000
Received: by outflank-mailman (input) for mailman id 123826;
 Fri, 07 May 2021 08:28:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1levqI-0003Aa-QQ
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 08:28:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8444e05-a5cf-4a51-bde7-62ddadee6161;
 Fri, 07 May 2021 08:28:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30E20AD21;
 Fri,  7 May 2021 08:28:13 +0000 (UTC)
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
X-Inumbo-ID: a8444e05-a5cf-4a51-bde7-62ddadee6161
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620376093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKfxfZCvK01MxBI+cBeAxrxYVh6JrA/8NF4V4f20pGw=;
	b=OeH9NUsHQ8e3Y0KsNIqpup9oIIfSRt0iBuXJ2fbgPdl3qr62aigNTY4qBDw6ZqJdz+ojib
	S9jCSN+BCg2qC1EbRk6Qw8srgBZnuu2GuJwPBE2u6X4Z18gYQQ8MtJX1UPfJimx2eHANwb
	gJJQtYMTCke+xpuM4HoL2ke3TZYapzo=
Subject: Ping: [PATCH] x86: fix build race when generating temporary object
 files (take 2)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c35ad629-0dea-688a-199d-895186aeffb2@suse.com>
Message-ID: <a1c855ff-00c8-5cca-b938-38693ca53429@suse.com>
Date: Fri, 7 May 2021 10:28:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c35ad629-0dea-688a-199d-895186aeffb2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 11:54, Jan Beulich wrote:
> The original commit wasn't quite sufficient: Emptying DEPS is helpful
> only when nothing will get added to it subsequently. xen/Rules.mk will,
> after including the local Makefile, amend DEPS by dependencies for
> objects living in sub-directories though. For the purpose of suppressing
> dependencies of the makefiles on the .*.d2 files (and thus to avoid
> their re-generation) it is, however, not necessary at all to play with
> DEPS. Instead we can override DEPS_INCLUDE (which generally is a late-
> expansion variable).
> 
> Fixes: 761bb575ce97 ("x86: fix build race when generating temporary object files")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ping?

Ian, I'm also including you here because iirc the .*.d2 thing was an
invention of yours, so you may have an opinion.

Jan

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -314,5 +314,5 @@ clean::
>  # Suppress loading of DEPS files for internal, temporary target files.  This
>  # then also suppresses re-generation of the respective .*.d2 files.
>  ifeq ($(filter-out .xen%.o,$(notdir $(MAKECMDGOALS))),)
> -DEPS:=
> +DEPS_INCLUDE:=
>  endif
> 


