Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6CB635802
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 10:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447478.703733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmNV-00036v-6B; Wed, 23 Nov 2022 09:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447478.703733; Wed, 23 Nov 2022 09:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmNV-000359-3N; Wed, 23 Nov 2022 09:49:13 +0000
Received: by outflank-mailman (input) for mailman id 447478;
 Wed, 23 Nov 2022 09:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BfOp=3X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oxmNU-000353-12
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 09:49:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130043.outbound.protection.outlook.com [40.107.13.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14510261-6b14-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 10:49:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 09:48:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 09:48:40 +0000
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
X-Inumbo-ID: 14510261-6b14-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEKlvSeNiuDLfEhIIKgwYaTrV0AjDn2/n0pn9dSGyhhslxBVvyRLRYLtZSpdlbr98uQevJCL13KgZsijJfW1bk4Olmm6OzNf/ZE+aO9xINRAt+vPvN2Jyea833Wnb3k9z85xlgaEAJ0fY1IJz3tvh1QtY672aoAmg1oYnt5RWfwcGymCr9C0MDJYRUFpYdsJFatvmcOoHB2+NRod6UZCgeUlzX5g4XHJjQsULg+1QKeHZIhLMZOqEP+9/6PAONAQneJgwflTWeQLmjBWkLJXL+oVoQv9qSTET7pDVSCyaQicTfuxc0fQRzqkxkC6C9kybU0eUNJvJcnzKLZ24M52QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNau7kEw/1JZlPoPq7/ahtZEnJsjIHP0Aq2EgbodHO4=;
 b=Y7CvWcMs0rGSsS9Lm9mBiCaFbHlNeT85tulnxSmHEgG0SQzgQrxYAOHWF2peJZOXGd3caMNpl+Nnuf+zZOJV5jossKF7aXJ5cnusECdXlVC7xRjJbMVT2OpWvJsUZdceG9QgWShK+lV8COLt3kdmT3OW8bY05phZCIwDBpCPwZYmZNnwCMK/jO45wEYOT7TwUe69DJiQKNyvN/CdPYjOjc4UG7+mzBzL7CinMPnVVSMFjzOIenZhoTNMbDZRy0JF1Q3ZjPi8GkZ5NTWtFZUAv05k1Tg/qTogbCOWzCmRBL67Ko3NN8cGOhPg8CVlPatUMg3LVpraX3PSpixSb9ywDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNau7kEw/1JZlPoPq7/ahtZEnJsjIHP0Aq2EgbodHO4=;
 b=tUicRpuBUMZPjlxsX+uuI0HhvyTxrYbbE9j673sqq1tI7MZ4dH4o7RJVAmOnYFFkMzLdVmZPBtHY+jqABUvEadG7uziSrGt9Q4osQfYMs3dHJfskOJsVlxcBs2kjcHAclH+vLahrI2tK5W/Lc3RVYRi1yIqesJbleXCJ0OAciVAEsXVlYoUX0auWRlfpZtTV1Ylms1aEbnFeu/QDBhFw/xdFEr1GduV7AEyhdR9pOffhfnL2jBjwvxj6+MJ3WVC/5k7311f53GAgLiroScHf5ds1EOi5hcGJNLpbssGF4gKwizBD+vCPvq4PrO5c82BbJNJ3H/gJRPAD6zLuWbpUGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d26e256-d5d3-2cc2-9cfd-c5cc6fd41b79@suse.com>
Date: Wed, 23 Nov 2022 10:48:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/9] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>
Cc: marco.solieri@unimore.it, xen-devel@lists.xenproject.org,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-3-carlo.nonato@minervasys.tech>
 <CAG+AhRU8zrHaxrNQqyu-c4niB2DWXcQRmvsit_samXtDa2LpfQ@mail.gmail.com>
 <2e6c8d81-01d1-81a1-8fd4-4385e46befe4@suse.com>
 <CAG+AhRUEoJQGSw2qJmE1JFTuCMa_0sUR2+M2Zd8pkd+dgf2wPg@mail.gmail.com>
 <6c07cdfc-888a-45bb-2077-528a809a62f4@suse.com>
 <2645971b-8094-6108-f3dd-567e93d1f1e5@xen.org>
 <d0d0ee24-f92c-d0c8-2bfb-f6beff269a1f@suse.com>
In-Reply-To: <d0d0ee24-f92c-d0c8-2bfb-f6beff269a1f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: 906f16e2-f26e-4e3e-8cea-08dacd37e6bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RVk3FVISovgINM+8iSIL32xJvcUfRyJRMvhHvTvp/7VOP5Oa/KSCXqq9II8uNBtS/a7yP5l9cjsLR+YkInAcl+u6mr5nR0g9Uq1l0KmKcxkqimQonf11OCumGJRyTgwZyZeqG4cBVvR77kzm2VQ3AYmxCxHfdzN8h8O11Sywzt8wyaaN+VHZM7wSRUqWQ9zD9wsHOnmb2Miko7VMukeeEjvG/GW7ZIuYBfYSt6DR8cLj8Igji/F+MUnx6l87+GM6FkOlJ7b02LOcPEVc5JlgQwURS66PZrvd8oUKso6rO4Pw0EbnNFJXtlE64TJZPZ0C2R3mVXA58eDywp0GLBB8icTbqjgx3v1ig9+BDsNKeACNorAZMpIwect9AtAu73RwTvwj0S+J2WAl8rJ74o5Na8I1h0nzSJXoavdlaHPsRaYFKnnG3kyI6uHpbdo5X9Ie/s0M2yW1+2ZcqeFBb6Khh/S4Q2BxGxPEQVsteF/dL0NMnN2qD1uvjtl5S6gKmnAwTCqtuEiDFFSkiof2/zQW4dP/VI/BJrjetZojx0nwUSbtzP6gYzQ0JkBjmSu3264zz9rh8vGQQFbIBqh59VgjAuMj8YFEtB9G2ff2nLhkw8dpurHF4h9uh8n4AeqL3gTOTiG2gysVDZ0ZCj/hhggj03dEcSrOmwUKBe8zIx7uvfj46hup6O+9ecYnAD0sEdS/nw2SWCMrLJsooh2yGl+AwlRDfa93hgGAuRLrcpXzbls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199015)(36756003)(478600001)(38100700002)(66946007)(4326008)(41300700001)(6486002)(8676002)(66476007)(316002)(66556008)(54906003)(186003)(2616005)(6512007)(26005)(6506007)(83380400001)(53546011)(86362001)(31696002)(66899015)(6916009)(2906002)(31686004)(7416002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjljM0VhbTRWQ0M5TG81N0RoeEd0VkpibjJtdEFBTzJ6bGRTNFhIZjdqbnBa?=
 =?utf-8?B?U1dxc3g0Ykx4TEVPTElFeXJZclZXb3pzOVdaTThvYnhXc1ROam1FZWE3a3VF?=
 =?utf-8?B?WDQ3OTZVK1VsNXh6WWxLS2djZis2ZHM0cjA3RllFNHd0dzNzRDVhQ3VOMG1z?=
 =?utf-8?B?R1QyaTg2Z1NIcUhsMlhOR1REUzdXcTVEbHlEY3BEeENCRVJHcVNER1lDSWox?=
 =?utf-8?B?Yy9JbnhEc2RGbTErOGFsS1NVTTRtSTYxYVU4TldsSHVYSDEwMVRCL0pJcVpv?=
 =?utf-8?B?WlF3S3hhOU1YaXErOG9tYUxWaG14OHZCdkxPUnFoYUE2YXlIWU5WOStRTlUv?=
 =?utf-8?B?d05IWXczVWZKZGI1RS9jQUxsb2JJUldIVi9Tb3ZJUkFJNVg1eVlwZXdMRTB6?=
 =?utf-8?B?QkI2eDVYRFdud3I2cUdhRVFtMnZXZU1vUXh4YzJNRU9QcExlR3lEN1NEQ3dH?=
 =?utf-8?B?aWZ3VCtyWk1ZOVIrNTU2VEk1dVd3Rm5BK2Y5a05VbVpPMkJnS0UvQnRXd1pN?=
 =?utf-8?B?S2pZUUFtTlp0RWpteEdmeTM0YTFpUFRteEpxM2xlUTlCZUx1cW1TVEU5TW9L?=
 =?utf-8?B?eTZUUHp6RjdqNnF2SjRRNFFMaXltZWd6UG83bHo4ak9FSHlHVVpLN2dtU3lV?=
 =?utf-8?B?dWkvejhITWJnQkVhYWNoaG8xbDlVUGpRQTZUbC9MTzB1d0VlaHlvUjFiUXM0?=
 =?utf-8?B?TlZ2dWM0QlY3M3g3aG1wYjUvemJoSmxDK1BLQU1ZUjlxRWdEcGRIelJXdjFw?=
 =?utf-8?B?MXFJNmoxSW5kMmxtK2k3WFZmc0JKMDBpWFNtTDVWeU91M3lBdXFPVC9UdVdW?=
 =?utf-8?B?cDlHTUwwczBmeU0zeGpnTTZFRld5SkMxVTlWU202V2NDdXlsK2l0QVFxR2Jm?=
 =?utf-8?B?SjlNNGIwcGcvYWpKV1dpUWxtQ0dtR3doQy9lU0duOWdxc2J1bmVlZ2p4OS9G?=
 =?utf-8?B?cml6Y2JZSS9FWHEyZFZ4dmh4em5LaDJlTDhsR3ZxY1dDWVg1V3hvTzhicm1r?=
 =?utf-8?B?K0xQL1UvVFhlTGtpUnZhaWR4aWlUSEE5VFMzNG5HeDVTUHJhdGRnc2x3elNm?=
 =?utf-8?B?UGk5M1E4cHVlSGs3TWdrbnlDNTdBUUxuekJTcWF3ZUNyRUJNRWpwL3R5SExv?=
 =?utf-8?B?Y3pjMFBnUzBKd3ZKVkJjVkRlNTVJN2c4U0FQR012Szk1Q2p2VWpYODdkcWpt?=
 =?utf-8?B?NmZ4NEhYS1N2M2lLQ2lIWHlJRWFtQUhZL09TbTFPZ3lqS1ZWcUZVSDlZVzdF?=
 =?utf-8?B?VXQ1VCtBRzZURXVzcTVRdTJFQ096aW9NTmRUeXdabjl2MFdOTlpNaWRZTU4y?=
 =?utf-8?B?QUVUWUdJdGF2VFFjMjJYMm83Y1lEYWNXMDhJNFdpeXhhMEc1Wm9yZmxXbFlH?=
 =?utf-8?B?SXVHZEVRcTVZT1JXMzJYNzZjM3NqdEdHTnJ3aWg2bXFBTUFLc0I3OWROdGRw?=
 =?utf-8?B?amlkME54Y0JFaFNUdFVDSU8rL3ZKbFBlVGNUd0VCWWhtOUtucGtnUTZNcVBv?=
 =?utf-8?B?TzY0MW1VVEt2ODJ3TWNrQ05Od0ZJaFRzTnlrRXJuUDBiZFNHMHVvSVE1VTZ6?=
 =?utf-8?B?cjg3U2RFZzhOTElRRmRjOEswcDV5N0hpKzJkMzhQKzdzYTFOejREWmhoL3Ir?=
 =?utf-8?B?WG4rVlpQTWkrcEV2V0FqSVQwRkJ4TGsxV2EvY0tUbURQcmRiT0M5b1VHUG9V?=
 =?utf-8?B?cnhRNGxXaWQydWVMSHdWTjM4eWk3VkxYUUphK0l0YUY2YWpORVNsbWpUUjcx?=
 =?utf-8?B?bzVVa3ZTb0tzK0NDVlgrRWpiZFVZMFVmbHN5Wm1LWUt2aktIUFFoMnprN1Rs?=
 =?utf-8?B?VTFHeFRwTExHZExwWUtTTGRhVnRNR05WbUpjdHZYVy9IT1BsL2ZxbHhkMmtz?=
 =?utf-8?B?dmpIL1BOYzlhTDhQRy9HakxUWGhjblFaOVBUYUxqbTNTVGFGZU9ESVVub05x?=
 =?utf-8?B?b2ZsRU81RW91NDRrSGR4U3o5K3J5a1dhbldLRmJGNzdCcDZ6VzdjUDY3SWYx?=
 =?utf-8?B?c004eVI0aWo3eDYvTStwTStEcngvL0tqSjlTc1VrREtuYnB0Umk0QjhRdkVv?=
 =?utf-8?B?K0hLVTRYYi9TSkZ3ZjJsNzROallLNFpzdEI2eXR2YkpVZ0VOeGdhVkFJU0NC?=
 =?utf-8?Q?NVen8qGG3y4CvTz87lH8RzeYh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906f16e2-f26e-4e3e-8cea-08dacd37e6bd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 09:48:40.5986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIBIFsyrxI3ZVyGiaePgdm5X61FvpXXvgrHV4ecXJeA9M45ML5s5Zbxeln+AiBcCfBDvjqyPQI9ueeLJZ6uJcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299

On 23.11.2022 10:41, Jan Beulich wrote:
> On 22.11.2022 21:25, Julien Grall wrote:
>> On 21/11/2022 16:40, Jan Beulich wrote:
>>> On 21.11.2022 17:23, Carlo Nonato wrote:
>>>> This would be really good. The only problem I can see is the p2m allocation
>>>> which is done during domain creation. With the current set of patches it
>>>> results in a "Failed to allocate P2M pages" since we want to have p2m tables
>>>> allocated with the same color of the domain and a null page is returned
>>>> because we have no colors.
>>>
>>> Hmm, I see. It would seem to me that this p2m init really is happening
>>> too early. Ideally domain_create would merely mean creating a largely
>>> empty container, with stuff being populated subsequently as necessary.
>>
>> The vGIC is not optional. So to me it sounds wrong to defer the decision 
>> to after the domain is created.
>>
>> It is not clear to me how you would check that mandatory components have 
>> been properly initialized.
> 
> There could be final checking right before unpausing a domain for the
> first time.
> 
>>> But I guess this is too much of a re-work to be done in the context
>>> here, plus of course I may be overlooking something which actually
>>> makes it necessary for domain creation to be structured the way it is
>>> right now. (Imo the reason for the early minimal population of the p2m,
>>> added only quite recently, wasn't a good one, and the vGIC init would
>>> better be deferred. Yet once again I may lack details on why that's not
>>> possible.)
>>
>> See above for the theoritical part. For the practice part, we need to 
>> know the vGIC version at domain creation because it impact the maximum 
>> of vCPU we can expose.
> 
> Sure - I didn't suggest to leave that information out of domain_create.
> 
>> It is also not very clear where this could be initialized. Are you 
>> suggesting to add an extra mandatory hypercall? FAOD, I don't think 
>> p2m_set_allocation() would be the right place.
> 
> I agree with the latter - that would at best be a bodge. And yes, I was
> thinking of having a separate domctl for that purpose.

The expand further: I think setvnumainfo would also better be issued
before _any_ memory allocations for a domain. And I view vNUMA data as
kind of comparable to the coloring data here.

Jan

