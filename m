Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6CA314C5A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 11:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83179.154213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Pqx-0008S7-0a; Tue, 09 Feb 2021 10:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83179.154213; Tue, 09 Feb 2021 10:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Pqw-0008Ri-Tv; Tue, 09 Feb 2021 10:02:38 +0000
Received: by outflank-mailman (input) for mailman id 83179;
 Tue, 09 Feb 2021 10:02:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9Pqv-0008Rd-9O
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 10:02:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaa20949-1c72-4972-b76f-c501aa5503c8;
 Tue, 09 Feb 2021 10:02:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81872AC43;
 Tue,  9 Feb 2021 10:02:34 +0000 (UTC)
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
X-Inumbo-ID: eaa20949-1c72-4972-b76f-c501aa5503c8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612864954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FyK5MsDNNp1NN+1loQFIX8n6XjC4zx7Pzae0rBgi9Uc=;
	b=BI9NwY0uI45yVJlZVjomIYZYCTYuT5hG+HmMjPC+Tpr1QUeb3Lphf08EiS3XgSCp/Yow2z
	br6htmfxUnEMXwJsJhX4dFujW0vqM18AQANtrpKnLponPIZwh90KYaBm+QtAgFfImQHbGs
	Luc8A0yfeYNz6EPDBUknH+dg1N9z5y0=
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: lucmiccio@gmail.com, xen-devel@lists.xenproject.org,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, Rahul.Singh@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Ian Jackson <iwj@xenproject.org>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <173ed75a-94cf-26a5-9271-a687bf201578@xen.org>
 <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4df687cb-d3bc-ccb8-4e7c-a6429c37574e@suse.com>
Date: Tue, 9 Feb 2021 11:02:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.02.2021 21:24, Stefano Stabellini wrote:
> On Mon, 8 Feb 2021, Julien Grall wrote:
>> On 08/02/2021 18:49, Stefano Stabellini wrote:
>>> Given the severity of the bug, I would like to request this patch to be
>>> backported to 4.12 too, even if 4.12 is security-fixes only since Oct
>>> 2020.
>>
>> I would agree that the bug is bad, but it is not clear to me why this would be
>> warrant for an exception for backporting. Can you outline what's the worse
>> that can happen?
>>
>> Correct me if I am wrong, if one can hit this error, then it should be pretty
>> reliable. Therefore, anyone wanted to use 4.12 in production should have seen
>> if the error on there setup by now (4.12 has been out for nearly two years).
>> If not, then they are most likely not affected.
>>
>> Any new users of Xen should use the latest stable rather than starting with an
>> old version.
> 
> Yes, the bug reproduces reliably but it takes more than a smoke test to
> find it. That's why it wasn't found by OSSTest and also our internal
> CI-loop at Xilinx.
> 
> Users can be very slow at upgrading, so I am worried that 4.12 might still
> be picked by somebody, especially given that it is still security
> supported for a while.
> 
> 
>> Other than the seriousness of the bug, I think there is also a fairness
>> concern.
>>
>> So far our rules says there is only security support backport allowed. If we
>> start granting exception, then we need a way to prevent abuse of it. To take
>> an extreme example, why one couldn't ask backport for 4.2?
>>
>> That said, I vaguely remember this topic was brought up a few time on
>> security@. So maybe it is time to have a new discussion about stable tree.
> 
> I wouldn't consider a backport for a tree that is closed even for
> security backports. So in your example, I'd say no to a backport to 4.2
> or 4.10.
> 
> I think there is a valid question for trees that are still open to
> security fixes but not general backports.
> 
> For these cases, I would just follow a simple rule of thumb:
> - is the submitter willing to provide the backport?
> - is the backport low-risk?
> - is the underlying bug important?
> 
> If the answer to all is "yes" then I'd go with it.

Personally I disagree, for the very simple reason of the question
going to become "Where do we draw the line?" The only non-security
backports that I consider acceptable are low-risk changes to allow
building with newer tool chains. I know other backports have
occurred in the past, and I did voice my disagreement with this
having happened.

But this is a community decision, so my opinion counts as just a
single vote.

Jan

