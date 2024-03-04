Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22687072F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 17:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688444.1072544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBES-0003Rc-Il; Mon, 04 Mar 2024 16:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688444.1072544; Mon, 04 Mar 2024 16:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBES-0003OV-FU; Mon, 04 Mar 2024 16:32:04 +0000
Received: by outflank-mailman (input) for mailman id 688444;
 Mon, 04 Mar 2024 16:32:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rhBER-0003Na-7m
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 16:32:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhBEQ-0003Dy-Ma; Mon, 04 Mar 2024 16:32:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhBEQ-0001fN-7N; Mon, 04 Mar 2024 16:32:02 +0000
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
	bh=VKJgEvGBOw/UC3HKTngodgixYYnofVuSQb3X32ZaFUo=; b=zOV6XJSOlH6jui0ek+FVxbYCbR
	nkhQ37ayEynLwy9g+NUU5RQ32qiv8cfdyTyAwqeBAMse4TBzxw/bYPtUzUaxbN3jzoxy68BVPcqWV
	vEbVtBg2p+8kLsfAoQKTLjVs3J8zqI6whFmV4c/wxpgOE5ypn+jX7I+bY7qaZKoOZHbI=;
Message-ID: <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
Date: Mon, 4 Mar 2024 16:31:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240304161041.3465897-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 04/03/2024 16:10, Andrew Cooper wrote:
> It is daft to require all architectures to provide empty implementations of
> this functionality.

Oleksii recenlty sent a similar patch [1]. This was pushed back because 
from naming, it sounds like the helpers ought to be non-empty on every 
architecture.

It would be best if asm-generic provides a safe version of the helpers. 
So my preference is to not have this patch. This can of course change if 
I see an explanation why it is empty on Arm (I believe it should contain 
csdb) and other arch would want the same.

Cheers,

[1] 
5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com

-- 
Julien Grall

