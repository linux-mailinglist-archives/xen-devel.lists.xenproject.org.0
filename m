Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6AF6EA4A7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 09:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524468.815428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplA8-0008VI-Co; Fri, 21 Apr 2023 07:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524468.815428; Fri, 21 Apr 2023 07:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplA8-0008SJ-9D; Fri, 21 Apr 2023 07:26:32 +0000
Received: by outflank-mailman (input) for mailman id 524468;
 Fri, 21 Apr 2023 07:26:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCD5=AM=citrix.com=prvs=4680c1a37=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pplA6-0008SD-Kt
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 07:26:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d431d9b7-e015-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 09:26:29 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 03:26:22 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5341.namprd03.prod.outlook.com (2603:10b6:208:19f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 07:26:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 07:26:20 +0000
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
X-Inumbo-ID: d431d9b7-e015-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682061989;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4pr2RTBSSLxEq0rUD9QO4OvqPaMWVGtIBu38NFEcpEY=;
  b=drjUypkmnBexVfViB1kJxUjxg/2oRkEhS40j37uisHZhAZB12+nciO0D
   3RkSD5Y5GMEZBRU2xLG+EoEQUdP+VfdIXp87hY5FMwj3By4QSWHMlNBMB
   ebBJxWtPOvTVR+A0sau8EbryKwPDhBUwIr3NgpDiUTPYVVMl9k0oy2AgX
   4=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 108790950
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZtN87K/Mp9rLtNYWS66FDrUDln+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2ZND2GDa/aDZzf1ett/O47np0gEuMLQnNBkS1Rq+3g8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOaoS5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklz0
 6ECEh4RRSzAxOa/g7KGFPNLlOc8eZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilApuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37efwnKjCd9KfFG+3qc7q2+qzE8UMS0XR3Wcsai0rFG6VN0Kf
 iT4/QJr98De7neDTMT5XhC+iG6JuFgbQdU4O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvU6SdHtbSUTTeY6e2SpDbrYywNdzdePWkDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhFGbZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:FRQlDaPA3xvbhcBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:QWMQSm+RrzJwWyYYrRWVv3MyR9ofXGH28DSTJ0b7CVs3UpqHakDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AiQ7s+A+EwJMjCOESxZB2pxCQf545yJaXAmMKqKU?=
 =?us-ascii?q?HqeejJX19HSiZgzviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,214,1677560400"; 
   d="scan'208";a="108790950"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaO1+5AViSIkU4b0HNsUG1/R52o0VutOnHWvIoYirwQ1wF3zwziVgzksTAhlqe5bm95hTSJEMxOgO3A3bLWnL8rkh52XzAsvkcikAyVKbuU7HlnU5g4P457zAHtdEPMeSeUfVt4uyW9ZXxbV5uM5b/7/UFtQGWa3rAHExsJJZ++qjcMsb++bVSFi4kLvXTkRzj5l+PkZ7/s7+ZbEKLWZdhhlJMyESNLzjI3zqDvkw9BkQ/SwJ1HZVBqy08hoymg1LPtORxs1w6VeyT78ECAeCA90nufOmEPqAat3ZLbECqmOCziOfrnWFZ1qeBpzEeyi1UJBCVnFr2C0L921+IEy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpOX9F/3TKyra1mCMLlUB/Sk8T20vsszUo9ULHrJFIk=;
 b=g1XxnLcJ6Fvnq7F3er8E79WLYK88Otjwr1RnuV2F97OI4qZ6BcPPkxwU750cx68/G2d3AUakcBsbP/Oci1GEb/nQwNmpGfk95ud3bBWyawoCtEMMYBSAoOboM8KrxzicPz0iLY9YCLsnWMZyf6MWuWntb7f4s6D65yMBIdf0j8N3lqu/rxuadakvWikCXzhRHynwQb8h6sCqZqR7oaM56euOlq5Rt5ZeqSycxNF/5WMhzoWqET+vlqnWsfyEhI5pUezcYyrCWgqQIodbhWiCOdAVWYRFMOiXNuoXRE1Rs+BZWn4/q7wXZM19dH97bowZrSiNIyqLi71wx9CVdPZP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpOX9F/3TKyra1mCMLlUB/Sk8T20vsszUo9ULHrJFIk=;
 b=QqqKp1cEpzwrfwvvWRGgbqZ8vdSf3LCNIESb2fFcMbiCFqdLD7CJgM/iesn/4QhhqiFnvI40hKXyIz3uL0zeXAUuIkeYDGNKfW+aPXnBp52YHTznFe7zQ9/Bj4H4iaty1+3O0rrsiKBAi7jndYTXSnZe3lNnrGTVjcfm/V7mo4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Apr 2023 09:26:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable-smoke test] 180345: regressions - FAIL
Message-ID: <ZEI6ltv7UNOE/EHY@Air-de-Roger>
References: <osstest-180345-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <osstest-180345-mainreport@xen.org>
X-ClientProxiedBy: LO4P265CA0247.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5341:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3cef0d-7201-44c3-f913-08db4239b3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KnrYghr+kbT7AMZN8z+nO1PumZQMfRACUVcWkGvr5w7Vg6MZp152L2+NsEhJnM6isOoKgnmrITaXwpbFh8yK2n8RqtfpGcqaV4AnfsP4WU/zxVg5asi4DhGE3GGd6ysp0A1E+DLxlgJtEW8kBHy/07bleHWlJ9pMjl++5U42r9ZEBmuUOXTzH04tmN0I3AXriBa/yMNpKT6CIzbcQi2ZxXSHeET4tBhGjmoXrt6LjXjGlJV3IXFTGRp6QqBDrHDN7/92az2amJDWYxdcKpw+4syi3XYdT49S98itsKs1RN5pOwRE63j69RZHJQ/Y6hHeFKke8Xh6hEnSBpipj1+36I9I7UoW1YnHhh6KEFjVrfLJXKjvmNZCwPCJmd/f5JolMHNP3/4DwZ/bP8rmViJ6G32y3kWUe1lNHxqa5mt+TPkKqjXPfZIAgW+cXXy1gvwxKGpiiyp+dG4zZ9iqyFul1lVUl6gAoDIviJnvwybPD1tH9Zl+n5v7yZoOtzLh2lYaorn4PZRUKNjH6vPFkf7tNg1x25AT1xO8IhAZqGb+fX/wtz3fjkcAME57bcEfXir8s/nhG0cuVsRiSziZfAc/cDdf3ls9sgt/EGJhmkj5Zhc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(478600001)(85182001)(38100700002)(5660300002)(8676002)(8936002)(2906002)(66946007)(66556008)(6916009)(82960400001)(4326008)(316002)(66476007)(26005)(6506007)(9686003)(6512007)(186003)(86362001)(41300700001)(33716001)(83380400001)(966005)(6486002)(6666004)(139555002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1hHMCtZV1lrZE5DbGFzQUdNeEp1OHNPbkRiajU1aXBNbFZHbzBLTHA4N096?=
 =?utf-8?B?R2NtaUI2ZXVXalA1ZFJ4OFhxdnQ4OGQxeHdlT0dZRmg4bW5jU1lqeDBCWlp3?=
 =?utf-8?B?REg5NlpUZUY1UWdsVkc2M1QyQUwyaDVTcW5NVkFSczZjcDljOVV0YmxiRE9w?=
 =?utf-8?B?Rndiei9aNGlTYklHb0wrS1E4SEdhZGo4WXIxcGZvaVhMaWtta1ZOTERLS0du?=
 =?utf-8?B?RFRTZ2Y4cC9lMnUxU1o2UnlQODQvR25kZ1c1bnJFczd6OTYrODJDOFhKTTFY?=
 =?utf-8?B?Y3F1YU53YVd2WWlzQTZXTnpIckhWdUg3MkFKOVpUMlBVSURoR0QwN1YzSktv?=
 =?utf-8?B?R1Z0K21CZCtCYUZYeFFhOFovUVlUa3E3MVlSci9lS0E5bDZFS2VLUVZ3TkZ5?=
 =?utf-8?B?QXBTOGw1bmpVcE0xYmN5aUlQNm1OamZqQm9hV3ZtWkRxRGc3bUoyRi80N0hk?=
 =?utf-8?B?SGpKeU81RllTb21BNk5YZi96QjlUL2EyeFpvL2pnVWZjbXZHRml3MUE0a2hU?=
 =?utf-8?B?WHlKdlNSeWtxRXJNTnI0VFJqb0o0MGpFcjJBNUNSbGhWdVl6akJLMDd6WXhv?=
 =?utf-8?B?SDRiMEdINHZxd29jTkhXNTlJaFpFZmV5UXFzdEpNclFmdFRUeTVFZUFRTktL?=
 =?utf-8?B?VUYrbDEvUXp0RFpJR3RuMGd0WVQzMU9sYnFQOHg2L2ZpSVNidUZPZSthSmRq?=
 =?utf-8?B?WTRaMnNOZmg3NHFqVkJCZkVYOGJlcDZMOTFJVlNTM2c1STRpbTBCNlZGSzZl?=
 =?utf-8?B?cVNtc1FKaGtDUExGMlB0Z05EQkVNU3YvOTB0SUhzaXpoZ2tjd2RWcmdRNnhr?=
 =?utf-8?B?Y29FeWpJVUpXR2wzNUF3N08wQnkxMmhmclJpSXdCUlJKL0pSNTVRN2ZhWFpC?=
 =?utf-8?B?amlVMURqczZteEFNSnl6ZXRWNktKWnk2bjlTZDZmaGl3R3ExbnU1VXdjbHcy?=
 =?utf-8?B?cnBDbmt3bWQwTnhuU0h4eTVvckpYUFh4WkNLZ1lKaitJL3VPVDRXdXFRTi9W?=
 =?utf-8?B?bU1rM3lwbzlQaWp6ei90L1ZBbHFNNUJuUEZLMFlzZXZibGVrcjhhMU85WGsy?=
 =?utf-8?B?aFB2dHZwWjJSZ2syTytnTTlTUys4Y3FxdkRSbVdteUoxWGVHTjhqTzkrUUlu?=
 =?utf-8?B?UWpoenVieFR3VDR6TTVKb251SEh4L1NLRG5jaVMxZFZLRGVleDdhNDFnL1VF?=
 =?utf-8?B?UWFtdktYYU54SHovcGtheHNFamxRcHh2ZHJhbTVURElWMno1d0l6b093eCsw?=
 =?utf-8?B?ck9pUDZzU0VoUTh5bGJKNTg1Y0tFeFQ4d0pPMXR1VEl0dlB6K2laTCtEMzdk?=
 =?utf-8?B?UnhPM3pKZ0VQbUk4bHR6UzBGMVMvNE5ES0QvQU81NzhwOEphNERZWGlPWVhl?=
 =?utf-8?B?N1pWYjBaTTQ5a2FSa2hrenZVR3grL0k5VmVURlJSZ2lQWjBOL2NCSGhBbGQ5?=
 =?utf-8?B?Qzc1b2dpOEZKcjFKRUQ2bFJuVHQ5VmlZRWZIUmlpaUZEQ2RlaG51WDdJSmtJ?=
 =?utf-8?B?TUNTdUFLbW56QklQaVd4c0luTndBZTNic1JrN0drQ0ZpSDE5bE04VGx6M3dl?=
 =?utf-8?B?NHllVEtONDdzRDNzVTdDNklHa1ZLTFg2a3dHZ2wxayszNElsckFOcmF4a2RL?=
 =?utf-8?B?eUFuWkkvNVBSemUrcWdMRmdoUkpUUVhtR1dTdWx4TGZrZlg2OUV3dzN3RXdC?=
 =?utf-8?B?VUFNb3NENFNhMkxZZklHKyt1SjFxWkp6TWhOWkxtbVFEQTFqQXR3ai85WG9k?=
 =?utf-8?B?aTFqYkIrRzBMTDgxMWVGYXU2QUREUWlrdFBEMnJtK2l5dGpTdWxIRzlWTlIr?=
 =?utf-8?B?VnYzS2ZNSk5EL251MWNwMHQzWHIvb21wdG9xSEozU2FuOHNQM3dmOTBQdXZS?=
 =?utf-8?B?VVVwNFlqbFhJU0gvNzNOQjdPRnlOQ3NBR1E5dE85SW81V2wyMnJtM3BzdWJ0?=
 =?utf-8?B?TTNKZmg0V1ZiQ0ZpczhWQkI2QUlETTJoOXpqbGlwNmJwS1FGQ09WL2xiK0Ur?=
 =?utf-8?B?V1E2ekZoODFrOFdMRzQyUXV4UEN2YUNOTzIydDJxRHdhS3IzNm1FWEhoSG1L?=
 =?utf-8?B?VTYvM1hMN2N0RmlqWG8zdUZYQ1dHdTUyR1pZZTk2cmtNUTF0N1lBZjM4U016?=
 =?utf-8?Q?rLYCfnlnOMitDkmf2HwGEvT3h?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NUN5HPK9kK1gZYSW8c4SwrKN8cVDgyDrIEcWM29VMcnzeTV6O689QL/luIv1KpfhN/YKL5xYY6sFtqFYR9eTCxqZC7d18KjXqdlHbMVub9riEh2v0masQrzOAh6AyWV17MUM8nUiH4xoYDi5FzOxojUEmQDbeJR0x8pImcOA+YUExwGxuj7kf+0Nqr7iUgKN8bH7TeMcNklTOjeLmpe8+h26DHrXFOMwjsJ6fjc1syK3aR5KAgk3xbRYEKJIUHOTjzkoEBGnSOD/ckDxqYz83uP5pZtFS4l8PkdyBzh71RWidajgtOlQ+lRfHaHF9P22pr1csNGK6GKwKzPvmuTYrZ9ARoGjFvXiyLgXbNxmJ6KeS4Ngs0LfbQwVq/7+F32eGBRcPB/aFkVe+YIgw6om58eZNnDYUMXhPVrZqHze+ZA94qWOXNUoNr3CCGo/CdWdqe5FsnAin6A4l+5Ckzw2UlgNw+DSGnbsl8BknCDTU051tA3D0y4rwDfB1akECfQs9nJouYsbGSUYWgSM8Dant9+MZktxv3/pWB+RfG0xmFJfRmg/cZgl4KZX7r9OPvTJDC2a5ewfMp9sxB1xpfbi3s/HHM/hbN0vvMKK3jt450KxfA3ZaQ/PEKMfg+eW1XoNFDyPYayO5FHgqfnMxXmrAYPOkpD515SasXYnRRVo+4EHPGnfuacoY+anKcaSXtfx8+9E+zvq5YU+2isO0jyp0UicI+ZlqAzwuk6v0tj/OaHeT9a5x6dw9BgM25KfEq4KehakJeRRtXQiZnqHNh3UT2kbyQzRBbx8tZ4ebdg3ocA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3cef0d-7201-44c3-f913-08db4239b3e4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 07:26:20.4924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NAJsb8tD+ulg0CTYrYYputR/nQqG8WmnZtyIARkklySBD1DAKVPRjcTgLxCCJD/wUV8Ey9drxmS1yQhM8WH+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5341

On Fri, Apr 21, 2023 at 02:26:46AM +0000, osstest service owner wrote:
> flight 180345 xen-unstable-smoke real [real]
> flight 180348 xen-unstable-smoke real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/180345/
> http://logs.test-lab.xenproject.org/osstest/logs/180348/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 180302

This looks like a real failure, adding Julien who seems to have
modified arm32 head code recently.

Found U-Boot script /boot.scr
Apr 21 01:09:28.649633 
1764 bytes read in 49 ms (35.2 KiB/s)
Apr 21 01:09:28.721678 
## Executing script at 50000000
Apr 21 01:09:28.721732 
Loading dtbs/5.4.17+/exynos5250-arndale.dtb
Apr 21 01:09:28.733625 
46257 bytes read in 1849 ms (24.4 KiB/s)
Apr 21 01:09:30.533581 
1048584 bytes read in 156 ms (6.4 MiB/s)
Apr 21 01:09:30.701602 
Loaded xen-4.18-unstable to 0x41000000 (100008)
Apr 21 01:09:30.701634 
command line: conswitch=x watchdog noreboot async-show-all console=dtuart dtuart=serial2 dom0_mem=512M,max:512M ucode=scan
Apr 21 01:09:30.713619 
8651264 bytes read in 489 ms (16.9 MiB/s)
Apr 21 01:09:31.217604 
Loaded vmlinuz-5.4.17+ to 0x42000000 (840200)
Apr 21 01:09:31.217637 
command line: ro root=/dev/mapper/arndale--westfield--vg-root rootdelay=3 ro root=/dev/mapper/arndale--westfield--vg-root rootdelay=3 console=hvc0 net.ifnames=0 clk_ignore_unused clk_ignore_unused
Apr 21 01:09:31.241552 
21158982 bytes read in 1134 ms (17.8 MiB/s)
Apr 21 01:09:32.345607 
Loaded initrd.img-5.4.17+ to 0x43300000 (142dc46)
Apr 21 01:09:32.345639 
chosen {
Apr 21 01:09:32.345662 
	bootargs = "conswitch=x watchdog noreboot async-show-all console=dtuart dtuart=serial2 dom0_mem=512M,max:512M ucode=scan";
Apr 21 01:09:32.357622 
	#size-cells = <0x00000001>;
Apr 21 01:09:32.357650 
	#address-cells = <0x00000001>;
Apr 21 01:09:32.369644 
	stdout-path = "serial2:115200n8";
Apr 21 01:09:32.369672 
	module@1 {
Apr 21 01:09:32.369695 
		reg = <0x43300000 0x0142dc46>;
Apr 21 01:09:32.369719 
		compatible = "xen,linux-initrd", "xen,multiboot-module";
Apr 21 01:09:32.381620 
	};
Apr 21 01:09:32.381647 
	module@0 {
Apr 21 01:09:32.381669 
		bootargs = "ro root=/dev/mapper/arndale--westfield--vg-root rootdelay=3 ro root=/dev/mapper/arndale--westfield--vg-root rootdelay=3 console=hvc0 net.ifnames=0 clk_ignore_unused clk_ignore_unused";
Apr 21 01:09:32.393649 
		reg = <0x42000000 0x00840200>;
Apr 21 01:09:32.405613 
		compatible = "xen,linux-zimage", "xen,multiboot-module";
Apr 21 01:09:32.405643 
	};
Apr 21 01:09:32.405665 
};
Apr 21 01:09:32.405686 
Booting 0x41000000 - 0x43000000
Apr 21 01:09:32.405710 
Kernel image @ 0x41000000 [ 0x000000 - 0x13a298 ]
Apr 21 01:09:32.417611 
## Flattened Device Tree blob at 43000000
Apr 21 01:09:32.417640 
   Booting using the fdt blob at 0x43000000
Apr 21 01:09:32.417665 
   reserving fdt memory region: addr=43000000 size=c000
Apr 21 01:09:32.429691 
   Loading Device Tree to 4fff1000, end 4fffffff ... OK
Apr 21 01:09:32.429748 
Apr 21 01:09:32.429788 
Starting kernel ...(fake run for tracing)
Apr 21 01:09:32.441575 
Apr 21 01:09:32.441601 
Apr 21 01:09:32.441622 
Starting kernel ...
Apr 21 01:09:32.441645 
Apr 21 01:09:32.441666 
Apr 21 01:16:14.755516 <c

