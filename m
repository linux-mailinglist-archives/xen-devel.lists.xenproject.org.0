Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0375904E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 10:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565662.884010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2ag-0005xH-C7; Wed, 19 Jul 2023 08:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565662.884010; Wed, 19 Jul 2023 08:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2ag-0005uh-9L; Wed, 19 Jul 2023 08:31:22 +0000
Received: by outflank-mailman (input) for mailman id 565662;
 Wed, 19 Jul 2023 08:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CK5=DF=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qM2ae-0005ub-Dh
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 08:31:20 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a287fdc8-260e-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 10:31:19 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31716932093so772257f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 01:31:19 -0700 (PDT)
Received: from [10.95.158.71] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adffc02000000b0030c4d8930b1sm4653587wrr.91.2023.07.19.01.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 01:31:18 -0700 (PDT)
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
X-Inumbo-ID: a287fdc8-260e-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689755479; x=1692347479;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/GAKGp71OPwPZhKZtQk0oFeFfJJ9W9Zm6F5Df+fF8Q=;
        b=IE+UE8eDzQbwrJUdHN/g7tkKfC9w/UpPvfODFBNSy/sZHvb/Gtm4pqEgkEJmR717l0
         IGRtFYRAXN587sgBmGwFid9ZSYQEc6wD0lgaaIqDkUJVwviWFSPJtrhyyJ2lN2PkoiTQ
         M862Jr8hvNYKTXUDF0VZWpMTWGh1CrPEHY3QhQTh4Ok7Rfpg7oRpGQamrDCehVg6JYbb
         GDtAG12kynaB6/k2PO5obb04X9OrFFOMsOVY6yk/k2AmvWNNb2HifuvDNOuJZb7qoLfm
         0gmYK5mp5f/1vmQwRffyxwdrIZZhzEjMqvq5ByM4Fo8L+PYo8wzA6O96XjxpV/1lw//G
         G5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689755479; x=1692347479;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/GAKGp71OPwPZhKZtQk0oFeFfJJ9W9Zm6F5Df+fF8Q=;
        b=S/7WLvB5JiI+D66KGOXhPIzP9iyYs7qkAm1gl/NGO5tdo1CxK/O9xMNIwEZfKmlf4d
         iqKsDvbQpLayl/acZvIMae0APGV4BAwNJdm4MoKvC4wCsXPeHoccvx2jquDy58jIyaCX
         y7GJopn2bKkxd09bOAlnKAr5og0IzUosCEwkzTZeEj28RF5IZaHyOTejQb3rrCrnetcg
         G8MVzfYQDcUIs6T9o0Fsec7q0HaO6CoV/rCKOUnv3PDsJ2o5YATwwRNnd/dj4dCapTPG
         j8MbfXeNYDr2Mpav9121KvoLr05/+EG7Fh4DcGzH//RZ255gsaCcukFflmIozOUgqwtm
         HMBw==
X-Gm-Message-State: ABy/qLYHfGRFB/DdNrzxfWiSrCAtcxi9JFUHnnGhOr+ZvwvHQu/QWE5a
	rgFmPX+aR3eWyPXgQ7J8ulA=
X-Google-Smtp-Source: APBJJlHe4a66Y8G9a5v3bJEz8f1pxnmHaHn8z8CvJ7Sosmhs1rJrPLSPT36GM5Kg00GlAORNIZrgNQ==
X-Received: by 2002:adf:e2d2:0:b0:306:46c4:d313 with SMTP id d18-20020adfe2d2000000b0030646c4d313mr1394622wrj.28.1689755478545;
        Wed, 19 Jul 2023 01:31:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f67a9f92-1794-98dd-1e19-e0df30b49dee@xen.org>
Date: Wed, 19 Jul 2023 09:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Reply-To: paul@xen.org
Subject: Re: [XEN PATCH] x86: I/O emulation: fix violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <b6ebf3a49de027981505da63aef594cb0dc42ead.1689691260.git.federico.serafini@bugseng.com>
Organization: Xen Project
In-Reply-To: <b6ebf3a49de027981505da63aef594cb0dc42ead.1689691260.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/07/2023 09:24, Federico Serafini wrote:
> Give a name to unnamed parameters thus fixing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names used in function declarations
> and names used in the corresponding function definitions thus fixing
> violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
> function shall use the same names and type qualifiers").
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/arch/x86/include/asm/hvm/emulate.h |  8 ++++----
>   xen/arch/x86/include/asm/hvm/io.h      | 14 +++++++-------
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


