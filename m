Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D8746DE6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 11:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558210.872096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcaP-0004S9-AL; Tue, 04 Jul 2023 09:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558210.872096; Tue, 04 Jul 2023 09:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcaP-0004Ph-7M; Tue, 04 Jul 2023 09:44:41 +0000
Received: by outflank-mailman (input) for mailman id 558210;
 Tue, 04 Jul 2023 09:44:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bK4X=CW=citrix.com=prvs=5424eaebb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGcaM-0004PU-UB
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 09:44:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6344a856-1a4f-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 11:44:37 +0200 (CEST)
Received: from mail-bn8nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 05:44:35 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6064.namprd03.prod.outlook.com (2603:10b6:5:393::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 09:44:33 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 09:44:33 +0000
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
X-Inumbo-ID: 6344a856-1a4f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688463877;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0/Jl8PUvPYhpGd5cqwpfcRbUSXepwc56e8D1WmpqbhY=;
  b=K5TnTCmxUFbljTv6bQSm7UCH18lP4iWFfeUNNJ2sCk2Y7ShXnUzBEPnm
   BdtItXItBKVyXGIRJdqB+g+wGfcSRjaGRqvhkl3dXrR61/lid3PP/aStN
   is469kkSssthWOkPh4hhF5jaRL8QvO1t85uDG6gl7UyxzMQX42diMxaVM
   o=;
X-IronPort-RemoteIP: 104.47.74.49
X-IronPort-MID: 113809947
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/3t2AKNv0pnlmbTvrR2ClsFynXyQoLVcMsEvi/4bfWQNrUpx1jJSy
 WBMCzvTbK7YMGfxc9olbtyz/EhQscXcndFrSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5gBmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uN1LFF+r
 sMdEj4UcgCRisef2a+eRfY506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvzm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyn83r6ewXyTtIQ6LqX/6/pPu32qmG0vJRlLfwOh+Pi5sxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkouQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaGUENSkNSFNZ58G5+N1iyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:o7xVFKhaqH71vX1LzSOO+opdQnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:pf5WK2xVyXCq87QuchQABgURGO0VQibiyU3eOlOoG2tMYaSIbFCPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ASyruBQyLlHMPUgISPk16P6zmM/uaqJ62T10JtK4?=
 =?us-ascii?q?mgpeFCQF0Zh3Flm22QrZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="113809947"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAMnyv4yOAKgh4KuMmbPmEJahIqDnVDi/QIHBmGIg64cKiDBfFjunJmS8VpnGWjReYGM79QC6a+L4mMWvQ8zcqrYpkonaqsSoQIaZJYVwuFBRexU/5/DuLXkIhAQQQxDfYQjBR9N7jnIONqOVIJc3+ADti8UihKVobMwY5V3C7m8ZrSS0JS8RSxcYgmMXM3yEDmhuL+LIQlEs/VEPS41qgptMcCMkHT3uqgs+rxCiVEUOCyCqU5QhsF73vvQ4euxcF4mwRcedFJ7MfBSD5T0GSn/nlYHSqrXrqvpsYRr23AePTsXfGkwlRoWptq2K6rm7fKYbUiydOFsyjvlBvKVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/Jl8PUvPYhpGd5cqwpfcRbUSXepwc56e8D1WmpqbhY=;
 b=ThXUF6cRCzFeiT1cmoGxGBPyxZCHHAOw0os/xF7TLoI1wOOk6HVVqpIkYhmfj64Wqb6Q2RAY2P1ai/4a3zQVNHlTNElBnxerE4kObejyb+OzDlOdbfIOk8qC0Iq0CPHnfooI3JzggZZTwifewFYk4XGQZQNjEeodFoam0dUFm5PvZ6wVQiItuW2UPmSQ+jPdRGQBAHDh1pBnlP05XP8iRVYZd6ePtGnSZmcbsslHrcnm4rF0I+ezlROt2qx1rSDqmUUwv/HzqrF6uJskT+yZL4Z+G+EbsQYQRZIePmkBA14kkDzQptJSWLXcMmGCDBdAi1WHoQ4pEwFGCTztzodV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/Jl8PUvPYhpGd5cqwpfcRbUSXepwc56e8D1WmpqbhY=;
 b=f6MpxYyixuOZatTMKaxfuXONd+462EsTZaa06pV0SGRVrde+sLTxNoW/VVTO1FV2GF0+OH3xBeLe2qtrfnF5RfQCdFjl1RqH+A0W5j+dbW5+wxcK05tD9MlsSW36UWVLEldcCC2Pa3t5zELopUb7CFehGBeQo3jfJ33mIqwuAHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Jul 2023 11:44:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen: Correct comments after renaming
 xen_{dom,sys}ctl_cpu_policy fields
Message-ID: <ZKPp_JI4HwJ2VLxF@MacBook-Air-de-Roger.local>
References: <20230629102600.61262-1-andrew.cooper3@citrix.com>
 <20230704092909.3635899-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230704092909.3635899-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 15153357-4689-4d9b-96a4-08db7c73458e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZJNTSSIFYi9r4ebSjixuauS1yMDulJRd4ARJnpM8zrjt94gTGAxzpzbjI9593dMsgO/+BNw8GV/O0hIKOJnoKwKuF7xNaEs0lBpzZ3BCHXszuysZ80X24XDZwPOZQA4wSS9WOUDd+vhq9N+769qdvGbWl43snYQyq7mDKkAjGRdUuKRqeAyHlwmZmCPtzeAufcel9NqCUWOwfEHvtDxUu24QDbZoXB84rZuG1X8LVBP8yVcKSCQoIxUPzu6knHnu+n/bHb+WjlucrTfyv9/zM+dEDevBaa7ONt+fyXg8AQ5tP6nCKULc7VegsyEOwcak28KFhVH/TOP/uvAa4fZzPgDaEFEUR/MdFTzisifuKAHdHUiNE8TKu/5mvobez2ozf3Q6RZ2q4iD00nrwTFfPI2n+DlodnGrqwjUh5Q42tsrFhLNpnQbzxN1L61nP+ZVeTcLBd+1K1bCUNOMMJRxJ6vaTjpbuoJkQ2sJXQlYtkgtluj7Rc0IpXLkZyZR2wDBode2L7t0pmOTMZzHEk6nIWL5ivM9cpV/xRpUk9H2Hv/x+qwmeY8usZjtpxdk/oeY4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(2906002)(41300700001)(6862004)(5660300002)(8676002)(8936002)(558084003)(85182001)(86362001)(186003)(82960400001)(478600001)(26005)(6512007)(6506007)(6666004)(9686003)(6486002)(316002)(6636002)(4326008)(66476007)(66946007)(66556008)(54906003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU1nWldIZktUVUNCNzluNlZhcVUwMU9reHRoNmZlU3VneVY1QkNQK28rdEVG?=
 =?utf-8?B?N3J4KzJjQ3pWZERESC8rekVxY2I2YnFTSmdHL3ZCWUR0N0xSekdYQ1cwaWtN?=
 =?utf-8?B?Wi84SjlmdEdoY2dzcWxKamowVzBaY2NwRWdhNUpMZ3ZhdG1USG4yK2VLbEhH?=
 =?utf-8?B?VHNTQXZZeFFwQ3BLMG1sM1JKV0NhL1dFY2xtL05mT3VMeExKUllId1dPNVVQ?=
 =?utf-8?B?N1lUT0xXMjdkMVRUaDBCaC9nMzJVbXRYblIxdXMvTi9qNXRZMjZ0N1R4RUFT?=
 =?utf-8?B?RzZvZk1wdHZoMlZVNmRGZGpQczB5aTBRY3k3UTJWc1ROdzZTc3MwaFhXbmFS?=
 =?utf-8?B?SHdSWndjNjVZb0dQS3R0bmt2b2hHaEVmUHpKSC9hcVdYbFprWkpteVdtbXhF?=
 =?utf-8?B?Um1PekZLTG1jQU4yTHBYNDhqK3FHZGxHejQ3dU1mam9kSERocXNzT1lGdVQ3?=
 =?utf-8?B?bm0rMjZGS1JFYXFkMklaSDdYbjdQSzBmNFJZS1dEQmcvMUxaTXJ3eFYxcG8x?=
 =?utf-8?B?TmJDQWt5N3VncE9kOG5RUnpXWHhwZHNGQ01BQlFWMkc5aTFBSE9HcTEwVzFp?=
 =?utf-8?B?MkVtb1VkYnNEenkwa2s4ZFhGZW96US9ndU9xbFhyT3FGRnNEbitMcEZEeHNo?=
 =?utf-8?B?YUx6Zks2WGFuV1Fta25pWGw4RGh5TVVQWmpJSWpxczVIbVZrbXNGZ0VsLzd4?=
 =?utf-8?B?aS9lcjBYOEt2QndJWWhORzUzK0dwZ0VPRG11WFQ5dm55WWxIN3ppM0ZJdGJo?=
 =?utf-8?B?NGNYQXlPTDFPRllJVVlvWnVIZ2YzbDN0SCtqbUVlTVRzZnEzcU04dzVRc2Jl?=
 =?utf-8?B?T29pR0xDT3k5STQ5WUh5cDR0U0RRVHZTbCtucWltRC8wbS9NRVNDNnFBalp3?=
 =?utf-8?B?MlppL0pvZnJKbFVvNFMwRWtzYmZTRGFUOElCUkl3Vk1jN2lrQS96Q1JqdEYv?=
 =?utf-8?B?WGtkYUtJYTE5TDRPbXlRVzEvcEtITC8vVlRpTnRHOUhKTWE3NncrY0dDWXM1?=
 =?utf-8?B?TVpKSi9sNHJhN2ZqWXkvUFBrRm5vRWROSE9LMFhOTGZtUWY2VXhTdG1Gd0xh?=
 =?utf-8?B?Wmh4d1VxbmNoT1hzNWNMd2ZTZ1ZOK2tnNk1jc1Q4WnFKQkdESG9EdStEWnlJ?=
 =?utf-8?B?bTBubjNVYThGWnpRcDc1UDgybDRjcXkvUmxMcmNWMGNqNHZPcGdNSldNR2Mr?=
 =?utf-8?B?WUFTTlNuZ1RJdDRpbmZrZFBGY0lKd3J5NW84NTJhQVdXblBMN1NWOFZ4YWNZ?=
 =?utf-8?B?WWxSbDZ6MVI5TStFOU15bXVpOWRxbFhQV3IrK0NnLzUrOWxBTDdHeGIxY2tE?=
 =?utf-8?B?U0NaWkFVZmM2RVB0YzI0a2VrT2VBd2xLMHF4RHRVTXBxU2w5SEVPMFVRV2FX?=
 =?utf-8?B?ZXFuRFdEbmVlMGFBeW5WQU50RGY1aXhDVytVWmo5b2RCT1cyZGdKaG1wamha?=
 =?utf-8?B?TnRRUE1UQ1BTdmNKZFZVTndqbzV5NS9oK0RUNHdIZnV6bGNFNDcwNDhDSGI1?=
 =?utf-8?B?TzMxZjdPdVlvMkpaZkI2U0pJbFdNYnVIRnZ0bmlPNFF1Ky9XSmd0S1BwVkVu?=
 =?utf-8?B?aWVGTy9YMGRHWXV0clpoMGZEL2JpV1RtSmZlQXcvRW9qcDMyd3VmN0krVXhB?=
 =?utf-8?B?VStWMkJoOSsreXZYOTFVNWw2by9KTkdpNUFCbXlpZkVkZU1yejQ1V3R2RzM1?=
 =?utf-8?B?WGpjNHZsRm5QVVRITkxkR0RHR1BVQllMOHh3SFV2a0tpVDRBeUZBRkpTcThh?=
 =?utf-8?B?Uzl1MzBvWm1GOFFRYzcvK2FPMVhZd0RsUDNMMFZQdjcwQ1hqdnhhalFXWC9u?=
 =?utf-8?B?bDhqRDRrWXBFNU45cDB3ZmFWbVF6OGVBaXFqRUh6c0ZraXQ1cjZsZzF3Qnpr?=
 =?utf-8?B?aWZTOCs5N1pTM0x0bFJwVStoaHFrdk12bkFqUGhvdHR4cUVGYUhseUsrV3Bz?=
 =?utf-8?B?c29Pazcva1AwWmVQai9oVVFodzZQUGpFSU90aDhSakNnRUk1WU0remc3dDNi?=
 =?utf-8?B?U3JtUnE3WmR2bTIzQ0xlRi9XTkhianhYcWFyTXAzQkdvdW43aUxUbys0UUsw?=
 =?utf-8?B?cjBMWExqNVZrN1ZjVVNXVkZodkRhZkdjeWxFTjFSWU80RytzY1NyMGpCRG5w?=
 =?utf-8?Q?kBZDHi53dGUw2na1cYJzTtd0A?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g+1pVZcr+9DOxH7H0K6Ab8nuyJitSWN4LYs4IuCc3Wen1PUDKJKGuwvvUlFKl4JNLkhGvJRc28klcoeAXUDLZSota/J9F4AGSnGQd3/HqbnBtqKMdK8PHzla11OWCcT3jqH765dBWj5mTt43X6c78JsLSCOSfboL9wr7dDo2WTJU5JQ3/nGxdwqAsNMzEivGrRxWxQ48iL5aH0fgN76Jv2cBA7qSZ7gwBHiCdJk6iWKEO4EceKzJfDDcgExwO5N7caa92HI3yxSnzoN22royYV67sftFdsXSQl65Biz7gpItoe3X7o5vRyKvks3pndWIDrG3g2Bc/Gq72m4q8PbnOto+mi0sf+y1pSTca/kqqdkCUtJKhs54iYI9GuiGvhZi4eJy2iSJNEDnhAtujYFOQir7Vy6pGRlYErUGxfT1W2x0Fr5uFrRanrAN3FQ16rsGBhwemXQCGhAu4DYb56HYJak0YWxTcyawOZsp/tV3MPKrG7tPGz8bcgzz/BZKI8T3a/r0R0SI3S4d9GZKrgbg0oaCNflit7FXKPa/TQ13iqBkjmErMF6CheanM14f6pV2ZUEmXz20GXokMLg44Em5202Qs7NaGrjGXhptsy/WKlZVq7WesJfJPvwIuk/9kbTAbswvUk8nmoOQqTmavaCXQF+Q6R7GgJzprg/O+DQuMfRNrDBWxEkc9UrL89Xs/YFEIrsu4VlpmkSwfgcANlM5sFZznbJc7zuZy4Q3dU/BqpZLbPAb+Nqkpv5C73b2hdhJXbl+fvVQudYFWOt+9WcBcfZxhpTInIqUHyEPbTYUrPLqFvr/rBw408WB/0FZ3yvj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15153357-4689-4d9b-96a4-08db7c73458e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 09:44:33.4628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7/xoWfvKUgF1s1aD42TFOV4z3hl7d/HJu0vYteuQoWj1wPm4zYYgQiwapnOmEVIWFzbuGi2pnkj2fKZzJ7YpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6064

On Tue, Jul 04, 2023 at 10:29:09AM +0100, Andrew Cooper wrote:
> Fixes: 21e3ef57e040 ("x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr}_policy fields")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

