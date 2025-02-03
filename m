Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DAA25C39
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 15:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880646.1290731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1texMX-0007XU-OU; Mon, 03 Feb 2025 14:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880646.1290731; Mon, 03 Feb 2025 14:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1texMX-0007Uj-Kh; Mon, 03 Feb 2025 14:23:45 +0000
Received: by outflank-mailman (input) for mailman id 880646;
 Mon, 03 Feb 2025 14:23:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wUg=U2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1texMW-0007Ud-88
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 14:23:44 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 780727a5-e23a-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 15:23:42 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso30518275e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 06:23:42 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102d00sm13170236f8f.32.2025.02.03.06.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 06:23:41 -0800 (PST)
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
X-Inumbo-ID: 780727a5-e23a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738592622; x=1739197422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uzRaqZNdtbZr8SHkz9yZxDEsCpPhpCPqdRrnb0tJuac=;
        b=kgHWR/5XG4TFkNzauclMS/1yLWn+pt+aIcLCcC3sCJDq/KSNBSioeL+/+X1btUVlOu
         s1MlL4cPVb6H3IVV5vviyW40a+QIN1YybLkb4a6hm4X5BxtvJjHLhvH9mhGbUn+c0/DY
         5ztA9onp3iD95ybAk0/9UsB38Vmy1gZGqq5Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592622; x=1739197422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzRaqZNdtbZr8SHkz9yZxDEsCpPhpCPqdRrnb0tJuac=;
        b=aqeCN4Zm9cJRxdBliQgB0jsOSNDTuUke9IIdkJalaiTVKviAsKoscmzJrJVoJx1agg
         95f0llSuPTZNfM2sZ9TEvIEtIBesPBu8TqGWPTEGw/IUjpTDZdJSjYxr/Ipc5/pj57K+
         fLvOSnQqhdoZe0H9D2FY/eXqJSThIded2FoTGvj4OVtgKSkt97PxBh2wMnFumQAzfMiT
         h4DbvCdWfd5EisdT6lxEalYK5TvzzWfFawQe5F1L7bvnKFlqoJDhkZY3IQfVC634ManB
         Qxe1BU+mbyaj4EJlKiPttg+AbVJNGtwaUfzpJDdvTpS2bIueJr1E1zeuEMGr4CpKbGDX
         yb+g==
X-Gm-Message-State: AOJu0YwJ0RgylwF/ACuRj5JAc3mRUMgJ+bxCpdMNaKgqM+NYjcOdDxWU
	88HdC7LxHKWnhXlBHhmZn/JuYus7eHcNATTp995nfgoDbkcMvhj7rw8tF4rrz6E=
X-Gm-Gg: ASbGncuQgdylDupx4jDR8C9SwXtMPNKZb5VDnquIoi9i3fj4HRO3G8/59xa5+o6bLB+
	DW1tYtavrNKs2LP+O8ZMrVdEHvBPP2fP4JBQEg6zuxciLXkysNXDYXXI5I6Y6S1ZKUwL1tcgvNp
	yMvsRzJgo7WukK67rbeGIhEeVvD4w07V+3n9lhXlh2jhoXOEKhZZpPSp2qYIxc/JVem3uaBv3n3
	tkEKKPQpRg3I6X1ucoY09xAHMiy/BdZawTPTqoCt3V1SyG0URhxvhvdORt8edsF1DBLH5cbTymp
	aQAadhI5iKvmzsfKbItmMPdL5igTH0rKMBv1GHT4EknRocbsPHk5zZI=
X-Google-Smtp-Source: AGHT+IHqgoym70Y7LkW61dgL7NyXa8j2s9a/NFOnJSs7ws++56xAIU1l3DZTbUQyJXiG58+cdWVMQw==
X-Received: by 2002:a05:600c:3d9b:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-438dc3c39d6mr216822605e9.10.1738592621678;
        Mon, 03 Feb 2025 06:23:41 -0800 (PST)
Message-ID: <ebf97ded-3e26-4bb8-8a61-ebdcdac1b176@citrix.com>
Date: Mon, 3 Feb 2025 14:23:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
 <Z6C6fUeB4mFfGfJc@macbook.local>
 <e7eff762-ff80-440e-8a92-e5a5e09a97ce@suse.com>
 <37df8931-c9f4-4af2-a099-b2bb4539bffe@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <37df8931-c9f4-4af2-a099-b2bb4539bffe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2025 1:03 pm, Jan Beulich wrote:
> On 03.02.2025 14:00, Jan Beulich wrote:
>> On 03.02.2025 13:45, Roger Pau Monné wrote:
>>> On Thu, Jan 30, 2025 at 12:12:31PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
>>>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
>>>> @@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
>>>>  {
>>>>      bool valid = true;
>>>>  
>>>> -    pci_segments_init();
>>>> -
>>>>      /* MMCONFIG disabled */
>>>>      if ((pci_probe & PCI_PROBE_MMCONF) == 0)
>>>>          return;
>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>> @@ -55,6 +55,8 @@ void __init acpi_iommu_init(void)
>>>>  {
>>>>      int ret = -ENODEV;
>>>>  
>>>> +    pci_segments_init();
>>> My preference might be to just place the pci_segments_init() call in
>>> __start_xen(),
>> As said in reply to Andrew - I was considering doing so as an alternative
>> to the moving done here. I can certainly do so, in case some non-negative
>> reply comes back from him.
> Oh, and: With further adjustments following from what Andrew had outlined,
> I'm actually moving the invocation of what was pci_segments_init() back to
> where it's now. (Which doesn't mean that couldn't be done from
> __start_xen(); just mentioning it.)

The name acpi_mmcfg_init() at least has a PCI implication, given mmcfg.

I know it's late in 4.20, and moving pci_segments_init() would be
acceptable at this juncture.

However, if you're making progress with improving radix trees, I think
that would be a better approach and probably fine to be considered at
this point.

~Andrew

