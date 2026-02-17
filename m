Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFPgBzQ2lGlpAgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:34:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EFB14A6F9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:34:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234702.1537855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsHTM-0005Ow-Ik; Tue, 17 Feb 2026 09:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234702.1537855; Tue, 17 Feb 2026 09:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsHTM-0005Mk-FW; Tue, 17 Feb 2026 09:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1234702;
 Tue, 17 Feb 2026 09:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsHTK-0005Ku-Oi
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 09:34:22 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6de4fc7-0be3-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 10:34:21 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so28768915e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 01:34:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99e194sm383017835e9.8.2026.02.17.01.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:34:20 -0800 (PST)
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
X-Inumbo-ID: d6de4fc7-0be3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771320861; x=1771925661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6YC5RdGkPrIB2BXP5n6V9ihvuQDwd7qIpNXEXiWPI5M=;
        b=BTs9J6yBHqW/N5y3FPc1FCf+25KyOWIlGlBoNPkF1+m2luUmyYNnRhI40grm9YiPGo
         3qXxc0N+tJ6eQJjTMxSnX58H68mZL0sgykK52UMe7Tuez3cPP15J9KSt0CPBtxLoELFF
         VHDCxx1083swyRdy6NCgwzQuT89P3xs7kzfvZcTevfg1FqNZZb4FvmA5gaVWAaHq0G/7
         2qqc1imkLzAZFRYYBK/pexVIbuveSA48RnCIELKzEyeV7OzEcsjkOvHcOV171fcUD3my
         hVG0Xy6QgAG3tFnc85EFS75JiF9NwaJcOlQjebogLFG5CGlTJVUI5JXUQKu81nXbPZ6F
         CavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320861; x=1771925661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YC5RdGkPrIB2BXP5n6V9ihvuQDwd7qIpNXEXiWPI5M=;
        b=CzYb1Gr/i/G1urFoUJLH8dHLCaYatoafvAjY+lZVXLXre6PXhURbEH8A2O1JcUCFhh
         PP/WnVQ4yQV83nEJrpZik6dkj1mcT9ilIUXQkB+Av+LxR1lm9QXkKoXBdpQVmEKQ0ciP
         WxUNtq0+p/kO6zCInWzPCF2tSiHjQqzlWcaTnw760f2/kW/8kVErHPxlBceB+0FcC62P
         /Qay71ValUb0qON5ivqoo9d5NVUWkeprE7maNYf/QNFNUUMbjCCRib4V0hmXCdisrBIi
         VSr7w0d4+GdY9QfCliugthHO10Qj9uXwD90hJCqTpWLs+PUezKm845jdPsbOVnAK2wzp
         eD0g==
X-Forwarded-Encrypted: i=1; AJvYcCVMaD6xGAcbgaxww/dML05ld1q1z3/ytlDvJ6GXpASvfqxAbWwDEBDogkUM5KhnAUe8fjklGCq+9uw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTCpO9EA+qQrNtVhBcrZ9SlVLpT3T4/MMo1xn1CoOxnNTtctKh
	97gFZZv702zkiLpIKBQN71/YXOFlyRglGST+NTaYQlGvxXVBMpXqLpBxVKWRYNN08A==
X-Gm-Gg: AZuq6aLG3OwlJ45wLlIOUi3qeamSzs+QXGeXjSDaHbmP81EDV3Cz3cV/H63PH5GcrEg
	yjlXlssqBGXqiAFKlj0YS9wdSzaTTV7DhdcGtG/OGZc2vdBSVL+S/qfrVCaV9Qisn1ZyWTsT7rC
	fZxxOg0WLwmo8tJ2cKLp1OoqjFTBQZXNgmvQhh0jYE3VKxFyEuq9vsb3LlGiF4YNEpXOekUm/G4
	xPb0WJu5c/4ZEGpaQnMc9XhJIF52QUynWD+6JBCGYAIyjkkp0jSwNjpe20jDXkmWCosl8EAZSxc
	RmdVIs39NOttIdF23q47dnR5GsGp6nsaV5BW2hugRNF3+6OqP1T3AN4t2rqlpn9kJhYjmbsZZdc
	pXdXZP8wMNeONrUl0888fUYk91/V7+kqAYu0DkQs3CRrLtGDICNgQy+SvgAwWJVf4boCaK10+B6
	G/1057Q54bXFlYQnp8k70adB5pM3WuDr0i172Ua5SF+iqubCRPN3uWXjohR0tBP3Dtd1cWWYnXS
	JI54Jj+5tiaWMs=
X-Received: by 2002:a05:600d:6443:10b0:483:8062:b43 with SMTP id 5b1f17b1804b1-48380620d3amr108277755e9.19.1771320860886;
        Tue, 17 Feb 2026 01:34:20 -0800 (PST)
Message-ID: <1a1d8db1-d553-470a-8678-b879385b2fec@suse.com>
Date: Tue, 17 Feb 2026 10:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] common/domctl: xsm update for get_domain_state access
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260216215748.20398-1-dpsmith@apertussolutions.com>
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
In-Reply-To: <20260216215748.20398-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:rogersc@ainfosec.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,apertussolutions.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 85EFB14A6F9
X-Rspamd-Action: no action

On 16.02.2026 22:57, Daniel P. Smith wrote:
> When using XSM Flask, passing DOMIND_INVALID will result in a NULL pointer

Nit: DOMID_INVALID

> reference from the passing of NULL as the target domain to
> xsm_get_domain_state(). Simply not invoking xsm_get_domain_state() when the
> target domain is NULL opens the opportunity to circumvent the XSM
> get_domain_state access check. This is due to the fact that the call to
> xsm_domctl() for get_domain_state op is a no-op check, deferring to
> xsm_get_domain_state().
> 
> Modify the helper get_domain_state() to ensure the requesting domain has
> get_domain_state access for the target domain, whether the target domain is
> explicitly set or implicitly determined with a domain state search. In the case
> of access not being allowed for a domain found during an implicit search, the
> search will continue to the next domain whose state has changed.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reported-by: Chris Rogers <rogersc@ainfosec.com>
> Fixes: 3ad3df1bd0aa ("xen: add new domctl get_domain_state")

Nit: Fixes: first (or at least ahead of S-o-b) and other tags chronologically
ordered, please.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -210,7 +210,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>  int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>                       domid_t *domid)
>  {
> -    unsigned int dom;
> +    unsigned int dom = 0;
>      int rc = -ENOENT;
>      struct domain *hdl;
>  
> @@ -219,6 +219,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>  
>      if ( d )
>      {
> +        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
> +        if ( rc )
> +            return rc;
> +
>          set_domain_state_info(info, d);
>  
>          return 0;
> @@ -238,10 +242,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>  
>      while ( dom_state_changed )
>      {
> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom);
>          if ( dom >= DOMID_FIRST_RESERVED )
>              break;
> -        if ( test_and_clear_bit(dom, dom_state_changed) )
> +        if ( test_bit(dom, dom_state_changed) )
>          {
>              *domid = dom;

This is problematic wrt other work (already talked about in the distant past,
but sadly only making little progress) towards trying to pull some of the
sub-ops out of the domctl-locked region. This subop is one of the prime
candidates, yet only if the test_and_clear_bit() remains here.

> @@ -249,6 +253,15 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>  
>              if ( d )
>              {
> +                rc = xsm_get_domain_state(XSM_XS_PRIV, d);
> +                if ( rc )
> +                {
> +                    rcu_unlock_domain(d);
> +                    rc = -ENOENT;

As you don't otherwise use xsm_get_domain_state()'s return value, the need
for this assignment can be eliminated by putting the function call straight
in the if(). Then again, to address the remark above, overall code structure
will need to change quite a bit anyway (so the remark here may be moot).

> +                    dom++;

It may be nice to eliminate the need to have this in two places (here and ...

> +                    continue;
> +                }
> +
>                  set_domain_state_info(info, d);
>  
>                  rcu_unlock_domain(d);
> @@ -256,10 +269,13 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>              else
>                  memset(info, 0, sizeof(*info));
>  
> +            clear_bit(dom, dom_state_changed);
>              rc = 0;
>  
>              break;
>          }
> +
> +        dom++;
>      }

... here), by having the variable's initializer be -1 and then using dom + 1
in the find_next_bit() invocation.

Jan

