Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804A6F6720
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 10:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529624.824196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU9b-0002fw-SS; Thu, 04 May 2023 08:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529624.824196; Thu, 04 May 2023 08:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU9b-0002dm-PI; Thu, 04 May 2023 08:17:31 +0000
Received: by outflank-mailman (input) for mailman id 529624;
 Thu, 04 May 2023 08:17:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puU9b-0002dg-2b
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 08:17:31 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c86e7d7-ea54-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 10:17:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 08:17:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 08:17:28 +0000
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
X-Inumbo-ID: 1c86e7d7-ea54-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHJlK11xkY+CMu53cM6p1sE+Ctcpz6xPff6T+93JQ5Wk8oODPHMP4ERBwv4c8V/CkJQ+jTHdG1MjupQxZGJwAUs8UsnyD35yiL05G/B5+t4xe5UcSjdtXV+qfBp86fIBBnU9KpHmijoBYfhhMDprB3Wo7yibSF9mC1IMdo/uoDqAjwMk9eVHHfHv97zcuwdHv4f7loWj17v8+b7XHd3j7H5H4ItdjdTCD+3ew66YuBs7EJy4iK3QLX3BzGU3JhBF0UFk8JsXEu8FvafwJbcoEfP2yqE6lfJ6jBSEQKBF+Pyj8y2JxLHhKV/tURRrt8PXMVKWgTIFd1Ys8o3tqDek0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTHJ1g0+LZrRj1zftOmP6q5palV4trRf8dC586XjlVU=;
 b=XRK/bhlXMFHwcq+dK3CXc7qku5fcTr/I5wuFbgQL7v/oYEV8pJTheK4Vpqzi+AtTLQWeRj9r8cHl34TObBu7t8kYqQ846ubG7Z+HKG2rQO/TEYkBD8rMw7+CAHtKhi9x1CEWso5C8rFA/7mJ5j8SFdEntXC0l/y3W/evSU/1Rmr/r+uQmDmDFkgOO1/elFD3sea1ReRg5/8MeUU0Dnz5Fr/VIH673LB+aXJEpKkAc/x4ecKCqNuPGGFYM0HxkcqnnUT1V9EmWxUY0DQjj6humJm9MfGnhyhZM5FlaedmUqM0VcrmqQSkyPIvrEGbMfNLlliLm7mNhCnfZ8rVisb/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTHJ1g0+LZrRj1zftOmP6q5palV4trRf8dC586XjlVU=;
 b=ZBAtokuwBU9I9IVnlLRX29kXwDgGEYy0VZYAEYHQFf5FKfYaLLJ67OWHd+T15l62qkKEFkGfWXUTp1Y0bWZmkwye81ybH49ab5/Y2DwLIbcg5afnJlzJ9+g6AOcwKxnIXu9NXImorqOwX3TU+a2yNJ+5BLNJxP4b/UGDSQ11K5wkWbMp0BV0/a6vmXEw2ei4UVQ0lbFJwYwjh6opahJ6mPT6Jmu5QFAGj9zBia6JXI4vOG9F29tNMeAaivysPTuzb2ZwoSXRaoAdWP+K8/h3Lj5EK8h8SQ9q6mYyqJhuhE8mWEIAp97i2P01qSfa9LyUdGq7qCkKdHPic6RMffiNEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b125ebf-53ed-27a9-2f04-be2a6cac7fd0@suse.com>
Date: Thu, 4 May 2023 10:17:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/ucode: Refresh raw CPU policy after microcode load
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
 <ccf68f0f-6fd7-a9a4-ef72-03999d11035a@suse.com>
 <b655305f-293e-a0dc-ab39-36b0c9787433@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b655305f-293e-a0dc-ab39-36b0c9787433@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: ac014da5-5556-4680-f6d8-08db4c77fff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZcVFnvW+w+5xiR/gD+yUIgh24uLPv97Ed3ROtx0Xgur1xcWxdqz6BiBN+6PukiGJyCXsTHPpo9K7rbiw+8HAjHS09d8Gs51AnC4s0FrZEHC9jHLVXMFhXztk3wXAx7E22N69wD5C6VGXvMKyqYJCXtHtLFnsHK1t2IoI+HqSTgMH/vF8YCQewkfwchk+mz7aLKAZS4IU2i1OCg+lnLbjZzqIbGB5hdkWKPsxbVuPHWW0s5ZYQaO5Q77Hw0wmU0tn62bKDoDvBPXvnNnCnIInQKbmm/ZY+eUStiocXdPm3asmYZNCyorJzU7+BNJdNSulFo6Sc2f5VtLUC/Z6ZUXs52BCs+ii6V3PGRQxFp9sXxnT0UUiny/EbK0NdrgUutH/+0S2ijLcm9W0mdFOjXwe2IHmfN/Lj6fe3SEHjG6XnBcWGUbg5Uac7U/03RBD1PNbp61tkFBo1FtuqWouvYMvdM2QV15L4JvugQ/XVdiCDZYJP0qev7QSeK5E61+qOJKOMTdWurZqAM2xE9NMaFrgV+EvbmqD93J+rmCd7ii2MtVSqtx7ANjNkQWkBQQkBx51pIj46doEFtwxEp0ICe5BKvr+25gVWt2K7xJ9XzInEGoWcfS/Y2Sq3UclSsVICitzNYYrLd8lE/L3gnAIBEC5rw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(41300700001)(2906002)(186003)(53546011)(6512007)(6506007)(26005)(6916009)(31696002)(54906003)(2616005)(86362001)(6486002)(4326008)(83380400001)(66556008)(66476007)(31686004)(66946007)(36756003)(66899021)(8936002)(8676002)(5660300002)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U21lTlNRdzh2ckRUNmlDMEo1UU5DTStuRUFWN1R0YmlmU2gxVjM1TDlsUUMy?=
 =?utf-8?B?QkpzZ04xVTVoSXcza3FDU1NtLzNmcWQ5enZENkREamNqc0U3dkphTnBROEV1?=
 =?utf-8?B?NnZaajQ1a1lWelUxT2QvVzZsa0tjc1lHcEs5TXQ3WmZnN1FWdFpRQTBIdXMz?=
 =?utf-8?B?bHlkVHBSR3pXSU5aMXA4Uld2aTNOSkU0TXJVZ29oalprWXlsMTFDWll5Y2c4?=
 =?utf-8?B?cnVvWU1oR1VvMlhHZ1Nic0FnOWgzTlBFbmVLK2F6dFZmSjM4c0NLU2hrYVlN?=
 =?utf-8?B?T3p4cW1CYXNHMzcwTnZtUUM5TUJyNDlmSERvMmlnVERiSXR0QkROV1loM1d1?=
 =?utf-8?B?VktqajVDMmFvRDd2SVFHeXVONXdLZ010MDhDWWFzMXFxa2VkdDhKaElRbWN0?=
 =?utf-8?B?aTZKd2VGWVhLbzhwODlvQlAxOTlZLzUxSzROaWFQZEdqNGZiOHVQWmlDd0k3?=
 =?utf-8?B?SktNczVKSUNUTGlkdDBGd2FJUzRoZjE4Z25qQ0VRZmxlZFZ1cnZiaWZKeVgz?=
 =?utf-8?B?K1NMZGpySUJPeWI1L1QxUE5QR2QrTC9Cdm5KL2NueDJMZy9ENXlvdVdVeGV1?=
 =?utf-8?B?NEthT0xSbEJ2UGFlbFpDSFlJYWE2TFc0bGdHNC91NmowN0RuRjRONjg3YVNY?=
 =?utf-8?B?OCtiTGVoZ2NTUHVNTncrWjNFWS9SZ1EvajZBWGY4ZzRkYXp0SXBNWHY5eU15?=
 =?utf-8?B?SU5QSlYzQ0JZaXdBemdlWm5YZC9KbGNSK0UwQUhkai9kV2hCdnlHcythY3pN?=
 =?utf-8?B?UU5rMGxZMWREUGM4TllIRDJ3ZGxxSEkzdm9FUnUyL1RTZU8yTjY2eUJSQ0JP?=
 =?utf-8?B?L3UwN21GUlVmNjBnT1gzMGtDTHVlR0VnK2tMNEdObzFISGVmWmw0UlZIWUs3?=
 =?utf-8?B?U2c2aS90VHUzRCtLZmN1RFU2VlVGdG0rMCswUWtTdlhFekNJamNHaWZBT1pp?=
 =?utf-8?B?Ui9nMW5ualhqd2cvTkN3MFBaOTk1OHFvSkJyVUhZWjlCblNzTm9XQjlQTytV?=
 =?utf-8?B?WnlDNG42WXhaZnhsV2VaaVpxcWYxRGloUGtLYUIxbkN0K0NvTitHY2pLeHVJ?=
 =?utf-8?B?NFNhSWpNRlA5SFVQL2QxV0d2OVpGOVRrV3RsL0ppV3hJVnJSRWorVkVPQzFO?=
 =?utf-8?B?Wm9IVFU1NU4xbDMxSnNqZWV6S2FsOXlxZkRlcEpwZDFGOU1UNHh5Wjh4MElL?=
 =?utf-8?B?Q01EZy82MHRUZjg5Sk9namhyaU50bVU4d0FqQVFhYzAxRmFQdU9ZYnloUjNq?=
 =?utf-8?B?ZklHZkMrenQwWkNHVThRR0c1b01WRXpmQmtDTkFSTFpxdWNYbTJUa1I0RHRR?=
 =?utf-8?B?N0lCeWVjMmg4VVUxZUs1aTVEcklIeWxJR3lkMzNtRnhCaWt0Q0NoQlpXUWZ3?=
 =?utf-8?B?RnEzQmNCN21OSlBNZmZES05iZ1RLbXl5dUlxZDl0alRvYXpIaThxNmloRUZH?=
 =?utf-8?B?QTc1VnMxRURNODkzeG4vUkxoNkgvNTU1ajU5cmdWOU5rUysxVWc4UVYxRjIw?=
 =?utf-8?B?SWY1OHdGWFN1VThmbDVzZWF4N1ZLZTFKdStRRHI0VHRtbVhxM0EwaW5jNzdC?=
 =?utf-8?B?eXljUjVaRlF1ckp3ZTIrY0F6VUpYSjVySEs1M3U4TTRBSnBFcVA2SzFIV1M3?=
 =?utf-8?B?ZTRrNWo3RkYyYmFGeVVzSEQ5M0V1cmVqV2w4aXJ0RXh6b01BQmZyZFpKeXFp?=
 =?utf-8?B?TnF3QmMvbXJ4WE8xVGQ5L2pkaURkKzA3M1JDbWFXVlFhb3RpYnBEaEZKQTZT?=
 =?utf-8?B?bkgwZmNaNWM2Q3lXaURhWjZtbFJoVHJhY1hiTUJpVDJzWXY3aHpXSlRzeGFR?=
 =?utf-8?B?N0w3NGViSWY5YU9RcE5vVElvOTRNNktYcXNpMDRtR0d5dENFeWtLVWUwcWQw?=
 =?utf-8?B?VnBPWU4vNnI2amM2bk95cDdmWjgrV0lyV3Vpa2Nka0ZyTittemFETzRhbXNB?=
 =?utf-8?B?U3JiV0pQMXd5VnUveTdnNmd3THJ2MmZtMGJRT0FpSnpVUjJqTitZWFJvYU5Q?=
 =?utf-8?B?d3BibVl4WDhobUo5eEZSbkp1ekxUVEM3UTlGWlkwL2h4YXc0LzE3aFJmUkVw?=
 =?utf-8?B?QXIwK3BZSHBoelM2WDVhdzBYVjE0aGxKdkE1NjNoaC96VUEyblZZaTl4WGNl?=
 =?utf-8?Q?CvgDjeOxzQ/oPbSmRiJQnPoeB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac014da5-5556-4680-f6d8-08db4c77fff1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:17:28.3085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5zE08o0Bl/etrbbyx7xuH8Vw1jA20tKQaG7T+EYTeoPoU1f6i+d5cmxmcPJyLowgWhDlifhn+GJ+B0xrxslYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078

On 04.05.2023 10:08, Andrew Cooper wrote:
> On 04/05/2023 8:08 am, Jan Beulich wrote:
>> On 03.05.2023 20:58, Andrew Cooper wrote:
>>> Loading microcode can cause new features to appear.
>> Or disappear (LWP)? While I don't think we want to panic() in this
>> case (we do on the S3 resume path when recheck_cpu_features() fails
>> on the BSP), it would seem to me that we want to go a step further
>> than you do and at least warn when a feature went amiss. Or is that
>> too much of a scope-creeping request right here?
> 
> You're correct that I ought to discuss the disappear case.  But like
> livepatching, it's firmly in the realm of "the end user takes
> responsibility for trying this in their test system before running it in
> production".

Okay, with the case at least suitably mentioned
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> For LWP specifically, we ought to explicitly permit its disappearance in
> recheck_cpu_features(), because this specific example is known to exist,
> and known safe as Xen never used or virtualised LWP functionality. 

Right, but iirc we did expose it to guests earlier on. And I've used it as
a known example only anyway. Who knows what vendors decide to make disappear
the next time round ...

> Crashing on S3

I may guess you meant to continue "... is bad anyway"?

>>> @@ -677,6 +678,9 @@ static long cf_check microcode_update_helper(void *data)
>>>          spin_lock(&microcode_mutex);
>>>          microcode_update_cache(patch);
>>>          spin_unlock(&microcode_mutex);
>>> +
>>> +        /* Refresh the raw CPU policy, in case the features have changed. */
>>> +        calculate_raw_cpu_policy();
>> I understand this is in line with what we do during boot, but there
>> and here I wonder whether this wouldn't better deal with possible
>> asymmetries (e.g. in case ucode loading failed on one of the CPUs),
>> along the lines of what we do near the end of identify_cpu() for
>> APs. (Unlike the question higher up, this is definitely only a
>> remark here, not something I'd consider dealing with right in this
>> change.)
> 
> Asymmetry is an increasingly theoretical problem.  Yeah, it exists in
> principle, but Xen has no way of letting you explicitly get into that
> situation.
> 
> This too falls firmly into the "end user takes responsibility for
> testing it properly first" category.
> 
> We have explicit symmetric assumptions/requirements elsewhere (e.g. for
> a single system, there's 1 correct ucode blob).
> 
> We can acknowledge that asymmetry exists, but there is basically nothing
> Xen can do about it other than highlight that something is very wrong on
> the system.  Odds are that a system which gets into such a state won't
> survive much longer.

Indeed. Hence the desire to at least log the fact, such that investigation
of the sudden death won't take long.

Jan

