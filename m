Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54838AD4A69
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 07:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011294.1389665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPDzD-0002rN-TG; Wed, 11 Jun 2025 05:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011294.1389665; Wed, 11 Jun 2025 05:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPDzD-0002pm-QG; Wed, 11 Jun 2025 05:26:55 +0000
Received: by outflank-mailman (input) for mailman id 1011294;
 Wed, 11 Jun 2025 05:26:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPDzC-0002pa-OT
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 05:26:54 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeb9cfe7-4684-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 07:26:53 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2753659f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 22:26:53 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b419:d0bf:1423:db44:9404?
 (p200300cab734b419d0bf1423db449404.dip0.t-ipconnect.de.
 [2003:ca:b734:b419:d0bf:1423:db44:9404])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323c0819sm13885567f8f.45.2025.06.10.22.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 22:26:52 -0700 (PDT)
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
X-Inumbo-ID: aeb9cfe7-4684-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749619612; x=1750224412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9cFIQX1ckg+EPJjekRYxRBF1854Xd4wUJXPfSnoLX1g=;
        b=LXQCNzAarmg32cpEahUWJjDRzQS7yGAtnMjUmCKyhhnaLjTOTClo9xiUxKUllnzw1/
         3/O1e+rL4YrYGfAwQUwUoQf1/gBqDF76ueNumfBv5fWdqt5u4cI13Cna+pu5ab22NBZp
         hqdRKrgNfwhg2b2p1Kahig5j16Wox0wsId6WcnEjiXUgEDLak/8UidthsnjHtlrzEorX
         IRV+Yh8wLYTCbWu+GiBkciHd2rQmfRM2YiJiCtFjVBbLs+Cu2M3MUVGNUCM5cyhclr1q
         IPsdk+ERBtuIQWwv1dYDJ/MZwwK2a66fmkVokbGVP3NMjg/jJ8dMkCSTSjyqj1WSS+An
         grrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749619612; x=1750224412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cFIQX1ckg+EPJjekRYxRBF1854Xd4wUJXPfSnoLX1g=;
        b=cQKbtO1NEIhnn+WrFvbuZmocmaq8U/eTdlmelH5UbTaRwdETVsCYikVoNg5mWOfODk
         WIRxCKFA1TF8FwCWahN4dthHElZUl/ZkVaMDU++X1VjKciQOu8CkZC+P4FFMH0DmGc+2
         Q3toyVHlDyr51z3lLsEkJulhz5atBUsIpZCkworBA2fIDC3ih/jPv9Sn5836h+2H6Ljw
         IcGjY2Y/fyPWY7pmoZ/050nGanDZ78+xXcVZSBPK5Vy+b2j/fkRQJ6Y5w946ZkRqtpSs
         sDC5RTKvEBmQmD/rCzvMGlFbzI4e5WacyCuNvoPuJ9gDD6UUQEy16BHkGdFrVBrx16Kf
         t8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXGIGcxsj6SGQcdTe+OdQF9fMwNOVymXrQ55dO3JsARp/4XTPGG0tlBeDhcRF/ehlzCLJmryO46xNY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjxvF5a4RcnlUhAQxo+81mhqJja8iG2nJw/2kcKyb490cjWpX3
	Uzj+oUC7C3B+fRa5FFSrd2Tx/7zV0FJml2v3m85J8tNzOzhYfNQNWlkI1JL8LfU8vg==
X-Gm-Gg: ASbGncsHzEhYqz+c//fkVRxUUf6gAMkDwqpl5DHHPzolnwNtD0/bsjlj+67acxyy7Uf
	8HW5PJLyS0bLNcyMejtEm7kEmXhv2cB/wZOt3adOTKeiwFQSLdJis2ohFxiBE53mPBpDLTAyTix
	6UAweGrrtKiXdM3OU67fZYOGpRGUC6A7JJb5SZuD8Xw/4ucOV8BZV9H8KUeX2aN/GbhetukdOdh
	qziSIL4Cu3FbOrGUkgqgMo69jW9w/6SlEyXsAD9TGdKD37WI8OtJH+ccvwGvJb3n5zFf+pWQV9o
	OtYOMI913kbJLlPXT9OTuCNNj1FpjWTcRZyWJdLMYJYccQUm1iy3ev7P2lwwuwfUDtZkUO6WuyU
	+7SycPLfDChnjFCWZkoUrVRkjPEZCm7d7/6NGs5wY0xZFPcqPlW6ARh0fMhOwv6lC1WH0Dtm4Ri
	rTFa0eYAGpwkoUfWe2hUXe
X-Google-Smtp-Source: AGHT+IE100Z1ddsGq9Y2/LPisjm07X57Zptw60MbsV9iM8ORxSZ5r5gmDL3KAZ4VRZ7TZlf+87mNVg==
X-Received: by 2002:a05:6000:400f:b0:3a5:2875:f986 with SMTP id ffacd0b85a97d-3a5586e8d38mr972210f8f.44.1749619612433;
        Tue, 10 Jun 2025 22:26:52 -0700 (PDT)
Message-ID: <31085457-a33d-4bd5-b6d7-edc0c358ee6c@suse.com>
Date: Wed, 11 Jun 2025 07:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/console: group pbuf under console field
To: dmkhn@proton.me
Cc: anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250606194937.2412579-1-dmukhin@ford.com>
 <db9d23ee-9115-45db-b428-104aeaabcb2a@suse.com>
 <7f965335-68d9-4da5-8ce3-db68583db9a2@citrix.com> <aEhzOcbcfNydaqST@kraken>
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
In-Reply-To: <aEhzOcbcfNydaqST@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2025 20:02, dmkhn@proton.me wrote:
> On Tue, Jun 10, 2025 at 12:24:57PM +0100, Andrew Cooper wrote:
>> Separately, 200 is a silly and arbitrary number.  Furthermore the
>> allocation is unconditional, despite the fact that in !VERSBOSE builds,
>> domUs can't use this facility.  Also, where's the input buffer?
> 
> Thanks!
> 
> I will try to address those under individual changes.
> 
> re: arbitrary number: Will bumping the buffer size to the next power of 2 ==
> 256 work?

Any other number would work, but would be as arbitrary. Since the buffer is
dynamically allocated, one non-arbitrary aspect of the selection may want to
be to make the number such that including allocation overhead it's an even
multiple of cache line size.

Jan

