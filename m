Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3cjyJ1IyH2pTigAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:43:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F876317CA
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:43:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ToP8wfXy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1325412.1590898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUV0s-0007lf-5K; Tue, 02 Jun 2026 19:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325412.1590898; Tue, 02 Jun 2026 19:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUV0s-0007jP-2b; Tue, 02 Jun 2026 19:42:58 +0000
Received: by outflank-mailman (input) for mailman id 1325412;
 Tue, 02 Jun 2026 19:42:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUV0q-0007jJ-AD
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:42:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUV0p-000yzA-C6
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 21:42:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1f321e-bab6-0a2a0a5309dd-0a2a4504c01c-20
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:42:55 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1f323e-1dec-0a2a45040019-ac6904fed762-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:42:55 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7A8B860098;
 Tue,  2 Jun 2026 19:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89F41F00893;
 Tue,  2 Jun 2026 19:42:52 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780429373;
	bh=A20g0DYnwPA9DU+zwyH2wh96dcB5DraK8CrJUGAdDm8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ToP8wfXyComJ5oTw09xJO+LaGDkG9LL3Rc1dQd155ngtdaHWaHV+vjg4dPZnRwpaC
	 LFjuW1oN4kS6DXaurs7dclT329xCam/wQRbgO0rWKdAH6sLzCjJIICWDeu2H6P2btt
	 T5d2PnXs/nfwdF/i6Ez2XWtW+CFOOxBbsuDyaIKHvZEh1QI7+59jrDE7DmBjwlxrLA
	 DzRLHJOitax1l18UMDheEUgTjhplBNXxmYiVg39N5KDGFervri/0wkjYTsmoXtHAIm
	 9r4XnDjzzmyKckC1XimUdcR/XcekusrKkp9BR4vo4MleYltYPEFmxHxyTXvtA3VIpv
	 dLndIV3R4naVQ==
Date: Tue, 2 Jun 2026 12:42:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 2/2] CI: Mark eclair-x86_64-allcode as blocking now that
 it's clean
In-Reply-To: <20260602174629.2649448-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2606021242330.550703@ubuntu-linux-20-04-desktop>
References: <20260602174629.2649448-1-andrew.cooper3@citrix.com> <20260602174629.2649448-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-195285751-1780429373=:550703"
X-purgate-ID: tlsNG-ebf023/1780429375-411763FF-8590947C/0/0
X-purgate-type: clean
X-purgate-size: 1376
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,bugseng.com:email,amd.com:email,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36F876317CA

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-195285751-1780429373=:550703
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 2 Jun 2026, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

Assuming the pipeline is clean:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/analyze.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 9bf032931fc4..673110d40ed3 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -62,7 +62,6 @@ eclair-x86_64-allcode:
>        CONFIG_XEN_GUEST=y
>        CONFIG_XHCI=y
>        CONFIG_XSM=y
> -  allow_failure: true
>  
>  eclair-x86_64-testing:
>    extends: eclair-x86_64-allcode
> -- 
> 2.39.5
> 
--8323329-195285751-1780429373=:550703--

