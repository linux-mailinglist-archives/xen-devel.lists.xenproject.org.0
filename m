Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD8A3D0B00
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 11:12:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159232.292903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68Go-0002Un-VB; Wed, 21 Jul 2021 09:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159232.292903; Wed, 21 Jul 2021 09:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m68Go-0002Sy-Rq; Wed, 21 Jul 2021 09:12:02 +0000
Received: by outflank-mailman (input) for mailman id 159232;
 Wed, 21 Jul 2021 09:12:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m68Go-0002Ss-2N
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 09:12:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m68Gk-0007Tl-Dc; Wed, 21 Jul 2021 09:11:58 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m68Gk-0004DX-79; Wed, 21 Jul 2021 09:11:58 +0000
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
	bh=vkWKLKUrYQQn/lHzOoY7AE1Dp2iTX3JLPP9niQD5V2w=; b=SsC5XLveVcFHS7gqBa0aAxg95Q
	O/q31d5wU+KtsSEk6tmQARzB0djdWi5HKTfwvdKi/TeMEBrBs1IswwQ1z1StvfTClOazjtMFjxMiv
	Y71add/k4JiDMA3g8QVlzLfDNHTtXbTgaz1c2E6fpKXdyuLWryc+Mc/NU4R+qBBG7/Ac=;
Subject: Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
To: Andrew Cooper <andrew.cooper3@citrix.com>, Scott Davis
 <scottwd@gmail.com>, xen-devel@lists.xenproject.org
Cc: Scott Davis <scott.davis@starlab.io>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
 <c8a1120b-0a4e-60ef-66c0-5c33ab988a54@xen.org>
 <56f86674-7a6c-3f3a-40e9-dcb35cddbb88@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c4d5cb39-420b-a9e3-0b9c-bee7e5d41a78@xen.org>
Date: Wed, 21 Jul 2021 10:11:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <56f86674-7a6c-3f3a-40e9-dcb35cddbb88@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 21/07/2021 10:06, Andrew Cooper wrote:
> On 21/07/2021 09:21, Julien Grall wrote:
>> Hi Scott,
>>
>> On 20/07/2021 18:56, Scott Davis wrote:
>>> This adds an option to the xl domain configuration file syntax for
>>> specifying
>>> a kernel command line for device-model stubdomains. It is intended
>>> for use with
>>> Linux-based stubdomains.
>>
>> May I ask why embedding the command line in the kernel would not be a
>> solution? Do you expect it to change from stubdom to stubdom?
> 
> Why should users of stubdoms be forced to embed command line options?
> Especially when its not the normal way of working?

I didn't suggest they should be forced. I was more interested to know 
the setup because I was expecting stubdomain to use a very tailored kernel.

> 
> They shouldn't, and this alone is enough justification for the change.

Everyone has a different perspective. I don't see the problem of asking 
the question... Maybe I should have add "OOI" to make clear with wasn't 
a complain.

Cheers,

-- 
Julien Grall

