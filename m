Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE984C8DC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677369.1053928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfNs-0003JL-15; Wed, 07 Feb 2024 10:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677369.1053928; Wed, 07 Feb 2024 10:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfNr-0003Gh-U9; Wed, 07 Feb 2024 10:42:27 +0000
Received: by outflank-mailman (input) for mailman id 677369;
 Wed, 07 Feb 2024 10:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7mL=JQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXfNq-0003Eb-Cn
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:42:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92cfef9d-c5a5-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 11:42:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6037A221C8;
 Wed,  7 Feb 2024 10:42:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36FB713931;
 Wed,  7 Feb 2024 10:42:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FLLwC41ew2UzZQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Feb 2024 10:42:21 +0000
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
X-Inumbo-ID: 92cfef9d-c5a5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707302541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NF8R7aWuE/rrndv8O1H7/mhwfC8rWzlUKracjQGi0bo=;
	b=HLdVCeA7fWxRTsZYcKpV2g3gE/Po0UwaY7R/4mugfxk6iB2ygKuxe3UkySW5+vZQWlnFrw
	S5J61Qk8Vxzwusc0Rp5kTB4THDHR9tzvSEu3frF48ZupjvovH7C314SrQ/R0CDUkODfrbv
	XSuhazk2nk7zzfz81wC2wOKnjSM0c8w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707302541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NF8R7aWuE/rrndv8O1H7/mhwfC8rWzlUKracjQGi0bo=;
	b=HLdVCeA7fWxRTsZYcKpV2g3gE/Po0UwaY7R/4mugfxk6iB2ygKuxe3UkySW5+vZQWlnFrw
	S5J61Qk8Vxzwusc0Rp5kTB4THDHR9tzvSEu3frF48ZupjvovH7C314SrQ/R0CDUkODfrbv
	XSuhazk2nk7zzfz81wC2wOKnjSM0c8w=
Message-ID: <d51d842e-5609-4c98-9a31-8d6a0b237c31@suse.com>
Date: Wed, 7 Feb 2024 11:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Mini-OS: x86: zero out .bss segment at boot
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240207103138.26901-1-jgross@suse.com>
 <20240207103831.dtvlyjtbmgz7kmll@begin>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240207103831.dtvlyjtbmgz7kmll@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=HLdVCeA7
X-Spamd-Result: default: False [-1.95 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 BAYES_HAM(-2.42)[97.35%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.77)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6037A221C8
X-Spam-Level: 
X-Spam-Score: -1.95
X-Spam-Flag: NO

On 07.02.24 11:38, Samuel Thibault wrote:
> Juergen Gross, le mer. 07 févr. 2024 11:31:38 +0100, a ecrit:
>> The .bss segment should be zeroed at very early boot.
> 
> Is that not done by the elf loader of Xen?

It might be done by Xen tools today, but I'm quite sure it is not part
of the ABI. The hypervisor doesn't clear .bss when loading a domain (e.g.
dom0).

I stumbled over it while implementing kexec in Mini-OS. For that I need
it for sure.


Juergen

