Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2180629E93
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 17:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444010.698772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouyY2-0006Dm-Mq; Tue, 15 Nov 2022 16:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444010.698772; Tue, 15 Nov 2022 16:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouyY2-0006Bk-Jj; Tue, 15 Nov 2022 16:12:30 +0000
Received: by outflank-mailman (input) for mailman id 444010;
 Tue, 15 Nov 2022 16:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxYI=3P=citrix.com=prvs=31178c1ec=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ouyY0-0006Be-Lb
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 16:12:28 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4959b349-6500-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 17:12:26 +0100 (CET)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 11:12:19 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB5968.namprd03.prod.outlook.com (2603:10b6:5:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 16:12:17 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 16:12:17 +0000
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
X-Inumbo-ID: 4959b349-6500-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668528746;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=v8GCrpAdrOkqukaSE7PdOYTuADv75JEodjgNPozj8Ac=;
  b=aapPH1tpf0Ca2fgKvcgw1HBrBvc1UgdrhWeLfp8vC+JJKa3nunVKv5we
   ywoJxWlrux+MxK0w1sT3hsBVSCJBykHoU8+kcydSyo7BFXCt/EwbMdDdP
   mWaRHs1in+gQc9qKfeexnwhV+LJHGFM3MFv2/SgqZr03L+JojStrBz9AR
   c=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 84455575
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9FifTqpzBh4Yk10BLTKOAqgOgiVeBmIrZBIvgKrLsJaIsI4StFCzt
 garIBnVOPaOZDbyetwjPoznpkJSvcKEmN9nQQdlpCgwFSsR9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHziRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABQhagCvutO0+7Llb+k9gNR7NfXqPLpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWPEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTCN5OSeDlqaMCbFu7m34tUwwbX0OBhvDkhEGGWu5gM
 3Qk0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO0cSCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRUciaCkeXE066t/siIgpi1TESdMLLUKuptj8GDW1z
 zXUqiE73u8XlZRSiP/9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcrlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:EAgq2KtJw4pRCzRyKInTTvcV7skCHIAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LsxmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2z2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD8nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MD40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFQLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/bloQR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZPfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIViYcLQTOuNSSy5uwKzviUK1/NHggFi/suqqSRg4eMCoYCaka4ORITe8jJmYRtPiSUYY
 f3BHtsOY6TEYLfI/c34+TAYegtFZA/arxhhj9pYSP7nuv7bqvXi8f8TNH/YJLQLBdMYBKOPp
 JEZkm4GPl9
X-IronPort-AV: E=Sophos;i="5.96,166,1665460800"; 
   d="scan'208";a="84455575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mvt3qf5XhDkSCMHeKmWEowcRSSkmZi4Mstq5x3xfuLfC2JulGaEgeEBa+yktqI1BBe9ax4zDfozMtYaxN74fGVzwsgVFGU4K/MotMi8E/hmoj1clOebxEgTwbAarcQYgvUPMrDwJDwtOIk3vEMZqUMCpIwK/w36AEi72A2+QM3rp+l6VrpmUWnY1P+9gNAmKPZmLWPHLWbnzg7TCzAWjAouqtSiD7IwRS7zwNJyTU6zo2XXNW+CEv4cOOMCa2BEBySV5xW568FLg8x1g9PGWaNCxXMAzdg3VP5JFDTUX5+3wt8JWRdeENmPRH2FQsVHmbL6s3OLwG1uFuQWeGU2VEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVs5NBjHeAMY0x46s4TBtb/ZqluXCirmz2KCHMrmTr0=;
 b=izNOfm/UpgeRPEcD8zh/fOE89/Aw20rL0Af7rsIBo+nbQhS6suGUFh2k7K0jOv+L5+11hXj0pHx1xve2gqe5+4DJKPq14cHr/osacHOKIL7miQiinkC0aVTR//cFdA5iVEg8HOjj/lwOgiYiMWv7fQVrWUb3Qosz9PhVZeqj91ubZ1iAtrvXPM3NV9XqFYZuMfA5j6Ibc1zBGu2S9NN8VqhoU1H7Vr0AEHLSWLOQHFQ9KdReGe2zHBX149dEEhRfpa/MrNDzW8wAU7oMi1XN72HVxZjJGGhrt1oZ9r+CVzVQSdO+asLQSG4mYQlvuo8/yvcI56SDTclZVQXZs99Asg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVs5NBjHeAMY0x46s4TBtb/ZqluXCirmz2KCHMrmTr0=;
 b=vxEPxP9OtjKeuHlt9LmuYJTrUgTvk0SRytWFyK2nPf/t5SGRCKgfCYPbXq+lBXjvbm7M5uO2BQ54gWkmSD22PPNybAxox6TbMjvMMmr6snNt8MXb1+bk20Cc81dQPoe8uSwDbTqNr+PnRCzQNeDq6ZrUl6VwIrJ9ctHMfvRQ+s8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 15 Nov 2022 17:12:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration
 support
Message-ID: <Y3O6WhMtKsFdJAbg@Air-de-Roger>
References: <20221115003539.19502-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221115003539.19502-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0517.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b89f0f-fbe7-4b9b-f4a4-08dac7242a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5KlX11qOkAee9p0PVTdYsNhHobq04yS2+ZPcpUECpnoOrUZJqKFOF3M0QAIave5MiQ9phi/en3lvi9yfrVT5fCHxWwAyC/Fh3HAK/Eqgb8zRhjvqLCtPxFAGeawFlShzgPWfuDKZQ4cqcGuLuMADjY6q0J85IQzjcjSaApIfBnegMO2BL6wcmXzWk7ly5sLDf02wDgKgiCQu5XZQHLKSUkp6QLdTknCfJwntK9geqM1dk7uJp6THkb/z6gvnn8IZQXRn35KqPEr3zqDci7oJgIA7mBeH1gZHfMQZRkshyq/BGUjB4xfqTvGe2RB9KtT8cu1Qdph6KZ+HBGNIZSOUHnC/4s/ezj60TJ3a9tf3QRs0Aegca0WOw89VG/Gk9ybBIi7locHXdt1H1yO5jEo73qahT8QqwuQlVObmmiVwUzInTsw/D1JWf6R1LmO7wPnwie63H1TSVYoIrLwcPmBQDvM3OGwm47SM6Vsz73PkYJmw8ux0iWW+NSpBNtCLVevJq/Mcx/o8rbNtoPXofzQmRaFhtcbQbFzJ1bpr8VzONHo0sjGOVHIND3Vt9jZ7BlOTzSxIAUdSLCU8Iazgwp7m5rbasTjFMcYAzXr0KeAv1CuRUrEEl6SrdE2YVAjrMOleJiJNSMXxvthBykf6ALsorEBRB9dDpRDGT8WHhihQ4V1ppVju0ZMaLEZO+HkmAgvhK5VsM6Y4dKz5gas7ZxvEUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(5660300002)(41300700001)(2906002)(8676002)(66556008)(66946007)(66476007)(316002)(6486002)(4326008)(54906003)(6636002)(33716001)(6666004)(6506007)(86362001)(83380400001)(186003)(9686003)(478600001)(26005)(6512007)(8936002)(6862004)(82960400001)(85182001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEZPL3haL1JEa1lIbExaUkNEUHdGSmdJZTl6c2RmVU4rYUtWc05GTG1xeDlr?=
 =?utf-8?B?NnE4TTAyeEtMRGRMZENabURIN3hrYXBOTGthRWxPV2hNTG1ZdStZR09MWDNT?=
 =?utf-8?B?cmIxdmErOHByejZZZnhpWmcvSlJkS3UrVy9pUnVMRHlXcVR3L2grYlMxL0RX?=
 =?utf-8?B?YzVpaUtzSEs2U2JpTnhTNDFGNXFiWFpBMnc5c1lzSnlodkpSYzNtampvQVF1?=
 =?utf-8?B?Z3pIcFN0ZE9EOXdDaFpOYlE2S0NLNlJpcHVCdDRqUGZkQW9oVGx5NTM3OSsr?=
 =?utf-8?B?M2xGWTN2RUJKR1BRM29xc2QwWFVpaGtyNldiVEZaYlRHcVFzbWJOTW5Db3Vt?=
 =?utf-8?B?OXFFbjN3dmZtY1kyU1c4K3pYNXVuMWhkRHU4MURuWTJXcnJiWjFQWnhja2Y4?=
 =?utf-8?B?UHhJSDRBQWZPS0t2UWN2M2NPalUzN3IwTnZEcG4zOTlCb2hDVlFNU0VlSEEy?=
 =?utf-8?B?aDB0NnB0TWU2VExYRnRuWTlEcXJ2Y2E2NHF4YmZyNHkzM0lHWFdURWtBa29H?=
 =?utf-8?B?L1FWRFZMM3VBTzFtcjZmQVBuajZxTEFmSHU4cXQwM3BBemVQbWQzdzJRME1L?=
 =?utf-8?B?b3lySGhjZVE5d1Z5Ui9CNEplWWxsQUg0d1psR1htZHVhTGRuLzgxUEZiMVI0?=
 =?utf-8?B?UjdnK2xpbFF2bU5Xc0tnVERGSCs3RDNrc1g1K2lIQ0tjQ3hKS0Q2aXRsVzNn?=
 =?utf-8?B?RG1LaG84bmUxU0xLeEE1NEFGWkljR2NTdlZmL1RKOER2c3IybFY2SnNHeFJq?=
 =?utf-8?B?TVdHUFBDVXNxbFVTaXNZMmZWeVhpM0xvZytEaG1hUDluTEFYRGJ6Y3BqUUhY?=
 =?utf-8?B?eS9nWHY2LzlxODFRcGNRaGRORWlzUVd5V0xjYTZCbzV3cnFsdVpyNTUzeTFK?=
 =?utf-8?B?UGZDc2tNNVk1eWp2VkFxWllhbnJ5WmV6aUswZFU4dmMwODZjTllqc0ExRDJM?=
 =?utf-8?B?VjZUeUNwaWJZdHkyQWhTdFpWNitwM1ZrcG56K3JaUTJHbHB3WUpmV2pkeUdp?=
 =?utf-8?B?SEw4NmJWdFgvL1hRNkZ4cU1QWVhvZ1NpdVZzdktTc3h6YzFaRnY1aEN4R2V4?=
 =?utf-8?B?cUhLVHUyZTgwNUpYS2x0a0pjNkJPcDUwM2Z5bHJ5WjVjeDQ3QlZMRkFqZ2xR?=
 =?utf-8?B?ajJrS2NEUWJ2RnZOQnZXV3FQQTZ6R1B0ZXJTV1R4VDZYclRuNmFIZTN3cFBn?=
 =?utf-8?B?aWZnNlVCU3hCamhjZ0pRNVFlbUNlUTNleG1OR0pObmFwbWZReFZraHFkM2M2?=
 =?utf-8?B?UUtwZ0NsMjhDT2t6T0l4ZUFUZjMvQXJ3MUQrSnB6eWZ2ZVVQMjVGSVlnQXNH?=
 =?utf-8?B?cEdLYUJwUjI0bWNKKy9zSlRIYXFRSjRyc0Y5dktvZk1oV3lUT0FRSm5BUFBF?=
 =?utf-8?B?ME5ybk5qVS8vcGpVbWlWRGxmTWlkNk1jZG1hOFFXZlpabzJmYUkwVFppL1dn?=
 =?utf-8?B?TS9EWkpLMXdtcFBmdmw0UjJuV1ZoRnZ0TDJXRzF0V1VleEtNek1MTC9tdjhs?=
 =?utf-8?B?YzRVVHBma0JkdXVXdmtTNmVibm5XTFZ0UWRaT1g0SStpVTc2bHRBclQ0MjJj?=
 =?utf-8?B?K3FDbjhNcDNyMGEvRjlGdStnOWJxWCtaRTdkSXlWbXJ5T1JnOEpiR3AvWVdM?=
 =?utf-8?B?ck5rU2ZWMTNqVWF6ekF6SmVLcnF6OVBvZ3ErRU1PRmR2ZFFWSWtZT0RyVDY4?=
 =?utf-8?B?aDN3TElqQm9CelJTSCtOWmMySFRxaDcvQ0tiNTIzRVRPRTduZW5aSFdJTkdZ?=
 =?utf-8?B?SEFvQm1Pd0RzbU55cFRuWHBIbnBOOGZHMUxOcTNZMkFqWlZzclpxVWh3SGNY?=
 =?utf-8?B?MjZGSmdMMXlZT2NNcDdKOXlnNXBzSHU0UUc5eG9uYUx4VWZoMTRRY3pVMFNt?=
 =?utf-8?B?eXA3RlFVLzE5U1dlTjY2TWpjU2pTdEJZeFQxY054YW5IYXBMNmJZUFNQWVNC?=
 =?utf-8?B?Ni9QZ2wvRlJhR2YvSE13Tkdvek96VlpyOSttOWJieXFrWDZBdGovVGVqZXhT?=
 =?utf-8?B?WU5GOXJndWdDelhtU1NVM0J5RVc2YVFpdEF1TUxkTDJVN2pRcVVVejRrK3Z4?=
 =?utf-8?B?MUJiSWllRmxublk2VlZRRzhSa2Y2ejZLaXhxQi9iMGlnWEdaenkwck94cElI?=
 =?utf-8?Q?lZ3ispl1wsNDwr9ewqha7L1pp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1PhR0KjHpBriUFuPPyckUiw1rvB/ATnef9HG9Zq3cQe9anVLFOA9DKAAXq7hWj43YVhsN66/+th5bsWbTz0+akrz7bOEhkEUEsFrm0LQ8enaph8UNE+1VtSyCryKgm3zwCBmd4jREnKNJeGh/7/ojcpYaiQ7rPgsnKAbWL7b/cU0AXKaTno4pEXx89tqWMNYlcjBtmnkrow26V7NX1sodBaP6Cf1xqUm7YxkD/pZlpYGn1CnNA9Ynt6PTQYiPylcC6M23mnP6Pe0C2oWpO+Oio8WPY+oleXCLMqenhPsHMVEZaPby1EIUE9nSw+odgajhLLFN9cNF/slPVP9Wwf9oBn+h3tSlG1do/LiLvRymBHR+rGCJf3Sq38hj2zHzzXvjep3SDgnbapAJkeX2iqErk85zhdkUArz9tvR3+laQ38ucwnzNj/a5rrs8fto0OAzwAPkdBfH7KvSqY7mo2BhXfsC4g9UOv2dbM/QZxWCuU6l0qFE4aMBRmzn7p8Q7youo0uGQzqgIzmO8zH0ojOkCtdRh4IGkXQ9igekyPsGLQMFB11AiWiQQaUY48Ut6EIWOzot2TixrE1EjnujQ8KqWsMwSBupNYJ5PQJWLSAnhch0p3lGHMQkTiF1vkemoo9r7CpQZMmSzck7VUtoY8Qp2QDjONm/YbMWCo+gBtTyDAP8LCDzIsseZLNDuRpTQwCqRMcy3SEG5q1wTRDVEqFU6Z7NB0lDTCpFYRSXNQ6giZtx1EuciBm8geEzmWeEZHEeGpdSGPS4mAKG/Tsyhvrp5wr+VcoTUyKlduMmP0dqe9Qni4V5qFic77HzlR2kfYoEBpSoUXuyHnZpGBb7azWQTXBBcht9N2UbPGtSdp/hu7M=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b89f0f-fbe7-4b9b-f4a4-08dac7242a5b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 16:12:17.1953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpOz5R2Gjjyd/MZs3r6EPIdfePwg/ZQdsGwO3JGIp1wYvY6sue6yHqddI+/tDbpn4/RbSRDOpZ2PhKe9bklyTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968

On Tue, Nov 15, 2022 at 12:35:39AM +0000, Andrew Cooper wrote:
> I was really hoping to avoid this, but its now too late in the 4.17 freeze and
> we still don't have working fixes.

The fix I proposed still has some comments that have been unanswered,
but at any rate thit is now far too late to try to get this fixed.

FWIW that same fix was also posted to the security list way before
hitting xen-devel.

> The in-Xen calculations for assistance capabilities are buggy.  For the
> avoidance of doubt, the original intention was to be able to control every
> aspect of a APIC acceleration so we could comprehensively test Xen's support,
> as it has proved to be buggy time and time again.
> 
> Even after a protracted discussion on what the new API ought to mean, attempts
> to apply it to the existing logic have been unsuccessful, proving that the
> API/ABI is too complicated for most people to reason about.

Are you referring to the VMX hardware interface to setup the related
APIC assistance flags, or the hypervisor interface to control those
features?

> This reverts most of:
>   2ce11ce249a3981bac50914c6a90f681ad7a4222
>   6b2b9b3405092c3ad38d7342988a584b8efa674c
> 
> leaving in place the non-APIC specific changes (minimal as they are).
> 
> This takes us back to the behaviour of Xen 4.16 where APIC acceleration is
> configured on a per system basis.
> 
> This work will be revisited in due course.

I certainly regret having been involved in attempting to fix this, and
I have to admit I still don't understand what is broken with the
current API/ABI.

Do we want a flag to control the setting of the APIC register
virtualization feature?

Is the naming for the flag that we expose incorrect?

Is the field where the flag gets set incorrect?

There isn't that much to the current interface.

In the previous reply to the fix however I got the (maybe incorrect)
impression that current bugs in the implementation are used as a way
to justify why the interface is broken, and that is not accurate.  The
interface and the implementation are two different things, and bugs
in the implementation shouldn't automatically invalidate the
interface without further reasoning.

Also, for better or worse, the current domctl interface where all this
is implemented is unstable, and hence we are allowed to make further
changes as we implement more related features.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm not going to oppose to the revert, but as said above it is still
not clean to me what is broken in the current approach apart from
implementation bugs, hence it's unlikely for me to revisit this work,
at least not until such uncertainty is solved.

Regards, Roger.

