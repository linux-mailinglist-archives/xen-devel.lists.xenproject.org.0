Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80360DDD6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 11:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430398.682041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oncUt-0003t0-17; Wed, 26 Oct 2022 09:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430398.682041; Wed, 26 Oct 2022 09:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oncUs-0003op-UU; Wed, 26 Oct 2022 09:14:50 +0000
Received: by outflank-mailman (input) for mailman id 430398;
 Wed, 26 Oct 2022 09:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oncUq-0003io-KL
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 09:14:48 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2049.outbound.protection.outlook.com [40.107.105.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a325c9f5-550e-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 11:14:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8213.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 09:14:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 09:14:46 +0000
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
X-Inumbo-ID: a325c9f5-550e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW8YAwGtfwd3WIQ5aT12fOMp6XBNjZ91R9pdMfC78xBA+KI0DNOejmwrD1ZjYLtVrzwgDDhZNKZK2CIUqkjNhuTkGTbcbRFsG+DFvdvos9QsrkOKnaIWqkz2G60AzP2aLy0OGi8qQQ1TDp2w/nR14L5xHAJXQpyHoyg3bbUVMfP7gZpnBo2BKZv4WK9cp+oK/bCCKR5pSDOsmCUca6bEKQbNOvISLfPLUP9MMRZegr7p79lcOY9P8kp69Tn0UfD6l1Si0GPJuy/YC/VkCnXKukAU/Uz910uAJpyDG6gHMhFtJaMuR7P7HP7HvXdOPv6SnpVl3e/ZiUh18yHpRIWPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rV3pfXIMOwXzVwIuuQtpwMooCubqdzZP7iiKKnuQcgw=;
 b=g/mdzZ39+ohppFtFUSF3V5tTTTJIPpdRgdE/NrNyQaKnr98wtOWEsh2UOfe68DL5GtAhFWzrUCpX70QvUXAMidtphpIFj33e017EzIK23Wo4kpnN8Hxrugnkkuurkhks5GMs0h6wQI06NmGVCgO9ur7YD8OOwCWjPqLOCe5HXblYeDDXjWHU62g3EoWaS5doI4E45THWcHCFPfsSH/egv/fPpRr88++NUHMrUIagdG3Iah/dInkOO7uatwJS50i+8H6/sPa9MUpbf2FglUSq15TqZq2P11ot7qcP/c3qEFoXLH2dP13GC7bkE4L3GZRR91fRtiG/GlQKUnxnrkWuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rV3pfXIMOwXzVwIuuQtpwMooCubqdzZP7iiKKnuQcgw=;
 b=48KqmgXYXdfPNMzuYqU/BacBfMYWx03ZYYHM2P+HgaDAKRJCV3R7SZzonKjLhzLO1MDeXFOWLvEvfGNuqV6or7VUE+94mVO0n3StVtf7Irh6DjAd1mJ+rtZkIESkThJ6pIeIJY54oU9N0+crXq8+9u4ftEEl4q8PqxY665Y1Ui9NhdVIfU17GDRjZa8EHm2QZKV/twHi/HTu2XzNBhrRXE22itS8v6moxGVu9zsoLR4UljX+zh8W+6GHjoMzNt5nQjjyDUDdHdHDPzkOIj2ukVAJh5CGJCQnjPrKhRe7+D2LuxHrdBFqKQ78QFtvA1j5R6U7Jkc7/O55EPlU0/DJ0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11096910-5574-657b-6d91-fb4ce4c39ed7@suse.com>
Date: Wed, 26 Oct 2022 11:14:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.14-to-4.16 0/2] Backports for XSA-409 fixes
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
References: <20221025092112.50168-1-Henry.Wang@arm.com>
 <9bec8877-25d2-8d50-6f03-523b806642b2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9bec8877-25d2-8d50-6f03-523b806642b2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f5b5c2-ccbd-464f-e41f-08dab732867e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Ksq9kcEvSo8Y/fDoycFyzcd78LDrDOYy1dRuU3/nOr4uN5gb72gMAkbZUQbfJEXa5lSKEDUuiBaBlXbmv+SHTifqmPZi9dIw5xAoC1OaLlavSJ6uBVqmlU85qap3eaweI3fj/M8xYfG1GTSAxbUDhF0057Qh7loFnNY6WzLy7katotoSo6fUpfzyHApwEFAp1sefJIy0YxqzumCCJ+pqUY1QG8iqggfxbBOm27LVEugtKk992roh54Q1gdpOpxsgRvr01DwCFuBnddhuv4S97HS9xR1msX7FoFwYuBVeIsRRbueyDZ+9RuEODC2zOXW5IZ6xQevAxj8+sT5En4Mo6+We7hD9Alqx/dfA0IgpBvWyl0TizHZh4yfEcK5vckGpEZIha78EZm4QaieSc5TeIbT1LFqApdephz3ZMuicRgQEkeFE82eUXgm6n9CXvXQs6TvouKcy2vuxogHcaH3UwYgXDz/szlRw+HReM2tiD9gzY8Sokmka2hGrnsr88FaFKHgcC8CxqRfHW/8Ds9bXNYITaiWOJwwcFiGUK4RdfoCcnHafdJGDRljvVD0o3h6Vd8fdDMNsvPDnoavCDTi5DjmRGHBfGaYBB+IIbsFye9IaFB+AM7RieOKOPVEWQIVuZpFbbYQvu1fjIIQQp9JZUXAzV88WTEjltaiWKgVt7naAHHAQqvI2ZaFZlNQz+vw+RR+o179YLOnvkgSBmIZWRfHPa6c6To1Zp3oqprbfAETZ+ly6ayqowhnWvef2N4+7i9IudHl2Vovj3IiT+SHZwOe+29hgDMRnh9KTeBIlGw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199015)(83380400001)(31696002)(4744005)(86362001)(38100700002)(66556008)(66946007)(8936002)(5660300002)(66476007)(2906002)(4326008)(53546011)(6916009)(41300700001)(6506007)(186003)(26005)(2616005)(6512007)(54906003)(8676002)(478600001)(316002)(31686004)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHIzSFZMSHI1VUhkamVDRE1wZStGYy9PTk1sZTc2Q1BnZDl6bXpGdlhxVVlE?=
 =?utf-8?B?WnZTSGJtdnNIQWEzdjRGc0h1Z3ZOUU1iWDFPWlZvVDB5bjRVZkpIM3pyTXM1?=
 =?utf-8?B?Qk05aGZHV1NzVk5vZ0hueUowNG1ZRTdkNWdnbEtnaHRlMy9HUFFTN1JuUnlW?=
 =?utf-8?B?V3VPZ3E5T1RRRStBSFJZaUNDaCtNc3VLRXRwKzlLdVpqd3RrdTlpQzBTNmJ4?=
 =?utf-8?B?Um9LbTZTMDNoUlZ6S0w1L0hDRDJucDBDRXZDY1l5WnBldjhaZ1dOSGxhdnZN?=
 =?utf-8?B?Tml6elc1U3ZHSnh6TU9sMzBoRnVjcjQ4Uit4UzF2L1ZFOWNQaHVONlB0NStz?=
 =?utf-8?B?ZzR0N1NPaXFLQ1ZJOFdEekovN0dFWk9nQ3BkME9pYTlRZWhzN0lYWEdFcHIv?=
 =?utf-8?B?OWhoSThlNjRINTlKNlRGK3BZVVJVMFFaOTVCTmtZbDd6N2pwVVJOUDI4aGxH?=
 =?utf-8?B?VXNiMm5TYXMrdTk3ejFlMWgvSlVFc25hVFJoeFpWWUNrMmFXVkxPdXZKR2pM?=
 =?utf-8?B?NC9DOHQ2S2Y4bktqUkFUNTVSUVdSRUVyMC9qQTZHZjJWbXVWTjR5dnJEZUwr?=
 =?utf-8?B?REtOL0gwWGlUL3FyS2RRZ2gxT2s3TXFIUzlqU01QTktTaGtCeTVRdGpTU1lT?=
 =?utf-8?B?eVR1YUdtR0NsUlRlNmEvQkVuNGdxMlBoaFpWVVN2dVhvZXNLb3VhSWkyemNN?=
 =?utf-8?B?S1JNVTIyYTZXWkxsbXA4RnZxQktlcmZXSmVLWFJsYUk3cmJ0blVkOGVuQzhv?=
 =?utf-8?B?d0NpaW1MY3JDQUlHT2cyUTg4eWU0L2dmdlI3QVN5VDdmV1lWcmVwWTNCcUtC?=
 =?utf-8?B?RUlLSCtWYWpsb2w5WVUvcnJnOEZNNjlYZ1BhRm5XQS9mOWorbnRwdlhoVkZk?=
 =?utf-8?B?bW9kS3IzSVNnTG9taXBVK2wrTVh5NVNnS2tuYWRjR2QrZkpZVXpSMlBNNTVC?=
 =?utf-8?B?ZEZBdlVvRURGVXByeElqOGU3TllyWXZCdHl0T0VjeU8zaW9ISXg1YW50NTdB?=
 =?utf-8?B?RjZHOWZSWU1YR3Bzbk44RXA1Z3BWSUJ0VUtkUFRGakxJRVFCTHVLSWxNQTlv?=
 =?utf-8?B?NlVBbDZNaTJneU1TcW9ybFA5My9BZU5zSTFrOGY0cFp0aVhUbUJvbkxyU0ZY?=
 =?utf-8?B?blJ3KzUxaHcvTytoRWc0WTMxeWJyWjQxZjU5MnhSbE5iVDM0MWRMWk1YTThl?=
 =?utf-8?B?L25MTkE0NGdBam9IZ2pGUk96NWpicFUxTy84VFk1MmVYcm1LTjVRRFhxejkz?=
 =?utf-8?B?RGdJWTlQZjlGSVdPR2greURVSEFMcHY3ZzFyUzVNSXhBVWx1eDduc05qTEJx?=
 =?utf-8?B?K0o5akFtU1NMN1ZmYkV3bjZ0SWxvVlU5NExvZmJ6YnRHZXhpY3lzSllFd0pX?=
 =?utf-8?B?WGdUZHlLbDgrMlRQUmZLNjJyQXhtTFUveW9yN050WTZUQ2tYMHZSRSsvbnNP?=
 =?utf-8?B?cVo5cFFUVDJ4T2pWcGhCYm1lMGhCTWZ2Rmp0WDZ3c1k0TjNhbHY0SDRJZ0RR?=
 =?utf-8?B?ZlZINVozbm90RjBTRVp0RGQxK3ZMSzZFSHhrSzM0TXA3K3pxZzFCd3ZXeDU5?=
 =?utf-8?B?ZmY1SzYya1NIT2phR3dmRnBIVWprbVFhbmlmZ1FnVlREbURZakRWV0RSTE1v?=
 =?utf-8?B?REVrSU03L0tZVU9ScnZFd1h4d0prekhIVXdERHUrOVFVMHordklLN2Fua0li?=
 =?utf-8?B?K21CZkVNSWgwMTRkL2Q2OVEzcDBVaFVITW9Dd2ExYTBIUjNQUUhjR0d6bTdR?=
 =?utf-8?B?ZWJjWU1VU1VqcE5DVTJwNFRlS0N4NG1ETVN1TG1idkErVDNBaXh3V0hDZzky?=
 =?utf-8?B?enorNStjbXBCUkgyNDZTTVNlQ2RzdjJMN1g3Z05CSTdzaDRUVFFpMlk0c1NU?=
 =?utf-8?B?Z2ZLNUl6OWIyOWJqeVBnRGVJYytDeWJUNjhJblFLUklhMVlVcVRIRnhqU1hI?=
 =?utf-8?B?aldwOFNNVGoyZ2ZqMGRNOE5XcmtlZmU0cy90R3Y3c3hNZHBVSHA2dEtiU0wz?=
 =?utf-8?B?WW1ZbDExY2FBZ2xVUThpblhpeTdrOXFQSVBRa0o0ZjNMa0tDNkVGNWdkU3p5?=
 =?utf-8?B?UkpqdUVyOGhnUG9mQXIyUGFtc2lqSnBsODd2cXp4Y2RvaTJGK0tPcG1oWU1o?=
 =?utf-8?Q?47d6tQ+9wCoVs8kJePe5LLrNU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f5b5c2-ccbd-464f-e41f-08dab732867e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 09:14:46.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXNjmj6LWpVQfDD2MRzjW5rq6eygYYp3Rd+36Nfb/rbdz3BvhGqTGkm+y20VdltJOnCQ0SNflOjb+YSKvwXFuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8213

On 25.10.2022 22:06, Julien Grall wrote:
> On 25/10/2022 10:21, Henry Wang wrote:
>> This series is a backported series for XSA-409 fixes from master for
>> 4.14 to 4.16, which cherry-picking commits:
>> 3783e583319f arm/p2m: Rework p2m_init()
>> c7cff1188802 xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init()
> 
> I have merged the 2 patches in Xen 4.16, 4.15 and 4.14. I noticed that 
> the "released-acked-by" tags were removed.
> 
> We usually keep the commit message as-is (including tags). But I vaguely 
> remember that we may have stripped the "released-acked-by" tag in the 
> past. So I left it alone.

Indeed I'm trying to remember to strip those when doing backports, as they
aren't meaningful (but potentially confusing) on the stable branches.

Jan

