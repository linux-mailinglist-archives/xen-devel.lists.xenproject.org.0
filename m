Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C3D718144
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 15:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541785.844884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Lj6-0005r3-Gt; Wed, 31 May 2023 13:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541785.844884; Wed, 31 May 2023 13:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Lj6-0005o8-DU; Wed, 31 May 2023 13:18:56 +0000
Received: by outflank-mailman (input) for mailman id 541785;
 Wed, 31 May 2023 13:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4Lj4-0005o2-Pt
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 13:18:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afd8f024-ffb5-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 15:18:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7043.eurprd04.prod.outlook.com (2603:10a6:208:19b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 13:18:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 13:18:23 +0000
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
X-Inumbo-ID: afd8f024-ffb5-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7FJIET0IufhnY1eojwGZl3m7qBvDsP7Kk5ulnIFFLTDyvdW3MF4nQjoG3HRLiwP/CCbNk/D0CBeCg9IL16KJbNO3TZsnFlmOKF9beReicKjUDFop6ikJPLdTb8Ah7x8GdgypZDL2Dx4GmyysIKtK8K3tlPBJ3w6SZszknTNC0vh2jeJ/ZMQTNgC6c+CVuiqBA1Klw0RE7C4+zl0QMs78qvhw0d1qbAG1ilx+IlQ4U31tUJtb0tZ+Mp1LaMfwwWss6oz6KCLkL4DDHh+JKXKq9STWdiS+hqRD/AlZ7RoFNY36o5HLRuUZEsvtKjl+TjrCPFSqt4rNIHE5GJT2xdfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmIPgAhbc3o7ZTiso542VUldPhVMLg1sQpqZfeRXPX8=;
 b=Vn3nBm0fEsRYXHKxWEfL5X5pjV/a5O8afemFbisXkOsLs8LuccrfkeLYnsHSjRHzAELf4boIs/S01skQyQK/TBwNAqEMakdk66CBB+iCJCv1U4VL5fTyZZGtL4DayCJdo+/nE9tEQzfbEIwcSMIaQ5+Md1tZc7zHnZ9Y7P1igLblYkNSz5TGFGa9Gqg6LovIKeWSVAhIw/AOfhL+cGiR0eO6qRv9QZog5Npn3H4Qo7wsb5leefpGzur57HVkbHV2qIzSHT/Pj6YR6bmXaHjIbkmYzub0k0EDZlD0fPTJgI9A4hVEtiHSX+CAKCauKYpRD2lGGL/PAF79bljRRaYJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmIPgAhbc3o7ZTiso542VUldPhVMLg1sQpqZfeRXPX8=;
 b=oAm6wpdqouEv61zOgC59DY40DDeKkgFjpEd/SVnU8y2MUGjzV+CddwmUGvSABa3gVXpH3PS6JE0azm/vv/Iygq18MWxFtUWlajxRQZs7xqjNr6wBdoWAzNw/S0ogI7zLQodHxd+IzIDGAWKrRRrKPLQG8Ma6Kv3/qbcdYkRvfUNt+257jk/evcXkGFC7dtGuGGvuhhYkzjSjxHA7iU9vfGElVPSXJzx45X5P+G6Aa8FV6Z+HuarcSkbce5kxB2N0Ljw+Ge+ZWItloY1XQ0rRDXNKfd+Zq9hkbF4Br0ivQ/OS5pxFtRDMPerkDtvevTqwNm/hMxMe2HtzAS72x0wFBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb1bfe6c-eef6-5552-78e4-bdec8fd43561@suse.com>
Date: Wed, 31 May 2023 15:18:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] vPCI: test harness adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ecec7c-285f-4e03-bd96-08db61d982d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7nKbTdW5/EgYKK8/D29ESwDBoPJKy+Gw3PAcAPtl2N+3vcLrAMH62DPpfQYaAYIKZ43ZWHQjmBNSUN6TPPuM173osLwuNrhcwikFN8caDZH9C34GAUkeki4uxq7eqEInVxZG/i3MgFe9S/XQYkgtzBp8ihYHbMkEiGqPRLbS/LudjsWBRY8VwKGo+WHOJLmq+45nbOYsY0GItfrXOBDIfOyGRNangHZ+qZb21qXYlNV4ZcUKLRozNr4Mx4lsKd/X1HTwy3FNUxHFHyv6AvLl08nP+XhG8GYiX0MVkTU4uvHpLOyTXVI6idflLZGmgtpC8v5GvuekvWK4MW8wiUucItCZFIYxBFps5MU8S50CXPuQwb+RkZT/ISGq2r4NEQb37RDyUjvHECxH7BiKQ856CtxlZCC7QBMNgUVlOi1INdZM9ylICGjHx4XqAh3iJ+bYzqK80TD2f8kvcbcWbbuLYtq4fS458QKFts5QtTvp7NreQcXS7DCkmv5UljxdFf5cSuB9VVYSW3TQgaoNxguzLeMZnggbMHxtdNUAiX6ZgW2ivnusjdrJAykppb0CeOR0RsRGvmZTpY4rdBwE46EBU2O7w4/Ks7mIjd4po+re39n10ZyGGdOFbioeCZoo/fBEi9JUKcnM99PZGY+sE09nlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(31686004)(38100700002)(36756003)(31696002)(86362001)(558084003)(478600001)(8936002)(41300700001)(5660300002)(26005)(6506007)(6512007)(186003)(8676002)(2616005)(2906002)(316002)(6486002)(54906003)(66556008)(66476007)(4326008)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NStMb1JjYWNGYzBjOGdOdjIyOVdhMDBsMkVGaVhMVEp1YmFUa0pXN3hpQmR3?=
 =?utf-8?B?K2lEMElVcEswS28rb2VmRnl5MGVjWFlFcVBER0c1TTViY203SVdpL3VsK0Ix?=
 =?utf-8?B?YW1oZHM0Rm9GV2JMY01CdFFISE55VDN5MnhHdXNwVWNPeTZHekViSHFCeHpM?=
 =?utf-8?B?YmJQYXRPSEJmL0RXblJ6SzdOMEZHUVJnak9OUFFSV1ZGZHBRaW96WWJBbWRx?=
 =?utf-8?B?TjhrbzFYMmZKQXozM2JWeC9ZSEVBV3ZTVFdndENkem0ySnRmYU9GUjFDYmxI?=
 =?utf-8?B?elQ0clVqZ1lpQmlvcFVGSVF3b1UyQ1dSSVg2aEc3U2lIa0duNzZtZGkrQnJS?=
 =?utf-8?B?L1cwT1U0SEtmU1VOMXFsV3FvVGdpZ0tSd1R4bmdCWnZyYzF4WWhrNFZkOVdq?=
 =?utf-8?B?UmR1dkx1NG5oOGdBaWtMSnJCOGtSakthV3Vrakh3Z3QrR3RLeDZpNll6Tkt0?=
 =?utf-8?B?QmR3RmRiNlpsWkZGMjhpWG43bnFselhmMjFoaklSOFpMZjE0ZzNFK2k4UnZY?=
 =?utf-8?B?Nk1pMmE4ZXhIY2ZrQ3Z4QUpsZ2NKZi9KMkh6d2pJWkZLeUhCSDZXMlJjTGUy?=
 =?utf-8?B?WTJyS3AvWTA3SitmREQ3dlUvMUs0dHozdml0eVlHdFJyU2NkS1pOS0xXSWEy?=
 =?utf-8?B?bC95cks2ak94cklrUGQreWlGOTlZQ0lLN3pCTFpmaWppWHdtaG94bkVZUFc2?=
 =?utf-8?B?VXI1bTRmaWQ0Si9raUhVZ2YrTzA2bEd3R2ZVa1ZKV0lBT3lPRWtKTllZOXNr?=
 =?utf-8?B?RDFacVQwbmhNbnRneTZaRDcrV0xSNWFYK1dxelJIV0lVNjB1VDVCZkFDNHBT?=
 =?utf-8?B?RWRKcGZNQlQxQmFCQVhRRFN6amlVZkwralkzQWlwZnR3Z0JpdVpXUG04aE94?=
 =?utf-8?B?d3NFRWFEMXp1UTN3VU9lOFVIeWdCdDZBVmt5b21ucmhRZUJJbUJEMWNHV3BM?=
 =?utf-8?B?ejF4dFowTG4wTVdweTFYRU1NWW5od1dsazZ0RHg4VnZ6MlB6bGVxbXJycGxD?=
 =?utf-8?B?VTYzRnJHNVlLbDlIazBTS2FNc2FJbnRsKzZhWlI0NEE1SGxtRGRwTWQ3eE5n?=
 =?utf-8?B?cXhKUjBLK2NuZk04dTErMlU5VlJDN294OUNraE1FR2ZhWWNLd0VyU29YMUMx?=
 =?utf-8?B?bEprR1AvOCt1YkcvbHljYkhabGt2cFQ2RFdqbUU1bitvTThRcXUwbWZBRjlw?=
 =?utf-8?B?SVVQVWhjTnFJZVVKSDVDdVB3Y0hrei8rSGZXcUJJOTBtbDlNS1hsY0xaSmc3?=
 =?utf-8?B?ak5NVExJblQwdDJIWW1oemI5UEE1OUFQNHlMZlBGci93YWRhekErc1AyZzNz?=
 =?utf-8?B?Q09WQ0d5SFNNMDhoYjVqZnpZNllXZ3hvbGNlUUdqaDNPUHZ1alRleEdLZG0z?=
 =?utf-8?B?Si9DZURCK3VKK1d4eUJWTnEvVnJyLysxNUhIVWNhTDB4MGlFR3pKUGQxNnVU?=
 =?utf-8?B?ZUJtZVZKeVBBODVtZnJNbjEzbFlWM0VvSTk3Wi9NeUNVWlZBamw2N2V2TDl2?=
 =?utf-8?B?eEtmbTRzeFgyRHdXNGdYejE1Z2hmVno3a1BHVGtzQ3BIcFdOVFFzeFcxdUh3?=
 =?utf-8?B?WjlUQlNmUmJDTGVna25WSmhLV1EydWNQeUxlaGxwSEYxQmdlWmoyT3FzOTRI?=
 =?utf-8?B?dUhqRTBneHJMVU04OGZ6QngvYVB5V2dPQTFrcnZTTEN5aFBlWkw1b2lYeUZn?=
 =?utf-8?B?N0Iwc2ZuakI4Y0RjRFJYalltVHJMSGVtMWtoc242THYrTDBOUlJLUk5BSDJO?=
 =?utf-8?B?bW94RVA5anpaK1B3Wml6MUsxSTF2NjQ2UnRmazFEcU9hVGIyWE4vY0p0ZGRF?=
 =?utf-8?B?YzZ3VmlMd21mVTdwNzN0SmFYRXNqa2NiRDlPVm96eHhjZ0ZCYU5XOCtzVE0z?=
 =?utf-8?B?QkJyR3hDb3VVbjZIY240UGFzM1FNZklTemhMZDk2bGtmN0R6ZHhKblhDejAy?=
 =?utf-8?B?eU1OeTJvcTFTTEc1NXFieW9lcXo4YlU1UEx2V1VIMGtWa2d2dGdoaTJ5Qnkr?=
 =?utf-8?B?bFZWK0c2UkhvbEpXbUZMNmVyQk1rdEZCVjh0SjBRYmNGTlVVcng3OXg0YzlL?=
 =?utf-8?B?OGU0SzFVRFVrMzdZNzhLZEhGRmsxNlZZUDl3VWtJb2Q0MEF6T1N4YWlTWjJ1?=
 =?utf-8?Q?EgJJLcYywpruc1Cm+r1lLuoxI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ecec7c-285f-4e03-bd96-08db61d982d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 13:18:23.5655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeyVSNVXOvSyXn3gBn+q2Q7dx3Zv9vPbmJedW1gsjCue9e0cB9bV0K+UU1+z4xCCmg1sH/Ntowy034HHJOOENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7043

1: add test harness entry to ./MAINTAINERS
2: fix test harness build

Jan

