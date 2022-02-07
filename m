Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4194ABEA4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266833.460548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3QL-0001xS-VK; Mon, 07 Feb 2022 12:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266833.460548; Mon, 07 Feb 2022 12:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3QL-0001vP-Qw; Mon, 07 Feb 2022 12:47:17 +0000
Received: by outflank-mailman (input) for mailman id 266833;
 Mon, 07 Feb 2022 12:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYSm=SW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nH3QK-0001ru-9s
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:47:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11646bd7-8814-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 13:47:13 +0100 (CET)
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
X-Inumbo-ID: 11646bd7-8814-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644238033;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fIkhgpoA9HInbkbMdb7M92sMZI4UpmRyJhdzVvkWngs=;
  b=HbXSh4EenxvGotyDTau04s8Jx8hs5WOIj9tScDs2OyBVgWh/8P+Y/7fb
   haKc8htGchxezYd9bvkBS09IOh4fDsde2l3zAe1LO2/di/fUaM3oG1ROM
   cCom50+NHWRxiLES/gSeY+Bj6/WyrNoZ5w1uSMLdo5O5ZZ+gLTHxfbZMJ
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: C77i+etr9D9s9HzZMGOP5iruX7lF1LAegDo276ZtMBgn+z6hMzDHlEpj3H4VHoyVChg7kKjiDv
 8KsR1JJiG6MR6oSCzEgCX9mJAFcaX+bJG6Srew7a29qQqZXg8ITp+u7lzqsETvcMa6JTgMsKAi
 jJLFzd4wx0ij8jTI14q+ztI0df7OYKuXHOcWJWL1fgFmoTZtHXJjzTuzgsG9KesHgbwSxMsJgp
 7Ue1DbTTy0K7CqtauucUkJGK9OPC8q8CQxkreDEC1vwYdym802LY4vXVJTUdtmTficOeTR+faF
 cCQm0DcvFaqrOSudc8Mj0Et0
X-SBRS: 5.1
X-MesageID: 64044594
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:I78iBa4KV7PUh9byCHx4DgxRtBjBchMFZxGqfqrLsTDasY5as4F+v
 mJJXjqHM6zba2X1L41yOtmyphhUsJ7UyYdrGVRr+Cg9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tEw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 twW5aa9VQISIbCTycYQSyQGIwFTBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmto2pwTTKq2i
 8wxQjFfZwn7RyJ2PkoVMZEymryz3SnUWmgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 kvc42n8NTQLO9WexCSt/2qlg6nEmiaTcIgfDqGi//hmxlia3HUOCQY+XEG+5/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ug4QGQzuzP4gCWBkANVDsHY9sj3OcIQjgt2
 k6MjsneLzVlu72ISlqQ7r6R6zi1PEA9L2UPeCsFRgst+MT4rcc4iRenZvFnHa2uh9v5AwbZx
 TyQsTM+jLUei80M/6ij9FWBiDWpzrDLUwo06wP/Tm+jqARja+aNQIil6kPS6/paG7qIVVmKv
 HUCmM+24fgHCNeGkynlaP4WALij6vKBMTvdqV1iBZ8s83Kq4XHLQGxLyGggfgEzaJ9CIGK3J
 h+I0e9M2HNNFFmjNv9Nbp60MNs3kvnCGMzYCMD0Q+MbN/CdazS71C1pYEeR2UXkn04tjbwzN
 P+nTCq8MZoJIf85lWTrHo/xxZdun3ljnj2LGfgX2jz6ieL2WZKDdVsS3LJihMgd5bjMngja+
 s032yCim0QGC72WjsU6HOcuwbE2wZoTWMqeRy9/LLfrzu9a9IYJUa65/F/ZU9Y595m5b8+Rl
 p1HZmdWyUDkmVrMIhiQZ3ZoZdvHBMgj8StqZHVybAzxgBDPhLpDC49FJvMKkUQPrrQ/nZaYs
 dFZEyl/Phi/YmueoGlMBXUMhIdjaA6qlWqz09mNO1ACk2pbb1WRoLfMJ1K3nAFXV3bfnZZu8
 tWIi1KAKbJeFlsKJJiNMpqHkQju1UXxbcovBiMk1PEIIx6ymGWrQgSs5sIKzzYkc0malmDEh
 lrJXX/1Z4Dl+ucIzTUAvojdx6+BGOpiBEtKWW7d6Le9Ly7B+WS/h4RHVY61kfr1DQsYIY2uO
 rdYye/SKvoCkAoYuoZwCe8zn6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbmC
 FiS/tR6OKmSPJ+3GlAmOwd4PP+I0usZm2eO4K1tcln6/iJ+4JGOTV5WY0uXkCVYIbYsaNElz
 O4ttdQ48Qu6jhZ2YN+KgjoNrzaHL2AaUrVhvZYfWde5hg0uw1BEQJrdFi6pv83fN4QSahEne
 2bGirDDirJQwlv5X0AyTXWdj/BAgZkuuQxRyANQLVq+hdeY1OQ82wdc8GprQ10NnAlHye96J
 kNiK1ZxefeV5z5ticVOAzKsFgVGCEHL80D90QJUxmjQTk3uXW3RNmwtf+2K+RlBoW5bezFa+
 pCeyXrkDmm2LJ2ggHNqVB43seHnQPxw6hbGyZKuEMmyFpUnZSbo3/21bm0Sphq7Wc48iSUrf
 wWxEDqcvUEjCRMtng==
IronPort-HdrOrdr: A9a23:JP4JXalLjuNkONqWlugNqtaxoMHpDfIf3DAbv31ZSRFFG/Fwwf
 re5cjztCWE7Qr4Ohkb8+xoXZPsfZqyz/JICOUqUotKPzOW2ldATrsD0WK4+UyHJ8SWzIc0vp
 uIFZIRNDSaNykYsS+V2miF+3lL+qj+zEgF792uq0uE7GtRGsZd0zs=
X-IronPort-AV: E=Sophos;i="5.88,349,1635220800"; 
   d="scan'208";a="64044594"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfqTni3B5TxJrLGsfm8JtrjtnT/gv+HrrzfG9uO4bN04pJaO1a5tdrGeZO41eMWuAaXhzRJd11wOzvDiGT0iwEyv0jIpd0y7l/UEy1oS+Gf839/huqKmuvSGCEqEfISXoITOvLWt7AO8icm46t3GMzg+MWCd4fnAStezwlvTmQC9kR5UyJ+cWEwnU/MT8FYYCchD5enU17I4IHMhUWBZlFZMmHRcGVwB8zYclgMaWWmp+zvxC0RKr7B20rYZgXC+SR+UTsumTmQjvQxT8KH/PxBdksf7IwniOchtrc1cnf6wCRhXcf0vjKjo23jPMP2nHDVNoRstuSV8j6SNObejjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KuWjwX3k3PvN++BhxGf/KpKmjdqGgmetGnkm6W1AME=;
 b=CIAsvP7/KxtPPM+1Ov6DssQyx1RNVSRBJtZADmdBl7LqNV2K2HPfNdBhDKLTYWuacQKxeE9EAuBtdhG7IEOShSnKXHqGr2p1WmntFb6TQtb9o2Q8ydeOOAJBBtNJMwlhgxDrIlUi1jEdCViYv0gRsIP3Vw6J+tK2PVQoSdlcJKhi9Ogqi7clJWchJOntcUFRQTE54GKyMVSYvciNe1t9zluAFyWgQih8v9noTWswo4MzS9KkDtl/md1FTQXtYfBTsGfQ4IzY86kHKKgigKCLLmIGbBJl1V5PJ0OnQnhGCIMG5Co7CaZO7YEo23kL3IJoKlgSKaD6aOHWlhyHog94JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KuWjwX3k3PvN++BhxGf/KpKmjdqGgmetGnkm6W1AME=;
 b=Vj4EUsOkC+pU7J05rCOaf0HGGWOnOKRfnsLVbGEoE6iprAyNO6PYq0Y7AhC/cISTPAcsFoXZ0D0oogvOW9OzWQYT2uBN1VZzlTquFbWExDjQB8+i8IlpH1pniRdJDaDGnLTsrObwqKbW4kdimBDuH495LlTlamOgEDZeLDUVvG8=
Date: Mon, 7 Feb 2022 13:46:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <YgEUwTxhnWVMGMJK@Air-de-Roger>
References: <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
X-ClientProxiedBy: LO4P123CA0516.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8850c97b-ef91-41c7-f7ce-08d9ea37f0cd
X-MS-TrafficTypeDiagnostic: BN8PR03MB4676:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB46767A840046B7358E312B038F2C9@BN8PR03MB4676.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dh5qAHumA8782pJKL2gM1cU6hGF3oXc8n1Sed3nnqfZyZEoYEHUNCj1ewccRQqhRSencvsMllaXQpvnB/jnajvKGVvkCKNx9WC9D3rdjzue69+FyuyvIQutIpku8X0ZApX1nq9NHorEf7ac/nh32A9Fl3SzpRnBIVmgH2g4hnf7j9atdl97ek1/7Xiz9Dx/4CEsxOuOIXEiUpgd4L24uSO7bMnSvf7teviKPb+nHZFZ4nNI9ycCs5asUQmYCipkK7mFap5ZtYIEgR6xEgw32AvpcMHB/CR8X+J0n3hIDYMka3srkydbhlF44gROOFx1VnogDsf8RXedyU3r/7gNsX6rxQe2ofmSGF3A07ZVWtJEnz4+4kJCFbfRYOpqrVhTKq8zSXiiBOMup/6V6HH1Vrcmaiy4okuuNG7FL74RCLMyIgAhTH+B0gLCEdHs4vcegt1plukAn2OCE/IFPN8U80YUJOUcGFLHhRT+n7PyaozZRUtflWP+g9h9INx7j6SekPpBRH90cX1JAbPiBPGrYt3vPanp/xdwlfbULZJwFyCrAocOdG4+7T/1S2V51YfYsHs/eN2i9T1JigDyb/oe6IzNgQCvPz3KrREthCe0DoYp4hVqqVS0bGd4Tl7XwEOu0vpPDTtO22qRgtOlzqZxatA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66476007)(30864003)(7416002)(83380400001)(66556008)(5660300002)(66946007)(186003)(26005)(2906002)(38100700002)(85182001)(82960400001)(6486002)(6666004)(9686003)(6506007)(6512007)(6916009)(54906003)(33716001)(4326008)(316002)(86362001)(8676002)(8936002)(53546011)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3Q1YmkxV2FQMFM5MU53L244eFhwSW40RFpzdHJIaFk5dktablJPVEVBT1I5?=
 =?utf-8?B?OUxxcUhRSHB1Mm9wbnJJM1orbGNxNlB2UzIrT0JyRFg1MHltc1VpZUFBKzRN?=
 =?utf-8?B?Q2pJYnphQjFNWXZMcklRcVlXQ0toZitwME5Wb3pXaHZpa0ZQaS9MYVNsUmk5?=
 =?utf-8?B?RzlWM1lLMnRlZURLWVlCd0RDQjJKQ0N0M0ZNdEFmcE8ybFFHeStVekRoWlpX?=
 =?utf-8?B?MkpoK2hwVU1XajJDSGhwaFV3RlhyZVAyV29lUzJaeHlDWmJyejVDVlVNRWlr?=
 =?utf-8?B?Zmc4NU5sNWN3TUkwanZBVkRUdDl3Q2hyY0dlT2lmQWY2dFg0Y0ZOTEhoNU1M?=
 =?utf-8?B?d0thUm1EN2NxczZZNCtHN3U5MWVwbjRmQWYxTFR4allzRjgxdHFTSmhxZC9w?=
 =?utf-8?B?eTJLZThMTk00TEFkQlVQTWN6RWhHaUpWVldMRi9FQThNVVNnYm9uMjd6YlM1?=
 =?utf-8?B?VThiaE8zQ3pSTTJLb2QwRDZjUi9HSVJma3doNElHUEgzNGEyN3JDS25JT01S?=
 =?utf-8?B?YjNianlkS2tUTkY3OVkxdHBvU0xhdHFrRGIvNXRWWG5FNXB5WWQ5U1ZNNThI?=
 =?utf-8?B?ZFhaOFZmNXM4SHRjMXN3Nkxodm5JN21UeTEzUlhNa1d1Wm5lMWhPVldPUktT?=
 =?utf-8?B?ZGdYeTVhdlFUbk4vcVFLRk5SMDJPTFhudEZuSHJzL1JaY3RnMTU4TXo1eFh3?=
 =?utf-8?B?UkcrWTcvVVdKTnFpQVY3Yi9QWmJmMysrS1Q0eElNaHRXWEFLdTVTd1VJaFFy?=
 =?utf-8?B?M2Mxc0Z1VXdzM085bWFwWDRjK1UyL3NTM1BUV2RVU0xYZVY2R3IzR2lvWTJl?=
 =?utf-8?B?cVZ1U3c4WEpwOVNCUWxwVk5NOEcrRVRUMktyb3llL3UzTXNkUWxjaGdQSHRB?=
 =?utf-8?B?TkhWVGdxUWpFSTNKenhCUXZPWnBpbjJBdlJpSHhVa3RxWFRXSGFWWE5VMUd6?=
 =?utf-8?B?dEVpTEQ2cytWVEJ3M1NOd3FIcGxOd3AycWJjVmtFb0lUZE9qcG90bEh4R1lz?=
 =?utf-8?B?S2tJc2pGRmk3Z3V0Ly84aFBHR2ZvSE04dTNqeUl6WlRmZ2FIWW0rQi9nZlJk?=
 =?utf-8?B?eStGVDlJUktKZlRtNFZJWVIrdStURjZGaUNBZlZhSlNIczJzT1prL0V4TWUr?=
 =?utf-8?B?NGZTVFdzSW50M09WaFozSWJNMGJ4VTVFMEdDbnpENHhOS2xWNEtJcDZFcnps?=
 =?utf-8?B?NFB6VGIrRVRHaVkvSFUwcXYyaWEvcDgxTCtwcmZnM2tuWFNmbDlCeGF6TXBj?=
 =?utf-8?B?bUUxYmE3elZSUWtOTnF6MkJ4N1AxRG41QmQyWVUreEZHRC9rVFpXQXlhcXZV?=
 =?utf-8?B?RzJiTU1tWHYrTGxIVHhFVmZnVUNydzA1MnE1Q2ZncXNuRFAvcC9sZUo4VkJW?=
 =?utf-8?B?cVFvdEY3KzlWejhqMDcxM1FKTTZvYnpPMHZPYlNiQ24xcjVSalY3TTg5K3pO?=
 =?utf-8?B?NDJMYkJZN1lDKzczdS82NVZQeUk4Y3Y0YWhXV0YrbURjWUpVT3pXZU15SnJU?=
 =?utf-8?B?U2ZSUVdUM2RORVBEdldCckZTaE84a29iVG1Yc3hLMDRBL0ExMFEybzJINmV2?=
 =?utf-8?B?Z2JCemFUNHllemlqdmJreldsSVVaM1JLZTRDbjEyelpuaG03MGs2R09Ud0kw?=
 =?utf-8?B?aVFYc3JSWEk2aUxaVGFobm04LzNad0ZWR3k4U09OSUJlOWtPMmh5ZUlPV09W?=
 =?utf-8?B?NDMwSXJnSHNmdEFROEFSaTFFRlFxZG1udUF0N0FOcnF0WU1kMURycjdlUjdH?=
 =?utf-8?B?c0Qzc2dEclFweG5SOU44NnkyTmpPQzRqamd5KzF5aEk2b2ZaQUFHaHNlOExp?=
 =?utf-8?B?SDQvRHlKa3hCQ0NlcW5uNjgycS9pMFpxb0EwcitvNUM0N0lQbk5aZ0ZqRWhn?=
 =?utf-8?B?Qk4rQUtDRFUzaWczdDkvcGtBdTQ2NlJIeDJpTlBMTWw5alFxdkw5b1l3cVNL?=
 =?utf-8?B?MEs3RHFSemhpNDNkWWVVaVMzL09rcTh4eE81V1VIbWt2TCt4N0JRQnRLWEdM?=
 =?utf-8?B?Zkxyb0o3c2Ewc0prVzFrU2dFc25rSU9YSHdHVlIvUDdKbFcrYUEwSU8zS20x?=
 =?utf-8?B?bTdkNUd5VHFTcEZLUkR3WHRQcDR4V0J3T3hIallhY0RFNXdGSnp1RDJGWCtG?=
 =?utf-8?B?TjA3UEJjMTFBL3VoQytqQ3F5bDluQ1MvWGpjUUxGSUhtYXA2RFdMelZMV0lu?=
 =?utf-8?Q?HZQGpOAdqif2dIO1n6m0y3k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8850c97b-ef91-41c7-f7ce-08d9ea37f0cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:47:03.5809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaDmwg0uVQkNvFnibg4nw/qPXP775YP2rCXWLoD5DcJRJWZtT5hCcHQWfqxQ/dlKLtcl3WGE3kjVVANTmsdnpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4676
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 11:08:39AM +0000, Oleksandr Andrushchenko wrote:
> Hello,
> 
> On 04.02.22 16:57, Roger Pau Monné wrote:
> > On Fri, Feb 04, 2022 at 02:43:07PM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 04.02.22 15:06, Roger Pau Monné wrote:
> >>> On Fri, Feb 04, 2022 at 12:53:20PM +0000, Oleksandr Andrushchenko wrote:
> >>>> On 04.02.22 14:47, Jan Beulich wrote:
> >>>>> On 04.02.2022 13:37, Oleksandr Andrushchenko wrote:
> >>>>>> On 04.02.22 13:37, Jan Beulich wrote:
> >>>>>>> On 04.02.2022 12:13, Roger Pau Monné wrote:
> >>>>>>>> On Fri, Feb 04, 2022 at 11:49:18AM +0100, Jan Beulich wrote:
> >>>>>>>>> On 04.02.2022 11:12, Oleksandr Andrushchenko wrote:
> >>>>>>>>>> On 04.02.22 11:15, Jan Beulich wrote:
> >>>>>>>>>>> On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
> >>>>>>>>>>>> On 04.02.22 09:52, Jan Beulich wrote:
> >>>>>>>>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>>>>>>>>>>>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>>>>>>>>>                        continue;
> >>>>>>>>>>>>>>                }
> >>>>>>>>>>>>>>        
> >>>>>>>>>>>>>> +        spin_lock(&tmp->vpci_lock);
> >>>>>>>>>>>>>> +        if ( !tmp->vpci )
> >>>>>>>>>>>>>> +        {
> >>>>>>>>>>>>>> +            spin_unlock(&tmp->vpci_lock);
> >>>>>>>>>>>>>> +            continue;
> >>>>>>>>>>>>>> +        }
> >>>>>>>>>>>>>>                for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> >>>>>>>>>>>>>>                {
> >>>>>>>>>>>>>>                    const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> >>>>>>>>>>>>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>>>>>>>>>                    rc = rangeset_remove_range(mem, start, end);
> >>>>>>>>>>>>>>                    if ( rc )
> >>>>>>>>>>>>>>                    {
> >>>>>>>>>>>>>> +                spin_unlock(&tmp->vpci_lock);
> >>>>>>>>>>>>>>                        printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> >>>>>>>>>>>>>>                               start, end, rc);
> >>>>>>>>>>>>>>                        rangeset_destroy(mem);
> >>>>>>>>>>>>>>                        return rc;
> >>>>>>>>>>>>>>                    }
> >>>>>>>>>>>>>>                }
> >>>>>>>>>>>>>> +        spin_unlock(&tmp->vpci_lock);
> >>>>>>>>>>>>>>            }
> >>>>>>>>>>>>> At the first glance this simply looks like another unjustified (in the
> >>>>>>>>>>>>> description) change, as you're not converting anything here but you
> >>>>>>>>>>>>> actually add locking (and I realize this was there before, so I'm sorry
> >>>>>>>>>>>>> for not pointing this out earlier).
> >>>>>>>>>>>> Well, I thought that the description already has "...the lock can be
> >>>>>>>>>>>> used (and in a few cases is used right away) to check whether vpci
> >>>>>>>>>>>> is present" and this is enough for such uses as here.
> >>>>>>>>>>>>>        But then I wonder whether you
> >>>>>>>>>>>>> actually tested this, since I can't help getting the impression that
> >>>>>>>>>>>>> you're introducing a live-lock: The function is called from cmd_write()
> >>>>>>>>>>>>> and rom_write(), which in turn are called out of vpci_write(). Yet that
> >>>>>>>>>>>>> function already holds the lock, and the lock is not (currently)
> >>>>>>>>>>>>> recursive. (For the 3rd caller of the function - init_bars() - otoh
> >>>>>>>>>>>>> the locking looks to be entirely unnecessary.)
> >>>>>>>>>>>> Well, you are correct: if tmp != pdev then it is correct to acquire
> >>>>>>>>>>>> the lock. But if tmp == pdev and rom_only == true
> >>>>>>>>>>>> then we'll deadlock.
> >>>>>>>>>>>>
> >>>>>>>>>>>> It seems we need to have the locking conditional, e.g. only lock
> >>>>>>>>>>>> if tmp != pdev
> >>>>>>>>>>> Which will address the live-lock, but introduce ABBA deadlock potential
> >>>>>>>>>>> between the two locks.
> >>>>>>>>>> I am not sure I can suggest a better solution here
> >>>>>>>>>> @Roger, @Jan, could you please help here?
> >>>>>>>>> Well, first of all I'd like to mention that while it may have been okay to
> >>>>>>>>> not hold pcidevs_lock here for Dom0, it surely needs acquiring when dealing
> >>>>>>>>> with DomU-s' lists of PCI devices. The requirement really applies to the
> >>>>>>>>> other use of for_each_pdev() as well (in vpci_dump_msi()), except that
> >>>>>>>>> there it probably wants to be a try-lock.
> >>>>>>>>>
> >>>>>>>>> Next I'd like to point out that here we have the still pending issue of
> >>>>>>>>> how to deal with hidden devices, which Dom0 can access. See my RFC patch
> >>>>>>>>> "vPCI: account for hidden devices in modify_bars()". Whatever the solution
> >>>>>>>>> here, I think it wants to at least account for the extra need there.
> >>>>>>>> Yes, sorry, I should take care of that.
> >>>>>>>>
> >>>>>>>>> Now it is quite clear that pcidevs_lock isn't going to help with avoiding
> >>>>>>>>> the deadlock, as it's imo not an option at all to acquire that lock
> >>>>>>>>> everywhere else you access ->vpci (or else the vpci lock itself would be
> >>>>>>>>> pointless). But a per-domain auxiliary r/w lock may help: Other paths
> >>>>>>>>> would acquire it in read mode, and here you'd acquire it in write mode (in
> >>>>>>>>> the former case around the vpci lock, while in the latter case there may
> >>>>>>>>> then not be any need to acquire the individual vpci locks at all). FTAOD:
> >>>>>>>>> I haven't fully thought through all implications (and hence whether this is
> >>>>>>>>> viable in the first place); I expect you will, documenting what you've
> >>>>>>>>> found in the resulting patch description. Of course the double lock
> >>>>>>>>> acquire/release would then likely want hiding in helper functions.
> >>>>>>>> I've been also thinking about this, and whether it's really worth to
> >>>>>>>> have a per-device lock rather than a per-domain one that protects all
> >>>>>>>> vpci regions of the devices assigned to the domain.
> >>>>>>>>
> >>>>>>>> The OS is likely to serialize accesses to the PCI config space anyway,
> >>>>>>>> and the only place I could see a benefit of having per-device locks is
> >>>>>>>> in the handling of MSI-X tables, as the handling of the mask bit is
> >>>>>>>> likely very performance sensitive, so adding a per-domain lock there
> >>>>>>>> could be a bottleneck.
> >>>>>>> Hmm, with method 1 accesses serializing globally is basically
> >>>>>>> unavoidable, but with MMCFG I see no reason why OSes may not (move
> >>>>>>> to) permit(ting) parallel accesses, with serialization perhaps done
> >>>>>>> only at device level. See our own pci_config_lock, which applies to
> >>>>>>> only method 1 accesses; we don't look to be serializing MMCFG
> >>>>>>> accesses at all.
> >>>>>>>
> >>>>>>>> We could alternatively do a per-domain rwlock for vpci and special case
> >>>>>>>> the MSI-X area to also have a per-device specific lock. At which point
> >>>>>>>> it becomes fairly similar to what you propose.
> >>>>>> @Jan, @Roger
> >>>>>>
> >>>>>> 1. d->vpci_lock - rwlock <- this protects vpci
> >>>>>> 2. pdev->vpci->msix_tbl_lock - rwlock <- this protects MSI-X tables
> >>>>>> or should it better be pdev->msix_tbl_lock as MSI-X tables don't
> >>>>>> really depend on vPCI?
> >>>>> If so, perhaps indeed better the latter. But as said in reply to Roger,
> >>>>> I'm not convinced (yet) that doing away with the per-device lock is a
> >>>>> good move. As said there - we're ourselves doing fully parallel MMCFG
> >>>>> accesses, so OSes ought to be fine to do so, too.
> >>>> But with pdev->vpci_lock we face ABBA...
> >>> I think it would be easier to start with a per-domain rwlock that
> >>> guarantees pdev->vpci cannot be removed under our feet. This would be
> >>> taken in read mode in vpci_{read,write} and in write mode when
> >>> removing a device from a domain.
> >>>
> >>> Then there are also other issues regarding vPCI locking that need to
> >>> be fixed, but that lock would likely be a start.
> >> Or let's see the problem at a different angle: this is the only place
> >> which breaks the use of pdev->vpci_lock. Because all other places
> >> do not try to acquire the lock of any two devices at a time.
> >> So, what if we re-work the offending piece of code instead?
> >> That way we do not break parallel access and have the lock per-device
> >> which might also be a plus.
> >>
> >> By re-work I mean, that instead of reading already mapped regions
> >> from tmp we can employ a d->pci_mapped_regions range set which
> >> will hold all the already mapped ranges. And when it is needed to access
> >> that range set we use pcidevs_lock which seems to be rare.
> >> So, modify_bars will rely on pdev->vpci_lock + pcidevs_lock and
> >> ABBA won't be possible at all.
> > Sadly that won't replace the usage of the loop in modify_bars. This is
> > not (exclusively) done in order to prevent mapping the same region
> > multiple times, but rather to prevent unmapping of regions as long as
> > there's an enabled BAR that's using it.
> >
> > If you wanted to use something like d->pci_mapped_regions it would
> > have to keep reference counts to regions, in order to know when a
> > mapping is no longer required by any BAR on the system with memory
> > decoding enabled.
> I missed this path, thank you
> 
> I tried to analyze the locking in pci/vpci.
> 
> First of all some context to refresh the target we want:
> the rationale behind moving pdev->vpci->lock outside
> is to be able dynamically create and destroy pdev->vpci.
> So, for that reason lock needs to be moved outside of the pdev->vpci.
> 
> Some of the callers of the vPCI code and locking used:
> 
> ======================================
> vpci_mmio_read/vpci_mmcfg_read
> ======================================
>    - vpci_ecam_read
>    - vpci_read
>     !!!!!!!! pdev is acquired, then pdev->vpci_lock is used !!!!!!!!
>     - msix:
>      - control_read
>     - header:
>      - guest_bar_read
>     - msi:
>      - control_read
>      - address_read/address_hi_read
>      - data_read
>      - mask_read
> 
> ======================================
> vpci_mmio_write/vpci_mmcfg_write
> ======================================
>    - vpci_ecam_write
>    - vpci_write
>     !!!!!!!! pdev is acquired, then pdev->vpci_lock is used !!!!!!!!
>     - msix:
>      - control_write
>     - header:
>      - bar_write/guest_bar_write
>      - cmd_write/guest_cmd_write
>      - rom_write
>       - all write handlers may call modify_bars
>        modify_bars
>     - msi:
>      - control_write
>      - address_write/address_hi_write
>      - data_write
>      - mask_write
> 
> ======================================
> pci_add_device: locked with pcidevs_lock
> ======================================
>    - vpci_add_handlers
>     ++++++++ pdev->vpci_lock is used ++++++++
> 
> ======================================
> pci_remove_device: locked with pcidevs_lock
> ======================================
> - vpci_remove_device
>    ++++++++ pdev->vpci_lock is used ++++++++
> - pci_cleanup_msi
> - free_pdev
> 
> ======================================
> XEN_DOMCTL_assign_device: locked with pcidevs_lock
> ======================================
> - assign_device
>   - vpci_deassign_device
>   - pdev_msix_assign
>   - vpci_assign_device
>    - vpci_add_handlers
>      ++++++++ pdev->vpci_lock is used ++++++++
> 
> ======================================
> XEN_DOMCTL_deassign_device: locked with pcidevs_lock
> ======================================
> - deassign_device
>   - vpci_deassign_device
>     ++++++++ pdev->vpci_lock is used ++++++++
>    - vpci_remove_device
> 
> 
> ======================================
> modify_bars is a special case: this is the only function which tries to lock
> two pci_dev devices: it is done to check for overlaps with other BARs which may have been
> already mapped or unmapped.
> 
> So, this is the only case which may deadlock because of pci_dev->vpci_lock.
> ======================================
> 
> Bottom line:
> ======================================
> 
> 1. vpci_{read|write} are not protected with pcidevs_lock and can run in
> parallel with pci_remove_device which can remove pdev after vpci_{read|write}
> acquired the pdev pointer. This may lead to a fail due to pdev dereference.
> 
> So, to protect pdev dereference vpci_{read|write} must also use pdevs_lock.

We would like to take the pcidevs_lock only while fetching the device
(ie: pci_get_pdev_by_domain), afterwards it should be fine to lock the
device using a vpci specific lock so calls to vpci_{read,write} can be
partially concurrent across multiple domains.

In fact I think Jan had already pointed out that the pci lock would
need taking while searching for the device in vpci_{read,write}.

It seems to me that if you implement option 3 below taking the
per-domain rwlock in read mode in vpci_{read|write} will already
protect you from the device being removed if the same per-domain lock
is taken in write mode in vpci_remove_device.

> 2. The only offending place which is in the way of pci_dev->vpci_lock is
> modify_bars. If it can be re-worked to track already mapped and unmapped
> regions then we can avoid having a possible deadlock and can use
> pci_dev->vpci_lock (rangesets won't help here as we also need refcounting be
> implemented).

I think a refcounting based solution will be very complex to
implement. I'm however happy to be proven wrong.

> If pcidevs_lock is used for vpci_{read|write} then no deadlock is possible,
> but modify_bars code must be re-worked not to lock itself (pdev->vpci_lock and
> tmp->vpci_lock when pdev == tmp, this is minor).

Taking the pcidevs lock (a global lock) is out of the picture IMO, as
it's going to serialize all calls of vpci_{read|write}, and would
create too much contention on the pcidevs lock.

> 3. We may think about a per-domain rwlock and pdev->vpci_lock, so this solves
> modify_bars's two pdevs access. But this doesn't solve possible pdev
> de-reference in vpci_{read|write} vs pci_remove_device.

pci_remove device will call vpci_remove_device, so as long as
vpci_remove_device taken the per-domain lock in write (exclusive) mode
it should be fine.

> @Roger, @Jan, I would like to hear what do you think about the above analysis
> and how can we proceed with locking re-work?

I think the per-domain rwlock seems like a good option. I would do
that as a pre-patch.

Thanks, Roger.

