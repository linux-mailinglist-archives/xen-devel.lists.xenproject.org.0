Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIQ7ArLNqGngxQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:26:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A0209698
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246116.1545390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwXQ-0006Ys-1A; Thu, 05 Mar 2026 00:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246116.1545390; Thu, 05 Mar 2026 00:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwXP-0006WR-UE; Thu, 05 Mar 2026 00:25:59 +0000
Received: by outflank-mailman (input) for mailman id 1246116;
 Thu, 05 Mar 2026 00:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vxwXP-0006WK-DU
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 00:25:59 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0885a26-1829-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 01:25:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BF77B408F6;
 Thu,  5 Mar 2026 00:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34732C4CEF7;
 Thu,  5 Mar 2026 00:25:54 +0000 (UTC)
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
X-Inumbo-ID: e0885a26-1829-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772670355;
	bh=T9uUSh3wGNO8C4j8rIVXQSqKyC5PcYdW03zABygi9cI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g3Zyr3Bx8O8NCtMEcZh2kuj7QqM+xaaeOwBUJeG9C3OsjQW93/xCj5tlVcCv4/Pzb
	 QMZI7b7AdqJofYa0EZ4IcOb6InxLsGUC6CkCRmKLeIlzsb23MOiwrDbiniHihRp7fk
	 bvq10B/elksbGnUo/pPZTqYX/nPMfpfuwSMgU3bGbJvhVNVoj3DrUqmyZjocsHwrqG
	 TauERRVsiXiRH8kguCyMMUYkfcI65w8DCc7WidD415uwG8It5rRwcoVs5aclL+ajk8
	 WmVP+lxcMGVqhdhL01l3AWuh2lFo7s7Isg+9+3vgNdxosaEwUhpQ4ksX7++ibCGLnq
	 umwnayngfMjkA==
Date: Wed, 4 Mar 2026 16:25:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 4/5] hw/xen-hvm: Add a mapcache arg to
 xen_register_ioreq()
In-Reply-To: <20260304015222.979224-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2603041625430.250016@ubuntu-linux-20-04-desktop>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com> <20260304015222.979224-5-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 9E2A0209698
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edgar.iglesias@gmail.com,m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:paul@xen.org,m:mst@redhat.com,m:marcel.apfelbaum@gmail.com,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:eduardo@habkost.net,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,m:marcelapfelbaum@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nongnu.org,kernel.org,xenproject.org,xen.org,redhat.com,gmail.com,linaro.org,habkost.net,amd.com,lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a mapcache argument to xen_register_ioreq() allowing
> the caller to optionally disable the mapcache.
> 
> All callers still call it with mapcache = true so there's no
> functional change yet.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


