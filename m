Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83FEB38923
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 19:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096664.1451300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKQZ-00024R-Mu; Wed, 27 Aug 2025 17:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096664.1451300; Wed, 27 Aug 2025 17:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKQZ-00022P-Ij; Wed, 27 Aug 2025 17:59:19 +0000
Received: by outflank-mailman (input) for mailman id 1096664;
 Wed, 27 Aug 2025 17:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AuO=3H=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1urKQY-00022J-BW
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 17:59:18 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bf2480a-836f-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 19:59:16 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b0bd237so467345e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 10:59:16 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3caf9b2190dsm9337215f8f.45.2025.08.27.10.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 10:59:15 -0700 (PDT)
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
X-Inumbo-ID: 8bf2480a-836f-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756317556; x=1756922356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TSx0gLOeLI3OmpM0gOjKyE3N0RJITp6fwERr5jtp5VA=;
        b=iLZAO7W0P2AMEHwoi6eNqJR5MicUx/kBIkroNVzidE552+zbmSQ/hhKSYAtr0vgZxu
         pKoJfRW3YhFskhGMiZsaOVoUpb+s3RddInv4LihA4nv+Cjwv/WjR98XCZcmQ/qlqw6BY
         +KL/6ZTkA7uyntgUU93EZ81yySKZMI5Zq+BpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756317556; x=1756922356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSx0gLOeLI3OmpM0gOjKyE3N0RJITp6fwERr5jtp5VA=;
        b=lfAxazKu2Uj2+p9uRomk+zLAAykrpPvNL0cX0r19z9Mram8RFBGtupAsxin4zNHowa
         4C85dGy1v4EQKuFkxP6Gd2ZglVvp9as2tPzVUrgZV2ADkAk+9xxo2tsElKm/dnr4PJgL
         bsxlU6tCth5S9zm3rsZiRLCPQEFbTD3wLe+52W5lLvkmwTQ9twFU0zYmXORkfoONd7/f
         xRQTeCpVN95dinTOCLf4hPOKvWlKGM6XBBYPmeGLsP0nc5KDvH5a5zxmrB1zvkBWekTC
         PGZwtuRJkR2G2VhHYpQZ4lOCoEdClN3LtqTXXd5G/6y7rYIsZJnwwDKlv8A4V7exaTdD
         7Muw==
X-Forwarded-Encrypted: i=1; AJvYcCWsN7+2k/e9Ke45AX5+ILZh+GTKrDdJekTlfpbeTuCyhiLUn7MnSwMhjdDQ0y0/tokJKNUGjSdAMnA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1NDugkc/cWYEU7jnKQ8P3NtWuX/Evx7mqGWIQWl5UtiPWoU3U
	yoLDucDSozz3IuzWxEEaPen+q/fUKDXGtklDJDazS/DAfGTCAoQWYRda0GIMN8Tg79s=
X-Gm-Gg: ASbGncvtYmz76a9NmlJQwfDH66135cMcmUj+PQMEUq5hqZiTq02WhRCoPBXwfXeLy95
	PF2hqzTVyrVKTZ9QOHO45UFcC97a8Uh+Cl42UuoFX9UMTy08aeTGHIW3io8oNTW4CkonC1fSEPs
	HkQk+JsBYLCR6PEjO5iB9K+MLuUT/Ja9+IR2yXpEw4Zk9GWeBLhJQye2sUThoG9EKPURWYRMgQ/
	94zArVi6kBZTX70y/58n92nTUX8kFeEDvZ56+sgT5kWAK33yM5GjVUYB5eAZPpnZnnb/JTDV5IM
	gmbg7eiEoy0s5p8pbS4CSLVj5kPfAkBSeYdS82CZvFG3omOR5zR/Igk941+IljU3cVZsYZ73J6D
	aV1SC12npZ3mtwlAuCG78ue85CXn3l0OzgC5wZfDIeSYfBxoRYlfCLQSpp0teX8q5c88lPpJf7Q
	nSlhE=
X-Google-Smtp-Source: AGHT+IGKmdlrraertGvlRZkPchDGUneti/cR6b6X7gyOPv7F/SrFWVkostS9gjgaeR1jrCEhDTo80g==
X-Received: by 2002:a05:600c:5493:b0:459:dc81:b189 with SMTP id 5b1f17b1804b1-45b517d3998mr203579225e9.31.1756317555562;
        Wed, 27 Aug 2025 10:59:15 -0700 (PDT)
Message-ID: <eae86371-51f6-4df3-8ca3-723303864126@citrix.com>
Date: Wed, 27 Aug 2025 18:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 07/11] libxl: libxl__object_to_json() to json-c
To: Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-8-anthony@xenproject.org>
 <05c49cee-d783-40e3-a4ce-da724c308a21@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <05c49cee-d783-40e3-a4ce-da724c308a21@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2025 6:51 pm, Jason Andryuk wrote:
> On 2025-08-08 10:55, Anthony PERARD wrote:
>> From: Anthony PERARD <anthony.perard@vates.tech>
>>
>> - libxl changes:
>>
>> While doing so, we rename all "*_gen_json" function to "*_gen_jso" as
>> they have different prototype. All the function pointer are been cast
>> to (libxl__gen_json_callback) by "gentypes.py" when generating
>> "*_to_json()" functions.
>>
>> We also introduce a few more "*_gen_jso" functions for "int" and
>> "bool" because we can't use json_object_*() functions from json-c
>> directly like it's done with yajl.
>>
>> To make the generation of _libxl_types*json.[ch] with both YAJL and
>> json-c we add "--libjsonc" to gentypes.py so it can generate
>> functions/types for both.
>>
>> Also introducing "jsonc_json_gen_fn" in the IDL, to be able to point
>> to a different function when using json-c.
>>
>> Also, don't export any of the new *_gen_jso() function, at the cost of
>> having "_hidden" macro in semi-public headers.
>>
>> - xl changes:
>>
>> Also, rework the implementation of printf_info() in `xl` to avoid
>> using libxl_domain_config_gen_json() which isn't available without
>> YAJL. The implementation using "json_object" call
>> libxl_domain_config_to_json() which generate a plain string of JSON,
>> which we parse to add it to our own json; this avoid a dependency on
>> the json library used by libxl.
>>
>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
>
>> @@ -358,6 +535,36 @@ int libxl__mac_parse_json(libxl__gc *gc, const
>> libxl__json_object *o,
>>       return libxl__parse_mac(libxl__json_object_get_string(o), *p);
>>   }
>>   +#ifdef HAVE_LIBJSONC
>> +int libxl_hwcap_gen_jso(json_object **jso_r, libxl_hwcap *p)
>> +{
>> +    json_object *jso;
>> +    int i;
>> +    int rc = ERROR_FAIL;
>> +
>> +    jso = json_object_new_array();
>> +    if (!jso) goto out;
>> +
>> +    for(i=0; i<4; i++) {
>
> typedef uint32_t libxl_hwcap[8];
>
> I see this is the same as the yajl implementation, but should this be 8?
>
> The remainder looks good:
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

A tangent, but physinfo.hw_cap (which libxl_hwcap wraps) is as good as
stack rubble.  It's not exactly random data, but it is a view of an
internal Xen structure which has been reformatted multiple times before
we even realised it was exported, then continued being reformatting it
because it's a gross laying violation that noone could possibly be using
anyway.

It needs purging from libxl and the sysctl interface, and if that makes
JSON easier, then lets get it done.

~Andrew

