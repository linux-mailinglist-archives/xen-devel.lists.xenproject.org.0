Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B05A3A3C7E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 08:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140219.259128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrb8D-00089Q-IT; Fri, 11 Jun 2021 06:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140219.259128; Fri, 11 Jun 2021 06:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrb8D-00086Q-F4; Fri, 11 Jun 2021 06:59:05 +0000
Received: by outflank-mailman (input) for mailman id 140219;
 Fri, 11 Jun 2021 06:59:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrb8C-00086K-Ev
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 06:59:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9b85b50-f34e-41d9-a70d-d4c244cd1230;
 Fri, 11 Jun 2021 06:59:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-PYCYwZttPNmUQhuQTGb-Og-1; Fri, 11 Jun 2021 08:59:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 06:58:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 06:58:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0028.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 06:58:58 +0000
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
X-Inumbo-ID: e9b85b50-f34e-41d9-a70d-d4c244cd1230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623394742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=syW9HbkIiOa9IrkfW/lkq+c4qWuGbNaK1+k53L9ByiQ=;
	b=WjvfdVwtVFGvdOHD/YeD3cxh8cY9MORR1bnWeMuA3yQbA/8vWkIOs8bUDAWzo5dqZ5U+40
	EK+0+5XhCY0Lg90y63dP/aAGAtRNU+tAFMqlAskUpnnQQbDtJJ/P/IvTywyJk3KAJZpymT
	vMh+l8TYaP2JmTCFQHkqOpjdm7ZafyE=
X-MC-Unique: PYCYwZttPNmUQhuQTGb-Og-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iylFZqzjN4wXnybxoVW8fH2tZtiCzLI3F+fv28I3pGbiCeMAJq66zoNBROlo4SwPDs3hkuOpOfxwXEH+FEgr5QpC/F4KxUQ80KVe+ZRTJMYT0f6YfZDX3o+QwKjzzpGNDDznKTPdE3vFQzsyV/7BHWn/Vx6VfpKkb8L7Juk6Wu4wfBrePYI92Nx596oiE20RoguM3PGYF7eB94R7Yqv7dYoBmZNYOijWDk5fyD6VOEJgmDm82Ci8/a/ReHsb3MQ8cGLDndQJ2RejURSTRv2kWVwpeTH32XP78pAYGRgIQ/n28bgVpy0MqNTBiFIgDK2QpDgIbXg0GHKFdEUvMp6miQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syW9HbkIiOa9IrkfW/lkq+c4qWuGbNaK1+k53L9ByiQ=;
 b=kY9XUWvAGWdtEKsFZXzbPCDGwLsYjqGrfvWXMW6Xu605qNUnBbeQbusgBVsjfnaNtN6D3i6z2DgBlNNnKURI5NcZxvhbaaYlugA+32q7uAhxdcolvAWngG6x4Fc+YAhqCWEU+SACYWH+pNFlD5IYd9l5ud3ZhB5tQGhPhNVMp4GTrwEivHZ8J8OCLhjkKoAp/VvcbqGpRsMHQpULacEe9uE9qYEzoYeyQT4vI4L7QXIS+RpTNJsJED42uCjwCKQKgr/uWAWU/s1u6yG1D146F7HYLDF9r2y3OX4vesRFBXARSBHmHcI7VG8X8tYRuP+4j7jNT8XIdKWDnAQ99aj7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable-smoke test] 162597: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <osstest-162597-mainreport@xen.org>
 <6d95cfac-e43c-d1f0-f988-4f11335b104d@suse.com>
 <E28F5F88-7D8A-46C1-89B8-9841071778D1@arm.com>
 <alpine.DEB.2.21.2106101644340.24906@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7bf86cd-520c-f2f1-7928-448cf5ba8ed0@suse.com>
Date: Fri, 11 Jun 2021 08:58:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <alpine.DEB.2.21.2106101644340.24906@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM9P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 957fbe47-4b35-4324-06a4-08d92ca66341
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43824F79C0EC14414ED5FEB6B3349@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jI22ID+q0XXyQlvoVu+t66qF5u4rJDSkkvX2eXZaxFjXzplaeFKHnfP7c66122ftDOHuXX9z75ADh2ksMmMIUc4YfWDizAIiJ4NiEsPVXx7m/CnbRDHTl/+Nxi40pVe9zNQNlev2imf5ldB1jct9hDVlwB3inEFM0zSq7leBAYDpBxPaJKNx5sMfPVVoulmwokm1dVtqcxycoZ2alMatKcxohjIoGykoRGCIvCH8tiQEsWtsFoZS4w4RU4qRqK+CASLfUr7woDzXtzxMZIelxMbJs+5bnVDrw8M8xrD9uJI/Eu71cOVLGgc8SkTm96CDfl62fNig0UVlBJNv/DhwI0n2OCZosKXmXgqvlvYmZjtd730oIgfr9EJdxJ20v8cThx3j9g5zgts3n4WyGg7CPgA3KcALpwcumRCC8728ekyB2pCvQbeMm9h5oOXrfo2LsxKLSuvfO3pwEJ973IcXUsnnRs61c7ceIcJ8J91xUSOSGEvdaW/M1UXYjUVFx8ZJpTedS3exE4eLqOILZtasaRZvWOGDUGSRDGh2xQmpZSnApxfDGOABMb8Upt96J6wQRazv/ATWqq0mCAdNN3fDdp6e6b2jMIC2dmUEHvB+aGKDkQd75FA/qGpsdqbpgqHc3VyLnf9Vgd7i29e9Dte0gLznh1QbIxRqK/dI1hHYM8npDUgbb/ObtaCESFl8djQHw6ho5b/kWkzAimkIPSn3Lp8VgwjFgomHpx6p20fBfiux2ZxMwWOohInPZDwTIEb1H6FR/ayAbP62eV3MXSnDuv5/l9PEHkNFomDrFf2EBdqoH1L3pN0BUC43nNiIapgi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(376002)(346002)(136003)(366004)(31696002)(478600001)(86362001)(16576012)(4326008)(54906003)(110136005)(38100700002)(316002)(8676002)(53546011)(66556008)(26005)(966005)(6486002)(956004)(8936002)(66946007)(36756003)(5660300002)(2616005)(66476007)(31686004)(16526019)(186003)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDFBZUxVTTRueUkvbTVEdGpoK1ZRTUg2TC9NaFowOGJxcW5yWW10a1RCM2ZR?=
 =?utf-8?B?cVJzWXdYenNMSXFiVlk0K3BTd3JZU1lFUlYzNzE0MlpnYURvMlhSZ3prQzhR?=
 =?utf-8?B?NU03R2VXT1dvRWRKN2ptUFR1clRrYStSYUl5dEVzemNVZ0VkbWlFeFBtWFNM?=
 =?utf-8?B?ZHIrRDFBNDYwbDhrYWxSV3ZxRzVLTEc5VG1UN0U0aE4rWlVoSDByWUZ3TXFG?=
 =?utf-8?B?eGJTYkREME1KQVhYRHhrNHIwdkpqTWlFNE5hcHZJY2ZQRG95aHJVRytwMEor?=
 =?utf-8?B?RklsZjJuUHQxTStJRGE1M3RZSFZYVGRnUmFCMmhLQVdMRjVHOXRmNFNtd2FZ?=
 =?utf-8?B?NXlMelk5d3dYbmtNbWRNMzNLUzR0eFdjTGU3cGFTQ0pBOXJHeXJiY1V6My9l?=
 =?utf-8?B?dU5FcUZ0Z0JKaUU1ODlWSGlqeHV1M2J2Y05IZG9LR1lNVlA3aitReGRGWDBw?=
 =?utf-8?B?WVd5UHVlN0hiRUZHVU5qbzVScjdWME1NQzhOTTlJRTgvSGl2NDFOdXJ0d3Ns?=
 =?utf-8?B?Z1JwOWF3eUdZdUlBYUZpcTd3bWVMbGljMThNWDVob1ErTHdVY3I1Zm01d2xz?=
 =?utf-8?B?S1V6VGdtZ09CdXpBaG1Vd0M5amlCVllKaTVsWGoyMDlqUzJnMEM5RkFRU3Ny?=
 =?utf-8?B?dFpoS2ZTM0E3SUxROTdmbzNoR1hRNEFPNldmTEpRZ1FXN3RLZU5vL0tueisy?=
 =?utf-8?B?R3E3NGZLOG1QNmdxMkRCdmFESURLS0JBUjRxdGlhcE1pSFpoY1Bqdjl0VVgz?=
 =?utf-8?B?WlBTYjY2czFSUFh4Z0J5M0Q5SWdDbHpaSjJJdVo0NHU5QXkyY3dXbXB5dGhM?=
 =?utf-8?B?b1gyQTR2R3A1cEZBWmxFaFArZWl1bkhwK3JpUFdsekdWT2hTMzdrSmFaQ3A3?=
 =?utf-8?B?V2VkTjZrZDJ3TTVFVVl1RTAxVE45SmFrbXRUWlJ4WkwwOTM2dXQ5ZjhWaWJP?=
 =?utf-8?B?eFQvMGFLSkpEMksrTHF1UFZuQStDb0NFVEJUZXQ1Nk1vQzJVTlBYUlhROVZL?=
 =?utf-8?B?aVQxU2JrYWhrUWxMeEdtNDJtemdXTWVVYk5pMGZsUG51UTVENHhUWFhxMWg1?=
 =?utf-8?B?QzlYZGZML3FOTWpTZ2hvajhUWUl0aDNwYWxaRDNXUnRFVkpTRVJoaHBWWStw?=
 =?utf-8?B?dTlBKzA4aGdsa2RPaTZ5ZmIzc1ExcVJzbE1XbCtPRnptcGNmN2pPSTNiZlJ5?=
 =?utf-8?B?dlMyQmxhSkRNanZ0MVlMSXdqd1RHNFZhQjNaQW8zQnVkL0xwanlHSG9ZK3o3?=
 =?utf-8?B?K0thZzVmM29WbmFTVEVtTURIUVJQTUtxOC8rK0FIbFhYVTlnNFljLzVpZTlR?=
 =?utf-8?B?Rklva05vVEd2eExFOFc4dk5aejh0YlVYbDlPbGZKci8rNkJmWUxBenNpczVJ?=
 =?utf-8?B?Z2k2QU9LaEtBZmI0ejdacnF3cnZDNVVCeTRMQmNtSkdhODBrazNwVm5qRS9j?=
 =?utf-8?B?QVZ0R04vL3M0clYxSjNKVDJZLytvblVjby9aV2pIa3MyNEVYMjZoTy8yaU1i?=
 =?utf-8?B?N25DY3VSRkt6UlBBZERzUW40dDNWdHVGNGp0ZXk2YTVTMDNwSU5VYWE4RkQ3?=
 =?utf-8?B?QXNqWlExLy9MSi9kbXVjN1pCeEJNUG14NXlKWFltd1ZDd3JSd01IbDl5UTls?=
 =?utf-8?B?ZFZ5dHlKYmd6VXQ1Q29IWnZoVFhKaUpxaG9tT3NNSG9TK3M4R09iYStHNE45?=
 =?utf-8?B?MUVSUHdHR3pMMUR4MzY1ZlROOUVFU1NneXNTNy9SYmhaMXdKZDl0cGR2ZmVJ?=
 =?utf-8?Q?+wwbUfCjjOttvBqzIGhNL4Qv9C9l3TBa0Yfa/GS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957fbe47-4b35-4324-06a4-08d92ca66341
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 06:58:59.2254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Idhu9Hzd4tVQzhwRghXyY0/NbDootdOR26GJLsT0uBnJgzriQRQliE5g/Y3XgwmojwqIBMlIlRnSPBGRyc3+qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

On 11.06.2021 03:49, Stefano Stabellini wrote:
> On Thu, 10 Jun 2021, Bertrand Marquis wrote:
>>> On 10 Jun 2021, at 12:32, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 10.06.2021 12:50, osstest service owner wrote:
>>>> flight 162597 xen-unstable-smoke real [real]
>>>> flight 162602 xen-unstable-smoke real-retest [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/162597/
>>>> http://logs.test-lab.xenproject.org/osstest/logs/162602/
>>>>
>>>> Regressions :-(
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>> test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 162574
>>>
>>> This now being the 3rd failure in a row, I guess there's a fair chance
>>> of there actually being something wrong with ...
>>>
>>>> commit dfcffb128be46a3e413eaa941744536fe53c94b6
>>>> Author: Stefano Stabellini <sstabellini@kernel.org>
>>>> Date:   Wed Jun 9 10:37:59 2021 -0700
>>>>
>>>>    xen/arm32: SPSR_hyp/SPSR
>>>>
>>>>    SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
>>>>    trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.
>>>>    See: ARM DDI 0487D.b page G8-5993.
>>>>
>>>>    This fixes booting Xen/arm32 on QEMU.
>>>>
>>>>    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>    Reviewed-by: Julien Grall <jgrall@amazon.com>
>>>>    Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>>>    Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>>
>>> ... this. My Arm-untrained eye couldn't spot anything in the logs.
>>
>> I am not sure to read the log correctly so do I see it right that dom0 started and it failed then to start a guest ?

Well, in this particular flight it succeeded to create Dom1 (for
guest-start) and then it managed to also create Dom2, but failed to
get the expected "sign of life". It varies at which of the repeated
attempts the failure occurs (in one of the flights it also occurred
right at guest-start), but failure chances are high enough such that
so far in all of the flights things didn't complete successfully.
And with this high a failure rate, it accidentally succeeding and
thus leading to a push would probably do us more bad than good.

> Thanks Jan for bringing it to my attention. 
> 
> I am not an expert in reading OSSTest logs. From the following:
> 
> http://logs.test-lab.xenproject.org/osstest/logs/162597/test-armhf-armhf-xl/info.html
> 
> I understand that Xen booted and a DomU was started. However,
> "migrate-support-check" and "saverestore-support-check" failed. Is that
> correct?

Yes, but these two steps aren't the problem - afaict they always fail,
and hence wouldn't prevent a push.

It's guest-start/debian.repeat which is the problem in this flight.

> If so, it would be really strange for SPSR_hyp/SPSR to cause the problem
> because I would expect Xen to hang at boot before Dom0 is started
> instead.
> 
> 
> I don't have any ARMv7 hardware to try to repro this issue, and ARMv7 is
> most certainly required (ARMv8/aarch32 won't repro.)
> 
> Could someone more at ease with OSSTest than me arrange for a run with
> this commit reverted to verify that it is the issue?
> 
> 
> 
> In any case, I tried to figure it out. I guessed it could be a compiler
> error. I followed the white rabbit down the ARM ARM hole. I disassebled
> the Xen binary [1] from the failed job. "msr SPSR, r11" is 0x0026a38c.
> 
> The encoding should be at B9.3.12 of the ARMv7-A DDI 0406C and F5.1.121
> of ARMv8 DDI 0487D.b. Unfortunately it doesn't seem to match either one
> of them and I don't understand why.
> 
> 
> The "mrs r11, SPSR" is generated as 0x00262ecc. That should be described
> at F5.1.117 for ARMv8 and B9.3.9 for ARMv7. Also doesn't seem to match.

Indeed I was wondering whether perhaps the tool chain has an issue here.
Otoh I'd expect a tool chain issue to yield consistent failures rather
than ones with just a fair probability. Unless, of course, unspecified
behavior is hit, and the hardware indeed behaves randomly in this case.

Jan


