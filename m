Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE054A5F9AC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:23:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912469.1318716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskOo-0003vp-1y; Thu, 13 Mar 2025 15:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912469.1318716; Thu, 13 Mar 2025 15:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskOn-0003uH-US; Thu, 13 Mar 2025 15:23:05 +0000
Received: by outflank-mailman (input) for mailman id 912469;
 Thu, 13 Mar 2025 15:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G34e=WA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tskOm-0003uB-IT
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:23:04 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e6665bb-001f-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:23:03 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e6167d0536so2050345a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:23:03 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147ef34asm93185966b.68.2025.03.13.08.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:23:01 -0700 (PDT)
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
X-Inumbo-ID: 0e6665bb-001f-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741879383; x=1742484183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PiSo9XTquXILdjpZNh2AfU7MB+MKJicgPsbHM6qd5IQ=;
        b=I8pb57xd3KM4nrr98otMY7ExW1mr12toz+kfgZjSdgwGYFYdGhgTTfcbn/c5oZGsgk
         ub82zkOTeMEoqteyYyB4WaVaZGYlqV7YO1PYO+GFQDqz+Gqg0RwvTFXgZ/DSkGv7Kbz9
         FqprRi4DgFw9EnaFY02F1kxIjY5iNIrVzNLAhuwfoWyacok887ho9G+hSO6ydfDraQTx
         XQUGgVjGTn33Ce78O1GHTnoczVqqJbwcFL96EKafvr7LpKSaCuMlZje8YA8tnnMwKWSI
         qebn56N3zSFh9BR7bHm0R/sFjQS15Rwb0eo/nUbEqT+JsdKDAeCVo79L9aPTCo03A872
         cWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879383; x=1742484183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiSo9XTquXILdjpZNh2AfU7MB+MKJicgPsbHM6qd5IQ=;
        b=oxfXUEUSFCi/5NgsnHxHMPP+ddRaMR9CaDNhIwFYjT+52phssm5is6VaO7RAadvW+A
         ZUWZZh5xDnGJneze4QT4oz2AqLTKkLjcWwk8Wkte9u+CED9Jpj3dUBDzXvis95yAKLsD
         /SUavPmz9jYj2IrOteyAgxTArBexPkhMP1Ahy6gtycvgspqsreCvIVNPpEhh+MtkbJdb
         +PHlG3n0sJkiMGEi7CPbUzoQ12RwWKGYWTloHrjNf/HXDsO1sZOHUw7UQLaAPBW76ZLL
         hmSE+dev2KQJ08lYRGJISYp7C7ESJ79BR8gsEt/Wkn/0dur8VUUUBfo8OQFHTHX5IYiX
         JDUA==
X-Forwarded-Encrypted: i=1; AJvYcCVzrG5vm3JbXIqSmbt8nZwzur33rSduSecEgsvF1QtW0VnCBfZZJlWdsCq9r7UfGlBbGYVESod3rys=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE1yY7PaCyh5XBHBflOIeCmWQzQLAGhtKUUQRnU8hURYpiDvdG
	MWqxyjJG3f7cEwlTJBxJxvwRvxFjLySOOKkJX/pSrL2RFTmhnEMc
X-Gm-Gg: ASbGncsEUiX3VV+fN6NdarPDNA2RlDC+40Cc+SjaXJpdBRAP1dK7XlG+iSxx7xkU2SK
	gbmV1s4NFOOmCJ+fqIrDZ6+nMgGtyPntrOKvaZDq1eJk2Utq2Rv6Uo2x13ioeOgs4CzfysXIwpj
	zqKjPrJMNF/R38tDNgz6S1taM7uzF88t3Sl5uNH+SxXZkT73ZBGA6Y/ALlLrj5IboTTQ+xvayLN
	wO5eGilbb3/ldDAexXR5MY4o+4d8x3eYS9PsrdfCihLTuA4Bquz4r7aEMguQNOf3yMccATKq0VG
	pWuu/mLQ7epcwNeQjbiX24tK4vwvLvVf55MNB5knYlZIeM+ovWAORjp6HoK9RkgFFezdVBG9ReH
	ykn72sDr03AG8+6cBSMGi
X-Google-Smtp-Source: AGHT+IFP2xXu2B0wyHi5xv/C6LpAA8TQC6it1zRMccXLDewVVnfPSClp8WrmRV94dxcWb0yKNzpZLw==
X-Received: by 2002:a17:907:970a:b0:abf:51b7:608a with SMTP id a640c23a62f3a-ac2b9db4519mr1627715266b.5.1741879382746;
        Thu, 13 Mar 2025 08:23:02 -0700 (PDT)
Message-ID: <1f80af4d-e152-4c64-b6d2-db138537e531@gmail.com>
Date: Thu, 13 Mar 2025 16:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] CHANGELOG.md: Mention PCI passthrough for HVM domUs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Community Manager <community.manager@xenproject.org>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20250312040220.2624329-1-Jiqian.Chen@amd.com>
 <a8919be5-020c-47f3-8bfa-02dab2f1e2ca@suse.com>
 <Z9G39ULeHr7fp9ur@macbook.local>
 <7977cc2d-d654-49be-8bf9-9d3fe9286857@suse.com>
 <Z9Kp6b3l2YAePqWl@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z9Kp6b3l2YAePqWl@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/13/25 10:48 AM, Roger Pau Monné wrote:
> On Thu, Mar 13, 2025 at 08:42:25AM +0100, Jan Beulich wrote:
>> On 12.03.2025 17:36, Roger Pau Monné wrote:
>>> On Wed, Mar 12, 2025 at 09:51:09AM +0100, Jan Beulich wrote:
>>>> On 12.03.2025 05:02, Jiqian Chen wrote:
>>>>> PCI passthrough is already supported for HVM domUs when dom0 is PVH
>>>>> on x86. The last related patch on Qemu side was merged after Xen4.20
>>>>> release. So mention this feature in Xen4.21 entry.
>>>>>
>>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>>> ---
>>>>>   CHANGELOG.md | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>>> index 7201c484f899..b6de9b72ea7a 100644
>>>>> --- a/CHANGELOG.md
>>>>> +++ b/CHANGELOG.md
>>>>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>>    - On x86:
>>>>>      - Option to attempt to fixup p2m page-faults on PVH dom0.
>>>>>      - Resizable BARs is supported for PVH dom0.
>>>>> +   - Support PCI passthrough for HVM domUs when dom0 is PVH.
>>>> Aren't we still in need of SR-IOV support in order to make such an
>>>> unconditional statement?
>>> I view SR-IOV as kind of orthogonal to this: SR-IOV is not
>>> supported at all on PVH dom0, so it's not just pass through, but the
>>> capability itself that won't work as expected when using such devices.
>> Hmm, yes and no. No in so far as I as someone who simply wants to use Xen
>> would read the above statement as indicating full pass-through support.
>> Which first and foremost includes the passing through of VFs.
> Maybe we can clarify somehow that SR-IOV devices are still not
> supported on a PVH dom0:
>
>   - Support PCI passthrough for HVM domUs when dom0 is PVH (note
>     SR-IOV capability usage is not yet supported on PVH dom0).
With this suggestion:
  Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
~Oleksii
>
> In any case we should likely wait for:
>
> https://lore.kernel.org/xen-devel/20250308001711.18746-1-jason.andryuk@amd.com/
>
> To be committed?
>
> Thanks, Roger.

