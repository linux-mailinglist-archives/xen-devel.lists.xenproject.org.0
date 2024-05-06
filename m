Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1D8BCFAD
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 16:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717680.1120120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yyt-0001kO-3Q; Mon, 06 May 2024 14:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717680.1120120; Mon, 06 May 2024 14:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yyt-0001i7-0J; Mon, 06 May 2024 14:06:15 +0000
Received: by outflank-mailman (input) for mailman id 717680;
 Mon, 06 May 2024 14:06:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3yys-0001i1-HN
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 14:06:14 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b18b58-0bb1-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 16:06:09 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41bab13ca81so21066895e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 07:06:09 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b0041668162b45sm19852740wmq.26.2024.05.06.07.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 07:06:08 -0700 (PDT)
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
X-Inumbo-ID: c9b18b58-0bb1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715004369; x=1715609169; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W8gS7mFS/qALjpKtFdLhPxwy976dDTHPycWvDXjs3u8=;
        b=V404p4rF2mp7VFNjhQyUiXsr+gutR71bRvQV1CRT14PXL/6Q+TDAPbeb/0tGMsFhrA
         ytcejDwO9wuX5Z7fzWn+gywcGptSNrkK0iC61NyLRol+lXJt6DIHTBfep3jOj2U6ymrA
         BPD8lz/FL5puLcDHJJnRfuPg9b4CphGH1rcSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715004369; x=1715609169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8gS7mFS/qALjpKtFdLhPxwy976dDTHPycWvDXjs3u8=;
        b=PSQQq+8EKIes76LqbAGcCBH0Q/U3muvFp7lOWF7ZCOmbCDxKgF7BTZqc2OeB3N52Qq
         8COCPXUr8PDMYYeapeK+caSsWUu3ZrmmkaXf/Zu95TejkJkI5laK5SK+kM5cej2VjPM9
         aO/aruGmQqdI3hNxpV3e5CMRG11w4vX7Ecy4s6cGzHLW9Qcl0mMXpi8QPYcD8QcAAQCW
         t9/JvL2+Old8urusGjqe6bysZneNOhryFotBm7pxc2hQYbIirzkDB89y/bCjXKSveMN7
         3mLYWXgYfqUhbMt+XifL0dYpzxYZETdVERG/mkatlF84k9maWRm116uRk+sj9QETA4Iq
         QTvg==
X-Gm-Message-State: AOJu0Yygo3e+lwhjagZrBcACKt8sl6hISnX3lDbnqytViSwSnoLR9hlP
	UmuJXyECwjEOpc/AtpEGunyBMajqL/8zocDdTG/z0NUGCTSaopNJW+hn4LL7wkY=
X-Google-Smtp-Source: AGHT+IG9Y+R6JkI4ECHkJFrqVZ1SHI3aRYioSWNHwdt0G7SrVaVTUoNrZypiOt5uBTPWeQkgQLjS/w==
X-Received: by 2002:a05:600c:500b:b0:41b:f6b6:46cf with SMTP id n11-20020a05600c500b00b0041bf6b646cfmr10443649wmr.11.1715004368878;
        Mon, 06 May 2024 07:06:08 -0700 (PDT)
Date: Mon, 6 May 2024 16:06:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 11/12] VT-d: drop flush_dev_iotlb parameter from IOTLB
 flush hook
Message-ID: <Zjjjz8q1hHyagOQG@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <d63065bd-517b-4b6a-a554-7991bdabc3c2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d63065bd-517b-4b6a-a554-7991bdabc3c2@suse.com>

On Thu, Feb 15, 2024 at 11:18:52AM +0100, Jan Beulich wrote:
> All call sites pass it using the flag from the IOMMU which they also
> pass.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

