Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B63C90FD66
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 09:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744207.1151217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKC1d-0006yO-4w; Thu, 20 Jun 2024 07:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744207.1151217; Thu, 20 Jun 2024 07:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKC1d-0006vJ-1y; Thu, 20 Jun 2024 07:16:05 +0000
Received: by outflank-mailman (input) for mailman id 744207;
 Thu, 20 Jun 2024 07:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKC1b-0006vD-SK
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 07:16:03 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2ff7c48-2ed4-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 09:16:01 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so6088351fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 00:16:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f98f901bebsm47366065ad.270.2024.06.20.00.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 00:16:00 -0700 (PDT)
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
X-Inumbo-ID: f2ff7c48-2ed4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718867761; x=1719472561; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzY7zpKwp+2V7MnSg8866k/lTCL+uP60ivG63flXUp0=;
        b=Goeh1T1noIt8GblXUbYFSM0yeTa/GkyP0E+rCgNvevIfHP9ve8UtXHA31AMHjTAAQ9
         6pg4fdMFQY4rWPaEGoQ2KB9UiWOU6iJXHljejhVzUjY7z/MPp2WDeitU84ku9YRRVObq
         8mUiEnxF3DiNfJnsPrBuGYvjOzcNK57/bvf7sIaX8nS4o7OeNzRpP4tpFcgEtyLObX26
         M0C3mz+QWR5Q5+qvoNixPPqyscLxKEoSWtb9259IEmPTVf3rFSLa8Zyq+cNeRSYkERQU
         pZgJ8/dON1UEWdNRHR8LT5MF+bEZN+8tb3yfuxmQUpI640TOnYiScYaHscxelRhCFBrQ
         ZFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718867761; x=1719472561;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzY7zpKwp+2V7MnSg8866k/lTCL+uP60ivG63flXUp0=;
        b=TzfgEwj5YRQnwXnQSqMMFB6SrxPPgNFPChXMK/UJO5XA/gzl8FSJRnzX0GSK1gwIwH
         VTYg2uT9cgHazgE5vFkyzfUnG+rP0k+ot1ZW8mjeens2wchfbJ+oYEFlJwUXYWPh7HuB
         0f/tUWGBylE2+j1rD+Hv9dvCgePZaknrErl/QoxVYjBIvU6mvvE78oAZ9YxnAncJ+q77
         gHZjWZqXKKP5qPALYHn63C/GKinHEJep17/yzZtnR0Zff3GQq+p1wzUenn6gLwqhuZkn
         jCHGoKbH2KYMEGHNgJR7au/0B5liwLmp0F0vQCCigDtxQuowl++EOnU9hI943l9UBiHG
         iXhw==
X-Gm-Message-State: AOJu0YxfTPxT34/Dt8GpgIDdZsB8WdmVfw6ILuWbujrCMx4ksL5Mvz2g
	ToCzy9TcEl4IDGptRptPCmuDiC7JrbQaHTym2y1HGonI9w8WwzSWwn2JCTbqUqhAKW4gXipxWIk
	=
X-Google-Smtp-Source: AGHT+IFDm6fLNOgm7wnljcX2/bhvMfMim2CP8gqUWv1J9qZ69rJa+phOyMeXII1C6Otbxsfh8fmB5A==
X-Received: by 2002:a2e:a26c:0:b0:2ec:3daa:f0b4 with SMTP id 38308e7fff4ca-2ec3daaf51bmr29655061fa.12.1718867761177;
        Thu, 20 Jun 2024 00:16:01 -0700 (PDT)
Message-ID: <a4d780fd-90c2-405e-be21-c323a22a78c6@suse.com>
Date: Thu, 20 Jun 2024 09:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.19] livepatch: use appropriate type for buffer offset
 variables
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As was made noticeable by the last of the commits referenced below,
using a fixed-size type for such purposes is not only against
./CODING_STYLE, but can lead to actual issues. Switch to using size_t
instead, thus also allowing calculations to be lighter-weight in 32-bit
builds.

No functional change for 64-bit builds.

Link: https://gitlab.com/xen-project/xen/-/jobs/7136417308
Fixes: b145b4a39c13 ("livepatch: Handle arbitrary size names with the list operation")
Fixes: 5083e0ff939d ("livepatch: Add metadata runtime retrieval mechanism")
Fixes: 43d5c5d5f70b ("xen: avoid UB in guest handle arithmetic")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1252,7 +1252,7 @@ static int livepatch_list(struct xen_sys
     list->metadata_total_size = 0;
     if ( list->nr )
     {
-        uint64_t name_offset = 0, metadata_offset = 0;
+        size_t name_offset = 0, metadata_offset = 0;
 
         list_for_each_entry( data, &payload_list, list )
         {

