Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691314BF422
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 09:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276559.472750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMQx1-00007c-4h; Tue, 22 Feb 2022 08:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276559.472750; Tue, 22 Feb 2022 08:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMQx1-00005E-1E; Tue, 22 Feb 2022 08:55:15 +0000
Received: by outflank-mailman (input) for mailman id 276559;
 Tue, 22 Feb 2022 08:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMQx0-000054-HI
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 08:55:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24ed7f77-93bd-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 09:55:12 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-IRqOZ6ezMqKtHG8znC0Ysg-1; Tue, 22 Feb 2022 09:55:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2863.eurprd04.prod.outlook.com (2603:10a6:800:af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Tue, 22 Feb
 2022 08:55:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 08:55:09 +0000
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
X-Inumbo-ID: 24ed7f77-93bd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645520112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeimnAO2B+gBAQzv4gm6HY1fwYl8qIvfS9Wk3eT4Zv4=;
	b=Bu3iy9OlYiNMQyw+7EA8przZKoBSGDVUtSYWVbOfevSQ2krzQykg+FMlF8y+kfafdftvpp
	P18ltPOfYBBOGxGVkMYBomwR6zwrUjWcfn6cPS+6BwX1IjLynQhcjGhOwL1pdwQyWY3Dud
	ctzmhIQ3qy4Y0VKtboDXjDo8G6QqaLQ=
X-MC-Unique: IRqOZ6ezMqKtHG8znC0Ysg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXQiZZuSuW/gDRiC67hgNIcqZE3vG4M9KTOXrwei0hkAgTBd0risZwz/BMkc24foK4Ucaw+fkmgykoQCzRZFcDK5SRnwwnRGunwc9YE+XBWYooEqEOhtZL37zNd1Y3NPI5Cok3klp2xcaATOKpUJxQrtJKDrYUYZlKq1tEvbx6eyNzDUJvZZAV396tp9AxCd7wqqPiFiFCBbNIV5GmOPugCffSROaAN3Z7sKT0zn011fucUIAc3rroxsW1t8udXCSbRurrEfTLRrgKkPTgQq4zQn06Ehk5TKkBVxxso4AJdeHTB+xJXf4pBwsa7LMzxoqw4l9mq3jv13oL7cQyUebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeimnAO2B+gBAQzv4gm6HY1fwYl8qIvfS9Wk3eT4Zv4=;
 b=jcUzxJ8R8z1hJQ3nWHy8rzt4aPKOVv8+MK8L4zX8zye1Wu+eU5VPh0Cg69KMp+3F2QlEgWzhh6wKb+JKnQQRSmtOCdw7ANXbeyLA60wmJ160P73fDHOqqoCNTfzMkxNhEmGRjYaCXc3sJ/qJn26knOoD0+LGLvj/G6EENCIfW2VAVChzQ/d5cidjZ9e8njV6vETZxW6xKxnivcW/5XYCSrNhVZqEnxAD/oIi3KGho3eKsMxkLpui/56gNaatQgvMcy1Ivv5572dBrphc16Fu7dn404tQPqIBm7nGgAWVCFDVkclRvA3mBW8/LJz76rjrlsKHNJtpqQdV3aCK/YnKdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbd980cf-71c2-aa8b-4d23-acbb457431fd@suse.com>
Date: Tue, 22 Feb 2022 09:55:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
 <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
 <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
 <aaef1839-96b6-0d6c-df3b-d31cc7fa697d@suse.com>
 <e8a17311-1a56-23d1-7414-0f9ae18cc0e1@suse.com>
 <06890331-8c75-ddb9-57e8-284c47d4d562@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <06890331-8c75-ddb9-57e8-284c47d4d562@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0178.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 298e2817-dce5-427a-1e69-08d9f5e1073c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2863:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2863B02EAC9347C090E5A7B1B33B9@VI1PR0402MB2863.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cw56wlfUwAN6xh/l8FUWORxk3aPMYd+TRDHnZjT9Jn7Aqs1SnH3TGwRjXvPgIHbh1U70WsBkUuNKGMJlsi241Mkr5ZonUXCES1xlKXLj7ugInQ7WdoRi4QC/goBH5amcs3ZDULn/OmunXHKP+l1MWze2NswJOFhUdVY89IRe2AdcYl7tgarcsZrsZADslycBqLndpu6FGgtt/bkHRMB5ioNwTqsNleqFgYxls6W6fGKipppedpt6YAPNsoBPBJM6+59n9ZJoIY7K0ZyNPTe22TJFlrwMXzZsl2Koi3zwT9pvMhN2v+ClAFXm4XLb9TPhgMTBivzledpeXTQGs4QTjjw8PrGVR5/hLxRmhW78H7vJEN4MkPHJ4af8QiodguN1eepMAeglt4RcyCgwLoy0mZlrgSGkzaL/gpSm9ANO2tBae+5sqLfyKx0nY5zHAvHtx/N4s4YAQUOybtc56dbxLs44n3iA8MQVBdSiinMi9tPcmg5Hne6Ikx2zwWZ0a96n7NzLxHrMOLJMWPxeeESoqfQ9w73EJpeHotozt15HtVg7sMGWVB2wF8U3vHNsPKtE89+ok3qH92k9/iXJAaIgYhn/hg6/S6gW0glf8l8MnzteQmwyPdVLSnJQF7ZfHz0Rflnqb76O970I5LzmSxIXRH67MQpSacGCFD3/CFXGPP+tx7ah97sdgsd3N6AXWVeYddKoB3fp2bR2nrzG7QDGfdC6YIOpLXNR/3hYumIjKe2Rt1iYVIwXFlISatjJZaEd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(37006003)(8676002)(4326008)(186003)(26005)(8936002)(66556008)(66476007)(6636002)(5660300002)(83380400001)(6862004)(66946007)(31696002)(316002)(86362001)(6506007)(2616005)(6486002)(36756003)(2906002)(38100700002)(6512007)(53546011)(508600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1lEejdtWXB0VUxZdDRWVVZPNnlyNnZwNjluRy9oVUJXVUR4Tm80YUJPQ2k2?=
 =?utf-8?B?U3ZwQ3gyMWgzN1ZqZ1lhcUtabCtLR1REZ3pQMDVsaDFqbVEzaWpnc0g2MEJw?=
 =?utf-8?B?bDJrVUYwakhsOVBBdzhLL0hENWtIQXltTG1RbHdUY2g4aW5SaXFIN292RERu?=
 =?utf-8?B?aDBKMkVwTVdFREk1b25EdTdRY1pLSVZsTStIL0hwZnRhUnlKMFNvTm1YN0tT?=
 =?utf-8?B?M0RCMVU5YjFGWENHQWNlTng1a1Q0MkFXeGpPNU9UTVVTeHFzQ1Nlemowc2tn?=
 =?utf-8?B?V3Q0djZ2dHZ5SHBzZ2xNMW8zN21tSDBPSTY2RVdKeUY4QVJPL203VVpWUUZv?=
 =?utf-8?B?aUViMURCL2JyRFlDYzZoYm44UmJzWU9WdzVJV2phcVpUd2t6K3l3R1l2YVhB?=
 =?utf-8?B?SDhWcWo2em16ZDF5REh3RlIrbWVrd1hrRkpBTkplSGVXeXRlL1F6N1doZWFF?=
 =?utf-8?B?UEdobEwyR0l6bnorV24yZ3Y0K2gwWVdEOS8yZElMa01rT2h3bzRIRXgxQ2Z5?=
 =?utf-8?B?MjBjQkx2MlJmaU1COEJUdkgyZ1JyTUhsS0xuSVUzV0NEb1NOZmd3eFJZSStJ?=
 =?utf-8?B?aTNnK3RSNk1sWFl3Y3pJbnF6T0RpOHJURGRPZ1o3cUNMeDFteGVNMVoyNksz?=
 =?utf-8?B?MG1JNWdyUTBTMFM3T0xoKzgrQ005S0dRRmpHZ092dCt4TE8yUHVmdjdqMEhX?=
 =?utf-8?B?NEQyMUk1MzdxcVlXQ1lncERtY2NOc0d3RU1ETlVPTFo0Yjc5dWFCdXZ1TUpv?=
 =?utf-8?B?RnVzNkNlYjRCdWFFM3JzSlhVcHZtNzVoRDVyY3h3dEtZTFRZK21zNFVSZFI0?=
 =?utf-8?B?UjBPYld6S1lZSUpRVEt4c3FRVVM4UXU0OFFKc3NMQXZyL01VdnBYRHZhczIz?=
 =?utf-8?B?YjRKSDJIZEVycjR5aThweHgyd3VTTmhySHdxUzNIY3NHd2ZkYVNxS3NKRkoz?=
 =?utf-8?B?NjNoUlMyRHNRSi9DcnpvQW1tQUpkSUpKNWlLcS9xQUVqZ3BtL3o2a2JVeHdm?=
 =?utf-8?B?WUFQUW5DTW16cFZSQnREa2dvYTB4MHFDa2NMMWRqSjBGRmgzdGpyeEQwKzAr?=
 =?utf-8?B?UGZjTGNQMlVjRWVzL1FCSnpCS0NZalJWdmd6VDZLQzVaVVBIaTdwMWR2V1Ja?=
 =?utf-8?B?N2xLazZTb0lsbmJxWDZmVUtyQ0Vxb25jVEYzUU9YS1IyRkZuWXdzMUYvYXpt?=
 =?utf-8?B?Tkx5TTlCRG9nQUs3N1RMSk1wUHhMbC9IcXFOKzFXSFRwcXV6Vjg0VGFwclpW?=
 =?utf-8?B?SjNlL1hrS3lRemxRcjNhUUR4WmdIaytxVEc1R0w4QnVzcURLbW8xdyswMUhQ?=
 =?utf-8?B?V1VOR2hrT0dLRkEvbmxXQ0J6eGFMNjNHRGUrWUtBSCtlcXM1ZFFOdlovcTNT?=
 =?utf-8?B?dHFIUngvSnFWM0cvc3JsSzZrNFBPL0xDeEw3Wk5qYU8rMEE1VGtuclRYdGI1?=
 =?utf-8?B?M1FsOW0xZW4rRnlVbG80dU1WM1hOYlBlZU9CbGdZcTRYSXVsc3M2U1JBay9J?=
 =?utf-8?B?WkZUbDNyMisvY05lVE9TbzNMNlBXaVlNMXB6dnhhcmZ1c214bHhGcGhPUVFl?=
 =?utf-8?B?NGRmNXFlN3FGaW9GZVBxUy9kVEcxWjI5QkQ0RFJHYU5XakpyRDhHNUF1d21Q?=
 =?utf-8?B?MHFYRHBDSml1Vm9EaFZrN2pFeFFmOSsxaWJrSjExYkdwb3J4SkYyT09BRHkz?=
 =?utf-8?B?RFppOHhNbzVURTVaU1RTU1JUeTN2aFVDRFFqbmhoUDltK3VRT2pzWUNIcWRF?=
 =?utf-8?B?UUhIUElRdTJ1WDRvL1pmQ3VocHNUdjNWb3R3R3dRUWNoMTloZ1JHaDFxejY1?=
 =?utf-8?B?a1BQMW1yOGdZUDhHV25jMFZka09ib1FtS2NlcFQ1VFE0Z0Q2RmhjWTU2UE5D?=
 =?utf-8?B?cDBqOUg2QzZMVElQcnhjNmw0ejh0MWNRSUpZcjVsY3JsRTFIamZxWVp1NWRP?=
 =?utf-8?B?WWliS3o0aXVMODhtZ2twOElLUDNKU3JFZFpQMjl6ZzZhWDljVEtNVmhyUVly?=
 =?utf-8?B?YUlBOHNRb1JDZmlpNzFxVkNjMklKQzhhYWtEaG5zT0pxMW94Znl4bmE1Y0ht?=
 =?utf-8?B?YVdHOE9GRFdHdG8zYldXd3dUblZiTUtuQ0lVS0tlVjJvejNsSTNXNm9wajlh?=
 =?utf-8?B?R0xvTTlQdkZSZ2JSZVJpRnpDa3pYcmhHdmUxakljNUg1UGw1OSs0TlFhWExG?=
 =?utf-8?Q?1Lcp916xaOeO7NpFKlHgjvI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298e2817-dce5-427a-1e69-08d9f5e1073c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 08:55:08.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGAN3dKbmkj2uelkHTdSAazXKBFhnAOYO+4/ey9nFJH4NPnnj2KAhI5Pf8BYwnFX60Y2U4ThQ1i7W11qqNAWww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2863

On 21.02.2022 16:57, Juergen Gross wrote:
> On 21.02.22 16:31, Jan Beulich wrote:
>> On 21.02.2022 16:05, Juergen Gross wrote:
>>> On 21.02.22 15:31, Jan Beulich wrote:
>>>> On 21.02.2022 15:27, Juergen Gross wrote:
>>>>> On 21.02.22 15:18, Jan Beulich wrote:
>>>>>> On 21.02.2022 13:42, Juergen Gross wrote:
>>>>>>> Providing a macro for an invalid grant reference would be beneficial
>>>>>>> for users, especially as some are using the wrong value "0" for that
>>>>>>> purpose.
>>>>>>>
>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>
>>>>>> Over the years I've been considering to add such to the public
>>>>>> interface, perhaps even more than once. But I'm afraid it's not that
>>>>>> easy. In principle 0xffffffff (which btw isn't necessarily ~0u) could
>>>>>
>>>>> I can change that to use 0xffffffff explicitly.
>>>>>
>>>>>> be a valid ref. It is really internal agreement by users of the
>>>>>> interface to set for themselves that they're not ever going to make
>>>>>> a valid grant behind that reference.
>>>>>
>>>>> As the grant reference is an index into the grant table this would
>>>>> limit the size of the grant table to "only" UINT_MAX - 1. I don't
>>>>> think this will be ever a concern (other than an academical one).
>>>>
>>>> That wasn't my point. Limiting the table to one less entry is not a
>>>> big deal indeed. But we have no reason to mandate which gref(s) to
>>>> consider invalid. A guest could consider gref 0 the invalid one.
>>>
>>> With the gref being an index starting with 0 (gref 0 is valid, as it is
>>> used for the console ring page), the natural choice for an invalid
>>> value is the highest one being representable. A gref is of type uint32_t
>>> resulting in this value being 0xffffffff.
>>>
>>> While in theory a grant table could be that large, in practice this
>>> will never happen.
>>>
>>>> The hypervisor doesn't care. Imo this simply is an aspect which is
>>>
>>> This isn't true. The hypervisor needs to allocate resources for being
>>> able to handle the highest possible gref value for a guest. For a v1
>>> grant table this would mean 32GB of grant table size. Are you really
>>> concerned we will ever hit this limit? This isn't at the guest's
>>> choice, after all, as the max grant table size is limited by Xen.
>>
>> If we're not going to hit that limit, what's wrong with declaring the
>> entire upper half of uint32_t space "invalid" for use a gref? If we
>> won't ever go up to 32Gb, we quite certainly also won't ever reach
>> 16Gb. Yes, you probably already guessed it, we can then repeat this
>> process iteratively until we reach 4kb.
> 
> This reasoning is nonsense, and you know it.

Interesting. The underlying "where to draw a boundary" is far from
nonsense, I think. The only way to escape this question is to avoid
introduction of artificial boundaries. While it was me to submit
"SUPPORT.md: limit security support for hosts with very much memory",
I didn't do so because I thought it was a good thing to establish
such a boundary. Nor was I convinced in any way of the precise
value chosen. I merely took on carrying out what was discussed
with the security team in the context of XSA-385, when even that
discussion left it very much to me to pick an arbitrary value.

>>>> not in need of pinning down in the ABI. Yet if it was pinned down
>>>> like you do, then the hypervisor would need to make sure it refuses
>>>> to act on this mandated invalid gref.
>>>
>>> This is an easy one. We could just refuse to have a grant table of
>>> that size. I can add this to the patch if you really think it is
>>> necessary.
>>
>> Since grant table size is measured in pages, you'd then have to
>> refuse use of more than just that single gref. This would still not
>> be an immediate problem, but demonstrates again that it's unclear
>> where to draw such a boundary, if one is to be artificially drawn.
> 
> It should be as high as possible. I wouldn't mind just refusing the
> last possible gref, but I don't think this is necessary.
> 
>>> TBH, I think such completely theoretical concerns should not stand
>>> in the way of additions to the ABI making life easier for consumers.
>>
>> In case it wasn't clear - my concern isn't that sacrificing this one
>> entry may cause a problem, or that we'd ever see grant tables grow
>> this big (albeit for the latter: you never really know). Instead my
>> concern is that it is conceptually wrong for us to (now) introduce
>> such a value.
> 
> I have understood that this is your concern.
> 
> I continue to think that this concern is of purely academical nature.

Well, I'm not going to NAK the change if others agree with your view.
But I'm not going to put my name under it in any form. Academical or
not, it sets a(nother) wrong precedent.

Jan


