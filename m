Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8B7999F41
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816758.1230864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBHR-0007hT-DQ; Fri, 11 Oct 2024 08:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816758.1230864; Fri, 11 Oct 2024 08:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBHR-0007fi-Ac; Fri, 11 Oct 2024 08:45:49 +0000
Received: by outflank-mailman (input) for mailman id 816758;
 Fri, 11 Oct 2024 08:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtJ7=RH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1szBHQ-0007el-Gf
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:45:48 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3617a922-87ad-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 10:45:48 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so3491096a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:45:48 -0700 (PDT)
Received: from localhost ([213.195.123.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c9372608f4sm1685158a12.70.2024.10.11.01.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:45:47 -0700 (PDT)
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
X-Inumbo-ID: 3617a922-87ad-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728636347; x=1729241147; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OBwTT+oZtVytmLXd/nh9K8ecrY0kNQyGbVHtwp3LWU8=;
        b=K7pdArVBjMlZOiEJbdLuBZA+tv4byo/rpY7vvYR9gLQc9uFDQ1sjDEpX03mDycsIK9
         He/MQxp/vknTxYWZl+vkbSqQ7Aa8IEyMO08kKI25uWWWFcayD6OhV56xisVGlhPMCw9q
         rrnADg6jHyyymn5niQIAcHa3DgZLpNIw/vioI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636347; x=1729241147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBwTT+oZtVytmLXd/nh9K8ecrY0kNQyGbVHtwp3LWU8=;
        b=nR/AAnytRFSbeEfzKXPO6iQsrI9u+o11on1i6bT1Hviy1Zu/EP4S2Pxh5K9UWeR9f9
         23I8Xy8DjM/PeNEPZrzxRdV4KKL43jg52faU6UbTAYRuPdAgQ8XbqOEA0024RqvnpG4V
         O2ruK2cBVqhHTPrA8ecIW/sC4NHqyzC5jdV7VznIT0ELBA+kZrI2Zx2VvbOnYcB85CVB
         HsFH9aKMoG4KDV/pYYROdXwJesAMTTmJxujbEA8RwoYd0hfuBZlz1qiWrRZKAzbOsB7F
         NfC2836dIHHuhmIHrCYWLQYBBeXNMJQoM1hZ6ZQTJMkjCgarVB3EzNHsDCq48tSaFm/S
         Pfug==
X-Gm-Message-State: AOJu0YxWY/MrI0bnu4k7zCo/07PAvDOhx6DRnlg4bbik3xS/fyaZkTeF
	ibNiGVivrB9aL/LFJfaPNonD7US67Il2QUFMIzEHgpav2+GGhx62uOCilFxPIyY=
X-Google-Smtp-Source: AGHT+IGIVOy9PWupau/rKRDci7CXr2etTPC6dOUca1x0eohiZRwNPGNOGgprVxnX0uyfhiJg3V+W7g==
X-Received: by 2002:a05:6402:2804:b0:5c8:97b9:58a6 with SMTP id 4fb4d7f45d1cf-5c947417777mr1884205a12.1.1728636347431;
        Fri, 11 Oct 2024 01:45:47 -0700 (PDT)
Date: Fri, 11 Oct 2024 10:45:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 4/4] xen/pci: address a violation of MISRA C Rule
 16.3
Message-ID: <ZwjlurKU7FrFvObG@macbook.local>
References: <cover.1728308312.git.federico.serafini@bugseng.com>
 <c662cae0f545a4e4e3921ae13bf69dc02884d9ee.1728308312.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c662cae0f545a4e4e3921ae13bf69dc02884d9ee.1728308312.git.federico.serafini@bugseng.com>

On Mon, Oct 07, 2024 at 04:16:19PM +0200, Federico Serafini wrote:
> Refactor the code to avoid an implicit fallthrough and address
> a violation of MISRA C:2012 Rule 16.3: "An unconditional `break'
> statement shall terminate every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
> - improved description.
> ---
>  xen/drivers/passthrough/pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 5a446d3dce..a5705def3f 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -170,8 +170,10 @@ static int __init cf_check parse_phantom_dev(const char *str)
>      {
>      case 1: case 2: case 4:
>          if ( *s )
> -    default:
>              return -EINVAL;
> +        break;

Would you mind adding a newline here between the break and the default
case?

With that:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

