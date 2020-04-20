Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D11B0904
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 14:13:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQVIr-0000yX-OA; Mon, 20 Apr 2020 12:13:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQVIq-0000yP-5g
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 12:13:32 +0000
X-Inumbo-ID: 59bd5dda-8300-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59bd5dda-8300-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 12:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L9TqMVZQYqMWHi2FhTfEDDZifUufm8YPzvfzEYDISAg=; b=D/SKxKYy1pAYXMH0qsUbgF7zcq
 piQZ8o2FbcB1cJr4Cq3WcJRRtMKgMW4B/lMqW5Ps/E7AiZyroUeYMcroR8hNEYG7m6EcbkDKpF4fI
 6RXNs9oAw6gDuWIvWb2yghLXXbGDYFGyxn753B7UUl8QS7BAZwYCvvOSPyBILzxaoKhU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQVIj-0003gw-RP; Mon, 20 Apr 2020 12:13:25 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQVIj-0000yk-KO; Mon, 20 Apr 2020 12:13:25 +0000
Subject: Re: [PATCH 0/8] Fix build with using OCaml 4.06.1 and -safe-string
To: Christian Lindig <christian.lindig@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Scott <dave@recoil.org>
References: <20200330192157.1335-1-julien@xen.org>
 <67d3370c-779a-7007-e5fa-98d957a85ce9@xen.org>
 <1587043532025.36720@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b585e4c0-5770-4b56-3a1c-96b5c749fa78@xen.org>
Date: Mon, 20 Apr 2020 13:13:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587043532025.36720@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Christian,

On 16/04/2020 14:25, Christian Lindig wrote:
> 
> The changes in the OCaml C stubs look good to me. They don't really touch the interface but are mostly concerned with types on the C side by adding casts, const, and so on. The extended error handling is an improvement.

Thank you for the review! I will commit the rest of the series.

As an aside, the acked-by was adding as part of the signature.

Not sure whether this is intentional but some e-mail clients are hiding 
the signature so the acked-by can be easily missed.

Cheers,

-- 
Julien Grall

