Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD663295028
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 17:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10105.26661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVGL0-0003U0-IG; Wed, 21 Oct 2020 15:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10105.26661; Wed, 21 Oct 2020 15:47:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVGL0-0003Tb-Ey; Wed, 21 Oct 2020 15:47:42 +0000
Received: by outflank-mailman (input) for mailman id 10105;
 Wed, 21 Oct 2020 15:47:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVGKy-0003TW-GH
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:47:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04f2b524-ebae-478e-8fb6-68fa4cab5302;
 Wed, 21 Oct 2020 15:47:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVGKy-0003TW-GH
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:47:40 +0000
X-Inumbo-ID: 04f2b524-ebae-478e-8fb6-68fa4cab5302
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 04f2b524-ebae-478e-8fb6-68fa4cab5302;
	Wed, 21 Oct 2020 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603295259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HRSRWL1izdNolTPUiM6RFeUxAig9vH/jhnR/vXkiZKI=;
  b=BJKOu1sVCSFo6wPtbdER3cvVOf6pLuT9pwMRDm9m5B59wFQC0e2w1BY/
   3hVbCdARANRm9LONGbLSBnNd9gsTZyRCaxiIv8QH0sgV+NLubPgZ201CB
   0lWIhcdxi7hg1uVDKOaWBWX7x2ZA+XM+MfzzwShKcT1D+/1Vf3jktpvOO
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vR73awpzCRCKuvc5r/FkeNsHFwPdinOj8zIQii9Ibc8+bE9LD2/tubkWick7AF+nf4U8q9gR/S
 Jp3gm9hegJcpT3TXFzlAwUh5vnot+ESdYUQimdEmYdDbsHOy5uAx4HI1FZo2AGNKb3hFVxKbEC
 3r0wcST6Xk8E00XalowG0IVI2awgNikYSTfSAGiZtzspJ4YPR0av3k9Rh577BwKAI63USePGIC
 0+d7+ICE2Pl6Ktn8HbbNNLRcY5ElMuaPYIf0igpnqWywSy1W6MSNZtsllr2KtqwLe6hdnNeLbQ
 qd0=
X-SBRS: 2.5
X-MesageID: 29828493
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29828493"
Date: Wed, 21 Oct 2020 17:46:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/8] evtchn: avoid race in get_xen_consumer()
Message-ID: <20201021154650.zz77ircyuedr7gpm@Air-de-Roger>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Oct 20, 2020 at 04:08:13PM +0200, Jan Beulich wrote:
> There's no global lock around the updating of this global piece of data.
> Make use of cmpxchgptr() to avoid two entities racing with their
> updates.
> 
> While touching the functionality, mark xen_consumers[] read-mostly (or
> else the if() condition could use the result of cmpxchgptr(), writing to
> the slot unconditionally).

I'm not sure I get this, likely related to the comment I have below.

> The use of cmpxchgptr() here points out (by way of clang warning about
> it) that its original use of const was slightly wrong. Adjust the
> placement, or else undefined behavior of const qualifying a function
> type will result.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> ---
> v2: Use (and hence generalize) cmpxchgptr(). Add comment. Expand /
>     adjust description.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -57,7 +57,8 @@
>   * with a pointer, we stash them dynamically in a small lookup array which
>   * can be indexed by a small integer.
>   */
> -static xen_event_channel_notification_t xen_consumers[NR_XEN_CONSUMERS];
> +static xen_event_channel_notification_t __read_mostly
> +    xen_consumers[NR_XEN_CONSUMERS];
>  
>  /* Default notification action: wake up from wait_on_xen_event_channel(). */
>  static void default_xen_notification_fn(struct vcpu *v, unsigned int port)
> @@ -80,8 +81,9 @@ static uint8_t get_xen_consumer(xen_even
>  
>      for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
>      {
> +        /* Use cmpxchgptr() in lieu of a global lock. */
>          if ( xen_consumers[i] == NULL )
> -            xen_consumers[i] = fn;
> +            cmpxchgptr(&xen_consumers[i], NULL, fn);
>          if ( xen_consumers[i] == fn )
>              break;

I think you could join it as:

if ( !xen_consumers[i] &&
     !cmpxchgptr(&xen_consumers[i], NULL, fn) )
    break;

As cmpxchgptr will return the previous value of &xen_consumers[i]?

Thanks, Roger.

