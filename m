Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C38A96A55
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 14:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962626.1353802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Cxg-0007rQ-5u; Tue, 22 Apr 2025 12:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962626.1353802; Tue, 22 Apr 2025 12:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Cxg-0007pu-3A; Tue, 22 Apr 2025 12:42:52 +0000
Received: by outflank-mailman (input) for mailman id 962626;
 Tue, 22 Apr 2025 12:42:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Cxe-0007dt-9g
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 12:42:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c78fe5c-1f77-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 14:42:49 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso3122228f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 05:42:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39f069df9fcsm9903574f8f.16.2025.04.22.05.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 05:42:48 -0700 (PDT)
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
X-Inumbo-ID: 4c78fe5c-1f77-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745325769; x=1745930569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eVU4F1fI1UbsJWlfx7arzsz0Bq7z0pnhG8f2SQJ7/7k=;
        b=F745PGTHERtYksxNmooF+f80F2O9ZlMdKUUvtFIfdBvfHvzB/3B7TUfHu/lSGdVGce
         jKAh9iTtAuD1VhBQfWaE61FVw9nA8REsp83nEhTMK2TTb/wJg8PBRyeaQ3c6bIQ2RRye
         AeczrMIU04SKWfMUVd8xnFDQv/uGM/r9KAAn01F8ocwe7kGZUGelqhDlttRivE+7bLVB
         I+eltV74DB3fXd1/38J6p3gftXaKTpCh2wHBpHVBSCZ6skCx8KBYMokt3DzAZID/UQj9
         kuBYuj5oPh4ut88x+yIFL1walEDRx4/tpEz47uFVJtdGsMHWztJnYWi4Hl4dYnaO8+fp
         SoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325769; x=1745930569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVU4F1fI1UbsJWlfx7arzsz0Bq7z0pnhG8f2SQJ7/7k=;
        b=TQvXVNDulFLlDBa213OmKRBDqjrbddGxb0/9KCiMeNDtJMicl9RXUuGSPisj88erAX
         /D6H/D6gA3nMLU8y1sjIZjtvSAdkrngrQ9RhSKo7gzc4gPNiBffF041Ap7CXXImli13k
         jkujD6TdxbLQwzpnAvCKVz1U1UismGlx3KCJBqXA+M4hNh7dX8upkFU8bTwWIogVIaOs
         YLTOyXO7MBSzxayr2UAGjbU0tqT6+fFq1rTAkzEqHl4jn5btb3wBGsMnDdqQe2SqKI1J
         1Nuwg4BwlMDiIMch1Q+IzgyxOr7T28avvfkEpSxDXYRospTnKsIWQlDl04a0r3Y8lPx2
         c+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWlk1WwVzF1wBNvGk9VCw31ZbxZHjpE7dHFUmyiD5PNabysUp/PLS18fIPGS/Woc0Nup/VI71aVRQs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJYa7Ue7AL5pdnZCf43HHE04kzY1PQ8U2TezFaAqXCydprA20K
	34r9lpYRd3thzKEeZjl0xm3DeYOjpXmodzyZ9TsySkucQFErS1nd7vDSZTfFDg==
X-Gm-Gg: ASbGncvHHYO6p9PUv5EdR5rh4JtImJzJvGIsDH2qrUjxoLQ4FpmxFY/llZ5+asGBR1M
	Kp9mm3niebpmPMq3qrU3Ij2hpxckHoPlY3XWg6ttm/cM5gI6PEAK1kOVaClV50kIki/M5SiyI48
	IcEl7iiByZ3oMuvLasAwRcMF2xKYugKTX6UNFshrYAcCKk+n5rUqOl6LJEP+9BbwnlGCrewvZUr
	ttttWbwLNKUfhaZWpMJwRNwdffWDyMmYgT/l3ne4PK4fbr9DvOIRFeisur/A8I3Wi2kLEypLkxo
	9OgFoACBPdlsZi5E6Zs13t+Hq/wXw66hMrtmf5w36hx9B66aSl0JD8avyCy/ZicLq4yerWBe8vK
	qMPSaV+S2bcDisczQtnhDVE5gXw==
X-Google-Smtp-Source: AGHT+IHw5Mh/xN4Cg1cH1m8YrsqUquwKdRO7rJjE74W0xDJE6yapOttEyX2hh50/GLYscHMbgZpBGA==
X-Received: by 2002:a05:6000:40ce:b0:39e:cbd2:9211 with SMTP id ffacd0b85a97d-39efbaf70b4mr10913809f8f.55.1745325768749;
        Tue, 22 Apr 2025 05:42:48 -0700 (PDT)
Message-ID: <603614cb-186c-4d29-93a5-2044575ed469@suse.com>
Date: Tue, 22 Apr 2025 14:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250422113537.1286981-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250422113537.1286981-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 13:35, Andrew Cooper wrote:
> All supported toolchains now have it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



