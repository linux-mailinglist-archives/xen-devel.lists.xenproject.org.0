Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD02911B68
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 08:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745040.1152172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKXce-0001fB-Sq; Fri, 21 Jun 2024 06:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745040.1152172; Fri, 21 Jun 2024 06:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKXce-0001df-PC; Fri, 21 Jun 2024 06:19:44 +0000
Received: by outflank-mailman (input) for mailman id 745040;
 Fri, 21 Jun 2024 06:19:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKXcc-0001dX-Gy
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 06:19:42 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e415274-2f96-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 08:19:41 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec4eefbaf1so1957511fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 23:19:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511b1be5sm657812b3a.95.2024.06.20.23.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 23:19:39 -0700 (PDT)
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
X-Inumbo-ID: 3e415274-2f96-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718950780; x=1719555580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I+4uXk9pjJydHspDN4TTT8selrL52KkIcp4Wjx8MLnE=;
        b=TvpwYplXZG44eJoenlgqe6yIx/PDcRTVO4r7ZBW/tHLRVfmLFkpE/Mh5EJAGH9cFSK
         Zbar2Bc2KbqNMviuKXWbRG9NM6lj4Da2UAJAOXgcJrIbOl5X868/IgtBHy92gvuVC0FG
         eQDajh7rGwWFCt7pXOQFJFQtTBLGg3wKT7I4YgWy6+0hmGT9mcmIZruVBQvaxTSyyuRr
         agspCTgmuOKXPVWXMPOQBZTLLfYU0I1+LNKtCvq9VMB2q49QBZ9ZjFn5TUv5vMmXX0Nu
         tQGEBr/vWQ272J9F2qt+GCNgzsKe1gRdLQUj/SMRQAmdR2+/NBAvTanqpAJO8FinxGjI
         AhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718950780; x=1719555580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+4uXk9pjJydHspDN4TTT8selrL52KkIcp4Wjx8MLnE=;
        b=w+8iv6gOTVXssyZZMmFjmsz7ehJpn+ndsf4+Ts9WdzWeK3NKXuFQmm6CvvTJdKz7Yx
         7K85y1bq0zg18ZDLOijR7GQLGpW6v1lEvWIU9v0u2sw3kzKJU3Tsy47GRYA6pZYyofHu
         UDNNnryzeMmJ/cnMaG9oOe/u4Veoj7qTWi3AtrJPXv1W0MLa2plS1nc5kI0CRPjAOUAA
         pKVtgASO2E17Eb2oi5cLYP52/LDjovkre6efFV/qswGkLhfg1irgxiSKyatbqIDuJKiJ
         ebkep2UPE/2oTDgXvpVC0epS4+2dUKDRk+ADFyB7tVwmfsTWIMxZFvvrxr15rN2aumeX
         lK0g==
X-Forwarded-Encrypted: i=1; AJvYcCXnKobvtP91KHwFyfua0bgv36d9mknxyXc4Xe2gtBqPs0pVfW+dsrHGdobOoLdf6DAstVKe0OuVRrlYSzLWE4PYvjhtA/X/jr00voSpoMI=
X-Gm-Message-State: AOJu0Yxcc52uIBtQXVuNOGq4QKoZAin36etnr/BCmSCa2jefesH2Kdwk
	M1GN5zJMeBWg9Ru3vnMVkzbJKsee2UX1t2d2raQR5O5u2BzrBbN5uQDIX13kyw==
X-Google-Smtp-Source: AGHT+IHq8CTioOjEVgVaSbuv/pYjO5WJmSeHlxx6adgruOJtTNi5j3X75rwHIgK8h89syuwL0Dr7Yw==
X-Received: by 2002:a05:651c:1a1e:b0:2ec:3d74:88cc with SMTP id 38308e7fff4ca-2ec3d748a19mr50593391fa.20.1718950780389;
        Thu, 20 Jun 2024 23:19:40 -0700 (PDT)
Message-ID: <0e3f33b7-d4ce-4146-86d4-19a9d24ff6a3@suse.com>
Date: Fri, 21 Jun 2024 08:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: add explicit comment to identify notifier
 patterns
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <96a1b98d7831154c58d39b85071b9670de94aed0.1718617636.git.federico.serafini@bugseng.com>
 <058a6cc6-bf84-4140-a3fb-12ec648536b0@suse.com>
 <alpine.DEB.2.22.394.2406201808190.2572888@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2406201808190.2572888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 03:09, Stefano Stabellini wrote:
> On Mon, 17 Jun 2024, Jan Beulich wrote:
>> On 17.06.2024 11:49, Federico Serafini wrote:
>>> MISRA C Rule 16.4 states that every `switch' statement shall have a
>>> `default' label" and a statement or a comment prior to the
>>> terminating break statement.
>>>
>>> This patch addresses some violations of the rule related to the
>>> "notifier pattern": a frequently-used pattern whereby only a few values
>>> are handled by the switch statement and nothing should be done for
>>> others (nothing to do in the default case).
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> I guess I shouldn't outright NAK this, but I certainly won't ack it. This
>> is precisely the purely mechanical change that in earlier discussions some
>> (including me) have indicated isn't going to help safety. However, if
>> others want to ack something purely mechanical like this, then my minimal
>> requirement would be that somewhere it is spelled out what falls under
> 
> I know there is a new version of this patch on xen-devel but I just
> wanted to add that although it is true that this patch taken on its own
> it does not improve safety, it does improve safety because it enables us
> to go down to zero violations on rule 16.4 and then make the rule 16.4
> blocking in the gitlab-ci ECLAIR job.

And moving out of everyone's sight (unless specifically grep-ing for the
pattern) that then there are a certain number of sites where we're not
really sure.

Jan

