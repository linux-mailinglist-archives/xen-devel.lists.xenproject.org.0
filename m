Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59525AF75C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400447.642213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgT7-0007oo-53; Tue, 06 Sep 2022 21:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400447.642213; Tue, 06 Sep 2022 21:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgT6-0007jl-UQ; Tue, 06 Sep 2022 21:50:52 +0000
Received: by outflank-mailman (input) for mailman id 400447;
 Tue, 06 Sep 2022 21:50:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgIK-0000Cs-GO
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d91f7c7-2df6-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 17:11:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6827.eurprd04.prod.outlook.com (2603:10a6:10:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 15:11:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 15:11:26 +0000
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
X-Inumbo-ID: 2d91f7c7-2df6-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz+xqaB9PY33Qj/NrKXNYyRdd2ys6wsXzpRVBSQIZyWJzT098amWnoukX8O/Poha4FwyKfWDyNAfReknYCCKYUn6oJRSsrLQe8+NYMrzpR4PQMvBSK4yGCHNzatl4d490mT7wOtfPU1kCLQqZ19DFBxb8SYaqg6j0bN3NghxrP5oXPo6iJRMhO96bm8x1OX6ZaswtSTPjSCzDpl17eDUptLUAwdvjhfGdl6RPKFrMTcMKJrfQhfJGKh4kQQQgiHOth3x3beIJvSdOdwtilDlHPD6nO/HgBEyAW+AG3Yis8hdFmBp/d1kK2x/o3C1nXs1FqyuQXtFLGHA3ZNUW0QH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30Ay8RqTnTPXL961VxLLliKVEkAYCeGeNk6oKO1WFQM=;
 b=ch1GXyLOQd1scsTyYfMxn2PaDXaiYYKG5a0m/oxbYFqUI9RWkJbicYOJO5HnYAtPhkxKIx7m8GML/luz63DHaQkHt9NTw/L5omv0zMxQRELZGyOE20hGgzQb8DQIRZKrKRSbSF0Yd3ITuXC1okneQdDUe5F1+awFhZrmQ3j89Kj/NGwB+CHdKUgoHUmZQgXBV/6Y6MBsYu9EsUAxNZfBScId8nJqqWMzahuwiz9DAUKnrZIVPgmGp10eEdxcqc+dK6N5gJkqkKufRqKYHX9bMLjMSC2iwPhvho77oQ5XXPVwxENYMaC5yMGeLbQa9cF5KtnNTrEajXObRuaFNaqmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30Ay8RqTnTPXL961VxLLliKVEkAYCeGeNk6oKO1WFQM=;
 b=kFlO+yxqYfd3txM18Ro5Sf1NKkJk1l+XVUWYqU5wOIdxFoAIcnhr6vdI+NC7eXraHGcG2AbsfN3Wk2h2RmbHyOdoISu7CO/DUBkejnhNWP+lsdcNX6QGe91jqimJVWu0FDZVnfv+ApzhyRcNgrFPz0lbniQPkcZ1eOgai007m99prliii7Wr6j3XTHIH7SFvVwHWUHn/HFHLwkg0JbT8jF5GbirI6uSUS2Y9RBWC+Rvfrvw7eLrb4utJgHXVqTjBC1YP+uHt35K/rmiXfGjVDUkcpVvQ/sXtIF0dryeWMEc4UbqKvP74gZ7MrgRElzHp0a11zpUZSS4IES4a+10BQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f7b3495-7963-fa4a-f4c0-5b668238d337@suse.com>
Date: Tue, 6 Sep 2022 17:11:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 00/10] Add Xue - console over USB 3 Debug Capability
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa5ea817-3f82-456c-77da-08da901a1130
X-MS-TrafficTypeDiagnostic: DB8PR04MB6827:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Klrls4rd2eAz0dwz5XEwFcvbeeh5B48QEEo6E+Phrpp7xdh0BxM3hYoJ1ONKk4lao8FRsLzet2oTShYl+YAJQjYaHXQehOI1aDaSjMEWsfWb+OSbau/C0M93khVWyW5evcQVplDKsxAYbg7TW+fkDjlQ6ehPcdqxhWbnR5SBLqbzrK7PJc3nUoPL4JwN20I6B1SSit566mMzVtu2G5iDDc1iGByOcGnRTMbm/G4eZ+RPu/747XJCbRlhU1gntS97cQqaGWiW710auGDfPQ7KmvqUEY+xeML8DOX1/iRyKGiajYVezEC48jLw35HMweRz6HqlZaC2OLWND53NhkDWEr3wERKiPNleVXn/WRlAS1iKWKTsJYnpDr5o/xWm0fyIm05rGx20tuVLJ2r7scxHf1KNRjlimgSfqWYSahXYCfPDk/56ieUy9bAGTs5DYtfLCKamqLE9CMa4bMjYnWhOigRKLfef5nnDvlOEBi1rAbLW07lI1+yP3Uqj0bxlDQuyIrFIo6ie77nMOmKF2AP7tAhDKetunXZb0FKECICPP4Vaz9t2Z80zaAY/d52zcpFU9wkyOzqo32bEovohliKWLcReSCA/c3rsA9Yotmc7+5ASCJzEgKXX3Sl4oNTlriEVMnx8gRfMsEZQCudihdMUp1ZUWru7U0MiSeIomaCi/ZoEPcQf+yBfc0Ho4J6wcUYtVgxEcaTNGt0VGTnQu2bclR1BovL4VmldWH9otfT5KaiZe+DwHL0hLqnJHTOet8DkzWz+9oJosXrzkiio8EMeovDGTgZXdb+6uVS0zavjyqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(39860400002)(376002)(366004)(6916009)(53546011)(31696002)(4744005)(86362001)(31686004)(38100700002)(36756003)(316002)(54906003)(8676002)(66476007)(66556008)(66946007)(4326008)(478600001)(5660300002)(8936002)(6506007)(41300700001)(7416002)(186003)(26005)(2906002)(6486002)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QndqRFdxaU5rNE1FOWJWVndVSnNOSXpYRGNGb0dMUENITFVoMlk0cGtTNFFP?=
 =?utf-8?B?Q01qdytTTGFVK2o2cC9KQk1sYVJnTkZtRVZTWVNBSmUzVmNBUEdPWW9NVXFy?=
 =?utf-8?B?Y3hzZEdvYVh3UW1UMWpLNm5udmhBRGpORVI0WEcwUmRRVTBDeUhtU1hobHhZ?=
 =?utf-8?B?Z1htYjM0azdMYzBGbWRrR3BsT09hYXZQanhnTnBSaHltQ0xJYWlPOU9LUUdC?=
 =?utf-8?B?Y2R2RWFtSGEzaS9TWXF0NVhROUlMdjRmbGVPcngwdnRlTW5iVzRjZllKTENT?=
 =?utf-8?B?bE1FM1IxMFBLM0kwRWI3ck95ajhsOFV2dmVWUDhsQ3k3Z0xIMVFsY1dtU3FL?=
 =?utf-8?B?SzUvdzB0cHJOOUo0NEdpeS83NldXSVZDWEdaWDNmdzMyNG5NT0tkUDNXblpq?=
 =?utf-8?B?Q012bU1EWDJXNVc1K3FQY0N5czIrMUh4MmxpbzRiUFFmVkl1dWhONHNkZHJs?=
 =?utf-8?B?Szk4SHVvOEYyRTgyeHUxTCtHN0RDNnNtSTFzRHduMGEzdUhwRFZzWlZhL0pT?=
 =?utf-8?B?Z1hjMEgzeEdaYWRnQlZJdUVKcjZ4c3lGNnczVTl4YXFMM3pRZ0h2Q2xIcjQ3?=
 =?utf-8?B?U0ZZdklqWnh5VERjd1F3eC9ldktCNjJ0VW9Id3crVkJLbHU5SWhLYTExZUpK?=
 =?utf-8?B?dVNJcmNHMEg5aGNGaFdmUGNYVzVma2t5dEphM042NHpVQ2tLM09ZcnpQa2Vi?=
 =?utf-8?B?Tlh5a0xad2tZY0EreGFHdkVyOVhXR2docTQyc21hc1pybHBpRTZ6bCtvVThy?=
 =?utf-8?B?MTR1YTVLT00xdFFLbTQrUFRDdUpuRXBVR2M3QXFEKy9Kd3RSWnNpemw2NG0z?=
 =?utf-8?B?bk5zazVsN1QzNktad2NEaEFTaU5xaVA5empxNDg4Ulo5cU5ac21nelhVcWZI?=
 =?utf-8?B?WUJsM3NjbDdqQlN0VUUyNVBnZDk2RGFydmZINmNlK1Q3dHhCYVpRcDJYUVBP?=
 =?utf-8?B?ekc1bVRzNU9ocFp4cWJEWEJzNUNYVDgxc2RrZGV6ZXFUcGk4bXR1aFcwbEh6?=
 =?utf-8?B?aHVkRHZXMEJzNGd5bnRwckhVZnFoT0hINnU1WllxamFwVWMzSHc1NXpoRkV2?=
 =?utf-8?B?K2Fyb3ZabVFSTGhVSjFOTjkybGxRTWE0K2g3bkhWeEozWE4ySEJvdU1PMTlW?=
 =?utf-8?B?M3lTa2g4OUlUWUdvd0xZK2w3WCtCT2MzS2c1d2ZmQW9WeVVySTJkU2RnK0Iv?=
 =?utf-8?B?SUtDcmF5ODhLd3hpbWlRdjgxZ0ltN2M4S1UxaVVPYWIySk56Q3doMVRQdFl2?=
 =?utf-8?B?MGQvLzFaYUl1dUtHTDFZVzg0NEd4RENPQm1EbG9vdndQUVE2N3YrUGRlMFJW?=
 =?utf-8?B?S0VHK1ZPZlpWZVNnTUdScUlOeEpncW45NFdVR21HNUo2T3ZxRi9yZkx4aC8v?=
 =?utf-8?B?c2JYdzIyQ1J6SDM5Ly9lZlNZSTBpL21YalhlQlRkbzNhZnl0ZnB1dkQ5Nnp0?=
 =?utf-8?B?SCtqSjhRM01ETHVtWE44Z0ZVejRQbFVrR3dvLzNsd2hTNmV3OENqSFZpTTBs?=
 =?utf-8?B?YitnaHFJL2FrWjNWM1BSVVlyZXE5a2R5a3RkZHJFNUh1L0pKN2E0azhHVWR6?=
 =?utf-8?B?QlRoVFhUQXYwWWdsOU9MaENMdDdaVFd6ZUFOMThCd0RrRVVZemRyRlpYS0VV?=
 =?utf-8?B?V2diWGoyeW5nalR6ZTRwcVY4b3R4VUxTbjlTajJvNWpKS2Z3NFZ6WDNiayts?=
 =?utf-8?B?Wk5rTElFamd5RXl5ZTZRSXdOQTZrblMwV3dFVk1pQmEvQ2RVNWN6SkRzOVJk?=
 =?utf-8?B?c0pOZzVoSlBweUttdXBNdHJHa0NHdmxMWlBDai9RNllPOVlXOUN3eS83STFP?=
 =?utf-8?B?TWdJOE92Z2Q2SXZXUmhUTlcxOWZlZVN3NStXWWtFQ0lwaHFGdklPd3BqLzJB?=
 =?utf-8?B?UVpTUGRWMTV0WTd3ZkE0NDFPejFDL0NyZWlsVnl3NkRuTmxuSDFmcE5kVjZl?=
 =?utf-8?B?VUVlWm0rT3c0QWNqU3ZYb1Flc01TcXk5bGRObHEwakVpZHNXZ0o2MGpJY3BL?=
 =?utf-8?B?SG5vd1NLUWh5RUxoNDVCQTJVclJIRlg2RkpVSFIwdEFnL0F6dTR2Nk9NdW5m?=
 =?utf-8?B?dGFFRkxpTmdpSWpRTXZxbWdFM05JYU1jV0FXd1JlV21pRStMRzE5d0hQZUgz?=
 =?utf-8?Q?Lnhw8TaCM6OCK+YwJG5XYkb3N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5ea817-3f82-456c-77da-08da901a1130
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 15:11:25.9066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DG7XWNpB3IrwVhPL2FtR6G2JuuIsEHyu1q75yWOaQPCorgz7TdoZd6MGb8Xu45r5/3/gfyYgWcqInCP2MlPrcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6827

On 02.09.2022 15:17, Marek Marczykowski-Górecki wrote:
> Marek Marczykowski-Górecki (10):
>   drivers/char: allow using both dbgp=xhci and dbgp=ehci
>   console: support multiple serial console simultaneously
>   IOMMU: add common API for device reserved memory
>   IOMMU/VT-d: wire common device reserved memory API
>   IOMMU/AMD: wire common device reserved memory API
>   drivers/char: mark DMA buffers as reserved for the XHCI
>   drivers/char: add RX support to the XHCI driver
>   drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
>   drivers/char: fix handling cable re-plug in XHCI console driver
>   drivers/char: use smp barriers in xhci driver

I wonder in how far it would be possible to commit parts of this series.
Aiui patches 3-6 belong together (lacking a suitable ack on 4), but are
independent of 1 and 2. What I can't really tell is whether 7-9 are
independent of 1-6 and could hence go in.

Jan

