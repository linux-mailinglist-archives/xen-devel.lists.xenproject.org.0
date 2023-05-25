Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C6710E42
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 16:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539635.840731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BsG-0003YF-C6; Thu, 25 May 2023 14:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539635.840731; Thu, 25 May 2023 14:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BsG-0003Wa-8r; Thu, 25 May 2023 14:23:28 +0000
Received: by outflank-mailman (input) for mailman id 539635;
 Thu, 25 May 2023 14:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2BsF-0003WT-5A
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 14:23:27 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4600bf4-fb07-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 16:23:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 14:23:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 14:23:20 +0000
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
X-Inumbo-ID: b4600bf4-fb07-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUKsxaG+s8bPnE4aQtSQF53TsC+vEjCEj3efGh9cldw9D97jlixIdINGmvSZXtaAY6uR2F5rC6n0zWS58H5b43weRetfheEQKOEZ2pK5fcsjMMglRzwVizkaOBlxl52+8K1IBXbMbAFSG4OTHWtNtwVN6h4fthQPwCABb2Wf3CTOH7IkXJk18jrWCcvfXdHgjSkNeyBGE4vQYL3RqE34bDnkY4M9mAfbOvgwVLyRfOvjypxIi7eQfxZQ390eRVHlws4o7/tgqk8Rhv2S3StKIF7am/aUokfmBBRtKuljk6Dn0XD8F6vrOFsvdw6n6aVYEJispZojXGdZbVBqOu6H4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUFCk+hUYamSYOLj0TqZi8PS+hcJtHPvWTWNAM5Fbr0=;
 b=b7RB9yz/EwRytrdvInyz5az1JtpOSma7Q3ozzPC8rqAhwsC8WTenjcUmNOlSZEFM3aFCFBEu8WpP7bDqTcfraKaDSn4651gTbP3kvzCJyuRlXlj3tYjDcZwkfV9YnvdASmzVYGf4a6rsFXFLyB04ciCnePPg44aBkH8f9+e5aYCfq6CyQtip8dqVBq8SbQsK9REoZIkbrVNPhj8X4mz3RvbbbmSOqjHWuBxEviwNVKrNhD/RIHfmLGK1/6J8aB5dS34YrF4HOMKuWVgIEah2AhHIF9QoKANmN3KFWwZncjEjkUI7agxq/1WhHppO5oTBD435bHMoNFKR8bLFkA0rlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUFCk+hUYamSYOLj0TqZi8PS+hcJtHPvWTWNAM5Fbr0=;
 b=fYND1oRPJiPmzc6SVxU9hxbESMdMf26covHD5ZkOX0LILK7P0aeY+IspyEFAH4G4WXOYbmVto/4svjr5IVHKShwp31Wgd0EroFXvkzivp18JlPAqjjze5vZpOFRUYLVIDa4CbEWR1ToiNyhXFylU4h5dIiD3Ir2p4bNC2eBCAnZL/MkiSAXD5/9pshxMMWRip8KI305ZJR2LQhZkRHhd+AZgworoRXf9HwaUf2BfL1Jr7t6nO+47FgzVfT8pFkk5Wh4WTnDRqYMPkEI0F9PrQpWIkDfZdj0SFD4/69ePeoWSxZTi1WKoqHCNq9Wp0I7RWhCYgn+9FAjlbfy23+S+xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35a85941-1e4e-9361-1da4-9b5b3d8a9b99@suse.com>
Date: Thu, 25 May 2023 16:23:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 04/15] build: hide policy.bin commands
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-5-anthony.perard@citrix.com>
 <c75368db-6444-6910-487c-8ac9477a6785@suse.com>
 <ce86e239-5cc1-4f7c-ba6b-de6eb9c1442d@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ce86e239-5cc1-4f7c-ba6b-de6eb9c1442d@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 016fb096-b1f5-47fc-6312-08db5d2b96c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GVVDzcQqkdifq4A6iGTxF3joxJT55GdlEHVWmJir0/LU/+u08F31A+na+3P0yGQ3grAxk7nwxCppkQlnWBWEkXKoiJQT9IJFk5t3VUdpZK2qCvfU1Rp5IvHMF7soubKeEHHB72lezpSVNvdfi7CzOoNBfwCkS0kSlkrUQxepyqhrD/33+563SJCoefZu93YavHpBayM4Q/kK1qDkDJHplM3USCsFtTLUDbYIWCTbXZrr9VX18TO+w4McAvK/YPEbzAhktaKbLzmli7Awafx805Yg5xKnKhN516ZaE8Qg6+Ex5R762+yK6YuRs/+nGf1L/CKcOTzrVpsnH8Ly4gCqa0nuxVdOdRblE1xATKrUM32WPnRrre5Mv4xQ0Q4/r3xWT1yKXgzB4TqeEjs5eCUPbIGlaIEWG2Dgh33EftqIA+sZR45uOXrAuEe7xxYgaOfl9om/9r5uW9JKHVXp3Y1+k1EYgacqabbJYaNkl7oFhANnDpkRAsqi7UTgW4GlN6JiwTwRQiJAwCKDqb/o0YFZB/DD5Xl5P1XJ0299NgYCvuiGM1SMBjJ4/+/tFYDcKLnCsJM1uOvSri4Fc4vQPGbECUH6fnhZOF2zvjAxQrxtq1OhnFBGZHTlziE0JwyamtGIvmIcMZWaMPpOVXXe5D4k7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(8676002)(8936002)(5660300002)(26005)(186003)(6512007)(6506007)(41300700001)(53546011)(66899021)(38100700002)(31686004)(31696002)(478600001)(66946007)(66476007)(66556008)(86362001)(316002)(4326008)(6916009)(2616005)(6486002)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3laK2FXZnlQSHdaVUN2QU5DT0M2R1M1VE5VbUxUa0psYXJqRFRVdTJraDR6?=
 =?utf-8?B?dEtaZUE5eVZMbEsraTUrOFZiVzZUZTluTUJyV1I0cTZlVm1pK0NDT2hTL1VK?=
 =?utf-8?B?NlNva3FRQTlndFNWRmpNRlNVOXRybTVibFR3RmtXQjF4UkpycGlTbXB1MTA5?=
 =?utf-8?B?dFJyZTY5aElIVW1xSndWMWtUTUttNUZGeURtMS9vN2ZaMjRCck4vcDdTYzk2?=
 =?utf-8?B?VmZKQ1ZQRzVUdkptZSs1VTM2Q2pBSEEvSVFoMTNuTmFiY1ZlNXZGMHVWTDJx?=
 =?utf-8?B?YmdSaERpdHR0ZTlkcEhaMzJpU1hsWjdBaitaYUpwUG01Y2dwVlArQmI2eXU5?=
 =?utf-8?B?RVRwOXk4NzlGOHc0M3ozT0w3emRhS2VPRFlXV2lZT1B5cENqREw2TFVBKzRn?=
 =?utf-8?B?VHoxNXRDWTRZaXNRY0xYaDlFTCtBaVFxZ1RrR3lyQXdtMytYT1VwTFJXTWth?=
 =?utf-8?B?aTFYbHFMUHZYbWpUdzZsTFFVT2RWWHdpQS9zclEveTJVdnU5U1F5TzFueFZ3?=
 =?utf-8?B?VExXUTg4SUsybmZzY2xOTFVTbisxUFlNdS9wTTNjN3VQeE1aVU1kU3RZUW5r?=
 =?utf-8?B?aHB2VCtBOG9PZjl6UVBJeTF6SGpHZzlheDUzK1Ftb3h1d3YzcXp2bXZWNTg5?=
 =?utf-8?B?NEZpUkdiaWxsVDlib1E4WWVKV0pISnp3RXlZQ0RRZFFPMW1IdHEwaEN0UFUr?=
 =?utf-8?B?SXNyNWxJQ2F6ZEdHOEdRb00vY1hRVG9pbjR2MWVrK1JXRDZHUCswcEJKRS9V?=
 =?utf-8?B?dEtLSldROEthSDZEN1M3bDB2cUFEeHgyZ1hUOGpOc2paRlMrU2pHK3Y5N2tu?=
 =?utf-8?B?OVBrclErYjRRRnJTVEZENmtWUTl6SGZLYzdxaGU3VjA4YWhKMUJnMHkwODc2?=
 =?utf-8?B?NVBCdHVlYVFpd04yR3llQTV3bHRENk5uU3V2eXptYjRmalY0dEw4OXJIK3l4?=
 =?utf-8?B?R21mTk1hS1hWbk5PZ3BIZmZYMm50dGVkRU1FNWRLRytWb2tyT0JaSnZ1ZDVI?=
 =?utf-8?B?ekdWRVNVU2x0SEk2ZlZQVzkxVjNLRU5jYSt5VlNlV1JjdXRWMEMrdHZEeXli?=
 =?utf-8?B?WC9IWDBDNElwU2JMOGJUSUVoSmtOQWhaMEt4QXZ1VDJ4Qk1nVnpnUjQvMlVC?=
 =?utf-8?B?M0xLNFVEcWFsNkFxWVlyVFVhYW12UkhnOG96b3k2c0NkdVc3eW9wcEEvcWRK?=
 =?utf-8?B?N1N4cHdhSS9qQzZtbTM4cmovV05RRHc4Q1hWRkh0OW1NWktGMCs5VlJLQzh3?=
 =?utf-8?B?V0daSnB5Q2t1dTBuNGpxUU1RN052TVgxRS9yMXNNYml3WHh3eDlKZ2xKcDhN?=
 =?utf-8?B?MVVIWGh6VlJoZzFkTFdrY0NNSWdaUHgwUGUrMTBXMHhxMlZVeTltTlhHbGJu?=
 =?utf-8?B?VHFiZ0YrODZLL2w2NEJQZDJGTXhrUmtzdU9vdnBkOXRjVHI5VkZnNHFrNFNY?=
 =?utf-8?B?Mkc0OXZScDhBTi9ablY2SGtmR01mQ3c5NlhnWmlyZ0pOeEZtWnZDRThtWmZF?=
 =?utf-8?B?bEY0WDQxRFRvakVlVXdvTUYwMkhsSmdhL0pLQW5VMXhOaUlzRHZUeW1GZHRl?=
 =?utf-8?B?bEJHS0twdEo2NFRDU0pjU1RNQVJ6clkweHJpNnlrM0lnTW05RGQzaThHVWtB?=
 =?utf-8?B?R1I3ZVRZc29UZXM4WE94aml4OWdTU0Q4aVBybEZ6eVQyMFA0cUlUUnEzWGZr?=
 =?utf-8?B?NkdyQjlaKzhZNys4YUV1Z1h5K1NWNU1FY29RaGxqVDIyZE5SdzhialJwbWc1?=
 =?utf-8?B?all4YURPTVlzeEJjZjk0amoxeUdkY1YvbkNQUkRma3ZtWFJ3bHJaekpUdWll?=
 =?utf-8?B?eUgrMmpKR2lTdHJXVHV0TGNJeHFrNXpzTXljUGFQdTZ0elRkcDUzcWtwUjBx?=
 =?utf-8?B?ZmtTVC9UMHdlTGw0REI3bnp6TXpUdzNzSjJ0OG9qOHh1YTUwbWhBT0R3RVND?=
 =?utf-8?B?bDF2OEt2cVltYnZzUlRnaDVDbE1DeWJaemU4VkcvREdSbnZNcVBMdnRaZEJj?=
 =?utf-8?B?cjRQYVVNcTJyaUtUWWtiS1FPL24wZU0xVFhzYlVuNk4wR0JFWkRoajl2b1dS?=
 =?utf-8?B?Y29PZFFyZHVsOHh1M245YUxjMVhrSEJyN1RlRi83QnlpYlYrcTM4TmZtZDlh?=
 =?utf-8?Q?ILduHa882jqFZSaqmVeZVDlsc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016fb096-b1f5-47fc-6312-08db5d2b96c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:23:19.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAruJ6u+fdEcibi2SCW+xGM0mBY5eXW/skfW7tcd7Y4I/aiJTQi1LciSPIo07HQr3VVyBj8S1ABv1/NrIx1yPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

On 25.05.2023 15:34, Anthony PERARD wrote:
> On Wed, May 24, 2023 at 09:11:10AM +0200, Jan Beulich wrote:
>> On 23.05.2023 18:38, Anthony PERARD wrote:
>>> --- a/xen/xsm/flask/Makefile
>>> +++ b/xen/xsm/flask/Makefile
>>> @@ -48,10 +48,15 @@ targets += flask-policy.S
>>>  FLASK_BUILD_DIR := $(abs_objtree)/$(obj)
>>>  POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
>>>  
>>> +policy_chk = \
>>> +    $(Q)if ! cmp -s $(POLICY_SRC) $@; then \
>>> +        $(kecho) '  UPD     $@'; \
>>> +        cp $(POLICY_SRC) $@; \
>>
>> Wouldn't this better use move-if-changed? Which, if "UPD ..." output is
>> desired, would then need overriding from what Config.mk supplies?
> 
> I don't like move-if-changed, because it remove the original target. On
> incremental build, make will keep building the original target even
> when not needed. So we keep seeing the `checkpolicy` command line when
> there's otherwise nothing to do.
> 
> I could introduce a new generic macro instead, copy-if-changed, which
> will do compare and copy (like policy_chk is doing here).

Ah, yes, I think I see what you mean. I'd be fine with copy-if-changed,
ideally accompanied by some rule of thumb when to prefer it over
move-if-changed.

Jan

