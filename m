Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5E3A748B8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 11:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930475.1333105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7JE-0002hX-H3; Fri, 28 Mar 2025 10:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930475.1333105; Fri, 28 Mar 2025 10:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7JE-0002fg-Dy; Fri, 28 Mar 2025 10:51:32 +0000
Received: by outflank-mailman (input) for mailman id 930475;
 Fri, 28 Mar 2025 10:51:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NpBS=WP=bounce.vates.tech=bounce-md_30504962.67e67f2f.v1-8210f04994f64dfb9e6cc41a32b43c44@srs-se1.protection.inumbo.net>)
 id 1ty7JB-0002fY-Sb
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 10:51:30 +0000
Received: from mail133-26.atl131.mandrillapp.com
 (mail133-26.atl131.mandrillapp.com [198.2.133.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99bbff93-0bc2-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 11:51:28 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-26.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZPHQ72PjGzKsbshH
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 10:51:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8210f04994f64dfb9e6cc41a32b43c44; Fri, 28 Mar 2025 10:51:27 +0000
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
X-Inumbo-ID: 99bbff93-0bc2-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743159087; x=1743429087;
	bh=R80jajjy+Tt3ceXkjjIpEIW5SNKPkg47Zw+//NKciHE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gh/OSORiUr4RIo8pf8ju0S/ILyoqfzefFPdhAjgDgJxfdOho66L96XfOEYwMwX3cu
	 86/BT1vg4V87AEHapD3jg+2Qan/GR1patQF4le0yZe9QejV8e+dA6U4hJQ1Rdhu+Fu
	 e2N3hcruxAv/vrZzTfGsBI9s7o/6C0UFq0Kvi8NW84qWI6ZJylZmgAmaMXO+oyJRL7
	 XA4gXEc1WEek8td6sxexn30OK0wjuMlVJKv5nDrMvKh9zAp6TFtEsVy3Ra9WKuvFNE
	 STEhdthfNWCDHzMjQYJCBWyrnaEx1trPr4HytdF9FumE36N9u3nB9Jvg/+Er/uXqjK
	 M/yHpXTwJ5YGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743159087; x=1743419587; i=anthony.perard@vates.tech;
	bh=R80jajjy+Tt3ceXkjjIpEIW5SNKPkg47Zw+//NKciHE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dNFT7jBFdixLYtCChclJ7lHY8OeChpaC2B6TTn6iH3rKPs54eVD43gGXDTibnrmeD
	 AerYxXgNjkl9johzLJONHTTcVkqgfot9ZK5d/bzHRAakW9NDqyR6rMlljY17Y5locm
	 htJNt36RnPuVcYf4CdjYRKCmNEqplO3Fz454p8QnlX6GABIvLsg2hw+Dzfv+vSRnH1
	 YrcTmE/NJ+GxZekmx8oQ/vovUpMIcqSmAlGM7OWA7OR5o1GvRn/qIo4VC8vhQvatWy
	 iIGJTscVvHGn3OsAStFH5Lkx9AmCOVy3Lbel6os0Y6DE0Q5QrJeL0ufFKcU5g9LWih
	 z+UJmvPbGWdDQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20libxc/PM:=20correct=20(not=20just)=20error=20handling=20in=20xc=5Fget=5Fcpufreq=5Fpara()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743159086556
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z-Z_LokdcNj_K_g5@l14>
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
In-Reply-To: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8210f04994f64dfb9e6cc41a32b43c44?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250328:md
Date: Fri, 28 Mar 2025 10:51:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 27, 2025 at 02:32:04PM +0100, Jan Beulich wrote:
> HWP work made the cleanup of the "available governors" array
> conditional, neglecting the fact that the condition used may not be the

I don't know why the cleanup was made conditional, as long as the bounce
buffer is declared with DECLARE_NAMED_HYPERCALL_BOUNCE(),
xc_hypercall_bounce_post() can be called without issue (even if
..bounce_pre isn't used). Maybe it's all those "unlock_*" labels that is
misleading, a single "out" label which does the cleanup
unconditionally would be more than enough.

> condition that was used to allocate the buffer (as the structure field
> is updated upon getting back EAGAIN). Throughout the function, use the
> local variable being introduced to address that.
> 
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -212,31 +212,32 @@ int xc_get_cpufreq_para(xc_interface *xc
>      DECLARE_NAMED_HYPERCALL_BOUNCE(scaling_available_governors,
>  			 user_para->scaling_available_governors,
>  			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> -
> -    bool has_num = user_para->cpu_num &&
> -                     user_para->freq_num &&
> -                     user_para->gov_num;
> +    unsigned int in_gov_num = user_para->gov_num;
> +    bool has_num = user_para->cpu_num && user_para->freq_num;
>  
>      if ( has_num )

I think there's an issue here, this condition used to be true if
`gov_num` was not 0, even if `cpu_num` and `freq_num` was 0. That's not
the case anymore. Shouldn't `has_num` use also the value from
`gov_num`? Do we actually need `has_num`?

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

