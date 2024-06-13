Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7674D907239
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 14:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739942.1146901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjos-0000Qn-T2; Thu, 13 Jun 2024 12:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739942.1146901; Thu, 13 Jun 2024 12:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjos-0000Nz-PQ; Thu, 13 Jun 2024 12:44:46 +0000
Received: by outflank-mailman (input) for mailman id 739942;
 Thu, 13 Jun 2024 12:44:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sHjor-0000Nt-3y
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 12:44:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sHjop-0000XR-JJ; Thu, 13 Jun 2024 12:44:43 +0000
Received: from [15.248.2.235] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sHjop-0004d8-A7; Thu, 13 Jun 2024 12:44:43 +0000
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
	bh=zOXqRhHHRj26v5QgB4k79VEHKG0EmO6UxKsZfxY/i3E=; b=GMn4pzAlQ1BhoF7LWObrENZkKP
	t49Ivkq2kYNwxBGS01YgyNkALthODw6Xilz4unatUHTPhBVe/n4IQ83r9B30f0bsH2wrAu69aBq2u
	y3fpOsm5j9Pd07Q7Xfk2GiRQCD8Wz4xprn4bL5BncEx+AHP0pOrJo5DM+OoNgHfTK5Vk=;
Message-ID: <fefb0ceb-0713-4520-b9a7-e37aa2f77850@xen.org>
Date: Thu, 13 Jun 2024 13:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6 0/7] FF-A notifications
Content-Language: en-GB
To: "Oleksii K." <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
 <3C40228F-21AA-4CBF-A4BE-1C42DE6E94EB@arm.com>
 <615f1766-253d-43dc-b0f0-f8e2eb7360b5@xen.org>
 <8558AEB5-2F38-4F8C-A017-794E32045068@arm.com>
 <6a255f3dccc609e680659ed05b613c21a33cfb20.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6a255f3dccc609e680659ed05b613c21a33cfb20.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/06/2024 11:36, Oleksii K. wrote:
> Hi Bertrand and Julien,
> 
> On Tue, 2024-06-11 at 07:09 +0000, Bertrand Marquis wrote:
>> Hi Julien and Oleksii,
>>
>> @Oleksii: Could we consider having this serie merged for next release
>> ?
> We can consider including it in Xen 4.19 as it has a low impact on
> existing systems and needs to be explicitly activated:
>   Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

It is now merged.

Cheers,

-- 
Julien Grall

