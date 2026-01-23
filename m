Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDwLCLPJcmkzpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:06:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69EA6EE68
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211947.1523316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5ca-0006gA-9g; Fri, 23 Jan 2026 01:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211947.1523316; Fri, 23 Jan 2026 01:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5ca-0006ec-5q; Fri, 23 Jan 2026 01:05:56 +0000
Received: by outflank-mailman (input) for mailman id 1211947;
 Fri, 23 Jan 2026 01:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CMz=74=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vj5cY-0006eW-OT
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 01:05:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a95fa04b-f7f7-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 02:05:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2366160018;
 Fri, 23 Jan 2026 01:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2601FC116C6;
 Fri, 23 Jan 2026 01:05:49 +0000 (UTC)
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
X-Inumbo-ID: a95fa04b-f7f7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769130350;
	bh=zPcvXu5VCYMukLaN255k/MTEnsytblLlj+oHAvHnX7g=;
	h=Date:From:To:cc:Subject:From;
	b=M/Uy3H5xmlCo2A2AatxcLgW32+urSgesqnZrfHkfUoNlgkifb0J9U+irBV2bdGFNc
	 1M4m6JL2wlr4kHsqpUbCrOFmk0N0GgnUmF4EdigJtcP16NhhTKtbDzBX9AkzaLdexn
	 FtOp5EJkBG58CwhKj5xdGptsfE70yfT+K2/1CHtqTi43zh2quBrtw3JE3z1vTpe61F
	 v5KttgBuIblqxzGTOAeoih2QP+GxriCI7a5Dgy/CnlgaOkCfAsIUa50qrYxZqa+ftY
	 +QsRzTYdeP1LN3AWEufHQJboVja8hUC7AlpPNUh8a2I2ly7LUVSp9reGilLdEihqdV
	 u04izACpRPkoA==
Date: Thu, 22 Jan 2026 17:05:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org
Subject: [PATCH v7 0/2] xen: console_io for dom0less guests
Message-ID: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.847];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B69EA6EE68
X-Rspamd-Action: no action

Hi all,

This short patch series enable the usage of console_io hypercalls for
dom0less guests.

Cheers,

Stefano

