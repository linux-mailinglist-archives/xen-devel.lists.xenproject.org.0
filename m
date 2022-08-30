Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42345A62D8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 14:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394993.634575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT00W-0005t5-Bk; Tue, 30 Aug 2022 12:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394993.634575; Tue, 30 Aug 2022 12:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT00W-0005ql-8v; Tue, 30 Aug 2022 12:06:16 +0000
Received: by outflank-mailman (input) for mailman id 394993;
 Tue, 30 Aug 2022 12:06:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SoMq=ZC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oT00U-0005qd-FL
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 12:06:14 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 247dfaa0-285c-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 14:06:13 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so9810767wme.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 05:06:13 -0700 (PDT)
Received: from [10.7.236.44] ([54.239.6.188]) by smtp.gmail.com with ESMTPSA id
 c16-20020adffb50000000b00226d473ebd6sm7961710wrs.86.2022.08.30.05.06.11
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:06:12 -0700 (PDT)
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
X-Inumbo-ID: 247dfaa0-285c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=0DeIT4jkZwkZHmPqaqueA/8Frm7F3XRKD9DVaRFEEzI=;
        b=CoX1dzUdQJZv+cjfrXIWuo5tgQ7Rugwsu6jgzoddqSHmUXQzfXQRXOoUef4fWuIT34
         3th85lYVj/dJnXLWBJHUasmY3MI9DxyeVVRg4r0oRUPUg/XhLJ2WdqdIAsW8o6MP7Joa
         hPxplJ06vVYsgAB1tav0zPeW7CIhpkcpjCQuWfwDy8YsCB52LoHyBmdhDn3nUsyTWlf8
         PmGybeezljFcTF+p41bbPX/+o7XpFHIuuhC4mjTzkYVVnlC5e47E00P80xbPq/SeF33r
         O315o0eZ17PHmhkR5tLfCJ0AjHAz0YpHNurpII+DxVfQw8mYf0nTFZv/joN7P2KWPU2I
         BViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=0DeIT4jkZwkZHmPqaqueA/8Frm7F3XRKD9DVaRFEEzI=;
        b=Z3obh963x/l0Y9Nwpr8UgTqFewelAitusrJK/XH1oMDIHRIzKTUPYjTnfN/ZmS5kPo
         6gl4WHNAeFa0bUngxZkJOzzEtXZmLqQLJbYm1zDuIDYi4+bS3Id4R3SbGumXia+BYeAF
         LU37LKnrdIxA38NzT7mZmuyZrP7Vu20PcmB8KDiEGK2QM7NduRgoetMYy//Sq45ckw5D
         ZW5QGf5DWp5GhSMjFAjWnXE8cScynPeDYqUOfrSFhZZ6WjgiViWYncjvy07PS5p/Ayg2
         xBwiMeJ9G9l8XJkYbjp9TZQZr4armbIPw7BTwD2ofZvxf+D6Mj0xTmBlg2yu/Jd6BC6s
         6xQA==
X-Gm-Message-State: ACgBeo18PmeA9Orv/DrOvyzHg1nDSPRCTpxyizERD7lMfWNRjAk08Sy+
	bLv6U781xB0lOjTIA3/c3PFb8zSCWpEIrXGC
X-Google-Smtp-Source: AA6agR5icW4h6CEMLSGg9jpVKYY0bNR5kVS6yAdGv7DstYHpg4vX9ndj8EZL5ww3zK83sWhqnCohjQ==
X-Received: by 2002:a05:600c:29c6:b0:3a6:836f:fe4a with SMTP id s6-20020a05600c29c600b003a6836ffe4amr9368740wmd.11.1661861172869;
        Tue, 30 Aug 2022 05:06:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <89a56dfe-7bc7-472c-3c0c-644ed36a0c44@xen.org>
Date: Tue, 30 Aug 2022 13:06:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH v1] xen/docs: Document acquire resource interface
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <d28893ed5c617f6e350f755508f10ba5a12e7098.1661763622.git.matias.vara@vates.fr>
Organization: Xen Project
In-Reply-To: <d28893ed5c617f6e350f755508f10ba5a12e7098.1661763622.git.matias.vara@vates.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2022 10:03, Matias Ezequiel Vara Larsen wrote:
> This commit creates a new doc to document the acquire resource interface. This
> is a reference document.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
> ---
> Changes in v1:
> - correct documentation about how mfns are allocated
> - correct documentation about how mfns are released
> - use the wording tool instead of pv tool
> - fix typos
> ---
>   .../acquire_resource_reference.rst            | 338 ++++++++++++++++++
>   docs/hypervisor-guide/index.rst               |   2 +
>   2 files changed, 340 insertions(+)
>   create mode 100644 docs/hypervisor-guide/acquire_resource_reference.rst
> 
> diff --git a/docs/hypervisor-guide/acquire_resource_reference.rst b/docs/hypervisor-guide/acquire_resource_reference.rst
> new file mode 100644
> index 0000000000..d1989d2fd4
> --- /dev/null
> +++ b/docs/hypervisor-guide/acquire_resource_reference.rst
> @@ -0,0 +1,338 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Acquire resource reference
> +==========================
> +
> +Acquire resource allows you to share a resource between Xen and dom0.

That doesn't sound right. The resources 'belong' to Xen, and are 
specific to a particular domain (A). Another domain (B) with enough 
privilege over domain A can then map and hence access those resources.

   Paul


