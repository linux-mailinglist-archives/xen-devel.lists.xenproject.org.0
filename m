Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85355234A2
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 15:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326878.549531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomhi-0003CL-6p; Wed, 11 May 2022 13:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326878.549531; Wed, 11 May 2022 13:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomhi-0003AF-3n; Wed, 11 May 2022 13:48:38 +0000
Received: by outflank-mailman (input) for mailman id 326878;
 Wed, 11 May 2022 13:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dmv0=VT=citrix.com=prvs=123c0883c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nomhg-0003A7-Tp
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 13:48:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b548a57-d131-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 15:48:33 +0200 (CEST)
Received: from mail-bn8nam08lp2045.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 09:48:30 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL0PR03MB4132.namprd03.prod.outlook.com (2603:10b6:208:6b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Wed, 11 May
 2022 13:48:28 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 13:48:28 +0000
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
X-Inumbo-ID: 0b548a57-d131-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652276913;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=O61RDtKo9U+/apCedeLTDR0L62zoXpuTd24VXFZsanw=;
  b=W2PEBSdoNqiarpe6K2ODmoLTkiSKognDBvq7jvJbXPYV/oHGE2CXnOsS
   SiQtOtjE37nLLpH9Xd+Ol8nI+K2DV4RZeV9cICPBaYHJHF0t4agwSFByu
   zgbeRsRVRP1irLwhiL0chC9uI2VU1W2RZLD/lFg7E8D6TvifBUUhAPvnD
   k=;
X-IronPort-RemoteIP: 104.47.74.45
X-IronPort-MID: 71064079
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:em8xF6viiD1tY9flqPRh7jWiuOfnVC1fMUV32f8akzHdYApBsoF/q
 tZmKWzQM6qCMWf9fowkYITgo0oHuJTdyYRjHFc/pCA8QnsU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17U4
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi87EvzvwflNTiNdTR8uFohd5rrmBHew5Jn7I03uKxMAwt1IJWRuYcgy3LYyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4AEmmtt7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wvN+/ZvvDm7IApZiuDSb9XKYIawQJ8EgXaxq
 n36vEfFO0RPXDCY4X/fmp62vcfNly7mXIMZFJWj6+VnxlaUwwQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzWgqWOAlg4RXZxXCeJSwB6J4rrZ5UCeHGdsc9JaQNkvtctzTzp60
 FaMx4PtHWY37ODTTm+B/LCJqz/0ITISMWIJeS4DS00C/sXnp4YwyBnIS76PDZKIszE8Ihmoq
 xjikcT0r+97YRIjv0ljwW36vg==
IronPort-HdrOrdr: A9a23:Ft1WRKt8GzQZzMcSXgLZdhAa7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,217,1647316800"; 
   d="scan'208";a="71064079"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQadiPoFfsBUJbLZVy/Q4BjCauJApjBE4CUmIBZ+BI9z+F5CBK5UbQRVx/mJ2cC0V9bsiCjVaR38AII8dESDdDO0YICiND97xlW7MUEZfeNY+VLL8LgoY0AX+Sthx7Xpf+zJ+W59ZMxWnRICrHzQ7VFqLFkJu62BXKyCzujl6vhpGCaCqdCYKa3eeZ22v/+slIVm6tnxkU6U7oAihGiagsQEsph4xJS3zcD0vgAh8/kMDaoGYrUSPbYyyi+UMCZ4cEjD2cj7RDzFR1XxXsKpcdogrtdtsqhcxrtAWQoxdh6g6SMXoW4QXd19P6RfO+rzR+F74PWKGcCnt8xwMIf6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O61RDtKo9U+/apCedeLTDR0L62zoXpuTd24VXFZsanw=;
 b=LOIIYiTyqtFADC4rjHlV7+uoQaFMtrdGzxw05r064cqsIaXOFTa330Pa3ugh+HAX4lAj+foosS/PgIoS+ScCGCdm3WZle85jiYQLYTD3/syXfTeQJLWxIZH3O7f9+cTspDDxDzcrYdtYIqmx0zSQh/yuET/+9/y/68/Xy6C5nOnbqc9nUxKjo8U/r51piXeQ9xA+rfXwSIn9GT4v1gU7/z/TU2WaaM8SMs0LWTm+hmSrp/KYkmS23Ya2CnOwiKMqafDj2XM03d0Z5s7uMwOPs8WpJkOTq1fnFS4t72sithq68F7V58iJr6UCnyJCMZCkyhS88vqZJRKsaFQzWrr+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O61RDtKo9U+/apCedeLTDR0L62zoXpuTd24VXFZsanw=;
 b=q/DPzPtdof5yOqaWfoL00IfIhY6o/Y8KTOVkOQZft1G4cUpzHUpTlWgJlClvtEjEUb2bcSGVK5v5aTBHseu8HnGyz7b5JdQSW45aPJHqWAk/RahYxYpEZMvm0El0qbL1KIaKOkxGmrutgLNnDX1h1DEvXFQ5VY0hjiwu1oSRZ9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 May 2022 15:48:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 19/21] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Message-ID: <Ynu+qM0o6VsaDEfJ@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <cd077dac-c53c-3369-03db-f2e4260ee94f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd077dac-c53c-3369-03db-f2e4260ee94f@suse.com>
X-ClientProxiedBy: LO2P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5eac677-d4a8-4534-32f8-08da3354ed4c
X-MS-TrafficTypeDiagnostic: BL0PR03MB4132:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR03MB413213AFD788CA0E73F935198FC89@BL0PR03MB4132.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M+r/CbGuKveHLXJksANQRf0eBLH1hxogkoMX2Bxuk1lL2/7fzjP5yty9apHmPO19uzgrD2awvVYg1P52+IMGVeufcodasTuAox5OWDDlpLCjKxAq1CIFoXNlYsEMBsG61znx5LxdQCGNoEwja8P2K93cQ3FtvpMiXLkUm83sPqq3ovOnQeJ4JNVVX1u2TMBEVxzK9S1jNL4PMeqkTyvxUxVrUleKCSnX3k+Xh9tn+R/DVTqqZo3OiEyAxM64a5C8HtSjhCHxzxvwH1G62GS9abAa00mlkoOGD6JupQIa0ZBC/RIkRniWSyggfXP21L1b6VMkk8KcX31+G1SO+ul0gfUImAjIqqCp0V6qxTCEIYKHURxRo2NvJEj3lJX+oWu0qvTg2qYnAFUAq0je04J3BNdmeLOdSODWnOIOVNIMMnNmmeklIIYhU+DmTziPAh2PdlMqLAUzNh77jfCTKB5alteUJvEqu3TDJ95IVy2gaWfMC3ATUMo6NevmOZv2C8LuqD2fefkzFmpsrvGO6xvknFHWesjBY1iT+8vpHl3lCdHpu30DVNsKTt9dSD1Tb2PbNyux+7QMf+y/fBN2cKAfeoedmVwlvHugNMKxDW0Thxz81K82/uGQ6nL0IIdLDVoFMVIZYQU2sCPbSF+JevHPqkSo7lBxH9fM+iOqJpdHxKawmZHqTfU7OA9UpsLvPa2+1BaBQ2PMG1RePy/lXsbsNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(6666004)(2906002)(6512007)(558084003)(26005)(85182001)(33716001)(508600001)(82960400001)(5660300002)(8936002)(6486002)(86362001)(38100700002)(9686003)(66476007)(66556008)(6916009)(54906003)(66946007)(8676002)(4326008)(6506007)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUxydUdGWTlWTEZsQmhneVdscVU4Z0paL3N6bHlKK3dPY1RGTDB1M2ZSdnRu?=
 =?utf-8?B?blBhTzhYTE1ManNMQ0ZZWk9xS2x2ZjI1NHgveFdLejFYb3BPdm4zMWFLaWVR?=
 =?utf-8?B?endnSzNOMkdwU05xYUxHMmJvRGE2T2VieVZYQjJEamRZMnFya2RWaVhtSjhy?=
 =?utf-8?B?WkM0OTJnSTVqK0FOYTB4SEhmZVNra3REVnFNMWtxSU1QcHNjaVM0K2hZbXdt?=
 =?utf-8?B?N1l2VGVBcHJBUjMyaVQ2MFg4UUFzeGNYSnRCVEFid1RJaVBISURHT1BhRUhx?=
 =?utf-8?B?SVYwbk83YmhPZnBsekprOWFrRE9XcTV6aG1RYm0zMWl3WVNxNUhPRjVUYngz?=
 =?utf-8?B?Q3NaVVhqSEdpcWM4Y2V2b2pWU0dkcGRHODJUQ3hVSmZBM01iWC9qaGRGa050?=
 =?utf-8?B?VFd0NTdib1hxN2w1eUUzMGFaSkxaekhySU1VbTAwanJIYjVDSFQ5VzREQjF6?=
 =?utf-8?B?NStFTE94MGMwMy9Ga21ZYy9DbitnTGJ4Ry9kLzlRRlBXZGpicERNeS94MHJZ?=
 =?utf-8?B?YnRGOHVhSVVJbFJxdEY5UTZ4RGl0YndaYStSREFJNjVSQ0dCdS9XZW9Id1Rj?=
 =?utf-8?B?NXE3SUZDTDJ6KzdJUWVrKzVxb2dZR2hPdm5UeXRTWWFtQ3ZDck5hdzNJWTlL?=
 =?utf-8?B?MWdnR0J6NTZpSjVkN2U1bzBxbFJjOTF0Rk8rNDBTK2sxSG0rSVdqV0Y1NGxT?=
 =?utf-8?B?UnE2clYzSmlreDlzam1ubnNxVzJFanNiWm5lMWhoV3l5TGRDU3QwVkJaUy9I?=
 =?utf-8?B?ZjR5dDNaS1U2bEQzbnJiajBXMHBBbm1GQkF3MERHcFNMNVZWckw3UXpSOC95?=
 =?utf-8?B?SDM0V3hWTW11NzFmbnVhYnJ2NE5TUERIY2EwcHdvSThnZFFQa2l0d3R2SGpr?=
 =?utf-8?B?dkNvRVdsTzNJMHp6M0ZrSklUb0Y2NUd6a3AxK0tPSE5kWFkzbEJZbU5JQ1RQ?=
 =?utf-8?B?UVpaL1JZam1kaFVKNURZRVZkYnltUlNENnFvcEljdW9VdmxwbTB1M05TL1Qv?=
 =?utf-8?B?bmtKY0RiNWpPMWlxN3pRNlZDSW5EVHIzTklYZjNGZnNHenZZcHV0Ty9OWk9n?=
 =?utf-8?B?bVg2K2xCM3hIQXZmUDM2N3FJZjFHQ2kzc2hNd0ZoZTU1ZE1LQjdsSEFMSTJF?=
 =?utf-8?B?RkEyMUVUUk9JRGY0SklBWFVhcDQrV0FpMFRIWFJ0S0F3SndOMkx6eDB2RmNv?=
 =?utf-8?B?S0hpRzEvSkE4bGlTQXQ2QVIwQmVzbGhueGJEQjBYWVpXL3hYamxxM1dhV0hE?=
 =?utf-8?B?UkF6L21mYkRrbVd6ZFYyM3lKaE1pejFqeUtBVFdpUlVlaS9FaEE2aVdIUWFj?=
 =?utf-8?B?aXQ2ZHpOQ2ZTSFpCbTN6dlNnREduem5HbkNKZ2poWEE4L0NJeithWXQxbjMy?=
 =?utf-8?B?dUY2ZXhLRXpTVitSb2xrQkw4L3B3SG1tRFNqSnFpSzJrdTkyTmpYSzRuN2pM?=
 =?utf-8?B?Yi9yZHVVb0F5TXdyTVhjOURhMU4zVUZaVjV0OGdNN0huOE9Gc05lYWd0am16?=
 =?utf-8?B?eEszZnliMWw3Z3ZFYk40V1FUVUFyOSt1ZFVIT3pEVXJwMmlzcVVCY0s3U0NR?=
 =?utf-8?B?SjdWZDFtaGlTUjdCTExLRkUrMCtyU29hZnFNN3R2Vkh0QkV0N09zeVd3KzJv?=
 =?utf-8?B?YkdRejJJTTRRb1BBdEpvUlpFbzRES01nYXBSdGYrNnVYTGgzdklieE5SZE9j?=
 =?utf-8?B?dU5QZXR4cis5Y0loV1ZZRjdEczYyN1lkL3AwVGhwb0VaNysyUlBoNEs1QzhT?=
 =?utf-8?B?Y1o0YWdoWmMxZnF4d3ZHNDVINTNicGgrOThTVGo5Y2xXVmZVYzhDYkhCSXJ6?=
 =?utf-8?B?ZUJFSWU0R1QreHdqU2o3YmhEYjNzMWN1U2lUcStBbUphM0d2YjZaU3JUWThs?=
 =?utf-8?B?UmJZYitTNC9NalA5c1FuZk50aWt1MHRKTXcranJTZkh4eWlkYXZySkpORHQ5?=
 =?utf-8?B?dHNoZE8vZHAwWkV6ZTJhTERQSzI4K1N1OHlDL1pCZFUvSjg4OGIydm01elhK?=
 =?utf-8?B?L1I3Qm12aGhEY3BGVlRVaDFmY2ZoQ215aFZYUGVWT1RHaDdNZzJBSWY5VG55?=
 =?utf-8?B?MUhIQmYxZnBjaExhMHZsaHRFWkxRN1lRS1p2UXY5dkhoeWdndXk0MXpPY2Na?=
 =?utf-8?B?ME5pUXFnV0VUc1hkOERGVWpQd3BHcFlPZmRaanI4b0hJemFVa3phYU9iVThL?=
 =?utf-8?B?dngvbXRFUzUvNkxRNjRlU28rcmtBTU9VaEdjZit0cG9aMUdFSzNFWEFTYUxp?=
 =?utf-8?B?MVgvN3lZb2I1ek1PcnNkemRRd2ppU2NXQ2Y5K0NxTFhqUU8xdzdKRzQrdnZF?=
 =?utf-8?B?Z2cwZnpYWUFxWEFhaEhYYXhIWnIza1gyV2F0M1pWUVppSTIyWStDL3FjbDkr?=
 =?utf-8?Q?ub7p6OmvHdabF7Fs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5eac677-d4a8-4534-32f8-08da3354ed4c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 13:48:28.0634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJqN16hLRY/99c3n1H2mM7/ig9Eu11X08vEM3zZImT+74DYEm0Y9Se6fX2IRco9O633TqBq5YBmv889RLuaHLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4132

On Mon, Apr 25, 2022 at 10:44:11AM +0200, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin tian <kevin.tian@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Would be helpful to also have those per-guest I think.

Thanks, Roger.

