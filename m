Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C9780ADB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 13:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586078.917298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxOf-0005qr-Sa; Fri, 18 Aug 2023 11:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586078.917298; Fri, 18 Aug 2023 11:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxOf-0005oZ-Ny; Fri, 18 Aug 2023 11:12:05 +0000
Received: by outflank-mailman (input) for mailman id 586078;
 Fri, 18 Aug 2023 11:12:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWxOe-0005oR-2u
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 11:12:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxOd-0007HQ-BO; Fri, 18 Aug 2023 11:12:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxOd-0003lM-6b; Fri, 18 Aug 2023 11:12:03 +0000
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
	bh=1bn0qek9fpOQPBJZj3GHWQ9BZ86eRrZEIQBaaS9oayM=; b=4fU04YF3Bu2iMY/odI1zLurfD7
	FWUfmwxxQdRR8GVZ9nxC1DOAkVLErRaNn0gMOdRI4i4dtMVNwZxJg2IEy1WMhnG/MWijlzMzyIwKE
	lh8NFKzmAEGzvZztF0HJ+Pnhfp2emvW3szfyzhdS3SZuetstO7bBvALXpYPa9KbO/o1E=;
Message-ID: <28a8d7d6-7bc9-4ccc-bb9d-a6b48da77bcb@xen.org>
Date: Fri, 18 Aug 2023 12:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-16-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-16-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:47, Juergen Gross wrote:
> Today is_valid_nodename() is always called directly after calling
> canonicalize(), with the exception of do_unwatch(), where the call
> is missing (which is not correct, but results just in a wrong error
> reason being returned).
> 
> Merge is_valid_nodename() into canonicalize(). While at it merge
> valid_chars() into it, too.

You don't valid_chars() anymore. So the second sentence can be removed.

I can do the change while committing.

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

