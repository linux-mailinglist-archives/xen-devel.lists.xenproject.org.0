Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C278AD52A7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011526.1389991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJ2n-0006BQ-Ei; Wed, 11 Jun 2025 10:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011526.1389991; Wed, 11 Jun 2025 10:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJ2n-000686-BV; Wed, 11 Jun 2025 10:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1011526;
 Wed, 11 Jun 2025 10:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lgg=Y2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uPJ2l-0004Fr-Qb
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:50:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2ecf7e6-46b1-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 12:50:55 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so55089575e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:50:55 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45325171fe0sm17412485e9.20.2025.06.11.03.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:50:53 -0700 (PDT)
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
X-Inumbo-ID: f2ecf7e6-46b1-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749639054; x=1750243854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gN+Ok54x7bMrzS/8lQNIrcKC9XEoAHuE6NJFfXL5dVI=;
        b=sQdLVatfaOG65xpX305tsnm9ctbl5nY++fyIzgFM4k8egHGJSJZO1XKBIF2HS2A4ec
         HBgI6JoBEsPkH+7xlCpTnO71gZ5+otINID+1m7SEawp7DNQHeX4jNmhIgsZseUDqNhHm
         qENg7k7CmRFKmHpAxa5V6rHo6tSafz7e5UoDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749639054; x=1750243854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN+Ok54x7bMrzS/8lQNIrcKC9XEoAHuE6NJFfXL5dVI=;
        b=HsG5bsYAey8fptAP+xqr39vtLDmXfWdc6hwGFPsk/7mt7uJCvU28b+uBpzPRSbyMt1
         MaoI+3Ke/kIUf2ECQqpdk7JUq3dnKJBXrBGbHv4gj5+pF92wkkNXvXEzQR9hNuGOpTrY
         jTA2pcQ8Eda6QU+ThzBYjmkofiXX+7CjV8i1pmgPIhM4UOghigEweeTLX0nXpZc6UMnh
         /9Oda0E6Y72cRS1dhE3QhU9uhPFNupZg3eEWfnece93lbQIPag4kobNCkqdKkhTq0xew
         RvPbgFQe3lh9/DVxjTPPQL7pLPYPgK+vllARF+M4sfr5jzODA0zqXFzkRhSf0pKykVGY
         5x6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6xG9k0EXEXw/FoUFRbYJ0/OwmiXsEJGDHjzM7oaAHAmZIAPu8A68stK/WaT3UpEdrXSCJ7kf7XUQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhLVic0GVsqTJb7iF2ZeiMPly4pwYRFxytq/TIDKeI6p9DMikj
	RTJG8yBizKnURs+oViyIggkPLig5SHBIaqsUuawz+INi4TKTeYOoool7nrysKydji1Y=
X-Gm-Gg: ASbGncuK8lXGudPbJDwtVT3wcUSFmOHUD73i343wA+f0EeRPWfmnYEIkHnHl5lOPisj
	0dfIihPwGLGmZFgxiACpzQ7nJNZgN5XH8eeMtOaBJgJwWvrmPQ+N6X3Gx8BwAOTsPQNcSc2P4lK
	kNK8wb4/TT+/miGdq6uzwGgSgW3oYWliBJnIOhlHMuA5kXWWgO4krTOCkUc9RSeNmNn5cGiGKYF
	lT2oCZpGY8A0ERB0D/eZWhJW6muHl/24qxazow9NpKgq3lM91YMAhbbwygLCl3iHisTElFV9xCH
	zX8zX2TzjZ3+zUz0JyrsgJycipaiD8GXgOFSfIyDK5heXinOVfTjIYakHTYbDsAueV9HmGjXxeg
	=
X-Google-Smtp-Source: AGHT+IH4TsgtM8qZpR7OhN6reNX9AipuF45ZaoDGtBEWcGPBrM81m45Cw0iUECJpR20zjOzY0BhPyQ==
X-Received: by 2002:a05:600c:3e06:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-45324f3729amr24060935e9.17.1749639054253;
        Wed, 11 Jun 2025 03:50:54 -0700 (PDT)
Message-ID: <6a0e5f9a-5b02-48da-b3b7-1874ba43e3c8@citrix.com>
Date: Wed, 11 Jun 2025 11:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] vVMX: use reg_read()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
 <5f72b1c7-968f-49c6-831b-cfc4678b5923@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5f72b1c7-968f-49c6-831b-cfc4678b5923@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2025 11:42 am, Jan Beulich wrote:
> Let's avoid such open-coding. There's also no need to use
> guest_cpu_user_regs(), when the function has a suitable parameter.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

