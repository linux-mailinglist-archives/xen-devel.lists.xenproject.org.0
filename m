Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CBF36E7CC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119811.226507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2oL-0003BZ-Mp; Thu, 29 Apr 2021 09:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119811.226507; Thu, 29 Apr 2021 09:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2oL-0003BA-Ja; Thu, 29 Apr 2021 09:18:17 +0000
Received: by outflank-mailman (input) for mailman id 119811;
 Thu, 29 Apr 2021 09:18:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc2oJ-0003Ap-KV
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:18:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4923acbb-d0bf-498c-bccb-89b290e81eba;
 Thu, 29 Apr 2021 09:18:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 111A7B2B6;
 Thu, 29 Apr 2021 09:18:14 +0000 (UTC)
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
X-Inumbo-ID: 4923acbb-d0bf-498c-bccb-89b290e81eba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619687894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=orlt8YPBXc/hv8qsFpbphi6yj1nqbQAqbao7g0jbPJ8=;
	b=LaezvqF4urqOpuMikfVmPCnkmKNwWeWzpW8wbAsIIOJUKu71k2xzeC8+FvC+AO0ukWxgS6
	SG4VLCACgKk03c6KT3dlsJJF0bl7ieWHrxx8Y0v0zU0eGFk8tcad1h8dAVLiPOoLCqTPK5
	tmlI9+FrKEOtqB1rVexidI7EyUdT/ZQ=
Subject: Ping: [PATCH] build: centralize / unify asm-offsets generation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
 <YH7zXpPz03+kLzEr@Air-de-Roger>
 <e9de883b-604b-1193-b748-5a59795a9f31@suse.com>
 <YH7/SvkrB2yGgRij@Air-de-Roger>
 <5170aa51-8e34-3a45-5bf6-c0a187b1c427@suse.com>
 <YIfTyT4rvD9yEqiM@Air-de-Roger>
 <5018479d-b566-a32b-9a01-5ccf01fe0880@suse.com>
 <YIgSNRq2w7KSSaiD@Air-de-Roger>
 <e9a7b3c5-db38-76d8-64ec-2cfd9f46f1fd@suse.com>
 <YIgb/Tz/ic6uVXWo@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c34d016-47fb-eb6a-2be5-9497094effa7@suse.com>
Date: Thu, 29 Apr 2021 11:18:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIgb/Tz/ic6uVXWo@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 16:13, Roger Pau Monné wrote:
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks Roger.

Julien, Stefano, may I ask for an Arm side ack (or otherwise) here
as well?

Thanks, Jan

