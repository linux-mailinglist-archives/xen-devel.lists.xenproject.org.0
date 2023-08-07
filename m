Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1977726F7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578488.906009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0qX-0007VR-VM; Mon, 07 Aug 2023 14:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578488.906009; Mon, 07 Aug 2023 14:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0qX-0007Sj-Rf; Mon, 07 Aug 2023 14:04:33 +0000
Received: by outflank-mailman (input) for mailman id 578488;
 Mon, 07 Aug 2023 14:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ru+M=DY=citrix.com=prvs=57627f799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qT0qW-0007SZ-DO
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:04:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 533fc0c7-352b-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 16:04:30 +0200 (CEST)
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Aug 2023 10:04:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7112.namprd03.prod.outlook.com (2603:10b6:a03:4f7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:04:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 14:04:25 +0000
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
X-Inumbo-ID: 533fc0c7-352b-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691417070;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VmU4k6SzTOG6clx1I/wtoQArWZ7X1lPWZ71QxHnBZKs=;
  b=cUoOeSeDtdecTgYQM8GCytSFtxlGSdC5nLnO0W0HbprlR4nDPqZs5Cqp
   qEleQY4EraZmOwLD8DC/SJIjolaHC+J2c5Uq2XGtOfTTgukxNR8kKV37z
   JPWaJi45OpZ6kPt1Mq1HaRxn/p4mCX3irOjiaVsOlUJnlk5ZXfaXrRC+l
   Y=;
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 118607559
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:u/jusauedXKDOyMi+dfHtrPPxOfnVKhfMUV32f8akzHdYApBsoF/q
 tZmKW/UbvmLYmTxftl2PYqwp0IO6sXWnNBiSFBlpH80Hn8a+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+GyCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJBQzUQ68q7yK6eznRtVOjZ0RLZLBBdZK0p1g5Wmx4fcOZ7nmG/mPwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oui/60b4W9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThpqAy3wDOlwT/DjUNexyjpqWzgHS4fPxTN
 BI65xt/kYE9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAfTztGbvQnstE3Xj0g0
 lKVn9LvCidrubfTQnWYnp+LqRuiNC5TKnUNDQcBRBEA6sPuo6kyiAzOVddpFKOpjtzzFir0y
 jrMpy87750DgMhO26il8FTvhzO3uoOPXgMz/h/QXG+u8kV+foHNT5Cn7Ujz6fdGMZqDSV+Ar
 D4IlqCjAPsmCJiMkGmIX78LFbTxu/KdamSD3hhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLIT7wJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:bsODKaMGq0D6j8BcTuOjsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5IUtQ/uxoW5PwI080l6QU3WB5B97LYOCBggWVxepZnOjfKlPbehEWwdQtsZ
 uII5IUNDQpNykBsS8h2njBLz/8+qjgzEl1v5ak856yd3AWV0kOhz0JczqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3ACkQNxWrHqL1drx/ZxKgnwIfmUcwBTELD81uOH2b?=
 =?us-ascii?q?mVWpVarbMe17L0poxxg=3D=3D?=
X-Talos-MUID: 9a23:Gs58UAgHUsurHj20GxmsTcMpL+kv+6PyAko3l7Iot9baGzFBagu0g2Hi
X-IronPort-AV: E=Sophos;i="6.01,262,1684814400"; 
   d="scan'208";a="118607559"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAI932hAROOaEtTrY4GBo+HDdzNhfw64cEESOKaS2jul2tE2eQuNan186tM4+Sbmba0WspkkL0l4vt90WZMLp15KTzIIGLgeNekYDDyi3hcG6KEne2XZkXNl3jiRKTQhojRm8Q/dKCBP0cCWI4RlGFerjZGofNbMH88ryvbZFlvsNcrejNYt+gOklkjZk1Gup5ftNM2+nRk9I382zFIm9gJD7FBN2t7/b5rws9CmoRrdb844UacfX6QOs0tMlTypRE/lq18+tRyF4Qs+jzJuwYa6+JWDDR7bWy+GDrvLeF2/kPi87LBm8zrkgWrLj1M5ueV/KMzHSbNuIzMCUxMhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmU4k6SzTOG6clx1I/wtoQArWZ7X1lPWZ71QxHnBZKs=;
 b=Zg51fvtngLJ10lGMfC2XP/uN2YwEHHTbi5O98cu5gBHBquCsVgbDQvBmvZhmkNY5TH6BP4FA7Epv793UlMJ+jeZOrm58S4HaNdBdnT6DxW/NdTZgxvF2VgLM21KcGHK70T5sYM3o5BrxhQUsu3PPgzlCw0k3wvHJq1iQaBBpoT66DB6bRXJi7e1JZJV54nTFbTr1FG0+ra2RwMHzCE5p+0L1e1XnN7igLj1GKP/xeLV9aI+3dTUFaIP9Fc98Y1DBkULrCCuxB0SH2dXB5ldknhzm6PmFgh5EiFajD9RxBezgDliVtg5qVPRlyufRXHbCinQqudlK6Ffqrg8RyVJ3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmU4k6SzTOG6clx1I/wtoQArWZ7X1lPWZ71QxHnBZKs=;
 b=F09jqx97iciI8XHq/iwi5iLMRIreixySodryCt3BAhJBHlpJSSD0eG8evbt0jaJtxCxx6NtJOB/VL758LeKq1+lH3ESnbfTTeXoktS37y1valWoLgVH7uuRRqupb6Hn+dhIPu0GiqS/MoW8f6SvUu7LMmMZZX3yA6vSgcrGumpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <298af911-f4f0-165d-c493-90407d649945@citrix.com>
Date: Mon, 7 Aug 2023 15:04:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Simon Gaiser <simon@invisiblethingslab.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
In-Reply-To: <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: eb24a44a-58fb-4fb6-cfa5-08db974f3543
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ew0rJqn3BrmFBWveJXF79T5cv56goLNqUGnCfmBxJkMsq3o4dRoAf1dEXGq9UvcPc/ZGoA2ssJrNwxwnngrNV1bvsgOZh4QEoHwe36D3FyLjoPOdwALBs6UI9BQaGiTCyfHGx2M3+whSiWaor+xeictLz0uihuJ8oGUwN0d5SMYWqCC7MRKVUL7iI679Pq/OBaJrobcz8OG5VRV5546GwoSl08TjmXdX/5xUVuutnFN4YoV6qgVBzy6YIZcjt9mbiSyqa46D7igoF8zdMndyJdR6fzfpO6tMFXkXE96ieeuI1ExcCVZNIqPRgkzXJKFRy5Op5N1woXTqJGV/vG1sPrtU2vesV2wddFr0aIHc68ZRlLzl3dAHJsYife3lw6OH/NiY5okaKeZZHmGnKdZOJ36koYiJv/2yvW1tDddxgrnqvHkKzyJtaQvj4qhiOfRaI4flzgkQzVVBu04aCaOrxM/bTcfDMlm5hrRBsHe6HjfPF26PE+z5dmq8sEqt8Z243RMgYPjTd4UTDEjN3j16PnOqZ5pZqpshIDG8ooO7o3nIvrPXoa5JGWAeKJMkLwP9uWFP/4TLzOzzCwNRssS+N+PzjeZCeP6PvgyHbiDs3J9HNj80osW8Wj8BlKt2BjzCDgpzXTaa+1RXXB/VJT9B0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(1800799003)(186006)(451199021)(4326008)(316002)(38100700002)(66476007)(66556008)(66946007)(6512007)(6666004)(82960400001)(6486002)(2616005)(83380400001)(36756003)(26005)(53546011)(6506007)(86362001)(2906002)(31696002)(54906003)(478600001)(110136005)(8936002)(8676002)(41300700001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clVrOUdSUFlRdEg5OFJWcXBCMVJuSmg1R2ZxSEdKTjNCMFlGOHQ2cmtSMTVQ?=
 =?utf-8?B?aXBsU2p5SGdXSUNZcjF4ZklhK2dMZTRIZDFrYTYwclRKaDN6RDM4aFdSVnlk?=
 =?utf-8?B?ZU1lTXQ0RXRCMVVMVUhPaDFCVk9nWmNDOGlweVVhV2x3NEhQd0ozL1ZnS2dL?=
 =?utf-8?B?b2I4cnJnMmp4c3VJMkdaNTBXUVBuZnZReDhHdkNvTVZGRnJmL05MYThUVWhs?=
 =?utf-8?B?dTlTYTZmaFk2SEVJMDgyNS9xNHZDZ2N1N3hGclorM0NTQVdJZXF0cWJDcGMv?=
 =?utf-8?B?QkpiM21PS25oTWYwYms3SXhMczZYNnJpMDdtSC9kVk5wbWFZZ2JpVjNGenFx?=
 =?utf-8?B?cVdCTTJSQ1p0dDEzVCs1MXZieXc3YmpPRGxRbWliL3ZLRThvM0gvQTJiQ1Uw?=
 =?utf-8?B?TUZ6VjVjOHNmNklSRmZIdVdwWFJ3VVlhdi92c2REa1k4QzB1VDM1RjEvS3Jp?=
 =?utf-8?B?YldCVmd4Ym0yRkJtOVRVL0w2OWloSjQ4STI4K3JEc2pENWdraDI4WmhxN1RQ?=
 =?utf-8?B?Q2FVSzNjK3MyY3pMUmtqQlpCNWFqV3c0Um1aaVY2TEZpZzBhQkttTy92bTI2?=
 =?utf-8?B?NXo4RmRweFN0aC9DQ1BIdytPSGQ0d0tvNzV3emJUVGloUUIzMVR2aDJidG5q?=
 =?utf-8?B?UVhYMjZUYmdOalJlSzROM3BXSkhhckQxS3owOWxPNlI5ZUY0SEUzQTI0TEth?=
 =?utf-8?B?am1ZdkNPaUdBNzh6RUhNTmt6VnlBTFNrdnEvbGxXWHJwdXNLeStId01PUE9Y?=
 =?utf-8?B?bWdTTktBOW5jTWwwUUJ5K0dsK2h5dks4L1hQQnZKVi9naXRXVlh6TGRLK05T?=
 =?utf-8?B?WTV6NjZxOWdPOFAxcWcydmlwQTlXZWZOekYybE5VMnhKSHpnbFZxdThpWW1O?=
 =?utf-8?B?dkFNVEt1eXRjb01IQzcxZWNPQ0kwbUZ6ejhyamRsNkh2VWJyeVpkS2Nzd3Zk?=
 =?utf-8?B?Wm4wMjY3MHhLcFlBSFFselBhMWxRTHdoQnBsd1pFZnR6aGE4ZjhMRnFIRjNm?=
 =?utf-8?B?aXl2NlVVcjF6bjB4L1diWEwwZ0pYcDVmQjVZRmxDNVNlQXZja0pYSlBSRUFU?=
 =?utf-8?B?RisrbFFiVWRrRmdCU2pFVkpuWUJBVU41V2h6UCswM2RYK1Z6NXppVjJGSURW?=
 =?utf-8?B?UmR1YlEwdWVxTnhPQ0ZaL2RLc1BpOUMxTkt2bVJGeDR5Mk9MQjlZb29iNENI?=
 =?utf-8?B?Y3c3akRGRWdPNEJQRTlhbFYxS3E2dTlaazlzU0ZrTEc3MWUxNjNQcGNkdlA4?=
 =?utf-8?B?bUtHMEdKdFQ4NDJwaVBSaXRiTi9OaUt3SVlrYXJCaFJteW9mMGQybEl2Ym1S?=
 =?utf-8?B?dlMrNkZtYzhtRGpOaldSTzRselRnOFZ5NUVFMmJSS054djQ1b3l5T2QyQkNu?=
 =?utf-8?B?OG9kNVdHbVZ3Q0lKRTdER0psSENZWGRaN0huZ0lLVmFpOTgwNFN5NGlycXZa?=
 =?utf-8?B?K1o3RGpmallwd1EycHgrRzdmTnFJL1lmbDVLTEZ4YTlHSzlmRHVpMjdQdzdh?=
 =?utf-8?B?NDBjY3h1cHhISkNFbjRhUWQza1ZCSEZvZkZqSjJnSC94VUViejQ1SnNTcEpx?=
 =?utf-8?B?WU12U1ZjekRqdWgwOGJYMUYyOUpEKzVzdnNpTldRbWZpNUIzQnAwdjFEdy9J?=
 =?utf-8?B?dnJCZVBQanVWRFZETkx1K0hxbW1oRWdkTjkrci9UMmh3MXF6Smx0RlJCdFR5?=
 =?utf-8?B?Rm10OFB1R1dUVmNKVkZhQjRQOHdBYnl1dG1zRnBnQjE1blhYWlQ2cjhjMjJW?=
 =?utf-8?B?QXFDU1duT3JJRWF6M2VUOGl4WERpMlFwMEFrNlhzbXdpTVhQMnNkVTZmc3ZG?=
 =?utf-8?B?aVRiQXlRRTRoOEoweWUxNm1LdXptNlBwa3QrQzAzb0RTSEZXbE56QmsxQUg5?=
 =?utf-8?B?NnZzNmQzUjc0TFYveWJINlFxVjZtdHVPdXlWdDZDSXUvb01mRGRGcEdMQnJD?=
 =?utf-8?B?NXJ3ZzBFK3VUbTZIeFVaampSaVdHcDZJUzNBdDA0NS96Um44RmdveEUwNDA2?=
 =?utf-8?B?clplcWdUVmZNUGxmZGlwUGFoUjJ3QmtrVVQ3TS80dDR6Q003cHRHTzFpeHVW?=
 =?utf-8?B?aDEzWXdkMXJuVXE5akpnaFpwTGRqRnJTemh1SElHeTRxWmFRVmV1MW9YOTdx?=
 =?utf-8?B?Z2Z5V2MwNkVxWC9KMC9uRUNlVGVHV3hWRDJDeGlEeXhQTzNob21iM0E3Y25O?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ruSp93B2LwWDGfNkEx8Nm112DNjWPgk2inXeDLiwGXLGYAynoeZfApf34RalBZ2qmkZy6av3O3L+qurUVvwZLx8GuQTb3fQUXMvRiGMYP/rQoX5JYuWbV+k+vIxelMjsdWvSjdNeM0J9UEbJ1nQlums7CQNcuMaSXuNIfT4O1cwxKskp4rYA8n+axs9mgqv+MPPjlEI8mxdhNuZ18w2k88H6PyVpBQRnshTxsYhIN4WqC8MftsfBqQ4lqnOl2XI/EiMAOg6rGEJSPT3N5AJrsPvNiqqivsswbVXf6pPxkjZKoc9exUFRLqxVak1QtlSjWeUnRG7et6Qgcvx0Q9PJNlAfKLnZ4lJ7bi0Fmk1AIwDnY+qqf7AcoPCcqxqCzfrYewA714/Ofnp20qjPsT7q8ZX3T2O9VRv127jaVTMUibWsOyx8Is7NzGBlUInw+fAPjynj3Fks5UIWZnrRZ65mNBBS7ou2ml/YDA2nIqJ7S/kMoLqrydpzMNVm3/t8R6OgaueK63qe3jX2mHFadadhBMkd41/PchJml48NKcy+0TK64lN/g7LYR07M/hGOZT247U1CUKearWgZhPP7StP7jCYdZjTZ1If8vebh1QqczIfDKzc5hbrg+6M0OgMl1nzudN6spanr0gQrm+4nfpkW9A5SKFHNNIvhutFMxleaLGiuMFFPXSK8EawTl8zLm9kyh2QOIYurnfC1oUxlCpvMzY5x7ImtZXVzGyHaHvOu1Erzo77YJ+PMG7ZL6JRhDuympDWvh912b3O/Pn03XolACzgrvt+G/nl9sgWGF4dWaXehlsDHI1tEBkp1/OhD8JZNzV9jsK/qkq4h4TIvvgBZWg0Rb2O2EjMFlHVxsi2wdgc/sBWg4Es6DQdgbgO/9yyouFNjs7anz46uBeHAjagYNPfJ80lsyU+3GPyYMsJmrFA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb24a44a-58fb-4fb6-cfa5-08db974f3543
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:04:25.8501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qvMfZblmvMEuGdIZybgmJpYXkZn/xn3RbXsr0yPaZR0NfMvHSdQQSOjP/eM384x78a+Gy3edPXRq8TxvWlTpXAlYxdpNYaK+fUUWYpjzs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7112

On 07/08/2023 2:17 pm, Jan Beulich wrote:
> On 07.08.2023 14:55, Simon Gaiser wrote:
>> Jan Beulich:
>>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>>> 0xff. Linux already has code to handle those cases both in
>>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>>> same check to Xen.
>>> I'm afraid it doesn't become clear to me what problem you're trying to
>>> solve.
>> I want Xen to not think there are possible CPUs that actually never can
>> be there.
> Did you try using "maxcpus=" on the command line? If that doesn't work
> well enough (perhaps because of causing undesirable log messages), maybe
> we need some way to say "no CPU hotplug" on the command line.

The ACPI tables are broken, and Xen's parsing of them is wrong.

And irrespective - it's unreasonable to have users work around bugs in
Xen by adding more command line.

>
>> Without ignoring those dummy entries Xen thinks my NUC has 2 sockets and
>> that there are 8 logical CPUs that are currently disabled but could be
>> hotplugged.
> Yet it's exactly this which ACPI is telling us here (with some vagueness,
> which isn't easy to get around; see below).
>
>> I'm moderately sure that soldering in another CPU is not supported, even
>> less so at runtime ;]
> On your system. What about others, which are hotplug-capable?

It is required that all APIC ID are stated *ahead of time*.

Entries with 0xFF and 0xFFFFFFFF at boot are entirely invalid.

Furthermore, given debugging that I just did with Thomas, it's very
clear that noone has tried really hotplugging CPUs under Xen.  The
layering violation is rather hilarious to watch.

~Andrew

