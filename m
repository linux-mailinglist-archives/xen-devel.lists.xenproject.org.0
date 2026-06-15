Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LCrUHRULMGqIMQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:24:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D090668718B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:24:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KU8TMxkn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338325.1599347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ8EJ-00075S-60; Mon, 15 Jun 2026 14:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338325.1599347; Mon, 15 Jun 2026 14:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ8EJ-00072g-3F; Mon, 15 Jun 2026 14:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1338325;
 Mon, 15 Jun 2026 14:23:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ8EH-00072Z-Ct
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:23:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ8EG-000yeF-MF
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:23:56 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300afb-5cb7-0a2a0a5109dd-0a2a4501da4e-4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:23:56 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300afc-c1f2-0a2a45010019-d1558033ecf3-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:23:56 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-491b390f9e9so27517835e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:23:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2cd6c2sm35052906f8f.30.2026.06.15.07.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:23:54 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781533436; x=1782138236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uJPQfOvk22dPaWInezJnDq0or5byYBtpnuTdO7kjQkI=;
        b=KU8TMxknBRoWRacl7MP0I5eCaQbHlnkVlLXw+/++H0BJms2JSTJRJOQST9J3D+pVck
         Sp2TKrUNNlljrjfLr0ut0PcXXxW08PSRzb3nX88XZIzgBvhbncZn5T3uqPaZ1uw+l6BX
         3x1RlYclaC3CmCCZfBpntAnaPcMc9UGuYkYnMyHDLVVgSijTWCjc208cnftMn0qItOic
         UCakd1w7KUJ1rqF25RpPPKxiXyjV9mzXUIkPmo+N7Ea3j1FvSdzmg2l8Vuo0NboQ8jzn
         +Ggc7jQCzYinddxEiudxiNZzXExm+zD021uv/wDRiP2eSIvu2v6Z1Q1MpP2vsh4UVq4b
         N3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533436; x=1782138236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJPQfOvk22dPaWInezJnDq0or5byYBtpnuTdO7kjQkI=;
        b=iR1IdA/Zxn4qVyp6K0JM6Nwh3tKCAM+JEusbtLHmkGono3G2CwnsJzmM6Xcb41xnD9
         S+xn6AytXh9JSViCGE5YkZtWLA05g/76QaVzA9nObN/2CHJN+oFaSYxs1HWxqaJpaV4c
         BTFamgIhnbqXkG7KBLWRFAB5MgRN3fbhP5n9YkNI8AppRwiz0VWbQaAWNd7srsJo541K
         7k16GwjcPUw0UbebUXokF27H4XKDqoseo49puEkWoDfjlpKZEhZG77qaJzM/01ycDCIE
         PgAcqxlbcouBuRn4YPXFjsNXa5kP400iqJH23yoGEZHciWo/JG/DkVPn+YufVB1+cq0P
         cPaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9clT6Qw9KHd8qBtnyWtIOOQv6051T4PNW7/ddPhIlKUsUWA0+s5CXHufpMdPt4+F3LODVVRNgCRaA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLBYbCuaJ7kMXt0WcWioC4ryUnrNixKDTbi/2G3tpLxTYo4RvX
	L89T4kbOSL8TS9pySmzV+CGkw5qAtxNPAnaKbQ9O9r5AQYnnE5HjyruYF+zWcRxlHA==
X-Gm-Gg: Acq92OHLwRS2ePtYZtvtEAJDnwizq9eEp3gqG3r7tzmDSkiP8F7BIjC4HSbapdzCXQk
	+kcblmEk+BxEwbRnd1hEyKkTYmqwqJVQeI6R0A7GEB1kKX/8yQq4vglPVmtIL+yMSrmrer92bSr
	aW5UNorMLb4EA7terrE5gPFEPgmtlfxRZfB421QOg8Lc7hrMgiciOZdUROkT4w9BAqlVWCJFSaG
	6N7ALwmrrffu3EFpu11vJDz2TfhCFKrtLIJWcD3/f7SWXh4+IhuNyMEQo8yPbc/CAif/0TSlxoQ
	srtti6xTY21z/YfzLIsIIFxqvQrANELYNd58XWgkMWZqzQD+cgf/083MiK+K2jqypH+Phsndtix
	eLN1haA14tMmAxH8i3zcCmjh/pJR7ystvOG1KDxKibZADBX1PbBIVDXPG9VPk7oYxCrai9/DeSt
	qO3vtac7NJa01SLFZKsuLJGILCojTjFII3PLIkjwBCzJcyae179CfnyczOA5u9ZT14SRxKqVgfZ
	W867uFs52XVAgo=
X-Received: by 2002:a05:600d:8486:20b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490ec4fc0c4mr137771235e9.25.1781533435686;
        Mon, 15 Jun 2026 07:23:55 -0700 (PDT)
Message-ID: <9804e601-1b11-47d4-9583-02f1001489a8@suse.com>
Date: Mon, 15 Jun 2026 16:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] domctl: Handle some of XEN_DOMCTL_shadow_op
 without the domctl lock
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260609151528.2426788-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781533436-B5545FF4-5B1E520E/0/0
X-purgate-type: clean
X-purgate-size: 1353
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D090668718B

On 09.06.2026 17:15, Ross Lagerwall wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -559,6 +559,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          ret = arch_do_domctl(op, d, u_domctl);
>          goto domctl_out_unlock_domonly;
>  
> +    case XEN_DOMCTL_shadow_op:
> +        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
> +             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
> +        {
> +            ret = xsm_domctl(XSM_OTHER, d, op);
> +            if ( ret )
> +                goto domctl_out_unlock_domonly;
> +
> +            ret = arch_do_domctl(op, d, u_domctl);
> +            goto domctl_out_unlock_domonly;
> +        }
> +        fallthrough;
>      default:
>          /* Everything else handled further down. */
>          break;

I understand this did already go in as is, yet I have to admit I'm surprised
that it was ack-ed in this shape. For "domctl: handle XEN_DOMCTL_getvcpuinfo
without acquiring domctl lock" [1] it was specifically requested that I
introduce yet another switch(), to limit the number of xsm_domctl() call
sites. IOW I think subsequently this case block wants moving into the new
switch() that the referenced patch introduces.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-06/msg00857.html

