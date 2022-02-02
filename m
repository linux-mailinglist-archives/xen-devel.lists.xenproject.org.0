Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CC14A6E5D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 11:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264007.456946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCWQ-000573-9h; Wed, 02 Feb 2022 10:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264007.456946; Wed, 02 Feb 2022 10:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCWQ-00054T-6X; Wed, 02 Feb 2022 10:05:54 +0000
Received: by outflank-mailman (input) for mailman id 264007;
 Wed, 02 Feb 2022 10:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFCWO-0004Kz-V1
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 10:05:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3d49012-840f-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 11:05:52 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-pq8nFPP_PEynSv8jMUVkRQ-1; Wed, 02 Feb 2022 11:05:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS1PR04MB9502.eurprd04.prod.outlook.com (2603:10a6:20b:4d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Wed, 2 Feb
 2022 10:05:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 10:05:49 +0000
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
X-Inumbo-ID: b3d49012-840f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643796351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ratNYSfrRorbiM7zyzZLpSz4meXwcrFeqbTdcFve2ao=;
	b=cxy2/Yna7qjdfjbfmG0LZAyJbKg1RRn9kg1OyG3t1270tYgGqy/qshYzzflN9TcH2loPtl
	Yp47j8I1FPJgv1d6ZL0mGLs7oq1+80iIk2b8y/gE0DzRaq/NigArKhjbXJUrLf7e6yMkF5
	xrrpjMFT0RZ0ejDdvdGSOwori1siaCw=
X-MC-Unique: pq8nFPP_PEynSv8jMUVkRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdojwcLHDrxxH0sXLUnVo3Gs0YKZbi/UKdsVBN3dQCQX2Tynm/k5OiRtUbtaFfK8h/mW0pzc7z3uz/i6kiTi+CE90KMDnxB8YjOyYg8XfSGjpbjvOIu6iZINRh2Yi0adpVYLOFWtJJSgsBjA8AVWOnprKHXPIMckpTVSn0zJDq/2uW0+dxj5k5i7LavUDuliDhyI2jD6+fZ8YR3z8BiTFe/s07Ed/RKj6EI4HjMdI8TGOWVgob2ALG+5S3Lno7EXhwmP24debBcEbP5JuDxjRxHrjb0t1GDJOuaXABLUyw78XfqFZvKuoQGJKcxo/58zH+8XBNJMARRLfxD5YZ278w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ratNYSfrRorbiM7zyzZLpSz4meXwcrFeqbTdcFve2ao=;
 b=DBGX/uU1P+QtgkPjD/zKjVVaRol/c5ehRDdsgJLUevfhVAzEwW/jLsp5ctz7pEpO7Ox/brNLPKEgRucbV9HY0ZB0VKn3VBK/Gut2g30K3k4yxaodDG0SLMxPZwCWXWxE8I/78bJjy5F+Npg/bfao3iLi0GwnsOdiTd/6JeEifEyjUAuuGp2g4KQGkwHvbqumWIQMd/Bikl7OI8F9fouGtAzrfPYLbkWYh7Rt/TKzzTTexPsUM3/IyMyVE1Ge56+Xqm7X472BzmiJaPq66tyCztE8keJmepbcGJ3tRC750QMmv67k9FTBccoEvBXXZoT2EDu/Nud8oXx6z+gBSBQrxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1252be7b-2b32-db39-7c90-c56d96b5a17c@suse.com>
Date: Wed, 2 Feb 2022 11:05:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] xen/pci: detect when BARs are not suitably positioned
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20220201124551.2392-1-roger.pau@citrix.com>
 <59685ca1-0587-a975-bf5b-56058b650c3a@suse.com>
 <64474de4-d9c2-ef16-e0d1-b59d5967ee20@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64474de4-d9c2-ef16-e0d1-b59d5967ee20@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0027.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 095d8c6d-53b5-4852-5717-08d9e633963f
X-MS-TrafficTypeDiagnostic: AS1PR04MB9502:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB9502EAEC0B45736DA62BD2CBB3279@AS1PR04MB9502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/6xgQL7vlzfXVRJ2sKDMQC9vExvAbgddRMC47SPOqBz7bdrcrUV+9PoEVO8kleXa59MVR9VUQMsTptvzTpCsNyuh2KEpuTA+uy5rkK2a1/OmPG65ZIYp6lhQXFHZhLWm58eXpzQAMgaLptBi5fQiymtE+xXVG7K/rdi3WAn6ILzutN1x9xGqTkA+klbS9tZ9M75UMo3MSL6iYwRWid87Yq2glLYjEam5wYobl3xazrewYVDe7v6QaBwG/+d7SCrlIh8qm1kNks3RV1xdT5vumimNYvY4B1fktqblYZdWoJ64h1tBzlSAzLdXPOQfadhTdy0l+3rNopJ6rzLhCAWVWs02/1YMakKGK493yxTfkwJ2nqYoGPP7U6vIn0Njjz6UREuWdtiAHgP+oHRBBCK2CueKdX2E7BhPpy8+HNiQ5vh2WIi6/b+1SO5VrcECOJnkkcs0HvufwGG3KLnI1L25LioTasTW1hiTAV0o/y0F8fwxP8MMUD3N47vbICSGAQjAeqOvpOKHtB1F7CuOKkiJvi/6eaVB03X8t43WBEYaHg+INuUtFGj9AFZ5UEFI3N0V0B1kxrvvkTcHuHE8mwqKvL6bTEuVZ3eBfw91KkOsSCA2BATpqGQGQ1yhZBJVmRZvWAnyz74JU2qaQgcSyqKgsbxPnD6NYdjfEfoyyTS80/HjzBxznaHbL71dxVu83Tpo0Fpm5/33KK/6yGOlk2JSpmtRNnGmY09luErDGQUNXhGhVpXeUvyOZ0kDCJh1oz+n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6506007)(6666004)(38100700002)(53546011)(31686004)(86362001)(2616005)(66946007)(31696002)(8676002)(66556008)(66476007)(6512007)(8936002)(2906002)(4326008)(508600001)(26005)(5660300002)(186003)(6486002)(316002)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFpUdFJhUzdlN3NPY2hqeUoxTDl1bDVTZ21KTWFET0drZGNZMWVwUGpIdkg3?=
 =?utf-8?B?ZDVQTURDanBnWjZqbHpUbWorQTNLeHg3NkNOc1Niem5HRXNMUVdZZDM5Rjlq?=
 =?utf-8?B?ajBQN0lxblNscjhxa2tJcGkzbm1CSkcvM29OREwyUkszMFhLZCsvNVc4Tzl4?=
 =?utf-8?B?akoyQ0RsTDlrNy9USGUxNmZaSUtRZDB3VCtKV2RLRDN3RzlLOHVzamVob1Ja?=
 =?utf-8?B?SzlNUW12Tlh0ZkVhbWFETnNKbXpGU0JDNkdqS25aeW5Eekd2ajNWY2JCN2lS?=
 =?utf-8?B?akxjZURkb3ZWZzRRNzhXZ2thMENBSUFKTXlWVzBCTUJOSlpRaTkzOGs4RGYx?=
 =?utf-8?B?OWNJaXBRYTZGZmJJKzdWTWtLNFF4WDVyZVVUYVBJcGIzRkJkdThhT1RYb0pZ?=
 =?utf-8?B?RTc0ZFZLcTlZNHRvczZYTzhMSXpPQ3FCd0EzUWVXU3hnWmVYYXhjcEJBTXBQ?=
 =?utf-8?B?RVNsVmJxNnIzNDhERnM3RDBFTk50TElRNE8yV0RkTTlROHNRanVRYW9nSXBu?=
 =?utf-8?B?MUFaaCtiSXRkWmxubWtWMDEyM1BaL1p1MWdja2tmZy9lTnd3dUtHZXlFdjlR?=
 =?utf-8?B?NkxEVmorYW5qUitlMVdLU2U1TmNrTW9kNExUbVRMZ0R1YTJrc0FFUGgvTmVa?=
 =?utf-8?B?YndZRndTSTZrUXNaWkdCNFdxSURNUWIweXIzN1VCSjVNNVlldnlFZkg2cDBC?=
 =?utf-8?B?OWJrMmhqTjEwclQ0OW9yWGtPNE1mazlLYStuZERET3Byc3cvaXhXaXNSMEM5?=
 =?utf-8?B?Q1RuOVk0UERUaVJVVTB5MWUrVTdrWWJvcjd0MVZqZUxJZWhUTENVenpTQ3pp?=
 =?utf-8?B?SFF1RS9KMlhLRGVCeU4wT0Z3NDJhdkJYcHB2eFh3aEVUSHh4bklLcDBua0ZZ?=
 =?utf-8?B?RFhqNXg3TEZUTXJxMXJ5R1J4L3pZUXZMM3htdjQwVTNET1A3VHlYanBFUjhT?=
 =?utf-8?B?REJxaGpMRFlXYXRyOUowckkrYXlFaWhmTDlVVzRvK0NLR3RVY29sQkJhQkVr?=
 =?utf-8?B?eGcweGRLWHJnek1oMXI1WGdkOHN0alB5U0p2a3dJbzJicHF0ZzQ1L2dlQnU1?=
 =?utf-8?B?ZkVrdHBBNHk0akR5dFZVMDRTUWFROXV0T2FMQzhISXlzZm9oQmkyOGtGb2VJ?=
 =?utf-8?B?WS8yQ2tlSW85OGFnQkduTjEzbm9neEhpWE53QzFYU1RJSlpyTDlRRTJMc0dM?=
 =?utf-8?B?N0hUbnIzNlZWVEFMRkMvekt2Ty9idnN3MExsenJkMUI1RGwrelZaUTZoTkJG?=
 =?utf-8?B?NlpGdGFDOUY5UURWZUJSb2M2M2k5d3B1aG5IQUR2WENBYlpuQmV5ZkNFT0xJ?=
 =?utf-8?B?RkpOa3praGM5NTNheHRUOXBxWUFhNlFFcFJqSFIzcUF5R25INTNsMllxakNJ?=
 =?utf-8?B?dS9NUjU2TlNUYlc1VzZLbDk2T0NvN2Z5KzhxV3FFUVJOamxjQThCNmtBWk52?=
 =?utf-8?B?cUw3VTBPMU1aYVNQNStTOGNPd1dtekxmNGM3SzdBNGIwbGF1MEQra2src2di?=
 =?utf-8?B?aDZIVWhxRWdJK244WkJCNjNSZE5KNC9HWTJiV1RHQ3orcmlLS2tpRDNnZS9X?=
 =?utf-8?B?Tit1R3M4RVFBSk0zR3lJdEVidmVUSWx0MU1ndHAyVjM0bStmOW0vK0hXZmdC?=
 =?utf-8?B?T0xEQzJCZmVYTkRVRUZhYi8xNUs4MzNhU3QxYWpxZFhreVFUdkFqV1lXYnJB?=
 =?utf-8?B?cmlIMmVqL2NiZnhNQis5THQwNFY4a1F2NGFHNTllVEZJUlpFUmt3eXV3VFpH?=
 =?utf-8?B?N1pkOXI4TEphdVlQRDRydUwvTW1meU5pQ0JCN0lxS0kzbzY2d3hIKytpQXRl?=
 =?utf-8?B?dUllMEdZaytVSWoxRDgxY0FvSjVSR2pGSXNxNXF4SWxTSkJNV1BzK0pjYkE0?=
 =?utf-8?B?L0ExTUd5TDRybTVvSitpUmVTRXpnczJ6Z0szYW0yeGp6cndkaHkxZXN0cDJV?=
 =?utf-8?B?b1ZzVitDeDM1cnJjOE90OE5yUEIxZWFjNGl6bUFrcU5IMDJ6Qm1OM2tvWkZz?=
 =?utf-8?B?WlhKMmE5QlM0ak5LaXdiQnJQRWt1cURZOXpYMXRhUGtISDVmdUlia0VYWSsv?=
 =?utf-8?B?RFBiRXY5Sjk1Z0hqc1loQnk2YWZmR2lWVkVZeXNSLzJLQnF5M1AwZjA0dXNG?=
 =?utf-8?B?VkxTSWswR0dEOUVVdXhjQ0JVV2dkVFBEbktyalVFbmErcG9rYkVtbWlaaHlV?=
 =?utf-8?Q?fEmLMo/B23o36oZr2BTRuhc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 095d8c6d-53b5-4852-5717-08d9e633963f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 10:05:48.9652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSexMqiDvamtZydKdO6VAUHTjbscaIuJ6dXVv6FOA306o4s2Cff0DgV6QCPJIDe96H0UXRwUVjrIWucr8UZlFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9502

On 02.02.2022 10:57, Julien Grall wrote:
> On 02/02/2022 09:42, Jan Beulich wrote:
>> On 01.02.2022 13:45, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
>>>       return (page_get_owner(page) == dom_io);
>>>   }
>>>   
>>> +bool is_memory_hole(unsigned long start, unsigned long end)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    for ( i = 0; i < e820.nr_map; i++ )
>>> +    {
>>> +        const struct e820entry *entry = &e820.map[i];
>>> +
>>> +        /* Do not allow overlaps with any memory range. */
>>> +        if ( start < PFN_DOWN(entry->addr + entry->size) &&
>>> +             PFN_DOWN(entry->addr) <= end )
>>> +            return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>
>> Doesn't the left side of the && need to use PFN_UP()?
>>
>> I also think it would help if a brief comment ahead of the
>> function said that the range is inclusive. Otherwise the use
>> of < and >= gives the impression of something being wrong.
>> Then again it may be better to switch to <= anyway, as I
>> think you want to avoid possible zero-size regions (at which
>> point subtracting 1 for using <= is going to be valid).
>>
>> Finally I wonder whether the function parameters wouldn't
>> better be named e.g. spfn and epfn, but maybe their units can
>> be inferred from their types being unsigned long (which,
>> however, would build on the assumption that we use appropriate
>> types everywhere).
> 
> I think this a case where mfn_t would be useful to use.

Actually I did consider to suggest it when asking to convert
to frame numbers, and specifically didn't because its use will
clutter the code here quite a bit. Which isn't to mean I'd
object if the adjustment was made ...

Jan


