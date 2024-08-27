Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FFC961178
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 17:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784180.1193590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixzU-0004e1-9Z; Tue, 27 Aug 2024 15:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784180.1193590; Tue, 27 Aug 2024 15:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixzU-0004az-6G; Tue, 27 Aug 2024 15:20:16 +0000
Received: by outflank-mailman (input) for mailman id 784180;
 Tue, 27 Aug 2024 15:20:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoQA=P2=bounce.vates.tech=bounce-md_30504962.66cdeeaa.v1-6a2409223d934861b9fb99e074e8022a@srs-se1.protection.inumbo.net>)
 id 1sixzS-0004at-M5
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 15:20:15 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da1dc6c0-6487-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 17:20:12 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4WtWSV4wPHzQXg3Cr
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 15:20:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6a2409223d934861b9fb99e074e8022a; Tue, 27 Aug 2024 15:20:10 +0000
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
X-Inumbo-ID: da1dc6c0-6487-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724772010; x=1725032510;
	bh=Ymni47yYiavwbdtek5GqXhef3XC8ro+P1vB45EwEbaQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=C2BPhibe47UrVY9fC5M1BkWzedWlmMvTHCMV6mXvvF3v0dHLFrSpUpSrb1G9ucOd+
	 RbGIybBFgg3NhCvADD+/If9eNbpfO8q75CpIds1Du2IMYKO+/2ZrWnkWuoippORzup
	 Vx7LF5Ne1/ZuzhnpGdY9+c+cIQSlkFlUlv36+zfC3Zpt50NjGQCDXnNFW+48O25yVf
	 FzYS76uKxSpTmj0I6chmMzeuD/uEpqwo5M5ejVKlCXH0nHOKNQJB7nKCywFPGGKYhn
	 GZ6bPZztyde9M6qPpBpg6HUfrYEsW1fL5lo4H4wwadoU9XGBszfcm9zDLFaWn0gj49
	 Px65DPvwllTKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724772010; x=1725032510; i=anthony.perard@vates.tech;
	bh=Ymni47yYiavwbdtek5GqXhef3XC8ro+P1vB45EwEbaQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=s6lKuHvVeJAmGy20rmL/C7/BWBZwARHv4V9/at0Z6p0Rus6fQ+RZbaoOcCFjYJGKq
	 1MMAoByzuQo4vfH6TiVWpK5EcxMgiiaQueXShrgzd8DmebibpJqUbnHqqf/ImZlJWD
	 rdSNiPEnsyReDpWAZiYQHudKkrCmVJ9dpLpJ/qyjwsWxy10lGpQkLJLb1ROKn7pYgG
	 a/hPZ7wmlz+It/axopCHtm/p9Q6O1EzPQY28bczLRfXU/wmyYffP6phmY/NPF3Zw+z
	 6HMUqhw4gE3+PixI5K177bkbd4dbLCSB6H4RIaTQOX15b01WF/CObgKpL4SvMYz1me
	 r/5gujWCStEiw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v2=201/3]=20libxl:=20Fix=20nul-termination=20of=20the=20return=20value=20of=20libxl=5Fxen=5Fconsole=5Fread=5Fline()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724772009582
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, andrew.cooper3@citrix.com, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Message-Id: <Zs3uqKNTV1601s9j@l14>
References: <cover.1724430173.git.javi.merino@cloud.com> <b1c7eb226ce62f50d6a50baa3977830a31fa5c9b.1724430173.git.javi.merino@cloud.com>
In-Reply-To: <b1c7eb226ce62f50d6a50baa3977830a31fa5c9b.1724430173.git.javi.merino@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6a2409223d934861b9fb99e074e8022a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240827:md
Date: Tue, 27 Aug 2024 15:20:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Aug 23, 2024 at 06:05:03PM +0100, Javi Merino wrote:
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> index a563c9d3c7f9..012fd996fba9 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -774,12 +774,14 @@ libxl_xen_console_reader *
>  {
>      GC_INIT(ctx);
>      libxl_xen_console_reader *cr;
> -    unsigned int size = 16384;
> +    /* We want xen to fill the buffer in as few hypercalls as
> +     * possible, but xen will not nul-terminate it.  Leave one byte at
> +     * the end for the null */
> +    unsigned int size = 16384 + 1;

This comment doesn't really explain why the size choosen is 16k+1, it
kind of explain the +1 but that's about it.

16k seems to be the initial size
    https://elixir.bootlin.com/xen/v4.19.0/source/xen/drivers/char/console.c#L110
But then, it is changed to depend on $(nproc) and loglevel
    https://elixir.bootlin.com/xen/v4.19.0/source/xen/drivers/char/console.c#L1095
with 16k been the minimum it seems:
    https://elixir.bootlin.com/xen/v4.19.0/source/xen/drivers/char/console.c#L1061

So, I think a useful comment here would reflect that 16k is default size
of Xen's console buffer.

Also, multi-line comments are normally expected to be with begin and end
markers on separated lines:
    /*
     * Comments.
     */


It be nice to fix both comments, but otherwise the patch looks good:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

