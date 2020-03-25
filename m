Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD25A192701
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 12:22:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH44W-000828-3S; Wed, 25 Mar 2020 11:19:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ak69=5K=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jH44V-000823-2L
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 11:19:43 +0000
X-Inumbo-ID: 85ef4132-6e8a-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x52c.google.com (unknown [2a00:1450:4864:20::52c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85ef4132-6e8a-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 11:19:42 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id de14so1850960edb.4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=GCmZiPBXzA9TtkQr0MwRTmrg8WSfkXWDVh3sSXaX4Io=;
 b=ddwdH1UzdjOyXn2JQ56kpnkx4zZtAPaF3o4wMWGvbxfBfVHa1P5DtMk72j1cjHYj/8
 vqfRiCWcC2UdsX36T2uaNIbhNm8gzHXVXBAXnVPxAfODLVp1xlwD0yeaqerpMYeLhIt2
 8x+/vNTT3LTkWvh6ubnezoy2Gpa4pBIDs13NEFqX3Hjn4MRQxpDlN9LTE2rhYSaW1oyU
 KIgYf/XPz/Mth+Oeh0IT13MAEae82zywULUlYVYTPWB11J6CljFzJrtMdYvaGjmjQIbg
 sv1J1mUlZK8YW0WnwKt2/uHML1gOkuUETl33GCwTyBCgo4uat2D81IJ9AWULo9qwnw8H
 yQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=GCmZiPBXzA9TtkQr0MwRTmrg8WSfkXWDVh3sSXaX4Io=;
 b=FrsAWNzPAIPMekuNmRNTmh7AWiABEcg0w6r5INN/w8qxbn2jkbogX5RDl1rzOPxC7J
 uLCSBJbvOiJssJimzISXwaiGms6+w9ktpQCynKjLgCDDt7aSrH0HpO9sncCo+N94r2pg
 r7W6GlCWdzht3SxxcYogQyUs9UReBqh+tVr2YNLYXbhnEvFYpv6DwKC8HrTRYJrkwR1D
 r1ZXl8+8PAVx/kAQ5PM55J6I1FbxfOPO93lG7/bxMizXljJFJIDBhaJ/BqCRHZHTY9Nq
 YEJrM6WFBIXM/se9cTs0LUeF7BQfptLiPofLYgKYjHeewNM/rKSPbxve2nSldNisxvdr
 RFcQ==
X-Gm-Message-State: ANhLgQ3QhY513OPYw6RaWE9adAWEHNYeq+HUVimkOq2R//7wvV463Dzq
 4h7sxRTWyMN7qeKNvSPvndk=
X-Google-Smtp-Source: ADFU+vtNrb6/N+ucfvRaeqGZ/4nT1pLlnOt3Q771yJZy0tckS1pdS8jAtMQeHlF0Awx2L0ZRz+0I2w==
X-Received: by 2002:a05:6402:22c7:: with SMTP id
 dm7mr2262534edb.283.1585135181692; 
 Wed, 25 Mar 2020 04:19:41 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id u25sm139058ejt.50.2020.03.25.04.19.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Mar 2020 04:19:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <81e7aade-9dfb-313a-ad81-30b2703c2136@suse.com>
In-Reply-To: <81e7aade-9dfb-313a-ad81-30b2703c2136@suse.com>
Date: Wed, 25 Mar 2020 11:19:39 -0000
Message-ID: <00c301d60297$471cb7f0$d55627d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJMIcItOEpMp4KkwcF5X4XGaZOQiwJH6p/Pp1qqPLA=
Subject: Re: [Xen-devel] [PATCH v5 05/10] x86emul: support MOVDIR64B insn
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
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <Paul.Durrant@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 24 March 2020 12:34
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant <Paul.Durrant@citrix.com>; Wei Liu
> <wl@xen.org>; Roger Pau Monne <roger.pau@citrix.com>
> Subject: [Xen-devel] [PATCH v5 05/10] x86emul: support MOVDIR64B insn
> 
> Introduce a new blk() hook, paralleling the rmw() on in certain way, but
> being intended for larger data sizes, and hence its HVM intermediate
> handling function doesn't fall back to splitting the operation if the
> requested virtual address can't be mapped.
> 
> Note that SDM revision 071 doesn't specify exception behavior for
> ModRM.mod == 0b11; assuming #UD here.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: If we want to avoid depending on correct MTRR settings,
>      hvmemul_map_linear_addr() may need to gain a parameter to allow
>      controlling cachability of the produced mapping(s).

Or could we deal with this by adding an optional cache flush into the unmap?

> Of course the
>      function will also need to be made capable of mapping at least
>      p2m_mmio_direct pages for this and the two ENQCMD insns to be
>      actually useful.


I/O emulation parts LGTM so...

Reviewed-by: Paul Durrant <paul@xen.org>


