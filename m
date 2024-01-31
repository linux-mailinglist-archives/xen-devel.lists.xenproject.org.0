Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD03D8442DF
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 16:20:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674075.1048761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCNZ-0003SU-VL; Wed, 31 Jan 2024 15:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674075.1048761; Wed, 31 Jan 2024 15:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCNZ-0003PW-SQ; Wed, 31 Jan 2024 15:19:57 +0000
Received: by outflank-mailman (input) for mailman id 674075;
 Wed, 31 Jan 2024 15:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSjc=JJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rVCNX-0003Ng-Tb
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 15:19:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f0b45d9-c04c-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 16:19:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3FBE121A56;
 Wed, 31 Jan 2024 15:19:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 055831347F;
 Wed, 31 Jan 2024 15:19:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wM6gORhlumV7IAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 31 Jan 2024 15:19:52 +0000
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
X-Inumbo-ID: 2f0b45d9-c04c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706714393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EPL7nyA7nFtEaIFktwT7WMryMbyLSJf90f+aEhtF5jI=;
	b=pmqsUJmosiLNelqChUYplkqg+9h6th7ZF+s+58qid7Wtlj5Ami5I56BsYzGw8hMBd4bdg6
	a12sGOGJ1c1cTbYCNkdoMcn2bkT2enxyvfehVWZSTX0XJu37998KGdUhuQtphG6FlsoIA7
	C/EQXNwteSS9YXnVNhzbIBbvElzY19c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706714393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EPL7nyA7nFtEaIFktwT7WMryMbyLSJf90f+aEhtF5jI=;
	b=pmqsUJmosiLNelqChUYplkqg+9h6th7ZF+s+58qid7Wtlj5Ami5I56BsYzGw8hMBd4bdg6
	a12sGOGJ1c1cTbYCNkdoMcn2bkT2enxyvfehVWZSTX0XJu37998KGdUhuQtphG6FlsoIA7
	C/EQXNwteSS9YXnVNhzbIBbvElzY19c=
Message-ID: <aeb56f66-c80b-468b-82cf-3576af65b8c0@suse.com>
Date: Wed, 31 Jan 2024 16:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/33] tools/libs/light: add backend type for 9pfs PV
 devices
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-17-jgross@suse.com>
 <cfecc01a-b4c7-4b21-833f-d9ebcea8a89e@perard>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <cfecc01a-b4c7-4b21-833f-d9ebcea8a89e@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-0.63 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 BAYES_HAM(-1.12)[88.45%];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.59)[subject];
	 FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,gmail.com,xen.org];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.63

On 15.01.24 16:38, Anthony PERARD wrote:
> On Thu, Jan 04, 2024 at 10:00:38AM +0100, Juergen Gross wrote:
>> +static void libxl__device_p9_add(libxl__egc *egc, uint32_t domid,
>> +                                 libxl_device_p9 *p9,
>> +                                 libxl__ao_device *aodev)
>> +{
>> +    int rc;
> 
> Can you make a copy of `p9` here, or maybe in xen9pfsd_spawn? There's no
> guaranty that `p9` will still be around by the time
> xen9pfsd_spawn_outcome() is executed.
> 
> (with libxl_device_p9_copy())

Okay.

> 
>> +    rc = xen9pfsd_spawn(egc, domid, p9, aodev);
>> +    if (rc == 1)
>> +        return;
>> +
>> +    if (rc == 0)
>> +        libxl__device_add_async(egc, domid, &libxl__p9_devtype, p9, aodev);
>> +
>> +    aodev->rc = rc;
>> +    if (rc)
>> +        aodev->callback(egc, aodev);
>> +}
>> +


Juergen


