Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F344D43DE52
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 11:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217775.377952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2CF-0000wK-P8; Thu, 28 Oct 2021 09:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217775.377952; Thu, 28 Oct 2021 09:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2CF-0000uG-Kw; Thu, 28 Oct 2021 09:59:43 +0000
Received: by outflank-mailman (input) for mailman id 217775;
 Thu, 28 Oct 2021 09:59:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Bw3=PQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mg2CE-0000tf-DU
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 09:59:42 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c417c0ae-37d5-11ec-849b-12813bfff9fa;
 Thu, 28 Oct 2021 09:59:40 +0000 (UTC)
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
X-Inumbo-ID: c417c0ae-37d5-11ec-849b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635415180;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Oakwnb+RPivWdNAOZIgYSBn91hjpiphbOOddHwVVxoo=;
  b=envJ9MZH3njPIjZn9wA/WlMDzpNU6SJyRt4S+Fusw83nLnp+KyikrKXM
   3LML3FBYU3CdQ+OE+CMrL7/iG3s3r4j6iwFqVoN/wmPX0i6W59arDykR9
   BRYXbqf4bNzjbjpg6P9GT/qyNWrykI52yNV2cNFWiLG0FCgUzi6jOx+D7
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2hZx6HcgrQQ2VYb/0jIODLzmNxKZ/n9FlrEmbLzrJ7oNbUvO0j42H+DaYZajC50OF2dln9fgcS
 tiYgTREcg06IQmeVlfmoxamtVPo1eWWeQvK1kl+9D2sTlq6wfbLnq8Aj/IXIWXLJel4pAVRNH/
 Dums//5TgfaSaFGSCoax8zHLuDO1sk7FEOMNdwjV5W+ND0Gk5Y/Byrm3AGwmHFgl6hVIj8n8/Y
 YyA6HAxH6lrzYnxJNVD27w3YPe89AxHLaZ1sri+ItqAISSs91Obs8sao6MGB33zOpDZFKtjtiL
 /EkKsmHbXfxW/F+0pw72CHQs
X-SBRS: 5.1
X-MesageID: 56533758
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:H45Jr6p9LN54EIrVWcVh7LbtrGVeBmJEYxIvgKrLsJaIsI4StFCzt
 garIBmPP/ncMGanftF0PIu3px8DuZSGm4UxHlQ4qS48FyIS+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2YLpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZqPdS4IILHOo/QifhBKEwxfO/152KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0QQK2FO
 JdJAdZpRCzeb0VOA3A0NLw3t9z3oynvVzRVi3vA8MLb5ECMlVcsgdABKuH9dtWUSO1Pk02fp
 2aA+H72ajkYO8aY0iGt6W+3i6nEmiaTcIMNFpWo+/hymlqRy2cPThoMWjOTn/69jUKvXsNFH
 GYd8CEusKsa+VSiS5/2WBjQiGWfohcWVt5UEus7wAKA0KzZ50CeHGdsZiFFQMwrsokxXzNC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt4cTnoYw1pgLCSJBkCqHdpt//FCz0w
 juKhDMjnLhVhskOv5hX5nie3Wjq/MKQCFdouEOHBQpJ8z+VeqajWLCByEbH781QE6uQXFmsn
 X5UpOiBubVm4Y62qASBR+AEHbeM7vmDMSHBjVMHI6TN5whB6Fb4ItgOuGAWyFNBd59eI2ewM
 RC7VRZ5vccLZBOXgblLj5Vd4ijA5ZPrEsj5TbjqZ95Kb4kZmOSvrXw2OxD4M4wAliERfUAD1
 XWzLZnE4ZUyU/0PIN+KqwE1iuZDKscWnjq7eHwD5077uYdynVbMIVv/DHOAb/oi8ISPqxjP/
 tBUOqOikksEDbagOnOMr99DcTjmyETX47it8qS7kcbYe2Jb9JwJUaeNkdvNhaQ8x8y5adskD
 lniAxQFmTITdFXMKBmQa2ALVV8cdc0XkJ7PBgR1ZQzA8yF6Oe6Htf5DH7NqLehP3LEylpZcE
 qhaE/hs99wSE1wrDRxGNsKjxGGjHTz27T+z092NO2liIcQ4HVWVqrcJvGLHrUEzM8Z+juNny
 5WI3QLHW5sTAQNkCcfdcvW0yF2t+3ManYpPs4Hge7G/oW3gr9pnLTLflPgyL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXiSNwarB7psL2Oox85KsqERlLZVtRHvA
 hCE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6pePVX19TMh+AjD1mAIF0aI51k
 /08vMM26hCkjkZ4ONixkS0JpX+HKWYNUvt7u8hCUpPrkAci1npLfYfYVn3t+JiKZthBbhsqL
 zuTiPaQjrhQ3BOfIX86FHyL1utBn5Ue/htNyQZadViOn9PEgN4x3QFQrmtrHlgEkE0f3rIhI
 HVvOm10Ob6KrmVhi8V0VmyxHx1MWU+C8UvrxlpVzGDUQiFEjIAWwLHR7QpVwH0kzg==
IronPort-HdrOrdr: A9a23:xkVtcKCyzU78SrblHehCsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MAnhHP9OkPIs1NKZMjUO11HYSr2KgbGSoQEIeBeOidK1t5
 0QCpSWYeeYZTMR7beYkXeF+r4bsaW6GcuT9IDjJhlWPGRXg/YK1XYFNu/XKDw/eCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njFsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLlfFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhCV2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtugPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4ckWUmxjIVLH48JlO71Gh+e9
 MeT/00pcwmPG9yVkqp8FWGm7eXLzYO9hTveDl3hiXa6UkSoJlD9Tpp+CUopAZ0yHsMceg02w
 36CNUaqFg3dL5vUUtcPpZ2fSLlMB2FffrzWFjiU2gPUpt3f07wlw==
X-IronPort-AV: E=Sophos;i="5.87,189,1631592000"; 
   d="scan'208";a="56533758"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nz2ypRxzM9/7Q8pWQ8LPzDXDRpRLR936OQxNeG4ENOUwt421u9g2Xxbz2SG1t6MpYeF7qWr1PYgKxLK/tLXkW3bT5Zihx9aijioCm3lwVVfMWXNzoyUY2JanThnW/WNHqND4g8mzoWd8P8pVyrNvYGgZzZK5C242Uw7OUOO/EzqNhJ1LYmp0w97onhLTqg9W5kRfEB+Hntli+GhPkVenXHAzN8myPNUUhFP1+XI2d0wlqh8U2JDlH96ssZh7YJqcnCf8C0PFM06xCDYQUKvLPz6K6uGP1gUiya0op6Hhn+Mjxr+7/vdcsAnPKQVJYGMrc4+gybGHQP5wHH6pm6oe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/YcNgYIYDZGbkmto+fXyzD3LJW/4JR+QhvZmPSgIso=;
 b=dUKoxFdZYD1R+dfdayIJbakKv7q1OuNZ2QXAIb4fzbybKV/RPswKks8yE+2AWGZ3P45hMAWjQkD90PJr3uO0Bj9qefSgczM2ZKDQX2ed0w+HSvZIXhqJ6xGTQEo8cbEhBQvl/sLDAherkK93nFwInvvnSNmQK/AtF3eFxv0AA+ID5Zcy6Bv8a1pAF8EJgKBkHW0bqIbfXhZ2D13lMx0qBXyoCvoMJaeUX6ipJ3T22tM4EG0Z9IjUISaN59Q97XztyjHD7QORA58Vbyp87VDu+j5jAK9uOER1Cuu2ITZFnQlwQdp9adornzBZkQVp0CwFsFb5N15yT3M6Zcl+24fcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/YcNgYIYDZGbkmto+fXyzD3LJW/4JR+QhvZmPSgIso=;
 b=GvqivnPn7cUCI6M+0FHkfGIZRHAemCyfaWyePYsrCwzurD2DQNCjiwdOfCP3QmQueSonmIHrI8T0Wk48X36aLNzJhxbV3ATH2egocU/4aIqMzt9j8lBqYNakPuBj537MIPpL/fAtbEhlH82itC32g5adiNK48pY7nAmYyVWneBI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16 v3] gnttab: allow setting max version per-domain
Date: Thu, 28 Oct 2021 11:59:23 +0200
Message-ID: <20211028095923.83982-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edbfdef5-9da1-41d8-aaf2-08d999f9a302
X-MS-TrafficTypeDiagnostic: DM5PR03MB3289:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3289806746CB7F07FAFD12AB8F869@DM5PR03MB3289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EK6ZOYrCts/r2w83TI+eyt5hDvrm4zJxsrJgkK+diZKIgM700tdn1GQhqKFZizjSPWjmpDgf8wNvFRywuViN0H6hqDntfKE8Aq2+GlA8IKzIt+k2Suu88kciYtmoVxM33uvNvFHjAhoycFZ2iCTxlbB5x1JoiVZqHlmVTytBM9SL7MCh4RdCMX3v3/M+zulKcQ9+K9gZkO5FRazcb88UZyNPsaP0mzjpWs+Ym+uJBmdTIvm1vFMe7Fxhqb4al2eQ8c0Xu6vFScyuh11VJ9UTDQYUcB1g2vZY1MOtJ+bEORHPciSqd0ukzYTLMQSzEy6caR5lEnbBHRXgBpStcaSPgqPHoyXC47Z3Y8UJf4XVNunImL7TnMbICRGHe2VFc6wEruOHK39DSnsgIW7amfbeKAk4WMB+g0QA+RnZ3oBuHrdQz7Vv6tKDZA8qn0u3BSFEJskX1hE2THmyoqwWRdj4XoMgaEoMpPDVQ4HWi1I//G6ajC31tDoGMYBXAzY1BZuXvlsFPeZjAzwD9DiCsVKIqzVFsMwOpZXguQE44QZRbhFaCzgX5S2JOLW8vqfj8zW8/R0GkCPS+xarZY7kdeWJJOfQe2sDrAzGdCISCmSfwFGrPtc+DlrVOtAentbkzizBqrVOuvdGRdwdmdXCbbgeHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6496006)(86362001)(4326008)(6486002)(956004)(8936002)(26005)(186003)(508600001)(36756003)(6666004)(83380400001)(5660300002)(66476007)(316002)(6916009)(66556008)(30864003)(38100700002)(2906002)(2616005)(54906003)(1076003)(66946007)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnJ4bzY1cE1uK0Y4eVRuM0xjd3JuNm1uZy94Mk1Yb255TE15cDRwUWUxbjZZ?=
 =?utf-8?B?QS9IckhCdFFXQnVrQWFqYUM3Y3RuSUNuSE1Id3g0bG0rS1Fsd3NROWpIWFU4?=
 =?utf-8?B?RkhNWElmSXBXcno2dFlCZjhSY25HdmpRWEUxZDJEdmQ2R2dVQ3VQTnJvNkVs?=
 =?utf-8?B?SHFxMnZtcHp1MmQ0S1NiaDUxKzNnNlVCakxjbU5KaU00NEhia1RPMmttQ0t1?=
 =?utf-8?B?cllvMnJ3M2R3Y1RrekN1SUg0MWJZTWl5cnRMUG5OSWxxOFZuSmUyWTVQeFdN?=
 =?utf-8?B?aFJZZ0tiL21JSUtxSWhtcU84em9DRnJIeWZrUUE4Ny9YNUF4bHNqT0dhS01I?=
 =?utf-8?B?VmtCajRtVERHekNmVXNNTm92c0JRV3l0YUE3cTd4VjdmZVBrcG9HUlRuS2Z4?=
 =?utf-8?B?WjdNbnQrV3F3cUxiYXB0Nis3NGdJZmdlamlnRXA3NlRCTHF4MnUveFhwL0tW?=
 =?utf-8?B?VDYzRlUzVGZZd2tkdFdPejJIZkVwckNtbDFSM0E5RzZGWVYweUlYMGFxTjNs?=
 =?utf-8?B?RmNtSmRhc2pnRXRVMUtkSVlta3ZTbER0Yk54bFI1amVnejVvazhjZWFYVGxv?=
 =?utf-8?B?citrK2kwRmU5dXB5RlYvTmhPdStFK0tQVjZPWDQ2REZSdnNuWk5sc2ovYWJl?=
 =?utf-8?B?MnI3RHVnK1J0NEl1emhZakpWMFEwVW90aDNreWhoTE1jaGtzZElEeWtkL3Rt?=
 =?utf-8?B?Y0cyY1QzbGs2TUlKRXFnSlNyS2NIaVlxU3lUSFBIakxxeFVlNmZjOW1xeUVz?=
 =?utf-8?B?UlVSaHBsZDVqcHh4Qi8rV29qTFF6Ymg5TEhCWjU3Q3I2K2xQWmlTekZuUlJI?=
 =?utf-8?B?aHg0YnlpV3JWVE9Uc0hXbnJ6VnlBTFZQYXVYd1F5R1Z6RXh6cWdvYUQ3WlJh?=
 =?utf-8?B?NFBSZGwyNnBOZ3FMa0N4SXFJTXI5dUlDVzhHVkVYVTdka0MvbVdTWU1ER2V2?=
 =?utf-8?B?T3lkSGJyU2FuWmxpMjRyU3VWYWFhSFF6c2JxdjJPRThnS09QVXEreXk4VGdL?=
 =?utf-8?B?dE5WRy9sdUdNRFBobEFNdmtvNU5UWE0xR3B3WXJpN2M0YWNCNFZFZUZwN1R0?=
 =?utf-8?B?aDhNdzl2bkdIVDhvT2NNeU44MWovTlRtUHNkNDlwS1VzSnQvZ0R4RzlHeklt?=
 =?utf-8?B?bTNjZmJHZ3Vqc1pWejVucnNDMm9rNW9WZnFEdnVkM2dtcXh5TVc4Q1o1Rmd3?=
 =?utf-8?B?S2F6RWFNSjhpZEZTT0xqc1lOOW04TkQ4cWJsZTBZUHExZ1U2UDBBRVY2c3cv?=
 =?utf-8?B?bnRlRm9JWklBNGhrYzcvUmdjZk54TTVFU0xZRFZsc1FFR2FQZU51eUZBQjlw?=
 =?utf-8?B?YVZDWU9yckFDR0UxY0F3cG1tcmlWY0EwV2dDMk5wNkFYMzFwcFJyT2FuNHh4?=
 =?utf-8?B?VjhNcCtaVlJoeEV2QXRYRG1ENkthR29IUUlWUjBpamx2cVdKTG96VHJ1N3NN?=
 =?utf-8?B?aGg4QUliYVNqL1Q2VWhja29tNVQwVGkwRi9FQVpmcVNRQU4wYzBBdmVvRWlV?=
 =?utf-8?B?aTlTSHgzc2FhTEZUWHQ1Q1NZdm5XNlVTdHB2WGZHQzVQQXNrU0ZTU3hIelB5?=
 =?utf-8?B?ZjJ2b1RWN2RBUFE3R0dZeWtCTkV0SWJGUEVIcTlNTmhTTUNOTGhQNjBRY1Zr?=
 =?utf-8?B?QTlRbFhYK2JWODFQMVREV3RJb3dVMkFibVFWbmtwUUZBNlRBdHBraXkyZFJN?=
 =?utf-8?B?cFNYTnF4Qytxd2hoeGdBVXlrVVY3N3RFOS84bnZPQXV2SEpvOVI0QWpPdm13?=
 =?utf-8?B?Q0tteWM3RXRMZDVucnRiMGRnOWRKZTYyNTBxNnFkaFkxR3hzc0ozRHFvVXcv?=
 =?utf-8?B?ZmVzTVZZeklXUEsyWk01eC9sdUdRQmljL1h5YW91cC9CYkd0aENWeElwUDEx?=
 =?utf-8?B?VWJGTEtOc1lYSGNGeFpIU2RqeTVQa0Y5NVdONm9SM2Rnc2JoeTB2OFNBaFU4?=
 =?utf-8?B?T3NmVytmOU9VMjBHd2k2a3BTK2NzM1RFWkUxT0t5RHBLZy8xRVpIYW01WTdt?=
 =?utf-8?B?ZUwwTWY3UHpBQk1mYm1NRlRsNGZMQlNMS0UzbC9qS0JDOXE3cmcwYzAyMWNJ?=
 =?utf-8?B?TTJLdEo3cVRXNkdiVTF5d0lUQUNrR2ZUamRCY1kzYXZmdUI0Z2FlUXk3bm1y?=
 =?utf-8?B?cjYveURzWk1Ya0ZMU2lwWnE1d3Jjc2hFWG1zMTA3OHFQWGNCWjI0bno1cWlZ?=
 =?utf-8?Q?AydwpQLPhtq0SHxMJ2lVo1E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edbfdef5-9da1-41d8-aaf2-08d999f9a302
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 09:59:31.2314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikUiJFxGufZjPBC3rJ9A/+l/Rv8L3U0yZzZowLbladrp20h8Yb4TcmwDgB+AV5YyZ2Vjt+RDJUf91SCy1IbD5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3289
X-OriginatorOrg: citrix.com

Introduce a new domain create field so that toolstack can specify the
maximum grant table version usable by the domain. This is plumbed into
xl and settable by the user as max_grant_version.

Previously this was only settable on a per host basis using the
gnttab command line option.

Note the version is specified using 4 bits, which leaves room to
specify up to grant table version 14 (15 is used to signal default max
version). Given that we only have 2 grant table versions right now,
and a new version is unlikely in the near future using 4 bits seems
more than enough.

Note that when using the default grant version the specific max
version in use by the domain is not migrated. Any guests should be
able to cope with the max grant version changing across migrations,
and if a specific guest relies on a maximum grant version being
unconditionally available it should be specified on the configuration
file.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
NB: the stubdom max grant version is cloned from the domain one. Not
sure whether long term we might want to use different options for the
stubdom and the domain. In any case the attack surface will always be
max(stubdom, domain), so maybe it's just pointless to allow more fine
grained settings.
---
Changes since v2:
 - Drop XEN_DOMCTLGRANT_MAX - it's unused.
 - Rename max_grant_version field to max_version in the grant table
   struct.
 - Print domain on log messages.
 - Print a message if host has more than 16Tb of RAM and grant v2 is
   disabled.
 - Add a TB macro.

Changes since v1:
 - Introduce a grant_opts field and use the low 4 bits to specify the
   version. Remaining bits will be used for other purposes.
---
Cc: Ian Jackson <iwj@xenproject.org>
---
Posting this patch alone as I think allowing to control transient
grants on a per-domain basis will require a bit more of work.

Release rationale:

We have had a bunch of security issues involving grant table v2 (382,
379, 268, 255) which could have been avoided by limiting the grant
table version available to guests. This can be currently done using a
global host parameter, but it's certainly more helpful to be able to
do it on a per domain basis from the toolstack.

Changes to the hypervisor by this patch are fairly minimal, as there
are already checks for the max grant table version allowed, so the
main change there is moving the max grant table version limit inside
the domain struct and plumbing it through the toolstrack.

I think the risk here is quite low for libxl/xl, because it's
extensively tested by osstest, so the main risk would be breaking the
Ocaml stubs, which could go unnoticed as those are not actually tested
by osstest.
---
 docs/man/xl.cfg.5.pod.in             |  6 ++++++
 docs/man/xl.conf.5.pod.in            |  7 +++++++
 tools/helpers/init-xenstore-domain.c |  1 +
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_create.c      |  3 +++
 tools/libs/light/libxl_dm.c          |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  7 ++++++-
 tools/xl/xl.c                        |  8 ++++++++
 tools/xl/xl.h                        |  1 +
 tools/xl/xl_parse.c                  |  9 +++++++++
 xen/arch/arm/domain_build.c          |  2 ++
 xen/arch/x86/setup.c                 |  1 +
 xen/common/domain.c                  |  3 ++-
 xen/common/grant_table.c             | 28 ++++++++++++++++++++++++++--
 xen/include/public/domctl.h          | 10 ++++++++--
 xen/include/xen/config.h             |  1 +
 xen/include/xen/grant_table.h        |  5 +++--
 20 files changed, 95 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 55c4881205..21a39adb70 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -580,6 +580,12 @@ to have. This value controls how many pages of foreign domains can be accessed
 via the grant mechanism by this domain. The default value is settable via
 L<xl.conf(5)>.
 
+=item B<max_grant_version=NUMBER>
+
+Specify the maximum grant table version the domain is allowed to use. Current
+supported versions are 1 and 2. The default value is settable via
+L<xl.conf(5)>.
+
 =item B<nomigrate=BOOLEAN>
 
 Disable migration of this domain.  This enables certain other features
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index b48e99131a..0a70698a7c 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -101,6 +101,13 @@ Sets the default value for the C<max_maptrack_frames> domain config value.
 Default: value of Xen command line B<gnttab_max_maptrack_frames>
 parameter (or its default value if unspecified).
 
+=item B<max_grant_version=NUMBER>
+
+Sets the default value for the C<max_grant_version> domain config value.
+
+Default: value of Xen command line B<gnttab> parameter (or its default value if
+unspecified).
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 6836002f0b..7cd1aa8f7c 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -88,6 +88,7 @@ static int build(xc_interface *xch)
          */
         .max_grant_frames = 4,
         .max_maptrack_frames = 128,
+        .grant_opts = 1,
     };
 
     xs_fd = open("/dev/xen/xenbus_backend", O_RDWR);
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2e8679dbcb..8621161845 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -514,6 +514,13 @@
  */
 #define LIBXL_HAVE_VPMU 1
 
+/*
+ * LIBXL_HAVE_MAX_GRANT_VERSION indicates libxl_domain_build_info has a
+ * max_grant_version field for setting the max grant table version per
+ * domain.
+ */
+#define LIBXL_HAVE_MAX_GRANT_VERSION 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 5a61d01722..431c569dd2 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -607,6 +607,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .grant_opts = b_info->max_grant_version == -1
+                          ? XEN_DOMCTL_GRANT_version_default
+                          : b_info->max_grant_version,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
         };
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9d93056b5c..9a8ddbe188 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2320,6 +2320,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     dm_config->b_info.max_grant_frames = guest_config->b_info.max_grant_frames;
     dm_config->b_info.max_maptrack_frames = guest_config->b_info.max_maptrack_frames;
+    dm_config->b_info.max_grant_version = guest_config->b_info.max_grant_version;
 
     dm_config->b_info.u.pv.features = "";
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 608d55a456..ce856febe5 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -519,6 +519,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("max_grant_frames",    uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_maptrack_frames", uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
+    ("max_grant_version",   integer, {'init_val': '-1'}),
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index addcf4cc59..d3eacfba6e 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -84,6 +84,7 @@ type domctl_create_config =
 	max_evtchn_port: int;
 	max_grant_frames: int;
 	max_maptrack_frames: int;
+	max_grant_version: int;
 	arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 0a5ce529e9..96e5d14643 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -76,6 +76,7 @@ type domctl_create_config = {
   max_evtchn_port: int;
   max_grant_frames: int;
   max_maptrack_frames: int;
+  max_grant_version: int;
   arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index ad953d36bd..1e60925069 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -188,7 +188,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_MAX_EVTCHN_PORT     Field(config, 5)
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
-#define VAL_ARCH                Field(config, 8)
+#define VAL_MAX_GRANT_VERSION   Field(config, 8)
+#define VAL_ARCH                Field(config, 9)
 
 	uint32_t domid = Int_val(wanted_domid);
 	int result;
@@ -198,6 +199,9 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
+		.grant_opts = Int_val(VAL_MAX_GRANT_VERSION) == -1
+			      ? XEN_DOMCTL_GRANT_version_default
+			      : Int_val(VAL_MAX_GRANT_VERSION),
 	};
 
 	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
@@ -251,6 +255,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	}
 
 #undef VAL_ARCH
+#undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
 #undef VAL_MAX_EVTCHN_PORT
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index f422f9fed5..7564ff323b 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -55,6 +55,7 @@ bool progress_use_cr = 0;
 bool timestamps = 0;
 int max_grant_frames = -1;
 int max_maptrack_frames = -1;
+int max_grant_version = -1;
 libxl_domid domid_policy = INVALID_DOMID;
 
 xentoollog_level minmsglevel = minmsglevel_default;
@@ -219,6 +220,13 @@ static void parse_global_config(const char *configfile,
     else if (e != ESRCH)
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (!e)
+        max_grant_version = l;
+    else if (e != ESRCH)
+        exit(1);
+
     libxl_cpu_bitmap_alloc(ctx, &global_vm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_hvm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_pv_affinity_mask, 0);
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7e23f30192..cf12c79a9b 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -282,6 +282,7 @@ extern char *default_colo_proxy_script;
 extern char *blkdev_start;
 extern int max_grant_frames;
 extern int max_maptrack_frames;
+extern int max_grant_version;
 extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index c503b9be00..117fcdcb2b 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1431,6 +1431,15 @@ void parse_config_data(const char *config_source,
     else
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (e == ESRCH) /* not specified */
+        b_info->max_grant_version = max_grant_version;
+    else if (!e)
+        b_info->max_grant_version = l;
+    else
+        exit(1);
+
     libxl_defbool_set(&b_info->claim_mode, claim_mode);
 
     if (xlu_cfg_get_string (config, "on_poweroff", &buf, 0))
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0167731ab0..faeb3eba76 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2967,6 +2967,7 @@ void __init create_domUs(void)
             .max_evtchn_port = -1,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
+            .grant_opts = XEN_DOMCTL_GRANT_version_default,
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
@@ -3074,6 +3075,7 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version_default,
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b101565f14..b5b6c75447 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -750,6 +750,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version_default,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8b53c49d1e..0c7052c770 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -678,7 +678,8 @@ struct domain *domain_create(domid_t domid,
         init_status |= INIT_evtchn;
 
         if ( (err = grant_table_init(d, config->max_grant_frames,
-                                     config->max_maptrack_frames)) != 0 )
+                                     config->max_maptrack_frames,
+                                     config->grant_opts)) != 0 )
             goto fail;
         init_status |= INIT_gnttab;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index e510395d08..f94f0f272c 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -53,6 +53,7 @@ struct grant_table {
     percpu_rwlock_t       lock;
     /* Lock protecting the maptrack limit */
     spinlock_t            maptrack_lock;
+    unsigned int          max_version;
     /*
      * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
      * values are invalid.
@@ -1917,11 +1918,33 @@ active_alloc_failed:
 }
 
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames)
+                     int max_maptrack_frames, unsigned int options)
 {
     struct grant_table *gt;
+    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
     int ret = -ENOMEM;
 
+    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
+        max_grant_version = opt_gnttab_max_version;
+    if ( !max_grant_version )
+    {
+        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
+                d);
+        return -EINVAL;
+    }
+    if ( max_grant_version > opt_gnttab_max_version )
+    {
+        dprintk(XENLOG_INFO,
+                "%pd: requested grant version (%u) greater than supported (%u)\n",
+                d, max_grant_version, opt_gnttab_max_version);
+        return -EINVAL;
+    }
+    if ( unlikely(max_page >= PFN_DOWN(TB(16))) && is_pv_domain(d) &&
+         max_grant_version < 2 )
+        dprintk(XENLOG_INFO,
+                "%pd: host memory above 16Tb and grant table v2 disabled\n",
+                d);
+
     /* Default to maximum value if no value was specified */
     if ( max_grant_frames < 0 )
         max_grant_frames = opt_max_grant_frames;
@@ -1947,6 +1970,7 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     gt->gt_version = 1;
     gt->max_grant_frames = max_grant_frames;
     gt->max_maptrack_frames = max_maptrack_frames;
+    gt->max_version = max_grant_version;
 
     /* Install the structure early to simplify the error path. */
     gt->domain = d;
@@ -3076,7 +3100,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         goto out;
 
     res = -ENOSYS;
-    if ( op.version == 2 && opt_gnttab_max_version == 1 )
+    if ( op.version == 2 && gt->max_version == 1 )
         goto out; /* Behave as before set_version was introduced. */
 
     res = 0;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 51017b47bc..0ec57614bd 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -89,14 +89,20 @@ struct xen_domctl_createdomain {
     /*
      * Various domain limits, which impact the quantity of resources
      * (global mapping space, xenheap, etc) a guest may consume.  For
-     * max_grant_frames and max_maptrack_frames, < 0 means "use the
-     * default maximum value in the hypervisor".
+     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
+     * means "use the default maximum value in the hypervisor".
      */
     uint32_t max_vcpus;
     uint32_t max_evtchn_port;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
 
+/* Grant version, use low 4 bits. */
+#define XEN_DOMCTL_GRANT_version_mask    0xf
+#define XEN_DOMCTL_GRANT_version_default 0xf
+
+    uint32_t grant_opts;
+
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
 
diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index b76222ecf6..37b42c756a 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -81,6 +81,7 @@
 #define KB(_kb)     (_AC(_kb, ULL) << 10)
 #define MB(_mb)     (_AC(_mb, ULL) << 20)
 #define GB(_gb)     (_AC(_gb, ULL) << 30)
+#define TB(_tb)     (_AC(_tb, ULL) << 40)
 
 #define IS_ALIGNED(val, align) (((val) & ((align) - 1)) == 0)
 
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 41713e2726..fe6225346f 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -36,7 +36,7 @@ extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames);
+                     int max_maptrack_frames, unsigned int options);
 void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
@@ -67,7 +67,8 @@ int gnttab_acquire_resource(
 
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
-                                   int max_maptrack_frames)
+                                   int max_maptrack_frames,
+                                   unsigned int options)
 {
     return 0;
 }
-- 
2.33.0


