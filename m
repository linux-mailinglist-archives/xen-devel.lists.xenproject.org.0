Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B57598C15
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 20:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389748.626856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOkf1-0001M8-J7; Thu, 18 Aug 2022 18:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389748.626856; Thu, 18 Aug 2022 18:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOkf1-0001JH-Fv; Thu, 18 Aug 2022 18:54:31 +0000
Received: by outflank-mailman (input) for mailman id 389748;
 Thu, 18 Aug 2022 18:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qa4v=YW=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1oOkey-0001JB-RV
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 18:54:29 +0000
Received: from sonic303-25.consmr.mail.gq1.yahoo.com
 (sonic303-25.consmr.mail.gq1.yahoo.com [98.137.64.206])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d78a238-1f27-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 20:54:26 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Thu, 18 Aug 2022 18:54:23 +0000
Received: by hermes--production-bf1-7586675c46-lmmdh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID d0129dba676f8848e6f0705cca693acd; 
 Thu, 18 Aug 2022 18:54:20 +0000 (UTC)
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
X-Inumbo-ID: 2d78a238-1f27-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1660848863; bh=wMw+QkYaY2UjMD+FyXhwlnZboSQZ8j1LKo94f3KpI78=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=Z2UgCW7sJ+mDHDWZNMfzVy5y8aczHtKAbDVpLu8JgxCHNYNVg0122SyVwgnltjSeXwycOZdOloxluOTwgH+aJRc5YzG9FBFIGR0LvRiOz85dJeznVCMNdRijj6mWGz9xJ8BGtlno3Ah9lt0PCVoTT2RIRQhkPytiD+B7EaQZXsh0mi8Xtr5G3kwQvacNumkt5dEy3cM30ikr8+AI5J0KpVfO+KdTkqjYKg8G6RiiIDLgZ/Q46lML0ERMqBuV50PdlaQnBV8TVeb0EpDnW4RbuukNuizCoooDYuQyGYxNZ/sHr0nenXej40iY+3CRa70Iu0/9eMOfPZmCujAXSZFDrw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1660848863; bh=l/IU3LIKb6aG1ZzgK5U0EAp+6bboLcPefTEZDZ/svCl=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=ogmRBCD2O5prO7BPljnvKiktjxzGL2GO2z4e45Qi6IMisjtRbHj5Upd9CHMxGV/9rHYyDdEN+Foa1ePPo+iaimnk0FFa37A3hwEZ0A72I/+V/a/I3V479K04uzQ7j2jqRDIjRod96yZf75rVL1c1pI+geK0PKCSfbsVQyoBjTpQ85lZkHVhmVpTMa+tBRjgYJ8XG2BYS4NX+kAqyeYGMyiA4Xaod3m5BemhLgf48Ts69/Qq/JJNlGBN7z+X6eX1/E/v28eoZUQxhbCeXSZmsfY/RUua+NPaPB483MHPedyCZOAnCV5p+uirqru9sniYk/tg5mPVceB8WcWeh2qIIwQ==
X-YMail-OSG: ZMQ0oXMVM1l8ynKpii5JwAdDm95CUewQX5_YO6ICo62C4rChn6Qei7ddGBSjuno
 VzIcQmxPo4NwAy5qrajFjTcI75uC1MhqKFDfXyXDoTm5g1MR2Pt_AnVgOjRVeuOt9R9Wz2Ph1mNm
 aQHUwBqNgi9w.nDTbVyDv255DLt8tS8lFdcMDbghtlRB2vKCc1yT64okP1yhmNuPc8vBtKDveqTM
 Dy68ST5Ycw12LSQW02JgQmpVNX29eIaXP89XZQQuROdMOrgu4PUj7Wp0cqiBYkJefuI0vqlxKibl
 eBX8qcZ3wQl9T3uWlZMIrnpPJgdR3FMKnXkNtE5dAv0ZYhE5WlOnLFr1gChlfl6mh2XvQEBAsvMq
 k6ilzb5VwpjPFVT_BPMaEr6OStSoWyYPYAq2mrqc6Pmr9EEntqomWqRuTE8JaXLLDHCPdcMz_A6c
 JuSBEAVrGK2T3ygOnTUOF9Ik5idkddFpL3UA_UyJVXIbuw_fHzl01gprlK4rq_ix01yhrbGe7l.c
 WkBqKknG2FjNwGsYnbuTpZIpfhZOrvhRJthnjpvbLY.ZohCoJ0IMJZWyWHUmG4gqPBHg.IZV_Jm2
 9Pw2LoBfl6GsLN3TSDF6Gp_eeluPrxZL1H.UgMedPRNffDwHwZdEh6aTOJQStL_o8_AMvzfATMKD
 4DjRDBxbYuktB0RKIAjd.afOj.FJ20reyFdGNCg4h0F4jTo4HLIe.szbSNxsFBOioZ26VHhP2vg5
 yDz0BJW.1aBO13pXk9TFunqI3mMV5oQK2iTUEVOOsUd7FI7r2FSmHBjaRlOZDsAxb1l4QwvF2UDt
 9hr1D.kdnWoboRGL_Td9ZRHTYx7UKctHItBIfjpMTzDMxyxHXxrOe78NEb1y0ZHOcWdrileiBWnF
 onGyaBgiFYB3xbufEfsglwCkbKXUjS.V.t.EZAqZGBE8lB76_joEAXi_CpEe5wnl8nnVaP_OWfzU
 PsgaL8R2EhFiIkSZxhmnVHEzLQk6QJ_R1llwEa14734MZ8btovxy6ixrpMVUqUdodF1N697VdwmY
 cnwpZoZeSwgXhcbiCV55QiIVShrFhbm_Pb0QAwQuPKfkjfcb8llbNy4Wdshta1bUY77FMvXcaTQH
 4vcmSog1r70xT2O.Yil3ak6ZujBeNp0cBl.mpf.mdiTBLA4v0r_CLoz2D4gusOYGy_6wypkgpXvx
 Yw4N0yUpnVN84RGi_BWaGt3JyEAvSQL2ilRRNr2Hx4DRGJZ9AD0jfgZslJVPQWK7aviv7RPzq1Nb
 wPgdR0l_uBZMFSNgUmQiIPtEbpZE0.QB__iuRM45Y9j9V5yAs1lV.TUNOEQPqbsE36FVgHMVKYdR
 qj7vVd_kG6oYJFU6CWvI_m3Cvr8uTMEoK.uJSOVPMURl9RwqMBrI7pBn0cdLMiBHhAT2F82soDoc
 Z_Azy9OynATz8jaH_8jbkSb_9ktiCSDA6xGPyUvUEYQ6h8HFgNJHqbHSmFN_nAB1rs6EmHcJ5llF
 knfMjn_sfukNJkSYqw5WUcRi91d8gBB1IkYDqc.Xj7.OObUMuxsP5..znyTTCn3eG8stX4VAj4Zv
 DmHSsJClbM4axBoS6zmxAYs43rKc.jenQKtPxAItd88S_rkfw5UKvxngTbPwviN80SppbWnvk6pw
 1YhVm.w_nerFQrjwN0frJnUzJzZKB4Ys798uCrcheOVdjIvFsI5zRiTMJYKjFZkgl.Svet3hAX1u
 166D.3tfKMSm0iOJ.yEzxUOQIU5qYtUCa20XP_W8uQCSlrmGH3Svqx8mWA1J3dHMg4b9gooa7Sa.
 lUIQSqDTnfN55PiTTst6HhsXNUhXN.2hI46vDUqjxcO.gcyOVN7UJonrzCvxH3TKRUdAumTk5NTe
 znCvUhTD2YimIUk5FCVIDadBwpwmDe5EVyYzC7lEBYV49QcKoJB5vOS7qwK6Tsr3czsLfCm_ObVr
 YPxS_u4sBy5eXLN_7avB5t4Bpz6H2Q8Jd_tcJtT3qrrh0V7uXKoEWaU4SaFATpFFJjC2EaVi1fAE
 eeAuRFVe243hNJwuiDwesYRso917ahfaUk73QZKhyadqMiXlpZb735ZPED5WG4tYPtb7iHmeune4
 4TLAjsAebqZ2ZIVLx12HQpXimOcrMIV_L_955ET9Lrli7hhqZ4s8lVVo0zmTo1Avj2QitQScWP45
 EF_KZGSdanJzDDmrpvv.ORahOx7nSdyL7c67girVeeF7lhcKQb1zAOXWZVb5got5OUE7FQzdbZg8
 TKdNsgL3LZrkPp_E-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <464f9f88-232d-4fa1-bc43-916ff7045f4e@netscape.net>
Date: Thu, 18 Aug 2022 14:54:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/3] x86: make pat and mtrr independent from each other
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: jbeulich@suse.com, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, regressions@lists.linux.dev,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Juergen Gross <jgross@suse.com>
References: <20220715142549.25223-1-jgross@suse.com>
 <efbde93b-e280-0e40-798d-dc7bf8ca83cf@leemhuis.info>
 <a0ce2f59-b653-fa8b-a016-1335f05c86ae@netscape.net>
 <32ed59c9-c894-c426-dd27-3602625cf3b1@netscape.net>
 <c88ea08c-a9d5-ef6a-333a-db9e00c6da6f@suse.com>
 <bd66b5bc-4d07-d968-f46c-40cf624499a7@netscape.net>
 <a29a66e0-2075-8084-84ad-8bd3e8a9fd4a@netscape.net>
 <a7d10605-87e3-c4bd-4a76-f07a04f5751c@leemhuis.info>
 <8d148826-62a5-95f9-8662-be14f56a6336@netscape.net>
 <6b40ecc3-a2d3-3efd-4a19-2faf737f098b@leemhuis.info>
 <be9d077c-ed4d-d5e3-a134-33afff027af4@netscape.net>
 <6294958a-177a-5c67-47c6-3a95c23ac58e@leemhuis.info>
 <5c40a423-f70a-abb8-360c-a601c5b157fe@netscape.net>
In-Reply-To: <5c40a423-f70a-abb8-360c-a601c5b157fe@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20531 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 8/16/22 1:28 PM, Chuck Zmudzinski wrote:
> On 8/16/2022 12:53 PM, Thorsten Leemhuis wrote:
>
> >
> > regzbot will notice when the patch hit's Linux next,
>
> IIUC, regzbot might not notice because the patch lacks a Link: tag
> to the original regression report. The Link tag is to Jan's patch
> that was posted sometime in April, I think, which also lacks the
> Link tag to the original report of the regression which did not
> happen until May 4. If regzbot is smart enough to notice that the
> patch also has a Fixes: tag for the commit that was identified as
> bad in the original regression report, then I expect regzbot will
> find it.

Hey, I see the patch hit linux-next and regzbot noticed and
now lists the patch as an incoming fix. Great job with regzbot!

By the way, I think regzbot is a great idea, and I think any resources
devoted to develop it more would pay handsome returns for the
quality of Linux. If no one but you is working on it, I actually might
be willing to volunteer some time to help you develop it.

Best regards,

Chuck

