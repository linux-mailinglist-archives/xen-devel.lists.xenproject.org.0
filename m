Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D79A07C69
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868848.1280383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVunx-0002sm-BU; Thu, 09 Jan 2025 15:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868848.1280383; Thu, 09 Jan 2025 15:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVunx-0002r9-8d; Thu, 09 Jan 2025 15:50:41 +0000
Received: by outflank-mailman (input) for mailman id 868848;
 Thu, 09 Jan 2025 15:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GFlP=UB=minyard.net=corey@srs-se1.protection.inumbo.net>)
 id 1tVuj5-0007JX-JE
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:45:39 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4e9e996-cea0-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 16:45:37 +0100 (CET)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-71e35be77b5so294447a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:45:37 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:9076:47eb:1e0a:16fb])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f882625f0esm386258eaf.9.2025.01.09.07.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 07:45:34 -0800 (PST)
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
X-Inumbo-ID: c4e9e996-cea0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1736437536; x=1737042336; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
        b=q6nwCkV41xW+Fds1LDOZpnbvcSLAMdFpaetYqLXTnzUCx7IQj1j0zYEp0XaWBujad9
         /TRD/k7dj6u5VQUDwALtFgAKVCcj5y7MJGzldjUgilyOdiNGLEh2WKNYyudXRw0HRRtI
         Tr3qqSUUGH17QNsyhJYXYheppJzIeBdvHOW6gHDphl2Q75p4B3PuQXGnwhgGN165ySpU
         p31qsrmHbh+h5Fq119u/tuMZo4mg1UidfiOKuFsePnFsKiuG9b+9MAV859mUZIspuuLW
         sY4HJWxPfQJX7AlAqfZ2Hj9wBxkmR1uJ76+vLbIOJMLa2qhc3wJGQoLpXM2TtUGA+h/a
         jyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437536; x=1737042336;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
        b=uoNjiUNfqla2wiKfIc1CXONzzQtuJkCcZWCXUjRUfkLhhnBL14jDIWTImMrXCANhvb
         2mCZl6fmtHjdpy8L2GQf94UY1seyjiT6w0l7CQUA2iXkrUs/2pj2KajL8d4Tsbkmxka3
         o1wPrB2GbXz9+ZErZvNWY67fDQYZqArNTveOi2XndqTN1FAdXNX3i6mhhZ52MD/FuJ9B
         GGWRRowjKL6n2GXZAU2eae2053XS9YujkNPKtZj4xlLrWndHSdcb+nVL1m9Hx8kPAxgo
         So1ieVMraJOYICqaFsE0ESqbvfxk0z+2RkIgwuxer+eDiJccb6KSph3P7B+HanOTKc6E
         k/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVlDq5RDGTMoMciWnL1g4NqkxwP07YczMn0I6zC3ruIVyOMz208p9j9gb0BaVChW11rc6Jv5y2E6Nc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGbeouVWadIuctb4flb5ErHvZ5F6hiHzZmjwZIKmHCLYuYotYy
	FaBaG/Eclpi2VI48QsknFFpf1044n8/SR8aaPSX93gvWYfSK5HgwjZNyW/ZZnAw=
X-Gm-Gg: ASbGncus6Py/kNjQGHTCQJR3+RLtaTUY4Mh11o6rGTymyePxfqZ28JldDue2qrFyqIn
	rH7nesQW7rBDp2+WEh6pIR4CVlZU/+P8+XzKWckg2GCmQHfMffTcCwiAucAlfwnATsPENodbW41
	6RE35Bcsc25dTDdUayrbFFlTPJud/0uUGS6DcymMbZtSDPQBqUyvAAF4ZFnHyPeJK5J6vRRkk0+
	/ugOrqA/TXnMNjeZsdxyY/Aj9U5j1tvXahrwRUFBi16676dAmyOO2GehPo0
X-Google-Smtp-Source: AGHT+IHELUnxP9ZvL+e2Ztemz39I9ORoPYZLTVwEa+XG73J5uz7w7yM0cuXu9KZqTaUsGk+1/+jmGA==
X-Received: by 2002:a05:6830:6610:b0:716:a95d:9ef with SMTP id 46e09a7af769-721e2e000d6mr4949630a34.2.1736437534534;
        Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Date: Thu, 9 Jan 2025 09:45:27 -0600
From: Corey Minyard <corey@minyard.net>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org,
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
	io-uring@vger.kernel.org, bpf@vger.kernel.org,
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
Message-ID: <Z3_vF3I453flXoZv@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>

On Thu, Jan 09, 2025 at 02:16:39PM +0100, Joel Granados wrote:
> Add the const qualifier to all the ctl_tables in the tree except the
> ones in ./net dir. The "net" sysctl code is special as it modifies the
> arrays before passing it on to the registration function.
> 
...
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
> index 941d2dcc8c9d..de84f59468a9 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -650,7 +650,7 @@ static struct ipmi_smi_watcher smi_watcher = {
>  #ifdef CONFIG_PROC_FS
>  #include <linux/sysctl.h>
>  
> -static struct ctl_table ipmi_table[] = {
> +static const struct ctl_table ipmi_table[] = {
>  	{ .procname	= "poweroff_powercycle",
>  	  .data		= &poweroff_powercycle,
>  	  .maxlen	= sizeof(poweroff_powercycle),

For the IPMI portion:

Acked-by: Corey Minyard <cminyard@mvista.com>


