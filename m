Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E801D2DFDF6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 17:23:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57432.100462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krNxn-0006b6-Rg; Mon, 21 Dec 2020 16:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57432.100462; Mon, 21 Dec 2020 16:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krNxn-0006ah-OX; Mon, 21 Dec 2020 16:23:11 +0000
Received: by outflank-mailman (input) for mailman id 57432;
 Mon, 21 Dec 2020 16:23:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krNxm-0006aa-68
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 16:23:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krNxk-0000xl-AI; Mon, 21 Dec 2020 16:23:08 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krNxk-0003h7-2e; Mon, 21 Dec 2020 16:23:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=1Gom1xzp2asr56xabVOws+HzHH9sR5dcNL9rnIkEcFg=; b=kWuYzr8abxO2+LI4nsc2Omoenu
	W9Bb0r7xbDg41DZA515RFsBH+UM8HD5utJXLQW6fj9zXOEUn+r4nOHHRxv65z4SilNiyzLiOgN0qf
	xoKhi3bFsGiTvOeecfwhh0Ex5kjUPkBKhgY71A5IwP7drQ+sy2auc2JZj8F71OlOcbq4=;
Subject: Re: [PATCH v2 1/4] x86: verify function type (and maybe attribute) in
 switch_stack_and_jump()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
 <792c442d-c05a-7a00-c807-b94a54bca94f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <896456a9-16cb-2549-f3a1-e431d5e6479c@xen.org>
Date: Mon, 21 Dec 2020 16:23:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <792c442d-c05a-7a00-c807-b94a54bca94f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/12/2020 16:11, Jan Beulich wrote:
> It is imperative that the functions passed here are taking no arguments,
> return no values, and don't return in the first place. While the type
> can be checked uniformly, the attribute check is limited to gcc 9 and
> newer (no clang support for this so far afaict).
> 
> Note that I didn't want to have the "true" fallback "implementation" of
> __builtin_has_attribute(..., __noreturn__) generally available, as
> "true" may not be a suitable fallback in other cases.
> 
> Note further that the noreturn addition to startup_cpu_idle_loop()'s
> declaration requires adding unreachable() to Arm's
> switch_stack_and_jump(), or else the build would break. I suppose this
> should have been there already.
> 
> For vmx_asm_do_vmentry() along with adding the attribute, also restrict
> its scope.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

For the Arm bits:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

