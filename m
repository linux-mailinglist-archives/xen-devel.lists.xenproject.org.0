Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56411592E3F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387309.623494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYOc-0008PQ-42; Mon, 15 Aug 2022 11:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387309.623494; Mon, 15 Aug 2022 11:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYOc-0008N8-1I; Mon, 15 Aug 2022 11:36:38 +0000
Received: by outflank-mailman (input) for mailman id 387309;
 Mon, 15 Aug 2022 11:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dVr3=YT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oNYOa-0008N2-GL
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:36:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8354c1ba-1c8e-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 13:36:35 +0200 (CEST)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1660563379492959.2219808735848;
 Mon, 15 Aug 2022 04:36:19 -0700 (PDT)
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
X-Inumbo-ID: 8354c1ba-1c8e-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1660563383; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hy11SL8CFRDbx1px1jS1qbtXN6nh8UhIeyuney7Apl9KTAoHl0ub/7n+3qVOvKK/GZCp9KyM1JsD8ikRj8TdmD4Qvh9LnXTOH9La/S/8W7n1IFC9vgYaFhhyjlADUf+lZbXCkpImXzhvkhVIN/7RYt9ciF4VTSGP2DKtsZzxpac=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660563383; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=sydKm57zQ1MrCdXRUQUN5smgdD0KlEnUS0QeYB/s2r0=; 
	b=DEMwth6obuB6oUoBhtJCAjZ0PMMcD0kyj7XlBBETe26e5UpB34dBNm9HMRvA4lGZBFYgOpipTkTSCZqXR/TDwp5/ll31sr3bk5bpaHIR+Qe0W5D2ALo8uX8LnVvefGMDPIG1bvXdgKeuTMHmG3ve7NGxvLP4+Epu5W9uSAEjhcw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660563383;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sydKm57zQ1MrCdXRUQUN5smgdD0KlEnUS0QeYB/s2r0=;
	b=JJhJvNBhiEpB7nT/UDrZREl8dZKZPecagFUzIsqnpo4u+hNIsQXF6+pd1gpeTuQU
	/pfaSKvf5cEx497HVuRRenAZbJwfN3Jnl6OgfQo+k0xdghAT6iNNWiiAcqg/O61s3iA
	T24BYy67pq4sRxxyuyWpeP+hgFx+RPefnKiOkbn4=
Message-ID: <2e9fb6f9-8f3b-6b88-1a6f-8c198b267f29@apertussolutions.com>
Date: Mon, 15 Aug 2022 07:34:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [XEN PATCH v4 21/32] tools: Remove -Werror everywhere else
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, David Scott <dave@recoil.org>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-22-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220811164845.38083-22-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/11/22 12:48, Anthony PERARD wrote:
> Patch "tools: Add -Werror by default to all tools/" have added
> "-Werror" to CFLAGS in tools/Rules.mk, remove it from every other
> makefiles as it is now duplicated.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>
> ---
>   tools/console/client/Makefile   | 1 -
>   tools/console/daemon/Makefile   | 1 -
>   tools/debugger/kdd/Makefile     | 1 -
>   tools/flask/utils/Makefile      | 1 -
>   tools/fuzz/cpu-policy/Makefile  | 2 +-
>   tools/misc/Makefile             | 1 -
>   tools/tests/cpu-policy/Makefile | 2 +-
>   tools/tests/depriv/Makefile     | 2 +-
>   tools/tests/resource/Makefile   | 1 -
>   tools/tests/tsx/Makefile        | 1 -
>   tools/tests/xenstore/Makefile   | 1 -
>   tools/xcutils/Makefile          | 2 --
>   tools/xenmon/Makefile           | 1 -
>   tools/xenpaging/Makefile        | 1 -
>   tools/xenpmd/Makefile           | 1 -
>   tools/xentop/Makefile           | 2 +-
>   tools/xentrace/Makefile         | 2 --
>   tools/xl/Makefile               | 2 +-
>   tools/debugger/gdbsx/Rules.mk   | 2 +-
>   tools/firmware/Rules.mk         | 2 --
>   tools/libfsimage/common.mk      | 2 +-
>   tools/libs/libs.mk              | 2 +-
>   tools/ocaml/common.make         | 2 +-
>   tools/xenstore/Makefile.common  | 1 -
>   24 files changed, 9 insertions(+), 27 deletions(-)

...

> diff --git a/tools/flask/utils/Makefile b/tools/flask/utils/Makefile
> index 6be134142a..88d7edb6b1 100644
> --- a/tools/flask/utils/Makefile
> +++ b/tools/flask/utils/Makefile
> @@ -1,7 +1,6 @@
>   XEN_ROOT=$(CURDIR)/../../..
>   include $(XEN_ROOT)/tools/Rules.mk
>   
> -CFLAGS += -Werror
>   CFLAGS += $(CFLAGS_libxenctrl)
>   
>   TARGETS := flask-loadpolicy flask-setenforce flask-getenforce flask-label-pci flask-get-bool flask-set-bool

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

