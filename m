Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6650272EC46
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 21:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548381.856318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q99zF-0007iT-1b; Tue, 13 Jun 2023 19:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548381.856318; Tue, 13 Jun 2023 19:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q99zE-0007gM-VD; Tue, 13 Jun 2023 19:47:28 +0000
Received: by outflank-mailman (input) for mailman id 548381;
 Tue, 13 Jun 2023 19:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=272C=CB=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1q99zD-0007gG-OG
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 19:47:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e701161-0a23-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 21:47:26 +0200 (CEST)
Received: from [192.168.1.98] (unknown [176.206.20.8])
 by support.bugseng.com (Postfix) with ESMTPSA id D4BCD4EE0738;
 Tue, 13 Jun 2023 21:47:23 +0200 (CEST)
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
X-Inumbo-ID: 1e701161-0a23-11ee-b232-6b7b168915f2
Message-ID: <fab38a04-20ac-c2bc-7e8f-9ae00524ba6b@bugseng.com>
Date: Tue, 13 Jun 2023 21:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [PATCH] xen/evtchn: Purge ERROR_EXIT{,_DOM}()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
 <d3883a59-acff-198c-a688-ac2546de69a7@xen.org>
 <86f357da-2fe1-7fe4-c061-d30b8e5bcbd3@srcf.net>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <86f357da-2fe1-7fe4-c061-d30b8e5bcbd3@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/06/23 19:45, Andrew Cooper wrote:
> On 13/06/2023 6:39 pm, Julien Grall wrote:
>> Hi,
>>
>> On 13/06/2023 17:22, Andrew Cooper wrote:
>>> These are disliked specifically by MISRA, but they also interfere
>>> with code
>>
>> Please explicitly name the rule.
> 
> I can't remember it off the top of my head.
> 
> Stefano/Bertrand?

Rule 2.1

>>> legibility by hiding control flow.  Expand and drop them.
>>>
>>>    * Rearrange the order of actions to write into rc, then render rc
>>> in the
>>>      gdprintk().
>>>    * Drop redundant "rc = rc" assignments
>>>    * Switch to using %pd for rendering domains
>>>
>>> No functional change.  Resulting binary is identical.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks.
> 
>>
>>> base-commit: f29363922c1b41310c3d87fd9a861ffa9db9204a
>>
>> I notice you have a few e-mail contain this tag. This is a pretty
>> useful when reviewing patches. Do you know which tool is creating it?
> 
> Plain git, and the capability has been around for years and years but
> nigh on impossible to search for or find in the manual.  Searching for
> "base-commit" gets you a tonne of intros of how to rebase.
> 
> You want
> 
> [format]
>          useAutoBase = "whenAble"
> 
> or pass --base=auto to git-format-patch
> 
> ~Andrew
> 

