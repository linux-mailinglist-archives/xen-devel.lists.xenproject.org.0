Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B66B05785
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 12:10:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043969.1414026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcba-0007bM-Mo; Tue, 15 Jul 2025 10:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043969.1414026; Tue, 15 Jul 2025 10:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcba-0007ZW-JW; Tue, 15 Jul 2025 10:09:46 +0000
Received: by outflank-mailman (input) for mailman id 1043969;
 Tue, 15 Jul 2025 10:09:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tvk=Z4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ubcbZ-0007ZA-Dt
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 10:09:45 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2125f83-6163-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 12:09:40 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so37404055e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 03:09:40 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4560ceb130fsm93192975e9.26.2025.07.15.03.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:09:39 -0700 (PDT)
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
X-Inumbo-ID: d2125f83-6163-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752574180; x=1753178980; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P7oD3h0S1MaNMHmCWWeO4EuRpfsNpwrnCc32g7UlOVk=;
        b=i+KT5a1plbL5rRRRSnH9f/iOQcp4pPVVDe+KnnKJ4PpAR0RXBIdaL8ikMzx5LC8+U2
         6nAmnPTqs+WjXQYfbTPLLKMafvZFTK25M50vEqSFBV3h8SXCRoADUBS4TngR0uJ+YDTY
         kwuWNy5GgapMtVErkD1segILtpmqctNjDP7dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752574180; x=1753178980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7oD3h0S1MaNMHmCWWeO4EuRpfsNpwrnCc32g7UlOVk=;
        b=u33bDq3uZ9mFTpQETahoQrYzmWplxWOUfy121D3N1nwiItuYD3iOi1uUp/hHKrfhJ8
         2fe7UjUmKHc9ITR/UOcyLVwpCxLz+c8WVNXPJyF8X+sd5a0GmmS430K1Ji3KI9haIJZ2
         2CfSQWO/RRd7L8JQe6L4a0zelgA/X1LAPDfH01Srm2BxsVFY1jgzMqh6w1SHj2ZVj1po
         up2smX0wgoXS+E17ctph19xJDV34MxVscWIN+6rBWuZ5trRONTAqGGbfPV0dqOV2P9ud
         7ZDOmSs+pO84fj+yuEw/Uc7gKhR5I6HIqOzqZOgC6xBwpCMtelxjFzcU8PT/yB1wKsPM
         eU6Q==
X-Gm-Message-State: AOJu0YzfeONWAHzF2xrTirGz+Plgc9ynJxMs2e4rEtaIGQbRR5MTgCT6
	BuLwl//c6uuU6vA2CKLJQryv+hNGj0a5imWn+/KgABD17lCydrvHVQhznlXbkPL5gFg=
X-Gm-Gg: ASbGnctfdxtERQDTuVsYHyneHNFeyhG+O9rjVuqv1ns2GS3WN7B/e3extOIvtF50yGO
	DvPv7z1wtGL45Ys33WHy1QWXK4rk+kvF/C6tHC9hoxhahjG++4rO4QO9FZGRLL0p3jPaYp6sxur
	ufi+Ppv1cS7mnls+nwsScY/eGnWivJqXnsMoc5GKc4GLwVwktrsK+xTE1d7sIl/uNoIF+DzopOo
	i2U6A6Dh70IWPE49v4oytGY0IBcpLwxAaVgghRm2h86P+n6UplVHbuOQAOZ4pP1ZSmvdeEE+iVg
	HAhGLBOnGcx/u9xwrmdQIH7FnrtpkYFgss792rh5xnwIcOQMOsi6VFJGsYeH/XL4UrKdDNdiBHO
	KvCrzoKvUPYg7P7dZ1dskQiXA35OtvHKh6AnJouWHOWPiunySQVEXjOB+8kqO5Srfjvfcljtd8S
	TF
X-Google-Smtp-Source: AGHT+IHkvGZdY/5sFCATUguUxZV5YFK7TwHbYTOV5pndygfBowErsb7T0Kc6Xz5cRGUjr78gu2CJuw==
X-Received: by 2002:a05:600c:a05:b0:450:d4a6:799d with SMTP id 5b1f17b1804b1-454ec14a434mr147251575e9.7.1752574179750;
        Tue, 15 Jul 2025 03:09:39 -0700 (PDT)
Date: Tue, 15 Jul 2025 12:09:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/PVH: modify permission checking in
 hwdom_fixup_p2m()
Message-ID: <aHYo4kLRj9LpdaTs@macbook.local>
References: <8c610e0e-6778-4d94-92c8-35b280d05b46@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c610e0e-6778-4d94-92c8-35b280d05b46@suse.com>

On Mon, Jul 14, 2025 at 06:09:27PM +0200, Jan Beulich wrote:
> We're generally striving to minimize behavioral differences between PV
> and PVH Dom0. Using is_memory_hole() in the PVH case looks quite a bit
> weaker to me, compared to the page ownership check done in the PV case.
> Change checking accordingly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Kind of unrelated to this specific patch, but what's our opinion on
turning on pf-fixup by default before the release?

Thanks, Roger.

