Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBC93C21A9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153535.283655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mul-0003ND-G1; Fri, 09 Jul 2021 09:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153535.283655; Fri, 09 Jul 2021 09:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mul-0003Kk-D6; Fri, 09 Jul 2021 09:35:19 +0000
Received: by outflank-mailman (input) for mailman id 153535;
 Fri, 09 Jul 2021 09:35:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1muk-0003Ke-KO
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:35:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1mui-0005YX-3O; Fri, 09 Jul 2021 09:35:16 +0000
Received: from [54.239.6.180] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1muh-0006Cq-TX; Fri, 09 Jul 2021 09:35:16 +0000
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
	bh=a5Ztq9YTbLg4aLZLurZnEdCD/9y7SKe2SS9EyMB1iUg=; b=u27zJ+b/ytHad5tCX+BfNhmsG/
	nKeIYBlFCWE8hl4cNKG7xtcwgB+DqDj3kSlJRdaSacw1ruxw+uP4nVQ0n/f9JCvl1e+4Ixs9I2yVs
	eCzFPMKoTE2r556apwKWoXl6H8NVMKUoRRMk5v01Xfz/VODAcyMb2XuSvNtGbxOTYTwc=;
Subject: Re: [PATCH v20210701 07/40] tools: create libxensaverestore
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-8-olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <4630739a-5ec7-ab20-d587-8c76f784b0a7@xen.org>
Date: Fri, 9 Jul 2021 10:35:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701095635.15648-8-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Olaf,

On 01/07/2021 10:56, Olaf Hering wrote:
> Move all save/restore related code from libxenguest.so into a separate
> library libxensaverestore.so. The only consumer is libxl-save-helper.
> There is no need to have the moved code mapped all the time in binaries
> where libxenguest.so is used.
> 
> According to size(1) the change is:
>     text	   data	    bss	    dec	    hex	filename
>   187183	   4304	     48	 191535	  2ec2f	guest/libxenguest.so.4.15.0
> 
>   124106	   3376	     48	 127530	  1f22a	guest/libxenguest.so.4.15.0
>    67841	   1872	      8	  69721	  11059	saverestore/libxensaverestore.so.4.15.0
> 
> While touching the files anyway, take the opportunity to drop the
> redundant xg_sr_ filename prefix.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Acked-by: Wei Liu <wl@xen.org>

The changelog is not very useful to keep in the commit message. We 
usally add --- on its own line before so they will get stripped when the 
patch is applied.

This comment applies for the full series. But I can deal with this patch 
if I happen to commit it.

Cheers,

-- 
Julien Grall

