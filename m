Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA688813C8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:55:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695970.1086378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxLq-0000v4-BX; Wed, 20 Mar 2024 14:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695970.1086378; Wed, 20 Mar 2024 14:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxLq-0000rr-8m; Wed, 20 Mar 2024 14:55:34 +0000
Received: by outflank-mailman (input) for mailman id 695970;
 Wed, 20 Mar 2024 14:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B3h0=K2=suse.de=farosas@srs-se1.protection.inumbo.net>)
 id 1rmxLn-0000rh-Qa
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:55:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4afc3c9-e6c9-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 15:55:29 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE6C234648;
 Wed, 20 Mar 2024 14:55:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A799136CD;
 Wed, 20 Mar 2024 14:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id l/P3N9/4+mWBSAAAD6G6ig
 (envelope-from <farosas@suse.de>); Wed, 20 Mar 2024 14:55:27 +0000
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
X-Inumbo-ID: e4afc3c9-e6c9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710946528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=atLlVj706ZI1z+w2Od3Pb5liz1wqI2QrZufnWv/g0fI=;
	b=lESLmDPR2Vg9ewi+NFqrwm00GWuh4+Zdr+TeU2s32ZkHVKiR6/7UTkZFBrLnjyer5llefC
	ebUQHB2JnuQyTzv8nLMLbyl4XBC7p4RVoTCdxAX+GbfxwthNEDWBBPf8kvldUQbhzk6Sp8
	qBrvzbG1B4fH2jJpriEZ4CxZpYXuceQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710946528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=atLlVj706ZI1z+w2Od3Pb5liz1wqI2QrZufnWv/g0fI=;
	b=CckUtufh1Nlld6V2VNOCsSQTwFG8xNe028kv8bHuHoiyjoYgUDKXm7crkS3LRlhg6b7jSC
	9cGpVZ8bvEOUvQAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710946528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=atLlVj706ZI1z+w2Od3Pb5liz1wqI2QrZufnWv/g0fI=;
	b=lESLmDPR2Vg9ewi+NFqrwm00GWuh4+Zdr+TeU2s32ZkHVKiR6/7UTkZFBrLnjyer5llefC
	ebUQHB2JnuQyTzv8nLMLbyl4XBC7p4RVoTCdxAX+GbfxwthNEDWBBPf8kvldUQbhzk6Sp8
	qBrvzbG1B4fH2jJpriEZ4CxZpYXuceQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710946528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=atLlVj706ZI1z+w2Od3Pb5liz1wqI2QrZufnWv/g0fI=;
	b=CckUtufh1Nlld6V2VNOCsSQTwFG8xNe028kv8bHuHoiyjoYgUDKXm7crkS3LRlhg6b7jSC
	9cGpVZ8bvEOUvQAg==
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 qemu-devel@nongnu.org, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Hyman Huang
 <yong.huang@smartx.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, Avihai Horon
 <avihaih@nvidia.com>, Markus Armbruster <armbru@redhat.com>, Prasad Pandit
 <pjp@fedoraproject.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-9.1 v5 11/14] memory: Add Error** argument to the
 global_dirty_log routines
In-Reply-To: <20240320064911.545001-12-clg@redhat.com>
References: <20240320064911.545001-1-clg@redhat.com>
 <20240320064911.545001-12-clg@redhat.com>
Date: Wed, 20 Mar 2024 11:53:14 -0300
Message-ID: <87msqtlztx.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -2.69
X-Spamd-Result: default: False [-2.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-2.89)[99.52%];
	 R_RATELIMIT(0.00)[to_ip_from(RL1oca9pgz4y56ab8sgtboxc4y)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[20];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,xen.org:email,suse.de:email];
	 FREEMAIL_TO(0.00)[redhat.com,nongnu.org,kernel.org,citrix.com,xen.org,linaro.org,habkost.net,gmail.com,smartx.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Flag: NO

C=C3=A9dric Le Goater <clg@redhat.com> writes:

> Now that the log_global*() handlers take an Error** parameter and
> return a bool, do the same for memory_global_dirty_log_start() and
> memory_global_dirty_log_stop(). The error is reported in the callers
> for now and it will be propagated in the call stack in the next
> changes.
>
> To be noted a functional change in ram_init_bitmaps(), if the dirty
> pages logger fails to start, there is no need to synchronize the dirty
> pages bitmaps. colo_incoming_start_dirty_log() could be modified in a
> similar way.
>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Hyman Huang <yong.huang@smartx.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

