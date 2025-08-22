Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02D2B31AC8
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 16:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090194.1447542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSQe-0002X4-Rw; Fri, 22 Aug 2025 14:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090194.1447542; Fri, 22 Aug 2025 14:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSQe-0002Uo-PH; Fri, 22 Aug 2025 14:07:40 +0000
Received: by outflank-mailman (input) for mailman id 1090194;
 Fri, 22 Aug 2025 14:07:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1upSQd-0002Ui-Po
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 14:07:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1upSQc-000r5h-30;
 Fri, 22 Aug 2025 14:07:39 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1upSQc-00DFP7-2e;
 Fri, 22 Aug 2025 14:07:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=X5jqs7i4pFGkAg49w7ID/6UA+4MdKV1xYmY0oFNv5s0=; b=g6S0w+pCcJBFdXBfuuir1obDTw
	yQhmOTObRixVVMhYfVz3lUMTjH48Xk4kFGqciErpV8mAXKB7ahsGdk5ZydWbaJaxaB01HgF/El2QF
	kBIUpnwg/oa3Uib6Srwg1gHd88y6DIYjpzZ/wYhRrZiA2RtdLQ1OnABy+2CMm0fAC7kg=;
Date: Fri, 22 Aug 2025 16:07:37 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
	Edgar.Iglesias@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v1] tools: make "opengl" generic
Message-ID: <aKh5qUEk6ft9q5MQ@l14>
References: <20250728044007.4026420-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728044007.4026420-1-Penny.Zheng@amd.com>

On Mon, Jul 28, 2025 at 12:40:07PM +0800, Penny Zheng wrote:
> Display option, like vnc, sdl, etc, will be checked against in latest QEMU
> whether it is compatile with opengl context. And vnc is incompatible with GL
> context.
> Now, when running hvm domain with gl context on, such as
> "device_model_args_hvm = ["-display", "sdl,gl=on"]", we will fail with
> the error of "qemu-system-i386: -vnc 127.0.0.1:0,to=99: Display vnc is
> incompatible with the GL context", as vnc is set enabled on default
> for HVM domain.
> 
> We shall move "opengl" option out of specifc sdl display, to make it

Unfurtunatly, we can't remove field from a struct in the public API of
libxl. You'll find some explanation about the "libxl API compatibility"
in "libxl.h". It's not well explain but "libxl_types.idl" is part of the
public API.

> generic. Then when users explicitly set "opengl = 1", default values for
> vnc shall be changed to disabled and libxl__dm_vnc() needs to return NULL
> indicating vnc being disabled.

> If users select both vnc and opengl in xl configuration, creation
> will fail and error out incompatible info.
> To keep consistency, we also make "opengl" generic for vfb[] options
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

This patch description is a bit confusing to read to me. Right now, there's no
mention of "opengl" in the docs, or in `man xl.cfg`, even if "opengl=1"
seems to be a thing for `xl`.

In libxl code, it seems "opengl" is only an option for the PV display
interface, or VFB. So what I'm guessing is you want to add support to
HVM guest to have the opengl option working.

The patch description mention "-display sdl,gl=on", yet the patch itself
doesn't modify "-display sdl" to enable the gl context. Why?

The xl.cfg man page isn't forthcoming about it but the use of
"device_model_args*" is mainly useful for debugging, to allow to add
extra option without having to change libxl. If an option added there is
incompatible with the command line generated by libxl, then it would be
better to teach libxl to generate that option.


> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 28cdbf07c2..9e9adcec77 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2791,14 +2790,16 @@ skip_usbdev:
>  
>  #undef parse_extra_args
>  
> +    if (!xlu_cfg_get_long (config, "vnc", &l, 0))
> +        vnc_enabled = l;
> +    xlu_cfg_get_defbool(config, "opengl", &b_info->u.hvm.opengl, 0);
> +    if (vnc_enabled && libxl_defbool_val(b_info->u.hvm.opengl)) {
> +        fprintf(stderr, "vnc is incompatible with opengl\n");
> +        exit(1);

This sort of incompatibility need to at least live in libxl
(tools/libs/light). `xl` is only one of several users of `libxl`.


Thanks,

-- 
Anthony PERARD

