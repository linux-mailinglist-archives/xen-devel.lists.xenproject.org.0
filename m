Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682BE36E79F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119804.226495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2dx-0002Fc-Mq; Thu, 29 Apr 2021 09:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119804.226495; Thu, 29 Apr 2021 09:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2dx-0002FD-JA; Thu, 29 Apr 2021 09:07:33 +0000
Received: by outflank-mailman (input) for mailman id 119804;
 Thu, 29 Apr 2021 09:07:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc2dv-0002F4-NY
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:07:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13c38456-034e-4087-a699-bd33d3cad37d;
 Thu, 29 Apr 2021 09:07:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 525A0AE58;
 Thu, 29 Apr 2021 09:07:30 +0000 (UTC)
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
X-Inumbo-ID: 13c38456-034e-4087-a699-bd33d3cad37d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619687250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZ8+Q0zgIfts31fsZzNLTN14pbGji5DamqlpHSrtT/w=;
	b=rgyfqqm6G0/t0ldcFBNqX/3beysXbMHoZujSmJeRqTXi1IWYirAmmXqTgO36zUvERCJqWO
	vyHYu7NNyogYmB9c+OzERDcLQKf2AG4L+WZxY7sTWzp5jVSVOTNiiDH76AjItonjxxdv6S
	aR87k2KlRrdbJe1rsBnQI9CnF/HQpbI=
Subject: Re: [PATCH 1/3] x86/hvm: Introduce experimental guest CET support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-2-andrew.cooper3@citrix.com>
 <d8bd932d-071a-4a5b-747c-02cbd5e296cd@suse.com>
 <86cf1d97-2034-7791-071a-48208b6ba54b@citrix.com>
 <28d7b7a9-9dd2-1664-e946-d7e4a330da0f@suse.com>
 <3d1847f2-4ba6-416a-7957-3310b5d5124c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0731b8b-7dd7-ed9f-e3fa-6543ed5e5afd@suse.com>
Date: Thu, 29 Apr 2021 11:07:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3d1847f2-4ba6-416a-7957-3310b5d5124c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.04.2021 19:54, Andrew Cooper wrote:
> I know we're making up our "how to do complicated experimental features"
> process as we go here, but nothing *in Xen* will malfunction if a user
> opts into CET_SS/IBT.  Therefore I think they're fine to go in and stay.

Well, okay then. I hope possibls future additions of mine then will
get similar treatment.

Jan

