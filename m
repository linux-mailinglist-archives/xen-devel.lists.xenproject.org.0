Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D352A94F7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 12:07:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20639.46662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kazZt-0001kU-OM; Fri, 06 Nov 2020 11:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20639.46662; Fri, 06 Nov 2020 11:06:45 +0000
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
	id 1kazZt-0001k5-Kr; Fri, 06 Nov 2020 11:06:45 +0000
Received: by outflank-mailman (input) for mailman id 20639;
 Fri, 06 Nov 2020 11:06:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/Pr=EM=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kazZs-0001k0-SQ
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 11:06:44 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09041c4b-3001-4285-85b0-aac8a16eaf9c;
 Fri, 06 Nov 2020 11:06:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kazZq-0000Vy-42; Fri, 06 Nov 2020 11:06:42 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kazZp-0008Sb-Sh; Fri, 06 Nov 2020 11:06:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l/Pr=EM=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kazZs-0001k0-SQ
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 11:06:44 +0000
X-Inumbo-ID: 09041c4b-3001-4285-85b0-aac8a16eaf9c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 09041c4b-3001-4285-85b0-aac8a16eaf9c;
	Fri, 06 Nov 2020 11:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4xhm3/84xwadizEJTcEOxIINJNiXhV/nT9pem7B1bhA=; b=3aXdrZ685d/SqDq1heCIZbywrt
	HrEicHeC08E/qPxHNbO5OayDxUYnWWhL3MHdbfomD7flgAMn0E5qBxvZnl8qijXvnMZNjUeUiA4Ir
	QH3R9S7zXIzc6lI7URClkSHHjdSJ3mUAsfa4QDz9yrsYaqiOqWN4dvsoZ2OkK4Nc/QO0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kazZq-0000Vy-42; Fri, 06 Nov 2020 11:06:42 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kazZp-0008Sb-Sh; Fri, 06 Nov 2020 11:06:42 +0000
Subject: Re: [RFC PATCH 4/6] xen/arm64: Port Linux LL/SC and LSE atomics
 helpers to Xen
To: Ash Wilding <ash.j.wilding@gmail.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, rahul.singh@arm.com
References: <20201105185603.24149-5-ash.j.wilding@gmail.com>
 <20201106105501.55396-1-ash.j.wilding@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d6ea3f34-cef5-4a2d-499d-6adb572d6d4a@xen.org>
Date: Fri, 6 Nov 2020 11:06:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106105501.55396-1-ash.j.wilding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 06/11/2020 10:55, Ash Wilding wrote:
> Hi,

Hi Ash,

First of all, thank you for taking a stab at adding LSE support in Xen!

> 
> In retrospect I should have put an intermediate patch between #3 and #4,
> deleting the existing headers. This would have made the patch diff for
> #4 and #5 much easier to read seeing as they are copying the Linux
> versions wholesale into Xen.

While I agree it would help the review, it would break Xen 
bisectability. Although, it should be feasible to fold all the patches 
in one on committing.

If you are going to split the patches then I would suggest the following 
split:
   1) Remove Xen atomic headers
   2) Add a verbatim copy of the Linux headers
   3) Modify them for Xen

With this approach, we can focus on just Xen changes rather than having 
to review the Linux code as well.

> 
> I'll do that for V1 when we get there, but for now to aid in readability
> I've pasted the complete header files below. While doing this I also
> spent some time last night tidying up them up to be in line with the Xen
> coding style.

We usually keep Linux coding style when a file mainly contains Linux 
code. This is making easier to port future fixes from Linux to Xen.

Regarding the review, I have quite a bit of backlog for Xen at the 
moment. I will try to review the series in the next couple of weeks.
I hope that's fine with you.

Cheers,

-- 
Julien Grall

