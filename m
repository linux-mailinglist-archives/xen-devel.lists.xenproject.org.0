Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372BA7A0FD2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 23:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602749.939475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgtqX-00024r-UO; Thu, 14 Sep 2023 21:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602749.939475; Thu, 14 Sep 2023 21:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgtqX-00022K-Rj; Thu, 14 Sep 2023 21:25:57 +0000
Received: by outflank-mailman (input) for mailman id 602749;
 Thu, 14 Sep 2023 21:25:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgtqW-000229-Ap
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 21:25:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgtqV-0005U2-Ss; Thu, 14 Sep 2023 21:25:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgtqV-0003ht-MY; Thu, 14 Sep 2023 21:25:55 +0000
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
	bh=SPEIEjxIi81aJ8wb4GdxZ78Sow0l5A0s2tn0NDJu4tc=; b=Xxtmgz07dK0Lvow/V3q7r/ixwI
	RStqqTmsQcczJ0lp6iO6s1z5O391rcMkamMvNR+QCalBDKMkH3Z5KDQLyBVhFUBFMm4Pk3y/pJt/7
	4mMIRdUYAxD/2c4lisdMdUPV4MI9Up9rMD2oZalixkAMd+f1K+vkat8tQVfS269zr27A=;
Message-ID: <5a0d227d-74f6-457c-aab9-852ca55c6b77@xen.org>
Date: Thu, 14 Sep 2023 22:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] Arm: annotate entry points with type and size
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
 <e7685fa0-62e0-98b9-f9ba-7e698fb7373e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e7685fa0-62e0-98b9-f9ba-7e698fb7373e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/08/2023 07:28, Jan Beulich wrote:
> Use the generic framework in xen/linkage.h. No change in generated code
> except for the changed padding value (noticable when config.gz isn't a
> multiple of 4 in size). Plus of course the converted symbols change to
> be hidden ones.
> 
> Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
> use site wants the symbol global anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> Only one each of the assembly files is being converted for now. More
> could be done right here or as follow-on in separate patches.

I don't have a strong preference. Are you planning to do follow-up? (I 
am ok if it is no).

Cheers,

-- 
Julien Grall

