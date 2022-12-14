Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86DC64C7B7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462082.720249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pb6-0008Bf-6D; Wed, 14 Dec 2022 11:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462082.720249; Wed, 14 Dec 2022 11:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pb6-00089M-3Q; Wed, 14 Dec 2022 11:06:48 +0000
Received: by outflank-mailman (input) for mailman id 462082;
 Wed, 14 Dec 2022 11:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5Pb5-00089G-3i
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:06:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061.outbound.protection.outlook.com [40.107.247.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65d26a43-7b9f-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 12:06:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 14 Dec
 2022 11:06:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 11:06:44 +0000
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
X-Inumbo-ID: 65d26a43-7b9f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLF+g+SiarLlRwz/kYylQ8FWAs/yw4tPRGJXJ8DFMlY2NHiwoxxxkYEVNJw5hDItwEM/e75c2YLtB3Ai+O0w8EhYU+Ll8cduFxBaPxKy/7kV6Hceoo+BCSWXu5AAtXfvO3JX69vH2IXiPub+ey5pa8mZSTb24Fl+OqH75aL9QDVXjDhgMY9dmW6fbqdJVuGtEJ7hYsKw+V5XnmovvWDp0blPA5mXWsCoDhJmR/Z756Gne6TGgbMXIiBKBjokZrTBBAC96s3F5gvWu2sfvOFgktKbPB2+/F4/OQ/HjTLGMAUXtawm3pix5NwUzdKowVKPY8Hrf83C3M7viSfRPJ6xYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pA44uoYki8uYwFNCNH942dZqMVs7QAbyxqF6N/+jCM=;
 b=doPzXP8SaNnE4r1mdi0DL9ZpghqeHFZIrMo+iuvLvHYbLHClh0iHFTBOfgIqXoUySjHe2tz/nhiAStyWU7h6h63vt5iBxBbfvC/mFwVHKSBOLa/SoOLWoOUJlhuKiFNdCzBq1UAbzcHkcR5CkGWrf2IKFdX7JLIR4kBTc/X0LoQkItRh6PnP/1iAZ3ChEErBDs/XY8AGVA5eVoo9vfz8pEQEdyAw7JtfQqSdSulY5uPbFzTqXzVB7qr/6N9oduQRShqemUsQc3a2k+iGOXuypYvekb9W+W2oAKFIc2GcGBe3MidDHNiPJQoIBNSHt+N5hu91E73wF860WIfSwoDQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pA44uoYki8uYwFNCNH942dZqMVs7QAbyxqF6N/+jCM=;
 b=LSquFzD0VKbgwT5gGywcJpgnHJl904GJQHWsHJxNgcNQiDQ/I2REw5JjUzNbDeNtsvp5Augnyx28vDIpnHBjB2DgGp6+tRC9YoyURK8l1FzGneKSk7f25iM694YI3DBtpBjZxzfDKv+1KrrrTZWAVz1vrZhuhNjbDE35Ryy0d/CSd8kJMqIj7sdV6iLiB/w04s0Ag227xzUya0F7Fo2JVyx8qitE+2Q9OvsIxWdHmyJxi4JYjq0CiGJRV3/RWh/JEIYVfw7wEn3LPUc5FPUisoaER8OuvbnoaIHLyWB+rjsYBLwGE3qO2w9flgPQJUa9wVW3HxE39vlF6SSvNfTD8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33c65ef5-3f09-b568-4f06-aec0c6d68997@suse.com>
Date: Wed, 14 Dec 2022 12:06:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 00/19] tools/xenstore: do some cleanup and fixes
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20221213160045.28170-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: 04533c41-e4cf-4bd7-6e48-08daddc348f4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VXep8zM8az7rkQeip7dsuzmSMAaPvmD8pHMJ4ug1SQJdETmgf5PYFbigTsJmFqB9bf6jUMhKNq0bCz8Pl21dsnWLqdtxYS5h2P+mLb43VDrQT8+LF3Pe86yZAW4isYu8U/Irjb2P8+vcGH56Zdl7HUOp9V2Vr+vVQIaY/y1vTl0j4imS6DC7g2VqmcNTwstTWvCutC5HMUOuJpWP7deI4FWTGpxtvmo/ACbP5v0wjsebSvbr/ScJiCSPYqP1NQYj3kMurSkGSri7BN8UmRhovgx9ZP0DRse5BXmrpEu6QCg+jRIx3sCp235JTYt2txoPgydaLzwDjn+6xNQyVdc+PJ1gHuROpB2fIDQE9A0o8oF3/bWCjDQqXsnThv8NXrcbzufwSRLaEdGpc0SlUY2kXHgDPQ0PvEZ9/djBxDz649r7BrF7dQnMtfceZaxc5xLmYGJGF50hSj+cfFAx5FFIvsaRJxy006mK96dMad+F4OHbxiunVufT3y2rtnWQAs2wiD/YXSkMWR4Ttib80M9FdqXpcwzJcGm9un3WoEaOf6O9VXcf3RNR2aPhYfyLWd+yWsyRVXj5fFzocweP2BregBhR0qM8+A3ZJKvnWvPdNUcyU9DK6hcYuFFzch8c9U9lFv5MiqieIg7fjpPdmJ1k/LGrdWEQ5iTJRQiXm+bcL5zx2QVfy4XvKu5Yzarbyyt3trDnPSptq1FAJgUDa7srFkQR/EyOYJZqC08ilR/N+xY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199015)(38100700002)(31696002)(2906002)(6486002)(5660300002)(86362001)(478600001)(4744005)(66946007)(6666004)(41300700001)(66556008)(4326008)(6506007)(37006003)(6636002)(316002)(8676002)(26005)(186003)(6862004)(6512007)(8936002)(53546011)(66476007)(2616005)(31686004)(54906003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVBzL3cvbkQyUXZ1TG9vWFJTcEpvRWtNRmh3cmhudVhHRlozTlI1Z096MWhV?=
 =?utf-8?B?VnNXaWswZ2VRQ2JpSGxaZitTTFJpMldmemF4V242N0Nibmp6WUpsTUtTR0VB?=
 =?utf-8?B?OEFBVzJhY293MysrS2RRKytRK2VZOUxZem80eGhwdDEzV0c2RURPNUhmV2lD?=
 =?utf-8?B?UWRydk1VZjdNbnV2K2hhamtBL2JVUjN5Z0RrTGxsQjd3a2pReDUwUmZRNlVm?=
 =?utf-8?B?OVl6eUZQWlpYSXBkV1JYS3M2UlhJcU5hTUtFczAvVlR4Y25lbytqZEhOcFRW?=
 =?utf-8?B?aXJyZjhMR29Cc2VSTGJGVXRzemxVSVNDbmdGT1FaK3IvdklubzlXOFkrK3dC?=
 =?utf-8?B?RDZ6TFNFeDJhVUNhczcvbEtpSzVVSGpLNkwrVGhrUnErNEFtbGV6TE9iaWsr?=
 =?utf-8?B?a2M2VG41UlVkbm0xcGo0Z1IyYlJWNDc3SW9OWkt0d2VFRVNzZWhxUlJFajRv?=
 =?utf-8?B?YmZ5VjljTjRldWlHbGpzeVZWYSsvb2VXRzhYS05scXcyTUpaT2tsR2lGOU5y?=
 =?utf-8?B?by83NVZXcGdNUm5JRUV1N1RCZGwxNHhsczJBazJySGQ4UDlMTzdDenVKdG1P?=
 =?utf-8?B?L3RCd216OERzbmFqMW1DMGJ1Tm9vcWFqMGJnUmtmcWE1ZGZuY2NrTXVRVDdK?=
 =?utf-8?B?UmROanRBZERjV0tidDF0anNuMnMvdEFTaElua2wvdEtqNFZyN214SDRaTzZx?=
 =?utf-8?B?MytPQzc3aTlkT1hRTk5lS3laVG50b0NyT1RTMWpDUU13UFd4MkVZbjJEMGNx?=
 =?utf-8?B?NUpYS0R1VHVaMlh0bTZENE03ZkNSK2NWNFVJK0hjOC9adEwvRDBWMHNrcWFO?=
 =?utf-8?B?dDRIR1ZvTmtqM2N1WFErRzlBU0E1VDZnMUg3QjdrNVYxeUVtSldDMEtzUExi?=
 =?utf-8?B?TjRwKzVhWXlpSW1UZytxMTNhOFlJQ2tabStTZDVubEtxQ3V2NHNrNHpCVzdz?=
 =?utf-8?B?UmowTmYxTHVGamJ4clltSldGY3c3aFJZRi81MVd0Q2w1ZkRGL1FYQW9lOWN4?=
 =?utf-8?B?ekRqUXY1T1RmWFBuRmZSdGdBNXRiSFQrTHdjUjFYR2V4dEluakx4a05LRDZB?=
 =?utf-8?B?ZXJRSW5MckQwTmZ0Zy9KR0lyTDJNTDZPWGkyTEI4YVRKaTFicmZXWTRnT2Ry?=
 =?utf-8?B?NE9QRXVkcjdoWHQvRDAwdWNndmdONGVOODVOTkgzUzgxVlhza1d2WnFJN0VE?=
 =?utf-8?B?RzZTNDdZbVBQQzVBSENIVnhma2dxZDRSOS9MU2YrNHBHQjFzRWF0Szg4RVVi?=
 =?utf-8?B?M2wveEpYNldZblRUeWdQdUlCejdFTUE5ZXo1aUZwOVhIejdWaVR6Rnh4QTdl?=
 =?utf-8?B?aUR5TWlJa3VWdS9YNDZKOUVvckxSNDN5Wk4zQU9Jd0x3MTdoL0hKRGJRT2Iw?=
 =?utf-8?B?NkhrcHp5Q3pCbEdsQmk1Njh1QVdhWHhmeVFBY1ZKVWQ4T1RGcHBSaWpGZFp4?=
 =?utf-8?B?NmtqaXdYUHRMZ2VWVGdlSHVuSTh4enRGWjBOeWpua2tKUk5TY0ZtWDJOSzUy?=
 =?utf-8?B?TjVVRGFXUHhIdmg4eXFqQkJUUXh0U1A3N1N6ZVFXZC9kVVNYYWZBSkFuVE1T?=
 =?utf-8?B?MGdTRmd3M0FpWnNWUDcwek56RmM0SXZsbGd1QWVRbGtTNE1TSGtXTjVTdHVF?=
 =?utf-8?B?bWlqenhwc2NQWjJJemlPM2JBNVI3K2dtSFc5Wk9vcWkvNm1yZGFxL2c0UVQx?=
 =?utf-8?B?cCtnRXY4R0EreFFGSC9kRk40cVphWGdPdVVWM2dpVHdHMTNKNHNWelVqOTU0?=
 =?utf-8?B?WTlCc3QvMjdpWjU5enJCNTdsa0VUaFRvdGNJZHFKd01MSzhET09tRWsyOHpr?=
 =?utf-8?B?cjEyb01zVzZCMWl6RkRBN2NnK3dPUUcrSGhjcC91THpXRUovM0Z4Sm1RbThL?=
 =?utf-8?B?Y0RWNXoydk5iVnJ2Z2FuMlI1VWtrRXU0K1VZSlVTZENWRmRFeXVDOVNhSjFM?=
 =?utf-8?B?RnZHU1VhUkFUQ1dPaExudG0rM2R3bGZjU3QzMUllbkk0eTVmcEkrcnZIeU9x?=
 =?utf-8?B?bEJmS0JHSTNpN2E2dkI1SktBNEkzSlp4dGNubVhFeWl3cWJTVVI4VkkwdThK?=
 =?utf-8?B?b2FvVmRPc01rRldnWWN6Z3R1R05Fb3N0aEthL09pMTRubFJwbWhaT3pWTXlK?=
 =?utf-8?Q?aJDyNXKDn9kY+/NAT4UF/G/p9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04533c41-e4cf-4bd7-6e48-08daddc348f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 11:06:44.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkw08FKWHc0lOLyzxe9FlA0gRF3fDO6u2WmJkwDUiyMJXWzig0Kc4ayuShpPQHeduXAXC6IfqyOtXxX34uwKOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8912

On 13.12.2022 17:00, Juergen Gross wrote:
> This is a first run of post-XSA patches which piled up during the
> development phase of all the recent Xenstore related XSA patches.
> 
> At least the first 5 patches are completely independent from each
> other. After those the dependencies are starting to be more complex.

I've applied the three ones of these which were fully ready.

Jan

