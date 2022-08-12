Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF86C590FB1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 12:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385551.621223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMSF2-00051l-FJ; Fri, 12 Aug 2022 10:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385551.621223; Fri, 12 Aug 2022 10:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMSF2-0004yv-C1; Fri, 12 Aug 2022 10:50:12 +0000
Received: by outflank-mailman (input) for mailman id 385551;
 Fri, 12 Aug 2022 10:50:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMSF1-0004yp-LM
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 10:50:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMSF1-0008LV-Bg; Fri, 12 Aug 2022 10:50:11 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.11.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMSF1-00027z-5p; Fri, 12 Aug 2022 10:50:11 +0000
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
	bh=q7Ldn9AW7yoaFT/XHS5437Hk+jnBJuJdy2NvhHIWVrw=; b=DPHzb8NmWGhnzuewtYkzO/xUbn
	B9nYXDCitQRxZj/sow4xY4abQEjuNQjtPppKouWRXo7ZcXJrpDMIHQTdav0BEqMlCcMTPvNuUiCfl
	xN09bBXlnJUUY4qJ6upMGxDVPQLvjhePCY3998RffobkAw+bj+pZM4K7ancsflLYsMEI=;
Message-ID: <bd71b8af-5f88-8c01-b653-cfbce7e2ace5@xen.org>
Date: Fri, 12 Aug 2022 11:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v3 5/5] tools/xenstore: add migration stream extensions
 for new features
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-6-jgross@suse.com>
 <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
 <6e62b262-f4ef-ecd7-291a-ca39f67c3065@suse.com>
 <68ca5d7c-d443-ea48-3984-ff76652392df@xen.org>
 <9e485550-ae67-151c-daf9-964fdb2a027e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9e485550-ae67-151c-daf9-964fdb2a027e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/08/2022 12:31, Juergen Gross wrote:
>>> And even with using an ID you'd have the same problem
>>> again, but without having the possibility to add variant specific quota
>>
>> Fair enough.
>>
>>> (remember that there already has been a statement that doing a live 
>>> update
>>> from C to OCAML or vice versa would probably break users due to some
>>> deviations in behavior)
>> I can't find such statement in public documentation. Do you have a link?
> 
> No, not really. IIRC this was a remark of Andrew back when we introduced
> LU of Xenstore. It might even have been at the time the discussion was
> only on the security ML.
> 
> Note that "users" doesn't need to imply guests, it might be related to
> dom0 side users, like e.g. XAPI.

I understand that "users" doesn't imply guests. Hovewer, it is still not 
quite clear to me what sort of behavior the application could rely on 
here. Is it related to the transaction?

Anyway, I think it would be good to document such behaviors because they 
don't seem to be obvious.

Cheers,

-- 
Julien Grall

