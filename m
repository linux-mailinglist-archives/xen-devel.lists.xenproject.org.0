Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE891CA7BE
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 12:00:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWzng-0006Rq-T0; Fri, 08 May 2020 10:00:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nu4B=6W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jWznf-0006Rl-3m
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 10:00:11 +0000
X-Inumbo-ID: b2d7086a-9112-11ea-9fda-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2d7086a-9112-11ea-9fda-12813bfff9fa;
 Fri, 08 May 2020 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O0OkjHYnq9+w0lp7tGf40PLsmsbfev6xtdny3rnhGCY=; b=0CS1EtfUX/3KVpMeldXsj6CFjN
 DKFqx2anGlH6JRa0D+fi+vi6o2dlNH2rJdXMCf2hwfkqCkseUPx7dMDK/WmwFSBjDPLUEWBW5rO6W
 EmKw2PElhcXdFOeRb+DUQUbvUq2Z3bEb05xGQ51p2PN4ZSWk2Iuilp9pvSCmb47+pv4w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jWznX-0004zI-K6; Fri, 08 May 2020 10:00:03 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jWznX-0004CR-Bp; Fri, 08 May 2020 10:00:03 +0000
Subject: Re: Xen Coding style
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>
References: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
 <8771c424-6340-10e5-1c1f-d72271ab8c1b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <38926d4e-3429-58bc-f43c-514aed253a8e@xen.org>
Date: Fri, 8 May 2020 11:00:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8771c424-6340-10e5-1c1f-d72271ab8c1b@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 08/05/2020 09:36, Jan Beulich wrote:
> On 07.05.2020 16:43, Julien Grall wrote:
>> This was originally discussed during the last community call.
>>
>> A major part of the comments during review is related to coding style issues. This can lead to frustration from the contributor as the current CODING_STYLE is quite light and the choice often down to a matter of taste from the maintainers.
>>
>> In the past, Lars tried to address the problem by introducing a coding style checker (see [1] and [2]). However, the work came to stop because we couldn't agree on what is Xen coding style.
>>
>> I would like to suggest a different approach. Rather than trying to agree on all the rules one by one, I propose to have a vote on different coding styles and pick the preferred one.
>>
>> The list of coding styles would come from the community. It could be coding styles already used in the open source community or new coding styles (for instance a contributor could write down his/her understanding of Xen Coding Style).
>>
>> Are the committers happy with this appraoch?
> 
> I'm not, sorry, and I'm pretty sure I indicated so before. For one I
> don't think picking an arbitrary other style than what we currently use
> is going to be helpful: It'll be a significant amount of code churn all
> over the code base. Instead I think the basic current principle should
> remain: Imported files, if not heavily changed, are permitted to retain
> their original style, while "our" files get written in "our" style.
> (Recording which one's which is still tbd.)

There are existing coding styles that are quite close to the one used by 
Xen (such as BSD). We could either use them as-is or make small changes 
to fit Xen.

> 
> I don't think though this necessarily implies "to agree on all the rules
> one by one" - we could also settle on there explicitly being freedom
> beyond what's spelled out explicitly. I'd not be happy with this, as it
> would lead to a lot of inconsistencies over time, but it's still an
> option. Obviously there's the wide range of middle ground to agree on
> some more rules to become written down (I did propose a few over time,
> without - iirc - getting helpful, if any, feedback), while leaving the
> rest up to the author.
> 
> The main thing we need to settle on imo is whether unwritten rules
> count. Me being picky isn't because of me liking to be, but because of
> me thinking that a consistent code base is quite helpful. If consensus
> is that consistency is not a goal, I'll accept this (with some
> grumbling).

Consistency is important, but this should not be based on unwritten 
rules. We should be able to write a script that can check whether a 
patch contain any violations.

The end goal is to reduce the workload on the reviewer and the tension 
within the community.

You seem to be the maintainer with the most unwritten rules. Would you 
mind to have a try at writing a coding style based on it?

Cheers,

-- 
Julien Grall

