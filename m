Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BD77FA2DC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642171.1001466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cfc-0006QG-MI; Mon, 27 Nov 2023 14:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642171.1001466; Mon, 27 Nov 2023 14:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cfc-0006O3-Iz; Mon, 27 Nov 2023 14:33:08 +0000
Received: by outflank-mailman (input) for mailman id 642171;
 Mon, 27 Nov 2023 14:33:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7cfb-0006Nw-5g
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:33:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0157217-8d31-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:33:05 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7661.eurprd04.prod.outlook.com (2603:10a6:102:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 14:33:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 14:33:02 +0000
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
X-Inumbo-ID: e0157217-8d31-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5g0VDPX//mDGToHPYNR8tGTiAw+C34olluM1k9UuhUsEQdi7hJ9tjhiNYqOuf8wSBUFqRZ9j/LAnvmGnjt6WYK77qY08PdYegy9zoP6cYifU0WVG36HLQaEPuz4/6nSM332TOG/1mDY5z60zvx9ab/gQnDKKbPjLn1U9uitFSls3nsjPDb9hzRnuD4EBKoU+nert64fegAzPC3WPru3FbR4k1p1Cn3Z0vbszD72Y1An6ZLpBbwatE1E3GyufANhNejZWrSTMI1tB6u83Diy1q5Uoj3MOsrKIEk6yUS06YkbtvklKf8VzzcnFKcDHkHtw0HxQQONpGiMbKv60EjnoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p02tAfGH0l8t8MTNrfTEd/wNR9JTST2MQM0J1Lfs7AM=;
 b=WBTMJGrGrkE+qRndvFgeLvGO2mLkkhDF8osYwqmNU9hcewAwJ5r9npPiznli3XGYVVzDbvo1+3MCgSTLQ7BfPjdq91R4tLZFbKu9OT0ICNOiHECqz8x9DycMTRm+cQPyhI1d52TCums9xh4W1lr6ACOAo+odEIhQocGVX4JgYg16NbWLtfqNfkHyPv0CKWyHhPpOVRqtlIJn7azwGxWJteHb0IKYRu6ETKW34b6ZTOrz0u2dqO1CGk6WOgJdx0ETIXuMouV1jl8y8YHYDQuHZIllkJMCC33clhPTzvPL/iHaJoTPCqsjyna1fJuF9BJHY7MRSbCZty2G+2bKlKG6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p02tAfGH0l8t8MTNrfTEd/wNR9JTST2MQM0J1Lfs7AM=;
 b=uL/ahjoEU1FjNs4kn8IiP8j/OXQUuAY8EyrOErykw8xjXmzzx52UB3KYXMua2rd0gsjgABsZHIH6pmGUGEeTIeIRBz/Q0s6OC5QzJ70u8HfyaqhsRPnkU6eRt7JfpIlhpBHya/nWGublSao1FYH1ALiPxabC/koXIq3Q4pM4ap6/jrFzKJws7NUDcbCkjuPu1jW7iPitvdlEhxzAfoNdk/k1R4W/d/AGza9DUDmzJfBQ2t6lYEsiZtkJqV7XJ7WsLd8pW6/vmHrIrr1pfBY9DmXxkU0GGx6V0v8wc5PjqwYmGe7GQD2J60v6MxG7GX5ha2dmAxaUA0VAAId3LxvNbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3dd42724-958f-4895-ad13-b3d461c15c15@suse.com>
Date: Mon, 27 Nov 2023 15:33:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/14] xen/asm-generic: introduce generic header
 percpu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <7f10cbda3885a91e108e1a303fe74ffc21d1025c.1701093907.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <7f10cbda3885a91e108e1a303fe74ffc21d1025c.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: df7d50d7-af9e-4515-1206-08dbef55c2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SLfmLAM4w4K7quRPIRbz3ZUyXCLjBbIqz7QK3B7iXceCLRZcbGcLckdUd37YDIdoLl1ym7qy3dYdfkaAJ/TbuapXdPesPYWnDT0jL5lEVQ9U71VAqYDclM90M7kgKPb5w8+EBUTPFGbzDU4MljOFZU8oGrU8iUMnSB9JQASuWewyMsn5l2GSVh2eKAI853m6rY/GDwdY1QjWZm8Lp33mBBVRpFCvOZZnZ4mzpoFSnORKMw7tnj79Aus3DlhrgCF6wwJ8bUW5ZXCimEllNJtq08QS77hcueKwzYTX1fEA8sJcZhBAssL5HQoz2QiTx8eo/TNwUcw8mEHOUqSNT3E/zIVfJiWYm+besCWNq1Yr3alVVfTNjaROFMSCNnuZlP3YftveGm7WZQga+yrwt8tqxyLB2mvhRAakziFUiAR8OEOJv3Vau3jUequuMD+ilsDH5XdBPpcxJLtB1YiumnZSmu/MBCvUdeY8QNeVwnSx6NGMjPf+al77sBPbx5XRPanwabD25oHL4nMcB2V0e92YEEd4/vAIp3dO8PiAXftEGTMIDnFFogWWarlinZkolwc90iUTk0BVd4MznWTqKz/vB+lu1dEM2mtuqOXqOsvVUb/WlyNB387e7b3uuLm7MZTRZCxG5oPyeg1NBWK3P+6XR1wYNWfwBa7O5V3QBNHNSeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(478600001)(6512007)(38100700002)(86362001)(36756003)(31696002)(5660300002)(41300700001)(7416002)(2906002)(66946007)(4744005)(66556008)(54906003)(4326008)(316002)(6916009)(66476007)(8936002)(8676002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zzc2cFgrblo5R2dvVXdDaGd2Wk1OdnE0Rmx2VHQxbnpFVDdlQ2hvU3dObzc2?=
 =?utf-8?B?cldFcE5Bd29HL3hPMFNqdi8zbXhqWmUrSjNEOEJhTUZkZkZkK0Z5OUhQYjFN?=
 =?utf-8?B?YXU5Q0VsYzZLTUErWXQwVW5JZjhmSkZlN3RrN3l2NUpmRitCd2VuRTYrYU9L?=
 =?utf-8?B?dWVHbkVaczBrZEJFTjNIMWRBaFczbGlXR1dSbWJHY01NZjNBc1FzeFVnQWto?=
 =?utf-8?B?bnVldGRGMUJTclp0dU9xV09EN3hhU0NQYmVQMDYyL2VKeElxMUY2bHNObFo4?=
 =?utf-8?B?cnluZWd2ajFuckJZSWU1b1RmdEU4TzZtdlFZTGFWNEF2T0xDQXRlTEUvcVhr?=
 =?utf-8?B?NjlRTThOZS9QOEUwbi96SVlpWnRtd0tiaVN5ZzIxdm4vZzNpNmJnbEQ5aEYx?=
 =?utf-8?B?NTdZNzBBYlFJRHZmZzlLYWorNEcwZGpFNW5KZ0RtZElkY1ArOFV2VWZ6M2Jx?=
 =?utf-8?B?TUk3QWhqcTZkOFo3c3RzS3RJRHdVZTJtMFhWY1VrbVRKMFllVi9UdjBFUHUw?=
 =?utf-8?B?alRuUGFxUzlBMDE1ZXcvaGFzcnpSclVvbThNSnJZcEUxSEJRMVRYZ05xT2dk?=
 =?utf-8?B?aktFc2trZzNWUVBPVDNNTzJkMlNJWC9MVXEyOXE1dVYyTWM0K2Z6UnFyU3Zj?=
 =?utf-8?B?RkFhS3lFQy82eUJqNkpQV2hpekZ5bk5GTzNqazlLMUJJRXJCT01ncWo3WE5z?=
 =?utf-8?B?Z1M4SEhKTHFpdGs1WXFrZVEveWVXM2t0Q0RoZ3FNRHBEZGJieXUvaDJMTzNG?=
 =?utf-8?B?RlBreHRGTEJ5OEZrNG5YQWw3em5CYWoxSjVDWFM4RE5BWDJWdkY2cUpteHVz?=
 =?utf-8?B?ZWphcks5VHdmSUpkNHh3Y0FGS2IrVG5icmN4ZGxTYW42NklSZEZpTGw0TEZB?=
 =?utf-8?B?d2o0NmU5UitWVG9Sb016dGtOU2VaVEkzZlN4NDBZWGJpTytEVkxJb0hDUXoy?=
 =?utf-8?B?MTBtbFdHMmRlNE95bld3bUw4Rmh4ZVVUZk5UOWhqd05GQlZWdVYwWkoxUEZD?=
 =?utf-8?B?QU8xeDlOYlJObXp6aVB1WGM1WUZJOEwrWkVJSDJ2S0UrTDloWFBmZVA2MEZw?=
 =?utf-8?B?UW5yUlhEdTE0aFViZDVJNDk2VDhLVHNVWU1heTN3TVJwZ2NkSzFoQXBQcy84?=
 =?utf-8?B?KzA2Yjh6QzQyUFZyenFtZWQwSTZ5SUlVd3g3QUR6LzlTWUxtL1dRTlVuT1FU?=
 =?utf-8?B?MVh5L28rTmpjSGZPUlB5QVg5R2ZEakRYL2huSjlYVkJjOSs3VitDekU1ai9R?=
 =?utf-8?B?Y0VHc1VOVjhSV1JuWGozbktJK0JFZFMyT2ZNY0tNdHF4UzdiMTFhSDQ1ZUp5?=
 =?utf-8?B?SWRGdnF1THVkR2JqMDk2Rkhuc2g4MWIxTmtkT1c1R0Zpc2I1ODQyZE9scTZu?=
 =?utf-8?B?YUxYampITWNtZnVhc2lyUzF0YTFHVGtaRmdmdlRNNTBGTm5nOFhvNXI5M2Rk?=
 =?utf-8?B?M3NvMHM2N080a2lCRjg2dUdBOTR1M3cyeDVyRzdpcnFJemlTem9xYVdLWVo0?=
 =?utf-8?B?V1lIcXUwZHdvUUd3ejZFZVBQTTdvV1RMRGFTYUNOWGVVWHRMc0sxWlIzam5L?=
 =?utf-8?B?UmU3UTVtM1d1S3VkTzZqMmFSSnlMcjdZNTkxYXhEREREV0JjNVB3QzZiWE4y?=
 =?utf-8?B?ZWJHZlNhTHRyRWpuNnNWYThIWHYzamJTeUVHNWFNYjF1dUxtdHdLRTIrMnc3?=
 =?utf-8?B?cGpLa1lLclc3UnRKV3BCNGtWUlJMazRUTUVEcnBpWkZUSUpBWWNXZStrT3pU?=
 =?utf-8?B?RHFKbFpnWHc4aTVRL3Y2SVZiY21sMS9XcFZoRDRqNmdaMS9Kak9Zdkl6WmRB?=
 =?utf-8?B?YWxjcmFJaVIrYkVzL3RIMVM0NzBhd01nV3MzbVNxaWFEemJQb29JRG9aOTJD?=
 =?utf-8?B?ajlVbWlmS0VWMjdUbGFzQU5lSmp1QTgvbUYzQXVZWWZmWGhWdW5zcWJZc0RO?=
 =?utf-8?B?RUxHUERFZU5xN1VCMUJhQ1IvSllXbWpMUkVQNGpmNllNUXZJUGduRnIzaldO?=
 =?utf-8?B?NVAzUEgxV05TNk1PNXprdzg5UkRKWkU5T1gzS015dVpLNXpkY1dDVjl2UUh0?=
 =?utf-8?B?amNWUUU4YlRHTjBLblMrZDQxREVCbldIb0lrWTMxUFlSbS8valI4aHNBTnFS?=
 =?utf-8?Q?3NH00wsxX/04xnK5Qugj0SgJ6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7d50d7-af9e-4515-1206-08dbef55c2e4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:33:02.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xp5kz9hKfnDsZ5xybDCtNVnWYtW1UrsJRReQd7uoLHc8c0PuTXepNQIafhMklf3dBHrzSF3MRBon4+FXwzUWUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7661

On 27.11.2023 15:13, Oleksii Kurochko wrote:
> The patch introduces generic percpu.h which was based on Arm's version
> with the following changes:
>  * makes __per_cpu_data_end[] constant
>  * introduce get_per_cpu_offset() for macros this_cpu() and this_cpu_ptr()
>  * add inclustion of <asm/current.h> as get_per_cpu_offset() is located there.
> 
> Also it was changed a place where <asm/percpu.h> is included in <xen/percpu.h>
> because asm-generic version of percpu.h started to include <asm/current.h> which
> requires definition of DECLARE_PER_CPU.
> 
> As well the patch switches Arm, PPC and x86 architectures to use asm-generic
> version of percpu.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



