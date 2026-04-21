Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JbCGVTj52nMCAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 22:51:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C243F8FA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 22:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289354.1569421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFI3A-0003jq-Lf; Tue, 21 Apr 2026 20:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289354.1569421; Tue, 21 Apr 2026 20:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFI3A-0003hz-In; Tue, 21 Apr 2026 20:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1289354;
 Tue, 21 Apr 2026 20:50:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFI39-0003hs-Gs
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 20:50:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFI38-008fJH-EW
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:50:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7e2fa-2eae-0a2a0a5409dd-0a2a4507bf4a-10
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 22:50:26 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7e310-229c-0a2a45070019-aceafc1f9ad2-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 22:50:26 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C3634442D5;
 Tue, 21 Apr 2026 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5D9C2BCB0;
 Tue, 21 Apr 2026 20:50:23 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776804623;
	bh=Fec1iEqDKYnxd6w5Ro5mBeDLbHPHRYMts/hOlSeHe5w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kBRlwtk7qsxs2+Mx6JxLl/9NAOwQ65OiNOke71tpNJxJu65MTW20SgLeBng4bRC68
	 5Qw1S4vRi7S50sNBMqjiWlXVQwr0VqakJvIBS8cx0zsCedWgXwNGebI7a6Fi26GhmC
	 Jj7KdXd/23Dw6EOisXa9TgLZh6GFJFvU9gmeIGUOMCJjMBxT7Gvvo12bUE3dkW/fhZ
	 kP2YA43oGq8hr86kMF+oIScr0Y7iwSeQrxeclSiSWKtwb+xWhRsYFKWCj/DOfE8PVv
	 tzVvfiQlx6dRQNvFMB5UPX1ckMe9FxfI3iwOVlaIKXIr6UKTgL+QXFyJM5UdRdgidx
	 Ql1gV3v1yRDyA==
Date: Tue, 21 Apr 2026 13:50:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: "Orzel, Michal" <Michal.Orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] device-tree: Improve hwdom memory allocation for DMA
In-Reply-To: <78440FF6-499A-4997-AA60-AB7EEC6AF67E@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604211350130.2712345@ubuntu-linux-20-04-desktop>
References: <20260417091155.39653-1-michal.orzel@amd.com> <412A9DF8-6F5C-402D-AEBD-88E6DE139E07@arm.com> <137bd391-926d-4047-a760-638f2e58b99f@amd.com> <78440FF6-499A-4997-AA60-AB7EEC6AF67E@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-833083000-1776804623=:2712345"
X-purgate-ID: tlsNG-ef75cf/1776804626-AF374C48-B981353B/0/0
X-purgate-type: clean
X-purgate-size: 1078
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0E0C243F8FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-833083000-1776804623=:2712345
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 21 Apr 2026, Luca Fancellu wrote:
> >> It looks ok to me, the only thing is that if we have many smaller banks < 128 Mb before reaching
> >> one that is at least 128 Mb, we won’t allocate them and loose them forever.
> >> 
> >> It feels only a corner case so for me it’s ok
> > Yes, that's something documented in the commit msg, so if we ever face upon the
> > issue due to that we could revisit the implementation. For now, we haven't
> > observed any issues.
> > 
> >> 
> >> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com <mailto:luca.fancellu@arm.com>>
> > Thanks.
> 
> I realised my mail client messed up the tag:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-833083000-1776804623=:2712345--

