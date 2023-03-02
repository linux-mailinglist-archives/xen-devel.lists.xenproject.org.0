Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A34D6A8A8A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 21:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505389.778140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXpdn-0002gy-6S; Thu, 02 Mar 2023 20:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505389.778140; Thu, 02 Mar 2023 20:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXpdn-0002eT-29; Thu, 02 Mar 2023 20:35:03 +0000
Received: by outflank-mailman (input) for mailman id 505389;
 Thu, 02 Mar 2023 20:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aytp=62=citrix.com=prvs=418692924=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pXpdl-0002eN-VP
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 20:35:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1fee3c7-b939-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 21:34:58 +0100 (CET)
Received: from mail-dm6nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Mar 2023 15:34:45 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6972.namprd03.prod.outlook.com (2603:10b6:510:12f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 20:34:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 20:34:42 +0000
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
X-Inumbo-ID: b1fee3c7-b939-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677789298;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Mc+Ns7PuJmyiTGoyBovoAL9fr06bXGaaojtIK+OMI7g=;
  b=JuoJgbj339g7CQbVswES9E7HWJ9CtUnIGcz/ZpP2qgnsk4FfX4OC6I1T
   /sGM0aaFHN9VabZ25CncapUmBeNZooarpwsvsJKRGCDQgB6aIlIhLk4HK
   fLQpgTBOBdN0n7E9/pNQaPLnjRq03oZPfRUdjN9OCNy/cHVPIkUaVbvN9
   Y=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 101671764
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fvaXH6DTVZqpTxVW/5ziw5YqxClBgxIJ4kV8jS/XYbTApG8n1zVRy
 TMbDzyEPP7fNmSjLd10bonk/BwDusPUy4JgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhA5ARlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwy8NaG0IR7
 Mckd3NVdxqSg73vkKCAc7w57igjBJGD0II3nFhFlW2cIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxruAA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eWw3yiB9xOfFG+3t8wr1mv2EMaNDEXaHS7+LqdiXCCeusKf
 iT4/QJr98De7neDSd3wXAa5oTiHowQbUNpTFMU17QiMzuzf5APxLmoOQyNFadcmnNQrXjFs3
 ViM9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDQcLTAID58ToqakpjwzIVddlG+i+ididMTv3y
 TqboTM+g7gWhMgj2KCy/FSBiDWpzrDASg8u+gzWRCSr9Ap/b4++T5Ok4h7Q6vMoBI2eSF+Gv
 nQNhcmFxO8LBJCJ0ieKRY0lDLyvovqILjDYqVpuBIU6sSSg/Wa5eoJd6y04I11mWvvoYhfsa
 U7X/A9UuplaOSP2abctO97qTcM30aLnCNLpEOjOacZDaYRwcwnB+zxyYUmX3Cbml01EfbwDB
 Kp3uP2EVR4yYZmLBhLvLwvB+dfHHhwD+F4=
IronPort-HdrOrdr: A9a23:I/sMXKNoY94v+sBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="101671764"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asM/wfElQ7Sby99vuItBFmwpxa5WDU+eNvcJfHCh4lH0QTL5KF9PSnQSDXhtFxEmXc9ZnI0EtHH5PrQYDdB9PZy0ncCcat3DCodSEBVNg83jMJlrI3I5pgbKrBcYG764isIGdWBpGWII32asTcEgGxFhtzjU34s/ofBpg+CN8sx37I2mNn+T9iEvbbMWQ4v3BITe2vbKsks2KRW7G8anhKq0CXYLPKAnsM/YoQ/4ODFAQAOC8Vtgydk4vcaRgYtBjsm0lPj8JA8ZYf0rygdxDrxIECvdXDPo54dLZIspPmk04JqjqM8cGwiz9STf+tKDuZQDLRswhVFxMxGxiW9fIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQVR/gTP1cWhqzu6hztWnHZMNSx1NWYJ3DiH5sCIhP4=;
 b=BSZEyMrGQ+CvHVNhkHzknqAniVbFii/QM+Jt3LLvy8ooHu51xrLZs84sG+hcYiO901cOeaVvEbjjFF7XJIy+szvOwnjms/IW/zgDtN1x4+GnJjXiqkL+/qJ24AwhevfeyjnXh0i95WxrwA/XcUYIllpyOItOA+vNmcr/mD5AJ1OA+9E6VwI/nI+PhA5FO03CA6e1vMouYnfWGUVs/emq7yt+wOfWkXmZ7iarPMy6eicsPj4k8hof+NjIRB1npCBgXnsb3X5hSvo+hM4EonxT6Mo9Cv2fOgBz1+8SpZrXfaw7632dD19QqDdYGZQyZbOBi8tErEvdeK5+tOk33Rq5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQVR/gTP1cWhqzu6hztWnHZMNSx1NWYJ3DiH5sCIhP4=;
 b=NgvaW1/WM8ga1jVYmY67rU0ohv33GkE5OOTyRNsYyUxLKRGgIoJhEF8/Laje8PaLZBoYNj1TTPFPZGEYIJ0YRg82euL0Tq6Npu3MAqvClAeyAJ4pdlhJvroK6adRflX8mlGaS4WRctsftNu8Uz1XJiPOsU81xJjezE/6mDHqMI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e9203c51-355a-6362-dbf3-8e8d17d4e7b5@citrix.com>
Date: Thu, 2 Mar 2023 20:34:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] xen/riscv: initialize .bss section
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
 <495bd1d7fc2becdd48bd00253c079971e2231e99.1677762812.git.oleksii.kurochko@gmail.com>
 <270118d9-0a7c-82c5-aaa8-437644017af4@suse.com>
 <454a6452b2201b815979e7ca730949f7bb5fe4ef.camel@gmail.com>
In-Reply-To: <454a6452b2201b815979e7ca730949f7bb5fe4ef.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0503.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6e50b6-7500-4434-051a-08db1b5d8cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D5i792jGUxNjILH1T/PmhTXD4MU6j6KhKV1dldpaPb1jlwNlDc9cfaMObD9+ILrBc7XbRuamIqK43xbGEkj5joDIDAu5cWP3pVcQm0wCCjFGwCxRfvhxmRIQTv0GP4/vzSxgE6PfzPuhZnojbN+oE9qzyqZu6epFngzPB6tL1sejiKXA7qxORUQommNcvlxlVQjaFARPCHB+/m2CS9RRnE0+SE6oI8yJVqBUkriec0dU9Wv/9+ObQ06VHGXHNuzoH8MOcnEMCCk7tu21wI/y6KSz3/b79x/JDKbw2qqh1r0SHt0mE1W3eHapqyRnAZklJ7tiT45sEThZ8EQ1p78eEB4ECir7/Aj1LX2mC+kipMUhdbLYsTMCQ41QvfTpIP3owfWfEl4IKgDThLbxcZZTsj7Za4QejZHoSekfDLx7osxGtVQd0YKNFxAFmbPBgman9qOxRpbDQv6TUH5xdh9SYcrkRC83QBKUM0SgtU092kK6rQN7vhlOntkaUvsBZzsLpNF7Y1nMqndTKmCrREb/jJoVx8km8zbMGiE1CmZL3a+BFfXLi89F8U+w8oVuBq9AJSLnkxy3yj5BJ/hk1iRDdIN2gfAVM4IT8ue5RmTKO/DdcqJ2gYkZZgO12UoOVxQ0x6hw9ZiaRNpCZfq2H2L1wyXj485+ukuex4SNfPxy25/yN5vsRMvY/7il4fNpE508VUerO4s9cex16vUM0Xvmj8N8QQPk1SDjNgAVjb2A8/2RhP7IfQgcqshPP7j6dqno3pKYgdivPdMv8RNChVjaug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199018)(36756003)(31686004)(478600001)(186003)(5660300002)(38100700002)(6506007)(6512007)(53546011)(83380400001)(6486002)(8936002)(110136005)(26005)(2906002)(54906003)(86362001)(41300700001)(316002)(31696002)(66556008)(2616005)(66476007)(8676002)(82960400001)(4326008)(66946007)(6666004)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1E2Y1lsOW55bnI0bWw3ejlmcVg4aWozazRZbHRZWTF4Tm5WQmVORXV0UkVV?=
 =?utf-8?B?aUMzdnMyR2lPWFBzL3dUZnNHNG9XWmxyam9LTFByRzJNaHdoc1R1TVQ5Qm9j?=
 =?utf-8?B?eTArTDlER2pOM3ErUGpwcCtVcTl5cWt0NVJOR0hXU2EzNDdqZkplSUlMeGRJ?=
 =?utf-8?B?dXVHa3BiNWxTQjVEbFBHeDZtTmZ1OWJCR1QvLzdNUmJIVW5NaXIvaUZpQ1lT?=
 =?utf-8?B?ejZuVnhOREZSbHBiK2xMVnNMRVlzVll0KytIQndGcjVOM2tRQkkzZzFtak5M?=
 =?utf-8?B?UkdXWHN0SlczMzUxa3h5MTJrMCs2Y09QK2JMZUZOcFh6eGk5emJrbjBrb0FP?=
 =?utf-8?B?Q3VmbUxMaHdaMFd5cEJ0VUpqSmdpaDBndDB4aXArNERjbHpoMzNIY1NqLzMw?=
 =?utf-8?B?NzJ2R2FkSWRSOFV1aU1pTk5ENDdMbU1idkdDQ0JoTitVL1A4WlpQbHdTSkVG?=
 =?utf-8?B?M0hVNEtRWElTVzl1WFpSVEJIc3RmWndjTFdNU0taZ2I3elZRVHk4ZG9oT0xm?=
 =?utf-8?B?UStNT09KTUI4MUwvU3Fra3FYc24xVDlISHdMUWwxRXozMXN4a0p1UDRRa0pM?=
 =?utf-8?B?dUVHZFNiNEhTT3dVY2xhcWNTL3VmZVdJbVhCZmVGeklTNmM3MkJXcmlXQmtC?=
 =?utf-8?B?R3UzbFZra0VPUVBFejNZbHVsSCtvSUJ6b3ZMdSt3YnEvQ2Z1dzYzazJWbEdH?=
 =?utf-8?B?TjNHUUprdVFEaFBlaHdrMDd1SVZuWjJoNjBPd2JUZzcwZEQ2OVJlckNuUTBE?=
 =?utf-8?B?dEdUd3dkQllmV1BzenhhbE4xZjZnNXZ5cC9xdlB0YThaSkdGazdXclFUM2w1?=
 =?utf-8?B?NWt1ZzdMRmVMYnpxSlh4aWwxT2V6WDFBNHZBOHZ4NUo2RlkrNzROSjhMRVRr?=
 =?utf-8?B?T0hlWFdkcVU1b1p3dUQrblNoZXlSRHUxbzVmbWVLYUFrRjFHekIwaGNGcGtQ?=
 =?utf-8?B?NW1NTWN1K3hwUnkvbFI5dlhobXRmeFdCTVFDcHc4U254aDNCcFQ5dXNIT0xS?=
 =?utf-8?B?WXo2Vjhsd243aENmOXBqb2pzQWdBTXhpVkhFNzZ1Qlk4UDRyKzFmVWthdjJj?=
 =?utf-8?B?ZkhFRVdibFMwUDBDK3J3UDlzSFFiZjhYOFNPUTFXVmE3WXBrcnJzNGQyLzdD?=
 =?utf-8?B?MVg4SlMwZlFxQlZtRjRBQm1rL2RPRktTcXNxd1ZpQk4ybyt5alFxa3Nsc2dB?=
 =?utf-8?B?eEkxNzVpWDFUNUl0RzA0QzlKcnlWVFpoME1NWVhlZ1M1cUwyVVBNZE13bGFj?=
 =?utf-8?B?TlIxRWkvV0ovZzdhcWVDNzYzRnNtc3pOWkpoNFN0OHdYYm9TMStsSVg1UDNh?=
 =?utf-8?B?QUtpWTNJdllJWWhxRnRYL045cTJZOE1RcmYrVHlVV2dMeUY5d1RzcXlQbHpT?=
 =?utf-8?B?aG9YQWNmTVN2V2pHYmpZRUZBQmRlalJYZ1lKVkF2RXdNekQrWFJtT2JtMlBR?=
 =?utf-8?B?bWRPZ1F0L0lzM1FXTldaTFNJNVdLUkQxT2hXUktJcFJsbVNCOVlJdzBxcmhn?=
 =?utf-8?B?WDdLZk16ekIwMUZwOGNzTWMzcUlrdWVkYzhUbHJaNTYxN1RvVE94M0V3U2VV?=
 =?utf-8?B?clJCdnBYSkJoUExuM2NPRG02aFZqazljWUVQc1RoUVI5MzhkZ0hCOWE1NmIx?=
 =?utf-8?B?RWxxUkdQMGVqd0xObmV6NW05cU41cjF3Z3d2V0E5VXcrUjFaK2RTS0orQm1O?=
 =?utf-8?B?dWpaTnVMdnVZQWhuVmQ0bFdDODV6K0gwTWMvM0NtbENEOWdqdXNKZlRZeUhI?=
 =?utf-8?B?dk53S2sxakNNdmJDRkVNcmk0eFZlMmpLbFlCZ0ZyRzNUYWFVOUZCWFQyZ01t?=
 =?utf-8?B?VDVyNDR5R25ibmM2SVVMOG1vczhET0kyQWp5RVdEbkloMTM1U2VPaDJHbDJD?=
 =?utf-8?B?eGhCVWxmeVEvVGc3SmZIYnFxQWt6OTAzQmhWZnhRWFJBVVpQVGdCQjhmclUr?=
 =?utf-8?B?ZEJCcGhTeTRUbmsvTkNsd0Fzejk0TEdVK2YyUjZFYXBzOWY4YkQ1ZWFtMkFE?=
 =?utf-8?B?Y3lsNnF1SnVNWXBUNXJ5TnFqTHhuZHk4aVRGdUtuekFoTGZPRG5IbFRPaUxV?=
 =?utf-8?B?NW5FeUdVcmNORzkwbnEyOUlMUEFCWlBlRkRGVWFOeGZzMklnQ0hvYzZPWkJG?=
 =?utf-8?B?bkpTZjhUY2JTdmxYTUZQSVpockFXaDRjWHppQk01UENQb1F1TkVZN0VZekNH?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l1815DfjwhiZjYcUu9l/ktl6WbLrXSjj9w2D7y0ejvPP4P6c5ddvPQSa2c53bI7wg4dCavn4/sGCIS2O0SGW1aWT79ofPiJJb1IyL3JZCJAbz067y4KUH6jaDFmk1Y0P5tja5SpfzwZ9CMpOzHHrtU3YXiV06Y6PTZj69cSY7+f4BP/hd2ZXZBQFAZ9Cui6RhFBWY+g8Gp0n9MeSQqmrmzzkYP0P3mTU8lWDx6huotbJSvvxNX+BtOrpt2RiHu28VmkgiCBN1hM6V+FEVWssSlWqLs+o6IaKNrGmWyFubhyzWte/Qlj8pf9CuVbVuKVQ2WHS4GC7SEaBsjfkbYx9gjlIa8I5e89WtVNJFnzqd27SJjcYfXN/gm73Zq1m1UM5zpajon4Bto+9+dtLtuUsX85Xtk1Rj0jCRxSNxox4ZWkiowSVbEYDTzusggBkDmhPSXacIV2sSiY3jDOCGp0PrIdNVCnxpJOFrMCVjACnHZQIPqbMPLVCSD5AxPxlpXj+Hdep0PdfY9/pvx3V9O05sNenaiAu7kL2dNcPVgkFH/E51P4LLChoQXLLhm89p1XkdGUIbAqz9QWnY8mvh0siWkpWI3NnlM1N3p5EmbP4YwiPJ+OpWBrhdYqY//I4goWCXxFk4ZFIIFvg0bptdTnArVIVRN61Bgowtha/HlFB7eqoPhnqC8vahGEcf+sUvSfljRPqw/V6BBiItFMpEI3tIpEWpHClDKYb87xQfgrJRdbTObgRNL8ieIqdECOzxZbsD/JReQx6TaE4OCFgZxBkcm/fTplL41pSGxIc87qSiV4mnaXOmU0ln/diFO2gol5cHCXfLH6u/ddYkObR5KHIdffQR77+++EFZYngSHr5gYOdUUCfad3/aAPPDr/67K6WWX9gFJD+AH5yV+WX23bbLieFdBSungPwNoKEFIrSXx0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6e50b6-7500-4434-051a-08db1b5d8cf5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 20:34:41.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrc/xyJPSJKdHKBfnjpkv9NCT9WSziO29UJBwzICy3aHXi9QUAoyJREZ2Letr9VAdCed/S/+HABCxjhlk9toOdSeoIjlzYTJdUmb8EtdCXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6972

On 02/03/2023 3:55 pm, Oleksii wrote:
> On Thu, 2023-03-02 at 15:22 +0100, Jan Beulich wrote:
>> On 02.03.2023 14:23, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -13,6 +13,15 @@ ENTRY(start)
>>>          lla     a6, _dtb_base
>>>          REG_S   a1, (a6)
>>>  
>>> +        la      a3, __bss_start
>>> +        la      a4, __bss_end
>>> +        ble     a4, a3, clear_bss_done
>> While it may be that .bss is indeed empty right now, even short term
>> it won't be, and never will. I'd drop this conditional (and in
>> particular the label), inserting a transient item into .bss for the
>> time being. As soon as your patch introducing page tables has landed,
>> there will be multiple pages worth of .bss.
> If I understand you correctly you suggested declare some variable:
>    int dummy_bss __attribute__((unused));
>
> Then .bss won't be zero:
>    $ riscv64-linux-gnu-objdump -x xen/xen-syms | grep -i dummy_bss    
>    0000000080205000 g     O .bss   0000000000000004 .hidden dummy_bss
>
> And when page tables will be ready it will be needed to remove
> dummy_bss.

Well - to be deleted when the first real bss user appears, but yes -
that will probably be the pagetable series.

>
> Another one option is to update linker script ( looks better then
> previous one ):
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -140,6 +140,7 @@ SECTIONS
>          . = ALIGN(SMP_CACHE_BYTES);
>          __per_cpu_data_end = .;
>          *(.bss .bss.*)
> +        . = . + 1;
>          . = ALIGN(POINTER_ALIGN);
>          __bss_end = .;
>      } :text
>
> If one of the options is fine then to be honest I am not sure that I
> understand why it is better than have 3 instructions which will be
> unnecessary when first bss variable will be introduced. And actually
> the same will be with item in bss, it will become unnecessary when
> something from bss will be introduced.
>
> I am OK with one of the mentioned above options but still would like
> to understand what are advantages.

A one-line delete in a C file deletion is most obviously-safe of the 3
options to be performed at some later date, when we've started
forgetting the specific details in this patch.

>> Also are this and ...
>>
>>> +clear_bss:
>>> +        REG_S   zero, (a3)
>>> +        add     a3, a3, RISCV_SZPTR
>>> +        blt     a3, a4, clear_bss
>> ... this branch actually the correct ones? I'd expect the unsigned
>> flavors to be used when comparing addresses. It may not matter here
>> and/or right now, but it'll set a bad precedent unless you expect
>> to only ever work on addresses which have the sign bit clear.
> I'll change blt to bltu.

This should indeed an unsigned compare.  It doesn't explode in practice
because paging is disabled and RISC-V's MAXPHYADDR is 56 bits so doesn't
set the sign bit.

~Andrew

