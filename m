Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95273523341
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 14:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326796.549433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolcp-0008Fc-PH; Wed, 11 May 2022 12:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326796.549433; Wed, 11 May 2022 12:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolcp-0008Cf-Lp; Wed, 11 May 2022 12:39:31 +0000
Received: by outflank-mailman (input) for mailman id 326796;
 Wed, 11 May 2022 12:39:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nolco-0008CZ-DD
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 12:39:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nolcn-0006St-Sw; Wed, 11 May 2022 12:39:29 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nolcn-0002qz-Mx; Wed, 11 May 2022 12:39:29 +0000
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
	bh=JowkZp54Hzn/o1MfZbiUjePUk6ZiqdW+7E8xfPqKjNE=; b=YRsVWxVibiXVwdUhAxR+Ko+dFG
	Mypzp4lTPQY7RX2y1IN48GzWnsjBVphpkbE6nsyatsZPUP+hJDwOElrAMj06xjECO15aR5VqjVjqz
	bNrtypNI9bCT0gNR2EJjL1gM5yM8Z1OUsI0RN7ZKgnXGDYijfvId+9cs/DV9DldSXLaM=;
Message-ID: <c61e4d5c-ef97-09f8-b57f-e874302291a4@xen.org>
Date: Wed, 11 May 2022 13:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
To: George Dunlap <George.Dunlap@citrix.com>
Cc: =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <SJ0PR03MB5405E449B19691A916EA3FE79DC89@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <82e54293-926e-b7ee-7091-a85a9db8f6c5@xen.org>
 <6F5998A0-636F-4AFC-847D-F0CFAC5B624E@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6F5998A0-636F-4AFC-847D-F0CFAC5B624E@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi George,

On 11/05/2022 13:11, George Dunlap wrote:
>>> Google told me __force is used in linux kernel to suppress warning in sparse,
>>> https://stackoverflow.com/questions/53120610/what-does-the-attribute-force-do
>>> Is sparse also used in xen?
>>
>> I am not aware of any use of Sparse in Xen, but it would technically be possible.
>>
>> However, my point here is more that this change seems to be unrelated to what the patch is meant to do (i.e. switching to byteswap). So if it is unnecessary, then it should be dropped from this patch.
> 
> I think making people pull little changes like this out into separate patches is asking too much.  It’s a lot of extra effort on the part of the submitter for basically no value.  We commonly do little clean-ups like this in patches, and just require a comment at the bottom, like this:

I suggested to drop from the patch because I don't think we should 
remove the __force. In fact, I have contemplated a few times in the past 
to use sparse in Xen.

Sorry I should have been clearer.

Cheers,

-- 
Julien Grall

