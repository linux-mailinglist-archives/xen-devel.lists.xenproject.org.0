Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91FDB388DE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 19:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096629.1451269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKFA-0007i7-2B; Wed, 27 Aug 2025 17:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096629.1451269; Wed, 27 Aug 2025 17:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKF9-0007fl-Vb; Wed, 27 Aug 2025 17:47:31 +0000
Received: by outflank-mailman (input) for mailman id 1096629;
 Wed, 27 Aug 2025 17:47:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AuO=3H=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1urKF8-0007ff-Lj
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 17:47:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6caca29-836d-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 19:47:29 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b4a25ccceso288915e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 10:47:29 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b73cf86f4sm19403145e9.6.2025.08.27.10.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 10:47:28 -0700 (PDT)
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
X-Inumbo-ID: e6caca29-836d-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756316849; x=1756921649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CJNT2vhJAFsF4KPZ7P2wzJVCIcO8VQrPLsgrkBfwmS8=;
        b=tHuh5KQeydEP4P9IlIhi2c/BypkYK2RP7bga0I6FX4wkh7Yx/lkhvHucr4Jfza/Ut+
         NIt5weqcwQ/c6xSII2ysweP0U95seBxSoMNoIAdpgxwfhxGL7/U+2HN9BscCA58NZEWf
         SO9zyWKGR7/wBqlwcxZhJab91ygtfmm8/V948=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756316849; x=1756921649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJNT2vhJAFsF4KPZ7P2wzJVCIcO8VQrPLsgrkBfwmS8=;
        b=cj6ysTaKfvcfQ17qyp5SZH7imeIddpnUZN7YvGDzn2FxKSsvw5Pf/mp+b1HHFV3Tko
         RS3CfuRcgHL33buGpgC8tiPlf9mHCoaAHxeldANntx3t9M0R2+uUw8+eHmRFQS0oypqn
         HdahfWUutml+Mft0Uy+sIiJgDk7W7joVRR+eib3G8GOVtiU9TmtfoTBawfF9/vRxLhP8
         ADuJ+7nw5gpi5FMc6583dAcIkEhj2+WtArkTIdip484xxEjRGur64UEaWZ652u11vhbo
         ohzLehUMI4bxpR5h0PPKHmyd+TiFsIa59WCjqsIeh1a5k3ny/Cw306tA2M/zd9OOxilh
         1WAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvVwxTSMgai+keMqxSVWjIqRPMDUeg4YnswM+hVJY7u/ZorP1yxYal8dK8y8OAYXty+zXcf2BBhUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/u3ddQqchXI8X3cvuFcpL8EXp9eIMXRpMSuJbREmxRb8KgNLP
	zqk5fD4uTkbZXhZIeS5mQYniL3nWY5Cfoyi0hA1jFnoW8SO9O8ztzFp1BVGsHLeYts4=
X-Gm-Gg: ASbGncu2uzVGPC7fYtr9QIsAA4bJ0fTUusFqD2waVbUbnqrCh1ZbTekF8mdC+rBGKwT
	LwRLz4Mv7T4O5tcmANE2jrz7VX8/cORZDHLh9OdIIAf5flNM/Og7MZKtZBzXQB5LObP90L2Rpr+
	25shkteWRB9jXnqzByXV9pJ1XV1Jj6hMfNzKCZpvbmJt56nFOkYRUFFFNjcfabGuML1189NEPQm
	1vwj7gbdOobnRq4eis+v2w5mHO2vVE18lS8LRWi7TbgGV5yOkjwwsqrqfjLwosgyGYDo6qocRjw
	igO//YGPIrlK81UrdWhLG+ZEhzc1hrTrFKzG3JQtvJ67HM3y7hoOl0Fty9bAZBGSqoGCIj0zUlo
	IfMrXt3yR4KtmjEejhsPpabuucmX+BeEgZ5YX/ziiIl7HsMXljrrBCGo+4UYMSUr2gf4A
X-Google-Smtp-Source: AGHT+IE437CduObjRgU4NO167hX6TfD+KN2bcx7DpCyvEhvVIVeJaXyLM4NZN8E6qytkYMBEkdBIuQ==
X-Received: by 2002:a05:600c:1392:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-45b517d4e23mr164248025e9.26.1756316848975;
        Wed, 27 Aug 2025 10:47:28 -0700 (PDT)
Message-ID: <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
Date: Wed, 27 Aug 2025 18:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: Update to SMBIOS 2.6
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/08/2025 2:47 pm, Teddy Astie wrote:
> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
>
> In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
> (undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
> you have a endian mismatch causing the UUIDs to mismatch in the guest.
>
> $ cat /sys/hypervisor/uuid
> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
> $ cat /sys/devices/virtual/dmi/id/product_uuid
> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
> $ cat /sys/devices/virtual/dmi/id/product_serial
> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>
> This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
> written in the table; which effectively fix this endianness mismatch with
> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> This effectively changes the UUID seen with UEFI guests as it was
> actually inconsistent with SeaBIOS and SMBIOS expectations.
> ---

I agree this is a real bug and needs fixing.  However, ...


>  tools/firmware/hvmloader/smbios.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
> index 6bcdcc233a..f4822ae6f8 100644
> --- a/tools/firmware/hvmloader/smbios.c
> +++ b/tools/firmware/hvmloader/smbios.c
> @@ -352,7 +352,7 @@ smbios_entry_point_init(void *start,
>      memcpy(ep->anchor_string, "_SM_", 4);
>      ep->length = 0x1f;
>      ep->smbios_major_version = 2;
> -    ep->smbios_minor_version = 4;
> +    ep->smbios_minor_version = 6;
>      ep->max_structure_size = max_structure_size;
>      ep->entry_point_revision = 0;
>      memcpy(ep->intermediate_anchor_string, "_DMI_", 5);
> @@ -462,7 +462,23 @@ smbios_type_1_init(void *start, const char *xen_version,
>      p->version_str = 3;
>      p->serial_number_str = 4;
>  
> -    memcpy(p->uuid, uuid, 16);
> +    /*
> +     * Xen uses OSF DCE UUIDs which is fully big endian, however,
> +     * GUIDs (which requirement is clarified by SMBIOS >= 2.6) has the
> +     * first 3 components appearing as being little endian and the rest
> +     * as still being big endian.

... this is not an accurate statement.

Xen specifically tries to treat a xen_domain_handle_t as an opaque blob.

The only two areas I can see ascribing any structure are the 'q'
debugkey (not exactly a strong ABI statement), and the arinc635
scheduler whose use is buggy (uuids are not unique in Xen; it's the
domid which is).

It is an error that a format isn't stated, but the format comes from the
toolstack.  We'd better hope that all toolstacks use OSF DCE UUIDs, or
this is going to badly wrong.

And on that note, the toolstacks are not the same.  Xapi for example
uses reads 16 bytes out of /dev/urandom.

Whatever we end up doing, the fix must include a change to
xen/include/public/version.h stating the format of the UUID.

~Andrew

