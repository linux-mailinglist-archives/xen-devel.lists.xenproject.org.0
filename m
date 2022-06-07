Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B253FD99
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 13:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343152.568318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyXU0-0001z0-Ca; Tue, 07 Jun 2022 11:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343152.568318; Tue, 07 Jun 2022 11:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyXU0-0001vH-8q; Tue, 07 Jun 2022 11:34:48 +0000
Received: by outflank-mailman (input) for mailman id 343152;
 Tue, 07 Jun 2022 11:34:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nyXTz-0001v9-0e
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 11:34:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyXTw-0003GR-PX; Tue, 07 Jun 2022 11:34:44 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.23.140]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyXTw-0006VT-Iv; Tue, 07 Jun 2022 11:34:44 +0000
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
	bh=FDoIl+m/RiJW6Wizp3jfa76PNVptIK6ZFlP5XDbG9e8=; b=aTzV0d9g5mmzSiXtd3Ep/s0Wtg
	uJyDUSQGJRdoQIQqN+fhqvFC6xqEUsJpQ2Zkds0mDwoy/mGpLhmc0BBm9bVpHAFqwcFigV7w2mPlU
	CBy7/GbaWky5q9G9s+GqyKwO7giqjCzgEh4uENaudyWsgOrz7QyZUEhUjfmzghr9Ycnk=;
Message-ID: <9e02210b-237b-0af3-b5b8-57ddeef55707@xen.org>
Date: Tue, 7 Jun 2022 12:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <2F13F24D-0A55-4BC3-9AC6-606C7E1626E8@arm.com>
 <4ebbb465-00ec-f4ba-8555-711cd76517ed@apertussolutions.com>
 <YpYdqglsWIlsFsaB@Air-de-Roger>
 <8F3BD9BB-EC62-4721-9BD0-3E4CC1E75A22@citrix.com>
 <Ypcr/N/0FpxepyTc@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Ypcr/N/0FpxepyTc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/06/2022 10:06, Roger Pau Monné wrote:
> On Wed, Jun 01, 2022 at 07:40:12AM +0000, George Dunlap wrote:
>> The down side of this is that you can’t use “automatically remove trailing whitespace on save” features of some editors.
>>
>> Without such automation, I introduce loads of trailing whitespace.  With such automation, I end up removing random trailing whitespace as I happen to touch files.  I’ve always done this by just adding “While here, remove some trailing whitespace” to the commit message, and there haven’t been any complaints.
> 
> FWIW, I have an editor feature that highlights trailing whitespace,
> but doesn't remove it.
> 
> As said, I find it cumbersome to have to go through more jumps while
> using `git blame` or similar, just because of unrelated cleanups.
> 
> IMO I don't think it's good practice to wholesale replace all trailing
> whitespace from a file as part of an unrelated change.  

+1

Cheers,

-- 
Julien Grall

