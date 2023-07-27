Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80064765A27
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 19:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571244.894624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP4jn-00029G-JN; Thu, 27 Jul 2023 17:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571244.894624; Thu, 27 Jul 2023 17:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP4jn-00027f-Gb; Thu, 27 Jul 2023 17:25:19 +0000
Received: by outflank-mailman (input) for mailman id 571244;
 Thu, 27 Jul 2023 17:25:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfsC=DN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qP4jm-00027X-3M
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 17:25:18 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b9ade8a-2ca2-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 19:25:15 +0200 (CEST)
Received: from [10.10.1.94] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690478702291964.8439954564757;
 Thu, 27 Jul 2023 10:25:02 -0700 (PDT)
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
X-Inumbo-ID: 8b9ade8a-2ca2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1690478704; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KrOMC3BPld0hHpUdeDVnUhOybZBJ1pNi3uiuLeKPS4cl+x3wj/Vm4/4tqOOjEGGSDstODuveBZ+8YzSXq+mV5UhmI5sOXshuyG0ECg9/tPEtiwEx0NNDLveUie9h7HLjMKhDCdcRi8XJvM4OejPdFPP+CrugsaVtwa/8TH5RmWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690478704; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TKhkL6fzus3QJYxSCY4OtKCGJ09TJbxESxUFSW6m7dk=; 
	b=KJVaZXO3AZmXsigwumCCmSccWgp1cy8XQXfAxuztD5AX7ml8nNY0aeADIOVTO3Fy0f5ER3uyN9uMdtsTZIC4MUWI/RqkHqeWJuektfrbwVcR35yTVLqpZ2A0nFhPNuCWPYbzo93Y54SteJyLN8VxfXvF7dzkxZuU8akJI98Om2g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690478704;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TKhkL6fzus3QJYxSCY4OtKCGJ09TJbxESxUFSW6m7dk=;
	b=HbPWbvOYvMkHy5s49Q2KT2YgDL6QxQ/ZQjAt/JiOKGq0JvzCHSh1zv8auGKINA79
	5f5uIeYQcanXOGS/V8/bTqX5/oLPgjz9YDQQAC6aPHODHmZN+KyOkbUb1OGju2jZBz0
	U/cqsGLllgwlNM/BnKy/CUNh/wVEa/K85imLfU50=
Message-ID: <94e8ad9f-21e0-6713-84a6-4665a86b2108@apertussolutions.com>
Date: Thu, 27 Jul 2023 13:25:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC] x86/boot: Update construct_dom0() to take a const
 char *cmdline
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Christopher Clark <christopher@nexfir.com>
References: <20230719131802.4078609-1-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20230719131802.4078609-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/19/23 09:18, Andrew Cooper wrote:
> With hvm_copy_to_guest_*() able to use const sources, update construct_dom0()
> and friends to pass a const cmdline pointer.  Nothing in these paths have a
> reason to be modifying the command line passed in.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Christopher Clark <christopher@nexfir.com>
> 
> Slightly RFC.
> 
> I'm confused as to why image is const, but the initrd isn't.
> 
> Also, I suspect this will interfere with the Hyperlauch work, and I'd be happy
> to leave it alone if all of this is being fixed differently anyway.

This is overall a good change and honestly I don't see this having any 
significant impact on HL. And if it does, it would be better to fix HL 
then block this positive change.

> This is necessary to make the -Wwrite-strings bodge compile, but I'm hoping
> that a less-bad solution to the cmdline literals problem would avoid the need
> to propagate const through this callpath.
> ---
>   xen/arch/x86/dom0_build.c             | 2 +-
>   xen/arch/x86/hvm/dom0_build.c         | 4 ++--
>   xen/arch/x86/include/asm/dom0_build.h | 4 ++--
>   xen/arch/x86/include/asm/setup.h      | 2 +-
>   xen/arch/x86/pv/dom0_build.c          | 2 +-
>   5 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

