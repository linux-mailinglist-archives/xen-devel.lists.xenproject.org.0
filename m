Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C2918210
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748840.1156764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSVh-00088X-EW; Wed, 26 Jun 2024 13:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748840.1156764; Wed, 26 Jun 2024 13:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSVh-00086Z-Bt; Wed, 26 Jun 2024 13:16:29 +0000
Received: by outflank-mailman (input) for mailman id 748840;
 Wed, 26 Jun 2024 13:16:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMSVg-00086T-0k
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:16:28 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a8bb9a9-33be-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:16:26 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso88522231fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:16:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f0406sm98763955ad.37.2024.06.26.06.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 06:16:24 -0700 (PDT)
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
X-Inumbo-ID: 4a8bb9a9-33be-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719407785; x=1720012585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KjxqHsGx4EEy2APqZvmGLSEquu3aI3gQZaw2aQDpMoo=;
        b=Tnx/VOIL8qD7md3gn1hQWeJrMtSUy91l+1Cptilp4Ys1MRCxEP67KuyGyHPFtEapff
         liGbhk9fgRNy+UvDQDSOe0/9S/PAO1G0f0gon6JqDOKHP2PuvbYLbCuNfmur0jw6QtcA
         AzJeqLhhJV9q3y3fbC59TTv/0hR8yzUwIMCS2bkUFLMkx2xEH02/JNvwOCBRqwxCryjq
         P3wWqeBU7SQAcvcksHM4sbmGpCGooC6tZqinhJ4xeQere6CGii3P/olkH+TCqx+noa4L
         wnFhUXd76KR0pFfqckmm+gFXNRkQF4jrFQo+cnPwexa7SgIVM4BsBEZcJm2Ep41UuuTk
         3J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407785; x=1720012585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjxqHsGx4EEy2APqZvmGLSEquu3aI3gQZaw2aQDpMoo=;
        b=KWJNzP8ow3AfsQ+OgxNr6TFQvIMUKw/ri+X4aBRht9IVmLB5qJwUbiXX0L/bEXeM36
         l061mEZy7iIhyCx8IRM3WW6qbss1vV2Vnnt+v44KaTzSHj4q3CF9u9BtyElT3TyCdiKi
         2N08xQCdSoSTVUw4nzA1ImizQ/rhzVtF6Pj0GRpibYehBz6ldqyctS+8gf3r0M7FCU3k
         54+/eUDMfwN9UxVz/j39CPOuFbQu0Q5PP/H4xI3ic/cvTRNXlt5rKEyF55VZ4wXNMDrK
         gTfbQx2zKcAu1IjNpoV4hT8gwZBbtuhYc3XV2X6cBhQ8EGkx/pgJRxKevNiwPealHOsI
         esEg==
X-Forwarded-Encrypted: i=1; AJvYcCVIK26ZGqZnW9Kwqut0iR61FOabVKIdLkzgUNZed4ankrPCrPZgbCf15iE+1amCBJ5F/Go1AG7BOaEZ538b9w+hv4tVIFE6PDwbfQxzkQw=
X-Gm-Message-State: AOJu0YzJAWD9bCmOu2QV0JyWFauhQgvpXcPXmXLrh86orCN8S3wuKtXk
	4SreKva7FlCMlnUdG0Czqjn49c4cmJS08hNxcEiXULI6hc9hCeA1QeGWKytpFw==
X-Google-Smtp-Source: AGHT+IHnscVT9HmwrFandVvBo7fBagNu7TJODjf5LeidjZ0CbdCGWqHQZs4wi8Ieu4B9UlhUMLWtMA==
X-Received: by 2002:a2e:9054:0:b0:2ed:59af:ecb4 with SMTP id 38308e7fff4ca-2ed59afee82mr17184631fa.41.1719407784496;
        Wed, 26 Jun 2024 06:16:24 -0700 (PDT)
Message-ID: <8f7290de-b31a-4d10-a28e-50707ce612a0@suse.com>
Date: Wed, 26 Jun 2024 15:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more
 efficient
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-2-andrew.cooper3@citrix.com>
 <fc04af37-6ef6-4c91-a625-d541f9f9bfe5@suse.com>
 <7d1e7357-6dd3-43d5-9fa6-bdfab55a678c@citrix.com>
 <331d5ee5-4990-47f2-b8de-77365b308796@citrix.com>
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
In-Reply-To: <331d5ee5-4990-47f2-b8de-77365b308796@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2024 15:04, Andrew Cooper wrote:
> One final thing.
> 
> This logic here depends on interrupts not being enabled between these
> atomic actions, and entering non-root mode.
> 
> Specifically, Xen must not service a pending delivery-notification
> vector between this point and the VMEntry microcode repeating the same
> scan on the PIR Descriptor.
> 
> Getting this wrong means that we'll miss the delivery of vectors which
> arrive between here and the next time something causes a
> delivery-notification vector to be sent.
> 
> However, I've got no idea how to reasonably express this with
> assertions.  We could in principle have a per-cpu "mustn't enable
> interrupts" flag, checked in local_irq_enable/restore(), but it only
> works in HVM context, and gets too messy IMO.

I agree. It's also nothing this patch changes; it was like this before
already. If and when we can think of a good way of expressing it, then
surely we could improve things here.

Jan

