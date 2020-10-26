Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CC2989A8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12170.31892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWz4p-0001LI-H5; Mon, 26 Oct 2020 09:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12170.31892; Mon, 26 Oct 2020 09:46:07 +0000
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
	id 1kWz4p-0001Kt-DR; Mon, 26 Oct 2020 09:46:07 +0000
Received: by outflank-mailman (input) for mailman id 12170;
 Mon, 26 Oct 2020 09:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWz4o-0001Ko-F2
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:46:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6300eb3b-689b-4b80-8b78-ca747ce71604;
 Mon, 26 Oct 2020 09:46:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6F851AC48;
 Mon, 26 Oct 2020 09:46:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWz4o-0001Ko-F2
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:46:06 +0000
X-Inumbo-ID: 6300eb3b-689b-4b80-8b78-ca747ce71604
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6300eb3b-689b-4b80-8b78-ca747ce71604;
	Mon, 26 Oct 2020 09:46:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603705564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wW5S7trTnyLZSMpzApW79jGaAeCctoYfsCL53iLSAIM=;
	b=F6GiHJb2RIalO4VQoJroK1f28C9NuXh2gOgdK1x+3aAEbaBZ/LxUJpcliRC8YBP36Dc4NP
	A8luzLdeaeoJlhH7SEZgB47/SdJ+NcKmpRbnCABidlbtIj6Ip1jIe84tyGkFom+/fVfiuo
	ecqcFAwH5GZXVPNpAEIcMrl8FT/E2wE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6F851AC48;
	Mon, 26 Oct 2020 09:46:04 +0000 (UTC)
Subject: Re: [PATCH] tools/libs/light: fix race in Makefile
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20201025101218.20478-1-jgross@suse.com>
 <38097e3b-27c3-deaf-8556-6b48677c54a4@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7aafa515-b549-6d2f-32fb-991ba5a12934@suse.com>
Date: Mon, 26 Oct 2020 10:46:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <38097e3b-27c3-deaf-8556-6b48677c54a4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.20 10:34, Jan Beulich wrote:
> On 25.10.2020 11:12, Juergen Gross wrote:
>> The header $(INCLUDE)/_lixl_list.h matches two different rules, which
>> can result in build breakage. Fix that.
> 
> While I don't doubt you having observed a race, I'm not sure this is
> true, and hence I'm also not sure the change is going to address it:
> Aiui the two rules you talk about are the one you change and
> 
> $(XEN_INCLUDE)/_%.h: _%.h
> 	$(call move-if-changed,_$*.h,$(XEN_INCLUDE)/_$*.h)
> 
> But a pattern rule doesn't come into play when a specific rule for
> a file exists.

Hmm, true. I didn't see the race, but spotted the suspected ambiguity
just by chance.

> 
> What I don't understand here is why this two step moving around of
> headers is used: Instead of the above pattern rule, can't the rule
> to generate _libxl_type%.h, _libxl_type%_json.h,
> _libxl_type%_private.h, and _libxl_type%.c put the relevant header
> files right into their designated place? This would allow the
> pattern rule to go away, albeit I'd then still be unclear about
> the specific race you did observe.

This would require to replace the pattern rules used to generate the
files by per-file rules instead, as e.g. _libxl_types_json.h and
_libxl_types_internal_json.h are matching the same pattern, but they
need to end up in different directories.

In the end I think this patch can just be dropped.

Sorry for the noise,

Juergen

