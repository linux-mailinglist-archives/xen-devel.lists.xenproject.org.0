Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF3902A0A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 22:39:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737558.1143923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGlmh-000836-ER; Mon, 10 Jun 2024 20:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737558.1143923; Mon, 10 Jun 2024 20:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGlmh-00081L-Aw; Mon, 10 Jun 2024 20:38:31 +0000
Received: by outflank-mailman (input) for mailman id 737558;
 Mon, 10 Jun 2024 20:38:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sGlmf-00081D-DM
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 20:38:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sGlme-0008Lm-97; Mon, 10 Jun 2024 20:38:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.245])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sGlme-0005gt-2j; Mon, 10 Jun 2024 20:38:28 +0000
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
	bh=p2WrA/EEMgK3kjMP30WlqWYMjW3EJ8VqTbsaH2qOaOo=; b=WJ6RySQqUlRPU8iwqPSskKraOZ
	d/aP30u9AKLtAe14f8VABPah/2HN8QFXpMPpNoandm60eMdpL+BThMNt+H5fgF7kVbwACI5uieuWB
	w17tiH5o6QQqJxGZ43k0pYbT0hEKx7abE10WmCkX8L8Y9xrGqkzoWxSzPQxkC3rw85BE=;
Message-ID: <615f1766-253d-43dc-b0f0-f8e2eb7360b5@xen.org>
Date: Mon, 10 Jun 2024 21:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6 0/7] FF-A notifications
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Oleksii <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
 <3C40228F-21AA-4CBF-A4BE-1C42DE6E94EB@arm.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <3C40228F-21AA-4CBF-A4BE-1C42DE6E94EB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 10/06/2024 16:54, Bertrand Marquis wrote:
> Hi Jens,
> 
>> On 10 Jun 2024, at 08:53, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>
>> Hi,
>>
>> This patch set adds support for FF-A notifications. We only support
>> global notifications, per vCPU notifications remain unsupported.
>>
>> The first three patches are further cleanup and can be merged before the
>> rest if desired.
>>
>> A physical SGI is used to make Xen aware of pending FF-A notifications. The
>> physical SGI is selected by the SPMC in the secure world. Since it must not
>> already be used by Xen the SPMC is in practice forced to donate one of the
>> secure SGIs, but that's normally not a problem. The SGI handling in Xen is
>> updated to support registration of handlers for SGIs that aren't statically
>> assigned, that is, SGI IDs above GIC_SGI_MAX.
>>
>> The patch "xen/arm: add and call init_tee_secondary()" provides a hook for
>> register the needed per-cpu interrupt handler in "xen/arm: ffa: support
>> notification".
>>
>> The patch "xen/arm: add and call tee_free_domain_ctx()" provides a hook for
>> later freeing of the TEE context. This hook is used in "xen/arm: ffa:
>> support notification" and avoids the problem with TEE context being freed
>> while we need to access it when handling a Schedule Receiver interrupt. It
>> was suggested as an alternative in [1] that the TEE context could be freed
>> from complete_domain_destroy().
>>
>> [1] https://lore.kernel.org/all/CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy4eWhyN+F+w@mail.gmail.com/
>>
>> Thanks,
>> Jens
> 
> All patches are now reviewed and/or acked so I think they can get in for the release.

This would need a release-ack from Oleksii (I can't seem to find already 
one).

As we discussed last week, I am fine with the idea to merge the FFA 
patches as the feature is tech-preview. But there are some changes in 
the arm generic code. Do you (or Jens) have an assessment of the risk of 
the changes?

Cheers,

-- 
Julien Grall

