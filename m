Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D3401A57
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 13:05:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179633.326006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCQs-0000JX-Rt; Mon, 06 Sep 2021 11:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179633.326006; Mon, 06 Sep 2021 11:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCQs-0000Gn-Oh; Mon, 06 Sep 2021 11:04:58 +0000
Received: by outflank-mailman (input) for mailman id 179633;
 Mon, 06 Sep 2021 11:04:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNCQr-0000Gh-2n
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 11:04:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNCQp-00028G-An; Mon, 06 Sep 2021 11:04:55 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNCQp-0008Lo-46; Mon, 06 Sep 2021 11:04:55 +0000
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
	bh=cUUe6zzqW0wvOLi12xZic2f3L00lviKdlvhQ+zAy3fs=; b=0G+ZCTjQWV78luFw20ktNazUe7
	pXeAXYqqVsiVHa4xMP7cltFmcw3uKqLxi+Ndlen7GxAH/sznP1zOnzCptX1/bjm/ahZtLZLvgGT+m
	6a8k+vHCcYOIbeX2LJikd3ce45UYi2DCnT4gwD5L2HvJ3OecNw/P9bKf//9RV8N8/boM=;
Subject: Re: [PATCH] gnttab: maptrack handle shortage is not IOMMU related
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e28eea8c-fd54-c3a7-a10a-5eeac2c7a8a1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <29fd1d29-1077-4513-a8b6-5d220b06f4d3@xen.org>
Date: Mon, 6 Sep 2021 12:04:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e28eea8c-fd54-c3a7-a10a-5eeac2c7a8a1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/08/2021 15:27, Jan Beulich wrote:
> Both comment and message string associated with GNTST_no_device_space
> suggest a connection to the IOMMU. A lack of maptrack handles has
> nothing to do with that; it's unclear to me why commit 6213b696ba65
> ("Grant-table interface redone") introduced it this way. Introduce a
> new error indicator.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Or should this be a more specific one, e.g. GNTST_no_mt_handle? If not,
> I would intend to also use GNTST_no_space for -ENOMEM like situations.

I guess the guest could use GNTSTS_no_mt_handle to reduce the number of 
persistent mappings (if there are any).

Although, I am not sure how involved it would be in OS like Linux.

Anyway, the new error status is better than the previous one. So I am 
happy with either solutions:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

