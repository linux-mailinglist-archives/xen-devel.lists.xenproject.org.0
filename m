Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF7396D28
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 08:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134678.250512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnxcN-0004LG-U8; Tue, 01 Jun 2021 06:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134678.250512; Tue, 01 Jun 2021 06:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnxcN-0004J2-QB; Tue, 01 Jun 2021 06:11:11 +0000
Received: by outflank-mailman (input) for mailman id 134678;
 Tue, 01 Jun 2021 06:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lnxcN-0004Iv-0c
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 06:11:11 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e291bc1-0aae-472c-b083-d8194cba2e18;
 Tue, 01 Jun 2021 06:11:08 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BCB5F218B4;
 Tue,  1 Jun 2021 06:11:07 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 61B1F118DD;
 Tue,  1 Jun 2021 06:11:07 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 2EAdFnvPtWAvewAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Tue, 01 Jun 2021 06:11:07 +0000
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
X-Inumbo-ID: 0e291bc1-0aae-472c-b083-d8194cba2e18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622527867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MOQrSaE9kmycw5mZMZYdB+oQsrhglo+Ox4YYu40YY/E=;
	b=CWDXCRhi59PqIDbiSmC69MZc8rhLCGVdc7aJwyotoy+5b8uN1dViSyAJDdscCLyrABOaGX
	9R0pHOVVRMizVsKZSgOp1aDyQPKJ9baIG3/aPv4fjsnEngEpP01C1gNYjDP64C04ZlDtv4
	k2CQlzyDPRjFStsDJSzAJwOQ4sudcVA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622527867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MOQrSaE9kmycw5mZMZYdB+oQsrhglo+Ox4YYu40YY/E=;
	b=CWDXCRhi59PqIDbiSmC69MZc8rhLCGVdc7aJwyotoy+5b8uN1dViSyAJDdscCLyrABOaGX
	9R0pHOVVRMizVsKZSgOp1aDyQPKJ9baIG3/aPv4fjsnEngEpP01C1gNYjDP64C04ZlDtv4
	k2CQlzyDPRjFStsDJSzAJwOQ4sudcVA=
Subject: Re: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f7192ec-5e50-c4b9-774c-febcade90288@suse.com>
Date: Tue, 1 Jun 2021 08:11:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.00
X-Spamd-Result: default: False [-1.00 / 100.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[];
	 FREEMAIL_CC(0.00)[gmail.com,citrix.com,xenproject.org,xen.org,kernel.org,lists.xenproject.org]
X-Spam-Flag: NO

On 24.05.2021 16:34, Connor Davis wrote:
> Add arch-specific makefiles and configs needed to build for
> riscv. Also add a minimal head.S that is a simple infinite loop.
> head.o can be built with
> 
> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o
> 
> No other TARGET is supported at the moment.

Just to confirm - an actual (even if not functioning) xen binary can't
be linked yet? I ask because that would be the prereq for me to set up
routine (cross) build testing, just like I do for Arm.

Jan

