Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492A2B129D9
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 11:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1059167.1426349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufb5T-0003lP-JV; Sat, 26 Jul 2025 09:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1059167.1426349; Sat, 26 Jul 2025 09:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufb5T-0003jM-Cp; Sat, 26 Jul 2025 09:21:03 +0000
Received: by outflank-mailman (input) for mailman id 1059167;
 Sat, 26 Jul 2025 09:21:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ufb5S-0003jG-I1
 for xen-devel@lists.xenproject.org; Sat, 26 Jul 2025 09:21:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ufb5R-002F9L-17;
 Sat, 26 Jul 2025 09:21:01 +0000
Received: from [2a02:8012:3a1:0:c403:8a80:39a7:bf21]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ufb5R-00Ca0E-0G;
 Sat, 26 Jul 2025 09:21:01 +0000
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
	bh=8hS7zJfpjiy/3vwee8Ncpxq/093RsH78B6zZP8Awf5I=; b=uviBBeNF6D5/LiXJXXw2sA1nh7
	kPcPVmb9joew9Z28vFtF+juP0jDdovDmeHRFKMFdSbRHSE2+fPiEIxychR8RI/1HzQzxv1KwpqMio
	uOPB/QNKydJQydOkShu6byWRBeiLPljMU9HV4pzSffddcmNM2hJTevWsEbRkFv1IpXZc=;
Message-ID: <290ae958-4fba-42d8-a64b-d44845b85491@xen.org>
Date: Sat, 26 Jul 2025 10:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250725212235.753363-1-dmukhin@ford.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250725212235.753363-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

On 25/07/2025 22:24, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> __printk_ratelimit() is never used outside of the console driver.
> Remove it from the lib.h and merge with the public printk_ratelimit().

Is this solving any sort of violation? Asking because even if the 
function is only used by one caller, I could see a benefit to be able to 
use different value for the ratelimit. So I leaning towards keep the 
code as-is.

Cheers,

-- 
Julien Grall


