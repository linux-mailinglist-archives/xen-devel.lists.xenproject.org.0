Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D0A20A94
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 13:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878467.1288654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tckjo-0007UU-Aj; Tue, 28 Jan 2025 12:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878467.1288654; Tue, 28 Jan 2025 12:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tckjo-0007Si-6q; Tue, 28 Jan 2025 12:30:40 +0000
Received: by outflank-mailman (input) for mailman id 878467;
 Tue, 28 Jan 2025 12:30:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hs5b=UU=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1tckjn-0007Sc-Dq
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 12:30:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acb4f76f-dd73-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 13:30:37 +0100 (CET)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-QhrWZrb3NseI9zkAom9gGA-1; Tue, 28 Jan 2025 07:30:34 -0500
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5dc0de54194so5284009a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 04:30:34 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-234.web.vodafone.de.
 [109.42.50.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc2ea16e7asm4661486a12.42.2025.01.28.04.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 04:30:24 -0800 (PST)
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
X-Inumbo-ID: acb4f76f-dd73-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738067435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mwEdGeYwCVEf3va0CRehsDI0IO9aha2vG+WbTqnfbXg=;
	b=JUXFq2BPT8fiAUB/Q52OiusIKcMZH+XR0pIL0Z4h3OCkT95qs19urTu+52K7L6qEwehZIc
	rfH9aV1AOB1surtfzuVNSAIYR2SKCm4MS0RvKqBc4Bi3gZ7d22ygeSgfM+7sxaa0xGNu+5
	dp4bdhy+CZ6BNl6hl4YimDypfRHW9Oc=
X-MC-Unique: QhrWZrb3NseI9zkAom9gGA-1
X-Mimecast-MFC-AGG-ID: QhrWZrb3NseI9zkAom9gGA
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738067433; x=1738672233;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwEdGeYwCVEf3va0CRehsDI0IO9aha2vG+WbTqnfbXg=;
        b=vWodI8ZkcMx2Afn0P/+WWog/NFoeEfxuONXTMUg7b18Xm0rDUWk8Xajdi20hCRYEmS
         tQ4j6YzAWfXSpLin+ER4XShd9QFBm7KZfNW3kq63G7N8AHEri/B0ISU32trWUg5FmgPI
         nfwwWLMBCK/RDhLz6JoJJ+OiJZAfXPYXO9RAx/FG+M1eHHjMTpcw+txKv79FBCg7pp0g
         Jx3Eqn48m4Aro8nVF3y2uwvr6kpu1MHclUU2nQsfo8lIvcGxcaX8qGTGQTguM40T1PJl
         6WymS27oAZJA3tJEHQOv2iDNQ/QqyTYaYUR+EsDJAtv8YtNNWcqnQpMVG02ZrE3xZ2Gp
         z6fQ==
X-Gm-Message-State: AOJu0Yz78JPfPNcQw2nUgnWMjGrELZy1ihM94ysBsBXNNulPdGSirjcA
	Qo1frMRm1vn3qIS2yEI1uJq0wuy359x7/56AeQzFGG8G91zRMppdHKqLKl04CrBzGCXnE3i2Z4f
	sc3r7/d+e3Dtr7M3GLClS1sP1NPa68LeNJ4KPvTotPmT51+YxQj9GpXPGP7XEyzUY
X-Gm-Gg: ASbGncuiJrwCjLwQGOX9dT26ZmC2i3h4I+J1oH0cTg8D9gdihjVPfrDqRkYgXQJXNPg
	YgkcqHaALhC8/Vc9ZjlMSfMRQ8wUQVrmUjRPj196JPrw2kMhnhP8phUP9CCOCF7whAI4FL0xzmn
	zSH7T0xj4MP/8OAEeoV0VQy6uoZzSBjwsr/fsk3old9x1TYembQYseBLbJlnfnqCUNOLLdp29Lv
	t2srh4fIk83izcZ8WsXQ1uzrWBzGFtmg9ME2/RBY0I4nCxVICpcEohrye9hYb2OXhL5lfya1JMS
	Q2SXu9AYPnhNMaFSCl7d3r+cf67SRlzVQrYy
X-Received: by 2002:a05:6402:1e8f:b0:5dc:eb2:570d with SMTP id 4fb4d7f45d1cf-5dc4fd1153emr4070528a12.2.1738067430204;
        Tue, 28 Jan 2025 04:30:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHE5zcsdFqOnxwXJMHoRt5avby+/62eopuGkbdjyfNCDtaIa+EgX1nN8lJkWB9mowl6EBIMVA==
X-Received: by 2002:a05:6402:1e8f:b0:5dc:eb2:570d with SMTP id 4fb4d7f45d1cf-5dc4fd1153emr4070158a12.2.1738067424760;
        Tue, 28 Jan 2025 04:30:24 -0800 (PST)
Message-ID: <8da6ca8d-9819-4f4c-9131-f9fcf498d86d@redhat.com>
Date: Tue, 28 Jan 2025 13:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/qtest: Make qtest_has_accel() generic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Bernhard Beschow
 <shentey@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250128111821.93767-1-philmd@linaro.org>
 <20250128111821.93767-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <20250128111821.93767-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SMHGwCQYYMjSoJOb7wvvpr-WcqXPpeMZkZFNrORyqEY_1738067433
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/01/2025 12.18, Philippe Mathieu-Daudé wrote:
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
> +
> +    return qtest_qom_has_concrete_type("accel", accel_type, &list);
>   }

Nice!

Reviewed-by: Thomas Huth <thuth@redhat.com>


