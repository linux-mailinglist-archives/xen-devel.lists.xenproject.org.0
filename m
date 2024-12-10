Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5639EB683
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 17:34:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852885.1266551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL3B2-0001bw-Ak; Tue, 10 Dec 2024 16:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852885.1266551; Tue, 10 Dec 2024 16:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL3B2-0001aC-7C; Tue, 10 Dec 2024 16:33:36 +0000
Received: by outflank-mailman (input) for mailman id 852885;
 Tue, 10 Dec 2024 16:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL3B0-0001a6-Fl
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 16:33:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f525918-b714-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 17:33:33 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso4484304f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 08:33:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef45fa64e0sm9925215a91.26.2024.12.10.08.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 08:33:32 -0800 (PST)
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
X-Inumbo-ID: 7f525918-b714-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733848413; x=1734453213; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FOniwqFGYbZUAFwVqgKH+rDg7KBiSEkg0U77NxhobA0=;
        b=NyuZQHD5Enr68m7X09vQxZFCBXkB/pDiT0V/NUfwqtNLDoBLXsUjXJQPdArXwAIuPn
         DalEWHweuDfvVNkHUvivUoK6DDnc9LUhJvq8wfzavyE7mL83hsrCHycbpoqcJGnIUJZR
         c7sG9iCjkyOjB/hXPvKXxkrJIzOcPc7DQHGHGC5bkjUtBkYRL2oaPB/aUEEu4Ol7fVr6
         TLqoNJkoBmzEmLrvmqJNYWUTYVYBsKX3gK95k9F/Rz9Kxwzl6QuAVte3MrYfOTEczEAN
         82GTFIwkicu5qHV/ThbbU+le3b4oYIXpYoC6EKHA7ZPvLSCrO+SZUXpur1y4TmNe4tu7
         dF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733848413; x=1734453213;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOniwqFGYbZUAFwVqgKH+rDg7KBiSEkg0U77NxhobA0=;
        b=dkMXpSUVC0YA1tbRcqkjpJU7/+bKo7BBmOPjtWd/XVY6V/AaYJboKCj7B3ZrxsXLBp
         DV1eloTQxanxTp4dU8eRPrqPDoxPKzAfP7GOBGp6kE6X8R3IuILaQK+zdWYwR+aDdVni
         MHxOFeakBT26EoGlWiJ0En7Ix9UTOJqoD5E4Iym0ogF6pOQtbmMyc2VKHMIjROsZ4Wty
         xeYX8kJ1hbxnXM0oIehDitlvzW4VsznOOcAzbO9KTu6cGWw6TKHtHdNYdfmtmRAAaLAB
         5DJ6MD5v7zZM/8tNo2BP7hFgehfhPwtDf3AuiLK9XkgXKDQ5+r+LBG2IEjh+No7TYdWe
         xHHw==
X-Forwarded-Encrypted: i=1; AJvYcCXf0Q3/cKR1RRgi6/DhMnoD10zjoM/clqv1LeAS6bi93xuVQFFXP/2qJAFPMc5RJiKQ0qxLTVs+sjM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7kUx+NZWFuwXWBG03DJLKmYBp+tYRL2uTBxTdpw9xlq9PzRZS
	oFxEFUSP2WIS7JS69uxDz73FoGxb0Apc6Ez+pjbacb7thi/KtFxa1sF62PTU+WMDBkf6sVacO60
	=
X-Gm-Gg: ASbGnctVTRBSLij4PeqJX7EtfCI9ojhhmZ55QwnJCQEojchp10W5ZBqQPcEbECZihce
	Ha9BfnY40ifW9bVC6m1P25f2DqOGCh5hCIkZ8d3nQ93lAHW7+1rWcTk2ANY3JJ4+RwTjpBYwy+p
	zfHhbyU4cwlDRMlQWh4GFdeaavxjgzHcodBric7aXpXDyGO/CXTvNlphknIeGRJDDQyPE/+C7Fr
	qS4hK9OMTBUtLIwdVejXF6Ny3DtQNCyZxTU+8E3z1EYHXwNdcdh0FfSX0Hm1vWWK7gw88+eJgV+
	eLDjjW4d3nLwYhMxZY2EtRdd2/bAYpz3RUmazaI=
X-Google-Smtp-Source: AGHT+IHagAhhONRePRDNl4DOQihr5Ufus4/Egzhax8s3bFsJ1ShmiySAlNBbGU7wYAQlW7yUETNKFQ==
X-Received: by 2002:a05:6000:20c7:b0:385:f10a:335 with SMTP id ffacd0b85a97d-3862b350a83mr10636973f8f.21.1733848413110;
        Tue, 10 Dec 2024 08:33:33 -0800 (PST)
Message-ID: <cc349f01-796b-4a7c-9c94-66552ab31b4f@suse.com>
Date: Tue, 10 Dec 2024 17:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: fix memory type in guest_mem_bar_read()
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241210162546.403882-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20241210162546.403882-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2024 17:25, Stewart Hildebrand wrote:
> Currently, if bar->type is anything other than VPCI_BAR_MEM32, the
> memory type bits get set to PCI_BASE_ADDRESS_MEM_TYPE_64 in the returned
> value. This leads to the wrong memory type for, e.g. VPCI_BAR_EMPTY.
> Only set PCI_BASE_ADDRESS_MEM_TYPE_64 when the bar type is
> VPCI_BAR_MEM64_LO.

Yet would guest_mem_bar_read() ever be installed as a handler for an
empty BAR? If so, that's the mistake, I think.

Jan

