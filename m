Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4792BB00
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 15:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756277.1164835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRArm-0000yN-O2; Tue, 09 Jul 2024 13:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756277.1164835; Tue, 09 Jul 2024 13:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRArm-0000vn-Ku; Tue, 09 Jul 2024 13:26:46 +0000
Received: by outflank-mailman (input) for mailman id 756277;
 Tue, 09 Jul 2024 13:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRArk-0000vh-LN
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 13:26:44 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1e0bc27-3df6-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 15:26:43 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52ea33671ffso4732158e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 06:26:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ad2340sm16258525ad.283.2024.07.09.06.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 06:26:42 -0700 (PDT)
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
X-Inumbo-ID: e1e0bc27-3df6-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720531603; x=1721136403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oy5GH9jFwx5NOEVZWaD/+3vlfO6KDffFDSsI/d05sHo=;
        b=GB+C1NC1bqDve2BG1ilmiPeOS4f1OdK1TfUwIpfB/Bm8HjKJK4C5Qmrs0Sq2z54H9m
         /0KkKwW4KhM1FSjbhjo6VSspRfgerlIdR0Yw+3OMNfIHT965YJQj7U67fzgPwA1lt8IU
         iu3LjSSeQQPADRUX7EjKeBMheDu3MWvDd7rv9E1klCXHCxX/Hs1ynZQmeWIY8GK+trSU
         CBCjaVR62Ivn0zE2EJfgdAzQd7zAauPTkWNnjorSlZG2IA3JU5eLAkP/piYTlgNsvrji
         AO3BOfx8QOqGwgk7GWQNfHQ6DVvU0xEjddUh7MtFU3kpB8GG3uGW59lZZcAuwsOjrGVq
         riKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720531603; x=1721136403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oy5GH9jFwx5NOEVZWaD/+3vlfO6KDffFDSsI/d05sHo=;
        b=UnB3NiCdDCWsfLTiWSixtEiybvP2HnZCezygRkQqwzwXnquz5e7sNF3uxBp4N8BBkz
         e0YUQ90XTg2/Cb6sevF3vw/UjPENwpVjRtljODb/mvJH+cxR1SwRk21vGyBbcA21bArE
         PEg0HO3mMNAp2N5lu0Fjjo/zIg/4EvC/H3QDzUz/hu9xZ2LJ06x2EAaI9w2PUWMjo4Pg
         d0ynUhRsTO5bxmve7xC7VGKdOLY4ZnFgHMsu1cyQKGQkBnd2MFzBbWSqKpqlMPd7Uzyc
         mvFVuFyJWcpts840ggWdUixCiJG0gaF8vg8TE0VHHgzvS2/jZ/GaehQIkX7NvnGUel9W
         V6kw==
X-Forwarded-Encrypted: i=1; AJvYcCXFJR5JWTuDmgzwKj9Q1nuQ0xOsRl7iFe0y7yL0kVS3UyGm6SScDt1VJtaiCX62bMgBwkZAW1mZM9WY8e5nlL5p4dw2pwdpQvP91Se4zv0=
X-Gm-Message-State: AOJu0YzHdWyaB6Vh2YlHUV3jFMeqnjaxpoNrc1luBZCkuw2vwQdNCDEd
	TeichczwtQrz2Re/EGKBy0ZAxRXXo5sF8/QIeGBr55Mb5FS4hmBrq378Um2dnw==
X-Google-Smtp-Source: AGHT+IEF2LAJArbzMuVYk25lOW8n6uRbcyqMsCOOrpw1g/wOB2k9PNBYKwfEiOokiXWFSIr/eFvGLg==
X-Received: by 2002:a05:6512:3984:b0:52e:767a:ad9c with SMTP id 2adb3069b0e04-52eb99d3230mr1778638e87.53.1720531602757;
        Tue, 09 Jul 2024 06:26:42 -0700 (PDT)
Message-ID: <ef611901-03bf-4aa9-9de7-ac6d4fd82d05@suse.com>
Date: Tue, 9 Jul 2024 15:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 5/7] tools/libxc: Allow gsi be mapped into a free
 pirq
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-6-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240708114124.407797-6-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2024 13:41, Jiqian Chen wrote:
> Hypercall PHYSDEVOP_map_pirq support to map a gsi into a specific
> pirq or a free pirq, it depends on the parameter pirq(>0 or <0).
> But in current xc_physdev_map_pirq, it set *pirq=index when
> parameter pirq is <0, it causes to force all cases to be mapped
> to a specific pirq. That has some problems, one is caller can't
> get a free pirq value, another is that once the pecific pirq was
> already mapped to other gsi, then it will fail.
> 
> So, change xc_physdev_map_pirq to allow to pass negative parameter
> in and then get a free pirq.
> 
> There are four caller of xc_physdev_map_pirq in original codes, so
> clarify the affect below(just need to clarify the pirq<0 case):
> 
> First, pci_add_dm_done->xc_physdev_map_pirq, it pass irq to pirq
> parameter, if pirq<0 means irq<0, then it will fail at check
> "index < 0" in allocate_and_map_gsi_pirq and get EINVAL, logic is
> the same as original code.

There we have

    int pirq = XEN_PT_UNASSIGNED_PIRQ;

(with XEN_PT_UNASSIGNED_PIRQ being -1) and then

    rc = xc_physdev_map_pirq(xen_xc, xen_domid, machine_irq, &pirq);

Therefore ...

> --- a/tools/libs/ctrl/xc_physdev.c
> +++ b/tools/libs/ctrl/xc_physdev.c
> @@ -50,7 +50,7 @@ int xc_physdev_map_pirq(xc_interface *xch,
>      map.domid = domid;
>      map.type = MAP_PIRQ_TYPE_GSI;
>      map.index = index;
> -    map.pirq = *pirq < 0 ? index : *pirq;
> +    map.pirq = *pirq;
>  
>      rc = do_physdev_op(xch, PHYSDEVOP_map_pirq, &map, sizeof(map));

... this very much looks like a change in behavior to me: *pirq is
negative, and hence index would have been put in map.pirq instead. While
with your change we'd then pass -1, i.e. requesting to obtain a new
pIRQ.

I also consider it questionable to go by in-tree users. I think proof of
no functional change needs to also consider possible out-of-tree users,
not the least seeing the Python binding below (even if right there you
indeed attempt to retain prior behavior). The one aspect in your favor
is that libxc isn't considered to have a stable ABI.

Overall I see little room to avoid introducing a new function with this
improved behavior (maybe xc_physdev_map_pirq_gsi()). Ideally existing
callers would then be switched, to eventually allow removing the old
function (thus cleanly and noticeably breaking any out-of-tree users
that there may be, indicating to their developers that they need to
adjust their code).

> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -774,6 +774,8 @@ static PyObject *pyxc_physdev_map_pirq(PyObject *self,
>      if ( !PyArg_ParseTupleAndKeywords(args, kwds, "iii", kwd_list,
>                                        &dom, &index, &pirq) )
>          return NULL;
> +    if ( pirq < 0 )
> +        pirq = index;
>      ret = xc_physdev_map_pirq(xc->xc_handle, dom, index, &pirq);
>      if ( ret != 0 )
>            return pyxc_error_to_exception(xc->xc_handle);

I question this change, yet without Cc-ing the maintainer (now added)
you're not very likely to get a comment (let alone an ack) on this.

Jan

