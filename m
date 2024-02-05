Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B5849D2C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676150.1052066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX05f-0006C2-WA; Mon, 05 Feb 2024 14:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676150.1052066; Mon, 05 Feb 2024 14:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX05f-0006AA-Sj; Mon, 05 Feb 2024 14:36:55 +0000
Received: by outflank-mailman (input) for mailman id 676150;
 Mon, 05 Feb 2024 14:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rX05e-00069x-KV
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:36:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01413d4d-c434-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 15:36:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 133CB21FCE;
 Mon,  5 Feb 2024 14:36:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFE65132DD;
 Mon,  5 Feb 2024 14:36:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HzPINITywGUScQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 14:36:52 +0000
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
X-Inumbo-ID: 01413d4d-c434-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707143813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwoD9Zy7keDnO3fVr14IzGz2VJiJA8OCau4j8AlUMVE=;
	b=Ity8oxRJeiIR9cSX244Q288KEbMeW1AsJLiKOW/4opzpgLd7fE+gUflasBoGnVua3gKt0c
	8TBEz27yLDR45Ll05XYD579JuKDaVzvIRzb4hStSe58qQtCxz3OysdExbJsgTxa65o5pWF
	j5qfto1uj1dIiIxMDxjsm7QRnsGn94g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707143813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwoD9Zy7keDnO3fVr14IzGz2VJiJA8OCau4j8AlUMVE=;
	b=Ity8oxRJeiIR9cSX244Q288KEbMeW1AsJLiKOW/4opzpgLd7fE+gUflasBoGnVua3gKt0c
	8TBEz27yLDR45Ll05XYD579JuKDaVzvIRzb4hStSe58qQtCxz3OysdExbJsgTxa65o5pWF
	j5qfto1uj1dIiIxMDxjsm7QRnsGn94g=
Message-ID: <51b8f1f0-418d-42ba-bc69-29eb6a6960e2@suse.com>
Date: Mon, 5 Feb 2024 15:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] tools/xenstored: move all log-pipe handling into
 posix.c
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240205105001.24171-1-jgross@suse.com>
 <20240205105001.24171-24-jgross@suse.com>
 <c3bde61e-58f1-40fe-afa0-23510b6c5720@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <c3bde61e-58f1-40fe-afa0-23510b6c5720@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Ity8oxRJ
X-Spamd-Result: default: False [-1.51 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BAYES_HAM(-1.83)[94.03%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.63)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 133CB21FCE
X-Spam-Level: 
X-Spam-Score: -1.51
X-Spam-Flag: NO

On 05.02.24 15:33, Julien Grall wrote:
> Hi Juergen,
> 
> On 05/02/2024 10:49, Juergen Gross wrote:
>> All of the log-pipe handling is needed only when running as daemon.
>>
>> Move it into posix.c. This requires to have a service function in the
>> main event loop for handling the related requests and one for setting
>> the fds[] array. Use a generic name for those functions, as socket
>> handling can be added to them later, too.
> 
> I would mention the rename in the commit message. With that:

I have modified the commit message to:

tools/xenstored: move all log-pipe handling into posix.c

All of the log-pipe handling is needed only when running as daemon.

Move it into posix.c. This requires to have a service function in the
main event loop for handling the related requests and one for setting
the fds[] array, which is renamed to poll_fds to have a more specific
name. Use a generic name for those functions, as socket handling can
be added to them later, too.

> 
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks,


Juergen


