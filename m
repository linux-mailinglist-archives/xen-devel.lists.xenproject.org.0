Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB186A20A7F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 13:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878459.1288644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tckYG-0004e5-Am; Tue, 28 Jan 2025 12:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878459.1288644; Tue, 28 Jan 2025 12:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tckYG-0004bf-7i; Tue, 28 Jan 2025 12:18:44 +0000
Received: by outflank-mailman (input) for mailman id 878459;
 Tue, 28 Jan 2025 12:18:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hs5b=UU=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1tckYE-0004bX-0e
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 12:18:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0098f244-dd72-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 13:18:38 +0100 (CET)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-xd-wPyHhMfK64Si5KekWaw-1; Tue, 28 Jan 2025 07:18:36 -0500
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-aa689b88293so597960466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 04:18:35 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-234.web.vodafone.de.
 [109.42.50.234]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6bd0afb93sm149916966b.128.2025.01.28.04.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 04:18:34 -0800 (PST)
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
X-Inumbo-ID: 0098f244-dd72-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738066717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5n+WzSjjZga1/5dzHPwJh+sb0Qk6Ca3DIe5tAah4KKk=;
	b=auH9NutCYMGYvEyHx77vv6BPtiT4tAi6Hec3c9JMvK3Yty79FuS+StY6PlCXTjNFBwIJHy
	7XTsODkaONLr1e5NQyt0gtAT9pKobfA8RRYtuXpTjO3XcPcIV18fxILWvZNQtHPhCjYe4Q
	soaxdFroy5rhrjmSmKZu5pWrenqlYvg=
X-MC-Unique: xd-wPyHhMfK64Si5KekWaw-1
X-Mimecast-MFC-AGG-ID: xd-wPyHhMfK64Si5KekWaw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738066715; x=1738671515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n+WzSjjZga1/5dzHPwJh+sb0Qk6Ca3DIe5tAah4KKk=;
        b=f/7SDM6LKrAlc48wK4VpDWGwlcGaLrhMBpCUpmcIIcDxuJCh5qvvKIQyWNDkWAHO9+
         BR7EoZKYak2JYGAo0ek0N7kkRGUjw8axc/KrmPkPHR7ucSGv1UqwqFVY2HfADLLq52Qf
         h5mPsd3yMvGa7D+wu+d+Jy0eRYsDzGpjEXQ1LINYx0tmw8CV3mxfNtMDtn9l0s5ZJ07f
         1ChW6b/q0PKl2H2i+D63lSk070K/Pym1xYiKEi1I8+HUk7KWkP2zJYy64BuftjPSbMhe
         rYAx4b1esWp/HCNz5VTP/UTCzCpxl6hkUiVtaUtujWEqXfTa5RpQ7GWFPQZkTtHBbPcI
         PnJw==
X-Gm-Message-State: AOJu0YztQeVsIjXioKe2Zaj0K7IPSZvX5himMFi5NbDBTwwZY3/GWLdW
	rlErTi/fUvamfPomVYxMck4IQjeDc3cAceGR7gdylcdKdeMhSrQ+D1G9K/ZhK4VFiN17B05jBiK
	moQa7E/vuUo35n1S40ZL5xLXhLBMabKvD1A5q+Zi4AkRFc+WZ7jZcOWFtQ1Uqvet8
X-Gm-Gg: ASbGncvw2J+g/eVjBSvHqQ2kTuTF/pm/tBgkoe0+3L6NpSBm3WkWbFLan2XTEdKxox5
	KICFwLgK/sdnDrXBix30H0/DHFxAoGF9pJ6Fq0LBPSjAIEPa5Dih3QPVaL3EeIlVCRHtTKI89WM
	WmlF2R+nOoCQ2zX2U6WwLZ0P/baehAtWj0W4qNVU7cew5fjGA4PXpfn8ta0h9EaIqW6fYY9bo7d
	rxLxPqMmxEV1ujQNdhonJB5926yCD9TW5PEWLe1z4KJ3d8pgcsVYCvW7dvjGTLsFPUJZUYSgqt/
	a20kHfTBj5LJKXEZQ7Fk/CfuNOns5HBMENE6
X-Received: by 2002:a17:907:2da3:b0:aa6:83cc:7996 with SMTP id a640c23a62f3a-ab38b37eb86mr4119385266b.42.1738066714901;
        Tue, 28 Jan 2025 04:18:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPV1rzvwtGh/0owwTO1K12pEHLlm4LLq/EKPT+RrOmpKFZmOoxMbTgyLuoVeAf0osD9CBfRA==
X-Received: by 2002:a17:907:2da3:b0:aa6:83cc:7996 with SMTP id a640c23a62f3a-ab38b37eb86mr4119381666b.42.1738066714544;
        Tue, 28 Jan 2025 04:18:34 -0800 (PST)
Message-ID: <a29c4005-dea3-411d-8564-d79739a7befa@redhat.com>
Date: Tue, 28 Jan 2025 13:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/qtest: Extract qtest_qom_has_concrete_type()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Bernhard Beschow
 <shentey@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250128111821.93767-1-philmd@linaro.org>
 <20250128111821.93767-2-philmd@linaro.org>
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
In-Reply-To: <20250128111821.93767-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jk_XiX7Du_yzbtlxFxT9orkpZWsaCiUMUEfYJM7oCPo_1738066715
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/01/2025 12.18, Philippe Mathieu-Daudé wrote:
> Extract qtest_qom_has_concrete_type() out of qtest_has_device()
> in order to re-use it in the following commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/libqtest.c | 89 ++++++++++++++++++++++++------------------
>   1 file changed, 51 insertions(+), 38 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


