Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6817EE8AC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 22:09:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634645.990121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3jbn-0001y2-1j; Thu, 16 Nov 2023 21:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634645.990121; Thu, 16 Nov 2023 21:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3jbm-0001wG-VM; Thu, 16 Nov 2023 21:09:06 +0000
Received: by outflank-mailman (input) for mailman id 634645;
 Thu, 16 Nov 2023 21:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TnVx=G5=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1r3jbk-0001wA-VC
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 21:09:05 +0000
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e7e8768-84c4-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 22:09:03 +0100 (CET)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5c19a328797so966959a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 13:09:03 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056a00130c00b0068fece22469sm175211pfu.4.2023.11.16.13.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 13:08:59 -0800 (PST)
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
X-Inumbo-ID: 5e7e8768-84c4-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700168942; x=1700773742; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xYAFY96XcFiMxIF+L4YoxaW0MbIDBtwFnVJcSIPp9Co=;
        b=kDiG/AGzHtjC0YsLanjx3y6RCk7CzI8L/hgJ+olY+FkgkxTpsTs8olJi0ECPvdxQX3
         RKRSIz8X38DhNTfmR9PmBHAwL4Gk00nW30SmhpfHj6myWRcuCneppQplG7aywSf6ahXS
         dCwWsEvP+TEKPZWlVxINFffUAmMdmVGDZy78Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700168942; x=1700773742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYAFY96XcFiMxIF+L4YoxaW0MbIDBtwFnVJcSIPp9Co=;
        b=D3t35cyGzEVKYVb3zkGfySkk5ktIVufJxKL6xydYbZPzfYdQUyJ2mAnhW6UnKuvuiO
         YviXE9TI6/PLjZX9W97GC0OX1IMvh5XqwVJUoR2QgVuy5Rfz1Kg+a9xQ1W9w43o+BO4q
         PsdCcFo2sshYPFHK0pA7uXV0iEJWOkZAD1vi/PaawE5cY+UySTc+um3yQipVRDXBI2Nm
         c5Rp8sLvsdKbQMGNsVEUFTVwoTTgUrXHaykf/xQzJ6Y30NcnTxZ9HYkjND0F61c4xtlZ
         0eU37IPt6dYXJrjQwGrZSYJaKogZLqWAq2UeytAk6YISB1VxFB/OvWbwjOtApxl20Cnx
         HeTg==
X-Gm-Message-State: AOJu0YwBdnDDAMDwjG0td9NS1g9R32O4QfsgKD0tNodtRzTFQ4GbwOru
	LQoyAGuIXv9N5Uvp24nRBB8GZw==
X-Google-Smtp-Source: AGHT+IGDMJWNBh7L3/s1oXiCq33PVVTLiBNbt/MbNP2Jg71YOV8F+by6BxzlVI3bHz3WEwpQvMCriQ==
X-Received: by 2002:a05:6a20:12c6:b0:154:b4cb:2e8c with SMTP id v6-20020a056a2012c600b00154b4cb2e8cmr18208401pzg.24.1700168942326;
        Thu, 16 Nov 2023 13:09:02 -0800 (PST)
Date: Thu, 16 Nov 2023 13:08:35 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] xen: privcmd: Replace zero-length array with
 flex-array member and use __counted_by
Message-ID: <202311161307.9422E1896B@keescook>
References: <ZVZlg3tPMPCRdteh@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVZlg3tPMPCRdteh@work>

On Thu, Nov 16, 2023 at 12:54:59PM -0600, Gustavo A. R. Silva wrote:
> Fake flexible arrays (zero-length and one-element arrays) are deprecated,
> and should be replaced by flexible-array members. So, replace
> zero-length array with a flexible-array member in `struct
> privcmd_kernel_ioreq`.
> 
> Also annotate array `ports` with `__counted_by()` to prepare for the
> coming implementation by GCC and Clang of the `__counted_by` attribute.
> Flexible array members annotated with `__counted_by` can have their
> accesses bounds-checked at run-time via `CONFIG_UBSAN_BOUNDS` (for array
> indexing) and `CONFIG_FORTIFY_SOURCE` (for strcpy/memcpy-family functions).
> 
> This fixes multiple -Warray-bounds warnings:
> drivers/xen/privcmd.c:1239:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
> drivers/xen/privcmd.c:1240:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
> drivers/xen/privcmd.c:1241:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
> drivers/xen/privcmd.c:1245:33: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
> drivers/xen/privcmd.c:1258:67: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
> 
> This results in no differences in binary output.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks right to me. I can see the allocation:

        size = struct_size(kioreq, ports, ioeventfd->vcpus);
        kioreq = kzalloc(size, GFP_KERNEL);
        if (!kioreq)
                return ERR_PTR(-ENOMEM);

        kioreq->dom = ioeventfd->dom;
        kioreq->vcpus = ioeventfd->vcpus;


Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

