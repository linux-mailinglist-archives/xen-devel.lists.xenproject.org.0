Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD409855AAF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 07:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681232.1059881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVSu-000109-5T; Thu, 15 Feb 2024 06:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681232.1059881; Thu, 15 Feb 2024 06:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVSu-0000y2-2v; Thu, 15 Feb 2024 06:43:24 +0000
Received: by outflank-mailman (input) for mailman id 681232;
 Thu, 15 Feb 2024 06:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raVSs-0000xw-JM
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 06:43:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81ff370a-cbcd-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 07:43:20 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 388E821FDA;
 Thu, 15 Feb 2024 06:43:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0255313A72;
 Thu, 15 Feb 2024 06:43:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sPUEOoeyzWVscgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 06:43:19 +0000
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
X-Inumbo-ID: 81ff370a-cbcd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707979400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJBtwRgqYykFvijX68nK+SNPxgtK4+lGewN5IH7jEo8=;
	b=fgW+Z+CI46bCAMamx3AX/z9XlErTdkQY4CTh4DvzAgXZp/Vm+zdt9PmDDWLcJNl+tPjKTg
	vCUlVEJxffxXuOT92u1+CZfeLEfELbZQpMPhKtjyEHhFueUh3PR7yJoDaF65qHqyindzSF
	w5axZbXmLpfZGGxJeTgp5ngZC+t9CLs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707979400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJBtwRgqYykFvijX68nK+SNPxgtK4+lGewN5IH7jEo8=;
	b=fgW+Z+CI46bCAMamx3AX/z9XlErTdkQY4CTh4DvzAgXZp/Vm+zdt9PmDDWLcJNl+tPjKTg
	vCUlVEJxffxXuOT92u1+CZfeLEfELbZQpMPhKtjyEHhFueUh3PR7yJoDaF65qHqyindzSF
	w5axZbXmLpfZGGxJeTgp5ngZC+t9CLs=
Message-ID: <5ca334ca-3bb0-427e-bbe2-845a931dcec7@suse.com>
Date: Thu, 15 Feb 2024 07:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/22] tools/9pfsd: add 9pfs attach request support
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-8-jgross@suse.com>
 <a628abf7-a04d-4c32-ad49-a2fe073f3286@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <a628abf7-a04d-4c32-ad49-a2fe073f3286@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.61 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 BAYES_HAM(-0.01)[50.84%];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.61

On 14.02.24 18:40, Andrew Cooper wrote:
> On 08/02/2024 4:55 pm, Juergen Gross wrote:
>> +static struct p9_fid *alloc_fid_mem(device *device, unsigned int fid,
>> +                                    const char *path)
>> +{
>> +    struct p9_fid *fidp;
>> +    size_t pathlen;
>> +
>> +    pathlen = strlen(path);
>> +    fidp = calloc(sizeof(*fidp) + pathlen + 1, 1);
>> +    if ( !fidp )
>> +        return NULL;
>> +
>> +    fidp->fid = fid;
>> +    strncpy(fidp->path, path, pathlen);
>> +
>> +    return fidp;
>> +}
> 
> GitlabCI has something to say about this.
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1176787593
> 
> I think they're all variations of:
> 
> io.c: In function 'alloc_fid_mem.isra.8':
> io.c:566:5: error: 'strncpy' output truncated before terminating nul
> copying as many bytes from a string as its length
> [-Werror=stringop-truncation]
>       strncpy(fidp->path, path, pathlen);
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> io.c:560:15: note: length computed here
>       pathlen = strlen(path);
>                 ^~~~~~~~~~~~

In the end the result is fine, as the buffer is large enough and it is
zeroed on allocation.

I'll change it nevertheless as it is a bad code pattern.


Juergen


