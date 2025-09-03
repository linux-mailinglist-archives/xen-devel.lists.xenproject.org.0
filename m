Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E682B415AB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 08:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107885.1458079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uthPL-0006Ju-9f; Wed, 03 Sep 2025 06:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107885.1458079; Wed, 03 Sep 2025 06:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uthPL-0006HS-70; Wed, 03 Sep 2025 06:55:51 +0000
Received: by outflank-mailman (input) for mailman id 1107885;
 Wed, 03 Sep 2025 06:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uthPK-0006HM-5j
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 06:55:50 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05eddf29-8893-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 08:55:49 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61cf0901a72so9458793a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 23:55:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c77f9sm11314824a12.8.2025.09.02.23.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 23:55:48 -0700 (PDT)
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
X-Inumbo-ID: 05eddf29-8893-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756882548; x=1757487348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+D0dgYdAzqhdFgfDa05EDsaAPryxTBJIiIfAW4Tgdds=;
        b=Rbl+SM3UVV84yAUErKQnNhZE2qjvF2xyOIPGIAOtzBE9M4Bk3EDsCBMQbWOhRsz+vH
         JUBFxWS6ZuSxDEEMzcmvmcHTaEF6UaxLuuAkMDZIde+WmNIVc6L70CYvRfeyp9mHZv5p
         UP804th21BbXVMeM07oPYuhmwpd5uFnoDArLyfzs48C/67oQVkCBrOyKYvZhsu0QZo0M
         nmmltFqbHU6/6KcuJhxL5lf0cRiwF1Geip/43w93RdNiDlQq0fbs2RfybUwulNO2C76e
         QtjrMQrqqJKgu1jFO7+vNxXR90bBovHIJeSeSgYDoNGT0tbfLsItt2MDj5/o4hjEzPJg
         JmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882548; x=1757487348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+D0dgYdAzqhdFgfDa05EDsaAPryxTBJIiIfAW4Tgdds=;
        b=t2k6vrs4CwmP9dwbL9iO5RlkYYJiGCkrPOJ7I2t0WaEJEtf3X6zm06Ta+bX51fjx2J
         paRjdovXZzT4+Wvua1WqwMXY4KTIch/h1APfBGHwBKWTnLKFw6TMP8Ek5oHrFT219EUv
         OzO4FEcT2Rwz3sigm77keggYiH92F8ZR7Ya4R0njylVeRGEb/WtIrdutfi6ThH/H+VZO
         Ae5tvOhNNJTItp9vINpyKlALJfVpvjtfapzQ7YWphJyk2dWzMMEXH3rph2FlFqHCugG0
         vRk8feN2qpwDLhVyVQYnvMgi5kvK40mqx8kkXi21WFwstsYQOuoB5BdLGtsu0nrzeY8R
         8QPg==
X-Forwarded-Encrypted: i=1; AJvYcCU6K/aiHpMXOXJ/ppyPvJ4Fad8Ddp5/tm1rE03tW52f8wQsPEtTLzwSDSA+QJj25m+IPDwDEwdhrks=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywz9dW0fpePA68GsbuMRbLOYVivndQIvpBypZmx26LTV8XM0Gni
	QmCcg6KBn2gMjc0P4ozaNXE28k24sbSvP0FWadZUEssRQveW0IwR5TIioz1VfMrHRg==
X-Gm-Gg: ASbGncuxIu/G+5g1jvAQlyNFasT811AV2EZ0k8fqbYE7IdmLrD1jBacv1yFT/dWM4jg
	DnKyNmRQlL4E/xaIrwydMfHtdrlc8LVrjc5rhbKDji51561+1ZypVxe6H1+G/D+a7mWzqNkNJ/8
	0dZ023nvue7vqwjZ0KaE3pZZK4htTlTzfO3c/nkrmT7urGwdDdvGL5GrMKVfKkOQRdEFFMSOM0e
	G0OlplejwxtlZmNoDSG5h0Qq/Tm22aM7zi4LYGYmvAnKxziPPQfEa+gJ9YcVWvoKxknK3RPWnpl
	uHeZImnpUV1yjUFGixLG/EU86A1DLNliJduDyDwP8Zg6S9loEstLO8LsUQccYGoUsuHmdLUCe9G
	JQXwdaFrNltroMcq+AuO1K5CIyMDCZgfaPeiQDmKqOMIk7qVNdUCnWubaO9CK/3cLfzJGMZLzn4
	tNktkrZ9hfsvk9FiGM2A==
X-Google-Smtp-Source: AGHT+IHK2NDAsCPqbNh7WJuIkTl1J7oIOgPZeqybWiy8KfApeyqh8zN7PazMPrt0sbnEHq8JmTjk0A==
X-Received: by 2002:a05:6402:5211:b0:61d:1d16:19b1 with SMTP id 4fb4d7f45d1cf-61d2699c0bamr12506353a12.14.1756882548418;
        Tue, 02 Sep 2025 23:55:48 -0700 (PDT)
Message-ID: <4f6c48af-a3aa-4609-a805-51867f01d99e@suse.com>
Date: Wed, 3 Sep 2025 08:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] releases: use newer compression methods for tarballs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b07e8b46-06b1-4f41-958a-d8739778c50e@suse.com>
 <f0ac2189-c117-4ce5-9a1f-174df898eefb@citrix.com>
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
In-Reply-To: <f0ac2189-c117-4ce5-9a1f-174df898eefb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2025 18:15, Andrew Cooper wrote:
> On 25/08/2025 2:54 pm, Jan Beulich wrote:
>> --- a/tools/misc/mktarball
>> +++ b/tools/misc/mktarball
>> @@ -5,14 +5,6 @@
>>  # Takes 2 arguments, the path to the dist directory and the version
>>  set -ex
>>  
>> -function git_archive_into {
>> -    mkdir -p "$2"
>> -
>> -    git --git-dir="$1"/.git \
>> -	archive --format=tar HEAD | \
>> -	tar Cxf "$2" -
>> -}
>> -
>>  if [[ -z "$1" || -z "$2" ]] ; then
>>    echo "usage: $0 path-to-XEN_ROOT xen-version"
>>    exit 1
>> @@ -21,14 +13,20 @@ fi
>>  xen_root="$1"
>>  desc="$2"
>>  
>> -tdir="$xen_root/dist/tmp.src-tarball"
>> +tdir="$xen_root/dist"
>>  
>> -rm -rf $tdir
>> +rm -f $tdir/xen-$desc.tar.[glx]z
> 
> This is asymmetric with the rm at the end.  I'd remove
> $tdir/xen-$desc.tar* here and remove the final rm.

Can do, but ...

> Looking at the uncompressed tarball is part of my process, and it was
> preserved previously.

... afaics none was ever generated previously. git_archive_into() piped git's
output into an "untar", and then the resulting tree was all that was ever
acted upon, with tar directly piping into gzip.

If we were retaining the uncompressed tarball, it wasn't quite clear to me
whether that might get in the way of the uploading process: We surely want to
upload only the compressed ones.

> With something along these lines, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks, but the above first need clarifying (at the very least because I would
want to somehow mention the behavioral change in the description, yet then
there may be none if my observation was wrong).

>>  mkdir -p $tdir
>>  
>> -git_archive_into $xen_root $tdir/xen-$desc
>> +git --git-dir="$xen_root/.git" archive --format=tar HEAD --prefix=xen-$desc/ \
>> +    >"$tdir/xen-$desc.tar"
>> +
>> +gzip -9k "$tdir/xen-$desc.tar" &
>> +xz -9k "$tdir/xen-$desc.tar" &
>> +lzip -9k "$tdir/xen-$desc.tar" &
>> +wait
> 
> Interestingly, this wasn't fatal for not having lzip, but the error was
> clear on the console given the reduced verbosity, and doing 3 at the
> same time worked very nicely.

Well, obviously, because the exit status is effectively lost for async lists.

>> -GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
>> +rm -f $tdir/xen-$desc.tar
>>  
>> -echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"
>> +echo "Source tarball in" $tdir/xen-$desc.tar.[glx]z
> 
> This was grammatically awkward to begin with, but is now pretty useless,
> especially combined with the set -x so it gets printed twice.
> 
> Something like this:
> 
> echo "Source tarballs:"
> ls -lah $tdir/xen-$desc.tar*
> 
> generates:
> 
> -rw-rw-r-- 1 andrew andrew  32M Sep  2 17:13 /home/andrew/xen.git/dist/xen-4.21-unstable.tar
> -rw-rw-r-- 1 andrew andrew 6.8M Sep  2 17:13 /home/andrew/xen.git/dist/xen-4.21-unstable.tar.gz
> -rw-rw-r-- 1 andrew andrew 4.7M Sep  2 17:13 /home/andrew/xen.git/dist/xen-4.21-unstable.tar.lz
> -rw-rw-r-- 1 andrew andrew 4.7M Sep  2 17:13 /home/andrew/xen.git/dist/xen-4.21-unstable.tar.xz
> 
> 
> on my system and is rather more useful IMO.

I was indeed wondering whether to do something like this, but didn't because
it again would have extended the scope of the patch. Now that you're asking
for it, I will. I won't pass 'a' to ls though, as the glob doesn't allow for
file names starting with '.'.

Jan

