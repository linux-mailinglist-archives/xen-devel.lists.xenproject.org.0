Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A547A5BA0A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:38:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907324.1314582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1truC1-0003UU-GR; Tue, 11 Mar 2025 07:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907324.1314582; Tue, 11 Mar 2025 07:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1truC1-0003SJ-Dn; Tue, 11 Mar 2025 07:38:25 +0000
Received: by outflank-mailman (input) for mailman id 907324;
 Tue, 11 Mar 2025 07:38:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1truBz-0003SC-Kd
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:38:23 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf456d5a-fe4b-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 08:38:22 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so4418143f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 00:38:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01567fsm16956931f8f.41.2025.03.11.00.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:38:21 -0700 (PDT)
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
X-Inumbo-ID: cf456d5a-fe4b-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741678702; x=1742283502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MO1HQRCE1cm933vGC4hrBB4CuAB+/4isDl7/6+rwZ9c=;
        b=FuzX30zU8/Uj9Vzma29DvThFCCVUFlHqZok2hLxK/GGBzJPxhh7YQlF3TF2l7d/Ev/
         0k/TcX2Tu8TwjgTZKiOaxmQwsaFCPBl9IuGUdVJYarNPMDRyeNv4IBtVA2Twwh6rwVxY
         OlOKF2KO5LEoG6GUtuLVnYDIKIEuzmlgfTt0jy9/w+GkorHhzvZDw4J517a47x59ZplH
         ilc+UQffaIlp0B6tiNwd40Vgy5lmhH4UVXzI93QWdX967A8ivMbn3hgS8pZelCN8SbZG
         Pq61UHyaotZVYBXKkWlw+akA2bIcH/jYop3oIDY2LV2sYnYcptpM4OX1czhLpGztAIuj
         K2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741678702; x=1742283502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MO1HQRCE1cm933vGC4hrBB4CuAB+/4isDl7/6+rwZ9c=;
        b=Ddh6eByN2fVXT5hl5kZvfYdu/k1idGBDlDDzm9rql3g5t9hiCxhuznoWIj2824eOla
         eoU4ypKKQtrMpwcCPTDYDgaMIsLLnt1bn6DsSNYe3ibgYTHHObRkeNde068sUxesrGZY
         z1cOnnkCKahfGgkYTpgFik5afIYZbflY9efP5VpzFbYSXc7GM9bap98LROeeuRoJ1pd+
         hmh0nvrbYv8hUIaDWklT9PWYBawdgIUrc3UKALOIF5lX2q+NFazVpD66S62vI0ZXv69v
         JU5ZGFFY6gIcBsYJvDTXzlaht03lp6t920XVj1kkcaWFd1F5/WC+62P+Q+RQeLs/ENv2
         56ww==
X-Forwarded-Encrypted: i=1; AJvYcCWsJD4r4nnhk7LxvZKQ1m2C6CNbXFNRTlIfVb9E5jrXDzAM7joA4qV3zjLd3YTkMVWTEo3SAeVCTXE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/VUihn+s7tv8K/PCQVjHVB2/CqvoS12gXeDKsd5sFsVdEreHv
	gn0Y4IJD3rSlgPdZDmKef9AKFG5qe3a6gVX24+ikY/Rf6KIBQJQ8+K1jd6xt9g==
X-Gm-Gg: ASbGncuXJb20NfeDs8dgbiQaVb+NbsObGU093N9ZCls88EurUoJWwKKQpHfEUZyo9z+
	A9WQSLPshh26AXbPmUVSkStSQdRkdkrIn+aS7cALpL3yy1P55JXxWpmn4XjAXW6MQ9wA69LKnYO
	VO/CBhnxefDwZVC5HEhHxtLT/cEOWF07bHKnTrJbuWS4PgKjRN4fMTACB8Qk4aaEBoAX9h7uTld
	xWcvqV5VasIwGLEjW7OsWcVFYrq7/RAQd2xNCdqBbqOoWpcJtEO5S5uRPQOVgjcPWlvOR+zMllo
	QAStmxTphvk1edUYE5ohWsfldQUz1u2YBxPssXOWnRbH6IzAy2ZLeIPyrRb+w3Wb+oo6kZZCPAR
	dPWk6RxXE3z3hU9HdUGXoVvSKiS4kSA==
X-Google-Smtp-Source: AGHT+IGGWoKxR6MtziZrd/uklTSADjfW4gI8KxmiGQFXMiafL1dxhC366LHTkWZCCODbfKgEC1vPPA==
X-Received: by 2002:a5d:6483:0:b0:38f:28cb:4d35 with SMTP id ffacd0b85a97d-39132d4e38cmr13009819f8f.13.1741678702138;
        Tue, 11 Mar 2025 00:38:22 -0700 (PDT)
Message-ID: <2fbc6271-1dcd-4150-b296-2aeb0366c78f@suse.com>
Date: Tue, 11 Mar 2025 08:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/23] xen/domctl: Expose privileged and hardware
 capabilities
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-7-jason.andryuk@amd.com>
 <813569bb-a1f7-42b0-a872-f6ecf4033880@suse.com>
 <fbf002d2-c38e-43f9-8bcc-e810c10d6859@amd.com>
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
In-Reply-To: <fbf002d2-c38e-43f9-8bcc-e810c10d6859@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.03.2025 15:11, Jason Andryuk wrote:
> On 2025-03-10 05:03, Jan Beulich wrote:
>> On 06.03.2025 23:03, Jason Andryuk wrote:
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -155,6 +155,12 @@ struct xen_domctl_getdomaininfo {
>>>   /* domain has hardware assisted paging */
>>>   #define _XEN_DOMINF_hap       8
>>>   #define XEN_DOMINF_hap        (1U<<_XEN_DOMINF_hap)
>>> +/* domain is hardware domain */
>>> +#define _XEN_DOMINF_hardware  9
>>> +#define XEN_DOMINF_hardware   (1U<<_XEN_DOMINF_hardware)
>>> +/* domain is privileged */
>>> +#define _XEN_DOMINF_priv      10
>>> +#define XEN_DOMINF_priv       (1U<<_XEN_DOMINF_priv)
>>
>> Oh, and: If we really need both constants (I doubt we do), the latter wants
>> to follow style even if all of its siblings don't (i.e. blanks around binary
>> operators).
> 
> Ok on this and the rename.
> 
> Why do you think they are not necessary?  I did not see a way to expose 
> the capabilities for other domains.
> 
> Or do you mean if they are added to XEN_DOMCTL_get_domain_state that 
> won't be necessary?

Oh, I guess "both" was ambiguous: I meant both _XEN_DOMINF_* and XEN_DOMINF_*.
Of course we need both a hardware and control bit here.

Jan

