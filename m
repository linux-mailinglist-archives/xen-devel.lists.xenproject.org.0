Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EAAACEE6F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006678.1385919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8cr-0004GE-Ef; Thu, 05 Jun 2025 11:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006678.1385919; Thu, 05 Jun 2025 11:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8cr-0004DV-C1; Thu, 05 Jun 2025 11:19:13 +0000
Received: by outflank-mailman (input) for mailman id 1006678;
 Thu, 05 Jun 2025 11:19:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN8cq-0004DN-6F
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:19:12 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e789dc49-41fe-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 13:19:11 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4508287895dso13180835e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:19:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeabb13sm13031470b3a.62.2025.06.05.04.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 04:19:10 -0700 (PDT)
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
X-Inumbo-ID: e789dc49-41fe-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749122350; x=1749727150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dl0CV9uVnjD+WjAYgU5pp64MtCDepIU/VlSVf5u9atw=;
        b=WjvVZwUgtAMsegGyebEdi3Slr5bqtG6YHvsiBF+FSFBZUXmUtj4h6V0replOhDEhRd
         38D+0Q+84TK3e1c7800g9AvldRTJ/FlMkRBdTfQnCqwLQE6vII5BdP2H27182H3dMxYR
         UcUuCFJYBZTsi9+6IfOftmClnbBw073E9ZzsTQeYSgH4Lu5Ee8Q6H/YgQvB0snkPWbAv
         T41vNX/Aw98r7v/IDVAt0/3E72EVhk55xQ1QoI3JVUZ+7J+foXHHKBaRh5jPjsVvrqcR
         3yD5AE4stJquLXhJ6cLNBt4s+cAi2RvrOeNvnQ0LF0wxi072JQqCu0GyxDpCfYPl/Wja
         ptjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122350; x=1749727150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dl0CV9uVnjD+WjAYgU5pp64MtCDepIU/VlSVf5u9atw=;
        b=WKUcM27G3VxrMBqAb0ShkZHO+WBJ6cue+Xy1pFanUFtVEuQHRmmzmy24NyP6EWr5V+
         KOMufjiadWomFk4+itAcvuXnTyOeb8wP3ShNAqVf87NygJCloyoiQNOwPeXf8DedbpHv
         p+BHKv/cgOkJjVr5T03lCpe4i72nVjtEMSl1AvisWyXUycJ/SJIsqHV2EgE2kq6rWeeY
         w9vR6afAjyIZYxmKUPTDvzy3FDOSBrRcudQkMDewjNUB/M7eDUKLSUknhErI7g/Wxe9P
         5e6tvOg4zjQLvFnvGemQ1Vz0oATPzhTOdefZKLoKi0JJDbA/J9enHk9AIdaKQaPVFi7n
         LOzA==
X-Forwarded-Encrypted: i=1; AJvYcCUGiIrkzz/baydG8cA7pxBlPfb2hy2FcwFfzs9IGLzrOl5VmLV7tdzzD4siN/oW/PLDMM4xNT4qWBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcbziKXcB1d82WvARVMPFzQlQdZejiLVp78+qmLA0enr5foYs2
	cyoFIwU504PCsl6uViBz0IMyYyph6QhAd1iJYOCPnhy+jRNRrzF3ybP7qPu6CMqUZA==
X-Gm-Gg: ASbGncs9uncwS45EjTwiy97awgxCoM96WCpjuo8qMsywzU4eZVg1b6dHtscQt8X0Qmx
	l2qiEIyn0DhsmHRpYpiJ6xnYdsEpW30zPOFNJtJEMLgmYXhxa5F4is2B5KNR5oRGSgX0qo+fgSd
	NY09ksX3fVyGV+nhWK2ZGuTsu8oRJCsZ2YH58mPGkTl0FIrlOIBoiL7gRjMDR88/IKYquFujJX/
	0WWdWyEyxUNl/fbMfscTumbtgBxR+BsrYFt5E/Zpabpphn5CMyVlUAYq4+tvrrKfHGBx2bVOt8s
	bHC6oFLOL4Nbux9oq4+6YUTan0c9If040xdURt8oaZjMv6WBxaqp4V7/Wy17nP8JdLlnJ9mbCjI
	sLEwH5TwoHW23II8dkvD5wbuRHb5cR7c92J0n7nz3/omqgeU=
X-Google-Smtp-Source: AGHT+IGSfQ32eB+E/W2CLMNdaybiMyJljp4CoCqw94Dkq+xbbV2uS2R8OtHeOuYOb59vCRhnoHnlIw==
X-Received: by 2002:a05:6000:2485:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3a526ddadedmr2747628f8f.14.1749122350641;
        Thu, 05 Jun 2025 04:19:10 -0700 (PDT)
Message-ID: <c7fb63cf-b05e-49ff-9ffe-446231146ba4@suse.com>
Date: Thu, 5 Jun 2025 13:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] livepatch: Embed public key in Xen
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250602133639.2871212-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 15:36, Ross Lagerwall wrote:
> From: Kevin Lampis <kevin.lampis@cloud.com>
> 
> Make it possible to embed a public key in Xen to be used when verifying
> live patch payloads. Inclusion of the public key is optional.
> 
> To avoid needing to include a DER / X.509 parser in the hypervisor, the
> public key is unpacked at build time and included in a form that is
> convenient for the hypervisor to consume. This is different approach
> from that used by Linux which embeds the entire X.509 certificate and
> builds in a parser for it.
> 
> A suitable key can be created using openssl:
> 
> openssl req -x509 -newkey rsa:2048 -keyout priv.pem -out pub.pem \
>     -sha256 -days 3650 -nodes \
>     -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
> openssl x509 -inform PEM -in pub.pem -outform PEM -pubkey -nocert -out verify_key.pem
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

While reviewing patch 4 it occurred to me: Why embed the key? Can't this
be specified as (another) boot module?

Jan

