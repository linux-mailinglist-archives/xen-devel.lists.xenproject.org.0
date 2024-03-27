Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A09888DCEC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698473.1090173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRrS-0008J0-4t; Wed, 27 Mar 2024 11:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698473.1090173; Wed, 27 Mar 2024 11:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRrS-0008G9-1J; Wed, 27 Mar 2024 11:54:30 +0000
Received: by outflank-mailman (input) for mailman id 698473;
 Wed, 27 Mar 2024 11:54:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lksO=LB=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpRrQ-0008G3-LW
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:54:28 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c35b7d3e-ec30-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 12:54:27 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56c2b4850d2so2084779a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 04:54:27 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x20-20020a170906b09400b00a469e55767dsm5334791ejy.214.2024.03.27.04.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 04:54:26 -0700 (PDT)
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
X-Inumbo-ID: c35b7d3e-ec30-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711540467; x=1712145267; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xo2nfZBTCiRDB2jtZRoNWpjUBE4WiCL6rnHvacWUBJM=;
        b=AkAEbSXa1Tq3OvUEJzRiH30kpRdpXnwlN3gFTis2YZ0X+ozEYGLemev2TLfWXbDDeP
         18G6QMRPvYLdyQ9fg3oJAHTHdcRUsJ26BsdBQFRHbQ5znDhrDwloF5n06oc6VifH8T1v
         izjKsVvy0fqykgDE5Uq/AsPphl3vSTiX5pJEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711540467; x=1712145267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xo2nfZBTCiRDB2jtZRoNWpjUBE4WiCL6rnHvacWUBJM=;
        b=FlFY1283zE8CQSVFZX2AfjjQ/2rwh6eU3i4/8ic1zWrFMJWyi2BTda9QGv+GxxOloh
         zrtq0KTaE3v4oYrBK6fqHOC/4FNYxe5mmsCMPUc0fQw/2TgKdxqZCHjBAr+Ebdp02qoX
         NsmMjAXiZxrfcJ16OIph/3VoVGiDmdT0mJR6yjHr0jF5xBV/Bwj1J790rsR5ygJAEDVs
         r3lfj8YAQ+0gvVRb9sCrOxfbYAxR3lg0/RuWxRw71E2pSrypCZH5rUgln7y9ITAqjXGZ
         UMC8gkjlYdR8Nt6jSllY1IcNmny1TzntdOP9IpauicCiNcuALKJ+x3YL9Uf8nxW5p61H
         aU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSZNti0sOZy3WuPe2rg07PTh6Po5eu7D8/OMxvYYBBLTzk913il6rgDmNd+FQvEajQEl6888yHC3nNRVyr2LKVVEdjoPIyGsOH+ZUMN04=
X-Gm-Message-State: AOJu0YyrzX84JUIVvy18S5Utv5xfrbenWSRWKm4oCmfuvNfsfq6aLHo2
	pHnkut9uYKxyScaNPN6zX90C3yCf2k+YdZZel6PXGeKFDUCmGOY/CqQ3VhKOpRc=
X-Google-Smtp-Source: AGHT+IG9GlCL2qsgWyuFSglCpOBIwZX7MMRogX3VsIf8avJI3j19EV0AuKmIO9P0kiOttKpgN9U6dQ==
X-Received: by 2002:a17:906:1911:b0:a4d:f2a3:9c37 with SMTP id a17-20020a170906191100b00a4df2a39c37mr3310934eje.4.1711540467139;
        Wed, 27 Mar 2024 04:54:27 -0700 (PDT)
Date: Wed, 27 Mar 2024 11:54:26 +0000
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
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH-for-9.0 v2 08/19] hw/xen: Remove unused Xen stubs
Message-ID: <7af32170-a282-4f28-9db6-913087960acf@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-9-philmd@linaro.org>

On Tue, Nov 14, 2023 at 03:38:04PM +0100, Philippe Mathieu-Daudé wrote:
> All these stubs are protected by a 'if (xen_enabled())' check.

Are you sure? There's still nothing that prevent a compiler from wanting
those, I don't think.

Sure, often compilers will remove dead code in `if(0){...}`, but there's
no guaranty, is there?

Cheers,

-- 
Anthony PERARD

