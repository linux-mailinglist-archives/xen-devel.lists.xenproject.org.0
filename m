Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B986BC675
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 08:06:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510318.787770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pchfu-0003K7-2V; Thu, 16 Mar 2023 07:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510318.787770; Thu, 16 Mar 2023 07:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pchft-0003Hk-Un; Thu, 16 Mar 2023 07:05:21 +0000
Received: by outflank-mailman (input) for mailman id 510318;
 Thu, 16 Mar 2023 07:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pchfs-0003Hc-As
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 07:05:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e810a3bd-c3c8-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 08:05:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 07:05:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 07:05:14 +0000
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
X-Inumbo-ID: e810a3bd-c3c8-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgliI9d15DgojbcBlrGzTjCLP6fhShFibsafj7+esIt07I6XVjXMo2uLacBOWTggvaTvnQdRf5K2KejIad1Wi+9EKZ8wKu9fAtFXk3VROBdT+KwPt3KDfYRTWR0QwjHUgap5yaCXWCZBfhrXIKaYZM3dcKl6dN5q4a0E5eliqFGDTIk3SUzdTatPUhk5BCbfXKAiwcPiVJ3ZMp1kvxlQjaUuw7nwA0Ww/QrsoTZHMgDY/adHKghF3m5L45l8EgOVWZqH5wFVLwoVwIZi5omQIsr8EE218EudYguy2KZAFSUJk7FdgP4wKmSgpGqaZQveqTZbTr2YZnZScpoGPaVrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pi2kHMkPYV3nxr2IOWClX+KB5TfpBTF746lgJCCTi5E=;
 b=IN1g9i3Bb2VFNQok65mGqIqpj16GCA+8lmOWB+hDd1Lo3CB53jil3bNUlqm1ofIGaWSZ+oV7A9cvBo+cgIvaRtlVkrmdZs7xgbHjsB//FWNaRme0Mro1AJA5HuCzDicHAccuY38TMlgBo44KHZh5PwQpX5mVEe1VVzOOdjwylW24RNv3CZ+LHp647cOrYX0XMkMaZzMgCo/bv46uKcEHc2/OgcnrKFjUTRmdqqot3AkQM4VTsQKv4M+jE7DamEzSNODDetIw/Q0F3Wnysxg4RvVChia1NlHQ64cJxt0DEyKnaV3hkrg0jThI68iydRBtfB+Wl+9SsJafmjeVO2YxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pi2kHMkPYV3nxr2IOWClX+KB5TfpBTF746lgJCCTi5E=;
 b=tANmNbV9Jwpggh0nP7flTg1wwUT/gIWcILgZrebjWIIJtEoM7S/JBnjzjFUMYjnizikdi1eKPInieGMG7GdjkW3Q1HF+4hHCDCTCjKbnFw1MemcZvoRAdoIoZ2La4Myc4bA55z5NuyM9yJZFXOYalhw84h75kFK9LiendqxqJXBj8w36ChGKfO4B1HAuTUhhLVR/mGQW434ZYqKLhTC4Fw0TeLH0FR9tdYMyObzNcZCRzpi/cmtHoNsRyUoAg2r2MZEL7oWzn/fUWA2eRlceeOHlr1AyJm3lUAU5K1EcCVY1aQ4HazyH7Zn6vckE9uWiLG8syveRFLESEEGQ8FH/KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01fced19-dfbf-c23a-ec5c-4487737543b8@suse.com>
Date: Thu, 16 Mar 2023 08:05:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 4/6] x86/pvh: PVH dom0 also need
 PHYSDEVOP_setup_gsi call
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Huang Rui <ray.huang@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-5-ray.huang@amd.com>
 <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com>
 <521ccacd-a45a-f55a-72ed-de6b64bca050@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <521ccacd-a45a-f55a-72ed-de6b64bca050@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: a309d7ed-182b-4429-d5a7-08db25ecca4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7mYzwzIntBow+ym2lKVTQJ63ypCeTYMxzNbDwmUpWDG44YoduGd5iWhejlS8aPQY6fi432YRMax2CTL47w+RzJKsYA+qLe4i8QE2iVzyWodW7jlgNfJ4cM5MC4T5fcabO5P9aQVa6dcrHuwc+od4il3wFTRvDIz/qdnGYwBphD+Fonm2kc0vVCGtU1WcTjigXQ7S4Vv5Pj7t+JRJekKIpW2sFemOwOnslUt/kapTSMJFyuGHvFcZ7zNEaf758OmoW+ZmcJcJiZ7sPuW1mXPILw1T3gS9BVOKcJsK21cC9LimBAQ2XMlnL0MqfUXkqDnRLwybo9Ie/TkPcfy1cFrSkW0Y5taqbRc2DMBZnWD2Hg4RyIDCpqANSwtUuRTGQyLE9cZx2LnhKudQISP31DKvRbsj6HLYI6v0JBnk62hQKs3kZmhWzSvuWm3wMx7Xgst7cpgBJLEWFg3ZSWsdyPqGX7OyKrk+j57FAKcbJQIIjNFT4aBpObbsC66RKFuSMN+i9Tym+xNKLp+t//np9yL6X+Vl7BnTY66eiNTxx2kNT3+RbluAGRLS0qlbwjmkDhEHgZwOmNpPikQtE+J4vS4nZk7+6TMo7PchC5s//Empnd5wpy5s8jxhMpb4F5cXII9ozWvJdvhkxM5lO0LklNTfhlZ78ii/6vgSBH/pWyZ/smuYyksno26fYiftZ+13H1cTfpLQJ0tpDSltOIA2MgTS0P5cUF4iKOg6AlBGh2kolfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199018)(6666004)(8676002)(8936002)(31696002)(66946007)(36756003)(5660300002)(7416002)(86362001)(478600001)(66476007)(66556008)(4326008)(6916009)(316002)(41300700001)(54906003)(186003)(6486002)(26005)(2616005)(38100700002)(31686004)(2906002)(6506007)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnFEb09QaXoxVktIaTNDdk9jSWxTYTNTaVJqcjhrSXNWYXl4dW5hMlpJSmIr?=
 =?utf-8?B?b2JFTUdNRTkwVitYREJBcEhqYlNMbVNYNkpickZQR3pUYkR0Y0RPZTdNUDJy?=
 =?utf-8?B?aTNIaVVwb0xkeGNsUHNwLythcy93TjlET0tzNVNQM0hDYzVrTjFHeDlRM3ox?=
 =?utf-8?B?U3ZrUDliRWUzcWU0UkZhNEZuQlYxQmNPajQ3WWNXOW02VjR5c2sxYjFVQVN2?=
 =?utf-8?B?NHJEUHhlcDJWVldIdjl4VlFObHdzV1E2Yk5ScEc0dGdEVVN2dTJQSUtEc082?=
 =?utf-8?B?cGt3TkRrRkxaVGxGWXluOFRUUFlITlBDOUxic3RUTmhQQUVybWJ6ZENQVThj?=
 =?utf-8?B?V244Nk9aWU96VWp2OEhhTGVScVBEWkFmbTRyczVoUnBseGdjTW50ZHlMbEl0?=
 =?utf-8?B?dFRYSnM4SDBYWGJEM3k1a2FCKzNxdjZ4d3JQTi8vUlFkOEQxaVhjM2VvR0ZG?=
 =?utf-8?B?dzh4Z1NrZCs1TFpmUW1hN2Q0eWJqSVh4Y1JCNFFWeW5paUpPRmdtZ1ZBUkVR?=
 =?utf-8?B?MHJTWmc2b3pqMlowb2w5TGxtZ0VCN0JQU250bWdJeHZMVEZ6Q1pnQk5vUFpC?=
 =?utf-8?B?ZjVqalo1OXNDeFo0c2VpbmJMV0Jpem5TcWppNUVkTDFVOWJiU01vaU9aMFdD?=
 =?utf-8?B?Z1pDMytMODNtc0JjZkQyMmJIek5BTkJXZDNSeUlwNU9NN29wNjZyVVVxMTA2?=
 =?utf-8?B?aFBlamRyTXRuaHhWWGJTeCsyVjhIRjJWbFNCeHl2dEpnb2pUQmIrZlJRbzVH?=
 =?utf-8?B?M2d2Nkt4UGZVbGZzUFh4WWxRWWNsRkowK2pFaURLdFBIL3gwRDdtTmdnblRa?=
 =?utf-8?B?UHZyT1E2dnJqSlNWRjhjdGtMZmtSa0NWS3ZuTWVORWtMMHdpY0JlYXdQc2FM?=
 =?utf-8?B?Um5YVHVwSXBNMkRNZmhJZlR0OWN6ZVluRFo0bTJnUzBGY2dQbW4wMWptdWRO?=
 =?utf-8?B?VTMzNGZFVmRYUE4vNmMxWnVLRlVLckp6alJzZHBzZWRwVHllNUpSNm0wVThq?=
 =?utf-8?B?clNQamFlVG1HYnFoK0oyUSt0WEpYUnFDQnI4Q3ZmcWRUN2J2SW9Rb2hDUGwz?=
 =?utf-8?B?M2lCRzUvcHdIYzM0a2tocnhmRVVoNmttQ0RyT3c2QW96YkFkQTJrRVBPd29p?=
 =?utf-8?B?eXp0R1NiZy9wVnVlZTVlTmdabHgrQ01kU1pJb0Q3OWFrWFJqV3kwLzg4bHk2?=
 =?utf-8?B?MFU3Zmp1aE5vaFF4NlFwQVVwM0xWWlc4RE8yNlJqVENXYnFqaSs2R1FzbHBo?=
 =?utf-8?B?VlZ3bjVjYnBGWDhaNGswdW1FNVBUZXE0KysxNDlDN1grK200S3d6ZUgraGJh?=
 =?utf-8?B?RjR2d1FtcWNVUEFtbHhkZStiL3N2V1VvdHd2V2MrTjltMFlnS0FlWElMalRs?=
 =?utf-8?B?T3VVSm1FeENGNkR2OURpU2c1QTF3cXBpdlpXN0NxTHBOcGJoSEw0QVdFUldQ?=
 =?utf-8?B?WUVISHJJL091am1yelRMQTBHYmNha2VsblA2SlV2bG1tQ0hyVUFCTDBpQXF2?=
 =?utf-8?B?STFsRE9WWDg1MjdTVUhzbjNwUXloOEcwRGhaMGx4UW1LY2xnU1BUaGNJNTBk?=
 =?utf-8?B?cUxobWUxellNZy9aRU9YSkRFMHlialdqR3NoUjF3cHlmNnBxbHdKMUwzWlZ1?=
 =?utf-8?B?RjZZdVlKMzYxYzNBaEdDSlhQRHlQaVZKdDcyNnVkUG9CSnhMakwrbWlKQkk3?=
 =?utf-8?B?MHh4c0loSXZ2YUNoaTd1MTRkL0ZLNDVMdXhLRFcwNkZmb2w4UDFGTjFBM2xK?=
 =?utf-8?B?OG5QSU9UQ2xkdE5rUkdVbE82K1U5d3JLdEQyVFdPM2JDbUNNajF2RmtKUFl3?=
 =?utf-8?B?REdOa3RyNXd3aEJHdW5Na0pVVVZwdEVBc000SGQ1cHNkK0hQcmhjaUNFRjFM?=
 =?utf-8?B?VkNLZmxQK05JaEpSNlloL0FvRzMxSnZPVU1NbENTT3hYcE1GTGYzRFZCRHRZ?=
 =?utf-8?B?eWs2TExzK0FXVmhVTDFBQ3RLOE1kc0NHT0RLS09JeTBiNWdNWFJCMksxRzcz?=
 =?utf-8?B?bFNRN25SZ051cENxQ1hjK2lzT0ltK1pnRUtFNjZCYmx5YUM1endwd1VzY0FG?=
 =?utf-8?B?NUFBd3BFSmlwbXh3OUJDVHdkVlNNaWxtYU9qdUJReDUySWVIYXFMeHQ3ZmRQ?=
 =?utf-8?Q?eaZThHL4OmE1HIf/bwqOQrWC8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a309d7ed-182b-4429-d5a7-08db25ecca4d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 07:05:14.4040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RflJutYR1AIzvpTYLvLUyzK0g5zjOQ7/u0Ognh4KlA9OcknpZ5kYNGJXvZJjbnNN7Dq3BYSwCknqYDJW8K2IjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871

On 15.03.2023 18:01, Andrew Cooper wrote:
> On 14/03/2023 4:30 pm, Jan Beulich wrote:
>> On 12.03.2023 08:54, Huang Rui wrote:
>>> From: Chen Jiqian <Jiqian.Chen@amd.com>
>> An empty description won't do here. First of all you need to address the Why?
>> As already hinted at in the reply to the earlier patch, it looks like you're
>> breaking the intended IRQ model for PVH.
> 
> I think this is rather unfair.
> 
> Until you can point to the document which describes how IRQs are
> intended to work in PVH, I'd say this series is pretty damn good attempt
> to make something that functions, in the absence of any guidance.

Are you advocating for patches which don't explain why they make a certain
change? Even in the absence of any documentation, the code itself can be
taken as reference, and hence it can be pointed out that either something
was wrong before, or something needs extending in a certain way to make
some use case work which can't be mode work by other means. In the case of
this series, without knowing the "Why?" for the various changes, it is
also impossible to suggest alternative approaches.

Jan

