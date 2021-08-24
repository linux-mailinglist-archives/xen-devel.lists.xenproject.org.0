Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038993F5E2E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171316.312618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVo1-0001G1-Mc; Tue, 24 Aug 2021 12:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171316.312618; Tue, 24 Aug 2021 12:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVo1-0001EB-JD; Tue, 24 Aug 2021 12:45:29 +0000
Received: by outflank-mailman (input) for mailman id 171316;
 Tue, 24 Aug 2021 12:45:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIVo0-0001E5-86
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:45:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIVns-0003GY-W8; Tue, 24 Aug 2021 12:45:20 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIVns-0005rl-Op; Tue, 24 Aug 2021 12:45:20 +0000
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
	bh=g2uM6FMtdrioWOEhiZPIWYdHGiaDjPrak1OX0/wbXAQ=; b=c7dZSMkovKftOcRCysyCjAc0f6
	AIsvb9s6kZYXa7TtFm4kv2k36kKuseLFc4kq0qGAhqnqOHfagcUVCDkt+2r5z5milgc3RA68r7mJQ
	J1ZT9fDOi1FWPSL8GSAjJLvpnh7VzvrLcnqQI7eVK2riobtRK5WVXY83saw6/HZPyoSQ=;
Subject: Re: [PATCH v3 1/6] arm/traps: remove debugger_trap_fatal() calls
To: Bobby Eshleman <bobby.eshleman@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <4c4f45280547564b2c16fd9ca09443314b8f3b6e.1629315873.git.bobby.eshleman@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7000f22f-3925-44ba-f73f-952a84573182@xen.org>
Date: Tue, 24 Aug 2021 13:45:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4c4f45280547564b2c16fd9ca09443314b8f3b6e.1629315873.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bobby,

On 18/08/2021 21:29, Bobby Eshleman wrote:
> ARM doesn't actually use debugger_trap_* anything, and is stubbed out.
I am guessing the plan was to add support for debugging support on Arm. 
But it never made it and it should be easy to re-introduce. So...

> This commit simply removes the unneeded calls.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

