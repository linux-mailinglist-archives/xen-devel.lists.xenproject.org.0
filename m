Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CEC591CC2
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 23:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386406.622382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMys9-0007oA-V3; Sat, 13 Aug 2022 21:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386406.622382; Sat, 13 Aug 2022 21:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMys9-0007mI-S7; Sat, 13 Aug 2022 21:40:45 +0000
Received: by outflank-mailman (input) for mailman id 386406;
 Sat, 13 Aug 2022 21:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QptA=YR=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1oMys8-0007mC-Ky
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 21:40:44 +0000
Received: from sonic304-25.consmr.mail.gq1.yahoo.com
 (sonic304-25.consmr.mail.gq1.yahoo.com [98.137.68.206])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 937dceaa-1b50-11ed-924f-1f966e50362f;
 Sat, 13 Aug 2022 23:40:42 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Sat, 13 Aug 2022 21:40:39 +0000
Received: by hermes--production-bf1-7586675c46-npccb (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5839c0cb0572738d7f39c89d274f137d; 
 Sat, 13 Aug 2022 21:40:35 +0000 (UTC)
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
X-Inumbo-ID: 937dceaa-1b50-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1660426839; bh=PIlufvsaPsyGJwlW4Tq6D4v1lbnSLieh/roTabG3bLk=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=p1itavqn3ffG609jlveGZZH2gkNFsWKJqxCsuTD2xLk8usezC/U3cujO7B5LH+d4MCIgr1MOPh4l3DGmerSJ1sYiEQyCdGxpV/BPLNEzffS5Y8OTPSVX0hY1zbHpY0aB4MLb32yLbG0dWUH1de3SEVtjqbhkjPlXZ6LAiQMbDXRNET/QlNTQSYFCPTlxTW3ix34cj2HYLbnNM5+FPY1JH0rmEzOHUHeP38DP3zAHKCuiT3uJZ0PguvVsu2Ug57BSANi9f3fSFy1phONSSpug4Zb0cmlMtmpuouh8DGtCVECS41EY+LzgMt4XnEmqfZHoRZU1mYjUR2sIeR7NcgyA+w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1660426839; bh=GSdSnTct/aFv3F/BFRhCVd4786aWn++1H4Q6NyrdEiU=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ZvUx8v2KifxKSZT+0AgmeCaiyShR9gjzycxGeeoE3sy9roJGP/AAu7ilSm5ODd3A/dc1+F4HlVn1PKDpOhrge//tRTNvSA4wWcsun6T3uAgMCzQ+W48S53OJHV7MteDJEg+VG0SeXhsq7dqEhAn+7vD7926RhEW6C1PV4E9lKDV3EXQ8qBNq7HlZDIxNgZ9dJIWMGsxyrCf+ujG6F8mkHuBfI+K1NdAsyav4L02PZgUpB9u2wpg0hVbX5/cg8Cn9Hu9mAcE0FG9zrHDJbJoDQL/Z+FLF5THp0HDAo7VdyDkxNGZSWYeYA+lrvjM/gq9m841a+XOogyu1lZufPPJr+w==
X-YMail-OSG: TebSG6YVM1nQH6Dgfq.F8qvUCnxbvYNhSxtELVhuO9v17kdGSK8oyKXUJdMdTOz
 1eLGp3bUBQm2l3wY.x7sRYB08ogP7WBXYrPlE75UYIeW7oYHfJ.fqifoeljDqBF4ehRNn78RxwjL
 CAbJLsAh98XFMmyWbzjK61YcgHnTk4ylbuU6YfcMU4WwnDraGubO1SJ.P05IznFC3r_Yk1WEkQCi
 AyytDwMhldDUEWUDYIiW2IrYVHgABwQ5MKYA_bRiNXjRt2JvV4CgsdnQ9hndXxMuN1k0xiJPFudd
 mo7t3f35GyDvZLJp_4YgYRzLNGd2n8JmjmulwBsXA6ZiJ1wYGfni8j__mJzjv23L_4FaYa6046Na
 sI57erJyP4HxZ6Zy_r2Lvp_6eLY39NI9LBBHuxCqt74l2UG4p0RCyZQyUUuBmk3As4rU9V_Va1GW
 9yVwfQdUtV5CkHQl47gVxpTNwMlTxnyMwv.NtYL.I2Z0pjvy7aOh.ojZnrdOnj8yDzhbclKVv2FO
 PzOJCH7OkpoDOL0HOQWB9mn9up.Tp7sVpSVrmjxp3FyCB8L0_cupKwuFXj36CQHg5U2G6L7VPuGR
 I7PrCBi2tL90mYtTq3h6.btJlGlgGDWeGXwZD0B_wpWKNwgXyyOFosx.BY5HGAEqU9GZKhGlIJaP
 UTp.n.15rXxZiGjBFdt8SQJq1gBCm8cfhhpjbJtfdSPZcgz.qDDxsW4.VwGWsRqg.8G08vcgvD0K
 1bYU_C9dRiJCMMFbRu3y9Zs4Sp42y7aT3r5Ewczdol4oNLnoDkpwoAeJK5nz_GX9DL62sfcwpXgN
 8CJWWVL2XM.ABsIP.jv_oLyXwh5k1er_Qhc6C.xbqPjbN3ohsg6ho8_cGeJm0FuWyE9k.h_vsJle
 VBzxGshw0OGeMj7XT3HGMFil1mTFhziLFUfxNIedZjHWHK0pPjEbbJQ9T0PK6aQvTQbPJJ6b7Hc8
 9h27qaIq3s.VIgOj3.90v._8Ko9kjKE_hNjXuubk6vQuZE8HCFZLaZD4EBPoo0PYSscCToNQs0XR
 ZPLAPSHZOGHMBnIHlPKPhKhVWSqC6eodCREdwmVT7.VsAlLJ4tXwbRToMiKUQC3tcyXYrVqWM0bb
 HrAXnuxv54JP48OzSWWiEwN4VeDDuYghTAhO_WOSPjYRvrh3An3n_Oc9fjUA2jbtdWlmCkqdpKAi
 SJrsAzm8lD3Woxep.xTcoI.VSaqmuUvSGde2EwL9Hk1uFkshCDzGSSbzPY1BZ4w7kpJokKbKLY9O
 Rd_dJSylAMevviik0CYoKIVcj4ZsfiekQDi6UOsHZ1QIvzKXs3B9F77la2_UV_8026MQne3J9xt6
 zTRVXjzswJaPYOoK.vQL82UQ8UVQrtQFRMDCpLFnA5SIxco1srVAW8P4Wjlo4ZdKiW5H73Jqtbk9
 TyPcpfxfXSs0WvVC.UT0eSULSYka8dJEbLSU6a5J0AIgNyi2xSq_pQ39l3L5H9HBVjdwro.cJNMd
 eHpOZXScwlweiXvqEJdbVhJdn9ocpuhxeal0ZFwrITCuHRhTYBU8sR28Iov49ZFbuXfeu9scVS15
 W7Sa9YL.5BxR3U_ViGvkpPF0.CkdvGXvwiocCTrn43.buMlt6gJJL3xJexup9qErEVA4fOgxFbn4
 j7Y1eXErMFv8PRATkpCFdHrvIS4WpEqfdTl0Q1j560j0zUN6IZLzoA27qxXC_FWQUUcoTnBhKH4Q
 xnE9LOTU05PxWq9MmaJjcxHlUzTVEWtHA._xlGxvOdN7GWgF2_3p_hbG9A.5nbDMXmqkIGofKavC
 eC1M9BfIzCneCJ48DiVbk2wKymSfzYcdJOJKmzFtU2GELlOl1lvvEQAsIviCFIRkfgZlxIpDgkIj
 LQVHj87U5rL5cukxpjyxM0OkJbSdjtozS780IWj3exg2_Ya8l.hgTWrUeBmf76WM36cYvRDtsrJm
 RGngDXaVk4VSj8pfH8uTjZ.zernyDqqMPI.EvMpsafE5TRnnXEBV7Bqc_DFOuWMZkyhFNziTr_hB
 mWjDniknir2nnBtwjv23Qs_pu7xysMZRxQ2Mi6NQ0Pnta_rvXZLb4dRF_2S0A4HwX3GNZ1l38DqZ
 NhLXyWVC_vpomdl2vuTNi6Fq6vfc6YyYX1bYr65BA5wT2_jVMkGKUo4WP0uRPgdWBjoYYQRc5HNp
 J2GuYLEoLlCYYvpHMHB9cxIcEkPLVDQPNVIn9GpUbYaHrusIGa_AygNSTwv9cYjTwbC.TuKEBr29
 i_ty3aFQ63Kl2uduNS8WRSo1L
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <3de36953-9b8a-d040-c8dd-44af1ae2d56d@netscape.net>
Date: Sat, 13 Aug 2022 17:40:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: PING [PATCH 3/3] x86: decouple pat and mtrr handling
To: Borislav Petkov <bp@alien8.de>
Cc: Juergen Gross <jgross@suse.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, regressions@lists.linux.dev
References: <20220715142549.25223-1-jgross@suse.com>
 <20220715142549.25223-4-jgross@suse.com> <YtbKf51S4lTaziKm@zn.tnic>
 <d838264a-bcd0-29e2-3b23-5427ee0ee041@netscape.net>
 <YvfdYS81vU66tQSs@zn.tnic>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <YvfdYS81vU66tQSs@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20531 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 8/13/2022 1:20 PM, Borislav Petkov wrote:
> On Sat, Aug 13, 2022 at 12:56:44PM -0400, Chuck Zmudzinski wrote:
> > Why has Juergen not at least responded in some way to the
> > comments that Boris has made here? Why has Boris not
> > pinged Juergen by now,
>
> How about: it is summer here and people usually take their vacations
> during that time and everything takes a bit longer than usual?
>

I did a search for Juergen Gross on lkml and he is active submitting and
reviewing patches during the past few weeks. However, he is ignoring
comments on his patch to fix this regression.

Chuck

