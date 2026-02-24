Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEhhAodUnWk2OgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 08:34:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4871E183144
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 08:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239462.1540869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumvx-0004JK-8C; Tue, 24 Feb 2026 07:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239462.1540869; Tue, 24 Feb 2026 07:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumvx-0004GV-4O; Tue, 24 Feb 2026 07:34:17 +0000
Received: by outflank-mailman (input) for mailman id 1239462;
 Tue, 24 Feb 2026 07:34:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vumvv-0004FN-O3
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 07:34:15 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37db3c91-1153-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 08:34:14 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-483a233819aso49949545e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 23:34:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b6698asm413917225e9.2.2026.02.23.23.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 23:34:13 -0800 (PST)
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
X-Inumbo-ID: 37db3c91-1153-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771918454; x=1772523254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xhtC5+tEyo4ZFZMgMkxSRtElnpKxvA7+UwHM+hFwGDM=;
        b=MeDjk55OwYpcoXyTuc+qkrTsq0/kZK3dMdyIGk1OIy24tRy+L0YE48q6EOo96VaTux
         1YMEtIfYmBFwvZNRgc6/MfjMDZWUonMlieUEmDAgQUQhgwl8e8HgptKODaaV6FPYkec2
         5BbJJtLxUd+mtgG2QxL+Ze3cpOjwwE+MXxl3nJ89EIJVT+MXZB5Gy9U6+x9jGkH02QUQ
         AzjYmDn4i4Ac7MrbK1ywc2BJ3bZUy6mTZdnwpLEBDJ4U094Em1/KXLgfUWMjHkyWIGyc
         I57SyZHXfckfeXEEwEI6mRJebvwyDzfngbEUgB53FQCppU59NHQjfoE8RdMNsgd1xiMd
         aCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918454; x=1772523254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhtC5+tEyo4ZFZMgMkxSRtElnpKxvA7+UwHM+hFwGDM=;
        b=Ryc1r43yWASJwBbFpDzyemVDQAvznamYlcmpr5qsl+tgnwU3tFU/CcoIWDiwS4G9/8
         Le+4MxRTtPYfPd0CqhDcjBhJHUvtcZS4yjz7KjBUn93ZGhoAIiE7wgYkAGn/V2CjerXO
         5ltAItKzeiREcFRMqArwHqP9D6FsG9V5n+EfC3myb+urPIG68SuJ1N5LYVPwoWEPr7ti
         gzPcoIrpYimlfPkMRcJRnEBx+Xx5I0Puil+JwG9MgIQGIVhCQozELm1Wr0UGhGfFvaFh
         6ngpTh8nc0rya+iHnalb9Os4t7JhJWBCsx2qe8n4s00NftSbvFBIcbOHHkV0uv8QExts
         u5QA==
X-Forwarded-Encrypted: i=1; AJvYcCWtPmRgXTQMIaTzhIGOUMZwwHHgqhRPQg6uPxdfcf6K2jmJOA0EO4J30ucC3PsXWNNd+0p6YKg40cg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFOr/fGIbeogL2NSbP89+vlIgltzVlMTC5jjFFSNHZrflrdgLd
	mbFLrbUBWYubDB/Ef64oRTaF/cml0PJt2S3ThgjRGdmiD27lLiVpJMBp9twhnO1Rng==
X-Gm-Gg: AZuq6aIhWW6dFejAhrNjG1yzvaS3HCbs1bwDQQVda8C/6HsO3Argif7AINOz79rKyHN
	jvdn3Rr9J+0zZ8K+nAFyq6h/Rj5YMlpGR7dnPh6D9w+7UnykU2ljVDCkuCo9oOT1yomVGiFlL0Q
	a0uqAFFG1bJcCcIG4sdDPxVyETqN+j9r0SFWE8C1TpSox9N+8sKN1FrYQXO8apcZ8Waka+FN7SW
	viideS9B02G/OtMHmzkWBgRJt/cFGvGSVTxOhh0ROmYCQeJmWJO6hNmKAVlXr4vdYQPXN1v9TSK
	Wc8PyvlHPQS8d0xtxSlUmVdPbq5BlMyCRRp4KsKqasTtwAnHYBByzJL09nvKhVC14p5h8ZGCetd
	AzYcs5zApYIPIknd/7xq1/pKqY42ekgNMQ8aYA9DxBEZrWrxCyfULp4B5K8BAvA5Y/Npl7ybnm5
	yh0Xmrpv02/k4d6IMu+iJoIVW/xOe+YjXdYASBn7Fu96klzg/gf8ODv5JZjzO8WhZ1cySBi55mr
	5z8HynIabtFWhw=
X-Received: by 2002:a05:600c:8011:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-483a95eb3eemr169413595e9.6.1771918453646;
        Mon, 23 Feb 2026 23:34:13 -0800 (PST)
Message-ID: <c23c84be-d4ac-4ec6-b723-a6a76828a1d6@suse.com>
Date: Tue, 24 Feb 2026 08:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vpci/msix: check for BARs enabled in
 vpci_make_msix_hole
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260224025626.26909-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260224025626.26909-1-stewart.hildebrand@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,gitlab.com:url,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4871E183144
X-Rspamd-Action: no action

On 24.02.2026 03:56, Stewart Hildebrand wrote:
> A hotplugged PCI device may be added uninitialized. In particular,
> memory decoding might be disabled and the BARs might be zeroed. In this
> case, the BARs will not be mapped in p2m. However, vpci_make_msix_hole()
> unconditionally attempts to punch holes in p2m, leading to init_msix()
> failing:
> 
> (XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
> (XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it
> 
> vpci_make_msix_hole() should only attempt to punch holes if the BARs
> containing the MSI-X/PBA tables are mapped in p2m. Introduce a helper
> for checking if a BAR is enabled, and add a check for the situation
> inside vpci_make_msix_hole().
> 
> Move the vpci_make_msix_hole() call within modify_decoding() to after
> setting ->enabled.
> 
> Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2344925375
> 
> v1->v2:
> * new title, was ("vpci/msix: conditionally invoke vpci_make_msix_hole")
> * move BAR enabled check to inside vpci_make_msix_hole()
> * introduce vmsix_table_bar_valid() helper
> * move vpci_make_msix_hole() call within modify_decoding() to after
>   setting ->enabled
> * split typo fixup to separate patch
> 
> v1: https://lore.kernel.org/xen-devel/20250812151744.460953-1-stewart.hildebrand@amd.com/T/#t
> ---
>  xen/drivers/vpci/header.c | 26 +++++++++++++-------------
>  xen/drivers/vpci/msix.c   |  4 ++++
>  xen/include/xen/vpci.h    |  6 ++++++
>  3 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 739a5f610e91..6a28e07a625b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -122,19 +122,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>      bool map = cmd & PCI_COMMAND_MEMORY;
>      unsigned int i;
>  
> -    /*
> -     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
> -     * can be trapped (and emulated) by Xen when the memory decoding bit is
> -     * enabled.
> -     *
> -     * FIXME: punching holes after the p2m has been set up might be racy for
> -     * DomU usage, needs to be revisited.
> -     */
> -#ifdef CONFIG_HAS_PCI_MSI
> -    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
> -        return;
> -#endif
> -
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> @@ -164,6 +151,19 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>              bar->enabled = map;
>      }
>  
> +    /*
> +     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
> +     * can be trapped (and emulated) by Xen when the memory decoding bit is
> +     * enabled.
> +     *
> +     * FIXME: punching holes after the p2m has been set up might be racy for
> +     * DomU usage, needs to be revisited.
> +     */
> +#ifdef CONFIG_HAS_PCI_MSI
> +    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
> +        return;
> +#endif
> +
>      if ( !rom_only )
>      {
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 516282205a53..142cfbae59d5 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -598,6 +598,10 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      if ( !pdev->vpci->msix )
>          return 0;
>  
> +    if ( !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_TABLE) &&
> +         !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_PBA) )
> +        return 0;

What if one is enabled and the other isn't? Doesn't the check need to move ...

>      /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
>      for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
>      {

... into the loop, and then apparently also need mirroring in the hwdom-only
loop further down?

Jan

