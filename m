Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE3B87229A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 16:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688827.1073503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWdb-0004vA-9O; Tue, 05 Mar 2024 15:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688827.1073503; Tue, 05 Mar 2024 15:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWdb-0004tO-6b; Tue, 05 Mar 2024 15:23:27 +0000
Received: by outflank-mailman (input) for mailman id 688827;
 Tue, 05 Mar 2024 15:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E7ce=KL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rhWdZ-0004tI-Nx
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 15:23:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4edae1a7-db04-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 16:23:24 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 091A36B64A;
 Tue,  5 Mar 2024 15:23:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D683013A5B;
 Tue,  5 Mar 2024 15:23:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +WySMus452UNbQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 05 Mar 2024 15:23:23 +0000
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
X-Inumbo-ID: 4edae1a7-db04-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709652204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHLIUDCUa+RshrDdjeSgXkl9M+svQd7sCRDJwufl2HQ=;
	b=luKFbel3ajGFwo/uOI0qZHiEn0+ElOrrQ3NjgV+q1gc2IDHCNPWFK0uDZB+AUl4J73mfUc
	9a+hIV/CXUrgAA9U0XXN3fMRxF6FgLLIrvlT8MRTvHvf18G6YVqplRn5K+3OWuGHJ9C2M4
	XwOa+6joiv/Nl887bQIQui/E3srwNwU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709652204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHLIUDCUa+RshrDdjeSgXkl9M+svQd7sCRDJwufl2HQ=;
	b=luKFbel3ajGFwo/uOI0qZHiEn0+ElOrrQ3NjgV+q1gc2IDHCNPWFK0uDZB+AUl4J73mfUc
	9a+hIV/CXUrgAA9U0XXN3fMRxF6FgLLIrvlT8MRTvHvf18G6YVqplRn5K+3OWuGHJ9C2M4
	XwOa+6joiv/Nl887bQIQui/E3srwNwU=
Message-ID: <0eeab3e6-f4fb-4723-a674-f5bbdb285356@suse.com>
Date: Tue, 5 Mar 2024 16:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] 9pfsd: allow building with old glibc
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
References: <3aca1707-9eab-4b85-a4ae-e56508b15843@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <3aca1707-9eab-4b85-a4ae-e56508b15843@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.94 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-2.85)[99.36%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(1.00)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.94

On 05.03.24 15:33, Jan Beulich wrote:
> Neither pread() / pwrite() nor O_DIRECTORY are available from glibc
> 2.11.3 headers without defining (e.g.) _GNU_SOURCE. Supplying the
> definition unconditionally shouldn't be a problem, seeing that various
> other tools/ components do so, too.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Fine with me.

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


