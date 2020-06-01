Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0715A1EA286
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 13:16:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfiPR-0003LR-Uo; Mon, 01 Jun 2020 11:15:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfiPQ-0003LM-4w
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 11:15:12 +0000
X-Inumbo-ID: 2842b38a-a3f9-11ea-9dbe-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2842b38a-a3f9-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 11:15:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u26so11832249wmn.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WQfJzqFfEaKfIfQ4a6l8KRYhHeFJRpYVrfeth7NbeaI=;
 b=W205YNhfbTjoAc+Sq9+SlEL7WiYKF5b9v5yHkY4DXyopHwJPg1SVVv2w9oIR4mdeiZ
 ST7h/2FQ9CrppRhn/J3bbwaLc+m7JhXGYYfwf5FoKVkAUCjHbK313p/oDAqp2+OiuQ4r
 motnab8vc2Rmd52V5L1Dr5cM5M/i7mdN+/Dt0ouAXWYIbm5zhpt61VXyfHGvHPrr0CoC
 wKuMWlY18eN+lp9S+laQKKZIlnLpzKuhpFWE7JvJMAv3TcbsEatQsReoROr3bwq1WeHg
 vCiXw550PsuSZzZCt6W4rjSmzJMMRbo4nTwPZfhJQQRMppYXbS56RbzP2oVOjhURm1dj
 /GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WQfJzqFfEaKfIfQ4a6l8KRYhHeFJRpYVrfeth7NbeaI=;
 b=il1X+Re19Lg+wdconpcKe8VC7U5QMLNujdKLL4F0ARqPx4eWkXKD8u2x6dE+4FfRvk
 Vw3weHKdTee12P/2pni/xdjOzfJlngWaZwfkETmsSsQUB3li36GW/1SsXy/8blvGo4Af
 o7rahKq0WzDcShfEjvK/1yMvlz3b6jLJcS/MnpuwJ5ocYUAD2u5bjgkYYICQHoJv+mY+
 NtH2PTRT3f7ky1pHyalJBLU6hLF3ZaRQuFjKLE0yOq1QHcCcaRJa3PtY8IuL3MBrBxFd
 JWQT2axIh3SJIuY9BEZWUAaNhBAHCFHM7p9/o+pzqq6KCZYad7g94UnIvi5mJ3JlDboC
 hdMQ==
X-Gm-Message-State: AOAM533iV3CjNRDnO6HmMZeVsnMlI5bo2tPOFbwVdQVVCMFwtCOY4yB2
 Q14Y+cmP+LMb+Fxv2PHbG6w=
X-Google-Smtp-Source: ABdhPJyRaQ6tyLCXSzXBsr+8m+WKjmt1MKBaf3ZRhDkXsuFSkOG19192WzS4X+s7FDROQp6EsdbLZQ==
X-Received: by 2002:a1c:305:: with SMTP id 5mr20766893wmd.60.1591010110216;
 Mon, 01 Jun 2020 04:15:10 -0700 (PDT)
Received: from [192.168.1.34] (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id v27sm21731098wrv.81.2020.06.01.04.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 04:15:09 -0700 (PDT)
Subject: Re: [PATCH 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix
 definitions
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: paul@xen.org, qemu-devel@nongnu.org
References: <20200531173814.8734-1-f4bug@amsat.org>
 <20200531173814.8734-8-f4bug@amsat.org>
 <000001d637e5$f0c4b4f0$d24e1ed0$@xen.org>
 <63327be6-10c1-6a8c-b4ed-cbbd085a35a8@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <3b4fdc66-ea78-2270-a67a-6d9138fc12c4@amsat.org>
Date: Mon, 1 Jun 2020 13:15:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <63327be6-10c1-6a8c-b4ed-cbbd085a35a8@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Eduardo Habkost' <ehabkost@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, 'Andrew Jeffery' <andrew@aj.id.au>,
 'Helge Deller' <deller@gmx.de>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?=27C=c3=a9dric_Le_Goater=27?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?=27Herv=c3=a9_Poussineau=27?= <hpoussin@reactos.org>,
 'Joel Stanley' <joel@jms.id.au>, 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, 'Richard Henderson' <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/1/20 10:33 AM, Philippe Mathieu-Daudé wrote:
> On 6/1/20 9:26 AM, Paul Durrant wrote:
>>> -----Original Message-----
>>> From: Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> On Behalf Of Philippe Mathieu-Daudé
>>> Sent: 31 May 2020 18:38
>>> To: qemu-devel@nongnu.org
>>> Cc: Andrew Jeffery <andrew@aj.id.au>; Helge Deller <deller@gmx.de>; Peter Maydell
>>> <peter.maydell@linaro.org>; Richard Henderson <rth@twiddle.net>; Eduardo Habkost
>>> <ehabkost@redhat.com>; Paul Durrant <paul@xen.org>; Hervé Poussineau <hpoussin@reactos.org>; Marcel
>>> Apfelbaum <marcel.apfelbaum@gmail.com>; xen-devel@lists.xenproject.org; Paolo Bonzini
>>> <pbonzini@redhat.com>; Stefano Stabellini <sstabellini@kernel.org>; Cédric Le Goater <clg@kaod.org>;
>>> qemu-trivial@nongnu.org; Joel Stanley <joel@jms.id.au>; qemu-arm@nongnu.org; Michael S. Tsirkin
>>> <mst@redhat.com>; Anthony Perard <anthony.perard@citrix.com>; qemu-ppc@nongnu.org; Philippe Mathieu-
>>> Daudé <f4bug@amsat.org>
>>> Subject: [PATCH 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
>>>
>>> IEC binary prefixes ease code review: the unit is explicit.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  hw/i386/xen/xen-hvm.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>>> index 82ece6b9e7..679d74e6a3 100644
>>> --- a/hw/i386/xen/xen-hvm.c
>>> +++ b/hw/i386/xen/xen-hvm.c
>>> @@ -9,6 +9,7 @@
>>>   */
>>>
>>>  #include "qemu/osdep.h"
>>> +#include "qemu/units.h"
>>>
>>>  #include "cpu.h"
>>>  #include "hw/pci/pci.h"
>>> @@ -230,7 +231,7 @@ static void xen_ram_init(PCMachineState *pcms,
>>>           * Xen does not allocate the memory continuously, it keeps a
>>>           * hole of the size computed above or passed in.
>>>           */
>>> -        block_len = (1ULL << 32) + x86ms->above_4g_mem_size;
>>> +        block_len = 4 * GiB + x86ms->above_4g_mem_size;
>>
>> Not strictly necessary but could we retain the brackets please?
> 
> Sure.
> 
> Laurent, if this can go via your trivial@ tree, can you do the change or
> you rather I resend the whole series?

I understood reading another thread that contributor should not overload
maintainer, so I'll simply repost this as v2.
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00066.html

> 
>>
>>   Paul
>>
>>>      }
>>>      memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
>>>                             &error_fatal);
>>> --
>>> 2.21.3
>>
>>
>>
> 

