Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C39866DE7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 10:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685363.1065942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reX4r-0001OX-5M; Mon, 26 Feb 2024 09:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685363.1065942; Mon, 26 Feb 2024 09:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reX4r-0001LB-2V; Mon, 26 Feb 2024 09:15:13 +0000
Received: by outflank-mailman (input) for mailman id 685363;
 Mon, 26 Feb 2024 09:15:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+ho1=KD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1reX4p-0001J9-7V
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 09:15:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89d9ba7c-d487-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 10:15:09 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DDE2D1FB3E;
 Mon, 26 Feb 2024 09:15:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A74A013A58;
 Mon, 26 Feb 2024 09:15:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sHifJpxW3GVkHQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 26 Feb 2024 09:15:08 +0000
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
X-Inumbo-ID: 89d9ba7c-d487-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708938908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMjGI0U8bcjZJ5c6EYnbel/ON6czihwwfryCuQFsuxM=;
	b=L4iAxLX4HrgRtWe9oEdxAlGSf6b5MNv2tNfgIvBkEazqOQCYO6Q31FC/xq1+lj/04elTJR
	nyQvrwOixFA+YaNFe8w44Z4NtbX280ijutvB1dXfXJLNA4o6nLkhippHSMep5xeOOQKAvO
	lgHXEaEMU+9B9yRNLI4Qw+dIL0G2n/M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708938908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMjGI0U8bcjZJ5c6EYnbel/ON6czihwwfryCuQFsuxM=;
	b=L4iAxLX4HrgRtWe9oEdxAlGSf6b5MNv2tNfgIvBkEazqOQCYO6Q31FC/xq1+lj/04elTJR
	nyQvrwOixFA+YaNFe8w44Z4NtbX280ijutvB1dXfXJLNA4o6nLkhippHSMep5xeOOQKAvO
	lgHXEaEMU+9B9yRNLI4Qw+dIL0G2n/M=
Message-ID: <d21b9f82-ddfd-4014-b653-42e52ef3abfa@suse.com>
Date: Mon, 26 Feb 2024 10:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Mini-OS: add symbol exports for xenstore stubdom
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20240226083955.19350-1-jgross@suse.com>
 <707666cc-914e-42da-b823-fdc5a38271be@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <707666cc-914e-42da-b823-fdc5a38271be@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.47
X-Spamd-Result: default: False [-1.47 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-1.01)[87.29%];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.83)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 26.02.24 09:44, Jan Beulich wrote:
> On 26.02.2024 09:39, Juergen Gross wrote:
>> Xenstore stubdom needs some more symbols exported.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Any Reported-by: possibly applicable here?

If any, then Andrew.

He reported a CI loop failure.


Juergen


