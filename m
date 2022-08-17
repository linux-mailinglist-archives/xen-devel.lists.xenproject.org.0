Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED5597444
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 18:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389124.625950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOM4u-0002ks-C6; Wed, 17 Aug 2022 16:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389124.625950; Wed, 17 Aug 2022 16:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOM4u-0002iE-9B; Wed, 17 Aug 2022 16:39:36 +0000
Received: by outflank-mailman (input) for mailman id 389124;
 Wed, 17 Aug 2022 16:39:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WjVN=YV=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1oOM4s-0002i8-Ee
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 16:39:34 +0000
Received: from sonic315-54.consmr.mail.gq1.yahoo.com
 (sonic315-54.consmr.mail.gq1.yahoo.com [98.137.65.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a7f31dc-1e4b-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 18:39:31 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Wed, 17 Aug 2022 16:39:29 +0000
Received: by hermes--production-ne1-6649c47445-dfpjm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 71f044338d92358baa775f8f58366682; 
 Wed, 17 Aug 2022 16:39:24 +0000 (UTC)
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
X-Inumbo-ID: 2a7f31dc-1e4b-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1660754369; bh=h0Usloj2Wcsg+icO7aHh0ohv2JWzmgO2Fi9E0GF0TcM=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=JQb4K5FTH3HPCNB+3zVD85yZS/6pS4Egxas7E9ZtOJKD1KVC2eAbaJJ/Zo4yXx8vXUWkpTnRtPUb/bXQPhPOQU4oxux0Sl3Q4lXmj0Y3+T2GHo7YA/Gg20/TTtSWZZu82CiGEdHqw/amSYU5E4M+YBuFhY4Ewq3yxdmlDjVGnvrHW6eqFOqu8klzBy0fdpM4FvUm2TAiSj3yNpzyhUiejA8cfVyhu2TcHPNXMdBE+CKldQEtxwALIeDPESNi2LhGdaHt57p2lYNSuNhyhnqLb5AkUB4dRO8uS90RPcjtRH/R/eQUJPpJFsEgTLLTPrpq1c3kdFQCEytx4mszdK2DmQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1660754369; bh=W7DXS7Ou0qbxl2bjlZyv2kHKgQS3WHgBQGLYXkkSADd=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=sejze7Zd7HzECEyUkcV0qJuWPxwJ2fVE/h8e2GMNhAdehGrCfftrTBNpyCodsm+pdzil/CLdwUmBurFs5AfA+sycyHw2CB/hnGd6H9sUfY+0GCvb+FyFLzyswVQOFXYgPh2YoeULbWdCi0X6qAEM8PqCOVCO/gHx/v/lc3eqcTgwBQVnomj3s0xXU8GGJaEWUv0xvvSgkuovdFHVmiayPwUeCbFtiZSl2FqM6HH2bbhriedwlLYKTTv35tFBYzzs1wzEtW74HDfZx70/J+OfDj4b+j99W2wr6Q8an67deegHOi8+vlpfd2W+h+X9KbJ+RzGVbFssVcx/oUvh+asNMA==
X-YMail-OSG: xpWHUqYVM1maFPJ25Ub2KYgF2UqRiGDP7ys0R18r1af5ghW6XOR8gfyL_PXhMLs
 uF.to8igJ4taDuFK.af8QDF0.Am3g2QN78LyYxaOo7yNGk_FCDv3yrgA4ezX5zq_dPu3oKF_04q6
 qDfQ.SOjRJLnMpC1cr04ij6A7sXIqlpLW96LrPAkTnKhJiLKkjmsDgBo2A3Qph4MFO4Vji9Xi7bV
 sk9QVh3bVWShaPhdsBq0fpLmJ7BGnwVkbq42ucHGpgFjvrYfSIt_96SBLS29aeXUfJciNhvOV4qu
 yIReXaMD8x8agICtu4SpPaVJFGn3J_SnvXc_a_E_gt.3WuwmZTvT8u_jCq1u2ODxJKh7z0dEBxqt
 kAI.nKL.5CpX_O9LoNmCw8RYVmiBoZXE3UAolpiuCbcMzsRTekHT6vSSyBmlvqjAmOCYd2kxdfGk
 LXfD9.lIjEmMMuXP0MD_hlKwN5YkTv35jqB9F5zwSQVav_Ab_._PDYpd8sYSZlHPntsdyPf0oPxz
 29tzIJcfQzdo3eA8XvLIZS5LrMafiNQuqpqgDNEjeMmjbQ75SzgbeOhukokNXOPbHXsLjOdz6AC2
 Kf_1yCh_s3JJgURkSQWHjzEYNfS5OLl_QbCEAamWiNQMZ2UPiq_HhvjuVvLihyZ3tyJvbn8L.oYd
 ErVTNkpODNoHaffXF4doFzldQ_x6eKioqrD1YY9Q7jwWkciuci85XIc6RMw_YAHm83UAS8IB3K67
 4G8r406C9qv1x7QCPRjEh8PpqHRR5IJo1NR7rFFUA4NdV_KdRHzW_D6WqT102G1vrs1Zq273qT9E
 0SRn_BgRnFrFSI.t1ckEWS.70ngVoqTl9MvfJ7lnEz2iy28srPrrpR8FtiP8UzwPtB3bihNgXoJy
 ovmhYZai158oluX1Dub24809CJY8e9C1jhqukiIbj88coJ49Siyx5nmslaxTHO0D7uFxGQOLipDV
 AUFEEsXDrYNUwMHj_JcJRX0t15znCVZ5FK6UU79puoVx4Yit9wADXeTBDsmT_mji1IBeHtHU1FFH
 xIKhsbnLcRyopY_BPBc3U1SinnB7uknM9Jip2YVpnLBn9SMtgEpyxqCi3Qw19zmmBY04lsr6dAWw
 9HrE6O7D57ZkN2fZNWHZ0jW2OejU5C0MfSslG0lsFwjlNn3vIMU7HPpWqKb7NNAFRpzh94igsP83
 hk_QiNqLtk.wLnh9h1S3cjB7nqB0yc.NSznOMKqS4M5bwMHTYbaCGSH7ek9wcG40aT67h6TTbHT7
 l9t_0RNBCEWxq5bpn07GedYh4R6A2NY88caTSYApGcs82TUAgzrHYZn8.EA3iows12xesshY_M6C
 q.9RsazHyCecIqfhlM9sjG_LQSsSacLPyny_m6egwh6eeHW5bjY5OeI.OmUZ8kurxA_JVWhMOGq6
 f6aL2QbGdFZo_YJo.y.0LIkbMtJaIMf3Mim4BtKYZLpADBJooNp6eOyDOwalLe7q6ZO9wtaxWh9n
 yQhLW2saN2kpAm9vzunKiwaC6wCBPb2959tDY178dTJYdlrOOIZmBKSM2hqWiCYGaP9fa6hTkEBD
 N_.nfvq0myzabyx98Y_PoG9WwBNoAgUOx1IljPndF5nhOCP7vW2vbR26MS4wbAHhLRFSKD_GbCN.
 Thy_5tb4ezqGZiJ1_QEYuAxPaf.75jfrOdCP4C4EKYp.j7X6U_Aku0tGaqgcndV_I6lVFTbexCmf
 fAAwABitZg8qpR__g_LtcQ3Smp0HBEwNeQnPr4jD72t.Ymi0qhM3TcbenWcIDgIETPCrQo7cZG3B
 SmwwZQUy67kLntGxi9mGrXBmCnHNF10b3q_k3JcZ_ukSMMdzLlb52EjLxWMBk.DGG6r0R1exEQHY
 Hj7RHBAlrzHNweVnQNn0xJot9IV1zHVY58STDmFOmHwVhQbxiZK7yjXKtN4f058S2W46C0AbFHkl
 4JHbYukcOr5mPnOdkFfukDSzWJ_KVzg8wJD2RRxzUItD3Z3PPlmJLx3KyhBMty3zxH3tqbIxQi1m
 ztTK5_E9CIJKkQlSX77Mb00UlJPCJRrYy_raNBa5W9WkLXnoyMeegIIa4PkT.6n9L__336_yQgjG
 .RZOes2vZuP0HhZYjS_0ttUygDR3Sls2h5p67HY5x1g_bDEDtN6jHbJnXLDCRfB5VB7J9VsCvSys
 25f_xskgnJ6htFJSZbhh8kVxR3KQvnY96c5zbBdpX.eIsu6_nCj9QhW.HWHTXNNkKvQ--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <28fc53d7-b189-5097-df44-39c9c2170449@netscape.net>
Date: Wed, 17 Aug 2022 12:39:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2] Subject: x86/PAT: Report PAT on CPUs that support PAT
 without MTRR
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jane Chu <jane.chu@oracle.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Randy Dunlap <rdunlap@infradead.org>,
 Sean Christopherson <seanjc@google.com>, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 stable@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
References: <9d5070ae4f3e956a95d3f50e24f1a93488b9ff52.1657671676.git.brchuckz.ref@aol.com>
 <9d5070ae4f3e956a95d3f50e24f1a93488b9ff52.1657671676.git.brchuckz@aol.com>
 <5ea45b0d-32b5-1a13-de86-9988144c0dbe@leemhuis.info>
 <56a6ab5f-06fb-fa11-5966-cb23cb276fa6@netscape.net>
Content-Language: en-US
In-Reply-To: <56a6ab5f-06fb-fa11-5966-cb23cb276fa6@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20531 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 7/14/2022 10:07 PM, Chuck Zmudzinski wrote:
> On 7/14/2022 1:30 AM, Thorsten Leemhuis wrote:
>
> >
> > Sorry, have to ask: is this supposed to finally fix this regression?
> > https://lore.kernel.org/regressions/YnHK1Z3o99eMXsVK@mail-itl/
>
> Yes that's the first report I saw to lkml about this isssue.

Hi Thorsten,

Actually, now I realize that was not the first report to lkml about this
issue, although it *was* the first report to the regressions mailing list.

Actually, the first report to lkml about this issue was Jan's patch that
will hopefully soon make it to linux-next and mainline. So the proper
Link: tag for this issue in the actual patch to be committed to the mainline
kernel is to Jan's patch that was originally posted to lkml before any
user reported it to the regressions mailing list. To know there was a
regression from Jan's original patch, one would need to have read his
commit message since he did not actually report it as a regression to the
regressions mailing list at that time, nor did he identify a culprit commit
at that time.

Bottom line: everything seems OK right now because the patch moving
towards mainline does have the correct Link: tag. Thanks for all the
work you have done on this regression.

Best regards,

Chuck

