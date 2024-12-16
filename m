Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A19F3A6F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 21:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858463.1270676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNHLg-0003Ut-L9; Mon, 16 Dec 2024 20:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858463.1270676; Mon, 16 Dec 2024 20:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNHLg-0003Sp-Hw; Mon, 16 Dec 2024 20:05:48 +0000
Received: by outflank-mailman (input) for mailman id 858463;
 Mon, 16 Dec 2024 20:05:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tNHLf-0003Sj-HA
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 20:05:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tNHLe-006UKT-2U;
 Mon, 16 Dec 2024 20:05:47 +0000
Received: from [82.144.38.251] (helo=[172.20.15.232])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tNHLe-00Beu4-2e;
 Mon, 16 Dec 2024 20:05:46 +0000
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
	bh=J6I8O2KdoJORnaTNtLWh3Ofd6xfbZLrD6Vu54ZZ1BnQ=; b=ryzy3l+7WPM7n7PP5QWdCZrBqS
	TrKokkrEwWmOLntE8QVYILKX5bQSiJ0KYHGXg1WWkgzgveZGFcqOGSiG5FGDl/ElijXBiYeWPWpwG
	21dDkYTfUw6UmIciW4RjlN1TZj4yns3+GHm4Ytt8baxxeRQj4MqbKOjAfeeOXEVFiWT8=;
Message-ID: <38870638-6d87-4a0d-843d-37cc55bb54a9@xen.org>
Date: Mon, 16 Dec 2024 21:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] xen/arm: ffa: Fine granular call support
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1732702210.git.bertrand.marquis@arm.com>
 <1b02c9c1df9ff2230e076f25398a5de876f98a51.1732702210.git.bertrand.marquis@arm.com>
 <8d8ef7f9-d73f-4ff8-8af9-4e73cda97624@xen.org>
 <03D53BB9-1751-42DF-9AAD-41B25E915027@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <03D53BB9-1751-42DF-9AAD-41B25E915027@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/12/2024 08:06, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 13 Dec 2024, at 23:57, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 27/11/2024 16:07, Bertrand Marquis wrote:
>>> Create a bitmap to store which feature is supported or not by the
>>> firmware and use it to filter which calls are done to the firmware.
>>> While there reoder ABI definition by numbers to easily find the min and
>>
>> Typo (I can fix it while committing): s/reoder/reorder
> 
> Thanks for the finding.
> Please fix on commit if that is ok for you.
> 
> There are also 2 minor findings on the patch 7 that could be fixed on commit.

I think I fixed all the minor findings and it is now committed.

Cheers,

-- 
Julien Grall


