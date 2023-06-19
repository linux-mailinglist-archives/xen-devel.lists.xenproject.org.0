Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C66C735BEE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 18:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551208.860622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHPR-0002iI-By; Mon, 19 Jun 2023 16:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551208.860622; Mon, 19 Jun 2023 16:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHPR-0002fl-7s; Mon, 19 Jun 2023 16:07:17 +0000
Received: by outflank-mailman (input) for mailman id 551208;
 Mon, 19 Jun 2023 16:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FHF=CH=citrix.com=prvs=5274193ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBHPP-0002fH-Sl
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 16:07:15 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a1d81d6-0ebb-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 18:07:14 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2023 12:07:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4961.namprd03.prod.outlook.com (2603:10b6:408:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Mon, 19 Jun
 2023 16:07:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 16:07:02 +0000
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
X-Inumbo-ID: 5a1d81d6-0ebb-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687190834;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ajcwVnQ5lgcwkLNc400P1s/UYyHVvXVzXtg7OuScuCc=;
  b=WG8Ov5EUDgygLc/qrJScH9ANii9do/Ds2lof9A/PK5gWLv+u3EjaJUV3
   jXnzsuCfm18LHye3PbE8OcAXgH8OK3CBPGukKulbVhnpieup5G/+yW5w0
   Z1ddFoxJv2qbA2v34ouNrXBsBxE/6/cQ5bUw1HGe4GBfEUz5P3EzE9TYU
   A=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 112676262
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EKnKsqpQUvulci/Ue7XSmScPkRNeBmLYZBIvgKrLsJaIsI4StFCzt
 garIBmDa62KZWujfNB3OdyzoUMFvZ7Wz9BmQQBrrSxmQikWo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzihNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABUGVS+61u+4/L74cOZhgeAda9vNOIxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6Q03wPJmDZ75Bs+DEeduPOilQ2CWs96N
 EMfyHcnlbMf+xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsRzpMatUguNUxAyIj0
 luEndTBDjhorbHTQnWYnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdpsLxMSH9x
 XaNtidWulkIpcsC1qH+91aXhTup/8HNVlRsuFSRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGa0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:huupeqCW804ZkxTlHelw55DYdb4zR+YMi2TDtnoBMiC9F/byqy
 nAppomPHPP5Qr5G0tQ/OxoQZPgfZqEz/5ICOoqTNWftWvdyROVxehZhOOJ/9SHIVyGygc378
 hdmsZFZOEYQmIK6foSTTPIdOoI0Z2syojtr+Hb1nJsRQZhZ+Vb6RtjAArzKDwUeOADP+teKK
 ah
X-Talos-CUID: 9a23:bPgnR24vHMr9+pMfQdss0UUvJfl0f3PhwDTqLEK/LVguWpuRRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A/ePcSQ2xEMebneCAPNa8qixF2zUjuriIEUoWjtY?=
 =?us-ascii?q?6utShKiN7CWqUtC+aTdpy?=
X-IronPort-AV: E=Sophos;i="6.00,255,1681185600"; 
   d="scan'208";a="112676262"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShGRoy6VOifmP27l3VCHoteAvHXP9biN1zoTz4Zpq0noV9I32qlB+qKw7l7caBPnEwVT8OUBTieqr+VW+1VUj8otN/ysimrzdDvD1njnZ/OItDWneqn6njcP9ddmiL8I3BDZMbmluu+71Vcnd6FDLG5Xgc1deV7UQ/hmtGE0Cm5zM09i+GmedRlzFKeg1GSXkvl9LVxWie9wtatfsG31yW//uuMW+srZkrc0lIVG8wcTQkCWLP+F1aFTqDijeyHsJRdJvRjXhYBc+QLcsd56BdKKf27NI5xiADAX5vxE8YUmco5ccmZ04wskPV2a+CsliGRkM9Dx0XrX7CtK2phwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuzXPe97cw2GP+PCxb967iqM4Ypf4zMFKP084H8mjPA=;
 b=f8AC6AkLvVpcPtDCQjYfRUe6mq9yuIKVuxsoxzENOVlpwI5A9Dswddds4g+lTF8eaqso5odoB86inrw7aLVGF4emKRZRbJw2M2+vC7+3iRVe2IgNBkzgMTtyDFeV/Vw5B3fTi0M/CplKhfXWz7SkACm5jTzLAdMIJHmLPgkUfvYdUFocA3XFuP47cUoPHEPRMKY0kP3zmJ9H9B8BXGDVy7sDDCfrCh3iNw7GimXjmFei6CbdQwp6aIP5xD+6i7WZhl6OnlFg5kl7HjUt5l4cfj6gx2s5CjULmdhFYRG4Ql44rWykdoQlr9vAWSKvbDpOR+qqEYuDxf70V2m/hTLxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuzXPe97cw2GP+PCxb967iqM4Ypf4zMFKP084H8mjPA=;
 b=fJ4EktFR+wu/hOHslnGqnfsQQ+cUwmOJ1FXnBHTlzvEvMPNlV9a7KIrSHRwJZKQIpEbeGkaHXm0ZQTtVoDUiqYzjo8yqRd6hmJIoq6tPtAJIdciQ1p4VcLCfJ9UJp7H52wKseN0TRFK0tUQNtUyKpvJCT7+OniAl6/PEP5XW0rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <867ebb90-2bd4-7500-d6db-0af08efff88c@citrix.com>
Date: Mon, 19 Jun 2023 17:06:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/5] x86/microcode: Allow reading microcode revision
 even if it can't be updated
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-2-alejandro.vallejo@cloud.com>
 <b3543c89-9df5-53dd-2b11-aff83211187f@citrix.com>
 <3a92fbe8-a9b4-f671-7895-c4d8065b61ed@suse.com>
In-Reply-To: <3a92fbe8-a9b4-f671-7895-c4d8065b61ed@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f45431b-e1f8-460a-7958-08db70df3805
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j7/JIN/8x3djFVE5Th/RlmFJ9qw3Hn/2MVd7WxsOhG4mwK94cDJNat16BYf9512xo8pydVf/9Z68L23YOxvG1k360d7Gs9O3nkZ7YkCJ+opVK9o0plnl/a3pjgxjNNtRLhKk7bG56MSUSE35z4DBMhr2kaYScJ2bS4go2QFCmfaKZqIT94QECljRTh5UXzKv8WgK8lrIkpQHU4rIcACC+9CjcPVVEnNoVmJeP8XkXJaYiG8pjiD6ojyBy5/I4eKG9BKs8dy7Vopd1rXhlx21VlSC0Rrf+Ou/rOc/ei0VOWLzM6dQMkdQrDIlzv/L4oMWa5F0T8cDzfXW9Pfo5AWKRnxRbgiP5qmp1QaGzS8k+lfn7GtoHLkswK068hJdTVPkzNq+Dv0b+WMU+B5xEa3OkZZrhf4rGqYmDr1xq6j86FPShIOooVJiBRwG51Yq9kX+Yp5dgEL2KbqZiK2m2Aq9Jvkw8J8qC0Sjj7wbUPFNjnXRL6hvlZ4ha8q4e0UMn1OFm54gpyWvneUAJR4xesJOgdrwAFM/LCWoQY7tIg0IOLeVxEmcuedBJCmh13KKnjtJedYIJirDyWqbZR9DA3+5gi16eqT3DxWmd3XP2aXfuenvHCMkBod6BP2KYGDVDznujf6bUSRc40qFMG3tOzJCIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(478600001)(4326008)(54906003)(110136005)(6512007)(26005)(186003)(36756003)(6506007)(53546011)(6486002)(6666004)(2906002)(8676002)(8936002)(41300700001)(66946007)(66556008)(66476007)(316002)(5660300002)(31696002)(86362001)(83380400001)(38100700002)(31686004)(82960400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bklqd3V0N0l4a1p4QnhuRGJFK09uYzRoZSszeDI3YWl2ZXpOeUFyL3liQ2xE?=
 =?utf-8?B?YytwOXRZU2xweFBvWC9Ed3B4OHl2b2VuNWZtMzc5QnBKMVRWdm1IQXcySGdF?=
 =?utf-8?B?R0VzcWV0L1VHcE1Sd0lXWU9hQ3EwZmlUR0xvMFFUMmJNSElrMHQ1NUFUL2tG?=
 =?utf-8?B?RXVwNDdzTmg5RnFHaWhjdTlQcVk2bzNtUzEzcStPc1QzMkFTUm01bThSVmtT?=
 =?utf-8?B?aTJOcVowZHN6Y0wvZWl2cHRXbzRPRDJVYjBreTU0N3pRVm5yZTZrMlRZTytu?=
 =?utf-8?B?Wm1sNitTZGpuWEQzaVZuZFpsc0lkaVZnWFZtMkJGWlpkMURmZTZnM0dBS3lJ?=
 =?utf-8?B?RVJrVU02U3FVNWJxczZMYk1XZlZ1dVFRWUJaTGN5a0M2OE03Tzl5eTlNKzBo?=
 =?utf-8?B?M0k2a2krdHJyM21HTVBFSUxmb3IvbUw1ZlNVNjhJSGpaWlNaaHF1VTdYMC82?=
 =?utf-8?B?N2dBNGRWQjQvb3RTckwvMW9mR21FMW5JcEZqMWJXNVZPdXB4c3JXakRnNko2?=
 =?utf-8?B?MHR3dXd6TmlWeXF4Tmxzb24xd3pFcnZINHh6aFl1ZnUvdDZSY3NHcjZ1Y1RV?=
 =?utf-8?B?YmRXNjhKZlNEeWZqbHlTTUMyTE9zZFlpWUplS3o4dkduNk5VMTBDVDJkeDJt?=
 =?utf-8?B?Rit5Zm5qcm9ta092elJxYkNyRlNrQXp6aGxjNmZWalF6ZHhNaXIzcmNoM0c0?=
 =?utf-8?B?SUxOUjZLS3luZG1QaWFMT3E4WVQ1bkY4NXl2eEhpWTAwSnNudVNEV21STEZ3?=
 =?utf-8?B?NGxwU3ZZeXZ4bExSYzFGdWcrY1VQUXIvQzB5OElKQitBRGFWL3hqTnVlcTJi?=
 =?utf-8?B?OFZ2OFdLZ2Y0R290ZGZHYm1lanNUWFhmYVFlUUhvRHFmWXVDclVPejlZcEwx?=
 =?utf-8?B?MGlyK01xWWFOUDE3eWZuNG9ocitTdU15WVZVdmYyQ1B3L1JMMnBlekg3WjlF?=
 =?utf-8?B?Q2dCOXFVUzFFU2ZXWjVuQkJvMkVEWkNNaVBqMnhaWWZZUy8zYnl3UVJ1SHE2?=
 =?utf-8?B?N3N6QkdkS3RDeVBPSGYvcUNCbm5Iam9zaUZocEovNXp4dzhEbHVBbnNwRXIz?=
 =?utf-8?B?Q1FDbUV3Slc3cVBGT0RyM0VqRjZaOElxTlFQdFFPSE1MZVJ0ZWpLTUkrSlF5?=
 =?utf-8?B?QlV6RWVOR3pQdy9pOHRZcUROdDl5b0dKRk9NZXZqd0Y0M3Z4ZW9oSkgvUVRy?=
 =?utf-8?B?T01kbjZXcVhxRjhacU9wNUNFaXZnY0RhYTBjUzRHWXFPYTNVSjgvc1RHVlBP?=
 =?utf-8?B?ekdVelk0MHhXUFJENHVGQTcvdWttMjkyUjhDNVY4SWpVV09UaXBoQ3RPWW91?=
 =?utf-8?B?Rmh6VmtnbVBqSlBtTmJFRDloZFdXWUtLeFErQkdRUnY4YUxGSU13ZjRTMjRv?=
 =?utf-8?B?OUhBUWFqOEpoa1hHRFZqY0tjaFpGMnNiSERjN1plQi8wRW9qeFV0TGp0amY5?=
 =?utf-8?B?bHlJaHFlc1NrMXd1Rk40WnRZMTl5dTliODRtWGxFV2k4a2VJZ1NNa2VFSTZY?=
 =?utf-8?B?Yi9ySms4aGVwZzUwdHQ3ZGVOSGhYSkJqM0daRWhiUDhZeXVHbS9VYVgzTkcz?=
 =?utf-8?B?aE1lYWdnellrSDBtdWdSdCtQdkduR21oajczWm1TYXB3RXRWTllnRnYrU0Rr?=
 =?utf-8?B?WmNXZUVnQVNIOWY4eTIzM2lLQ09YeExyYnQ3KzJibTN3SFEvaFBHQUVnNW1V?=
 =?utf-8?B?aWxmaFJZMnhhVlhsajBRT0Q0VzlqMHR2T09Dd25ubXdibjhGeHUxTWJnRllF?=
 =?utf-8?B?VUNzZDhybmlGbDhEL0dQSk1GMWYzMGp0aEFiN0gxRDE4SGdoVlZKbjRMVmY5?=
 =?utf-8?B?WUxkQStCZnVOMHZYS2pUVVFrSUtKZmhqTEU5OWd2cjAyZ090MXZGd1JIT1V6?=
 =?utf-8?B?dDdCcnk1OTNCWGtpbHlpKzBHRmptMmtjdCs4cURLVVRYZjlpN3NVZGRBRFph?=
 =?utf-8?B?YkxsZzkwTHFiOWt5WDRWTS9qc2g2bk1WUmVuMmRuYm1MZ25HRFZyd1RQUXpY?=
 =?utf-8?B?S1ZMTnVzNkc0SWdpaVFVdmp1MUZURjJHL0hPVENmRWh1azgxbnlzZzcwalFO?=
 =?utf-8?B?YkpwQXFaUDhhTXRseGc0RGFGZGlaRUhjdUJaUktPNzJZVldGdjRydHQvSk9i?=
 =?utf-8?B?dUk0bjJvbUZWS1B6RkNCZEtXS1FtV2pibUtyR3A0MnNHQ1FnbWJ5SFEwdW8r?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gflUXx+BptCM+013NWbhsUecAsw7lO+YfGF9ps/KdN8E3LHqhKA0GqmFuXng6UhIS3tXy0HCnml7dfYq+daBiIvlvFog5viVsjF7f3og/1x2Uh3ibY8E16TV9vIlh/LYgRz3XgFUKoFOCgLk1w2hHpXBhKAVSyLPX052NqBD51p9grwUMX0a9blWyIl94aR6xUgNAS0wfhTfDFUako7Nv8BtMID3IUknqUwGTAfvxNnb93JhsUPq0nBeSuFlfe8VAnI7XodTYjvXJRiUhcaN486VavvNtsLoBoxXUXI1DNXO++4msBHHCIvk3gX7lkpyrsQurhPkI1GZ5kApY/NeI6GA3w8/zRBSeKcNaPebD0MOUNOgKVMDK7cA/OKgLV9ML9Mb3T1YKVTJxmwKBPG8ceE8G8VhtBk5lh5yMLM9+CDEQNsGSCRk7/x3068YtV0pSAKfThmp87PyVfnhR8VBUPm4n0TtwLXUS/XrWxu+rLFacDYHqF/Ew2qCD++VwRoME3ONiVeI7EB8MMeO14UgpmweEJtnRvl3uso5ThUrkcaFLKTCb/YSNuQobF90wntmngSs27hzEZ5RQpbowF6fcoKlDIEakx6O6MH4hj3xfO+PaAff75Qxb+Y4lPALIlHiEbzsJ6K+b+f3m7SPlkB5AENQIBgV6//xmePA4e8YWajqqI7kpUtdjrnm0htIR3oKv8NphUSWZmtx9nLbLCRaf7gUy4WqnR2KxZ9Cdnfpi2Y6N5nxAxf85qj9AC5IJ/wuqf0XG8JmkbK2MZauBb8Qd44C1FwjM0i+jvNV5aMbPgrLQ+YJBidR7R0bLyAVygSOaVXWkRGjreiIVwQdhVG+aOp4ee2hOSekuXxYl7VdzNA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f45431b-e1f8-460a-7958-08db70df3805
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 16:07:02.5805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk4DOiu5xcgfHVXMPNLTNDuS6q16UkhcBZiGUCwCmN7iT2XIcaX46v81Vc1waY035EMudAyEWi1i8uV8QrOFdvKZvxFi/hU0IUb224WhkMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4961

On 19/06/2023 4:58 pm, Jan Beulich wrote:
> On 19.06.2023 17:49, Andrew Cooper wrote:
>> On 15/06/2023 4:48 pm, Alejandro Vallejo wrote:
>>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>>> index e65af4b82e..df7e1df870 100644
>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>> @@ -750,11 +750,12 @@ __initcall(microcode_init);
>>> @@ -860,6 +861,9 @@ int __init early_microcode_init(unsigned long *module_map,
>>>          break;
>>>      }
>>>  
>>> +    if ( ucode_ops.collect_cpu_info )
>>> +        ucode_ops.collect_cpu_info();
>>> +
>> I still think this wants to be the other side of "ucode loading fully
>> unavailable", just below.
>>
>> I'm confident it will result in easier-to-follow logic.
> Yet wouldn't that be against the purpose of obtaining the ucode
> revision even if loading isn't possible?

No.  The logical order of checks is:

if ( !ops.apply )
    return; // Fully unavailable

collect_cpu_info();

if ( rev == ~0 || !can_load )
    return; // Loading unavailable

// search for blob to load


This form has fewer misleading NULL checks, and doesn't get
printk(XENLOG_WARNING "Microcode loading not available\n"); after
successful microcode actions.

~Andrew

