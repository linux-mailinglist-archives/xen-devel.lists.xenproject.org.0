Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFFF4A6ED4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 11:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264034.456980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCyq-0001Fw-9s; Wed, 02 Feb 2022 10:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264034.456980; Wed, 02 Feb 2022 10:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCyq-0001D1-6d; Wed, 02 Feb 2022 10:35:16 +0000
Received: by outflank-mailman (input) for mailman id 264034;
 Wed, 02 Feb 2022 10:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFCyo-0001Cp-FU
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 10:35:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc5b31ec-8413-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 11:35:12 +0100 (CET)
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
X-Inumbo-ID: cc5b31ec-8413-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643798112;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JaNgHiiT2CUPXEFlQPWamLdsisXh6TwyCUAtSiC4Kvk=;
  b=bREdVRxovmRkgzq+r8qc3mZjcpWQy3FVNujHMCxRfW9fPbLR6jqGasDI
   mQtQeqfNEq/TdYAOKzMJVg4ENSeIWg9eRGG4zk1NWS6jaYQ69RnWcaNwg
   r7TQ/B0iabOhKY+YjD/InMLSwd9pY11cw0IfYHZ/uAnIsqkeOVva66S4G
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HOhXjLI1DNdmgZ5v6J5Iv9CX1v160vwBuYyfuDaLqEe2UkpaDf2zsRJv3n7k5VuL6UTbUNWmPC
 7IE4HnPZgoSx/jy2P1ktgYGBo7D7ePgzoq84LkdiYbnV7CJmXupvlF1HErWvjuX+nVQNA+bneB
 Kn6y5LMQUvTHxCn7c7PtZ6rv9a6OG7lfgOANVQHQfgovFTRvkF/QEKDyxLgnU0U4IRRasQfsCv
 aAuzvsK38+05h/uFZY4lT2xBmwDhdWsRXKU2je4T8UDtN9Th30yq2yPlntEOl7Vr88NsNAhmxz
 V/flmrfKbHgggeMD2its9+J1
X-SBRS: 5.2
X-MesageID: 63222047
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:l+blKa4MpKfqsnX4MsILowxRtBjBchMFZxGqfqrLsTDasY5as4F+v
 mJLUDjVMv3ZY2ujcot0OY+ypEtXuJXcxtMyQQZo+HthHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tQw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 8cQhMG0Vy4QM7SWnqdHXyhfQwR0BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxq3JoWQam2i
 8wxNSBgbAWbUix0eVIKS8gUnfbzj1n4WmgNwL6SjfVuuDWCpOBr65DvOtfIft2BRe1Og12V4
 GnB+gzRKwsGOdmo7CuK+3OhmMfChSr+HokVEdWQ7vd3hHWDy2pVDwcZPXOhqPmkjgilWtRQK
 2Qd4C9opq83nGShQ8PhRRS+rDiBtwQFRttLO+Qg7UeGza+8yzieAm8IXztQcusMvcU9RSEp/
 lKRltavDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZvFnHa2uh9v5AwbZx
 TyQsTM+jLUei80M/6ij9FWBiDWpzrDLUwo06wP/Tm+jqARja+aNQIil6kPS6/paG7qIVVmKv
 HUCmM+24fgHCNeGkynlaP4WALij6vKBMTvdqV1iBZ8s83Kq4XHLQGxLyGggfgEzaJ9CIGK3J
 h+I0e9M2HNNFCS4MJ4qZ5yYMskzl66jT9jUUaDxZOMbN/CdazS71C1pYEeR2UXkn04tjbwzN
 P+nTCq8MZoJIf85lWTrHo/xxZdun3ljnj2LGfgX2jz6ieL2WZKDdVsS3LJihMgd5bjMngja+
 s032yCim0QGC72WjsU6HOcuwbE2wZoTWcGeRy9/LLfrzu9a9IYJUKe5/F/ZU9Y595m5b8+Rl
 p1HZmdWyUDkmVrMIhiQZ3ZoZdvHBMgj9i1nZH19YA/2ixDPhLpDC49EL/MKkUQPrrQ/nZaYs
 dFZEyl/Phi/YmueoGlMBXUMhIdjaA6qlWqz09mNO1ACk2pbb1WRoLfMJ1K3nAFXV3bfnZZg/
 9WIi12KKbJeF1UKJJuHM5qHkgLu1UXxbcovBSMk1PEJJhW1mGWrQgSs5sIKzzYkckSen2bKi
 lrNXH/1Z4Dl+ucIzTUAvojdx6+BGOpiBEtKWW7d6Le9Ly7B+WS/h4RHVY61kfr1DgsYIY2uO
 rdYye/SKvoCkAoYuoZwCe8zn6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbmC
 FiS/tR6OKmSPJ+3GlAmOwd4PP+I0usZm2eO4K1tcln6/iJ+4JGOTV5WY0uXkCVYIbYsaNElz
 O4ttdQ48Qu6jhZ2YN+KgjoNrzaHL2AaUrVhvZYfWde5hg0uw1BEQJrdFi6pv83fN4QSahEne
 2bGirDDirJQwlv5X0AyTXWdj/BAgZkuuQxRyANQLVq+hdeY1OQ82wdc8GprQ10NnAlHye96J
 kNiK1ZxefeV5z5ticVOAzKsFgVGCEHL80D90QJUxmjQTk3uXW3RNmwtf+2K+RlBoW5bezFa+
 pCeyXrkDmm2LJ2ggHNqVB43seHnQPxw6hbGyZKuEMmyFpUnZSbo3/21bm0Sphq7Wc48iSUrf
 wWxEDqcvUEjCRMtng==
IronPort-HdrOrdr: A9a23:WX4+X6z6WE6jNfe72py+KrPxtOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.88,336,1635220800"; 
   d="scan'208";a="63222047"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lw5N+buo2mgJVfZM9GR8Ts+UuGK9Yn6N5nqmdJE1HOlAivZJ8n+uWEYVBYVaQ4LqYENPD9s/pAnyv2AoQHm8xf4N+s/O5pCUGwtfyQjOV62fUWFFecFQLHEthwUOh2cxQC7MTHpfe9PbVqGszOZHOxP2b8IvqxwIcTywPnymx/TG6oji2l/CvHcuBwMxF7hDghczvOeV+mfuxcywyzUDHZ3QgnVLa5eBc0zUNhlMW6AH+RQ31Uqkna5obwmkv27aaa3PCCWAJbyPv1F8vJa45Uq4M4WeA7HvTBLIIjfhdoIpyp7zrc0e7N1irV252Ng/22l8iyVTBK36WIBsVeTVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95PsvAmeP66izDrqOuCBE2Q9rk6iqZqhlUDjN1UpJ/I=;
 b=kxofX+uLlwRSG0c8Gpfr/k0NVH9UG9vTY0STotr+KJ1YIg2CRTaeZj3SlMZcasx1VDgsfeHaTdMXHiqt14Ft/sBXWgXonRBwMqTHx76PQlqL9lHX/H3u9Re4J5oxdPTtSPIS1/cscc+fHZHtQVRuQHab1wbB7p9yUP07wslK2SgIUTKQlyV8wK9lN1BDR2fthtn36A1Fz4SF6nrFUf8mFsw/auQ3KRMq2f/KU0fjD3Inqo3Wh8updrhYn083WSBXeL6Iv67JxEuOwPZTKcxNQgRQq/g5PkgXCdH0gq1GRqurrApYZp46kTdOaqIJg86TSQXeBaGlDXUfvo2DVrnrrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95PsvAmeP66izDrqOuCBE2Q9rk6iqZqhlUDjN1UpJ/I=;
 b=sLd7ZvkQ5UL8DYAmyEkK38Ni4NOAntLUre5OdgKVQyzCou/oPp03Jo6evoDKC8mS9xaeOhUQ+WH+uF6LE869GNVjUGiOGaE23XAE9Jv1RS0pF8CrbZmunSonbqcIT3GRBie/sbnJityxwodtEPWFSQdxuuRxgvTNXOLaSCPgqdM=
Date: Wed, 2 Feb 2022 11:34:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Message-ID: <YfpeT+VMWiklDWGf@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-9-andr2000@gmail.com> <Yd/9W7GFO51GE0ch@Air-de-Roger>
 <37c2374d-c0f7-23b6-d2f8-e94d1348807c@epam.com>
 <2282e7c5-ba1b-e2a2-af4a-84a894211870@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2282e7c5-ba1b-e2a2-af4a-84a894211870@epam.com>
X-ClientProxiedBy: LO3P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb340f5-6110-4732-15bb-08d9e637aa94
X-MS-TrafficTypeDiagnostic: SN6PR03MB4111:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB41113DCFF7448DF1810F5A318F279@SN6PR03MB4111.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 03L4jZRaFpkQkO9s2oRsBLdzhDs3cF4rkwXlUm3vR3g62lRbTHVJUqepHLGKcy5ncQmKALSrKhDZ4gMdLxPICj1wW0PwchGjPxy1olFMfmh0PTgNHQWkXbkJNYRJJmdH6j7yEHzkYO+8/kOC+PqQLTykRyx9ZIKXzX4EOhD6ecTZW8DzgOZzorrhhlVlTGGfQsLXQbYaVBKCv3TdJ2oDUR1W2/gRhGe4GljfeEid0v8Tc8UH6lnBOKU9rQ/Pp9O6r8nOX/x+buQhgx+BLRUkFkSAB3roc+zTkyfT767Wsimmo6PYBq4a1NA25dryUtt3sabIZS3yZQKpNTBT6j2X+c4QnqPdUCUaQjknd7Fq44MLutw1moklD6SUKMC5uk6fcl/phtHGkegoJoP2rxYbxZAKhdrSF2BBRtyCCRcfK9m3glG9MrA3YoYgHpA7zcwAFsu2guV0uXKXJLEVJF1/XuaL/YQlBodZA6MiCiFNiAlOsONG2a1uSFttmVXVUDT1YBM3QbYqix+K+rjNdG693Clhyhz9L5teS0O91RtI6RDEzRpEkuKaV+gEW4SNBg35ytAOExhfCi7yniutWnZs4ou0BKm+e8Hbxt1Fvs2JRqR51XYueS/kSlDueDzgjSX/bMgajaOptsRDHp0MMYZ9tlZRFFMZ8KNven9Fm20QIVO3c81JtkBe7fRn/ZQFOZjnaVXnFrMq4Xa8t8FPJCQA9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(54906003)(85182001)(6916009)(26005)(86362001)(5660300002)(8936002)(7416002)(2906002)(316002)(6666004)(38100700002)(66946007)(66556008)(6506007)(33716001)(9686003)(82960400001)(6486002)(8676002)(66476007)(4326008)(6512007)(508600001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTd2SzViTlNJTWlkRFlLejNoNTg0WEJyclh3Tkw3MnlHRm14UTBRQXdnb016?=
 =?utf-8?B?Tm81V2o5blFUMitqcTV4aUdHL2RESXNtRDFEVDZ3MnJQSTdnNVVPOWpWeFBr?=
 =?utf-8?B?ekZ5bXJMTjVvVjFsNHF4VXNLaEJjdzVmNi9lTFBwV0ZQWGtjYWlCbmtvcVEr?=
 =?utf-8?B?TU9OakpKUkp5cm42ZFoxakw3d3JuRDdkMWt2K3podzdZUFJlYjVoK094T2l1?=
 =?utf-8?B?L3dOWjlPSXdpRFBIbzZYQVZMKzdhN1dFcVp1OUVQY0RHSW1pb0p0enJPMFpZ?=
 =?utf-8?B?d1p4NHIxdWN0eXRqZisrclV4VDQyV2dwRVRqUm1aV1owY2VwS1B4NGRJbFRr?=
 =?utf-8?B?NFcwWmZXbFlLQk9ISlZWMERYLzBYUlNlaVFkTWlPK3hCQmU5TzFvQkxiZ3V1?=
 =?utf-8?B?K250bzdqMkNjQkhBTVBQNko0UW5neVo1V095S1E3aUhrTW4zaS9wS2pYZngz?=
 =?utf-8?B?aW9Uei9uV2hjR25GT1ZsTzBEL0d5bGI2aW8vOVJ6d1lKNFY0S2dYSnROcXBi?=
 =?utf-8?B?dkV4Y1pyR0R5Nk1sYkVBYldQZXpuT0lRZ0RtMW9OT0ZHZEp1MGlvVXlJRVRn?=
 =?utf-8?B?SE1XKzhQM29FUjJPL1NETVRhSGxMTW81T0FMWUxoVHFzOWpmR1hSWjBPNUZu?=
 =?utf-8?B?emh6TlJ0YTNDYkJrdHFQWWMvVzE4MHNQTTJXc3hVOWhRaTZJK2ZNSS9tWHEr?=
 =?utf-8?B?L0RPN01pNFB0QytzckZUZm1TWVROVjVGRFMrRHZPWUdSOWVCYTZjWmlrR2ho?=
 =?utf-8?B?eUttdGlySGhFdEY2VjZTeFpVQSs1S09nQmlBaGRIWU9wM0hPbEZySHphZ3Bj?=
 =?utf-8?B?SnpqUEZYejNLbjFIRkVCODgxb1l0N2c0MllMazltR0JFRktmK3h4Q01iSXdn?=
 =?utf-8?B?QVJRTDh4dlJhSzVCZDJpRkFsdWJ0K0VrbktUZG8waDY3blVvLzEvbUt3cW1h?=
 =?utf-8?B?RE1yWHZlRGErWlZHdmplaDRRakNJUjNhbWNORUdrQ0NGRng3ckpEQlE2b25D?=
 =?utf-8?B?ZnVleVhKQlMraUIxaW9DblVvaFhLa1BlV2EvU2QrSXFWNEZxZ2Vrdm1Wai9L?=
 =?utf-8?B?RmNLM3EzV09OMXcyenZDMXR4TStvcG8xcFdnM0JxcDJPWHgrS0pYbitWVmF1?=
 =?utf-8?B?eUl0WU91QWpISkRGMkxGVEhxblplOXhCamJsWHRvYzNCUHJUZGlJakNpT2J4?=
 =?utf-8?B?WkZxYkNmT05TMlFYOUVwR2FFUHpjQStUemM5aXY0SlNzd0R0L0xPOXlhSTZs?=
 =?utf-8?B?OStLQUxNZE5aQm81LzY3TGNSMXFiQktHWnpwTmIzZ2YyL0RiVlR6a2g1ditF?=
 =?utf-8?B?WWtjTnQrTVRndlNvaXpFenlRYU80eEdPT2JISW9rUE1KemNodklPVlNJWi9I?=
 =?utf-8?B?c29wQ2I1Rjd4Y1VvcWhLQ21NZkRybXQ3eExvWURidjE1NlM4eG94eXNVRERM?=
 =?utf-8?B?MFdxM1lOZkxiS2dEd2R0eCt6NGZpODBoaFVIVXBTaSt2UytDWG5Cckx1c1Nx?=
 =?utf-8?B?bXhpdUw3WDlKK0NxejBXRXNqVDlJcGFzT0ltSm5nZTF3eGtjV3IzQW9oTFNt?=
 =?utf-8?B?MVZqY2EwZWhjQkVWSTB6STh1VGdaS2VvdU9WSmNrNkJFRmcvem5VMnVHUzM4?=
 =?utf-8?B?c1pCbGthOUxSMlpvczlqQUJISWI5YURHUFY5VVkrSGFDejk1NGtQbmM4VTc3?=
 =?utf-8?B?eGJRamtjK3lDUXkyOHJZS2Z1TkFiRGRJTGpYQ29kU2JnaGNRSVE1bVFrcUxF?=
 =?utf-8?B?NmxzNksrUW4zS2trS3p0TGcrQ3k1djQxbmZqZ0NscStUYktBTjh1ck9jREFv?=
 =?utf-8?B?Q1dLWlJHQnYyYUp4eWUyQ3VybVh2Y3dNTXo0ekZSbEErNlk2eGNIbCtraXg2?=
 =?utf-8?B?aE1pWTR5Ukl4VHhKVUtVVUpLN2l2aTJ6VXdkZ05hNzRaZXhqb2JHOFFuWFN1?=
 =?utf-8?B?Y2Zza09oUFY1c1gzbTdaMS9rWFRuL2FpbzhFTFBycXFPdTNBSkQ2a3BIRlpR?=
 =?utf-8?B?TE1nVlYwaFRLOUhIYWdYZkUvL1Vvekc2QnJqUnBpNE03MGJDSlpPYlcrYjlJ?=
 =?utf-8?B?MjgxV09IS05aemFBVkpRckJjOExSWTZEbjJsazlxZ3NKWW5QaWZhMDR5Z0Yv?=
 =?utf-8?B?cDA0dVJseDVNRTFGVlo2UzNkRFZadFhnZ3d3cHhkRFRVdjA4UHRVZ2pxZ0Jr?=
 =?utf-8?Q?dZHDRJcVD+EwaKuAdGGSRIQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb340f5-6110-4732-15bb-08d9e637aa94
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 10:35:01.1087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zddPJGIvOnICywMS1Ycg0b8QM6M3u0V9ougncLQclUgZhYUdd78tG8hXkdGv6BFajO+yXa8Na5QrA3T2Nk+g2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4111
X-OriginatorOrg: citrix.com

On Wed, Feb 02, 2022 at 09:46:21AM +0000, Oleksandr Andrushchenko wrote:
> 
> >>> +        gdprintk(XENLOG_G_DEBUG,
> >>> +                 "%smap [%lx, %lx] -> %#"PRI_gfn" for %pd\n",
> >>> +                 map->map ? "" : "un", s, e, gfn_x(start_gfn),
> >>> +                 map->d);
> >> That's too chatty IMO, I could be fine with printing something along
> >> this lines from modify_bars, but not here because that function can be
> >> preempted and called multiple times.
> > Ok, will move to modify_bars as these prints are really helpful for debug
> I tried to implement the same, but now in init_bars:
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 667c04cee3ae..92407e617609 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -57,10 +57,6 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>            */
>           start_gfn = gfn_add(start_gfn, s - mfn_x(start_mfn));
> 
> -        gdprintk(XENLOG_G_DEBUG,
> -                 "%smap [%lx, %lx] -> %#"PRI_gfn" for %pd\n",
> -                 map->map ? "" : "un", s, e, gfn_x(start_gfn),
> -                 map->d);
>           /*
>            * ARM TODOs:
>            * - On ARM whether the memory is prefetchable or not should be passed
> @@ -258,6 +254,28 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>       raise_softirq(SCHEDULE_SOFTIRQ);
>   }
> 
> +static int print_range(unsigned long s, unsigned long e, void *data)
> +{
> +    const struct map_data *map = data;
> +
> +    for ( ; ; )
> +    {
> +        gfn_t start_gfn = _gfn(PFN_DOWN(is_hardware_domain(map->d)
> +                                        ? map->bar->addr
> +                                        : map->bar->guest_reg));
> +        mfn_t start_mfn = _mfn(PFN_DOWN(map->bar->addr));
> +
> +        start_gfn = gfn_add(start_gfn, s - mfn_x(start_mfn));
> +
> +        gdprintk(XENLOG_G_DEBUG,
> +                 "%smap [%lx, %lx] -> %#"PRI_gfn" for %pd\n",
> +                 map->map ? "" : "un", s, e, gfn_x(start_gfn),
> +                 map->d);
> +    }

This is an infinite loop AFAICT. Why do you need the for for?

> +
> +    return 0;
> +}
> +
>   static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>   {
>       struct vpci_header *header = &pdev->vpci->header;
> @@ -423,7 +441,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       if ( !map_pending )
>           pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>       else
> +    {
> +        struct map_data data = {
> +            .d = pdev->domain,
> +            .map = cmd & PCI_COMMAND_MEMORY,
> +        };
> +
> +        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +        {
> +            const struct vpci_bar *bar = &header->bars[i];
> +
> +            if ( rangeset_is_empty(bar->mem) )
> +                continue;
> +
> +            data.bar = bar;
> +            rc = rangeset_report_ranges(bar->mem, 0, ~0ul, print_range, &data);

Since this is per-BAR we should also print that information and the
SBDF of the device, ie:

%pd SBDF: (ROM)BAR%u %map [%lx, %lx] -> ...

> +        }
> +
>           defer_map(dev->domain, dev, cmd, rom_only);
> +    }
> 
>       return 0;
> 
> 
> To me, to implement a single DEBUG print, it is a bit an overkill.
> I do understand your concerns that "that function can be
> preempted and called multiple times", but taking look at the code
> above I think we can accept that for DEBUG builds.

It might be better if you print the per BAR positions at the top of
modify_bars, where each BAR is added to the rangeset? Or do you care
about reporting the holes also?

Thanks, Roger.

