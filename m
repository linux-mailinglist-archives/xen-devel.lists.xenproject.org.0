Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDQDHI4sfWmYQgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 23:11:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14119BF09F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 23:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217909.1527079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlwh1-0000sP-R9; Fri, 30 Jan 2026 22:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217909.1527079; Fri, 30 Jan 2026 22:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlwh1-0000r1-MS; Fri, 30 Jan 2026 22:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1217909;
 Fri, 30 Jan 2026 22:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+hK=AD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlwh0-0000qv-Gk
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 22:10:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73d76008-fe28-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 23:10:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A0EAB44046;
 Fri, 30 Jan 2026 22:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE37BC4CEF7;
 Fri, 30 Jan 2026 22:10:11 +0000 (UTC)
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
X-Inumbo-ID: 73d76008-fe28-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769811013;
	bh=KHtw9k9MNomHYBkR+y/1CIUVqSW/4g99PMmsyPDbuoQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=juQ6A1CfCMYpJy+fSnJ5ryuhK5WjkC0n4n2c36AMlBvsXc9Qq4YwCeyKO35lRSk6r
	 2sFGVU2xkPlB2Heskh00c5R6HgA30mQnQ0CGCAHALbnlTAoZGIVXVYUxn5VvUlyWDd
	 TdYpfWYy+OX0fdli5yTUlKOtoYOuJh27Dmqj8VJFUEgUb5vm3m+91C5qWbMcYj/qN3
	 urB24OvVQsqlinkjaqFziR4y0+DEiOsELH7Lb+SI9Ss0AeP72RNBYKbBCCJP1isVV2
	 HM0MyC2aYI/KBSO0LnqBeZ3sByV4t4uZ7IM13oav2djPDAoTulI52/N+psPbjKYHEk
	 lLCYVccgxor6w==
Date: Fri, 30 Jan 2026 14:10:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>, 
    Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: Re: [PATCH v9 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
In-Reply-To: <7bea7067-0d7d-4eaa-bd52-8735f90998c5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601301409470.2599007@ubuntu-linux-20-04-desktop>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com> <69d32e2440b2ef194b4893e5dd29c2dd9d216a90.1769696107.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2601291510250.2238666@ubuntu-linux-20-04-desktop>
 <7bea7067-0d7d-4eaa-bd52-8735f90998c5@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 14119BF09F
X-Rspamd-Action: no action

On Fri, 29 Jan 2026, Jan Beulich wrote:
> On 30.01.2026 00:14, Stefano Stabellini wrote:
> > On Thu, 29 Jan 2026, Oleksii Moisieiev wrote:
> >> --- a/xen/arch/arm/firmware/sci.c
> >> +++ b/xen/arch/arm/firmware/sci.c
> >> @@ -126,6 +126,42 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
> >>      return 0;
> >>  }
> >>  
> >> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> >> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >> +{
> >> +    struct dt_device_node *dev;
> >> +    int ret = 0;
> > 
> > Should this be -ENXIO?
> 
> Not unless further changes are made. That error code being set ...
> 
> >> +    switch ( domctl->cmd )
> >> +    {
> >> +    case XEN_DOMCTL_assign_device:
> >> +        ret = -ENXIO;
> 
> ... here makes sure that other XEN_DOMCTL_* making it into this function
> will ...
> 
> >> +        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
> >> +            break;
> >> +
> >> +        if ( !cur_mediator )
> >> +            break;
> >> +
> >> +        if ( !cur_mediator->assign_dt_device )
> >> +            break;
> >> +
> >> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
> >> +                                    domctl->u.assign_device.u.dt.size, &dev);
> >> +        if ( ret )
> >> +            return ret;
> >> +
> >> +        ret = sci_assign_dt_device(d, dev);
> >> +
> >> +        break;
> >> +
> >> +    default:
> >> +        /* do not fail here as call is chained with iommu handling */
> >> +        break;
> 
> ... succeed (by making it here). If you used -ENXIO as initializer, ret would
> then need setting to 0 here. Which is functionally identical to what is there
> now.

OK you are right


> >> @@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *d,
> >>      return 0;
> >>  }
> >>  
> >> +static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> >> +                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >> +{
> >> +    return 0;
> > 
> > This should be -ENXIO?
> 
> Why? Then several other XEN_DOMCTL_* would break. Or wait, no, nothing would
> break at all, as this stub looks to never come into play. It hence should be
> dropped.

Yes, good point, it can be dropped

