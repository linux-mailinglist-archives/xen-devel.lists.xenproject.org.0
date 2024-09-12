Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CCE976610
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797194.1207062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogUv-0000Du-Mm; Thu, 12 Sep 2024 09:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797194.1207062; Thu, 12 Sep 2024 09:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogUv-0000BV-K8; Thu, 12 Sep 2024 09:52:21 +0000
Received: by outflank-mailman (input) for mailman id 797194;
 Thu, 12 Sep 2024 09:52:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sogUu-0008Rh-Ev
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:52:20 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2af2e7b-70ec-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 11:52:18 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so103031266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 02:52:18 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c7280asm718370566b.129.2024.09.12.02.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 02:52:17 -0700 (PDT)
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
X-Inumbo-ID: b2af2e7b-70ec-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726134738; x=1726739538; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0oQ1siOTnC/OAUEaPeEt819z7wspfbpU6jPArUlkvnQ=;
        b=BIn7MqUx9Tgkr/7JLjfyVZISEYIXLwTcIDh6+JQFFjufz0e7acH7JBsTsXQCJfS+9f
         zFQcwM2pkNHNHmcLFPqbyJpdeVAsiXBJWSy1rsruIELOiWoK7ijlLRRCxK3j91y66pid
         2J7wugaLlZQ+49AIf1pPbbdGaMBx8+703N2KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726134738; x=1726739538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0oQ1siOTnC/OAUEaPeEt819z7wspfbpU6jPArUlkvnQ=;
        b=ZCZuAgIAIFpGqj4l2QY/GD8cU/SPGZg0n0bwEzRh2jLGBG1O+hioppDzeyWfgtMAEC
         Pq+HpCuW8unc6VmJTjjTL0UX4VtTCJb8lVckVN2yVaLr2hCCHBQQzu9jXwUkUhQc14/V
         CpMcc0PA5W2izyWNIY3/Z8aSgP+cZL89t07BkcmQPVR9buPGvXGxsR9LueaWzLL8nXjX
         XlkdkB2mEcBz8xe+n1N3xUbrQwQoB6pYN5zf7+rrR8Wg83volKp+HT4jWlbcLFNxPDmn
         XMB1c2DqUPVAj1wOsiBpa4h9xcYVBcZrbj2bYpdLJA4nTeqHgM/2sJ487A0GyfD7klCo
         DEKQ==
X-Gm-Message-State: AOJu0YyMI6VKQ7WabXF6WzokvUVsJFGnPk8gexj+3/bEsL9wlTCEXVL8
	LmBFewr2EU+w6QW0NruafEia545bQNsZnQj/uYW64mkimAu8DmDtp2sV2b4qDB4=
X-Google-Smtp-Source: AGHT+IFVvsuY+PqoF5iB5HM+/9YYTfI39B7A9vprHZExHycyDmHZNMDANF48PIIx9WZsjaEol1K2og==
X-Received: by 2002:a17:907:d843:b0:a77:b01b:f949 with SMTP id a640c23a62f3a-a90294995b8mr229737866b.35.1726134738019;
        Thu, 12 Sep 2024 02:52:18 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:52:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 4/5] types: replace remaining uses of s32
Message-ID: <ZuK50VAqUCfX29pt@macbook.local>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
 <0e6b7685-e061-4ace-88fd-86728d765e5a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e6b7685-e061-4ace-88fd-86728d765e5a@suse.com>

On Thu, Aug 29, 2024 at 02:01:16PM +0200, Jan Beulich wrote:
> ... and move the type itself to linux-compat.h.
> 
> While doing so switch a few adjacent types as well, for (a little bit
> of) consistency.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

