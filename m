Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5658671AB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685430.1066126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYSV-0002TT-Ek; Mon, 26 Feb 2024 10:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685430.1066126; Mon, 26 Feb 2024 10:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYSV-0002Qh-B4; Mon, 26 Feb 2024 10:43:43 +0000
Received: by outflank-mailman (input) for mailman id 685430;
 Mon, 26 Feb 2024 10:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reYSU-00026v-5z
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:43:42 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e829e2ba-d493-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 11:43:41 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so445091266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 02:43:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m14-20020a170906234e00b00a3d11feb32esm2278193eja.186.2024.02.26.02.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 02:43:41 -0800 (PST)
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
X-Inumbo-ID: e829e2ba-d493-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708944221; x=1709549021; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kkLFz815u90oFK+cyB0VCAdP704LGkuFGdIMHsiNoXk=;
        b=HnF3ghsTCLc/UnYNpRaNlDP1RVdz1RtDR+24LVfYIoWsVaqQwTCU/ZEh1O991jOb3/
         KiK6mGl5ojkIACwRuu5n2ldSTtU4DsLA8HvY2BDNVDXxYy7VcYIeCtAwpmVvPFSe192b
         pp+qcXpkbhQ5t3yUObnm6+PcIuAGpUusiDdmb01z39dMcoQebaC5lUp6riidBvSryBMV
         AckFzd++o7ljAtJsO8N4pIdmWGz6hdBkfPx9bC93YrX7fH86WD75wdTv3iLWA6D5VFkO
         +FQUTRvkHfPOUdcAQ8H3B3vMD/1/EyyH/5Vj0nopQpyuSJzsmwbnFV4+f6r4+sgDVfBP
         RwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944221; x=1709549021;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kkLFz815u90oFK+cyB0VCAdP704LGkuFGdIMHsiNoXk=;
        b=ZWAcS2G4PvVyEHKH9Q/qEB3B0Xv0X3PMihfyU6yjETQ8KkaQM6SzdfFK+LncmpOt94
         Lpk6wcAKXYDBM1loHqf28lk/WStGTk1VBIqMF1Job6DcQBmYmvSTXWG0tT0lh2AaBVpE
         Dr2c8YahpBvAt/6P+JIBEW2AiiA0irozLOmo9zgye0suoajqW5YNZT3dEJ+MRSdOzCEe
         K9fokBhIt+iaqCmhJKmFwCS/zueh5cZMS/r+c9ToyW3n3yBO02tLxljocYxV3vm/0a71
         VMeq/G7FD1cr6qgE8rD8NW++S8TAWWiUL7Eh4h4J6hanmgj+SJHx9fSewl/XUy/aupZ+
         xqNw==
X-Gm-Message-State: AOJu0Yw/W+JUpToq93dkcfxVC67PREDi227VfwqKQ5n+otiDTA1CbCN2
	jtoGXx8r04dFXjimslL/7+vt1kOJqf6S2lwvRFmmDGwzW4WPsOsZQn75dk1pd7uMWYK1NjKT68Y
	=
X-Google-Smtp-Source: AGHT+IHfbiA8xXwqgcMkUSmP5UyGdoPWknGwuDaATFEuuUAcGukTENPcOVenSG88zOwZmm7Wqi2ADA==
X-Received: by 2002:a17:906:3659:b0:a3e:da6:85f8 with SMTP id r25-20020a170906365900b00a3e0da685f8mr4317975ejb.30.1708944221200;
        Mon, 26 Feb 2024 02:43:41 -0800 (PST)
Message-ID: <94418e0e-1805-4c30-a4a7-4e9cbfaf984e@suse.com>
Date: Mon, 26 Feb 2024 11:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] gnttab: hypervisor side XSA-448 follow-up
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: almost fully ignore zero-size flush requests
2: restrict GNTTABOP_cache_flush to Arm

Jan

