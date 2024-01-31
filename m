Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A4843F29
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673984.1048599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9Ou-0004IT-2l; Wed, 31 Jan 2024 12:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673984.1048599; Wed, 31 Jan 2024 12:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9Ou-0004FQ-08; Wed, 31 Jan 2024 12:09:08 +0000
Received: by outflank-mailman (input) for mailman id 673984;
 Wed, 31 Jan 2024 12:09:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSjc=JJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rV9Ot-0004FK-4y
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:09:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87c21f50-c031-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 13:09:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E57A1FB7D;
 Wed, 31 Jan 2024 12:09:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 083C2139B1;
 Wed, 31 Jan 2024 12:09:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5441AGE4umUMcwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 31 Jan 2024 12:09:05 +0000
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
X-Inumbo-ID: 87c21f50-c031-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706702945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qakM2Pbp9sQJBnouiJ8gyM+QUJks9kkHuou94F+crM8=;
	b=tSuXKi6mHPee5eOPC2ZzzZpKtEuNFPvhZ3gC3Oj5H0HrIo/rj6OgdAVRawpBLuPnwVNbnY
	I4AF7RRmfmFPVDmBcSN77ozO7MLUDS6SKDQ8sAd9vJnDCscXtDav/tcDbMJU9JT23ZAH04
	ZY1ZT2/xVKkwAax5qUaqJlKkZYF5J7U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706702945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qakM2Pbp9sQJBnouiJ8gyM+QUJks9kkHuou94F+crM8=;
	b=tSuXKi6mHPee5eOPC2ZzzZpKtEuNFPvhZ3gC3Oj5H0HrIo/rj6OgdAVRawpBLuPnwVNbnY
	I4AF7RRmfmFPVDmBcSN77ozO7MLUDS6SKDQ8sAd9vJnDCscXtDav/tcDbMJU9JT23ZAH04
	ZY1ZT2/xVKkwAax5qUaqJlKkZYF5J7U=
Message-ID: <0628eca5-1183-445d-b688-6c85d21423c0@suse.com>
Date: Wed, 31 Jan 2024 13:09:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/33] tools/xenlogd: add 9pfs attach request support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-9-jgross@suse.com>
 <CAKf6xpv2BHy_8qomwfFJq2dePFf8bB19NZQ4dmw-eFDj5+hdng@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <CAKf6xpv2BHy_8qomwfFJq2dePFf8bB19NZQ4dmw-eFDj5+hdng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.62 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 BAYES_HAM(-0.00)[33.39%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.62

On 09.01.24 19:48, Jason Andryuk wrote:
> On Thu, Jan 4, 2024 at 4:12 AM Juergen Gross <jgross@suse.com> wrote:
>>
>> Add the attach request of the 9pfs protocol. This introduces the "fid"
>> scheme of the 9pfs protocol.
>>
>> As this will be needed later, use a dedicated memory allocation
>> function in alloc_fid() and prepare a fid reference count.
>>
>> For filling the qid data take the approach from the qemu 9pfs backend
>> implementation.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - make fill_qid() parameter stbuf const (Jason Andryuk)
>> - free fids after disconnecting guest (Jason Andryuk)
>> V3:
>> - only store relative path in fid (Jason Andryuk)
> 
> The code looks good.  I did have a thought though.
> 
>> +static struct p9_fid *alloc_fid_mem(device *device, unsigned int fid,
>> +                                    const char *path)
>> +{
>> +    struct p9_fid *fidp;
>> +    size_t pathlen;
>> +
>> +    /* Paths always start with "/" as they are starting at the mount point. */
>> +    assert(path[0] == '/');
>> +
> 
> ...
> 
>> +
>> +static const char *relpath_from_path(const char *path)
>> +{
>> +    if (!strcmp(path, "/"))
>> +        return ".";
>> +
>> +    return (path[0] == '/') ? path + 1 : path;
>> +}
> 
> You've carefully written the code to ensure the *at() functions are
> not called with paths starting with "/".  What do you think about
> storing the converted paths when storing into the p9_fid?  That way
> the code doesn't have to worry about always going through
> relpath_from_path() before use.  Another option beside performing the
> relpath_from_path() conversion, would be to save fidp->path with "./"
> at the start to eliminate absolute paths that way.  My thinking is
> it's more robust to not have any absolute paths that could be passed
> to a *at() function.

I've had a thorough look at the code at the end of the series and I agree
this is a good idea.

I'll change the related patches accordingly.


Juergen

