Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D7C15011
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 14:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152139.1482668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDkCN-0001Ux-8T; Tue, 28 Oct 2025 13:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152139.1482668; Tue, 28 Oct 2025 13:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDkCN-0001TV-5o; Tue, 28 Oct 2025 13:57:19 +0000
Received: by outflank-mailman (input) for mailman id 1152139;
 Tue, 28 Oct 2025 13:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGJv=5F=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vDkCK-0001TP-Ti
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 13:57:17 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0241b90c-b406-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 14:57:15 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-592fa38fe60so7155149e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 06:57:15 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-593027d858bsm3005590e87.47.2025.10.28.06.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 06:57:12 -0700 (PDT)
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
X-Inumbo-ID: 0241b90c-b406-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761659834; x=1762264634; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ywkWcUB/bHBOlXnCDPOpcuQpF9M08DR5u7xlF4oebkU=;
        b=ATsX4pm3fHLXQSXFIwKzW0yUBKa2L/I6wJ5KgILeybyQgTPJ3K8Jx3WEEqJdgavfwB
         Zlh89HEnPp6E3QoReqBBDjuAkHji9Ms3i3OPVoRgiGHrKhiGsDhd7jrYMUzJyuRM4LsN
         SPM4lCGJRKHSQJePJg4KvO2LSocuCNdJIo4HXA4MAvXXgmBi/BUK14YbfzZeznhXbGS8
         Azaqnc5C+dzsg0htseXjrL4Lu+5LyR1F5JUzyi/ie3aEPPqunEpD1NYPbLg6UnG7nIdC
         U6vM7AL7mbRbUW0XE6m5stNqCfvS/Xn+TuwYir9JDklqAfioogDx8TTWiAxRodMfQPRk
         YLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659834; x=1762264634;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywkWcUB/bHBOlXnCDPOpcuQpF9M08DR5u7xlF4oebkU=;
        b=GW4paibWB8YUHmVpG4yB8UjetMoYq6t5ZPeNQfQ/94gdR+XIBNMJDil4o6aFSzJkLB
         zMavVrf4/pqieGu51vNbuGN0OdhHaxYs1W3FuTuy77IFBHlVNR7cnOY6sFWBa2vwbWWs
         CkUpqa67YEF5bFWWcKQ9saAYQwC1iPkidlzzUCs4OJgfGU2pE2ZJxfMBftED36LM0/xZ
         fUygJJ/qk9v/G4U9bS5l2bE1JqSuZl2O4HgwFATEKZH/7JeU7X1AEyzDLiFWNuVl4y2J
         wMo/9NQn/J/9frP11uaymMPuB14u2kWCUnSkyZREJjLdwxTuehunyN4F/sCEgIinrm38
         MQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCXEzuFljVWdP+/Wy3IqyigbI07zeuos2trlHX1XZT84tC1i+KnP+F4j8agJzgpMO8Bda0AE1jIayBM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZVOAEHewFS/lLBuMZumnFSaa6YTdNXaevl35/wSdLDsj0xIq1
	AQWBdPnGNCHnGy5I6HzzzzEorjFD+SiZ+9GKL6yAyMiFz24fKuiF3LNd
X-Gm-Gg: ASbGncsAVLS7T+Y7b7Jqjvs19/ITk+qkzbKW4dPpZw4ItHGdbc9G6nqAfbZOFDyEug5
	Fp3IMnLF3uoKejPIiXv/Y4PQLL1zr3zCyQY0cRYoON4uVc6t1iwJxKqVrEDPq6JOFcM+cI2c5Jo
	gQBMVC3LXYkZXAFcmOFPGh59owVw1Cavo7Mc1Z0MXXMvDoRTuXHVzB/+TWBvM8HY9G4dk83BDkc
	r3nW+/plk5R1UPugivAgQuztlWPnJh9c59AGHJ/ruDJWZFLge7aVgtNkVETYMHNuVex0IILzNnL
	o8m8mUIuUbD4iskuqMbjl2J+xDdgDUE3E3bovcN9rw+LI8LI/MUUg7+t5EFVc1Amn7mKPWb04vo
	6iOpxwfeBPNnLf/Z+ngoaS3/2KTD8WNlA4GZtSJch+rxiSs6YEL7hxzedI9pjitBLJqlDsPqGGd
	NsKUWxtqvGNmMyUcpXkwiNN49MKUtNUGQy7pD3
X-Google-Smtp-Source: AGHT+IHhlEhCXWG4JnGYnZ9PlIkPfPss+qjJNDrSomU1aZUyUCzyg6jNNad5EKiHbRdmXz1yu4/PQQ==
X-Received: by 2002:ac2:4f03:0:b0:591:ebc3:a688 with SMTP id 2adb3069b0e04-5930e9f7af6mr1094572e87.56.1761659833877;
        Tue, 28 Oct 2025 06:57:13 -0700 (PDT)
Date: Tue, 28 Oct 2025 14:57:11 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anton Johansson <anjo@rev.ng>
Subject: Re: [PATCH 3/3] hw/xen: Build only once
Message-ID: <aQDLt44edkDsfTAU@zapote>
References: <20251022140114.72372-1-philmd@linaro.org>
 <20251022140114.72372-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022140114.72372-4-philmd@linaro.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Wed, Oct 22, 2025 at 04:01:13PM +0200, Philippe Mathieu-Daudé wrote:
> Now than hw/xen/ files don't use any target-specific code,
> we can build all file units once, removing the need for the
> xen_specific_ss[] source set.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  hw/xen/meson.build | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index a1850e76988..dcd2b7e1df3 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -7,21 +7,16 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
>    'xen_pvdev.c',
>  ))
>  
> -system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
> -  'xen-operations.c',
> -),
> -if_false: files(
> -  'xen_stubs.c',
> -))
> -
> -xen_specific_ss = ss.source_set()
> -xen_specific_ss.add(files(
> -  'xen-mapcache.c',
> +xen_common_ss = ss.source_set()
> +xen_common_ss.add(files(
>    'xen-hvm-common.c',
> +  'xen-mapcache.c',
> +  'xen-operations.c',
>    'xen-pvh-common.c',
>  ))
> +
>  if have_xen_pci_passthrough
> -  xen_specific_ss.add(files(
> +  xen_common_ss.add(files(
>      'xen-host-pci-device.c',
>      'xen_pt.c',
>      'xen_pt_config_init.c',
> @@ -30,7 +25,8 @@ if have_xen_pci_passthrough
>      'xen_pt_msi.c',
>    ))
>  else
> -  xen_specific_ss.add(files('xen_pt_stub.c'))
> +  xen_common_ss.add(files('xen_pt_stub.c'))
>  endif
>  
> -specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
> +system_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_common_ss)
> +system_ss.add(when: ['CONFIG_XEN', xen], if_false: files('xen_stubs.c'))
> -- 
> 2.51.0
> 

