Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090A0708FBF
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 08:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536689.835275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pztPI-0003lt-0T; Fri, 19 May 2023 06:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536689.835275; Fri, 19 May 2023 06:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pztPH-0003jl-Ty; Fri, 19 May 2023 06:16:03 +0000
Received: by outflank-mailman (input) for mailman id 536689;
 Fri, 19 May 2023 06:16:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pztPG-0003jf-L8
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 06:16:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a06d1006-f60c-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 08:16:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7987.eurprd04.prod.outlook.com (2603:10a6:20b:24d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 06:15:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 06:15:59 +0000
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
X-Inumbo-ID: a06d1006-f60c-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOPe9Z1m83hDuQs34Z+/8xHn8yg3xSaUUYOBOrHyNd/9ubEO9+hC2av+tY079GX75mXvcb9F26hQIExmF1Md0nYABsfp4mW7yV2KwCodjGKttUCgfJFl+IH++ZUShILCq/stlbqx//G8xTtGcQlSHN61UQ9WTTSox/E3gaXoStWbUj2QAA3Jk7xKlc50hxLwX8Oa+mmcfD3u4ht69KLR9DvCxjFiXqsleJCEFfHsobAHWtLV4nGVbofuaixID3plwPRlFh9G/Onykc6GU6jVWhD9bD2CFBmqQm1xjQ7ww3uKriFyysNbQvQpm4NvtPPkBn/bbGQTVhycrhcZltQV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJF0+RYrUrsBk6SF7twEGkhRDSpxnS1tjodPwav43Ck=;
 b=XBe183Z9c385vV2/ll2Hu6KmxblDjhKh5A4xnfUKWJj8xQUzd4qLYzpNEcbEBMnqNwotlzMEL/3bILSNUIo/L9DvaY6SXto75CzS6wtMY07020Qh7lkkJzP8eCaymx/1FW3oI7Ono7fNVxVzjKKbBWV5eTyf379VIUp8yVv6y0OI+gT+oZsMYiHn9lg8i+O7o2xlcOw9sE9t3cuw+LUZ4SlIb+mN17EYVu7MHcHKm+Bx+5Z2oYs+O6gmQLH6VfkATQ+laX/2OFLlO5q4dRFo6akeIRByTMcb6y0PThpyUD2WdGH20+C7Sf5u783stsS2qHdzYRRg7oZcvehS6+3rfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJF0+RYrUrsBk6SF7twEGkhRDSpxnS1tjodPwav43Ck=;
 b=bdugUjkWA65yw779l+bDizSZl8ePFvokReT64lHP2RKu5ka/ClgByc9jpN4+cpWPP790y/+Vt+suN/62kwSHwR9LQoSJbV9sEye0FMDJVoBtS6//gYpoUQp0fl6pFsNA34I7GDAMdR2xqxRHLFZM3LH2DNychCM4aLNmPcFJ3o5pLsAC85o+Lup1rgigP11e+Y8iZCNVfFOr+y9YPwX+C6cV1NzhR0YuFC/MbVvQRk/jgEHhXlGDCOCh5NphdNw7aqpbW/N4lP6qEkzp7QepAACgve/7q7H7bCIeRZkdjfp2+rHeO+1F1Kp+qCnt8EXyHJkUzYLP8V6eMOhmKkSKlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c867a48-1442-e4bc-0d51-d87c77aba8a9@suse.com>
Date: Fri, 19 May 2023 08:15:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86: do away with HAVE_AS_NEGATIVE_TRUE
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f994f67d-e0de-ad28-d418-1eb5a70bc1b8@suse.com>
 <b79b5b32-7bcb-b4cd-1594-e16aaff640e1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b79b5b32-7bcb-b4cd-1594-e16aaff640e1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: 539178e1-c6fc-40ca-f69a-08db5830839c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P87xZ0JzJCOmPggMV5xZLNctAk2woztsjPNHN6LFImijw5uTZ3nMmSOl0m3xJEPTyrXirGHVHz4j0r/zkXXCWLnWlK1WMTEnLVtS071GjDK+hP5ixpqOLzEENv/2D4KofeiynWiH2Tn4stK/WVUWduL2NgxVtV/edHiqcmrKOxlr2Of0gnPPr3esIHgmxKibypTdNKD7yXv8IqOnCIEzRnTGXCKGvhZP986CaHK0H4d9BTWNV+/C419n1Sk1iX3ZQ4mlJPvRxYZWRPafJY9j2zryqNFeJylRfP11GI1kjC0MR+s1g4+4jdpqY5wQV+tIDGXoklDJcbUXNdt7u+uo7EE4v0y32/fwHosMw7KXCPbvVARgmIpLXAt6yhcVTOhUr7Co3dpuqlzOgd+ug1b6Y3lwe9Rbwd5Ypi3m1pvbAv3WQQfzGnpYeMoG8iwUMakIwG5Qmh2uUix2wT/ivSpsiyCfQjQciZgr59DjxK+TjojHPnr9aYhyuxoRvAav4FRXqHraN3vYKQAmXW9ED8hcbzJwvovsoTOYsICxtRnSJQosgz1A/igXVr4WP9ZXjWGJ70L3I2P04sDD9H+zCEwzyONArwkns8BNYAuNkob/BSWcSC2LPxBywWHJKtfAMuD6O7UMCOBKF7gQTogPugR+tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(31686004)(53546011)(6512007)(6506007)(2616005)(8936002)(26005)(8676002)(36756003)(86362001)(31696002)(2906002)(6916009)(478600001)(66476007)(41300700001)(66556008)(5660300002)(186003)(316002)(66946007)(54906003)(6486002)(4326008)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09tNFRqd2pKa0Fxc1NJTzQ2U1kzelpYL211Tkh0K1V3cUpBdmxvTHJjRjJv?=
 =?utf-8?B?VEZTQjZDcGJJMWZjYTJQUk1KM0EzWFZtZy9ySitKZG0wa3A2Wmw2Sy9iOVRR?=
 =?utf-8?B?Ulp2WG5VODRSUU5VSTVJYzNXTDNaVTNobktDMkpvNXhWTjNuYlVpUUUwRUdk?=
 =?utf-8?B?WithWUdHTUMwQTZSY1NwN3hRMUd0OW41QkkrQ2t0R0NwQ1JOeFFYVm0xMlJo?=
 =?utf-8?B?RHp6ZHJ2MTFVY1RWNlFlYm4rNHRhaTV6bExDcCsxOUZHVXprTU0yR3JpdE5O?=
 =?utf-8?B?emVJcHptZnMvVGpRN1Y4c1IrYWtYN1Z4azhMUkoxcmYrOTIrV1FabHdWREto?=
 =?utf-8?B?LzZENnQ0S21IWnZFM1JyT3I3QzlmdzdkbUM3T0JUMlhyU0Exc05HMTUxSWNH?=
 =?utf-8?B?N0pmUVdqcjFPc0ErUXB2OGVUR1BZVjQzZXZIaUFCSkVwbmtORHNHMUZib0k2?=
 =?utf-8?B?dndqYUhuOExya1BRb3NZWlRFOGFuMUNUSU5zUWwyRnB1Y0lBNjdlTDVOZXlH?=
 =?utf-8?B?SndQMlg0WUxrQ1o5YlhpT09HL00ydCtpZGxyRlRNL2RnZm9rdVducGZyTlZu?=
 =?utf-8?B?SUYyeEl4bHRvbC9MVlBLZnkrMHUvVEpwdXkwSDZyQkVBL1ZKNG5WYWFvMFpw?=
 =?utf-8?B?ZGZjMFNTajZRSFpkbHI1d3JSQUtBd2llanNaWFJRdEM5b0QvWm9RVzFFWUlW?=
 =?utf-8?B?MzI5UXkySUliOWRUcjdNWFkrbDROQ20zTDAwbHNOeFJGcjl6SmEwRitmNk5r?=
 =?utf-8?B?M2sxaWprYVc0cmQ1Mm1IRXVNNS9BR0oxWit1YUdlemQxaTA4dElDeDlNZCt0?=
 =?utf-8?B?cEZMQmgyVU5wTysycUY0NVNCajFibU1KWWZCZ1BnaCtxSHJMWTdydkNWdVZl?=
 =?utf-8?B?N0VXT3k4a0tPVzN5bm5xRXVuN2w0b3pjUTdRVk51aE5SN1p3bldoeXhwY3pE?=
 =?utf-8?B?TUl1ZjY4clE2RDdnRHpNemtoaENCYXpWOEhQZENoZlM3OHBRaUlaQ1J0aWFX?=
 =?utf-8?B?OW5mNU1NLzVGRzdTWlRJUmR5OXhBN3laWTA0ZjdOZ1pYeDZQS0FTWUpQNWwr?=
 =?utf-8?B?d1ErdDFrcDJ1b1lxRDdUdWwyTUdIOGpsUWRRVzhRdDZ6aTdSYW84c3pPYXpU?=
 =?utf-8?B?OHpzbGszUmdJdFpsY0dmZG5jbldnYmNEcElKMHkxQlFEQWcyV1ptbFhicnNI?=
 =?utf-8?B?cXNKeHlBYlB5SW1wQVJKYTlkUGlTMnlWQ2lqd1ROdERrQUxvRm1ldm12NGJj?=
 =?utf-8?B?eGN3QmxybjZVSXl1a3RML1AxbjZKNzNZcFNRM2hiOGNUeDVGVFU0UW9BUHFS?=
 =?utf-8?B?U3ZCei91UEpPZzNyOEZCd2JjdDlDTVlXbHJRa2ovOUx6RnVHU0J2ams4QTM5?=
 =?utf-8?B?T3E2Sk9UdEFMd1IyMCtoZ1hJai9lOEM3MUxUYXdxb2JSRG9EenMwZEdJRE1R?=
 =?utf-8?B?aHpNSEE1cmVYeStPaTN3eGVydnVuY2syVDR6and3elRxTURXd29kQkVHQXVT?=
 =?utf-8?B?Z3FBM0kvcUZRcnFuc0lEb1gvSkluYUJiRlhHcVZYREVEL0ROQm1UV1U5eFJO?=
 =?utf-8?B?cXA2eVlZYlhuS2RlbzhqQzZQczZDT1JVMVU5MU5IM0FuelQrM1hSMmUvbkhP?=
 =?utf-8?B?ZzdJeHN2cGdDZzhyeGRFcGdrVXpPajRVK2FCMjBIZDBxRDAwdEd4L1RSYWNS?=
 =?utf-8?B?MWhvNVp5TUdjZnFmZVlnaVlLWUNNaTZBYkVvQjU4WDRQazNoZUJIN2hnUVFn?=
 =?utf-8?B?TFNsMFdreWpveDd2ek1jd2ZEeGdkZ2kyRHgxMDVEOFpnWlhDTWt3STQvSFZZ?=
 =?utf-8?B?bkRvdG5YTzJwUWtwNUpYRFFwNnhqTmtVTE1GSlNGeEw5ejVaeWlvWVY2enp6?=
 =?utf-8?B?MFBMUlQzQUJBbVVaaWZWZ2Y4NVo1bmZjWGpSUzRiVU1zNXlVamxNbVdoZnpW?=
 =?utf-8?B?aUMrTnBKQjBjR2hlMG5sclI4U29hbXU0NUVtNWNZdzljbjhjNm9yUUdFenNO?=
 =?utf-8?B?UXc1d1VUdUtMbEZDWFJYQjZLdlFrd2cxMGxvSnI4K0dBUnVPZ1ZwaDhWckNj?=
 =?utf-8?B?Yjh3OGx4bEs4K2Ewa3kwQTRaYXR4bHBtVHJqcGk0VTZxRlg4cUVqY252QzJw?=
 =?utf-8?Q?1Pv6hB0c4UG4NBlsfC4kOU8YZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539178e1-c6fc-40ca-f69a-08db5830839c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 06:15:59.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DubonVAOqVLRHDVcwnV7GS/NguDdB1LD8US9tQyXUp+Ra15ECqFlYGfnX+QjWO+UvZE4RVtgS9R4cz0Cmx2tJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7987

On 17.05.2023 19:05, Andrew Cooper wrote:
> On 17/05/2023 3:22 pm, Jan Beulich wrote:
>> There's no real need for the associated probing - we can easily convert
>> to a uniform value without knowing the specific behavior (note also that
>> the respective comments weren't fully correct and have gone stale). All
>> we (need to) depend upon is unary ! producing 0 or 1 (and never -1).
>>
>> For all present purposes yielding a value with all bits set is more
>> useful.
>>
>> No difference in generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Unlike in C, there's also binary ! in assembly expressions, and even
>> binary !!. But those don't get in the way here.
> 
> I had been wanting to do this for a while, but IMO a clearer expression
> is to take ((x) & 1) to discard the sign.
> 
> It doesn't change any of the logic to use +1 (I don't think), and it's
> definitely the more common way for the programmer to think.

Well, I can certainly switch. It simply seemed to me that with our many
uses of !! elsewhere, using this here as well would only be consistent.
(I did in fact consider the ... & 1 alternative.)

Jan

