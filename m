Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F3CB39C15
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 13:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098514.1452545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbHe-0002uZ-95; Thu, 28 Aug 2025 11:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098514.1452545; Thu, 28 Aug 2025 11:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbHe-0002sv-59; Thu, 28 Aug 2025 11:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1098514;
 Thu, 28 Aug 2025 11:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXqL=3I=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1urbHc-0002sn-P5
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 11:59:12 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 681a4296-8406-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 13:59:10 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7437.eurprd03.prod.outlook.com (2603:10a6:102:10d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Thu, 28 Aug
 2025 11:59:06 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 11:59:06 +0000
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
X-Inumbo-ID: 681a4296-8406-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wO/9QslGs1CFgtQNDsnZxKr86xOAkrq0fG3gUuiVf9tMc1f+BPZrO/J7cUHq7/XqdA/AtFTAig5WGdmO3DneiV9N4jT2OfmBpENwmNIOuY4FenPKtQIrVzDn4VseGJNGcWGAtfv+P33RhXo9pRpJ4odyz7DFdZsC/zEl024S5o4AEACyvnp6v7pycoW0R369CdpZLfYDDbUQOypnvOiPe41uYDHYpNjKgU/gY2NJ0dBzxPPkfu8HV8eo7MY9RVygjmaQNQyQ6J2a5WvIvGvhwOAsJvB1UrFCBnMNb4pNfWVWJ/Qk3+fsE+gVoxdIGgaHEeBPGMp0MejdCHykZUDCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78pfezx16sWB3zQSCVJQOjWAN1FiAutGi4kNy8HGDWQ=;
 b=rdVmvNJwsVFK/7D+AzVwI7JL9S11aotM0LkgZvuM70VDiGP5AjwUb445/lnqk045SsHF9ti2H8MSZzmkamk+UDXtVaTOtrc7wiDx9sWcrjsKAknouhtodixsV8fSpVdt0yMdAOy74tSNcFMBnfI6d5FCmmxwq0EUMRIe25uPxlc+/1RqO9/5Bhkj63eZckFaqa68WYpetTZVAgjntpBBj53h85jbRKJxyQ7t6e5248L2XbX4nZlhzbdJKIrHhCVT7CcK5tVGU3+KQaPF0VMTQdUytZ+SYG/ZLLOw7C5vNf+KGaiqaesd9RsjIaUjaeU84RPxa4vOExvab2jB9YFj3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78pfezx16sWB3zQSCVJQOjWAN1FiAutGi4kNy8HGDWQ=;
 b=ZezUEhrEBWoRyfPlltW/Ss5pemhDzpvZpeWvxK/JmXC1A09nAtr6mDlowMP3dlFaJoOx5TypP/b9eFzv5Pl0WG8rQW0/YXCKC2MYu5PglCZtuWg1VFVmFI+wej3EPYfGLA2gIM6dsxJc5OUMO0hyFIc9gRas1iidRvSd4Azi2uKy/Mke8T+vmLlOXNJe5m24BxQ7SHIWCJJN1js8v4SAoZfTOg3GdcH0fpoj8JFe8CMwjRiWgCFbwx6lxXI+yjaYbBirVgZL+jxs0AIv8a9MPSynADHjXiANHhGGt7aE0EifGcudMOzX7i1SR7mhMrPiaQYMTFEsVmdyrAP4zK/Amg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6c80a929-8139-4461-b11c-e6ac67c3d2e4@epam.com>
Date: Thu, 28 Aug 2025 13:59:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook
 <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
 <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
 <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
 <a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com> <87v7m93bo0.fsf@epam.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <87v7m93bo0.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0447.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::13) To PA4PR03MB7136.eurprd03.prod.outlook.com
 (2603:10a6:102:ea::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR03MB7136:EE_|PA4PR03MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 314fbca5-b58a-4d23-df95-08dde62a4a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkdWeDJUcUkwMTJ0U3l6cU13VFUxcmxzNzJobGNJTnUxcnAzUDRLbE9ydGZt?=
 =?utf-8?B?azdwT2xoOFBOTitCNnpEK2xCNjVHdnRERStoN0txVXlaZWx0MFRjc1EzVktL?=
 =?utf-8?B?Vno4WlFyb0gxbDA0OFQrNGxZOGpqWEROTFdaQUdsbHl4dExsc0FobG82ZDk5?=
 =?utf-8?B?OTlUdktGc3dHSVdMMXhaOXZnVzVGalZKcmpjYmlIMi9MeG84bnBZNzZjSlJm?=
 =?utf-8?B?Q0NDQnNxeUwrQlFUcVhQb1N1VHpUOVpQajBOWGlIVE9pU2VPUTlnZEtYT0tw?=
 =?utf-8?B?MlVTOFRBVER0UnRzZU9nd0oxSGZKQmlqZEJLYjZpVVp4MWVnVFE3VVlQcTJB?=
 =?utf-8?B?c0V0UGd4NzdFdVpVLzJLMk9hWjM3TXNQL2p3SXBhTEFXcjlmcmdScHU0NFRL?=
 =?utf-8?B?Y2hwSktaSjZRbVZQVGpZRE91b0gzUzhpUE5XaXdGbmpKUWRzVzQ4a1lQQysw?=
 =?utf-8?B?RUJOTzVsNHFvdC9YUWZtZlNPa2c1WEtXeE1mRGFMdDNPaHp3ZjJBdEdMMmwy?=
 =?utf-8?B?WjM5V0YrdGg0aURGNzZ5SzVmVzMyUmhFdkk5RjBXVHBBclBNdzUrdkVjWlpY?=
 =?utf-8?B?UXBudENaWk1IWmpOTHd4N0lZb0hjZFIvbkhkeHZVWWhoSkdWSGE4RFNIUXYy?=
 =?utf-8?B?N2xPYnhKdk4wNjRETFlCWmwzM0pGSkVaeWYvN3dQNWJUTVNsZmxHcVVOTmg4?=
 =?utf-8?B?TytpTG9ITlNRNTlmMm5GRjg0M2xkZmh4SG9uZVBjcFhxbml1MXpTeFdydzNZ?=
 =?utf-8?B?YldaV2ZNNG96Tlp4SU92QjdwQzd4K0lRMkovTzBvUGw5dVhzdGJsSmtxd0FB?=
 =?utf-8?B?dEZMeWZHY2JrZmh6VlNZZ0c1dmlNelFtYkpTbUs0RHFLRTZseWFoOHpDZDFj?=
 =?utf-8?B?L2tGMEFMelh4ZWloS01rRTdzRTdzZzVkbjdwcXdheG81MjlvZ00zakpkNkt6?=
 =?utf-8?B?S0RqbklzMm5FKzlrSndITGltYjA5enFwTGV6V3RuN1JZbXVLYlE3VFRuY2xu?=
 =?utf-8?B?cWp4RlIvQXFtdlpudGNQbWd1WWdCYS9TSnVkazZ6RlVYUXprK2xqMUNXNTNI?=
 =?utf-8?B?V0NaeHNnK1hjckQ5NE1sZkV6OWdYSlhZRDVpbFZGZFNZQ0RTeDRGQXdEN3dK?=
 =?utf-8?B?VnZFWGtWOFlsOFFnN0VpbkVlN0NTSlVsS2hKcWZKWGZjNWN2RHlDOFRiZk5h?=
 =?utf-8?B?M0tETjhWUDUxb3lxcnNzQldMR1NRZXh1ajJjcm5QV3k1Z0ZXY2VNcGFzNVdl?=
 =?utf-8?B?TVB4c012ck5IcThPblNtbkJKM3dGZjhDRWZycm9DNXpmc0VjdlNZMDRTSWpT?=
 =?utf-8?B?VHYvWDJieG00RzZDNWdycFNydE5NZFZDN0VPZlplWHJNVUVzbGRtNWxiNFB4?=
 =?utf-8?B?cFFtUkhjbUEyZ1l6ZDhycVF1dFRvNmJXenMyeTk3MlNFSk9kWHZyaUM3Vy9N?=
 =?utf-8?B?b3E5RmwyU05oQnNmeklHZVVLbzhSMjFJVFZGZ243bWdFQzRXSDlpdjJ2S3ZH?=
 =?utf-8?B?Vzd4VTlHUk5uTk1ya1dvcFV2UHRjNlhxSGN0V0s0SGR3UlhxUFZDSVVGMU9X?=
 =?utf-8?B?RDl2emkwSXg0SHpVUy9JYlhoWGpIUDVVelByTFA0NWs1SjN4R1hiR0FIN1ZM?=
 =?utf-8?B?UzlrMm9YNGowbnJjNTIxRzlFK2lrTHpTN1cxWU5kSm9QU1NjNG9xK01GK25D?=
 =?utf-8?B?cCtzZ0ZSd1owL1JFTVhkcU1mczdDUVhyU2huS1hkMlFGbFFZL3p1RytkaVE2?=
 =?utf-8?B?OGFpbGY5dlNkaU8ydUhLQVRIcGp5c1Q1TzBjbm4zT1hnS0k3NjhTc0Jab2Rl?=
 =?utf-8?B?QjlCVlNYSkxMTDcvY1RYZTlia241bGZKU1QreFB6TjNkV0haZ1NmSXl4UExY?=
 =?utf-8?B?VmVyT0hFZFJwUytZS0RDOUxWa1lmOVJmY2tHVGlDNWkyM29remJVVE9mMVpD?=
 =?utf-8?Q?DNhgHH6G++k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEFrMGRXYjNrVWJpUHpJVWh3S21aMXdBNUNPTmRrQUphbHpYa0prTUtIbTcx?=
 =?utf-8?B?N3k5bFhvUER2em1LUis0OFF4MGd0SUUyTkJLeEdHVDY5cUhhMVBLY05aWklY?=
 =?utf-8?B?OXNEVDYvRGErT200dHAzWVc0SEN0MWVJRmp2WTNsUGpFRVZzSE9WNzAwYzQz?=
 =?utf-8?B?Um1oS0srdHljZG02WDFiUnVDR09TN3cyUnlnWm5aY3NNcFdtYitiVXdUWDNv?=
 =?utf-8?B?WlE1TWs1Vk9wSkkrSzhJQk1WcjJUVVVFUVErNDZ6RHpRMjJrUnVJWEFsZE5L?=
 =?utf-8?B?R1VEQ2NUaHhyY0dVZS9Db1MvbE9tSUZQM2V5MUVLTDYzdS8zM0R6MnQ4MG8x?=
 =?utf-8?B?OUpTMzB1ekdoZXpwZlFMRDY0U1V2UU1YNWN4WHlMWDVtQlVqSHp2VTREeFZE?=
 =?utf-8?B?VEJockd3MkJ5bGVQYkF0SU1JNE1hWkMvTWtaK2JJZVJ0SGpTcDJiRi9ZNnpr?=
 =?utf-8?B?Y3VrRnkxQ3FacmVUT3l5NHp6eEErMlI3SUVGYjZjODF6QmhNa1RaSlBlVllo?=
 =?utf-8?B?UmdaWTJIRFRwSG5GRjh4U1R5S3Y4NnBNU2UvV3RKZjZsMUNpcTNQZitmOVVl?=
 =?utf-8?B?ZmUrZzBySXB1Zi9LMjlBRks0Zm0vOFpyZEhmV1lZeC9ST2xVNWx2QXhCSWww?=
 =?utf-8?B?MSs2VytJdkhFcHJZV09OZEx0OUVQZjFlbnluSTJ6N3V4Tkxra05IY1FWbzg5?=
 =?utf-8?B?ck5OTmNaYmlWSjkvNEVTSndIeG5lSDRhSXEyZmxXK2lkNGExYS9YL2pRa2VR?=
 =?utf-8?B?WmdwRk9LZ1Y4MjFxbWVueG5SVGlCbzBEbWd4UEtkVFFXRUhYRlA0bFBhZmFN?=
 =?utf-8?B?REpWQTh0S1V4WC91WnFiWFVSR0w1bG9DZHhkSngxWHExTEVPM21lR3B1Wkw1?=
 =?utf-8?B?UkFWaGkvVEk5VlNKUGJLQVF1R2sxakU2azN5SkJhd2lyS1EwNlhsRlFnM2xz?=
 =?utf-8?B?RmErdnZSY3EwZ21ldDdVZk1ad0RHbFphTW40NHFoS01ob0J2Q0JodjZTRG93?=
 =?utf-8?B?ZFlZU29qL2FLd2Z0ZlpRQS8vNEJmL1pZZnpPV1VoeUF3d0k0THI5UDVsNjlU?=
 =?utf-8?B?UDBHQldFVEZiRXhMVFk2ZUdIRkZUTStiQnBHU0ZNS2NvS0lIMmRTaFNMREND?=
 =?utf-8?B?QUxrMDkrYkJlMEVrRkUzNEQ3M0RlZFRCdmtvUk9qRktndGhQQkdHY3JQbDlm?=
 =?utf-8?B?QzU2QmV4dWhqNFZuUERaTmg1QmtOL2dCSURMRnVhdCt6czNON3dXdStxZ0tY?=
 =?utf-8?B?UUdvUEM3Z0U5RWxtbEpjVHRNUC8yVHcwTnRFY1A0ckdDNFNJcUNnbDJXMTVQ?=
 =?utf-8?B?Y3QxMldWdWd2ZG51dzVJUXpUQWpabldHM21JWmFqVXE2QUtvRm1SbnUrQUFC?=
 =?utf-8?B?VFd1M2FSdDR0RTNpYmFoT29MYkVqeWM0VVNKeUo1SUNjQ09wdENOdVozZEhz?=
 =?utf-8?B?TXVCOHNkZjVUTDVVK0xSK1MyKzVqMURnNTREYk1ubFVsbGpPK0RNTEpSK0s0?=
 =?utf-8?B?bTQyWFpVSUVTckg0cHlOeWdHM0psSjNEZkxHMDJwT29xZnYyOS8wZTBMeWt0?=
 =?utf-8?B?TVBGNzY0cnRzVzloVDhlNXAvOEN2djB0U053T0RtV0ZxTG9jSG5oLzZxdzZo?=
 =?utf-8?B?NkJkeExGYnpxQjFrN3JONmd2VzZOekE1Wlkxcm9JMFczcUY4ZHFCbXBtZHZG?=
 =?utf-8?B?STdZU3E0d1cvbFlQZHdaT3lsODVkckRqWXR2aEhMZXFNblI2Y0FPOHNJMzVv?=
 =?utf-8?B?U0htcjhSRUsrT05YYkRsdDJqU2xIWGZIbStiNW5aUzJTdjFEbjNibE1SVkps?=
 =?utf-8?B?aThKQ2dlSWtHWHBQTHVzalRLeWhZOVdUZjNpbi9FN0tHL1owVUZCVUVBbU9o?=
 =?utf-8?B?Y2RJZktaU0hMakgwNkJmMmw5T1BhQkY2NGhmS1MvcnJ1SlZFMzFTdytmSFMx?=
 =?utf-8?B?UUxlRSs2cHUwTVRnVWJ5c3pkKy80dENzb05SQTFEMVVoc25WQk5zVjVoZ3Zp?=
 =?utf-8?B?b0tJQ3pZbWkxTHY5djVVcDd0cGhGSTY0bUgxQitqaFN0SzJFVlBQK2VNWWor?=
 =?utf-8?B?UElNdEJEbnZJOE5CcHpTRHdtOXJZbGxZOVF3a2U3MVl6eUR3eG4wZE9NYVZQ?=
 =?utf-8?Q?ssgXHlwOCKLm/iqEnnrakc7HQ?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314fbca5-b58a-4d23-df95-08dde62a4a15
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 11:59:06.5509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYimghbCUs4B1V7Lf5Bb2itLooS01f1AWMfOVza6zYZ7vykxPnuZF+kFCA2GdUVIcVrdsrdFMZz+J3xRnO8BFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7437

Hello Julien, Volodymyr

On 8/27/25 01:28, Volodymyr Babchuk wrote:
> 
> Hi Milan,
> 
> Milan Djokic <milan_djokic@epam.com> writes:
> 
>> Hello Julien,
>>
>> On 8/13/25 14:11, Julien Grall wrote:
>>> On 13/08/2025 11:04, Milan Djokic wrote:
>>>> Hello Julien,
>>> Hi Milan,
>>>
>>>>
>>>> We have prepared a design document and it will be part of the updated
>>>> patch series (added in docs/design). I'll also extend cover letter with
>>>> details on implementation structure to make review easier.
>>> I would suggest to just iterate on the design document for now.
>>>
>>>> Following is the design document content which will be provided in
>>>> updated patch series:
>>>>
>>>> Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
>>>> ==========================================================
>>>>
>>>> Author: Milan Djokic <milan_djokic@epam.com>
>>>> Date:   2025-08-07
>>>> Status: Draft
>>>>
>>>> Introduction
>>>> ------------
>>>>
>>>> The SMMUv3 supports two stages of translation. Each stage of translation
>>>> can be independently enabled. An incoming address is logically
>>>> translated from VA to IPA in stage 1, then the IPA is input to stage 2
>>>> which translates the IPA to the output PA. Stage 1 translation support
>>>> is required to provide isolation between different devices within the OS.
>>>>
>>>> Xen already supports Stage 2 translation but there is no support for
>>>> Stage 1 translation. This design proposal outlines the introduction of
>>>> Stage-1 SMMUv3 support in Xen for ARM guests.
>>>>
>>>> Motivation
>>>> ----------
>>>>
>>>> ARM systems utilizing SMMUv3 require Stage-1 address translation to
>>>> ensure correct and secure DMA behavior inside guests.
>>> Can you clarify what you mean by "correct"? DMA would still work
>>> without
>>> stage-1.
>>
>> Correct in terms of working with guest managed I/O space. I'll
>> rephrase this statement, it seems ambiguous.
>>
>>>>
>>>> This feature enables:
>>>> - Stage-1 translation in guest domain
>>>> - Safe device passthrough under secure memory translation
>>>>
>>>> Design Overview
>>>> ---------------
>>>>
>>>> These changes provide emulated SMMUv3 support:
>>>>
>>>> - SMMUv3 Stage-1 Translation: stage-1 and nested translation support in
>>>>      SMMUv3 driver
>>>> - vIOMMU Abstraction: virtual IOMMU framework for guest Stage-1 handling
>>> So what are you planning to expose to a guest? Is it one vIOMMU per
>>> pIOMMU? Or a single one?
>>
>> Single vIOMMU model is used in this design.
>>
>>> Have you considered the pros/cons for both?
>>>> - Register/Command Emulation: SMMUv3 register emulation and command
>>>>      queue handling
>>>
>>
>> That's a point for consideration.
>> single vIOMMU prevails in terms of less complex implementation and a
>> simple guest iommmu model - single vIOMMU node, one interrupt path,
>> event queue, single set of trap handlers for emulation, etc.
>> Cons for a single vIOMMU model could be less accurate hw
>> representation and a potential bottleneck with one emulated queue and
>> interrupt path.
>> On the other hand, vIOMMU per pIOMMU provides more accurate hw
>> modeling and offers better scalability in case of many IOMMUs in the
>> system, but this comes with more complex emulation logic and device
>> tree, also handling multiple vIOMMUs on guest side.
>> IMO, single vIOMMU model seems like a better option mostly because
>> it's less complex, easier to maintain and debug. Of course, this
>> decision can and should be discussed.
>>
> 
> Well, I am not sure that this is possible, because of StreamID
> allocation. The biggest offender is of course PCI, as each Root PCI
> bridge will require own SMMU instance with own StreamID space. But even
> without PCI you'll need some mechanism to map vStremID to
> <pSMMU, pStreamID>, because there will be overlaps in SID space.
> 
> 
> Actually, PCI/vPCI with vSMMU is its own can of worms...
> 
>>> For each pSMMU, we have a single command queue that will receive command
>>> from all the guests. How do you plan to prevent a guest hogging the
>>> command queue?
>>> In addition to that, AFAIU, the size of the virtual command queue is
>>> fixed by the guest rather than Xen. If a guest is filling up the queue
>>> with commands before notifying Xen, how do you plan to ensure we don't
>>> spend too much time in Xen (which is not preemptible)?
>>>
>>
>> We'll have to do a detailed analysis on these scenarios, they are not
>> covered by the design (as well as some others which is clear after
>> your comments). I'll come back with an updated design.
> 
> I think that can be handled akin to hypercall continuation, which is
> used in similar places, like P2M code
> 
> [...]
> 

I have updated vIOMMU design document with additional security topics 
covered and performance impact results. Also added some additional 
explanations for vIOMMU components following your comments.
Updated document content:

===============================================
Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
===============================================

:Author:     Milan Djokic <milan_djokic@epam.com>
:Date:       2025-08-07
:Status:     Draft

Introduction
========

The SMMUv3 supports two stages of translation. Each stage of translation 
can be
independently enabled. An incoming address is logically translated from 
VA to
IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
the output PA. Stage 1 translation support is required to provide 
isolation between different
devices within OS. XEN already supports Stage 2 translation but there is no
support for Stage 1 translation.
This design proposal outlines the introduction of Stage-1 SMMUv3 support 
in Xen for ARM guests.

Motivation
==========

ARM systems utilizing SMMUv3 require stage-1 address translation to 
ensure secure DMA and guest managed I/O memory mappings.
This feature enables:

- Stage-1 translation in guest domain
- Safe device passthrough under secure memory translation

Design Overview
===============

These changes provide emulated SMMUv3 support:

- **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support 
in SMMUv3 driver.
- **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1 
handling.
- **Register/Command Emulation**: SMMUv3 register emulation and command 
queue handling.
- **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to 
device trees for dom0 and dom0less scenarios.
- **Runtime Configuration**: Introduces a `viommu` boot parameter for 
dynamic enablement.

vIOMMU is exposed to guest as a single device with predefined 
capabilities and commands supported. Single vIOMMU model abstracts the 
details of an actual IOMMU hardware, simplifying usage from the guest 
point of view. Guest OS handles only a single IOMMU, even if multiple 
IOMMU units are available on the host system.

Security Considerations
=======================

**viommu security benefits:**

- Stage-1 translation ensures guest devices cannot perform unauthorized DMA.
- Emulated IOMMU removes guest dependency on IOMMU hardware while 
maintaining domains isolation.


1. Observation:
---------------
Support for Stage-1 translation in SMMUv3 introduces new data structures 
(`s1_cfg` alongside `s2_cfg`) and logic to write both Stage-1 and 
Stage-2 entries in the Stream Table Entry (STE), including an `abort` 
field to handle partial configuration states.

**Risk:**
Without proper handling, a partially applied Stage-1 configuration might 
leave guest DMA mappings in an inconsistent state, potentially enabling 
unauthorized access or causing cross-domain interference.

**Mitigation:** *(Handled by design)*
This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to 
STE and manages the `abort` field-only considering Stage-1 configuration 
if fully attached. This ensures incomplete or invalid guest 
configurations are safely ignored by the hypervisor.

2. Observation:
---------------
Guests can now invalidate Stage-1 caches; invalidation needs forwarding 
to SMMUv3 hardware to maintain coherence.

**Risk:**
Failing to propagate cache invalidation could allow stale mappings, 
enabling access to old mappings and possibly data leakage or misrouting.

**Mitigation:** *(Handled by design)*
This feature ensures that guest-initiated invalidations are correctly 
forwarded to the hardware, preserving IOMMU coherency.

3. Observation:
---------------
This design introduces substantial new functionality, including the 
`vIOMMU` framework, virtual SMMUv3 devices (`vsmmuv3`), command queues, 
event queues, domain management, and Device Tree modifications (e.g., 
`iommus` nodes and `libxl` integration).

**Risk:**
Large feature expansions increase the attack surface—potential for race 
conditions, unchecked command inputs, or Device Tree-based 
misconfigurations.

**Mitigation:**

- Sanity checks and error-handling improvements have been introduced in 
this feature.
- Further audits have to be performed for this feature and its 
dependencies in this area. Currently, feature is marked as *Tech 
Preview* and is self-contained, reducing the risk to unrelated components.

4. Observation:
---------------
The code includes transformations to handle nested translation versus 
standard modes and uses guest-configured command queues (e.g., 
`CMD_CFGI_STE`) and event notifications.

**Risk:**
Malicious or malformed queue commands from guests could bypass 
validation, manipulate SMMUv3 state, or cause Dom0 instability.

**Mitigation:** *(Handled by design)*
Built-in validation of command queue entries and sanitization mechanisms 
ensure only permitted configurations are applied. This is supported via 
additions in `vsmmuv3` and `cmdqueue` handling code.

5. Observation:
---------------
Device Tree modifications enable device assignment and 
configuration—guest DT fragments (e.g., `iommus`) are added via `libxl`.

**Risk:**
Erroneous or malicious Device Tree injection could result in device 
misbinding or guest access to unauthorized hardware.

**Mitigation:**

- `libxl` perform checks of guest configuration and parse only 
predefined dt fragments and nodes, reducing risc.
- The system integrator must ensure correct resource mapping in the 
guest Device Tree (DT) fragments.

6. Observation:
---------------
Introducing optional per-guest enabled features (`viommu` argument in xl 
guest config) means some guests may opt-out.

**Risk:**
Differences between guests with and without `viommu` may cause 
unexpected behavior or privilege drift.

**Mitigation:**
Verify that downgrade paths are safe and well-isolated; ensure missing 
support doesn't cause security issues. Additional audits on emulation 
paths and domains interference need to be performed in a multi-guest 
environment.

7. Observation:
---------------
Guests have the ability to issue Stage-1 IOMMU commands like cache 
invalidation, stream table entries configuration, etc. An adversarial 
guest may issue a high volume of commands in rapid succession.

**Risk**
Excessive commands requests can cause high hypervisor CPU consumption 
and disrupt scheduling, leading to degraded system responsiveness and 
potential denial-of-service scenarios.

**Mitigation**

- Xen credit scheduler limits guest vCPU execution time, securing basic 
guest rate-limiting.
- Batch multiple commands of same type to reduce overhead on the virtual 
SMMUv3 hardware emulation.
- Implement vIOMMU commands execution restart and continuation support

8. Observation:
---------------
Some guest commands issued towards vIOMMU are propagated to pIOMMU 
command queue (e.g. TLB invalidate). For each pIOMMU, only one command 
queue is
available for all domains.

**Risk**
Excessive commands requests from abusive guest can cause flooding of 
physical IOMMU command queue, leading to degraded pIOMMU responsivness 
on commands issued from other guests.

**Mitigation**

- Xen credit scheduler limits guest vCPU execution time, securing basic 
guest rate-limiting.
- Batch commands which should be propagated towards pIOMMU cmd queue and 
enable support for batch execution pause/continuation
- If possible, implement domain penalization by adding a per-domain cost 
counter for vIOMMU/pIOMMU usage.

9. Observation:
---------------
vIOMMU feature includes event queue used for forwarding IOMMU events to 
guest (e.g. translation faults, invalid stream IDs, permission errors). 
A malicious guest can misconfigure its SMMU state or intentionally 
trigger faults with high frequency.

**Risk**
Occurance of IOMMU events with high frequency can cause Xen to flood the 
event queue and disrupt scheduling with high hypervisor CPU load for 
events handling.

**Mitigation**

- Implement fail-safe state by disabling events forwarding when faults 
are occured with high frequency and not processed by guest.
- Batch multiple events of same type to reduce overhead on the virtual 
SMMUv3 hardware emulation.
- Consider disabling event queue for untrusted guests

Performance Impact
==================

With iommu stage-1 and nested translation inclusion, performance 
overhead is introduced comparing to existing, stage-2 only usage in Xen.
Once mappings are established, translations should not introduce 
significant overhead.
Emulated paths may introduce moderate overhead, primarily affecting 
device initialization and event handling.
Performance impact highly depends on target CPU capabilities. Testing is 
performed on cortex-a53 based platform.
Performance is mostly impacted by emulated vIOMMU operations, results 
shown in the following table.

+-------------------------------+---------------------------------+
| vIOMMU Operation              | Execution time in guest         |
+===============================+=================================+
| Reg read                      | median: 30μs, worst-case: 250μs |
+-------------------------------+---------------------------------+
| Reg write                     | median: 35μs, worst-case: 280μs |
+-------------------------------+---------------------------------+
| Invalidate TLB                | median: 90μs, worst-case: 1ms+  |
+-------------------------------+---------------------------------+
| Invalidate STE                | median: 450μs worst_case: 7ms+  |
+-------------------------------+---------------------------------+

With vIOMMU exposed to guest, guest OS has to initialize IOMMU device 
and configure stage-1 mappings for devices attached to it.
Following table shows initialization stages which impact stage-1 enabled 
guest boot time and compares it with stage-1 disabled guest.

"NOTE: Device probe execution time varies significantly depending on 
device complexity. virtio-gpu was selected as a test case due to its 
extensive use of dynamic DMA allocations and IOMMU mappings, making it a 
suitable candidate for benchmarking stage-1 vIOMMU behavior."

+---------------------+-----------------------+------------------------+
| Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
+=====================+=======================+========================+
| IOMMU Init          | ~25ms                 | /                      |
+---------------------+-----------------------+------------------------+
| Dev Attach / Mapping| ~220ms                | ~200ms                 |
+---------------------+-----------------------+------------------------+

For devices configured with dynamic DMA mappings, DMA allocate/map/unmap 
operations performance is also impacted on stage-1 enabled guests.
Dynamic DMA mapping operation issues emulated IOMMU functions like mmio 
write/read and TLB invalidations.
As a reference, following table shows performance results for runtime 
dma operations for virtio-gpu device.

+---------------+-------------------------+----------------------------+
| DMA Op        | Stage-1 Enabled Guest   | Stage-1 Disabled Guest     |
+===============+=========================+============================+
| dma_alloc     | median: 27μs, worst: 7ms| median: 2.5μs, worst: 360μs|
+---------------+-------------------------+----------------------------+
| dma_free      | median: 1ms, worst: 14ms| median: 2.2μs, worst: 85μs |
+---------------+-------------------------+----------------------------+
| dma_map       | median: 25μs, worst: 7ms| median: 1.5μs, worst: 336μs|
+---------------+-------------------------+----------------------------+
| dma_unmap     | median: 1ms, worst: 13ms| median: 1.3μs, worst: 65μs |
+---------------+-------------------------+----------------------------+

Testing
============

- QEMU-based ARM system tests for Stage-1 translation and nested 
virtualization.
- Actual hardware validation on platforms such as Renesas to ensure 
compatibility with real SMMUv3 implementations.
- Unit/Functional tests validating correct translations (not implemented).

Migration and Compatibility
===========================

This optional feature defaults to disabled (`viommu=""`) for backward 
compatibility.

References
==========

- Original feature implemented by Rahul Singh: 
https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/ 

- SMMUv3 architecture documentation
- Existing vIOMMU code patterns







