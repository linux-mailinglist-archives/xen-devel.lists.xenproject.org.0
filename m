Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE58519770
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 08:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320328.541017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm8ab-0002Iu-Ph; Wed, 04 May 2022 06:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320328.541017; Wed, 04 May 2022 06:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm8ab-0002GG-Mb; Wed, 04 May 2022 06:34:21 +0000
Received: by outflank-mailman (input) for mailman id 320328;
 Wed, 04 May 2022 05:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=enS8=VM=kernel.org=kvalo@srs-se1.protection.inumbo.net>)
 id 1nm7nD-0005FP-4y
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 05:43:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 190212bb-cb6d-11ec-a406-831a346695d4;
 Wed, 04 May 2022 07:43:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93BAFB8223A;
 Wed,  4 May 2022 05:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EF2C385A5;
 Wed,  4 May 2022 05:42:51 +0000 (UTC)
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
X-Inumbo-ID: 190212bb-cb6d-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651642995;
	bh=JrTxy6eXsiDtGM/F/9OTUVdSC11/W1yM6qcTiJhEEWY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ptNmZdYs+o6KHSEb902G1QgyncrLgIYxwRjyZ9+W9VTxnFGJHKAdTcbe0JtEXzd4l
	 aYwCxztA+GFA6BxNwpRJ+fwdrhYF+K4ZZZLdzPKi8lBBWFO/VNZwdIAlyDMFIxmOWz
	 hAmvQ+5DrbHNQghYSGB1afStWvfnMlPcYreVpeGPzS9YPA/9Y4p/yFDlQcLqjzbi/7
	 oTPIz0yt7M1rWvdVDxqtNaenj2/snIMXH2fVjjBqgI4xeMRFMaS+uomXQ38nO6fIxg
	 l9QT60aMp2PNBolRmvUG9+MmaPk4GD+QjG/dwTaQmabfDmxvYb7M7hfSFb2fcWpc9I
	 jV5YMv8gNlmpA==
From: Kalle Valo <kvalo@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,  Loic Poulain
 <loic.poulain@linaro.org>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  wcn36xx@lists.infradead.org,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  Alexei
 Starovoitov <ast@kernel.org>,  alsa-devel@alsa-project.org,  Al Viro
 <viro@zeniv.linux.org.uk>,  Andrew Gabbasov <andrew_gabbasov@mentor.com>,
  Andrew Morton <akpm@linux-foundation.org>,  Andy Gross
 <agross@kernel.org>,  Andy Lavr <andy.lavr@gmail.com>,  Arend van Spriel
 <aspriel@gmail.com>,  Baowen Zheng <baowen.zheng@corigine.com>,  Bjorn
 Andersson <bjorn.andersson@linaro.org>,  Boris Ostrovsky
 <boris.ostrovsky@oracle.com>,  Bradley Grove <linuxdrivers@attotech.com>,
  brcm80211-dev-list.pdl@broadcom.com,  Christian Brauner
 <brauner@kernel.org>,  Christian =?utf-8?Q?G=C3=B6ttsche?=
 <cgzones@googlemail.com>,
  Christian Lamparter <chunkeey@googlemail.com>,  Chris Zankel
 <chris@zankel.net>,  Cong Wang <cong.wang@bytedance.com>,  Daniel Axtens
 <dja@axtens.net>,  Daniel Vetter <daniel.vetter@ffwll.ch>,  Dan Williams
 <dan.j.williams@intel.com>,  David Gow <davidgow@google.com>,  David
 Howells <dhowells@redhat.com>,  Dennis Dalessandro
 <dennis.dalessandro@cornelisnetworks.com>,  devicetree@vger.kernel.org,
  Dexuan Cui <decui@microsoft.com>,  Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>,  Eli Cohen <elic@nvidia.com>,  Eric Paris
 <eparis@parisplace.org>,  Eugeniu Rosca <erosca@de.adit-jv.com>,  Felipe
 Balbi <balbi@kernel.org>,  Francis Laniel
 <laniel_francis@privacyrequired.com>,  Frank Rowand
 <frowand.list@gmail.com>,  Franky Lin <franky.lin@broadcom.com>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Gregory Greenman
 <gregory.greenman@intel.com>,  Guenter Roeck <linux@roeck-us.net>,
  Haiyang Zhang <haiyangz@microsoft.com>,  Hante Meuleman
 <hante.meuleman@broadcom.com>,  Herbert Xu <herbert@gondor.apana.org.au>,
  Hulk Robot <hulkci@huawei.com>,  "James E.J. Bottomley"
 <jejb@linux.ibm.com>,  James Morris <jmorris@namei.org>,  Jarkko Sakkinen
 <jarkko@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,  Jason Gunthorpe
 <jgg@ziepe.ca>,  Jens Axboe <axboe@kernel.dk>,  Johan Hedberg
 <johan.hedberg@gmail.com>,  Johannes Berg <johannes.berg@intel.com>,
  Johannes Berg <johannes@sipsolutions.net>,  John Keeping
 <john@metanate.com>,  Juergen Gross <jgross@suse.com>,  Keith Packard
 <keithp@keithp.com>,  keyrings@vger.kernel.org,
  kunit-dev@googlegroups.com,  Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
  "K. Y. Srinivasan" <kys@microsoft.com>,  Lars-Peter Clausen
 <lars@metafoo.de>,  Lee Jones <lee.jones@linaro.org>,  Leon Romanovsky
 <leon@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  linux1394-devel@lists.sourceforge.net,  linux-afs@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-bluetooth@vger.kernel.org,  linux-hardening@vger.kernel.org,
  linux-hyperv@vger.kernel.org,  linux-integrity@vger.kernel.org,
  linux-rdma@vger.kernel.org,  linux-scsi@vger.kernel.org,
  linux-security-module@vger.kernel.org,  linux-usb@vger.kernel.org,
  linux-xtensa@linux-xtensa.org,  llvm@lists.linux.dev,  Louis Peens
 <louis.peens@corigine.com>,  Luca Coelho <luciano.coelho@intel.com>,  Luiz
 Augusto von Dentz <luiz.dentz@gmail.com>,  Marc Dionne
 <marc.dionne@auristor.com>,  Marcel Holtmann <marcel@holtmann.org>,  Mark
 Brown <broonie@kernel.org>,  "Martin K. Petersen"
 <martin.petersen@oracle.com>,  Max Filippov <jcmvbkbc@gmail.com>,  Mimi
 Zohar <zohar@linux.ibm.com>,  Muchun Song <songmuchun@bytedance.com>,
  Nathan Chancellor <nathan@kernel.org>,  Nick Desaulniers
 <ndesaulniers@google.com>,  Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>,
  Paul Moore
 <paul@paul-moore.com>,  Rich Felker <dalias@aerifal.cx>,  Rob Herring
 <robh+dt@kernel.org>,  Russell King <linux@armlinux.org.uk>,
  selinux@vger.kernel.org,  "Serge E. Hallyn" <serge@hallyn.com>,
  SHA-cyfmac-dev-list@infineon.com,  Simon Horman
 <simon.horman@corigine.com>,  Stefano Stabellini <sstabellini@kernel.org>,
  Stefan Richter <stefanr@s5r6.in-berlin.de>,  Steffen Klassert
 <steffen.klassert@secunet.com>,  Stephen Hemminger
 <sthemmin@microsoft.com>,  Stephen Smalley
 <stephen.smalley.work@gmail.com>,  Tadeusz Struk
 <tadeusz.struk@linaro.org>,  Takashi Iwai <tiwai@suse.com>,  Tom Rix
 <trix@redhat.com>,  Udipto Goswami <quic_ugoswami@quicinc.com>,  Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Wei Liu <wei.liu@kernel.org>,
  xen-devel@lists.xenproject.org,  Xiu Jianfeng <xiujianfeng@huawei.com>,
  Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 10/32] wcn36xx: Use mem_to_flex_dup() with struct wcn36xx_hal_ind_msg
References: <20220504014440.3697851-1-keescook@chromium.org>
	<20220504014440.3697851-11-keescook@chromium.org>
Date: Wed, 04 May 2022 08:42:46 +0300
In-Reply-To: <20220504014440.3697851-11-keescook@chromium.org> (Kees Cook's
	message of "Tue, 3 May 2022 18:44:19 -0700")
Message-ID: <8735hpc0q1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Kees Cook <keescook@chromium.org> writes:

> As part of the work to perform bounds checking on all memcpy() uses,
> replace the open-coded a deserialization of bytes out of memory into a
> trailing flexible array by using a flex_array.h helper to perform the
> allocation, bounds checking, and copying.
>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: wcn36xx@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

[...]

> --- a/drivers/net/wireless/ath/wcn36xx/smd.h
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.h
> @@ -46,8 +46,8 @@ struct wcn36xx_fw_msg_status_rsp {
>  
>  struct wcn36xx_hal_ind_msg {
>  	struct list_head list;
> -	size_t msg_len;
> -	u8 msg[];
> +	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(size_t, msg_len);
> +	DECLARE_FLEX_ARRAY_ELEMENTS(u8, msg);

This affects readability quite a lot and tbh I don't like it. Isn't
there any simpler way to solve this?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

