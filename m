Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7828184B9CA
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 16:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677005.1053399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNVl-0007jW-0B; Tue, 06 Feb 2024 15:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677005.1053399; Tue, 06 Feb 2024 15:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNVk-0007gn-Tq; Tue, 06 Feb 2024 15:37:24 +0000
Received: by outflank-mailman (input) for mailman id 677005;
 Tue, 06 Feb 2024 15:37:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z75a=JP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXNVi-0007ev-VN
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 15:37:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c9d8f69-c505-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 16:37:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 818A51FB70;
 Tue,  6 Feb 2024 15:37:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B76B132DD;
 Tue,  6 Feb 2024 15:37:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cPTyEC5SwmUAZAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 06 Feb 2024 15:37:18 +0000
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
X-Inumbo-ID: 9c9d8f69-c505-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707233838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SKFxj/bg0P9ufOg8Y/28ozfDvOWazBqn9Gcw17kpOM=;
	b=Ayn0njpcnlgZL3jp3DO/89+vDsVsuT8hFGJstI4YnXeFgy4SopFLWQ8/BqNotqCrHeVSm0
	a5g1gcsWYmnrK2chpCJE4eJtDM44mgcCKIeZFdlERlfHQJuMMqgIcqX7QUgR1PmVwbOAVj
	UXJaExYxjGvk/WMd6546jScTcZ9Yn7o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707233838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SKFxj/bg0P9ufOg8Y/28ozfDvOWazBqn9Gcw17kpOM=;
	b=Ayn0njpcnlgZL3jp3DO/89+vDsVsuT8hFGJstI4YnXeFgy4SopFLWQ8/BqNotqCrHeVSm0
	a5g1gcsWYmnrK2chpCJE4eJtDM44mgcCKIeZFdlERlfHQJuMMqgIcqX7QUgR1PmVwbOAVj
	UXJaExYxjGvk/WMd6546jScTcZ9Yn7o=
Message-ID: <6ff940a5-5918-4da4-9a1e-ebe6fe9570a0@suse.com>
Date: Tue, 6 Feb 2024 16:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Mini-OS: fix 9pfs frontend error path
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 wl@xen.org, julien@xen.org
References: <20240206061721.27297-1-jgross@suse.com>
 <20240206152602.5mbztpfam7x2ykcw@begin>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240206152602.5mbztpfam7x2ykcw@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.48 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.34)[76.15%];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.91)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.48

On 06.02.24 16:26, Samuel Thibault wrote:
> Juergen Gross, le mar. 06 févr. 2024 07:17:21 +0100, a ecrit:
>> The early error exit in p9_stat() returns without zeroing the p9_stat
>> buffer, resulting in free() being called with an uninitialized pointer.
>>
>> Fix that by doing the zeroing first.
> 
> This is not coherent with the usual conventions: when a function fails,
> it is supposed not to have done anything, and thus the caller shouldn't
> have to clean anything.
> 
> I.e. i'd rather see the free_stat() call be put after the check for
> an error returned by p9_stat.

I can do that, but this would require two calls of free_stat() (one in
p9_stat() in an error case reported via req->result, and one in the
caller of p9_stat() in case of no error).


Juergen

