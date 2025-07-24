Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A20B10CFA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056164.1424339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewjz-0001J5-HP; Thu, 24 Jul 2025 14:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056164.1424339; Thu, 24 Jul 2025 14:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewjz-0001G0-E8; Thu, 24 Jul 2025 14:16:11 +0000
Received: by outflank-mailman (input) for mailman id 1056164;
 Thu, 24 Jul 2025 14:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uewjy-0000gZ-Le
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:16:10 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be8bdede-6898-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:16:09 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45610582d07so7406895e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 07:16:09 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fcb8aa6sm2343237f8f.67.2025.07.24.07.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 07:16:07 -0700 (PDT)
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
X-Inumbo-ID: be8bdede-6898-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753366568; x=1753971368; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkxmI5UsWK4ePP+9STYv09f/9P80GrJkxsMG6buhZc0=;
        b=kDG4JaAZuwBl2/M2j0/YKElZUAjNIL2ITr2o8z/TXGvnzy8/zgI4OQRT1RUHandVYw
         Mlc6ZRaHymA/Y2DBINWFJREIXp/mi7JAqCFFl1mgVTDK9VD9+32I3w/+0frzCFK7UB9C
         qqjkdEB3DrRarVkxwo6Ssp2NsM/p/NHspzQ7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366568; x=1753971368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkxmI5UsWK4ePP+9STYv09f/9P80GrJkxsMG6buhZc0=;
        b=qc/Lu2M2WSAXI9ONG445qrfrterqhbzytgz0qnMJ6prHUK0qKbksGHCJZUCrYTiL3N
         CFxQrLjXsOA+HauU4mK++7Sz0G3EtQ6ItyIkMXBMqH35JuvOm2qZd8dgkWfXzh2jPIz7
         8Tw8F5hoV3j2Ngwh+yUDVygMsdov65N81FF7Yjz/GiPWHRx/0p0aWXpF7rDlDixNsD43
         uKWje6//MnJt2Gk8rRHLRraI74366qjtLDvMK2CYyAbVXYxbO2uOEup7zGGDbP0llk1m
         qa+uX27WO7bEpYX8aUXwQn4yUvJVELCQir16dpzYHm9sfq9tP8Q/dDMOyVzZuTI28OY5
         SSxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH+fQPoyvb1FQQm2MMrC+s+tOhtBF2Ue7psehgf0GZMKYsxoccG3Y5Eo0jH3IjHwHQuB2uuvfccTs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFkZU8ewjQi4UyGTJir+av62pXTaNdR4P/BwUvHBb20fT6Ej6H
	Al0jeFufPMyg1xUEc3xs7prG6BulCeT/fzkgU4ZlSeoy9FlXrjHTTv4ZmM06uoef3DE=
X-Gm-Gg: ASbGnctP05PpHfTBNpAiWR0/XZ+0AfgHqXEYmw3SpM6tvbomP+b9z+SyYU7O9cTTrOk
	4ngL0qCq7Veb3sU2FBPzQJuyAc3riK/8gUoT0MWId3P/RXOxApjulrTW/HNgP058vbsnYyqUU3w
	G2gYSSY4oQAFxDTESD0dpp874rCi+bhFnPaFJ+iM7g/1uTclTFZLK+4c29ycfNSflHc2DBI59Gl
	qqV51uyLX/Z7XZbaG3L7k4rnH+wxTweSqGvLoFF7g8aECZ1d7ggWBDGXHe6qAy/j/LnG6VWGFdn
	I7lKzigFspKL4EXAr2d/dZQYMtyx2XH/AzZR5ndwQbS98Cpldq/ipr4d4mBeQXl29R5fDe90W57
	Y20uPuKIfcyOua0Vf3k34yPuPWYctlXFrjKjKhLYGvyOiBugIFXv5oPPjVBhjZnCFBFZHcVt6+e
	6I
X-Google-Smtp-Source: AGHT+IGJi9kJ+IuiNEEsN4FgwnTA8BMC9qHFzmTeua8G5SpOaoNu0qRuE1F+fGFxCMzMeqhayHr05w==
X-Received: by 2002:a05:600c:870a:b0:456:11db:2f0f with SMTP id 5b1f17b1804b1-45868d1bd9emr73180855e9.16.1753366568248;
        Thu, 24 Jul 2025 07:16:08 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:16:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 1/8] vpci/header: Emulate extended capability list for
 dom0
Message-ID: <aIJAJtjUqxZrDtYp@macbook.local>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
 <20250724055006.29843-2-Jiqian.Chen@amd.com>
 <c6fa0cc7-4cc3-476e-9030-381c45bbfb64@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6fa0cc7-4cc3-476e-9030-381c45bbfb64@suse.com>

On Thu, Jul 24, 2025 at 10:09:43AM +0200, Jan Beulich wrote:
> On 24.07.2025 07:49, Jiqian Chen wrote:
> > Add a new function to emulate extended capability list for dom0,
> > and call it in init_header(). So that it will be easy to hide an
> > extended capability whose initialization fails.
> > 
> > As for the extended capability list of domU, just move the logic
> > into above function and keep hiding it for domU.
> > 
> > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citirx.com>

Thanks, Roger.

