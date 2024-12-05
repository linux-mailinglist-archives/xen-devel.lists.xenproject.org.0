Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50F09E5824
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 15:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849072.1263772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJCWo-0008N0-JR; Thu, 05 Dec 2024 14:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849072.1263772; Thu, 05 Dec 2024 14:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJCWo-0008Kr-GF; Thu, 05 Dec 2024 14:08:26 +0000
Received: by outflank-mailman (input) for mailman id 849072;
 Thu, 05 Dec 2024 14:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fOVr=S6=bounce.vates.tech=bounce-md_30504962.6751b3d3.v1-fa438506577d428fa8d740685fae2d5a@srs-se1.protection.inumbo.net>)
 id 1tJCWm-0008Kl-If
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 14:08:24 +0000
Received: from mail180-17.suw31.mandrillapp.com
 (mail180-17.suw31.mandrillapp.com [198.2.180.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61d1cf6a-b312-11ef-a0d5-8be0dac302b0;
 Thu, 05 Dec 2024 15:08:21 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-17.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y3x7R5VR8zRKX5dV
 for <xen-devel@lists.xenproject.org>; Thu,  5 Dec 2024 14:08:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fa438506577d428fa8d740685fae2d5a; Thu, 05 Dec 2024 14:08:19 +0000
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
X-Inumbo-ID: 61d1cf6a-b312-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1733407699; x=1733668199;
	bh=owLWFM0WcMlsum23q/+BIpROAYWCco6AogDN+VAoWe4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Qu4aSn2eq6ABinoCRdDr9sCUlqd0W70dYXdbIOVzD3QZoaaz3htLvqApVwGRyYCF0
	 XwrWDUYEKOD6PwR6aLzSGUauu5E2ST+Gq1A+EacET93jGCAF8mOuvTpj53OdNs9E02
	 U62nRvT56VCS8h0sp9dLI94kUHgp8orAZbl5g7TZIw9ujv2xytYz8E3YejqVRV49Z0
	 a7RczXvpkUASLaChwvpv1dlAcYYy5cPsc5gTgEASRKt2SWCXF3LhO0L5UyUQm9FEEc
	 rZy5uwKNuWU+O7C/HLFTvm8FCLPRLWH3whlXDIi6YIpXd2mDIOPEebWJIH+ytkXofB
	 PlK/mgXhp9Wvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1733407699; x=1733668199; i=anthony.perard@vates.tech;
	bh=owLWFM0WcMlsum23q/+BIpROAYWCco6AogDN+VAoWe4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Xi/J6u5KiqhfhkkyQ8DvIQJwll4M0aC2WCnP7aNp3TZZ44dMeEj8D0zVdw/6I/+XK
	 hrT7G6yE3WabpDaCntnQwtSCQdSrw9EUUUqMZuOG9D906FCCXA/yt7GRnzRHRftlEB
	 DKlMn0am+0Q2Q8+JfGjqeJ7ZnyeA9Z8vq2nUgLfu+IOEgl4fOjmjbIAOJOF/9leIpu
	 Y7Ghy8cziE5LL3IemVsaE2JDSjMOzYn5J5Yi5f4mVXCPz+MrrgIJQ9ovVwYbuaoKH0
	 94beHc877O/RUUKtRsaj8iiMo+G6zJW2IpJniRDCE17n2EJxQjMb8qfHcemVo7IcOz
	 MLvoIVbULQ1Hw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20tools/xl:=20add=20suspend=20and=20resume=20subcommands?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1733407698446
To: "Jason Andryuk" <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, "=?utf-8?Q?zithro=20/=20Cyril=20R=C3=A9bert?=" <slack@rabbit.lu>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <Z1Gz0VrMZ5degOUJ@l14>
References: <20241203220641.4202-1-jason.andryuk@amd.com>
In-Reply-To: <20241203220641.4202-1-jason.andryuk@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fa438506577d428fa8d740685fae2d5a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241205:md
Date: Thu, 05 Dec 2024 14:08:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 05:06:41PM -0500, Jason Andryuk wrote:
> From: zithro / Cyril R=C3=A9bert <slack@rabbit.lu>
> 
> The xl command doesn't provide suspend/resume, so add them :
>   xl suspend <Domain>
>   xl resume <Domain>
> 
> This patch follows a discussion on XenDevel: when you want the
> virtualized equivalent of "sleep"-ing a host, it's better to
> suspend/resume than to pause/unpause a domain.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Suggested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsla=
b.com>
> Signed-off-by: Cyril R=C3=A9bert (zithro) <slack@rabbit.lu>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


