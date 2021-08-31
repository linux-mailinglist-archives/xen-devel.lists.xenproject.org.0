Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B39F3FC22E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 07:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175450.319651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKwQy-0001NM-RL; Tue, 31 Aug 2021 05:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175450.319651; Tue, 31 Aug 2021 05:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKwQy-0001Ks-Nd; Tue, 31 Aug 2021 05:35:44 +0000
Received: by outflank-mailman (input) for mailman id 175450;
 Tue, 31 Aug 2021 05:35:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vpuq=NW=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mKwQx-0001Km-Rp
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 05:35:43 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7354372a-b20f-4b0f-9e53-a3092e6f0150;
 Tue, 31 Aug 2021 05:35:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b4so35938471lfo.13
 for <xen-devel@lists.xenproject.org>; Mon, 30 Aug 2021 22:35:42 -0700 (PDT)
Received: from [192.168.10.179] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id d19sm1609255lfv.74.2021.08.30.22.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 22:35:40 -0700 (PDT)
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
X-Inumbo-ID: 7354372a-b20f-4b0f-9e53-a3092e6f0150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Dm9ggMxSL84OUszU8TbC/LMMHezUksWnYJCytvMXjkU=;
        b=ctJUllAExlg6zYIMRRBjEUXc6kj/W0ndQrENIcjbD8hfUq4rL7EUkTR18cB2foWmgI
         Ji7B6iAhU/TsiWSO6cHhOMvQ3ZzC6isQuzwNJ9dV6HA6oJosRfvzOpJbKuuuGjC1Zz2M
         qLBzS8Vptz5rjql/BZ43aUsuXgy7CmVGiQOoDfRTSYZd+ODuNOCo36L5XcCZE/3u2Gdh
         yxppsL8lVEB/871GimEAWJ9R98chUfYJ9oOJTDx2uNFxUD2Pbkg3QSotoEH0P7ulr6Bv
         bNAJSsFf4wQXiRplqM8DgF3tBulnsQxf4HlCzev8MbCT/YLQGxTvSuvufjBy/ICY9mjo
         nWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Dm9ggMxSL84OUszU8TbC/LMMHezUksWnYJCytvMXjkU=;
        b=R6EcQOQWQgIzc3SpQJqvHFEqYELK7POTskk3Yurgj6qNtNSNTjRR9n2GDGv3TenA/g
         w5/y2RHaSrNzqos56njSc04Cd1U8/uiQtLTOm8VO6DlKkTUq/ldL277sYgRNwVIH8EYy
         fr43DBs+neWqhGPAfXIwXiqwDdpf5iDOWCvmbmmOeuSq0qdNuU2wihyrdJF9SPPvqk+S
         s5m5+16j4s2r8l2WCKl4bQhEqvkZE2MczAlOoWCeNqRT3A1UwnoLmI4uHsYiigSh8H7O
         I2qU2WCZYj3oto0a+f84Pf0DU1cmSh0m2pb6szJicqw2z6NKP0ZapyikN7tOK/+CcoHk
         wKfA==
X-Gm-Message-State: AOAM533x3eCIj4GIfLtzSGsIG8AHuUQW+MKcQULhjtM8loBaf9EZEzDh
	ttOkE3KKVhW9q+4uNeIynXM=
X-Google-Smtp-Source: ABdhPJxHAVbMyKWA+FhJBiii47IvsOr5BbGhg/79aBAMj+PvWl0N+BQn0WpU6QOOuZDREdhBb8TSTA==
X-Received: by 2002:ac2:498e:: with SMTP id f14mr1794934lfl.115.1630388141196;
        Mon, 30 Aug 2021 22:35:41 -0700 (PDT)
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <b2e8863d-217a-fc0e-3176-a20ef5ad0872@gmail.com>
Date: Tue, 31 Aug 2021 08:35:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello, Jan!

On 30.08.21 16:04, Jan Beulich wrote:
> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> console) are associated with DomXEN, not Dom0. This means that while
> looking for overlapping BARs such devices cannot be found on Dom0's
> list of devices; DomXEN's list also needs to be scanned.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
>       would make the diff difficult to read. At this point I'd merely
>       like to gather input towards possible better approaches to solve
>       the issue (not the least because quite possibly there are further
>       places needing changing).
>
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -206,6 +206,7 @@ static int modify_bars(const struct pci_
>       struct vpci_header *header = &pdev->vpci->header;
>       struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>       struct pci_dev *tmp, *dev = NULL;
> +    const struct domain *d;
>       const struct vpci_msix *msix = pdev->vpci->msix;
>       unsigned int i;
>       int rc;
> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>        * Check for overlaps with other BARs. Note that only BARs that are
>        * currently mapped (enabled) are checked for overlaps.
>        */
> -    for_each_pdev ( pdev->domain, tmp )
> +for ( d = pdev->domain; ; d = dom_xen ) {//todo

I am not quite sure this will be correct for the cases where pdev->domain != dom0,

e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases

we'll force running the loop for dom_xen which I am not sure is desirable.

Another question is why such a hidden device has its pdev->domain not set correctly,

so we need to work this around?

Thank you,

Oleksandr

> +    for_each_pdev ( d, tmp )
>       {
>           if ( tmp == pdev )
>           {
> @@ -282,6 +284,7 @@ static int modify_bars(const struct pci_
>                    */
>                   continue;
>           }
> +if ( !tmp->vpci ) { ASSERT(d == dom_xen && system_state < SYS_STATE_active); continue; }//todo
>   
>           for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>           {
> @@ -308,6 +311,7 @@ static int modify_bars(const struct pci_
>               }
>           }
>       }
> +if ( !is_hardware_domain(d) ) break; }//todo
>   
>       ASSERT(dev);
>   
>
>

