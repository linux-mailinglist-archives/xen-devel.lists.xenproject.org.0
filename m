Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD7DA6D833
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925270.1328145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twewL-0006Yy-1S; Mon, 24 Mar 2025 10:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925270.1328145; Mon, 24 Mar 2025 10:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twewK-0006X4-UD; Mon, 24 Mar 2025 10:21:52 +0000
Received: by outflank-mailman (input) for mailman id 925270;
 Mon, 24 Mar 2025 10:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twewJ-0006Ws-Ca
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:21:51 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc70b43d-0899-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 11:21:50 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso2699864f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:21:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ac3ce3dd1sm2050424f8f.88.2025.03.24.03.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 03:21:49 -0700 (PDT)
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
X-Inumbo-ID: cc70b43d-0899-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742811710; x=1743416510; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RRFVJfT6Xr5zCYwrOJ8qr+T0oepcd/arFvDtve0y1Is=;
        b=cl1AWW7Z6UMQ3T5mrPPu/AjtdVpdaksnFocO5zByCYtlk1Hy0g6ob7aeQRkYXUI7QU
         AK4tsJ3C81bUVXy79heBmLXFQ8o1wjgbRlUSQvGdnSjq7eEbGAM1tNKG2YgO1HIdjf+F
         52Y49dIX7mSm4AFSCcBOOsnVphL+PZBMoVhhjmd1EBUhftmfh5m+VjZLt/RZqQ/JDCjK
         KJ1JdOrtpdxu2oXMHdJBU40GGQnkc1lx6mk+OhALjuwGRpJez3s2/tgCQM0llrubXk6Z
         8Zm68nRv1dkxx3vfhfKDj+bOiXvhBT/mkelexEpxY8YMHketMC7dwpVCZye6Tq0FTLyM
         jXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742811710; x=1743416510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRFVJfT6Xr5zCYwrOJ8qr+T0oepcd/arFvDtve0y1Is=;
        b=cc0LQ2E6RUJUGBWOaFND4kOfUdJGnzNKYOBWDX0NH1FSgCNUyrRHciUaJK7HflvZlm
         U7mX4bvXDzSn73YhsxwsKubNUU+ZFsRVkQMhSoDDPnB/KxhIdwcaqraKNEY8TtkDLiXK
         qVOw556gmYfil29r/dVvZBW8f9KfuwpNhDHbxflEjS9s/g55VhnchUXMSeQiV8xGze2O
         Q0i/ChjcwtynyW7DvLKI+A1bn4vXiAT7jZJfeSI6vJxq1I5ayUl5IesldldGTLmHg2QU
         2mjRLQ2bG6Q8OAj05sHrLcQcu4u02PlTE+sgrKRz3X+zg7+uNQikwJmDvv988hcfUSgt
         CNrg==
X-Forwarded-Encrypted: i=1; AJvYcCXEEsJLHQR0BcPPDGiEJRWwB0/MlFy+UpNXQ7QRaEvUhDydHrFWDBopXgYtBYnOTTe2eqqXANj91wU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLc7hAF0UrD+R4XnXs4vrGdj/7wQlqxDoVAyACp0+2WDCZ/utN
	/HV6/swIzhbHgTG+CyWeVPLwMbPe/5eP05N3vTQzWwANJzdbU25ECWz+Rv6uyw==
X-Gm-Gg: ASbGncv62EoQLM6fEbKiTT6FFaNV85kmIJo10v0/91ml/ZTPSb0nIupipcTMuQ4gv38
	skxTC6tqBhzUpI6eeN9j/yJq5ynnl7/0n5i7P0XL5R11MlMRGIPBDzIoGu7IInW01Xgmm2wL7oR
	gzoLcqSYuBtpiAxqwOiHszvo9t4tj12NWq3JIfvSWI8LAfQ18tfkAYDg0VriylkHHg2yZ43oDsP
	bIXFm9HJrIUQj7rnQQmZh0Z/fgrRcyeMNgaogWqI9QjlYaJMx5GbPrZXoVrZOtsc9nWXA2wqWP3
	MeDUsJ+CUXRHJucz5jXM+K3xNCHzuioAr6yPe/mrD9P5XIzIAZkJnuT6vbcz2TOpcg7RLa+qw/5
	sIiBGO7m+HMkNogBMv8EYQJ1QOflN9Q==
X-Google-Smtp-Source: AGHT+IGrK/WQi0YItI7dNyyyOhL9/8Easu+g0kbe2h8NxSZ7S2slu67rDAigqzcHVj+wkXhp04emPg==
X-Received: by 2002:a05:6000:1a8d:b0:391:3207:2e6f with SMTP id ffacd0b85a97d-3997f932d2fmr8817154f8f.42.1742811709609;
        Mon, 24 Mar 2025 03:21:49 -0700 (PDT)
Message-ID: <abce7ac0-21bd-409c-bc4c-f08d04a5a5d1@suse.com>
Date: Mon, 24 Mar 2025 11:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 1/2] 9pfs: add fstat file operation hook
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20250321093145.17882-1-jgross@suse.com>
 <20250321093145.17882-2-jgross@suse.com> <Z99PXOXocyuZtf_X@begin>
 <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
Content-Language: en-US
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
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
In-Reply-To: <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.03.2025 15:57, Jürgen Groß wrote:
> On 23.03.25 01:01, Samuel Thibault wrote:
>> Juergen Gross, le ven. 21 mars 2025 10:31:44 +0100, a ecrit:
>>> Add a file operations fstat hook to the 9pfs frontend.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>> ---
>>> V2:
>>> - or file access mode into st_mode (Jason Andryuk)
>>> ---
>>>   9pfront.c | 29 +++++++++++++++++++++++++++++
>>>   1 file changed, 29 insertions(+)
>>>
>>> diff --git a/9pfront.c b/9pfront.c
>>> index 1741d600..7257a07e 100644
>>> --- a/9pfront.c
>>> +++ b/9pfront.c
>>> @@ -85,6 +85,8 @@ struct file_9pfs {
>>>   
>>>   #define P9_QID_SIZE    13
>>>   
>>> +#define QID_TYPE_DIR   0x80     /* Applies to qid[0]. */
>>> +
>>>   struct p9_header {
>>>       uint32_t size;
>>>       uint8_t cmd;
>>> @@ -950,6 +952,32 @@ static int write_9pfs(struct file *file, const void *buf, size_t nbytes)
>>>       return ret;
>>>   }
>>>   
>>> +static int fstat_9pfs(struct file *file, struct stat *buf)
>>> +{
>>> +    struct file_9pfs *f9pfs = file->filedata;
>>> +    struct p9_stat stat;
>>> +    int ret;
>>> +
>>> +    ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
>>> +    if ( ret )
>>> +    {
>>> +        errno = EIO;
>>> +        return -1;
>>> +    }
>>> +
>>> +    buf->st_mode = (stat.qid[0] == QID_TYPE_DIR) ? S_IFDIR : S_IFREG;
>>> +    buf->st_mode |= stat.mode & 0777;
>>> +    buf->st_atime = stat.atime;
>>> +    buf->st_mtime = stat.mtime;
>>
>> Should we perhaps also fill st_ctime? Leaving it at 0 could surprise
>> other software layers.
> 
> I can set it to the same value as st_mtime.

Maybe the smaller of atime and mtime?

Jan

> I don't think there is a way
> to get the "real" ctime value via the 9p protocol.
> 
> 
> Juergen


