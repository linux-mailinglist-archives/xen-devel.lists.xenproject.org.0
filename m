Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18907ABBEF1
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989808.1373763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0Oi-0002ce-1f; Mon, 19 May 2025 13:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989808.1373763; Mon, 19 May 2025 13:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0Oh-0002Zt-VA; Mon, 19 May 2025 13:19:15 +0000
Received: by outflank-mailman (input) for mailman id 989808;
 Mon, 19 May 2025 13:19:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH0Og-0002Zn-U2
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:19:14 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbc06327-34b3-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 15:19:14 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ad563b69908so194561166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 06:19:14 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04af35sm592297066b.32.2025.05.19.06.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 06:19:13 -0700 (PDT)
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
X-Inumbo-ID: dbc06327-34b3-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747660753; x=1748265553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VcApOWdiLIxQVkLmWx6pEU+M+qAz3pD4fzMs27qcn8=;
        b=E1FQl2IkM3GhdiGjF3E74oKFZeJ3wUG2sSLxCgedrCP2vnOofqcRU6QA3Cm0n15l4C
         aDk0gK+TIfDRwXDy2svLuzN3/kdJv9RlUQPMd9VSSjnRecq4RCmme7Cz48xZKBn4A9Hs
         mWhvcE5sp9Tt+9I0tezxHuafOIHh+YwwF8aXmcSZKHSTLKxwiUuxNH01TTVkMAhCKFIE
         tLD2gnZQFbL8Gm9reKWiPtZoXSGSigTwAXaqA2GKeWv3MoG4vH9Hf2Ro3yamf7gAPCGy
         4E+Op0lYwvtbEX9UJ7bSfqGViZLeiSL331NgZaFqRducz7rVDBXnatvCx7NLEwe9E7sz
         xsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660753; x=1748265553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VcApOWdiLIxQVkLmWx6pEU+M+qAz3pD4fzMs27qcn8=;
        b=qa59LjlOHVaCoHm+4wa6Yhz3rpzXXyb7Mh8c8d8kmW1y4l7bx1BdRBqkP/BVD19vpb
         2xo1tGQj36kt8jjSAyS6s7XrsGbbWiIse8pVpX7wuYpHIic+evV6IcLDgzVn1LOpnkWB
         xtglEdTfXTs+CL/z3+cKoRaKhKt0aRwKa5KcKuSAXJPWl8q+e/RnNcoRXM70kbMCpCA+
         rLrTG/2Q9gGUHQTMeSLHBxkg1VVflG4aOktc645CjyS7g3Lq0sMwadZzOqVh6ZmEsatO
         tTktPcITPbUabPSMyHdaFUlUMjIfSN80njVrik0R3wMx4BmwpoRc1XXYbNBPpoyc2P6X
         UIFA==
X-Forwarded-Encrypted: i=1; AJvYcCX0B8TL32hKGO25JAcaOLcT4SovO+D7l5eZXn54M+yhnYrirqZO1YUG7mWPRZ9ZGSJAE7pkPVYNx2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwG+Sv/Xk5vXYoVefxRoVqcbKNtefCYINZx4pTT9cJjNz6denu+
	h5CwCBDdwfWgqelXxqRNiJ9TzmZj/V4f9QeNiYxrFBoxo34zzLSC9QdDDYCV1LBNVQ==
X-Gm-Gg: ASbGncsxeTGNxKdXAKzoZwHFkZlRWtLEKumS0fx/w9+PYQYiQxJUspRWRzuSJTTKxqC
	E82SvJ8+l/dhwBuooERIq/Jc6OOSR/Fq1rJCJfqD04uCfkWKLdmmcKUhgDlpr+uHO69zcN4v0Fh
	0igC693pBy7xK83X2JotciwXuFkHvfdi5gUCLXJRjuXA0wvV2wbXO4fkQGt1lOp0eOyAH5n8bHG
	C9Gh5NNFliZRK5bLznoRfBA9ZlYxGAEED198de71dCAev8dmGYc/8fEH17pAIK3jkHHUiL85AYn
	ChkEJimrzZzyIFUedIL325JFEV9LfcWtohB6LbIX84giU9mNOlhZuWJENg0jYA==
X-Google-Smtp-Source: AGHT+IFHUULXT9f5NSn1u39Zbnhwb2Rok/uZ509CdN0U6e7DlyCAeOvE7ujcI5+EBi3HUar6tBDfLg==
X-Received: by 2002:a17:907:3fa2:b0:ad2:3577:38fb with SMTP id a640c23a62f3a-ad536bbf0fbmr1034080766b.30.1747660753465;
        Mon, 19 May 2025 06:19:13 -0700 (PDT)
Message-ID: <0f673a09-840c-4319-bec8-62fd920a6b84@suse.com>
Date: Mon, 19 May 2025 15:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-6-Penny.Zheng@amd.com>
 <57a3b2c0-d57d-46e3-b248-0e243f715423@suse.com>
 <IA1PR12MB846717BD0A9E985C9E22AEFDE19CA@IA1PR12MB8467.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <IA1PR12MB846717BD0A9E985C9E22AEFDE19CA@IA1PR12MB8467.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.05.2025 10:36, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, April 29, 2025 8:52 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
>> cmdline
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
>>> --- a/xen/include/acpi/cpufreq/processor_perf.h
>>> +++ b/xen/include/acpi/cpufreq/processor_perf.h
>>> @@ -5,6 +5,9 @@
>>>  #include <public/sysctl.h>
>>>  #include <xen/acpi.h>
>>>
>>> +/* ability bits */
>>> +#define XEN_PROCESSOR_PM_CPPC   8
>>
>> This needs correlating (at least via commentary, better by build-time checking) with
>> the other XEN_PROCESSOR_PM_* values. Otherwise someone adding a new
>> #define in the public header may not (easily) notice a possible conflict. With that in
>> mind I also question whether 8 is actually a good choice: That's the obvious next
>> value to use in the public interface. SIF_PM_MASK is 8 bits wide, so a sensible
>> value to use here would by e.g. 0x100.
>>
> 
> I've added a public flag anchor "XEN_PROCESSOR_PM_PUBLIC_END" in public header:
>          #define XEN_PROCESSOR_PM_PUBLIC_END    XEN_PROCESSOR_PM_TX
> and will do the following build-time checking:
>         BUILD_BUG_ON(XEN_PROCESSOR_PM_CPPC <= XEN_PROCESSOR_PM_PUBLIC_END);

I don't really see why anything would need to be added to the public
header (and we really should strive to avoid unnecessary additions).

Jan

