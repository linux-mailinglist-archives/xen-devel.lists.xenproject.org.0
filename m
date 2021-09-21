Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C5F412E82
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 08:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191328.341309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSYyy-0008J4-6L; Tue, 21 Sep 2021 06:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191328.341309; Tue, 21 Sep 2021 06:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSYyy-0008HF-2D; Tue, 21 Sep 2021 06:10:20 +0000
Received: by outflank-mailman (input) for mailman id 191328;
 Tue, 21 Sep 2021 06:10:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSYyx-0008H9-2w
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 06:10:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5d0b09a-2b2d-47b7-a668-481382c0ad75;
 Tue, 21 Sep 2021 06:10:18 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-f8fItshwP_up7H6nywsZbg-1; Tue, 21 Sep 2021 08:10:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 06:10:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 06:10:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:208:be::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 06:10:13 +0000
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
X-Inumbo-ID: a5d0b09a-2b2d-47b7-a668-481382c0ad75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632204617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T1NeMOJA8ig+J/2JyYIqUyNFp0jZMGc3hhutzA+lpWg=;
	b=heUdHgAyPFtP+oHYFFEl5Yym5id5eW+JsUCY3emjAQaFFsbgCUP8bpCsCp+3eOfrlPQZYC
	9qiLolrLmLvsqlats6Cq5IMupvYELXnXCJhPIyH+PmtP0P/57oOoCGnGWZl0bqMdiGgKJV
	fI7+TFodZhYo0ENtOuifyUYU9MZbh5Y=
X-MC-Unique: f8fItshwP_up7H6nywsZbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+DnEv43qWQYRBZiQGYPWqpS1cZw72xYHeLNfG3kPK6tcTk1fmITnoujO424aIZ6JCbFKYuEBoDY/vs8E3NDQguo3nCY9+buAbDtML+K3ewSpHegOV4i5VDBLBkwh0N2Lx7jEAOj6W6DaPpTvRciPjM+XfMcDT2Rq57dWLMyLqp0dMiexyCnGl+KRLOi2ZdC2pXw25U2JODuuUf804q36/xgCP6RTdyMl8LodCUWi/W5T9J5UWzkh8OcGEX9Zn3csMADRndCCfpO9WpN4lZtrsPyLam+sKQNGhangBIKqwqrY5vuUtDcffHwrBhgl+MyXlmj7bJBlaabnfv5CJR5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=T1NeMOJA8ig+J/2JyYIqUyNFp0jZMGc3hhutzA+lpWg=;
 b=NZJZp7ofPyzDvjGXSOF73G5/uWwYneOJetojwuPkxrV6NBEimuhLjdMiNyFINJKobAtmJVd2O8l+aXheUXm+V++ikF74IORiAssQs1rSUjc+KY7LvdJ0mSum4/V0p9hIpBczOai1pJNiDPoe5WghaL5I3IG7JmDFH1D/2ZXMDodwhOjhuB/1sA0RDl8fdkwBF28BwGZdG4+DepHBX7an9teMs+vn/zVt1PdZO2B9kYL1gKKfOM9qy7WS0/4x9lHGq233HoBcQKmC9qHN+mO+wNBcDbyhGHWS504+BLTHCj/fSnxMMOqcZFor5pLOC3Y0jcRgl8xfFNV/sweIKmgl5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH=5d_x86=3a_drop_a_bogus_SHARED=5fM2?=
 =?UTF-8?Q?P=28=29_check_from_Dom0_building_code?=
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <47deb99d-3ffc-61e4-26e6-7e7ab186a79a@suse.com>
 <0accd732-71a2-b122-6c7b-bb8fc8b0f3cf@suse.com>
Message-ID: <27bd50f4-2216-ceb2-437a-f9eaa8f7c019@suse.com>
Date: Tue, 21 Sep 2021 08:10:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0accd732-71a2-b122-6c7b-bb8fc8b0f3cf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:208:be::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52d33556-1655-4cb1-663c-08d97cc67992
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4350D432F83940984A6803D6B3A19@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RlUD9cvR2G/s4Jc1NnasOyes3W1TmTI0IMVdRguiTqkTCf3WrOvBlJJOiTwBw3yoHGuROrwCsEUqhNWS1vQVii1WlIbGsGEWFhdFOVmNO9wfa18G8D+h00T6tKQUFFUscNFFHWrr8kGAoqBkU1TLtZuOkVELoCCscge6PLG0lR6kUnp0UCu/0kaSa/nZezrVagZc8dCb98yEVQ546oRrA8IAQYXvjjMHbpCDxH6WdvKBLGI8YlU2+K9vP3Fzc+RsasaaHls3BgrlfRHjHfTH0ZOBwy5k63qnUE0D7uG5Rq2KTk5MBus6B1hbzPXHGIF+FORaSrziOfy5iUGrX7KZHpXQ0tNP8VBVdV0PGr/hxUQdqUameowDHrKCGBidHage4hmm7gRGAV6/QiZWTWHsoCSHF8cN5gbF/pw+MGLeAIGREZqiNYkS+Vawu+7vXj7jPrwOmdPE2qnqg/YOarNEQ/AbkCcdhytqspAG0UW0aBZ6mhJTXgmTb4Y6VsqLLlhQftFL3fDGlZX+UclJUip2IUg7EwfT8tysfbWnsd91/bEaWE+6f2zkwpnebRTUyQxUMwaYLxOb7rHmWltDDLDlIjDbMlBwIp8FTUfmx/0ePKGOAdXu3OTHvLpG1sw6FsMLXL00tQTUrW++VjT/F65pzUOGTtJSsfNIwtjFoVbEtbKbjpSAi+gPybCQyAXCgK26KAtl/OXjYG6qib5if9DTgexMo378gaA2HO5cqaW1psQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(508600001)(956004)(4326008)(316002)(31696002)(110136005)(38100700002)(53546011)(86362001)(36756003)(5660300002)(66476007)(31686004)(6486002)(16576012)(26005)(66556008)(186003)(2616005)(8936002)(66946007)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFVjZnNDei9QTTVqOGFQU1ZaaU9UOGttbmo4eFgzcFJDeFJHcFhabmowSlA4?=
 =?utf-8?B?elNOeU5tc21NbVNHL09KU29aajJweEJudmNDNGlLZEpKek1Ba2hCTGJtSXA0?=
 =?utf-8?B?VXlWQVo4ZC9KYkdBU2pDWExOT0Q5dDdUaUNJTzloMVJHTFNsZW9XT2E0dUVo?=
 =?utf-8?B?VytWYUt1Q1gzMkxCRnBMRUx5UElRSDlrNUt6aW5paVFDNElLejN1YXRoczF3?=
 =?utf-8?B?SXpsbUtDT1U0ZmFaZ0NTVWo4Tk44RlBMUWpKSXRsRGNPSXNzR0duUU9lQVJw?=
 =?utf-8?B?UzRGdnJ4ZEM0SVYvMTBob295VHVBbjhLRk1pTFB5QWd1RWFITWRiQnRTaXVP?=
 =?utf-8?B?VWQ1WUd6TXc0b2hjOTFFVGU0enhhMW05NzVjN1Zjc2MvbnFucXo5YnQvcEEw?=
 =?utf-8?B?Umx1enZ6N2tqRTFkb2hUTkdFMWhraThnSUlhN2FLRlNaY3lMK0FIcVFEODlt?=
 =?utf-8?B?YzZvQkYwWWR0WnNwSGNuNU1yUkIwZnpQZWdhc2NZd3RYVTdsQUxOUnFlMzdI?=
 =?utf-8?B?T1BJeGN6ZTExU0hyTGp1THgxOUx6Z0Q5cnllZjMzTFVuc1BrUEhhRmdydnVz?=
 =?utf-8?B?OElwZlRMbVlvUmQ3d21qZURjSXJRdmxZTm5tUjJ0RHoybXpJUUUwbERHNVBv?=
 =?utf-8?B?Vmg1T0duZ0ZaT0R6ZTV3SVVtZ0JxVzErSE1KQXVJMmNkd08zSWg4bWpGV2xS?=
 =?utf-8?B?ckpZTFVHbERMb3M1ZXoySE5MZFcyM294WnVGTW11MmN0bHZPZ0FoTEVxQWph?=
 =?utf-8?B?eTE3MFhoWHRBWE0zV0YxMUl1eXBtMVZ1YzFqWTlad1BXZWYvOHU5ZGF3dm5D?=
 =?utf-8?B?dDlrL010UjBsMWdPOTlGR2lWN3VlMGlKNmZ4RDJDeklTd3pEYmxaNXRGSVhk?=
 =?utf-8?B?anlvRHBSaGIzWGVKRWZpaEdkN2orMjM1dG1Qa1JNQWZ3TXRTZFU2eUFWclVU?=
 =?utf-8?B?WFVLbXlhS0tsMDdZV3V0WWxZZEFjekpSMVZwZzdSNFVtdS9oek5ka0g0Rzkr?=
 =?utf-8?B?S3RYRWVaL1l0S1N3NTBZRWV5WnFhdkpFT3pyMDFQT200RythSDNuTnpKR2tU?=
 =?utf-8?B?VTJxK3IvcTROWXJkbWVNQ09IR004cnVjQlhZOU5zdG1Ia0JKb21seHA5NjFO?=
 =?utf-8?B?QW1NUUZuVUZwWjRqdlROdXI2aVpxYm16UWI5bFdlY05rSUhISGdwbnZBVGZD?=
 =?utf-8?B?cnB5OHU0SVVIS3JQTTRrOXRPakdRR1B1dEoxdjFtdEs1aHhHYU95OGZBRzBJ?=
 =?utf-8?B?bWpoZ2QxRlBhY0s0RERCM3hnMW51bVpQd0VSRndHQVpFSVpuVEtFTUhEVHMw?=
 =?utf-8?B?TjcwQ0dPckMvZWVudllMcGR4N3M3UW8xcnpUSzkybG9NcTdQNTIzU0VYUGp3?=
 =?utf-8?B?QktTL2t4WkhCb2xSc2RDM2tWUUo5SVFTK25RaTZoWm1CZVAwY1hSbjBaWmlo?=
 =?utf-8?B?QVN5MFpGbGdDNndQNUpLT2kwQ3ArK1doaW1QN0FGZDZKdGlOclY5UWhRZ3ND?=
 =?utf-8?B?elg2MzJBVTNJNmQ0ZTlUNkxkdVR4Z3QyYnFLcW4xMVIxaHZTVURBVDd6VVFD?=
 =?utf-8?B?cXdoWTA4RTN5dGJDMmRZRGVDbmVNT2dreUdaeVN0dWF3YVpFSVlqRTA4QkQ1?=
 =?utf-8?B?TUFTMEpUUzJabGlyOHpjQ29pSnRBalYwYlJMWmVRUHdGSVVEWEJJOFQyQkFH?=
 =?utf-8?B?K1NCVDZqK292ZjE5UVEzd1NEOUw5ejgyVkVxQzlhMTlMRkZzQ1lmb1RSYS9m?=
 =?utf-8?Q?CpatS7zy50xREk28CNJjeDI19i7xil2IDbIUWR9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d33556-1655-4cb1-663c-08d97cc67992
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 06:10:13.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGEwl/OZ69Na/EgoSPj3mqLDhPhADA79cQH52ML6Lh++qYxJU1UjdZZftbq7WcujFjQjviaqX97oqhkyVzv8fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350

On 06.07.2021 09:37, Jan Beulich wrote:
> On 28.06.2021 13:52, Jan Beulich wrote:
>> If anything, a check covering a wider range of invalid M2P entries ought
>> to be used (e.g. VALID_M2P()). But since everything is fully under Xen's
>> control at this stage, simply remove the BUG_ON().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I didn't expect this to be controversial, so may I please ask for an ack
> (or otherwise)?

To be quite honest, I find it very strange that even simple changes like
this one sit un-responded to for months. This isn't the only example ...

Thanks, Jan

>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -815,7 +815,6 @@ int __init dom0_construct_pv(struct doma
>>      page_list_for_each ( page, &d->page_list )
>>      {
>>          mfn = mfn_x(page_to_mfn(page));
>> -        BUG_ON(SHARED_M2P(get_gpfn_from_mfn(mfn)));
>>          if ( get_gpfn_from_mfn(mfn) >= count )
>>          {
>>              BUG_ON(compat);
>>
> 


