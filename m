Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8FB5B9B68
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 14:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407359.649847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYoPc-0003ll-Nz; Thu, 15 Sep 2022 12:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407359.649847; Thu, 15 Sep 2022 12:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYoPc-0003ij-Ky; Thu, 15 Sep 2022 12:56:12 +0000
Received: by outflank-mailman (input) for mailman id 407359;
 Thu, 15 Sep 2022 12:56:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oYoPb-0003id-3a
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 12:56:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oYoPZ-0005zc-OQ; Thu, 15 Sep 2022 12:56:09 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.18.122]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oYoPZ-0003q8-Ge; Thu, 15 Sep 2022 12:56:09 +0000
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
	bh=eRKyrz5fVarARKgF6gqSbHQcFWNUcEEmQ2/Nmg7xrzo=; b=O0ikzSy2LZy4gqzcbi0XBXeMnM
	25NG/3+z2fRpqAiEvjEUF/7qoKvnTqWBm4kIKq3Xx7x6knwFrynOSw1iT5eGrgA2tejWcAoIKsL7X
	GuJ6PYDdM2Mdan6qJhzdDzBwuI9nnCJF4HRKAtjWtfHhqR2iNrc5Oew5t2vHjrmTAzq0=;
Message-ID: <006c5779-2ee5-0e37-1b00-c6c58ef57c71@xen.org>
Date: Thu, 15 Sep 2022 13:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH for-4.17?] x86: support data operand independent timing
 mode
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Simon Gaiser <simon@invisiblethingslab.com>
References: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
 <YyMLg7KbeOT1MMpH@itl-email>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YyMLg7KbeOT1MMpH@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Demi,

On 15/09/2022 12:24, Demi Marie Obenour wrote:
> On Thu, Sep 15, 2022 at 12:04:55PM +0200, Jan Beulich wrote:
>> [1] specifies a long list of instructions which are intended to exhibit
>> timing behavior independent of the data they operate on. On certain
>> hardware this independence is optional, controlled by a bit in a new
>> MSR. Provide a command line option to control the mode Xen and its
>> guests are to operate in, with a build time control over the default.
>> Longer term we may want to allow guests to control this.
> 
>> Since Arm64 supposedly also has such a control, put command line option
>> and Kconfig control in common files.
> 
>> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
> 
>> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks for the patch, Jan!
> 
>> This may be viewed as a new feature, and hence be too late for 4.17. It
>> may, however, also be viewed as security relevant, which is why I'd like
>> to propose to at least consider it.
> 
> I consider it security relevant indeed, which is why I was so insistent
> on it.  Whether it is worth a full XSA is up to the Xen Security Team.
> If it could be backported to stable releases, that would be great.
> 
> Marek, Simon, would you consider backporting this to R4.1?
> 
>> Slightly RFC, in particular for whether the Kconfig option should
>> default to Y or N.
> 
> I think it should default to Y as long as guests do not have the ability
> to control this.

This raises two questions:
  1) What is the performance impact to turn this on by default? I am 
looking for actual numbers.
  2) What happen on HW that doesn't support DIT? Are we going to mark 
them as unsupported?

>  Otherwise any cryptographic code in the guests thinks
> it is constant time when it may not be.

Why would a guest think that? Are we telling the guest DIT is supported 
but doesn't honour it?

If yes, then I would argue that we should clear that bit. Otherwise...

>  Once guests have the ability to
> control this I would be open to reconsidering this.

... this will introduce a problem once we expose it to the guest because 
we cannot change the global default as some user my start to rely on it 
on the default.

Cheers,

-- 
Julien Grall

