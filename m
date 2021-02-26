Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C814325E63
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 08:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90101.170433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFXkj-0006DL-He; Fri, 26 Feb 2021 07:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90101.170433; Fri, 26 Feb 2021 07:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFXkj-0006Cz-EN; Fri, 26 Feb 2021 07:41:33 +0000
Received: by outflank-mailman (input) for mailman id 90101;
 Fri, 26 Feb 2021 07:41:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFXki-0006Cu-Ac
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 07:41:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2237a4f4-cbf6-44db-85f0-f634d1b520c0;
 Fri, 26 Feb 2021 07:41:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27559ADDD;
 Fri, 26 Feb 2021 07:41:29 +0000 (UTC)
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
X-Inumbo-ID: 2237a4f4-cbf6-44db-85f0-f634d1b520c0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614325289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AyWuNdA7FXC5/tU0kRxD8yU7VkIW5TdtlUXQHM6JuME=;
	b=Mhde/J2MunZV90byjEEqb7635Sbb7JrcMRSVMKABcJb/89vqDMdrGI621v8TDWTE/3Bg2W
	SmQWjljlG9g2/wKj3eCFM53sDP9qX7+ym6NVuWyQv94dejPdMQIZA23jUyeZh+6gft86ar
	dyJXd0nhfV0v3I3DKR3d20dsPh5JfYg=
Subject: Re: [PATCH for-next 2/6] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1614265718.git.connojdavis@gmail.com>
 <444658f690c81b9e93c2c709fa1032c049646763.1614265718.git.connojdavis@gmail.com>
 <02f32a31-1c23-46af-54a7-7d44b5ffb613@suse.com>
 <20210226025402.ryuxpicaqujmfxbu@thewall>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34bb915a-be60-1cc7-c802-e0491b6741df@suse.com>
Date: Fri, 26 Feb 2021 08:41:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226025402.ryuxpicaqujmfxbu@thewall>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 03:54, Connor Davis wrote:
> On Thu, Feb 25, 2021 at 04:45:15PM +0100, Jan Beulich wrote:
>> On 25.02.2021 16:24, Connor Davis wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -501,7 +501,9 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>              return -EINVAL;
>>>          }
>>>  
>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>>          if ( !iommu_enabled )
>>> +#endif
>>>          {
>>>              dprintk(XENLOG_INFO, "IOMMU requested but not available\n");
>>>              return -EINVAL;
>>
>> Where possible - to avoid such #ifdef-ary - the symbol instead should
>> get #define-d to a sensible value ("false" in this case) in the header.
>> The other cases here may indeed need to remain as you have them.
>>
> Do you prefer the #define in the same function near the if or
> somwhere near the top of the file?

Neither, if I understand you correctly. It should be in the same header
where the extern declaration lives, for the whole code base to consume.

Jan

