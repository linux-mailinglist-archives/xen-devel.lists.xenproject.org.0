Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60004275E89
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 19:23:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL8TZ-0006es-1Y; Wed, 23 Sep 2020 17:22:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL8TX-0006em-Nd
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 17:22:39 +0000
X-Inumbo-ID: 7c50dd49-c6a8-4c5b-b457-ab470ff60ada
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c50dd49-c6a8-4c5b-b457-ab470ff60ada;
 Wed, 23 Sep 2020 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=fgHIzrb4VIdXQIhrutmIASpe+SQdpPmYIQan4CxD3q0=; b=ODACv5qowcBK0rUxDc+qzyXArn
 //9EpjRktiEuSejH8iOkE538CjpL5/TqXsn30Sx1ftwqY4eGAbr8lXSCqZsdVk+pWeETjjh4ACM0u
 HRNHlBt3FXViB6eXUgO04E20kKDDRZyia/USknujqREgTt3RMLhR5IiP0L0XGxhpKRo0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL8TR-000892-G5; Wed, 23 Sep 2020 17:22:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL8TR-0004e9-5l; Wed, 23 Sep 2020 17:22:33 +0000
Subject: Re: [PATCH V1 01/16] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1e1bfa02-9de0-b3ba-d0c7-5796c942f737@xen.org>
Date: Wed, 23 Sep 2020 18:22:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 10/09/2020 21:21, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> As a lot of x86 code can be re-used on Arm later on, this patch
> prepares IOREQ support before moving to the common code. This way
> we will get almost a verbatim copy for a code movement.

FWIW, I agree with Jan that we need more details what and why you are 
going it. It would be worth considering to split in smaller patch.

> 
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>

Usually the first signed-off is the author of the patch. However, this 
patch look quite far off from what I originally wrote.

So I don't feel my signed-off-by is actually warrant here. If you want 
to credit me, then you can mention it in the commit message.

> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 

Cheers,

-- 
Julien Grall

