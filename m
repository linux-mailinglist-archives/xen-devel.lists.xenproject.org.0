Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4532936F969
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 13:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120512.227912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcRSD-0002dy-Lz; Fri, 30 Apr 2021 11:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120512.227912; Fri, 30 Apr 2021 11:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcRSD-0002dc-Iy; Fri, 30 Apr 2021 11:37:05 +0000
Received: by outflank-mailman (input) for mailman id 120512;
 Fri, 30 Apr 2021 11:37:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ll2C=J3=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lcRSC-0002dX-7m
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 11:37:04 +0000
Received: from mx.upb.ro (unknown [141.85.13.200])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5102e814-acd8-4866-9e3f-63886b5c6309;
 Fri, 30 Apr 2021 11:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id CD88DB5600B0;
 Fri, 30 Apr 2021 14:37:02 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cjCDSrUcsMWO; Fri, 30 Apr 2021 14:37:01 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 0CB7EB560113;
 Fri, 30 Apr 2021 14:37:01 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PkeEyZ_z53MC; Fri, 30 Apr 2021 14:37:00 +0300 (EEST)
Received: from [192.168.1.35] (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 34DCBB5600B0;
 Fri, 30 Apr 2021 14:37:00 +0300 (EEST)
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
X-Inumbo-ID: 5102e814-acd8-4866-9e3f-63886b5c6309
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH 1/5] tools/debugger: Fix PAGE_SIZE redefinition error
To: Tim Deegan <tim@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
 <0cd234096c9bfa8d29eac9906553af79d378733e.1619524463.git.costin.lupu@cs.pub.ro>
 <YIsP5z1ejJbUhmPc@deinos.phlegethon.org>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <128f6672-eec7-fc8b-d43c-1e53d93d93b0@cs.pub.ro>
Date: Fri, 30 Apr 2021 14:36:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YIsP5z1ejJbUhmPc@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Tim,

On 4/29/21 10:58 PM, Tim Deegan wrote:
> Hi,
> 
> At 15:05 +0300 on 27 Apr (1619535916), Costin Lupu wrote:
>> If PAGE_SIZE is already defined in the system (e.g. in
>> /usr/include/limits.h header) then gcc will trigger a redefinition error
>> because of -Werror. This commit also protects PAGE_SHIFT definitions for
>> keeping consistency.
> 
> Thanks for looking into this!  I think properly speaking we should fix
> this by defining KDD_PAGE_SHIFT and KDD_PAGE_SIZE in kdd.h and using
> those everywhere we currently use PAGE_SIZE/PAGE_SHIFT. in kdd.c and
> kdd-xen.c.  If for some reason we ever ended up with a system-defined
> PAGE_SIZE that wasn't 4096u then we would not want to use it here
> because it would break our guest operations.

As discussed for another patch of the series, an agreed solution that
would apply for other libs as well would be to use XC_PAGE_* macros
instead of PAGE_* macros. I've just sent a v2 doing that. Please let me
know if you think it would be better to introduce the KDD_PAGE_*
definitions instead.

Cheers,
Costin

