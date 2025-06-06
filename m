Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45565ACFF28
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008291.1387563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTFy-0002Co-Bn; Fri, 06 Jun 2025 09:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008291.1387563; Fri, 06 Jun 2025 09:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTFy-00029v-7h; Fri, 06 Jun 2025 09:20:58 +0000
Received: by outflank-mailman (input) for mailman id 1008291;
 Fri, 06 Jun 2025 09:20:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNTFw-00028W-IU
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:20:56 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ccccd57-42b7-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 11:20:55 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1618250f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:20:55 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a532463ed4sm1292910f8f.94.2025.06.06.02.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:20:54 -0700 (PDT)
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
X-Inumbo-ID: 8ccccd57-42b7-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749201655; x=1749806455; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+wYFZDVcY/cjwfdDAJEk59Nw/L3QBi9m9OTDsBJRPWo=;
        b=OIt+t/ic2b6O30Ty4z2lOU1yma8TdkflsC87juOF7SEi5NZNug9VcEuF3ctTgnyK3R
         ZZ0VeaR0zyL/Y3HP6FsK67HDR+jyGxwhPhGMt0kjWYKPhA2utEVpkNNnZ1PgwE9qRkse
         nnLWBhGaBCAKJNxgiGtqOv69FIYioyOtDW8g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201655; x=1749806455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wYFZDVcY/cjwfdDAJEk59Nw/L3QBi9m9OTDsBJRPWo=;
        b=AfbqAL0Zih+mtCH9vuD8yb5vijc4MfFhK3tCXJG79jLQG+t1aj+MIoXy6I4GCyxzll
         e6JQzawq3UkqDbbdWxGKvhnbpKKzXyEJCbtmh5g6e0L7uycWbBkx0UIS5DCTMjuwlSUO
         DRqXNj/mIKRnidodcByVQpp6niDQIg/WmKPpqlLLZmS7dPgu6mg/aqHMnlr/sU7Hx84j
         sG6+FYA+S63ZyVxnCzUWvX+Scl1+GxwdTF9k3P9lWE+4J38Js2f1U/3D5cg+jtQ9+CGX
         D8j2gqXkw2j2KtRl5XfQ+zxiPJABQt32G8pV37/16i2EJSoZEen2KABE76t7XeP63yhX
         knMA==
X-Gm-Message-State: AOJu0Yy+YQnRsByYtpY0KjSDJjiPGULgwgB8ZlI5SWj+skdDPPsTV6Jm
	/Ol6K5uW8x7Ntx/P1mje/uDQwWcn1EDGiWm1sJcrwRYHUCUOUfZKkHPGI+s4cGpbT48=
X-Gm-Gg: ASbGncvKbi86EP1mLvF25lPBAVYXNb0q6uWP2WctKawzz/pkXSJ+aN/blefHmlp+yQu
	CzGYVenXuWCsMR5sft9ShVlJuIlhuoJ+dsLOHzF1b+0qEEIdlWDcT4EWHHoxER4/4qIU14327WT
	ukdg83ULXuHZ3Wt6pukEFJ7esVzbh6TIFwKHdFcnviEA8wzEqHODVb0ZECtiPRuSxo3ZbU55cdc
	j6KsU46hg/JRgXMfrI2CbJ9Yf2cv9yZJyV+ncrnl0N96Mf2VqLaKvHgohY4FzhdQtlL+OrJWx7d
	C8jltzIr/OyRHT0LknPoho1br25T3v8M1EfPosKztOHES/mIZIGFQm4jG2lu8f+B5mqafJ6bgg2
	cUfcEjWIOs9SQIhoxdnNDNH+HmIcI9y3sLTxkX5Go
X-Google-Smtp-Source: AGHT+IHivSmPCtrOzpDbTYjf+ajVUtwyz68nYd5L/b6kcgvfU1LmgKf2eJy/EHZlpdGnfkjGSJmS6Q==
X-Received: by 2002:a05:6000:40de:b0:3a4:f52d:8b11 with SMTP id ffacd0b85a97d-3a531ca7f9dmr2229059f8f.20.1749201655155;
        Fri, 06 Jun 2025 02:20:55 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:20:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v5 08/10] vpci/rebar: Free Rebar resources when
 init_rebar() fails
Message-ID: <aEKy9nt8NNTKHaxo@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-9-Jiqian.Chen@amd.com>
 <aEG0cx6Yyy7oUhwh@macbook.local>
 <BL1PR12MB5849F4955656B6D67D123E6EE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849F4955656B6D67D123E6EE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Jun 06, 2025 at 08:32:35AM +0000, Chen, Jiqian wrote:
> On 2025/6/5 23:14, Roger Pau Monné wrote:
> > On Mon, May 26, 2025 at 05:45:57PM +0800, Jiqian Chen wrote:
> >> When init_rebar() fails, current logic return fail and free Rebar-related
> >> resources in vpci_deassign_device(). But the previous new changes will
> >> hide Rebar capability and return success, it can't reach
> >> vpci_deassign_device() to remove resources if hiding success, so those
> >> resources must be removed in cleanup function of Rebar.
> >>
> >> To do that, implement cleanup function for Rebar.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > 
> > LGTM, just one nit about a bounds check.
> > 
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> ---
> >> v4->v5 changes:
> >> * Change definition "static void cleanup_rebar" to "static int cf_check cleanup_rebar" since cleanup hook is changed to be int.
> >>
> >> v3->v4 changes:
> >> * Change function name from fini_rebar() to cleanup_rebar().
> >> * Change the error number to be E2BIG and ENXIO in init_rebar().
> >>
> >> v2->v3 changes:
> >> * Use fini_rebar() to remove all register instead of in the failure path of init_rebar();
> >>
> >> v1->v2 changes:
> >> * Called vpci_remove_registers() to remove all possible registered registers instead of using a array to record all registered register.
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/drivers/vpci/rebar.c | 35 ++++++++++++++++++++++++-----------
> >>  1 file changed, 24 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> >> index 9cafd80ca2c9..4b1892fab3d6 100644
> >> --- a/xen/drivers/vpci/rebar.c
> >> +++ b/xen/drivers/vpci/rebar.c
> >> @@ -49,6 +49,26 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> >>      bar->guest_addr = bar->addr;
> >>  }
> >>  
> >> +static int cf_check cleanup_rebar(struct pci_dev *pdev)
> >> +{
> >> +    uint32_t ctrl;
> >> +    unsigned int nbars;
> >> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> >> +                                                        PCI_EXT_CAP_ID_REBAR);
> >> +
> >> +    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
> > 
> > I think you could check rebar_offset < PCI_CFG_SPACE_SIZE to be more
> > accurate?
> OK.
> Do I need to change in init_rebar()?

Hm, pci_find_ext_capability() will never return a value <
PCI_CFG_SPACE_SIZE different than 0, so maybe none of this is needed.
Just leave it like you have, and please ignore the other requests to
change the checks, sorry for the fuss.

Thanks, Roger.

