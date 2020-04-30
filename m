Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A71C0073
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 17:36:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUBDs-0001E1-L1; Thu, 30 Apr 2020 15:35:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUBDr-0001Dw-VR
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 15:35:36 +0000
X-Inumbo-ID: 3c0587cc-8af8-11ea-9a6e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c0587cc-8af8-11ea-9a6e-12813bfff9fa;
 Thu, 30 Apr 2020 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tyZfHeYcIwisUGDk0YMJ4m3ZCUwEncCi8h2a9kvhlk4=; b=qLwmsUd0IjXhK+jjTNjDmsrksF
 jDQKagwuRVYDFg1CRMjRWvjC/2X4I3C60bs+yOIu/LO8W/GAuppK21+HduK4ZthQsYgbIHWzli+No
 YxPetGxbLKEl9xE5xGKN3gl4oXC79rmFueKU6Kw/UMiTaw7aoQnOnV3H+3Yqh3VKL30s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUBDo-0006M8-TH; Thu, 30 Apr 2020 15:35:32 +0000
Received: from 82.162.187.81.in-addr.arpa ([81.187.162.82]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUBDo-0005BC-Ln; Thu, 30 Apr 2020 15:35:32 +0000
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Jan Beulich <jbeulich@suse.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <548a9fc5-c251-5d8b-d297-4788d60b801d@xen.org>
Date: Thu, 30 Apr 2020 16:35:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 30/04/2020 15:50, Jan Beulich wrote:
> On 30.04.2020 16:25, Julien Grall wrote:
>> EXPERT mode is currently used to gate any options that are in technical
>> preview or not security supported At the moment, the only way to select
>> it is to use XEN_CONFIG_EXPERT=y on the make command line.
>>
>> However, if the user forget to add the option of one of the make
>> command (even a clean), then .config will get rewritten. This may lead
>> to a rather frustrating experience as it is difficult to diagnostic the
>> issue.
> 
> Is / will this still be true after Anthony's rework of the build
> system? Right now we already have
> 
> clean-targets := %clean
> no-dot-config-targets := $(clean-targets) \
>                           ...

I haven't tried Anthony's rework yet. But I guess the problem would be 
the same if you forget to add XEN_CONFIG_EXPERT=y on make.

> 
>> A lot of the options behind EXPERT would benefit to get more tested in
>> order to be mark as fully supported in the future.
> 
> Anyone intending to get an EXPERT-only option fully supported will
> need to do focused testing; I don't think we can expect to move
> items out of this category just because more people happen to test
> something every now and then.

I didn't imply this was the only condition to get a feature security 
suported. I merely pointed out that more testing would help to harden 
the code. If you make difficult to access an option then it will be less 
tested and take longer to get it security supported.

> 
>> In order to make easier to experiment, the option EXPERT can now be
>> selected from the menuconfig rather than make command line. This does
>> not change the fact a kernel with EXPERT mode selected will not be
>> security supported.
> 
> Well, if I'm not mis-remembering it was on purpose to make it more
> difficult for people to declare themselves "experts". FAOD I'm not
> meaning to imply I don't see and accept the frustration aspect you
> mention further up. The two need to be carefully weighed against
> one another.

Some of the options behind EXPERT mode don't make sense. For instance, 
how adding a built-in command line requires to be expert? I understand 
we don't want to support it, but I don't see any reason to make the 
user's life more difficult here.

Cheers,

-- 
Julien Grall

