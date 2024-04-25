Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5A8B1B74
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 09:07:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711849.1112135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztCk-0003FB-8b; Thu, 25 Apr 2024 07:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711849.1112135; Thu, 25 Apr 2024 07:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztCk-0003DH-4n; Thu, 25 Apr 2024 07:07:38 +0000
Received: by outflank-mailman (input) for mailman id 711849;
 Thu, 25 Apr 2024 07:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kLQ4=L6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rztCj-0002cp-EM
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 07:07:37 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dc22fc6-02d2-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 09:07:35 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6a04bae512aso3947226d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 00:07:35 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 c4-20020a0cca04000000b006993eeb2364sm2268336qvk.13.2024.04.25.00.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 00:07:33 -0700 (PDT)
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
X-Inumbo-ID: 7dc22fc6-02d2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714028854; x=1714633654; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ANwGCH4e0j4ezPob3DJLCcVkFV56cP7vRsEhhXa+vbY=;
        b=exWTt5ievcLa7bHNJmBGiWTOukcGZufFsCg4SAV+pc/26PZrJIZKXmQg/NQIMXLpgA
         0sJw+p0RttQ99FGX9hYwKWSTADo6BvUdaerjcPDFWAjZzEnPmYUE1WD2+3Yl7RJaj3ft
         7sd9kBn62SvxCUjc6gp7Js1BH4QH8c0fThuNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714028854; x=1714633654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANwGCH4e0j4ezPob3DJLCcVkFV56cP7vRsEhhXa+vbY=;
        b=o81Uae9JCsixSweMC8PkeDQ+1AJMZd/IDr+pEGuJo4rhropJVk8pr4/ai5+C2W3W48
         F1E+4DNQluzV2Ll14d6VLZt32/NdYhu81BugECbhy/NtqBfM58Ynaxc1pZIEIqPSv0sd
         ELjq3ktKQydaaXiUcRYcLOr9RSPj+UDC1jRquntmgNg2cus9KW0wCxr5U1xUkxVWSewd
         K56/IiI0WaPfiohE1DBfu+q0y++ckg9ahS0yu2qY5/1dllDqJWLkpGB5kcPL5EKm4EtY
         A7+cZpstphEhFEYRAeE2e7o7N3Jj4OjpN1vRNQ/1PZZWyuQMMWtSmPhYTut06h+pUy56
         lP0w==
X-Gm-Message-State: AOJu0YzpyNu5w7tIEBcLgfyCQgGmuH5qQrZbFcgBkmPnGxK1kgH8/yW0
	iO3mJqT4LhWCUVw2joaNxqcwCikdacboYHGZoyogdI6TFPlaEe5X+tS4WxJpp6Y=
X-Google-Smtp-Source: AGHT+IF0iFLNFnwVayG/f52miJzJz+NHxLstwMgZugqOxwQie73j0h91tG8BjUQuTKIeMkix2tq2qA==
X-Received: by 2002:ad4:4f2e:0:b0:6a0:93e3:6663 with SMTP id fc14-20020ad44f2e000000b006a093e36663mr4313076qvb.7.1714028854177;
        Thu, 25 Apr 2024 00:07:34 -0700 (PDT)
Date: Thu, 25 Apr 2024 09:07:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Message-ID: <ZioBM1QeHyXqbP8I@macbook>
References: <20240424191826.23656-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424191826.23656-1-dpsmith@apertussolutions.com>

On Wed, Apr 24, 2024 at 03:18:26PM -0400, Daniel P. Smith wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Xen always generates as XSDT table even if the firmware provided an RSDT table.
                                                         ^ only

As providing an RSDT doesn't exclude from a XSDT also being provided.

> Copy the RSDT header from the firmware table, adjusting the signature, for the
> XSDT table when not provided by the firmware.

Either here, or in the code comment below (or in both places), I would
detail that this is required for QEMU, that only exposes RSDT but no
XSDT.

> Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

