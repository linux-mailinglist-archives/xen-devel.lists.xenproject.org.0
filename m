Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E942A8384
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 17:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19921.45427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kai6R-0000ln-Px; Thu, 05 Nov 2020 16:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19921.45427; Thu, 05 Nov 2020 16:27:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kai6R-0000lO-Mu; Thu, 05 Nov 2020 16:27:11 +0000
Received: by outflank-mailman (input) for mailman id 19921;
 Thu, 05 Nov 2020 16:27:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tWnR=EL=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kai6Q-0000lJ-CB
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 16:27:10 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db73dad9-cdfa-4d79-9586-8c19731d8204;
 Thu, 05 Nov 2020 16:27:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kai6K-0004Yo-8k; Thu, 05 Nov 2020 16:27:04 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kai6J-0001xA-Rm; Thu, 05 Nov 2020 16:27:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tWnR=EL=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kai6Q-0000lJ-CB
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 16:27:10 +0000
X-Inumbo-ID: db73dad9-cdfa-4d79-9586-8c19731d8204
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id db73dad9-cdfa-4d79-9586-8c19731d8204;
	Thu, 05 Nov 2020 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=CqpsC3IQyLxfKeb/TylKLBCfN6RptM6b7w/FRc2UraU=; b=SLlkA3LcOtTqqKJLMbBFSg/8/9
	+pNs7oT7uO0hBnD+doAw+8gCjULik6m7XlYDf+WrXeavi0cUFXT8RHckNb9JkAc3a8dV28NAXwqIA
	HIn0OmWCFZElmRxEcNAr32CvuU8mSnig1fU6Zz3SAHR+hLgZ9LN/XlPGMsQzdvxPkJeI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kai6K-0004Yo-8k; Thu, 05 Nov 2020 16:27:04 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kai6J-0001xA-Rm; Thu, 05 Nov 2020 16:27:04 +0000
Subject: Re: BUG: libxl vuart build order
To: Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: Takahiro Akashi <takahiro.akashi@linaro.org>,
 Alex Benn??e <alex.bennee@linaro.org>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>, ian.jackson@eu.citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
References: <CAB5YjtCwbvYMVg-9YXjSFtC8KvjkJuYhJFSCHrJaRUKfg4NHYA@mail.gmail.com>
 <alpine.DEB.2.21.2010261634000.12247@sstabellini-ThinkPad-T480s>
 <20201027000214.GA14449@laputa> <20201028014105.GA11856@laputa>
 <alpine.DEB.2.21.2010281437010.12247@sstabellini-ThinkPad-T480s>
 <20201029114705.GA291577@laputa>
 <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s>
 <20201030025157.GA18567@laputa>
 <alpine.DEB.2.21.2010301045250.12247@sstabellini-ThinkPad-T480s>
 <20201105154147.GJ2214@perard.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4933b50f-19da-dac7-78d2-378fa72649a7@xen.org>
Date: Thu, 5 Nov 2020 16:26:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105154147.GJ2214@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 05/11/2020 15:41, Anthony PERARD wrote:
> On Fri, Oct 30, 2020 at 10:46:37AM -0700, Stefano Stabellini wrote:
>> On Fri, 30 Oct 2020, Takahiro Akashi wrote:
>>> === after "xl console -t vuart" ===
>>> U-Boot 2020.10-00777-g10cf956a26ba (Oct 29 2020 - 19:31:29 +0900) xenguest
>>>
>>> Xen virtual CPU
>>> Model: XENVM-4.15
>>> DRAM:  128 MiB
>>>
>>> In:    sbsa-pl011
>>> Out:   sbsa-pl011
>>> Err:   sbsa-pl011
>>> ===
>>>
>>> If possible, I hope that "xl create -c" command would accept "-t vuart"
>>> option (or it should automatically selects uart type from the config).
>>
>> I think a patch to add the "-t" option to "xl create" would be
>> acceptable, right Anthony?
> 
> I don't know. Why `xl' isn't able to select the vuart as the default one?

The SBSA UART was originally introduced mostly for debugging purpose and 
to be compliant with the SBSA specification.

The default console so for on Arm is the PV console.

Cheers,

-- 
Julien Grall

