Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E287A643D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 15:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604674.942175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaN2-0000TX-4z; Tue, 19 Sep 2023 13:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604674.942175; Tue, 19 Sep 2023 13:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaN2-0000Rr-18; Tue, 19 Sep 2023 13:02:28 +0000
Received: by outflank-mailman (input) for mailman id 604674;
 Tue, 19 Sep 2023 13:02:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiaN0-0000Ri-12
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 13:02:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiaMz-00030q-GL; Tue, 19 Sep 2023 13:02:25 +0000
Received: from [15.248.3.4] (helo=[10.24.67.44])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiaMz-0004Ad-8g; Tue, 19 Sep 2023 13:02:25 +0000
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
	bh=X8P456VT+2hW4VKsO70wl++oFF8AU9/cTj+m5IhFtbI=; b=XWNBLIE2bCxBzhWlD5lXoqI7w3
	9gGRxGbN0MCUVblC0WYJSSnLKlRKkF4xbPPMlLREMONl9fY5xZauNklPksHHSJTdkpheGdD2P7qSq
	lH49wQRiQX7dF75ZfzhGFH4CDeAut8+szZJ9FO3ynPbmO7rnHMxRS6RdZtRDV7fJKZFY=;
Message-ID: <1614d73f-72b0-44f2-8e34-0e6c58a1a375@xen.org>
Date: Tue, 19 Sep 2023 14:02:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while
 sending a command
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
 <20230919112827.1001484-3-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230919112827.1001484-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 19/09/2023 12:28, Volodymyr Babchuk wrote:
> There is no need to invalidate cache entry because we just wrote into a
> memory region. Writing itself guarantees that cache entry is valid.

The goal of invalidate is to remove the line from the cache. So I don't 
quite understand the reasoning here.

So I am a little hesitant to remove the invalidate without some 
justification based on the specification.

Cheers,

-- 
Julien Grall

