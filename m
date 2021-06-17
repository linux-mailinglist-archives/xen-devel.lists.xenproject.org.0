Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9583AB1DC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 13:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143810.264885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltpnH-00015J-Hp; Thu, 17 Jun 2021 11:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143810.264885; Thu, 17 Jun 2021 11:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltpnH-00012f-Ek; Thu, 17 Jun 2021 11:02:43 +0000
Received: by outflank-mailman (input) for mailman id 143810;
 Thu, 17 Jun 2021 11:02:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltpnG-00012Z-Qe
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 11:02:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltpnG-0007W7-FQ; Thu, 17 Jun 2021 11:02:42 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltpnG-0002XK-7i; Thu, 17 Jun 2021 11:02:42 +0000
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
	bh=4wmRk4AdsuBzMGm2H1KtLqeylc9DvdI3seaWwORVfbg=; b=YWin/4nXpJIppnY5hSEUk43y0G
	usouYQbvfx1Ppmg1IIb77KLJUj6RO9UrofdyVDcrI8UtUsKKHXF4rwTKcL9WMvWuUE4bbcDtYpgEx
	ZDV9EJV3u1njzA5aH+WZz4rf6R3PS1zdtvU5Qkrc1A1WCayGYMQbeEpgdticRVpc0vIg=;
Subject: Re: [PATCH v20210616 00/36] leftover from 2020
To: Olaf Hering <olaf@aepfle.de>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20210616125129.26563-1-olaf@aepfle.de>
 <968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
 <20210616170238.376cb13d.olaf@aepfle.de>
From: Julien Grall <julien@xen.org>
Message-ID: <0bf3f6e7-c45e-c158-21d3-e3b636eb71c5@xen.org>
Date: Thu, 17 Jun 2021 13:02:39 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616170238.376cb13d.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Olaf,

On 16/06/2021 17:02, Olaf Hering wrote:
> Am Wed, 16 Jun 2021 15:50:24 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
> 
>>           new_max |= new_max >> 32;
> 
> Lazy compiler? I hoped this is a compile-time constant, which evaluates to zero in 32bit builds.

See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=4210, this seems to be 
a known issue on GCC.

> 
>      if ( sizeof(unsigned long) > 4 )
> 
> I guess a #ifdef as it is done in old code must be done.
> 
> Olaf
> 

Cheers,

-- 
Julien Grall

