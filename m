Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C308E81BA7E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 16:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659007.1028457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGKrw-00088l-AC; Thu, 21 Dec 2023 15:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659007.1028457; Thu, 21 Dec 2023 15:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGKrw-00085v-7b; Thu, 21 Dec 2023 15:21:52 +0000
Received: by outflank-mailman (input) for mailman id 659007;
 Thu, 21 Dec 2023 15:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VCQ=IA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rGKrv-00085W-1d
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 15:21:51 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a985e5d3-a014-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 16:21:50 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336897b6bd6so670631f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 07:21:50 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 a6-20020adfed06000000b003366796301csm2282688wro.0.2023.12.21.07.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:21:49 -0800 (PST)
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
X-Inumbo-ID: a985e5d3-a014-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703172109; x=1703776909; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bFaLHerMsFqZxgpW5IR27o/90X+9yMkkmxl02ZeiSuc=;
        b=UMNcsULApmh1psY7hmtEYP/4ALoO/4N/VsCJMz73tT8z/j4AMEc9zPS7GZWGKjyuw4
         1JiXVcr+x/1CLUZc1oykcSDu6QUvbRwGzgEzsFOkh1/crA+dReJ90TL6/5kjX52COa1h
         AwEyDsRf/STrG9PUY3af95jMhPESTYkW472Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703172109; x=1703776909;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFaLHerMsFqZxgpW5IR27o/90X+9yMkkmxl02ZeiSuc=;
        b=QmOTw8XJ4ABASxNO6qZaljLuB+g1NkLQrCMBhWUwm72V7SIblc+mNRabjS2CFowLCi
         tOIIja8JOA33MJCYh0j7tQaGv8UOBLOKjP/zdVYHco9j3lU2OhMNNt6cloLQrTLv2ezb
         45VardA7MAUWALBUcmMgkB/wXIcBubLmnDU8T9kpGztemyYXRFUfEtA1RQP2zRyZaurD
         0Oo05fU1wqsuDoYvoROZjdekXrCBVZ9jBq3QbX0WJwRVrE1tjRJ5F/mRGd5nQ3589pc9
         WUSsMa5m7sU6igJ/sBhsiVRoyLrUJA2jlJQL/n4yoH1wyx97PWSaqeMB3ubI6/znYxZj
         020Q==
X-Gm-Message-State: AOJu0YyAAB/LAyf6C374LulHt5taCBKmG16zwa6WODSAeTA0tgXkNUQN
	56GAdzxyDnA7dhoDzbqw5LjvPg==
X-Google-Smtp-Source: AGHT+IHKXeldBL0kioy7CSRVxik8PKAL0XLIf+TXHKthxaDTH8/cPTmeSm4xRO4zGFqR5/DBuxUHaA==
X-Received: by 2002:a5d:550c:0:b0:333:f04:f2d7 with SMTP id b12-20020a5d550c000000b003330f04f2d7mr763201wrv.55.1703172109505;
        Thu, 21 Dec 2023 07:21:49 -0800 (PST)
Date: Thu, 21 Dec 2023 16:21:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v11 05/17] vpci: add hooks for PCI device assign/de-assign
Message-ID: <ZYRYDO2MPOIfx64b@macbook>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-6-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231202012556.2012281-6-volodymyr_babchuk@epam.com>

On Sat, Dec 02, 2023 at 01:27:03AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned we need to
> initialize/de-initialize vPCI state for the device.
> 
> Also, rename vpci_add_handlers() to vpci_assign_device() and
> vpci_remove_device() to vpci_deassign_device() to better reflect role
> of the functions.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index d743d96a10..75cfb532ee 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -25,11 +25,11 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>    static vpci_register_init_t *const x##_entry  \
>                 __used_section(".data.vpci." p) = x
>  
> -/* Add vPCI handlers to device. */
> -int __must_check vpci_add_handlers(struct pci_dev *pdev);
> +/* Assign vPCI to device by adding handlers to device. */

Nit: the comment would likely benefit from removing the last device
before the full stop.

> +int __must_check vpci_assign_device(struct pci_dev *pdev);

Thanks, Roger.

