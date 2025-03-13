Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3598FA5FBEF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912873.1319046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslYb-0008O0-Hw; Thu, 13 Mar 2025 16:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912873.1319046; Thu, 13 Mar 2025 16:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslYb-0008LI-El; Thu, 13 Mar 2025 16:37:17 +0000
Received: by outflank-mailman (input) for mailman id 912873;
 Thu, 13 Mar 2025 16:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tslYZ-0008Js-FS
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:37:15 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b8cfaa2-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:37:14 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso1534631f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:37:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aac5sm25715755e9.28.2025.03.13.09.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:37:13 -0700 (PDT)
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
X-Inumbo-ID: 6b8cfaa2-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741883834; x=1742488634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GU5LSbric0lnhcBmKC+wsweM0DvBMW9A2WFSbsMM9/M=;
        b=RDcgkREtAafARdm5YcBb7z7HMOs0L31BKNzNHyoLYLTJY7NNThEO/LjkgCj4x9eZRL
         MmcvIyp9FVP4mWno1AGC2JTbe2cilpCJUce1o6bV8utdKHGQqP7U8iDmYWn0ae/e9X2F
         G2jAQPkv0GLFPrqV5Ir3jGvsKv2vuaPDXVo84hLkJV2UTIBbYGpfIbgg+C7UQkWl0Vka
         lWtbiqQMT6PPGWFLnN2TN0QtpTf68fXP4gmmHJs3KwVuxEVawf90XBk9+6QSr+rRPwEY
         rGgtQT+gTw+P/bZ+BGDHGB8QtLSapdvMnIHjbREuVmViDLzy7FKutGVS3LrV3tj9AC+/
         BBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883834; x=1742488634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU5LSbric0lnhcBmKC+wsweM0DvBMW9A2WFSbsMM9/M=;
        b=YJDnMRHQ5AyieikwTdL7kL4d7/sZmYWEIqp08ZiOF5VoMpU2qTlguJr8shOBLyzrPI
         BZbP04kNre7ZL52IbOihDL4hvYVmslF4fJHeSCJNHaROKaxZ0OwTfELqKWieGApcG57b
         me/JFf2kkhzY0SVOj4LtQvbcP+ujacU1fpGocDKeZq/HTUm5AlAPZNy8zk496xbNo3nH
         iwpFXfKhCKzoQla3grJFc5dpankLZLRZOkakNwoIVefj3+ggiD5X1IxM0FWIuT3+m9pK
         DF0RtkaXj8ilM874lfUxA1DeRGFSDxbh9LQhg4YYdztPP0VUGKkKtPu10T6CNp81P/ko
         xCeg==
X-Forwarded-Encrypted: i=1; AJvYcCUlI1JNVPrcsHVUrZgVGbYeu2xG1mb3KQRd9MWYTdh3hf+vrTOWU6RDs2dFSpGso4cuxAl0qOJNgZQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzp3gDJ/rZonKTCmikw343J7NMMnUqmdGeVWTIzT9E+EMgvu9QD
	iH6vbEJL/hfG7SHAodiTfsjfOvVvFtKcvKlouX4VUkVMqRnG9al/9a4FVTz1AQ==
X-Gm-Gg: ASbGnctfqxCq9nZPk12f+scaUKaC8CW6vLVYpKXIWCEzoeYH6EViUVhSc0KFEQooi9v
	+eoR66CKwHphCVB7Jsvb6C+/H/aRb/6zFZkPy8irfkC2g965mI/jFua7FUJ/HBiqtjjNv6e43dd
	SABgeFnYWaEtO5It3gkO1SGgLRrkdQjOuMM9db+RbYmgqKqBkdJjW8JEzCir9fpoIRc31YidmkZ
	f3aYt/+vt8rprPqNkRdqDwmJD+XLEVOYyX9eODOV0cScCE46Ldc1c6KSK9H+5uc0W8R21H1mVpX
	iHeAErCKi32HeCI6YFup09QGzEK3RTEaCvsQ/xmmIsQ2011DrDL/f70XeLdFS8KCO8Otrc7w8CY
	9cVndnksACMGSzovEPYbhui36PMezpQ==
X-Google-Smtp-Source: AGHT+IF6/xvzPGYHnVQpeZvWvFgAou1GzRntVfILa7CtsaqfoWVM1++c0QzcBBACUIHe6tgRuOfpKw==
X-Received: by 2002:a5d:6d83:0:b0:38d:d166:d44 with SMTP id ffacd0b85a97d-395b9a1c648mr2775630f8f.23.1741883834270;
        Thu, 13 Mar 2025 09:37:14 -0700 (PDT)
Message-ID: <61b762d0-d513-4d02-80ac-50fa12a725f3@suse.com>
Date: Thu, 13 Mar 2025 17:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
 <6ff81326-762c-46ec-a06a-254ba166433b@citrix.com>
 <b59ea14e-0bce-4c3e-b1fb-021b53af1780@suse.com>
 <d597523c-aa3a-4682-824f-e6e2f8ce753a@citrix.com>
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
In-Reply-To: <d597523c-aa3a-4682-824f-e6e2f8ce753a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 17:28, Andrew Cooper wrote:
> On 13/03/2025 2:19 pm, Jan Beulich wrote:
>> On 13.03.2025 14:58, Andrew Cooper wrote:
>>> On 13/03/2025 1:38 pm, Jan Beulich wrote:
>>> I'm tempted to ack this on the basis that it is an improvement, but a /*
>>> TODO this is all mad, please fix */ wouldn't go amiss either.
>> I understand you like adding such comments; I, however, at least
>> sometimes (e.g.) don't. Especially without at least outlining what
>> would need doing. Just saying "this is all mad" doesn't really help
>> very much.
> 
> I was being somewhat flippant.  But a /* TODO, try and make this a
> presmp_initcall() to improve alloc_trace_bufs() */ would be fine.

Okay, added (to the existing comment).

Jan

