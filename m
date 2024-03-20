Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A4881308
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695945.1086304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwgG-0006a8-OL; Wed, 20 Mar 2024 14:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695945.1086304; Wed, 20 Mar 2024 14:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwgG-0006Xu-Kb; Wed, 20 Mar 2024 14:12:36 +0000
Received: by outflank-mailman (input) for mailman id 695945;
 Wed, 20 Mar 2024 14:12:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ljj4=K2=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmwgF-0006Xo-Mk
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:12:35 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e56bed45-e6c3-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 15:12:33 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41464711dc8so15694465e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 07:12:33 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a8-20020a05600c348800b004146bee69aesm2199199wmq.40.2024.03.20.07.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 07:12:32 -0700 (PDT)
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
X-Inumbo-ID: e56bed45-e6c3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710943953; x=1711548753; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdJGPufGtkDxHWs2/MUnkUOn4lWBJySe7/m0Tl/oGNg=;
        b=QAoKMM0pMQ8e5OP/oosB9AfbyQVE+0Cqz3+rQbpfxnCn9cJsU+tYJ4CjiocIfWmgrf
         8W92dwd9O4/Wv8Ha1dsnZq9BLTTjot3oLl1mpzLUKUAEkpnHOMQSkJ6QGvrO/9cAQRYQ
         HdDd256Z26556CoakIkuLUm4labifX9MfreVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710943953; x=1711548753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdJGPufGtkDxHWs2/MUnkUOn4lWBJySe7/m0Tl/oGNg=;
        b=NMYcXqFtKq/4E+3SlP5rOjCs23B1+mYQIiqrFRPGLtb4pEgYJCIdhxvhHPNppyNks2
         t5FMRphHyXMN1WlaUdblFXqnLKujCAwfBHXbvuSZol6hqonieXJjxfXTFeMnRMltFao1
         3nF6/OuDVgkt4uh1FWHdlv4oXvmfltVddeETQwJlHUw08xiLTdqqJR6iwP7NsmePAvL5
         W0OUOJJrGbnVaCVZkwLmhRoyhxzc7pb/SUUZcTdeAb0J+nQ1xaagqHDkZ6GXotKbCwbe
         zyZOA0om7sFiCEtaTp5vVwFjz5ZEyZHYfA3+UogINheJGtHenJlYqOz8dtFrwurggCbU
         PUtw==
X-Gm-Message-State: AOJu0Yw6csdbSYYRT3NYpDM2e4hHMvb5ZbShz+qwugnGy0UxrZXKdgru
	aBWgFlv6BYCvVtiKpr6BDMbJnHddNZUcc0VHOi0+wdS5zOPsMmMWs+nGlZaRh28ll344h8yMcO6
	s
X-Google-Smtp-Source: AGHT+IF+FF5Uj31cl6Yxo3LYHy0pEvKeopvl70YFi3zRCvil61qDe/nyc4U3rKwkcNAXjEFCEerWiw==
X-Received: by 2002:a05:600c:1f91:b0:413:f1c0:49a8 with SMTP id je17-20020a05600c1f9100b00413f1c049a8mr1674211wmb.9.1710943953190;
        Wed, 20 Mar 2024 07:12:33 -0700 (PDT)
Date: Wed, 20 Mar 2024 14:12:31 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH RESEND] tools/xl_parse: remove message for tsc mode string
Message-ID: <12990d47-17fd-4bf8-a510-f77e7be7ec0b@perard>
References: <8891bdfb2378187cfcaa8ed6f49817404db15924.1690307465.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8891bdfb2378187cfcaa8ed6f49817404db15924.1690307465.git.ehem+xen@m5p.com>

On Thu, Jul 13, 2023 at 04:53:57PM -0700, Elliott Mitchell wrote:
> Normal behavior is to be silent.  Generating a message for the preferred
> input can be mistaken for an error.  As such remove this message to match
> other conditions.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

