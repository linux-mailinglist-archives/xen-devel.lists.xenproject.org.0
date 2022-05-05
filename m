Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94E551B94D
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321603.542640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmW5n-0003LC-0j; Thu, 05 May 2022 07:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321603.542640; Thu, 05 May 2022 07:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmW5m-0003IO-Tm; Thu, 05 May 2022 07:40:06 +0000
Received: by outflank-mailman (input) for mailman id 321603;
 Thu, 05 May 2022 07:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmW5m-0003Dy-7v
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 07:40:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 945e5456-cc46-11ec-a406-831a346695d4;
 Thu, 05 May 2022 09:40:05 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-Rh5dMx_GMeu22Q4vILKvKw-1; Thu, 05 May 2022 09:40:04 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB3497.eurprd04.prod.outlook.com (2603:10a6:7:83::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 07:40:01 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 07:40:01 +0000
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
X-Inumbo-ID: 945e5456-cc46-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651736405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZzN6p7dLMk3EaNILW4pfgpF1pgIj4xwgfqJW0MG00w=;
	b=n5aVdAOL8FZBBASbepX5uwtDVle2k8gNtPg/FHV1g177fmKE6No8Tk+U7EtkGxqCN4vsbh
	fd2YsLQlE+25x8M7lBpVUL+C0tp2/iJv9P6xYj6vzkPxfaA0WBjdz6j1HS0N0AT+NAD7yh
	EqydcYgjbkIYX2YjYlCu8YMT0Z9hyS4=
X-MC-Unique: Rh5dMx_GMeu22Q4vILKvKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWzaVfgcQov13q873OUbW8rmfQmtfa517q9cHy17koAHFmL4C36i2LXIjVdCTNZaLX3yeN1GzVT2x+RBkUbT+YFgVWx1Z92/T7acg0hyihPrZeFjFN2sfevsU6msI8DNU1+FlTbrVa76SFymVrv0pM03cA9DotUvYMV3UfMkwhz06Dl2EtDV9VkOdNs1b1iRG0WIR9fEh/2/q/mMSzMYXqewjptaOQBds6zgtgus2bsvbiXAds9alpot5YgLbQ/WApUPvBZMs9XvlBW7JeHRHv1WpqvefCoJEf5RjCLyOU0dO9gZK7t1nxEP0Rb7fxXPNIaK58wh8w//hT/IJ+2ZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZzN6p7dLMk3EaNILW4pfgpF1pgIj4xwgfqJW0MG00w=;
 b=AQG3ZCLe9acNI1JwFfCEUqzLXLoJrafROxvaXKmvyYRWyBdIz6x4dekPKu17E7U328387w0hz3e+7O4SZrQOb5OOOf9hekxfYzkfArb2TkpZB/iievBG3h78BS00wV/SwzNQBuENHBE5n5PqWC9RsQ9LCJPAKnZ3L0NaqBEqbwYqSgNbgkONTGLRcZ0T8xzXJwPOvdbRfFaFrn4DUs18RhdiCJ3b4M5kT0I62ubfLH7l9F9p/1KzXhVyMG9vcWByR3xp5l0fun1E/EMS0AMbT3T3riJAzL3Dz6KJ47xO9g1VGf+agfLDUer/vcN6oaOp+mpnkMFyHaq+XI9dEj9NqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd60511c-6636-b55f-a700-95074c54ee9b@suse.com>
Date: Thu, 5 May 2022 09:40:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220505025407.919988-1-Henry.Wang@arm.com>
 <20220505025407.919988-3-Henry.Wang@arm.com>
 <89fa76cc-2fa0-5ec3-64d7-d83407b8a495@suse.com>
 <AS8PR08MB7991FFBD4D8106A60372F53F92C29@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991FFBD4D8106A60372F53F92C29@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0086.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88db32af-bb50-4ee6-089c-08da2e6a7647
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3497:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3497B7D46EF24732C30FC9E9B3C29@HE1PR0402MB3497.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MDIWlL9CiqLu4xQm1UwkH7Sz5D5QG5IQY0IocSlZBTrcLGjInsjms7fG0zdoxBcgAfw7tNvq+ig5ZTwW7uxknk0wc/pa7p9IKm7xVwKRB+YxOqwbJZB4Q8GgnxtRyMrTwJVGHOcIw8wZz0F+ufk2qxlAmSlDNPB48COV9q12iA2ZlzHEqHoPPL4jD2apJceDO4avheRTRylFYb4Qpla0UYITDUSq1lfOWq876UT8bsLTR/+enENeWfRS9HTXbjeBObXMh175+QNZDPQLEkpyXmJiLwqPV19EwDg4wyUiZbIOl1B8nHnDQfX8xai8A8XJM6ueBcMBFEEkeOHx73K67JJeq1hIID3FKCYJ4b3vd0itwL0EJJmkfgSqAJnaV1JjvAiSevjqsYAw+yLIGG2MTksO//FULh5vm/3qVr84EbUVEN/n6MR8LPM/MIL8d/c/cjrEJ8ASUDmkvZHJnwUWTDnOofG2r7KF57EoAsE/ABmmx0yzzonXmpKPB2bNjzkUluBUYmrU0o3BFOvJH/BsEryNRNbReGka5Kce5YvJSl51DvCYTy3+SQoa9mT/JVy60JDaXrZ9nync3FChKXU0JSk/BDaAH9kq164EotZSDYjHD9YCWFc0/JPka/FSGnwT0R4E8xfRwkBQotypaKEARMtxdNoo2be69BMhsj9oTCvqYlNfAFeFCbvPP7e6yv7OQ2ry8sLC0vz73NAPj5RaY/hUHaG5d5oe1n94H3m5AS96xxZNweMPfmdP/7j4WoLg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(316002)(6916009)(508600001)(53546011)(6506007)(26005)(83380400001)(86362001)(5660300002)(31696002)(6512007)(186003)(2616005)(36756003)(31686004)(8936002)(38100700002)(2906002)(8676002)(4326008)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aENMaXAwZmtHZlJJVzNFNmlHSFRPTVkyZlppaWpCSXp5eGRJRS9TRUlDSnJ0?=
 =?utf-8?B?OGo4Tkc0clNVdGxRUXFFQkZ1SkFOcjJ3NGd5YXFxYXRXREFrOTE4bHBvZU5j?=
 =?utf-8?B?OC8rUVRObTNTcGFTZkJMUGlSVVFWNlNnQVhPNThIeUdaK1RxQXFTM3d1U0l3?=
 =?utf-8?B?SnBXYkxxb285dU1KWFZXTEV0ZTFzNlJibFdSZE91dTl2UUhSZmhoYmowaFpU?=
 =?utf-8?B?bHFNQkFVWTMxeDVSQnA1MmRMckFHQnVZUVhrc0tUTXBZTmZHanQ3d2pNb2J5?=
 =?utf-8?B?ZVdibGZvcHpBRFp5NmZyYzJMM0NNY0h5dmd6NGVqOFYxUUc2RDdURzYrOEpt?=
 =?utf-8?B?cXJvVmVyNXdPRXFOUnBtSGhQUVFCR1gvUjhMc1pUL1dJaFVlSzhJMkh6QkJO?=
 =?utf-8?B?RnEwQkMrSXJWSUhlZXVZV1UzMGY0L2NSU2FiREQ0aUNJNmZUZmJYRjhMVTQ4?=
 =?utf-8?B?TDF4RGt1UkY0MFhBOHBjVEY2OXJOUnBNdEFHYjM5cm5Ga1NrekNiOHdsdDh2?=
 =?utf-8?B?YlZsZUdFL1p1ZDBlTVhEdVR0dmhUS1dRWDRJVWFqNkI2TTZTMjZnU1Jlemli?=
 =?utf-8?B?WForYnMxRHVOSmhiYW02RkMxWTkzejZmWTZ6V2s3SjZvajJ1ZUVHYkROa1E3?=
 =?utf-8?B?ZkdRYmtYTUhQYUh4U3lNSWU5M1JsaFZyNnFVd0dCNWo0amMybXZQYndwZmtP?=
 =?utf-8?B?Tis2RjNSYzJXcW04Rk5FRWt4QkJZRCtLTG05eXJjQ3I2OHl3N1p2WjM5R0I2?=
 =?utf-8?B?d2lNL0hkZW1WZ1REL0VFdkFkdEZyOWo4MXhmYzBpQ2R4RkEvZUxLSWQwTWZZ?=
 =?utf-8?B?cWZva3pXNTVqajB6aDU3bGRSek9mbTRHTFNLWnhpV1hPMnFBS05ha2dpcEsv?=
 =?utf-8?B?NHEvMitRRGpEL3FTeFRLWTRCNkk3VjdyN3UrY3k5Z3BIQVozMTF1Y25xQ1VX?=
 =?utf-8?B?MGlvLzVpbFJnVXQzUEZTK2RnS09vNEd3K1pCbHU1OHFVYi9jZmM1MG1lREMr?=
 =?utf-8?B?SUlHaytzb0ZCSnpKa1hsMnppQWhoY282cDVXSUFNWDZOMlorVHpjMVZkYVBp?=
 =?utf-8?B?V3JGNEhqQ2pvdTNxQWYzUnh6Umw1bFZEZy9VMzR3a0JuTE1jZXNSQ2t5NjJ5?=
 =?utf-8?B?L2RDMUxnS2h5Wmpnd29hQW40Q2tybFpyRlhvcmROSWlibnpDOURHL0c2MGhq?=
 =?utf-8?B?NFM3YkhKbU8vVEtNcGdhbVFFYnNLR3VsV3BtdjZiOHBORXcvdlJvUUpFM0FB?=
 =?utf-8?B?MlVUVHVkWGxya2VnUllFcW94QXZVRkVhTlppdm9rZnBxcmdMTnJsZnFYUExZ?=
 =?utf-8?B?TGJtM0UzT3c2eG9ZTnZBMzdkYzVCUWEvR2JUWkNuN3FUb1Nwbm9hMWk3RnBo?=
 =?utf-8?B?elJWcGpVTzhGQXVFUVlxeHdPQXFicjYyY1lTUVNhajBlYStiN2xFQ29HZWZk?=
 =?utf-8?B?b3pmc2pXc3FUYTA3dlpNcHN0OHZhU1ZlYnorTUcyM2dDN2ZIYzhsY3dKZGdw?=
 =?utf-8?B?VXBDN01JZWNhb3plc2FpM1dWUjdrNnlUaUc4bHIrMmhpUzB3Q2R2N0lZUi9J?=
 =?utf-8?B?TkxSaGNKdG9lZUdFRDM4Q0xBQi9tM0NjVVpKTXkxRXRuNFJpcFNhWGlUYzJi?=
 =?utf-8?B?VVg3cjRIY0s2bmZxOUtPOGZPa3V1dndZRVhJSnV4YWhBT3FqL3JZdTF0VVVx?=
 =?utf-8?B?dks3Q0RWanRTUmdKSkpQRU5SRm1uYUNjU09OUEJXNjYzSmxUbGhZYXMvRUtm?=
 =?utf-8?B?d0Yxb2NBMWI4eEYrdURuOGtMZXRwQkEyRURBNEVXYVoyUkNPaCtBTGhBdEx2?=
 =?utf-8?B?eWJ2Z3l0ZHZZWEI3clYrM0ZFUytSMUliUXFnai9DQXYwZlV0WmFEM1JnK1Mw?=
 =?utf-8?B?YnlTK294KytNQ1J5RCszakVuZVE2ZDhMWENVblVsN1hvTjJBTzlhekxHY2gr?=
 =?utf-8?B?RDBYRkFFMUY1QmQ5dnc5cXNXcGl2WE9rNHN4K0ZkSnN4SXR5dWVvVVU1a3la?=
 =?utf-8?B?UWUrVktRTFhLZzJJbjBldTZXVEthVFpwSjNmdWVYemhyUHhtQU90RWpmS2xH?=
 =?utf-8?B?Mkd3ODdPZ2U3MnM1Mk1XV3JYSzFHWTVDSENSbXVnWlNZOXE3TDh1Q0g3MTlo?=
 =?utf-8?B?QlIvM2x2VnRYQ2ZwY1R1NE9FeXNDWWNJSG5GT2FuTUpTV3JOUHZhbHVrQUhL?=
 =?utf-8?B?VE1hbG1SVU1GQlpqWlNhaWFqZTRzc0dXcEpXU2JPOUU3a3A1WDh4bE1mNGo1?=
 =?utf-8?B?NG0rV0ZXRCtiM1BSN2NwTlRldFl5N1dGWVBNWUZEbXZabHdkbTU5RU1NYmhy?=
 =?utf-8?B?cWVkeTNvR3RWUnRaSG1PeU9UNGNJU2VJNzRSVUNLTWNSOE9XUEVCQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88db32af-bb50-4ee6-089c-08da2e6a7647
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 07:40:01.4780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6isiS/dvwkrk2NDQQDvputfTGN1/u16nIJqpuo8vxnRDNTS4EKy5pl56kXiARxc/79xTZgjRVZPZJKrtxLi1hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3497

On 05.05.2022 09:26, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>> Change-Id: Ia463d2241e80e8a78d7dbb5b2318694d3ca5ed67
>>
>> Just two formal remarks for starters: What's this last tag? And why am
>> I on the To: list of this patch, when ...
> 
> I forgot to remove the Change-Id before sending the patch, sorry about that.
> This will be removed in v2.
> 
>>
>>> ---
>>>  xen/common/page_alloc.c   | 7 -------
>>>  xen/common/xmalloc_tlsf.c | 2 +-
>>>  xen/include/xen/irq.h     | 7 +++++++
>>>  3 files changed, 8 insertions(+), 8 deletions(-)
>>
>> ... with this diffstat you should instead have _Cc_-ed REST maintainers?
> 
> I think this is because by switching to add-maintainers.pl I didn't change
> my git send-email command line where originally it has a --suppress-cc=all.
> Since you are the maintainer of common code I thought I should directly
> "To" you.

I'm sorry, but no: For one I am not "the" maintainer, but one of several.
And then patches are generally only sent _To_ the list, with _Cc_ to
maintainers.

Jan


