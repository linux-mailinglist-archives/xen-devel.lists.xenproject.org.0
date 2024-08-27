Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85596118B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 17:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784186.1193600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siy0L-00058W-Ia; Tue, 27 Aug 2024 15:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784186.1193600; Tue, 27 Aug 2024 15:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siy0L-00055R-FA; Tue, 27 Aug 2024 15:21:09 +0000
Received: by outflank-mailman (input) for mailman id 784186;
 Tue, 27 Aug 2024 15:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8SwS=P2=bounce.vates.tech=bounce-md_30504962.66cdeedc.v1-9c2576835f4546838e99ea644bee7a12@srs-se1.protection.inumbo.net>)
 id 1siy0K-00052X-CJ
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 15:21:08 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7515d9a-6487-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 17:21:01 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4WtWTS1Yx4zQXg2bx
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 15:21:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9c2576835f4546838e99ea644bee7a12; Tue, 27 Aug 2024 15:21:00 +0000
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
X-Inumbo-ID: f7515d9a-6487-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724772060; x=1725032560;
	bh=YBXVkINCpMI6QLd/E/U9xEiztFYTsWcnDcHLDsd05D4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wI9cKm1828qNyLIp+UVNcKxQCbgl7pxGkdIWHo4LcO+VO9AC6h6w2eBKpcT6k/VoR
	 S+5KOxA/UeozHyaQenUcS3h+u/JHEJ2RB5Beqfb/hBTkU3j8A8oI/fRoL+UKFp/wvX
	 3PCTTV77CU7+3zLpvNBGvFvUlHIGS3VyHKGVtb+GenG1xcR+A+2ovE5Ts8cMhWcdNl
	 0x5rEUpXph+pM9URM6iwAZoeGKUec+rq5FKvCewH+8wJ6NaCZv70GbGIUfwsMXt0pf
	 qzns+mOgSF24MR0UBQSSUZqTwmrogley0nnRqcqZ+BKM+2ONjVD21JWPAoaCbzOevw
	 DwnM9TqXWNWsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724772060; x=1725032560; i=anthony.perard@vates.tech;
	bh=YBXVkINCpMI6QLd/E/U9xEiztFYTsWcnDcHLDsd05D4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KIIMTR82wJRrQhhQHNYNdXFuPABFx+3xIiTWRYmI51dYtn5Bijj+aul1SOd26Xqgl
	 hxaFWiyv6kfNWjp3zT6qj2pGQ1uggDfHF/L5yz++LgxULU2muik5c4sqcogDKurKdj
	 j/YWDt8XLL5hhOI817RCFszxsz/KOr8ZTgiDphfkgNHHgnuT7Nf5bXNkjYShF2exil
	 ZcKJYkFIDadrVU4aAtuPcXvRCHXcNui8f1w3FsCDdRhScv/7er3oznYOFuTPtARMXh
	 h4mhCveiR0dHLd0NKsyGlfkshsva8bNQTsLcQfEHq9b7+LYk1TRb+YVlFP6G0u0evx
	 VqnN0GgTOA5Yw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v2=202/3]=20libxl:=20Remove=20unnecessary=20buffer=20zeroing=20and=20zalloc()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724772059159
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, andrew.cooper3@citrix.com, Juergen Gross <jgross@suse.com>
Message-Id: <Zs3u2jR+dhIlxa6f@l14>
References: <cover.1724430173.git.javi.merino@cloud.com> <ab2cb7430109e345ed6a294d9e8b2329bb373d2a.1724430173.git.javi.merino@cloud.com>
In-Reply-To: <ab2cb7430109e345ed6a294d9e8b2329bb373d2a.1724430173.git.javi.merino@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9c2576835f4546838e99ea644bee7a12?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240827:md
Date: Tue, 27 Aug 2024 15:21:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Aug 23, 2024 at 06:05:04PM +0100, Javi Merino wrote:
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

