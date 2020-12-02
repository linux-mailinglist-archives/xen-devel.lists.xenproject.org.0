Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B212CC52E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 19:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42965.77321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkWug-0002pN-H7; Wed, 02 Dec 2020 18:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42965.77321; Wed, 02 Dec 2020 18:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkWug-0002oy-Du; Wed, 02 Dec 2020 18:31:38 +0000
Received: by outflank-mailman (input) for mailman id 42965;
 Wed, 02 Dec 2020 18:31:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkWue-0002ot-Cm
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 18:31:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkWub-0000Fq-R9; Wed, 02 Dec 2020 18:31:33 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkWub-0008CU-8Y; Wed, 02 Dec 2020 18:31:33 +0000
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
	bh=QWNtZF+8sKsnsiW8NH+OMTwZIn6A98UV+A8Bdjuh28U=; b=HsWiNJVpjjeV45bWsoVRj+l5GB
	gHuHisQEdUVwxQ30CAa49+YOO3H8YEL19iZXJWCTKw2mA/XbRZQl1/TQdfSWdjSzGlDucRMLF+/dN
	Kg3QjKhENLaKebKg6Ufhr6oA2P0Ib4ArZA+mtdwQQGAGfnSWZDajo2Un6ym3F5Fde9PU=;
Subject: Re: [PATCH] gnttab: don't allocate status frame tracking array when
 "gnttab=max_ver:1"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a484cc88-f41d-5d38-d098-4eda297569a1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bf921997-fc9a-b1b9-78d9-7a7f85fe4608@xen.org>
Date: Wed, 2 Dec 2020 18:31:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a484cc88-f41d-5d38-d098-4eda297569a1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/11/2020 15:55, Jan Beulich wrote:
> This array can be large when many grant frames are permitted; avoid
> allocating it when it's not going to be used anyway. 

Given there are not many users of grant-table v2, would it make sense to 
avoid allocating the array until the guest start using grant-table v2?

Cheers,

-- 
Julien Grall

