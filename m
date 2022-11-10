Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD6623E3F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 10:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441551.695688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3Tg-00064A-MD; Thu, 10 Nov 2022 09:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441551.695688; Thu, 10 Nov 2022 09:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3Tg-00061M-Ig; Thu, 10 Nov 2022 09:04:04 +0000
Received: by outflank-mailman (input) for mailman id 441551;
 Thu, 10 Nov 2022 09:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PT5E=3K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ot3Tf-00061C-Bu
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 09:04:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e60a911-60d6-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 10:04:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 09:03:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 09:03:59 +0000
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
X-Inumbo-ID: 9e60a911-60d6-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXZt3f4z2BoV9yK3RvnI/laJG/lRn9fNAxPS9jC1KYign/kycPizKuseT/ByX3dHLZw5SX6slasMwpMvu9VG36YW4cX6Dzt1NGA8S9eAfYdUmAsK7lgqEnP6IEleCVdK2/h8Yv9ZVyqp3m45FiD2jUOkusP3Vp/xY8toyt2RcybXG5QlcA0CUBkEXiwrmEIAMjFd7WJp4C1G2Ts40uNTrZQuWgmPr2mEndeCmGnI2AtUp6hSpGYo6zFl0CG98VR6ZIjYaaXnXXAWV96ueGQc0qJsfT+p8GNyNXbhVDtPrb3VbtpbTrt/qQfQvT5p6r3o2W8u42m7qVnO+Kf1cgF1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pft+1Z+vRWwJOdgy/8sxq8vUhX/cZ7q9kPsXa+supH8=;
 b=lAJc/9xbw/QIWakVL4b+JOHinxzenuQ3jA3pglgOpx2/G7qrp0pan6dG9OALQ5q7ecZ9mobfDEr4OuR4CbLC9n/UKwzdbeCHhHdUwziX5wnq+1BsbaaZB/TBt8zk2IvDysH5hET/BTe0xgcU6SGkUz44qGVmoUTOgi6aemnSRXUCpHhYPcQOfE1jif5JDX7FTAy4NaOP5jubMfRsUxsAhbF44BXwLqpMMfjw3tgTtHAtP1Ffp1Yur/SHrXWnl49Oz3bN4+EJpP9fVowVn+YHHCk0E3syCc7R+NRsEnZl77HcqNvNAPRyl90KRpvI9qIxb2K5lCD0TYshNlRsXm+Rrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pft+1Z+vRWwJOdgy/8sxq8vUhX/cZ7q9kPsXa+supH8=;
 b=1/z1xTV/k7Ixx8rFCXdyIk0xJfF5Q3UzKQIHLFxCNILusaW7c++qLTF4r9PWvWRT7McS+QVT7YWbyCEfyEQTJxODe20kwwywyO6DHNy8cOA/MSXdm5JIyueYTurboyRw85Woq/iq3YsuqxK+ScltO1JidYHNhY5y6T79pw/UbLWafRDToBnuEnjnURzNA+mH+Ge9qtZSpjzYVAufNSYtJf2SEc14geMPus4ViIbGRc25cjWGygRd+v6qlOrXZ0QNZ0egOw9PbsHtfixJILFayRwOOXbVBLDYzp7msbXsF3rQ3bcxdT8ue2iTDK+pga9JoWaQwncCBV98cfXXKoNXFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e56fd4ad-065d-9b3c-e7df-50b233235652@suse.com>
Date: Thu, 10 Nov 2022 10:03:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
 <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
 <Y2qOtSyuM43RfwAx@Air-de-Roger>
 <76cde159-088a-3351-56e2-0cf14e9c8116@suse.com>
 <Y2t87YE5acLfiClF@Air-de-Roger>
 <afbc37a1-99cb-ea09-575e-dc6448cd6f92@suse.com>
 <Y2uQxiykG0+Jt7Az@Air-de-Roger>
 <31f048fc-f2e5-a421-0e60-98d1bed47ca1@suse.com>
 <Y2upkkdrPAxFjNl7@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2upkkdrPAxFjNl7@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0100.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::41) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: f231b8a5-d7a8-4564-e059-08dac2fa8127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2HGZ/Aqqmd30Nak8WthedjzCsk2uXL/iY7wjkC45NTFXTJqXla/XUQA0lMYbcXf3sVQLsj7cFeS9yyA1/7EPpVgk/FniVjYcTmvqRQ1YZTlLx6L1XSNjyPnGNK6OUYF+E1TvdZtwa3z8j1QBdE0DTEPDaWIIDUQNxF0/RYyoGM2BlsSMuDs9ielZB/jPkYdTgWCm79/1zHus87dCEKObFQqJ+AgAo1HCTu6KBsfbcJqb3FLfGzATfQEDvrfjiTiVD8sYgsL0e5pyiwVelJRRD2EJvb0+cF5gKWSkW5HMhX0NjVGfkkD6PqIJALL1cHkvss+Y0WLuyHSKoJQJCoGxxX3pDztS3fQLnXVVveHF4jLDKAenlA2AzCKUBfEZKcC1Ll52dLGFqZXGEVJKFZtQIxYIjwqu3WrJHx8Aop8gJRm83cGZyOVrOoUYaH2O4PpD813DrjcJU/4OL7LEhvAyCbd0hlb+/N1F+qVboHwn1TvFdTdZUnLG8Ei1RMGIrax9dtWoLOuR2WA1C6xxe8ktm5TpKtej0XtAFJ3EHBwrEt5ocMEys1QQ37T4CQZEewo1hbnmHMFVKOEzKyP5NMu/N7kDK5O1dVAn+Y8MxKhr7YfMYCkaoS2fE5BOXzJCiHG0XZA+jqYgPR/WYOGUb9NVf3jVuqMJL1pSEgdSt0Z5DxSi1Rdnq0UEdoYvUzMBWGyI227d0Nj+kdXIdYKZO5+eiYLK2QLeFJVfrcyVLMRAdYDPKNvBrcTU5pIyj6Sf0SyZsFA5fDxv3vB9VAGAk28M+be1+j7Bkf995OI0lD5+Lmc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199015)(186003)(31696002)(83380400001)(86362001)(38100700002)(2906002)(41300700001)(4744005)(5660300002)(8936002)(478600001)(53546011)(66946007)(6512007)(26005)(6486002)(4326008)(2616005)(66476007)(8676002)(66556008)(6506007)(6916009)(316002)(54906003)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEpCSEI5MlZmRWU3ak9mQXpEWGNXdjNMTEdvTWZtdWlpTE12R1dRT3JBVlRt?=
 =?utf-8?B?cU41L1pqWWNMOWI1TGptN0s2NWJnLzVWc28yM3BYaTdlQS80eDFJbE9TaGNK?=
 =?utf-8?B?Y2F0RW9DWUlnbFhzekh5UkJFVTJpOFB5VWtELzhhM3AwUUFEY1hnSjJiRTd5?=
 =?utf-8?B?YytacVQxS29GVmdkUzVRTkJ2aklsVTN2RlJpTHVyU1FhK2cwcmE0TzFnNzM2?=
 =?utf-8?B?TElPZW0zc1d3dm5CMGg2YmNYSmJGbmhlbUU0UHE3N1ZtRFBhbk01NEhRZ0Mz?=
 =?utf-8?B?bm9iL05uMnMyRklhS1ZkVVlMSjRtVkJVdmhNWVh1Nnp3dFljQTVLdnZYYTd0?=
 =?utf-8?B?U29xRmdSZGZPbFoyTFNUZ1RRTEVMZ0orVVd0KzIvK2RlTjBhaGFYS01Dd1l0?=
 =?utf-8?B?dmc3SHlnMEVrTW9jSklyejdNU0dpR1hNOHpJTWVvMnhsZTJNTFdjanpVOHcv?=
 =?utf-8?B?NjZYdlloV2hQNlhoOWI1YkxuY0dSNG8zNGNwQTFyS3huemFLN1hoUWFxRkVM?=
 =?utf-8?B?L2N1WVB2Tng3bGVPTXZ4b1dhRkVrZTZLR3ZXUVd5czV4dWFYYlJPM2k2WjN3?=
 =?utf-8?B?Y0tmZk1SRERXS2xYL04valVBa3FUcjB5Yi91VXVyODgvVFhwVno2bEw2KzBV?=
 =?utf-8?B?cXRxQWJ5NDRQa0JEdGNjRDY5QVNya2RMd1dVMXRGOXFJeXBmZ1dCYzg2bUZ6?=
 =?utf-8?B?WXJkbnh5SHF0MzMxN3NhQ1lUZHJTZXoyc3NvZ1lMY29yNTZOQzlPcFVia2x6?=
 =?utf-8?B?TG1oN0E4RFdTZnhjYWdOd0pQMXpqVE5EUXlFSW5XdjRQeFpaT1J5M09PRUpy?=
 =?utf-8?B?cERHTnh6M0pqMWxRVkxEblk5V0Q3TldYVFpRSEx0dzd2QzBLVDZOeVE3eTBa?=
 =?utf-8?B?QmZ1RUp5MkE1OTkrek8xMTFVUEEybDhpcit2czVVZHJ2STh2MVdEVzdSQi9N?=
 =?utf-8?B?Y3hYSkFYZ3lmUlhOTHRwWDVkSzBQZjROVGp4UkUvcTZRYkQzb1pUSW1mVk1O?=
 =?utf-8?B?SHZGMlhyUFEvVVl2WVN6TTZmTlZTOFJjVjRWb29SVm5XRFNPRWNQSU9rYWJ5?=
 =?utf-8?B?NFF6WUxUbjhUQ2JoWjNUWjA0VE40MmMvWUYrRDJRUHR0Rmo0N09rSmVsazY3?=
 =?utf-8?B?YmRMZVYrNEdXVGxHbE5DSjJ1QjQ2bFI5Ky8xTWRIS3g4dHk2L3ZZWDQwVnpz?=
 =?utf-8?B?TUJUSm0zaU5DeDRjblVuMExnY1ppNnVDc3dHNDhtZER0RTUzNEZJMVpLZVpH?=
 =?utf-8?B?SzQ4VmlRbmltS2kwYzIvcnp6TGxjaW9ZZEtJRTBtUHh1Q0RXRElFaHQ1bEgr?=
 =?utf-8?B?SEZaeS95OThjWkp0RUQzM25ncC9USU02OEJEbXQwOVdCT01PREFkRnlNUWxo?=
 =?utf-8?B?OS92ZVlmVitHdkNuZnhVNzdmY3gyS0lWdlg4QW1mUTBOcXBSZUMwUFlxdGlH?=
 =?utf-8?B?UTJaNnBONDQ0Nll3OEw5TkhKeExmd3dSckNCdVNRc2tuU1JpT21CTEl4ZjRx?=
 =?utf-8?B?ckY5MG1rbkhWWmVZalQyQjNSWE9qQzJ1bVpWMHpvU3BIOURSV1pPMDVPSXhK?=
 =?utf-8?B?TE9tUk5jVHJoU1ExRW1Yb3JnbHEvSWJNWXJ1TGI5RHNVMHpkRlNRSDZoR2ZX?=
 =?utf-8?B?OXFDc1N3amZPeDVqNERmeERpV3JTZFcvMVJVVUYzaGRuc1VPWW1sNHlhUEc4?=
 =?utf-8?B?Q2diYUxrTm43b3BHbTRSTkdOUjBUSWljaTQ2TGFlWEFFdklYeTBQaHN6NVBU?=
 =?utf-8?B?WCt0Tm8xRUpHelA5K1JZeFRxWXVaY2tZaElESUUxc3dmT2ZCSE81VXlhRU5U?=
 =?utf-8?B?c3lSNFpUNmhURFo1Zis0NVVnVGJxUHJMeTNnczFpQ01vYVdDU1JEc2VFNDRz?=
 =?utf-8?B?aTVzNk1sMVk2QlRaUW5KR0IvTk9zWStBWnQvalphR0FTZGI2R0xtcWl4WmhL?=
 =?utf-8?B?c3ZMb3RjKzgzSGtsOUcySHg5VHBiL1lkTTF4RWJpYUdrTUNqT3ZuUVJJM3da?=
 =?utf-8?B?dmVEQlhJTW94dkdSZ2JLdUROMWNaMnlJOXkrT2o5czZ3RnBRQi9KWWFyeEd5?=
 =?utf-8?B?S1B4TXhUaDJ1TDU2dlV2Q2J2TzA0b1FMQXB3WGcyUXU0MVhSbFpFMk9xNGtH?=
 =?utf-8?Q?uHWGD2zj39HoG8uXvHfL8ydqX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f231b8a5-d7a8-4564-e059-08dac2fa8127
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 09:03:59.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hb3ThsUu3q9eeCMhnPwM2jAd/EKSsjREaz9bjLiisjs3fUjytjFRv0MHE9DZwsifNO3/k4wQZlFwGuIAk0rA7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7979

On 09.11.2022 14:22, Roger Pau Monné wrote:
> On Wed, Nov 09, 2022 at 01:02:28PM +0100, Jan Beulich wrote:
>> On 09.11.2022 12:36, Roger Pau Monné wrote:
>>> Since I don't see replies to my other comments, do you agree on
>>> returning an error then?
>>
>> No, my view there hasn't changed. I wouldn't block a change to go in
>> early for 4.18, but I also wouldn't ack such.
>>
>> Perhaps just one remark on your other earlier comments: While you're
>> right about XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK}, (effectively) random
>> data in the bitmap may cause a caller to do extra work, but wouldn't
>> look to be otherwise harmful: Considering pages dirty which aren't
>> is never a functional problem, while considering pages clean which
>> aren't is (imo) not a problem for a dying domain.
> 
> Can't that lead to failures elsewhere when attempts to fetch those
> pages find they might have been removed from the p2m?

Quite possible, yes.

Jan

