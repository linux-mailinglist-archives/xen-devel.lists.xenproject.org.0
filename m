Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1052BA5F1B2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 11:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911895.1318277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgHA-0007Ey-2h; Thu, 13 Mar 2025 10:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911895.1318277; Thu, 13 Mar 2025 10:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgH9-0007Bh-VR; Thu, 13 Mar 2025 10:58:55 +0000
Received: by outflank-mailman (input) for mailman id 911895;
 Thu, 13 Mar 2025 10:58:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEXk=WA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tsgH8-0007BX-Cw
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 10:58:54 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f7ef07-fffa-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 11:58:53 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so622188f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 03:58:53 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a32sm1762270f8f.33.2025.03.13.03.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 03:58:52 -0700 (PDT)
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
X-Inumbo-ID: 26f7ef07-fffa-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741863533; x=1742468333; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ/XlFQ21dlvQ9nnD6/16+fc5wkNLbUY9xThx3bQ8dw=;
        b=It4FmqeEO+FPDVF+wDDAxjG+Ir4GvCNZiPXsVpYu18cf5qru+61vadxZj8jNNAt3ij
         3MW4tJtFONomfy8vlM94Tllwntz+om9x09i2BFCCTfdFuaCTwoIMUbV93dqPGZp61ii5
         62sHc3pWJ3jCXTrPa5/7I3LAFNnmFgtymTSug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741863533; x=1742468333;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZ/XlFQ21dlvQ9nnD6/16+fc5wkNLbUY9xThx3bQ8dw=;
        b=fuWQ/awsx8faG5pa9vpm7kXz8JPfJcOR3PCTLhUPGbH2DGfgKkYwC88VXjX0VW9z3I
         +jPxFZBdoxSl3IcT4/XAKP0hNmsan91067sd22QPPg0ZOAf1IftkGh33qeqQ7vjB3NaM
         SdxhkDQSHdFX6B9jQlupD5EtwPvdXtASmdQxQomyUoMT9SlIhE0Y6nyugAezz0KBNliy
         Z673wMEXvOGIzXCMASvtMEPSZPlHvSC0FxfD0w+Hj7CgexTd5HquYV6yyMeAb1qHGkZv
         nQL5jE2dAuVk37Hv95SCm9g0uu9k46CLB9ebtCLRZUzyK70w8zFgycoQdEvCJOEG+j8+
         S1jw==
X-Forwarded-Encrypted: i=1; AJvYcCVl5uZswXdsQp6U8Pj/XoCNLS1UZa101e4sk+tLCiTAkr+x3ImGCbWpwHFEUZ7h8Y8g7tWxv8jjG/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxhb9rlig7OYTdMOdFnBnWv9VouAtNQzfuse1CjucOd45s0VqYr
	CxDXMRpPHLwcC9OJVyR0pnQ2R0444lHg8n6b/qQkkokaAI9c8tepTEt1Rw/KPmU=
X-Gm-Gg: ASbGncukh1OoQPbK17IjLAvIftZT9aN8QPEpfe/Y3X4CWDYcYRn9dCTDW2XTob4fg+j
	RCU6hdrc8tk4VAeY0r0JBBYnniyNaQa28qGQ9mMFv/LDOjEZr1ArHvWk8BIhuCwAsfzgO2S20KX
	A3l/Gd/5YdOWBoj/6TxuRSNdDewCeI3UdW+YYvva8Ro1jcGsTGgedW0u7f6E/os9nxIwF+KgrZF
	FWtnrxEWgRvt/462hLnchNLaLBpHjn6/sNPMKmV+JBPbNw7tyvj6jwPM0G9ncrA7KGZAHCxRNOD
	k0fIo+f5wfLV4sge4956YG+45wF7Gr+KBTkkBnPw+DRkzlECKKE=
X-Google-Smtp-Source: AGHT+IFJl6Fpf1rfNUdciFAy2fZj1GNloIwtfmTyidwLUUkF5VcBf59mbT8ZP7VOj3MffNypuhcslA==
X-Received: by 2002:adf:8c09:0:b0:391:3915:cffb with SMTP id ffacd0b85a97d-3913915d422mr15610734f8f.43.1741863532841;
        Thu, 13 Mar 2025 03:58:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 10:58:46 +0000
Message-Id: <D8F334YWF1QL.1489MNJCLHXQ2@cloud.com>
Cc: <ray.huang@amd.com>, "Stefano Stabellini" <stefano.stabellini@amd.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Sergiy Kibrik"
 <Sergiy_Kibrik@epam.com>
Subject: Re: [PATCH v1 01/19] xen: introduce CONFIG_SYSCTL
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Penny Zheng" <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-2-Penny.Zheng@amd.com>
In-Reply-To: <20250312040632.2853485-2-Penny.Zheng@amd.com>

Hi,

On Wed Mar 12, 2025 at 4:06 AM GMT, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>

Commit message?

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/common/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 6166327f4d..72e1d7ea97 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -519,6 +519,15 @@ config TRACEBUFFER
>  	  to be collected at run time for debugging or performance analysis.
>  	  Memory and execution overhead when not active is minimal.
> =20
> +menu "Supported hypercall interfaces"
> +	visible if EXPERT

Any particular reason for placing it in the middle of the common menu and n=
ot
at the end?

> +
> +config SYSCTL
> +	bool "Enable sysctl hypercall"

meganit: Arguably "sysctl" is a hypercall group rather than a hypercall, so
"Enable sysctl hypercalls" sounds (subjectively) more appropriate.

> +	depends on !PV_SHIM_EXCLUSIVE
> +	default y

Do we want a "help" statement stating the scope of the hypercall and the
consequences of disabling it? Nothing major, but at least something that mi=
ght
convince someone on menuconfig/nconfig that this is indeed nothing to be
touched for a "regular" build of Xen.

> +endmenu
> +
>  config LLC_COLORING
>  	bool "Last Level Cache (LLC) coloring" if EXPERT
>  	depends on HAS_LLC_COLORING

Cheers,
Alejandro

