Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A68B489EC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 12:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115078.1461834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYxs-00027u-MR; Mon, 08 Sep 2025 10:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115078.1461834; Mon, 08 Sep 2025 10:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYxs-00026Q-Ji; Mon, 08 Sep 2025 10:19:12 +0000
Received: by outflank-mailman (input) for mailman id 1115078;
 Mon, 08 Sep 2025 10:19:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvYxr-00026K-JN
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 10:19:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 426de74c-8c9d-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 12:19:10 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b04abcc1356so297430366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 03:19:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04a87dfb42sm666639566b.106.2025.09.08.03.19.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 03:19:09 -0700 (PDT)
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
X-Inumbo-ID: 426de74c-8c9d-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757326750; x=1757931550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vqlIlLrREZy6vf5sB6Mz2Bo11MWdZx9Z2caIehqzh30=;
        b=Tas0FG6V/9Ud+HBn4ki3hclBHHGzR6Rk7gCtqTSJ0ewqX2D6riW7B8f3oYkpxALLV5
         0n7MsayVrY0rRcfs8fVL6ccB/sq+nbVo24HP0SEe2jtPpIr71utlGWJtqbzKmLjWR5eL
         wFJKptQaczWmiJ7zoIUbFaQnvBX01oEBdXxCSKx2kue+y5FuKsH45pld12dUFkUsGh9b
         iaa2qFODM0YKUJ+0WCHFUQh3hIRtM3VFJtyAqfMHebF1CTwTRjqAqxYjrg89KVedb5Da
         HC6+5JWeKF5IWLmtESR0m5u17QLWh/9s4NtefDi+b/a1Rb2Fx36iAlyl17cz07Js9PNg
         7DHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757326750; x=1757931550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqlIlLrREZy6vf5sB6Mz2Bo11MWdZx9Z2caIehqzh30=;
        b=LG05Vez/oRffHl67CGOed6+EOupTuI9EJChsK1oZgsRRE0g9b5oqwXrCJPM89iIN5N
         SYzYeSDZdK/SYUmEX+j6YvOaSWhDgRTdc0jA8xohQJYjK2WR6ZWNIu1K0K0Kc2qKOChU
         ietqPkedk0zQqQt69H/LPWD+87ffotZW7kmnMoLsWXNZQ/LdsGxzlfkgqfcz/uU3OGF7
         XwdMZA8w5VsbWT1fum7ZXD8jUIHOxSPnM8J5AOwEkEHqckpkjixwnA8NBz73ioB3Me0o
         cC3jxBGHTq43QGCalSBtVjFwQgTfneSsbqZDSWjQAiFfZVbv3K9i65MgcbuHTZ/HTNoy
         uPxQ==
X-Gm-Message-State: AOJu0YzftzP7MG3cfUt0QB7iglQYX2nKgpAiJR7wYIr20wH5kdV4Ot6w
	S/gRlQ+qt+GkNvCc2/VKXHdWJwwAH2STcHWczL+dXov0ko1blHe/oTFEXZwWbJ1ii2+xODXLvnq
	SGyo=
X-Gm-Gg: ASbGncvuV4KlGdBinrR2vD8e7Kn4/ijXWwOnBhwwal1eFlTfHXR+BOU7yOjcKiAe9eJ
	KEn1G2hPNQ5YqmqwFKlL77LqOsWWukuFjJTbos0q01ONKwIrGptQ8HQ7MInH3WoKf93XyoItlKe
	ejfSjPz0D42W58Ma6906m2v0ogX0Kd2A/ugPNnJt3g/yUXNVhWGQKE1xjSPJXALL77q/9lmvqw6
	iBfRiI5g8xgDs/zZN22nZsDp+bRAFmdLNCvTOfUh926ED0TBiQv/jPJBaZJWDE+b0ZTDgoeFZwI
	B1MVyxv5V/RX1Rvh1cX02YqMnsooiNwjF8GT0WxMt84Q8cc07JrkjYRNc6RDgsZWxQWRtbsUqR7
	Q4hA7Yv0S3DnedBg41axAPzgNOwonVybOJx8gsIJNqhkSFAk7a8INPVFvZ5Q42b9hUWOFmWx/R8
	kB1mKoUi8=
X-Google-Smtp-Source: AGHT+IFpPI6oIOrxtcYp8L83cONSiu7I6uMenaZ/i17bVyinv2mQ0L33iNPAJwdDUhm/xD7JMTRvIw==
X-Received: by 2002:a17:907:3cc9:b0:b04:6e60:4df1 with SMTP id a640c23a62f3a-b04b17672femr737388566b.53.1757326749903;
        Mon, 08 Sep 2025 03:19:09 -0700 (PDT)
Message-ID: <77361e51-dcb8-40e2-a526-9ff90ba942a2@suse.com>
Date: Mon, 8 Sep 2025 12:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68bd98b92c2b2_2afba52d9ed55e79908873e@prd-scan-dashboard-0.mail>
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
In-Reply-To: <68bd98b92c2b2_2afba52d9ed55e79908873e@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.09.2025 16:37, scan-admin@coverity.com wrote:
> ** CID 1665362:       Integer handling issues  (INTEGER_OVERFLOW)
> /xen/lib/find-next-bit.c: 104           in find_next_zero_bit()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW)
> /xen/lib/find-next-bit.c: 104             in find_next_zero_bit()
> 98     	}
> 99     	if (!size)
> 100     		return result;
> 101     	tmp = *p;
> 102     
> 103     found_first:
>>>>     CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW)
>>>>     Expression "0xffffffffffffffffUL << size", where "size" is known to be equal to 63, overflows the type of "0xffffffffffffffffUL << size", which is type "unsigned long".
> 104     	tmp |= ~0UL << size;
> 105     	if (tmp == ~0UL)	/* Are any bits zero? */
> 106     		return result + size;	/* Nope. */
> 107     found_middle:
> 108     	return result + ffz(tmp);
> 109     }

I cannot make sense of their claim. 0xffffffffffffffffUL << 63 is simply
0x8000000000000000UL, isn't it? Where's the overflow there? There also
cannot be talk of a 32-bit build, or else ~0UL would have been transformed
to 0xffffffffUL.

Jan

