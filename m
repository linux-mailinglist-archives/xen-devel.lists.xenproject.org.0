Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD154111CE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 11:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190434.340254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFOr-00058t-RY; Mon, 20 Sep 2021 09:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190434.340254; Mon, 20 Sep 2021 09:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFOr-000561-Nc; Mon, 20 Sep 2021 09:15:45 +0000
Received: by outflank-mailman (input) for mailman id 190434;
 Mon, 20 Sep 2021 09:15:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSFOq-00055v-GS
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 09:15:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a86fd60d-74d2-4988-9074-2bb758e988fb;
 Mon, 20 Sep 2021 09:15:43 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-FPKw79hJN7yRL4Ww8yZr4g-2; Mon, 20 Sep 2021 11:15:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 20 Sep
 2021 09:15:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 09:15:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Mon, 20 Sep 2021 09:15:38 +0000
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
X-Inumbo-ID: a86fd60d-74d2-4988-9074-2bb758e988fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632129342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxRie8cOTZnfkAjp5xIlxvn2twoJsUwQCtRW9MmLH7I=;
	b=CxYbY1BI+LdzuuuEc67Ao1Xj1AAKUjpTn04ftBOMYOEg+iMNQvKDTQrA9lX4Puel8LtJHX
	nRRFdndedebQbaKecLaxHPALvx6U2BWzwSNlREQtIVio1kijbhxgqeiCi8PQIJsXWxMjyG
	ja5NRXatNpmNQX1k9/4Lv0J/QWFUXio=
X-MC-Unique: FPKw79hJN7yRL4Ww8yZr4g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/+utKpuaDOaB9Mw+McKaI5p2gltbtk68AV2/9w1HPHSSn4iHqWRpDmnGGw7wMXs2UAmMj500pwI5QkF8VRGJazMXb+rej7LkOyqntWb/5J/cfb6/RCk21NBNnUwu8KPZmoTJuAR6no3Vr96GvxMeiJgf94KnxFxF3s0YLHTz792RjHvBhRu7GAnq5djUb3MclSbSPCAkxWDp5ZoGsWe/3teEU5q9tSgZgcfWMvGKVD91XYj7L2hSMdJAcbxVD1dVeHo3N0lH/3YZ8fhVTF7HUgc1NtMwYuWJzKk9hKc/v7tKJwAawTz3r2CJ830l2UqYk0L3HJCHolmrHq1sBLScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VxRie8cOTZnfkAjp5xIlxvn2twoJsUwQCtRW9MmLH7I=;
 b=E0bojPRTyMEZnaN9VePzip4dJM1Toq3tb4CuFf4aXkqC6LdEIgKG+eyec50zSVJtR3rbKaJM7oB/xcnPrUIfjDPh8e4AsJK95eTLKLn7ncwAvrUVVnFAi9I8Ylbl00oCg1ogDvDq4Ry13PFkTDNfL/vH87W7hK6+GaGkkEFaLd7W8dx4FPRgO3/25cCIxfcvac+nWQ3366vg9OL96fqdl20ZDySFxPcopKzq2+XD9MLgguEUqcu4aA+Lrqnr73sUIVEenmj0NE8jQF2wZ5b+6dNl7lTTX6O8oqm0a3PXyIqNJmngiGnvIyORBnTsezzw/2jomkxwZvwSP/woBTKlug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 6/6] xen/trace: Minor code cleanup
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b3bc06a-43a3-06b2-e109-bcbbb46ef087@suse.com>
Date: Mon, 20 Sep 2021 11:15:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210917084559.22673-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e73940f-b776-42ca-c7f3-08d97c173641
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606D44BE435F26CE080EB24B3A09@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DsKOZn0gZhtOB/V89Nr/e/jgLaZIiuN0vYqgN78PG27jv3+vUf71rxvLOLmL7xFBw0BhNPTemU5LtvGmKgZw7GAott6Y6lSTOq++jgHf3QIDCbJYWQT1smFowKeIERQrk0f38fSEf1RimbLwjcIU0xzXMZgpcjf+l7H8lc6yfaAcyd+ySRM+T7xXa/m7PS4D5QMr2o7Q2DHkZceRfpxWJIfMOES8M6qyBV8uIXndlafI77mNiJYRZwvjfryYtxC3O7oxeN5aaJxY8KTEubTekVAfmuI/8+gWoYpxTBOp5N21VVQT8K3NWF4HDsaoYeyzVj9J1aGi1OK9oQJnwx24EZmvnPP5zKep5xrAyaxUIqiq4Wx7TD87ArH+79cx2dWhCm2zhQiWeGtqc7tefTIlQ8Q7JPQYjc80U8tmdtwys6nuU66g5g7IFYXaDYLFI1IqbtP14T2BMVnWg8QgyXQdSXpuvV6zwv1FaHWbV7zo4h3zcOn43fetyv20//xD4lYIRrYlzdJ4MAAjPv4lFsCw7YWkgMJO8JhURBKMw6mMgQbkZL9sh9lRU5arLUptGVsjt4kD19b+ZYzPS7YIQsBp0QYq27/VDZ77/bEla45r1G6vqwWJOq2pDBnnSLualpdXciyYAHAMLCh1Ffdu6XbzAgamZW8vOJnIiPAsP6t2n5jHoJMK7RYX/GaeS5kXegm/xB+7BJKLs9hye7jsc4AM16QEauRrFg1wsQJjT+oF5Ak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(31696002)(4744005)(2616005)(4326008)(66476007)(83380400001)(316002)(66556008)(508600001)(53546011)(186003)(26005)(956004)(86362001)(54906003)(8676002)(5660300002)(16576012)(8936002)(31686004)(66946007)(6916009)(6486002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHdoTVVTaUZieFF3Z1hWRWpLbFNQRlc4RzZmZGlhbWpidWRHOFVTK0RiK3Jv?=
 =?utf-8?B?SVhpZnpER2hUd2JQU3E0RkhOZWhmeFFva1lRcVhXOE1sd3J0Z2lNN3NCU1lh?=
 =?utf-8?B?Wis0Nk5PRzVSV3U5bTlPSmJGQ0hsNTVpanRSYTUxb1hSdWdoejhKL1dNZ3cz?=
 =?utf-8?B?R1hrQzZTQ0dxT2srNDMvNnA0Rkt2VmhQcy9mQ0U5ZUF2WU9vWlpnU1hGTE9v?=
 =?utf-8?B?NnA4cmdXdU5NQm1uOHprQllNMklNanp3ckdsV01uVHIyZFlJcDlMemJ0QzhR?=
 =?utf-8?B?MTVPdkRUQXNUU3A5UTFJS0xSRFZaS1lMVWV3UGVRV1didnk5OVVSbUlDZUho?=
 =?utf-8?B?MEVueEJySWo3OFBRd0hJK1dmQmhWczQ0b0pnMWNSMDhMM3AwcFRiYW4yNTIz?=
 =?utf-8?B?dUJjbW41R2pVc3pJSkRQbGtpNmE0TTZscHdWVGhiMmJDQTJQMk5XVER3d1dj?=
 =?utf-8?B?eFdHU0JuNnBmd2RlcWtsaStRS2dEOWlIYUh2U3JPNjJXeC9nNDNQN2w3VDFp?=
 =?utf-8?B?OEh0QXR3cC9tUUtOQXM1WjEwd1ZiRkFvQm8vU3dJLzRoVDBsMGNmTDMxRTVj?=
 =?utf-8?B?NGRJOTc3K21HOHpKcG1nTmR1RFZBbzFXWjA5UCtiQ3RWK2FldFFMRmlGc2dN?=
 =?utf-8?B?SVhSeHE1aktpWDdYclV0L2x4eHloTWt1eXQ0NXdUNW5aUDNMK2NoZ2NsUUkw?=
 =?utf-8?B?RkJBWXRUVEp3ZVgvUmlTcEx1OWhUcktHbGhpWTNISEV1bWhudWZlZ1NhZzRK?=
 =?utf-8?B?OU9JalV5dVdweExvMmFxYXBob2huamxDMytzbDJqUDNBTk1GaUp2b3dwVElv?=
 =?utf-8?B?Zy8vaHEzSlBYRXRqMlNFRjRiL0gxUkpoUGlqVTZwYmtrSkg2Z3dlZXFqczkz?=
 =?utf-8?B?YjZVaHlWQ2Voc0cvZGpzYzYwMWEvc3NDVUVSZ2JpV0FFRXdjeDlpemxEYTlV?=
 =?utf-8?B?OEhiUy9IVnpGbU0xaWVUMHd6a1E4ZGNPRlN2eUEzZmdCT3Uvbytvbk9uRUZm?=
 =?utf-8?B?VFJUeis1UmhyNzIvVTl4azljVXhiVC9ScGtqOHRMMXJrbjkwWVBCVGtjVk9S?=
 =?utf-8?B?SlppU2FQbHdJV0g3ZUNPNjYxWURLWlkxQVd3RktlRUxqbkJUTGhHNXhJNWpP?=
 =?utf-8?B?L0JreEwzNW5LRmRNN0FycTNCNUVZY3pGZm9sZFI3b04rbXhlRk5zT3BNa2VD?=
 =?utf-8?B?cFJNekhrdC9Sekc4aGk4UzIrTDRwRTlzL1JWV1YxdzdTVmhIblZNaDkrZW1r?=
 =?utf-8?B?Mm5oZGhWL01TOC93OWkzWm9OYjQ0ZE9qYXgyeENmdnN5L0pBV1FYQlVvTTVs?=
 =?utf-8?B?Z0JpM3lIaCtRdklDbURFUnNNeVJiYXQ5cHhjaHJNa3pJd0VRRTRyc2NRSzhD?=
 =?utf-8?B?elRia1B0b3hBdTZYVG42b2pFa0NoSFhuSXFiSHVUWVFYT05SeE01dm04SnFy?=
 =?utf-8?B?eXkyM3FGR0I2enMwWSs0UHhLN2xXRVdpN2k1WmR4T0NadWd1T1ZqNVp6QUFH?=
 =?utf-8?B?c3lDdklNTjg0MnVqek12cHA0NWVGci9IamxhSHJFaHltMWpYU2hBdHU4UTBp?=
 =?utf-8?B?RDZ1b0xnZ1dQWEsvL0JZV2ViMWh1SlJ0TTlFVUtTbG1RVlJOKzg5WUhkbGRZ?=
 =?utf-8?B?ZUlwUWFRRnU3dUt1clhkVlpTSXlOUlNveW5QdTVwcXRoT1dhaTMxTkpvTXlL?=
 =?utf-8?B?Q0RaanlPeTdLbXBsNFJRamlyQXErOUdJYmd4YUl5SFRkbXc1TGlYdlNoT3Rr?=
 =?utf-8?Q?OX6uHrJsLcRTxw8k5k1RIfhur4+s4ucQwZXJFE2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e73940f-b776-42ca-c7f3-08d97c173641
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 09:15:38.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzVqpYaKB2zyrWZRoD1jKTplZSp+sbE9WnEWMO7ShClDe2MGBgD4qcVdvqsFIbuZYA0ZdAQo0eHnm7fn8+d/sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 17.09.2021 10:45, Andrew Cooper wrote:
>  * Delete trailing whitespace
>  * Replace an opencoded DIV_ROUND_UP()
>  * Drop bogus smp_rmb() - spin_lock_irqsave() has full smp_mb() semantics.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Largely
Reviewed-by: Jan Beulich <jbeulich@suse.com>
One remark:

> @@ -717,9 +713,6 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
>      if ( !cpumask_test_cpu(smp_processor_id(), &tb_cpu_mask) )
>          return;
>  
> -    /* Read tb_init_done /before/ t_bufs. */
> -    smp_rmb();
> -
>      spin_lock_irqsave(&this_cpu(t_lock), flags);
>  
>      buf = this_cpu(t_bufs);

I wonder whether the comment wouldn't be helpful to move down here,
in of course a slightly edited form (going from /before/ to /after/).

Jan


