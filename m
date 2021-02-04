Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D91730F6D3
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 16:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81356.150237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gx6-00019k-J1; Thu, 04 Feb 2021 15:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81356.150237; Thu, 04 Feb 2021 15:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gx6-00019K-FN; Thu, 04 Feb 2021 15:53:52 +0000
Received: by outflank-mailman (input) for mailman id 81356;
 Thu, 04 Feb 2021 15:53:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7gx4-00019F-Fi
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:53:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7381bd7e-3475-40b5-8258-0f62589acff6;
 Thu, 04 Feb 2021 15:53:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08107ACD4;
 Thu,  4 Feb 2021 15:53:47 +0000 (UTC)
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
X-Inumbo-ID: 7381bd7e-3475-40b5-8258-0f62589acff6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612454027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qI1xFSgH5+iP2jK3wwU0qrR2eCDVoLxcBN2kgpHJLWc=;
	b=I3XeZpfYSfyLwE26ePiqz+1rS3vA/PsPPC0LAAqgeWfcsz2OluvR56WfOkA7nO46c4YyC+
	QflEISt+tyD7CHWnqbOTw9xdnaNazg5+ONP5B3ZG1EPd1ytMZAaOSwkB5WIPT4cY93NJZF
	E13oWFhfhoLcrx5C31+pKiZbui1z82Q=
Subject: Re: [PATCH for-4.12 and older] x86/msr: fix handling of
 MSR_IA32_PERF_{STATUS/CTL} (again)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 James Dingwall <james-xen@dingwall.me.uk>
References: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
Message-ID: <a04862e5-b534-5f38-e072-be63b3fb2152@suse.com>
Date: Thu, 4 Feb 2021 16:53:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.02.2021 10:36, Jan Beulich wrote:
> X86_VENDOR_* aren't bit masks in the older trees.
> 
> Reported-by: James Dingwall <james@dingwall.me.uk>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -226,7 +226,8 @@ int guest_rdmsr(const struct vcpu *v, ui
>           */
>      case MSR_IA32_PERF_STATUS:
>      case MSR_IA32_PERF_CTL:
> -        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
> +        if ( cp->x86_vendor != X86_VENDOR_INTEL &&
> +             cp->x86_vendor != X86_VENDOR_CENTAUR )
>              goto gp_fault;
>  
>          *val = 0;

Darn - this was only half of it. There's a similar construct
in guest_wrmsr() which also wants replacing.

Jan


