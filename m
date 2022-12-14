Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE3864C488
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 08:57:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461786.719935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5MdU-0001hd-Lp; Wed, 14 Dec 2022 07:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461786.719935; Wed, 14 Dec 2022 07:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5MdU-0001fM-Ih; Wed, 14 Dec 2022 07:57:04 +0000
Received: by outflank-mailman (input) for mailman id 461786;
 Wed, 14 Dec 2022 07:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5MdT-0001fG-B9
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 07:57:03 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2058.outbound.protection.outlook.com [40.107.103.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e48c5751-7b84-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 08:57:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 07:56:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 07:56:59 +0000
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
X-Inumbo-ID: e48c5751-7b84-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE2TvQZSvJDB/pXIRF3v+JnDkV0a9AYmhvPgQqVgOiw2vjg4tPWlKT5+n9IlBJBz9oQu4s3FwNXY+h4r7/WQ7PuVLYDdashjH6xKfIh22aWxY53h7g31w/r18QfCmuf4i3IDNcWuDNLRWoiroVfnD54YXf9K17KwtpkmIP72/LTt16qYthhQHrKs8Stsv1wULvPzrMHxITSpOMENVH1LCGwIJjZp6JU9LIwhW+F7A0P9kWjM65rO+vFqnB2NMSgPKtHeg+HA0XSSIFt0wBFd0TIFer8/7ywnEg0N4yv9QLa0hHaeCJXpTv67JQCJWJpSWXP1kAz/3hfQ2NMKo2xZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zo4vZGUxkZXAazECKQB+/3LjGsIxwEmAkmnlT1+b+vI=;
 b=hpqX7Ccvo5d/dcKX7npFsGucDLe1f7cKTQQpB774Ae1g2UDyeT/AcsfJssIkVDJG6ouFd34sPyWfwgamKRw0Z1nq/SyWzaqBh5YavWTfzb7+7WRyS303yFrJb4m68209jwlzIN4Tymq2bZAYPV10OZKznX2BvqHF7qZgg3PuiatqhlOgHvZGLq6XIE7SSUWv0qo5uoG6I6OgMStxG8mYad4+uLWpKXll3QyWUDEnB9Q+mjxvhVxJsWJhkSLcr54WOavtIOf4duApqAITuL2fVadCVWq1YOhbMCuJ1bK9Lbl/A9Wbsiecf3MBjS2OIhesueuUaN5+rpqXC78/+FElrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zo4vZGUxkZXAazECKQB+/3LjGsIxwEmAkmnlT1+b+vI=;
 b=CyxIGpKSU1AZ9k06sfCWEPpSq2cLeLzqnOrvpWzhaiCt8gRx+3bj/Hlw9pV7qyp2H8D7QTV7wOb/cxylR7i7VEkrxUio0yY4DEaE9UYG0wzg2BzoIrCgPQzcNyP83xORkwopo20BgFRUem2DhGrJF6rUO5CpAVv+NCZCyO0I0GAqCsj2oUfnimp7jQPCumR4Ly8owHJTdMNrwLaW+uEjxWZqt40CE/emC6JltMF8oqz3Qtx1tB3+o2UkI8Oc+PTG2NhHa4CjgS9hqJ3Q2AJt47oe3dkDgGJ+Kgk4+ync1u9pT+vrQ1Rxz6FHMmJyeiyx4HT4xWDvVwbx89VtuQ6OXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>
Date: Wed, 14 Dec 2022 08:56:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
In-Reply-To: <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6b9712-aace-4d77-30a0-08dadda8c741
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3bJwE/XylgDGbfHF585Zpzme3H/C3KcEJY/n+IxZEvXjEL5OizhZYaRbX/nGAaQOoTPsaYQC2ibY4kDHWCJ4CHa6O1Qqu6ibx2cneLMk+bx+1x+d7ylZgKkqSmKXn5iT711Y5hhnYp6wl6RJjo/k4/IO8VvvdxRoWg0+ZoXxV/XfGh7ZaU7LzYZnEOJutsKk0Vpd6dgmy6NrK71oZm0NZ8qgbFUmlvcx3eJTMYxcYriseXBJVhjzbWkU0KyRmdtGMPh+y5y4lMGIiIiloSmAg+hD8L3gsPKcHOzbVvMI/SdG7/jY1DrxckG7dvctG5UNQBBgUwLWGTB60o/V5mfnKABw+CcRiNG3JZEiFWc9GmKCe3iUdzZyhuN2jZyZUpAYgH2xkKBxgXLvBJ8/UBDfMdQgEI1/JpryPesEQCCS8tdS/ckVYO81DSpjGhwhM9FEx0oZcX75u/2V2I+XufZQE8AIfRIskKFfXEqT8Wx8nwxRQRdWUI3EZ02zfEA6g7loGRGEqpw6x78a+TcAhLChwVEAsoRBjDTeLPBOtKCPzGdk5usbqBkSbjSev07IJ3Z0XQLb6AgM1f5oqbLLwbN9oB2C7aq1NsHfDg618U20bt72zO/+GkQYkiUwsRSUIgvkYP0DcvAU6SkbeLuQviqJvnD5RU1OYmPIiCmPX2mAA6UuMKXOs+Zdb4ce67LP4bTTWMsEJA4wAXvnH1g5XeZwghr3Dx+TfmRffEWV4stGDhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199015)(186003)(31686004)(2616005)(6486002)(6916009)(478600001)(316002)(54906003)(31696002)(36756003)(86362001)(6512007)(26005)(83380400001)(53546011)(6506007)(38100700002)(66476007)(4326008)(2906002)(8676002)(41300700001)(66556008)(66946007)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFhxS2JVckU2UFVQRXJmU2g0VzZZeXNtWXBwWEduVEk3ZE9wOHdvMER6aThi?=
 =?utf-8?B?WGo1T3Fodldld3F4RWpNOE1qQUdkK3ZWbWR3MjM2TzF3dU9nV1lYN01maEY3?=
 =?utf-8?B?dW5RdTVXWDZneEFaby9pUko0Q0lNNlFsN0NmV3hlKzViN01TQk9KRmFKME16?=
 =?utf-8?B?RkM2Nk1Zem5zR1U3cG5xQXYyaWRVeisydEVPUUVibWRNUzlrUjBxMEdFaDlj?=
 =?utf-8?B?SXJqcUw0Mmxobk8yT3c4ekFzWFZKVUdWeWRhQWxVOWJlZk9zK0w0TDZ2NHlo?=
 =?utf-8?B?UVJMdG5YSElOSnRCNkM3cjF3SC85ZFQxWmZJU0tVajF1OVI1SlU5TXBHSDVH?=
 =?utf-8?B?b3poSlV1L2J0Zzh3NFVXNGhZbGVkcXg5NnNYeFd1aEk2bzVtek1ZRnBONDB4?=
 =?utf-8?B?dVZNUzFabk5uWjhwWTVuSGNvYkZ4dDFnVnlsNEgwYTBGcUhLMVF3TGp6aUlT?=
 =?utf-8?B?ZU9XSjRGNi9Pb3Yyd1BpSmc4U1BXMUc3NlNlWDhvTTJkNVR6ZVgzSnJYMGVt?=
 =?utf-8?B?Wm5EUk9SSTZRWklhRHE5eFVYSHFYSTJ6UU53TTBEQW81VnNnajl3blpVR28y?=
 =?utf-8?B?TmpQN2hBVVRIS3FFL0RVOXR2ZjRIN0NkQm53QjNqV2lSMkRhUGUra2VVaEhH?=
 =?utf-8?B?VEw1c3kwYit0M2JZc2RneWY0Z2VSN2tmWnA3RmIvREdpS04yNFh2QWNvR2pj?=
 =?utf-8?B?RkhHSjRvdk9NSGtneE14OHVnbHdpTjhnNXVwbzhhUXVnbVJTWEZzdEdFWDFk?=
 =?utf-8?B?cWZselA4dzFkTjJzK2RZcnFPdjZ6azhkSnhRUlZQMEtSczJHQmVienJVM1Ew?=
 =?utf-8?B?dS9kZnltVnBHVnlaU2lUeVhPdHlFL044UVMrbnFvRG01UVUyRnAzdEpwc1Y5?=
 =?utf-8?B?bGluRm91ZjkySnFGWVdPOCtiS1ZRZm9HTUI3N3I5TUFMcEZlRXQrM0NXcFN2?=
 =?utf-8?B?Zk80MWkrVkNwYnFFSWJELzEwMmpKcEQrb1FycXVING9oYitseUZ6Unl6MERS?=
 =?utf-8?B?UWhOSlJYa0srZGxUeFBlWjhkdytkSDlTbG55WExCN3h2dWt4V09ZQmhGN0Jz?=
 =?utf-8?B?SHZpY0ZZOFcwcU1KTktVeitjbkRXMWJCY3I2RDJmQWJLb0RYRVkrUlhHQ0FN?=
 =?utf-8?B?RHhvcWppYlFHNklmUXZpRVJqckJ4YXBORFQ3a1I3TWpweHlyUFI3NkdTS1lu?=
 =?utf-8?B?WUVPZThGV1BNVkFBT3ovaDkzWjdVZmw5Ykt5eTJlWit4dEtRcEhXdWt1a294?=
 =?utf-8?B?SHJYdGpveVRRNGRvK3dyN3VXb3NNWmNXMkorUXhnTkMyczlwMlI1QXpKc044?=
 =?utf-8?B?Y1JxSnN5OElzWUJaZmkxTmhtRGd6ZDZlc01VQkJnMTFqRWNqVlo2YVJwME9Q?=
 =?utf-8?B?b2swcnNUcS9Fai9IMEZYVCtUN2ZqbWFZM2hmSXB1OWdnd3hIU3djdzM5SkRD?=
 =?utf-8?B?TVFkcU1NaTZnTnJ3Zk1QOXBOa2E3OGJjeW5PTTlLNEEyR2gxVlVuRXVKN0NI?=
 =?utf-8?B?NllZUUFZcXBCdXJXRERTK0FRVTQyRUdnNlNoQnhUOUdrY2IzZDVnZXBUSlh2?=
 =?utf-8?B?UG9ia2ZsWk1CQU5YZ0ppL0g2S0E3S3ZnV2tnak1XMVg4QXVXKzJndXNtZ1N4?=
 =?utf-8?B?b3ExdzZWTmxUbGJNemRjdXVZd0xHdE5Cdis1NmhudTdWNUx2ZlhJcTgxcnlH?=
 =?utf-8?B?R1Y5RG43Z0x6REdheU55YUxhYjMraFRyOHMvR2Z0RFZhdkZPTTh6b2xkK2dq?=
 =?utf-8?B?L1hGY0ZiYWYxRExPK2ZObFVzOXA4bjJ2U1hWZUVENmZmNnpVZ2xUME1wRHQw?=
 =?utf-8?B?RTlyMmxFbHVpK1U3VG51TjZVMGphbmJsWVphUGFSVXpxNUE5R3VrV1l4S1Qr?=
 =?utf-8?B?Tm5PTTloaEJDa1htOHV1YlZXUUZiWDNrTFlENC8zalkwdElNOCthVTZidjNn?=
 =?utf-8?B?bmhZSWE2WVhWYTBPWjdLcFlhd3BSTnBtcDdwNWtyOHo2ZFQxcmhsWUYrYzBV?=
 =?utf-8?B?KzQxVHk5all1dzFsUmVmRGJBM3pDRG4wZlpabDkySlBSMkdTTWdSdW1KcFda?=
 =?utf-8?B?VUpyR25JbmJLcDh2ZEZ0ai91RHJpT0t0eEZxTEdvS0M2Y1dIMXRvUHEwWFN2?=
 =?utf-8?Q?Lk6Ox7UZeeqWIAuB00pItgPyu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6b9712-aace-4d77-30a0-08dadda8c741
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 07:56:59.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDK+fPB0WybIUZGDd4Zd8TEnNStmrviU17+c/QZ6brLPjbaq4h5RX3THaFUMHc+pR5G5JmBMqKady8joj1pb/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8604

On 14.12.2022 08:29, Jan Beulich wrote:
> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
>> +static int stats_vcpu_alloc_mfn(struct domain *d)
>> +{
>> +    struct page_info *pg;
>> +
>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> 
> The ioreq and vmtrace resources are also allocated this way, but they're
> HVM-specific. The one here being supposed to be VM-type independent, I'm
> afraid such pages will be accessible by an "owning" PV domain (it'll
> need to guess the MFN, but that's no excuse).

Which might be tolerable if it then can't write to the page. That would
require "locking" the page r/o (from guest pov), which ought to be
possible by leveraging a variant of what share_xen_page_with_guest()
does: It marks pages PGT_none with a single type ref. This would mean
...

>> +    if ( !pg )
>> +        return -ENOMEM;
>> +
>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {

... using PGT_none here. Afaict this _should_ work, but we have no
precedent of doing so in the tree, and I may be overlooking something
which prevents that from working.

Jan

