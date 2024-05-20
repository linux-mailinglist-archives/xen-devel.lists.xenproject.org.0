Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 737BE8C9F85
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 17:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726214.1130478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94oe-0004vP-Lw; Mon, 20 May 2024 15:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726214.1130478; Mon, 20 May 2024 15:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94oe-0004tt-JP; Mon, 20 May 2024 15:20:44 +0000
Received: by outflank-mailman (input) for mailman id 726214;
 Mon, 20 May 2024 15:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPfm=MX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s94od-0004tk-5C
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 15:20:43 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8463c5f4-16bc-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 17:20:40 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-792b934de39so234066285a.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 08:20:40 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2fca1dsm1193313985a.92.2024.05.20.08.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 08:20:39 -0700 (PDT)
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
X-Inumbo-ID: 8463c5f4-16bc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716218440; x=1716823240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j5yr6RF+mfbUu+tusE/e6Lc1Z8TDEpJfUPHupQq4vWU=;
        b=Y70l/Wcle724NXm76a+6GYPuNKYPR5R5l77BdyBJ30DkYUuBcHfTLLG21Q53EzqyE+
         uzrP1t55/RQRgRdm+xOEgABeK8B1u0lPYCcPoAZ0cdy7KKug5I7yCPrk+c1Ni3efwy4L
         +Ol8TfDcA1hM1nyruvnxKPDsC8Bh2W7vD8S+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716218440; x=1716823240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5yr6RF+mfbUu+tusE/e6Lc1Z8TDEpJfUPHupQq4vWU=;
        b=FvO1/+B2oylxoRURyOchI0gLGf176UUqDg8GVjOjWvRxCmqlkdA4dHKy9Z/yGY5VcE
         gFfMPrdcyLxz1E8athnTQP+xbE6UYemSBppdQNSULCFN7bhdoE6LZLA/OpiY/4Sxi8wT
         kDwv1GeIrf8cuHW+R9YMUGbizlya/foVYmcerNiO4z1bUl0XD59iPUMxDyCQSIfrAkMC
         Z5QalJIyp2QZSEu1KIv8Pd4BFa3KVPeWb6/xgh+68WOQACZf3Onnvf+UsABif60/kCiU
         FhSpcA+nSSs/eN9O+0yexASMmyhqiZTnFz3BZ7fmSvF84NNTZOrsxC59jOed3Ckxhy+U
         ZYzA==
X-Gm-Message-State: AOJu0Yw5JE21i2vx8iWLd/tFNUfEYkvDEC0zkigWipR4s1b8p0CSPwcf
	6X9vvqT0e8yfkxaAiJOnmrPExhHtc2pbjiecd76jaRxe1Ng594tZwLtCWhPdttg=
X-Google-Smtp-Source: AGHT+IF0RMlUvxAgDq1KPXVZiKCMcnuETfLF4/MLke8NcfLOvXtreXo+812+fzSo2yKt9z/67/XmYA==
X-Received: by 2002:a05:620a:2993:b0:792:9527:c162 with SMTP id af79cd13be357-792c75f1f79mr3694937985a.50.1716218439739;
        Mon, 20 May 2024 08:20:39 -0700 (PDT)
Message-ID: <32c1b1b0-6372-4c15-bf0a-cb946df236f5@citrix.com>
Date: Mon, 20 May 2024 16:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.5 3/4] tools/xen-cpuid: Use automatically generated
 feature names
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20240510224002.2324578-4-andrew.cooper3@citrix.com>
 <20240520143359.3376849-1-andrew.cooper3@citrix.com>
 <ZktnJ7XNxhdLOxdk@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZktnJ7XNxhdLOxdk@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/05/2024 4:07 pm, Roger Pau Monné wrote:
> On Mon, May 20, 2024 at 03:33:59PM +0100, Andrew Cooper wrote:
>> From: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Have gen-cpuid.py write out INIT_FEATURE_VAL_TO_NAME, derived from the same
>> data source as INIT_FEATURE_NAME_TO_VAL, although both aliases of common_1d
>> are needed.
>>
>> In xen-cpuid.c, sanity check at build time that leaf_info[] and
>> feature_names[] are of sensible length.
>>
>> As dump_leaf() rendered missing names as numbers, always dump leaves even if
>> we don't have the leaf name.  This conversion was argumably missed in commit
>> 59afdb8a81d6 ("tools/misc: Tweak reserved bit handling for xen-cpuid").
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
> Just one question below.
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Differences in names are:
>>
>>  sysenter    -> sep
>>  tm          -> tm1
>>  ds-cpl      -> dscpl
>>  est         -> eist
>>  sse41       -> sse4-1
>>  sse42       -> sse4-2
>>  movebe      -> movbe
>>  tsc-dl      -> tsc-deadline
>>  rdrnd       -> rdrand
>>  hyper       -> hypervisor
>>  mmx+        -> mmext
>>  fxsr+       -> ffxsr
>>  pg1g        -> page1gb
>>  3dnow+      -> 3dnowext
>>  cmp         -> cmp-legacy
>>  cr8d        -> cr8-legacy
>>  lzcnt       -> abm
>>  msse        -> misalignsse
>>  3dnowpf     -> 3dnowprefetch
>>  nodeid      -> nodeid-msr
>>  dbx         -> dbext
>>  tsc-adj     -> tsc-adjust
>>  fdp-exn     -> fdp-excp-only
>>  deffp       -> no-fpu-sel
>>  <24>        -> bld
>>  ppin        -> amd-ppin
>>  lfence+     -> lfence-dispatch
>>  ppin        -> intel-ppin
>>  energy-ctrl -> energy-filtering
>>
>> Apparently BLD missed the update to xen-cpuid.c.  It appears to be the only
>> one.  Several of the + names would be nice to keep as were, but doing so isn't
>> nice in gen-cpuid.  Any changes would alter the {dom0-}cpuid= cmdline options,
>> but we intentionally don't list them, so I'm not worried.
>>
>> Thoughts?
>>
>> v3:
>>  * Rework somewhat.
>>  * Insert aliases of common_1d.
>>
>> v4:
>>  * Pad at the gen stage.  I don't like this, but I'm clearly outvoted on the matter.
>> ---
>>  tools/misc/xen-cpuid.c | 16 ++++++++--------
>>  xen/tools/gen-cpuid.py | 29 +++++++++++++++++++++++++++++
>>  2 files changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
>> index 6ee835b22949..51009683da1b 100644
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -11,6 +11,7 @@
>>  #include <xenguest.h>
>>  
>>  #include <xen-tools/common-macros.h>
>> +#include <xen/lib/x86/cpuid-autogen.h>
>>  
>>  static uint32_t nr_features;
>>  
>> @@ -291,6 +292,8 @@ static const struct {
>>  
>>  #define COL_ALIGN "24"
>>  
>> +static const char *const feature_names[] = INIT_FEATURE_VAL_TO_NAME;
>> +
>>  static const char *const fs_names[] = {
>>      [XEN_SYSCTL_cpu_featureset_raw]     = "Raw",
>>      [XEN_SYSCTL_cpu_featureset_host]    = "Host",
>> @@ -304,12 +307,6 @@ static void dump_leaf(uint32_t leaf, const char *const *strs)
>>  {
>>      unsigned i;
>>  
>> -    if ( !strs )
>> -    {
>> -        printf(" ???");
>> -        return;
>> -    }
>> -
>>      for ( i = 0; i < 32; ++i )
>>          if ( leaf & (1u << i) )
>>          {
>> @@ -327,6 +324,10 @@ static void decode_featureset(const uint32_t *features,
>>  {
>>      unsigned int i;
>>  
>> +    /* If this trips, you probably need to extend leaf_info[] above. */
>> +    BUILD_BUG_ON(ARRAY_SIZE(leaf_info) != FEATURESET_NR_ENTRIES);
>> +    BUILD_BUG_ON(ARRAY_SIZE(feature_names) != FEATURESET_NR_ENTRIES * 32);
>> +
>>      printf("%-"COL_ALIGN"s        ", name);
>>      for ( i = 0; i < length; ++i )
>>          printf("%08x%c", features[i],
>> @@ -338,8 +339,7 @@ static void decode_featureset(const uint32_t *features,
>>      for ( i = 0; i < length && i < ARRAY_SIZE(leaf_info); ++i )
>>      {
>>          printf("  [%02u] %-"COL_ALIGN"s", i, leaf_info[i].name ?: "<UNKNOWN>");
>> -        if ( leaf_info[i].name )
>> -            dump_leaf(features[i], leaf_info[i].strs);
>> +        dump_leaf(features[i], &feature_names[i * 32]);
>>          printf("\n");
>>      }
>>  }
>> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
>> index 79d7f5c8e1c9..601eec608983 100755
>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -470,6 +470,35 @@ def write_results(state):
>>      state.output.write(
>>  """}
>>  
>> +""")
>> +
>> +    state.output.write(
>> +"""
>> +#define INIT_FEATURE_VAL_TO_NAME { \\
>> +""")
>> +
>> +    for name, bit in sorted(state.values.items()):
>> +        state.output.write(
>> +            '    [%s] = "%s",\\\n' % (bit, name)
>> +            )
>> +
>> +        # Add the other alias for 1d/e1d common bits.  64 is the difference
>> +        # between 1d and e1d.
>> +        if bit in state.common_1d:
>> +            state.output.write(
>> +                '    [%s] = "%s",\\\n' % (64 + bit, name)
>> +            )
>> +
>> +    # Pad to an exact multiple of FEATURESET_SIZE if necessary
>> +    pad_feat = state.nr_entries * 32 - 1
>> +    if not state.names.get(pad_feat):
>> +        state.output.write(
>> +            '    [%s] = NULL,\\\n' % (pad_feat, )
> One likely stupid question, but since my understanding of Python is
> very limited, why do you add the comma after pad_feat?  There's no
> other parameter to print.

It's a common python gotcha with %.

>>> a = (1, 2)
>>> "%s" % a
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: not all arguments converted during string formatting
>>> "%s" % (a, )
'(1, 2)'

You should always pass % a tuple, even a 1-element tuple, so it does the
right thing when you're not sure of the type of the thing being printed.

~Andrew

