Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFAB92FBF4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 15:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758071.1167316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGma-0002EK-VL; Fri, 12 Jul 2024 13:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758071.1167316; Fri, 12 Jul 2024 13:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGma-0002BU-SX; Fri, 12 Jul 2024 13:57:56 +0000
Received: by outflank-mailman (input) for mailman id 758071;
 Fri, 12 Jul 2024 13:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdXX=OM=bounce.vates.tech=bounce-md_30504962.6691365f.v1-50b3cba820b24cc98905cead7def72f5@srs-se1.protection.inumbo.net>)
 id 1sSGmY-0002BO-UN
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 13:57:55 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb099441-4056-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 15:57:52 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WLCpl3DCFz6CQ506
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 13:57:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 50b3cba820b24cc98905cead7def72f5; Fri, 12 Jul 2024 13:57:51 +0000
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
X-Inumbo-ID: bb099441-4056-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720792671; x=1721053171;
	bh=MLuhq8SihbR1DS6LIihFeD+VI6S7GBpn+MiStNpLGqo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OqEFMUAkzEMTKlG0b8Y9urpjZTKCp0xAlKZkc+Al5dJNbDy8scn2COKD+2zgw0Xf2
	 +Bt9Eh1XS+asR7HKMnSmeEwn4dA5Yzd7WyXza0QBmHINf7DlTlWFypZp4bPhbi5mq+
	 IYWbdnezYrLUtznDoeRvBP3SrfxezElU+2BK5GzWXrzatyKYB1/+1+rtGjqvsNuGv/
	 kgAVJMh8A41YHnIM4jfnTz2LTWRQgXFQZpWoNG2+JNY81N2IcC6oMFs0oWdeS3p8cp
	 wYzHq/05vwQm46oFMconUQBdBErni7Q4Sziby574dhJB9QFlnhvCTNmKYR6GBnQkos
	 XfQ/PQAG2rRVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720792671; x=1721053171; i=anthony.perard@vates.tech;
	bh=MLuhq8SihbR1DS6LIihFeD+VI6S7GBpn+MiStNpLGqo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vbtuOYwnWHOZP02gSwmZ2xK/MSqRHKiqnZkUmr5eXi5NmKP2Usl0B9Addfso+d0Ps
	 WM2N2CrnBpGkV15/j3yFC4PaRf5gVqnvd8/mJLFjTe3qerAPcvAWPvFe9QlEiRZpQq
	 nawc11Ve5wdq6rCtKHX5fXt0ESGZbLCO/H3MSStsZAwxOXmvunk5RQKoEyouT+NYkd
	 V7b76uMngJUB5I2BhoORsQI1GVkI0jMg/q6S7l5sw0oYkd5afEJwLoJkJ7PO5lXQcw
	 PiFNmOjPyE0oXXTvqAloZx7ozvWtru4zw4KbXfqxsKL5yhQMXGxCno9Wuiv7Hvnu16
	 ah1FDGp0AB2/A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2015/12]=20CI:=20Refresh=20Ubuntu=20Xenial=20container=20as=2016.04-x86=5F64?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720792670130
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpE2XbGRi6Lk1G3x@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240712104829.3237296-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240712104829.3237296-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.50b3cba820b24cc98905cead7def72f5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 13:57:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 12, 2024 at 11:48:29AM +0100, Andrew Cooper wrote:
> Rework the container to be non-root, use heredocs for legibility, and use use
> apt-get --no-install-recommends to keep the size down.
> 
> Ubuntu Xenial has no ninja-build package, so can't build the QEMU referenced
> by Xen 4.16.  Therefore, drop the dependencies too.
> 
> This saves ~500M:
> 
>   registry.gitlab.com/xen-project/xen/ubuntu    16.04-x86_64           700MB
>   registry.gitlab.com/xen-project/xen/ubuntu    xenial                 1.21GB
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

