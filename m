Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4B95B437
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 13:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781775.1191288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh6K7-0005d8-Ll; Thu, 22 Aug 2024 11:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781775.1191288; Thu, 22 Aug 2024 11:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh6K7-0005b4-JI; Thu, 22 Aug 2024 11:49:51 +0000
Received: by outflank-mailman (input) for mailman id 781775;
 Thu, 22 Aug 2024 11:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MXyx=PV=bounce.vates.tech=bounce-md_30504962.66c725d9.v1-0f947c44c4d94d9d9335899c79aa1e1a@srs-se1.protection.inumbo.net>)
 id 1sh6K5-0005ay-N0
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 11:49:50 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0eb2809-607c-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 13:49:47 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4WqM215YJvzQXg2Tt
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 11:49:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0f947c44c4d94d9d9335899c79aa1e1a; Thu, 22 Aug 2024 11:49:45 +0000
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
X-Inumbo-ID: a0eb2809-607c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724327385; x=1724587885;
	bh=ZA17f1S0xh474klSHRWhphEjMExcKVpp8/NwXf9cn88=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AejLW1Dfvj7kJUF6GaQGrSlDaK033I1hU5TAm1kivVPbBzJQ4iLkN1zB1fBNz7ZH1
	 Gcxg+fEtkYnqq/hj1zdkaG4srvfC9CdFpYJWx5XnxS5VkAOJkYGQe2y+IELzBbazCs
	 msETLE3FRVC3owyFcQV6nK9O9p25L1Wc/J9rGjQGtCqYA2Ap+KYVZ3XQTafXeBAb2I
	 yfChPN3DLMq99EJIYQnFhEHjFw50q60bs8wUdDp3F34OVeEOhVq0ZindZ/w55D73Gx
	 8948TfQPjgAOm1lWRBLBX0ZGl+JMQj7gRgtwjd2GPpesX5gEnJkT0inAjmr+QLYQa4
	 XEObY0v1UAtOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724327385; x=1724587885; i=anthony.perard@vates.tech;
	bh=ZA17f1S0xh474klSHRWhphEjMExcKVpp8/NwXf9cn88=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SShwAOcAx9xVlt0I/NXE5aPTFLHyC6EGOVSKnSQga0W7WUVrx5jM20xXx1AAP1qJK
	 hWhBZjO0IWW/JbaCx0U0s9Ya0TkygU9Gbc6fxNfmj5hQOJY+isalplBUbydNuuIS5D
	 L+etL47nWkY5DSS/Ziuhzj6Knd/QotKffjIX2aAaZgukQ/rreDBBD1EkvOf1AzT6kG
	 Yl1GoAdqjiCzu7GUDkwp6Ekw58npFxDwWWzxYtSPt2wBw675lLqJCf3XHIUKKC8sKM
	 SayT/vx/mzq9fF8W0HVgIyje4wxtja6m8F4SIWQ/xRQ8xodwrdSfC09U8zi27Z9cdh
	 RNmsJQ5eU1FWw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=202/4]=20ocaml/libs:=20Implement=20a=20dynamically-loaded=20plugin=20for=20Xenctrl.domain=5Fgetinfo?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724327384746
To: Andrii Sultanov <andrii.sultanov@cloud.com>
Cc: xen-devel@lists.xenproject.org, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Message-Id: <Zscl2DITQS9T6Sg9@l14>
References: <cover.1724314239.git.andrii.sultanov@cloud.com> <6d4b94939c8910ffd7d70301b1d26c828f72ad86.1724314239.git.andrii.sultanov@cloud.com>
In-Reply-To: <6d4b94939c8910ffd7d70301b1d26c828f72ad86.1724314239.git.andrii.sultanov@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0f947c44c4d94d9d9335899c79aa1e1a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240822:md
Date: Thu, 22 Aug 2024 11:49:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Aug 22, 2024 at 10:06:03AM +0100, Andrii Sultanov wrote:
> diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> new file mode 100644
> index 0000000000..eae44f8326
> --- /dev/null
> +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> @@ -0,0 +1,38 @@
[...]
> +.PHONY: install
> +install: $(LIBS) META
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)/xenctrl_plugin
> +	$(INSTALL_PROG) domain_getinfo_v1.cmxs $(DESTDIR)$(LIBEXEC_BIN)/xenctrl_plugin

Is there any reason to put that new library in "/usr/libexec"?
It doesn't seems like a good place for it, and using "/usr/lib" instead
seems better.
libexec is mostly for binary, according to
    https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html

It seems that location for ocaml libs is in $(OCAMLDESTDIR), any reason
to deviate from that?

Also, on the following patch, "XEN_CTRL_DOMAININFO_PLUGIN" is
introduced. If that value is still useful, it would be better to use it
at installation time as well.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

