Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDDD29CF05
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 09:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13366.33966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXgsl-0000JF-Fl; Wed, 28 Oct 2020 08:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13366.33966; Wed, 28 Oct 2020 08:32:35 +0000
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
	id 1kXgsl-0000Iq-CS; Wed, 28 Oct 2020 08:32:35 +0000
Received: by outflank-mailman (input) for mailman id 13366;
 Wed, 28 Oct 2020 08:32:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXgsj-0000Ik-St
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:32:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54fde817-2474-4790-a7c7-cfa08597fbae;
 Wed, 28 Oct 2020 08:32:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27DCBACB6;
 Wed, 28 Oct 2020 08:32:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXgsj-0000Ik-St
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:32:33 +0000
X-Inumbo-ID: 54fde817-2474-4790-a7c7-cfa08597fbae
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 54fde817-2474-4790-a7c7-cfa08597fbae;
	Wed, 28 Oct 2020 08:32:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603873952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uWrDiNYGdRPB69jbZDbzFlNN0RuveZ1O13jg+5Xfmvk=;
	b=ZYy87uV7yukTwu5sbsBN3oD4i9cYECAC8/KfFLv+ldvudg/bF4FfOziCzJOtd4sCFUKdp4
	xFxAANB0SLAW6XhPtjh7xNXQ2xcmCO8EOgXGcUMH09rrJbVkzHAl95Mv5ASjSvmn+XlhpD
	ig4YLtNEv2giez+/X0RjJmKZb9em/Ow=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 27DCBACB6;
	Wed, 28 Oct 2020 08:32:32 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86/ucode/intel: Fix handling of microcode revision
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201026172519.17881-1-andrew.cooper3@citrix.com>
 <20201026172519.17881-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <157061d4-9ed4-9252-17eb-0eb642f755ec@suse.com>
Date: Wed, 28 Oct 2020 09:32:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026172519.17881-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 18:25, Andrew Cooper wrote:
> For Intel microcodes, the revision field is signed (as documented in the SDM)
> and negative revisions are used for pre-production/test microcode (not
> documented publicly anywhere I can spot).
> 
> Adjust the revision checking to match the algorithm presented here:
> 
>   https://software.intel.com/security-software-guidance/best-practices/microcode-update-guidance
> 
> This treats pre-production microcode as always applicable, but also production
> microcode having higher precident than pre-production.  It is expected that

Nit: "precedence" I guess?

> anyone using pre-production microcode knows what they are doing.
> 
> This is necessary to load production microcode on an SDP with pre-production
> microcode embedded in firmware.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

