Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587A14D8DC1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 21:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290451.492581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqvz-0008Nd-2v; Mon, 14 Mar 2022 20:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290451.492581; Mon, 14 Mar 2022 20:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqvy-0008KH-WC; Mon, 14 Mar 2022 20:04:51 +0000
Received: by outflank-mailman (input) for mailman id 290451;
 Mon, 14 Mar 2022 20:04:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTqvx-0008Jv-Do
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 20:04:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTqvw-0003zS-LO; Mon, 14 Mar 2022 20:04:48 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.108.113]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTqvw-00089o-E4; Mon, 14 Mar 2022 20:04:48 +0000
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
	bh=sHF1qc9LISx5MQC1Iy3sXQ7I+qZTL7b+HYRhyvmRhqw=; b=NaMBC6fN9AUKLy0vhiydrttnfw
	BfAZjM/lsVIby7ALnIrMVSPsJ0y8f+FhWhSfwJ0BnZTlamMVIKp8Bhp8sBw8aWoLqFuY2N5ILsOf7
	FoqIaAwojCeHQ0HlQknLJm271mNgqhmeYwLEZb0iGiUF5yf4EayYdnMFpvuXQVKLh8mg=;
Message-ID: <b323355e-7b3f-07c0-7a0a-d1cb8efe9a7b@xen.org>
Date: Mon, 14 Mar 2022 20:04:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 31/36] Disable coloring if static memory support is
 selected
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-32-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-32-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Static memory assumes to have physically contiguous memory mapped to
> domains. This assumption cannot be made when coloring is enabled.
> These two features have to be mutually exclusive.

I understand that at runtime, you want them to be mutually exclusive.
But I am not sure to understand why this needs to be mutually exclusive 
at compile time.

In fact, I think it would be nice if we have a same binary Xen that can 
be used with/without coloring. Could you outline any reasons that would 
make this goal difficult to achieve?

Cheers,

-- 
Julien Grall

