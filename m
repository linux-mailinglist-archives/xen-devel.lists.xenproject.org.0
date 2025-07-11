Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D0B013CD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 08:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040534.1411944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7Qo-0006Te-9J; Fri, 11 Jul 2025 06:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040534.1411944; Fri, 11 Jul 2025 06:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7Qo-0006Qo-6P; Fri, 11 Jul 2025 06:40:26 +0000
Received: by outflank-mailman (input) for mailman id 1040534;
 Fri, 11 Jul 2025 06:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ua7Qm-0006Qi-HO
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 06:40:24 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb66ef8f-5e21-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 08:40:22 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso1404102f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 23:40:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9fd4b89sm4328036b3a.61.2025.07.10.23.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 23:40:21 -0700 (PDT)
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
X-Inumbo-ID: eb66ef8f-5e21-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752216022; x=1752820822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uIhbFbbok2aaVmF4LKqWvANgL1hfEigAJE6IEqeVqaw=;
        b=W4uIMotatiHM1jlDHkde8h9LtnlmCX3Svn//+cUlzSsk79pTZeEMcO9BM3bctfJctk
         Tc2JzkZ5uZzTPZA4ML6fWG9gM9oZCEP7ApNfaRWle2ycIUxtJbXuJfuq/5rxr6MoYgzb
         Ri1KRWSPyh/y9WmjR+w03YEAXSRAWlE5A37K7cjXeJHd7LMvPJMwaomFE5hhtzL5XQzV
         UeOXIjj+N99YQK2Q0sro3m9mg1tuIsE9z2dxfwvX40kROzlzXZetkQfZe/2y7uMFRa4q
         yxdbRT6gSjhLmIp82Nox4DKp332vJNarc1hQrVcp+6IA0Uk36qijPTP8C8112TX61Jht
         JXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752216022; x=1752820822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIhbFbbok2aaVmF4LKqWvANgL1hfEigAJE6IEqeVqaw=;
        b=UrBRojjNswQH4Cd+2vsRsRctDiDoYOzjwLq7aO0odm2oVVPzOSgAGyIujwHS/le4aU
         ob8+6+VaGm7HbRaSILfwDHn8rXlRzms/FekjKrWaQ6hoobTVhhcQWfSt8b0ryLoRudRH
         OUMAiGx01UsjpaOFQD67bCSTdTT6jRLIo0H/djfTbT6SiuMnc5h31OcDKdblTsu3uMUK
         EkQR2xqgkk6LXcIDlggGGfuSq3b+dqjij38A2PJgwiUfMZhFriRDty2lwn5qTwNXZhL9
         EAhVePPmJpQlBKvDveyUjp5lq4jT4glawTo9FC4W1wRgMh1mA3tHqNhD0Md9qtdtg88e
         DfEg==
X-Forwarded-Encrypted: i=1; AJvYcCVN2oOQYUZ1ZOIqxZSw1zuFbxgfs0xPeXJDPnHV0q56YT/zHS6iMeanYnWGme5blWjmLWHSCxq7aMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCnm109dAXd1rdl/xKA0zk+FlWwJAsZP2a22HkxVC9gaGPg2CD
	jowYNcOsFC5RTfZiqkWQJfkIbRP4PXr7lbGmF0MWYOLtmkLvS+esrn9l0kDcZFIlMA==
X-Gm-Gg: ASbGncvwN5fJyy/SmhiFLK8X0kpAov16ov1tzkyW9fYbxOETdCfAbL69E21n5CcwkUG
	wfBVr/4V0zUb9xlZQCdY0tqe4p3uKhRCsT0XIQDaxt77nCMntq1LKpL782rcOGP/dCK8gUuYDZE
	/IHqf/wCitKbuXCY6bBcADp5YC3qpd4aEPkYL/Yokf91IkhKmhbcAY3wf8DJiwuIxuyoP8HbYJW
	4d8DbDhiiFeWxurprMOSOPuNnp4WY3kWQJt0/SVfbtYUFr8kh3BOBQpvmj9pCdmuM+VQ54tUrA0
	ExUBm595LC9iPjCSvDHuWq0M7ilVEfSkCZEe6wYW+4CbcPNWREzUbM/k0aEmjtBrDiBjgpFXkxI
	hfo6DEUdTOd6cVlNaJ+IlVo5FRbewxPaMKozTec5QYzWUuJpjEG4c9h0bk8bN0eOslw7UsbqJdT
	UXW7CDpl8=
X-Google-Smtp-Source: AGHT+IE8Ecjcc4CnUDGPfEvXkXQtnTydzpmCz1nMxbtJKKRTpSHGgXNokst+5lSy1h4c9KYsFZpIyg==
X-Received: by 2002:a05:6000:2106:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3b5f18e8186mr1195246f8f.42.1752216021978;
        Thu, 10 Jul 2025 23:40:21 -0700 (PDT)
Message-ID: <dd3282ec-8be3-4984-bb63-5ce11fd79383@suse.com>
Date: Fri, 11 Jul 2025 08:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/7] xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 xen-devel@dornerworks.com
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
 <20250711043158.2566880-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711043158.2566880-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.07.2025 06:31, Penny Zheng wrote:
> Function sched_adjust_global is designed for XEN_SYSCTL_scheduler_op, so
> itself and its calling flow, like .adjust_global, shall all be wrapped.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: Stewart Hildebrand <stewart@stew.dk> #a653
> ---

Where did Jürgen's R-b go?

Jan

