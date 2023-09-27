Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501057B0348
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 13:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608913.947719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlSxe-0002dT-SK; Wed, 27 Sep 2023 11:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608913.947719; Wed, 27 Sep 2023 11:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlSxe-0002bH-PO; Wed, 27 Sep 2023 11:44:10 +0000
Received: by outflank-mailman (input) for mailman id 608913;
 Wed, 27 Sep 2023 11:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlSxd-0002as-AV
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 11:44:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a386ed1-5d2b-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 13:44:07 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB9007.eurprd04.prod.outlook.com (2603:10a6:102:20f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 11:44:04 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 11:44:04 +0000
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
X-Inumbo-ID: 2a386ed1-5d2b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3cVZdR+ruLXlyEdknlEUXuI8AbuuY8Zn+aROrsayjWPrbxAPSuHDrCxThQyXPJllUm/33nHmQ6IdCsQnyV8FuazQHihP6FNEyrnuMs7Z5yX49KfRdPxikGiroohuu4m4yhRYelBp3QwiE8Y56ywibm7jInn48akNbwBwnempskx1GH3sK2SH2Kr63g0gwnAim5otswUaEfvLIG6diULwjWCReL7OzuZzIcmN5tqkegK4Rk9InkKB/n5eI+sNX6ktizO9Iw6s3QIbbqw6QZJIrpfSZZ9GP+gQT93dvkyr4hzhZK87tUyuMpx4HJI8jHPAbF1Iogp+1AjMgaazhjcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRJGX9XiEtrrk9vEYMkVT1aeuKnmYmmlMELE39CGDEU=;
 b=n1M2CE19x0ZRWv0KpPypUkt+1vN642jR63LEUBuWFCwptFsaL1V0jsWwaFjTPkPWjpEFNyCA13sC4lZUeH+5XsINoignHRhMvsGVqa0sicYuvDKmvAcv7ndYNZi8bFhojhuA98pABz6hJVVpr6ggXRT2FB9XlaqEdBewEqPDFG89jsJyObOkgVUjhvQIwGTUaCRchtyNASWTJKahxDkChw8QB+rIihRnW2Mn2dh0DNmfy3v4WEmLX9jPGbNicZj5/GTEblzxuIm+gwb9k7LOA9MsbPPtrbQYUYxMegXcIQmPASisaf3tdx78DTorz7YQSdiVXhlR+169U354qEDRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRJGX9XiEtrrk9vEYMkVT1aeuKnmYmmlMELE39CGDEU=;
 b=f+OvKRSm90T7dnFrZDpcnci4yLRfPS08ZI4iIM8vGdj2GZtQXUCEPPu7YsofoeHjll376QFUUIZfT5a7hL5xpF8k3v0pJ2BMpEoxxXGTI2PV/PUCcjF87jzQpiBSJUi9rXoPqfMWQKy70B8HZmIGU/lcmu7dXiRB4Owh11mr1WsDMST+uBrYZhR/+ozdn3/N/9pKuONrTlIXbktwZsgUUXxy8rPWMnXQi38EQmA4vWO9Z0kcTmk031aMwESo7svTqdwxsIF2tvGDJrLrg3zW9vjqbDYiOQgwfOuyN/jd2XE4dS7ZKhELJc2xOL2kwHbaEjtJYCmy74IqOq/SXnDARg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <233a6993-fa1b-fdb0-596c-ebbdeeeae226@suse.com>
Date: Wed, 27 Sep 2023 13:44:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/8] domain: GADDR based shared guest area registration
 alternative - teardown
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <68cdb299-c41c-b6a5-c9ce-bd915508ecf2@suse.com>
 <ZRPtI9UfgpCfQ4HU@MacBookPdeRoger>
 <4e1e0b28-bb0b-03f9-d62e-dd04846dd2e4@suse.com>
 <ZRQHA0u5wPXkuILV@MacBookPdeRoger>
 <e0080de0-d64d-8b38-40e3-5bd779651ee6@suse.com>
 <ZRQJCPNvwMs_VO9B@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRQJCPNvwMs_VO9B@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::6) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: bc457b38-34d6-4dd5-7adf-08dbbf4f0cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lDW/F2o2uJLvUswqNdGJRepqLDckDe+p2p/ZNA8lylqy1vL5GBTP8WQVfBszfYD94RzEvF3c57gXRptwPgZdstyPHxN32YnL7lrX9qDD0oPXLZcQLciAYnRP+iTh2K7swsnb0OvU632GMZm+8G6otQZlTZ/HmvNK4lr8N01uoOw9tHhb0mwqg6vV9fvyi+r4e6ylnwK3PBsHjj+QAlFR/HkURvdTzJdKuiYe/pUEyqaL+9Si63jvRkm922cihmhksvuPLKLN1vc3DJ+kRVcm33ho4dTlSoJX3oinX2C3oztso6vFa6gtAHwSrfELsmv5Rje3zS4sz35SWR8PH7eqZrNaSVrwkeKUmYdIseIDV94rNy7NAi05qZOOx2KocSiDRkHkMvJLN/ufttDrWVgM9zsx4/Zs5HiqnfEBPpqWs9yxe3b28GpKMGOtt9f4JyOOsTiY2HuNuWGBZLmQEUjglEbrt3UGez4eFmDjzZKFb/RPxzFgEqmWUlwpLvKwOhA4ldhqli2H+1APste+wYT9PtBaXjU25qQ1lTlQITrF62LYZNARtX6DcugA8nk4+mDJCRp20wrQXAhrEYBkRyuej46Hitjqhn6x2mrdkajCpOIwxmDAfxi0t2ff+vPXcLUIpC1xI4DoZpU7JRqaYY5tOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(136003)(396003)(230922051799003)(451199024)(1800799009)(186009)(316002)(41300700001)(26005)(2906002)(8676002)(5660300002)(478600001)(66556008)(8936002)(6916009)(66476007)(66946007)(4326008)(54906003)(31686004)(6486002)(53546011)(6506007)(6512007)(2616005)(36756003)(83380400001)(31696002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajNyaEV3azhBTE9kYUNBYnVHRHhjQ0JVeHNRNDVwMFNIZEJxVSs0dWxRejhE?=
 =?utf-8?B?d1VydDlKR0czSmpCYXJJSVNucWhQaGJoV080bVgxY2tYb0VBVjRCcjdVbEZk?=
 =?utf-8?B?NDA2UHFRKzJnNFVlMERwdUVuMjQ3YTdhYUtuSzJSSUFYZUFzNkpLcEdhdHpJ?=
 =?utf-8?B?cVUrWDVSSW1OTHJXVUR6aklvMnZOR0h3bGY5QmFXZXJacjFtNnlCbUFSRURZ?=
 =?utf-8?B?Umd3VXExLytLd0ZtZEx0RXNBY29xN3ZwYjQvS0tITTBnK2U0QUo3MU9rWmNH?=
 =?utf-8?B?a0l4L25yK3B0UzI1cmZDbTV5b01IOXRqb0kxTGpwUXRGclIwb1Q2YndaMlhl?=
 =?utf-8?B?amwweWRWMDRxUHZoRnZSaWtMclhWaFdZQzlCSWJqZEFaUlZVVnVEdEo4cUdp?=
 =?utf-8?B?R2s2cVBxcGNGbjVvd1F3cWtjSll0Z09lSjNGNHpKbUNvQUhzdnl1OXVUamxv?=
 =?utf-8?B?MUliaHpYRHFxR0VrZ2YxZWhpL1V1Sm1HRE8ycnhlRC8zZkgwWFdBUHZ6dzNP?=
 =?utf-8?B?NGJTK0FQTUdXR1k5T3RnM3J3RFBEamF0cXhXNUpMK3FSVEIwMkkybmRySWh1?=
 =?utf-8?B?N3JBK0VXdkRLaDYxT25TR3E1aXFtTVU5a2M2Q1lCZ1pTWDBLVThLWVBJT1VZ?=
 =?utf-8?B?L2RSdWNuV3ZyaEt2K09yendoUWlJRDdKRzdiQ3FVTEdtbUNKL2RUNDIrMlBG?=
 =?utf-8?B?UzdVTVozY2M5M2xZRUxnV2U4ZXQvVTNRUWc5V2Y5RzVocWxmQVI4R3dUR1pa?=
 =?utf-8?B?bWx4a3VXeTcrcGp2SG1RYW5EYVFtRi9wNDBhandSeXlVNzdhcHpYRWxhM2hR?=
 =?utf-8?B?a0UrK2xjRzR1dFFPeHh5Yk5uR1o2MURVQjNoR1NkUUpXYUdtVjNyOWpjQWl0?=
 =?utf-8?B?aXRtUHlXaGQ3QmpWVHNRdHYxYlVRcyt4YnJTaWhHbXVJNmNuWTlHTXRlelE4?=
 =?utf-8?B?Q3hpSUF0bmpxb1J5Z1U5WUtqRjBvR2pZM0hWZmJaUHlmbW5ZdThNMUhBZmJw?=
 =?utf-8?B?UENOeW9qd3RZbGhoQmhkTUMva29sZ3QzTG04M1pVdFVtSVV2anJrR0R2Zk5L?=
 =?utf-8?B?amFmT3BSTTUyT01nelRtVldBOUdsbTFjcUdCb0NLNmdxS3lMbnkxcUFiTkJQ?=
 =?utf-8?B?WXNzUnJBRDFhNDJmcitkSGxZYVZsWVk5MGRBTUpCaTdZWGE3WkJpOTlZYjZD?=
 =?utf-8?B?OVpKL1EzQkk2QVZxOTFxQ2lyTHVNUjdtQitDUXNhRzZkUGFqTUt3V05zWk1x?=
 =?utf-8?B?aFl1aDI1ek5NZjNOSW9mc2ZZOS9jMlZzOEhBbXNUbStYT3Fna3Q4OEx5KzVE?=
 =?utf-8?B?U00wOEp2SjZjRXhyTFFjcFI1RzhhZ3RlU2tTYXNqTUMvdjUvZXl6aWZEMjE5?=
 =?utf-8?B?blJMbGlRUkwybXRleGx6NlVoUjl6TVRTSGVVa2tUZVpZM25kSklaQVFGd01r?=
 =?utf-8?B?T2d6ZHRqMjF0NHc3NDcyVnNXMSttK0tQUnY5UWhEOVRDZUZ0MlpNMGhORFpr?=
 =?utf-8?B?dS8wemJ0Yzd3RXp3WDJqZDlIRWRqaWNYb0pQaHJqTHJMQkpvclN1Yy90aDlR?=
 =?utf-8?B?V2QyL0JEM0c0ZkErYXZ2TGFRZjVEN1loRXFXdHRnWFQzS213ZnVQTkZXZFM2?=
 =?utf-8?B?TWF4dWJuVGx4QlUyMW94WHduZW5FWkFLWTlVL1lDLzNPaDBKSUdPcGt3T0NY?=
 =?utf-8?B?ZGxMV1ZoWXZuUlltdG9MVUhCaERFQStlLzU3enR1V3ZvbVRSVnhFMDhiSGtN?=
 =?utf-8?B?T25GUTMvMTRRem4wdGJJbmg5MXZnUFh4QTFUN25kcHB5NTVLZ1V3Z24vZHFh?=
 =?utf-8?B?MGJWMkplRG1RMElPcCtHb3huMGk4dkZKM2NFN3pDUERWb0NjQzNIdDJTVjdR?=
 =?utf-8?B?eWIzTG8zSHhCUVNlODJydTFkeXNVR0lVcGoveStUVE0yeWZHTGMzYmtwai9U?=
 =?utf-8?B?MjBhOERzZXZxOWJ4ZFZzYm9qdVh0MWpWcUVVakxUWk1RZjZjOGI1b2daY1RP?=
 =?utf-8?B?TVU3OHdzaERVeUdtbkdHWk1GMXd0WTQyai9BTDZoQW9EWW9PMkpLYlZTU29J?=
 =?utf-8?B?R0hCdGJ4SnhhaE1zazBuTWo0aS9nM2REWERBdW1GQUFuU25tdmFBcUdna2sx?=
 =?utf-8?Q?uXxxKaxDt5Xz+5q/S+96FbA/l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc457b38-34d6-4dd5-7adf-08dbbf4f0cb5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 11:44:04.5764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgILOQEjLtgudiZ/dHd/L639rqYVDA+8khkt+zVvVqEjGHMpRhaLv2zaVR/NMPRVUeQ8JYkM5egWO83sR1AWcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9007

On 27.09.2023 12:50, Roger Pau Monné wrote:
> On Wed, Sep 27, 2023 at 12:46:07PM +0200, Jan Beulich wrote:
>> On 27.09.2023 12:42, Roger Pau Monné wrote:
>>> On Wed, Sep 27, 2023 at 11:55:19AM +0200, Jan Beulich wrote:
>>>> On 27.09.2023 10:51, Roger Pau Monné wrote:
>>>>> On Wed, May 03, 2023 at 05:54:47PM +0200, Jan Beulich wrote:
>>>>>> +{
>>>>>> +    struct domain *d = v->domain;
>>>>>> +
>>>>>> +    if ( v != current )
>>>>>> +        ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
>>>>>
>>>>> Isn't this racy?
>>>>
>>>> It is, yes.
>>>>
>>>>>  What guarantees that the vcpu won't be kicked just
>>>>> after the check has been performed?
>>>>
>>>> Nothing. This check isn't any better than assertions towards an ordinary
>>>> spinlock being held. I assume you realize that we've got a number of such
>>>> assertions elsewhere already.
>>>
>>> Right, but different from spinlock assertions, the code here could be
>>> made safe just by pausing the vCPU?
>>
>> That's what the assertion is checking (see also the comment ahead of the
>> function). It's just that the assertions cannot be made more strict, at
>> least from all I can tell.
> 
> But the assertion might no longer be true by the time the code
> afterwards is executed.  Why not wrap the code in a pair of
> vcpu_{,un}pause() calls?

Because it's not quite as simple (if I was to do so, I'd want to do it
correctly, and not just give the impression of universal usability). See
how map_guest_area() involves hypercall_deadlock_mutex. Hence I continue
to think it is okay the way I have it, with all callers satisfying the
requirement (afaict).

Jan

