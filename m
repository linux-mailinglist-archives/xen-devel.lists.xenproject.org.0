Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E99142DD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 08:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746089.1153032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLdHz-0005m5-Sy; Mon, 24 Jun 2024 06:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746089.1153032; Mon, 24 Jun 2024 06:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLdHz-0005jg-Pw; Mon, 24 Jun 2024 06:34:55 +0000
Received: by outflank-mailman (input) for mailman id 746089;
 Mon, 24 Jun 2024 06:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IpOW=N2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sLdHy-0005ja-AN
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 06:34:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db7dcd67-31f3-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 08:34:50 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F825219DA;
 Mon, 24 Jun 2024 06:34:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC1DD13AA4;
 Mon, 24 Jun 2024 06:34:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dGmJN4gTeWZnaQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 24 Jun 2024 06:34:48 +0000
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
X-Inumbo-ID: db7dcd67-31f3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1719210889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3WhiZXNQHgFwvVrbBEz4za7o2pwZgL3jItNx6ibiys=;
	b=ezu47ZH2GWQetljxo8W9EMriwjsho4BU3PlWB+8aiEKMaWvQymGY7PDS3xFAtCHsDSbpt9
	/jXBzP0ap3MzYlxK12qCi5OC0LxQGKTXa8AG91Y54l2XqwOBZAxFQM3ar3pQgUtSe1buEH
	3hcjzbmA91gHsacEtnDOCUiwnl/zWfs=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ezu47ZH2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1719210889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3WhiZXNQHgFwvVrbBEz4za7o2pwZgL3jItNx6ibiys=;
	b=ezu47ZH2GWQetljxo8W9EMriwjsho4BU3PlWB+8aiEKMaWvQymGY7PDS3xFAtCHsDSbpt9
	/jXBzP0ap3MzYlxK12qCi5OC0LxQGKTXa8AG91Y54l2XqwOBZAxFQM3ar3pQgUtSe1buEH
	3hcjzbmA91gHsacEtnDOCUiwnl/zWfs=
Message-ID: <988f62b6-642d-404e-ae1e-1c9a428c1eb9@suse.com>
Date: Mon, 24 Jun 2024 08:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/manage: Constify struct shutdown_handler
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <ca1e75f66aed43191cf608de6593c7d6db9148f1.1719134768.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ca1e75f66aed43191cf608de6593c7d6db9148f1.1719134768.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2F825219DA
X-Spam-Score: -3.45
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.45 / 50.00];
	BAYES_HAM(-2.95)[99.80%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(1.00)[subject];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[wanadoo.fr,kernel.org,epam.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[wanadoo.fr];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On 23.06.24 11:26, Christophe JAILLET wrote:
> 'struct shutdown_handler' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     7043	    788	      8	   7839	   1e9f	drivers/xen/manage.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     7164	    676	      8	   7848	   1ea8	drivers/xen/manage.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


