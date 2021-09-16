Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FD40D48F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 10:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188241.337332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmnz-0005VZ-8x; Thu, 16 Sep 2021 08:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188241.337332; Thu, 16 Sep 2021 08:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmnz-0005Sy-5m; Thu, 16 Sep 2021 08:31:39 +0000
Received: by outflank-mailman (input) for mailman id 188241;
 Thu, 16 Sep 2021 08:31:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQmnx-0005Ss-O2
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 08:31:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8124489a-16c8-11ec-b5b4-12813bfff9fa;
 Thu, 16 Sep 2021 08:31:36 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-pNfbvh-zN7qMBvOEepz5kA-1; Thu, 16 Sep 2021 10:31:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 08:31:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 08:31:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0012.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 08:31:31 +0000
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
X-Inumbo-ID: 8124489a-16c8-11ec-b5b4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631781095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+KuwO8Ac+v8fcT7Ie21OEUa2zI/DBon1ywm4ELSnZqI=;
	b=kfKsJcfmmHfkXOdTRtlWC6mGZdcU6JNwMBLD2ko5t+JVtyX8EoZKiNWYhQisuJfBTq3RVC
	zskOksHDBRf1t3d9XBAooScXbXD8CJFycwhm37M2tMe31ZRdJURy5DFQDhcZLl/ozzfweu
	E/snD1k6sEUU4nAHkpz/vSJ9zOoEwNk=
X-MC-Unique: pNfbvh-zN7qMBvOEepz5kA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA/8ZeOFQC4LIz4MvM4fMGL5Ad7MmwNfjOPLOF+gF3St7Ed41ewgyaHHfPbcjg52PeoL4OlZgKDEivLBs/cfsLKGbsBTrAsgi0/VXPWDCzFaU045vqSCqZuBCGHUOrStYXCwO0ygRgLiPifM0GKqVl1i7p03NJo6/IlO9a5nhxTw/xGKXlmH03x2CMv2DTdg6/9CaS5qs/BMlintydI5OgnDtcv6NDauLI3ZPQUchBW0P9xvrPyuoMNUhiI/o7mRKeNA54+SgR19Dv/IFwNFyrKVl9gvFbLJWLVDA4TKJYtPAJMKLYiINbMq72ONR/89EU0eR9N2R92DD/vbT7K3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+KuwO8Ac+v8fcT7Ie21OEUa2zI/DBon1ywm4ELSnZqI=;
 b=TlZ142/2CtffU87WlBKm01rDOhdXGiWVOMviIa7mvkuDz6TD4uoSXxlXTR4Nke3u7nqYeAA2wub8YHf9zlG4u9pPi9fngzhmJ+uuy112h3SCeGyvXkm2G98Ikd6czimhknP62YGaK79wgwMN5aJV4mkKZ/VeQKxxFRj8yxVFfEEkD1uZQHLbWugqN0Fght/MAPFOfwG6TGe7l68ms1HjmvIFJZ1Cnvp1cnp9W0c0KTFhnJcAf/iQetQwlpxEXWzcWHXUv7m54VeNpz39bosLV1xXRDzIOh0xl1a5QsLXdmk8pr/xPuMiDjpPPNG083NCRMHwFm1evbkP5MHbDZXUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/4] VT-d: consider hidden devices when unmapping
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
 <5cf392cf-09a2-b23c-2a25-610c64f20707@suse.com>
 <BN9PR11MB5433706BE0A6C4B915D3707D8CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <030c4cf1-f361-1d36-c61f-28537a359c08@suse.com>
Date: Thu, 16 Sep 2021 10:31:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <BN9PR11MB5433706BE0A6C4B915D3707D8CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0012.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ef6a106-f59e-4e61-35dc-08d978ec630f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63842CE5F358EC33CE11ADCCB3DC9@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gwj85+MVCQWwo6/7oB1+Lm1W6kWPViFieWTKJ6DwJKAdOUVyzRrqHPOMOoplBTblJxETB7TwprAip/olHsx/thvmcOcEyHdsQgALrS9DdHfulFC7n456QSlH7aoA/rtyf2ALQAsEOFOQ1YBAXQXH7ybJVkYFZw88pM1bg9tIuj7aBMLtNFQtW1hs5VhiVDRUSnEWIDfx3YVUH1zS6Da57vwsIanVsrV/GnEsPz0pHe4zot2ZYpwObzvsPPHFhJr+wtiaQbzoziEw1KJ4L9Pdzj9xmgW8WW4FcSkyI6oR8xYdxtLgF1l72KkZ8s1c1QcaGY0TMy95VzFsSpEzO4SNykOFV8eO2obkXAaFY5USEwofHmuF4wtkmn5WPbVY0nWttukN57vX001TBZku+0oVQ4zZrwVSN9TtXNrgmtVIRnmKg3w2mnnkf1CzGpFEU15GdF96drv2wHQsOlndOA3i3aU47mMIHhkKztkju9cOM+w67UHkVmhpa/Foh/yOHtbp0KGNwCLNeZFh1BgdDIJGcD1ox99uBTYa7lvMhJOpHlhdptsUUSRZ1CiYZWoZMwzNQ786EOEekBWVmbeFNRb5Y3Ze2dF5uJIAFRgBvDQFvqQtaghkerMv0bmtj7S3h5+DlVoq1tk/Kfn3YVkrQdOvlIGV8t/2yFeYZkCSNrpGHEUR4m2dUO/RCIsRsf6IaBA8R4RNiYiah5gxfxzRn3gQWW5urUthipMcUmLd/IADnSOk9HOpVtc09A9Vivgck8uM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(38100700002)(36756003)(54906003)(956004)(16576012)(86362001)(31686004)(8676002)(2906002)(31696002)(316002)(2616005)(5660300002)(8936002)(508600001)(26005)(186003)(66946007)(53546011)(6916009)(4744005)(66556008)(6486002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDdiWWlObk5NQ2FFT0V1VVgwOXB1RlI2RWZlNjArelpuZVJrWWU1ZkkrZi8x?=
 =?utf-8?B?UzYzb2NsR3I3NWo3UFhQT2xoT0ZVUytwL2FsTlB3anlqQStIODZ2MnhuSkpC?=
 =?utf-8?B?bGtmbnFTcWR2akV4RnBPK2VzRzVMUXlsWXljdXl6UG5QWUNCdUVUeURlRW9B?=
 =?utf-8?B?MjRtZVVldnZGUWRoc3RnQUZlbUlhY2tjb3IyVXZyOE9CTlFEMzZnWVUxWllZ?=
 =?utf-8?B?RExJdHRmODlPdlBkSHdkT0IxTUMram5SQ205ekMwMXZGZjRiZ01VU1NkcWRp?=
 =?utf-8?B?YmVnN0RMaG81d0JIS21ja2sra0ZNaTNDbVFRQllCTENIN1JEMjRYakNpZit1?=
 =?utf-8?B?R3NSLy8wNWpmSVdNK3ByVVVWY2kxajRDM2JIM08zZ3IxTWdkQktVNEw1THdO?=
 =?utf-8?B?Rkk1NERrWms2VTNPdEFSNTNsbnJmV1FKNVN6NER2dzlOeU5keDIyUGJBd01a?=
 =?utf-8?B?YjlXVm01a2hIbnZjSEVHeTMyNXRFRFRXMFdYenBTV0taUTVqQTZVR0NONU5n?=
 =?utf-8?B?ZnViZHZVWnhDazExRys3bzV6L2ZzdUNxLzlZQXJiZGxLUnVQZHhjQmNmd2dR?=
 =?utf-8?B?dWZpQ3IrcjQyb2JrQzRYM1hPYUU0ZjhCd055cVNheGZkVTNJYlRJZld6cEM0?=
 =?utf-8?B?eHRRT2ozY0VaeS9TZGp1STRmQitjY2FvOG0ybWxIQ3BCeU91Y3lEZXkvWFV5?=
 =?utf-8?B?OHJKYWpEbmxENmxTN29USjUrZE5LRDc2dElIRVRQbEM3MzArT25RVExDNDU5?=
 =?utf-8?B?V0hzUXFYVlM3Unp5aGhDZzdXVDZvMnZ6NmdpWEY5Z0NkWjBlaG54OUd2Y3Vp?=
 =?utf-8?B?NnpiUVNHeXBVM3FCN3lTL1cyb3FiWmN2ODJQcE5VTW56czF3Zk9TZXFKenkx?=
 =?utf-8?B?TGc5c0pHckpMbGZUTFhnMk13eE51b09oUXdRQUlQdElNMmdncG9qVVZxS0tF?=
 =?utf-8?B?N0QySlEzQmh0d1R3WHNzR1M5ZVRPa1dxUEhWQUFSTzFpN2loTkJidWhSQUFP?=
 =?utf-8?B?alRwbmViMXI5NlJmQ0xnTVVOMmsyMkppTmU4ZURNSU5pbHJJUTBTWUdaQmZY?=
 =?utf-8?B?S3h6dStjTlA1bFpTMWJmME1GUnV5ZzBJTkc5a1JGUWU4bTlmdGY0Uit1VGFD?=
 =?utf-8?B?bTNySW1HdWdRSE1TakdqK2tXVHJJbFpZbFJVZ1dvbnhVVlp5OE42V2hFR0cx?=
 =?utf-8?B?cEx4eENjYTRvMnZEK0lwMkFLWVlJOVliMUh3Z25pOC9lN00vY0xqUDFOV0xG?=
 =?utf-8?B?VExZeXpCdmJVRjVhSk9aS1FWc0I3WENMdnp5cHo2T2pGVzRRanR5TU1rRWZk?=
 =?utf-8?B?MmxQTE5VdGJ5U1VWQVFlMmp4emVoWWxpb1dzNXZValdHSjZ6S1QwUTBwTk9Q?=
 =?utf-8?B?eXBUVFQ0RXNRS0VyOWhVanpSbHE0TFFEbEsvUXlEK1JCa2dhSjJURU1QenpE?=
 =?utf-8?B?VHhudlEyY2gvNkRYMXhTZEUrYWIwUDZuVW5JZFFqSEl6SkN6Mnc5cjRqM2di?=
 =?utf-8?B?QmZkakhjUDZtaWJRVmxLZXF1VzVKamRPOTlCSkxjbjBKTU9HUjM3cmZpZFI1?=
 =?utf-8?B?V3lBOU9xSFcvWEZiSmRRY2phVzkwU1ZBUFZaZklMN2pwWHZFbFRDUGt3Qmxk?=
 =?utf-8?B?QzFDcHRJU1hidDlLd0puWm9uaFJVaE5DdnpGQWF5TVJsOGlrYVAreU84U3hp?=
 =?utf-8?B?MkRYUEF1RXBiMWFoSkFOdmZRWjVGOEV4UWFhWUZXWnMwL1Q2UGsxb1l3NElV?=
 =?utf-8?Q?v8Q9tBSAzlO4dhinn1ATaV5FHEPMfIR/rWDlQJ6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef6a106-f59e-4e61-35dc-08d978ec630f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 08:31:32.0331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0rvdgNCRx01AgzG7RhR0wYGb9bqM5eUUxs7TzwyMNhg7NVN/YVbYDmqDuCqEHDFXsLhsuqh716BcV9DS1vz0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

On 16.09.2021 10:18, Tian, Kevin wrote:
>> @@ -1737,23 +1737,33 @@ static int domain_context_unmap(struct d
>>          return ret;
>>
>>      /*
>> -     * if no other devices under the same iommu owned by this domain,
>> -     * clear iommu in iommu_bitmap and clear domain_id in domid_bitmp
>> +     * If no other devices under the same iommu owned by this domain,
>> +     * clear iommu in iommu_bitmap and clear domain_id in domid_bitmap.
> 
> what is changed above?

A style and a spelling correction: Capital letter at the start and
a missing 'a' in domid_bitmap.

>>       */
>> -    for_each_pdev ( domain, pdev )
>> +    for ( found = false; ; domain = dom_xen )
> 
> honesty speaking I had to read several times to understand the break
> condition of this loop. It'd be easier to understand if putting for_each_
> pdev(){} into a function and then:
> 
> 	found = func(domain);
> 	if (!found && is_hardware_domain(domain))
> 		found = func(dom_xen);

Can do so, sure.

Jan


