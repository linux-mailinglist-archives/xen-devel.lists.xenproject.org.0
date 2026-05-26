Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJLrDIzuFWp7fQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 21:03:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE85DBAB5
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 21:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320133.1587514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRx2q-00073G-E5; Tue, 26 May 2026 19:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320133.1587514; Tue, 26 May 2026 19:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRx2q-00070R-7T; Tue, 26 May 2026 19:02:28 +0000
Received: by outflank-mailman (input) for mailman id 1320133;
 Tue, 26 May 2026 19:02:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wRx2p-00070L-3U
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 19:02:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRx2o-008gg3-CD
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:02:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a15ee3a-bab6-0a2a0a5309dd-0a2a45079d3a-16
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:02:26 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a15ee40-229c-0a2a45070019-aceafc1fc83a-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:02:26 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D3D941A40;
 Tue, 26 May 2026 19:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CD31F000E9;
 Tue, 26 May 2026 19:02:23 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779822144;
	bh=5v/ujptFF4DT0D6zYuyceaf/1trBKA8PwBcNsci0YZg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=FuROTpMl/ITCiqAcC7+kjLeWUAWR1IEFzbrhnMxgzETF7Bs22NhUiKZq28FrhJ2GV
	 BSIWmkeLFBipXbLhKB9gz6i1qk8s4JecDnshC7v8VkGK7tgFztBZgqvImAv/HhlBUV
	 PDd3XA19YKCAsXRs06tp24ud/JzNU3cuPvVKi8SB+7Ur2qeDXy7mnc/wNQuefqDI5x
	 +Ju6REmcNA1w4ANQ2zYIorFFRv8Hgot8Yt2Bi380zqTMA5M2aOH3ZshiMRtTeY2/FF
	 jNLch4k5yeq5kUV3fd4eeiJka+uUWY1xd6ClnTMSco3PJReT9ZQK5cU/ovsvD4Wn6Z
	 PxadA5OaFOKCA==
Date: Tue, 26 May 2026 12:02:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 13/13] Setup ssh access to test systems
In-Reply-To: <1779458083.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2605261201180.182011@ubuntu-linux-20-04-desktop>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com> <13f837cd9f394d3b4eddb4849156b8ed5d06d31b.1777898148.git-series.marmarek@invisiblethingslab.com>
 <1779458083.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-705442622-1779822144=:182011"
X-purgate-ID: tlsNG-ef75cf/1779822146-0A772C48-9E8E0929/0/0
X-purgate-type: clean
X-purgate-size: 1090
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BEDE85DBAB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-705442622-1779822144=:182011
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 22 May 2026, Anthony PERARD wrote:
> On Mon, May 04, 2026 at 02:35:52PM +0200, Marek Marczykowski-Górecki wrote:
> > For this add also bridge package, so xenbr0 can be configured with
> > /etc/network/interfaces.
> > This allows extracting more logs out of the test system.
> > 
> > Create empty /etc/network/interfaces, so the 'networking' service starts
> > cleanly even if no interfaces are configured this way. This is
> > necessary, as dropbear service depends on networking.
> > 
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Since Anthony has reviewed the entire series, on the whole series:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-705442622-1779822144=:182011--

