Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209623608EC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 14:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111097.212391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0ok-0000Q4-TR; Thu, 15 Apr 2021 12:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111097.212391; Thu, 15 Apr 2021 12:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0ok-0000Pf-Pi; Thu, 15 Apr 2021 12:09:54 +0000
Received: by outflank-mailman (input) for mailman id 111097;
 Thu, 15 Apr 2021 12:09:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX0oj-0000Pa-Dw
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 12:09:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0oh-0007We-Fc; Thu, 15 Apr 2021 12:09:51 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0oh-0003DH-5R; Thu, 15 Apr 2021 12:09:51 +0000
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
	bh=5iomQNcg8ceRQda8d9lZMqjsuvVk2iKKS/A/xg+5G4E=; b=SO1hhmXASZJK1fV6Ex7Elv2HcN
	nczY7MsFutKs5+Dqf3WxMWIrSuszzYncuvFbZn2LVvmxonr79bwAtrzFNxqshxMdkmf/sY0f2yjOJ
	dZs9X+yeboxQimue7hf1CUTYij6zEpw0Br9mMpV0XY3sIQfaMHhB8+0LCMw+Czm48SxM=;
Subject: Re: [PATCH v3 15/15] unzstd: make helper symbols static
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <22549ef3-62a7-955e-e2ad-8bd47f832b68@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8b5313db-1445-7d70-ac04-d8609d042108@xen.org>
Date: Thu, 15 Apr 2021 13:09:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <22549ef3-62a7-955e-e2ad-8bd47f832b68@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/01/2021 09:53, Jan Beulich wrote:
> While for the original library's purposes these functions of course want
> to be externally exposed, we don't need this, and we also don't want
> this both to prevent unintended use and to keep the name space tidy.
> (When functions have no callers at all, wrap them with a suitable
> #ifdef.) This has the added benefit of reducing the resulting binary
> size - while this is all .init code, it's still desirable to not carry
> dead code.

So why do we keep the code if it is not used? Do you expect it to be 
re-used in the future?

Cheers,

-- 
Julien Grall

