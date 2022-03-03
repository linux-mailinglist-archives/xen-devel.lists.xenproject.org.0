Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6404B4CC325
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283555.482616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoaJ-0002jM-1l; Thu, 03 Mar 2022 16:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283555.482616; Thu, 03 Mar 2022 16:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoaI-0002hI-Un; Thu, 03 Mar 2022 16:45:46 +0000
Received: by outflank-mailman (input) for mailman id 283555;
 Thu, 03 Mar 2022 16:45:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7nUi=TO=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nPoaH-0002hC-5l
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:45:45 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dfe4289-9b11-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 17:45:44 +0100 (CET)
Received: by mail-qv1-xf36.google.com with SMTP id f11so4563832qvz.4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Mar 2022 08:45:44 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254]) by smtp.gmail.com with ESMTPSA id
 o21-20020a05622a009500b002de9437a361sm1852806qtw.51.2022.03.03.08.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 08:45:42 -0800 (PST)
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
X-Inumbo-ID: 5dfe4289-9b11-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=37OBnyCkhWCp8ML45vhmE8oVSuW97TvQCBK8N6+4i7c=;
        b=Ldf01gRB5JkaGduWI0dYefNBLt0mj7H2L0fRoc5v/eCbeUwXeb2zoMur01C4YXZtar
         3m3EIKSAGKSghxl3HBuTO9st5eSkGqeYuxsBVUj7DSOSgsQjuKW+9rVOmEbP5W0yuNRJ
         2oI4CXgRer4+G/E6d4UVWgu3y0pcwoPhzcPGaEV3fd0zz5Eb4xa5zWH4lxs0Z6jkTKov
         6Sfrci+qID8snshVv2srWDEy/hBIr8HPUFCd7sb0AB17LFMqpRkoC2vPsNGtnplamdt5
         ekqjR9WIvK7QCVdzlj/jhrrC9nrWIY1sM8PcEP24AYcryFhswMM1AbUa+Y2NPThbFp4s
         At8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=37OBnyCkhWCp8ML45vhmE8oVSuW97TvQCBK8N6+4i7c=;
        b=N04LzySLHuAP/lwrUN1FMzhb2tOzFTbdQ579mTuq42J1KFBJcxTq3HK1LRINNFE8YD
         pCdkZ78MdjcFZNnwb9Tg4E6fmmNRpekMn09KnJYYMtEGXUwRF1ZLUkcRA8OHbJh5GXFR
         5K9sChqkpHQBjWm+Wfm3kAOrrT1vaFetE1lnfSQ7Me1GmUgSunh7lh4vKor48NXTp65C
         wTnFaJHh+8ovJpJZTlUlBdOcSUAwySFhmDF5U3tTP7jdiYWEalzux7cc5P0a+qiOlZ2f
         +mQX0WOnM7AaH+9+/ANHlfLJ94/QWrnyIs+xF8x1RngFy5IaGTVQbznKX6tH8Zmbx6fa
         tyTA==
X-Gm-Message-State: AOAM531XmaxYzSkaLx9Tw3t+xNDVtzTUraC4MFAlzqXBU3BnsGXf9+dX
	qbhUgkkwHwN/FhhsUatooB8=
X-Google-Smtp-Source: ABdhPJxOu74g5hnQC/7Gro8KuoTm8sdPnvuoW9W3L5mhVoOtqe55j4QbCvbgTlt1gsf7tznsdxRwyQ==
X-Received: by 2002:a05:6214:d64:b0:432:e2e4:bfa3 with SMTP id 4-20020a0562140d6400b00432e2e4bfa3mr18974948qvs.72.1646325943053;
        Thu, 03 Mar 2022 08:45:43 -0800 (PST)
Message-ID: <9a02db6a23b269fe774ad4a0bc4c662e5e4df37c.camel@gmail.com>
Subject: Re: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
From: Alex Olson <this.is.a0lson@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Wei Liu <wl@xen.org>
Date: Thu, 03 Mar 2022 10:45:41 -0600
In-Reply-To: <20220303103057.49181-4-roger.pau@citrix.com>
References: <20220303103057.49181-1-roger.pau@citrix.com>
	 <20220303103057.49181-4-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Roger,

Thanks for the patches.  In trying them out, I found some other PHYSDEVOP
commands that were being blocked by the "default" case and were being failed
with -ENOSYS... 

Would something like the change below make sense?  Or is defaulting to failure
incorrect?   (I saw denials for the "add" commands, and also added the
remove/release commands for symmetry).

With this change, I was able to achieve a functional virtual function passed
through to a HVM domain with PVH dom0.

Thanks

-Alex


diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index b8becab475..6abaa626a3 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -84,6 +84,17 @@ static long hvm_physdev_op(int cmd,
XEN_GUEST_HANDLE_PARAM(void) arg)
 
     switch ( cmd )
     {
+
+    case PHYSDEVOP_manage_pci_add:
+    case PHYSDEVOP_manage_pci_remove:
+    case PHYSDEVOP_pci_device_add:
+    case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_manage_pci_add_ext:
+    case PHYSDEVOP_prepare_msix:
+    case PHYSDEVOP_release_msix:
+        if ( is_control_domain(currd) )
+            break;
+
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
         /*



On Thu, 2022-03-03 at 11:30 +0100, Roger Pau Monne wrote:
> Control domains (including domains having control over a single other
> guest) need access to PHYSDEVOP_{un,}map_pirq in order to setup
> bindings of interrupts from devices assigned to the controlled guest.
> 
> As such relax the check for HVM based guests and allow the usage of
> the hypercalls for any control domains. Note that further safety
> checks will be performed in order to assert that the current domain
> has the right permissions against the target of the hypercall.
> 
> Reported-by: Alex Olson <this.is.a0lson@gmail.com>
> Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/hypercall.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 030243810e..9128e4d025 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -87,6 +87,13 @@ static long hvm_physdev_op(int cmd,
> XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>      case PHYSDEVOP_map_pirq:
>      case PHYSDEVOP_unmap_pirq:
> +        /*
> +         * Control domain (and domains controlling others) need to use
> +         * PHYSDEVOP_{un,}map_pirq in order to setup interrupts for
> passthrough
> +         * devices on behalf of other guests.
> +         */
> +        if ( is_control_domain(currd) || currd->target )
> +            break;
>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:


