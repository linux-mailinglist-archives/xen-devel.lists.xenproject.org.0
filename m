Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86960AAAB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 15:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429143.680001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxdK-0001Ub-7l; Mon, 24 Oct 2022 13:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429143.680001; Mon, 24 Oct 2022 13:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxdK-0001RV-3a; Mon, 24 Oct 2022 13:36:50 +0000
Received: by outflank-mailman (input) for mailman id 429143;
 Mon, 24 Oct 2022 13:36:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omxdI-0001RP-6y
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 13:36:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e79f8f86-53a0-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 15:36:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8719.eurprd04.prod.outlook.com (2603:10a6:102:21e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 13:36:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 13:36:44 +0000
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
X-Inumbo-ID: e79f8f86-53a0-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyqPWmJS8gcfLjmGOCu+8PFQzgZpTKV5Fg42YCwD6QenGiEOhF0bHKK0tr59GuKN8UMviqlhTll+kfClJdyR4cu+g9+eT3zhv8lkCNmQVe6VXaaYpsC9kb5ObMU7Yl+7raimwCapf9Ll0HshbSqH8adww6rWF94gV6lX+cfFOOSa6etIzxFkLKjWVTtYUk/UiZgSOVdcxoHddNreiUqe/FWf8Z9XDVUqUv0nJRwllrKIC7sZS2EQchv3tfK3diFZsb3B3UAeefEpbARG9RfQd/J1WzVZZxHLrKZS9hUEkft4jQatmQI5zXBLew84ZrogP+LTm4yLJQXvOAiDHvHebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQVVnHeufOgRvgilYAy2o7HB/4N387WL7jJGgdpiO3k=;
 b=nffkiqyqWMPpAl+MTC1U2hU7YArtHjzrurwtGJjYICmvdEW1zNmsINUdaGA4op5vkDZpSH6XcT1CZ9wnNSwHgtIx7C70ufHrEA2DxqSKYiylkcWM9rcuJZTrwd8jgoRX6bmQ9Ot/PshlYcrnG3BoXmmFrQx9Mxz9RE06KGEwsl2yo3Umj9RaqcYSRUKF6a8ycBJXmOeNl5lwwt8lTHToLfNwRSdxNDb9/q51hM8PQX0HJfJb9VNFwgv5bYMnbWx3Qr9Bt9TlHFpPPRXyMtUH0IajhROxoVR3G/mOcQ+2i8a8lGeOGjUEnW/SuCi4Csk6Fgpl48Y9b1VThhF71++CYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQVVnHeufOgRvgilYAy2o7HB/4N387WL7jJGgdpiO3k=;
 b=oNBtpSdMmSs3C2P5+XKfO9h0duOslVxQhh86VLnLHV6yN4uRNH4pEjODYVvP/l5QUL9T5Roi3yCMcGQrXwA0sFH6OhzLEge1DSUWS4Bhs9Pn2+a9rM4JI/N7OHg/VUlpXJRBQ41SpCuhuqcgEdtQw7WU9JIuGn3M919DBFWo+OgQ9OY8PjEcIbvnK8VxcG5/Emx/yN2D0K5b4Wv3Fcf/P3mupHQUOdHNgu/hWbjAW+VMiyXfvkniEQAzpQrQXrhp6JXfhf57O7qn+AaukPUf3kJLF6czAH7G7H7lLBf5KiNVUdTVsZY0atRjRpySt9pd44fVqCdGR3SNTkqJFnHJJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a49e42d4-90e0-8f8f-f0fa-f199d39c171d@suse.com>
Date: Mon, 24 Oct 2022 15:36:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH][4.17] x86/shadow: drop (replace) bogus assertions
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e447da22-23d6-d3db-313d-4e4ca009c3df@suse.com>
 <Y0k6RSI0VJhTVmEi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0k6RSI0VJhTVmEi@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e49f0d-e1d4-4bf9-e0e3-08dab5c4ca3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SFiz/LYgoI1HxA0nxsbBf7wajdcQI6fjU0PDTvNmKWsRA5jhy9Q1H4ZOoupBKtOLwrlAkNJiuJxJg0Ykrmrmsuldz5sxpdq7y6sx9BFwKDYgUJZ9+TWEAAV4LgIdOT/MkjgRstvVfWkUVz+uw2gjeyMxyN1QDI4jg2MNXhvBK77dA5j2nG+ePKm2KAGi5KWhhKrixxy/JKiJDgdR7zyRCaDVCdSKOZItZJYfyHTBiBzfeSfoch1uO3m0BSsfhnXX6Qg2OhZVMJQ/+/EjWcLCz+KEh83O/wnH6KxSzv3gz/cVq07PGDd0s5QfMoipQmZosfzuS6FO70zZT7us4Kt0LechzNsdG8gYUrXBzmTnMwzMRnEE85LBMhMI1GEntlyMeu15R27dVuUMBE8V4GwI9/ORRp9T9Q9+vyr0Wx9Y6RWVwUcVtSmjm+rKoLti/QreGOmKtj6/4ZTGncR+gE3h3b98RaoJRjMzHbWgump0Yj9x/cJLOJgNGAAh2h5Hzqayc/2EukyA+zBlq/6CCxu5CREDNmWxbZgBYFXLzFsUR7r485hIbHaLeY0KNzeIHJbfpnOYKooysFKAawA0B7dnRqk9CxUyACE8eNGyOOCFdzoKnvjHto/rlDS86lPAIWkiT4T9+p2qEhHO5eNFXMmBc0KJprTHsRpSx162FL1c9pVzyXUZ6t1HmLJzavEyGRVyvD8Nr4hUcdKITpC6go4yvLlpxkC1tzi+09kDiUFzftCdabchJ0CNv1OrlOTsIwzUwhs07QLiY0YV5hQWX46rP5o81aayLA0RJjIgJ02BDes=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(86362001)(31696002)(83380400001)(6486002)(31686004)(478600001)(66476007)(66946007)(53546011)(8676002)(54906003)(66556008)(4326008)(36756003)(6506007)(6512007)(26005)(41300700001)(8936002)(6916009)(5660300002)(38100700002)(186003)(2906002)(2616005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0dJZUQwTG81OVhVazh5L0FseDNDV2xCMHFGbWZSOFFXeU5NSUVGVE9IbXRX?=
 =?utf-8?B?VFlXL0g2SitxVDNoMjFZT2hLZ1RzM2lZOGNuUnJacGlrVVdlUUNyZ2s1M3Jw?=
 =?utf-8?B?S0tGT2ZVZGUvZXpKQUlSUU1WZ2VzbXFnb2F1NnA5bUEwZ2V2ZjFmRXVscXhB?=
 =?utf-8?B?cUxMVUJPUTlsY0NQUS85czZOTjFaeGQrdVZmRWt1bERiY2J5WGgwSXdrRlc0?=
 =?utf-8?B?WDA2MmFVQjkrRXZKWTlISStQM2JCR0lSWUlwSE9KSXJlS0xlbkRacHpzcWhP?=
 =?utf-8?B?R0Rvd0RtdzA1M25jMFdUSFk2Lzh1ZEpPckkrVm14a1J4cWIzSHFoclRhUGdJ?=
 =?utf-8?B?bkllcU9OMTN2ekRBSlo5a1VwOVZRMVh0dU9oRFEyOWROdmtvL1IvcnVyK3U0?=
 =?utf-8?B?dVdDR3hFaWRUK0J2eVB2aFVldVhINVBHTlcvZUViRjNDWDZsaGRNeW1mR1RG?=
 =?utf-8?B?dmRjRlhQbSs5YTRub3dpWjd0Z1hxeFhrUnBVL0tGSDZILy9kNk1lN3V4d1po?=
 =?utf-8?B?a2JQSm9zcGI2UUlSRzMyUTJoN2tiem11SSt5RCtMNWtpZWEyemVnV01JYUZJ?=
 =?utf-8?B?bTBvY2R6VmM1WXB2di9pS0NKSHdid0NyZFpMLzErUDIvRlE1MTZsNlBSbjRB?=
 =?utf-8?B?MmdLUEV6NFBjNGZTcHhwT2dJRjczKzFNT2MzZldwWFBLZHRoSGpMT0l2aVN0?=
 =?utf-8?B?ZlB3UEhPb2tiOFdNOVZWdW0vN2FKdVdrY0FOckRpVlVjWTlwV3VNbFpkcmh5?=
 =?utf-8?B?YXd2MWdYa28ydzl6ZGZOS0RsbTZOSUZUeVVTZ1owbWFBWGZVM2tFZURUWWty?=
 =?utf-8?B?TVJtV05pdUpkdTd1QlBlL1ZONElXdHoyNm5mcUlacFNiSVVDdE9uZXRUd3JS?=
 =?utf-8?B?SGozZWpreTNULzV1d08xZ0VVdjNmMGNEUXUya0E2MGRtRXNIL1dtYlkzWkto?=
 =?utf-8?B?V2w4aVRFWm12bFYzSDNrYjhJazE5Sm9aYmw1V0dNTkFidWhmS08yUkVPeFFB?=
 =?utf-8?B?cFhEL2FjVmRRYThXbzVhclBtUlZFZTIzOHRMTGV0WjRmYS84MkE3YkpYWEsy?=
 =?utf-8?B?R0szQzBmN3laemxkaHhzSHlwQ0U3c29ON1gyc1hKTUxsV3lMTDd1aCtuaGYw?=
 =?utf-8?B?OTNmWVZzeXhwbklQbXlYSk5XYkVCNk9YQjZBbzhLSWRrNm1NMlZMaXVxbHlM?=
 =?utf-8?B?S0hkNkRBSG9GdVpIVUloZ01MbWIxeE9nVUNEblBKOTNzbjdNK0diQ3VoWWhx?=
 =?utf-8?B?UTh5UEpLTXpVTjVKT2dSU2liaExoQW9SZTdLQy94UnZ1YnZoRFpPWGJmYnhm?=
 =?utf-8?B?azVxd25OWmI4bmxvS0pxUjA5UUh5dlBhbUtXcGo5UlZlSmRQcmpIcTZ2UzEv?=
 =?utf-8?B?UkVWUytuL0dVaXJPZitIdEJhMWZ2cE55UkNWRHg4eitJcUIxZnVVMDRZRmpC?=
 =?utf-8?B?WXFLSjJCQkNVTHA0cmRNallvMFlleFY1RVAwanhIc2NHZmFPNURxTlg2NVFu?=
 =?utf-8?B?anpzWVYyMWJHQnFWUDY1VXg2TEV4VGxLcDJETGxSWGRPazAxUVlaL1dPdm1z?=
 =?utf-8?B?VkxaWVNzd3ZTZHdUamJETzdmdUFubnJDUStBWVBXM0dBVVc5N1dDaW9qNk8v?=
 =?utf-8?B?TUhkTGYzdTlGY052N2txaVFvRlZ5YlVRUmw2bzBHZHQvY29Rc3J6eE9ZV3Nk?=
 =?utf-8?B?S1pNK2lOeHhhTE41Rzc4SDc2MThnaCtISU9zVHJqb1BaeUF3S0tCbzBEUGlF?=
 =?utf-8?B?MjJ0UVZIMDBPSWROci8zZW0ydEc2dTlWQVRyYUNNZVc0YVl1eVJiMEcyTk9n?=
 =?utf-8?B?T1NiOEthRHJnc3JtQjhsMUNSZ2M2UUN6RGhqYktWSFMxMHhFeVVPVnFtVEl5?=
 =?utf-8?B?bENmQWwrVHl5ZDRvTEZWN1JuK1RFWEs5SHRGU2ZJSnErMUlIOGd2aG5EdTRx?=
 =?utf-8?B?NkRxUXJpWVRuSE5wdUtESHRaRVozQnB5eU40VXZCWWdQREdnZWVQY2hHZXJC?=
 =?utf-8?B?OXhzS2JZQzh4R2Zvand3OG4vSDRUUWFiNzIwdlE2anRBMmhXWm9yNXZBcHJX?=
 =?utf-8?B?NHI5a1JBWDN6VDFUaDMvWTZuYldjb3pZcU1HcjMyRGsxRHFIeWxVazFoWG9h?=
 =?utf-8?Q?KyLOAO4KXiYK4Pb3K4xKGhtuN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e49f0d-e1d4-4bf9-e0e3-08dab5c4ca3b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 13:36:43.9048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKQmAfihSS31+Q+0F94Bi5mc7hTaRu2RiJcre0tWiW3GclNdlmp19BklcscrQ9VXn+RLQTmCDWaGVKQazg8mNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8719

On 14.10.2022 12:30, Roger Pau Monné wrote:
> On Fri, Oct 14, 2022 at 10:49:55AM +0200, Jan Beulich wrote:
>> The addition of a call to shadow_blow_tables() from shadow_teardown()
>> has resulted in the "no vcpus" related assertion becoming triggerable:
>> If domain_create() fails with at least one page successfully allocated
>> in the course of shadow_enable(), or if domain_create() succeeds and
>> the domain is then killed without ever invoking XEN_DOMCTL_max_vcpus.
>>
>> The assertion's comment was bogus anyway: Shadow mode has been getting
>> enabled before allocation of vCPU-s for quite some time. Convert the
>> assertion to a conditional: As long as there are no vCPU-s, there's
>> nothing to blow away.
>>
>> Fixes: e7aa55c0aab3 ("x86/p2m: free the paging memory pool preemptively")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> A similar assertion/comment pair exists in _shadow_prealloc(); the
>> comment is similarly bogus, and the assertion could in principle trigger
>> e.g. when shadow_alloc_p2m_page() is called early enough. Replace those
>> at the same time by a similar early return, here indicating failure to
>> the caller (which will generally lead to the domain being crashed in
>> shadow_prealloc()).
> 
> It's my understanding we do care about this because a control domain
> could try to populate the p2m before calling XEN_DOMCTL_max_vcpus, and
> hence could trigger the ASSERT, as otherwise asserting would be fine.
> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

In a discussion amongst maintainers we've settled Andrew's reservations.
May I please ask for a release-ack for this change, so it can go in (as
a bug fix on top of the recent batch of XSAs)?

Thanks, Jan

