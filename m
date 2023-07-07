Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0983E74ADD6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 11:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560322.876161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhsD-0000hY-JS; Fri, 07 Jul 2023 09:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560322.876161; Fri, 07 Jul 2023 09:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhsD-0000fj-GW; Fri, 07 Jul 2023 09:35:33 +0000
Received: by outflank-mailman (input) for mailman id 560322;
 Fri, 07 Jul 2023 09:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHhsC-0000fY-4V
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 09:35:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c9e6d8c-1ca9-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 11:35:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 09:35:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 09:35:27 +0000
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
X-Inumbo-ID: 9c9e6d8c-1ca9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2NUg5NX4S57MYok1RuHEjQY6Z6+FVPcVIMKEeg4X6Hir+kboJtSGoinmg7bs1aCJfEgZ2q69rBxkVbVxRGWrwm6ser1GiViGyfcbWT4Www399sKu7iBOj4f3Qw3Wt1UFnO/+ePpEgKVu9sjmeXlcZMj3GtkxWtTjVgi+4EVX8rKLEL+teTdfdabmC/PEGrLVOORdjH1feE+gj16+Eh9m9489WLjE9+xN5VAAEBd4ExtOSPldpz7KWA4Cd64uiOtKDoIDDXI7jVQ8oFb2M2p40Sv0PMbfkCRxswX25UItK0LyXrK2dh98209bVP4Ju5u/VuWYVZAxNaW1oazdyN+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oaUgK4GUfbYgKkoMx0K06KlPIwsg+CPjsQWPNp5oZs=;
 b=gVNUwE486qmQchZF1vZCBalekvq/DL2lM92hGuRUnLIAej9suPygKpLaNFsepyq328HW9jQF2N4qcOzc5tvPI2IVINi4wAtTLxtMZSkMaOfQcejDuEkOMJn2Zmi4yY+QiMbfvSO7AOdQz5v6j3RGugR5NlUX6CVo816HQes0mTpsZ7X5hDbBT4VCrQ1qnszIwzzZCrd5fiR6eSEh2QmvhvyjnV68ZbVjzi+63IRBPd/4ARCnbu1uQUHgkiV/dkCmnitwQXy7MvIeVSoFyVbGKkFdhHuBUq2+44ofLymEDIYGbnadIh9jN85VmThMvHfaTyuIGROQ3MoBvZZWvNLMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oaUgK4GUfbYgKkoMx0K06KlPIwsg+CPjsQWPNp5oZs=;
 b=wyx+JXFdOmsNes+8HzE4LAluGAeGY+znFTtSaMXscQMzjtERGNw/pyoTKCEqtQOinM5/93MSEdSSzxTkopve4XRI6HWM45gFupvoyNAZdZmxg5L1TCH6r/xYZZZlb098UPggUXq1LHB1om3wdV2zCuEcYgWDpT6SwFpg0Z2bYC+SG4ctxYLQKqwh1ALbZU35ZngcVFyPxY03JEtC4+dsX90lqZiBGt2BkcacjM1D1d8Hcvx2aoO+UZ0CMVw5T5gG07zzgvNJVyRHuNjPhVZUKKFldRXHaZWeVBYffrhiZamQADKt6Co45c2iuQzcqdV02jneXd3TgXAAQkSUZyDhdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ab29494-a74c-5a03-3a91-acf30e39884f@suse.com>
Date: Fri, 7 Jul 2023 11:35:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/6] xen/riscv: introduce function for physical offset
 calculation
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
 <f84bdc5ad9f10f864d070f7581dce663ccc9cb53.1687178053.git.oleksii.kurochko@gmail.com>
 <c716120e-8228-826a-bb33-298aa47b94f7@suse.com>
 <29c4af7dcc95956c12818fd024416930f90e12f7.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <29c4af7dcc95956c12818fd024416930f90e12f7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f414cd-395a-4c09-8452-08db7ecd7f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QM5/1s2yp+pFxY+oY4DRd8Dwd7PnGv0dUdNhrqtZFJq3UML00Ovm11EVgHbHLsD2h7SIFLGwT3SKfpJiCvCTigBOviyJgtxzEAgTkxC8cmAwbrnDJu4BnG306aManeyOYmbLjgmq9WWT1p58vDUrfy5k1KPybpaKE7+l2/5lo7UBEErROh0IL8vklMtBOVElSLw7CBGDH5qqIixyURHXl+OiO2dxjdW4r4ot+zAvGTEvkizWNt31wR0pBn97SbEORh3aRXgcQg+YQq4McyH5DzyzYXRLUACKz/pQToBPoD0tgh8CR3RIdBquVeLSC/Hb+UNrg128B2Ms05k0MMzPxu/wm/2W56UycYf4AmfZjomUTJs111riT9V7tI1yF3AUeYYkNGh6KepeB4aK3vS7t/XcHV0ReXoMpiao4g8EO7Ub7d54QbkDQRMdJ7eYvsukI2yfylswnMvEi30BLWlAwqGK3M414vx8cym5xnCsudppPtGz7NDlJLHwxr/TqkjNfvxhXLnrHYu4l5ankuRCmBkUXPU0deYPeTrqQI0J8pmrecicXuJPIcPOUFMLifllttwCr0qhkSg5EFhT4b5HU9HX677BqtdwnP0t3D/tVVTcYW7a5VNjs/kVLJ0Qvt5byqcO3b2Gs+N+HAAklZnYww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199021)(5660300002)(31686004)(6506007)(186003)(2616005)(2906002)(8676002)(53546011)(8936002)(26005)(41300700001)(66946007)(6916009)(6486002)(66476007)(83380400001)(4326008)(36756003)(66556008)(54906003)(478600001)(6512007)(38100700002)(31696002)(316002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEZGMTA5Y2RpUXRWYmtJUGFqTkptTXI0SzV1UzlmR09tcWk4M1Z4U3JEQWpE?=
 =?utf-8?B?QTIrdnlzL1A5UHpsNkhMeDh1YkZSVktpdEdyN1VDbTZPVTVFOGErUTVFcjV1?=
 =?utf-8?B?dUVvOWpUUHdXbWJsWDVOeGRCa3d0aFVTdnVpWkl3bmNQQktZTGg2QWNUOEdl?=
 =?utf-8?B?NHlpZzMvd2tXOUhpaTlqbzI3b0s5OVFoSU5NMUl1am52elAxNTgxRWdnbW02?=
 =?utf-8?B?MWZSOVk4TWJjMFRFeWNQekhZVm1VeWlzb1dFSVNsVjBGd2lmRUU1R1lYc2M2?=
 =?utf-8?B?RWxLK0pXV0wvczcxUHhXTnRvUFlKUXZ1YTkvUDRnMk1FSzhWZDdsZG00RzlP?=
 =?utf-8?B?ZUFWZTE5Y01yR2lIU0NJeGtObEFoQWxQVFhDTXpueHBSZXNsNW81dEV6azlO?=
 =?utf-8?B?SzlsYkg0elhtYld0MHlCZnhLRXdZTHJ6SXY1N0ZyM01Vc3NlaTBqNVZkSUkz?=
 =?utf-8?B?eDdsOHRvdVU1WUlsaml5TE5wSThDeGlvOXhMMjVBTm5CeCtiWjhFWFoyemsx?=
 =?utf-8?B?dWFDa3RLLzFNZ3FqbUFyaUhQeVQ4QnpqbkNuZEV4MVBaN3dhN1B3Rmp4eXZR?=
 =?utf-8?B?QUJ1WEZFelREZC9TOG9UYmZERkRyTVBhQUtZcG4rbDMzazdSWmZMa0FCSG1Y?=
 =?utf-8?B?ZkNZKzNRcTJJS3JCUU4zN1M1WUI1ZnRqK2hqenh5UGt3eHZ0ZUdrTERReWhk?=
 =?utf-8?B?SXpuUHI4YzNXeTR2d2VzMWVGNlgrMkpOZVVYSnFjVGNvNWVXYmNnRzBZQmYz?=
 =?utf-8?B?RC8vR3BTZkNGenBMT20wVHVpYk5BQVBOc0NFKzEwcEhlZjUvSUZyK254K0Np?=
 =?utf-8?B?bWxUOGp6SkNoQWxxZEpZS3pYQVdld3d2czNRcDZGL0IrZHpvM0xVSzVJV1pS?=
 =?utf-8?B?N0lqemlDajlTL0VqNnN5VzQ0RzJRMzlicVRMU3J6bzhJNkc0NTBUSkRLWFg0?=
 =?utf-8?B?SHRMMHJ1cVM2bTVRTVJpVWZFUzliL2Z2anM1cHE5RGpDNFF6R0pJOVBabDRM?=
 =?utf-8?B?dHR4dWRzMk9sczRaaHRSNW1uM0I4K2c2V1BEVVNkZVpYZ3hiZWlEUGgwZFFM?=
 =?utf-8?B?aVJGcWpJY3BFeWh3d0E2ZXRkMEhsTW5tTFM1VjJ3aGpUaDlpVXVuaENtMUFz?=
 =?utf-8?B?QTZtbFc3YVR3TUdFSkdXY0V0RE5OYTQ5cUZrSk1OQVZ0cFFtV0V5c0F3OTZ2?=
 =?utf-8?B?dUh4VTNDVHlIcUNDQWx6VDhZR1pqTUcrR3N2L3RMT0ZPNlRybFRxSlZ3ekl3?=
 =?utf-8?B?V0I2Wjgzekx2WU1zaVpUNnZyVnNRR0kwK1dScjRFRE44dHIxUVNLWjBHK29W?=
 =?utf-8?B?SjQxNk9GNHhSckRFbVdPOWcxSzFOY05Ld1l0U3kyNEdTNkdRdVZpUUpsUUtv?=
 =?utf-8?B?TDk3aWp3S2krRWNieHZXUkNUSUpjdjd2Q2N6TjJ4MDNiUmdJOWE1WTFmSmtP?=
 =?utf-8?B?K3BILzhWQm5LM3ZkUDdhOFdnRmxRSXhrMDJ1c09hQ085MkQrZ2xDeEVBa2Z0?=
 =?utf-8?B?WUJyTTlJQW42S0tLWHB3bnFNa0o0V0pBUjF2SG9UUTVwZWcvNDdXcWRBY2h2?=
 =?utf-8?B?UDJJeXR0TCtYWFFST3poSEVVcE8xRTRMYmlYTVV5Y2dISjloS2pBdFdrL0p2?=
 =?utf-8?B?VE1lRS9PSWx1RGxXNmJ4V3VUeExwZVVsNzhPY2l5VjBzOGRYNVFBYU4wM2hm?=
 =?utf-8?B?V3cvWTM1SEhKdUdJdndtTmZtNllOTW82dzhmUGF1NElvaWsyYlFJRkZlKzhY?=
 =?utf-8?B?VWUrdHBHbVZRMnl6SzNLYnIrMk1qMW1USkZ2T1BkMkxYbWpsaGRlZWk5bnpQ?=
 =?utf-8?B?Sk0vRjV5dHh2WTVrbDA0cW10dGhnRi9QVkNlU1haakRoNTZvVzd0eWsrdlcx?=
 =?utf-8?B?dk9pZHRxM0dDWi9HNGlTMTF6cExJU3I4ZCtHbDZRZngraGxSRWlIeXlvMVFD?=
 =?utf-8?B?cFFkTnZwbVc3MlYxcno5VEQ0cUVTRC9PakJXa3ZSZ1dIM28vREJoRlhiUHlY?=
 =?utf-8?B?dXRJZjMrcmppQmdKQnNTSmFvYzNSQTU3R0FwWVNWRzNrOTNuSWhGYVdIT043?=
 =?utf-8?B?RzdtZ0RzV1lRK3VPaEU1d3pMZTZPcW9ZY01SblZydlcydklsRGhjL3pZV0pD?=
 =?utf-8?Q?G+cyG7JfHpbwbxHIwr/63EvGZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f414cd-395a-4c09-8452-08db7ecd7f67
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 09:35:27.4852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70pA42mUX0egrSwjIySmCHMAcWT8Y4VchqkXgq3Qlr2kpS3lT4XgCIS/smW7fo3gLv3YSqJf/MP00FxFGSNVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9338

On 07.07.2023 11:12, Oleksii wrote:
> On Thu, 2023-07-06 at 13:18 +0200, Jan Beulich wrote:
>> On 19.06.2023 15:34, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -29,6 +29,8 @@ ENTRY(start)
>>>  
>>>          jal     reset_stack
>>>  
>>> +        jal     calc_phys_offset
>>> +
>>>          tail    start_xen
>>>  
>>>          .section .text, "ax", %progbits
>>
>> Since you call a C function, the code to save/restore a0/a1 needs to
>> move here (from patch 4).
> Thanks. It makes sense.
> It would be better to move save/restore a0/a1 ( from patch 4 )code
> here.
> 
> The only one reason I didn't do that before that calc_phys_offset
> doesn't touch that and it is guaranteed that it will not ( as it
> doesn't have arguments )

How does a function not having parameters guarantee that registers
used for parameter passing aren't touched? Inside a function, the
compiler is free to use argument-passing registers just like other
temporary ones; their values don't need preserving, from all I know
(otherwise the RISC-V ABI would be different to all other ABIs I
know of).

Jan

