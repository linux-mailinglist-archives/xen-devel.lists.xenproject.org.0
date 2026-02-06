Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBASJlO0hWmbFQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:28:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABEFFC081
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223057.1530711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voI8g-0004TK-9P; Fri, 06 Feb 2026 09:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223057.1530711; Fri, 06 Feb 2026 09:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voI8g-0004Qr-4L; Fri, 06 Feb 2026 09:28:34 +0000
Received: by outflank-mailman (input) for mailman id 1223057;
 Fri, 06 Feb 2026 09:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5P7=AK=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1voI8e-0004Qk-JW
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 09:28:32 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 331a53da-033e-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 10:28:31 +0100 (CET)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-40423dbe98bso242030fac.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 01:28:31 -0800 (PST)
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
X-Inumbo-ID: 331a53da-033e-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770370110; cv=none;
        d=google.com; s=arc-20240605;
        b=Ch2pY/72oBmRxDpABZHLm7w/H4Tz9rf/XPOOHe/p6QR9PeCI90OTDHzYaXI2PP/As+
         cYfJxHAbL7C2WipIJH0x6c9GCaxZQvYlIzHiQhLBDauO6B/MArApIoBaZb8U+/ag51Gz
         1KA7umAQ46bj7AYqHm5riNRagCiH1/DhoqfOhqIAgDeER4OpgUnNlXWbmyUbMoPEE6No
         E8ekFOrAvDrOPWPixt9tDl2gTDFWcwesvXEOlZHt2YaqBeAlIes13ft7b05FrCyvx7zy
         vMOUteUsuvS8jRb+Si1pE2JJXwTHpyzFhptHZ5UIUyjfHNLe4/9cMcTTsKkswMD0t+F3
         2NeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PfsQd9prHj4PEJxEoECC3VAkgFIlM0CLps+3qg6UKmA=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=fggTYgYyGfqReSVHSHXR6SZ/sfeq3GvsMkPvVmyrBm5LWHAcXaCeAnopTvU1QxTtCd
         VFBS4Z5aLq0YgO2Zec9rO1BusUSCWtWNkfDIUsrgbB7ohzqdGHoUxCNGc58GvOtUp5zB
         bPLGNdkATmL45zIG2G/YjHeiRd3UDumUpcO28t4lUQUt7KZTpYFmmKnt/0d+McKcyp03
         JVVhNKjpbELs4s0eXHTiJFOYrqGhsOZsyYO6V9Mb+krN5zD2SpUd3P/QYcEkgKP9LQvz
         z1iC8cYKJKbwfbov15VbPRg6yEf7jw+IVKix7q+l0PPHOnUSfBDy44cpOwQQn5GzhVIV
         c/UA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770370110; x=1770974910; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfsQd9prHj4PEJxEoECC3VAkgFIlM0CLps+3qg6UKmA=;
        b=WGHUpmz9pnBUMDU1VrtECLn8LJFq4Cjk5T7wuo5ZuLN1vgaKjiFFq8F8qTzOuqq0sp
         6BfuRyehVqUSYsCaqkszXzXhO479lGhB6EwIRyG8O3uVHDCUqvzq1ZvOUfqsxAqAVXdN
         NId6GyGMnfJU8Ss6CosTHgMf2JtgQg7euAOnU3NlQOlQAr4S9r2WzN3AAXpKkhjl1b2o
         rBzMAE7WUTqVX7Eg93sBDfRNTT4dp2PgHhvOklmTD0qp5cbMW3bVYxKAG/mdm/YebsWy
         eRttgLTOoJ8mUgWHnS5N0YGv1VJgMLL4ItEL2cULRiiZIsimIZBWBVPqMBRa1VtKN6bl
         /zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370110; x=1770974910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfsQd9prHj4PEJxEoECC3VAkgFIlM0CLps+3qg6UKmA=;
        b=ekL0FSKxUc417tfKeRrQYA7uQn/lDsSBInTPXU35poxsjNAvkOl5WhIjLMSw4D6euv
         oyJcsgPcZrjEIUiSxJQAVftwlhdoNaLH3fyv9bG2yatUTSfrM/F6aMQt11h/HedvtQ+q
         TKsgbJGvI3PBGQr7Q0ARQm/u+2hHAUxar10EBHgtesCtFSsJjIGy6u7hTSh6/eJ6a368
         rsJ9AjGbEgn1H4a8FuI/JlaVUGb7toO42scHCprgodq+e2aOuGsnNXjNcMLqLMuhvC5E
         OVj/TOJpHRsuPJT8g4W/PZNbIEX0fmK4w8fPMKJODmytxFpWIj1Gi0NIKTFO1RzQZuFD
         e1kg==
X-Gm-Message-State: AOJu0YxCtNTpoZVc+WMUawqls2SRifSnOuL/50eDhHpIFVRiALpk9U8w
	PU+HGyhA5X7KH/Hj7oQog6AdQ/MMSl+46ixdDMydgcz/iMS9kc4cuk9pzvwoENc4x/nfxCh/f4y
	vANesMEAlAgC5tXOL/TXnjvxClREEdKZv3zH5y2+nvQ==
X-Gm-Gg: AZuq6aLKcXm/lUUV93S5JykspTBprX0AGG5OWXY5ITIHAJXiOn9VPxMEY5yKHdklJA0
	oUUKlTZtNM3geGa1aHzcF+P0zEqroz1IEuxjK4LX/7LzAm4nIfZdJnwA2tzIKxr6QJYbuifW9kL
	pv3rIulOi/+j291Ddky5C+FvQxF1Rc8281yqKykq8cU5UfKPfDS4EctLdx8kiJywtqo6YL+8OHh
	AOkUCYw5AKcePwHAkWxJBaJ/mTen6Qa/dXHxk/IV0Xj2a4Nv9cacc2oBS0GilMUA7oYgL6mXbaK
	/zpRNZgAwHMgQlfOMcPvODTkmw==
X-Received: by 2002:a05:6820:80c5:b0:661:1d0c:a5b5 with SMTP id
 006d021491bc7-66d0bea3ff5mr856255eaf.48.1770370109901; Fri, 06 Feb 2026
 01:28:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <9886df295f4c4365668576cc956299ee36f36c8b.1770115301.git.bertrand.marquis@arm.com>
In-Reply-To: <9886df295f4c4365668576cc956299ee36f36c8b.1770115301.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 6 Feb 2026 10:28:18 +0100
X-Gm-Features: AZwV_Qj9QyssabLDHCzs3J98Sgr51l9lPVztXoTTsnmXQ_CWV0Vhp6RomyItEBE
Message-ID: <CAHUa44G9sGWp18EX=Zb-C-jDJn_V6BmEVvnza7t6gcx3rjsRww@mail.gmail.com>
Subject: Re: [PATCH 02/12] xen/arm: ffa: Fix MEM_SHARE NS attribute handling
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,linaro.org:dkim,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0ABEFFC081
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> The FF-A memory attribute encoding is currently a literal value (0x2f),
> which makes reviews and validation harder. In addition, MEM_SHARE
> accepts the NS (non-secure) attribute bit even though the normal world
> must not set it according to FF-A specification.
>
> Introduce named attribute bit masks and express FFA_NORMAL_MEM_REG_ATTR
> in terms of them for clarity.
>
> Reject MEM_SHARE descriptors with the NS bit set, returning
> INVALID_PARAMETERS to match FF-A v1.1 rules that prohibit normal world
> from setting this bit.
>
> Functional impact: MEM_SHARE now rejects descriptors with NS bit set,
> which were previously accepted but violate FF-A specification.

To be fair, it was also rejected earlier, but with a different error code.

>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_private.h | 17 ++++++++++++++++-
>  xen/arch/arm/tee/ffa_shm.c     |  6 ++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index cd7ecabc7eff..b625f1c72914 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -129,11 +129,26 @@
>  #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
>  #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
>
> +/* NS attribute was introduced in v1.1 */
> +#define FFA_MEM_ATTR_NS                 BIT(6, U)
> +
> +#define FFA_MEM_ATTR_TYPE_DEV           (1U << 3)
> +#define FFA_MEM_ATTR_TYPE_MEM           (2U << 4)
> +
> +#define FFA_MEM_ATTR_NC                 (1U << 2)
> +#define FFA_MEM_ATTR_WB                 (3U << 2)
> +
> +#define FFA_MEM_ATTR_NON_SHARE          (0U)
> +#define FFA_MEM_ATTR_OUT_SHARE          (2U)
> +#define FFA_MEM_ATTR_INN_SHARE          (3U)
> +
>  /*
>   * Memory attributes: Normal memory, Write-Back cacheable, Inner shareab=
le
>   * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
>   */
> -#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
> +#define FFA_NORMAL_MEM_REG_ATTR         (FFA_MEM_ATTR_TYPE_MEM | \
> +                                         FFA_MEM_ATTR_WB | \
> +                                         FFA_MEM_ATTR_INN_SHARE)
>  /*
>   * Memory access permissions: Read-write
>   * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index 8282bacf85d3..90800e44a86a 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -512,6 +512,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs=
)
>      if ( ret )
>          goto out_unlock;
>
> +    if ( trans.mem_reg_attr & FFA_MEM_ATTR_NS )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
>      if ( trans.mem_reg_attr !=3D FFA_NORMAL_MEM_REG_ATTR )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> --
> 2.50.1 (Apple Git-155)
>

Looks good, but I think the commit message needs a small update or
clarification.

Cheers,
Jens

