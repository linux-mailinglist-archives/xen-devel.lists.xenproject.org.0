Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE3F87BEBC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 15:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693276.1081171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklw0-0000Lx-H8; Thu, 14 Mar 2024 14:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693276.1081171; Thu, 14 Mar 2024 14:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklw0-0000Iv-Dd; Thu, 14 Mar 2024 14:19:52 +0000
Received: by outflank-mailman (input) for mailman id 693276;
 Thu, 14 Mar 2024 14:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P774=KU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rklvz-0008M8-Hp
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 14:19:51 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaa3a229-e20d-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 15:19:50 +0100 (CET)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-789ddcd57f4so19760785a.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 07:19:50 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 ay16-20020a05620a179000b00789d57f93c2sm787822qkb.88.2024.03.14.07.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 07:19:48 -0700 (PDT)
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
X-Inumbo-ID: eaa3a229-e20d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710425989; x=1711030789; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jBIFqTTJjpfDnSIlnYU2CZlKU457KwTvVqvgW6/Lj+8=;
        b=iZhwyTHfvQyxBVk6VNVtq1I6QM14Em2PwDUt3PWIUXjl7jtEN4R6vstmtrM6y+/vD2
         N6zptivK1IU4eyjcnbRdInOYw5/xToWwwLoIK/Rafgvp3UCHn6AyDpibPch1JFB4atdD
         wjcpYvQiEDu4HaiinmyRoJnSx3IoVFgMEvGSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710425989; x=1711030789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBIFqTTJjpfDnSIlnYU2CZlKU457KwTvVqvgW6/Lj+8=;
        b=D4XJvS5G3+4qPM4vXflyTJZfxuPxyAKqStnYe/DZ/QtajHv+yifeKecbINBFfo6BQB
         cfZEKGLdv7lDVDuS8CE4JaiDaqEDwwKOvEvfW8pH9OggsSXxTyrJlT+zZDUvJZdqmLzu
         lNU+u9eUE5E++76kGaVljqYTe5TW0xy1bT6lgPH8MIvuIixCjO3FoAC3DDVJU4GV+tTX
         HMycCyKzJsgqU9N8WYvmhyeVpIN2ChvWNuE4x0vjOHnhudTf8rqgQ+0bTr8CpSLFc+Bn
         3XIZnHQp1F/n71XISMGLOlxkv3IiwgrApqWKPdkRi2qiEJK7TvG+3wKvw/tdCHKfWZKf
         RzgA==
X-Gm-Message-State: AOJu0YwkGiKxizs7gxQxIqhBo206rv3dJ3llA/WDOxPZcZ9kd6Hfk/nX
	/EHlJ2odY+zMLAC1upCbn1c5YBs1VZ0Dv32b8hQrikudOef60kDmgR2z53x8yQmIVBGVodlXS/4
	E
X-Google-Smtp-Source: AGHT+IFCI7irLPQzEKE5CbghjfxpbJc1VgM7Z2ocaZNyjc1TXbwcj0Z/BakfUJM5wxgDT12goCdAjQ==
X-Received: by 2002:a05:620a:817:b0:788:2e47:b297 with SMTP id s23-20020a05620a081700b007882e47b297mr1993595qks.78.1710425988737;
        Thu, 14 Mar 2024 07:19:48 -0700 (PDT)
Date: Thu, 14 Mar 2024 15:19:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: flyingpenghao@gmail.com
Cc: xen-devel@lists.xenproject.org, Peng Hao <flyingpeng@tencent.com>
Subject: Re: [PATCH v2] xen/blkback: use kmap_local_page()
Message-ID: <ZfMHgqn0z91MVJ4i@macbook>
References: <20240314132843.24069-1-flyingpeng@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314132843.24069-1-flyingpeng@tencent.com>

On Thu, Mar 14, 2024 at 09:28:43PM +0800, flyingpenghao@gmail.com wrote:
> From: Peng Hao <flyingpeng@tencent.com>
> 
> Use kmap_local_page() instead of kmap_atomic() which has been
> deprecated.
> 
> Signed-off-by: Peng Hao <flyingpeng@tencent.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

