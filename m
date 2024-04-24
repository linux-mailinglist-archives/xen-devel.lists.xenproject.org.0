Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3348B0A18
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 14:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711413.1111344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzc7l-0000de-Jb; Wed, 24 Apr 2024 12:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711413.1111344; Wed, 24 Apr 2024 12:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzc7l-0000bv-GT; Wed, 24 Apr 2024 12:53:21 +0000
Received: by outflank-mailman (input) for mailman id 711413;
 Wed, 24 Apr 2024 12:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VLk9=L5=bounce.vates.tech=bounce-md_30504962.662900bc.v1-cd1cd297a12d4e70b1bff66b32da5c26@srs-se1.protection.inumbo.net>)
 id 1rzc7k-0000bn-ED
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:53:20 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ed89295-0239-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 14:53:18 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4VPf6h1rSpz3sN6PY
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 12:53:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cd1cd297a12d4e70b1bff66b32da5c26; Wed, 24 Apr 2024 12:53:16 +0000
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
X-Inumbo-ID: 9ed89295-0239-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713963196; x=1714223696;
	bh=HBEBsFK/R14niJ9XBuU9Wl9gs26WGVKQpEOGnq201sk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jlFHxGO/uC3qgS6rWsDAsxjyydpFZ4DTvdmFR5a5gm/lVnTXwC8q0lIbyRFJ+diSY
	 7VZeuVSF7v9RsnOtFHIoBN8Lq/+lLPKRpESLpHxJA8pTGZuJwFUOqDF+GbSn1brw78
	 OfOoUan9WxSnkcsgd2XqE+PzGmXi2DidvCKi8qNvScLTT88b7jzS1U4dVjU/jqDwtk
	 c3eeQIsscr+FAKnY1CWPw0woUgSlRW0w29B4aVyS8URXCzzBBwj6IRAUDweewM/JLn
	 WW/m2XQ3AYqoRobb1LFMVN9ZISwVH9lA3w3Rbr2axMDhVrwTHKUGWw3GzpA2M1xEcO
	 4/orViqBikqvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713963196; x=1714223696; i=teddy.astie@vates.tech;
	bh=HBEBsFK/R14niJ9XBuU9Wl9gs26WGVKQpEOGnq201sk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cox8rOq10N9f97iucURVYourybovcp93MDH6mFjaNNEf2fyJ/1r530VwXMtFqnWKA
	 lV7y/U/I7DGc/XpcoxGOtGgdgKxjA1NsgoyGULVBxpracnxn3he4eKWaSA93hBGaiB
	 FVnhfn5cjMDcRuvDOLLTyVIWd7GA7ElpmOIa8rFurSeSQkvSjr7yyKaBDaUapz3byu
	 6fzPWE287rlgE+J5PKz7qo7OT5zr0HZVbI8IgBwgTS3jwNUUGzhaAjR4hvNo2HoirM
	 ewTzzvUOUEJbldGn9B+BfRfCuHpkjsOiASB8/JL6gh15n6zBk7Nl0ymAdTUFJLR/5J
	 9lPYABaUFrLSQ==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=202/2]=20x86/msr:=20add=20suffix=20'U'=20to=20MSR=5FAMD=5FCSTATE=5FCFG=20macro.?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713963194668
Message-Id: <12b6774f-b2da-4407-ba70-501e03a91129@vates.tech>
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1713956723.git.alessandro.zucchelli@bugseng.com> <ec689584e80421d7ffa5b1c0f576ed60b84aeda3.1713956723.git.alessandro.zucchelli@bugseng.com>
In-Reply-To: <ec689584e80421d7ffa5b1c0f576ed60b84aeda3.1713956723.git.alessandro.zucchelli@bugseng.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cd1cd297a12d4e70b1bff66b32da5c26?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240424:md
Date: Wed, 24 Apr 2024 12:53:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 24/04/2024 =C3=A0 14:11, Alessandro Zucchelli a =C3=A9crit=C2=A0:
> This addresses violations of MISRA C:2012 Rule 7.2 which states as
> following: A =E2=80=9Cu=E2=80=9D or =E2=80=9CU=E2=80=9D suffix shall be a=
pplied to all integer constants
> that are represented in an unsigned type.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
>   xen/arch/x86/include/asm/msr-index.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/=
asm/msr-index.h
> index 92dd9fa496..9cdb5b2625 100644
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -236,7 +236,7 @@
>   
>   #define MSR_VIRT_SPEC_CTRL                  _AC(0xc001011f, U) /* Layou=
t matches MSR_SPEC_CTRL */
>   
> -#define MSR_AMD_CSTATE_CFG                  0xc0010296
> +#define MSR_AMD_CSTATE_CFG                  0xc0010296U
>   
>   /*
>    * Legacy MSR constants in need of cleanup.  No new MSRs below this com=
ment.

Hello, thanks for the patches

I wonder if the same approach should be also taken for all the other MSR 
constants of this file that are similar ?

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


