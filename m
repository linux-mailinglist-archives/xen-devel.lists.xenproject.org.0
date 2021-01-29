Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD03087A7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77876.141381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qfz-0002yk-7Q; Fri, 29 Jan 2021 10:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77876.141381; Fri, 29 Jan 2021 10:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qfz-0002yM-4K; Fri, 29 Jan 2021 10:06:51 +0000
Received: by outflank-mailman (input) for mailman id 77876;
 Fri, 29 Jan 2021 10:06:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5Qfy-0002yC-6n
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:06:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Qfw-0002vn-Ba; Fri, 29 Jan 2021 10:06:48 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Qfw-00015Y-5p; Fri, 29 Jan 2021 10:06:48 +0000
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
	bh=oYz91r4ek5cj3mFJT786Wk70qAa632A70c16TZyVgT4=; b=Ejs7VgdButiSrRzat83o/jWsbI
	n8uId5et2rM7Yd+OIzF/DZdkxNuSnsj9nfhpWpVHeYRCo+9hxN2TmO55kJmnXXIdH/wL6XOZueLF9
	AZS9uTUmXAVWXc9mdFFNAdzy1OsNGUh3e4YW9OiYWACxk/0DFALrEb/j0q1WviyS9X94=;
Subject: Re: [PATCH V6 19/24] xen/arm: io: Abstract sign-extension
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-20-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5fca2901-0a40-ab46-438c-7fa57633f37a@xen.org>
Date: Fri, 29 Jan 2021 10:06:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611884932-1851-20-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 29/01/2021 01:48, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> In order to avoid code duplication (both handle_read() and
> handle_ioserv() contain the same code for the sign-extension)
> put this code to a common helper to be used for both.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

