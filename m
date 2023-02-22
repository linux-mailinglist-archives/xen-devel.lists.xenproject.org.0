Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1448B69F96B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 17:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499723.770996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUsQJ-0001VX-2q; Wed, 22 Feb 2023 16:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499723.770996; Wed, 22 Feb 2023 16:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUsQI-0001SG-WD; Wed, 22 Feb 2023 16:56:55 +0000
Received: by outflank-mailman (input) for mailman id 499723;
 Wed, 22 Feb 2023 16:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUsQH-0001SA-9O
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 16:56:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7d00::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e714c07a-b2d1-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 17:56:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9581.eurprd04.prod.outlook.com (2603:10a6:20b:470::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Wed, 22 Feb
 2023 16:56:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 16:56:49 +0000
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
X-Inumbo-ID: e714c07a-b2d1-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbfDcXX66t2PACUS+KViHmjV51EhnlvPSJYInv4EKO3/sebttXKT6A1aSG6WH/zrjCWuOhmJ7KwlHauVhDAMvOPg7UCOS9+60exInOSfCeiGmVw8eSPqaQ5JouPH+yAEBkhaNzl50NvKnT8RXH1+gKO5UK98Aq4hsxKFOmGnJxkfuoJcFfhoUY5TtjQqaqV+T1tUrf476MlhwsR98pCjTGkJPU20LD3yNYbHWPdKbp3R/ihgSiwJo6fCTzInkSxrGbruNie3y004Q+Glux76GEHB1PKhfyVjJc6nAo5bg2E0NniptyZCEqCAlNejQS7EH7nWA6hv/yr6wBcYBxCLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz1B4ZwDYVJs1GUArQztzdg/Oss6AlYDIWpxSyBKX1g=;
 b=Jkcw1mR0sMId8/16GBBqR426h6cpvHrrKarQouvVvfSUpRkxCwRbApQ77u7SYZ0UzmH67z4RPU/mKLt6FqpzDuzsjQh7ZLx4t7+vpzuxrqSu0KpcbtTIfAOIYSeLFOXiXMqdQkbQBJJN+U+2CMlSGoWijI8E2Hm0fFep3eINtZoGLlfzwz7rnKJBqJoK7hvgAvKkwIsgEc4825EZhFkjotQ7o1LS42vlCrSgmk11zy84fDzX4lbZnHgg/iVVXGxnADug73vGU372XKxRQ0G68oO9gdH5Hjp+nGjrxvNYUbtk8WZRv5zcNKR7mRYHRfgXAhy/rPTtrI0SOULnpGWCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz1B4ZwDYVJs1GUArQztzdg/Oss6AlYDIWpxSyBKX1g=;
 b=EDqDLKl17hWvm4QYHKBrD8tGIkdEL8N9hV5hzVGDw7pq+9GTyq8qfnjdHPNwUqTa2B8DhGNqNce/1ElXiaV0ToVxNlCOTalak5kARUP2vECuT3VS8uOqDtDoMTl1RfpSsX8FKEHPkWHv8Q87VpSNlSO0s30v11bCyeWxAoxJFxNgUu2cmdQQtxSTuVExqZqHxM+0J8Vle0pHJl7oAEKSQjzueBkNG6WFqYH4YGveIVKJV1WTf7qCip46d/6qudbPkn4xzy9dIO7bsB4OnKL3YQzVfJXYi8EtNXKl0B4txasLuP2DE41Js6eyCuD8c3sP73CiTd5NTVO2WzVIXA6zow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <874332b1-8cd0-431a-7d90-616bf7d762d8@suse.com>
Date: Wed, 22 Feb 2023 17:56:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Core parking broken with NR_CPUS=1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <75b06911-9ff0-e75f-b611-810277524171@citrix.com>
 <0ab8641a-684a-3a13-50c2-d9912286f313@suse.com>
 <99baebe6-7552-bd46-6f84-724bb300443b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <99baebe6-7552-bd46-6f84-724bb300443b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 694b8985-3b5d-47f0-33f2-08db14f5ca1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+H8GTqnpC0JPbBIq+tIxPxUBe1uxhSUxayb+CRHjzxBP8ZdwY8G2lCpRb8dId4cgYkjt3ApUX2S9v15qZWDMqYcJbWTKhKOtS65Pac1gCifR8tFW9EmLrdbXRpQ+JKBuVLwS67Z0bT7KP//xd8phXdpRLypLU6qG76L0eZahIrNACV3LnCvyWctrRrkFLjOOvKs1XmcnzQP740VYv5w/FO+PVetTSUIcB164W49737qzkVHAlrd/3N9c41tpe/99uuNbS3vyUOwKzN9h7Nu62JDp3ixtb01+qVscdNrbHExHe5Ihoyvk/P3e2DDtdrsbPA/s1MVvX3fR0kQ3mvaI+aDeb2gcIf2QCzi11+FT8qBUqBfRuxsuMFYuJOpPVEH35QIF+TsnFri5w3XRjUoxMoTF1unS8qYDk+d9K5V1uGhFLTP2K9lCVqXtqhaH8M4hxwzAeqwpzmmBl0uVTozrHQ64SccYxtzHQKAPSI7w5S4lBjfe6ladcHpzDj76oC+Taytcom69isUWwW9RadFzHIjYJcP8/Go/pNN0c7jFZ0VP4B2n9qPCdpqXAO8pF/AVtlAhWZ8PMm+UlXjIiLe4Jms4d0NCNAnyN/dh4G7DiB0O0BXF9HyK5WjOaxNAQqo7K2Ki/61IlWv2hLsp9GA5/F03wlBtqJirbxMmEIPS75820Z4R6/BOzalySkoIhpLVVi47d5PpwveTZX4dgilXaq3IRNFNeeZeWo7h8qiRm3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199018)(53546011)(186003)(6512007)(26005)(478600001)(6486002)(2906002)(2616005)(966005)(66946007)(316002)(8676002)(6916009)(54906003)(66556008)(66476007)(6506007)(4326008)(31686004)(41300700001)(8936002)(5660300002)(38100700002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUpoRU9Gcjc3WXlJU05qcjdCK1FCaStQMHRhVm9LcUkwRnpQZkxrVnZTbEpn?=
 =?utf-8?B?U3hSOG5nQzVOQjRhNVJrSThqOXhUVTlQZkZWN3hxckhIRVRFVmpJcUtyblZs?=
 =?utf-8?B?aXREdUZpdDJqQ04weU1UdkJ1dWtOaHZmM0hvZUJLSi8yZDE1TXgrM3BONyty?=
 =?utf-8?B?OWF1dFZzREpSYXBCYWFoTGd0bGl3MTlSMGZhU2I4dWRPSHZ1ZG1aSVp3WVpN?=
 =?utf-8?B?ZVZ3VHFxd1VhZVVBYXdsV0Jvc1ZqQWUyWU41VUV1cGpEQ3pIZVNzSk9kWTNt?=
 =?utf-8?B?SVFsRXQ0QjZ0YndKOUlmUWZhQWlYQjFZRGdscUdXYk9WeUVOUWVOWG92SDl0?=
 =?utf-8?B?eEtDaW5NbElzRWJqcGJzUjNuRElOaFdpUzg5ak1iL2dlOTVHUmFKbWpoWmw2?=
 =?utf-8?B?UzJhY0dlc3EzRmU5aFFXbTB3OC93SFg1QS9xN2VRZFczdkU0NGRCSTFCZTV1?=
 =?utf-8?B?UTlHTzY2SHN0dXVDUXNtSWFmY01NRnBHSmVYenI5SmZNSDdmNXJoZXlYNmh6?=
 =?utf-8?B?MXBUekNmYUlmNDRNN1hqQXE3MGlwZUx3c3hIcit4NzNwSGliaDlvVXlpQzBG?=
 =?utf-8?B?dmlDT3NQdW1ZWE0xUEVyMU1jWExkeThkODdocXUrRlFrdkI4YUdLdCtTRFRJ?=
 =?utf-8?B?SVdPR1Z3cUptQS9xbnpXNmpoZUo4SzBOdWtVUmExS0c5ZEc5UklVVVI4cHly?=
 =?utf-8?B?MEhBdGNQVjRaeUxuTjRrTk1kbEtpeGUxTGIzNUlvSU1QSkJPL1I0VjRIenU4?=
 =?utf-8?B?MlhkbytmclFNbWF5UXdaaFBPZVFCVXArc2dQL29PT3dPSklvYzRHbmpmVitk?=
 =?utf-8?B?ZkdRTjhzc2gvT0JlaDNqL1RWVU0yOHdPT3lyVGtERGRkT0NYb1QzOFBtQVRY?=
 =?utf-8?B?QlR1RnRqVk8xeEZ2bHAyM3dMa2JQR2RZMnptWTZWRmVQY0F1MlVldFBTWm9h?=
 =?utf-8?B?eHAya21Fb1pvc0FEeTBScm1Iaktwa2t4Y0xjZGRVeE5jaUo3dllDanhNTnZC?=
 =?utf-8?B?WW9XZWRpM09yOGR6bUZRcG5xYllzMnJUNWR0N2k3RVZHdjI1UDlzU3p4OVdE?=
 =?utf-8?B?TG91eVBPVjNoMnJjYnFJTnZDMmZSSk5HdEJ0S0ZTdW1NTFBNNU9BWlh1RDUv?=
 =?utf-8?B?Ri9EZ3VvQUk4VDNyM2prVzNiRG1nWmVCQm1vTWxZYXdQK2EvdHRZUjVlejRN?=
 =?utf-8?B?U3NOY0dwcTIrVEpHS3pPMGxvcHV5N3J4Z28vOWo1RjN3akV1RnpKOE92eVZj?=
 =?utf-8?B?VWw0WW1CdFB4TjNTZlNYc0JFT0pWZWJsU05Bbm1RZDFhcDFoQXFBR3BHZ2tw?=
 =?utf-8?B?a2RFVUFuNWU2K1BTVFRKVjR6MzNWaHNMSXBwNklXRlAweW0vSisyRHVCaDM0?=
 =?utf-8?B?QUFwZTJDay9BYUg1SlFzWWJkekFHRDh3UzIxUGZ5ZUJVK0NqK1NpL1pXSVVW?=
 =?utf-8?B?RldpVzlKdWxCeC9aeFVadGk2eW52MjJpL0JQK2FhNHIwaWJIdWtxVFE4NC9y?=
 =?utf-8?B?ci85dzhEUXo0UFRJYzlFUmE2NVBBa3VNbTdOZkVPSEcvRkNHM1Fmb1ZZYmF4?=
 =?utf-8?B?M0hYNW1IcStWdVYyQW5oc0MrcHdaekNPWGdaTTRqZlV3OEtNSVhzeG40bFBi?=
 =?utf-8?B?eUQyMXFJWVc3WnFpOUVvZ1p2cTNPcW5kMVRHbWlTL3ZvcEdYcmptUldhQnlR?=
 =?utf-8?B?N1FwUTlhOXUxRXBHOHBmSjJFT3NKYmZ1cnNmTzdYSzQ1ZFhJNStqdHM0b0Rk?=
 =?utf-8?B?b1NzR3RreUM2SnpzSkpNSWMrRFJRRnlTLzRsaXZQalBuTys2bXI5REYrTmQr?=
 =?utf-8?B?Tk05TU95dmF3SzgzNkV0STI1UEsxR3kxZXlrdnJDUmpyRVE2SlhrOG9rM1Nw?=
 =?utf-8?B?QXVRa3F6TkJpUTh2YktEaEg3MDhFN3RvNFh2VlJLZ3UraWRFV2szSnpqU04w?=
 =?utf-8?B?KzRNTUlTWUpSVCt3djhxNU5ncjhMM3o5TjA1czRORnk0NHovc05WQ05DVmVw?=
 =?utf-8?B?QktBdnp2MmJNSFRUNEU0eG16OVFORytGYjFta0RIYks3KytFaTBtNmlmelJC?=
 =?utf-8?B?REpRTTNma2FGMHJVdUtGVU1Gb0VCMU40NTJCVm9yeFVGdTllNmRmVlU5dmNq?=
 =?utf-8?Q?oFxnaCtsKCRh/i77CoJY9/L21?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694b8985-3b5d-47f0-33f2-08db14f5ca1b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 16:56:49.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MnzZCvUcQrWVcllDjYUqWpBabSBg9+pR8gS0dUqEOm00V5gEwaxJhH0212QkT/MVeiU2hxqeU199266SN4Bog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9581

On 22.02.2023 17:20, Andrew Cooper wrote:
> On 22/02/2023 4:17 pm, Jan Beulich wrote:
>> On 22.02.2023 17:04, Andrew Cooper wrote:
>>> While testing the rebuilt debian unstable container, I found:
>>>
>>> common/core_parking.c: In function 'core_parking_remove':
>>> common/core_parking.c:230:53: error: array subscript 1 is above array
>>> bounds of 'unsigned int[1]' [-Werror=array-bounds]
>>>   230 |         core_parking_cpunum[i] = core_parking_cpunum[i + 1];
>>>       |                                  ~~~~~~~~~~~~~~~~~~~^~~~~~~
>>> common/core_parking.c:31:21: note: while referencing 'core_parking_cpunum'
>>>    31 | static unsigned int core_parking_cpunum[NR_CPUS] = {[0 ...
>>> NR_CPUS-1] = -1};
>>>       |                     ^~~~~~~~~~~~~~~~~~~
>>>
>>>
>>> which is an legitimate complaint - this logic is simply broken with
>>> NR_CPUS=1.
>>>
>>> In principle, I think the best fix is probably to have CORE_PARKING
>>> depend on NR_CPUS > 1, except none of the interacting x86 code has been
>>> written in a way that would be compatible.
>>>
>>> But it also occurs to me that this is the kind of thing an embedded x86
>>> usecase would want to compile.  Frankly, its niche even on regular x86
>>> use-cases.
>>>
>>> Except having looked at the code, it's a different to the other thing we
>>> call core parking which is the smt=0 logic to keep the stacks valid for
>>> cores/threads we don't want to use, because of #MC broadcast problems -
>>> and this logic does need to stay.
>>>
>>> Thoughts?
>> See "core-parking: fix build with gcc12 and NR_CPUS=1" sent back in September
>> last year.
> 
> I'd clearly missed that thread, but the final part seems to have agreed
> on a NR_CPUS check, with you saying that you'd send a v2 "in a minute".

And so I did:

https://lists.xen.org/archives/html/xen-devel/2022-09/msg00906.html

Jan

