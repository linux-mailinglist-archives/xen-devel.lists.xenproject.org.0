Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91908AA946
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 09:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708820.1107980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rximA-0000WT-4D; Fri, 19 Apr 2024 07:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708820.1107980; Fri, 19 Apr 2024 07:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rximA-0000Tc-1V; Fri, 19 Apr 2024 07:35:14 +0000
Received: by outflank-mailman (input) for mailman id 708820;
 Fri, 19 Apr 2024 07:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxim8-0000TW-5q
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 07:35:12 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a348c1d-fe1f-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 09:35:10 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4196c62bb72so877095e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 00:35:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d5-20020a05600c3ac500b00418fffe2ad6sm2327606wms.16.2024.04.19.00.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 00:35:09 -0700 (PDT)
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
X-Inumbo-ID: 5a348c1d-fe1f-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713512110; x=1714116910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTTG9tiu+ubH6ouetRXibPFDVpYRXGIkPlVqgyf3++4=;
        b=cZtKHtPWQXssMuWkzDWuDqfA/XBbcCu5XEKi6wURw3M/J0SDx1VTMLU6pxgPIXITJO
         +0eU/DbF3vR+GjeshTqMnER99rGgYttBmpDINHdqtZ8d2y6uIpHqOSlKltiXyx42QZIa
         8PFBuJ0/dhLywkWSzMxgTlHr6730uDq1SviiNTDmPjnQJSkfIUYZRbnb/w0HNI5FvK55
         uO31c5600IhiEOFrjUsOIwJU8uXrN3HHfF5jONwIFDaCr785YrY087eqeyswGtWA2p3q
         HTCzta9Fl2VIaBbLPdUSXps6U03N8ShSK8mME4vYHzejB9fK88YIL/rIF9+vFena3CVJ
         OXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713512110; x=1714116910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wTTG9tiu+ubH6ouetRXibPFDVpYRXGIkPlVqgyf3++4=;
        b=OZfJ6K2IlsfQqvTbvEi6dIOHTQ7P0VgUJhLC8mDkbnaEfqEjzQ5H2Gu2vU96BbOV/F
         rBhTwlfwNzGTEcHzFZ77aW7mq0CHMFiU8QL/I8z9BhVUfx9EOn+xVjVNO5XmMEMtnjnJ
         GxIrkR0lBXJ1C/TjjzGcDMLEeATrhCTTH0q4dxJH2EhsBU10yXgiIQSUpOzvwflKa/Hu
         Eo6BK1FacoOozkZM5mm/hi7JAIaNJ4KPQl9Ecvuek9/mfh98GayNCFqnT1f06Nn5srDV
         m04xfilPGlMLQq7xkkf44qVVX12C1t3jjEXSzeJEO7vDIDzYc3sfPd3JFgaUGuAdS6f4
         yFYA==
X-Forwarded-Encrypted: i=1; AJvYcCW/C68fwmTGs37MQZhpjqe1BlvN9E2FR2i6fDncTCzEBb2ilT2BNErlWMnia0sRSYkJvMpXqSDxXxN1yEIjdqjLR1ZJPmilWQo2yHie0gg=
X-Gm-Message-State: AOJu0YzW5mRen2G+olbo/PzcX1xOSTX492CV3bK9puTVjOmHtuQ/fdzL
	5dEpzhml+vbICwJu+9i8i88UZa1HtD9lDlD48qjHDrGMP4fBGssnh1GK3n1z3g==
X-Google-Smtp-Source: AGHT+IEYb0Ry1i0X6frmVuIKPSqZhfE82KwDuQ4MkviZscJT4VJK9c8UVCN1Os3ONLHSzIqP4LBJUQ==
X-Received: by 2002:a05:600c:4590:b0:419:ecf:f5df with SMTP id r16-20020a05600c459000b004190ecff5dfmr452478wmo.2.1713512110186;
        Fri, 19 Apr 2024 00:35:10 -0700 (PDT)
Message-ID: <c94d739e-0517-487f-8ba9-d9b19fe8f916@suse.com>
Date: Fri, 19 Apr 2024 09:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: substitute deprecated
 service STD.emptrecd
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <7b60faa6e627b3a4df298f2ef4d9ba4d72e5e206.1713510915.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <7b60faa6e627b3a4df298f2ef4d9ba4d72e5e206.1713510915.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.04.2024 09:16, Nicola Vetrini wrote:
> The ECLAIR service STD.emptrecd is being deprecated; hence, as a preventive
> measure, STD.anonstct is used here, which for Xen's purposes has equivalent
> functionality.

I'm sorry, but no, this still does not clarify things enough. It is still
entirely unclear how "empty record" can reasonably be substituted by
"anonymous struct". Even the expansion of the respective abbreviations
continues to be just a guess.

Jan

