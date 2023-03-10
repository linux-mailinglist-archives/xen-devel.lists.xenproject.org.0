Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2336B3DE9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 12:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508480.783166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pab1G-0006t7-Ad; Fri, 10 Mar 2023 11:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508480.783166; Fri, 10 Mar 2023 11:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pab1G-0006qv-7K; Fri, 10 Mar 2023 11:34:42 +0000
Received: by outflank-mailman (input) for mailman id 508480;
 Fri, 10 Mar 2023 11:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pab1E-0006qo-PH
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 11:34:40 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a37f9b1-bf37-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 12:34:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7105.eurprd04.prod.outlook.com (2603:10a6:208:19b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 11:34:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 11:34:35 +0000
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
X-Inumbo-ID: 8a37f9b1-bf37-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImtHUD2feFop610bluTLGn2wMD6tmTohwlWOfgnhWNW3jR/SDhlm1l9LIDm7l+UqDe4MQMGzZK6ofrQNVylWb17M6kgn+nU+oPUYe4h0kPj9/Y6T7HJ1ywUUX/57zr3UkY51fY96wuIpMXeXoALxsRubEz5AHOdI3hXyFUF3vJ+DapJBZ7kvnVwlgm48rU4fgu1HItq2D8xNf1G2X1bsdSukjWfg4EsRpHgDKfXbydywFjaKTbXXTShLCi70j5+mYo1Lbr7yfWPy/EwSfhTu2MCbfKAANWm0HNq5WrX8Kmwaoa3GVMG2Llt9DvqwjqfBvwfkOvXMQygfiZbpYpycUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtAO+LkBGlTmagpm9MRkLXF3fcQlt9QAIZV9F97neJg=;
 b=d/MRmSVUsRoA1YDAtwPXbt2pm0CW028M/2v8u7W+4QfhLuKA+o1EfThsRaTBfGWkdSWL7AWl0HspHSBxIR1vsLTRCF23Lj6uRel2lsdw0QJHvnqnWDxDB97lEnPugydTBw12MOXp8X+Nj+SknELHciXxYAndsTeoLwAU2fSIlAoh2b2LbfSR9oKKXGR842N6tcd/V8dJWr6gYmUtLeLLoVx0nSHxn6mRKI4VZGyBfwsX587Z4mnezlUCKtPMXgaIF6Vm9S6kTEqI+9s0z0bvS1evahTezmv67k2kX0vSQ3QomU/Gn6bXuaKdRmEP6YrLn6k1vZvo9iNrhSZ70KA0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtAO+LkBGlTmagpm9MRkLXF3fcQlt9QAIZV9F97neJg=;
 b=4D343wm3ztehHNEE17VGkqfrdODYbt9RB+UcviBhOO2y7o/GY7oGMGrkfaR7B0aQSxnub48V7n8JePu/u8znKvZUDCjSbKruFHzNlGJxRZGQ4r8SYKSHWm2R7O9wpcEvQq3FMks1klUWiFLZ26KASDcgHDEC5/JirPpUWuA/dY7oI9H1K5erUqfeG47f38OCRq77Hr26tnZfOgSXzDGC7mGFuTgpX+O4UttU4fmB3kfmu0MXe4QBxRZKmeYqgHYpZFIGS4bb6oZgK/HPRcMZATbsv2ufh+UacMnjL8okBnu+dlnOlKZkpe/NhWQkuoHiYrrv6S3c6FSG8h5Rf8jvGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84e0cf30-d4f6-b1d2-b99c-7a297f5c5c2c@suse.com>
Date: Fri, 10 Mar 2023 12:34:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: API/ABIs: Re: [RFC PATCH v2 0/2] Add a new acquire resource to
 query vcpu statistics
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
 <20230306142315.GA745324@horizon>
 <c40f1a4e-63a5-af2a-e5db-729b1af80708@suse.com>
 <20230308115410.GA1108824@horizon>
 <d0354bab-3022-6048-8d58-45f63aaf26be@suse.com>
 <20230309103825.GA1221165@horizon>
 <645fcd9a-755a-e2a2-f332-93c5e571b9e5@suse.com>
 <20230310105800.GA1285481@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230310105800.GA1285481@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c3c32b-b1dc-43fe-5a61-08db215b6cbd
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BhiWJ+Q4uVp03rf36oZil4WalGxDCsUlNJQ6jTpvgvbtNfL+ms+hMTtGVOkyPczsUDBD5x09PN1XecUHGWUaxHyVytXr2yPLtaNE8pZi7tFQQJ7axLEsXNRmiDNoCtHEA9yVw0T0BLiSJfQARvM1dlyAhzL5aiNWyXVzmXhTmdzPbVJP84u7kQxJmvVOzHo1OK0DdrioIXLt+qZvti7Uzv12DxzW4DKpui/OMsWBKliX6+0xWLWYBQ/i9/f6GAxw/1wRXpT5wucWNVQp74nT7BLX0SbntVsEVg0UXOKqSP2qvW8cpAXU+I3jgbq+237VPf7QZegPMqcr6oYUaaoWgJP2GvpOAQa3CKxydL/5O1fiEOYuDhbqrmoDsBebFf/F0CvCNdHu5TVdXWoy2IYY4RuFpsOjF1BiqSNHqy4QLaQ1gKBbIrlPy95FugqOhHE8BPx3GUqvWaWN3fHI0gJC0nInvWTKcjLGR0KJUUMsX3fRKElkWA6KsBsD1eLm5Nmic5uNn7+iAAG6QjNz5k9dLSwO9tDvsktvlqvuiaPO9VADjUODDU3VJCW/+XCEBxy1Xlu/PWOT++cpj0MnTSKmje/+XmLYqkguiu7zyQ5dMBfQe8U/HEiMGCbpzHcQGPUo8f+QotkoEyqxoiQ+Dn4KgyiF6loJlpswlqAFsrj17Qdv7iNiag8CuXt3K/wLnWFCYNdeArFXbfvL4uQh6GqzNR1lSTsMs+ab6DrYdjNUh0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(36756003)(54906003)(186003)(478600001)(6916009)(6486002)(2906002)(8936002)(5660300002)(316002)(66476007)(41300700001)(66556008)(66946007)(8676002)(4326008)(38100700002)(31696002)(86362001)(6512007)(2616005)(7416002)(26005)(53546011)(6506007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3NjaXdVcHd5c245aDRjKzRYU1FRK1pzK1JrZXZKYWZBbUlsTndUT2VmdGRX?=
 =?utf-8?B?cFdvZzlOeW9MbGxoMXFWaWhOcVdWQzI1STZzY2p1N1lYODgxdVpuNkNuNEpp?=
 =?utf-8?B?L1pOaTRqNGUwK09rMUtNakorbGxPKzlrOGN1K2t3cUlhTlpxYlZ1akVKRmxh?=
 =?utf-8?B?Z0lMUWFZc0xHdzZJVDUyMm1hWGRZVlNxMnhQN21CeVJLZ3lkUEd5Tk1sd2dB?=
 =?utf-8?B?STJKWUtvVXpNWlQzTHEycitNVEMxMVBZM0NNbWVGNExPUDgvbVZLNkdjWXB2?=
 =?utf-8?B?S09JUkRyTkY5TnV3aWdjWFEzckVhUWxQRTY2bXdRSEJZT3VNMzk3RWdrdHZL?=
 =?utf-8?B?amVwQVRqU2VQekRTSVV4bVR6cDExRGwwd0JOY2MrOHhGVWJIYUNaRXUvd1Jw?=
 =?utf-8?B?ZklqZ1U1RUIwNG1hVFU5eVpXN3BFRk15Ni9oMEhQMWdEcWRlcjluT1p6ZVNV?=
 =?utf-8?B?RmExck8rWVRtclFnaEdadmtVOWxkM1lqVzBjNGlPU3JTT2QwOW9td0U5dUM1?=
 =?utf-8?B?T0RJWXMvVXV0WURXeWZTKzFhZWJrK3JCSWdmaExGMmxSWWYxZ1ZLYlk1dUJQ?=
 =?utf-8?B?OTZiTFVWT2o2aXhid09lSWNmbUk1K1ZYMFhpYTVNbEFDM3UzLzJmSXRvdEdJ?=
 =?utf-8?B?RFp0UHRkYmtCd0UwYlUreXkzbU1nZ00vYzY5NVNwaERxNWhoT3ZmbE0yTW51?=
 =?utf-8?B?OTF1aHRKSU4yY25BS0wzMFhUMVgvZzA2clR3ZHhaODlEeGtFbFFkTGVvTDhm?=
 =?utf-8?B?THlKVk1wMXRJOGY3QU9MMk8xb3RXQjFCTHdWLzRBSlNTTzh5elV2NDNadCtS?=
 =?utf-8?B?RnMxanE4SzNrbldVRzFzYnRzUjJVMFBFUFJiakp0TFZEbEFDc1A0WGZIbDd4?=
 =?utf-8?B?UmxXUUZ6SjJrZGp0MCtwSUxVcEdtbUtOWlJvVWhSZHNNV3VRaFRjLy85TndV?=
 =?utf-8?B?QWtYQ0xiNlMxejhOeGM4N20zaUw5TzlQOGFQSmFKSWcwenV0d24yVDErcm1B?=
 =?utf-8?B?M0RMa2R5czFuaENFdVFleE01Q1JKaTByL0ExYnhQbzVnTnRKNm92Rk5vVmFa?=
 =?utf-8?B?MkJBdkljSGRucnpjaVgrRDgxRGtHZERmb09BT2J4L2FTb0gwTXh1UENyTDYr?=
 =?utf-8?B?Z1ZyWG1melVQQkx0SkQwK05mWGZzbzZ5ZjY3RmJZbUZ6N2NGbUlBZHhvQ05O?=
 =?utf-8?B?Q2tuL3MzaTBXbVVpbGxQMkVkb1RzZG1sNkpUZmg5ZmhpRWlyUUwxM2orUmd1?=
 =?utf-8?B?UzMrSE5TVHZFUUtsaEhQVE03V2hGaTlvdDE2S0RnaXhQNmxLb1FTZlRoREQy?=
 =?utf-8?B?QUl3NWczaXRhQk1XS0RlZ3dvYkpjM2FwdWlaVDhVWk0yM05weTFDcnAyTlFj?=
 =?utf-8?B?Qzd1MmNJenZwbStLcFc5OGIyM0FVeVJxNXpQOWFOOUtyUGI0SWpDVTdwaUpI?=
 =?utf-8?B?blZjRnZ6aHFQcFN6Vm5QS0FOYnArU1YrL0pmVW5ZajZMcFRiWm9uejltZTFH?=
 =?utf-8?B?NTdualEzLzZpYjNUTEJSaW9COUJ0d0ViU09hUmZuSGp6MFlpOHRCQkRJZmcx?=
 =?utf-8?B?bUhlWWFUb1Z3aWZMbngyOXVDK1JiTG1BOWtsdVBuZVpodkRtT2xmVzh5dG50?=
 =?utf-8?B?Nk5FbEpGd0tjQ0NKS3FOYUVFMjFnR2JOVGpHM1JuYlQ3enVtQmlkUmVyMkxM?=
 =?utf-8?B?d1pSZi9yeDlML1d4eWg3aUpZNklUT3FSV2JLTXFyZUR2ZVBpRmxFLzk5d21T?=
 =?utf-8?B?OUIwNldRMm5lVWxjM0hJSEpsdFQzbHBkKzBMRlUwbmMrdE5hZmZOTXFwdzlj?=
 =?utf-8?B?VHo1MXZ2SGRWejc0NnhjcWprYzFTS0JyN2xLZmRRbEtMeldlUkM2SWFQWUlW?=
 =?utf-8?B?YkUyTklNNjQrRm5FYXlRaVdjR1duMjFWakI1RTZwbi9zYXhNcTBqU2sxaG9q?=
 =?utf-8?B?WlE1TEZvYjVmQms0V1JsSlRUZDZGWktpUGlWeE84WG1wZERoYnF4TTNsYlFS?=
 =?utf-8?B?RUJnRmxpYk9lZXh5enRGQlRNcVFjNG1MbUUrb2svT0xmeXFDUWpkVklwSWhm?=
 =?utf-8?B?cDRQRk9UMkNJRlhZQkFBY1FjR0lRczBESXpod0lyMWJuS3AzS29ja2hnZ3RY?=
 =?utf-8?Q?jhc57Gj7yC3Sbpni0MJlKBaLY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c3c32b-b1dc-43fe-5a61-08db215b6cbd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 11:34:35.8771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdD3BIoNcz+d2l4sDhARu8AneVOehiHOdrPUxO9FWujAMnDVgUBY1xZAiiLCLTSrXKFGBrycnNKTm/lzB8Oqww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7105

On 10.03.2023 11:58, Matias Ezequiel Vara Larsen wrote:
> Oh, I see, thanks for the clarification. To summarise, these are the current
> options:
> 1. Use a "uint64_t" field thus limiting the number of counters to 64. The
> current vcpu_runstate_info structure is limited to 4 counters though, one for
> each RUNSTATE_*. 
> 2. Use a dynamic array but this makes harder to use the interface.
> 3. Eliminate stats_active and set to ~0 the actual stats value to mark inactive
> counters. This requires adding a "nr_stats" field to know how many counters are.

While nr_stats can indeed be seen as a generalization of the earlier
stats_active, I think it is possible to get away without, as long as
padding fields also are filled with the "inactive" marker.

> Also, this requires to make sure to saturate at 2^^64-2.

Thinking of it - considering overflowed counters inactive looks like a
reasonable model to me as well (which would mean saturating at 2^^64-1).

> I might miss some details here but these are the options to evaluate. 
> 
> I would go with a variation of 1) by using two uint64_t, i.e., up to 128 vcpu's
> counters, which I think it would be enough. I may be wrong.

Well, to me it doesn't matter whether it's 32, 64, or 128 - my concern
is with any kind of inherent upper bound. Using 128 right away might
look excessive, just like 32 might look too little. Hence my desire to
get away without any built-in upper bound. IOW I continue to favor 3,
irrespective of the presence or absence of nr_stats.

Jan

