Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3837A76EFCC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 18:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576512.902735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbOx-0006Jw-0w; Thu, 03 Aug 2023 16:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576512.902735; Thu, 03 Aug 2023 16:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbOw-0006I1-TB; Thu, 03 Aug 2023 16:42:14 +0000
Received: by outflank-mailman (input) for mailman id 576512;
 Thu, 03 Aug 2023 16:42:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRbOu-0006Hv-So
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 16:42:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRbOs-0003yv-No; Thu, 03 Aug 2023 16:42:10 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.22.21]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRbOs-0007Qv-FS; Thu, 03 Aug 2023 16:42:10 +0000
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
	bh=TmH+IFFCzTmmTF0Xjy4CEEm+3JAqwnh7imsQLqX4k3A=; b=L4BbnG0wawUcaO5evzq1r/pm9Z
	EyWhV8aYSSlfQxBXd0abV9KY//YafzkswVe83x0FqlwZwgBhm/5xItS/qQ2WDloRjE0PLI2dMqrid
	MTX9KfeKPypD6Lx/v88AWofOjNG9nSJz40UmtoQ7muSOoPo5pUcERro+FXPAWYYvRDr8=;
Message-ID: <facd218e-2863-4a88-a3cf-fa1938af14c7@xen.org>
Date: Thu, 3 Aug 2023 17:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Constify the vCPU parameter for
 expand_xsave_states()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230802154705.84530-1-julien@xen.org>
 <376a6586-388b-271c-7667-e63bb1565eef@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <376a6586-388b-271c-7667-e63bb1565eef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 03/08/2023 09:53, Jan Beulich wrote:
> On 02.08.2023 17:47, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> expand_xsave_states() is not meant to modify the vCPU. So the parameter
>> can be const.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks. I have committed the patch.

Cheers,

-- 
Julien Grall

