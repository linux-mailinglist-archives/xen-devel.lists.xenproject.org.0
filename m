Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D859971A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390144.627402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxQ2-0004PO-Ah; Fri, 19 Aug 2022 08:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390144.627402; Fri, 19 Aug 2022 08:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxQ2-0004Mr-7x; Fri, 19 Aug 2022 08:31:54 +0000
Received: by outflank-mailman (input) for mailman id 390144;
 Fri, 19 Aug 2022 08:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOxQ0-0004Mj-FB
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:31:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f1d5a36-1f99-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 10:31:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5401.eurprd04.prod.outlook.com (2603:10a6:10:82::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 08:31:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 08:31:48 +0000
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
X-Inumbo-ID: 5f1d5a36-1f99-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H54ObffAJs9Xti0a2lkqU89Vzxn58yB3D5FnnrV7rrfY1KKqMOCBSupTFHcbyPsJfWnDU0gYsOFuZ52JS/MZaHyQGbl2VZzMKzK1z/Bp+NCWHCwDw/Cd8fEimidDfkc0BLyLkTnGIht7zviE0kC3Ex1utRJz+MLnXMakLma13o14Vn/JrPBxl6STbLrCcslKUVBsmEsL+603FuY7Np1x1Mg5t7No86EDqXAX7yxiS+Vyad4um7P7Kr5HQe4e6qi93TQF+QxcU0tg76TNQXnJD80xdU+H7sa0hKt4PxwMk0xK2LmQ1LcXfgcA6h3t5ib9//W6RBnNFGd/XvEVoZc0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLFUZnovX0PeZSMhpjaT+QOsWTG07wTUM0QqRYFgYrc=;
 b=TlHwMvW+KftTUqzYkBzOddlacKF2yBQObECpUQK3hdUqfX3q7y8+bneI20pq0mpajjtgx/7qiKTL+jL0gwC/L2mtWJyAfr5ALvXNAdxjwUkVfuH6EWjjgnfmb+IxCee4uCgNnccGFGYSKF3u8pDCUqmFOdVt/LE41KsDGcgy6J3eSLgqJ9UNPIR3goYlWsYR+N7iBeH7/y+99SS+ND8TGpXrqIUNMDx0KbjzIwGpeOWRHrIC7/rjdYvz7d6yGtE0a2KY05T8Y1dY2QKdlj8kubg7UVLagCaPbuf69sxynoblsCUs+MnAVuAtOTjNbJ9ParIHiWzBqFiASA4sQN2Pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLFUZnovX0PeZSMhpjaT+QOsWTG07wTUM0QqRYFgYrc=;
 b=eqlRPJxbaZcD+1ZIZVIwbIhoK1IVYf1IoGZJ73FXkjIx6pCrsBm2ih0oI1FbMXcN+LkoDZ9PbltILogdsu44PlIOZNuMAkNQRAkb5lEl+xwWBwBh6NHHcuKzHh9Vvwd8Ib25VRa9s+a6l0aNhs91mcR80+SET69YJju6DAKoWptnI/3/xSslsCMsHtO5CIfea/J4C4mrHCxEZPEH4ky2xRknAM8Ytk4zF6Rb1xVGSmSHg5uI/2qQrQxosqVdoje12Z7DV3gkYcZthpCF+fuo/kAxdKlpmqcsVz7RT4o8pF9MqpxvqHfWX18CjzNB2y7xo+4FOmy4Y9x3fVm6CxQjwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a6e389c-3774-a625-042d-e10b7e87ace8@suse.com>
Date: Fri, 19 Aug 2022 10:31:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] Arm32: tidy the memset() macro
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
 <6da837d7-4784-f517-5c24-2bbe6a2af2be@xen.org>
 <1e5496f9-47f1-3cf4-794a-9a840ee7c59f@suse.com>
 <acdebd64-0f0e-b391-271b-0725e4a56c43@xen.org>
 <f0e42732-87fd-396c-5d79-2087666b0eda@suse.com>
 <fa02a09b-ee7e-b1aa-d183-377aa18a591f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fa02a09b-ee7e-b1aa-d183-377aa18a591f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0046.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aa2f9d6-d5b5-49d6-1f4e-08da81bd422e
X-MS-TrafficTypeDiagnostic: DB7PR04MB5401:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vBQtJx6MXUy+bl2JRi3CtD1aNWNe2U9laJ5b6FBmcbGW0kyoNWGUyeZG9CAHiwLBYh4l5+xKEzUKFsCDLNmRC6aV34TnmrSCP9snLw99oQ0hGH4HoIG6Pw80bFISCl2zdTP+gueZaasuqnWW9OkuX4UE9kRTiiRHpAtsj/UklRbQ3DT6SGBRak3M4dfp++CVVrDbaSc8/7kr+yXJfCo9k+qUhBYkM8Ji9e9qjupdp9HnE7VMcmh+rspkMTXXq/CX5e5msuNwcgky1hka3L7GByHz3vEjF5aH0fuXMjwzxQ1BZfjhr0YqjMtv5Y+Vy8SIeY2KhS/ihpGA+YIZafwAbBXhwO4PuC4bIfR97OnkEGUqTLz8rTm+FIPabXcfoXvJVWC3f4JYA0uko1apnLWudRfnk+Cr4+v11lCNdIaUFfHGQm1pYm/5/gx9EN+QsEpWIQmJvb1r9MHPNTif64/9JGkfe9mYXt/75VV5EBfx+bVh9Tx26P5F3NjeeRmEWDMVM6WB0JFkU3t74xc3FIAJ+lE4xiROMQzVOL2aCdIZlDAFglw0MEFEJiu/PhbB3Eo1M0JH1vKb+an+AqVqpgrE2Rudg0VUK5FMjQR4KB2eoLbRPLpkDSpEAkI/r59IKmW6sq/PUwDpoxH1IKPnKm+hAAek9JXQnCcUdDenHIbeG3k/UWPhGPB5zxM4Y5GfVAOtmZ9+F1Cx9alXBQI4mi7KzZsrdHzlSS+pwajLa4lWraaTUWT/hcRAxewVMzGF3t1SIipRNjQn6gCOoIfUEVy12M/dr4UL0v5NrkWz246xlAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(376002)(136003)(396003)(86362001)(31696002)(2616005)(186003)(83380400001)(38100700002)(31686004)(53546011)(316002)(54906003)(6916009)(5660300002)(2906002)(36756003)(8936002)(66946007)(4326008)(66556008)(8676002)(66476007)(41300700001)(6506007)(26005)(6512007)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3UyNkJ4b2dENEdGQzNKa2E2bWEvMzNvU2RWSXJuU0xzUVlpc3ZOaGVyY0FJ?=
 =?utf-8?B?T3ZxNWlONmFrYm0vT0NZVUVtNmEvZWpWMmNMOXdSY2dXYkl5OVd6NDFFaUZ5?=
 =?utf-8?B?T0xLZXVrNU9aczJFanBENDRudTkvamdjWjNRM29pN0JjcCtQSWpBekFoNGx1?=
 =?utf-8?B?RjluSmxadGVYNzRNY0NQdGVlSkFOanZNTVN6TTFya3BWTkgrTjdvazNXZUdo?=
 =?utf-8?B?amZieDdiVTk3c2NZWUlEbldUR09mMytMSTFWMktNTG45NUwwMkhNWUsxWDdQ?=
 =?utf-8?B?YjU5cXArRzFJTzBLYXhSWHhheUdrSTlkOEQ4TmlVSWJSV1lpWDRiRE0wSjRl?=
 =?utf-8?B?SzlObVl4QS9Yb3BOR0RmbnRGZE9QTVNOUHNpWkRYUVMvQ1FBalBjS2tCejhJ?=
 =?utf-8?B?VEJSanZ6U1dGYmRaVmhnanpFY1lMR0VyNGJxTElwN2VSVUE2Y2s1TXJZdVl1?=
 =?utf-8?B?R2I2ODd3bVlLcmlyWG1YRFU3NWNDVXZNTkhFdlo5QitMN3JqS3dub1BKa2VP?=
 =?utf-8?B?Ry9IZXZJRGxqTHF0WUlNZWY0OGVZYi9yVkk4Q1huNTVONU9LUERPRFFkb3du?=
 =?utf-8?B?a3Q1OSswTUN0MVJ4c2JWZi83Y2FnY0tETjV1NEIyeEVhaHYwb0NZaW5DSVZR?=
 =?utf-8?B?THA2ZnpPM1Q4aVFKemVBOGV3WHRVSHEwdHgvUkduN1RwVUo0RSs1dC85TkpG?=
 =?utf-8?B?T3NnQlRwYVRMOTFEMlROUUY1aU0rVjNBbUtVb1U1Y3EwS3FQSkZwdVU0aWZ6?=
 =?utf-8?B?ZDJvSDhHaWdxZG9uSGpLYzBFWnptbVNyR3M5bCtkYUVUSGFNMVJjZHQrUEE3?=
 =?utf-8?B?Z0s5SldleSswK3pGWWZUa2FVSlRUb0xsNmVXSXF6MmUrWkF4OWhMWTF0aGYy?=
 =?utf-8?B?ZGVOdkd2bnBTRE0zU3RGbnN4Qzc3VUFBc0lYWjMxSnBoMjhEeUtPNy9vZDVF?=
 =?utf-8?B?VEtaZW5UNVcva3JsekdHcloyMGx5cDAzTXMzbEFjMG90alRXOU5xNElrRmhP?=
 =?utf-8?B?QTRqR2lLTWFjem1nU2xMb1JYSyswWDVNSVlaOTN0UUc3cHhBdHo3bThBcTV5?=
 =?utf-8?B?OUIrMVVKM3NFMGZHSTh4SjhzTjZPT2s4Z2JsTEFIMlV5U0tnd010WEJkRUNo?=
 =?utf-8?B?YkxvODhsT29COHNpQUNPMUIreDFUQW5hdlNzY2hoc2NjdXhhMExmRVpXMi9G?=
 =?utf-8?B?bzIxeVpkWXd0cjdlM0ZSMDRVVUdGTHl0dGtqOEkxdmRSUnNtQThWWUxwaFVO?=
 =?utf-8?B?dlNocjVydC9SUFFjOThycHJhK2orajVTbnlXbkFYTUZ0UFJVRHpNbWRYWHdk?=
 =?utf-8?B?NXU0R1RFU3RMbGpUazhyc2VxTGZRWDhUSmk3dXB0elh5STJmV3hNeFc2Y0hr?=
 =?utf-8?B?dHlSYkk4enpMdjkvZE5tVGVEL2ZyR2luUkNlOGVkNjlhT1lFc0gwazJTK2h0?=
 =?utf-8?B?dGIrMjVQcWttcTdxVlVOUmpGcytjbElyaTdTRzZFQ0hoWVp4Q0lNNGxqMTgw?=
 =?utf-8?B?QU12RXRmUEQ2NUpXbVN4c2N4eG1VRjZJZXJUbGZqU1ZCVWxoTnpzQTV4Zm83?=
 =?utf-8?B?cHVFK0ppQnlnVmF6MEJNZXpzS1BPYTB0aXRXYnMvaUIvSXpzdXUvMWh3UG16?=
 =?utf-8?B?a1ZKd3FtUUthYkhMYTAxcnVOL0RqTG9kbVVtejFsMXAyK1JEL01ELzBRVHpJ?=
 =?utf-8?B?MEpTSEhlRnVNRkN3aFVJZ25rVlZ3Nm9XNXpmYmRvY2FYTjZiL3lMRUxKdGdu?=
 =?utf-8?B?bFB2RDYyWmV0WmV2ZngzS01TUlMrOXF0UHVsR1Q4RWh0czdBOVV6UDNDUytF?=
 =?utf-8?B?cVZVV2JDdWFMSWtSclBHZnp3Q3RFWGg3dythOHZJSlZIanJXWFlkM1Z6R0t1?=
 =?utf-8?B?N2VFSVhWWTU5U01XcGNEZGdsMHNBayt6MERXcXJuQWMyc0J2b0R4anAzd0pM?=
 =?utf-8?B?UE8veG4zaDVqQ0RsYWtwY1Z4eURZSW9vQldvSzVnY3k2U0JDNUs3c2NDMEdk?=
 =?utf-8?B?RWlsVEVRbXBHV1BzZFB3QTZqOGs0ekpaZHJpZUdxVVkzS0pNaEc1QkVCZkxx?=
 =?utf-8?B?dTRNVHp4ZTQ2V3ZVS0J0VGdDSjZzbWcvbDVFWm5zM2tIVENxQll2cUVGTTd5?=
 =?utf-8?Q?WTzsbjJB3Sq49hX2QN/eknJcu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa2f9d6-d5b5-49d6-1f4e-08da81bd422e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:31:48.6717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NHiiMbovb/WyLOsVaFI1YKYHIUo5ZJBEgv3kjIHYk0dcsfmOo+/Cgz5CKqMjqhowEvq7R1p4P1hJayPKWTYeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5401

On 19.08.2022 10:24, Julien Grall wrote:
> On 19/08/2022 09:11, Jan Beulich wrote:
>> On 19.08.2022 10:06, Julien Grall wrote:
>>> On 19/08/2022 09:02, Jan Beulich wrote:
>>>> On 19.08.2022 09:58, Julien Grall wrote:
>>>>> On 19/08/2022 08:50, Jan Beulich wrote:
>>>>>> - add parentheses where they were missing (MISRA)
>>>>>> - make sure to evaluate also v exactly once (MISRA)
>>>>>> - remove excess parentheses
>>>>>> - rename local variables to not have leading underscores
>>>>>> - apply Xen coding style
>>>>>
>>>>> This code has been taken from Linux. From you write above, I don't see
>>>>> any strong reason for us to modify it (even if it is small).
>>>>
>>>> At least the MISRA issues want addressing, I suppose. Plus I wasn't
>>>> able to spot the macro in Linux anymore (nor __memzero()), so to me
>>>> there seemed to be little point to consider keeping anything "in sync"
>>>> here.
>>> I read the last part as we want a re-sync of the code (we haven't done
>>> one in the past couple of years).
>>
>> I'm afraid I'm now really confused: Which last part? I don't see how
>> any of what I have said could be read that way. Quite the opposite:
>> By stating that Linux doesn't have this macro anymore, isn't it quite
>> clear that there's nothing to re-sync against?
> Your view here if we will never re-sync the code. This is incorrect, we 
> still want to keep it close so we can benefit from improvement in the 
> Linux code. So if you start tweaking the code just for coding style 
> purpose, it will just make it more difficult for us (I appreciate this 
> is limited here).
> 
> In this case, Linux has removed __memzero() is patch ff5fdafc9e97 "ARM: 
> 8745/1: get rid of __memzero()" because the performance difference with 
> memset() was limited. For Xen, I think we should also remove the function.
> 
> With that, this patch becomes pointless.

Of course. I could have named this as an alternative in a post-commit-
message remark ... Looking forward to the re-syncing to be done then,
at which point I'll happily drop this patch.

Jan

