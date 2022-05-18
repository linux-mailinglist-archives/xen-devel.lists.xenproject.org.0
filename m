Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE052B676
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 11:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331817.555415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGF9-0005p2-1f; Wed, 18 May 2022 09:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331817.555415; Wed, 18 May 2022 09:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGF8-0005mz-Uk; Wed, 18 May 2022 09:45:22 +0000
Received: by outflank-mailman (input) for mailman id 331817;
 Wed, 18 May 2022 09:45:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrGF7-0005mt-IW
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 09:45:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b4822fd-d68f-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 11:45:20 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-lnT8HsoSOx2ijB0FugBCZQ-1; Wed, 18 May 2022 11:45:19 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6548.eurprd04.prod.outlook.com (2603:10a6:208:175::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 09:45:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 09:45:17 +0000
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
X-Inumbo-ID: 3b4822fd-d68f-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652867120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2+3GW+NV/jl0TI3GhY/ByAP3xZ/qhv9bAjbjPBi1Ckc=;
	b=NUhugN0FWZwEvW/EN+11sNoqQYoUysJn8RJ2oWuURkBx80tuKhO1KFMnITaALqnY9vzimn
	Fxe9R0U4Z/HkTSHXtOksjL9B7C2LRSQ1UQv3YEjkPmtHd9j3mMUFAJwH8FdDbQbIa4dxSe
	xlsodMVXUxtNKbZcIB14ePUv/eO+ras=
X-MC-Unique: lnT8HsoSOx2ijB0FugBCZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw5TF/qSRKmh+YZJ8D4S5P/HAeXgxQU/kbB4RGbJShcLsmfNnKgFeeVxnuhI3uiQGRL8K4+YQejEdnhjw+B4zDKrKuCpUbSslfbzrDdU03HqwH21g3cZMnDlD1Vl8lsLE2MdRniJCOUMvbSQiXetfqTP00BbrYqsp4xaBZoKDILINwS8ug9muNcKs16Ndpj7cgFdvywO1GNNJrD0a+NbCANvNdfBKfPKXSBjKVwjCikZo0HL5/m6wlc6TFOtmc8qm3nRrOgI15tbb9vr2DQNRAEA/q6e6aUfuirR8YmA7cGZ379/7pVZgEn2LbxuEuUXiiBLP0DHH9Py8pUoWIwUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+3GW+NV/jl0TI3GhY/ByAP3xZ/qhv9bAjbjPBi1Ckc=;
 b=YlNqapNiSbxSVNcTpRBroPTzZNVphqn9BQL2qmiAiwyTDKjCJ5apa7hv86OKUaJw8ykH7vxDfmsazAVT58WtPg5vYFkHYLtIs0ipglcRvhG7VfyesYABqUMdBk1VnHougMvjhvakn1LST75krsRdRNpaic4KGxnkhWAMQiX3O6dzPU2FBeIjKVdsJbe/f7dpou/rhEUxjDHE8FfLUYdlEvhW03oQ8PCLieM9DMxEBZUxLMY1mIaPNPikkm+Ng6jCx94XO8SM0OiGSmQHN16MKjAsXkvNPycDixvgYhRpK9kSWvPmYPhvGFjFEoJNC2AlY00zkvrY+oapZwt5j5SuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b5362c8-2a41-d2c8-b25e-2e9c421d6da2@suse.com>
Date: Wed, 18 May 2022 11:45:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20220517153127.40276-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220517153127.40276-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0039.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 764359bf-54a5-4d00-9356-08da38b31db1
X-MS-TrafficTypeDiagnostic: AM0PR04MB6548:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6548D11C9EBCAF2E9A34F00FB3D19@AM0PR04MB6548.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z8Wk5MyZjPLXzBFwFHEAfmWtjWdRHxRTBbY7N+7JBZIqr07Rcqp76jq43C9xu2LuirOp20M5E9MqAZDOiyZhrUDfWG9fU9HTqInoMGvR5ReuBzdkwAab9y6tgZsYMaKce8RU670WsfCkhTf+h1G2ZdxjlEhi1t9BdWyNH5pZl9kS0uqsnoD0bpyQ9B03XRjwYBeByKyWWdkxTOsUdP2wY/jepyHO1To6YoiMOd82Nxik9qYzZtqZjPhGuvHb96vBk59QaNym6BcFCx4CDbyvg3QePmOy1Xqh7W0SdTWOmj2mBSxE+EUu6dUjVN2Zgt2UoVrHl/9p1blQbELU7XaLpnVJkSoQVyfwgio7wkKJlRrbPBVtN1tVU7nuXj36HJ1Im63QmHIDth/KSC8cUFhRpYT8r7paZtxJrCBDQ96tvDe1mYN5lKIw8GWMQhrV8wLQESLvBGAg/B08Vi8AT70suabvrYhqxf9SM5uVuY5qPZ11rMHk817UQqa/XVR7LLD1lK7LiqDu6SfN0lfCzB96VztkCaPTRCNPzr8m/ZnTqPGa2LesOsgYXxMTL0evV1Cme06sSq95IMikjr+AzgQZSX3mlp872N1SyXqUSxNoFJZygp2MXAG/fA4q/S/X/25NwFEgKRnsU0HpW39io85BzX/GrE3eNE1UrRtQjdmYzVcawS2UkjbW31ksdHB6cDYr8LBy5xeWnnud/hj+QV7eb61Xkq07PnLEhWaAl9i/qyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(38100700002)(186003)(5660300002)(2616005)(508600001)(6486002)(8676002)(6512007)(86362001)(83380400001)(36756003)(2906002)(53546011)(6506007)(31696002)(66946007)(66556008)(66476007)(110136005)(316002)(54906003)(26005)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3ErTloxZkhqVWhsMTBPbmtaTjhIY3pCMHZHM3J0M1lyQzhYQytuY0huVlNr?=
 =?utf-8?B?M2tWR283Q1cycUk0eEVjOG94OW1SMkQ0OHd1U1pBSnI5L1dmaGhZeFpwUzV4?=
 =?utf-8?B?a3YwWEdiVzBNS0RGbjM1cUlkb0hveHJGWW1mcVJsb3BBbkJjSm5wSnpnOU1j?=
 =?utf-8?B?cDRPZFFsQnJpMXVZb1BQa3l0UCtZUzVNNHhTc0F2QXZHclZ3TnBIbHlTT0hy?=
 =?utf-8?B?aU94TGpyRHZpK2RvQjF2dVk4RjJsb3k5MjNtN25nRXZVVHFKaVZZZlB6L0Jm?=
 =?utf-8?B?SUEySzBSNjY0ekYvTWhwQlllOXp6V2txUmh6WDFpWkVPOE15QStmZTArOG5i?=
 =?utf-8?B?QWh3ZkZuWXhMekFpeEx2cXZkRnhVVWhxUXhDeFl0Tnd4QWRacHVPVXpvNUFo?=
 =?utf-8?B?RVJ3ekNPZ081Z0RrSkExb2NuTUx5cjhyOEl3OWFnZmhzV1V4Szhmdmt5Q0Nq?=
 =?utf-8?B?azBiQXg5bzRHRlBaaUIrV0dIeHh3aEpTRE5vTGJtd0ZBb251dmZSOElKeTda?=
 =?utf-8?B?bjdZWXF2U0M3Z3I3bVZvRW4vMjdkWllSTi9OVWFxNktEeFFRbjJ1UGZ4dzZ0?=
 =?utf-8?B?VVlOUjFVN2JlTnF2d3lNZTNBc2pmZVc2azBZcnZhMkRnMUtjZ3ZGbUVKNkE4?=
 =?utf-8?B?U0E5d2pFbVZDY0oydG9CNWxmV3pnUUdTb2VuYkRHVkhoaU5ZLytiTFZORjRj?=
 =?utf-8?B?ZWExdFBxclpMNkR5RFllQXRYUjRUR2EvcVp5SVhEYmNBWm1ycjVpTjVubVdL?=
 =?utf-8?B?VEhZZWZTd0ZpMVR0TzFNVHgrVWVhS1Zubm1YYUh3SFAxWGtmaEdVMUM0clZ6?=
 =?utf-8?B?bFQrbXBlZEkzZGxEeG5BWlNmbDFERFdhNDZXMVE0Nk1yb1FDdDVFYllKZGZU?=
 =?utf-8?B?bzgxbjJnUEdRTzltU05Ub0RaaDEvM1dMV1hhSElyTkUrZXl2TEliUEtidHhn?=
 =?utf-8?B?OFlJazA0QWdTOFZwT3JIYkxlL0xUVStpRWRtNkhhTWkrZVVQaTM0SDNKTkwr?=
 =?utf-8?B?aVk2dWxjTHBXL3d3L2FJdjlGMmQwWWZxK3VxdDNoVk84ck12TVZJbkIrQmRO?=
 =?utf-8?B?dlV2dThreW9Pc3N2bXVCWUIvaVJxaC9XcVZhcGsvVXdTMVJGWUpjdEJpVmtH?=
 =?utf-8?B?cHBzZCt2WkdYemphYzBnTDFxQUp1M2FrUUgrZVpaVHlxbnZ2bjgxYmJYb0dP?=
 =?utf-8?B?TzNvbmYzQ0N5cVBzOGkvbWZWVms3TE9jRWgzV2pZbmdVNDZtMncyZlA3UXk2?=
 =?utf-8?B?bmRqQmF0R3FTMVY4a2QvR25VY3BrRW9kMWExVk0vMzYwNHNMcGdZTzBabGQ3?=
 =?utf-8?B?VFRtOXZGUE9iY05YMWwzUFY0empoV0V5N0ZoN0NrOUx2dzFmZi9QVFJBaVJv?=
 =?utf-8?B?R0xZUThkL29pbGZmME1HM2l0eUJlQllzS051SzY0RUg4OTlyazArcWxlVmlk?=
 =?utf-8?B?YjBiYjVrYlk2cmwvNGVPaEl3OTROaGpuVWhKdlNXemN4L0JDVG1FRmZyTEZS?=
 =?utf-8?B?VmtTMjd5NmkxY3VBRnByMUNYSk9xVTZFcWgwZ2ZJbFVxQ01ZNWZRYXc1OGFx?=
 =?utf-8?B?eE04QTQ3VGpVZzlNZnd0UnBJeHZjN2dPQW5KblZOOUdqTldMZjdQTEhKWDd6?=
 =?utf-8?B?UXNqNS9QdnhMbTFSS0N1R1lidXRYSS9GTklUczd2RU4yNkc3N0k3emJXRXd4?=
 =?utf-8?B?bXhhV1BxcHYxajhUMWZNZktiVjMyalFneGlmbkFPNWRZYThPS1RSTEJlM1Zx?=
 =?utf-8?B?Q1d1cnc1MjRrbHhwTkNaUTBDWmJJNm9JU1lHTDVjZkdaYXNoRkU5VTRGNE9i?=
 =?utf-8?B?MU9wMmVuMUxaMHIwelQrSTdtcFk1bkc2ZEVIRXF2eXlDRnlsN29SSmV5bjRM?=
 =?utf-8?B?TzFtZHZjTWdWRXkxYktHb1FDUjhERG00RWRhVFlid1pYaWh2YThnYVpGM0tw?=
 =?utf-8?B?YnUrVDRCZ1hTNVBjTVlLem9pZkViSjkxNlFQVkZpdHVBc2c0ZmRNT1Z6RWJ4?=
 =?utf-8?B?WFdEUjJxcTVsaDROUjdSaElIYUhCNkVocEZhcVdCOXAvUGF2NUhTSm1scTkv?=
 =?utf-8?B?NFhYRW5sbDhTejd1Qlh6Q2FDVHNvai9TaG5XQkU3MWJQYmwwRDNIaVpqWERk?=
 =?utf-8?B?K2UrN2tUc2JrbGFSYlpaaXBkVkFFTFhrRnRnZDhvMzViOGpuTUY4Wit3bmQ4?=
 =?utf-8?B?b0hlVUh6b1dtWGNGcEdFTlFxOE15VEkrbkRBaXZGZnlFc0t5N25UZUw0SEgw?=
 =?utf-8?B?ZkErYnNyTndMR1I5NVl3bktQYll6S0gwaittR3hJV2dZN1UyYXNVQnUvNmZw?=
 =?utf-8?B?SGZFbGNybG11YXBKcEZHa2VaSm1RYVVoQVBKUFFXcHhMTmtYUzhvZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764359bf-54a5-4d00-9356-08da38b31db1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 09:45:17.6543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBUnuyjMkWgjU0DUmALmMtTbaC0CUMtgOJuNht8vnm7qmsG/XNHh/+npvIh6b47d5Aam6oCHcx35r9Bo1ZH3Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6548

On 17.05.2022 17:31, Roger Pau Monne wrote:
> Hello,
> 
> The following series implements support for MSR_VIRT_SPEC_CTRL
> (VIRT_SSBD) on different AMD CPU families.
> 
> Note that the support is added backwards, starting with the newer CPUs
> that support MSR_SPEC_CTRL and moving to the older ones either using
> MSR_VIRT_SPEC_CTRL or the SSBD bit in LS_CFG.
> 
> Xen is still free to use it's own SSBD setting, as the selection is
> context switched on vm{entry,exit}.
> 
> On Zen2 and later, SPEC_CTRL.SSBD should exist and should be used in
> preference to VIRT_SPEC_CTRL.SSBD.  However, for migration
> compatibility, Xen offers VIRT_SSBD to guests (in the max cpuid policy,
> not default) implemented in terms of SPEC_CTRL.SSBD.
> 
> On Fam15h thru Zen1, Xen exposes VIRT_SSBD to guests by default to
> abstract away the model and/or hypervisor specific differences in
> MSR_LS_CFG/MSR_VIRT_SPEC_CTRL.
> 
> So the implementation of VIRT_SSBD exposed to HVM guests will use one of
> the following underlying mechanisms, in the preference order listed
> below:
> 
>  * SPEC_CTRL.SSBD: patch 1
>  * VIRT_SPEC_CTRL.SSBD: patch 2.
>  * Non-architectural way using LS_CFG: patch 3.
> 
> NB: patch 3 introduces some logic in GIF=0 context, such logic has been
> kept to a minimum due to the special context it's running on.
> 
> Roger Pau Monne (3):
>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
>   amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD

FTAOD, while besides a missing ack for ...

>  CHANGELOG.md                                |   3 +

... this addition the series would now look to be ready to go in,
I'd like to have some form of confirmation by you, Andrew, that
you now view this as meeting the comments you gave on an earlier
version.

Jan


