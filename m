Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E174A42823
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 17:41:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895362.1303960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmbVk-0006mw-EB; Mon, 24 Feb 2025 16:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895362.1303960; Mon, 24 Feb 2025 16:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmbVk-0006kd-Am; Mon, 24 Feb 2025 16:40:52 +0000
Received: by outflank-mailman (input) for mailman id 895362;
 Mon, 24 Feb 2025 16:40:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYPK=VP=bounce.vates.tech=bounce-md_30504962.67bca10e.v1-7585b375566644b29d272d6642012f13@srs-se1.protection.inumbo.net>)
 id 1tmbVi-0006kJ-W1
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 16:40:51 +0000
Received: from mail179-30.suw41.mandrillapp.com
 (mail179-30.suw41.mandrillapp.com [198.2.179.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 196e1a9a-f2ce-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 17:40:48 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-30.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4Z1mgy6Q4DzP0JnKh
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 16:40:46 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7585b375566644b29d272d6642012f13; Mon, 24 Feb 2025 16:40:46 +0000
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
X-Inumbo-ID: 196e1a9a-f2ce-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1740415246; x=1740685246;
	bh=6lxkesbwl58qYSWgKOSn4jzHmOL67mnhC69gziGt6CE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=TmEq8Gj4eg8omWqXtjlIwFOzs0yLkDner8vHkFKPFmJSyRC9R5ZnZ4AS0DgAsXPs9
	 cRRnBc7ArGLQHIjbZ96n4PGhpsB8M9xlMknb6IVBm5ZcNrhyKqhyKUK2oqwCMO/V1U
	 wfLEeBF6iQ93lSa/gFKCGG01t4OqcIlOCyiLSW0ySyybGISQ+EPpDNAsR4osuF4Q1x
	 S27myIWbzmkoxj1cZJ8r0pVNJgE6w9gmvu92Z9HElBUXTe1lc5FJhh9lfLwm2I/YjS
	 BZwsPi57ovi3s3JUEvcfi5qMAib0YFxABIw8fF36XaX2F9Qcn3IjNi3gzsN9r8Zdb/
	 vXPPWd79GENcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1740415246; x=1740675746; i=anthony.perard@vates.tech;
	bh=6lxkesbwl58qYSWgKOSn4jzHmOL67mnhC69gziGt6CE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=px5duN3IT1O8Z2r2RYQiSaLPv3Ym5BL8yC4haPIqSEZeH0Mec7mWEqojJTKeHufc4
	 SRQHPx5X11VG/YjQ6WuSgpuRRARPx6Ijxi1+LQTk6MfMHOUvAxz1SlO+XXpncbCVog
	 o5w+QBFk6vNuMnSQi5TtStaaaHuTLRBQiCl5xKdFqfKyxMIcLvbsWWuuzrA7tWmAPT
	 7QpEAY1IJR5SfgNA6kAGw2FCwE0uYWFCG/2zxzhfyzjGWcmfHhopHduwiuGowE5fbk
	 uM6UpkXLQoLfoZP1hlezngq8NsloJcNM6ci/RnJzPDu12yFWIOw267qBPvOen1lEOD
	 Pihrj0dqcOU8Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20tools/xl:=20fix=20channel=20configuration=20setting?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1740415246257
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Z7yhAUMRvTeSNoco@l14>
References: <20250224142005.24172-1-jgross@suse.com>
In-Reply-To: <20250224142005.24172-1-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7585b375566644b29d272d6642012f13?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250224:md
Date: Mon, 24 Feb 2025 16:40:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2025 at 03:20:05PM +0100, Juergen Gross wrote:
> Channels work differently than other device types: their devid should
> be -1 initially in order to distinguish them from the primary console
> which has the devid of 0.
> 
> So when parsing the channel configuration, set devid explicitly to -1
> after expanding the channels array, as this expansion of the array will
> have set the devid to the index of the item in the array, overwriting
> the -1 initialization done by libxl_device_channel_init().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xl/xl_parse.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 3d85be7dd4..4705f6fd4b 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2426,6 +2426,9 @@ void parse_config_data(const char *config_source,
>              chn = ARRAY_EXTEND_INIT(d_config->channels, d_config->num_channels,
>                                     libxl_device_channel_init);
>  
> +            /* ARRAY_EXTEND_INIT() has set the devid, but it must be -1. */
> +            chn->devid = -1;
> +

You can use ARRAY_EXTEND_INIT_NODEVID() instead which doesn't touch
`devid` and let the value set by libxl_device_channel_init().

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

