Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E76DB702
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519157.806404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvGU-0004zi-N6; Fri, 07 Apr 2023 23:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519157.806404; Fri, 07 Apr 2023 23:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvGU-0004xT-JB; Fri, 07 Apr 2023 23:13:06 +0000
Received: by outflank-mailman (input) for mailman id 519157;
 Fri, 07 Apr 2023 23:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkvGT-0004xG-6F
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:13:05 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf128a8b-d599-11ed-85db-49a42c6b2330;
 Sat, 08 Apr 2023 01:13:03 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 r21-20020a17090aa09500b0024663a79050so1560399pjp.4
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:13:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a63dd58000000b004fcda0e59c3sm3091950pgj.69.2023.04.07.16.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:13:02 -0700 (PDT)
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
X-Inumbo-ID: bf128a8b-d599-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680909182;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYIkZBIFK2ZpHWvSfO0jyCWHXEmHKEa00eKczku2HgE=;
        b=vKfScPpZZuTSQjVvlLzoq0nu/oNEzhegH0VN4qBbTDX1lF4jluykpN2c1wbw5Qjmnj
         Rb66ndQEM5IDPq+PkYMGfaYi9++yYdHMhB0dAtUmxQ0utcdT4d11dzuZmSQZmMmkR0YZ
         f19qZTPpNtjEBVCVK7fCUEY08KnyfjOg+z/5iwxAqvdo+K6M9MEOq/E2MXr0jeAqB+Kq
         suEXAJqiAwgQTQ/MyX+nLK78aB5JsXiZWTSWLDWgP46FZ/9UiE6oqKOC79oVNQyZQwyZ
         gs3Q/speYE/HWvXViIfmClwbFvilbHwN6YPaYwEE4apNDw1NyVzvGBqI622hYSkVaakq
         kurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909182;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYIkZBIFK2ZpHWvSfO0jyCWHXEmHKEa00eKczku2HgE=;
        b=RqTvOVAYeEv0Ows1Ns1anfM6cwHRbFxZ0jbi+wByDR38H73wsgRLMZl+A+PSH7uXP9
         p+kVey7gkhrvhnLLqTXcNohwPutBfrO/UDnSOAAPYciEJ6pltIz2QHEnQp7MHcRJ/5v6
         bCCpKVSY3OKjgfh7BVeLnBhs5QqNcGXupAKz2+i67bZm852M+qr4cOqrl+O82VsRCQ/Q
         Qybr/O9NKoLvXX1QozIHYWDBNSrrnwAxBBxpLP99wB8X9/dcbo+Fyqhbg91ETgGHJUGa
         YNAvEH0eLfuna8q50nB0DXfu2gjV0dlE6We+CtWzJqg7bhjS6AwfyfdaHe5HmoI0H9xk
         +6bg==
X-Gm-Message-State: AAQBX9edAbuYN1jdNl/xbt/1U9hHCu1ysePdQFe4kordyozCK+UlUvpA
	JFaK63NkJssbjX/FdGfAGSDLeg==
X-Google-Smtp-Source: AKy350bDgHCmk88fi7lKmF1o3TyQSTwibPI+P0wHGQ0hTOjZ8sVom4CqWEwPGykeBzb76cAn0hafQQ==
X-Received: by 2002:a05:6a20:4ca3:b0:d9:dbb6:2e67 with SMTP id fq35-20020a056a204ca300b000d9dbb62e67mr4159798pzb.31.1680909182482;
        Fri, 07 Apr 2023 16:13:02 -0700 (PDT)
Message-ID: <5a0297f8-ddc6-4fac-b896-1b1ecede844e@linaro.org>
Date: Fri, 7 Apr 2023 16:13:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/14] accel: Rename WHPX struct whpx_vcpu -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-13-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState. Rename WHPX 'whpx_vcpu' as 'AccelvCPUState'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/whpx/whpx-all.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 70eadb7f05..2372c4227a 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -229,7 +229,7 @@ typedef enum WhpxStepMode {
>       WHPX_STEP_EXCLUSIVE,
>   } WhpxStepMode;
>   
> -struct whpx_vcpu {
> +struct AccelvCPUState {
>       WHV_EMULATOR_HANDLE emulator;
>       bool window_registered;
>       bool interruptable;
> @@ -260,9 +260,9 @@ static bool whpx_has_xsave(void)
>    * VP support
>    */
>   
> -static struct whpx_vcpu *get_whpx_vcpu(CPUState *cpu)
> +static struct AccelvCPUState *get_whpx_vcpu(CPUState *cpu)
>   {
> -    return (struct whpx_vcpu *)cpu->accel;
> +    return (struct AccelvCPUState *)cpu->accel;

Same comment about removing 'struct'.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> -    vcpu = g_new0(struct whpx_vcpu, 1);
> +    vcpu = g_new0(struct AccelvCPUState, 1);
>   
>       if (!vcpu) {
>           error_report("WHPX: Failed to allocte VCPU context.");

Hah.  And a "can't happen" error_report, since we're not actually using try here.  :-P


r~


