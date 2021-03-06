Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4CB32FCE3
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 20:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94374.177925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIcyE-00063d-VY; Sat, 06 Mar 2021 19:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94374.177925; Sat, 06 Mar 2021 19:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIcyE-00063H-S1; Sat, 06 Mar 2021 19:52:14 +0000
Received: by outflank-mailman (input) for mailman id 94374;
 Sat, 06 Mar 2021 19:52:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lIcyD-00063C-72
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 19:52:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIcyA-0007wv-IY; Sat, 06 Mar 2021 19:52:10 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIcyA-00073S-7Q; Sat, 06 Mar 2021 19:52:10 +0000
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
	bh=ek6GxqEhnufZUAI0eViLtNegYXP4e2JeQmjzhDOrxVI=; b=dX3X+qI7Y9aE6Zuu6SdMelb7mu
	OUiAcAYuI28ASWPc3iG0FTHVvWzTSO3pCVif5bqdX/doLsb0jpf2W24HAViyA0MnrDQqVPEX4Zdqp
	JSiekSr2F99IjNIgN17BSmOWxlGLCCEFVtyeWnEcxCHMd1d1tVA13/VB5sjsXfQ/P7Dc=;
Subject: Re: [PATCH V4 24/24] [RFC] libxl: Add support for virtio-disk
 configuration
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-25-git-send-email-olekstysh@gmail.com>
 <e1da0892-5496-b438-f52f-1e5dd8d48979@xen.org>
 <87f92e40-6462-21ba-0c56-b77c6518fef8@gmail.com>
 <dce22061-aa73-dba7-601d-fe20f989688d@xen.org>
 <57272148-ff37-1e5e-1b83-b56304431bc9@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <86564c3a-2320-138a-574d-067e9b6ab417@xen.org>
Date: Sat, 6 Mar 2021 19:52:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <57272148-ff37-1e5e-1b83-b56304431bc9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 10/02/2021 09:02, Oleksandr wrote:
> 
> On 20.01.21 19:05, Julien Grall wrote:
> Thinking a bit more what approach to choose...
> I would tend to automatically allocate the virtio IRQ (4th option) 
> rather than use static approach with reserved IRQs
> in order to eliminate the chance of a clash with a physical IRQs 
> completely from the very beginning. From other side
> we can indeed use static approach (as simpler one) for now and then 
> refine it when we have more understanding about the virtio usage.
> What do you think?

The static approach should be fine for now.

Cheers,

-- 
Julien Grall

