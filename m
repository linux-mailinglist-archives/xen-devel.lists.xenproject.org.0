Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9C7747360
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 15:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558368.872396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgXD-0003a0-E4; Tue, 04 Jul 2023 13:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558368.872396; Tue, 04 Jul 2023 13:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgXD-0003Xg-B9; Tue, 04 Jul 2023 13:57:39 +0000
Received: by outflank-mailman (input) for mailman id 558368;
 Tue, 04 Jul 2023 13:57:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGgXB-0003XW-Px
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 13:57:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb3b867d-1a72-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 15:57:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9471.eurprd04.prod.outlook.com (2603:10a6:102:2b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 13:57:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 13:57:33 +0000
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
X-Inumbo-ID: bb3b867d-1a72-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlYME6nsKhCsEUXXuLCgfFkqTUJkVDcYuYqyZEPp+uY6acogP1iMPN88ER5CLvCEE508rhU3V8CU2SBoaEQErDzqXDWCbQWH9ZbQbI+whlJB8NZe0tTZD9bJs3EJlC1E1pnqiL06ONr4lTqdTYdHwCdy5xYUUa/E7Q30zj66XygyjD7wABPraZI1FhXtxJjpoaarDl+vFgSfOXY7XTi1qHe1grwtbUf0qSkMyoz7THMNxGPR8mK19u2INntrI5NtzSyUx4DVG3Xtb8jC8nWSGBYGShz6NfWIEtzf/yx6+3/gO3/0PEdNzOJfuJ+hHj1Ylu6H/7t3O83GhhTpBhk/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMuiqdglR/yPIudSk30KF3EwEAcpwXt/Lg63G9vNeGc=;
 b=e4PwJwn2JqQlUthLSaceqKYkEyPViknhEYLSz3TPlED9vqmFoAbKkTdgrZkqldgSEt7Ujl6NpE6TwUAp5M+gK3/UHyiTUpsYiPTt+5fxHXQ6MjAQHur17UDEXda0NwyYH6I3X6muVr7JWX6avSpw6vV6jgkDyBvtpAvaIVs5TgNGPHPpzbtA9E8MqFLE1DoEJVLVHNyxU8PtQj1j1ojt9M6BVE8P6kUFSaJYIPVi9Z/uV8vergM+ESTvbfjo6Mw8ZGVys0t6+xIHUmll2uvBAtMnRb7fhYZM2J8mJAUbIudbYZAtJyLopZZwMvOzY6lcURbx5Y5W6Ml1ZCU/qDMCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMuiqdglR/yPIudSk30KF3EwEAcpwXt/Lg63G9vNeGc=;
 b=WIE4TekLfjBEu4xhhQXwNQ9E8ccAK5MMAYW4pGAKj2cHeVBcO3tRfdXGWy9vex4He6jjfijlUGxllcfZbtDMu/6JADURrnmU8K9BJmyZKY1Cfw+jNzaWXPH43Urpz1L4xfsgF6BMUMVB/yAnzBcWYp7iL1xaZTO6nzi23Sx39pIbXnDc0ZCJ/43AjQnZ3nLGxaJ5ZbQx//J/AQ8C3/qyAaGFLNnOVy72AuqtyU3jnwfe+tMMcRz2lOn6ecrCCVi3JZud6TyFkUW5Uv4LkchUwAq0PBT9mbjzwpLMbIOY+ihzalOgu5sQryVZFehzGFKXY4ZAOrSiJmPQyOwBml/9pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7af3c85-92ec-7d0f-0e63-3a1e5d65877e@suse.com>
Date: Tue, 4 Jul 2023 15:57:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 4/5] x86/x86_emulate: change parameter name from 's'
 to 'state'
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
 <8c8bc96b96a1111a4651f970f506d304809ea40d.1688049495.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2306291230500.3936094@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306291230500.3936094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: bb96433c-44e3-42ec-7f95-08db7c969d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9zRgTQhQVyOwVn0EpU/QMmP5OOFlTl2Ga7CLZmXHp4HKy/h8UDkPIs6zqFyuiTpgD12A87X8p97P6fa0+S4VliLUo4TuCBc6/je7RftJ3U3AtKZrqWwWgKOWtC6OJwrSqMqdTqEftr9fMPSrnTaa8SOQd3v85fDTuc7zmBMXLDQPL/nddOekevqBu6UphMjd/SkKGCA4Kqg3Ncp21wtx1sfD1zhZ1s+YsXPXRaDdsBMylHndwFTMafu2b2vOXdMSUW8SKlbqGtL6eFS9LYTvOdKL3GcCO08GDf5JTd3c0HNfaR71uyjRar/jb1f5haqRAdiVuEg80BD9xkFr+ANYJEEyOVmP+phJPFmaxLUrqDWD2gB4vz/Ehp7w0vqoSlmkzBKb7rtHKRg5QAYTZ4iyUPV6ZlQPNLRmNEyhfJuZCEDvov/Z6Rmh+tiGKthY6QhdevEh94NJKAm9itWg5Kk3C2lOgrLs3kA5uxvOKUe7VMQkzf18Ki5YzZlPr36AhPiQMWMF2pgS0rFhW/iPdyqpNBIrj23yWhOlTO0TrqDwB5gfUC69yxibaMOZtY2nxjcLcZWYyVwZjFdqKqgXmL53NMMK0CCpWb57/4qfd/jPBknzpZW15kGmhNV+DhE+/Dfpn0J7hvF1MtCLq4GIpmvrbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(26005)(31686004)(478600001)(6666004)(6512007)(6506007)(31696002)(86362001)(2616005)(186003)(53546011)(38100700002)(54906003)(66476007)(66556008)(4326008)(66946007)(110136005)(83380400001)(6486002)(316002)(8676002)(8936002)(7416002)(4744005)(41300700001)(2906002)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkY2VXlxSVFmanRKV0VNeUROMHVVelc5ang1VnNGQkxFWVRoejM1U1RTK2dW?=
 =?utf-8?B?RlhvemdPei82K2h6a3YrSTNsNDFMTWE1c080RVZjMnV5UHVlMHBnMWNyTHZP?=
 =?utf-8?B?VFB3YlNkYmRsakxYL2dEdFNMT3RhZkx0d3lMWE11ZWpObmNIcnBmcWVpSUR4?=
 =?utf-8?B?emNlL3VJVkZUbFVyU2QycUNzZnVmU1FtWVFiMDlVQUhmV3g0ejBWcDZjSG8z?=
 =?utf-8?B?RFg0cEtNanF1TTFXaGg0eit1VXZuZlF3RHJZSWpJbzFDNUxnK2NPZ2JiOVpq?=
 =?utf-8?B?MWFlUkcvMk1XRWRLWndmSHQ1NUJuZ3Npazd6NWMyK0RyL2tmVnVwQWQ1R3FK?=
 =?utf-8?B?ck9GbW5BVEllL3F0ekR2ckY4SkRsWnpsaHZoRTYzcjNrbVR6SVpDd0VTUVkx?=
 =?utf-8?B?bmZpQjIyRlgvTHh4RFRHcHlwRGx1cDRyVWxaajhURXVHM0lLWnVKejFwNW5C?=
 =?utf-8?B?Z1pnR3V1YWgwMnBCV1lMTSs4UHVIcGZmbGtVNlJIMGdNZDRQUGdXUVZ4MHAx?=
 =?utf-8?B?aGJhSzl6OVQ1ZzNMQWhTMWd4KzgrZyt5ZllYVzdMRkI1R1VURVhRVTlOanA3?=
 =?utf-8?B?d2dGU1RadCs3aHQ1TFRVdGxpNGE3dElRUGRmUXM4ZnBRbjFlZG52cWJkTWV4?=
 =?utf-8?B?TEQzK1ovY3NhSHVzUTR0bjBYNFNEVWNWM1FUVVNYakxMbGVFU2kydnY1Zzdt?=
 =?utf-8?B?OXhGd0xQRHU0QlZmQTJ5c1dibjM4RXZkVjlVdTlCV01ybHZtbTFIM3BPN3V1?=
 =?utf-8?B?VWtPNE1wY0xNdzVkdGFrRDBZb05zOGFvZDJHa0pKdWxaaXZRNnhLZnB0Ujc3?=
 =?utf-8?B?SjNDYTR5VmxHeUtkZWpJVjNLenlnMER4RTh2aEI4dHV0RHBkTUdUZ0RrczJB?=
 =?utf-8?B?K3RmNE44NTJENDZCS05qRVp0MHR5TEVKM1JxSm5neWFJMThPMTNJaVZQb3Vj?=
 =?utf-8?B?Y1R1NFBYa0pzdzg1RmpLV2RRSHFMUllCN3FNV2Y0Qm0wNmlta290ZVc5U1dy?=
 =?utf-8?B?Q2gxQ1B0MzFTRWlKZENmMi8rUEQ2VzNzWDJDMGg5V1dTWjBCcVJJWU9PZ0Fm?=
 =?utf-8?B?OThLRE1paVBtN2J5cUlPOWdrZDhBckdIOVNpeXhFZkNuZHVqMUExUUU5U200?=
 =?utf-8?B?Qy9JQ1ZpNnNIYXdObHJOemlLcUM2LzNRcDlrU1B0UHhHdlN2a01WMmFpWmpY?=
 =?utf-8?B?Wjc4dkZQNG1BQmJQQ282NjJZTDRQeFZLNEJ2blgwR1hBUDN3dGhBLzlnR1FY?=
 =?utf-8?B?bTRNby8rK3gwVXE4dHlFWnRjZ3ZxcmFoMG85elJJa0gyeHYyR0lFakVBU0hG?=
 =?utf-8?B?RHhxNEkzRW8vT0hlMlJFY2s0RDBzNHZKSjFDZWg2VEJhMXhpTEVicHhCM3dY?=
 =?utf-8?B?Tmw1Ukt5cThISlpsczBSVG5rRXlVT0pOT203RitibDgrOVpJejZmdVptUlZu?=
 =?utf-8?B?LzJBTFhOc3o0NjljQ09mNWlZTzExbzErNytFdGpjTFRZdDZWRGcvSUZZcUZj?=
 =?utf-8?B?bm9ramNmSFZtRE01VGR4OC9kcjJVUXBNSEEzWitmbGlIMEdJcHhISEg1bTV0?=
 =?utf-8?B?b24zTXV6SVQ5TitZYm5BOFVCZUM0bFZxNlRmb2IyUk9QRzV0Vi9paHR2MUcv?=
 =?utf-8?B?YTdMQXVuenc3aUtPSXgrellXbUY2amU4WHM1U3FKcFVxSHBlV0hvdDJrTURL?=
 =?utf-8?B?d2ZFVFdBMHVqcjZWeUE2VDgwMXhZL0FVdHpSMC8xdGt2S1puaVNUMlpVZlpp?=
 =?utf-8?B?S3dGeVhsWWxtMkR1cmhwaEZVNjZlMUJCUnV0dnliV2sya29hcHd4aUI4RGlD?=
 =?utf-8?B?eGo0NEpZSHBMT21lemoxamViSFFjd1h0UUl6YzdQNGgzcVR6WWxPdDIwM0Iz?=
 =?utf-8?B?SWlyRGlScVZ6eUZieVdhRU5aN3hxWUxYdDY2ZWFrUE5VWURTYTlZeUpVYmlL?=
 =?utf-8?B?WkJCS3ZHbEs4S3RCMzBnWUs3Y1FwYy9rc0NSTERiZmRYL2ZtTStNV3lVWUYr?=
 =?utf-8?B?MEdYeTlIQkRZWktONEFTNHp2UFVsYUozSmhJekRROUxNdHlTZ1FMRCt1TlZC?=
 =?utf-8?B?QXFrWjEzM2dqenhONldGTC9HMEdvSVBOOFRIMkZJNWVRVGNUczhJT0tnUk14?=
 =?utf-8?Q?yzoIWvjI12a3FyY3XhAwb7Zes?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb96433c-44e3-42ec-7f95-08db7c969d84
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 13:57:33.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vkok9Vuv7L6bPj664W/+PtpiHpll7ueIseg75ROr8lEgceZ3xjvNItvt8iTblEU1hetj23T9fwEIKtEURKu0VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9471

On 29.06.2023 21:31, Stefano Stabellini wrote:
> On Thu, 29 Jun 2023, Federico Serafini wrote:
>> Change parameter name from 's' to 'state' in function definitions in
>> order to:
>> 1) keep consistency with the parameter names used in the corresponding
>>    declarations;
>> 2) keep consistency with parameter names used within x86_emulate.h;
>> 3) fix violations of MISRA C:2012 Rule 8.3.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> You could use x86emul: as tag in the title. I'll let Jan choose the tag
> he prefers.

x86emul: or x86/emul: is what we commonly use. That said, I don't like
this change. The files touched are pretty new, and it was deliberate
that I used s, not state, for the names. This is shorthand much like
(globally) we use v (instead of vcpu) and d (instead of domain).

Jan

