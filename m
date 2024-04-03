Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61689742C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 17:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700595.1093978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2hB-0007tZ-RH; Wed, 03 Apr 2024 15:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700595.1093978; Wed, 03 Apr 2024 15:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2hB-0007rX-Ny; Wed, 03 Apr 2024 15:38:37 +0000
Received: by outflank-mailman (input) for mailman id 700595;
 Wed, 03 Apr 2024 15:38:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPGy=LI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rs2hA-0007oM-22
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 15:38:36 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b22b84f-f1d0-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 17:38:34 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3437d3db788so843275f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 08:38:34 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q4-20020adfab04000000b00343a3e62997sm991281wrc.50.2024.04.03.08.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 08:38:33 -0700 (PDT)
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
X-Inumbo-ID: 3b22b84f-f1d0-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712158714; x=1712763514; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=McZLVRCOssNn1B5GeXV8ZbbcBKqz5IaOwviQeH7wZuY=;
        b=CpRbYg+2j1cj8LPM7BpcL6Wg7h1BKWPNZhRjOAj2GEF0dFaJ/Puk4o9NCgtGbSr/tg
         JV+j9SpTnoirPcJaJ0d4/TUIBkG34ViIa4ZAda0kP5tBsDziuNGi2nCAsATxb5Y3wz7k
         l0JNTpSMVr9TxAVygBJXPPsdjyHP+UjT1aUew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712158714; x=1712763514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=McZLVRCOssNn1B5GeXV8ZbbcBKqz5IaOwviQeH7wZuY=;
        b=C7B//uu28GBlGSHHgAVjPezaLCzMKMVEmIKNVHmE6sxsoSnQ+OC215rN9Kfki2ScuI
         gEjIf+VOD2vagbh8BpTjWpEStjZlNCgxIX/ywfh4jPy+vXWkTf7p71own9vCUFuxKHW0
         aYWRkTGvK+1NFMRHP+keEuhfxpoOsCeajLd7fA5qsU2QnHok23VN1mqa3SZ9H1/7MpgY
         8ZHyPHfa1jTOYWr4KdP3JQHwsgFdalN2P/tZCKw+XUGcpF+lhk1pvzkTRtnVpUKxCRW8
         RG88oZtTu++2T8JKMzpvp58ihaoq+ksaYESuMwkjmGA9BBqlJh0WPEJQQ/qCrHDAhnDO
         QUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlLw6l9ULBoQk8bG5IVhPR+RH9G2MfV7MB5wQJ5MreTbR5LLlUfUopIHm2uYLFinoXG69YiZbIHP9/rsIkPyui3l4R+AfUJLYuR4TAFVY=
X-Gm-Message-State: AOJu0YyGw8zRHfbQdg11Q9HW+oQ9otPC6LCckvpAmAcbFVVRXYc4Jzh3
	8c81VXhJ17hivojs9MoEqmzuPECV/mrs6cMIjeXXgESetYqqLHwDys4OZJeH7uo=
X-Google-Smtp-Source: AGHT+IHMprkau44Qe3lFKQrt/13mkFPfzfcO0cjJA2aZFWBVL3kgVYar/XjBSEoCPGmmrtjU5kfiyQ==
X-Received: by 2002:a5d:64ca:0:b0:343:a2fb:92aa with SMTP id f10-20020a5d64ca000000b00343a2fb92aamr1108402wri.71.1712158713865;
        Wed, 03 Apr 2024 08:38:33 -0700 (PDT)
Date: Wed, 3 Apr 2024 16:38:32 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] hw/xen: detect when running inside stubdomain
Message-ID: <ec141587-4d49-403b-b773-26b9087d5b04@perard>
References: <cover.527f002866de2be7c275c5000b6e5edfeb7e8368.1711506237.git-series.marmarek@invisiblethingslab.com>
 <e66aa97dca5120f22e015c19710b2ff04f525720.1711506237.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e66aa97dca5120f22e015c19710b2ff04f525720.1711506237.git-series.marmarek@invisiblethingslab.com>

On Wed, Mar 27, 2024 at 04:05:14AM +0100, Marek Marczykowski-Górecki wrote:
> Introduce global xen_is_stubdomain variable when qemu is running inside
> a stubdomain instead of dom0. This will be relevant for subsequent
> patches, as few things like accessing PCI config space need to be done
> differently.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,


-- 
Anthony PERARD

