Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF82B839E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 19:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30209.60039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRuJ-0005WP-Is; Wed, 18 Nov 2020 18:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30209.60039; Wed, 18 Nov 2020 18:10:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRuJ-0005W0-FD; Wed, 18 Nov 2020 18:10:15 +0000
Received: by outflank-mailman (input) for mailman id 30209;
 Wed, 18 Nov 2020 18:10:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfRuI-0005Vc-HL
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 18:10:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRuG-0007ni-HB; Wed, 18 Nov 2020 18:10:12 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRuG-0000m4-9H; Wed, 18 Nov 2020 18:10:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRuI-0005Vc-HL
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 18:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4Mtd7AefQzaO82XbeWrK8RVbvU/lHd473PmgSa596a4=; b=Z1TgBG10GYKQn0lxQ/oiIlcXd0
	n8vO/IkXBSkUgXSw4H+xizuKuly3VZcYaE/fuDTvU0a874kb3ICgEqK9N82blpaIy99oEB/AtCMOy
	FSHe3rZd08iBBd88A5RVySS4ICyP5cYrI0PVcnwhpdOwFcI1lXTGeu+imtghHRm12Bd4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRuG-0007ni-HB; Wed, 18 Nov 2020 18:10:12 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRuG-0000m4-9H; Wed, 18 Nov 2020 18:10:12 +0000
Subject: Re: [PATCH v2 8/8] lib: move sort code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <293585a3-5475-0c02-19ce-c2080b2deab1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1f2ec061-81ba-7084-9935-e5879841f42b@xen.org>
Date: Wed, 18 Nov 2020 18:10:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <293585a3-5475-0c02-19ce-c2080b2deab1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2020 11:19, Jan Beulich wrote:
> Build this code into an archive, partly paralleling bsearch().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

