Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPsqKyvjkmndzgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:28:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1464D141F2E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:28:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233839.1537195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrutV-0003TS-9s; Mon, 16 Feb 2026 09:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233839.1537195; Mon, 16 Feb 2026 09:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrutV-0003S0-76; Mon, 16 Feb 2026 09:27:53 +0000
Received: by outflank-mailman (input) for mailman id 1233839;
 Mon, 16 Feb 2026 09:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrutU-0003Rt-8p
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 09:27:52 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3087fcb-0b19-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 10:27:50 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso12408545e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 01:27:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e50casm426202565e9.8.2026.02.16.01.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 01:27:49 -0800 (PST)
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
X-Inumbo-ID: c3087fcb-0b19-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771234069; x=1771838869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+ql+GIWMppTb8kZ0VgaFP+Z0n5TfZNDF/5RTtultxMs=;
        b=c1beRV5JF36i9ejossYljsC+ufVQWDRoFsgU7pDY5l+cU5jxzyJAU02AU0P2FTuJw1
         IYx8OgmPCBDayOOwdnMuZxFR15kSj0/AQiUViufep+mFbSBw9Q7smZ14IINvqzXCiOt3
         Fun8q+XqmyQW+Jf5E9L7aUPeUSWtcUFfAobLGuhRlhQIU2I77ePGRQ2XXMKFy1U/dbRK
         KUpuRcgvLO3uPkdrWggYsIHI1ymgnAPlvYXp0WRqCiL54+dAEljVxgpMRBeJHFSdGGci
         eJtfmwRvFxzEk/0NLUjb2gYoGgg1hB+NKhQxI8L4OXV7JUVmbHX7xBwf7AozJae08cSD
         zG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771234069; x=1771838869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ql+GIWMppTb8kZ0VgaFP+Z0n5TfZNDF/5RTtultxMs=;
        b=DiPDuHJkjn129jPVaun3T160ViljOi4jNA8KWIardQmEkJyVV6SWM9yRhMH52Bk1Z1
         IC7+yV6SWJD+gjpzZG6V1S+GcJClcNyV889Qj7ZZvGDSvVyiYMClPX4afs3oTcu8bQRO
         Kmk+b9XUWv7a5fu6aiQJBAB5H08jb/CvOD9zgs0MBngQVLJHGGvdQHPv/NluuWBHIDJL
         cMSfgPRW33Nxk0kBLdaSMgQ8ddy/FBXohBBQ1EfOaRdavCnfUsmbi68UhyBHK92sITQW
         vmNrWZ7Jh15X0awTeICCUtMD19wQOUphGVcNHzImApreyGANClyiYvTvQcE/kDjh8HKn
         OdWQ==
X-Gm-Message-State: AOJu0YxdkdHrxwep98y2YOycCXNeQim38t0htlLxIy3Sshs5DTkFVtGk
	/Lnl7Tl1Jm++5hMwPbsPLGkGXYoZAxsHpQB3I5GhiqMMFFXUpCZ9HbiFdN9QNfC7LDsK0oHbzkF
	QGdY=
X-Gm-Gg: AZuq6aIrJNyzR09P9+w797jaF7PajTdHZfjykmiC4xHK9Gnbep2ASahdOQ0VKKQLLX0
	DioR7T7Xv9NgSusGZet0xmGqQbRrpYIFw/EcAFgzAazKrAc2LsxUrOcm7GlKqxS0Px/Ccoq5GW1
	eLK0P3emssR/0BqlQtKbKA9uMB8oBMiGX/aHqQ5Zg6VgOtoRhwwHWydhO9wEkBhCXnzyaCDbLVg
	tdgAtUTF4MSM7an18XZlB3vP2yMqHD7EnNShhvsXXGGiY54IFmiM93/0YV8thKAVSgZVhRDo5va
	7QW2xy+Nx0R8135g2n7mxgEfRp27ypZ3+L419WtcLQ+ZRWP7FEMgRSNPOTyxN56WAKdGNPIL9eD
	Z2wxEPrzlh8EvTn7PY1xEx6bywoUWImo9pAJ6CNfV4TOYnSX1btJPfLMy8409rXv3bbXZp9yAQH
	hCkiLNgMupEi3dKWjltPTS+idE8UYKzK6DMnJNzkVgIiQivDTQQZRCDY3Ha+d09TDBvZgBS36Ue
	4namTPsT8XTUGE=
X-Received: by 2002:a05:600c:3b10:b0:480:4b59:9327 with SMTP id 5b1f17b1804b1-4838c063f8emr6513745e9.1.1771234069451;
        Mon, 16 Feb 2026 01:27:49 -0800 (PST)
Message-ID: <b9d1eb04-6d67-44b8-8da4-7c7167340bd5@suse.com>
Date: Mon, 16 Feb 2026 10:27:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cannot boot PVH dom0 with big initrd
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <aY6iVr990vWeO2p5@mail-itl>
 <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com> <aY9Jt1-jCWhStcxB@Mac.lan>
 <aY-MPz-HpZVkmhob@Mac.lan>
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
In-Reply-To: <aY-MPz-HpZVkmhob@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1464D141F2E
X-Rspamd-Action: no action

On 13.02.2026 21:40, Roger Pau Monné wrote:
> @@ -336,14 +344,28 @@ unsigned long __init dom0_compute_nr_pages(
>  {
>      nodeid_t node;
>      unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
> +    unsigned long init_images = 0;
>  
>      /* The ordering of operands is to work around a clang5 issue. */
>      if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
>          parse_dom0_mem(CONFIG_DOM0_MEM);
>  
>      for_each_node_mask ( node, dom0_nodes )
> -        avail += avail_domheap_pages_region(node, 0, 0) +
> -                 initial_images_nrpages(node);
> +    {
> +        avail += avail_domheap_pages_region(node, 0, 0);
> +        init_images += initial_images_nrpages(node);
> +    }
> +
> +    if ( is_pv_domain(d) )
> +    {
> +        /*
> +         * For PV domains the initrd pages are directly assigned to the
> +         * guest, and hence the initrd size counts as free memory that can
> +         * be used by the domain.  Set to 0 to prevent further adjustments.
> +         */
> +        avail += init_images;
> +        init_images = 0;
> +    }

Just to mention: It's still only "may be directly assigned", because of the
PV32 special requirements.

Jan

