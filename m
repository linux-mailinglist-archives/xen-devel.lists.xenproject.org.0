Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625789054CE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 16:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739373.1146377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHOhO-0003OB-Oj; Wed, 12 Jun 2024 14:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739373.1146377; Wed, 12 Jun 2024 14:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHOhO-0003Mg-Le; Wed, 12 Jun 2024 14:11:38 +0000
Received: by outflank-mailman (input) for mailman id 739373;
 Wed, 12 Jun 2024 14:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHOhN-0003Ma-HR
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 14:11:37 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acda2a32-28c5-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 16:11:35 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6afc61f9a2eso8758026d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 07:11:35 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b08c25d7a7sm18080436d6.41.2024.06.12.07.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 07:11:33 -0700 (PDT)
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
X-Inumbo-ID: acda2a32-28c5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718201494; x=1718806294; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G6v3euzWvAR7MYKGWycaAXUSOp/5qPdZ84CiBBNCQis=;
        b=cAD1dnhiWRaVnQagLfYvreg8QN92uIdFxbOsNYZOsjGd6pC/XlDj3mKSwNwFXKRbg0
         yxXnjcBlIMbN7Ih+0WO70mgTP5Rz0qRvMvcH68GPWnPjzR5Il7yvifL9fBbxANEMsvHU
         JhbHeNOJEe9cKKhJSPKpu34kfCCxCR5eNsgWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718201494; x=1718806294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6v3euzWvAR7MYKGWycaAXUSOp/5qPdZ84CiBBNCQis=;
        b=e/J1h8wI5l8KEmS+ds4kGkFiWRxvIu4WFAjAr1BpUqOe34LTUoFuY2f+rEbZy5H4aL
         cr2SPHuJASAU42fSw7/0Zx1OBB/6qxIpjCPkpdiwa9YT2U09DINAII71tXvJfEKfuvsH
         woTLnAV63ikr7CrF3tO6fE7EbqqXAP1shn6lp117XYlIfKpVflKGk+jkNNAuZhJq4F/Y
         ovy/lj+Nf51sAdkj3IbJw5TTHvrXnlOcwGHlwGhe5bDq1AgGN0XVy0TgYdT4EezP8UM4
         qQaTZxpnWojp0TmLZtFVwUBNyNpCXV2dAk+TLF0taYO3bf4Z6lgTC2vdhkVVF/SI2IvP
         QV6w==
X-Gm-Message-State: AOJu0YyL6PBrnNsxBA/Tb9YkHsyX9dr4c3t/v9fLfjBCXjXZnUVcar3l
	hqQjAzOOthwHsuFXfG6D4NXdr2c0WMTvHbpcgFAeN8k+08dXH6fWAEC8F6+ZMtZN9pLR7C92rZF
	N
X-Google-Smtp-Source: AGHT+IFSzINSG79ZYBLSDuOMUUT4EUTGhK8ebc/Lz1wyJB7gsXSf7EESHeb5qo9+zHA7L7Y6BZNpIA==
X-Received: by 2002:a05:6214:2621:b0:6b0:72ac:b306 with SMTP id 6a1803df08f44-6b089e89cc6mr108736186d6.1.1718201494117;
        Wed, 12 Jun 2024 07:11:34 -0700 (PDT)
Date: Wed, 12 Jun 2024 16:11:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.19 1/3] x86/EPT: correct special page checking
 in epte_get_entry_emt()
Message-ID: <ZmmskwdoKvAotRk-@macbook>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <175df1a2-a95f-462b-ad49-3a0fef727658@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175df1a2-a95f-462b-ad49-3a0fef727658@suse.com>

On Wed, Jun 12, 2024 at 03:16:37PM +0200, Jan Beulich wrote:
> mfn_valid() granularity is (currently) 256Mb. Therefore the start of a
> 1Gb page passing the test doesn't necessarily mean all parts of such a
> range would also pass.

How would such a superpage end up in the EPT?

I would assume this can only happen when adding a superpage MMIO that
has part of it return success from mfn_valid()?

> Yet using the result of mfn_to_page() on an MFN
> which doesn't pass mfn_valid() checking is liable to result in a crash
> (the invocation of mfn_to_page() alone is presumably "just" UB in such a
> case).
> 
> Fixes: ca24b2ffdbd9 ("x86/hvm: set 'ipat' in EPT for special pages")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Of course we could leverage mfn_valid() granularity here to do an
> increment by more than 1 if mfn_valid() returned false. Yet doing so
> likely would want a suitable helper to be introduced first, rather than
> open-coding such logic here.

We would still need to call is_special_page() on each 4K chunk, at
which point taking advantage of the mfn_valid() granularity is likely
to make the code more complicated to follow IMO.

Thanks, Roger.

