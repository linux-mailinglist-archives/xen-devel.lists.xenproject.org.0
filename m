Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A201BD205D5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 17:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203518.1518683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg49z-00066S-BL; Wed, 14 Jan 2026 16:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203518.1518683; Wed, 14 Jan 2026 16:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg49z-00063i-7t; Wed, 14 Jan 2026 16:55:55 +0000
Received: by outflank-mailman (input) for mailman id 1203518;
 Wed, 14 Jan 2026 16:55:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68im=7T=bounce.vates.tech=bounce-md_30504962.6967ca95.v1-02bd80d5a333410e889d0141c49c3aa1@srs-se1.protection.inumbo.net>)
 id 1vg49x-00063X-GO
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 16:55:53 +0000
Received: from mail8.us4.mandrillapp.com (mail8.us4.mandrillapp.com
 [205.201.136.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1320245-f169-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 17:55:50 +0100 (CET)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail8.us4.mandrillapp.com (Mailchimp) with ESMTP id 4drsgn1xfWz2K1t5s
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 16:55:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 02bd80d5a333410e889d0141c49c3aa1; Wed, 14 Jan 2026 16:55:49 +0000
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
X-Inumbo-ID: e1320245-f169-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768409749; x=1768679749;
	bh=AtllGZ6Y5k1iiyLVhr3ycRE0CdV4k59zMR6/1UbZufw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=avDyeIzZBGanAw0ZMGdIsnRFGvPczryJXwcjaqFmOjRrl4jdv2a/3eIyJk6eCzCrY
	 9sKmkTjn5P/eh6VFNvPjzLJF2LEFISW/qCye33ENrZ4UxsTMy/7bfvumv7Y+HbAeck
	 rFV+p7ahIGKBsAXfEI8il5lh+Tll+rUrxrcKXM3v0MyytTpYgvHb3TnqHg5poEEJaG
	 adip1HABYOyjlMM9WeNXjO6mDuIOboPjnpbKvkbTirLUSXLHeMhW/3yXghFqSxy7Er
	 lCuW3ZS44H+JIjmDtTb61aVPzBNQfa5JtTfrJEfIpf1vdlOvVQc9A8crGgWp7A6TDY
	 fmRnBiW3/JgzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768409749; x=1768670249; i=teddy.astie@vates.tech;
	bh=AtllGZ6Y5k1iiyLVhr3ycRE0CdV4k59zMR6/1UbZufw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=W0JoNf1P8J/Yo8tOCmgzY49aJ67VbMDX/fRU95NolSCcxo91BEUZN+x0EcEejKfvM
	 JSPbZit2kp0RH0NY4yPAPrOFmAKi+c72PLk5D15Io3Fq8gbRcGuKYaqwg6E30Fyn7Z
	 sJ687OxWE9c5nvjx20YahJ/YQL4ae6ep/yLABLVKlJHRJBEhXVBaI+364LMoxXXZ/Q
	 B+ZypJiQ0Ep7WLmpn9wFIYuSCVSwA/elTVWdoW+Aag+0EoV4Wr8J3HrpNgF54YqYqD
	 rV+WwSXQhthWFbBEyQNhlWnxP6i0eZnLqQFKZwJcSAnaW2zuxnqIIKL8I85IRBgGR9
	 rPRaLksQjrjmw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=201/6]=20x86/cpu-policy:=20define=20bits=20of=20leaf=206?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768409748287
Message-Id: <28910a0e-c6f3-41dd-9a0b-8289218562a0@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com> <bc01618c-149c-4a70-996e-5364655b4ab5@suse.com>
In-Reply-To: <bc01618c-149c-4a70-996e-5364655b4ab5@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.02bd80d5a333410e889d0141c49c3aa1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260114:md
Date: Wed, 14 Jan 2026 16:55:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 14/01/2026 =C3=A0 14:45, Jan Beulich a =C3=A9crit=C2=A0:
> ... as far as we presently use them in the codebase.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Or should we make both parts proper featureset elements? At least
> APERFMPERF could likely be made visible to guests (in principle).
> ---
> v3: Use SDM-conforming names. (Sorry Jason, had to drop you R-b once
>      again.)
> v2: Use bool and unions.
> 
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -121,7 +121,46 @@ struct cpu_policy
>               uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>               uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>               uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
> +
> +            /* Leaf 0x6 - Therm/Perf. */
> +            union {
> +                uint32_t _6a;
> +                struct {
> +                    bool :1,
> +                        turbo_boost:1,
> +                        arat:1,
> +                        :1,
> +                        :1,
> +                        :1,
> +                        :1,
> +                        hwp:1,
> +                        hwp_interrupt:1,
> +                        hwp_activity_window:1,
> +                        hwp_epp:1,
> +                        hwp_request_pkg:1,
> +                        :1,
> +                        hdc:1,
> +                        :1,
> +                        :1,
> +                        hwp_peci_override:1,
> +                        :1,
> +                        :1,
> +                        hw_feedback:1;
> +                };
> +            };
> +            union {
> +                uint32_t _6b;
> +            };
> +            union {
> +                uint32_t _6c;
> +                struct {
> +                    bool hw_feedback_cap:1;
> +                };
> +            };
> +            union {
> +                uint32_t _6d;
> +            };
> +

While I'm ok for the a and c unions, I'm not convinced by the b and d 
ones (union with just a single uint32_t in it) as it's quite verbose and 
inconsistent with the rest of the cpu_policy structure.

>               uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
>               uint64_t :64, :64; /* Leaf 0x8 - rsvd */
>               uint64_t :64, :64; /* Leaf 0x9 - DCA */
> 
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



