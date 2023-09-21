Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E226D7A93B0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 12:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606307.944149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjHGR-0004Vh-Uq; Thu, 21 Sep 2023 10:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606307.944149; Thu, 21 Sep 2023 10:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjHGR-0004Sl-Ry; Thu, 21 Sep 2023 10:50:31 +0000
Received: by outflank-mailman (input) for mailman id 606307;
 Thu, 21 Sep 2023 10:50:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjHGQ-0004Rq-G8
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 10:50:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad6ae48e-586c-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 12:50:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9729.eurprd04.prod.outlook.com (2603:10a6:20b:650::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 21 Sep
 2023 10:50:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 10:50:26 +0000
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
X-Inumbo-ID: ad6ae48e-586c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR8eGh7PCAzCShlpSc1Ve6MlX9wfmv/Ba/0qMzdEnrSgDYE6hSbCMQAfijGje27K79rjp9cQoivn5SYHFb4qVIM8b9jQF+NMNjWhBd+P065CYcothAEQGPQCkegLswqIHFoPBJn4HvoBXI0SaH1D6RGmiMJjZEFi4W98w3vCIIElvUsSgwTEl+u5mJ34fbxSqK6bsbHd4h8uLcVWBEp/K+iZk1PFdwF6YK5M3HgQ4AexpsPqRL/T96UJdY4P2Je46sluCpVimBSSUP7gLnRGstfr85LtbH/0aazoOKzTO/zSxt8slN0r9TdBSnbCamzg0SXNPTKWTKZ4DolH3My+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9//nNcEyIV5V/9QhjJUDXIQZ6/tFiuR7aZn8iLv/CU=;
 b=HF9evIYgPyG30Pu0zdSkdVNhgX5YleMwtW8ijCdtIMjSFnO7pTjECchXoyOPkxNcSgTp/xBs3EkaOXkBk6NgUY7elrRrDB7Zj+/6nzha4s40ibWkPVfYU/2G7/luw7kUTprvbJTY5IdwX7JS3YEOI4+vTv8utPwnGkkj+PLRrG+nsaWcyt3AMpCDsCuJoKu4a4/IVUyn+ci4/cmbxrTjm42mYTu0bqxYhRi1ijMeYpX+q31w4flRdCAZrh3lvibq2PDXtGY2YT8ESFyUPTB4O9dvd0f4Nst/Nl2xajwuN9AexVI5e8UeAcIAJJ3YHsoX8N7gVqzNbYVJEiiGhMZfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9//nNcEyIV5V/9QhjJUDXIQZ6/tFiuR7aZn8iLv/CU=;
 b=YOIR91n9r5pfKz2OCkEpJTUdzUBGZ7O5OhYYYJaJnmeYC22scuLgzaKOFMJLVLpgX1yeZeNpuOjiki2VvF9a+vVD5PH5opz299sG+s9rlecXgevwoMkcUTSa96R/bePbVAWmNmNI6EjoTThEOfx02H6+5+C29V3RVWSj46o19z4H5/PZaarGOCQq1WWtgjsCIY9RpDWF3dhoUVagLUd+e8eoGLHuydvNlMlc66A1Um7+P/PUhJ9hFFlfWhgpmpc/rJDKt5L9BPMIMA4Khhn6Iq56baHi9evmbwKDbs/BdrEJmyW2Ht/KEgSmIFop+xQ61j2UTnp//YWONePAWETnWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b4fe9e3-504a-bec6-c98d-74f797dd2f5a@suse.com>
Date: Thu, 21 Sep 2023 12:50:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xen | Failed pipeline for staging-4.15 | 3a9a2901
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <650ace63a5321_28a55b478157@gitlab-sidekiq-catchall-v2-86b648d56d-wk4kh.mail>
 <fcff9af9-3abd-2d0a-f40c-826f6b1de815@suse.com>
 <433092cd-2a0e-08b8-b846-be33983b6349@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <433092cd-2a0e-08b8-b846-be33983b6349@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9729:EE_
X-MS-Office365-Filtering-Correlation-Id: bf044f87-0826-41f8-ce88-08dbba90902f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wHkGIkBpoaTN1G2N8mja0wAM6GvzNBN6gGDnrO5rlrt+b1qLndBfHGSS+QjVnFLAVfNMx7ILnkdvR3tmUCpuxwmUjT/H6P2lw2/cZ9q0gQraYpcWAIRJB3UU6UE/Vr9nSt6LiHdgsRZE7IFwgPGmQzlB8XRgRgGir8ViKjNrXItRdcfv8LpmPlSox/GMp3p17LBJVG45Q5eNvc9mPzTOfzcay96O60+qpRb00szWA++XI+1rcHNENBy+zgqJEgV8/2f7TerUBc0uqvIAkXCAGJBjtt1Pk21rsEpcQrVHEVkNbX3MZz0QEjjbSI84szzhZDPzoprUJV7UMoO07ZOqL+CeVSlQCkDowpht6Yu8HZKCJ1BYDA/VrVhi9PmUnZ16fsqo+GvJyX/+jxhEUvGqswY6cY6+wCdXriViTJnULO5U/tGOY84arDyiyeziKgUlKI+1CGJ589kYcEFvZaaloxt7foGscLkqA/f3gjUGs09kV+hF5hOkxtlPcSaWMqaolbGiBwArKTy1aD+lTf20qWgW+9pSl/W/JtvZBESPQKAW+eTOIRWF/X1eDyXZWOp1Arbn8hBse81YMC2r+XphN+zYdooYj2Ekj11TqmXdhH1z0l7gCebDK8RfZqkIZ1H82vooVNBmh353ybLnMJLV3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(1800799009)(451199024)(186009)(6486002)(53546011)(6506007)(6512007)(478600001)(8936002)(83380400001)(6666004)(66946007)(31686004)(66476007)(66556008)(8676002)(966005)(316002)(6916009)(5660300002)(2616005)(41300700001)(36756003)(31696002)(86362001)(38100700002)(2906002)(4326008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXk3Tjdrdmlsd2I5RjZSWWFzNVRJaFp5L0dmQXZQamlZS241TVNOWlptRldK?=
 =?utf-8?B?dTVaRFhaTEZsUWJjcGpJNStqNVdQaTNLMkIrWDBjVGFpMSt3RGU2WTVMQ2dM?=
 =?utf-8?B?bmxkdEppVTZ6cnQwVGd0YUtqZlYrTXc5Ull2dkV3aEJoTmJxOStLM2NuaS9I?=
 =?utf-8?B?SHg3czRPQ01kU0pVSVZxdEZoZ2duWVBkNVVuU3FBRWdJRFRDbVV4cjBtYytr?=
 =?utf-8?B?cVJ2N24zNFJLR1dwVzVmeTh1ZWt6WUZtWUlBYk44SE85WiswWWtFbUY4dnRs?=
 =?utf-8?B?SHZXRUJKVDNRVmVHYzhTNW9UQ3VXMkpSMFBoY3VNdUpOMzNRWXhsKzlvajZ5?=
 =?utf-8?B?K1VLKzN0aHFzdDJPRkRNWm9aRlpncEpVSG5wdHFqNk92bGhpYWlZaFNaNnl1?=
 =?utf-8?B?L0QzbkZ0Vnd0M3BxOE03T1huSURVR2g2VTZVMEwvTERsQjZWOFBDdktNWFgx?=
 =?utf-8?B?MGoyVGUwYXhXWlpWcm1HOG16TjhJazNOL2NtSTRhb09SSkY0SkdwaStQMEhk?=
 =?utf-8?B?Q1dhSGI4SWNrbXJVOENyTWVjamJ1VTJhZWVFQnU2Nms5TGxqZUFSbm4xRmcr?=
 =?utf-8?B?cC9MVnBtdVNEM1E2R2lwNUdrd1RCR3NoTHRUZEhIYTE1M3h6ZUpWaUE0ejBM?=
 =?utf-8?B?VzA2WDRZQXFsU05yYjFUclRiWWpNV21CMS9OUTlFcDZvaGtSKzRHZDgxcFFp?=
 =?utf-8?B?SDE0dDVkVWVuSW91bnFxZm5lTVUrTEJtV0lFd2JpT1UxNkxjRXdBcm5oM3li?=
 =?utf-8?B?WFJraWJ2SUR5QldtS0VCTWU3TGlPTmJ2V2J1UjZTQ1dlNXVsdm9MTUhiUCtM?=
 =?utf-8?B?UGxIZkdtY1JmakwwVk14cjY4b2kwcnQ5SzNxYWI4cTNGWUdzeTcwb2p1ekpM?=
 =?utf-8?B?eS9mdU8yMHcwM0Q2VU0wTFlZWWxlRjlNVm5URWx4SXp6TWdlQnpPK2JvL2hm?=
 =?utf-8?B?QUdxY3Z0c3dlMTdTKzNHUlhEcjREbWFVRFZaRm45YXdKVm9zUWVFaTZDM3cr?=
 =?utf-8?B?M0hIZ0hjOFcvcUE1UmVXcjBCVm5Cbm9mVW5EbjVRdlZWYjFuZHNSOEV0UUZV?=
 =?utf-8?B?aUd5SGtBNldjN0twS2xmSXQvODlYNEFJUGJLMU9lbXFsNTYwejlZZU1zYWtW?=
 =?utf-8?B?clNZeVgvMklKUDZ0TnpPWkJmMEVlK2xTZEtWanV4RXlJSTYwMmVWVzhKaERy?=
 =?utf-8?B?aFVCWVpzbkRXdHJ0dVJzSERFQy9rQm8vZDlGaTBOZmJpNDJLamt4QVYzejBZ?=
 =?utf-8?B?dERnU2c2ckxxT2lKWUdzQmdOYmJzcytER1NuMWRtb1V2QVBIS2RyRW4zREtS?=
 =?utf-8?B?bWRtcDJLK1p1RlJVSmNMT01Sdlo2Q2dkTXNGbE9JcjNsNTI0MFpBY0haN2NM?=
 =?utf-8?B?OVRBQW1RV2hmVEdpZ3A0dCs3Y1Jjbzk5VldqSGFYVzByRUdUbEpyWjNqY0Fq?=
 =?utf-8?B?WkpkS0txNTZ1N1ptNERweWFnVEcrNXppZFcxUDVRR1ZQbzNYQmY1cXBsNFN3?=
 =?utf-8?B?WU05RTNQdVZabGFjaGhMZGpRQzJ3ZlhwTHU4ZVpyMGtTQnRiWmIwdWwxeWFS?=
 =?utf-8?B?VlVhTnZId3Z3TzFSRDlsU0NlLzdKeWJsUFJCWlF6RnZpci9Ga2ZxaXBwY3E2?=
 =?utf-8?B?L2REZXN4RE9PNi9PcEtXNVZ3dWplTzV5REpxVW9IZElzWjRhMUdXYS9TRWw4?=
 =?utf-8?B?aXhNbm9lQUQ5WlYyalZ2VnZadWRHVCs0cUNHKzNJKzZPT0JpODR3QWpxTmZl?=
 =?utf-8?B?OGp2eW4rY3JDK3RIMWd1dDRWWDdmNnZ0NGdLV2NOcVptTkdtYS9UL2JWSnJm?=
 =?utf-8?B?ZWhFb1VueTV4TFIvKzc2L3JxcGFnNEdPbnlPZXFHQ0pheWNwUFI0bEd5QUlC?=
 =?utf-8?B?Wm9BMmJDSHFJMnpUZm9LcmZaM09Kbno4TjZTb1JnRk9rSHNyRVAvcksrRStR?=
 =?utf-8?B?SC80cXJjdVh2d1FGbkc5bjFqMXFHODE0ckJhYUFhVXZlN2lSWk55c1lOVWhi?=
 =?utf-8?B?eDBXUGYzU2FFMnJlQ1Y0K1lGdzhNRW1iMENESzh1ODgxcVMvdTZralJVTHEr?=
 =?utf-8?B?L0JkUE5SOExuY1lMeHIwMTU4cU1KQkFxMEZZOVRTbDFwbUx5eG5iVjRPREFu?=
 =?utf-8?Q?WtubZUszBOWglUptX/myuiDuv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf044f87-0826-41f8-ce88-08dbba90902f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 10:50:26.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luAPxqfFHQwh0+DHefo0boxWMGS2NC+aS7UlS3d1KaM2laMIMAprKNSBDyXhAKM7juLzotXnGhnXQS9T9d55hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9729

On 21.09.2023 10:30, Andrew Cooper wrote:
> On 21/09/2023 8:08 am, Jan Beulich wrote:
>> On 20.09.2023 12:50, GitLab wrote:
>>> Job #5127621916 ( https://gitlab.com/xen-project/xen/-/jobs/5127621916/raw )
>>>
>>> Stage: build
>>> Name: debian-stretch-gcc
>> This one failed with
>>
>> In file included from /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/timer.h:4:0,
>>                  from /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/timed-average.h:29,
>>                  from /builds/xen-project/xen/tools/qemu-xen-dir/include/block/accounting.h:28,
>>                  from /builds/xen-project/xen/tools/qemu-xen-dir/include/block/block_int.h:27,
>>                  from /builds/xen-project/xen/tools/qemu-xen-dir/block/file-posix.c:30:
>> /usr/include/linux/swab.h: In function '__swab':
>> /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/bitops.h:20:34: error: "sizeof" is not defined [-Werror=undef]
>>  #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
>>                                   ^
>> /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/bitops.h:20:41: error: missing binary operator before token "("
>>  #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
>>                                          ^
>> cc1: all warnings being treated as errors
>>
>> What? How can "sizeof" no be "defined"?
> 
> Because the expression is
> 
> #if (sizeof (unsigned long) * BITS_PER_BYTE) = 64
> 
> combined with -Werror=undef saying that it can't figure out out what
> sizeof is supposed to be here as a preprocessor token.

I still don't get it, I'm afraid. Qemu only #define-s BITS_PER_LONG this
way, while __BITS_PER_LONG is a plain constant. Yet it's the latter that
Linux'es swab.h uses in the #if (from its introduction in 5.6). Hence ...

> This needs a bump to qemu in order to fix, like we did on the newer
> branches.

... I can't see yet how doing so would help.

Jan

