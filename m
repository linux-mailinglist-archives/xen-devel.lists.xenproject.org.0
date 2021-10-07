Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77816424E37
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 09:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203334.358435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYO3U-0000m5-EO; Thu, 07 Oct 2021 07:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203334.358435; Thu, 07 Oct 2021 07:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYO3U-0000jI-BS; Thu, 07 Oct 2021 07:43:04 +0000
Received: by outflank-mailman (input) for mailman id 203334;
 Thu, 07 Oct 2021 07:43:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYO3S-0000jC-VC
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 07:43:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53b083b4-13fd-41c4-9248-0ab478ec4fa7;
 Thu, 07 Oct 2021 07:43:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-VfpYth00OZaYJCr0HQpDzg-2; Thu, 07 Oct 2021 09:42:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 7 Oct
 2021 07:42:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 07:42:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:20b:92::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 7 Oct 2021 07:42:55 +0000
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
X-Inumbo-ID: 53b083b4-13fd-41c4-9248-0ab478ec4fa7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633592580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3JsOkfgsXjB8nNPf3PZ1+oX1U97jEhGbM+4DNGvB6c=;
	b=Yg4u8+WGyrvWmH21+Yj18+zoikXpDi1WMa15VLWHsql1hyVurdr91fFhjUje8fgZprp7nL
	8n8IZV0NBvv24vIanM4/X8ZeZvpQWX5ivEB3xZj4HeY18tE+PEIcXpNYeRVYslr0+i6W60
	SmVDm+MBK/ZxL0qdzKBAyUPJc04v/PI=
X-MC-Unique: VfpYth00OZaYJCr0HQpDzg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7IRWWgDhM8vsFFoiHmojfB9njI4TSTQcWiyIs8VIeXVnyh4lQLz8CotLQNeutWL8ssv6DixChHdVQq0yPmzhbbbYOVfrGjXhojGM1K7XTCr6sP/TtrAO973Oa1CtvAppWEFcgaVPEH3+qXr+7TSDFRDgnvDdYhn8JGRH0fM3SQ1DwuW21YVkIgA+RqleCosvo8ylmYw/f+k3sanN6db7gf7OfhQ5DiPLRAQpLC+cz6GWRNCTdOxxWsQda2++zAtdEC+DWyHn/oD7i0plVOpq0ZMD2Gv15+pWhnXtxRU92+fwhfIOvjmGot7hVkBajTY1XJ2Fohfdrl2tjgAdCgXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3JsOkfgsXjB8nNPf3PZ1+oX1U97jEhGbM+4DNGvB6c=;
 b=VLkHuDO5gfsVrD13i9tob6W8rjWoaAsLG86tpcg3OMyk+dv9iibr9ZlGFrtzOXS8bWzBbYCZEwHOgJ/XT3CbWr7DYNseTVlNhy/rp7s7EDkOGgj97/V4Pal56WULSoIY+Vv/NZRwNlQwBVy1ZpgF/zHF5iJhA/EwDDf1SL+rDw4fKa3+fGV7gDhSKNFOci0mZMvHUqQqku0p5JGRXonYTsctMKKFElTnB8XNajRp0eI1FkGTEAJAnG8lFIAClPRwKf9XJYv+CaZq51F70WcrrX21dZIbZszdX1yu/6xL09LUCq0xMD2YIvYegwUbIGJJ7fLnbCkbWAjCNRhwRAA7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
Date: Thu, 7 Oct 2021 09:42:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e09360a6-7eff-4b96-92ae-08d9896613e7
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37751A5D93C465D86D686EADB3B19@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QPpE54wClA9JscD4ZH2xivoQohovzoBLG9wus3CcGcdhlmVF4Z4+k4F8EP4wdG5E9pR23mSVOEm5nj8sWtkNa8RNdEj2/ZdRWxC7bAxqZpHAq7V1BHbki28dsubK1j04UVZJ6SOdBlar5xR1KcO3Y6JTm3ezZjiuR7AfT27+79SF+rjkXK4pVWslSjfHtyPirQuGwf+xxwFFD6zklwoy953bJlbYZmOP2ju0f1z7/q8G4Ungm5iBS+DvOBFhQEaWh9sNrHQjBKaYFkCB7oxArTY7cJ+w8Z+qWLnKEKYAQWGHnZafEj25jJAGA9G00Fp6q6UKCQOQsWNrxtM89plMV31Nzk2UJQJ9tqZDVvYEV6uZSBRJUcnt6BGtP+z3zvGqP/sHjLjWN0c6cpOvoAEitjlBr+h7wZxC9tGegoMRte/VFZ/s0fjzNEavuIZRRANe0V5Ap4MbIfrbIqlP1oRPkSebOWh9o5jpuaZHEEsoeD6osHrxcwhWnEVGL5bTD0UoJX9EnSXiBNaEn0GBnYKb5BreO/DBDmLy7ylh8cyKDzrNQQ24t+1292b4YhXvqXCLogbIynU7j7Bj30qaHL3sq2P+AfWJELxfGhXLl4nIWKiI8wIIYyefyFWIlnEqHDgnhGMSpvsV+tExv63gCQ0RxS93ja+23s8hx+Vt/9+oScEsfg2l1/Wp/yrKRVIpY8OevmntKEgRriHU4vgI4olj8xvMlY8MYfBvczAPlmik4+z/r0KZucTleD+uaJACQgDH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(31686004)(2906002)(316002)(38100700002)(36756003)(16576012)(5660300002)(6916009)(66476007)(66946007)(8936002)(8676002)(31696002)(66556008)(186003)(6486002)(2616005)(26005)(54906003)(7416002)(83380400001)(956004)(508600001)(86362001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjNOL0dHZis1Mjd2cTM2SUhBZ0ZTa1piM2ZVOHVzVlV1bnZqRHpVaWZ6eTNt?=
 =?utf-8?B?T0pXb0h4WkJvOXpJRmdVSUpleEsya0ZoMnZCbGZhT0NwMTdBbmJaQVpjRWhR?=
 =?utf-8?B?OThUZlg5eHluVjBacldkOU52a1FzRGI5bzVKaFdwV0Jad1NaWTdmVDJJc21m?=
 =?utf-8?B?TlBiOEwxY0wycnRBcFdWRmFQd2sxczFjU04zSVNFWWp4L0xMUXdnQ1R6YUZO?=
 =?utf-8?B?Tm5OeG8vN2RJaXVhQ0JERHhSaGE3eldWUERDL3l1SzU0WHlZKzdqRjFxSkJV?=
 =?utf-8?B?V1E3WGJPODRTTDdGTTZzcVpjbGwwNTJ4TC9KdVhhREZzZ2FwbDFPZVNTQVhC?=
 =?utf-8?B?emVnd0V4ZnhtU1hJUTBrd2tubGNNbEZYZ2RIRGI1cGczaTh2VFlYTWVQL3Jx?=
 =?utf-8?B?dXV0dmNoWXpxV0xtTDVSTW4xNE5SdkNsNktGZEFacDA0TjduWFVXUHZEbGxB?=
 =?utf-8?B?M2VLeENFd0lRY1hnRXJQN3NDUmI0S2J2eERaWUg5RXBvYUs4VkFKV3lzY09J?=
 =?utf-8?B?RGREdXZxQ3FPTVQ3ZFhxSHdpVG1zMXFGQXlpVEpEdS9MN1QvOVNzU0I5S1F5?=
 =?utf-8?B?NXp2UVVCUDVRdGZKTjM2elJUQXRYbDhKdGlDa3hkRUtCeFJLMVhxUEYzU1ZD?=
 =?utf-8?B?bm1Ec0dlVyswZytuSlgveUdIZWVaOHJRQm1RejREUlJXMis4dnVKclZjckVt?=
 =?utf-8?B?bUplK0llbWtxdFJZbnVVeEV6TklCdXBmdzBOazBsQWdZRlc2alNnV2lQVjkx?=
 =?utf-8?B?M1dLQ0RDNVdwaU9KcDNaUnU4THllbnM3OEYrUGYybVNkVmhzTGVMemVIUEpy?=
 =?utf-8?B?aTk2Q2ZBOTYrbG1mNy9Pd3o5YnFJNXhxMjFpdTkvRThvb2xwS1FleHpKRE5V?=
 =?utf-8?B?bVBPNlI5a2ppbFB0djZJbWsvU2hyOHh5NWVNb1Z5WFF5dWwzUTZnUXFyYTZi?=
 =?utf-8?B?LzRKeFB4bER6K1hieE1mYTFlWlV0ajF0aDBFNitzU0JDTnZuWE5FRWtwMHhH?=
 =?utf-8?B?Nnl2aWRPdG4zbytiY3NxQ3o0S05PbzM5OGxqYTNEMXpxOXkzend1SnlUcHY0?=
 =?utf-8?B?NUpuTVN4T25VdVNJM1M1V1VXbWFqdEFRK2pCVFkvWEdGVDVDWGRBTFVvbCs3?=
 =?utf-8?B?bzJ0bHlxQkdqaHpwZkhkRlBtWjUxL0lUbTJqdFhGL3dGT3Zlek9nbWxHaVFY?=
 =?utf-8?B?bmxUUzI1WUZlWmJqZWhtQjl4QkcrdXcwT1F6cG4wYlg4d2J0WFkrVVRHSDAv?=
 =?utf-8?B?WEt0bzUwRVRqQUVIdFFzbDhmbHAxcytYcm5FbTVJMFJtbmpkTTJkQmpXZVZV?=
 =?utf-8?B?R1hCeVVkZS9DWW8xMEdzM0NVSFZKOUpHUVE2bkJLQS9GTy8yUUdxU20vRUJN?=
 =?utf-8?B?dDNEL3MvYU14bElyZitqbnRLSGJUOTV5WWFwNXBMZGkzdnh6c0RHVU0yVy9h?=
 =?utf-8?B?NTFnQ0FxMUd6bHJ3aXg4QjhNcFhmMHAxK01ENENBUU84YTNUaDBDMXlWTEJo?=
 =?utf-8?B?TUxSMVBlV1lOMjQxRCtTYjVhTmJiZXMvWmUvNGJwUVlEeUt5b0JxcjF2M2RT?=
 =?utf-8?B?WTUzbUtuTEMwVGxzdzlNUS9oSkdRWWlaUUUzY2pkTDN5UDNWdG5acW5vTENJ?=
 =?utf-8?B?Q1lzQ1FxU1YvZmJFOEoraGdoVkFFa2xzc0tOUEo0eFk4R2NvaEtsbG50dm1B?=
 =?utf-8?B?S1FBRkJaV2IwVUNOMDZzc0s5U3c3SC9vTTBFWGVEcHRvc2hCOTd5VVJPYU1q?=
 =?utf-8?Q?2wfHaIXfbcED3cMOmL8YLn2zGVRVLKZZSrx3zfI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09360a6-7eff-4b96-92ae-08d9896613e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 07:42:56.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rlHrOlqVpHCDxQZOXkFx1ZkqvrIZShR44JSKUrtccws1OcdS4z5l7R8gxlnKUVJZk4fJAj10FNjn9liCAVxrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

On 06.10.2021 13:22, Oleksandr Tyshchenko wrote:
> Changes V4 -> V5:
>    - update patch subject and description
>    - drop Michal's R-b
>    - pass gpaddr_bits via createdomain domctl
>      (struct xen_arch_domainconfig)

I'm afraid I can't bring this in line with ...

> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
>       *
>       */
>      uint32_t clock_frequency;
> +    /*
> +     * OUT
> +     * Guest physical address space size
> +     */
> +    uint8_t gpaddr_bits;

... this being an OUT field. Is this really what Andrew had asked for?
I would have expected the entire struct to be IN (and the comment at
the top of the containing struct in public/domctl.h also suggests so,
i.e. your new field renders that comment stale). gic_version being
IN/OUT is already somewhat in conflict ... One of the problems with
_any_ of the fields being OUT is that then it is unclear how the output
is intended to be propagated to consumers other than the entity
creating the domain.

Jan


