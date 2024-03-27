Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6788E2EF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698533.1090301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTTF-0000jb-JS; Wed, 27 Mar 2024 13:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698533.1090301; Wed, 27 Mar 2024 13:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTTF-0000i4-GP; Wed, 27 Mar 2024 13:37:37 +0000
Received: by outflank-mailman (input) for mailman id 698533;
 Wed, 27 Mar 2024 13:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lksO=LB=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpTTD-0000hx-E2
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:37:35 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a790f1d-ec3f-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 14:37:33 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4149521d76aso3569485e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 06:37:33 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q18-20020a05600c46d200b0041488978873sm2166371wmo.44.2024.03.27.06.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 06:37:32 -0700 (PDT)
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
X-Inumbo-ID: 2a790f1d-ec3f-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711546653; x=1712151453; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smTZluOGn/fUn3D+QqeEnI8LdPKMkXjE5Ourcjod5Ew=;
        b=abBsX0zJ32pob8p877gEuF0SyJR7W3DQv0v7i+cH1O3FoPuONdRq5v9TI2Wgf54Wep
         VNKOa2szqwoBx6JG1gbLb11GNFOvSR1vCvc0aIUJvWZQS/O42/8Y9O+j1sLxxXs8evCg
         5LsCT5+swyjVJ3sVZC6A2P6RyAGa/lXewKnQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546653; x=1712151453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smTZluOGn/fUn3D+QqeEnI8LdPKMkXjE5Ourcjod5Ew=;
        b=k3LTL5qlwrcNP0GITpdU266fKVQCGzHoCwf/wghCDhxdW9FmbFk83E2UK8Zjf9MFnC
         +FEOsP9QUcn+Wo1tBzieg/uqv1ri8ClsTF1D+uzu7mPntZ/6owb6/SALd5Hm1cXiZB8B
         0xymtO7jCpPfy13Ug+e5b0cmD3CDDv/liBLJOR/G7EyJ5LYZN3lSoD+SjIYZOHVE5kj5
         Ty7ZVhFyZaoXGtnNL/BdPd03n+rt9t+Ud0toHucvUBHjMVMyU4pSJ0KqyKqSLfmQejtw
         IRm59AZX3Vof83CeOnYk5DMgWTOWG0tJUKl9/WUTmn2ONcfjXG0zxGrj7WNBN65/gInK
         uIcw==
X-Forwarded-Encrypted: i=1; AJvYcCUwHbzDQAOtqO0vXzWtpXtTJdWsW0ZIK4skoyUU/Q11YDxQMN5RR1XYY3GiKOodHuyQ7M7O7cNycj34H7r0AAD5oACz/I7QfjbYYIOrbNA=
X-Gm-Message-State: AOJu0YxqdG5Duw3PWBJ65Tk/EsM+BTV5qsR5AMGERHe5hGEm+8XcYV0O
	BIy+ZOsZ7/hzH/iIO+NZEGoyu0ZgPtCuaB1IUrVLcBUcK5rZI/8rTZkIPtlCtAw=
X-Google-Smtp-Source: AGHT+IHmCd6Z7pLRTa8judRkvI7RAqt4OfBOEutc0X/kcSqKXxmUpEJ5ND/lGGVRsxmC7KvW/3fTRQ==
X-Received: by 2002:a05:600c:1c8f:b0:414:669b:aa9 with SMTP id k15-20020a05600c1c8f00b00414669b0aa9mr9727wms.28.1711546653009;
        Wed, 27 Mar 2024 06:37:33 -0700 (PDT)
Date: Wed, 27 Mar 2024 13:37:31 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH-for-9.0 v2 11/19] hw/xen/xen_arch_hvm: Rename prototypes
 using 'xen_arch_' prefix
Message-ID: <3c553c67-c54c-4156-8d69-bef3476b63a2@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-12-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-12-philmd@linaro.org>

On Tue, Nov 14, 2023 at 03:38:07PM +0100, Philippe Mathieu-Daudé wrote:
> Use a common 'xen_arch_' prefix for architecture-specific functions.
> Rename xen_arch_set_memory() and xen_arch_handle_ioreq().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

