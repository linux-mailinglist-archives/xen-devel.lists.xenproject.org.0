Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF22262EF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 17:05:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxXLl-0001Wy-FG; Mon, 20 Jul 2020 15:05:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eely=A7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxXLk-0001Wt-LO
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 15:05:04 +0000
X-Inumbo-ID: 63db1438-ca9a-11ea-849d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63db1438-ca9a-11ea-849d-bc764e2007e4;
 Mon, 20 Jul 2020 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sXjziw0/SXeIJ1COJ+9Lak3CJRjc5LGSwcGlCIPp4QA=; b=MGBjdM8z9ubDR46+dZlEoTJT0o
 T1YzcPl3U7gU/J1wfxR6Rqh6czEyWW5lBbdgf9viJXdSYp4sIlikJue70ZbhTIPHrb1xhk/w56XQt
 lxEYuuZtkKqQhkfVvGKgdJpiGHL/KWgXvFk8rvQCQdska8J+t7i6d2iBdMTJ12L+614w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxXLh-0000IZ-55; Mon, 20 Jul 2020 15:05:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxXLg-00024o-UI; Mon, 20 Jul 2020 15:05:01 +0000
Subject: Re: Proposal: rename xen.git#master (to #trunk, perhaps)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>
References: <24307.31637.214096.240023@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2006241033210.8121@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <077b1dfa-bcc5-76bc-47f1-1a2bc207cece@xen.org>
Date: Mon, 20 Jul 2020 16:04:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006241033210.8121@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 24/06/2020 18:38, Stefano Stabellini wrote:
> On Wed, 24 Jun 2020, Ian Jackson wrote:
>> I think it would be a good idea to rename this branch name.  This name
>> has unfortunate associations[1], even if it can be argued[2] that the
>> etymology is not as bad as in some uses of the word.
>>
>> This is relativity straightforward on a technical level and will
>> involve a minimum of inconvenience.  Since only osstest ever pushes to
>> xen.git#master, we could easily make a new branch name and also keep
>> #master for compatibility as long as we like.
>>
>> The effects[1] would be:
>>
>> Users who did "git clone https://xenbits.xen.org/git-http/xen.git""
>> would find themselves on a branch called "trunk" which tracked
>> "origin/trunk", by default.  (Some users with old versions of git
>> using old protocols would still end up on "master".)
>>
>> Everyone who currently tracks "master" would be able to switch to
>> tracking "trunk" at their leisure.
>>
>> Presumably at some future point (a year or two from now, say) we would
>> abolish the name "master".
>>
>> Comments ?  In particular, comments on:
>>
>> 1. What the new branch name should be called.  Suggestions I have seen
>> include "trunk" and "main".  I suggest "trunk" because this was used
>> by SVN, CVS, RCS, CSSC (and therefore probably SCCS) for this same
>> purpose.
> 
> Github seems to be about to make a similar change. I wonder if we should
> wait just a couple of weeks to see what name they are going to choose.

I have just tried to create a new repo on github. It looks like the 
default is still 'master' so far.

> 
> https://www.theregister.com/2020/06/15/github_replaces_master_with_main/
> 
> 
> Of course I don't particulalry care one way or the other, but it would
> be good if we end up using the same name as everybody else. It is not
> that we have to choose the name Github is going to choose, but their
> user base is massive -- whatever they are going to pick is very likely
> going to stick.

+1

Cheers,

-- 
Julien Grall

