Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E64A7CDBFE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 14:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618546.962305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt5oj-0005mR-UW; Wed, 18 Oct 2023 12:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618546.962305; Wed, 18 Oct 2023 12:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt5oj-0005jQ-Rw; Wed, 18 Oct 2023 12:38:29 +0000
Received: by outflank-mailman (input) for mailman id 618546;
 Wed, 18 Oct 2023 12:38:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qt5oi-0005jK-DV
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 12:38:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qt5oh-0005al-4B; Wed, 18 Oct 2023 12:38:27 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qt5og-0003vd-T2; Wed, 18 Oct 2023 12:38:27 +0000
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
	bh=7JgcD+65hPVQqgszRth+TW0IiGjRqcomXwa+Uj38sCo=; b=Ifg3vvUOAGsvXTnQFqCg0gB+rq
	m4k99HR0BFoqpZLlC7gVbGaWzUGIWFAglTOeYk609KikDGWwnUrUaZ4QOP5fKruS5Am1JUFX16tI/
	t2qYfduQs6hN5KtT5hfBSgv3wfAmaqlMggxTHe+XrK1xliJeBVWr8KtMPdDfTVF2wf8o=;
Message-ID: <c47528e7-e202-4b5b-85ae-3bb0d1d0b608@xen.org>
Date: Wed, 18 Oct 2023 13:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA C:2012 D4.11 caution on staging
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
 <61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com>
 <baa73fa24385b39bc6e82c4ccb08bd13@bugseng.com>
 <26f09702-9340-41ae-afcc-808becb67876@citrix.com>
 <75a00257-c062-4d82-9b64-1707ce4566e6@xen.org>
 <594c09e1f8b2e1e8321c2cb862fcb378@bugseng.com>
 <5ddb6398-f2a3-4bcb-8808-bad653b6c3cd@xen.org>
 <c4f4f1fc-b20a-c08f-9782-9ce06f6dd868@suse.com>
 <3573c8c2-1a9c-444c-a542-539b16f689f2@xen.org>
 <8c25bfd7768d6b290362f56a8b8d44d9@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8c25bfd7768d6b290362f56a8b8d44d9@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 18/10/2023 13:30, Nicola Vetrini wrote:
> On 17/10/2023 15:28, Julien Grall wrote:
> I tested this, and the report is prevented by the ASSERT. It's up to the 
> maintainers to
> decide how do you want to proceed: my suggestion is deviating it,

It is not clear to me what would you deviate. Can you clarify?

Cheers,

-- 
Julien Grall

