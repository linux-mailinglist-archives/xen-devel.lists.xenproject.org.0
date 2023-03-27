Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59FD6CA1C7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515158.797757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkUW-0006NQ-Bz; Mon, 27 Mar 2023 10:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515158.797757; Mon, 27 Mar 2023 10:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkUW-0006L5-8d; Mon, 27 Mar 2023 10:54:20 +0000
Received: by outflank-mailman (input) for mailman id 515158;
 Mon, 27 Mar 2023 10:54:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pgkUU-0006Kv-Nr
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:54:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgkUU-0000ra-6q; Mon, 27 Mar 2023 10:54:18 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.159.134]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgkUU-00025O-0W; Mon, 27 Mar 2023 10:54:18 +0000
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
	bh=qi/fVjMN3SRXP9H2YgYgA80ZOVD1D78rjcbcT23s11o=; b=g11Ut4nJmFTmt3ne1D3jX/5YNh
	exVo0FhkJmfUByWCcmjMFv2WxYMNhOGF9M0xjeOM0KfObmqyqy/w0umrMv1NwSizH3StnAN83AFyx
	KZVnqfVPISSD1OOk6SAb/HaWy5aMzUYc5rZQ/ckYbLoMSEQHbSg+j7vY6OD6JRzuEdKc=;
Message-ID: <27fb1c9b-f504-092b-de2d-ed823f417b38@xen.org>
Date: Mon, 27 Mar 2023 11:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
 <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
 <dd8b038c00fba91d0e50d4bb8c98466dfd37ef01.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dd8b038c00fba91d0e50d4bb8c98466dfd37ef01.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 27/03/2023 11:50, Oleksii wrote:
> Hello Julien,

Hi,

> On Tue, 2023-03-21 at 17:58 +0000, Julien Grall wrote:
>>> +        /* Setup level0 table */
>>> +        if ( !pte_is_valid(&zeroeth[index0]) )
>>
>> On the previous version, you said it should be checked for each
>> level.
>> But here you still only check for a single level.
>>
>> Furthermore, I would strongly suggest to also check the valid PTE is
>> the
>> same as you intend to write to catch any override (they are a pain to
>> debug).
>>
> Do you mean that I have to get a virtual address, extract the page
> table index bits from it, traverse the page table hierarchy to locate
> the PTE for the virtual address and the compare the gotten PTE address
> with zeroeh[index0]?

No. I was suggesting to check the PTE you intend to write is the exact 
same that the one you are overwriting.

This could potentially be relaxed to allow permission flags to be changed.

Cheers,

-- 
Julien Grall

