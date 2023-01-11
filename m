Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A76665D0C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475318.736967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbVf-00035I-RI; Wed, 11 Jan 2023 13:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475318.736967; Wed, 11 Jan 2023 13:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbVf-000332-OJ; Wed, 11 Jan 2023 13:51:19 +0000
Received: by outflank-mailman (input) for mailman id 475318;
 Wed, 11 Jan 2023 13:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbVe-00032w-SC
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:51:18 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2077.outbound.protection.outlook.com [40.107.241.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0498bb00-91b7-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 14:51:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7352.eurprd04.prod.outlook.com (2603:10a6:10:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:51:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:51:13 +0000
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
X-Inumbo-ID: 0498bb00-91b7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehFA9beu3wI7dZRUgk2FXcAMUMID6fFgaInH/T0KRL9m9q194mJvYEXO53QposM+tS2dV+ovYWCpeQH3kp6ID6uLnLyQ5HbhswhyG7b1D07iRWFk6lHT4f7Aqq67b67wdRivwyilE88AQ/9gcY04ezMhDKfgtOakvcqm7Q7259Zqe/2fkNiWJ2MBbRMuuMFxugcZgmKZSwdlnOojZzBZxDKbo72gwGJItg5IgaF/7djSyG/2BPtirIFvYyUWMiwKOrSP3y9J26WNIQ1HFBkCSQ9HWrPf2PBSStJeR2xt1ijkzZYMLmnpxGjrbNvXuOg5yFDhU0fJcXYGHuYcwm4S4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILA0dFecrQ4kY+XxLhjKokOnovJsHmRJvxl1dDrFEto=;
 b=YKD78oWLtyUPLaEDNPVHMmYse60pk3FR2fwDmVTrNkf5TlZ+t7JNPFKy9ki0/DC73yavQoZqx6RrM04IumXrcWFUcxcJ7ZY+PKYsSl0bi16YIe5A/99zh4yyMHkQ0To1WX/uJgEmvDMayTH3o8Q5Qoz5SewRvF7HBbE0B/fFlc/ddiksuF97eXTMn3x0FVaso6pddm7gAvIIcIv72sx/XC0tmkH293tmLgBHWPJHA7nbgZTyKegqfxIdzzaiGVDRvSzbrNUKkENhAhcThRE+3PdpQmGmaqHpgupMjMKeTusTHXv2T8zaOQc2Qdk1yUVrw3sIISzMqmi6jtYoFesZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILA0dFecrQ4kY+XxLhjKokOnovJsHmRJvxl1dDrFEto=;
 b=tTvqcj6J30POYLQoKIElakEDxoCJ8yc1QYJ2z2ckqqwvIVi3c0Y/pxGlcjxp3oRPl5GVwwC9N19q2q937mJGK6npiWxRsG20+GkGtZ81Y3ovuNucBOYyi+6uf/B7ZEM47+Du/WKgT6qzt4fkFXtNJ4Leta4KblL1cHu1S+omSrC+sxbfeHSmgivYtYkBdsCGLM041aQF9tQQJiz2e5FGXapYlz7XbT1YdzMEJepimZXLtePskwDwtWZZGKJL21PjqSTuI1K3+Xll/KKMNYDgFd/yv0Wo6k+nwtT5BNS2GpTisuNYWLKQYB/KiF9bWf63RvAmZlP0jYEjQeeFBJ+wKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
Date: Wed, 11 Jan 2023 14:51:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/9] x86/shadow: misc tidying
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 860045e7-638c-45f0-b423-08daf3dae759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kt2YvQvDn+8szyiGFtv0hDU16mJfdkPI/ohTB/p2Qi+svxCrcCiqidUznA1JK7wUQgrqfpJS6JUAejatqBn9v0kA6RiFSMZZdGH28EyCMF72k7pG6Y4yen1o6psFZWPASVL9geyteQ8UE0sDcFjK80wkm2YBbhR6bC1G1LUbn4XmxSMgPvKByUVQ2gnn9SntakTExHVSH5XUcpD52MoV7lWEfrpO0qw+fMf76Ag9/KjpZWhl1qOwWhprg1Bi61rnKzzMvnfMtJhn7whZ4PD4UmUn6gQUbvaHvfbNXkGxKIfenrjsL6k4eP3Wm5sSSfAg21wxEu3dwezmVxbD8VijKOEKfyiFdDKDWMjwUU8qXAnNWQTq6tEQnIZMJ9orUIoH8etQ9Ftb/ASCpvvxpiF7jcx7TmWSRXhuvc4YBGidcbwuibl8J23FXQ5nCM1jvmCAvQJArzK1lyanPhkN1D/NyhmymVD+Zb/fUKA0OMIimaqRutr6E79bN42hjQaI0/BHodepp5yzUhXOwMDkp9Q3ECn+SlvyVjETps8oIFOWvw8TjO/LHCpP9/E0KNeNf6938kida6nqfQejWBMPmp4LKTf6fi+JhxK4WM4bVwomlqxMJBJJGfgcKzMyfp+fuiE0BD2KDs0qucXhn1aLyl1GP/QDfIWzOq0WOL+v60DWr7adboffpo3EFCh3Dt3dF2pK3zomZlxPhYRp4/Rg310ALtoSvRutDnO5Qf9T66gE/TA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199015)(8676002)(83380400001)(31696002)(38100700002)(2906002)(4326008)(5660300002)(4744005)(8936002)(6916009)(66946007)(66476007)(186003)(6486002)(41300700001)(6512007)(26005)(6506007)(2616005)(54906003)(478600001)(316002)(66556008)(86362001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWNPUFpoM2hwbEtyNlJlekNUVWttd2p6cXdxMTFNNzBsYUthdW04ZW9BUjFp?=
 =?utf-8?B?a09vQjhxOTNGcGcvRS9UNlEwR0ZFU1RVYjZoTFZYYkNsRmszdlJJall5K0R1?=
 =?utf-8?B?RkwvdFloMFI0Z1E2akNwZlFUM1V3Uyt3a2hvMS91dFNSVnQ2VGdlaFE1Rk9J?=
 =?utf-8?B?VWhtOCt4SEFYelFLZ3E2aTNxODE3aCtsaHVPN0tNVjdpSHdGcjI4MHpsUXRy?=
 =?utf-8?B?RHRlclBrVnRBS1dNQzBrN0t3WmpDNHJQL2podHJVb1dGcnd5QUw2ZEVDSFMw?=
 =?utf-8?B?Q1BiVWdrTnJGdU5McXB1WmVHNmhxeHpXMnBzeWJUNU1tUUpmWTdmL2YxSVRs?=
 =?utf-8?B?Tjc0VW54d3VIS1ZlMVhGREFyMkU2TnhTZ3VSUHM4ZEJncVJ2MlFuM0JSK0Uv?=
 =?utf-8?B?M1NNQXphNVYzZE5wWUp4My9CaENFTlpsNFlTZTROQm53T25iWXJaRzBZZG91?=
 =?utf-8?B?OXBmcHdITk9Kb1Y2T3UrUHEydUl4NzJVYmhLTXFFVHo0UGsvV2hjOEpUZzJN?=
 =?utf-8?B?R3ZrenpmUWQxZDl0eXpNUzhJWDc4UUE0NXNmYUNpODFVU1RoSXVSSFA5UWV4?=
 =?utf-8?B?QnBXdE9aREpmNjFXTXhNdG9QU1FwS3pBblQ1K3lNVEQyTUM1TFFJTjlML08w?=
 =?utf-8?B?ZWszRGs5Z0J2cGc0bmI1SC9vNnRDMDJPUCtzbitqNkxxSFh5ekZESXRld2Fz?=
 =?utf-8?B?QWpwTnVqdmxzam9WODRiS1BKbS9kdjRtTmdWMkhxVG55M2FnZnpoWEcrdE1O?=
 =?utf-8?B?Z3d1Z0JDeUFnTktUOUlMU3RZelpEbWpHeHJPZms0cFBhYXFYd0lKZ3ZPNnlG?=
 =?utf-8?B?eWNUeXRlcTNpK0xBNVVTaWNRV1pXNXBKMFNKa0N4bTFZSllyUEdidG03YWxH?=
 =?utf-8?B?ejdtODNMN3MyTExROWtKUlhSZ2h2V3FSZUNSb3pwbFVxNXNMMFZacER3ZlNy?=
 =?utf-8?B?WUMvbkNBZVhXQ0o3SldaNm03SDNXNlEydk9YNTViYm5LdC9NdC9ZbmJuMUVP?=
 =?utf-8?B?VnZ1RlZhRFRYb0wvSWcvL3pSNkV3ZU1hMlJPOTZyMmpXbW5DVTlvVU56ZGl5?=
 =?utf-8?B?UTdYTUxWNnh2Q3Y4UGNEVWY4b0o0amFBSmdNOVlrSmxiMWh3N2QzeGt2em5J?=
 =?utf-8?B?Q2ZuVmdZT3o0WlBpUHdpaE5BOU5NM1lMMlo0eDBWVGcyY2dYbzNyZ1ZxRnJU?=
 =?utf-8?B?ZzZ2M1NWanpJOTlmWXNGenFXc0hqT3BLcnFJS003NmhqbS9ObUFNai9PTFVM?=
 =?utf-8?B?YVlhV3BQSXlYc1l3T0p4NDVtbkNrTkk0OFFjVnNBdFpVUjl0dE56VGFFVXVL?=
 =?utf-8?B?cUNqMXJucjE4VlFPSVQzRzZwOGliWmg1bmxJUnRTVjFqSHVCQThiWUNsNndz?=
 =?utf-8?B?a0o1dWltTkIxZkhqWkNzNE1WdzFycUFIWlQxbDMzV1JGcjFXLzg4bFhNT0pQ?=
 =?utf-8?B?bGZXMVFkUlV1UG4rODE0TnNCak1XQkxwT1J1eXczbmZEeUlnZk1XSmtNenZT?=
 =?utf-8?B?MXNzWXRmSmZweU9sd2diYmNYN0JlSlVmSEJrK2ZBdTVFb3VDa3ZQUE1nY2R2?=
 =?utf-8?B?MytFQnBFSGxjUlAzK0padnE3Q0h5UkYyQUN3cjVuZ0RZbjhycWd6R0Zucm56?=
 =?utf-8?B?S3hQMkxnT1JVenRFYzNib25hc0R1aklmWlk2aS9BRm5sVEV4QkpnMER1L0gx?=
 =?utf-8?B?bkQyaGpWbWtOcG9aWCtYeURIY2JrT2puOVN2M0JKMGNCRkZiSm1QMmlFZ2RE?=
 =?utf-8?B?aFdzNkJGRklURW1zUlBQWm9RTWM3c0M5L2J3dEUxOCtGM3ZlZlVnSGNvOWJT?=
 =?utf-8?B?OWErY2NlM0Fuc2c4eWNPRjczUHVVNjkvRU5Rbm9qTksrTW4wUXdiUUxZa1J1?=
 =?utf-8?B?bmhNUUlrdU1ZaGs1UE42aVB2TDRHcUZWM09JbkV5czloRnYxN1FudlI1d3RN?=
 =?utf-8?B?Q2p3cWU0VDhXOGdWdXpJT1YwT2tnak42RjE1MFZHYkxLYlVmQjZJaG4vbi9v?=
 =?utf-8?B?ZEpRYUtEeldKNlhjZ1Y3Q3RBSzVUUUVhWDY5VU9RVGFOelhjV2taSE1YeFQr?=
 =?utf-8?B?cHYzQWZLZ3Q3eXdFSmI0WWgvZU9GZXZBWUExNDhCM1lSUWxJRy9zQnR0WklN?=
 =?utf-8?Q?L3YaIxosS2geUayKPQlo7mAiY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860045e7-638c-45f0-b423-08daf3dae759
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:51:13.7275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ew2zOJpg+hVd2QZJ1gxeJehLbYzl5A1S7TWQyhu/+5Pz/4lWIZ4eNqrs+4r1K/OWEC1dnglGVKzv/n/P7h51A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7352

... or so I hope. The main observation was that we still have both
hash_vcpu_for_each() and hash_domain_for_each(), where the latter was
introduced in 2014/15 to replace the former. Only some eight years
later we can now complete this conversion. Everything else addresses
other things noticed along the road.

Note that patch 8 conflicts contextually but not functionally with
patches 3 and 4 from "x86/mm: address aspects noticed during XSA-410
work".

1: replace sh_reset_l3_up_pointers()
2: drop hash_vcpu_foreach()
3: rename hash_domain_foreach()
4: drop a few uses of mfn_valid()
5: L2H shadow type is PV32-only
6: x86/shadow: re-work 4-level SHADOW_FOREACH_L2E()
7: reduce effort of hash calculation
8: call sh_detach_old_tables() directly
9: harden shadow_size()

Jan

