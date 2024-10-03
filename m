Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC57798ED56
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 12:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809267.1221508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJR3-0006LV-Cx; Thu, 03 Oct 2024 10:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809267.1221508; Thu, 03 Oct 2024 10:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJR3-0006Iy-AA; Thu, 03 Oct 2024 10:51:53 +0000
Received: by outflank-mailman (input) for mailman id 809267;
 Thu, 03 Oct 2024 10:51:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xwa6=Q7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1swJR1-0006Hm-F1
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 10:51:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7df72a7d-8175-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 12:51:50 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so360666966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 03:51:50 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104d5a27sm68069566b.213.2024.10.03.03.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 03:51:48 -0700 (PDT)
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
X-Inumbo-ID: 7df72a7d-8175-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727952709; x=1728557509; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5JAdoA6TBoI7Lvcp7Bz5l1WvIEOkqZDHKWvVueVHHok=;
        b=fOiWsj0ZDxaOYyz56gCU80zsoBDG1UkCv15ssbvyxdVFQlal65pOZymggtEI5O1X+X
         22o+8YPbAGV6UtqLu8iMb9JcZRMgPSXU068bOrh6Htnd4IDAOuby8BNSxWkYP+JBtjsC
         ZfHTfL25Am0PjgvkUF1DbFs47MV1t8Jlog/3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727952709; x=1728557509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JAdoA6TBoI7Lvcp7Bz5l1WvIEOkqZDHKWvVueVHHok=;
        b=HWYsTfTD4x65KhSjs5MYe4Vi72MimioQBXPagf1hdUPQQ5sKdRobKADQCjvJQMvkJc
         KzIZqdzzpMNsVYv3YrK1p9jxCMvb00AVMNFyhGGLrAdQQSqloE6bIWx9qR6+amMBifRF
         +G56IJYTswn/5ftJSm9/+JYTCr7f+wT4rgNQe1P7gG/AYEiY5Te13UcdRCmP3x7dKT+F
         dwEyH/vostVby8ajyVFmv58wosdmy+AwaPGM0lfoDxMixaskOk4PDaHa1ctf1XRozaxU
         WcDrP2V5W5FRifanbn7iLlwyZlKExZ/oXidBIIB304ZeICz3O5eDfn4o2fdlMFop678N
         7BVg==
X-Gm-Message-State: AOJu0Yzm6JiRZwQWZ0SBSJR6czrhaC5FZvC6NS97sE5roHTedpHY7Srt
	57zx4PVaAon5+XGV9689h6q6+fs1Lxre/aDIHHwOGjJAah1JMlDq7bYXLZFS2Cw=
X-Google-Smtp-Source: AGHT+IElZz2+9D6VDk/Ud+akZOj7Bmnf/Fg5SZ0qVB3ATfzdFQbFgPYaObEc4lySFsIL0UhHhP1U5Q==
X-Received: by 2002:a17:907:86a4:b0:a86:8f9b:ef6e with SMTP id a640c23a62f3a-a990a055cdamr284326466b.13.1727952709203;
        Thu, 03 Oct 2024 03:51:49 -0700 (PDT)
Date: Thu, 3 Oct 2024 12:51:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/APIC: Remove unnecessary logical flat functions
Message-ID: <Zv53Qz76kN0-1T9F@macbook.local>
References: <cover.1727880621.git.matthew.barnes@cloud.com>
 <fc3176baecd67c23dff710e4a1934c2caae47ebd.1727880621.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc3176baecd67c23dff710e4a1934c2caae47ebd.1727880621.git.matthew.barnes@cloud.com>

On Wed, Oct 02, 2024 at 04:17:25PM +0100, Matthew Barnes wrote:
> Now that GENAPIC_FLAT uses physical destination for external interrupts,
> these functions implementing logical flat for external interrupts are no
> longer used.

I think it's fine to merge this with the previous commit, so that the
functions are removed at the point there are no longer used.

Thanks, Roger.

