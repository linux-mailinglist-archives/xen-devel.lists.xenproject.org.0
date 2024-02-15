Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A427F855AB1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 07:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681238.1059892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVV6-0001Z8-Gt; Thu, 15 Feb 2024 06:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681238.1059892; Thu, 15 Feb 2024 06:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVV6-0001X7-Dr; Thu, 15 Feb 2024 06:45:40 +0000
Received: by outflank-mailman (input) for mailman id 681238;
 Thu, 15 Feb 2024 06:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raVV4-0001X1-4o
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 06:45:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2b9dc2c-cbcd-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 07:45:36 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 820ED1FDB6;
 Thu, 15 Feb 2024 06:45:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 538C713A72;
 Thu, 15 Feb 2024 06:45:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id N3aNEg+zzWUCcwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 06:45:35 +0000
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
X-Inumbo-ID: d2b9dc2c-cbcd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707979535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9+emDP1lJIkMFxao7dr1SXZIkl3gMyxU58knvfJfVc=;
	b=s154+xbSLPSopT26tAEPttYRLQ2hkaZtap5rNCaOCgH5dexnNE/hXn+xGX0JQkto1aZjbT
	Ywv7wiJSZ+SN9IpVfJ4dX3PspYB8rPPrYzxYYrdVtS7B5/YY1WX6yyOYM3rjX5Te+p5Whr
	j8CpA22vJxXkJLi6S11514jzMXoRnZ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707979535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9+emDP1lJIkMFxao7dr1SXZIkl3gMyxU58knvfJfVc=;
	b=s154+xbSLPSopT26tAEPttYRLQ2hkaZtap5rNCaOCgH5dexnNE/hXn+xGX0JQkto1aZjbT
	Ywv7wiJSZ+SN9IpVfJ4dX3PspYB8rPPrYzxYYrdVtS7B5/YY1WX6yyOYM3rjX5Te+p5Whr
	j8CpA22vJxXkJLi6S11514jzMXoRnZ4=
Message-ID: <a5a29a13-fe9c-46be-b955-1ad3f450b2cd@suse.com>
Date: Thu, 15 Feb 2024 07:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/22] tools/9pfsd: add 9pfs attach request support
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-8-jgross@suse.com>
 <4af65d74-b465-4f2b-9c4e-b1dab9a4ea7a@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <4af65d74-b465-4f2b-9c4e-b1dab9a4ea7a@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=s154+xbS
X-Spamd-Result: default: False [-0.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 BAYES_HAM(-1.41)[90.96%];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.99
X-Rspamd-Queue-Id: 820ED1FDB6
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

On 14.02.24 18:48, Andrew Cooper wrote:
> On 08/02/2024 4:55 pm, Juergen Gross wrote:
>> +static struct p9_fid *alloc_fid(device *device, unsigned int fid,
>> +                                const char *path)
>> +{
>> +    struct p9_fid *fidp = NULL;
>> +
>> +    pthread_mutex_lock(&device->fid_mutex);
>> +
>> +    if ( find_fid(device, fid) )
>> +    {
>> +        errno = EBADFD;
> 
> Also, FreeBSD says no.
> 
> https://cirrus-ci.com/task/6634697753624576
> 
> io.c:580:17: error: use of undeclared identifier 'EBADFD'
>          errno = EBADFD;
>                  ^
> 1 error generated.
> 
> Need to use EBADF.

Yes.


Juergen


