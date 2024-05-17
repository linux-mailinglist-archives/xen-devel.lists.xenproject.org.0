Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850A18C8124
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 09:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723831.1128928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7raz-0005M5-Rn; Fri, 17 May 2024 07:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723831.1128928; Fri, 17 May 2024 07:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7raz-0005JI-OZ; Fri, 17 May 2024 07:01:37 +0000
Received: by outflank-mailman (input) for mailman id 723831;
 Fri, 17 May 2024 07:01:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7ray-0005J7-VI
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 07:01:36 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cd048c9-141b-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 09:01:35 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a1054cf61so473541366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 00:01:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01598sm1091572566b.178.2024.05.17.00.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 00:01:34 -0700 (PDT)
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
X-Inumbo-ID: 4cd048c9-141b-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715929295; x=1716534095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBG75lcdtAlTkY8FLRz4q0hO7wLgWZckS6elinM+HvQ=;
        b=Jli8GZOrXky/s/O46dppWO6pMrVC7lFc7cVoDXEXPjs4oWmzA58rkJuZvfxCVn33bP
         efrNEvbVEwC7GjHh6Jk0iXBdK0PghUqc8H8MhMcd7wmICciFLqy1oRp3Z6eSX2yYQjnk
         +ujn3e/rwsbrksVYNnUcoD50a/4G3M+tyVLhI+8O+Ylo4HSu1MAU6OXh2EJA5QIFWCMq
         ZBEuqx7sTsmfvga8Ucgb00QzYhje+W0FTtcaotkvrHgo82iuoF7C6iVEHeWulBDo9PwG
         7Fe39hRS3fw+RW/zFmU/gugTwqbTHGwsYFDEUeilzk9wlf7r8BI3w0Jv6jp+stmtSvdk
         oMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715929295; x=1716534095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBG75lcdtAlTkY8FLRz4q0hO7wLgWZckS6elinM+HvQ=;
        b=dHkBVHHnP51Aevw9P8Onpy/7PgKg+NAWE3mhuEF+10EPO2MRppYEdoswLez8fwzFcO
         yyz1DFgIkCCYISOgPKCpA63Wxr0uvdL1ZC3VqRPH9uaC1XqSeQo6gsUTeHrc5HKIzDbP
         CrZL2DV6aQB/yCwmDdeXwHsAA/0imMOWbMENhTMtFqSAtmcPAXk3N1XMU+hb0kRS176j
         CvTsq+5y0K32BRvBwFa8bWQiDOBT2Eyi5rquLzogsXW8Rp1t9F2WWEUgnpIXs8nrBHFj
         ysQ9gU9QO9f6FqsSS0IBpFAiu5MdhZOo2roxLYQfV2l4TGFh2q/kEjoG+D0+t1wUQgaQ
         gWTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp+PHOjEVfz1jgpeztasrTd0Olr1khhO3r/YQ0nWt0UnI+iSo556ID8LvuyiYBE6UnZz625OQFQKmMwneQQjvd9aUbH2EaY7egT17PWhI=
X-Gm-Message-State: AOJu0Yz8Aav+mhN6smjcEhfJLmh5ZERq1AZw+/edvFg2e0GqBk7LIAxJ
	SjQ3VcxBR/Q+4XFukdL3uiofHXAhxvvfWV0YpH5KfkxT0vaIo9ke8yuR6mwirA==
X-Google-Smtp-Source: AGHT+IEoIsORyWeGFwAyH+EOBDjJhJDuTDwtidrBdXnxnTZ+yPh9wAoHGMfUoU2k3zO376d/hz5Lsg==
X-Received: by 2002:a17:906:3c10:b0:a59:cc9b:d6f8 with SMTP id a640c23a62f3a-a5a2d5cca1cmr1942070966b.39.1715929295152;
        Fri, 17 May 2024 00:01:35 -0700 (PDT)
Message-ID: <afac644e-240f-47b6-be01-699b05e853dc@suse.com>
Date: Fri, 17 May 2024 09:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
 <ccd70c8f-1381-43f7-8be8-edc1dd505ce2@suse.com>
 <9249bc7e-7ca9-4f6e-8f3e-f2962c14e306@xen.org>
 <66ac3d6aaf0e393ce76580f274c222d26c0aa0a1.camel@gmail.com>
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
In-Reply-To: <66ac3d6aaf0e393ce76580f274c222d26c0aa0a1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 21:15, Oleksii K. wrote:
> I am not deeply familiar with the technical details surrounding XSM,
> but if I understand Daniel's point correctly, the original change
> violates the access control framework. This suggests to me that the
> revert should be merged.
> 
> However, I have a question: if we merge this revert, does it mean that
> using channels a user ( domain ) will be able to get information about
> certain events such as EVTCHNSTAT_unbound, EVTCHNSTAT_interdomain,
> EVTCHNSTAT_pirq, EVTCHNSTAT_virq, and EVTCHNSTAT_IPI (based on the code
> of lseventch.c)? Is this information really so critical that it cannot
> be exposed for some time until a patch that changes the XSM policy
> consistently is provided and merged?
> 
> If this information is indeed critical and should not be exposed, I
> think we can consider Daniel's suggestion to add a check to the dummy
> XSM policy as a solution.

The question isn't whether it's critical. As pointed out elsewhere, my
view is that any exposure of information needs to come with a proof that
nothing undue can be derived from that information. I see Daniel has
responded there, so we'll continue the discussion there.

Jan

