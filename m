Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69512812E5
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 14:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2062.6178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOKKi-00041t-1j; Fri, 02 Oct 2020 12:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2062.6178; Fri, 02 Oct 2020 12:38:44 +0000
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
	id 1kOKKh-00041U-UO; Fri, 02 Oct 2020 12:38:43 +0000
Received: by outflank-mailman (input) for mailman id 2062;
 Fri, 02 Oct 2020 12:38:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOKKg-00041P-HM
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:38:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3681209e-73be-4bf7-8747-fb4cf5a3596b;
 Fri, 02 Oct 2020 12:38:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF58FAD1E;
 Fri,  2 Oct 2020 12:38:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOKKg-00041P-HM
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:38:42 +0000
X-Inumbo-ID: 3681209e-73be-4bf7-8747-fb4cf5a3596b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3681209e-73be-4bf7-8747-fb4cf5a3596b;
	Fri, 02 Oct 2020 12:38:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601642320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=11vWN8IBf60RKOh7w7YSKD4HFojYZshkeYiDIrDSJF0=;
	b=l/tpRyeCoaSw/46YX87J8EmYFb8KsLA5BXJUykoGAYtEV2JJgmnp2Zx65ZH8hfRmeDyaXF
	XBIHZ6Bvt/Tn+cJFz+0NNYzl72IjpEaODIKcidIqcGYA1IYcTYf7JErazl9qk9dkRo92BN
	spXkEWjChlVyVV3FDCyttZ7NE1uwLPU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EF58FAD1E;
	Fri,  2 Oct 2020 12:38:39 +0000 (UTC)
Subject: Re: [PATCH] build: always use BASEDIR for xen sub-directory
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>
References: <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
 <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
 <31FC9BB1-F4C4-4203-94C1-1134607E49C2@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5da46d7-07ee-84b8-fbd8-e2c246c014de@suse.com>
Date: Fri, 2 Oct 2020 14:38:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <31FC9BB1-F4C4-4203-94C1-1134607E49C2@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.10.2020 14:34, Bertrand Marquis wrote:
>> On 2 Oct 2020, at 13:12, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.10.2020 12:42, Bertrand Marquis wrote:
>>> Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
>>>
>>> This is removing the dependency to xen subdirectory preventing using a
>>> wrong configuration file when xen subdirectory is duplicated for
>>> compilation tests.
>>>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks :-)
> 
>>
>> (but more for the slight tidying than the purpose you name)
> 
> Feel free to remove the justification from the commit message if
> you think it is not usefull.

Oh, no, it's not like I consider it not useful. It shows how you
arrived at making the change. It's just that I didn't consider
making copies of xen/ something we mean to be supported. I wouldn't
be surprised if it got broken again ...

Jan

