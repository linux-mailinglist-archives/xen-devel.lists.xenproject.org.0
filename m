Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD23540F8E1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 15:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189392.339069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDe0-00028S-8F; Fri, 17 Sep 2021 13:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189392.339069; Fri, 17 Sep 2021 13:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDe0-00025n-3k; Fri, 17 Sep 2021 13:11:08 +0000
Received: by outflank-mailman (input) for mailman id 189392;
 Fri, 17 Sep 2021 13:11:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRDdy-00025h-7c
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 13:11:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc783ba0-7ac3-4c65-8898-406d379d9fe5;
 Fri, 17 Sep 2021 13:11:05 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-RnlRYklbPTiK5mn8xVy6CQ-1; Fri, 17 Sep 2021 15:11:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 13:11:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 13:11:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0008.eurprd01.prod.exchangelabs.com (2603:10a6:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Fri, 17 Sep 2021 13:11:01 +0000
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
X-Inumbo-ID: cc783ba0-7ac3-4c65-8898-406d379d9fe5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631884264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LghKfE4iKbQSz30plE0IC+HIWMwQiUkQ5z32wjJKUwk=;
	b=XexzhsAfZRbHEDa5gtIg7q+tApXXlFOGhDHD2IqMiAziYKp1yr4Rl0sc1SBY51I5p1PUPf
	JX/N3zkPHPdLzCZM09DGZY1nr65RU+d3/uKyXm1SrYn7ox0GQoOgPuflSUWxhRj7ByY7mm
	ZVHvapuIXRWm9UKfO9mK30rcpRwIj+c=
X-MC-Unique: RnlRYklbPTiK5mn8xVy6CQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOSvcZzm1ydMu/yr3p0KgpwKAXNKJe6vPWFTGvSLGBIooflk3rS9gUg/EMxOT8f6F5KK/LOmMXQHefNHOuK6sySvAr37VNDY46epdvhGCLkRyH+FNjomtoS3Y2FwlLZTUM6sJEeX4GcoeDwwQj8ocMYnRTSG0kJGlRpLdkkwh1nAb06qCz8eY0Wfb/4HFKYY+9nm1/CLQrjRLuC+7wO9b1aXP02VsEDt9oMiZpzMkYr3pe6bDlcXTCHEpscKctPkrzPokrr8+uCwmtTs5oj8cN2HrALI5/R1BtIAgSNNfzyg7+VYCVxsGLkS2BlpZdynxAmGOmA2yt+WntQN7/sWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LghKfE4iKbQSz30plE0IC+HIWMwQiUkQ5z32wjJKUwk=;
 b=TBfS5CetIYaks+9NjvKN7lfBiwAM51u2bcL1XErNIel5k8n7sNJra6yVpheO9y9sJFZBNBwxVM3WlGS3/SbFsttjOxUziSFzmCZn5ZLxx+wttgD2oIsAXsZC0ywI290UNSR93YomweTNyyd0A91WLrb0eDG+aElcCW0bdWrYaBWfeHmPt8DZnRBiRCUDUYGx2wFXwLsuRqNPhuuHN3JV7Wj8r9olDj4NzmtEx4dgiYxM6Aov7VnVv8Nyqrad3SCa4PwsLiuVYt1goWmL+5eXrk5qhNsCuZ7XHwLx5Z9UQLlZr/2tRYbzzFkuXp0WFkSec01K6AzFoSuJ1f0BPWWksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/6] xen/credit2: Remove tail padding from TRC_CSCHED2_*
 records
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66d0cd95-a9db-05ca-3a4c-b728a2f5cdbd@suse.com>
Date: Fri, 17 Sep 2021 15:10:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210917084559.22673-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ca824bb-762a-480d-546e-08d979dc98ee
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5904BDD45405A7B3C6AD9825B3DD9@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qkx58pfvYwNcaGkjKMQN64Dw40pHERASKNKXQ7eejmlS8F++IJY3i38wjXzl1mDPpVRvHV73PvB6uklDfnPCFd+WzM8odRDlPtJNikZRWjqe3nrwZOXYkosGZ9i4llj7twyQ0po3wy7lSh4sYdJkU2H4fdVLlwe9EEyn1CExpff0c0wmEhZjRfzRWU1oWhv8Sr4OAJfS6JzsuM7HSdzefaUr256FYxleorPs6x2NQI+OWqPiS97zn8/vXPWRfe1Cer/tiuEhkiXge7kjo8E4VWlm5f0yrHy/5K9qUXJH3eilbmmZjKc2wvDZUF/Jy5FqIK7eXiZAK4yCGl9C4Z/SK5QXum/DQrKMcO+n/oFEHC99OuPB7PtZm4pNBg+ezuquUoc+yaPFywd9bnEvI7QrugKPheOCjVhnQnxtFoCU9jCbPrUNbfZo3bQorgjCx38oG/Iu22PRVLM/UvCpvd3VUeoAEhTP6P21DWsSP6ZXjxvU5DWzp1gu/qK+A/VxuL6ZzyQWDbCR8VSd9bvmCND0W3Q7n7RD7oZc4uflq8e+cWA4x8bnvvw02wjrRUvwkkjHJQmb7Aph8oF8TNw6kbB9xWZSNm6TpPSB2rOTeSGbXMWnlYUnNKmW6A85tCLajpz+LGBy9sZ+YE3p5esJq/bIA25KoIOVNchC9e0c9fHnzQenNkehFR6hrKGfrLcxET6N1iUfLVUSVri7mrQNFmUNNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6486002)(66946007)(38100700002)(66556008)(54906003)(508600001)(6916009)(5660300002)(26005)(86362001)(66476007)(31696002)(16576012)(53546011)(8676002)(31686004)(36756003)(316002)(4326008)(8936002)(2906002)(4744005)(2616005)(956004)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUVKRkJ6YU1NRkUxUitUQnk4ekxDbmFNM0dDN2xNRDV6bW0xd1pjbFc0QWNV?=
 =?utf-8?B?T1hwK3JTcVgrUHV6L0FOeUsyNEUwSGR4aEVWSVRXK1dYNVNLMkdhSEQ3Y0NE?=
 =?utf-8?B?OUtjSmRDY0lWbUU2RWZOVXEvRDV5OTF5YXpPUVFjYkhOYVZuVTVmNlNwUjg5?=
 =?utf-8?B?UUVNN1FIbXlvYWZDM3RxNUhacjJqbTI5aDFPNmN1TFgvT1hVUS9HSzlVSEo4?=
 =?utf-8?B?R3lGdlpTV2EvV3pHUHB6MDJvTERMUVphMnBWZ2d4ak04TEpoWVloK2k2V1hw?=
 =?utf-8?B?d0RocGhXSTFQaG9pRTBKU1RIaGJ4cklYK1dNcEtMZ0wyVTZqV1N1RU94aWJs?=
 =?utf-8?B?ZWpUSXRPTEN4M0ZCRGNHVS83T05tNEFCVDU4aGZGemFZNFNXVitEK0FVTmFY?=
 =?utf-8?B?dEdncWdBeDd5eEIzTHEyOGw1NXpuUnViQ3Jra0FwMnpDcVY2M29SRHNrUWY1?=
 =?utf-8?B?eTl1dGtyZnhTZ0EvYlljR3pGTVcxZGVhQ3NhU1lqelBrMVcrYm9KMU9XNG14?=
 =?utf-8?B?MzlIVVBNcG1oTmp1Q3A4eGFQbXVyVjJTNHNBcG54UTBKZ0VlVWpqRHRNOTE3?=
 =?utf-8?B?bm9UN0FHUWNRdEFaRkQ3K21lQU10dngwTnpjNG1SN1Zuc0R4alZUcGNkNmhI?=
 =?utf-8?B?WkFSSldWQldGTm1ORW1vWW9HSXRVSFVjTStpNUZJbURkTVpwZkxnQUVQUTlG?=
 =?utf-8?B?THppa0pRdWlma3ZxL3pZMmUwcnAvNGlFakY3VzNad3ZNbE8zVzNjVGtnNk5Q?=
 =?utf-8?B?ckRhNXo0NHpXZm5NQTVXK0puNmRsS3ZXTzYwaEJsdWlKcnIvdW9LamNscVJq?=
 =?utf-8?B?OFlSVHljcytxQW04cklhenF3RXFlOVU1d2d3dmgydjRKMXA0VlNmQitkWEVu?=
 =?utf-8?B?YXQyWEJnNElIeVFlY29USUxGaFkwS3FmY3NaOTI5U1BIY21KZVd4L2U1dWtm?=
 =?utf-8?B?TUY0TC9hM1BwWDdBdEFtc1V1VFd1WDBscTVIckxmTXlVTEpWUFhlRlgrbm44?=
 =?utf-8?B?UHVqd3hyZ013eUZWdUM0eTVGTWNGUGJ6bDNkbjNWbDBuVnI3NVBiNVdKcEl1?=
 =?utf-8?B?S0c4OG0yQTV5YUlsM3NMSjMwTmpFK3BEbUZGcDE3a3JmWHQrakpUOUNWdDhm?=
 =?utf-8?B?NW5BUERjQ0JCUG80endjc1pheW0xNm9mMUVtRVhLdzM2Tm1ndFRTby9zN0lH?=
 =?utf-8?B?RFo5cXVtcHp1a1RqUk14d3NjR2lkQkRzTi9mQlhvNjB6cFVVQzJnTUNHa0tQ?=
 =?utf-8?B?bkF3QTNFd0FlRjc1MWpMKzB0ZnZQL3F5YnhpaStIaFVLb3EzQ1h1TDRzYVNR?=
 =?utf-8?B?VE4xTXY2Y0M2ek9TK1pzeUlHc1lNQ0Z1b2d3RFpDclhoSW13QXpOc2hXejla?=
 =?utf-8?B?bnJZdDhEaTRwclA5ZXJxVllPZ1pEM3NpV25hc004V2M2RS9VVmNmYXdGVDk0?=
 =?utf-8?B?QzN1VDhHdStucS9FQjlhTjJnNFVPSzF3ZzRYZG1qQzZtems3QUJMcG8xM043?=
 =?utf-8?B?N1gvQ0kwVVphNG1tSTZ6aUNzQXhQOENoWHdlSG1FQkw3V1cwT2ZNWHk3Q1NG?=
 =?utf-8?B?dEN1ZDNVdVdpbGw2ekRONlEvaHdOc3lvS01UMUttNzhkdlpPTU8yR0RWc1pL?=
 =?utf-8?B?T2U3TWdrVU5zbmswRGxvc1pubG52NXJ2YmszbUIyZTlBdzZ2bnYyZ1gyTVRB?=
 =?utf-8?B?MkxuYmpCaEVNNXZLc0RZOU5XMjhJNE9aMm52YmE1WHF3bHp5SnFHVGo0dEdy?=
 =?utf-8?Q?hcPPy7Op/5LMYdCcAU/SVRUqmeVea3EG8x1hX+y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca824bb-762a-480d-546e-08d979dc98ee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 13:11:01.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KV80HJv51nLnVJaDrz/GuB3FrTcDavZKi8Zd7J4XR/k6EcbOOScRC9OqmaYrCgsF/ruxE2oMVinljy+F3dDrCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 17.09.2021 10:45, Andrew Cooper wrote:
> @@ -1336,13 +1338,16 @@ update_runq_load(const struct scheduler *ops,
>      {
>          struct {
>              uint64_t rq_avgload, b_avgload;
> -            unsigned rq_load:16, rq_id:8, shift:8;
> -        } d;
> -        d.rq_id = rqd->id;
> -        d.rq_load = rqd->load;
> -        d.rq_avgload = rqd->avgload;
> -        d.b_avgload = rqd->b_avgload;
> -        d.shift = P;
> +            uint16_t rq_load; uint8_t rq_id, shift;

Split into two lines? Preferably with this adjustment
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'd like to note that the remaining uses of "unsigned int" or plain
"int" in some of the instances you don't touch assume
sizeof(int) == 32, while generally we assume only sizeof(int) >= 32.
This is one of the cases where fixed width types are imo mandatory
to use.

Jan


