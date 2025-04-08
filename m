Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC71FA8043F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941858.1341251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u27jE-0003fw-AF; Tue, 08 Apr 2025 12:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941858.1341251; Tue, 08 Apr 2025 12:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u27jE-0003du-7f; Tue, 08 Apr 2025 12:06:56 +0000
Received: by outflank-mailman (input) for mailman id 941858;
 Tue, 08 Apr 2025 12:06:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/2l=W2=bounce.vates.tech=bounce-md_30504962.67f5115c.v1-9e156be3e942462eb675b2c796853bac@srs-se1.protection.inumbo.net>)
 id 1u27jC-0003do-SE
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:06:54 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f54e8212-1471-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 14:06:53 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZX4Z40cBwz705lrF
 for <xen-devel@lists.xenproject.org>; Tue,  8 Apr 2025 12:06:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9e156be3e942462eb675b2c796853bac; Tue, 08 Apr 2025 12:06:52 +0000
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
X-Inumbo-ID: f54e8212-1471-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744114012; x=1744384012;
	bh=ESwd8atQcD4QmdOgj9K3ZWUEz57v6wFrLEwdeBKqSr4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ondSlxtCSsMSTWLyFkp7t8DtB2a5dQSkIFkugLL9GdFyMpBG4o4B/txjgVCwosFNu
	 hANjJtM55bJBXa3VbbSaPX75IQJAZtvFAIvSMFiuNLY9bSyPRXqFcHRTRbXzcoeT64
	 tSXvObdjqM71zytPpR6Bzrur+PylHTUYe/JXKSfwkoHKXy2xfydQSzpIa72hX9hJrt
	 8dfiPohCZRTEm8c4jSSzWykXqEstEaSWab1KPXg62dNoBdE9TeXFaiPyfY17aQCjkN
	 cyKQjNVAsl9L/2nnmM9h/joFZQAYRnMsbwiPIvaR1I84c63ExfHB3PH+/PNELgqbsz
	 F9hbrlbtPgNIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744114012; x=1744374512; i=anthony.perard@vates.tech;
	bh=ESwd8atQcD4QmdOgj9K3ZWUEz57v6wFrLEwdeBKqSr4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=T6e3gB96X0GxS8qhnlp/dhxrHtWgjPaIJP8RJ140tZkWlygopTDfrkAvDRxBVwKzi
	 B8b+iw/cOqAIQznvxnGA0k7aFmYRSji5MjMHba8ugb3m6qBBMyaLe/U0/zsE3GqTnE
	 2i43iID7je8alrE3WYftVCkE1kf8EvfF4v1IFiOum8Z6kgdkn72HL6na5YW0kpaj25
	 fJG/nFDOpN+1RrIqnBxWv6QgoC7Z4+6etaoaPr2XNtF/MKXv3iNz1H0/wjuW2wSadX
	 OfxRepKY/Q0dLh2S4y2PPlWXGMl8IOOvhcPNbl7fY8k+tQKU3hsCryTOzZ5W3qrVcg
	 dwbVqLaQaUT6Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20test-artifacts=20v2=2014/12]=20scripts:=20build=20initrd=20cpio?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744114010729
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <Z_URWuh2hrIWGBGV@l14>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com> <20250407123448.1520451-2-marmarek@invisiblethingslab.com> <a2b01279-4e67-4ce9-9752-21c16c33fe32@citrix.com> <04ae4edc-8ea6-489d-8485-6e45aa750607@citrix.com> <Z_P9y8lxB_-kEcy6@mail-itl>
In-Reply-To: <Z_P9y8lxB_-kEcy6@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9e156be3e942462eb675b2c796853bac?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250408:md
Date: Tue, 08 Apr 2025 12:06:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 06:31:06PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> There is one more difference: the cpio.gz contains the whole thing
> twice. Once as rootfs for dom0 and then another as boot/initrd-domU.
> Dropping .tar.gz is probably a good idea at some point, so I'm okay with
> such comment added. But I imagine some future tests may benefit from
> just one layer, which may want introducing another cpio.gz without
> boot/initrd-domU included. In fact, even right now that might be useful
> - for example dom0less arm64 test uses just busybox for domU rootfs, not
> the whole archive (so with my changes dom0 rootfs has unused
> boot/initrd-domU included).

In such case, would it make sense to prepare several initrd.cpio.gz? A
common one, then having overlays of files we want to add or replace to
the initrd of spefic test. I think osstest used to do something like
that, with command that would be:
    cat common.cpio.gz overlay.cpio.gz > initrd.cpio.gz

If it matter, is seem that the "file.cpio" used to be made with
`cpio -Hnewc -o`

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




