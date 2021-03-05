Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBD232EC91
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93727.176898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAu2-00027J-5l; Fri, 05 Mar 2021 13:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93727.176898; Fri, 05 Mar 2021 13:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAu2-00026x-2P; Fri, 05 Mar 2021 13:54:02 +0000
Received: by outflank-mailman (input) for mailman id 93727;
 Fri, 05 Mar 2021 13:54:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lIAu0-00026p-95
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:54:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07bafc3f-8c11-433f-becc-d4ec35d47e08;
 Fri, 05 Mar 2021 13:53:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8145AD73;
 Fri,  5 Mar 2021 13:53:58 +0000 (UTC)
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
X-Inumbo-ID: 07bafc3f-8c11-433f-becc-d4ec35d47e08
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614952438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+aJikjIHMoZvlv3QKPajBjgFVCPPf7CauYprTe52Ec=;
	b=Rp84SWD8DN0x/cyeUalgaP5uRHg4A8YE07LOIPpeS8dRLEr7hGZIW1VxXdEk76UcP15TQH
	UjvMOyPl/Qva6+rK/myepyEYf2U8wmz9N6104ECRvZppAHOnFIFo8WsQyjIuJaR3wTmD79
	qaU9h3opMsULsU2ivBD6+bcxHykQQ8s=
Subject: Re: [PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from
 public API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
 <20210305124949.6719-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b4acfc5-6d96-7922-7fde-5d0d543f8201@suse.com>
Date: Fri, 5 Mar 2021 14:53:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305124949.6719-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.03.2021 13:49, Andrew Cooper wrote:
> Exactly as with c/s f40e1c52e4, this is inappropriate for a stable library.
> 
> That change actually broke the build with:
> 
>   include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t'
>        ioservid_t *id);
>        ^
> 
> as libxendevicemodel.h now uses a type it can't see a typedef for.  However,
> nothing noticed because the header.chk logic is also broken (fixed
> subsequently).

While I agree up to here, ...

> Strip the guard from the public header, and remove compensation from
> devicemodel's private.h

... I'm unconvinced that entirely dropping the guard from the
public header is wanted (or needed): We use these to make clear
that in particular kernels aren't supposed to make use of the
enclosed entities. If a type needs exposing, it (and only it)
wants moving ou of the guarded region imo.

Jan

