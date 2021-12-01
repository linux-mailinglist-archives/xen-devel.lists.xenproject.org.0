Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C220464D51
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235957.409286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msO8e-00014d-Ri; Wed, 01 Dec 2021 11:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235957.409286; Wed, 01 Dec 2021 11:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msO8e-00011a-Mv; Wed, 01 Dec 2021 11:51:04 +0000
Received: by outflank-mailman (input) for mailman id 235957;
 Wed, 01 Dec 2021 11:51:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msO8c-00011U-Vd
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:51:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4b2ba24-529c-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 12:51:01 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-EwzJCuCaN-OlWIN_WC_w8A-1; Wed, 01 Dec 2021 12:51:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 11:50:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:50:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0105.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Wed, 1 Dec 2021 11:50:56 +0000
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
X-Inumbo-ID: f4b2ba24-529c-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638359461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QkhJX3VEPOr0AiKJxzj23PArjaWK3ctCfcJg/W8CWKI=;
	b=F9JnWy8orP6NsgVdw3IGl8U3sGKBwVhjGeuCRh+ttrFj9LtZa2OODV5NRKGjc8Dr9fefbs
	m0R3cUiYHIsKSft52GDC75X+aPInUBUz6w0qgaBfD2ZUNw12/G45XZiStt06Kpd3VVoT17
	tdGqZct/JAJrXk4+FMrmiOs1h1V60uo=
X-MC-Unique: EwzJCuCaN-OlWIN_WC_w8A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiiRpSKFSwxPhVwegdCeGbZymH50J1RfBYlagLKVuErWtZ3APKvQfxSw5MKzEm9yvWfYDm0LOTK691wI7C9FNV5+nhMEou2mI6Sqnf1zrqQL2hMNAUCM6vJwDaNZ3VqVKFXTlqO7heGt+vlWko0yFJInBvIB8+msPe4+p3WtqKraX5qApJ71s7W3PSxHdOdgQVKf+z1fuFile4S0VaP3NI8g4+qg1FIwyEgWD6q6kst6yQRu9ad6JQqNUmdpw+aZHMqUbHTjAviaq6j2sdxCqY6YwJnHf79Gef+oaVemDQGOcMPxUtnqicmzeGqc3moJFXG6EAitp+qBJa5YXcMYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkhJX3VEPOr0AiKJxzj23PArjaWK3ctCfcJg/W8CWKI=;
 b=Gv0JeJ49C9UYj6cO6OdTb8czOh1LdnEKIKSLG2lMux3H6XN/Cv8vK5oWjYzoYHJPoBN/vpaT6SVoV1dzESqL5WR5fmugDqVVxzohqZ+DYip2fKZCzvHMfjZ8uAhI5ZY1kjmiZOchlQLnve+2Ip2kQ53pxhJW0Jqrm3eVqcD48VhedKKriVg5iJrhcIhRdiUfdSC3GA95D3vTZMlVLkV8YOOtuDfarWvKSKqkwhStLx6O9zAYHy0wpEkf9PFywa0GSl/nXd2Jeu97pY/JwZKX+ZEt16c3FBCL5C3cnnXek6MXBkglIwYbiG/XjPzKOes0J7TPeGm1UAw7j4zwmA4EwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e97df2b-85be-013b-a19b-85bc4baa5c4a@suse.com>
Date: Wed, 1 Dec 2021 12:50:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] x86/PoD: move increment of entry count
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <d92ec1b7-6cde-7efc-2c6a-3dc3696b957f@suse.com>
 <5585cbf5-6248-ca6f-8b9e-764dbb08be43@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5585cbf5-6248-ca6f-8b9e-764dbb08be43@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0105.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e003628e-48ab-4917-d087-08d9b4c0d5f9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5598D569F9F8B7759E2505BFB3689@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7FC0izv+pi2dVA/cPRlSiVAi8irF8+c67g8mMVbwE8a9g4nCxAp40WkRnX9HuB6GdPKayANlPoXxbtgGYFI9YzjiHeSh+Te0V+GrqXB2xBJaO51n8UMqpCICpZV3BqvisQSr0S+cnHrdFahFjSJB/nEiWvu1pBOZgZwMPP8F88QGclLNkr9M10xlwJNk3BP8+YkukLj3zHzNmAcoZtJPkvLTFbgmBEbWpRZjmcZD1KhnjziQPIw0duy+Qu4UfJiae57lJS029nymoeuPrE+907b39fktjrLqd45eYRAHEiUOnF6ivh8DsXV4Za4OJdJxIHQB/mRW/OMb+ArAjE2muRiH5gStK5CZSl/trzogxJs8iUXtL5mml0rMQDSIFc9TO/EAyRwozUCWNn2mc1VmPD+RpWO6e0Z+uKHG4kamWMq2pRUJXI7TfHdT/LetVYJWKpFoGKJcG5c3j/osYuNOv7yvhRW92Bozhftp9HlrHRNywj/C3mLhplcX5R8T5q6RrkqTH7kj8FHH3KBdbfdedHga2xlzIfITG+fnaKIs/B8W2waYmYHtHOgubrdaHbSZD7Ep6HAYwiuMWOAqoHB5djHQuFU7AY5Gnv07YKQfjrNs+z0sLJ+Jq2RFQkmkOMpHLsAZD9CxEYDXKqWL4u6W2O/ky08hmPdCMmtYSjRc+guWKeuFE70/8dv1jDua/Iex0f6El8AsMRrMyiv4LyGVw/AyieORA2VNhY4HuKJizgpY+6zOlOdkM5xO+YaXoSdI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(8936002)(8676002)(66946007)(66556008)(31686004)(66476007)(316002)(2906002)(36756003)(53546011)(83380400001)(16576012)(186003)(2616005)(6916009)(86362001)(38100700002)(6486002)(31696002)(4326008)(956004)(5660300002)(508600001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGg0anR2U0JIQUJnY2N0cThuSFdxbmdRV0RiTXhIcmNobHN4cGZvV2RkM2NF?=
 =?utf-8?B?YTJFRzhkRkNqZWdCcWgzN29ndk0xUEJOUjVFMTlEVENrRWU3b2xjQkQwQ09G?=
 =?utf-8?B?cy9ablY4ZEM0M050ZGl3SDVuS3JEY3pBSzJ2Y3dLWU1pbzFvbUptTjhSaHFw?=
 =?utf-8?B?TGwzQVVxSk9kSGFzQVY5R2w0eG1uQ3RWUEVoUFJRaEptekFkc3MyWVEzN01S?=
 =?utf-8?B?Y0RRcytNbkdPVnh2VmhjQm52SDJUeSs2a1Mydi9IZjN3L2JlblhFb1NGcVpa?=
 =?utf-8?B?VmV0Y0VJVnZtSkhkT0dJdk9PKzg5VTlOSVN6bmYvck1iUi9qSnFzb1ZONnM2?=
 =?utf-8?B?VExpb2kwQ2lta2MvRG9LMVZqSkNGald0VmNxbkhtamJZeWVoSGNTaUp0UDg4?=
 =?utf-8?B?aHp6SjAxWDVjQzB0eWs4R2hkeHMyNmk3QXBNRTNMQ3R6YzRMK3hiTlZobU0y?=
 =?utf-8?B?UzB6NmhvbFd4OG1RWHZMdDNCU3VoekRTYVZSNzNqUUxTNFI3U0E0Q2dwQUJR?=
 =?utf-8?B?K1NMOG05M08xRUVoc2dRSWI4UTZQVWJzbFZMWmlnZVRMN0M0UUYrRHpyWWJt?=
 =?utf-8?B?QUo4bU1IbDBISllNREM0K3FyNWdvRWJaOGMvMXMvRVJ4em1DYXZtcy9mM255?=
 =?utf-8?B?RmovbklhaTQ1anJDb2NmRjhMdStBUGFCWVF0R3dOeDFNSVhRaUtrdmV0SldG?=
 =?utf-8?B?dXRySnRUU1A5blFZcUZYSXNLY2l4T242R0tXVkh2S0tocnRDb2pkeHJRNDcv?=
 =?utf-8?B?VDZ1aG9uL1FabnZXQ2VFVmVWeGx6UmhFM0JJNUN5TVp2L0ppajEyT1ZyTU5s?=
 =?utf-8?B?Wm5GU2dsTS9xTXNLK1hVbWFkOHdzZWtqSFFmYyt5VlFBVWNvZG51UVU2TjVs?=
 =?utf-8?B?eUFobUUvakp0UXY3MUY3ZjJqS1ZRUGpKcTc0dXB4SCtFRk1hT0RKYVh1VkQ5?=
 =?utf-8?B?YmZUM3RXZDZZakJFT1R6bCtNUTNrK3BZV3pacHA1Q2ROWjZrM2lWMGhPa3Az?=
 =?utf-8?B?NVVlWXkvTjlwbGliUUQ2M292bW1mZ29NdmhUVWJqL0cvcXZnWHYya3grYXVy?=
 =?utf-8?B?VGhhM3phWWs4VFRMYTRmYTh1YnlQbE1FUlVwdi8vZlNiMlhmeUNGa1ZWSXQ3?=
 =?utf-8?B?QzZGTkNPRDI0YzNSSTc3b2Y2OHJ4R3JYNW9VS1c2Y1JmbHNvczBIRTZPUUtj?=
 =?utf-8?B?Z3dUSENIMTR2N0VrVjZNazhCU0JhSm1qd3k1ZG1NZVByUlFtWSsrbkRCazdW?=
 =?utf-8?B?NXVXR3dVYXNDUWxYZ0lISHdxU3pVLzY2cFJzNC8yeUtFNUsrS2t0MW5wSjdQ?=
 =?utf-8?B?a244enhoSDZEUTdIRDNFWnczeTVaaFptZU1KZlhZMENOUytON3cybE5qMll2?=
 =?utf-8?B?L1lia2hZOVZBTFkxa3Jrcm9pNTBSY0xxUmZVbGpiRnVaZ3dRMkZZMGpFZnpj?=
 =?utf-8?B?WHp4RnZWWlFBWmhLUE04cnM4Z09jVG4zOWlBMm5uZlVyVG41aUpQOTJ0b0Ew?=
 =?utf-8?B?NkhOTU1XS2lDSCtQaUJYS1Eyb2JrRjNTb1c5U2xHanlxSzBienN1akcvdmZa?=
 =?utf-8?B?RE9PdTcvWE01Q1E3aE5yWnR3N01ncUdMR0JnK3VvK0hqSUtWRXo2KzVseGNa?=
 =?utf-8?B?U01LelpJTjlRN3lNdVdBcjYvYjdoUGJON0doWlIwR0NSbEpkSEdycC96L0Fo?=
 =?utf-8?B?akpXczNiVG1hdXFCSEs1QTZJanlSWTY0V2xkZlhDSitENXEvNks0ZWlIcFRT?=
 =?utf-8?B?UGRpVUZNUkdpOTBrRW5DaUh2YjkzbTkrRktha0RnZlNCTFhBZTlzb3BBS0Zn?=
 =?utf-8?B?eXU4VHJmSElUSzBVQVNhU0s3ZEtzdXNwR1dUOEs3QXBvdTF0R0RXUGUwdHpU?=
 =?utf-8?B?NlJJV1lXamQrZ1BoVE5ndHFwcysrTXZrVUZDWHZTMHZvNXNkWGw3WVUwSEtV?=
 =?utf-8?B?SW5uQ1lSUCtYZGNlT1Nqd0Q0YVkrTzFLMm5LSmdXeTB0QXRRS1hlbDZvRjRV?=
 =?utf-8?B?Yy9TN1N3OVl0aHpSLzVkaW9BWU5xS1ZiMklkM2hOaHNlMUI0TjRacDVKTjNM?=
 =?utf-8?B?ZFZiR09wOVd3V2MzZ3hXeHhoUWVaQ0liaFlnQnBBUTl1b0hrWmJ0anFnOGJF?=
 =?utf-8?B?KzlZQXp0SU5mZDUzbmRmdlh5Tm5JYnpiQTYvb3ZOY3F0eDZqNHB1azd4NHFX?=
 =?utf-8?Q?Q7JfabvQKGmUeOw5RpbKhzM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e003628e-48ab-4917-d087-08d9b4c0d5f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:50:56.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVaR3mas536udZGDkWnf/D5MrhiqDPsl+dcQ1P70iO/d3lntvH6c7UySZu/0r7NCaoH9IpHErqDXNB1MSsdSYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

On 01.12.2021 12:27, Andrew Cooper wrote:
> On 01/12/2021 11:02, Jan Beulich wrote:
>> When not holding the PoD lock across the entire region covering P2M
>> update and stats update, the entry count should indicate too large a
>> value in preference to a too small one, to avoid functions bailing early
>> when they find the count is zero. Hence increments should happen ahead
>> of P2M updates, while decrements should happen only after. Deal with the
>> one place where this hasn't been the case yet.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -1345,19 +1345,15 @@ mark_populate_on_demand(struct domain *d
>>          }
>>      }
>>  
>> +    pod_lock(p2m);
>> +    p2m->pod.entry_count += (1UL << order) - pod_count;
>> +    pod_unlock(p2m);
>> +
>>      /* Now, actually do the two-way mapping */
>>      rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
>>                         p2m_populate_on_demand, p2m->default_access);
>>      if ( rc == 0 )
>> -    {
>> -        pod_lock(p2m);
>> -        p2m->pod.entry_count += 1UL << order;
>> -        p2m->pod.entry_count -= pod_count;
>> -        BUG_ON(p2m->pod.entry_count < 0);
>> -        pod_unlock(p2m);
>> -
>>          ioreq_request_mapcache_invalidate(d);
>> -    }
>>      else if ( order )
>>      {
>>          /*
>> @@ -1369,6 +1365,13 @@ mark_populate_on_demand(struct domain *d
>>                 d, gfn_l, order, rc);
>>          domain_crash(d);
>>      }
>> +    else if ( !pod_count )
>> +    {
>> +        pod_lock(p2m);
>> +        BUG_ON(!p2m->pod.entry_count);
>> +        --p2m->pod.entry_count;
>> +        pod_unlock(p2m);
>> +    }
>>  
>>  out:
>>      gfn_unlock(p2m, gfn, order);
> 
> This email appears to contain the same patch twice, presumably split at
> this point.

Urgh - no idea how this has happened.

> Which one should be reviewed?

Just everything up from here. Or let me simply resend.

Jan


