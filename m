Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297F0AFEDC8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 17:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038396.1410888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWkm-00026Q-03; Wed, 09 Jul 2025 15:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038396.1410888; Wed, 09 Jul 2025 15:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWkl-000246-T2; Wed, 09 Jul 2025 15:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1038396;
 Wed, 09 Jul 2025 15:30:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uZWkl-000240-9w
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 15:30:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uZWki-008sfa-0W;
 Wed, 09 Jul 2025 15:30:32 +0000
Received: from [2a01:cb15:8102:5800:1e0f:9f76:7a8b:e8d1] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uZWkh-00Aw6o-2o;
 Wed, 09 Jul 2025 15:30:32 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=BTBpUS1LczS677X10Rj42zmSVpqHcsU3+LLFd6g8wGM=; b=ghzBk+jTAZmvvvrDZPGYs3zxUD
	O0KshsQjrMJVtKe4RQ54WXYZPvGvVvNGjbUGkxopTn5I4DYr5MXecyujbAnY8RnqkmS8dOG2nMbPN
	Yn8XX6uoDyesrZGjNWQu6usOCnl7GQM5o1BMqor8GBCR0822Epz3/hamccHcloaILci0=;
Date: Wed, 9 Jul 2025 17:30:29 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 2/7] tools/xl: Add altp2m_count parameter
Message-ID: <aG6LFZmplDLW2qWj@l14>
References: <cover.1751397919.git.w1benny@gmail.com>
 <090b27895506d78055d1bab9c2b3617e85f389c6.1751397919.git.w1benny@gmail.com>
 <aGvNEsyTkFLJAWqA@l14>
 <CAKBKdXgwRiB6Jpw-LyeduO=8_DF9j-eJnQwOkauMdy6T4=xuXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKBKdXgwRiB6Jpw-LyeduO=8_DF9j-eJnQwOkauMdy6T4=xuXw@mail.gmail.com>

On Mon, Jul 07, 2025 at 04:52:04PM +0200, Petr Beneš wrote:
> On Mon, Jul 7, 2025 at 3:35 PM Anthony PERARD <anthony@xenproject.org> wrote:
> >
> > It seems that altp2m_count is going to be used for the creation of all
> > guest, right? That is in addition to HVM, it will be also used for PV
> > guest and on Arm, and any other architectures that could be added.
> 
> I'm suggesting to use what is used elsewhere in the libxl_create.c:
> 
> (https://github.com/xen-project/xen/blob/9b0f0f6e235618c2764e925b58c4bfe412730ced/tools/libs/light/libxl_create.c#L1233
> and https://github.com/xen-project/xen/blob/9b0f0f6e235618c2764e925b58c4bfe412730ced/tools/libs/light/libxl_create.c#L1241)
> 
>         ((d_config->c_info.type == LIBXL_DOMAIN_TYPE_HVM &&
>           libxl_defbool_val(d_config->b_info.u.hvm.altp2m))
> 
> In other words, add check for the LIBXL_DOMAIN_TYPE_HVM type before
> calling that offending libxl_defbool_val(). Would that be okay?

Yes, that would be fine.

> >  What should be the value of altp2m_count in all this case, if altp2m is only
> > set on x86 HVM guest?
> 
> 0. Similarly to other fields that are implemented only for x86, but
> are available (and technically implementable) elsewhere - like altp2m
> field, vmtrace_buf_kb, etc.

Ok.

Thanks,

-- 
Anthony PERARD

