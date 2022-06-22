Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C05544E2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353646.580601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wjt-0006is-RN; Wed, 22 Jun 2022 09:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353646.580601; Wed, 22 Jun 2022 09:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wjt-0006g9-OK; Wed, 22 Jun 2022 09:33:33 +0000
Received: by outflank-mailman (input) for mailman id 353646;
 Wed, 22 Jun 2022 09:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3wjs-0006g3-VO
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 09:33:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60056.outbound.protection.outlook.com [40.107.6.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 610fb2aa-f20e-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 11:33:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8404.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 09:33:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:33:29 +0000
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
X-Inumbo-ID: 610fb2aa-f20e-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpTyFv9btR6prjPX722b1LmlcdpoEF9E+ylZHz10AHYodWrpRDH1TvKNcojBjUFmvJYpH+1iKIQbj06QZd1aqWLAQ2hjJuE0VJ+HulJZxzdNVzQlkgKkh2AD0gYkomoyUR21mpPZ/omeHXcc5czvcmbMjI7P/BfkqDmCKm/BCSnJJRVjLjlt2DWvmmqXJ5uwEP8NyzrTgl97BNW1/hPzwhFH41J0u/6E1JWMoR5UUo9ejztJtpI+ZZp4vKh6Wq7488p8jmhFeI4rKHgLnEJNiKepr5Jo6gl2i/E94C3c/T/IYnoj3C079Vod6Z9j1VWYG/xktHpegFePzF1nDgryvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7hcPWWqIcNONf0hEvR1CNAcoSuKNK50b00DDrGVezQ=;
 b=SBWntLCQ3PfBR+P9ACX2WhtvHU7wLJ7TGwTPUB16VlXgAXDVc2k4wYl1HczT3nPqH6Fh2jJSGdP8NtyjYTAhRFs5H7ZX0JzXmvV2zBclQU0rShoa5SW+k/MIXcLYcj+Gc+klvd/65zpWLnIwSeR2T/+ewuT6m8Ep0R1ZPsW4j5SAGThAuXP/YYC4HyJATbNF0Dx53zGP3t4Kr7Ybp5wQnix6iwlTYLxPzvUKqwtlnNvIrRVoJLVrWSjKmIQCJTnxzrUGNkqJogVH6K9uGewYGUnoRH//l+hnfWamGZwv7AxcRti6rIBHXB5bpfTwAlv3O8uHp1UVrr+Zd9wDdXrkJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7hcPWWqIcNONf0hEvR1CNAcoSuKNK50b00DDrGVezQ=;
 b=R2/Loonskxy4Xct9EW56Q4iWtVv9WDI7gu0eers+RygFYpdlulfAKNJTaUd1KRmcKa+PwUTyD+9ty9v+7c7N1glhttQitgKRBn87j8kJyCap/YegHM26/UTnom5EdrHOSZPr2KkU/pkeLuxa2PyAEW7zimEyPavkfoTZmZl++Px658sv7ag+LrTjCfJORNNzmZm8kcIf5lUvHsAUIj4UasJWesIG8NX/bxHp3FKFLcZgukeCpgwenQ5ZCYFjTd3oPnrC9fym9QwrN+m12/xHX0l0z1lSKtydY0La5Bo2FFW6N+/u5heJy2mbxM4f2xSxOKN5nrZ/VjD1fEFFfjElYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af4f325c-367d-4b05-fe96-b102b7f7e554@suse.com>
Date: Wed, 22 Jun 2022 11:33:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
 <YqhHtetipYTG8tuc@Air-de-Roger>
 <72c94980-cbcd-d3b3-7aad-c9db58d9c4a2@suse.com>
 <YqhXFKMlIvkQzVoT@Air-de-Roger>
 <291bb0ee-06d7-af25-79bb-e099c7ff2fe1@suse.com>
 <YqsUfH763oSchRdW@Air-de-Roger>
 <8ee15e94-f4a9-69f2-4c57-2e0cc9df8746@suse.com>
 <YrLcLpsd8hOcMOGI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YrLcLpsd8hOcMOGI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0045.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2829f0d3-1143-4771-cd17-08da5432442f
X-MS-TrafficTypeDiagnostic: AS8PR04MB8404:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB84048F90896DCD0FE51B0ED3B3B29@AS8PR04MB8404.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NU/oPnlHOqXEyi0cfHmQ5f0V3BquWZlCvo+IsjJyueEVBIwQJV/j6G3vh6yK03J8UU1cIxphBRMPEi4Pc69uw76EFKEibft+q7yQ8jqQKx5t7aNv2JFciv8TkmZH/cALUxH1HhfWl9mS7ly2sfuxS61EDv0O8VtrkmPQEhz+425EJZQBpt6f2nt82VyRHKr5BeV5Vj+8O5xqWKzYsoFlkUASYngWlt35iq0XatU1GN6/diIJMq9MERbzlkKaXrkrU/A2bqOOpVxIZo0AZqOhjfIGrtEeBGTZsNUQGT+413M1wwqhjooa76XTw1vDXYHcuP92Gz9cnL2vF++DN/zM+EOWJmO2qKhDeCNQWDkVb06IUUhcxllJzub818Duq0MotiLaNDipUVEg1kk9i5ZUjnit9YH2BahZB5QMf7J02LGv6orHOOh7eUnBbFm0UEe5gt6HVtjNvYoR/63XczYe+8d4J72Ido+Y3OjHEUHuJo1TU9QC2hwbWS3chlvcEMpYm/aZvi67h+oePmYGjwft8Kv3bWLpnZ+Nb806ftul+PKxRNyqeO8EF6Of9bmH/UlFZ8qZLWSQIp7OWvUSqD3OrfSKh4AjbeG1FWcDq95qiuOmg5AdWt58Nyot1otnJtUCsHJb12H5deDw3To3IunVrSfDFNJlSSF83odMpVwdsrmJCqBDYn8RnnQfE562C8ol3l4HBgxhCrp98WZcPmZWJ5prfMS+5MKqPFA2jP4LDaFDciaV9La+xXiVAHahlqyGsJYseIea3ZY2L4YZzwpnHmqazZjHpE9JGnII+0NWOWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(376002)(136003)(39860400002)(396003)(26005)(6486002)(6512007)(53546011)(478600001)(6506007)(6666004)(38100700002)(186003)(41300700001)(66946007)(4326008)(5660300002)(66476007)(66556008)(31686004)(8676002)(2906002)(2616005)(316002)(6916009)(83380400001)(36756003)(8936002)(54906003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2g0QXdTWUQ5TFN1ZG52bENVMzRUV2ozSkVVVU9MYWxzQ2s1ajJzMndaQ1V2?=
 =?utf-8?B?d2pQQjJWVG9oVVRjWGpqcnpSZ1lmL2NkZnppLzROdklLU1Vyam1uZ2ZvVWF0?=
 =?utf-8?B?VFJJSzRmOENFZnFscXFNWUY5RzArQWFrWUxIb0xSdXBjMjA5bkZneERYMy9a?=
 =?utf-8?B?T1diZ0dadlJOTHhCUVZYSDF5d0JGbHQ5cmgyaDdqVk5xZDhsT0l6dTRxZFNo?=
 =?utf-8?B?MEkzSTExYnEyQTBEUTd0MFlHVnVsL3ZpYzZ1M3p2RnQ0eUt5aWVuM0lHRTFs?=
 =?utf-8?B?a2I4MU9ySXpnZGw4YjdsNFBab0J6cWFQOHFOMWdhR0RWWHJRdWRvaUFTenpF?=
 =?utf-8?B?YzZaQ1hqRVdCcXVYTjVkak81WWVZTzZKbGhMN0tCQjRtcUZKb1JmQ0hjcEtT?=
 =?utf-8?B?UUkwYXNkbmphTkthMFhrZml0OS9WRHdwbXI4c01vYkVaR1ZIYXZCem9NQnRR?=
 =?utf-8?B?dmRtamVmN3EzS3pyQ2MwQ2lKT1hLWDl2cFBRVnVvcERjMTBtelpQWTcyOU9F?=
 =?utf-8?B?Vk9XYkJoS0sxemxQMUs3WnhKZFR3QjhmVTVLQUg5RnpJTnNTa1RFQ3Q0ZmRZ?=
 =?utf-8?B?VzJpWmhLU2Ixd2xNaHNjenFERWNtaC9yTG1RZTNxeTB0cUl3MTk1eERETnYx?=
 =?utf-8?B?WStqNGc1SWZpRnhUYWUyM3E1WkJrVUNaMnZ4T051dkROM2puY0NPWW92aS95?=
 =?utf-8?B?d1NNcmlPakRobUQ3OUxOQTNEUUtQZ3FJSGdMdDNwY01CS241QnpMWmhEKy9n?=
 =?utf-8?B?bXM4RGFhVk4wVGxIQTd1OUdpRnJqM3VTdnlKalhFNFZEcWhLRzJMdmtFaWpm?=
 =?utf-8?B?bUdmeWQxa1htM09XUzYxa0M1L05sajRleUwrbllFekg1TmtCUHlnUjRDbWJP?=
 =?utf-8?B?Sm5LUWdpMldrckZyZDdnWXJNN0pOcGdoYjcvT1FMUEMzbC9VRmhqTjRMQXFx?=
 =?utf-8?B?Mk1Ga3pwNVd4K2V0cWJUbVVyRHFUYlhRc3NKaVFDQm9LMDJ5Tml6Rm9QVWtY?=
 =?utf-8?B?d3EwYUxseGJpU0RuTFo1VHpKdFBWRGdwOTlHbHZqa3Q5YUJHQVh2Z0l5ZnFX?=
 =?utf-8?B?enp3S3J0Z3B5M1ZwZ3dhTGdmRjdtcDg2KytFQy8zaDVueThvMi9peUpaMUMr?=
 =?utf-8?B?RnhZS1FBdGhSM21hcGNQdU1lajgwcWs4Y0hQZDNVSkZ2ektFczFLR1BxTXBr?=
 =?utf-8?B?UUxoN0J3Z0hDQXRadU5SLzlVOVlLUjRCZ0o0Y0VlN05xeThhZmNuMHRjWTMr?=
 =?utf-8?B?RTk0cnZucitiWEF4eEg2L1RnSkFaTFBrdVdUT3I0T1hVbk5xM2dCQnE5TFNy?=
 =?utf-8?B?QndGaHBQUkg5aFZuM3RKYWFjRU51VXNzSkgxVW5XbHpUS0c5TEh0bEh3cDFJ?=
 =?utf-8?B?aW5DMlBmdi9GWVUveHhNRGFMV0ZRYlA0ZVR3VjAyTkk3Mk5CbmRPaC9OSkMv?=
 =?utf-8?B?dERMSW1zTkk5a0taUkl4Rmh4cmNSNWN4UUh4Sk1ENkNIK0Y3WEs2UzB5KzlV?=
 =?utf-8?B?eVBWK2lqdE5hRHdHcDRLU1EwUmZHV1NNUTQ4Y2dSZmFOLzBKSFk2TjZhb1Qy?=
 =?utf-8?B?YVN4bFJ1OFR3NitvbzFZR0IzNmZtUFhVZE5WbVNmaGxKVnlIUXVLRy9keVRG?=
 =?utf-8?B?NGI0UGNGc1ZBK0k2ajIzd2lOeVIzNlBSUlE5U1Z5bzFBNE9DMmtNQkk2Tkcy?=
 =?utf-8?B?cW5obWlldzhIMXJYZ3VSdmc1K21YZFJuQTRMMkU0Y0xuOWRxNjJsYlNyTHhN?=
 =?utf-8?B?WWFPRmFheUliTFE0VDdVR3Z3WURDekN5dllzVkZybGJMazhXem1JZEF1TVk5?=
 =?utf-8?B?dHN5Ujl4SVBBbE43STJLWGpVaFA2ZEM3d05WaDR6S0J1cTZjUEF2bG40anhE?=
 =?utf-8?B?dVRoSTYyRHhPRVU1Z0JneWpBb282b0ZadFAzUG1iYmloUFMwU3dkSmgrNjlW?=
 =?utf-8?B?Q2xsQThZdWdMekxpa2lPZHNmRU1pRUpKbUVBWTdjazNjVnpEdFcrVnNPUkZV?=
 =?utf-8?B?QjdkSmVYdHp3VWlpci9SVHZaWlV2MzlEM3RzeXhDdWd0MzkyWnp0RTVZS292?=
 =?utf-8?B?RWZ2Q2lMbTFtZ1QzYlVBM2tDNjVaVHpVVUQwMVh6aVJGS1B3ZnlZUWpuYXlY?=
 =?utf-8?B?SXpJREFXRjJUUmdING1Tc1ZZdnFLQ3hEWHhYdlpoNmtVeXhWdXlXbnNoNWhm?=
 =?utf-8?B?N1NzN3JSU0Nnb1U5bTVRTXR5bTFTTmo2VGIzRXd3OWNNeWo3MTMvQTJWZ2Zr?=
 =?utf-8?B?VXNOeHlUYm9YVnBqbXJRZlRwcmwxQ291Q2l2c3E2TkRCRGgyT1d4dkpVdktx?=
 =?utf-8?B?cGw1Q3J5SVM2TnhDWnF3MGFjTnRJY1UyVlluQ2xieTVIY0FYTlhEZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2829f0d3-1143-4771-cd17-08da5432442f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:33:29.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0GLk1UZA35HUYO+FOM4tPW28/7pB+JTTHN70+L8Qqo39wkxHfEXEtSMttncq5Cw5hQWujy4imzTcl8ylO0fhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8404

On 22.06.2022 11:09, Roger Pau Monné wrote:
> On Wed, Jun 22, 2022 at 10:04:19AM +0200, Jan Beulich wrote:
>> On 16.06.2022 13:31, Roger Pau Monné wrote:
>>> On Tue, Jun 14, 2022 at 11:45:54AM +0200, Jan Beulich wrote:
>>>> On 14.06.2022 11:38, Roger Pau Monné wrote:
>>>>> On Tue, Jun 14, 2022 at 11:13:07AM +0200, Jan Beulich wrote:
>>>>>> On 14.06.2022 10:32, Roger Pau Monné wrote:
>>>>>>> On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
>>>>>>>> On 14.06.2022 08:52, Roger Pau Monné wrote:
>>>>>>>>> On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
>>>>>>>>>> On 13.06.2022 14:32, Roger Pau Monné wrote:
>>>>>>>>>>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
>>>>>>>>>>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
>>>>>>>>>>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
>>>>>>>>>>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
>>>>>>>>>>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
>>>>>>>>>>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
>>>>>>>>>>>>>>>>> Prevent dropping console output from the hardware domain, since it's
>>>>>>>>>>>>>>>>> likely important to have all the output if the boot fails without
>>>>>>>>>>>>>>>>> having to resort to sync_console (which also affects the output from
>>>>>>>>>>>>>>>>> other guests).
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Do so by pairing the console_serial_puts() with
>>>>>>>>>>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
>>>>>>>>>>>>>>>> important than Xen's own one (which isn't "forced")? And with this
>>>>>>>>>>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
>>>>>>>>>>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
>>>>>>>>>>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
>>>>>>>>>>>>>>>> not convinced we'd want to let through everything, but perhaps just
>>>>>>>>>>>>>>>> Dom0's kernel messages?
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
>>>>>>>>>>>>>>> this request is something that come up internally.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
>>>>>>>>>>>>>>> limiting based on log levels I was assuming that non-ratelimited
>>>>>>>>>>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
>>>>>>>>>>>>>>> triggered) output shouldn't be rate limited either.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Which would raise the question of why we have log levels for non-guest
>>>>>>>>>>>>>> messages.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
>>>>>>>>>>>>> levels and rate limiting.  If I set log level to WARNING I would
>>>>>>>>>>>>> expect to not loose _any_ non-guest log messages with level WARNING or
>>>>>>>>>>>>> above.  It's still useful to have log levels for non-guest messages,
>>>>>>>>>>>>> since user might want to filter out DEBUG non-guest messages for
>>>>>>>>>>>>> example.
>>>>>>>>>>>>
>>>>>>>>>>>> It was me who was confused, because of the two log-everything variants
>>>>>>>>>>>> we have (console and serial). You're right that your change is unrelated
>>>>>>>>>>>> to log levels. However, when there are e.g. many warnings or when an
>>>>>>>>>>>> admin has lowered the log level, what you (would) do is effectively
>>>>>>>>>>>> force sync_console mode transiently (for a subset of messages, but
>>>>>>>>>>>> that's secondary, especially because the "forced" output would still
>>>>>>>>>>>> be waiting for earlier output to make it out).
>>>>>>>>>>>
>>>>>>>>>>> Right, it would have to wait for any previous output on the buffer to
>>>>>>>>>>> go out first.  In any case we can guarantee that no more output will
>>>>>>>>>>> be added to the buffer while Xen waits for it to be flushed.
>>>>>>>>>>>
>>>>>>>>>>> So for the hardware domain it might make sense to wait for the TX
>>>>>>>>>>> buffers to be half empty (the current tx_quench logic) by preempting
>>>>>>>>>>> the hypercall.  That however could cause issues if guests manage to
>>>>>>>>>>> keep filling the buffer while the hardware domain is being preempted.
>>>>>>>>>>>
>>>>>>>>>>> Alternatively we could always reserve half of the buffer for the
>>>>>>>>>>> hardware domain, and allow it to be preempted while waiting for space
>>>>>>>>>>> (since it's guaranteed non hardware domains won't be able to steal the
>>>>>>>>>>> allocation from the hardware domain).
>>>>>>>>>>
>>>>>>>>>> Getting complicated it seems. I have to admit that I wonder whether we
>>>>>>>>>> wouldn't be better off leaving the current logic as is.
>>>>>>>>>
>>>>>>>>> Another possible solution (more like a band aid) is to increase the
>>>>>>>>> buffer size from 4 pages to 8 or 16.  That would likely allow to cope
>>>>>>>>> fine with the high throughput of boot messages.
>>>>>>>>
>>>>>>>> You mean the buffer whose size is controlled by serial_tx_buffer?
>>>>>>>
>>>>>>> Yes.
>>>>>>>
>>>>>>>> On
>>>>>>>> large systems one may want to simply make use of the command line
>>>>>>>> option then; I don't think the built-in default needs changing. Or
>>>>>>>> if so, then perhaps not statically at build time, but taking into
>>>>>>>> account system properties (like CPU count).
>>>>>>>
>>>>>>> So how about we use:
>>>>>>>
>>>>>>> min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))
>>>>>>
>>>>>> That would _reduce_ size on small systems, wouldn't it? Originally
>>>>>> you were after increasing the default size. But if you had meant
>>>>>> max(), then I'd fear on very large systems this may grow a little
>>>>>> too large.
>>>>>
>>>>> See previous followup about my mistake of using min() instead of
>>>>> max().
>>>>>
>>>>> On a system with 512 CPUs that would be 512KB, I don't think that's a
>>>>> lot of memory, specially taking into account that a system with 512
>>>>> CPUs should have a matching amount of memory I would expect.
>>>>>
>>>>> It's true however that I very much doubt we would fill a 512K buffer,
>>>>> so limiting to 64K might be a sensible starting point?
>>>>
>>>> Yeah, 64k could be a value to compromise on. What total size of
>>>> output have you observed to trigger the making of this patch? Xen
>>>> alone doesn't even manage to fill 16k on most of my systems ...
>>>
>>> I've tried on one of the affected systems now, it's a 8 CPU Kaby Lake
>>> at 3,5GHz, and manages to fill the buffer while booting Linux.
>>>
>>> My proposed formula won't fix this use case, so what about just
>>> bumping the buffer to 32K by default, which does fix it?
>>
>> As said, suitably explained I could also agree with going to 64k. The
>> question though is in how far 32k, 64k, or ...
>>
>>> Or alternatively use the proposed formula, but adjust the buffer to be
>>> between [32K,64K].
>>
>> ... this formula would cover a wide range of contemporary systems.
>> Without such I can't really see what good a bump would do, as then
>> many people may still find themselves in need of using the command
>> line option to put in place a larger buffer.
> 
> I'm afraid I don't know how to make progress with this.
> 
> The current value is clearly too low for at least one of my systems.
> I don't think it's feasible for me to propose a value or formula that
> I can confirm will be suitable for all systems, hence I would suggest
> increasing the buffer value to 32K as that does fix the problem on
> that specific system (without claiming it's a value that would suit
> all setups).
> 
> I agree that many people could still find themselves in the need of
> using the command line option, but I can assure that new buffer value
> would fix the issue on at least one system, which should be enough as
> a justification.

I'm afraid I view this differently. Dealing with individual systems is
imo not a reason to change a default, when there is a command line
option to adjust the value in question. And when, at the same time,
the higher default might cause waste of resources on at least on other
system. As said before, I'm not going to object to bumping to 32k or
even 64k, provided this has wider benefit and limited downsides. But
with a justification of "this fixes one system" I'm not going to ack
(but also not nak) such a change.

Jan

