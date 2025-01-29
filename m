Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8CBA21722
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 05:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878897.1289098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td06p-00089M-Fh; Wed, 29 Jan 2025 04:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878897.1289098; Wed, 29 Jan 2025 04:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td06p-000873-Cv; Wed, 29 Jan 2025 04:55:27 +0000
Received: by outflank-mailman (input) for mailman id 878897;
 Wed, 29 Jan 2025 04:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hvc5=UV=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1td06n-00086x-J0
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 04:55:25 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3efa7006-ddfd-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 05:55:23 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2156e078563so90949225ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 20:55:23 -0800 (PST)
Received: from [157.82.205.237] ([157.82.205.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a7609b5sm10625337b3a.107.2025.01.28.20.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 20:55:21 -0800 (PST)
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
X-Inumbo-ID: 3efa7006-ddfd-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738126522; x=1738731322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IFeUQjMu1pqweZZ2zI+5/tYS9SLCsGUkfUbrwEx0iA=;
        b=FKkyqpU8RqzC7la9XWaAtylMIGivplUQdlARD/H7Hg/sWmCmmzKf7FN1RNmHUROX5Z
         dICEns/2gdRKzqyQTnaEiwtkIaP6R1/e9rRme1Db01sdBqn7/vzqV97U4Ll30VaKtzw7
         g4ne/XwVcVBf9B/23Bq3ryppbGG15BZiYiQW5VBbgzMBG4XHzdtZbf2y3BfBxHd4P3El
         rYrDW4ZCRXs5JVew7rwQJQTv2tZ8EPCXDuAv4TOtjYFmTCf0QwM2O6PpYc/Wp4InjgNo
         NxW9hyeoDwsoaRBxuOxNU/MgwYLtAf7fVk8XPb4pr/nkFhHxsTiaFZmgtV24CU4zwOpA
         xMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738126522; x=1738731322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IFeUQjMu1pqweZZ2zI+5/tYS9SLCsGUkfUbrwEx0iA=;
        b=RFAgq7zTG+9V775dFNPEepLBDtQbiRCd2rj9/+ESpPtxLaF/2F/tS+6UVTd4TW8AdR
         CwY5SYFuVDGY6jEwDkBZqutkDL81KKECbW+iNuzNiDFTRE3M+yYLqc9EG1JNKMJ1chPf
         zr1TgBZtaDGqmp0DQ5KKP+dCll/BkDNNcvQKn51Avt1P4BQGvInyWTz29vPfIVqhP8tP
         m/Ook0IrevwWVBNO++rWAroe9BDMGkt4oJqJDuOtRThMC9nYILsW6YSEnY8wG1tYys+2
         y8++m303O7oXcM5DxMgDNecFza0mt9KelDg/h+UaKdJo5DhJN0K7O9v7BveZGxlXWz4T
         gqmQ==
X-Gm-Message-State: AOJu0Yx5n9ESHFhcnchh4zFBti8ybykdZwPkCfYduOW7PqqG48Tsc3P8
	y97sTHlbIP0iFB2XT5nE2eDtj791HZ7/lYdvu+KFPbi/uiWocqASiYhgcjP93wg=
X-Gm-Gg: ASbGncsmOLscx+zn/aJj2lTugBkirt1GtS1t97zgEd6DTaujjkdaFzxCLfVF2fHs/+n
	lN8U1IcgY1A+4tksmKb9+lFP/UPR1hXy9+XUZLpaJ/qAKqUINfntC0P3nCZGACNLuX/HWynH7wY
	Zcoibrbk5zbfxtTc3k30eZeLykfpMrQl76Gn7ixZzByazYhMN8z0C0OyOJRf5dnS+BTXi/Pk/eH
	elTENUmMH08YWq6jMZ6BH9N3UMJndI01hOx4BXoo9lVOAcxRGEvDovuHxCArWX9s3h52m81fkCD
	ViH/WmfVp4tJCQfPzUTHH+m1gAGE
X-Google-Smtp-Source: AGHT+IE/ZkJCXSSPk6z1jArpZ1Lcz87un7Bm147NNNCD173L++5cdH5qki30oCucXAEB8021oAu+eQ==
X-Received: by 2002:a05:6a20:12d6:b0:1e1:ab51:f53e with SMTP id adf61e73a8af0-1ed7a5b66e1mr3007763637.5.1738126521875;
        Tue, 28 Jan 2025 20:55:21 -0800 (PST)
Message-ID: <ddbacd27-d978-409b-be12-060f27cea9d6@daynix.com>
Date: Wed, 29 Jan 2025 13:55:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/qtest: Make qtest_has_accel() generic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Bernhard Beschow <shentey@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250128111821.93767-1-philmd@linaro.org>
 <20250128111821.93767-3-philmd@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250128111821.93767-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/01/28 20:18, Philippe Mathieu-Daudé wrote:
> Since commit b14a0b7469f ("accel: Use QOM classes for accel types")
> accelerators are registered as QOM objects. Use QOM as a generic
> API to query for available accelerators. This is in particular
> useful to query hardware accelerators such HFV, Xen or WHPX which
> otherwise have their definitions poisoned in "exec/poison.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/libqtest.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 7e9366ad6d5..3071dedeff6 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -30,6 +30,7 @@
>   
>   #include "libqtest.h"
>   #include "libqmp.h"
> +#include "qemu/accel.h"
>   #include "qemu/ctype.h"
>   #include "qemu/cutils.h"
>   #include "qemu/sockets.h"
> @@ -1030,13 +1031,10 @@ static bool qtest_qom_has_concrete_type(const char *parent_typename,
>   
>   bool qtest_has_accel(const char *accel_name)
>   {
> -    if (g_str_equal(accel_name, "tcg")) {
> -#if defined(CONFIG_TCG)
> -        return true;
> -#else
> -        return false;
> -#endif
> -    } else if (g_str_equal(accel_name, "kvm")) {
> +    static QList *list;
> +    g_autofree char *accel_type = NULL;
> +
> +    if (g_str_equal(accel_name, "kvm")) {
>           int i;
>           const char *arch = qtest_get_arch();
>           const char *targets[] = { CONFIG_KVM_TARGETS };
> @@ -1048,11 +1046,12 @@ bool qtest_has_accel(const char *accel_name)
>                   }
>               }
>           }
> -    } else {
> -        /* not implemented */
> -        g_assert_not_reached();
> +        return false;
>       }
> -    return false;
> +
> +    accel_type = g_strdup_printf("%s%s", accel_name, ACCEL_CLASS_SUFFIX);

g_strconcat() will make this a bit shorter.

> +
> +    return qtest_qom_has_concrete_type("accel", accel_type, &list);
>   }
>   
>   bool qtest_get_irq(QTestState *s, int num)


