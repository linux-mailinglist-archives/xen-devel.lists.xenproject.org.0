Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531EB3955AE
	for <lists+xen-devel@lfdr.de>; Mon, 31 May 2021 09:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134463.250152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnbuC-00045x-D3; Mon, 31 May 2021 07:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134463.250152; Mon, 31 May 2021 07:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnbuC-00042y-9D; Mon, 31 May 2021 07:00:08 +0000
Received: by outflank-mailman (input) for mailman id 134463;
 Mon, 31 May 2021 07:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lnbuA-0003yt-Cd
 for xen-devel@lists.xenproject.org; Mon, 31 May 2021 07:00:06 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dcd6c52-21ce-4b46-b782-bfbe5b96b61d;
 Mon, 31 May 2021 07:00:05 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 389CE1FD2E;
 Mon, 31 May 2021 07:00:04 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D989F118DD;
 Mon, 31 May 2021 07:00:02 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id uknuMnKJtGDDCgAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Mon, 31 May 2021 07:00:02 +0000
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
X-Inumbo-ID: 4dcd6c52-21ce-4b46-b782-bfbe5b96b61d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622444404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vVpU7SBVsS5vWuSVPztB+SALCWr1e/9I2kyLjmaAvjc=;
	b=F/0NvfdyiSpc5+bjlr7g7wQK5Tf+RQjb932quydP7hbIdFfE50JxWZ2GxI7oiDmlJHfCtR
	VuanfQzE0j9U++GgdOq/swm0DZfELBXdcHWy+sIwaYi0Hk4DjDyGyAqkS8q+bNwQjhbWUw
	LNv/7e2da+QgpLk5FEpt28cSSZK6NtY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622444403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vVpU7SBVsS5vWuSVPztB+SALCWr1e/9I2kyLjmaAvjc=;
	b=s4XEIBzZ1Z0sAxw8Q32W07M/Zi6caKYtqiTAIvSEdTDmDLWRSp7MbQHojrL7jsZ5gAlA8u
	gE0yNKd56WTilETXXTlET4OAW39QYi2Bbo1VzTVh6d8xy+0+uFiaSyp2C6yJKG7cT99EEj
	tMCGK87LqcQpVqPmwtkLrfTIndfccKE=
Subject: Re: [PATCH 2/3] x86/mtrr: move epte_get_entry_emt to p2m-ept.c
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20210528173935.29919-1-roger.pau@citrix.com>
 <20210528173935.29919-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4b369e4-d1d9-98b6-de29-b6a6c6c6454f@suse.com>
Date: Mon, 31 May 2021 09:00:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528173935.29919-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.00
X-Spamd-Result: default: False [0.00 / 100.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DBL_FAIL(0.00)[citrix.com:server fail];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 28.05.2021 19:39, Roger Pau Monne wrote:
> This is an EPT specific function, so it shouldn't live in the generic
> mtrr file. Such movement is also needed for future work that will
> require passing a p2m_type_t parameter to epte_get_entry_emt, and
> making that type visible to the mtrr users is cumbersome and
> unneeded.
> 
> Moving epte_get_entry_emt out of mtrr.c requires making the helper to
> get the MTRR type of an address from the mtrr state public. While
> there rename the function to start with the mtrr prefix, like other
> mtrr related functions.
> 
> While there fix some of the types of the function parameters.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -417,12 +417,12 @@ static int vmx_domain_initialise(struct domain *d)
>  static void domain_creation_finished(struct domain *d)
>  {
>      gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);
> -    uint8_t ipat;
> +    bool ipat;
>  
>      if ( !has_vlapic(d) || mfn_eq(apic_access_mfn, INVALID_MFN) )
>          return;
>  
> -    ASSERT(epte_get_entry_emt(d, gfn_x(gfn), apic_access_mfn, 0, &ipat,
> +    ASSERT(epte_get_entry_emt(d, gfn, apic_access_mfn, 0, &ipat,
>                                true) == MTRR_TYPE_WRBACK);
>      ASSERT(ipat);

This being the only reason for the function to not be static in
p2m-ept.c, I wonder whether it's really worthwhile to keep these
assertions. But certainly not directly related to change at hand.

Jan

