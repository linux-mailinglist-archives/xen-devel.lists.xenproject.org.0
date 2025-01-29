Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3743FA21971
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 09:52:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878980.1289193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3o9-0007w7-K6; Wed, 29 Jan 2025 08:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878980.1289193; Wed, 29 Jan 2025 08:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3o9-0007tO-Gv; Wed, 29 Jan 2025 08:52:25 +0000
Received: by outflank-mailman (input) for mailman id 878980;
 Wed, 29 Jan 2025 08:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td3o7-0007tI-Mv
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 08:52:23 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a36e3f7-de1e-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 09:52:21 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaef00ab172so1027677066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 00:52:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc1862a17fsm8250164a12.32.2025.01.29.00.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 00:52:20 -0800 (PST)
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
X-Inumbo-ID: 5a36e3f7-de1e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738140741; x=1738745541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1FjJv8LxnyC91YV2RXnmbiwBUqJEBc/JvrKRu50A8S8=;
        b=Sn6Y0J0euGuw6wS1udDdNVRXOGsWaEBsJn+xh/HBbrOro7fFHmoanPIhApyygKHmRQ
         efOxQqdGgPE87C8zQLGZTTOVsLXdVAej1gHBR9WlHZomfw4y30QFyOYZ2DYk37fMN4I9
         EVc/Lo7Syxm+EsftP4rSFesljZn5m9dstLOHxyGiB7PcOxWaww81zigZnIPZ4cS3SykK
         0JEFGy9wAMRsZCn7zoFjZ/FrqJ8WYe6NXMg+UO/9wKLL5dENt2gNmg7Z2TKG8/4Cnh/x
         xxrq82Uexe8PTNq6TmaZO2xOHyZBKUUh73S8mD7k4VPRgkijK6Z83IRHVn78fIazpX64
         Pppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738140741; x=1738745541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FjJv8LxnyC91YV2RXnmbiwBUqJEBc/JvrKRu50A8S8=;
        b=BnJAUCSAqpVCQtiHWxYLidjia4BQac2y7G6nQqaOXMNRWqWTLbu5LWV9pPLyyq2/o3
         FkU7H2T6HIaVIiKHLO2dlgQaNeJx+isDqT7of3trliIWfvFlAyhemVRvhM31/b2v0Lt9
         vABakyLQWDpH4UGUm09t3lawLwT0adPObei2cdVyQ7Pmc5tbF9lzrAMDsy/Z4mZN1+oT
         +ZSnaO/lfGRTU2HO6iXE/cWQgXAlvga/Yqqp/LvlTjiPWW+ai7ZGIj86XjdkVXkT1VoL
         09D7GnrZ84oOXm3k8wp6BZcItzZjp6W9I/Va98iyxA6lDaEdM//ASBXKBvxV8z1F2BXi
         E+6w==
X-Forwarded-Encrypted: i=1; AJvYcCW6S+wzYYmiQLLJxNxtVcjp179+TDy6gQvgJ23Mr7F/vRxkq7PwQSAva7djAryYlTFSMf8Y8vfMMhs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVgeg6CkussoDZB07e6dRudlF+2R+v7PbFdjU7+CqrnbZch8yL
	Je3OKpisyPMaFU7jiptDP1mmrlNyaKGPIUHBgJ/HLRyUJLjZx8qxjfQhcXYO5g==
X-Gm-Gg: ASbGnctJy/QFD+5fSjtQxq/SqSXqy5idOfWqoPnBMW+oC8U2fcHhfrMvbjNv7xgQmHL
	29EwyDImVrNnNfDanY223JP/maXiRiDCUYnOqAjog2VOMCpoVejMl/FoqlGpaBAKjaYZXI+NfPl
	Kj7WFyCDeaA57bmu2FQZzk57X/2vt9rou9o3COf5RZgYKiPT60ukeLuA3knFHsW+8nGruSeKISQ
	yqnwUS4rCZxfT3zYQzj0py27AlgS8mxyexqAmLi8Bp3/kW+WdvqV+Pm1QeqJy3OdNYM/+x6ivFX
	Xg+tX8paEWoXclGbe+PZYphzcgIFFYEN+N1lRxjtlel49L9ryx5qRxAurdpoASjivjpa3T5cCdF
	C
X-Google-Smtp-Source: AGHT+IHqmcQIv8Oj2TLFZzf88JzYvO2YhukeD3JjUobhf7Rp9YDnQ9fmLYcs5B2IAHLODMHQQV6D8A==
X-Received: by 2002:a05:6402:90d:b0:5dc:58c8:3154 with SMTP id 4fb4d7f45d1cf-5dc5effe4bfmr5817441a12.28.1738140740988;
        Wed, 29 Jan 2025 00:52:20 -0800 (PST)
Message-ID: <b4ccccbb-f3ee-44fe-a5e2-780195cbbc0e@suse.com>
Date: Wed, 29 Jan 2025 09:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: slow start of Pod HVM domU with qemu 9.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 jgross@suse.com, Anthony PERARD <anthony@xenproject.org>,
 Paul Durrant <paul@xen.org>, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, "Edgar E. Iglesias" <edgar.iglesias@amd.com>
References: <20250128151544.26fc827d.olaf@aepfle.de> <Z5j-bkdFZ7riavv7@zapote>
 <alpine.DEB.2.22.394.2501281543580.3264561@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <alpine.DEB.2.22.394.2501281543580.3264561@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2025 00:58, Stefano Stabellini wrote:
> On Tue, 28 Jan 2025, Edgar E. Iglesias wrote:
>> On Tue, Jan 28, 2025 at 03:15:44PM +0100, Olaf Hering wrote:
>>> With this change the domU starts fast again:
>>>
>>> --- a/hw/xen/xen-mapcache.c
>>> +++ b/hw/xen/xen-mapcache.c
>>> @@ -522,6 +522,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>>>      ram_addr_t addr;
>>>  
>>>      addr = xen_ram_addr_from_mapcache_single(mapcache, ptr);
>>> +    if (1)
>>>      if (addr == RAM_ADDR_INVALID) {
>>>          addr = xen_ram_addr_from_mapcache_single(mapcache_grants, ptr);
>>>      }
>>> @@ -626,6 +627,7 @@ static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_t *buffer)
>>>  static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
>>>  {
>>>      xen_invalidate_map_cache_entry_single(mapcache, buffer);
>>> +    if (1)
>>>      xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
>>>  }
>>>  
>>> @@ -700,6 +702,7 @@ void xen_invalidate_map_cache(void)
>>>      bdrv_drain_all();
>>>  
>>>      xen_invalidate_map_cache_single(mapcache);
>>> +    if (0)
>>>      xen_invalidate_map_cache_single(mapcache_grants);
>>>  }
>>>  
>>> I did the testing with libvirt, the domU.cfg equivalent looks like this:
>>> maxmem = 4096
>>> memory = 2048
>>> maxvcpus = 4
>>> vcpus = 2
>>> pae = 1
>>> acpi = 1
>>> apic = 1
>>> viridian = 0
>>> rtc_timeoffset = 0
>>> localtime = 0
>>> on_poweroff = "destroy"
>>> on_reboot = "destroy"
>>> on_crash = "destroy"
>>> device_model_override = "/usr/lib64/qemu-9.1/bin/qemu-system-i386"
>>> sdl = 0
>>> vnc = 1
>>> vncunused = 1
>>> vnclisten = "127.0.0.1"
>>> vif = [ "mac=52:54:01:23:63:29,bridge=br0,script=vif-bridge" ]
>>> parallel = "none"
>>> serial = "pty"
>>> builder = "hvm"
>>> kernel = "/bug1236329/linux"
>>> ramdisk = "/bug1236329/initrd"
>>> cmdline = "console=ttyS0,115200n8 quiet ignore_loglevel""
>>> boot = "c" 
>>> disk = [ "format=qcow2,vdev=hda,access=rw,backendtype=qdisk,target=/bug1236329/sles12sp5.qcow2" ]
>>> usb = 1
>>> usbdevice = "tablet"
>>>
>>> Any idea what can be done to restore boot times?
>>
>>
>> A guess is that it's taking a long time to walk the grants mapcache
>> when invalidating (in QEMU). Despite it being unused and empty. We
>> could try to find a way to keep track of usage and do nothing when
>> invalidating an empty/unused cache.
> 
> If mapcache_grants is unused and empty, the call to
> xen_invalidate_map_cache_single(mapcache_grants) should be really fast?
> 
> I think probably it might be the opposite: mapcache_grants is utilized,
> so going through all the mappings in xen_invalidate_map_cache_single
> takes time.
> 
> However, I wonder if it is really needed. At least in the PoD case, the
> reason for the IOREQ_TYPE_INVALIDATE request is that the underlying DomU
> memory has changed. But that doesn't affect the grant mappings, because
> those are mappings of other domains' memory.
> 
> So I am thinking whether we should remove the call to
> xen_invalidate_map_cache_single(mapcache_grants) ?
> 
> Adding x86 maintainers: do we need to flush grant table mappings for the
> PV backends running in QEMU when Xen issues a IOREQ_TYPE_INVALIDATE
> request to QEMU?

Judging from two of the three uses of ioreq_request_mapcache_invalidate()
in x86'es p2m.c, I'd say no. The 3rd use there is unconditional, but
maybe wrongly so.

However, the answer also depends on what qemu does when encountering a
granted page. Would it enter it into its mapcache? Can it even access it?
(If it can't, how does emulated I/O work to such pages? If it can, isn't
this a violation of the grant's permissions, as it's targeted at solely
the actual HVM domain named in the grant?)

Jan

