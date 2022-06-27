Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11155B819
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 09:07:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356251.584359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iqG-0001o8-88; Mon, 27 Jun 2022 07:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356251.584359; Mon, 27 Jun 2022 07:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iqG-0001kg-50; Mon, 27 Jun 2022 07:07:28 +0000
Received: by outflank-mailman (input) for mailman id 356251;
 Mon, 27 Jun 2022 07:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5iqE-0001ka-T9
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 07:07:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc582053-f5e7-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 09:07:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5114.eurprd04.prod.outlook.com (2603:10a6:10:23::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 07:07:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:07:23 +0000
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
X-Inumbo-ID: cc582053-f5e7-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nnixr6Pjz/gDyHB2xp2BZSx44E2hdKKUYEjSmMlQlzZ2pTNy+muKMCy4FPMo0vC3aZepABIz9zo5OPaCNwnHXn9R/pE5s25A2JUgVQwQ7xJNT3poR0KTTzpOVpqgXSA0hz9XzrwLGGlIoERVD6IeaLXtbwOYb4I/7bvghh6xAuzUbIcAEbliSTxx/d575ImXfESduxKBRuZm3BYAh8TsCrWG+fOh/KIb65T0dzOkgg5LtAgfgN7usAuO/GRJlyPuFXjXeMHuRq0sF66bp29YBziCOFHqJrY1eENTRU5FwVXcE40GPwjzJsCZv0B4jCQTj97Frk20xHwnmHkF49JLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyNRVA2XbKy4GSZCIKS9HX6j/fWhaaFlcY0oqCINqjQ=;
 b=Rr66vi3YoTa+EpUySQR5CqLaxyU/6zhRI2J0SNEm9sTYJHTu0RkWBTFNuqzUjzfJOduH1CTsHmsrwWNuiC04oMVmeCLu+4SqGZEw89FLdJ2TfBLSaspoHuqIVuXtl4RXrRpPPAag100roQ2NehtnxE+hwGJ2mvIDM4rdbOeK3DCGX12oSjS+L51Rbeou1PyQj9I5SJp2fxmsV1z3yEo38vV42gd66Dl7m4UcobNhY8QIj2PtZStYGPbwDZADqVQcjemxF4fTtlY1r604X1m6FKS736a4tuq0YT0+MM6UPbWE3xB+ESikJaxjBGioBfLdTNRppTkCEE4LLYPMgPLyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyNRVA2XbKy4GSZCIKS9HX6j/fWhaaFlcY0oqCINqjQ=;
 b=EVe/lmX5+277QkUpqfcSo1SAZCPVCfcPyvhnzDFSMt/bK0G64K72OzJ9+0pTF2s5pu5Wbj2qzBwj2hICJRAusG9NFY1fAHAkMqMYYhvOTQMmD7bSdvu54eWX1IfFHUSJA1NPkvfzHMh1eZ02MCm84OUhPtQvkP+WxBTE/g68U+/rkliUiB6cGxst1uhuxi9NacXxuPifxD5wN03QLQA8WQxWJnIuFY3zNytBFhH0PVDnza8ZdrvluankUDF9wA3Yt9aZ9gdulLpnqduKrRhf6GYW8K1viF1oRI4AsYabUFkqpQ4KQppbK6tIz8axgIkDRtSrMihuCSJRJkupjNSxxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58f93ffb-a943-bf7e-52a2-5c72a59bb070@suse.com>
Date: Mon, 27 Jun 2022 09:07:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/5] xen/common: page_alloc: Fix MISRA C 2012 Rule 8.7
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220626211131.678995-1-burzalodowa@gmail.com>
 <20220626211131.678995-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220626211131.678995-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 986bc7f9-703e-4069-b1ca-08da580baf50
X-MS-TrafficTypeDiagnostic: DB7PR04MB5114:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DM2uRy8AJXoWLBCNc4J0rWFSMJd7vZ38pqBRhiMTdNKvLf2smaCLeJ8owr/wtQ0P2jsZv4NmmyGKm0jbbgKQMiDuyo6Di4B7IOGMDtZAcA282Gk+cw33/+Dp66fMSsnSthDs1lJ4OsiEsCzzlM/NCXp2zpMKQGUpGvgNo54cuANCC10gKYeLOpfW+lO0kKaQ9z0Z0TClrnWy3CEHKbbkB4XcTi3Uk3l+Jj7J2i8/e5kN9XAzEm/Dl0E9yfggZR/6S3Z9FgOvNeaCW8cgyq5p6A5MwPT6FT9dsCdnJ8M2jbAlVB+r+pxtdrGfTXjtSXIlh2JSWEIh0rNH3Fn0SwrfUOA2ltg1NLC08rmwSF3d7Iu1PsPE2pmOZ5uKC27X/Mr6gdo/4OdkNnJI4e7+OYK1gWBjfKscg6X6DU6KkgWTEP0VI7vFVrNeObsW7CL1ST7dHsCyUtr5NDAJoQTSFSp3x0d1VnuqMDgwfK/yWwaivneI0fIXYxNWIwQ/uenUKtbjhcNx1fO4d7CZ1SbYqliKrnnMEtbsdPMDhPjozjwGOI++eXs2Wwa3WwBBhFrw9rzHuaj61sqCdsovkLY384xnoUf8XfDFBqL2Hw9ldJInAcuaUL52AzIutEzUF6nm69FB3ryT3F/fWftX/P+KcVeqIy7uK6sSh2mkDn5GLky3kqDEqLI4cGMsBkiO5hrx+JIx+EGi2fwZQrkp07l9VjZ3IJuUKuaQJKRBXho93JxFvA7kKdCCPwZloNbKmSocl/cb4kBmnBSKepLINCZEuvVNQ22yTo6ycZ60PPN9wBu66fOa8iYxVu+6BvLFTyK45MxeBz9g1GvCNNKYOe/UeKr+Sg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(346002)(39850400004)(376002)(6512007)(31696002)(53546011)(8936002)(86362001)(38100700002)(5660300002)(26005)(6506007)(2906002)(4744005)(6916009)(54906003)(41300700001)(6486002)(83380400001)(316002)(66556008)(8676002)(478600001)(2616005)(186003)(4326008)(36756003)(66476007)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3hiM2pnbkZ2ZmgwdW1yR2FGNVhmQ1h1ak5CZGFTeGhna3dES2FGSzFDamtj?=
 =?utf-8?B?TnVFdFQ1MGw2TEdqaTlvMVhKTjJpaldyOE10azRNRTNLSlBGdFhoeEQ5cjNL?=
 =?utf-8?B?akprRzI4RE14c0E3TVJPMk1udXFydFJpbmtScHo0ajRIYThZNXFSY3pZd3Zp?=
 =?utf-8?B?VHA1ZGgrNVkyUkNDRVBLZDFVbEx6VlZsNXRYYndDa20ybnpDUGsrOHBDSHY5?=
 =?utf-8?B?R2pjOE94cW5MbW1wQXJtZy9EN29RRHJmL2Y0aHVWMmV6aXRQNGs1dkJrdi9W?=
 =?utf-8?B?eGErVFBEL0hHbTR6MVB5UzNqbzA1azA1cS9ydFFhRzFJSEkrM3o1THI3R0Nt?=
 =?utf-8?B?ZEd4d0tmdEFBbG9YdUR4aUFhOW5oaEd0N3IxR3orUVA3Q1RaaUIvT0Zzelk1?=
 =?utf-8?B?Qjg0bzl1ZktXeGlpZFh2VjNjRnRBVWt5TEVWcmEzQXc0WjVjWDJ0c0lCMjkx?=
 =?utf-8?B?UTBqd05pUDF0ZkZLdkZXTjZuL0xWcE9EOTZmTWlJazROdFM2cDIyMU44MmhR?=
 =?utf-8?B?RXhqbTNQTXZlY3lkaU4zSHU5SW42SDNGaTF1blhzaFN6NWxRck5IMHZ1QSt1?=
 =?utf-8?B?d2JETTlOdnJUYWhaSVdtSkNKcFlyWWdWNURscmdBMFFKdE1VNnBoZUJmVTdo?=
 =?utf-8?B?Rmo0VUdaaVdmczMvZ1AwY2VITU9MV3JyNklUOFY1NTBQUjRrVU9IdkcvMDJX?=
 =?utf-8?B?Q2VoOUh4ZkpJMTNrUHRFMmllZnZtWVJjVGR3cTZwSjFCTy9zeUJSWDhhcTN2?=
 =?utf-8?B?MlArVTBkZUdRbUNkMGNycytyMVRLbFhHUTJZZ2Qvb1RIQ1IwQytQTWFMbzVH?=
 =?utf-8?B?MDM0UFB0YWh1VG55RFU4bEdVb0hXaVlTNllCTzQxK1JidFJmd1pLZVJYZlhr?=
 =?utf-8?B?UUw0dEJ2RFFna29Ga0VmYU9DYzh0SDRaY3JGcDFld0wxcjd2UXJtS3lFZTZn?=
 =?utf-8?B?WkpDUWMxaTVQQWFEOGdxQ1IrU1poUVpTNC9pMjJtZEkwWjA5TS80cFRaM3NX?=
 =?utf-8?B?MVU5U3pGVkJyWUJobHRDVGZ1UEpmcVNCVTIwQXN0TDV3K0xlWUFHaE5qOXNz?=
 =?utf-8?B?T2NRTEJaeXlla1NWNFFWY0JOdTdyQUcvUzJmanlxS0h3TDhpVUtwNjFGMk1t?=
 =?utf-8?B?c29hcHBmK1RBL0ZjSEtQTEYxT1d3aHR0YXZBaUdLdW16VkkraEh1V1pkMUU3?=
 =?utf-8?B?c3dOM0RXeW1aQ0owT1l5a3hVVk9vb2pqSTlOVGFnbTRTS3ZyMXpDVnI4QzRX?=
 =?utf-8?B?U21GTHIrOHNHczdvaXE3V0M1bUVuMVdoTW9udTFFVTNMZ3d0ZHJuV2dFdHNU?=
 =?utf-8?B?LzhMYVVtQUMwRFZNMDhJYmg4dmJKMzVOODBZOUUwakZrOEdJMkx1UjFmSmtW?=
 =?utf-8?B?dTRka01qaVBmYUVXWTdvL0NHemd0Q21iSnJXdmdSRkhxM0VZVzVEbjR6ajBO?=
 =?utf-8?B?QStRMG1PQ0tYNWg2ZWg2RXRzUzRoeCsxV1RZZXFJaURSNWI1ZUsvYk1Sdldm?=
 =?utf-8?B?ZmdRZGJaY1llQWN6dlovQkEzeUNzNzlUMzJ4bW9NUFhrWG5Db3dLRTRpZENk?=
 =?utf-8?B?Ly9IMWNmZnhHdGxQdVAzSHNyV1A0enFrSEdlVkRXbEY1SVNPcXlhUitxZHdP?=
 =?utf-8?B?MnJCT3NqeWc2b3pnME9qU2lMSlN1c1VKLzJCUlJsMlZ3YnBaRjJ5RXdRMVlR?=
 =?utf-8?B?N0ZYdWFYc3ViOEl3NVR6d3FNbkoxbzZ4NGgrK2F0ZkdSTDZGMkRuOEZlN2xG?=
 =?utf-8?B?WmZQb0d6bml0SnRtZzlRM0N1d3c3Wk1qS0d6ZjEvKzlqUGtyQ2tIcm9kVDlo?=
 =?utf-8?B?NXdydU13UHJ2WEdEMGVKc0YzQS8zMW1JdHhZYXFGanhaaXZ4REFkdXZ4M3B6?=
 =?utf-8?B?cm40ZnZRREJ3MEp5aHByWUZweDgyb0NPblhscnFDRklza3g5SGV2TktlUXV5?=
 =?utf-8?B?Nzc1blRNQWhhdVl0MU9IZGtkY3A4VlhaZXJXcG9Sb05mYXlGUVIzR1pqMG50?=
 =?utf-8?B?KzdUdnBvKythRXJJcnhGSDJ4Nnp6Y2c1cWw0QVQvdXNkRDBmMVQ4YkxkWHZC?=
 =?utf-8?B?Q3ZhUlBxbE5QTU5IK0xRQlByTmJkTWEvSlRlVnNmWlY5V1E0MTRwa3MvTGNI?=
 =?utf-8?Q?yT6t1ku7z4HY56B/9dKH5nU+7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986bc7f9-703e-4069-b1ca-08da580baf50
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 07:07:23.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqzX+vL3b9qxMAfkEgtXffdeQY0aatDlnDLVzJ+aTQkCKkOnExQOx4gNWsk9KKYUwD5tdauIcfifbVsyemkMAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5114

On 26.06.2022 23:11, Xenia Ragiadakou wrote:
> The variables page_offlined_list and page_broken_list are referenced only
> in page_alloc.c.
> Change their linkage from external to internal by adding the storage-class
> specifier static to their definitions.
> 
> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


