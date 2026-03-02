Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FFAFrJLpWmt8AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 09:34:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04331D4AE1
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 09:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243989.1543464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwyiw-0002S3-7w; Mon, 02 Mar 2026 08:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243989.1543464; Mon, 02 Mar 2026 08:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwyiw-0002PQ-4m; Mon, 02 Mar 2026 08:33:54 +0000
Received: by outflank-mailman (input) for mailman id 1243989;
 Mon, 02 Mar 2026 08:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xkMV=BC=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vwyiu-0002PF-H6
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 08:33:52 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84d7210a-1612-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 09:33:42 +0100 (CET)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7d598f4b6fdso937832a34.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 00:33:42 -0800 (PST)
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
X-Inumbo-ID: 84d7210a-1612-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1772440421; cv=none;
        d=google.com; s=arc-20240605;
        b=IGzZ8CKTkRroaLTcKSe5z7N46teAIoQhXY8Q1tC4AmVB6idYF5E26rjMRNzC8yLOW3
         v6gq10iudB9746fneQqS+a9+6NabPMCLolPCRalecIEKxFhwgC7nMyWuFLXFGUKZgw6w
         tiiA4F4KgkF5Ztq/EtcHa6aCsb1yWKek5goFGyiUTKIZKL3safc+DDTdY3E10X9Z5EUg
         FQDfom2aiCMtT0DTEamZb4Hj0c/xSPRy2PV0NRFzplZD4807mie3gkqDowf6LTAfS0vy
         lsA80FeImQ+StySOEAFOjqZhzDmDF0wyMNTR5Rq4i44XGZvSyXWopYnleIWkhvN4upAu
         fF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UONVnuEsnDlLi6dga+MRvTcYSIUJ9EuC23412FVLdvc=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=Am1702s3E9WxxRxR0Y78H3fvbBhXMDyXFGZf77fia6fqg6WAjF+wM1JBN4i4QnZmB2
         2Pz6fRb9E5jzCYwfLI2BP0lfacm4LgaUIi4BWFKm0K2724BA+1M1Ga6k1g6bK6ju9sSM
         LZFfe+pOzG2/S6lwK2MCgpAmC4zJt5t44u2WjlZmIsOAR7BzOAg0bPYjeAbyo10X6+jV
         wZPpvn1ATXpU+SGGxPmZ9DPQ7Y9H8YYvYwiBCONmwm1pj6cvnEU8YiS87H8pKjzMQwY6
         gVlNg+K87xuMoj7fIEtinSQNu8JCEKwKlusmQf1+/HXaUAyGJBK4+paX7JRtVrJnI6S7
         o8OA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772440421; x=1773045221; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UONVnuEsnDlLi6dga+MRvTcYSIUJ9EuC23412FVLdvc=;
        b=ATP4SJ0UPiiC0N2KCTKqbgUI+qORlPPAYwAsXTPGHfh99mWMG7/xycWTE5cu0mysUx
         SBdp/upDAeN+SYVoDvbrtvYF7/j3/8OgjRNG5YodcP/HGwMyIBVktg8CX9q3oi4R8YUk
         iZPg7udZxogg7Pu0kWrmrRvptpY4Q+nXJEAw67i7yjG27kZToQEAIyi1QL8hbdjk/uuc
         gSGN1YlOCx07dYYX2jsdqILM65Z95Pgb+Qqck8lV374KMglyjWwPr4KE9+gf0qRIVwO2
         rlfuQ8CL7xinYAcWN0ZtT6NACwcDBJ5gtVGtGM/wBl6Ij8BiTBRzb4x1xh1X/sJtYlZu
         lA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440421; x=1773045221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UONVnuEsnDlLi6dga+MRvTcYSIUJ9EuC23412FVLdvc=;
        b=DlVIfgrrdo6ThVDAay3c/QRJnkGp8SdW46peG12P4xy2K16nISK49bmscowIo5prXC
         YsMT6EFI3zdnwvNSHO6BMIqkaVBXv+HRM4lg/6NxfYdKa1ENpf8Pit/BJ28ynGwGVof8
         civHG9VSqYaA22bzElyyXMG3bIPbT4nFbutx8jQk2/Ie4qe38zy+T21kzoOqgul8aL+L
         KwghlUJpQklN+wvIYjsXgnjrVpUeb7UJYWOIr3OQxiNUhiKgBUK1ySAkZtT1Wmi5rTFW
         bv2i4DekAF48HMhfqKBI6XDXhZW9YCnwdrOgrIQBy9EyhqFhd7q6qPQRbKsQ9+bViILo
         xw+g==
X-Gm-Message-State: AOJu0YxkIR7BMHKpOZZO3BmtBHrxMvOh+F6hNzmclw24BA6UtCWRcdQf
	XsO5SKPietJtfDT+lq2Y5gG7RhPRNSrW47StZ4gRw1ym8n4ib+4Z8dnmnvtrLsGgRnGqMAsmYge
	RcCwzb2esn4scE7dguXXj6rhDvwKVhRngjsKGawcpfw==
X-Gm-Gg: ATEYQzyihKuD15GrHHfc0GCIrtLwyebamP1ZP3fKUa0YiiTGp49WmhvUTPRMsM/epkR
	zpuebkyauQpa1koOPKt1WB/jKWVbF7YlVIPgUYB+2d21m1VivqP+Z9capYPQ71Ay51r5aTWswMl
	XIr3WrIxA/7ESEk5a2h7F0vVBSOTCKSrM3XEPK2diy3GohTKohv9PvLrk0quMjP+iM3Dgm9spNm
	SzL076FLfFt/2/K9dHqQ9SQA0tnyiKJPEy79VhjMYlEtjQdK8rZRXkuUsV2ROk9L4n5AIUI5Z4i
	/laFxk1kIFDWwhd/rdwN1l2J6ACw8cnC/uduBQ==
X-Received: by 2002:a05:6830:380b:b0:7c7:55e3:9117 with SMTP id
 46e09a7af769-7d591bc1e3cmr7564349a34.22.1772440421101; Mon, 02 Mar 2026
 00:33:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772013062.git.bertrand.marquis@arm.com> <826eae4c8346e79a227c8cf418cd5f42ee3420a1.1772013062.git.bertrand.marquis@arm.com>
In-Reply-To: <826eae4c8346e79a227c8cf418cd5f42ee3420a1.1772013062.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 2 Mar 2026 09:33:27 +0100
X-Gm-Features: AaiRm52sezAPYUFnC9jbgganbpPHAChpELXuYx8Z6l0QpwXx8DuJbaT50EKHJOw
Message-ID: <CAHUa44HRt5JqQcr-yNVmJwT7Ot=AoCfjqghh7+eDgujusiqhFQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] xen/arm: ffa: Add start_index to VM partinfo helper
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,linaro.org:dkim,arm.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
X-Rspamd-Queue-Id: B04331D4AE1
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 25, 2026 at 11:02=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Windowed GET_REGS retrieval needs to emit VM entries starting from an
> arbitrary index, but ffa_get_vm_partinfo() always starts from index 0.
>
> Add a start_index parameter to ffa_get_vm_partinfo() and skip entries
> until the local index reaches start_index. Update
> ffa_handle_partition_info_get() to pass start_index=3D0 to preserve
> existing behavior.
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_partinfo.c | 61 +++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 26 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index fdb03dae9a0c..6a6f3ffb822e 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -167,14 +167,15 @@ out:
>      return ret;
>  }
>
> -static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t *vm_co=
unt,
> -                                   void **dst_buf, void *end_buf,
> -                                   uint32_t dst_size)
> +static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t start_=
index,
> +                                   uint32_t *vm_count, void **dst_buf,
> +                                   void *end_buf, uint32_t dst_size)
>  {
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *curr_ctx =3D d->arch.tee;
>      struct ffa_ctx *dest_ctx;
>      uint32_t count =3D 0;
> +    uint32_t idx =3D 0;
>      int32_t ret =3D FFA_RET_OK;
>      /*
>       * We do not have UUID info for VMs so use the 1.0 structure so that=
 we set
> @@ -202,17 +203,21 @@ static int32_t ffa_get_vm_partinfo(struct ffa_uuid =
uuid, uint32_t *vm_count,
>      if ( ACCESS_ONCE(curr_ctx->guest_vers) >=3D FFA_VERSION_1_2 )
>      {
>          /* Add caller VM information */
> -        info.id =3D curr_ctx->ffa_id;
> -        info.execution_context =3D curr_ctx->num_vcpus;
> -        info.partition_properties =3D FFA_PART_VM_PROP;
> -        if ( is_64bit_domain(d) )
> -            info.partition_properties |=3D FFA_PART_PROP_AARCH64_STATE;
> -
> -        ret =3D ffa_copy_info(dst_buf, end_buf, &info, dst_size, sizeof(=
info));
> -        if ( ret )
> -            return ret;
> +        if ( start_index =3D=3D 0)
> +        {
> +            info.id =3D curr_ctx->ffa_id;
> +            info.execution_context =3D curr_ctx->num_vcpus;
> +            info.partition_properties =3D FFA_PART_VM_PROP;
> +            if ( is_64bit_domain(d) )
> +                info.partition_properties |=3D FFA_PART_PROP_AARCH64_STA=
TE;
>
> -        count++;
> +            ret =3D ffa_copy_info(dst_buf, end_buf, &info, dst_size,
> +                                sizeof(info));
> +            if ( ret )
> +                return ret;
> +            count++;
> +        }
> +        idx++;
>      }
>
>      if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> @@ -231,21 +236,25 @@ static int32_t ffa_get_vm_partinfo(struct ffa_uuid =
uuid, uint32_t *vm_count,
>              if ( dest_ctx =3D=3D curr_ctx )
>                  continue;
>
> -            info.id =3D dest_ctx->ffa_id;
> -            info.execution_context =3D dest_ctx->num_vcpus;
> -            info.partition_properties =3D FFA_PART_VM_PROP;
> -            if ( dest_ctx->is_64bit )
> -                info.partition_properties |=3D FFA_PART_PROP_AARCH64_STA=
TE;
> -
> -            ret =3D ffa_copy_info(dst_buf, end_buf, &info, dst_size,
> -                                sizeof(info));
> -            if ( ret )
> +            if ( idx >=3D start_index )
>              {
> -                read_unlock(&ffa_ctx_list_rwlock);
> -                return ret;
> +                info.id =3D dest_ctx->ffa_id;
> +                info.execution_context =3D dest_ctx->num_vcpus;
> +                info.partition_properties =3D FFA_PART_VM_PROP;
> +                if ( dest_ctx->is_64bit )
> +                    info.partition_properties |=3D FFA_PART_PROP_AARCH64=
_STATE;
> +
> +                ret =3D ffa_copy_info(dst_buf, end_buf, &info, dst_size,
> +                                    sizeof(info));
> +                if ( ret )
> +                {
> +                    read_unlock(&ffa_ctx_list_rwlock);
> +                    return ret;
> +                }
> +                count++;
>              }
>
> -            count++;
> +            idx++;
>          }
>          read_unlock(&ffa_ctx_list_rwlock);
>      }
> @@ -355,7 +364,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>              goto out_rx_release;
>      }
>
> -    ret =3D ffa_get_vm_partinfo(uuid, &ffa_vm_count, &dst_buf, end_buf,
> +    ret =3D ffa_get_vm_partinfo(uuid, 0, &ffa_vm_count, &dst_buf, end_bu=
f,
>                                dst_size);
>
>  out_rx_release:
> --
> 2.52.0
>

