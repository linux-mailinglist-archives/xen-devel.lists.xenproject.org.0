Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKwaCTKB+mm/PQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 01:45:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43EA4D4C96
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 01:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301140.1575465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKPRb-0006Y3-06; Tue, 05 May 2026 23:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301140.1575465; Tue, 05 May 2026 23:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKPRa-0006Vk-TV; Tue, 05 May 2026 23:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1301140;
 Tue, 05 May 2026 23:44:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wKPRZ-0006Vb-9U
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 23:44:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKPRY-006eM6-CN
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 01:44:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fa80c1-5cb7-0a2a0a5109dd-0a2a4501adb2-10
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 01:44:48 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fa80ef-c1f2-0a2a45010019-ac6904feb116-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 01:44:48 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B71886132B;
 Tue,  5 May 2026 23:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9CDC2BCB4;
 Tue,  5 May 2026 23:44:46 +0000 (UTC)
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
	s=k20201202; t=1778024686;
	bh=b8j1sHpjkVrIyErITFXadqJdjC4rkucTFOGDYG9cubk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p7fWhtDUJAH9gqVJbuN752kRyZ76ePntis6fNOYwoZLg8g/qMt01rjU0RndH+mYFu
	 cvV9ZeQOpKeSAE4mKJdKbVIB44KiAQFgea6UNQFJpExpgCfkb9EhYteYi3aQwo/XHy
	 Z8h79KNMow/J9YOcrfuxiuPizgpz2QFHyYy0OpHOXn9SHoJOimGyQd0/6OHRzUMunB
	 7qa879iKj9F9iLs1Br3HJpkCtZ1YGMncRXDCk6IutrRoJcVG71jRnjlAdBtHjJOpDw
	 n/z/1pcTKHM+p0sMaLa4iTTdDlosACv+PvXVgR0T01eUkafOZ/FbtrHQxvKXg0V+xd
	 rgZhF6uU5uFDg==
Date: Tue, 5 May 2026 16:44:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2] CI: Refresh the Debian 12 cppcheck container
In-Reply-To: <20260505191708.1432070-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2605051644330.512397@ubuntu-linux-20-04-desktop>
References: <20260505191708.1432070-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d62444/1778024688-B727DFF4-71B108DF/0/0
X-purgate-type: clean
X-purgate-size: 598
X-Rspamd-Queue-Id: B43EA4D4C96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, 5 May 2026, Andrew Cooper wrote:
> From: Javi Merino <javi.merino@cloud.com>
> 
> Rework the container to derive from bookworm-slim, and to build and run
> cppcheck as a normal user.  User heredocs for readability and use apt-get
> --no-install-recommends to keep the size down.
> 
> Changed the libpcre3-dev dependency to libpcre3, as the -dev package
> is only needed for building, not for running.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


