Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782617638B3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 16:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570499.892321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfFq-0006Gp-E0; Wed, 26 Jul 2023 14:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570499.892321; Wed, 26 Jul 2023 14:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfFq-0006EA-Ah; Wed, 26 Jul 2023 14:12:42 +0000
Received: by outflank-mailman (input) for mailman id 570499;
 Wed, 26 Jul 2023 14:12:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOfFp-0006E4-82
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 14:12:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a1906c7-2bbe-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 16:12:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8462.eurprd04.prod.outlook.com (2603:10a6:10:2cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 14:12:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:12:36 +0000
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
X-Inumbo-ID: 7a1906c7-2bbe-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFbtVzY+lOxBNKxHP9noVnCaslLnjjhyiy1LikHNUDj3cdaEc6EWjk27RgCn7dQ3DKx1mTrdKewSzmiBSfS/3OuG7TF0BlY6nTGOf65l/9sdQOk8OJ9Jvh/LhXxrUMr39MjqzUeoXNTOu9i8/9Umfd9EnKftYejtUFw1Ux0Z0AskQe771yC0cbwtIKP/R3sf1UHlbn3i6by1t54pTVakLmGLOgKrSyF2rSqVgDsiQFhX11xKHvYEw2/dtCxsyp9B+WDaQwpSitYaK1t9oCz3EI/1uWMEzVCOJpbSPwp3VVQnHsRvmXEwToB0S+EkA0+3aWlZRhDznnDLz4tjRnrhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jL04yurkGtyz156fGqsgNZlRHShJIqC5zxFWErY8//w=;
 b=BNynR19gfscgROrE7k6d3D3wajRO4T8L6v8Gez2PM7j/I6fR+/53BMvZ9XGcYwye6wGDt2JopIXPSJ4+6V5he4/6OrqNkpkj5ZD0TbuEu+76Xnn+mvVBW4ewIwnDWUF7xq7I+5qbM5mgYzbNZE6UBOjagjOseq4Zk/MW01mMqn41rf1x1FAm3SASjFlpoOEr0dQzzFsyvsKxzgqnofz3+DQmcvSoIq5Tj5jGw+s4Y0cd4O0H4jHCuWpv3jjSQNMZAA/0c2knpGsJ5Bpa5S6OVZeIDKBPiIOw2FDUVfak5Rj9lsPvRHZgLahtJtIsn3CFJIqgC7tsXvFOdcxBrcwk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jL04yurkGtyz156fGqsgNZlRHShJIqC5zxFWErY8//w=;
 b=vVMPdeXCc9yoHkNAHaiXeA/k0TPgPxRh7j5Cw3Tm4zOcnqyRSnHO4jrnPIHpU3CLMeXkwpKqVXs2w51rcihQvX/p/slWHkJI6oRfsfiJ1zmR8ZYjD715GhtJAOACZ1/auD+0RnGF2vzhTOV5SSIHklA+6fLYO4dCVYHeOM/b2eNP4tYW0sCSXZSAvDrXBHo4QozBsFrDJNEF7k3mWezGdp1QFBrVe2X7Idw19MTYVPtWV32xKmEALgP5pbsVdo8Vn0EO3w3H36Qb5FrdLlRwY8Ok6Zha/OaZ3gRDaa2vbuE2mvXmPVzd3uQAFNkVRaI3N+nmS9A44RY+0jfXVbwF6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cffbfd2-b452-42e5-cafa-8a72ac9ce33c@suse.com>
Date: Wed, 26 Jul 2023 16:12:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] vpci: add permission checks to map_range()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20230724153741.42374-1-roger.pau@citrix.com>
 <5292942c-17b4-6b7b-a1a9-fdec87418379@suse.com>
 <ZMEhhxE-ozW3eYYx@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZMEhhxE-ozW3eYYx@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 0471ace6-6850-4c1e-dcea-08db8de25cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M/wQxQwn8hwMDRNgx+oG2PizmXyPO8pJqK4fctPRaOV/hb9O2WlL4kWpMT1+1YiyHvRn23M+qED7Vg2DAhoQOWejnDUohQkAdFnuzgXGkXVHiYoD0BtyuetjkUs4LkeFlCT+tg27BollG/u0Mj1ZcnT3znolPVwU5Qug9l94VM8HPCTn0DPYwm2SZ94kPigshIUfYZpWStAjZX0HmTfe6RNlwNsRaOCPIJLyUjX4eNB2eItQnudfJWRn7Xb7S1LhQvmxe/BbuO2W7CgUEDHJgXY/M7zfm2HcpuVJIRwLcXFNiUICASionXo1/+liaB0qMuxIMaYDUXT9Xb2dQMF7u1QtMofBlzxEXgiNwRQoWIdSXhSVz5l+hTLTLf7RslxjyvcwbgQqQn3hDmJyXrQkJ9kOKUBduqQlUD6BVec9Fi52/qDYe1YDuPwC9i/WuzpktndoYWdY1+/S5gIIGpzX2np2URY8RzzH+5mzBXCGbWV/t7jHOwtEf0cMxzWJwKX8LV9HHO9GQO8evs2dITmle7krkQVxgplvRZ7l7LD/SRHxDGRBjEgNVz2XYbIBXe8RDPUQLoD66/vgL3p1+mn12G2kHClyYpkTbDZWk829J1GQ9plc3Sz1GFJXB/P/Gdu9T+K5EU38Xg0gC/4k38gfSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(6486002)(54906003)(6512007)(478600001)(66476007)(2616005)(53546011)(26005)(186003)(6506007)(2906002)(66556008)(66946007)(6916009)(4326008)(316002)(8936002)(5660300002)(8676002)(41300700001)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tkp2b0ZiT2Z6aVNibnB4djRnd0JSZkxHbldNbGt4RGcyaGtydGE5c25BaVhj?=
 =?utf-8?B?TllYZFhHeVpUWi94cndRaUNKckNTQXBjNlNhdUsrcEI1SE14UkFlRG1iWUZz?=
 =?utf-8?B?a3JlUkFVeVVaYVhYZTY5U3BQM0tWdEUwRUI0WS81elk3aDlrSlBlcjR2L2Z2?=
 =?utf-8?B?alVwQnNmSHJ4VzNoZVdaTjRQenNxdzV3VnJzTDkzd0IvWjRIRytQVTViOVh6?=
 =?utf-8?B?MDVOdHlkcGpIUjVHK1cvSkxEZ1hybVhEblRwalNjNHFvanZldFdyaEZzNi82?=
 =?utf-8?B?cTlWNzBHaGtTWjBnOVN6eXVJbGpDak5pVzB2K052aXM1a254cld1YWRia0R0?=
 =?utf-8?B?aDRwaldKdUJEcU5wWkgwbC9YcTNiUXhJUXVxbFE4eWZhYk9Ed3JMWXhFMzFS?=
 =?utf-8?B?MFBxUTY4MWQwTnRMNkJLQW90NDJhZUszeXBxcHA0ZUdncEpQWlhVeWtUTUxS?=
 =?utf-8?B?blppb2tYK3Q1SE9wbytPZUU5QjB4a0sxTDNWUEhFWUhnZHRvVG0xL0dJWkM3?=
 =?utf-8?B?S1lURTllbmlhM0FUMWVmYzdvd1JzNlNQcVBTOTFpSVFHREl3aVlUU2FLaHVY?=
 =?utf-8?B?SC9EQ09KYUN5cTEvclB4bVpPZlk4M0dOeGxvUk9oZkl5Zm5GUDRBWldrd2JO?=
 =?utf-8?B?UG0rY2JzVjJ0cnZ0M3NZekdJSGxWVGpDdEVvMXhaVmQwNTJOM0pUNytPN2Fl?=
 =?utf-8?B?RDNab0hDbHY0aVQySFU3Vnc5ZlJNdkloUm8zN1FYUlZJaFU3dnZnUVlkMGNX?=
 =?utf-8?B?S0xPbFZ5b3NYaFp3bjBFeDZDbFdlM1hUaVhqQU9NSld6bEF5S2FNano3RHdw?=
 =?utf-8?B?T2pjTUo3dFZlRXVGTGN4a3RsYUVENlArbG1BU3V0NHNlQ0xaZ0pHNGVaYS8y?=
 =?utf-8?B?RktGQW5KT3dpeG5TSjROdWNDeGIzR2ZMS2U5T0kwL3VxU2lwMm5HT0l4UGNp?=
 =?utf-8?B?VHF2ajk1M1hjejBwWEtZaGZFcWJGZUc0UFhtK2p0Zy91ZDFUZ0RRRnRab0Y3?=
 =?utf-8?B?UkVvSnc3M3lIZjdacXMvbW0xbG45TDRxVVl3SVVtYVRSNWpBa2pickJaTVYx?=
 =?utf-8?B?REc2ODBUcnpqNVo0cTNQcUJBcm1JL1dPaU96QUl4dXVrTkpXRm4yYXJZa2hW?=
 =?utf-8?B?TlpXaFFrM3JSRS9LMGlqUlVWN2RpbDdnenU4WUZ2SXlsUE9HakNVSGF2bG5q?=
 =?utf-8?B?ZFhjamg3Vml1R1VORnBCVnV4Y2V0NGpXRVY0QXVSditOSDNmRDF0dGZqT1Iz?=
 =?utf-8?B?eUJaM21kUitKdERPUlNiYit0djZPWjZKZjZoZUo5Nkk0TUJKRHBBdnVLTkhR?=
 =?utf-8?B?RHhEWENjSE8zbVprclJtazRpY3d5ejdHNHZKS0NIR2wxQTVBUlZSa0M4MFdM?=
 =?utf-8?B?bkdLbnA1SW84WkxTd1Z2MDBzUUI2YjB5eXpXc2VnbkRSaUppOVY2VjNqZ0pM?=
 =?utf-8?B?RGVGemtPVmthQXVtNlRRR0MwYVJaY3plT3pidEdzVGhESy9iZTFWWFVKRzhu?=
 =?utf-8?B?WjFWWFZPYVI3SExRK0dhWUhjZGJxeldHbUh1Ri92M1RLVjQwRUpQZzBPNnZT?=
 =?utf-8?B?OW0rL3Zsb3AzTDY5V3lQOFVxTytTSlVMV0tVR0RMMEZiQmUwRXlITTVYVmRU?=
 =?utf-8?B?UnhNeXpSTkFUV01zMXJXdHJBZjJOb3IwNEdzenJzSGRJZk8yQUswR1FQOWNx?=
 =?utf-8?B?WjlSK05IcnYvNSswQ2M3b0Z5UUR5ZkJIQ1lXLzVBZmd3NzNIS0xwT1QwdUJj?=
 =?utf-8?B?ZzNPNmJMSE9LcDlyTGQzZS9na0g1ak12ckl2ekdhRVRPQ29obFZ1RVlyeXdQ?=
 =?utf-8?B?VDNMalJVYzByVFpERGtDc0RrRE5na1pNRG1aR2lFL3ZFZE44U2Z1RmtxZlJ1?=
 =?utf-8?B?R21Ob1o5bE5aU3FnVWtzemM0eElCOFJueDUrb0dvSWF2OGNLeXNlMWZCQTk0?=
 =?utf-8?B?aFo2WVpVaXlQUHRtTDFYVDNkbjloR29oSTdxQkpKQUtiZDVQTkZPWWhmMW84?=
 =?utf-8?B?MUt5ZSs2M3VHVnZkeHY4RFNxVDFDUk5oZzhsLy8rUzBmaG1WOWVUcWNoeXB2?=
 =?utf-8?B?YVBsY3hOK2ZHeVM3UWJJM005U1BXV21ESXFjZ21rQ0JQNzhWMFY3dmo1bWts?=
 =?utf-8?Q?jgGWDhb60PUUjlooSdpygaC5S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0471ace6-6850-4c1e-dcea-08db8de25cfd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:12:36.7262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0S/oA0xjNA1IB2YT4wvlAlS64IkL8FQU0APSJn8sOwGsrqmSs7wa/XU19aRi47GufC6k4nK0ns1cNfUXxdWkGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8462

On 26.07.2023 15:37, Roger Pau Monné wrote:
> On Wed, Jul 26, 2023 at 02:36:17PM +0200, Jan Beulich wrote:
>> Another Dom0 related concern can probably be put off until we actually
>> get a report of this failing (which may be more likely because of the
>> XSM check below): The function being used as a callback passed to
>> rangeset_consume_ranges(), failure may affect just a single BAR, while
>> the incoming range may cover multiple of them in one go. Depending on
>> what functionality such a BAR covers, the device may remain usable (a
>> typical example of what I'm thinking of is a multi-function device
>> having serial and/or parallel port on it, which are fine to be driven
>> via I/O ports even if driving via MMIO is possible [and would likely
>> be more efficient]). Of course, to allow some MMIO bars to be used
>> while prohibiting use of some others, further trickery may be needed.
>> But not exposing the device to Dom0 at all doesn't seem very nice in
>> such a case.
> 
> Hm, I see.  For dom0 we might want to consider ignoring mapping
> failures, the problem is that we would need to narrow down the pages
> not allowed to be mapped, as part of the range passed to map_range()
> might be allowed.  We would need to resort to checking permissions on
> a page by page basis, which is not overly nice.

Right, all of which is why I prefixed the while paragraph with "can
probably be put off until ...".

> I think it's more likely for such BARs to be marked as read-only
> (instead of denying access), in which case the checking here would
> still be OK.

Maybe, but (a) granting r/o access may still be beyond what an XSM
policy intends and (b) might be a problem when reads have side
effects.

Jan

