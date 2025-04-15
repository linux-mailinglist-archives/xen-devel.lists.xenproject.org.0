Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD826A89EDB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953847.1348248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ft5-0007Tw-Vm; Tue, 15 Apr 2025 12:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953847.1348248; Tue, 15 Apr 2025 12:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ft5-0007RB-Sv; Tue, 15 Apr 2025 12:59:39 +0000
Received: by outflank-mailman (input) for mailman id 953847;
 Tue, 15 Apr 2025 12:59:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4ft4-0007R5-Pb
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 12:59:38 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c45567f-19f9-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 14:59:37 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso42110315e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 05:59:37 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f23158849sm213264575e9.0.2025.04.15.05.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 05:59:36 -0700 (PDT)
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
X-Inumbo-ID: 7c45567f-19f9-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744721977; x=1745326777; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GSE+X1tkczX4Z/ey+GPd4+IOHgFMnCWRL6MVnfaI0+Q=;
        b=HQT09VC7iS0sHDLI/rxLM6X8nTr00zElpkyZHJvq17h07Zq/RuS69IhnJkklru8Ew+
         yxhEs38X9wqSUENT8gftGV9tBKfQTpFQJwah5OghfAqLhktKzqHmFgMwJxZKeKX2Af4a
         V7L+pYU0r0zgWMyPOFGOHA8kVtYB70wFmhHtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721977; x=1745326777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSE+X1tkczX4Z/ey+GPd4+IOHgFMnCWRL6MVnfaI0+Q=;
        b=myKv9mFqFpxK9BrDMPIvIjZol0+8HOTtPgW6qDiBmnDnUXPK+D5pjgk7xxFUdvLKpQ
         YhwDx5TJeY88LQbE111EBWqw0OulHoPOdQfBx+VC7aEmM4llPa19XJDXs5MIjKKgd0Ng
         pBy/JVWyPTCN9N7qnyMseL8UADr41W+gSGa/9Q4XJ7S+kScA+UspuSubBmZxUxZMRke0
         /gcNlDSsK5Bj31a2zgYYQMZmCdqpeO6fhWl96x8hI3dSMh/xo5Il+QwYsMnyF2MErcPV
         WFSKBB5ZMOZBs6uZ3VIpE2PXJuZlL8JqxfoaBMcftn4ygWwqJDZFlknRa0WJJAde96vJ
         mcqA==
X-Gm-Message-State: AOJu0YxdGsKvZCYHyC4ABYj0GjsFIvw3z3/6XUQnY9ZuBfkWVzfV95FG
	FoNoth09HRs9OmsF05Nt5t0ZZXKNpj9K0tcOwvw0N77GJAae+5wdZIggKhyEvGA=
X-Gm-Gg: ASbGnctgjt2AbrJeit8JYMgwElX7yZ9mUqVRNCxGuDQtDFVVBEBnWPO4ji1T984YzB2
	D9myXfpONDAoYQ8ZK5ZxMvJ8DO+rS+Q6RlMlj6cda0Hdcj/4Bs2ydPh8w014Gx/dqOEqwW2jh5j
	MSngVpP8k1tV0j2DfT4uB0+s2fwmv8qqIUbnUIZJHMkmvmZTJ7Bhmf6QUUlIZiuYK4CSxPqVgin
	0r2DxV4lZvknp7wmLKso+PKZXLnpyNa95+MnD2QtP1SNFKNxqQNpDd64YDURNZfvMRTrgd7qWrj
	WiCvUHxZ+C3ik1n9EmK7Eh/9it0huJGHdLWVejDqev4/OQ==
X-Google-Smtp-Source: AGHT+IFMzyG3XENklL+0M0zFlVpHqq2fcN57jiL0mS/Qg/6F1yq8r2/NnZ2Gc7NUn/fsFNKgSIl0TA==
X-Received: by 2002:a05:600c:698c:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-43f3a9a70aemr142773225e9.24.1744721976755;
        Tue, 15 Apr 2025 05:59:36 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:59:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v2 6/8] vpci/rebar: Remove registers when init_rebar()
 fails
Message-ID: <Z_5YN9iPbNasyedf@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-7-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409064528.405573-7-Jiqian.Chen@amd.com>

On Wed, Apr 09, 2025 at 02:45:26PM +0800, Jiqian Chen wrote:
> When init_rebar() fails, the previous new changes will hide Rebar
> capability, it can't rely on vpci_deassign_device() to remove all
> Rebar related registers anymore, those registers must be removed
> in failure path of init_rebar.
> 
> To do that, call vpci_remove_registers() to remove all possible
> registered registers in the failure patch.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v1->v2 changes:
> * Called vpci_remove_registers() to remove all possible registered registers instead of using a array to record all registered register.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/rebar.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> index 79858e5dc92f..e030937956e3 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -51,6 +51,7 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>  
>  static int cf_check init_rebar(struct pci_dev *pdev)
>  {
> +    int rc = 0;
>      uint32_t ctrl;
>      unsigned int nbars;
>      unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> @@ -70,7 +71,6 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>      nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
>      for ( unsigned int i = 0; i < nbars; i++ )
>      {
> -        int rc;
>          struct vpci_bar *bar;
>          unsigned int index;
>  
> @@ -80,7 +80,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>          {
>              printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
>                     pdev->domain, &pdev->sbdf, index);
> -            continue;
> +            goto fail;
>          }
>  
>          bar = &pdev->vpci->header.bars[index];
> @@ -88,7 +88,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>          {
>              printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
>                     pdev->domain, &pdev->sbdf, index);
> -            continue;
> +            goto fail;

I think you need to set rc to an error code for the two chunks above,
otherwise you jump into the fail label with rc == 0 AFAICT.

Thanks, Roger.

