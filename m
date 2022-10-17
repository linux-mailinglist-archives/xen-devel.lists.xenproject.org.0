Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061AC6008E4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 10:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424167.671395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLg5-00050N-OZ; Mon, 17 Oct 2022 08:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424167.671395; Mon, 17 Oct 2022 08:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLg5-0004xT-LH; Mon, 17 Oct 2022 08:40:53 +0000
Received: by outflank-mailman (input) for mailman id 424167;
 Mon, 17 Oct 2022 08:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okLg4-0004xN-Rf
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 08:40:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67ba5960-4df7-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 10:40:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 08:40:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 08:40:50 +0000
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
X-Inumbo-ID: 67ba5960-4df7-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZ5wn7LXQSgMLJgAVzsJUY9M+t3NCoizJd6KKRDwqsDOJQ57lcmnH/ZTuL6/NHPg0m36BtNISZFii26DxVnSsMHUnLmNEbZ1Lv1Ah1+iI/0+7gVgHCwtzkZ7+qXur7zWOYPmZnd4kNkPDleeFV7/OPMTOaSoma9nej2jd0VBq3w9C5NDaLvLEJ9AbClWi2AtQEr0RTADNMk5ruRAm8016Eb99xrrJIJU245K9q6Wy0jJx5ZEsIYmas5BlqM/uZ/dxDSFBnQQITNqiqToICdpdTdY6VbcuYkwHblaDXerf8TW6EikZUf4FOuC2jiil+p1OKqth7QnMgMKw0/GRNT3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lilq9s/yizeDzbYvu/Q0GRC29vCyzeA8REdcQymakko=;
 b=MiB/eoixS4YDEKXiOwixcZIKG+/Aji5Pjkn9LbCZCKRDCyIEEPlAklHEgukZoYQJ6edEHEa7m6xc7cvfhludCL8DC9vBoV5+VohLr+zAhdNTPR+wR9kZ/e558fyVRexcwBH2iW8Wh2DaqfdXeP3hfi3zvifNyqq9nDEdzk2eysx4Dds/cA4dYQn8iIqyZjqm/nla+hCDsjSQM+ob9kl9gAESCyTuY1pI38xu0wLsIdR/0xACdohWRT59ae0kvhp6yPNPsqLkO9Hxj7MukNDle/B95cbbfdCpxE5A5btRWyVysvuQ9+dvhzVJYWcfyEiVaE3B/N4ht5gUlOJ8nWC6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lilq9s/yizeDzbYvu/Q0GRC29vCyzeA8REdcQymakko=;
 b=o6FrvTJJqKZjsetIYE+74ImIfTxoQ1eKiaNi+Nqo1fOtTagncHv8jriezcCdT8wW8YAgTc9k/s2ItQRyaZSGnZ4dMSH19wLUvokQ9O8uJsBRCJfW52ge5RbSVBWqnn+l4e2Lo50RWZgARKQ+TAY/02h1yQSv8ZH9akcVqUVqV6Wgggk6G00FuDU4PQj/IB3FYED4vCStfsagVUBmlpUSGgtEAc346nf8g1hvC7+HZoCbpPsSAKm6+sPefEiO9PFTtVNkkQWhf4LMAXBcHkqfZMlFE8cmBzHQDbwrpo/H5NvlTaYCSi71fsCCxNj7kupAyiNv8r0qJyxFPcxdV3+W0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c82cde3-fe46-3a3c-20c1-70bd99eb28f2@suse.com>
Date: Mon, 17 Oct 2022 10:40:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
 <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB7991976335ACE7B47A3FCB9792279@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991976335ACE7B47A3FCB9792279@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 153fad55-18f1-497c-fe63-08dab01b4b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PzZpGwT44BxZKhmkSFeWYTZ7w9cNC8RJdC4PhsSS1IoNMZ7FZpUQBRKnjG9g5el7KMToQh47X5UQqB5gzqe4d8eJRu4ZXwBT3jM8hg/HT9tBZZqtI9LU/4Hxr8N4+gg7W0J7fLl/uz3bNg3tIaXUoR0KcmPJ8FGv6DtTfVI0qITZaeDcL0jUHL84PXXHQkFg9VliEF5/BiCOviXM8bxfxAf23zKF/iTZ2WKL6l6TMj/5aieY3lIU750o2MDCSqOizha0pdG0thkWMYfYlbychpSSDjcDjoZA32AsuHvDxZrxcCKAoSvc26Dyt4+8P2wP+JbreuVc6FFBqkLu8CynyE40qe+OpgKJF2Hawq8rlJD9cDyrXSWpjHKFmH9bxu47uehEA35bqhQYyTHw/juxewxsC48iD1Wj22iuGgcZdqR5TGwIhfcrRLoJNxoW7bT3kvpBNnll2zkFq2vWJluObmUJYw6B++Y4AZ2Od1YOzoBGI/rFJQ6UW7an6pLrhLWaxirpSdgOOSJuL+0NnsdZpYsuvrFSQmx+D31pdJ9I37xWWCAG5P3wydmKotF3NXP3VuNRSzE2sykgvpydHkru3mSU+tnLShiC2YN2ng9K5rDHlqtDZ8fqHxbU6kIrfsozWc2n4QxG39EwCkddvp5dcA6/m7UoU9v/m3p9b8KwRIuN/IF79trdUg/wpDPa99RZpq727WPvIb+ntMIue7Q6kwyhbumU01TudrYZ7eYqYNroYcnc5jpFWbEpc4S0Jr1fSwyv1HG2eXF/kr9OAxsnvOGrbcyeC9cFTbiij/hbi88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39850400004)(451199015)(53546011)(83380400001)(41300700001)(36756003)(8936002)(6506007)(5660300002)(2616005)(38100700002)(186003)(6512007)(2906002)(26005)(31696002)(31686004)(6486002)(478600001)(66556008)(66476007)(54906003)(6916009)(316002)(66946007)(4326008)(8676002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0YrVy9OcG15Y3BOUTRZcG1aUnRvK2RaanlvNmRFMzYxOXo3V1RNU2syWkVT?=
 =?utf-8?B?b2FGU3kyOHkxVzV3RnhGRnByWkMydVpXeTRBcjhJcythNWZIa0p3VTg2WTFp?=
 =?utf-8?B?d0l0R1VsS25YS3hpTHZFV2JWOVMxcnVhSXhmSlo2Z1M5a3BTOXIzWCtiT2dU?=
 =?utf-8?B?QXVWWG1mWjB2WlFVSDJkU3pWTFBUT01leVBRdXc5ODBjMG1SK0JXUjRBWlR2?=
 =?utf-8?B?ZjIxWHVjNGFOK1JLN1lVcjJlS0czTGxXVDFtWFhEYXFSMWJ5OVUxZHZFL1Vs?=
 =?utf-8?B?WXlFT3dWdWt6a21yNWtnMWloYWJ6Q3JRNXo4eG5WcHozRWU1S29SbTdkYjQz?=
 =?utf-8?B?a2dKc0dqZ2pxYkJNMG1UL29CWWtSc084c28xbG1MalVjSjR4TklHdVNOU21X?=
 =?utf-8?B?TmNoU3VTRS9wK1o2VVdPd2ErUGJtVzFPdDcvTVhOejdkd3Yxc2duTllKNUt1?=
 =?utf-8?B?dVllTDVpWUN6cFFtaDh1VVZPdEJPQUxvV09nU1dXdFBRSmlFVzF1aDQ5bnBk?=
 =?utf-8?B?NDNUUDFzWTJXT1dMYUZBVE9LMDlUVVo2OUUrM0wxdkNrbGswNVZhSXBBQzUr?=
 =?utf-8?B?WFc2UlhQWFVGTUd3ajQxYXJNelZ2V2JnVGNYVEJZeWRBbUR2TjR3Z1Nxb1Bl?=
 =?utf-8?B?Rll5N3F5cGhpOCtOdXdoQzF2NFY0YXp4UVM3bUFEQWpoU25oWTAvcmJzL0tT?=
 =?utf-8?B?MWxDUjZObm93Qml0VndhRnlWZ1VLTVFYL2xKd2ZGc3FCMndObmZTSzhCZzBq?=
 =?utf-8?B?MlBpVjlQSU1IbHB6dlJERDlIcEJ6VDJrejB5SnNVR29ORDhuN0hzRFR6NHF3?=
 =?utf-8?B?MTdOc05icjBLOS9lWER4clB0MDd6T1htdDFyckRDbEVXbktzanRMZm1mbFM4?=
 =?utf-8?B?MXdETnJTVlR3by9Wb3l2MmxHaGwwVWdZcGozQ2tGVnErTWlCTHBTSGtiQzRu?=
 =?utf-8?B?TEhhQlRNZG5lS1p6aFZFSmRPVUpsRGxxMlRScDVBT2ROaVJDY2VXbVF5YmFn?=
 =?utf-8?B?eDBCUkJrb2dMYUprMzJrU04wWktZNGNDamorTm5yWkljVG1HN1ZGVmtEQlFn?=
 =?utf-8?B?RzdhT0QwWmRBMmRrSUFyUTBzWDBvMVVlVFRUMWdHK0tTc0pxS2dtUlprZ1BX?=
 =?utf-8?B?bGFHeUlxZ0pwaTBGYitkRklyajRoRXU1UkFmS3hZTFdidldVK2NLZHZpQzBG?=
 =?utf-8?B?T3hTNWdOeHlOa0JTdTBNUWlPMmVEa1ViUW81anEwUXZ6OWZNcG0wTVdhTFAx?=
 =?utf-8?B?eWtZUzdiM2lmTnR6eThpdWJ3SldUOUJ6bUVMZGlhRHVIMEFMZGlxMjNmY0Nk?=
 =?utf-8?B?K0ZyNDF2TGtnMFpOK09ocm9ZTlpGM0FVOThNb3lwWE5aUjFpQ2hqZGNhSjEy?=
 =?utf-8?B?NXpuMFNlTEFjQTlxek5idEF0b0RaZkFHeThUajNXcWJvaHY2Y2xxK1UyRzFq?=
 =?utf-8?B?azlVVUNmdFR6aU9IUnNOZWtRVTlXME83M09VVEIwUURHUGd2anFLQ0ZFY2w0?=
 =?utf-8?B?NSs0cFhvY3JGYlZtZFN4WFFrU3Z1dko3N3ZwQit6MzZRd0NCaUQ0ek9ydkJV?=
 =?utf-8?B?VXAzc0dBazVoejlrZkhrajdTN1ArMEdVRHBkeFh0dkhwdnp3SjNkVjFmTzBI?=
 =?utf-8?B?bmdWdUhhZU1wdjZaOVBQWGwwQVpsaHUzR2JPTkpzZlRyUmxZWGdkaWdEWjdG?=
 =?utf-8?B?NEloMkxMck5odS9TL1hmeWt0dXhnSERiRXFGZjUzVWVwdkc2OTVaR2MySWpa?=
 =?utf-8?B?cTQ0OWR2VTFYZlNCWThZTmg0QkFtM3V4SkdwdXEzRzNIQVNIRjM3Slhvd0ZO?=
 =?utf-8?B?Rm81WmIzMTZkWXdIT0xXN0JjbG10Z29taHFkVmRJRm5IVDR3RmZmZUF5MVBG?=
 =?utf-8?B?a3hpYjQ1Uzc2aGp5UytOb0JhRWRmVWpZMEEvOFg0NWN1TzZTTEFnWGdoMkh3?=
 =?utf-8?B?REp5OEh5OEZaV1N2b0dWUW50cjM4T2VmRy9CTnlGRElYU3E2T1duTVZjZXFC?=
 =?utf-8?B?SHJaWEZ3Z0VVYnJEWktnR2dxV0dCQ3BvTW43MFJabVo0NmcxMHRUQ0pQN1FF?=
 =?utf-8?B?WHh3NzR3UkJqSytpUkEweVdCdUZLc2NGS2pXTDZHTW9aQXNQRTM3TUdNWHdT?=
 =?utf-8?Q?e9KuRPQPFCvG+zTW8NG+ppFss?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153fad55-18f1-497c-fe63-08dab01b4b43
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 08:40:50.1105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmPgrudy7HskKQTuJtIo4tG/b5gMAAcFT4t2w6/xTBeU7Qbq4H6a78igPsggyGXkzbAAa4Q7ZLcFRWkWoK7KBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830

On 15.10.2022 15:14, Henry Wang wrote:
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> On 14/10/2022 12:19, Henry Wang wrote:
>>
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>>> +        p2m_teardown(d, false);
>>>>
>>>> Today, it should be fine to ignore p2m_teardown(). But I would prefer if
>>>> we add an ASSERT()/BUG_ON() (or else) to make confirm this is the case.
>>>
>>> Sorry I do not really understand why we can ignore the p2m_teardown()
>>> probably because of my English.
>>
>> No, I forgot a word in my sentence. I was meant to say that the return
>> of p2m_teardown() can be ignored in our situation because it only return
>> 0 or -ERESTART. The latter cannnot happen when the preemption is not
>> enabled.
>>
>> But I would like to add some code (either ASSERT() or BUG_ON()) to
>> confirm that p2m_teardown() will always return 0.
> 
> I added the doc asked in your previous email. Also, I will use a
> 
> ASSERT(p2m_teardown(d, false) == 0);
> 
> in p2m_final_teardown() here.

Hopefully this was meant only as an abstract plan, not the exact code
you mean to add? ASSERT() expressions generally should not have side
effects (which includes function calls).

Jan

