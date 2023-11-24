Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EDF7F74CC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640690.999283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6W6o-0006C7-3A; Fri, 24 Nov 2023 13:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640690.999283; Fri, 24 Nov 2023 13:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6W6o-00069M-09; Fri, 24 Nov 2023 13:20:38 +0000
Received: by outflank-mailman (input) for mailman id 640690;
 Fri, 24 Nov 2023 13:20:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6W6m-00068x-IQ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:20:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fcbdc20-8acc-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 14:20:34 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9551.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.12; Fri, 24 Nov
 2023 13:20:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 13:20:27 +0000
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
X-Inumbo-ID: 3fcbdc20-8acc-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EP58U5NFLtvW42PPt4XINv65Fyr/QQRch/UEHE9mn73KYqnkE5vMRcUCMIqlbltFoJI0nsHKgTWQSg3Adh/E4CK/ZQJA9oFWvUXPI5CBv6o92CAGzyTEp20jD2dRc/oDJgEkYQzVd/5atM00r07qwjXSTcJ+C+KgECPHmS/HsCEaTr/E5+q1WPZ/bE6+YB9TkV5vQHv3h9aONET9TlES77s7TE0ufKBcVlvFacAcBsLSEp08VUCf20RfelZENBseRm4zvqFJENPZGR/9IS41RX4Hsu4vs9QgXXNtZcLGdo/4oWQZtMtI4fYuBHsbsM8yorF7vaQxhBtQTjGWL993TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JV8Z1zlnoBVL7BM4RYnFRmehf5mczkb7dpsS8sXs3hk=;
 b=fdI6JdFdemOvaUBLZmOwPyaOmbtD3Ch0GecrUfPrVKSIsxfJbJ8OqB3q0j4WyURXmgqUpfdcNoXESwwn/QEpDmIMt1f1NZx1PQ7kSQiVw/ksxZBumXjPB4Q3ZQcuzLZpvlEpIDbNHA4dsXp+tXe7Bh9cqMeY8NP6Ee9Cy05scigpK3ESBSWuj6atsZb6+lj6AKqCU6eKIltIlBSqfrOdyYkG8jVAe94FMfX4TeJ8MToXqSZbX+rdtAFvVo5CvFpeXXtASvmqNBJBHE+IzKZ5b/LqvDJ80NOQoQnI4UaULHVPk224qoWsX2sSE0rWBP9jLGLBVOsay+QroKQFQ7C43A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JV8Z1zlnoBVL7BM4RYnFRmehf5mczkb7dpsS8sXs3hk=;
 b=nZxzEoq2A3Re3vkhAfB13Duz6DBjoP6EzdHcOmLcnc9p8cMKGjqLbgOes/cD4w/v67rt3LzklkDcH6GsraV4QS7u1Y8oHKAy8Rfca4UAmRnzofRdcl5nMNva6iN71zpbh6l/Qn80NQhweHPCb3wL1WWAQYSiQKH7HpOrIHn1CFIy4DPh4iunbRgdUHXLQZ2hJeHHALG0PG1VmsMR+9Rx4e6mRUym0Dduuzva6xhIVo9tIRrEdCpWqqCcSs+cNmQZ9ZaDYUROTHHnUDsOKwZtbZKFUkriTTMhPDGDJJjU34VtWMQIkhAsAGUPLqOAx24QBEjDbWSGz14i6OAhw0mbiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a43afbc4-5c3d-4626-9aab-8cee09ec94ae@suse.com>
Date: Fri, 24 Nov 2023 14:20:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <7ae3b2dbdb8e711b2462af511e1f64c2700113d7.1700221559.git.oleksii.kurochko@gmail.com>
 <c728ba04-8cbd-45d5-af2c-eefcdf3f7afd@amd.com>
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
In-Reply-To: <c728ba04-8cbd-45d5-af2c-eefcdf3f7afd@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: be91bb11-35df-44ea-b5a3-08dbecf01fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q8Nmj3UJaXgS9jpU5N9A+xi+MGX28ykhLNiE8vBnQPEZ2XLcPD9x8nIPTz5b7GTZyZOJAmPqpgJ13m8ZwTqm3HwHyJdcbapyM+4oRKYQx9qBzxjGano57xlp0rcg8zwOhQ9DkAW5YvplEdQpNKCobt/mlZNyyg4vm99UAEdvtH32zAMJy2MQeRfl8btHaVL1axBwYYXrAZySI8sVnCsbHDI6LzHrkUY+GuWo2vsAJ+xIKRKL8SQCgaMOg35l0ChALCfDsNSpg5Nm+ZBw04TO8sVtmNSA264dwi+h63R+Mt33MzCqnPmszeHBD68vMyeJlrRJnLt6dbpPgUwEK/p7ipU+NzBmCz1g0ItPPOZ74CsIy83Ve7p9jJ5w0sNbT1w3nBhJSL5aky4MUrI/iL8Q4Ez2clGMYT/ZXNY3MDnoCKo/0k5pWBsHYUZR2pHr6nBl9li5J8Z0vJXAJM1mIcEKHJbeYpOSzvyJ2dVltH//cR+oxCx3iFJExK0V3Dfjlf5MX31vZutifTINEzrF3Nm/YED54+NP0TGR0rebQuJcR9Ll6cMePsGpYk/IHssHWiaDBYHy2k8Z1dYTv18L4vkpZMP73Jbynij2+bT70uP5v75Eku990WnHqtaRx9CfSspdn7daJyfodoQOdLdmzNm0HC6o0yvS+9eiyigyCwjzIoE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4326008)(66556008)(66476007)(66946007)(8676002)(8936002)(110136005)(54906003)(53546011)(316002)(6506007)(2616005)(6512007)(478600001)(6486002)(2906002)(36756003)(41300700001)(31696002)(4744005)(7416002)(5660300002)(86362001)(38100700002)(31686004)(26005)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3JIVWlIcXlHL1ZKSUE1WHNGRllHYWQvQVhDRzA4TnlNVXpMOFF2ZEFmeGJW?=
 =?utf-8?B?VzFlUGFPQXRacDhxQm0xdjM0TVhHR3grR3RaZGRITjRncDRXMGFhVHkrYXRN?=
 =?utf-8?B?WTdLWnhsdHgrUTZXa1llbi9Db3NuakZqb0VHaVZycXQ4WTY0bDkzakhsS3lM?=
 =?utf-8?B?djFuRWNiUnR4WTA4MG9HTTVWU0hNanJwQ0ljVXcrOUhUZWt4OHgzbnpVajUy?=
 =?utf-8?B?RWMzN1RPeEtqejVhNFZscERFZUpLQkIyeVducStJN1ZDcFR3aWFabDhHMk8v?=
 =?utf-8?B?aklMVTlBTjR3cHRGSHFIMHNMM0g2Ri9IL3UyZy82eU8wQVcwVzdUNCtubjhk?=
 =?utf-8?B?WXJsNVhqdk1ydmpSWWQxK3pscWFMSVgxSEJyUEJsaGtVT1cxMGkwRjE5YWZT?=
 =?utf-8?B?Y0RGM3UxYVBXQlhPQ3czSFpHY09kNnNpUy82UHdjelRySmpIdTFhbmpxeEdC?=
 =?utf-8?B?TjY0V1BIZXJMY3pnRWo4Y3JocjRKKzFEODl6UTV6MmV2Y1RrYlNJeE5sUS9n?=
 =?utf-8?B?dExyTEtsWm5Qc3pRR2VNamlOb0RYeFFvSDRsU01tZ3pnMHJ5TFl2UDNYNjNJ?=
 =?utf-8?B?UDcyM2xDcEozMXR2cHFCSXJ1dG9BZW9xYnB2MStZSHpRTFlFeTNPZkJOVmJU?=
 =?utf-8?B?NGtVcmtkTndYZXhRZHFQRHc5NXh0OHFsbzlCQWRoUFV3VmlFb0d1WnNtVis2?=
 =?utf-8?B?MmkrMmlYNXluV056a3ovQ2JVRGRWdjV0djMrS0pwa3NlWksvMSt4SEFDcWt3?=
 =?utf-8?B?cXJLVUJBV1FkaFdHSXBJOHpFQU0wakJCV3lmb2ZCMlpCUkF6aU5BZVhHcE5Z?=
 =?utf-8?B?aVE3bTI5R1dCQTFPaGN3MmRjQWhNMW5VOXk1ZEpxZU1nc3czMnFhM01DZGRv?=
 =?utf-8?B?L0dObWFZaWNXb3BzQnpVZ2U1UkNKTlM2TmhTVURSSXl1ZXdDbWszOWZKR0lL?=
 =?utf-8?B?NHkwbWN6cDBqQjlkWFJLbEE0N080ZEVtOTJLWnFkTUFidm5ZTkxUY3c2N2c2?=
 =?utf-8?B?UFYwNEdESUdBNkZwOHBQeWlVV25qd1dCODh6ZTlqaTl4S2w2d21USnlDNGdv?=
 =?utf-8?B?L3hyNnpDQTMxSS9qMzlpV1UzWmgxb1hCeDgwcFd1Qzg2RDdDZ1hTODFOTnhK?=
 =?utf-8?B?aUhjaEwwMExVWUU5cTYyaEJhc3QyNlNKWUtHdHFJMEluVkE1M2VoMUVMUzJi?=
 =?utf-8?B?NnFKZjNzei9MbnlhSTJCN1FUNDU3YW03V28xMkZLbGxFQWM2dU1Id3R4cXd5?=
 =?utf-8?B?eWN3WGV3eGh2b2k2eEhRS1U5QVhSYVR0TURJZE1ROWFvNEJnS1h1UVpOSTIy?=
 =?utf-8?B?TGpGK1U5alhISVJKeU9RWnRtZ1FsNmlTaGJTYzRFQUZOZmE0YjZsOVVuRGNW?=
 =?utf-8?B?SHJKTGtGeWtDdmx0a2xYdFA5YUk1L0tnMUpvaENRdkQvQmYzWUhpd1JpQ25N?=
 =?utf-8?B?RWNNKy9nak02Sm4zMVQ2dkwwQU41QnNHclg2ZFpnYjFwS3h3SlBKTnIzTysw?=
 =?utf-8?B?cWl6ZzZlcU51R2l1R3hMcS9vcWdtZThLOG5kSFV4eE5mRkV0QTlIaXlyQkZP?=
 =?utf-8?B?aFlBVGNKUnVCNk9XTng4QjVYSFpUTjFEaEhyUEI3QURNbzdXRVpCZTZpS293?=
 =?utf-8?B?T3FOUVdyWkRSc1RMdy9oZkVTVjBXZXhHZktPWStZODM1OTZMV09hcW9hM3V0?=
 =?utf-8?B?OU8rR1lKWXl6a0ZMbUtrZTdKKzVZL2xtN2xpekM0OXYzNVllNkg3amNQYklQ?=
 =?utf-8?B?TjBqWU5MQ1lublpoR3c0bEVwRUVGMUFOb3N1NmozS0hjQkRnSzRRWHU2YnRu?=
 =?utf-8?B?UlIrc0VEQVUvbUM1cGowdU1HRjlZK0Y5cGpLSVRVaHRYYUF0SzZZN1ZUaCs4?=
 =?utf-8?B?b3dkdGhKTENXYWpNVU9KeU1UZTVGR0JVUlcrYit0MitUYlhHR0F2VkJXaXZn?=
 =?utf-8?B?d1NGTU1OYzVpS0V1enZOZ0l6ZjJnSUVqaEVRa0cyeWRhSTNZV3MwRndiMGJj?=
 =?utf-8?B?TUIxMW83SlVHdlkyQWVTVlVBS2hsekJ3NldMelp0WENnR3JRckNacGJNa3kw?=
 =?utf-8?B?UTRLajZEaFQrZWRIcmM0QlZpSWlwc0xMUmwvOVBuMGp1S0ZRMzhNVzg4aytm?=
 =?utf-8?Q?ipM0Djvmom2QpNBH+D78Fg8Nh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be91bb11-35df-44ea-b5a3-08dbecf01fad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 13:20:27.2024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXupU4+UaNeZ75bmeWtDgpDUAvWc7zV3BR/UWiavAVkRWB6UsQBDLh5qgOfR/ncnNaJvmlOCxAxYjQkqiACkOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9551

On 24.11.2023 14:03, Michal Orzel wrote:
> On 17/11/2023 13:24, Oleksii Kurochko wrote:
>> --- a/xen/arch/arm/include/asm/numa.h
>> +++ b/xen/include/asm-generic/numa.h
>> @@ -1,9 +1,11 @@
>> -#ifndef __ARCH_ARM_NUMA_H
>> -#define __ARCH_ARM_NUMA_H
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ARCH_GENERIC_NUMA_H
>> +#define __ARCH_GENERIC_NUMA_H
> ASM_GENERIC ?
> 
>>
>> -#include <xen/mm.h>
>> +#include <xen/mm-frame.h>
> If this is for mfn_t, shouldn't this inclusion be moved under #ifndef ?

I agree, it better would be.

Jan

