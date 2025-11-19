Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1325C7023E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 17:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166142.1492755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlDH-0004qy-Li; Wed, 19 Nov 2025 16:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166142.1492755; Wed, 19 Nov 2025 16:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlDH-0004pG-Im; Wed, 19 Nov 2025 16:39:23 +0000
Received: by outflank-mailman (input) for mailman id 1166142;
 Wed, 19 Nov 2025 16:39:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dri0=53=yandex-team.ru=vsementsov@srs-se1.protection.inumbo.net>)
 id 1vLlDH-0004pA-02
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 16:39:23 +0000
Received: from forwardcorp1a.mail.yandex.net (forwardcorp1a.mail.yandex.net
 [178.154.239.72]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c7a2d3c-c566-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 17:39:21 +0100 (CET)
Received: from mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c2d:7394:0:640:5a8a:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTPS id A42C7C0417;
 Wed, 19 Nov 2025 19:39:19 +0300 (MSK)
Received: from [IPV6:2a02:6bf:8080:d4f::1:a] (unknown [2a02:6bf:8080:d4f::1:a])
 by mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id EdZ4hj1FoqM0-PnOuENIM; Wed, 19 Nov 2025 19:39:19 +0300
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
X-Inumbo-ID: 4c7a2d3c-c566-11f0-980a-7dc792cee155
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1763570359;
	bh=DM0KRnw/bJmlXF59KSLJHO7inhk1CSuI+W867TiXkhk=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=1aV3AQx9aES23Vo5+MMzL/Y4U1Q/xSdVQV9kID9CPGBFyxOO5gCBPF5Z0uI5h3BF4
	 iYmwL1dOKyCcf3BHSPNZ0GR9CkFWL1iXtOFXUxpaH5+YEU4mAePovvIojEwsXcoIkr
	 pM/RDLPTvlXlZtbSzEM/5jVb9Kkrncl88vVYyO64=
Authentication-Results: mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Message-ID: <a36f938d-b35a-4605-ab77-6ed7dd419945@yandex-team.ru>
Date: Wed, 19 Nov 2025 19:39:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/nvram/xlnx-bbram: More idiomatic and simpler error
 reporting
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
 harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 berrange@redhat.com, peterx@redhat.com, farosas@suse.de, eblake@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 xen-devel@lists.xenproject.org
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-3-armbru@redhat.com>
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20251119130855.105479-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.11.25 16:08, Markus Armbruster wrote:
> bbram_bdrv_error() interpolates a "detail" string into a template with
> error_setg_errno(), then reports the result with error_report().
> Produces error messages with an unwanted '.':
> 
>      BLK-NAME: BBRAM backstore DETAIL failed.: STERROR
> 
> Replace both calls of bbram_bdrv_error() by straightforward
> error_report(), and drop the function.  This is less code, easier to
> read, and the error message is more greppable.
> 
> Also delete the unwanted '.'.

Also, using "errp" name for local "Error *" (one star) variable is a bit misleading.

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   hw/nvram/xlnx-bbram.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
> index 22aefbc240..fe289bad9d 100644
> --- a/hw/nvram/xlnx-bbram.c
> +++ b/hw/nvram/xlnx-bbram.c
> @@ -88,18 +88,6 @@ static bool bbram_pgm_enabled(XlnxBBRam *s)
>       return ARRAY_FIELD_EX32(s->regs, BBRAM_STATUS, PGM_MODE) != 0;
>   }
>   
> -static void bbram_bdrv_error(XlnxBBRam *s, int rc, gchar *detail)
> -{
> -    Error *errp = NULL;
> -
> -    error_setg_errno(&errp, -rc, "%s: BBRAM backstore %s failed.",
> -                     blk_name(s->blk), detail);
> -    error_report("%s", error_get_pretty(errp));
> -    error_free(errp);
> -
> -    g_free(detail);
> -}
> -
>   static void bbram_bdrv_read(XlnxBBRam *s, Error **errp)
>   {
>       uint32_t *ram = &s->regs[R_BBRAM_0];
> @@ -162,7 +150,8 @@ static void bbram_bdrv_sync(XlnxBBRam *s, uint64_t hwaddr)
>       offset = hwaddr - A_BBRAM_0;
>       rc = blk_pwrite(s->blk, offset, 4, &le32, 0);
>       if (rc < 0) {
> -        bbram_bdrv_error(s, rc, g_strdup_printf("write to offset %u", offset));
> +        error_report("%s: BBRAM backstore write to offset %u failed: %s",
> +                     blk_name(s->blk), offset, strerror(-rc));
>       }
>   }
>   
> @@ -178,7 +167,8 @@ static void bbram_bdrv_zero(XlnxBBRam *s)
>   
>       rc = blk_make_zero(s->blk, 0);
>       if (rc < 0) {
> -        bbram_bdrv_error(s, rc, g_strdup("zeroizing"));
> +        error_report("%s: BBRAM backstore zeroizing failed: %s",
> +                     blk_name(s->blk), strerror(-rc));
>       }
>   
>       /* Restore bbram8 if it is non-zero */


-- 
Best regards,
Vladimir

