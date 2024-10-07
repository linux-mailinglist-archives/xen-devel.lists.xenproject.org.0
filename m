Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9F7992E95
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812028.1224684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoVw-0002en-Oh; Mon, 07 Oct 2024 14:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812028.1224684; Mon, 07 Oct 2024 14:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoVw-0002dI-Lk; Mon, 07 Oct 2024 14:15:08 +0000
Received: by outflank-mailman (input) for mailman id 812028;
 Mon, 07 Oct 2024 14:15:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3K0A=RD=bounce.vates.tech=bounce-md_30504962.6703ece5.v1-e4b4ec1c099d432daf5024f596d40253@srs-se1.protection.inumbo.net>)
 id 1sxoVu-0002dC-Bb
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:15:06 +0000
Received: from mail136-19.atl41.mandrillapp.com
 (mail136-19.atl41.mandrillapp.com [198.2.136.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b236f69-84b6-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:15:03 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-19.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XMh4P34lszRKLpp7
 for <xen-devel@lists.xenproject.org>; Mon,  7 Oct 2024 14:15:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e4b4ec1c099d432daf5024f596d40253; Mon, 07 Oct 2024 14:15:01 +0000
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
X-Inumbo-ID: 8b236f69-84b6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728310501; x=1728571001;
	bh=7jz/JF0imIsyLz4oBOtbWgfyOvhsbWlu3YjootK9YSk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cr3OC27rEPQtyggxp+aGu+lgbyr52huxgmS22kTuSEEJtK89J0FUyRAA7UAJhGwzd
	 75XyNZYH23CkTGLRdg1jpJQFNCHE3QFlVfhMuXFhyq+j4tIoXSK4lbEbTTer015iDu
	 xGDhoCEgmC8NoGcb3JJq2k7s+0HgUqpBBqaQtwqIEf7ARBAgB4ac5tDo00vnarA5GY
	 1W6FWPFQ2vTs6Zc6Ua5ZMNNuOXcd5OVLnDDOlHXO8oqHd9BLcL7Y+6yjZsiC0BgSJg
	 2A13alRXDl8fU3vojRxk/BnxEeNoRbbJopj9HPfqhLJuiexU8kqosuMdnX4rrmZJ2O
	 GNA0hVOxGE7yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728310501; x=1728571001; i=anthony.perard@vates.tech;
	bh=7jz/JF0imIsyLz4oBOtbWgfyOvhsbWlu3YjootK9YSk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ecwtzHLUHA7Fsh/H46FWNfVNLSMxKUn+BomVakKvGkT2nRv5mpYuHZwDSij6b5Rz9
	 BTF8lKGk7CpKWDMPBKtPnDdYf5OtrCaW6UEsBkY64vQT5yI8trF7DIVLYNykJRNnlc
	 b1N2YF54eChQjzneQhNqJcUwzovtzveksses9dc8V9DJzz5rnKryg2BD08G4kJVdAq
	 S8SUMdLVWb+Ln0+oTZ2+U3fSWCpCdzx8it5VN+oiwaY+8tR5dLXwcSTpHzjuh2rAds
	 ioTkRRaL5DmIQz0or51lxrYj9uiJZlBjH0Y372Zm/90WpyXpKGvmTE07uQQRo4uoVT
	 ai8Pa4Dxfj5GA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=204/4]=20stubdom:=20add=20fine=20grained=20library=20config=20items=20to=20Mini-OS=20configs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728310500553
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-Id: <ZwPs44n9WlyPHo9q@l14>
References: <20241005151548.29184-1-jgross@suse.com> <20241005151548.29184-5-jgross@suse.com>
In-Reply-To: <20241005151548.29184-5-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e4b4ec1c099d432daf5024f596d40253?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241007:md
Date: Mon, 07 Oct 2024 14:15:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Sat, Oct 05, 2024 at 05:15:48PM +0200, Juergen Gross wrote:
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 8c503c2bf8..3b501a0710 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -340,6 +340,14 @@ endef
>  
>  $(foreach lib,$(STUB_LIBS),$(eval $(call BUILD_lib,$(lib))))
>  
> +define BUILD_config
> + cp $< $@
> + for i in $(sort $(APP_LIBS) $(call xenlibs-dependencies,$(APP_LIBS))); do \
> +   u=`echo $$i | tr a-z A-Z`; \
> +   echo "CONFIG_LIBXEN$$u=y"; \
> + done >> $@
> +endef

I don't think I like having a recipe hidden like that in a variable,
maybe if it was a full rule it would be a bit less annoying to me. But
how about something slightly different:

First, the name, "GEN_config" would be a bit better, then we could have
it only do the output and not writing any file:

define GEN_config
 (cat '$<' && \
 for i in $(sort $(APP_LIBS) $(call xenlibs-dependencies,$(APP_LIBS))); do \
   u=`echo $$i | tr a-z A-Z`; \
   echo "CONFIG_LIBXEN$$u=y"; \
 done)
endef

The this can be used in rules as:
    $(GEN_config) > $@

Would that be ok?

(It might be better to have the macro not depends on the environment
have take parameter explicitly which could be used as $(call
GEN_config,$<,evtchn gnttab) > $@ or take a variable if it's useful
elsewhere, but I'm already fine if $@ is taken out of the macro.)

> +
>  xenstore/stamp: $(XEN_ROOT)/tools/xenstored/Makefile.common
>  	$(do_links)
>  
> @@ -373,8 +381,12 @@ $(TARGETS_MINIOS): mini-os-%:
>  # ioemu
>  #######
>  
> -ioemu-minios-config.mk: $(CURDIR)/ioemu-minios.cfg
> -	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
> +ioemu-minios.out.cfg: APP_LIBS = evtchn gnttab ctrl guest
> +ioemu-minios.out.cfg: $(CURDIR)/ioemu-minios.cfg Makefile

Could you change the suffix to ".gen.cfg"? ".out.cfg" is a bit generic
while "generated" is more common for the kind of file that are
automatically generated by the build system for it's own use.

BTW, in the first prerequisite, $(CURDIR) isn't necessary anymore, it
was only to be used in "MINIOS_CONFIG" just below.

> +	$(BUILD_config)
> +
> +ioemu-minios-config.mk: ioemu-minios.out.cfg
> +	MINIOS_CONFIG="$(CURDIR)/$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

