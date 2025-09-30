Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC7FBAB6BF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133685.1471761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3SLG-0003ha-QX; Tue, 30 Sep 2025 04:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133685.1471761; Tue, 30 Sep 2025 04:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3SLG-0003eW-ML; Tue, 30 Sep 2025 04:51:58 +0000
Received: by outflank-mailman (input) for mailman id 1133685;
 Tue, 30 Sep 2025 04:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVVz=4J=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1v3SLF-0003eQ-2Y
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:51:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 303142e2-9db9-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:51:56 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-5hgfkuoeNqaAq-H2P-7gGw-1; Tue, 30 Sep 2025 00:51:51 -0400
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-634a73b5966so3801025a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:51:50 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3b02ccbsm8861868a12.45.2025.09.29.21.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 21:51:48 -0700 (PDT)
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
X-Inumbo-ID: 303142e2-9db9-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759207914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+Ec7IP8RaNea+ekLtnS8GreYVm0zDgRXajLAUnWqjpM=;
	b=L3yXiruhB8dh7q9ai78RWEYDJbkGeRKze84nR3M49W0zPGiu8KT0ru/rKM03wVrBs9H1RY
	JggUb77FHv5DzeFWawDM3b6qb5kTR44VVB+Az8rKY0izTi/eoNsEMbZfYJwv7CcquPgFFg
	YNTaqkeXMDYvEclujfL0bZfYbqnQrM0=
X-MC-Unique: 5hgfkuoeNqaAq-H2P-7gGw-1
X-Mimecast-MFC-AGG-ID: 5hgfkuoeNqaAq-H2P-7gGw_1759207910
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759207910; x=1759812710;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ec7IP8RaNea+ekLtnS8GreYVm0zDgRXajLAUnWqjpM=;
        b=gtP0MM7A7ApKukFEdladk3kitVpFU/U+r0MPN1GlNIeZdlYZUBpHv2SGQL+H7YGmUg
         rVwUtCLGXqWpB5Rt/+oGUf5tlLSHVDX/Pvmsb9cKYUrY60ioFEv+lscuo3U3ofkpX6k4
         ZuC+4eCcErIvXEibqTi7BIiGeZdMT9zW3mSe+TUjsKasbjbj+x6Jwyzer1hKQj06lS/m
         BcqIZ4silsc8iaP9rIWjEBtYLmqNen0VZQSFPT0sJAsAkkU1SrDQnHZJCQgeVLamDnyi
         dKgouJWjGK+sKqLPJgHKS9OsS3/b+Ils5YV+uLDexROC1xcCJNqxHJVpzjOP+6W3zqG2
         6+iA==
X-Forwarded-Encrypted: i=1; AJvYcCXbAVtbOyjR/9NNJGyFu2kFj6M/ErMjL77wOV5J+oIQyNH5Dd4K4+DJxusruKYxCT2win7McmVBLMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywjj4u7/WvvMhx7fK27BZXbM0e0tWEdzQ9XEPQsYq0hV7VsMPVx
	B2f6PbVOsWrxxFovl0LkvKIbzM5fhbq/N0e+Wv47krPWNt22D0gtQC6zd1yPrg15WR1phSCRwtg
	ov1EYKpCSjKNjdXXu/PgHT7VnzXcfsPhvlEQ+GSp7Xs7iIrk8V/rxBv9LCMTowoW19g7e
X-Gm-Gg: ASbGnct7NnAsYlhdBcLXaypKELxH6VhfY76p8NimhHixlYNYgtJ3GJuhVBUlEk5jZ3A
	7MBoLD0q0JXCU+Dv0nHg2bWwgU5s3l7EvFQJX6BCvEtB77DMY6wo8Speu4Y5TggBv+MLEVr2nQr
	7GBQggAExt7c719Nzh6IJHwHbGDAJdEs9TcHh3ukBEo40v5LiZTxM8YFpsyoUiUVWINkDNYcqDK
	LgWl4v6EjAuA1+mX5iHKAUXHDmtYSwRI5SZJn3KPSV8uj43tvD8CWAMY3/kZZLaBrLJIus4p/2P
	R2rcS5LCOH460R+QTEqGWQkoUlUmHsurTq/Z+e6+TKLOdDW0dVKDYdeX/L1lfiS++gz6XJKK3P2
	KD/qLI/mdRA==
X-Received: by 2002:a05:6402:26d3:b0:634:bff3:25d8 with SMTP id 4fb4d7f45d1cf-634bff32630mr11889987a12.30.1759207909948;
        Mon, 29 Sep 2025 21:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiKyEPXuUeN9dycrzKBPNvTY+be/FSVas+XL6RlQgrJhdSMc3jVU2nKqcyK2u2Vo+ShPjxzw==
X-Received: by 2002:a05:6402:26d3:b0:634:bff3:25d8 with SMTP id 4fb4d7f45d1cf-634bff32630mr11889951a12.30.1759207909548;
        Mon, 29 Sep 2025 21:51:49 -0700 (PDT)
Message-ID: <22ff756a-51a2-43f4-8fe1-05f17ff4a371@redhat.com>
Date: Tue, 30 Sep 2025 06:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] system/memory: Better describe @plen argument of
 flatview_translate()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Herne <jjherne@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Garzarella <sgarzare@redhat.com>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Eric Farman <farman@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Zhao Liu <zhao1.liu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-s390x@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20250930041326.6448-1-philmd@linaro.org>
 <20250930041326.6448-3-philmd@linaro.org>
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
In-Reply-To: <20250930041326.6448-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _quMjsbvIEsUeRIYCOlcC66bX8XqWkQwePfqzwk7u8I_1759207910
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/09/2025 06.13, Philippe Mathieu-Daudé wrote:
> flatview_translate()'s @plen argument is output-only and can be NULL.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/memory.h | 5 +++--
>   system/physmem.c        | 6 +++---
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/include/system/memory.h b/include/system/memory.h
> index aa85fc27a10..3e5bf3ef05e 100644
> --- a/include/system/memory.h
> +++ b/include/system/memory.h
> @@ -2992,13 +2992,14 @@ IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
>    * @addr: address within that address space
>    * @xlat: pointer to address within the returned memory region section's
>    * #MemoryRegion.
> - * @len: pointer to length
> + * @plen_out: pointer to valid read/write length of the translated address.
> + *            It can be @NULL when we don't care about it.
>    * @is_write: indicates the transfer direction
>    * @attrs: memory attributes
>    */
>   MemoryRegion *flatview_translate(FlatView *fv,
>                                    hwaddr addr, hwaddr *xlat,
> -                                 hwaddr *len, bool is_write,
> +                                 hwaddr *plen_out, bool is_write,
>                                    MemTxAttrs attrs);
>   
>   static inline MemoryRegion *address_space_translate(AddressSpace *as,
> diff --git a/system/physmem.c b/system/physmem.c
> index 8a8be3a80e2..2d1697fce4c 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -566,7 +566,7 @@ iotlb_fail:
>   
>   /* Called from RCU critical section */
>   MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
> -                                 hwaddr *plen, bool is_write,
> +                                 hwaddr *plen_out, bool is_write,
>                                    MemTxAttrs attrs)
>   {
>       MemoryRegion *mr;
> @@ -574,13 +574,13 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
>       AddressSpace *as = NULL;
>   
>       /* This can be MMIO, so setup MMIO bit. */
> -    section = flatview_do_translate(fv, addr, xlat, plen, NULL,
> +    section = flatview_do_translate(fv, addr, xlat, plen_out, NULL,
>                                       is_write, true, &as, attrs);
>       mr = section.mr;
>   
>       if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
>           hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - addr;
> -        *plen = MIN(page, *plen);
> +        *plen_out = MIN(page, *plen_out);

There is no check for a NULL pointer here, so plen_out must *not* be NULL?
Or did I miss something?

  Thomas


>       }
>   
>       return mr;


