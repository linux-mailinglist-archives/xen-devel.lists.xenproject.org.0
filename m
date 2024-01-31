Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25495843F2E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673987.1048610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9Ps-0005rA-D8; Wed, 31 Jan 2024 12:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673987.1048610; Wed, 31 Jan 2024 12:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9Ps-0005oZ-AC; Wed, 31 Jan 2024 12:10:08 +0000
Received: by outflank-mailman (input) for mailman id 673987;
 Wed, 31 Jan 2024 12:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSjc=JJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rV9Pq-0004o4-Sw
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:10:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abafcbd0-c031-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 13:10:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0084521E7D;
 Wed, 31 Jan 2024 12:10:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF00F139B1;
 Wed, 31 Jan 2024 12:10:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sGdAL5w4umUMcwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 31 Jan 2024 12:10:04 +0000
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
X-Inumbo-ID: abafcbd0-c031-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706703006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DICoyufxGX0SqHHSPwn5sg2GvztwFyJT1WSfXZRF3TA=;
	b=hc2nORqCtrQGsS96lZhgYrvkT2due9lr1PTtorvvqVGiKrTuH/8oWQiR0SUvY+dnjXR1h8
	HgigbR9PnvH/pGypzuLXj3nhISMx/ZxrHtEHyiN2ElHsnMyxkz+tztKF3Njgjx2q4bSzXV
	DbduA4CYoeCggUehxVIxz6vaqprYpaw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706703005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DICoyufxGX0SqHHSPwn5sg2GvztwFyJT1WSfXZRF3TA=;
	b=eiqrD/kaWqRLbLeI1BOOnPA9oCWYkW4YKNNkBAeolb6pIfEZQwJ70ZMLzZaxXyyBo14hZq
	HzxQR7uzbjiRxkV6QkPxdgakXoznvQe2kNj8HBZXcVk9vmzKTLsb+Smiy/ygWD1Rai5A63
	OtWWTjBqnheR1+C0NRXG60+vHinb/qw=
Message-ID: <43af39ae-7aca-4085-b375-76567febde4f@suse.com>
Date: Wed, 31 Jan 2024 13:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/33] tools/xenlogd: add 9pfs walk request support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-10-jgross@suse.com>
 <CAKf6xpu-P5pmL6Nk2Zvu3Va1fgzTUPnTgrdk0wgszAb3WoBgtg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <CAKf6xpu-P5pmL6Nk2Zvu3Va1fgzTUPnTgrdk0wgszAb3WoBgtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.66
X-Spamd-Result: default: False [-0.66 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 BAYES_HAM(-0.09)[64.18%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 09.01.24 20:19, Jason Andryuk wrote:
> On Thu, Jan 4, 2024 at 4:10 AM Juergen Gross <jgross@suse.com> wrote:
>>
>> Add the walk request of the 9pfs protocol.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> 
> With one minor comment.
> 
>> +    path = calloc(path_len + 1, 1);
>> +    if ( !path )
>> +    {
>> +        p9_error(ring, hdr->tag, ENOMEM);
>> +        goto out;
>> +    }
>> +    strcpy(path, fidp->path);
>> +
>> +    if ( n_names )
>> +    {
>> +        qids = calloc(n_names, sizeof(*qids));
>> +        if ( !qids )
>> +        {
>> +            p9_error(ring, hdr->tag, ENOMEM);
>> +            goto out;
>> +        }
>> +        for ( i = 0; i < n_names; i++ )
>> +        {
>> +            if (strcmp(path, "/"))
>> +                strcat(path, "/");
> 
> strcmp() can only return 0 on the first iteration, so it seems
> inefficient to have it inside this loop.  But the added complexity to
> avoid calling it doesn't seem worthwhile.

With storing the relative path in fidp->path this call can be dropped.


Juergen

