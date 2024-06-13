Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17585906531
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 09:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739668.1146611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHex8-0001iA-Bk; Thu, 13 Jun 2024 07:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739668.1146611; Thu, 13 Jun 2024 07:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHex8-0001gT-8B; Thu, 13 Jun 2024 07:32:58 +0000
Received: by outflank-mailman (input) for mailman id 739668;
 Thu, 13 Jun 2024 07:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9y96=NP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHex6-0001gN-Dx
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 07:32:56 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21811a5f-2957-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 09:32:48 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-62f39fcb010so8723337b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 00:32:48 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5bf2890sm4109446d6.2.2024.06.13.00.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 00:32:45 -0700 (PDT)
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
X-Inumbo-ID: 21811a5f-2957-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718263967; x=1718868767; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/+Jpp5P1BNC8rRtA3cmywRtmY8n2l7RdBddXTwgHjw=;
        b=cLZhpLbn1VVBOAZN3N3JmXp2ndsRX1PFvHwqzF5e1oZda98NA8rHHF568kaN8VGgbe
         THpXdry3NqolL//ndFDONpensk3trJbXH01UoQGbvV4B+jWrhygq3xekfnOURyZysrIe
         56WXKQ2+/Yu8Wr3Vp6RLw5L0/QWD9up1dLITk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263967; x=1718868767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/+Jpp5P1BNC8rRtA3cmywRtmY8n2l7RdBddXTwgHjw=;
        b=mJ3hnaYe0BAZrnYPgCNMoWreM0segO1kieKxPmDEOULrI4KlIfk03bqghca4WcCONv
         GUSM6LjHdhlKLmn5QQg1oj6w6zTC8umz6zAg9UOdqKNi3XvA0e/vxh+81yMlAnsPRCQP
         pz5YOYTzapZKchPje4MsB166nk2/JrPB7wVY3uPu++tKx1YKqELYqeXRhw7A1pLS0Zi/
         hFFDRP5YQjIne1jwa2lJq1pvPdVWh4eE4j9EEqYI+rLp/1xqbHKseYrGqU1nAYMWUamz
         932ps8ZoDfH9Uijy5CmPFrstdad5iNPoI6n3c2K6Fc0mJO1ExZTM/uJKuioCUfrSaf8r
         JZjw==
X-Gm-Message-State: AOJu0Yw+zGWFB6nsfujpOlHbsJlP5LqwpfwyEL7ZVm4Nlbfng/Ac/nxs
	EISGAit5eizU0yJbvYD2JZPorqkjr4PrSYQkiKYyPlXsNiUjyRwFhmPnxmq+wE4=
X-Google-Smtp-Source: AGHT+IFivZj+q1Rxyq3t0OXNyBjKNeJ4VI/L8RcS3AzaM3/mY+QXGJBbacXqoJ9TbK413abbw+7Rvw==
X-Received: by 2002:a0d:df0a:0:b0:61b:e62e:8fad with SMTP id 00721157ae682-62fbbdee2e7mr38263427b3.21.1718263966010;
        Thu, 13 Jun 2024 00:32:46 -0700 (PDT)
Date: Thu, 13 Jun 2024 09:32:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.19 3/3] x86/EPT: drop questionable mfn_valid()
 from epte_get_entry_emt()
Message-ID: <ZmqgmzEH5-5dNDVJ@macbook>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <7607c5f7-772a-4c49-b2df-19f32ec2180b@suse.com>
 <Zmm4JdaLL0oRALL_@macbook>
 <07d38484-dda3-4494-9dbb-75d4d2dbc3c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07d38484-dda3-4494-9dbb-75d4d2dbc3c3@suse.com>

On Wed, Jun 12, 2024 at 05:14:37PM +0200, Jan Beulich wrote:
> On 12.06.2024 17:00, Roger Pau Monné wrote:
> > On Wed, Jun 12, 2024 at 03:17:38PM +0200, Jan Beulich wrote:
> >> mfn_valid() is RAM-focused; it will often return false for MMIO. Yet
> >> access to actual MMIO space should not generally be restricted to UC
> >> only; especially video frame buffer accesses are unduly affected by such
> >> a restriction.
> >>
> >> Since, as of ???????????? ("x86/EPT: avoid marking non-present entries
> >> for re-configuring"), the function won't be called with INVALID_MFN or,
> >> worse, truncated forms thereof anymore, we call fully drop that check.
> >>
> >> Fixes: 81fd0d3ca4b2 ("x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > 
> > I do think this is the way to go (removing quirks from
> > epte_get_entry_emt()), however it's a risky change to make at this
> > point in the release.
> > 
> > If this turns out to cause some unexpected damage, it would only
> > affect HVM guests with PCI passthrough and PVH dom0, which I consider
> > not great, but tolerable.
> > 
> > I would be more comfortable with making the change just not so close
> > to the release, but that's where we are.
> 
> Certainly, and I could live with Oleksii revoking his R-a-b (or simply
> not offering it for either of the two prereq changes). Main thing for
> me is - PVH Dom0 finally isn't so horribly slow anymore. However, if it
> doesn't go into the release, then I'd also be unsure about eventual
> backporting.

Thinking about this, it's also likely to fix issues with PCI
passthrough to HVM guests, so I'm quite sure we would need to
backport it.

David Woodhouse already had to fix it once:

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=30921dc2df3665ca1b2593595aa6725ff013d386

And I'm quite sure this fix was not related to PVH dom0.

Thanks, Roger.

