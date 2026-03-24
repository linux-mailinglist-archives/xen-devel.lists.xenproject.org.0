Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJGODLNgwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:00:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62FD3060EF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260202.1553560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yXq-0006si-0T; Tue, 24 Mar 2026 09:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260202.1553560; Tue, 24 Mar 2026 09:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yXp-0006q9-TU; Tue, 24 Mar 2026 09:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1260202;
 Tue, 24 Mar 2026 09:59:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1w4yXo-0006q3-JY
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 09:59:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4yXn-00A2KM-Gn
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:59:27 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 69c2607a-5cb7-0a2a0a5109dd-0a2a4502801e-32
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 10:59:27 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <berrange@redhat.com>)
 id 69c2607d-63bb-0a2a45020019-aa0a817c6a59-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 10:59:26 +0100
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-341-7uC1TSxwOT6Xs_9QeCDb0A-1; Tue,
 24 Mar 2026 05:59:23 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3313119560AA; Tue, 24 Mar 2026 09:59:22 +0000 (UTC)
Received: from redhat.com (unknown [10.44.33.93])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 26D43180058B; Tue, 24 Mar 2026 09:59:17 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774346365;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJ1vMBEe8Dsw41A89pk6yrT2C5ogE9dQJMhAO/T+c5w=;
	b=U2+YrunhGVKkaVJ5kb5ye52QA09cUI2aamYsSi9KEds003X3wpfzaB2DSKXKxgSpvJPqQg
	PGqjmzm2BCu3RQMvFKlr0I1i3FbeFA1j6o+K4iwag7uND3xHue2wiIaplYgxtXgSWL3LhL
	802jU081JVmasON7IH/UdW6xnAE06q8=
X-MC-Unique: 7uC1TSxwOT6Xs_9QeCDb0A-1
X-Mimecast-MFC-AGG-ID: 7uC1TSxwOT6Xs_9QeCDb0A_1774346362
Date: Tue, 24 Mar 2026 09:59:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Thierry Escande <thierry.escande@vates.tech>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/4] Xen: Add Q35 initial support for HVM guests
Message-ID: <acJgclxJ4_0YbBqT@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
 <abVtsK31t9tWgsaY@mail-itl>
 <acJZHpw8tcTMPpCn@l14>
MIME-Version: 1.0
In-Reply-To: <acJZHpw8tcTMPpCn@l14>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: EHoFNaH39xa2zaTy5Y0r9ld6pv1iAdIxZWdEX0Jw0G0_1774346362
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774346367-42A84DB8-9895A58B/0/0
X-purgate-type: clean
X-purgate-size: 2207
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:marmarek@invisiblethingslab.com,m:thierry.escande@vates.tech,m:qemu-devel@nongnu.org,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:mst@redhat.com,m:eduardo@habkost.net,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[berrange@redhat.com,xen-devel-bounces@lists.xenproject.org];
	REPLYTO_EQ_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_REPLYTO(0.00)[berrange@redhat.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hachyderm.io:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[berrange@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D62FD3060EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 09:28:00AM +0000, Anthony PERARD wrote:
> On Sat, Mar 14, 2026 at 03:16:15PM +0100, Marek Marczykowski-Górecki wrote:
> > On Fri, Mar 13, 2026 at 04:46:56PM +0000, Thierry Escande wrote:
> > > This patch series introduces Q35 chipset support for Xen HVM guests. This is
> > > based on the work from Alexey Gerasimenko (See patchset [1] for reference).
> > > 
> > > This series does not implement device passthrough as this will need more work
> > > on the Xen side to support multiple PCI buses. Since Q35 chipset does not
> > > support device hotplugging and with current Xen mechanism for device
> > > passthrough, they have to be plugged to a new PCIe root port, i.e. not the PCI
> > > bus 0.
> > 
> > I always found it weird that Xen does hot-plugging of PCI passthrough
> > devices... Wouldn't it be easier to change this (connect them from the
> > very start, via QEMU cmdline) and declare hotplug as unsupported (at
> > least at this time)? I realize it's more complex change at the toolstack
> > side, but overall may simplify things and maybe even improve
> > reliability.
> 
> Skipping hot-plug on Q35 sounds good to me.
> 
> I though we could keep using QMP to do cold plug, with the experimental
> "--preconfig", but "device_add" isn't allowed :-(. So yes, doing this
> via command line sounds fine.
> 
> In libxl, we might be able to transform the json for `device_add` into
> the command line counterpart for `-device` fairly easily so the argument
> are only generated in a single place. Then we could skip the QMP
> "device_add" in libxl when it's already done via command line.

-device accepts JSON directly, so there's no transformation you
need to do from the QMP JSON. For example:

  -device '{"driver":"pcie-root-port","port":8,"chassis":1,"id":"pci.1","bus":"pcie.0","multifunction":true,"addr":"0x1"}'

Likewise  -object, -audiodev and -netdev accept QMP JSON too

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


