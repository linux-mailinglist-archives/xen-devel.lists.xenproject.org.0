Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFFA573CF4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 21:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366951.597925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBhiJ-0008Dn-6n; Wed, 13 Jul 2022 19:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366951.597925; Wed, 13 Jul 2022 19:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBhiJ-0008Bn-3x; Wed, 13 Jul 2022 19:07:59 +0000
Received: by outflank-mailman (input) for mailman id 366951;
 Wed, 13 Jul 2022 19:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ORK=XS=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1oBhiH-0008Bd-Ie
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 19:07:57 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17f7172b-02df-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 21:07:54 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Wed, 13 Jul 2022 19:07:51 +0000
Received: by hermes--production-bf1-58957fb66f-h8ftj (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 65a156af75367857ded6d2cf2b081491; 
 Wed, 13 Jul 2022 19:07:48 +0000 (UTC)
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
X-Inumbo-ID: 17f7172b-02df-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1657739271; bh=lrtn2id1/w6rDvkb7r86M1MSgYYCSarhdbpXFUxCFVo=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=B84svUECHrKyJj/S/IA0R8B6lzJRrmGR6EjjpwPre6q4FnLUCuFWxAtYl0QfyVHyIuxkXCqQOyFh6hsXj72Wk8JBJk3m2RTXCJElviQNFA3ulDFaBWg7Ao7PGijwTpRfKtWyHj0HT/FPOq7FG4bZRIzn6uGWpOG78VEr6iIUJP6nd8vslvQINGoin87C5RKWpEdOCYPbkdeOLX2Xm9/oKdguMR3gohWdVcDQ/kshLij0URNJEZQ72feeP2efpGeDcIUFj+ZlpjnOVxYOj+sOTOFrvNq1kfkjDKjliTl6YlGnnKILFOmoTqnzMxbIddJAJO8032CJs7C6YmurCvJvSg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1657739271; bh=gginz7UTVTgsk/g8Xk92Vk/h7wc2Tv65ymmhLjLTC1X=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=SG+GnJHKUuULT/10FXE8IbELqySkPBhK8iFZ3W73AbOJo+iITG6ge9uydl6ZejYBJm5INzzhh1nnkoAdNwKZiFtCc9GPU3a5WuMlCURYMMjBncMP/2aivjIqAbVvGI0PclkKRSvFIRsDvLGyq6ctVG8tbCviLZgMBIlQf7lpyP2B5uUGkno+GBrFgWgwvwJYPqfVjWhlkJvahJTeI2/uW/cie4pSWpzKHm/eFUo8j2nx7QET2lvcRdD37sgwPesL/CF+5bpctMwWCIy5iDkNypJ/Cpe2u7v0dRDqL0nXTruwlBwJKY+i4KZcNbRNfGPX3DiKO1KyEFY8IjHjmwUv0A==
X-YMail-OSG: qTQWnokVM1lfWDhV4gNNqh7DX7aoOaA1up.GlrFFYo.ojAmpcQqaUbXwWXAPITa
 jNtkZMD.YGcpXxR32NhmVokKMcZFO4ZPbxASOKqpHO4dVXiO4uDYG3lP__.X.SfNsuHfoQONvY9r
 4Flln156vhTaQP5jewRxpn3MC0Ivcx6VIn6nxB3kQuQvEUcZfWyzMNXbtnl35xTJKnXvGB_TW6cV
 Kj9lk_Rhpi8qsb_TzzKG0ZSfU0OemAuCEMILPkOGcdkmRCHVTZ.nBLNVpl8hIHqwE4uF2Q4Fgi7G
 dSzhvrgEuJPBPHFJeVQ7UnAO4qkRN.rPkuW1hnrRWrcvw8329G_8jV1wWNTHd5S44JrBEOED7Fxe
 sysf_gbsRcD.aSxbVO.EkXBNGTxoYopcr0VvOpWzZf2mI4OB_FbjtL7.TChw_mOPnN8e8wTv5bo0
 IIS7rvgNW2HEzEFq0l3F2hVm5Y4fvpzJ7Utpj7vckmmjRnUY0ArUtF3KYXvAEQQXPEbdMcgknCLh
 HJExWR1K9oxohb1xQ2yGWomIbn_vGav6tE27non3SPQDYFWs2wqPiETxdGvjmvy5vfpf1RjVxjFX
 2W64SP10lFQXbPSbFppMLqFvS19RBlfP0Gdix7NvYMx686gBD3G1gfoBn3x32zSbfdesQSGP74PJ
 aSwfH_WzE65DvkfJq8wiy4EAIgF7QI7NDWq0CWLxQRAlgqk21eiOG6_33cgDpnRIC8v9gcOooKbH
 x0GMQaPyWtflSUqnewdH8_p3DQR3oGgW7.gnGfa5QcRYPOljbBWgzwQzHa8xnWOPwMd23c3.Q7w.
 DlbS.0o1UXu84Cm1xwBL1mHuvmRMi36haFjsn8xRaqACG6kEQsqowAuD5H40_1ayO9ITaZrPKpCn
 im05CwO_s_sbAl_qx5b0_RRzmqQysTtILJWXHNSY4RJtPRL4eojeE0jEYNU3rxs2AwC63XblRUUY
 m9RatyGSh1KMx__BVRh4iPWVTINIl6P7YOCRX12dvx8npvP0SVSGnpj7SOwcq4ZZ3DIV3s9zr51_
 Gnrv6Er0Sl6kLjel7L38RjaCHbFhnMIjduZBoGY39u_YFXbTwCPTwMAmMd1AUhKrXspWgahDnIAD
 zyABNCifHavhpX6_XLrTAn4mwTJpHUSn8ou4RzJtQsGn1xjIfO0Jdt8JY_knT3.fV5FE3Frl77kT
 rLdUf3zIeE_9VFiBhsBY12.GJBeByLvJomYLOv68Jbs0d6BFBkao7t78CP7JKOMXiYyQdnaioL9_
 pa8ZQcwKc6JGaJlo1z_OSKZt3PWBIR506nboq_mWxJUONsia50FbfBZb8AseH8C5lRXtoJKbJ1l8
 aDj1FHvEC6RXxX5JkrwatiSrUSiCsffA4Gs7iUzDGVEp0B2eb73SdybjGoIqjYPqp2GsAYH3Kx.S
 546lUvL8Q8sp9z_G06ud8CQ9nY2ZZaooV1vur4hfuLNJ05c1e9v9K2TAhADd1PowklBHmur4CGmt
 4srjVDIVSzaNUs5aHB4uXsAy1BLNiAmOm2L3Cb5HLFpNU2R.X9a0J8zbghJYLKT67QaKpxrSCLjA
 BSX_1Zs7KD9t4EIAC2WLwm0X38SOrQ3NXW.ooNoQ8YzkTeU0Jge.nypK7iWesFcFhdjTe.gZNx9K
 jbUwcZSP7Xenf_nZWXWkAIrrg2O4HKlYqzb0bB4h.F_OvTowEaOYYsSr76Job5sVqTuNAfQuC782
 BPWDW1hTQQNIjV0inTGndVGy1jhItiSYTi1I6Pm6dQCsgAOuurs2c9NRL4kwOyG3oivnEUfToCg3
 r4aIzVQHXyicSINk4G8w76OLcv2lMFYY7N3iVz4BiEcKV5lzcEK8OiEw9dd5hlYTF8JdrGDkdsdi
 KEouMePMCQFNTHUT.T0E3lB..9jT.poDvp4xHsBtiXo5i_c1c8MZM_pUJIDIZnlBVRjnK6IW_4Uk
 FqGl3AJrsGl59fteby2HlD2DFPG7Fv1YfG.7ZVIlV0eq9n3RVXV0EsQHmyNJYrZb9bACyo1IhDMU
 eVbffhs85QmI.wEB5FI9JAC8QgavPsMZSn0chgX3_mqw_W8RYDpE4J54emEMvPIUZey2f_QY45Mg
 i8fYcnPZvLkmUxkHlpxwLdRlXUNcx.D7jsKtHwkutbzQFEEg3LOY1An8g1kP1Ynogzv_Gff6R89d
 3H2swFs5GqURCMNo.1XFgi1D0CHFgmC9WzJvsSCSh.i34nCEe7fa0QJJRcOcF_ZV0JHS5h6I4qvf
 TEQ--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <56a304ad-606f-6d33-bd2b-8c614fcdb666@netscape.net>
Date: Wed, 13 Jul 2022 15:07:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Chuck Zmudzinski <brchuckz@netscape.net>
Subject: Re: [PATCH v2] Subject: x86/PAT: Report PAT on CPUs that support PAT
 without MTRR
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jane Chu <jane.chu@oracle.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Randy Dunlap <rdunlap@infradead.org>,
 Sean Christopherson <seanjc@google.com>, xen-devel@lists.xenproject.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <9d5070ae4f3e956a95d3f50e24f1a93488b9ff52.1657671676.git.brchuckz.ref@aol.com>
 <9d5070ae4f3e956a95d3f50e24f1a93488b9ff52.1657671676.git.brchuckz@aol.com>
 <e0faeb99-6c32-a836-3f6b-269318a6b5a6@suse.com>
 <3d3f0766-2e06-428b-65bb-5d9f778a2baf@netscape.net>
 <e15c0030-3270-f524-17e4-c482e971eb88@suse.com>
 <775493aa-618c-676f-8aa4-d1667cf2ca78@netscape.net>
 <c2ead659-d0aa-5b1f-0079-ce7c02970b35@netscape.net>
 <1d06203b-97ff-e7eb-28ae-4cdbc7569218@suse.com>
 <a8d0763f-7757-38ec-f9c1-5be6629ee6b2@suse.com>
Content-Language: en-US
In-Reply-To: <a8d0763f-7757-38ec-f9c1-5be6629ee6b2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20407 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 7/13/2022 9:45 AM, Juergen Gross wrote:
> >> On 7/13/2022 6:36 AM, Chuck Zmudzinski wrote:
> >> And in addition, if we are going to backport this patch to
> >> all current stable branches, we better have a really, really,
> >> good reason for changing the behavior of "nopat" on Xen.
> >>
> >> Does such a reason exist?
> > 
> > Well, the simple reason is: It doesn't work the same way under Xen
> > and non-Xen (in turn because, before my patch or whatever equivalent
> > work, things don't work properly anyway, PAT-wise). Yet it definitely
> > ought to behave the same everywhere, imo.
>
> There is Documentation/x86/pat.rst which rather clearly states, how
> "nopat" is meant to work. It should not change the contents of the
> PAT MSR and keep it just as it was set at boot time (the doc talks
> about the "BIOS" setting of the MSR, and I guess in the Xen case
> the hypervisor is kind of acting as the BIOS).
>
> The question is, whether "nopat" needs to be translated to
> pat_enabled() returning "false".

When I started working on a re-factoring effort of the logic
surrounding pat_enabled(), I noticed there are five different
reasons in the current code for setting pat_disabled to true,
which IMO is what should be a redundant variable that should
always be equal !pat_enabled() and !pat_bp_enabled, but that
unfortunately is not the case. The five reasons for setting
pat_disabled to true are given as message strings:

1. "MTRRs disabled, skipping PAT initialization too."
2. "PAT support disabled because CONFIG_MTRR is disabled in the kernel."
3. "PAT support disabled via boot option."
4. "PAT not supported by the CPU."
5. "PAT support disabled by the firmware."

The only effect of setting pat_disabled to true is to inhibit
the execution of pat_init(), but it does not inhibit the execution
of init_cache_modes(), which is for handling all these cases
when pat_init() was skipped. The Xen case is one of those
cases, so in the Xen case, pat_disabled will be true yet the
only way to fix the current regression and the five-year-old
commit is by setting pat_bp_enabled to true so pat_enabled()
will return true. So to fix the five-year-old commit, we must have

pat_enabled() != pat_disabled

Something is wrong with this logic, that is why I wanted to precede
my fix with some re-factoring that will change some variable
and function names and modify some comments before trying
to fix the five-year-old commit, so that we will never have a situation
when pat_enabled() != pat_disabled.

Chuck

