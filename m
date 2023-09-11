Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C4379A5F6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 10:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599131.934410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcCd-000563-QM; Mon, 11 Sep 2023 08:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599131.934410; Mon, 11 Sep 2023 08:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcCd-00052Q-N4; Mon, 11 Sep 2023 08:23:27 +0000
Received: by outflank-mailman (input) for mailman id 599131;
 Mon, 11 Sep 2023 08:23:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S94K=E3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qfcCb-0004lv-NL
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 08:23:25 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e83::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78d1a4a3-507c-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 10:23:23 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.35; Mon, 11 Sep 2023 08:23:20 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 08:23:20 +0000
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
X-Inumbo-ID: 78d1a4a3-507c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5ACrEpCBso9MrV8X90FDZjcl60K5oiVyYTWbdVzXrLTTbocC35AzeNBEUAeB2mH2M6EMDka4S8xcJ6eiiLwxJkH0t03jxOXzjKOxUCktguSPGV0C8uivySJ3bE5OEaTmsDZSSFYMS/PAo77c6lHlcTt1JN2xnumNPdvoTIk6cH+2TSBoEo1gtc3sh/XKFCjUWKXvSzs3s3S50DHsus48kKxDpp6ob82ijGtsrTUrnymtBmN8DjgM5D7/eSUH5TeiYVd0+UWn+YK97JFnk6rtvlC8TyjY4B+4wMea3rSMkMUYLwBM/HmrycB/jbz1ChYEyczLi3uhqPT3nMK+yja3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bR/q+DBiyp98CunEwsJlFJ3zkyuBS1WY8ICKRRxT8M=;
 b=nfbsC5Ii0oDaxGv8DUGspVxMp3v8RPDFF/nyWZY8IH0cLjOogFabiImKbFCj3PnWFpXgF/M5k4faWdyE7YfecaTkTMrjwmFJOdxzXIhY1OhyfWX19A/vkaoWOimmXU6BoUBUXWCtfeS1dQ+rdVrN4Rt9F81kH+IQOfihVfrLxanIwozaZzUctcsmo/sc6uIc+R2IAqsA4tBy2iCudCVZHX89iiAMt/HqJy7I4RxP/5Kinic5ogX8Yb8xXx/y8PVKIyj//dJFUsctYtsKr5JojcmrKC2T5O0BriS+SwsJMQUE2CAVa5PZ3JUKiSnffjZrapBDracz+eFWduYUbKvGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bR/q+DBiyp98CunEwsJlFJ3zkyuBS1WY8ICKRRxT8M=;
 b=eP2wT7ZrZq27BBDU6+yXAH9qu9PYaESNhsRaRLTycAChGXBmTC10/3yXlhcxB9KqTrl4soZDaxGTDOMBvSJkjk2eyVVv5BRMmUXgBKezACTuwH7Kcy4MD14RcwOno+uwTm2LMtxOYoPAjrwREHMxX7kpU4ZrdfI+YEYk4+OQv1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <23604843-555f-4e34-fd6a-53bbe7f94d68@amd.com>
Date: Mon, 11 Sep 2023 09:23:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: Xen 4.18 release: Reminder about feature/code freeze
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3dc0a9b2-d690-b9c7-321f-008ba1fbf084@amd.com>
 <CAJ=z9a2LpUe_9160PEChMG=pSLYcwLwETdrTN2zDrk21QP2qpw@mail.gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <CAJ=z9a2LpUe_9160PEChMG=pSLYcwLwETdrTN2zDrk21QP2qpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::6) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a450984-4df1-44f6-df10-08dbb2a05b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wTd2ZEWHqQ048Ii1wS57tqsfgtxTRHDMaXPEtQaJlrfXambKKs/CKB2QRwbyHLd9n49+yuduslGXCj+o7pI1Vp2SXArrvrpuMS3kXl8P86ywnqb3diDNMeBu+dKkfidB/joyFXGgyvW6b4Z8fNCRFKMdPelTtCcYQZ1uXNyxP9E+aTRMZnSEtfhyjUXwneVw5r26ARMyzthUeW7eGfZB/e/mtQK9OamGXeVdhP647nWC2a+r6PRzFpRJxCHi03O8Tduvnk9SjcS998b08z3MPcBLEs/TDLUCogMCl/kQ0jvrXtn7JbLijcXe3KIAoDxpRIzU4UkocAAQEdN3EFP6LdtxssVAISMdiMaM3TIAwlxk19Tk6Jlqa95VG0ym7g8un0Bij+rVkVyU5K2oQkXs+50hm+UYEvFq5jqaveF3tbj3z4GF3WGBzhTh/C6WG4O6qhotO8d4Pkh0Df5uRwaAsH0N1aVoK5bDiNjJVaMrsemzi4b0G0KPHZ3SvYfoRbIt5POJYZzCyAWwy7PDleSGIC2KuO6iEcWdF/kSxrBVZElw+3M6ueKdxCkMM1dXcEwXR9K67IUpCl8L49iR0mbgAU6K44CXFmuHMKjMmebvDGLhYad1eqoLypkVFACPwpvPEpzsmFXGqzuRFYa7cGIGF3m+WbrOEa1YyGu8+9q2RrQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199024)(1800799009)(186009)(31686004)(6666004)(6512007)(6486002)(966005)(36756003)(31696002)(38100700002)(2616005)(83380400001)(2906002)(26005)(478600001)(53546011)(6506007)(41300700001)(66476007)(5660300002)(66946007)(6916009)(4326008)(8936002)(8676002)(7416002)(316002)(54906003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXZIVXVEZkozQXE1NHl6bHRjZEJmSFNoemp4NWxCbk9LYTdxWUNoY1dabHdN?=
 =?utf-8?B?d00wV1RBcldaL3lPYTVJZjJnVEd6dmIrNWRNK0F1T1V3ODA0M3kyT08vYys5?=
 =?utf-8?B?cjNTQ09xaG4wdmJneDQ4V3hFTGxvQWU5TWl4bUdrbGRPYXIvYzVXek81aFNQ?=
 =?utf-8?B?dzBKOVJsbWFJam9VTkh0Qk5QY1pTU3QyNUppQzJad2ZYNWxqNjl1cFIzd1A0?=
 =?utf-8?B?MkZGdGN3b24rbzFKVERZcjVqT3hlMmMvZHlCT1dwYkE3NldUNDYvMVMzUXA4?=
 =?utf-8?B?ekd6T0xXY0pYR1Q5cG5ZV082cjZmZXlMY1QxTmc5dCthd2w4cm1qUG5Ib0Jx?=
 =?utf-8?B?TldLcHRTcy9TZThWa3RyVXRVaHhWTjk2OXkxZ05LUEEzMTlzOThSQmsvc0I2?=
 =?utf-8?B?UENPckJiazJMMVVzU3dwamxDZEphTGlsNzMzaGVoR1BiZG1kZWllVklVOTI3?=
 =?utf-8?B?d2diL3VUTnQvZ0k3Y2ZIUW8zbFhKMXhsQ0ZBbnRvSmlJZHJHQzc3NkMrSVJr?=
 =?utf-8?B?V0EyNFVibTNxcnI3dUJ0OTBCSU41NTh0ZHhCL3Z4WFZhdnM2elVTSzZqNGw3?=
 =?utf-8?B?ZnNkcXo2ZmdTenhhbGVwRWNBSituSlhjK0FYc1NsRXdQV0JZTisvV2hzYzhX?=
 =?utf-8?B?TWdKVnIvZlhab1VPN3pQMGlUNEk0ZkU4Z2JUd1RyOVFzWjI3UHFITGdhZlEz?=
 =?utf-8?B?Q2lydFF2WVEzcmcxVVdhVFhIRHA1MFhaM1ZaZHZOdVNvTDBaMTdxSEhCWWN3?=
 =?utf-8?B?WFh5U2ZWdmlJck8vS29BTm9qamtFQUFnTEE3cmlPdDhPUHk4YlhmU003Q2dO?=
 =?utf-8?B?WVp5eTgxWVAzUFIyTTRRNU51VkhCU2Q0WEY2SWNxYmJDZnhycGJDdzljeWZn?=
 =?utf-8?B?SmRMUkErdm1XbVZKZy83Ym56d2wzOTZpMm5BaVkrdVAxRUg2R1JsWWpPc0FI?=
 =?utf-8?B?Zm5ENlAwQWN2Sll0TWxLaEZJdWJlVk84Vjh4aVhqbXF2RXhKbWx6TmFLUmpR?=
 =?utf-8?B?allCclYzelUzSWRvbWZJc21tUE90S0V2YXFjZVJSRStid0IyTTZLRnoxeW8r?=
 =?utf-8?B?bHFSQXlPc1lFb25kaTJ6YXA5YlE1L2NoaU1YRVJ4QXdobFN1Nm92c3ZGS2ho?=
 =?utf-8?B?MTRSU1h1VVFsVEpoV2xPbnBxV2lzc0hEazNmQWZPcXVqTFZIUFJkcnVKWnlr?=
 =?utf-8?B?NWk5bSs0MXc4aWRvYXZ5TFd5bjFFby94SXF6NGhGaktkNEdQYWRTdFd3WDYw?=
 =?utf-8?B?YWlFZHNJL21USGpzbzJoaGMyMmRLSUlHVW5jQUcxMm50aEJSOUQ1UFM3SFcy?=
 =?utf-8?B?RUZwYzY0allSc2l3bGwvdjJTOTl5R0k2MjBTdzhDa1lHakd5bzlGRzVjeC9w?=
 =?utf-8?B?bENpVGxZRFhWcEpCLzRLM2F6cnQ2MURWMXdaV2xIdC8zblRCQW51OXhFNmdC?=
 =?utf-8?B?UW9scDZsWDFhM3JaVEx5N3FoZWlSODZneXBQU0JNNXVzdDVMR1NTSGlkUEJK?=
 =?utf-8?B?a3VYdXFCdU5XbTJmU2UyeUFiU2hSYW0zZVJEdXRzTFhTWWQvOHYxTUdKZW0w?=
 =?utf-8?B?MUwwbStUZ3RRQUF2eDBoUElNMWFFOG9pc1NFUWMzQVJRR2tLVG45YkN6NWtB?=
 =?utf-8?B?RFFvcS94d013a0ViNEF3MFZFMHIrbjlVQlhqS3VTQ1JESGkvOHBZMXFCcXdz?=
 =?utf-8?B?NE9VNjE1SkRSZVk4T2VhWWpBMDN0OXd0d3ZubHJtdENKSHJBenBmendQR2I4?=
 =?utf-8?B?cDU2MDlkRWh6eURpMjVQZmRpcjg3akZHZnJuaVZiK1JESElJU3VXS0xmbzJt?=
 =?utf-8?B?ME1HZXBUcWtRbG9yMGlybG1oR1JZTVlhQWt3M0pHTGJyeGhCK1k0aUx5Nm1D?=
 =?utf-8?B?Z1JGb1h4WmM1M0RpZ1F0b0JDdG5hSHhYamkvenVGcEhVYmpEbWo0a0pRNzlm?=
 =?utf-8?B?MVJqNjVZelFvTzJMdC9EL1luLy96K1Y5NHJnd1dSZmlOSU00YjV2eGswQlRQ?=
 =?utf-8?B?N2xUTVc2R0FIcUZBbWpQeklFa2NoZGpZSmhPNlljOXgzaTRmSEtvcEZFcFFE?=
 =?utf-8?B?ek9Hdys0Y1RBMENCVklWckZ1dy9GS2twYkFpaUxTQkRMRmhSemxNOUx2a3JS?=
 =?utf-8?Q?013Z/ym5rcFtDnovpvS/Gq5O9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a450984-4df1-44f6-df10-08dbb2a05b74
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 08:23:20.3798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0z65qxpMs/iaiZcmDNIGgsqGYR5XlNkvmaZn9muZ+yo1g6ZyuUxVNC0Mp/NyaE4kOGLbDPpZmGGz9VoYXrVHLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296

Hi Julien,

On 11/09/2023 09:09, Julien Grall wrote:
>
>
> On Mon, 11 Sep 2023 at 09:02, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>
>     Hi Henry,
>
>     On 11/09/2023 02:08, Henry Wang wrote:
>     > CAUTION: This message has originated from an External Source.
>     Please
>     > use proper judgment and caution when opening attachments, clicking
>     > links, or responding to this email.
>     >
>     > Hi everyone,
>     >
>     > This is the reminder that we are currently in the feature freeze. I
>     > apologise
>     >
>     > for the delay.
>     >
>     > I decided to make the code freeze date on Fri Sep 22, 2023, to give
>     > people more
>     >
>     > time to react because of my late reminder about feature freeze. The
>     > hard code
>     >
>     > freeze date will remain unchanged, i.e. Fri Oct 6, 2023. So
>     currently
>     > we have 2
>     >
>     > weeks before code freeze and another 4 weeks before hard code
>     freeze. If
>     >
>     > everything goes well, we can cut 4.18 rc1 at Fri Sep 29, 2023.
>     >
>     > Also, below is the critical items on my list for 4.18 release:
>     >
>     > 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
>     >
>     > https://gitlab.com/xen-project/xen/-/issues/114
>     >
>     > 2. tools: Switch to non-truncating XENVER_* ops
>     >
>     >
>     https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@citrix.com/
>     >
>     > 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for
>     > staging | 6a47ba2f
>     >
>     > https://marc.info/?l=xen-devel&m=168312468808977
>     <https://marc.info/?l=xen-devel&m=168312468808977>
>     > <https://marc.info/?l=xen-devel&m=168312468808977
>     <https://marc.info/?l=xen-devel&m=168312468808977>>
>     >
>     > https://marc.info/?l=xen-devel&m=168312687610283
>     <https://marc.info/?l=xen-devel&m=168312687610283>
>     > <https://marc.info/?l=xen-devel&m=168312687610283
>     <https://marc.info/?l=xen-devel&m=168312687610283>>
>     >
>     > 4. The proper eIBRS support for x86
>     >
>     >
>     https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@citrix.com/
>     >
>     > 5. [PATCH 1/2] credit: Limit load balancing to once per millisecond
>     >
>     >
>     https://lore.kernel.org/xen-devel/20230630113756.672607-1-george.dunlap@cloud.com/
>     >
>     > 6. [PATCH 0/2]  Revoke IOMEM/IO port/IRQ permissions on PCI
>     detach for
>     > HVM guest
>     >
>     >
>     https://lore.kernel.org/xen-devel/20230809103305.30561-1-julien@xen.org/
>     >
>     > 7. [PATCH v2 0/8] Fixes to debugging facilities
>     >
>     >
>     https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/
>     >
>
>     Did you miss "[PATCH v6 00/13] xen/arm: Split MMU code as the
>     prepration
>     of MPU work" ?
>
>
> AFAIU Henry listed all the critical series for 4.18. Can you explain 
> why do you think this is one?

Sorry, if I misunderstood something.

I assumed we were aiming for R82 MMU rework to be included in 4.18 release.

- Ayan

>
> Cheers,
>
>
>
>     It see that patches from [PATCH v6 06/13] xen/arm: Split page table
>     related code to mmu/pt.c ... are yet to be reviewed and committed.
>
>     - Ayan
>
>     > Kind regards,
>     >
>     > Henry
>     >
>

