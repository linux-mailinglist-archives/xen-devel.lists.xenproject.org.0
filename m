Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A073C6F578E
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 14:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529147.823221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBDY-0008JQ-KU; Wed, 03 May 2023 12:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529147.823221; Wed, 03 May 2023 12:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBDY-0008GQ-H2; Wed, 03 May 2023 12:04:20 +0000
Received: by outflank-mailman (input) for mailman id 529147;
 Wed, 03 May 2023 12:04:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tXb3=AY=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1puBDW-0008GG-Ut
 for xen-devel@lists.xen.org; Wed, 03 May 2023 12:04:18 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0fd9587-e9aa-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 14:04:18 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBDS-0001Ei-C9; Wed, 03 May 2023 12:04:14 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBDS-0001Dc-51; Wed, 03 May 2023 12:04:14 +0000
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
X-Inumbo-ID: a0fd9587-e9aa-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=iFeaJQawpHU0XOg+AJe7sZ7kc1MFF3Cejlix51ECQjA=; b=ea4CyjXpNW1exCleaO5ewKF85H
	T7g0YCjlRJ4UW32dEVnA6SRQ0vopfcvTP6Yf/Yydfzj4y7OzeLH33F3dBMtZI2jRYKVe7NJ7PF1es
	vCHmI94K2n0iQlc2Ni+jZ2MFzZfRPOtc6Fqkl1gHVyUt64qYO27fcl2apXyM1ZpYsXZE=;
Message-ID: <1e34ae06-c5b1-586a-c840-1dcb768c70e9@xen.org>
Date: Wed, 3 May 2023 13:04:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH V3 2/2] libxl: fix matching of generic virtio device
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>
References: <18458fa39433ce4ac950a0a20cc64da93db0b03a.1680771422.git.viresh.kumar@linaro.org>
 <888e60d2ec49f53230bc82df393b6bed4180cb8a.1680771422.git.viresh.kumar@linaro.org>
 <6d18f284-8cf9-4c21-7057-5f53bd98536e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6d18f284-8cf9-4c21-7057-5f53bd98536e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 03/05/2023 12:42, Jan Beulich wrote:
> On 06.04.2023 10:58, Viresh Kumar wrote:
>> The strings won't be an exact match, as we are only looking to match the
>> prefix here, i.e. "virtio,device". This is already done properly in
>> libxl_virtio.c file, lets do the same here too.
>>
>> Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> While I've committed the doc patch (patch 1), I don't think I should
> commit this one without a maintainer ack, even if it looks pretty
> straightforward. Anthony, Wei?

AFAICT Anthony has already given his acked-by:

https://lore.kernel.org/xen-devel/5e98d465-be8f-4050-a988-2a0829a71a2e@perard/#R

Cheers,

-- 
Julien Grall

