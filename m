Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E156FCDCB
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 20:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532426.828630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwS4n-0000DZ-QV; Tue, 09 May 2023 18:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532426.828630; Tue, 09 May 2023 18:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwS4n-0000B8-Nw; Tue, 09 May 2023 18:28:41 +0000
Received: by outflank-mailman (input) for mailman id 532426;
 Tue, 09 May 2023 18:28:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwS4l-0000B2-Rh
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 18:28:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwS4l-0000ET-1V; Tue, 09 May 2023 18:28:39 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.0.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwS4k-00052W-Rj; Tue, 09 May 2023 18:28:38 +0000
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
	bh=FpjfXe36wPgPDDQbxBoRCXUy070Hu51w/3Tt+2bcAWA=; b=3mazdo2AX4vBj+50TGDSo6zUWC
	iYXYUObziY6DIT8cKorfbBx9OpRnGeGjE1kRea7VAoG7XUFlWEZvdXD3s4LbZAaYNS8JiRhios80U
	xLLJPTphqqqM4j8aZ/oRoUVEp88cceqBCgvcS5LU8I3HmF8JoBB2BmrCtSuDhJ5ibPn0=;
Message-ID: <a6f1f4f3-3423-b818-732b-1ac7e9a38251@xen.org>
Date: Tue, 9 May 2023 19:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 04/14] tools/xenstore: add framework to commit
 accounting data on success only
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230508114754.31514-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/05/2023 12:47, Juergen Gross wrote:
> Instead of modifying accounting data and undo those modifications in
> case of an error during further processing, add a framework for
> collecting the needed changes and commit them only when the whole
> operation has succeeded.
> 
> This scheme can reuse large parts of the per transaction accounting.
> The changed_domain handling can be reused, but the array size of the
> accounting data should be possible to be different for both use cases.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

