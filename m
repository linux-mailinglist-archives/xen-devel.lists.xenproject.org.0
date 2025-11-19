Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0105C701FF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 17:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166129.1492746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLl9R-0004Io-74; Wed, 19 Nov 2025 16:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166129.1492746; Wed, 19 Nov 2025 16:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLl9R-0004GD-47; Wed, 19 Nov 2025 16:35:25 +0000
Received: by outflank-mailman (input) for mailman id 1166129;
 Wed, 19 Nov 2025 16:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dri0=53=yandex-team.ru=vsementsov@srs-se1.protection.inumbo.net>)
 id 1vLl8e-0004Db-Oe
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 16:34:37 +0000
Received: from forwardcorp1a.mail.yandex.net (forwardcorp1a.mail.yandex.net
 [178.154.239.72]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1f5d023-c565-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 17:34:35 +0100 (CET)
Received: from mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c1f:3a87:0:640:845c:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTPS id 7BFCAC0678;
 Wed, 19 Nov 2025 19:34:30 +0300 (MSK)
Received: from [IPV6:2a02:6bf:8080:d4f::1:a] (unknown [2a02:6bf:8080:d4f::1:a])
 by mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id QYZPeU1FLa60-mQxSyg0n; Wed, 19 Nov 2025 19:34:30 +0300
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
X-Inumbo-ID: a1f5d023-c565-11f0-9d18-b5c5bf9af7f9
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1763570070;
	bh=nvUxf4V4e/z9dwNpB0No3uc5zUvVA+AcUD4f7gSNLCY=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=b4HvaIDkLdN13ZIRsj7vpKOom9PrDP1UVvmJwn5Ej4iOeBldqY/rc59PIRJWV6Jfk
	 Rc+59oFHW2OhaV1fIpTz2cPhhqz+U1DoFm08nRC734t1aRTOAqTleRaQ9XC9f2fWVb
	 NOHTrES/em7yeh3uIebA6z4lvlE5ELFCJo0LMEgE=
Authentication-Results: mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Message-ID: <bf44d9cd-806a-4d2c-8cff-0a88222959ed@yandex-team.ru>
Date: Wed, 19 Nov 2025 19:34:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
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
 <20251119130855.105479-2-armbru@redhat.com>
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20251119130855.105479-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.11.25 16:08, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   include/hw/loader.h |  4 +++-
>   hw/arm/boot.c       |  6 +-----
>   hw/core/loader.c    |  8 ++++++--
>   hw/riscv/spike.c    | 10 +---------
>   4 files changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index d035e72748..6f91703503 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -188,8 +188,10 @@ ssize_t load_elf(const char *filename,
>    *
>    * Inspect an ELF file's header. Read its full header contents into a
>    * buffer and/or determine if the ELF is 64bit.
> + *
> + * Returns true on success, false on failure.

I don't really care, but IMO, it's obvious contract for bool+errp functions, not worth a comment.

>    */
> -void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
> +bool load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>   
>   ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
>                     bool big_endian, hwaddr target_page_size);

-- 
Best regards,
Vladimir

