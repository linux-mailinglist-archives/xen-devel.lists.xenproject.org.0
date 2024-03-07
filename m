Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9A48752A4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 16:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689941.1075466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riFGo-0000IS-CR; Thu, 07 Mar 2024 15:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689941.1075466; Thu, 07 Mar 2024 15:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riFGo-0000Ge-99; Thu, 07 Mar 2024 15:02:54 +0000
Received: by outflank-mailman (input) for mailman id 689941;
 Thu, 07 Mar 2024 15:02:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+8gn=KN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1riFGm-0000GY-Do
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 15:02:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c39e347f-dc93-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 16:02:49 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A91475D2B;
 Thu,  7 Mar 2024 14:00:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D8B712FC5;
 Thu,  7 Mar 2024 14:00:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7fSACYTI6WU/WwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 07 Mar 2024 14:00:36 +0000
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
X-Inumbo-ID: c39e347f-dc93-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709820036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jT28SHMr5mx2yX++aDezcFhRzuKSnqFFIEiMbPt46Zc=;
	b=Lr6eISMmHQns097mFfKdA1BlprQ3DNOn4DStXx4GiLehEOs0V7q+Nw/b4F5BJql+kMegPB
	KgWWGJZ5r2GfryVg+514zGgU03MIssxak58Pe7od1i9sbNuKdS9gvD+d9TW8yKfQa9AKhZ
	UDD5345W6cyaJ1ySdCWO7wOch9Vswgg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709820036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jT28SHMr5mx2yX++aDezcFhRzuKSnqFFIEiMbPt46Zc=;
	b=Lr6eISMmHQns097mFfKdA1BlprQ3DNOn4DStXx4GiLehEOs0V7q+Nw/b4F5BJql+kMegPB
	KgWWGJZ5r2GfryVg+514zGgU03MIssxak58Pe7od1i9sbNuKdS9gvD+d9TW8yKfQa9AKhZ
	UDD5345W6cyaJ1ySdCWO7wOch9Vswgg=
Message-ID: <9f1bb57f-bcee-4367-9c36-e8571f48d162@suse.com>
Date: Thu, 7 Mar 2024 15:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tools/9pfsd: Fix build error caused by strerror_r
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20240307135616.3953774-1-xin.wang2@amd.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240307135616.3953774-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.09
X-Spamd-Result: default: False [-1.09 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.57)[81.24%];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.77)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 07.03.24 14:56, Henry Wang wrote:
> Below error can be seen when doing Yocto build of the toolstack:
> 
> | io.c: In function 'p9_error':
> | io.c:684:5: error: ignoring return value of 'strerror_r' declared
>    with attribute 'warn_unused_result' [-Werror=unused-result]
> |   684 |     strerror_r(err, ring->buffer, ring->ring_size);
> |       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | cc1: all warnings being treated as errors
> 
> Using strerror_r() without special casing different build environments
> is impossible due to the different return types (int vs char *)
> depending on the environment. As p9_error() is not on a performance
> critical path, using strerror() with a mutex ought to be fine. So,
> fix the build by using strerror() to replace strerror_r(). The steps
> would then become: Acquire the mutex first, invoke strerror(), copy
> the string from strerror() to the designated buffer and then drop the
> mutex.
> 
> Fixes: f4900d6d69b5 ("9pfsd: allow building with old glibc")
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


