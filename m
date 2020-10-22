Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FED296268
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:12:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10550.28058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdCY-00044H-E9; Thu, 22 Oct 2020 16:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10550.28058; Thu, 22 Oct 2020 16:12:30 +0000
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
	id 1kVdCY-00043s-An; Thu, 22 Oct 2020 16:12:30 +0000
Received: by outflank-mailman (input) for mailman id 10550;
 Thu, 22 Oct 2020 16:12:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVdCW-00043n-88
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:12:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d68f9fe-31e1-4f96-ab1f-86c6b972f0b4;
 Thu, 22 Oct 2020 16:12:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57FA2AC48;
 Thu, 22 Oct 2020 16:12:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVdCW-00043n-88
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:12:28 +0000
X-Inumbo-ID: 9d68f9fe-31e1-4f96-ab1f-86c6b972f0b4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9d68f9fe-31e1-4f96-ab1f-86c6b972f0b4;
	Thu, 22 Oct 2020 16:12:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603383146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tvy1ki8NPJCVlIgf2jzK2JopOOEnb4t999skvHfB3T8=;
	b=XRjcPUMxQnNqi/8NU1XFmNeE06w5B8lpP/eQozeypE5T2sFwzR4xgAjs+8vAXIKEGb8BSV
	5uaZcmyI45cmLIX8RAZ962HxBhPvly7XVtJi6fyFX8K5H4u+/PL9pj0h63HxnDi2OJ4nwx
	JnV/Ul+/F+JgHtyequAwuNCBaNRfd34=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 57FA2AC48;
	Thu, 22 Oct 2020 16:12:26 +0000 (UTC)
Subject: Re: [PATCH v2 05/11] x86/vioapic: switch to use the EOI callback
 mechanism
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <04ae52fb-5579-4994-0b7c-72d48d127749@suse.com>
Date: Thu, 22 Oct 2020 18:12:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 12:41, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -189,7 +189,7 @@ void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
>  
>      if ( hvm_funcs.update_eoi_exit_bitmap )
>          alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
> -                          trig || callback);
> +                          callback);

There's a shortcoming in the alternative call framework which I
see no way to eliminate but which makes it necessary to use
!!callback here. Otherwise, if the callback happens to sit on a
256-byte boundary (low address byte zero), you'll pass false
when you mean true. (The original use, i.e. prior to patch 3,
of just "trig" was sufficiently okay, because the parameter
- despite being u8 - is effectively used as a boolean by the
callers iirc.)

Or perhaps the best thing is to require wrappers for all hooks
taking bool parameters, because then the necessary conversion
will be done when calling the wrapper.

Jan

