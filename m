Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E30384DC56
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 10:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678042.1055074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY0K9-0005gM-7a; Thu, 08 Feb 2024 09:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678042.1055074; Thu, 08 Feb 2024 09:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY0K9-0005dt-4l; Thu, 08 Feb 2024 09:04:01 +0000
Received: by outflank-mailman (input) for mailman id 678042;
 Thu, 08 Feb 2024 09:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY0K7-0005dn-8u
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 09:03:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe27667f-c660-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 10:03:58 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 695F61FCE8;
 Thu,  8 Feb 2024 09:03:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F68D13984;
 Thu,  8 Feb 2024 09:03:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id junhCf2YxGWsDwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 09:03:57 +0000
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
X-Inumbo-ID: fe27667f-c660-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707383037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uKzsp9H7l0J5sye6dEzLIW91ECplPM3Er8faxSpMmio=;
	b=Sy91NG6BRYzU2FLZZKa2DQASz3BSU25BEvihpZNNjTO2nYYRRoIz+K9CZU45TYBTeuC3bk
	Dw4CTFxN7Aq/E0MPYKcs03FyZ5+VyiJUfo4CSx1w8kjna3FmIzA9b1DsURvesM0qhocsDl
	ln3xUTFzi0X+DzRZ8Qzd3HM/6c0qcqY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707383037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uKzsp9H7l0J5sye6dEzLIW91ECplPM3Er8faxSpMmio=;
	b=Sy91NG6BRYzU2FLZZKa2DQASz3BSU25BEvihpZNNjTO2nYYRRoIz+K9CZU45TYBTeuC3bk
	Dw4CTFxN7Aq/E0MPYKcs03FyZ5+VyiJUfo4CSx1w8kjna3FmIzA9b1DsURvesM0qhocsDl
	ln3xUTFzi0X+DzRZ8Qzd3HM/6c0qcqY=
Message-ID: <135d0228-56b9-4308-bf1a-5753f7c1092a@suse.com>
Date: Thu, 8 Feb 2024 10:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] tools: add a new xen logging daemon
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240205105001.24171-1-jgross@suse.com>
 <20240205105001.24171-3-jgross@suse.com>
 <d5035d8e-4183-4213-8e12-86d5cb2dbfc7@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <d5035d8e-4183-4213-8e12-86d5cb2dbfc7@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Sy91NG6B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.95 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BAYES_HAM(-0.27)[74.13%];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 NEURAL_HAM_SHORT(-0.10)[-0.477];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -0.95
X-Rspamd-Queue-Id: 695F61FCE8
X-Spam-Flag: NO

On 08.02.24 01:52, Andrew Cooper wrote:
> On 05/02/2024 10:49 am, Juergen Gross wrote:
>> Add "xen-9pfsd", a new logging daemon meant to support infrastructure
>> domains (e.g. xenstore-stubdom) to access files in dom0.
> 
> I was still expecting for "logging" to disappear from this.
> 
> In both cases it could just be deleted the sentences still work,
> although the subject ought to gain a xen-9pfsd part.
> 
> Happy to fix on commit.
> 
>>   tools/Makefile              |   1 +
>>   tools/xen-9pfsd/.gitignore  |   1 +
>>   tools/xen-9pfsd/Makefile    |  38 ++++++++++
>>   tools/xen-9pfsd/xen-9pfsd.c | 147 ++++++++++++++++++++++++++++++++++++
> 
> Asking just in case...  Do we really want the "xen-" in the directory?
> tools/9pfsd is still perfectly descriptive, and more amenable to tab
> completion given what else is in tools/

I'll change it.


Juergen


