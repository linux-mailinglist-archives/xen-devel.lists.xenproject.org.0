Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F30786CA36
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687110.1070018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgPy-0005m8-JK; Thu, 29 Feb 2024 13:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687110.1070018; Thu, 29 Feb 2024 13:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgPy-0005kb-Ga; Thu, 29 Feb 2024 13:25:46 +0000
Received: by outflank-mailman (input) for mailman id 687110;
 Thu, 29 Feb 2024 13:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OAsO=KG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rfgPx-0005kU-7k
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:25:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09e920ca-d706-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 14:25:43 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BA2F52201C;
 Thu, 29 Feb 2024 13:25:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 916A413503;
 Thu, 29 Feb 2024 13:25:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vgX/IdaF4GWQEQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 29 Feb 2024 13:25:42 +0000
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
X-Inumbo-ID: 09e920ca-d706-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709213142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LghDOadVy2nZN2AlqhQaXyGtoxv8ZZ6/rYxKpGZkLgY=;
	b=GSQNsrZPtQDL0wUzNBNWvkIfrEhxvvlgeiwSu6NO9nrtgxq7TdmCJeqOXDht+1JjeReNBK
	XzsvqqODfGhZLz+9BA/jrnIpYysrHjdStdjZyUo4gkby1svW/WBHrpVX/avLoLTAHPGYaO
	azzzqqL4Whty9LT+S8aKqV4+/qm1qDU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709213142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LghDOadVy2nZN2AlqhQaXyGtoxv8ZZ6/rYxKpGZkLgY=;
	b=GSQNsrZPtQDL0wUzNBNWvkIfrEhxvvlgeiwSu6NO9nrtgxq7TdmCJeqOXDht+1JjeReNBK
	XzsvqqODfGhZLz+9BA/jrnIpYysrHjdStdjZyUo4gkby1svW/WBHrpVX/avLoLTAHPGYaO
	azzzqqL4Whty9LT+S8aKqV4+/qm1qDU=
Message-ID: <5e755279-2c77-4542-852d-7d4acb4ccd76@suse.com>
Date: Thu, 29 Feb 2024 14:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] stubdom: extend xenstore stubdom configs
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
References: <20240229124830.13680-1-jgross@suse.com>
 <20240229124830.13680-3-jgross@suse.com>
 <6378d51b-ab4d-4019-970c-b8879c75b7d9@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <6378d51b-ab4d-4019-970c-b8879c75b7d9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.45 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 BAYES_HAM(-2.20)[96.17%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.83)[subject];
	 FREEMAIL_CC(0.00)[ens-lyon.org,gmail.com,lists.xenproject.org];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.45

On 29.02.24 14:05, Jan Beulich wrote:
> On 29.02.2024 13:48, Juergen Gross wrote:
>> Extend the config files of the Xenstore stubdoms to include XENBUS
>> and 9PFRONT items in order to support file based logging.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Was an ack from Samuel lost here? Or was it dropped on purpose?

Oh, I think I lost it.


Juergen


