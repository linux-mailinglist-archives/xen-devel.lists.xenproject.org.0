Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61F896DBC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 13:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700476.1093698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rryVo-000854-QL; Wed, 03 Apr 2024 11:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700476.1093698; Wed, 03 Apr 2024 11:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rryVo-00083M-MW; Wed, 03 Apr 2024 11:10:36 +0000
Received: by outflank-mailman (input) for mailman id 700476;
 Wed, 03 Apr 2024 11:10:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+Gt=LI=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rryVm-00083G-9R
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 11:10:34 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c89fdb0d-f1aa-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 13:10:32 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712142622415566.4080634260672;
 Wed, 3 Apr 2024 04:10:22 -0700 (PDT)
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
X-Inumbo-ID: c89fdb0d-f1aa-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; t=1712142628; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TEuSlsBVETkFgkqlwOn4OcQaJFy6whFcQBJFmy62oE30/8o4HQY4lGmecTYfNwZVCiYgzeh5IYSMhBdPGuWcahjKYDYz31aR/YQm4d7neC4Wi91rF7YceYtkxjcwxSwJHFVSw576Pu/BNgPM9zEW4PtVfB3go4CUzYlk5Zd8+SY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712142628; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vYnsYevUGog/RZ9SYLN/Yy6y6pBJcq5EDEgqMMPx3M4=; 
	b=nRZ7W3FCu54rQjMMZVlhYKCcfRUT8ZIOWM84eTm+lDRWpfVLruqyYkEX+QvEBcRXuWzBsyqO36SwQRl5jXw0j5VURRoqbp863H3OCu3sxUo8Mvf75KmRD9Br9ssETRdg26XiW5qXYFoRKyC1tNjMlzoS6tHT7O51vOX+23YylTI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712142628;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vYnsYevUGog/RZ9SYLN/Yy6y6pBJcq5EDEgqMMPx3M4=;
	b=KMldN5cqdfP7EG23GrCpIBQe77xI3xb+kdb9jqgMkOsQdijb4fWm4O8UjHMdx5cO
	rk8SyBfynToxjKr7l+uVxvo17PS3TE7BaYe7alnypFQ3tUY+ZbHOFTHhM8wOV/Y5Drz
	I4k95FNOSXGpInE5RPR5plx/T1uHDSTeJcL4jzds=
Message-ID: <2df1e3ef-32c5-45c3-af1b-e9473a4e9120@apertussolutions.com>
Date: Wed, 3 Apr 2024 07:10:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/3/24 02:16, Jan Beulich wrote:
> On 02.04.2024 19:06, Andrew Cooper wrote:
>> The commit makes a claim without any kind of justification.
> 
> Well, what does "have no business" leave open?

Why does it not have any business? Why should a domain that creates an 
event channel not be able to inquire about its status?

>> The claim is false, and the commit broke lsevtchn in dom0.
> 
> Or alternatively lsevtchn was doing something that was never meant to work
> (from Xen's perspective).

Again, you have not said why this is a problem. What concern does it 
create? Does it open the door for access elevation, resource 
deprivation, or some other malicious behaviors?

>>   It is also quite
>> obvious from XSM_TARGET that it has broken device model stubdoms too.
> 
> Why would that be "obvious"? What business would a stubdom have to look at
> Xen's side of an evtchn?

Again, you have not expressed why it shouldn't be able to do so.

>> Whether to return information about a xen-owned evtchn is a matter of policy,
>> and it's not acceptable to short circuit the XSM on the matter.
> 
> I can certainly accept this as one possible view point. As in so many cases
> I'm afraid I dislike you putting it as if it was the only possible one.

In fact, this commit is in violation of the XSM. It hard-codes a 
resource access check outside XSM, thus breaking the fine-grained access 
control of FLASK.

> In summary: The supposed justification you claim is missing in the original
> change is imo also missing here then: What business would any entity in the
> system have to look at Xen's side of an event channel? Back at the time, 3
> people agreed that it's "none".

As stated, you provided no reason or justification for "has no business" 
and by face value is an opinion that a few people agreed with. As for 
why, there could be a myriad number of reasons a domain may want to 
check the status of an interface it has with the hypervisor. From just 
logging its state for debug to throttling attempts at sending an event. 
So why, from a security/access control decision, does this access have 
to absolutely blocked, even from FLASK?

v/r,
dps

