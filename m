Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B6755FCF3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357723.586485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6UkD-00053X-NF; Wed, 29 Jun 2022 10:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357723.586485; Wed, 29 Jun 2022 10:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6UkD-00050y-JC; Wed, 29 Jun 2022 10:16:25 +0000
Received: by outflank-mailman (input) for mailman id 357723;
 Wed, 29 Jun 2022 10:16:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6UkB-00050f-Kh
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:16:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6UkA-0008CO-RL; Wed, 29 Jun 2022 10:16:22 +0000
Received: from [54.239.6.187] (helo=[192.168.9.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6UkA-0003J7-Kq; Wed, 29 Jun 2022 10:16:22 +0000
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
	bh=CDX5dW/kN9Ma7LhWIm4Lj0I6P9fRWx6ltP0lA23bHAg=; b=DfkMqrvwQ+kF5pMdbgkWR1Q5/2
	fCNtxYESVyphuBy6pS6In7JEScskgbDlaqB/4v2Wl4iMki6ZQqu3DUOE8V33cBrW1+sOr7it8aU0m
	mCAAmmRYnXCeD3w452jv5FcnQ/hitLouIm+njw0eFZChOwu/IltTn8IVx1F4nHotn3pQ=;
Message-ID: <57926957-8bdd-d62b-55fb-47874dc51cdb@xen.org>
Date: Wed, 29 Jun 2022 11:16:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
 <15F23829-3693-47CC-A9D6-3D7A3B44EB64@arm.com>
 <88bd7017-e2b3-59f3-a68a-25db9e53136d@xen.org>
 <CA8DFF26-3D7F-4CDA-9EDC-E173203B2A51@arm.com>
 <81c33c8c-e345-2fe3-32c6-2f80799eefd0@xen.org>
 <C7643376-EBD0-46C3-B940-D3F6198BD124@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <C7643376-EBD0-46C3-B940-D3F6198BD124@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 28/06/2022 16:23, Luca Fancellu wrote:
>> On 24 Jun 2022, at 18:25, Julien Grall <julien@xen.org> wrote:
>> On 24/06/2022 14:34, Luca Fancellu wrote:
>>>> On 24 Jun 2022, at 13:17, Julien Grall <julien@xen.org> wrote:
> Sorry for the late reply, this would be my changes, would you agree on them?

They LGTM.

Cheers,

-- 
Julien Grall

