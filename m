Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2D53C89FD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 19:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156164.288159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3iuy-0006ry-Vo; Wed, 14 Jul 2021 17:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156164.288159; Wed, 14 Jul 2021 17:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3iuy-0006pI-SW; Wed, 14 Jul 2021 17:43:32 +0000
Received: by outflank-mailman (input) for mailman id 156164;
 Wed, 14 Jul 2021 17:43:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3iux-0006ou-0L
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 17:43:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3ius-000298-6I; Wed, 14 Jul 2021 17:43:26 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3ius-0000Ql-0W; Wed, 14 Jul 2021 17:43:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=/Wy16+YorsKHhbXvrZQZlVtTvl6rC4YImr6ofu1sJfY=; b=oOjw0Dps+67b6zfkHzLccJInSl
	ssSx0dK4BcblBHJonItoRUSEqb8TWFrePx86uAcLlMyZF6wg2x0mHphe18Er+J5LfhnlSKX4PXH72
	irIqKBPmcKVQ+00Cc7W0/ao/ZMsyxIbPnoYD66S7fX3muv2n3IXt7a6yZUs2faBi+k68=;
Subject: Re: [PATCH v2] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, sstabellini@kernel.org,
 jgross@suse.com, christian.lindig@citrix.com, dave@recoil.org
References: <1626139901-9444-1-git-send-email-igor.druzhinin@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <787d05e1-4b85-9a36-6dc1-79d660f19320@xen.org>
Date: Wed, 14 Jul 2021 18:43:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626139901-9444-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Igor,

On 13/07/2021 02:31, Igor Druzhinin wrote:
> Current unit8_t for pirq argument in this interface is too restrictive
> causing failures on modern hardware with lots of GSIs. That extends down to
> XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
> as well.
> 
> Internal Xen structures appear to be fine. Existing users of the interface
> in tree (libxl, ocaml and python bindings) are currently using signed int
> for pirq representation which should be wide enough. Converting them to
> uint32_t now is desirable to avoid accidental passing of a negative
> number (probably denoting an error code) by caller as pirq, but left for
> the future clean up.
> 
> Domctl interface version is needed to be bumped with this change but that
> was already done by 918b8842a8 ("arm64: Change type of hsr, cpsr, spsr_el1
> to uint64_t") in this release cycle.
> 
> Additionally, take a change and convert allow_access argument to bool.
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

The reviewed tags are generally added after the signed-off-by.

The reshuffle can be done on commit.

> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

