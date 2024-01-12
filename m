Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C782BF72
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666855.1037785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOG06-00052K-Qs; Fri, 12 Jan 2024 11:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666855.1037785; Fri, 12 Jan 2024 11:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOG06-00050J-Na; Fri, 12 Jan 2024 11:47:02 +0000
Received: by outflank-mailman (input) for mailman id 666855;
 Fri, 12 Jan 2024 11:47:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRUo=IW=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rOG05-00050D-Q3
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:47:01 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c00edda-b140-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 12:47:00 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e7af5f618so7298882e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 03:47:00 -0800 (PST)
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
X-Inumbo-ID: 4c00edda-b140-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705060020; x=1705664820; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XERSsMREHJUGBE4kRO3dIeaXL6/4OylYGvOJ3gdq530=;
        b=Q29JMsuSlMWD4H4mCEZrHcv/y3FhiRPUN+aEwinyEtKcos8Yoe89oMVCRudoc0lXwL
         nQ3Xl7Xc3ghMBb8TQ8oKbs9M5nnlt3V6V9XoFh/EIf/1yoLMaF6tDt6E5KZOGsnM5Wg2
         tDD0tm6dcKt5V9x+HgzeRcDO5ifEnZ9fimndw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705060020; x=1705664820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XERSsMREHJUGBE4kRO3dIeaXL6/4OylYGvOJ3gdq530=;
        b=EK0zvMHcCfGhoStxA7XMtoQWufZ/fRr3RZgr68vzB/Vt6XfadFTtEo6UGd8BLIadBi
         T2OXxkW2fIpLT3hvLqPMnpQc3rfLbrP0+Td0P7sdV3Bf1VDFrsUrh1CXb/lzaQHoFQ7S
         PHymzpzuyuyYtCMne8DfZLccdri67sxdpNn/iZP21L/MPivuoPZfveP8oC1Ew5L4NMNO
         U4dFuZ7LI1DitcASPYJfve6nA9K5hBTOOafTbhyWL5ot3LObYgyleTDNmTFu/Qjl93SC
         9+t4k5NaQx7zi+umJqNmnaj2PYaVghsXF+4gpDphOLbvk89vDZN2toRlZqkaaBL9FsVo
         aNSg==
X-Gm-Message-State: AOJu0YzqXVy0ddcmxo9tJRycxA5idHjAo9Iq+cHyN9/oL5guQ7LhT8DZ
	ehH6VRsnDvMf8K9/lxE4nUC4pa3qZS5dYPV9HHw56c9A9xH1+BQX7TJZ1Mtt
X-Google-Smtp-Source: AGHT+IF+xLx6roTdvIRp2aW7rW0C/79GM8zycpdwXE9FWpj0vNpoij+IXZrZOuBSX7EX+Fr8psdnpRh2X7EmXwM42Yo=
X-Received: by 2002:a05:6512:224f:b0:50e:74c6:8960 with SMTP id
 i15-20020a056512224f00b0050e74c68960mr681672lfu.96.1705060020188; Fri, 12 Jan
 2024 03:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20240109215145.430207-1-stewart.hildebrand@amd.com> <20240109215145.430207-12-stewart.hildebrand@amd.com>
In-Reply-To: <20240109215145.430207-12-stewart.hildebrand@amd.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 12 Jan 2024 11:46:49 +0000
Message-ID: <CA+zSX=Z33cixDd1w10zwC-c80z-sB4E8Nu__nTNi30n-FW6GwA@mail.gmail.com>
Subject: Re: [PATCH v12 11/15] vpci: add initial support for virtual PCI bus topology
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 9:54=E2=80=AFPM Stewart Hildebrand
<stewart.hildebrand@amd.com> wrote:
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 37f5922f3206..b58a822847be 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -484,6 +484,14 @@ struct domain
>       * 2. pdev->vpci->lock
>       */
>      rwlock_t pci_lock;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * The bitmap which shows which device numbers are already used by t=
he
> +     * virtual PCI bus topology and is used to assign a unique SBDF to t=
he
> +     * next passed through virtual PCI device.
> +     */
> +    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
> +#endif
>  #endif

Without digging through the whole series, how big do we expect this
bitmap to be on typical systems?

If it's only going to be a handful of bytes, keeping it around for all
guests would be OK; but it's large, it would be better as a pointer,
since it's unused on the vast majority of guests.

 -George

