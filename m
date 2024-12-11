Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867349EC92E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 10:34:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854183.1267449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJ5v-000204-RW; Wed, 11 Dec 2024 09:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854183.1267449; Wed, 11 Dec 2024 09:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJ5v-0001xv-NZ; Wed, 11 Dec 2024 09:33:23 +0000
Received: by outflank-mailman (input) for mailman id 854183;
 Wed, 11 Dec 2024 09:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLJ5u-0001xp-JW
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 09:33:22 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f60a6a65-b7a2-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 10:33:21 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aa662795ca3so95626766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 01:33:21 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68e800a9csm391032466b.34.2024.12.11.01.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:33:20 -0800 (PST)
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
X-Inumbo-ID: f60a6a65-b7a2-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733909601; x=1734514401; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BXuBYDt05BnuAXAVqrMEUaGgT7+IQnfbB9u0B2U4mF0=;
        b=YXxD1zQXTUqcpjQk5YhFUzNFzMABL1MsKUgPCYqv7nhMvmClWag1OyM7uepzXM4uzP
         qffUJ6AbOqUenJQbTwfvUv2pqyVy5Bzd+tcb0vRw12QKVaBkoeupXG29fW59RSrTzRIS
         J44seI5kiqUrVQpoWi9bjXuKZF5uv+vzLBL5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733909601; x=1734514401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXuBYDt05BnuAXAVqrMEUaGgT7+IQnfbB9u0B2U4mF0=;
        b=P29HRVAIneNc5syRruU9cM+QWdQKO7FGNWxvWMocA+tGHzKeGGG17wYiaNx0iWyCau
         yMNtj5OkvmtkgUFFnz3QwXuC0QMMLDyOnCeizDqX05oAmUCutSSb62WDeP3I3dPu1DvX
         V/UD+axuXnOTESLasHXWr4r7aOPPpLSCv4zmOnQN2G4u3YEBQvXGCfkkGaDQ2Utz0nWi
         QpcCGvrLa/Ias7dIVT4T3qX0f0G28+6IdA5kG8hLv5ePVDv4VN9xmN23Q5vJkzr+0lrE
         TN4R1VhN/cg9UTIRS3zJRYqM9seJgvReqLGP5d86pBcTZDDeZdJDMJCqAXm0/+6EB+w/
         EbAQ==
X-Gm-Message-State: AOJu0YwJ/fN6tB0DyJxG1pv0A67RgEEsX2EX2+zf8oa765F7S9gi8rhG
	OL78F7YWBul0/v2lWEbal8oT4tIsPp5KqQAN119EpMvsI3yrYDvmudXM1QX3wxU=
X-Gm-Gg: ASbGncsAxO7aBo8w5XD1IvpIjynwc81beN1WqnZGIye1DNG56IHrgl5Epz7TbUVTdmf
	/5/q/glPKPL0RPV9u9qu7B12TZRCRi+S+izI1JN4yMWz3FpllLV1du4rswRJvNV7bvBIaaxnGCS
	Y3gE8E7v59atfHApWtJx3zHB8pBQuzMBr84e7BHyH5jKnkM1iDfQPPp/DwXXx8dNKM23e7Oi6Ax
	DFOxjz1ztp4v03mQVl4jBbPVO82MtrREU5mWNxL1J/2OyK2umWHkPW/RvjjfxE=
X-Google-Smtp-Source: AGHT+IFg/luXNUqkJFneClsPr/d3INheKFhUcK4J6ws6dqoguOKS59wC7a+EzBdbEMcl/P1iG2hNhw==
X-Received: by 2002:a17:907:96ac:b0:aa6:9c69:f52a with SMTP id a640c23a62f3a-aa6b16a0dd8mr179348866b.19.1733909600836;
        Wed, 11 Dec 2024 01:33:20 -0800 (PST)
Date: Wed, 11 Dec 2024 10:33:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, kelly.choi@cloud.com,
	anthony.perard@vates.tech, michal.orzel@amd.com,
	roger.pau@cloud.com, committers@xenproject.org
Subject: Re: [PATCH] MAINTAINERS: add Anthony, Michal, Roger to THE REST
Message-ID: <Z1lcX6hHHxaQP3RP@macbook.local>
References: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>

On Tue, Dec 10, 2024 at 03:58:04PM -0800, Stefano Stabellini wrote:
> In recognition of their outstanding work and years of service to the Xen
> Community, please join me in welcoming Anthony, Michal, and Roger as
> Committers and REST Maintainers.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

