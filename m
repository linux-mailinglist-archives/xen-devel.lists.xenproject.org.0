Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79BC2989FE
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 11:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12189.31934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWzP2-0003Si-VE; Mon, 26 Oct 2020 10:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12189.31934; Mon, 26 Oct 2020 10:07:00 +0000
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
	id 1kWzP2-0003SJ-S3; Mon, 26 Oct 2020 10:07:00 +0000
Received: by outflank-mailman (input) for mailman id 12189;
 Mon, 26 Oct 2020 10:06:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kWzP1-0003SE-Tr
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 10:06:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0af6a5fa-0d93-4edb-bc15-92a6b71e7943;
 Mon, 26 Oct 2020 10:06:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25CC8ADF2;
 Mon, 26 Oct 2020 10:06:58 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kWzP1-0003SE-Tr
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 10:06:59 +0000
X-Inumbo-ID: 0af6a5fa-0d93-4edb-bc15-92a6b71e7943
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0af6a5fa-0d93-4edb-bc15-92a6b71e7943;
	Mon, 26 Oct 2020 10:06:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603706818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sb7P6Y6PEdt/la5dIDYuwZ123VhFpNwmyepjEl7xqj4=;
	b=XdKGZrdKMvgCEuPJ6GiXANUYZSJsRSzHcWo60cmohLC9hGiLYfSzrYxZD0TBRlaDa362Gd
	NqobxntQ4KV3nuYv/xpTrC7MIHOFgBKacpEz6S0aWSiVBZsgUavVudakLzR9aRz9qkoq8j
	P7BcF4pEmbeUKpyszni9mreGUhxn8VU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 25CC8ADF2;
	Mon, 26 Oct 2020 10:06:58 +0000 (UTC)
Subject: Re: [PATCH] tools/libs/light: fix race in Makefile
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20201025101218.20478-1-jgross@suse.com>
 <38097e3b-27c3-deaf-8556-6b48677c54a4@suse.com>
 <7aafa515-b549-6d2f-32fb-991ba5a12934@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74fdb7b6-2727-c325-2af5-3039b84f2332@suse.com>
Date: Mon, 26 Oct 2020 11:06:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <7aafa515-b549-6d2f-32fb-991ba5a12934@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.10.2020 10:46, Jürgen Groß wrote:
> On 26.10.20 10:34, Jan Beulich wrote:
>> What I don't understand here is why this two step moving around of
>> headers is used: Instead of the above pattern rule, can't the rule
>> to generate _libxl_type%.h, _libxl_type%_json.h,
>> _libxl_type%_private.h, and _libxl_type%.c put the relevant header
>> files right into their designated place? This would allow the
>> pattern rule to go away, albeit I'd then still be unclear about
>> the specific race you did observe.
> 
> This would require to replace the pattern rules used to generate the
> files by per-file rules instead, as e.g. _libxl_types_json.h and
> _libxl_types_internal_json.h are matching the same pattern, but they
> need to end up in different directories.

Ah, right - I didn't pay attention to the *_internal*.h needs.

Jan

