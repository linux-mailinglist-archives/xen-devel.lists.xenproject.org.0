Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKpzMknuiWn4EQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:25:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C115110374
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:25:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225462.1531968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSCC-0007bE-1N; Mon, 09 Feb 2026 14:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225462.1531968; Mon, 09 Feb 2026 14:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSCB-0007Yl-Uf; Mon, 09 Feb 2026 14:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1225462;
 Mon, 09 Feb 2026 14:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/H=AN=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vpSCA-0007Yd-HA
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:24:58 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f78b53-05c3-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 15:24:52 +0100 (CET)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-45f126d47b8so1985101b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 06:24:52 -0800 (PST)
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
X-Inumbo-ID: 18f78b53-05c3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770647091; cv=none;
        d=google.com; s=arc-20240605;
        b=SNlOEs9l884q8jDn6zvMkEVdKxkSn/QKqbyCHxtd/4jlvlpHJV9YzkeSHvHpuLzED4
         kYlQqojVPOGdS6ACxlCk8SZvYHv8FOyEocc4KddeXfke8WFrAS3vqEAUOrlAV2kZtIe4
         2aPwiRa12ZOsLM0YZ3u+NONsol+WgnWPyzP8lMTM81ueWJNlxiA+VPuqckNAkGByYzrg
         j8y5PCOsFvjvOVQet1+3v1dk8E0ITgEn80+DzT4KjO98tLIWfGZ2pYcEwP07drXyO/1L
         ++1/TX9OM9XHwmvKcndvj9P6t9SaeBysXpMmIEt8FfL8StaIEGc5thxmwKwOsVFi7Qzn
         GjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OR3MJ1p16CrcUYxK9iWZWDF0oa/huSemMt4e/B8BbsY=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=c0jqvRyDKUiAqlCf6T6pVTaTdndC21oTrMQ1MtOABhOVG5zDjdMvIGtHMhYFB+V8W7
         63XjuXhpclw+vXg2+A/tS6PaiyYFi3Ya7SyKyD/ZZlupQpZACusHEQUWw538Xtx/AIwK
         WhkN8TqL+HqfmgnViAm02H1VBuP+VNymRfBoPTq+GMPzcfUndHMt1j14JXF8j7jRZdhE
         LwkGlEi4a1Ep7hNpECg6bLHEwB+S305cslp8cW3FCduOoWbns43/TAAQc7BY/2Adkva/
         GbD0rWlZNgvjJ8OuCKZLI1G2PK9vME3QrBGtkTAHaWzuH98GC9mtcyUk4wnlNVIPAtUU
         4k4g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770647091; x=1771251891; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR3MJ1p16CrcUYxK9iWZWDF0oa/huSemMt4e/B8BbsY=;
        b=TNO1IpnX2oSL/JQhUOiB60PeYvE0PC+4lzJptZbV9RojykDq9UUYdbuV47nhAaeGwd
         XTBa3WU1zhIlicO04e6h1fEPQMke7x8sMu/WI1i/SCaNKWpVKZnAR4+j3Cj8iv9cCD82
         S5yvd0ijnBDfVi0cQLIRoFYckBBJkFGDt9eK5wPy8vcCpzbpEvcp/eB3xPC/ZJcu5FXd
         gJZMEGEIwrkrNqrHbKeVrjWGCmg1KfyrWXMEwe4huv8wuq/i+M0M5srWwhY7vjSXqKYX
         Lynev+iXJEgpJ2y6oqFWbSWQS0x0OmpupwK8+EVL7rLqi7Bufv2oW0u60zqEL2C61kc9
         KO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647091; x=1771251891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OR3MJ1p16CrcUYxK9iWZWDF0oa/huSemMt4e/B8BbsY=;
        b=IAhIj5/Lrib/5SEB4NNoE30lcVnJMbd85pNcj+DEffNBZJshiRh4Z1SeLNlPFbXbJe
         vslKkXs/ppeLSGxHGTooiozwt1xXFiBLcLROzw4aM67Ow7Do3e5KM5Bbqk23VWuwvHae
         +vx+Xq8BSEHtsjFvun8jRWl+1UbvhyniKTL58Z9EYBnTyb//FdnMbNkIZcj5XGEOhX8D
         27va8KyKwEa6pXVGJZzhUpCbEszb2LdI3DyJJdRiSteOznLs6zgrWZyfJMAQJoNuTaRj
         uUW+Vyk/s9EMxZrv/cifCfrL/GO8ZQKu2XCMBljYrQKUwiRsmOFR82WVV6lu9nUmBvLN
         22cQ==
X-Gm-Message-State: AOJu0YwvyWnAiksviakn8SX3JOrUYU/MbqMMIh8nmFdauZmUAfdjd1EU
	0ecTyvkI0K4wpxbgBNlyC/IaEJhe7xDTq7n5rw3I+CjsVzYcm4DrIt2RwQfqu7rEf2aY6OOAbH3
	Bnj7b2mp09XGgz+fHCo+CF018hGaA+q5uJqCkHrGw3Q==
X-Gm-Gg: AZuq6aLn+UsKsvgT4Ma6VkzcPjw1RJ9bSgG4MbO6vFHrhZbS+19zH0auBOtZlwTa2pp
	ppcunsULKext2oPsPZBJIva/qe/v/hstqtelA2IWeLbLirZkUiqzIiwfbfNlLtimN7llBaQ7ocu
	YJXwEr8o2GW9aShM/sWZPRDfnYbsk05FVc1tgGzUHPirPBbgOcoDpZ7mRu63dIIDXM3LJhNjUwA
	gRRThUtOUrvUJngH+HXTs4Ugg28uGSi5AcGtBW+81ZPF4mluV84WfG0fULxA3gYXV50HfcjMKxo
	oB+PcFSXrhAzdeI9LsRxNjWpPU7eDdVFfjV2
X-Received: by 2002:a05:6808:c181:b0:45f:4498:35d with SMTP id
 5614622812f47-462fca55091mr5958422b6e.7.1770647091383; Mon, 09 Feb 2026
 06:24:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <2cb24d49d7c72bf15a101cc3be62b3cccbfce3d5.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <2cb24d49d7c72bf15a101cc3be62b3cccbfce3d5.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 9 Feb 2026 15:24:39 +0100
X-Gm-Features: AZwV_Qiyots_TwQKHnPPMI96XR5-4WDBnP74SYNudQ9AyNmV8hCzP66RP8dg1fM
Message-ID: <CAHUa44G7ThfytBBQ=1DRju1z6DY_s+gbndNZOHLCUwf66V+Umg@mail.gmail.com>
Subject: Re: [PATCH 05/12] xen/arm: ffa: Fix PARTINFO RX release errors
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,linaro.org:email,linaro.org:dkim,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C115110374
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> On PARTITION_INFO_GET error paths, Xen unconditionally called
> FFA_RX_RELEASE for the SPMC RX buffer. If the SPMC didn't grant RX
> ownership (i.e., the call failed early), this issues a spurious release
> that returns DENIED and produces warnings.
>
> Modify ffa_rxtx_spmc_rx_release() to return the release status and let
> callers choose whether to log it. Only issue FFA_RX_RELEASE after a
> successful PARTINFO SMC, while always releasing the local RX lock to
> avoid deadlocks.
>
> Update handle_partition_info_get() to only release the SPMC RX buffer
> after successful fw_ret checks, and ignore release errors during the
> error path.
>
> Functional impact: eliminates spurious FFA_RX_RELEASE calls and
> associated DENIED warnings when PARTITION_INFO_GET fails before
> obtaining SPMC RX buffer ownership.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_partinfo.c | 14 ++++++++++++--
>  xen/arch/arm/tee/ffa_private.h  |  2 +-
>  xen/arch/arm/tee/ffa_rxtx.c     | 14 +++++++++-----
>  3 files changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index bf906ed0c88f..6b01c4abe915 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -92,9 +92,11 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uui=
d, uint32_t *sp_count,
>                                     uint32_t dst_size)
>  {
>      int32_t ret;
> +    int32_t release_ret;
>      uint32_t src_size, real_sp_count;
>      void *src_buf;
>      uint32_t count =3D 0;
> +    bool spmc_ok =3D false;

Wouldn't notify_fw be clearer, and the same in ffa_partinfo_init()?

Either way, please add:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
>      /* We need to use the RX buffer to receive the list */
>      src_buf =3D ffa_rxtx_spmc_rx_acquire();
> @@ -104,6 +106,7 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uu=
id, uint32_t *sp_count,
>      ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
>      if ( ret )
>          goto out;
> +    spmc_ok =3D true;
>
>      /* Validate the src_size we got */
>      if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
> @@ -157,7 +160,10 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid u=
uid, uint32_t *sp_count,
>      *sp_count =3D count;
>
>  out:
> -    ffa_rxtx_spmc_rx_release();
> +    release_ret =3D ffa_rxtx_spmc_rx_release(spmc_ok);
> +    if ( release_ret )
> +        gprintk(XENLOG_WARNING,
> +                "ffa: Error releasing SPMC RX buffer: %d\n", release_ret=
);
>      return ret;
>  }
>
> @@ -507,6 +513,7 @@ bool ffa_partinfo_init(void)
>      int32_t e;
>      void *spmc_rx;
>      struct ffa_uuid nil_uuid =3D { .val =3D { 0ULL, 0ULL } };
> +    bool spmc_ok =3D false;
>
>      if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
>           !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32))
> @@ -522,6 +529,7 @@ bool ffa_partinfo_init(void)
>          printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
>          goto out;
>      }
> +    spmc_ok =3D true;
>
>      if ( count >=3D FFA_MAX_NUM_SP )
>      {
> @@ -533,7 +541,9 @@ bool ffa_partinfo_init(void)
>      ret =3D init_subscribers(spmc_rx, count, fpi_size);
>
>  out:
> -    ffa_rxtx_spmc_rx_release();
> +    e =3D ffa_rxtx_spmc_rx_release(spmc_ok);
> +    if ( e )
> +        printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d\n=
", e);
>      return ret;
>  }
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 58562d8e733c..461e87f6f9c4 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -458,7 +458,7 @@ int32_t ffa_endpoint_domain_lookup(uint16_t endpoint_=
id, struct domain **d_out,
>  bool ffa_rxtx_spmc_init(void);
>  void ffa_rxtx_spmc_destroy(void);
>  void *ffa_rxtx_spmc_rx_acquire(void);
> -void ffa_rxtx_spmc_rx_release(void);
> +int32_t ffa_rxtx_spmc_rx_release(bool notify_fw);
>  void *ffa_rxtx_spmc_tx_acquire(void);
>  void ffa_rxtx_spmc_tx_release(void);
>
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index 7d8bb4f4d031..50758fb57cdf 100644
> --- a/xen/arch/arm/tee/ffa_rxtx.c
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -375,18 +375,22 @@ void *ffa_rxtx_spmc_rx_acquire(void)
>      return NULL;
>  }
>
> -void ffa_rxtx_spmc_rx_release(void)
> +int32_t ffa_rxtx_spmc_rx_release(bool notify_fw)
>  {
>      int32_t ret;
>
>      ASSERT(spin_is_locked(&ffa_spmc_rx_lock));
>
> -    /* Inform the SPMC that we are done with our RX buffer */
> -    ret =3D ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> -    if ( ret !=3D FFA_RET_OK )
> -        printk(XENLOG_DEBUG "Error releasing SPMC RX buffer: %d\n", ret)=
;
> +    if ( notify_fw )
> +    {
> +        /* Inform the SPMC that we are done with our RX buffer */
> +        ret =3D ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> +    }
> +    else
> +        ret =3D FFA_RET_OK;
>
>      spin_unlock(&ffa_spmc_rx_lock);
> +    return ret;
>  }
>
>  void *ffa_rxtx_spmc_tx_acquire(void)
> --
> 2.50.1 (Apple Git-155)
>

