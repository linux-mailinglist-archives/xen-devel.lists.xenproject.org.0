Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60467C59B0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 18:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615565.956883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqcWA-00007U-6Z; Wed, 11 Oct 2023 16:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615565.956883; Wed, 11 Oct 2023 16:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqcWA-0008WU-3l; Wed, 11 Oct 2023 16:57:06 +0000
Received: by outflank-mailman (input) for mailman id 615565;
 Wed, 11 Oct 2023 16:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH0+=FZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qqcW8-0008W7-11
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 16:57:04 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32d925be-6857-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 18:57:02 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c17de836fbso162531fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Oct 2023 09:57:02 -0700 (PDT)
Received: from [0.0.0.0] ([2001:41d0:8:52b7::])
 by smtp.gmail.com with ESMTPSA id
 v9-20020ae9e309000000b0076d25b11b62sm5351684qkf.38.2023.10.11.09.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 09:57:00 -0700 (PDT)
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
X-Inumbo-ID: 32d925be-6857-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697043421; x=1697648221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8QYwJlwxuuE4Ot80Y1Jemfy6h9yw2BCbj8PTmbeMBZg=;
        b=fUrB1iW42G4ps21Bf1nO3+QUSBOAaO3iI9026NyxZ51SVFvikbVWUR/bS4nsmuBO/j
         cIbhml2VpbDVKHAjHSensBEUryL6r+tusL8sOo7OBY0DIBs1Q4um3TDIZ9wtfvwEXOdW
         Rpj87JvIl7R7TDdsxoUyoWce0Fp2tFjtYWrc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697043421; x=1697648221;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QYwJlwxuuE4Ot80Y1Jemfy6h9yw2BCbj8PTmbeMBZg=;
        b=pkQoblsG8G1Qkd3VVP1RvhAm/fgioevr8JdVmUDFtWZBxqQ6Usj1xLSs4F5wGa14gp
         Ax1FVREsczuJdmb3n/lqV3iOpysMp5KUHZuTcxwUuIAGzQxzYuOmxRaIYhwhLMvc80n7
         dIHZUcZBt2Jrn+9XTTNeC7p7JrdJOyC/QXejj4snABSoFqHvIXYOw2K6mESmVTpNck8/
         g6yiwPjOV5s3y9zv7iDPfZ5bR3VYctZKdV82i8PiV4mVPiOpjEwNjb2hfgKVgypVN4JW
         oYA8Gqt8PMphvp6731qoH2R0lYCBUD5EhLoi+4XXge5vZClpzT/aH/Q/aaNJKT9MIcQ+
         B37g==
X-Gm-Message-State: AOJu0Yz8Jkd3uG/TMOu2Enbi6dayOI1n8pjRZ98pjoQ79IrROHbrvZsa
	rFRVbFBS24LgotPAEmpCm0roag==
X-Google-Smtp-Source: AGHT+IHOrPn2aO5XPlLbqJRQdLUY/ZJDOm0A53lGi55anUynHmIaxgoxioL7z8F2I+HNFkWU6RUGbg==
X-Received: by 2002:a2e:9ed9:0:b0:2c0:20c4:925a with SMTP id h25-20020a2e9ed9000000b002c020c4925amr15839564ljk.26.1697043421440;
        Wed, 11 Oct 2023 09:57:01 -0700 (PDT)
Message-ID: <9c728576-16e0-4d72-9019-d6f5fe8f033b@citrix.com>
Date: Thu, 12 Oct 2023 00:56:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: andrew.cooper3@citrix.com
Subject: Re: [XEN PATCH][for-4.19 v2 1/1] xen: introduce a deviation for Rule
 11.9
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1696948320.git.nicola.vetrini@bugseng.com>
 <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2023 8:46 pm, Nicola Vetrini wrote:
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index ee7aed0609d2..1b00e4e3e9b7 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -199,6 +199,11 @@ Deviations related to MISRA C:2012 Rules:
>         See automation/eclair_analysis/deviations.ecl for the full explanation.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.9
> +     - __ACCESS_ONCE uses a 0 as a null pointer constant to check if a type is
> +       scalar, therefore its usage for this purpose is allowed.
> +     - Tagged as `deliberate` for ECLAIR.

Really?

#define __ACCESS_ONCE(x)
    (void)(typeof(x))0; /* Scalar typecheck. */

That's not a pointer.

If someone were to pass in an x who's type was pointer-to-object, then
yes it is technically a NULL pointer constant for long enough for the
build to error out.

What justification is Eclair using to suggest that it is a pointer?

If you really really want to shut things up, it doesn't need to be 0 -
it could be 1 or any other integer, but this honestly feels like a bug
in Eclair to me.

~Andrew

