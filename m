Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09523B45551
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111718.1460317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuU2h-0002UQ-S0; Fri, 05 Sep 2025 10:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111718.1460317; Fri, 05 Sep 2025 10:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuU2h-0002Rx-NX; Fri, 05 Sep 2025 10:51:43 +0000
Received: by outflank-mailman (input) for mailman id 1111718;
 Fri, 05 Sep 2025 10:51:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfYY=3Q=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uuU2g-0002Qg-6I
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:51:42 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e0a3e15-8a46-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 12:51:41 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45b7d485173so13546315e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 03:51:41 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd6891d23sm27568405e9.4.2025.09.05.03.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:51:39 -0700 (PDT)
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
X-Inumbo-ID: 4e0a3e15-8a46-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757069500; x=1757674300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J1vkSr2t6WIe007U0hN4zE2xrDMsQfgN77xiEgUWtok=;
        b=t0rfV8fmag+BjZmPZnphgiE2JIUhHrvEXBzgiwCvZTiu/AaZeXoVgz1O8Su3d1VprH
         LFVfZZkQIId2VNZKAlep/b3h19PURYo5tNDHv6kN8D3XpVNc33XFxrFXIY5Z0hUhuEFL
         ek2VVNQFloVs8RJHYRog+DNi4OZ4nBsSAl7Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069500; x=1757674300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1vkSr2t6WIe007U0hN4zE2xrDMsQfgN77xiEgUWtok=;
        b=uDz3EWid5dymAF4m4gHJnyhYDDLizFveY+cGj85sHiXzRUWz8iM7U9dpbTIhoHpsIz
         GLtp+VJO8kO9fwCq/bO2X5bq8llm14j2huNmo9TgYMFUawWHls8R1105LLgwSaHM1Udb
         ijRe7uPxGw5ZYYlKxPH/ebjaTP8XbKbQaVwcQ13JJ8hUa6iV/OJM8kVjzToNLGt96Laa
         CFZp35bNhmFs1pyJBvsq0ilzVjVtNqcUOrzkTPpVYdvjzaPZjgyhNTJCbWb77k5vnka7
         9xv4+EPkoKLsZfsw7MLua50nTip3ylifECQzhtuWXhoAuzLmwD+PtEIxkzS+5ocQHFna
         oNMw==
X-Forwarded-Encrypted: i=1; AJvYcCVaNTvtLxbUyvzHmUQYrtuzM24z73Z7w8omaHFI7yv1lCIePKvKvV1tThAnn/V8S4Gx4vaZaEuUpGo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMB54sIMjGd2JA1uk+4O5Jv1EH9DSYoccKQKHqltyQwcBtexfu
	j0xpBYID6cENDxD6YuYVOgcJ2shXTqLkSUPXFnJZhPmDEuHjt5D8tSwCT6XQAI7zo9Y=
X-Gm-Gg: ASbGnctANpjuyzraL3VjZNxeNUoKF1bnibJMwtyJw/UStiHYlE0m4zRD4Kbi28OrOii
	/XYm3L30XcN6kyONqkQiYxOZkWXeRPVdtK7NCE91PH0qD6fmt2Vce7l+LV82IelYOtczFgMPzOI
	Ax25HrBsODXa+cCuTOkMVBRcT6ZJzVw+d1pDu0n+KT66W+TCmTypGmCm2anlUDXUbht6yBPWFWw
	444093qO3lyFHroAPuaNHy2YBX5Ix9wonvzURzNBAMdiU9QZFYfCeyUtgYCp+odJSx6lMUhhvYK
	99wCzOMCA86TsZheQq35LZXjXYZw5UtSpC32GVK5P7TVRPtp316wCOyNhKoal2uhHMKT4E+0c8J
	qA5UMvc4bYrZ7nxdc8Yp0QtwMli4F9A9gS9F9/0a6dwndcQ3TXmsCL0bDEAj+j7AvX3I4QDmWgN
	V0X/U=
X-Google-Smtp-Source: AGHT+IGC3/GzerY5lXb19L18mOsXn6cD3Iuz3vumiXAfSi8joG82hUYTSp1kyNc69dnJ2+WYc/ul5A==
X-Received: by 2002:a05:600c:35d3:b0:45d:d96e:6176 with SMTP id 5b1f17b1804b1-45ddbffc944mr4530615e9.25.1757069500416;
        Fri, 05 Sep 2025 03:51:40 -0700 (PDT)
Message-ID: <122c88cc-98b6-4c36-86fd-b624fa73b020@citrix.com>
Date: Fri, 5 Sep 2025 11:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [misra] Re: [PATCH v3 1/2] efi: Add a function to check if Secure
 Boot mode is enabled
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <cover.1757066332.git.gerald.elder-vass@cloud.com>
 <12c18a6d0c3cbbe17cee19f9fb4501d614c23ec3.1757066332.git.gerald.elder-vass@cloud.com>
 <6940b548-18b8-4507-bb75-617378fe090c@citrix.com>
 <8df5e7b1-6eee-44dd-b8c3-f38cc5322f98@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8df5e7b1-6eee-44dd-b8c3-f38cc5322f98@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/09/2025 11:44 am, Jan Beulich wrote:
> On 05.09.2025 12:36, Andrew Cooper wrote:
>> On 05/09/2025 11:05 am, Gerald Elder-Vass wrote:
>>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>>> index e12fa1a7ec04..e7e3dffa7ddc 100644
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -901,6 +901,28 @@ static void __init pre_parse(const struct file *file)
>>>                     " last line will be ignored.\r\n");
>>>  }
>>>  
>>> +static void __init init_secure_boot_mode(void)
>>> +{
>>> +    static EFI_GUID __initdata gv_uuid = EFI_GLOBAL_VARIABLE;
>>> +    EFI_STATUS status;
>>> +    uint8_t data = 0;
>>> +    UINTN size = sizeof(data);
>>> +    UINT32 attr = 0;
>>> +
>>> +    status = efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &gv_uuid, &attr,
>>> +                                 &size, &data);
>> This turns out to be a MISRA R7.4 violation, complaining about casing a
>> string literal to a non-const pointer.
>>
>> The real problem here is that the EFI spec.  GetVariable() ought to take
>> a const CHAR16 *, but doesn't.
>>
>> We could fix this with:
>>
>> diff --git a/xen/include/efi/efiapi.h b/xen/include/efi/efiapi.h
>> index a616d1238aa4..56775d553109 100644
>> --- a/xen/include/efi/efiapi.h
>> +++ b/xen/include/efi/efiapi.h
>> @@ -224,7 +224,7 @@ VOID
>>  typedef
>>  EFI_STATUS
>>  (EFIAPI *EFI_GET_VARIABLE) (
>> -    IN CHAR16                       *VariableName,
>> +    IN const CHAR16                 *VariableName,
>>      IN EFI_GUID                     *VendorGuid,
>>      OUT UINT32                      *Attributes OPTIONAL,
>>      IN OUT UINTN                    *DataSize,
>>
>> but I fear this might get some objections.
> The interface lacking the const in principle means that we can't rely on
> there being implementations which actually do fiddle with the string.

Well, the IN and absence of OUT does mean this in practice.

> Hence ...
>
>> I don't think we want to be deviating every use of GetVariable() for a
>> problem ultimately outside of our control.
>>
>> Another option would be to have a wrapper for GetVariable() which does
>> the cast once, which lets us deviate in one place only.
> ... this doesn't look like a viable route to me. (Nor a scalable one,
> as down the road we then may need more such wrappers.)
>
>> Thoughts?
> Why not instead use
>
>     static CHAR16 __initdata str_SecureBoot[] = L"SecureBoot";
>
> and be done?

I suppose, but that's still awkward to use.

~Andrew

