Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C252FBEFBBA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 09:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146001.1478496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAkbO-0006U4-A7; Mon, 20 Oct 2025 07:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146001.1478496; Mon, 20 Oct 2025 07:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAkbO-0006Se-7M; Mon, 20 Oct 2025 07:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1146001;
 Mon, 20 Oct 2025 07:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAkbM-0006SX-Hq
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 07:46:44 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb3e6f5e-ad88-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 09:46:42 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-471131d6121so32021865e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 00:46:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144d17cdsm214764755e9.18.2025.10.20.00.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 00:46:41 -0700 (PDT)
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
X-Inumbo-ID: eb3e6f5e-ad88-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760946402; x=1761551202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B1HadU0t8k4JN7ZRq6l7r8ZkLRgJxDZMIeBI0AtYhIA=;
        b=L9DYYjH0CiTJ9BbD/xSVAJUtaFHu6xvoDvhu1Q+i8IMoYeN+GTWmEMmsR9V3tq1fqM
         83cFOzk2dj3EHKrqqc3yfOS7w4gVuS81rPQhwkMZ8XlYT8i3PchDcM4pveZqCXeUN01D
         LOFrc+6hXILbFrSVgozYpLCKT29Bz7dlLFWGJbDp4e9gqK2JmyamLedZGEMRIpllwF0M
         JcDFARz7bjqbMXNLhrl2WsEoczd9p0ol2LQx0GiiHH1FJiZNAw7OXV+doTAZHmCsr9Uk
         6oHuAnz+7FLIyOa67jqvTHvovhKcpv7lQo96qxSRn8JZu1G4QjrEUD4RH7+aP5QKLSv6
         MHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946402; x=1761551202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1HadU0t8k4JN7ZRq6l7r8ZkLRgJxDZMIeBI0AtYhIA=;
        b=LphLR8c59qNdCWr5htzJVoYFhp9ptYnAJbTgqJPPE/cjr/WMzXAXAbnbYG1w1cyM4Y
         M2Od087LDztI+BJAddcS7l2mNgcZRnGIxECoU/eyRGAnogO15qlwZcF2wPuyGRJkEBDa
         PWmwD6I0ZvNtofL9RKsQMb4v3NZ8+fD5LIxbeSuEsIj5kHYQ1NuCey4KD+lwRH8PXD2V
         u9YEU4izM9Ilx36sTtW0HDkjEQkaV9zJC3eWzrlBd83FYlRdR2PIIdrafvvYRKFgkYqL
         sBmP24pk4r8kr1HxLIFOGo4dxS/0gf9Mi9yxYsGt/QjbE6i6LD0Iv8FriPxNcbeTSl2U
         MDqg==
X-Forwarded-Encrypted: i=1; AJvYcCXKsMS84wPSCDsZzsvvkjD4qEWyYX8BCgHE2yCzeHqqD3BmoDepGsbySQrHNEsz6esZqjreZRrAh80=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1CR4nyPboz/VM62osv8RwzPVycnEdCx8bPfhiQ4o4Zg+Gxy3G
	9luEJdVGQzftbq0djNXROOBbW6P9ukXcDOSgj6wbAP+PSeJgAasvudaGPqtM5Ar9nQ==
X-Gm-Gg: ASbGncuUjXXTMK62xhP1gcbn8ZVqkL4X5A+HJGJiQJ6h1o1c28sw654Ufngjewkr87m
	QLY2Luv7pO+UaJGvcBYzRR5VwInJgjuso52PXbETJUizTviwxSAC8H1/mFzz89+uYml6fa74KcC
	of3UzLBfkEptg5fc49sxWrGBeH1sgE8Za0F0Atd6zxaFGM1TlyEdHTHs+5J432P6lNrXN8IbNLZ
	lWdEWKPRkTWk64m+LEzP00B5cH4IArmpA/mHD/wcUvufLTvd5JWzqcVpb+uC9ZWiVJtN6adJVjC
	7PfgZaexNOmwLHvH+G5zmTrdZ+Hllt5YZs0l6PBzHISwfECLcz0k06tikWKIfKpOQA4kkih41kJ
	PtRB0xN0x00ENyY+UEapLvPf7jlJ/uw/hV2bH4Uq7VDbg0HzKk1+kCDYOKLqwmZXYyIhd1kVtnc
	A/6kAzCQvC1nexs2x0SxLDG2dMoW0ZT6CVsXFHunQpW3B0Csn2/1t4YEqlWFmI
X-Google-Smtp-Source: AGHT+IHd6HETIH55DBmeOw9uKWSCE2czgfajJ+6IOmLC/7qhsU/lcidBkFkqHiFFx+WVYuGMhIOTEw==
X-Received: by 2002:a05:600c:670a:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-471179017f3mr74140645e9.21.1760946401750;
        Mon, 20 Oct 2025 00:46:41 -0700 (PDT)
Message-ID: <706663d2-61dd-4fb0-b278-d3282dc7b5ca@suse.com>
Date: Mon, 20 Oct 2025 09:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/libxc: fix xc_physdev_map_pirq_msi() with
 PCI segments != 0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: oleksii.kurochko@gmail.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20251017141434.15205-1-roger.pau@citrix.com>
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
In-Reply-To: <20251017141434.15205-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.10.2025 16:14, Roger Pau Monne wrote:
> Otherwise it's not possible for device models to map IRQs of devices on
> segments different than 0.  Keep the same function prototype and pass the
> segment in the high 16bits of the bus parameter, like it's done for the
> hypercall itself.

While easiest, that's an odd interface, though. Should, at the very least the
function parameter then be named e.g. "segbus", along the lines of "devfn"?

> Fixes: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")

This commit wasn't about tool stack uses of the interfaces at all.

Jan

