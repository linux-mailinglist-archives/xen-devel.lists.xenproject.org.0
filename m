Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B68414ABA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 15:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192760.343375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2TK-0003jX-Cu; Wed, 22 Sep 2021 13:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192760.343375; Wed, 22 Sep 2021 13:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2TK-0003hK-9F; Wed, 22 Sep 2021 13:39:38 +0000
Received: by outflank-mailman (input) for mailman id 192760;
 Wed, 22 Sep 2021 13:39:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT2TI-0003hE-Fj
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 13:39:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb85bac1-332f-4306-baa5-62162d6f2428;
 Wed, 22 Sep 2021 13:39:35 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-RRgzrCCYPhSqar_GqGZnBA-1; Wed, 22 Sep 2021 15:39:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 13:39:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 13:39:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0001.eurprd09.prod.outlook.com (2603:10a6:102:b7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 13:39:29 +0000
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
X-Inumbo-ID: cb85bac1-332f-4306-baa5-62162d6f2428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632317974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4goRYAj1C/OYhVef3+5ksvuHtwgPhezRweIBkwvA5VM=;
	b=S53CO5ZKfpu77Qve0OLCWooVoK0nUE3DpAWUKCdz+iiqVniMqureSS8UUYaMumcffizD3B
	dgggxNy381bpSz5KNYZwYIaMZVCXI1gwNekw8muILGFey5pBeo3dLjqMY8LLyK+tfqeG2z
	cb2AimH1f3oPQSzusLrgf5rp2Ze8p2E=
X-MC-Unique: RRgzrCCYPhSqar_GqGZnBA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNGmlk27vKUmqC/jVwhRnZmM4TwujWR9bDExLO5GGzxC3LQek3qMd/AxVHYXHMqoKTp6Ea+5tJ8K7V+8Hriv90+2/oxncg3fIEDv574EcCPtON4v5C3dy1RIVNKdIdjWmqc288iuhp8ErMIiEDRUxZ2iLfQFem56d5gr8a7xlNYa0RrIqfEGaJJ/7aVtz3n7dO71MC2K5qjw/hm8SBAoh+vqtory6MBLT+h+VLM7jfsR4N5J4oB90pWvHari7TPtbL5/gVaXKVCFh03V3O17Zo3nI9jqASkM2/Oql/ux3pfm8Y1gwDeozL2jAlKQdH2e/VjyzMnMKRdNftxcTWcm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4goRYAj1C/OYhVef3+5ksvuHtwgPhezRweIBkwvA5VM=;
 b=RYqeIeuXmYeznoTnWXdqzThGnfzslLoJvnBy4QzpmER/FDroyO+v7vtMpWHDWTeqzVlnlUBAzgPEhSCkrVY9QGgTjtSpdOv9BmUTVE+qKC/6Su5HeLJSMddiP4v7iASmkG/Md5SeNENqtpiJXvkGp/H/UA8EMno+1s3hURhWuv4pK2oWFe3MwzmZZc6NzuWFqpPTz6w7tRujOAMXj6mhO5K7/wQKziF23UkFDbCd/5SdR8BloDQwUmdGBHIidcK8+1Q1+TG4Sndoxl6oQZ5qfovpZ9wPs77ziv3SiKrh+NI4mErkcrQoDO515W/KVKjHZEmckeblpoOIKpqOFOeJYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/3] xen/privcmd: fix error handling in mmap-resource
 processing
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>
References: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
 <aa6d6a67-6889-338a-a910-51e889f792d5@suse.com>
 <c0c84258-c2ee-f58c-ae9a-5f8bdd75f0db@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1374b8da-1076-63fb-bc54-5be9f1ae94d4@suse.com>
Date: Wed, 22 Sep 2021 15:39:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c0c84258-c2ee-f58c-ae9a-5f8bdd75f0db@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0001.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc48c9ae-95b2-4e4b-271b-08d97dce6755
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039BE7D471D883F0B069215B3A29@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+7N89F4Ko2eT3NhJlBGL5y2iaQ2uR/bgjBvyOK918Rd06/66CH9iWz4NAJvKFtcgr3oXPZPC2/YmPl9Y3Gf1v4bXO6JiG9sry7qqfWay+5Q5NHumo5rBzrb9xi6Hlrv951gBT3tm3S/VLE+ztrAn563H16DFubxoV1BdGGVae7qjGgy42vzQdcafoFCk3SXqUQulJ/AQTrJ/SfAjL8aM7FZwiHUHABPWb+i9Sx6iQmCuSUHh1RAnOY55PTn5r1LvjePxIZyxXRDISGtosY8S67Bsxjg7/fDTrcI9l01E1DPIo0Nn3N8F1bbqqsIqT1W6Xm0awTzDPUVah1DRFBVy6M5nY/JeSYWpgmX92ktjkq+3tjWdHPpI8mOBc4C4TgQcqnzGukqeNQly6ruPyJDIqUPuvYH/snQXP4Yf1mEqOLuQQBPgr6jTk80aRRQjyxZ+eJJJxJWryErcxrKN5bv0drh2FvERXt/m9evCcXjKjSi7w3EUrEoUhvfzs99+zZOR5pHR1Mx27XHDLQUs9SkZoc+uttP/yhqI9JpQAryhqjgpy5jaQDka+sNVxfo4u//3A9avFfOMmQLvtJE/yh+0MeVcDiegCyISCa3q+cm02ssVXi6VD+pbOumjvrvShCtLlzZwXqVGFxT2hUnA63EA7iTTY1jB5aS/oUHV1UW/VAd9D6LKxeVXVuZMv7x1qLNeObq3f4opukwCj5qqNvomay74PkhhKqtrh+hR1UF5z0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(66476007)(66556008)(38100700002)(4326008)(66946007)(83380400001)(31696002)(316002)(5660300002)(54906003)(53546011)(107886003)(31686004)(2906002)(86362001)(16576012)(186003)(6486002)(8676002)(2616005)(956004)(6916009)(8936002)(36756003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXpZcmY5dWZRZEVkY3cxaWFlSWxpd2FaNkh0NE52MjdXQzZlaFF5Tmk1cDRM?=
 =?utf-8?B?NDAvUTZ6NGhYZS9YV2lQS2pvTjVGWWJVWFMrb0tjRENQQlh1VUd6YWgrbmwz?=
 =?utf-8?B?c0JZcXg0citQYW1Lc3BwclgxVXZVd1REZWFsVHovK2h3M3ppMi9BR2dVUTZt?=
 =?utf-8?B?YU9RNDVzWktGRFMxcGZMMjZxWVZwdVVId1JCVEw2ZjJNclhDUE5wemlubzEw?=
 =?utf-8?B?RnVZTEZVdTUwMERyQU9mMFl1bG13VjNINCtSUmprVlhJdDNSdVpTVGRtVndw?=
 =?utf-8?B?aU40V3Nrc2traUVEVGR6dENnV085WnBIWVl1aC9nOWlUOU1XR1ZKNXduMFdW?=
 =?utf-8?B?N1ZRRTVadGEyblFEMG5mdTZRYzh0SkdJL3RYSk5KeVNoMXhzUHNnTXFGVTFZ?=
 =?utf-8?B?TFRoZjEzK3ZPTWdMUWFxcmUyTzBITDFTSlp5c2ZTVC9tRVZYMHIvQlgwMkx3?=
 =?utf-8?B?NUtzQTJWMzEyMmtCTUUva1RuYlNXSG45cWszR1V5OEIzQ3prV204ZFhOTEJQ?=
 =?utf-8?B?bWlEMWVNQkVaem84WGtHVEtndjBhWDZPK3VFNXBTc0MzZkdhTnVsaUdFdndS?=
 =?utf-8?B?aUUxUnBXUGRTa1V5M1JnbmZoQUdPLzFIaGpYSjNVSGJpS0pNODRLbjNMUEpk?=
 =?utf-8?B?UDV6elp3WGFKTE52SURVT2xoMGRFWU9PWkp0azRYSDdWUjRuVXlFYUJZTlFs?=
 =?utf-8?B?d0E0RzFjcXUrSDFRckN4SGRlKzlXWkNrZUZtWEJPdlZ6SWxvVzk3OFlhVkVN?=
 =?utf-8?B?SzFLRUJUY28yR2cvdlY0L3lSRElqSWZuMGdqSlBVUTN6MUdtU0NyTmgrSmw5?=
 =?utf-8?B?Ui8zTmhzU3hrcVlxOEw0ZS83SmZMZWw4WGJWRW55Y2tGd0dXWFY5VCtMbmpK?=
 =?utf-8?B?MXVzZ0tZcEZURjZkWFhtOUZYVHJDVEhiWWZNUlpYZE5JRCtabmFaa00yblZ5?=
 =?utf-8?B?V0NVQmdIN3hSUmJUaDRLSC94RTlMcFNxeDVpWFV3RFNtZmp2RXhsVFZYeUJx?=
 =?utf-8?B?akVRSSsrS3BpdWowK2NXeFBlcmFFUmFTS1RlaGM1ekNEZXNsVDJ2ZWxIRnM5?=
 =?utf-8?B?aVNZNWxFbkNhQXpnTXlSSzRjazBkL3NIQVAwUUdkWFFZaUI1bENIb21DTkxX?=
 =?utf-8?B?ZGRaV0hLREpPU0xPYmtiRjBlaEtFTTlPRjJtY0Z1cXFHSEJWcHFLZzZyUmZ2?=
 =?utf-8?B?cTFJQndJbmNzQTlUTmFCQTZYVTlZVnJlYVdXNzRINWZPdjdJSVBlT3lmbXZN?=
 =?utf-8?B?eE42bW1mVzJ1MVJGdkNCSmd2ZFhUUnc5d2NKTHdYeWcwRFNCQ0xVenJaQkIv?=
 =?utf-8?B?OWw1aXhWVUdCSHRXekh4UHJKMENreVRqUlpEd1R3MVdKbGxPM2ZYdXpFaEZK?=
 =?utf-8?B?djJPU2dNZ1AvUDVBVVhWR3I0UTE0NGVvWmpGNDRTaHJpSG9jV1E3UGNmdmdt?=
 =?utf-8?B?clpVTlU4RnFpUC9BVSt3UkhobzFkK01RUFBFOVhNRXFqR01Nc3FoeFNWdkl1?=
 =?utf-8?B?dktGWGpKS01abFN0QXc3ZVZ5NWR5ck8xYm40MEE5ZlR0dmExb3RMVUU2WFRt?=
 =?utf-8?B?WDVOcFB5cDdVdzdSTDN2N2dxV1dqdnlhOGVYazNqR2VwYjkrZmZiZGRzS3BF?=
 =?utf-8?B?ZndEMnVRYUJjT1V4UGQrME4rd2ppZXlvQjk3aVJCVWxiUS9remdRMDJ0V0hM?=
 =?utf-8?B?ejhlZis1NjBUWG5jT1hFMjFhSHp0SXhNT0luSkJHdzNZTXlLc2h2RklIaFdX?=
 =?utf-8?Q?ndu5HqEnxOyzRixjLNhnodr1+MJkYeq+EbQm1aZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc48c9ae-95b2-4e4b-271b-08d97dce6755
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:39:30.1343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVxl4hIccXeUj0uZ5RptOOBqE1jl9EMKz2Ejxf/yZtYltdG5VGzD0kQF4Kdx3Ihn59eiKSVC6LuwRyhuy/korg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 22.09.2021 15:29, Boris Ostrovsky wrote:
> On 9/22/21 6:17 AM, Jan Beulich wrote:
>> @@ -817,7 +818,7 @@ static long privcmd_ioctl_mmap_resource(
>>  			unsigned int i;
>>  
>>  			for (i = 0; i < num; i++) {
>> -				rc = pfns[i];
>> +				rc = errs[i];
>>  				if (rc < 0)
>>  					break;
> 
> 
> Can the assignment be moved inside the 'if' statement?

I wouldn't mind, albeit it's not the purpose of this change. Plus
generally, when I do such elsewhere, I'm frequently told to better
leave things as separate statements. IOW I'm a little surprised by
the request.

> I am also not sure I understand why we need error array at all. Don't we always look at the first error only? In fact, AFAICS this is the only place where we look at the value.

Well, to look at the first error we need to scan the array to find
one. Indeed we bail from here in once we've found a slot which has
failed.

I guess what you're trying to say is that there's room for
improvement. In which case I might agree, but would want to point
out that doing so would mean removing flexibility from the
underlying function(s) (which may or may not be fine depending on
what existing and future requirements there are). And that would
be for another day, if at all.

Jan


