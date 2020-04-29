Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2201BD81D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 11:23:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTiuv-00007a-Nz; Wed, 29 Apr 2020 09:22:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2IrC=6N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jTiuu-00007T-FG
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 09:22:08 +0000
X-Inumbo-ID: e59af8ac-89fa-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e59af8ac-89fa-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IBvFVP9Y/af3Zy8vF1YUEhbF2HZkcqpnP3dwYHZKchE=; b=S1/cXFGtpTSdXGygCTxAMyksE8
 i47m/LH3YPCH58pEGobUArtB2pGPfMv1+dxz6vlkG+QZJkTlTs6xdy1b819yXi3qBFYAnPKAxulBK
 nd2YS+2SqewTShQgmuYkUPfzrQphOw2eh/AkqZ/3YvoTgulZxAw7SN6t1VZuX9yUz7RU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jTiuq-0005a6-Km; Wed, 29 Apr 2020 09:22:04 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jTiuq-0008AH-Dl; Wed, 29 Apr 2020 09:22:04 +0000
Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <20200428155144.8253-1-jgross@suse.com>
 <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
 <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <76ed29d6-e2fc-cd48-6de7-e0032daaa2e9@xen.org>
Date: Wed, 29 Apr 2020 10:22:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 29/04/2020 06:51, Jürgen Groß wrote:
> On 28.04.20 22:55, Julien Grall wrote:
>> Hi Juergen,
>>
>> On Tue, 28 Apr 2020 at 16:53, Juergen Gross <jgross@suse.com> wrote:
>>>
>>> The XS_INTRODUCE command has two parameters: the mfn (or better: gfn)
>>> of the domain's xenstore ring page and the event channel of the
>>> domain for communicating with Xenstore.
>>>
>>> The gfn is not really needed. It is stored in the per-domain struct
>>> in xenstored and in case of another XS_INTRODUCE for the domain it
>>> is tested to match the original value. If it doesn't match the
>>> command is aborted via EINVAL.
>>>
>>> Today there shouldn't be multiple XS_INTRODUCE requests for the same
>>> domain issued, so the mfn/gfn can just be ignored and multiple
>>> XS_INTRODUCE commands can be rejected without testing the mfn/gfn.
>>
>> So there is a comment in the else part:
>>
>> /* Use XS_INTRODUCE for recreating the xenbus event-channel. */
>>
>>  From the commit message this is not entirely clear why we want to
>> prevent recreating the event-channel. Can you expand it?
> 
> Recreating the event channel would be fine, but I don't see why it
> would ever be needed. And XS_INTRODUCE is called only at domain creation
> time today, so there is obviously no need for repeating this call.
> 
> Maybe the idea was to do this after sending a XS_RESUME command, which
> isn't used anywhere in Xen and is another part of Xenstore which doesn't
> make any sense today.

Commit f6cc37ea8ac71385b60507c034519f304da75f4c "tools/oxenstored: port 
XS_INTRODUCE evtchn rebind function from cxenstored" added the exact 
same behavior in the OCaml XenStored last year.

This was introduced 12 years after C XenStored, so surely someone think 
this is useful. We should check why this was introduced in OCaml 
XenStored (I have CCed the author of the patch).

If we still think this is not useful, then you should add an explanation 
in the commit message why the two implementations diverge and possibly 
update the spec.

Cheers,

-- 
Julien Grall

