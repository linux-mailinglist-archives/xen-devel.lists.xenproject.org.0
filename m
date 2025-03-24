Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB025A6D922
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 12:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925392.1328262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfwp-0008N2-Vy; Mon, 24 Mar 2025 11:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925392.1328262; Mon, 24 Mar 2025 11:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfwp-0008Kl-Sg; Mon, 24 Mar 2025 11:26:27 +0000
Received: by outflank-mailman (input) for mailman id 925392;
 Mon, 24 Mar 2025 11:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twfwo-00086T-PH
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 11:26:26 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1ca1cba-08a2-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 12:26:24 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so34019635e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 04:26:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d440ed4d9sm169361705e9.33.2025.03.24.04.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 04:26:23 -0700 (PDT)
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
X-Inumbo-ID: d1ca1cba-08a2-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742815584; x=1743420384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IL+D97LwqZy6NUkik4VWtwwtkvEltgXEbuNKczi+Dqs=;
        b=KYOfmJAC0BtKoDTfEkXcsrQjk4sEkvob0coW8sRNN5O1mFWUWMKPXFik2MmYzyHaWR
         9sx+bhrvtC7t3qeo3B8QJ9APtFz2k2gXS8Tn9mqZ/7uYbxpZQ+ATDismv9AWJaDiRQVS
         0ex2my9eC14h7y9nmHKOlRbMZ7OuSUhpo8cReF46l+K/Fkk2jt1pdMIbqZ3d/RHLj+/F
         WwKY6k3XHEXSQcjwIldhOI0D80QvztxhmQSgbrfjlJPSL0JDyIubJQH1XaGZD+JSTngA
         hTSDhYfamA7mT1g59ikaSfioqg2Ysn3vluyTbmJkiMqLJ/S63m4gZDMvcAuQldqA18vR
         gMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742815584; x=1743420384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IL+D97LwqZy6NUkik4VWtwwtkvEltgXEbuNKczi+Dqs=;
        b=S7fAnBGizYtQqaXrS6/yjAMyIYW8fw2uxQ7UU5TKaUgA2k6y+DMABuZ17TVPbSIGx1
         693EoZUcKLwj7SZGT/t3ZTq+wNED7X3SgVlRgwR4ug7RFrEH7KB8D0BwpL4hYnB9j/o0
         LPf76L2+gnfcZ0fi4XbwYYVbH2FYb/MKrMi6ipzpB3ujzERU2iHYWB2KJc6bsJzNp4de
         OjxOPDozahbU7oLyJkr0owSltmi5zw/YLfHRKDucR+1Yg8oMBK56K2952TySzCe6IT5B
         otwPobRJfA1IEmZ7H+4efbswbVtUG2NvgNlwtf1t5WpVRdtGJUqlhj+d43CtN0Z30Vgj
         0MGA==
X-Forwarded-Encrypted: i=1; AJvYcCWDowO2kIFqRIs985o3KCjbqNcBn34fNciCdLeJU7z4nQkYj2twIBtpikECilOeEUGNSfRY3cvyYGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpxwOkEcdyaAc92HWUSPmG1Uq/vF2LhYO/K77ZzKFACfjn3qQZ
	BA0zhjFgC1pA4nTjGv9Cjo7bqyNO/7Xdp/eSwAs7i2AlPPpYndPUsGeaeanR7A==
X-Gm-Gg: ASbGnctu/36/UtVK+Ye5w1RlXK9T/9gf1cdoRnMM9t6Uh9i3GwDa2d+wYY9ZmGGmWgH
	pMXdNxS4CroCTSp/vYGO+DmHdGbPFyUK6666jx9JcedMemqfTmhtQv5EAVu6y5XHNyuUGCYm35E
	1yid0UPbtHsjieijB7CR14ymo0ak7GKl/5OlOQKSLHU8E9+1d1HRuskbK+LG+yGel/rS7OfNF0O
	DuaNSRqJjbISxEOfZWuha3f0YDySwL5M50QTt3Qh7iPh+l7PJUAAVKhoVLVapT35d/9TB3UzsUb
	bmRJMXAiGxjs4XTI1shR6RGlGpXnCwxzJAti3g1ycs3x2ivGGaJWrhiPkuiFizP8gJuPogA87ir
	zdFg4SHuBgremUxUQwcBnEBmZavmuzw==
X-Google-Smtp-Source: AGHT+IHAtT277OXKvAGGh+haK75uTP/GgvDWP4wBXrPc3QDY18CpD1rovHV4ERw49cqpk/qXrbOQOw==
X-Received: by 2002:a05:600c:1ca4:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43d50a3a75bmr122470185e9.30.1742815583998;
        Mon, 24 Mar 2025 04:26:23 -0700 (PDT)
Message-ID: <28e23122-6cfd-464d-99f4-4ac45b8b79d0@suse.com>
Date: Mon, 24 Mar 2025 12:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 1/2] 9pfs: add fstat file operation hook
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20250321093145.17882-1-jgross@suse.com>
 <20250321093145.17882-2-jgross@suse.com> <Z99PXOXocyuZtf_X@begin>
 <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
 <abce7ac0-21bd-409c-bc4c-f08d04a5a5d1@suse.com> <Z-E0TUu_LWkXt-wI@begin>
 <2fa05dd3-c5ae-4e72-b42d-260433590187@suse.com>
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
In-Reply-To: <2fa05dd3-c5ae-4e72-b42d-260433590187@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.03.2025 12:18, Jürgen Groß wrote:
> On 24.03.25 11:30, Samuel Thibault wrote:
>> Jan Beulich, le lun. 24 mars 2025 11:21:48 +0100, a ecrit:
>>> On 23.03.2025 15:57, Jürgen Groß wrote:
>>>> On 23.03.25 01:01, Samuel Thibault wrote:
>>>>> Juergen Gross, le ven. 21 mars 2025 10:31:44 +0100, a ecrit:
>>>>>> Add a file operations fstat hook to the 9pfs frontend.
>>>>>>
>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>>> ---
>>>>>> V2:
>>>>>> - or file access mode into st_mode (Jason Andryuk)
>>>>>> ---
>>>>>>    9pfront.c | 29 +++++++++++++++++++++++++++++
>>>>>>    1 file changed, 29 insertions(+)
>>>>>>
>>>>>> diff --git a/9pfront.c b/9pfront.c
>>>>>> index 1741d600..7257a07e 100644
>>>>>> --- a/9pfront.c
>>>>>> +++ b/9pfront.c
>>>>>> @@ -85,6 +85,8 @@ struct file_9pfs {
>>>>>>    
>>>>>>    #define P9_QID_SIZE    13
>>>>>>    
>>>>>> +#define QID_TYPE_DIR   0x80     /* Applies to qid[0]. */
>>>>>> +
>>>>>>    struct p9_header {
>>>>>>        uint32_t size;
>>>>>>        uint8_t cmd;
>>>>>> @@ -950,6 +952,32 @@ static int write_9pfs(struct file *file, const void *buf, size_t nbytes)
>>>>>>        return ret;
>>>>>>    }
>>>>>>    
>>>>>> +static int fstat_9pfs(struct file *file, struct stat *buf)
>>>>>> +{
>>>>>> +    struct file_9pfs *f9pfs = file->filedata;
>>>>>> +    struct p9_stat stat;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
>>>>>> +    if ( ret )
>>>>>> +    {
>>>>>> +        errno = EIO;
>>>>>> +        return -1;
>>>>>> +    }
>>>>>> +
>>>>>> +    buf->st_mode = (stat.qid[0] == QID_TYPE_DIR) ? S_IFDIR : S_IFREG;
>>>>>> +    buf->st_mode |= stat.mode & 0777;
>>>>>> +    buf->st_atime = stat.atime;
>>>>>> +    buf->st_mtime = stat.mtime;
>>>>>
>>>>> Should we perhaps also fill st_ctime? Leaving it at 0 could surprise
>>>>> other software layers.
>>>>
>>>> I can set it to the same value as st_mtime.
>>>
>>> Maybe the smaller of atime and mtime?
>>
>> That'd be better, yes.
> 
> According to the references I could find ctime is changed whenever
> either file contents OR file status (uid, gid, permissions) are
> modified. So using the same value as mtime seems appropriate.

Hmm, yes, one always learns something new. Having come from the DOS/Windows
world originally, 'c' in the name to me only ever could stand for "create".
When really, as you say, it's "change". I'm sorry for introducing confusion
here.

Jan

