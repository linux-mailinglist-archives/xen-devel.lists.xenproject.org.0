Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A56A2916057
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747358.1154745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0uX-0004ar-GF; Tue, 25 Jun 2024 07:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747358.1154745; Tue, 25 Jun 2024 07:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0uX-0004Yk-Cx; Tue, 25 Jun 2024 07:48:17 +0000
Received: by outflank-mailman (input) for mailman id 747358;
 Tue, 25 Jun 2024 07:48:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM0uW-0004Ya-42
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:48:16 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46d01420-32c7-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 09:48:14 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a6eso58482121fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 00:48:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6cdcsm74815185ad.128.2024.06.25.00.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 00:48:12 -0700 (PDT)
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
X-Inumbo-ID: 46d01420-32c7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719301693; x=1719906493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GuLO1y5cDkeVS7X6EsAaXv62UaMYK1EMMIwtfJo1lak=;
        b=cSbIoOImuAdTJ7ABP5Dc2CptWaOcrIzJeyAiZo76IuvLxXublP26Z05k0CwrqdNTy3
         3PZqjnRasK7cIe/S1qe8laOEm0Tv4QkcerlhNrCElHxvsRI15l1ahUOtTc6dQUAzFGV2
         qTZ+3pncY5lq0aiBE7a16y6vOc8Wglbdr1CJCptjDtPbKCZrw6odK1vjzNzslGH8FIxM
         63vWL+8NRL8kbQIkdDBiUUha6r8rLw6xC/JFEVNPliqjnQKvZtfbsPxwtNBMBY15L8wg
         WiMtavRY8cXJ4FU7IzeUB1QMGp1dHSE3x0IXnCxUZ5KHbll6gEBH6xNa7tZzXoj2gTzc
         kmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719301693; x=1719906493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuLO1y5cDkeVS7X6EsAaXv62UaMYK1EMMIwtfJo1lak=;
        b=JjQ2QI1/shjshdnGfF03kstCIbNXSTtZ6sGICQ77VisA/FnAVCPdAnIzPhYy7xScNy
         FKsVlj/eJbAhV6JMs0xEZ9tloFseWFJMd0Vc1HNVDpo+u/sRFJ+Cv0Xd+I2vgNcHOJy+
         WppnQA6ATkAOGQpAWn4Am8QFQlswF9MIMgtouHfZKB9zP5PO6HaDA71bRd1ben2BvlH6
         P0wRWJxU/EWvrKtjzqSUkR8uogYKBpZw8CEjCCcTH9rl8YJw8dWh+9ohJaiEUw3NSCLo
         cb8PtJxQNApIOep+KS9lw4A2KZx1stA2/L/aguOS1rU3oyaegDwGbuPgFQqNfoSxZhTj
         jkqA==
X-Forwarded-Encrypted: i=1; AJvYcCUHgFDd5brDdHjC/pwOLk+er94gckEbWyY3WreyAC/vGn0uqSpiL5MObS7bXhCdIcRun9tWeqa95bKThWaFaKmAR7n8s5R7nNsIi27rkkQ=
X-Gm-Message-State: AOJu0YxXoodhUbT3wzXlahXAPZ7CkI2AAcXmeDZzfs2e/EAklGK62I2t
	L6EJ29ENKhfP0SMDi+xZwHmFRlzM0zY64vVCp9ophw9wBdk7jglOPZrGpMxnCw==
X-Google-Smtp-Source: AGHT+IEoC4cU2UTiUDV9e7JtEAUjOJ+sNx06L+KEm0C1q00H4PcFxNC9zwTilDTPgqqTVKcr00a5RA==
X-Received: by 2002:a05:651c:10a7:b0:2ec:59cb:c171 with SMTP id 38308e7fff4ca-2ec59cbc198mr43672811fa.37.1719301693411;
        Tue, 25 Jun 2024 00:48:13 -0700 (PDT)
Message-ID: <f6c1014c-89b7-46c0-b126-d036464a5233@suse.com>
Date: Tue, 25 Jun 2024 09:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
 <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
 <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com>
 <BL1PR12MB58493479F9EF4E56E9CB814FE7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <96ba4e66-5d33-4c39-b733-790e7996332f@suse.com>
 <BL1PR12MB58493B55E074243D356B0CAAE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1ffd019d-6bab-49d1-932c-7b5aee245f32@suse.com>
 <BL1PR12MB5849099F40069F7B9C376106E7D52@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849099F40069F7B9C376106E7D52@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 09:44, Chen, Jiqian wrote:
> On 2024/6/24 16:17, Jan Beulich wrote:
>> On 21.06.2024 10:20, Chen, Jiqian wrote:
>>> On 2024/6/20 18:42, Jan Beulich wrote:
>>>> Alternatively we could maybe enable XEN_DOMCTL_getdomaininfo to permit
>>>> DOMID_SELF.
>>> It didn't permit DOMID_SELF since below commit. Does it still have the same problem if permit DOMID_SELF?
>>
>> To answer this, all respective callers would need auditing. However, ...
>>
>>> commit 10ef7a91b5a8cb8c58903c60e2dd16ed490b3bcf
>>> Author: kfraser@localhost.localdomain <kfraser@localhost.localdomain>
>>> Date:   Tue Aug 14 09:56:46 2007 +0100
>>>
>>>     xen: Do not accept DOMID_SELF as input to DOMCTL_getdomaininfo.
>>>     This was screwing up callers that loop on getdomaininfo(), if there
>>>     was a domain with domid DOMID_FIRST_RESERVED-1 (== DOMID_SELF-1).
>>>     They would see DOMID_SELF-1, then look up DOMID_SELF, which has domid
>>>     0 of course, and then start their domain-finding loop all over again!
>>>     Found by Kouya Shimura <kouya@jp.fujitsu.com>. Thanks!
>>>     Signed-off-by: Keir Fraser <keir@xensource.com>
>>
>> ... I view this as a pretty odd justification for the change, when imo the
>> bogus loops should instead have been adjusted.
> Yes, you are right.
> And Anthony suggested to use LIBXL_TOOLSTACK_DOMID to replace 0 domid.
> It seems there is no need to change hypercall DOMCTL_getdomaininfo for now?

With Anthony's suggestion - indeed.

Jan

