Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B977B816E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611783.952573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo2L5-0001UF-FS; Wed, 04 Oct 2023 13:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611783.952573; Wed, 04 Oct 2023 13:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo2L5-0001NQ-Ac; Wed, 04 Oct 2023 13:54:59 +0000
Received: by outflank-mailman (input) for mailman id 611783;
 Mon, 02 Oct 2023 21:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XCDK=FQ=philpotter.co.uk=phil@srs-se1.protection.inumbo.net>)
 id 1qnQjO-0007IC-Ia
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 21:45:34 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01f846ea-616d-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 23:45:31 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-405417465aaso2607345e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Oct 2023 14:45:30 -0700 (PDT)
Received: from localhost.localdomain
 (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:df16::3]) by smtp.gmail.com with ESMTPSA id
 a11-20020a05600c2d4b00b004065daba6casm7974630wmg.46.2023.10.02.14.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 14:45:29 -0700 (PDT)
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
X-Inumbo-ID: 01f846ea-616d-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1696283130; x=1696887930; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dA79LkNYU7asBXwt/uQxW8bheOGwedQNE5Z+nFIVT0=;
        b=m4J6HEgNwLlqvweRFC1rnykJbaC79Y1utvVnCkTOui575gVI8j3LOZNcG+aVnrjFZr
         S87oN+3UOoEV7l5kxLYqj0mv73Sb3U20ijxL4FCXP2Yqzx2rv3TuQXLdh2z0o4YXfAPI
         /ZClbBweqyEvr3rXfmHawn7vibH9v9SCSS4rh8cGsplhvVVANMkhdsqMJwIp/V2NFTrm
         EaTckDVDF9kwUH2lY4usQP3xNy+jxw3/NLSssHE1WfU5VhlEBFLwOLRcKsfLrDLEHj8v
         u2xJSHzetDCCvNNYWV00VvfLYY3+Jpl1wRxO5bocW1tztIOFUAtFpyWJvWaYnt4JNYj3
         mY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696283130; x=1696887930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dA79LkNYU7asBXwt/uQxW8bheOGwedQNE5Z+nFIVT0=;
        b=dy6dqXHA/qmoy8zSiSulJMQivZ4pOuGFPk090TvMexUsbK7biic2loeEy02+O+RxUh
         MmDzqJ+4bvDS+te2Wq+HyxqcXTZ4JfgV3jCdIxAydFKIZaCceAn5Rqtv6RdHInBaS77i
         5hY4PcxxbdDf3nl7oWvRGrf5NXjldqNR8DJ4vTMEUC9qcl/AuqbX5W6rHpUjODdR67zy
         dldbjrxGf+m6cyu4uX3OaLvZkDzpIC6xZYxl3br/p+0PIcZSbHJhb05AlU1DI8EQGm1a
         fPzOT7/qOQWfK8jr5fiOcdlsLyVlubOushoZ/m/eu/lTW7VF27c5IsV0tlX/nNRoB8vf
         zd2A==
X-Gm-Message-State: AOJu0YyyuwgLK14BRimRturTne5evdHZtx/KTyksLvS1BU52b/Lnpiuh
	3l9K0K/3MGMoHDyEM5Ur59G8Ig==
X-Google-Smtp-Source: AGHT+IFQqDHrxS5nLVVcz3uYz3zBoh8PRAUblObfkXMiu+127hGE3d4cKV4jcsCeAwYclm/ssvuz7g==
X-Received: by 2002:a1c:6a05:0:b0:404:757e:c5ba with SMTP id f5-20020a1c6a05000000b00404757ec5bamr10282866wmc.26.1696283130281;
        Mon, 02 Oct 2023 14:45:30 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: devnull+j.granados.samsung.com@kernel.org
Cc: Jason@zx2c4.com,
	airlied@gmail.com,
	arnd@arndb.de,
	clemens@ladisch.de,
	daniel@ffwll.ch,
	davem@davemloft.net,
	decui@microsoft.com,
	dgilbert@interlog.com,
	dri-devel@lists.freedesktop.org,
	dsahern@kernel.org,
	edumazet@google.com,
	gregkh@linuxfoundation.org,
	haiyangz@microsoft.com,
	intel-gfx@lists.freedesktop.org,
	j.granados@samsung.com,
	jani.nikula@linux.intel.com,
	jejb@linux.ibm.com,
	jgg@ziepe.ca,
	jgross@suse.com,
	jirislaby@kernel.org,
	joonas.lahtinen@linux.intel.com,
	josh@joshtriplett.org,
	keescook@chromium.org,
	kuba@kernel.org,
	kys@microsoft.com,
	leon@kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	martin.petersen@oracle.com,
	mcgrof@kernel.org,
	minyard@acm.org,
	netdev@vger.kernel.org,
	oleksandr_tyshchenko@epam.com,
	openipmi-developer@lists.sourceforge.net,
	pabeni@redhat.com,
	phil@philpotter.co.uk,
	rafael@kernel.org,
	robinmholt@gmail.com,
	rodrigo.vivi@intel.com,
	russell.h.weight@intel.com,
	song@kernel.org,
	sstabellini@kernel.org,
	steve.wahl@hpe.com,
	sudipm.mukherjee@gmail.com,
	tvrtko.ursulin@linux.intel.com,
	tytso@mit.edu,
	wei.liu@kernel.org,
	willy@infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 01/15] cdrom: Remove now superfluous sentinel element from ctl_table array
Date: Mon,  2 Oct 2023 22:45:28 +0100
Message-ID: <20231002214528.15529-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-1-02dd0d46f71e@samsung.com>
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-1-02dd0d46f71e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> From: Joel Granados <j.granados@samsung.com>
>
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
>
> Remove sentinel element from cdrom_table
>
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/cdrom/cdrom.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index cc2839805983..a5e07270e0d4 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -3655,7 +3655,6 @@ static struct ctl_table cdrom_table[] = {
>  		.mode		= 0644,
>  		.proc_handler	= cdrom_sysctl_handler
>  	},
> -	{ }
>  };
>  static struct ctl_table_header *cdrom_sysctl_header;
>
>
> -- 
> 2.30.2


Hi Joel,

Looks good to me, many thanks. I'll send on for inclusion.

Reviewed-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil

