Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D425B9DBBBB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 18:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845565.1260929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGiB9-0004T6-4R; Thu, 28 Nov 2024 17:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845565.1260929; Thu, 28 Nov 2024 17:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGiB9-0004QU-1h; Thu, 28 Nov 2024 17:19:47 +0000
Received: by outflank-mailman (input) for mailman id 845565;
 Thu, 28 Nov 2024 17:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ayl=SX=bounce.vates.tech=bounce-md_30504962.6748a62a.v1-ffaab613dfec405b8661c92b2e712a76@srs-se1.protection.inumbo.net>)
 id 1tGiB7-0004QO-AZ
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 17:19:45 +0000
Received: from mail136-20.atl41.mandrillapp.com
 (mail136-20.atl41.mandrillapp.com [198.2.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2e264cf-adac-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 18:19:40 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-20.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XzjjQ1kLyzCf9QBL
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 17:19:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ffaab613dfec405b8661c92b2e712a76; Thu, 28 Nov 2024 17:19:38 +0000
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
X-Inumbo-ID: f2e264cf-adac-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yMCIsImhlbG8iOiJtYWlsMTM2LTIwLmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImYyZTI2NGNmLWFkYWMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODE0MzgwLjQyNzUzNiwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDhhNjJhLnYxLWZmYWFiNjEzZGZlYzQwNWI4NjYxYzkyYjJlNzEyYTc2QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732814378; x=1733074878;
	bh=5P2eEcW5HcVWqpM1Z6NRCuswPrUIR3amsCGc5WTsyzM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YdFhyEhUdd5SPBy399Gwgp3NR5KoZb8ngagdvcXqRR/TBxQjfhXwzZcSQkpHS25V2
	 X15RrDi2a3x8HfgYcRtVNpqNYwli1J0NmGoupkfa+pd8eKg/NkEn8gou/3gYNCE1mG
	 mZF2ivd7JiJvgybx+cpa/+Wj179T3zoVWr45k2AS91FUEvdHirt3zvmB+vJxG+SSk4
	 D6xTTzB0Xofh80DpRkX7fv7p/FtuL3gCoNy/uaQwtEn6JFiiJEAk/oyZzYodJ2HuPZ
	 FujeewYM//5rh/l22JdeRf7mILHVQf6LVIYpNzWaVfOw/W/bPIZe75WWOl1Pmr/0xj
	 +ZHjucZkOJKBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732814378; x=1733074878; i=anthony.perard@vates.tech;
	bh=5P2eEcW5HcVWqpM1Z6NRCuswPrUIR3amsCGc5WTsyzM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MYe8GfDtF9eSZfq4/EktrjAExPyjQv9F1Eu4zqY49O2pmS3BT4UhJtfKJhQyJVHDz
	 TtLMpcBtXVZTq6Rs99ZvASRbOUtb9wsu+cdB+uvE1s6g/RzOk02J54NdL0p5XnLVRv
	 ZmJI0q+8N8G3srzbB5sE4v4//8NbImPO/c+kHZhYMmmJqzFMFokbNeDlk7T7rvL8F+
	 iF3gcsrapJd5+H1ks3WqJbLpn090ELDRsDsglLuVMET5wvx15yZenIkSOWgll/bVwo
	 R4p0jvAnHiAEKKZMmymsIDfUJ8oR6jH21lfWV0L7MxKSKmucPzu6iiugee4x848Bhb
	 B//91II3Svuxw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=202/2]=20tools/xl:=20add=20suspend=20and=20resume=20subcommands?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732814376885
To: "Jason Andryuk" <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, =?utf-8?Q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>, "Andrew Cooper" <andrew.cooper3@citrix.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <Z0imKGddLpvxAZEN@l14>
References: <20241126171941.170897-1-jason.andryuk@amd.com> <20241126171941.170897-3-jason.andryuk@amd.com>
In-Reply-To: <20241126171941.170897-3-jason.andryuk@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ffaab613dfec405b8661c92b2e712a76?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241128:md
Date: Thu, 28 Nov 2024 17:19:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Nov 26, 2024 at 12:19:41PM -0500, Jason Andryuk wrote:
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index c45d497c28..3160966972 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -42,6 +42,16 @@ static void unpause_domain(uint32_t domid)
>      libxl_domain_unpause(ctx, domid, NULL);
>  }
>  
> +static void suspend_domain(uint32_t domid)
> +{
> +    libxl_domain_suspend_only(ctx, domid, NULL);
> +}
> +
> +static void resume_domain(uint32_t domid)
> +{
> +    libxl_domain_resume(ctx, domid, 1, NULL);
> +}
> +
>  static void destroy_domain(uint32_t domid, int force)
>  {
>      int rc;
> @@ -82,6 +92,32 @@ int main_unpause(int argc, char **argv)
>      return EXIT_SUCCESS;
>  }
>  
> +int main_suspend(int argc, char **argv)
> +{
> +    int opt;
> +
> +    SWITCH_FOREACH_OPT(opt, "", NULL, "suspend", 1) {
> +        /* No options */
> +    }
> +
> +    suspend_domain(find_domain(argv[optind]));
> +
> +    return EXIT_SUCCESS;
> +}
> +
> +int main_resume(int argc, char **argv)
> +{
> +    int opt;
> +
> +    SWITCH_FOREACH_OPT(opt, "", NULL, "resume", 1) {
> +        /* No options */
> +    }
> +
> +    resume_domain(find_domain(argv[optind]));
> +
> +    return EXIT_SUCCESS;
> +}

These four new functions in xl_vmcontrol.c needs to be hidden behind
LIBXL_HAVE_NO_SUSPEND_RESUME, like the whole xl_migrate.c file is.
Both prototypes for main_*() are already hidden as well as the new
command in xl_cmdtables.

Or alternatively, we could probably have the command been present on
Arm, but I don't know if libxl_domain_suspend_only() is going to work.
It looks like it only depends on the hypervisor. I can't find any logic
that would treat Arm differently, besides the presence of
LIBXL_HAVE_NO_SUSPEND_RESUME.

But best bet would be to hide those four functions when
LIBXL_HAVE_NO_SUSPEND_RESUME is defined.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

