Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D57A5EF46
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911645.1318051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsede-00019m-58; Thu, 13 Mar 2025 09:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911645.1318051; Thu, 13 Mar 2025 09:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsede-00017U-18; Thu, 13 Mar 2025 09:14:02 +0000
Received: by outflank-mailman (input) for mailman id 911645;
 Thu, 13 Mar 2025 09:14:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsedc-00017O-1c
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:14:00 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e27062b-ffeb-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:13:57 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso414465f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:13:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df33aasm1429715f8f.2.2025.03.13.02.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:13:56 -0700 (PDT)
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
X-Inumbo-ID: 7e27062b-ffeb-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741857236; x=1742462036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zKPKuq1tT/Y87Mb45MsIWXGilM2NMJCJ5BhdI2p0i1E=;
        b=exQSamsn/UTpPcKOhBQC+UydIR8Sf0nR13eMz9L5tohmkkPUjjNye2HmOkKscTTgox
         ySKN0h43fJDtazSDxD9lvsgZZK2Uy9dzAycLUqsBDYoYD9h9nwC8YkOKAJ7RP1cIkLsP
         PcLrIPsABt/I24KNYAhnBePLlNQfx/xPtzxMJhXyETeRN2JDC+JzRIXBaHVrh/XmUBNv
         3zapIeLvtSJhpU6oIhPXDdfJULJcYE59BS6yyXsFWafQIku9RRSye97Lsj9Bncdbaj1F
         lM4ov04K1xJ2lvRJi+BNyMlj34tKEMyuMtXubK+1MxJ8MQLWfpG9wbaFL0hgbrCs3cmO
         laDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857236; x=1742462036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKPKuq1tT/Y87Mb45MsIWXGilM2NMJCJ5BhdI2p0i1E=;
        b=tiD1tGB06lAQCS6yPCsC6opB1DLwmzXZf237ppiCHRS+PuSk0TLBO4H9GvrZmIUxYJ
         FHGZfDKjQirry4w62MyiKqUgNbUELjciEmG7fv0xt+0EbNNn33lvntqExPkB8+6X0wEh
         OyEbWELivkd8+W6mVbjzgIoU+FkyEuqy7pRBP2khoBlvG7zAWcjRo4vbdqu7WB5ZV91Q
         tB6oycPporBmJbblW0ixEYXXTfLGNEjD0ph2XzyDHJtaBA5pprB+bri9Gnq8n+/v6r24
         /A6/BX3sSrLTNncPQuFi8b8EGu9xYJiavcmm7DV/THX+hb0KzZ6L8Q1miQlasYsJ6o2+
         c8nw==
X-Forwarded-Encrypted: i=1; AJvYcCWX/AJychBhxdyDAt54ZZ7kNhC3EAQg2c34CtsO5jypVQDigPLAGUKMVqwJ6wVLvvRp+yCo6FNx16A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXQ5jZyVpTNwTjOl4QgSKnoUAcy67Hy58OgEjbxPmXcYxhw0X2
	tney1b7jC9dtiJn9tsbXF9TNZ403cwxc+ZOYECQZAwRYSFw1lgqs7b3auFW4vQ==
X-Gm-Gg: ASbGncusqeRYUhRhfBZRNkn+EKYv8z66LY8dwVp2xA3wtIIoHHNoOpyV4R52ZFbN37p
	HtKcoNIiT6QXHaXt8GNOLEIKn6bfvIvCFJy4F04j1mirtFiNEkUIbcaQyqXSRIQIj+gbe4QWgx7
	a4LCYsgRAxtoJyjEYBrPHfjI/lehQQLoSSpyrL/3TlENlsWFNSbe60z1y0EzI42nq4OWsZNM5de
	NcDBbNVfB9O8eRsp7stBqZlBK3OFum9RJe0mX0MtOCzsQfcmOMJeoOcAfp1v9qlwUE7MifUk9pW
	4Q+Qa/acJKjM/xppH+atY7E1EoiRBB045z129V1mOMxQjy6PlI9P7J+1vRrHYGL5RNHXTpQoUlo
	4gCtM++jpQaYxk6OgnM+HpL57u0nVkMQY1KuEkqeU
X-Google-Smtp-Source: AGHT+IHQprFeR6S2R4155I7mRboU2G41XVe9CYZRwMYIb/wbTKA51zoekz3Qx3g2w04onLwCnvywTA==
X-Received: by 2002:a05:6000:1a86:b0:38d:e48b:1787 with SMTP id ffacd0b85a97d-39132d1d1efmr20638302f8f.14.1741857236689;
        Thu, 13 Mar 2025 02:13:56 -0700 (PDT)
Message-ID: <cd4e4e69-9b54-40bf-a9e2-88191481487d@suse.com>
Date: Thu, 13 Mar 2025 10:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] xen/mm: Exclude flushtlb.h from mm.h for x86
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250312174513.4075066-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 18:45, Andrew Cooper wrote:
> alternative.c and livepatch.c pick up flushtlb.h transitively through mm.h.
> 
> Fix these, and finally resolve the TODO in microcode/amd.c
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



