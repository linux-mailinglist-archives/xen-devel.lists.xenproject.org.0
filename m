Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9C914DC3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746591.1153695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjDA-0006Mz-Ng; Mon, 24 Jun 2024 12:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746591.1153695; Mon, 24 Jun 2024 12:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjDA-0006LU-L2; Mon, 24 Jun 2024 12:54:20 +0000
Received: by outflank-mailman (input) for mailman id 746591;
 Mon, 24 Jun 2024 12:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLjD9-0006Iy-AA
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:54:19 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddf40d98-3228-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 14:54:17 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so54482871fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 05:54:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb2909sm61983885ad.257.2024.06.24.05.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 05:54:16 -0700 (PDT)
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
X-Inumbo-ID: ddf40d98-3228-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719233657; x=1719838457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sT3/CMGEXkPf9D0xs8i24smjMaiVBhMBYt0ZVCxsCYU=;
        b=fpOECQzkFUx/QE5zDOEgHvIQx9A3caSDHIcNDfPG40kTXsD/rydeklf2Fe+1S8zlTL
         y0c8xS8cOgVO/VTGj49helzqjp6j8RWK+rCpVnomXfOT5H7r8mAMJoQOaaNp+Bm+AG8s
         zIw6yvsmkYcoi7UxCxBUKjsqN4MmkdXG64fGSxTEOyAAsvkuxDxP+SgCxCOkxySHhIn+
         mZJQ4HD4SBexBBueN+/Vk3i1NnG+BpwmcpBsJVMlU1LpKMipuaBpArIsW9t5Yabd8HUQ
         itADaHmlBspBkuEbKTFn4j7HETsAOZCePrV+Zk4XnBJURMqQYWt1D06UwjC3/DZa3kSm
         I+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719233657; x=1719838457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT3/CMGEXkPf9D0xs8i24smjMaiVBhMBYt0ZVCxsCYU=;
        b=pFux7htQKWtpphGR2QhrRclqqajc6s+xSlwMY+qnH74eEbMwcRICAqWdWL008kNY9n
         F6VbFx9P2bgD7Q/5UruwcEJUAyVbGZKSiyUJalynwxg+IG21G2jOrBG4VGft8ty4h9U/
         slyLEEkPuFzOoebR3XB34OtCcZRpd8PeQrdFbTIKZtDx3lpWvjuKQ0dNCXa9PMMydLOG
         VfEA83Tl0PpIopzvpkVAr+2CIGuDkI8vMP3b8VaEYF6He3u/TgXbUZ2t2tAvcJSJFFeR
         VzYRc9IqqbiqDB1V5LYnVh0F51gNO55AmH6bK2l1POuy7/ZdmOR8g8ykuzIHmtBqrsPl
         F4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWUjz5Y43ZgVEqE0K+6ouyfd3mNfXap+vp0ZpjdKwQc8UZickTgpNDTfpR6XBAGx/3RJSzQ4rWaoRC26iJ4cDR1fabacR41qw09JJLYEQY=
X-Gm-Message-State: AOJu0YylRO9zcV1QXLQEs3ZjtxVwzoBAXLQVVANaHXtITtaJ6inphcPq
	L9slIVt94ZvZ9IGSXGeyeUk7dct/Scp3nMxyHoeiDKAK68rdQppH6yhbm2vmHw==
X-Google-Smtp-Source: AGHT+IHzABbbFGbRZc/c/p4J9I2kFdnR8VMXDmpl3Ow09uumZWfSO+PX7L/fJvRk1sjIHTX/DHySHQ==
X-Received: by 2002:a2e:854f:0:b0:2ec:49b5:50d5 with SMTP id 38308e7fff4ca-2ec5b357a00mr34101611fa.41.1719233657152;
        Mon, 24 Jun 2024 05:54:17 -0700 (PDT)
Message-ID: <36d581a0-f144-4756-b345-8b74ccc25c74@suse.com>
Date: Mon, 24 Jun 2024 14:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
To: Branden Sherrell <sherrellbc@gmail.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <ZaeoWBV8IEZap2mr@macbook>
 <15dcef46-aaa8-4f71-bd5c-355001dd9188@suse.com> <ZafOGEwms01OFaVJ@macbook>
 <7BAC7BB5-C321-4C34-884A-21CC12F761BB@gmail.com>
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
In-Reply-To: <7BAC7BB5-C321-4C34-884A-21CC12F761BB@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 14:40, Branden Sherrell wrote:
> I recently found this mailing list thread when searching for information on a related issue regarding conflicting E820 on a Threadripper platform. For those interested in additional data points, I am using the ASUS WRX80E-SAGE SE Wifi II motherboard that presents the following E820 to Xen:
> 
> (XEN) EFI RAM map:
> (XEN)  [0000000000000000, 0000000000000fff] (reserved)
> (XEN)  [0000000000001000, 000000000008ffff] (usable)
> (XEN)  [0000000000090000, 0000000000090fff] (reserved)
> (XEN)  [0000000000091000, 000000000009ffff] (usable)
> (XEN)  [00000000000a0000, 00000000000fffff] (reserved)
> (XEN)  [0000000000100000, 0000000003ffffff] (usable)
> (XEN)  [0000000004000000, 0000000004020fff] (ACPI NVS)
> (XEN)  [0000000004021000, 0000000009df1fff] (usable)
> (XEN)  [0000000009df2000, 0000000009ffffff] (reserved)
> (XEN)  [000000000a000000, 00000000b5b04fff] (usable)
> (XEN)  [00000000b5b05000, 00000000b8cd3fff] (reserved)
> (XEN)  [00000000b8cd4000, 00000000b9064fff] (ACPI data)
> (XEN)  [00000000b9065000, 00000000b942afff] (ACPI NVS)
> (XEN)  [00000000b942b000, 00000000bb1fefff] (reserved)
> (XEN)  [00000000bb1ff000, 00000000bbffffff] (usable)
> (XEN)  [00000000bc000000, 00000000bfffffff] (reserved)
> (XEN)  [00000000c1100000, 00000000c1100fff] (reserved)
> (XEN)  [00000000e0000000, 00000000efffffff] (reserved)
> (XEN)  [00000000f1280000, 00000000f1280fff] (reserved)
> (XEN)  [00000000f2200000, 00000000f22fffff] (reserved)
> (XEN)  [00000000f2380000, 00000000f2380fff] (reserved)
> (XEN)  [00000000f2400000, 00000000f24fffff] (reserved)
> (XEN)  [00000000f3680000, 00000000f3680fff] (reserved)
> (XEN)  [00000000fea00000, 00000000feafffff] (reserved)
> (XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
> (XEN)  [00000000fec10000, 00000000fec10fff] (reserved)
> (XEN)  [00000000fed00000, 00000000fed00fff] (reserved)
> (XEN)  [00000000fed40000, 00000000fed44fff] (reserved)
> (XEN)  [00000000fed80000, 00000000fed8ffff] (reserved)
> (XEN)  [00000000fedc2000, 00000000fedcffff] (reserved)
> (XEN)  [00000000fedd4000, 00000000fedd5fff] (reserved)
> (XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
> (XEN)  [0000000100000000, 000000703f0fffff] (usable)
> (XEN)  [000000703f100000, 000000703fffffff] (reserved)
> 
> And of course the default physical link address of the x86_64 kernel is 16MiB which clearly conflicts with the EfiACPIMemoryNVS memory starting at 0x4000000. On latest Debian (12.5.0, bookworm) the decompressed kernel is more than 60MiB, so it obviously overflows into the adjacent region. I can also confirm that loading the Debian kernel at 2MiB also works as expected. Debian is also built with CONFIG_RELOCATABLE=y, so it should be capable of being loaded with this new feature in Xen. 
> 
> I see the link at this ticket was implemented and committed (dfc9fab0) on April 8, 2024 but it appears to not have made its way into the latest (4.18) Xen release. Though there seem to be more recent commits cherry picked into that branch. When is this fix expected to make it into a release?

It's not tagged as a bugfix, and PVH Dom0 also isn't "supported" in 4.18.
Hence it wasn't picked into the set of backports. I also doubt it'll help
you, as I would guess you're still using PV Dom0.

Jan

