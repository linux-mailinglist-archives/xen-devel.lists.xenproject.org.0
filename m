Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE96F4284
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528529.821818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pto1f-0006HL-Rx; Tue, 02 May 2023 11:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528529.821818; Tue, 02 May 2023 11:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pto1f-0006FQ-Os; Tue, 02 May 2023 11:18:31 +0000
Received: by outflank-mailman (input) for mailman id 528529;
 Tue, 02 May 2023 11:18:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87GZ=AX=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pto1e-0006FI-66
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:18:30 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ff17e9c-e8db-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 13:18:28 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso21527345e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 May 2023 04:18:28 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c3ac300b003f19b3d89e9sm28840853wms.33.2023.05.02.04.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:18:26 -0700 (PDT)
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
X-Inumbo-ID: 0ff17e9c-e8db-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683026307; x=1685618307;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8+X+FRGE1DrLyhmqqDKnng02bF8UXtim7gerRdngijA=;
        b=YLNjwFlD4z/AZul9GNAlrTP92tKk96Jm+U48uA9AODsEIxRxKDmIwNZBViCAnBq7Lr
         O7BiylT+CDdvtc17hRxx+LxuCh6p9aPIkp/qi5bqfHnoS4rFQpi9Ua/Y4B2SZdryp2LI
         +psQj5pzWOy1XckQaxaQeRev1J9uF7E0VRy2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026307; x=1685618307;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+X+FRGE1DrLyhmqqDKnng02bF8UXtim7gerRdngijA=;
        b=N1XRYzZqoIkrIrTHpyxV498jJ27zLJyKEkpWTQvPFJvn9vOAgBZDHp6hRaDLwJme94
         t93hGfSoYE1Su4Q9SpjSyrzs7oxdJYowubQ0NOsOdlhXm8qcJ1kpWwyTMkDAR2r0szFg
         vzlB3kYRzIw/JASI4If3d2DHTMP703keWt9B2GsqUoDJmmKk8KxAGFPgyRg5CiW+owv7
         yQdI1aL9a/qXWP0RW4yrC2FInbu9QtMYDivkdpqA228MlxxsoDTjnC7PUWjDCJR06ptO
         8dMNO4VEUVGqh7YCh2aaikWZoMNFhF5EXTc4XykB99N+gJpPGS1PdlsYg8p4rar0TY/2
         EYBg==
X-Gm-Message-State: AC+VfDwAqjB4JYnHTvrtCEE9faOSSG7rUh4S5Ns9kpJXmBD5QE+yvrrk
	izgblw5WE8cXEe5MM1sGhZdrDOY8e/UikdYHoGg=
X-Google-Smtp-Source: ACHHUZ7acyPlN8Pg1jZo9IQ6xwFsYu3r965ZVnMjr4/dd1OxIWSeWCn5jKnCNLq0722TvA15V/RZxA==
X-Received: by 2002:a7b:c407:0:b0:3f3:481a:902e with SMTP id k7-20020a7bc407000000b003f3481a902emr823096wmi.15.1683026307281;
        Tue, 02 May 2023 04:18:27 -0700 (PDT)
Message-ID: <6450f182.050a0220.6009b.3ca5@mx.google.com>
X-Google-Original-Message-ID: <ZFDxfwjiP2xv12F5@EMEAENGAAD19049.>
Date: Tue, 2 May 2023 12:18:23 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/3] tools: Use new xc function for some
 xc_domain_getinfo() calls
References: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
 <20230502111338.16757-3-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502111338.16757-3-alejandro.vallejo@cloud.com>

On Tue, May 02, 2023 at 12:13:37PM +0100, Alejandro Vallejo wrote:
> Move calls that require a information about a single precisely identified
> domain to the new xc_domain_getinfo_single().
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Tim Deegan <tim@xen.org>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Juergen Gross <jgross@suse.com>
> 
> v3:
>  * Stylistic changes that fell under the cracks on v2
>  * Reinserted -errno convention from v1 that had been
>    removed in v2

Mistake here. It's _NOT_ supposed to have that "Reviewed-by"

