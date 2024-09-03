Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AAC9696F0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788812.1198276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOpV-0003vl-03; Tue, 03 Sep 2024 08:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788812.1198276; Tue, 03 Sep 2024 08:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOpU-0003tn-Ru; Tue, 03 Sep 2024 08:24:00 +0000
Received: by outflank-mailman (input) for mailman id 788812;
 Tue, 03 Sep 2024 08:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Av91=QB=bounce.vates.tech=bounce-md_30504962.66d6c79a.v1-4ad6b20cfe7d4102bb8d5b534541bdb4@srs-se1.protection.inumbo.net>)
 id 1slOpS-0003tf-AT
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:23:58 +0000
Received: from mail135-11.atl141.mandrillapp.com
 (mail135-11.atl141.mandrillapp.com [198.2.135.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc005137-69cd-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 10:23:56 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-11.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4Wydty2GlJzLfH0B0
 for <xen-devel@lists.xenproject.org>; Tue,  3 Sep 2024 08:23:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4ad6b20cfe7d4102bb8d5b534541bdb4; Tue, 03 Sep 2024 08:23:54 +0000
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
X-Inumbo-ID: dc005137-69cd-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725351834; x=1725612334;
	bh=MOj/eHJACEzKqcP72ildAkufeo/TNzxa095eXAbtNww=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=I7CsovDA0sI+77YH3cE5MCF/B91PVKPODN+h4Ikkbu3s5wTrlvUKKolshj1xLxxjk
	 I6qdjTIZfJqy2nxRs52vQScWV4VRGqdcHND0DTE7eJVura339cyIfR+FQ+MVqx8th/
	 FGwdzB+vXdGft4eirULUwF8DTm0hB5ykocqR4dqMpHS2NNxuQah61Fhd4FAGtFILG7
	 q5D29t4wYm3IIVxDWE4pITn+T8U0Ra8lEpFxnfGtomVsfC1k47qCmzv67eJ1+Nsnq8
	 WP2nsmGPe2nAvjxDssWVUNFOI1BBfkF2RcqvZfi+mirKP2ZzPTvJizLmoDlOb5SoKj
	 8i3QriA77mKyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725351834; x=1725612334; i=anthony.perard@vates.tech;
	bh=MOj/eHJACEzKqcP72ildAkufeo/TNzxa095eXAbtNww=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=O22aZBSm7fgCv10bYAUDK50d8ohhNsfe8IrjkrnwHyZWEaFwa6+a0oU8g/A9St5CS
	 QQtCzx+cyYO5wObPiwnKenE4vGcujvD3PhJvvaTG365yW8MA3t7ViC/irI4+zF1QGh
	 h5kcKux8z7BvOD1U0MiOJUlkRZb6wTauz9fFO5jwuHLRDeNCSkB7aEMw6G0CEUTjyY
	 AIBa7luX3SvIq6R2n7ivKGvb/slZYiSh4OmAGYatKrA77ReEyXwsicAJJVOTtWVRm+
	 0vAHTtSWw1hsbmkrHGI4dv60L8EvZSub2iCbvPCTivVANBJ/ZRxbWuxPFxy8Hrr7eW
	 as/UeM8zK14wQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v3=202/3]=20libxl:=20Remove=20unnecessary=20buffer=20zeroing=20and=20zalloc()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725351833471
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Message-Id: <ZtbHmFPa2uoaEDt8@l14>
References: <cover.1725294334.git.javi.merino@cloud.com> <f92d56a113c4b0472df2badb207a699d82deadaf.1725294334.git.javi.merino@cloud.com>
In-Reply-To: <f92d56a113c4b0472df2badb207a699d82deadaf.1725294334.git.javi.merino@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4ad6b20cfe7d4102bb8d5b534541bdb4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240903:md
Date: Tue, 03 Sep 2024 08:23:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Sep 02, 2024 at 05:38:38PM +0100, Javi Merino wrote:
> When reading the console, xen overwrites the contents of the buffer,
> so there is no need to zero the buffer before passing it to xen.
> Instead, add a NULL at the end of the buffer.
> 
> While we are at it, change the zalloc() of the buffer back to
> malloc() as it was before bdf4131 (libxl: don't leak buf in
> libxl_xen_console_read_start error handling, 2013-12-03).  The comment
> in that commit message says that the intent of the commit was to
> change malloc+memset to zalloc(), but only for the
> libxl_xen_console_reader struct, not for the buffer.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

