Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E45072EA09
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 19:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548348.856259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q97z9-00004s-0y; Tue, 13 Jun 2023 17:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548348.856259; Tue, 13 Jun 2023 17:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q97z8-0008Tz-UJ; Tue, 13 Jun 2023 17:39:14 +0000
Received: by outflank-mailman (input) for mailman id 548348;
 Tue, 13 Jun 2023 17:39:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q97z7-0008Tt-6e
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 17:39:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q97z6-0008KR-MZ; Tue, 13 Jun 2023 17:39:12 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.9.244]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q97z6-0005Nu-F1; Tue, 13 Jun 2023 17:39:12 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=lbPowdH5rNaqZM/MpE2Lq8oKXP0yctx1oeAc8gnyk7U=; b=ieeiCsId9fBhzsnfdx6rWRTHPf
	7EJpLe1xxmSkozUch49H0spp1TlBLI8XxhhwC/khB6+sEQw8nav5lRbDgrxVp4Ill8YNKTta4OewQ
	+jtq4Mr+ntKUTbHSUNjzOmz/A5v/vGQ19W7hMXCT/Ug6dVES+naK712UaKPEPwMWI9kg=;
Message-ID: <d3883a59-acff-198c-a688-ac2546de69a7@xen.org>
Date: Tue, 13 Jun 2023 18:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/evtchn: Purge ERROR_EXIT{,_DOM}()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/06/2023 17:22, Andrew Cooper wrote:
> These are disliked specifically by MISRA, but they also interfere with code

Please explicitly name the rule.

> legibility by hiding control flow.  Expand and drop them.
> 
>   * Rearrange the order of actions to write into rc, then render rc in the
>     gdprintk().
>   * Drop redundant "rc = rc" assignments
>   * Switch to using %pd for rendering domains
> 
> No functional change.  Resulting binary is identical.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

[...]

> base-commit: f29363922c1b41310c3d87fd9a861ffa9db9204a

I notice you have a few e-mail contain this tag. This is a pretty useful 
when reviewing patches. Do you know which tool is creating it?

Cheers,

-- 
Julien Grall

