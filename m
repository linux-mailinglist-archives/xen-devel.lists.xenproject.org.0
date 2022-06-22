Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F1554DC1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354024.581061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41di-0000XR-Ih; Wed, 22 Jun 2022 14:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354024.581061; Wed, 22 Jun 2022 14:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41di-0000UO-Ee; Wed, 22 Jun 2022 14:47:30 +0000
Received: by outflank-mailman (input) for mailman id 354024;
 Wed, 22 Jun 2022 14:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o41dh-0000UH-2r
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:47:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c639f23-f23a-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 16:47:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB9015.eurprd04.prod.outlook.com (2603:10a6:20b:40b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 14:47:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 14:47:26 +0000
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
X-Inumbo-ID: 3c639f23-f23a-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjAMMM3FGYKxG5nNrx+wFgbETpazU/UcD4bDqHrxreEPX0nEGaeycw6pQIPotiF14RX8d6g70q4BQNZPYSb0aXGyKH2V9UvfvURcfcWhbtiejrJYSAgj1w/PeXEuT2Cn6i2sEpgcZyUd4DUCBmCMWiD+7nJulhEpXxW2FIF+zqcn7Kv2VkDtp/TVADxWKP9Pu1lfOhHEGrUy/ADGhyjHZ6Gr+bMSB3awp+oGTSBohzF7G0+DkIFuDU3ZIfZ9ovOWvzn1b+ehl65x/gBfGYxnI2uyQQAIxwJz5brcwXrEnuh44hNyLRlVk0dCBK6O1FuxR1W8N/1TdF4lXg4m9Depmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqdmGhm9cWS7wDJEELqzqMhbHsqthLU+rE1P1HskFfI=;
 b=PbX3I/fl0hruSTRhiUKGO5mOQQL2MYRJjMgk34THhCyh0zfut8rt7EwFDq0InhDeAykaLtPPHSkyIjEPi2eol5AhYe4YO09meMlpsNRmv8kO286a2UEu33wj6209dkSgw5C8FnUGj4txlSBnxYxrlH0NJ7vNHZqHm9e7Z1CYKpdQwDtkSHVWnsV5mXlqd1M3aM8z4qUisWjN/u+djnSRDkuTW69qNKTs72VyoxFyhRr7xIfqB2366rk5M+QQwB5N546gR7e7Opuvi4IjA+hsaBE9uFT1riuUgti5wchvFuTf3jw7TfpwWjZM/7qCffrAhEZTCIg79FaupMrwa6cbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqdmGhm9cWS7wDJEELqzqMhbHsqthLU+rE1P1HskFfI=;
 b=bPfSA9V3gRtLIDFQoSzjXCpl1tCNd/ex6RDYZ7pCmkkrO4HSYekDspevt8nkC21kf9g0BrQNTaJ3FCFjpTau/zAxTOkytAamArTJnfg+l6AFCLzYTku7maFB5VcCo31CMgI70Qt41s7M1OSG8fABZi1Brp6bUllM7wEl1XYWz/PGWxOFon73ohHN0edCIZajAU57c/Hcp5wNaQ6gIHP08GjrC0p7io2gaXAmXihpYazIqH+YlPAUVPznTce/ExGqVqrW4eJvdolxQW+asG2mYVVe1vY07qhG50eqVkL/XFDVLSJWmXyN76BgTE64gtUoywq34pXyj4V7wHLGBtEe4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60ee0a19-064f-c8e3-aa65-b8c3d998a32a@suse.com>
Date: Wed, 22 Jun 2022 16:47:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH v2.1 1/4] build,include: rework shell script for
 headers++.chk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@arm.com>
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220621101128.50543-1-anthony.perard@citrix.com>
 <e264e3bf-b436-684a-13a1-be0aa0f6bfbb@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e264e3bf-b436-684a-13a1-be0aa0f6bfbb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa9cc63f-4370-42e6-2cd9-08da545e1fb8
X-MS-TrafficTypeDiagnostic: AM9PR04MB9015:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB90153DC51B9487D2E4980AEEB3B29@AM9PR04MB9015.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LVfsAu4j0WCSk6f/xDxpIcepIvctfwASHCMYpLYXlvgjTS8sCtLic5HcxswmionKDbe74i+Vm0YnnDWN+S+PTuH9XXCwvBfX/Cw8Qxqpku2spTFMAXZVeTxrU2wFOKMFaI8k1otec8scQkj6pJuHfWFF1Qv+fwckZS/DVKN5nfqIn5Qin5B2mwExf5+QR7uz09ash5VOaBNRbD4Q9/h9IQ89QVoXpC7oyc6liISxKW5KGYgRIzWAyc7sXEdbPVUGaU5syTqgrPomaffe6cW8rG58mMM/r/rd8okz+3uvC0g13cgTFT+xZMxpCSmXIGY2fhAF2HLdRWj5RxHlT/7iqRV0GbM6+qpUV94TWtqzDKGRlK+LLRhiEsqST29YNmrC8Mm3MEAxxQnAaGhbodiNm7r0PG9AeNVeJZ8PybWHBHgenU0rmuSSp0amgta5U1l3nF/3uU5sF6lhIrlZXH3Uag0KIVUnZTmPKbFvAe15qidUiKYwjXeaVrS/hD8C/uXIlaTmvl0+KPD8JS3OJTKgKseUvsuN+lC7iZK7vTuiDRMecp4QvtyahizF7MWK9L0Zqt0j3X7pU4fddiS676G2sGWujEP3R6PDZ0ZpsRMW/I2uOoVw0Ie53QFBGVw2ZOeNEf+kHob2GAqlXd623ySgTTDwmLblr2A7mlX/Msvm/IFbNk3QdvwnzH3l/HSQJcZGn0wxmo5oaZNNXP9ueDnTTWU6UNNESH+4g0g6WPHHKlB7Q6l1dnPA4rZibfEs/SQNFGzP7L5XU9n2D28qWx0JI/OUzc7fdQLYos8jS1hfiI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(366004)(346002)(136003)(53546011)(2906002)(6512007)(26005)(86362001)(6506007)(31696002)(54906003)(316002)(36756003)(4326008)(38100700002)(31686004)(6916009)(66476007)(66946007)(8676002)(66556008)(8936002)(2616005)(186003)(5660300002)(478600001)(83380400001)(41300700001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWxJM1ZjMFp3djdvZEplYkN2U3IwSzlDcjNUYko0bU9uTVB5cW5ROWZKMGtw?=
 =?utf-8?B?YjFzYTVIcldkL2pEZzh4NkE3NkNqYW5hOU91WlRoTlJDOFU3NW5yc0pBMXRP?=
 =?utf-8?B?NU1NL2h3Y1RSbktNZTZuT1ZQQU95SzdVOGNVY0trZ3F3ZjZlUDhsV0lRcFFC?=
 =?utf-8?B?ZEpadnNNVjhkanpKak02YTRscjB3aWIxcjNmZmpqTExESjRsSkJmeVpmQ0pz?=
 =?utf-8?B?R2loSWtWbWxueVVMTVQ3QWViL3VhT3hvOTBXRDUzYXB5R1hBT21PanlLUmti?=
 =?utf-8?B?aDl5UVh4MTEyNExpQkpDRHJURWpiOUVjU0VtaDhkOWJlZTkvbUVSUS9xVk1D?=
 =?utf-8?B?cjFYaUVCZEgybUs5Q2pVdDdmcE9kK1Jld1JvN3NybTVJWnBGK3QwYU9xWWFW?=
 =?utf-8?B?VHBpVWROL2x2b2tDYjkybHBybkd6K2Jnb0g4L21qajI1dm1Xbk16bTFUYXpv?=
 =?utf-8?B?QmVzSnFocTNseU9WL2VHKzFTeHNaa0RSb1R0NjYzU0Z6OGJ4akNPaVpITFN0?=
 =?utf-8?B?My9kdDF6Q0FXeUUvaVRybTA2T3NsSTNtS0JnSnBIRUJFUk13R3FrMEt2Tzdt?=
 =?utf-8?B?NjdMcENwbi8xVWZ3K1p3bUswQW1CcXlock1TUzMrNEV4RDlia01EQ0Z4RmpF?=
 =?utf-8?B?M2pUcWQ5cmdDM255a2s1OWlrNHRwZlMxQkpRQUw5Tm05blFVdjVSSFdFUkhy?=
 =?utf-8?B?eFlHV3U3d1lwMXBFR1RpSjhOcUpRUFVYSWxGZVFReHJMZGVtZFF4MXNvZXk5?=
 =?utf-8?B?QUlYVDl5TTJYVTd4SkdxUXhDaXVjeXlnWXVwc0V6d0FKb2VBbFNZaHM2RytJ?=
 =?utf-8?B?aW1GMC9TbGVZNmw4MkMyTjdVeXpuSEtQbGY2VHRYYXZQbU0rWm5hMW0yTS9r?=
 =?utf-8?B?SGFTd0NsZWs3TCtOZjhFTFZ1MTBTODVsazRPMFdPU2hIV0t1NVZjc0QxcEIr?=
 =?utf-8?B?akZ1MkVjV2xObDdVUXJXKzM1Znh4MlByL2xtMGFJNnJuTzZ4WWhCWXdnS0w1?=
 =?utf-8?B?ZkJISFhNSEtEQ0xqSUZwQ0tLMDVCV1VUdmFEbGtEMnNadWNmelhWOVg4ZGdM?=
 =?utf-8?B?Y1RPQUpnL2hrdmk3K1BWY051MEJ0K1EvQXdNdUJWT3ZMSitXa3VLMjNQWnhU?=
 =?utf-8?B?SXNtaXk0bkJxRWFIaEhpTDZKN3FaNlAvT29VblNFdVBCOE1jRWpEZUNIeTFh?=
 =?utf-8?B?MGRvN1huVjV6S1gzM3VkMUxkMUYvRDFZYkRjcnFRd21qUVNKMlpWajZSaE1q?=
 =?utf-8?B?WkpvVDVHdkJwUGV2SnBUWnhLeWlmU0pnODlEeTRNK1ZoSDFNdlVaWFd3clRQ?=
 =?utf-8?B?MVRuRUsxcEhVZlQ3b2VxN3ZCYTRKWndzMnNSbGV5VUdIa0VOOG01TC9pTVd3?=
 =?utf-8?B?R3ZzN0RhNENHVHFiQUtVUW9qWXBXTWdGRTFwMkp1NVZuUVI4dys1eER5ZkYw?=
 =?utf-8?B?ODkxbTBCVjBNRm1teWRlKzJsODZ0MlVTRkZDN2JLakFiQTJkZzhwYmlhYW8x?=
 =?utf-8?B?ZmRTR3hpRnR1WkFtejhHN0ltU3gvL3ZTSFllVk1VYWVHZWwrbGF0akxrZXFY?=
 =?utf-8?B?QlJPSlFqOEx3NWxVYi9ycWJtaWFXNnJlQUdTQzNTc1VpVzNaVHdXenYzWFU3?=
 =?utf-8?B?RURWWkdYSk9SWW1tbnNyalVGNU1MdTNrbGdsYTlna0xTWHVZSXhLZHptNXR2?=
 =?utf-8?B?a0VlWlU1MWdVNUZJU1N4cE9sK200UnRmbGw2dXdKZFlpbG1qdGoyaUJKSFdN?=
 =?utf-8?B?R3pxWS9ib0MyMUNSMWJKU0RoVlpycGNqVWgwejlNRUFnSC81eUE1bEw2a3pj?=
 =?utf-8?B?VmdPYjJkZTc5NmJBeldPeE9TNUJOdng4Z1htSG1BZlVYZ3MwZWZaRDZaUVFR?=
 =?utf-8?B?OE1PdVhyMjNzYml3M0dhRUJuVFhVMUpvY3cxLzBvbXh5R0JRNHpnU0cxeG43?=
 =?utf-8?B?V1dXRTdRVEFOQTVVU29QNFFUUzNIeDg4YWVoL1Vjcm9WckVPY25kOE9WbTlx?=
 =?utf-8?B?djBYVEk0czdSUFY3WUxaczE4TThtSXBOVHFEQmNwR3JOVUxNV04zZjkzKzdt?=
 =?utf-8?B?YUprc1djbHBPazR3OG0rUW5mL0p6VlZoK21zOStsY0JXTENBZW9pVTRCLys5?=
 =?utf-8?B?Rjg0M20rb1drRVZmVTgvOEpwSHFDQVlCZVQ0OXZwVTd6YW0renNpK2IvNEJG?=
 =?utf-8?B?cVdUS1NFcnhkcE1GWDlNK3FES2w3S3dSNFRUek94dnVIK2tpSk1uOThNMXBk?=
 =?utf-8?B?RW1LS204UkFnL25YK2htamZQVmNtRGVDNGxoSEdEUDFqWkpBYjFiK3pLTVJk?=
 =?utf-8?B?bEoyR2dra0w1c3VscHQyM2oycWRqU2pCRGNuWTRmR2ZxRTY1eGdnUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9cc63f-4370-42e6-2cd9-08da545e1fb8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 14:47:26.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jMoFD15jhrkZ+PCPTi3fDj3nJQoiL/dcVn/wBBQI1KNhjAf2Qq9bI01nSQiu1fbVo5LqWDNtVgTsx9LPdlFqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9015

On 22.06.2022 14:35, Michal Orzel wrote:
> Hi Anthony,
> 
> On 21.06.2022 12:11, Anthony PERARD wrote:
>> The command line generated for headers++.chk by make is quite long,
>> and in some environment it is too long. This issue have been seen in
>> Yocto build environment.
>>
>> Error messages:
>>     make[9]: execvp: /bin/sh: Argument list too long
>>     make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
>>
>> Rework so that we do the foreach loop in shell rather that make to
>> reduce the command line size by a lot. We also need a way to get
>> headers prerequisite for some public headers so we use a switch "case"
>> in shell to be able to do some simple pattern matching. Variables
>> alone in POSIX shell don't allow to work with associative array or
>> variables with "/".
>>
>> Also rework headers99.chk as it has a similar implementation, even if
>> with only two headers to check the command line isn't too long at the
>> moment.
>>
>> Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Fixes: 28e13c7f43 ("build: xen/include: use if_changed")
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> Tested-by: Michal Orzel <michal.orzel@arm.com>
> 
> Cheers,
> Michal


