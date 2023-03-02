Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE85E6A88C8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 19:59:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505381.778125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXo8G-0006lR-51; Thu, 02 Mar 2023 18:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505381.778125; Thu, 02 Mar 2023 18:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXo8G-0006ib-1s; Thu, 02 Mar 2023 18:58:24 +0000
Received: by outflank-mailman (input) for mailman id 505381;
 Thu, 02 Mar 2023 18:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aytp=62=citrix.com=prvs=418692924=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pXo8E-0006iF-Ji
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 18:58:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3055d2a5-b92c-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 19:58:18 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Mar 2023 13:58:13 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6704.namprd03.prod.outlook.com (2603:10b6:806:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 18:58:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 18:58:11 +0000
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
X-Inumbo-ID: 3055d2a5-b92c-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677783498;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zhg9qvCaYw5fSwemMgY4FTqVfz7rQg+fYSP/VY2hdHA=;
  b=P2fZuIVvZ2OvNuSPlSR5jig+WWnnOHj+bbIu5qhjxhp36jLPzX64c3zM
   68SNj4HWEZJ5mjOT1uQOSRvDtAmhc4pp0xMUv4IFWIw3OddOpkEKhma3v
   EC2MfmCBDf66+EbaFvMPfjV6uKqTLhPCSw99yg9hpH0ZfR8EbAnFBYFGl
   A=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 99234539
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3XVRuav2iYAJ1AFOMBbp7un5LefnVONfMUV32f8akzHdYApBsoF/q
 tZmKT/VO67eYGTyfN8naN/g8ksE6p+AmNdrTFY++ChgQX8b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASGzSFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEBI8KTGIqdyM5+yyTNJK15x/MNfVM9ZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60boq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzprKU23QbCroAVIEMZX2qbueG2sQ2ZZ4l/b
 HVX5y8f/bdnoSRHSfG4BXVUukWsuRoRWMFREqs59RuKwarX5C6WA2EFSnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqZyUJUA8E6NnLu5wog1TESdMLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1V/GijSou5PAZhQ0+ALMX2SuqAh+YeaNbYui40nW9vZEIYOQSHGOu
 XEFn46V6+VmJZiJlTeRSeQXWr+z7vCOMSb0nlJkWZIm8lyF8Hmle4dS7DhgJVxBPcMNeDuva
 0jW0T69/7dWNXquKKVxM4S4Dp1wybC6TIq1EPfJctBJf559Mhed+z1jblKR2Garl1UwlaY4O
 tGQdsPE4WsmNJmLBQGeH481uYLHDAhnrY8PbfgXFyia7Ic=
IronPort-HdrOrdr: A9a23:pxxpOanZPvX2gTzcq74M3ztJDgTpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="99234539"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckkloGwEDh2enSjSRyzpaDjAr/D6oNEOYC0Kj0L+URrdt74aaSuOOzZ5NVoOSebuenDr9kAGpwSf0q9p3lnO/s7vl10166z7vt3spSKfqAcNl4YQhBP6uF0NlwxvS0rkbIo7awmlc3rFVm/qudSd5UVZsvXwAN4o1HWIPlWwIqhPAR30ZEQ5IM+I72+mRDZdDt+os7x9NJl3VAkoZtO+2LRbOY4YpjHDmqNc0Y29sOfAhuzpMzBb+GdLqYEuK80/cDgE5571gehcVPO2xL5DWS4FKQANvO3Jk4JqClcAcSqN1R5NK58CYwf91u18UL1TPm3U2LpH3RQxDzJlhCIu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhg9qvCaYw5fSwemMgY4FTqVfz7rQg+fYSP/VY2hdHA=;
 b=HbZhzXtS1RZYWUgwGzKYj3KHeAKdxikmZ3HalVVN4gKGMT5YMwNkhzI4uFfSI1Tvgjb0JbsXYYSLXiM/x3mrjle6c3/P3c/9+kj7tHFlELja5px0q6itygELpWMJPc1tAFfaVDpPv4LVV4J9pNy+thTe8sI0eR4IFaHTIM9TjFvEXoIab8Td4b5HH/dY9+C64P8/TZAokNuhHOMzkrjdT6VxGzZkrdpWq0dwmqI1U0hEDcuNGf+4BPB9mWV2XSUHTEEjcO7N7PMl1EfzvB5aeg2+z5DLMoPgg1PjxjW07e8K/1aDoOc3Zxcg3bplxFFHMv914HUVh4XCd37OY2TBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhg9qvCaYw5fSwemMgY4FTqVfz7rQg+fYSP/VY2hdHA=;
 b=ZxzarVZt3CQEjHo77Fbw/zu7YOpKsEeV9B7ZNarsf1cqyL68ehtFe174CU0Yus2dIC7qR9DkdMhVXMAyNb7uKajNxTWQPmXs5X3SQDjDolXrCCHXDvjXjA7VX0kT7vOIKbsQUlqN/OILJy+5Hqb/LFiwAvkZ2Mwgi9LUJddkxgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <24941ed0-56c6-167b-b101-ad1e1c06d907@citrix.com>
Date: Thu, 2 Mar 2023 18:58:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: read/save hart_id and dtb_base passed
 by bootloader
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
 <3edbb40e86e480b2b71d596ff61c05336004b14c.1677762812.git.oleksii.kurochko@gmail.com>
 <881fd332-91c1-fea2-d1a2-3a5444a6f272@citrix.com>
 <f0d1e5b78482639a25f1ef0cf878309344383e7e.camel@gmail.com>
In-Reply-To: <f0d1e5b78482639a25f1ef0cf878309344383e7e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0661.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN4PR03MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: e91fb276-c080-4df3-320c-08db1b50118c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zlFKyyonFybStrrG4GP8smI98SJ7rOkQXcfXwmCPT9rhhLE/TvHIk0DCqBcfCMTPNhMQcNzNaFVa9sAqFQFhy8yrg6E60MEpEeIdEYGV79/+mDyish0ykYhO1zRzfaCYl5PkvqoPpamw33mMKSKU05p4gIvnyVm2JNIhio5IeYVBgbe5fms7VpDgWrp/5azoi5JTbVJHkgYWwe6D7hWLYaQQ+I7PTdBGRbTUbzjTfExddIBBYY26quMdCDbcRUKTkmxZZ9nIbbVZGv0gNr5LYZB+FZPUyEjCgndVGQw36KB35xA70B3uwU6JIzzon/kGkE61jou1qMt0qJsAJWOLpkt7lO+gYZsBfR2rmVW/BbZRrrMW5a1lXRHw+2qkMLo8ZltgN5R1b808cSNP4PJSXn5V2jqMhhRgMPktSSZtBiAOfRT4jGsqqNMGFiB3XlEqr/3lilCN804D1yovcpt366J9NRUt6T3hwscrBb5M3Jp1VUV/l2Lywrdtbx1lzLdRQJcqZh1uSF75ULRH16/hgN3xhYBPJ47VfFZfzJAlA7Mt5BfOF/VJU0/ImwWXs6iIOsS1gGxmN5Px9pKFKZsBLVQ0q5e11pSEL8iokEuyQbKCeck7YEqm1sfyHIfkdTwyxj3BSiik43R+Xsttvy2tuEDF6WfPv+ZRU1BN7S3NmVz7rTkklB5XbLPeche4Cpy1H0Ym6pqaVM0lm+GPzb58lsUwopfdsGY3eX+912/gFuM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199018)(8936002)(186003)(5660300002)(2616005)(53546011)(26005)(6512007)(6506007)(41300700001)(6666004)(31696002)(86362001)(2906002)(4326008)(82960400001)(6486002)(66946007)(8676002)(66476007)(966005)(66556008)(31686004)(316002)(36756003)(38100700002)(54906003)(478600001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG9MRHJjdTNETjhiZFo0eXZLZlA1VDhBbEIvRkcyZXJ0blhrNDBCMncydHJn?=
 =?utf-8?B?SnZhNk02VkF4a09LQXZwZFVDRVNsbkR1V3h1VGNLcGJXbXRTalkweHlMeWxL?=
 =?utf-8?B?cHJ6SnNTYllqcnFPZmdrRGQ3RTg0bVp5T0hsMElhU0F2NGpJbHJXSE9kZzk3?=
 =?utf-8?B?WjhLZCtUZUpCWEdxZWpNL0xSc0tmeHR2VEN3Qm4yVVcrTFI0RUV3Y1pwMzdJ?=
 =?utf-8?B?a09TWEpXMnVyTjhwc1h5QWpDZzFUZlhJK09DR0ZPa0wxYnBmNlJ4MUVLVytJ?=
 =?utf-8?B?NkpvWndFelFjVjg5OTJjYk5GZjdlM0djcVhlcENCUDhNaE9VYTFjcnN6ZDBB?=
 =?utf-8?B?UTBiZEVoMGxIQktiWksvWEJhRWRRZmxiSmViM1Q4K2FOakE3SHFtWmpHVW1W?=
 =?utf-8?B?aUcyeS9lSnd4RzAvUmloalg1TEtyZHllSmxWRTU0aFYvbGFrRUQwNmQ5emt4?=
 =?utf-8?B?UHo4OTJ3ZCs1bXNaanFkZTNCdlhOeG9yK25jclBLZUNacGI1OWx1M3VZRUlD?=
 =?utf-8?B?cXlSdlNHd1dQS2ZvOElFaHBFZUZhSXVsUHFpMEN3d2V3SDJUMWU3dGxDWUxu?=
 =?utf-8?B?LzhGeEV0NTBnZW5lRVpndjZhSnNWVTBQMG5CWDdJUllOVU9KWHdBaGtDeGZv?=
 =?utf-8?B?dy9oc0xVd2pSUWtzamVZUFVlVk9vbm1iNm1kcmNtc1dyUDJoSS9aR0ROODc1?=
 =?utf-8?B?V2ZwTS96ZUZxM3V3R0IrMU0vTldhbUFHYWRUdzRTUFZCTGxvLzB5LzFIMFNo?=
 =?utf-8?B?V2hTd3J5OU9yMlZGOFNyZ3hzS0JWQy9YbEpkdzYrdlhpRlIzWXFoM2Nja0JC?=
 =?utf-8?B?S2xHdGJHSWJLWVF3RzVPSWdTaXZRaG1XZXM0bEdlVCtabGlxd29NdmhZUGxz?=
 =?utf-8?B?a1NKOVF3LzVNTk9ZVDNNVEFsQVRVMkVWcU9ZZjI2dzA2SWVCakNwWFhwYi9k?=
 =?utf-8?B?cDhnQ2cyaGZPVWh3KzBhQ3pXWTJSRStxbHdFeGJYa2VjaDJydFM2S245Yy9H?=
 =?utf-8?B?WmcwdXhRYjhTSU10SktGUFM0cHZpNklNWG5XbUlEc1FPYXpvbkFEVmVBWGpV?=
 =?utf-8?B?Zm5wNlA2YTBiTnpzVFRSNkZvNTZNdXozK2YxWERHSEtyWUgrN25zNW5tWnhI?=
 =?utf-8?B?RXU0YTlPaGFJajVJcDFrUndYZlZPaSsyVGM2a2k4OFMrN01sWGF2RTEzZ0Ji?=
 =?utf-8?B?U3lBN3llUUhITmtNU1hkL1pHQUVGWWRWanNvYVZXTEVTc1RnRXhGdEZBQlA2?=
 =?utf-8?B?MW8vWWFsWlBWK0JwcTlpY0wxVTFmMFJEd2U0akNvbk1weG5BQXd6bG5zYzZI?=
 =?utf-8?B?TDJXMDhGTy9kZi9WM01JU1ZkdlVVd0pDQmlmREIzc0NDcWw3VGtRRWdqRUx0?=
 =?utf-8?B?VnRVSGpuS3N6Sk9uSFo0SDJQeFI5R1NVTFdScENwR0wwK3B5TmU5c2RTUTFy?=
 =?utf-8?B?ZVhRcGtIT0FxdWZTaVcveUMybEp6OGlqbnNYV01RbWxoYlh5ZjZseUZhQzZM?=
 =?utf-8?B?WmZ0MjhtU081aWJWeEpYT2J0b2RYa1JVY2p2eVFFUkJyWHovL3luU3hERENz?=
 =?utf-8?B?U3ZKVTgyMmJobjhSbVRWbTBRV0hNV2ZmQVQyQmgzdTQ3OGpqcmIvUG9NT3JX?=
 =?utf-8?B?c1doN2orS3JyYmJmSzZ6KzRZNWtvU0NQUEF1c3BrcHBQYUpiSEwzNnpKdDJM?=
 =?utf-8?B?dWUvWGVmSE5qaHNKZ0JzZXlZR25pNnB6Nll6RFdFVDFIY2pFQ3dQZ0FSSzAv?=
 =?utf-8?B?QVZ6YkYwOWR0SWIyc2N3Tk9nZEpBeEx1OE5wWE16YnNaVW1OYUNGQktjT1VG?=
 =?utf-8?B?T295dzM0OEIyK29LcHJraEROMlBvVFl1OWNlVkQvb0c0QU9GZmVnSExKVFVi?=
 =?utf-8?B?YnA5UnVRcnY0b3cxVmR3dzVZSUhxOTRieWl6aHlVakJaZHpkZUM5TTByTFlz?=
 =?utf-8?B?NHZmSU5WSWIrbXFvcHFWUGRmL2dYaUovb0duTTUrNE51THkvRTU1U2dIT2gv?=
 =?utf-8?B?WE5SZkJRUEg1cVUxbHJQTGtRNHovZXdSUU04ckg4TnN3WFZoOE14TmdTTUwz?=
 =?utf-8?B?UUR3alVzbFg2dE93Q0FRaTNZdFp4S2hxY2pYYmw0dzRqalhZSGpET3dzK2dl?=
 =?utf-8?B?WVRvQ3RVOU5CME1xVXJvNmdYUGlYc0RaUlN3bVlCZ1NCczY3TkFBRDlwR3Yr?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E7c3c00LhmgfZenaUADQRr1VYCH+5iJVh7I60pjT0Z4+1r9c1L23+VesFvL4EdK+D5fHiHVG/MoqjZlYMZxmvB14w9ARbhoULWq7W8prvk7pE2WrLfEiohvSo57dWW2k1UxBMdO4bYhSrAgC63R8dSYI+BJ9YNJ6i8dRBJVxGCrsavbewYxn41KDnKpthnBqM6MmSKNdv+IB5IWPH6DChECQyOCj8fc63VbtJPmvW7kMW1n1+OBJoA0ULaRqRwGDotPTBwbXlbzbqiT+YuLkpgxKvVkDLQ9Pmutys+8W/SH/wVMOt8grkfjSWhst7CAzmspzOfBCRY/z1lA77nS6ugLQqpPpdck6OUfvbrn0q9/2A4+tqU9BIBC0dzx/zsRQ93wliSy3uQpEXtS582MzBiER7U24M2RckTVqJB6GUxqxVgoxADaIMnQiCI3c42VtiNpEspbkS4V2pglruxj3P+xJBbZs69uZLUz1Mw06RJIb4ABDLwfbBWA/LNryMJGhXiFs8jaT284ogsMkcDdCgYvPA3SUShDMnJpaqBb9DOuWnl27Gr8dfRL3v8+LDJkxJAHyZJF33Fks6T/g5xGkDEYJ5FBaP8wqOMlv6psv+X707ii+5vi2LU7RXGQwM5sNdG2qaSn+RJyw+6ajnefCJuNMoSE9bIwUGN6bZvhjiGmbl/0l/h7dRlbibh8YanhXF96plGQfca+JxykVlwLGKNMp7ahdmr0jsGdBmQeL4Zbkud5E8em6Hdp2TmkTVr8DfpHK2TadEeLsIcJOAqInDHAKQUipO0zOgaT8jR4diD4/DR9Aqq7isq3Y6BFLjSOsapeCib1Sz65kfaj4lcHQljjNVtgNOvxViJyaDafQUV6bCGJgcybMiZlki98FjU8cXjkggxx2GLmGsLBfJtqd/pKEH4cebzaR9jbVa5CfnfU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91fb276-c080-4df3-320c-08db1b50118c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 18:58:11.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWp34iSszkhS1lvHDoLUGBsOZMGJOLyQ24YR8gsyivLkpun7d41G/i4NA5dHc8BSqxmzSTEfC+I8oa+R5/FpbeVw2YKzAHs3lJu9LsdpjKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6704

On 02/03/2023 2:53 pm, Oleksii wrote:
> On Thu, 2023-03-02 at 14:02 +0000, Andrew Cooper wrote:
>> On 02/03/2023 1:23 pm, Oleksii Kurochko wrote:
>>> +
>>> +        /*
>>> +         * DTB base is passed by a bootloader
>>> +         */
>>> +_dtb_base:
>>> +        RISCV_PTR 0x0
>>> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
>>> index 1c87899e8e..d9723fe1c0 100644
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -7,7 +7,8 @@
>>>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>>>      __aligned(STACK_SIZE);
>>>  
>>> -void __init noreturn start_xen(void)
>>> +void __init noreturn start_xen(unsigned long bootcpu_id,
>>> +                               unsigned long dtb_base)
>> To be clear, this change should be this hunk exactly as it is, and a
>> comment immediately ahead of ENTRY(start) describing the entry ABI.
>>
>> There is no need currently to change any of the asm code.
> I think that I'll use s2 and s3 to save bootcpu_id.
>
> But I am unsure I understand why the asm code shouldn't be changed.

Because nothing in the asm code (right now) touches any of the a registers.

Therefore the parameters that OpenSBI prepared for start() (i.e. a0 and
a1 here) are still correct for start_xen().

If, and only if, we need to modify a* for other reasons in start() do we
need to preserve their values somehow.

> If I understand you correctly I can write in a comment ahead of
> ENTRY(start) that a0, and a1 are reserved for hart_id and dtb_base
> which are passed from a bootloader but it will work only if start_xen
> will be only C function called from head.S.

Not quite.  You want a comment explaining what the OpenSBI -> start()
ABI is.  So people know what a0/etc is at ENTRY(start).

Here is an example from a different project:
https://github.com/TrenchBoot/secure-kernel-loader/blob/master/head.S#L52-L68


There is no need to do unnecessary work (i.e. preserving them right
now), until you find a reason to need to spill them.  Right now, there's
not need, and this isn't obviously going to change in the short term.

~Andrew

