Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C536D7849
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 11:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518364.804822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzSp-0001z7-3i; Wed, 05 Apr 2023 09:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518364.804822; Wed, 05 Apr 2023 09:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjzSp-0001vk-0w; Wed, 05 Apr 2023 09:29:59 +0000
Received: by outflank-mailman (input) for mailman id 518364;
 Wed, 05 Apr 2023 09:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjzSo-0001vd-Cj
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 09:29:58 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cd39c67-d394-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 11:29:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8037.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 09:29:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 09:29:53 +0000
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
X-Inumbo-ID: 6cd39c67-d394-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBhg9vijep/v9C+llyabXe18soO62vzduroRAbB8BlMvl+73vmxZwu9ZjJlFcbrrOxs05GcL+bG3wRmliZ/9C1GAOtWjQf32dFVLFbnnkHeGmda09Q0KJDTLi3iEcEwDmNrJYO6VcpGIuY0G6AhC/sRtfAhRP3byN3X76Snlb4sL9uTeJ0WGLd0caOtmpKkcsHoKk44mwnAIg+kVfurlzCyodCfGnhYrVXANSPOREijRIfWlDUvuTW6ZsJh1lm6jK04V9S0MFxtj/qjEcQ8C3NL6EtH0E22f71w+tJ0uIxPagVEYPXd5mle5S9axn48uBGx4Jd/OIgwD4ZP1Fc/lqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9Rxxk0xnOzGBNILaI2KtYmjf6KxyxKXqSchWhBI7lQ=;
 b=Ia9TTMdLrEyFi1mh1540MpmP3f+31DecoC2D8apK4Xy6+n8SMqnU1Tc9l+8ZzT8Ca/n5gJkgvBWRZurQV6UVr8UEeAZ/hBOBxVyJKK63eY8c38fjo7Ek02U9pMpLkPghjbroiTE2rbM3b1ENr+tiBWTqaUVtVAPO507RvQlsn7o5AR4fumnYdzIogPaefrOThjY7GxyGjip+mGVieEhc/lyMcFaHwj19NS7TNlw5MTR8wFPlsPq2NdPHeoqxkqAgao40OL3og0kIc2RYK8eaNcIS4FWnVcN6yjB9Cfh6xWI+gjn74hT9mVYszEenF3qia+j8+NOs3uYimbydGnTyOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9Rxxk0xnOzGBNILaI2KtYmjf6KxyxKXqSchWhBI7lQ=;
 b=nak0QiD1TXZSpOgrrKlHFvQ0mV90eHf+Lg2Z89Z22f/dmleT6Bg3L1KBB3t+YXuC3w8cnnWm3wRtDezKTYVNlDifTDVKlOQ40rldT3JxdZWwD+PS/6yopXH1bsAyzk1uoIoc6VXRAjWIpv9OXtrrxjuKloJ4xB4LCAvBQ6A/kE/2qU68Rdszd/jL6rEoQYGE3eJmgqvEmw3wwZW2o9ol6Bfo2XXxkdgFTUiR26z/frM0G1g9+/3mt21vx+IjK+2fi1ABvutjKdzfCCvcEve7fq6VRCrAVY8bEf6tX/LCM90Scl5+YEoJZvnIEXtuI5MXpe05ZZXSqM3guuc15mL7aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83cc6b93-6a50-1eed-1588-20b3bc38c318@suse.com>
Date: Wed, 5 Apr 2023 11:29:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <ZCv3+cpzJ52Y679G@Air-de-Roger>
 <3752672b-f4a0-5ffb-9759-dd315ce31079@suse.com>
 <ZCwM1SfCAfh2koBD@Air-de-Roger>
 <ac13fa57-ceb2-0aaa-dcfa-42d8d01ee6d7@suse.com>
 <ZCxI18gb8zK5X+nR@Air-de-Roger> <ZCxSooPqPwpGW6yv@Air-de-Roger>
 <5cda250b-57b4-2833-99d3-84ae8ca32059@suse.com>
 <ZC04cu9sXVeephOf@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZC04cu9sXVeephOf@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 7300fe45-f032-4e02-af28-08db35b84fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sJMpCA0lXTsmaqWmD/wdHsz+mDNMs3uC4wsdhNJO21AjegL9VFpN1jtUEA1oKpFlq/BGUXOVfVC0Nqiz66JuvJpNydPSxwJ9lvPiCoYGApg/DVwp3uuAiRw0Zwyrc+O0wUHUSBS2+PPv81OgrltaibFTKb2we5n2bLrIBoMltY/Pwo8ntnUPvqHlz2a2t2s+Wbep+mHCmTuicXaW04aJooJ+UIx3dzFJlOISJt42YDFXGzsAz/3cDNnvNugAhTb/GvyFk8ExS8BFQRbQgfsvZlQ3sJrq02MkMpqw+Oc1uVeD0HG2xy/moQ82u9ltl+f6nDLzinM46Rl85EkzF5kj+tCyFmxyntCqZQZ1F/Obo1ZZOSjAfchhA48IhizxfvqR3RehycCmbzBCRVXgXwNcpE4Uio8hFBCpXtkwKUOKnEOel3Ht0hUwzVSCI8kPvG7Srwxl4HRDX86b2qiHxeqGzDeKkP6xUodCW05zjb02701xpb0faa/H0alZEwZBNJDc/CXiSLySF+1i/FFbRALwFp4bqxkp9m7ZBMzM0lFzykVNSd9yFZq/0luphkWZeZwm5ETgsM/ao1qJyYUOE3Bum1AhwTVKkv0nhk+RNzL5O+LRZGzHG2oD66Wg/xWoA8Uy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199021)(2616005)(83380400001)(6486002)(478600001)(316002)(54906003)(26005)(6506007)(186003)(6512007)(53546011)(2906002)(4744005)(36756003)(4326008)(5660300002)(38100700002)(6916009)(66556008)(41300700001)(66476007)(8676002)(86362001)(31696002)(8936002)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWU0K2E2cWFaYW5BUVV5NGhJOGZucmsxZjNZV0t1QTJiV2NiaU5UWUxCV0ho?=
 =?utf-8?B?MkllaVE3NFQ5K1pUR0NEL2NkTVBJbVBKT1llaDR6dXdOQVVpUTJnOUpFVmVy?=
 =?utf-8?B?dzRhV1psUzY2RGRPUXRXUGRkVlJDbE9lUGdzL0xRNWZPY3ptSnNWNmRiS1B0?=
 =?utf-8?B?TERGR2sxN012SGdiS3pIZnoyYk9tQkgzMFcrNjZXVXBRZ09oUURyL0tCa1VO?=
 =?utf-8?B?enhjUy80Q05Cdk4wYXFadExQK2VQYXJJYXVzcnh3WmVJWGhFVFdvSWlvNHVU?=
 =?utf-8?B?ako0WG1UYXZ6V3pPSzJtUG9SNCtHblk5QlJtZ1NsV09CcXpGeEhrMzBjTnJx?=
 =?utf-8?B?TFI4K2JFRFBjU2R2QVNqVERXeEI0QXpwa1VJTmxOMDJoMHZMUCsraDQydnFl?=
 =?utf-8?B?eHVoNXdqT2gxWE5vNkRaSW80Ny9hckFXc01RZVhueHU3S2pvZE45bGp3UFl2?=
 =?utf-8?B?YXphM2NtTldDZmUwRXpYajREZkV5QnFkR2lGMTZvOUhLV2p1b2V5cEgzRHlo?=
 =?utf-8?B?RlF4QS8wSFU0SGJxWVhyTkpZQWNiSkUzOGpkbVg0cVQyMkdwa3JPWmxNSzFa?=
 =?utf-8?B?SDdyampWaldDSjlQS2l2M28yb3luZmVScmRNU1ROZG81SE1VOTd4U09qQXNI?=
 =?utf-8?B?OUoyb0F0eVgxSmpQcnJDQTNrSDMzMkJtdHdGZXBjaXJQWCs5MzduRmd1OXFT?=
 =?utf-8?B?QzFqUFB2MlIyczk4QWQ3Vmh3OGNHcVlId2dBVlJ1bUhia0VnVzNqNkhkN2J1?=
 =?utf-8?B?TUpJK3pqdmt4dkFPaTJaaUo3R0xWWmxVQjl6V0xhNklXTmxta25YMllnbVRZ?=
 =?utf-8?B?OU1qYkdPeUsvWWNkenJ2Nm9mZTdzT3JuM2w4UGVQVUY4NGdwd1lSZ0h2UHFG?=
 =?utf-8?B?QWZIaGZCTWJlZEh3VjRVV1M3WjRSalBnSVRDY2tkRXozTW9ndjNKR0JCcVNP?=
 =?utf-8?B?VTJVWThicFJYcTBOQmVxOEczcHdIb2xzLzEyYWFaUUxjclN0eExtVTdpRlNY?=
 =?utf-8?B?cDhJTGVoN2w1NFZQQTgxalA4VU9MdDBiYk1lY2kybksyalJnR29mUVRWSHZB?=
 =?utf-8?B?RUN6ejJnM211bHpzQVBRODJtcFQ2c1ZpVDR3YjhpRm9meXFZUVpCWnZDRlJl?=
 =?utf-8?B?RFJ4cy84ZEhicjhwWFN0dDZrc0tSZCtLT25TcndLWTBJdnA0QVdWYU0rT0xt?=
 =?utf-8?B?Z2xIcitWOU8yaGkwOWFhanZza3dySlhOMkVQcGVVQzI1WHgrQ3owZkVKSVlI?=
 =?utf-8?B?eVVNLzI1bU5rNUszZ2lZb2RVOFhmT1JpYjNhcUhyVGFqZXNYa0c1TEh4VXln?=
 =?utf-8?B?MEIrLyt5a2hobUVtM2NXWnJ3TXNUbFY2cVd1ZzAyZmVMUEhITEs1dVRKT2Rj?=
 =?utf-8?B?aC85c3lGbURJT0dMTlRVV2xUY2t6VDZzQ21Qd05wdkZLMVZuNVNBRUxabzNF?=
 =?utf-8?B?QitOV2xsRkRrUEVLMUxyczdId29ocUpTbE8zV0NGUk51Ny8zY2VHNEpqazFn?=
 =?utf-8?B?N3JRQ0R2QTNUV25NWndITXJYNDdsNDkvbzM4Q0FGajkvY0pONXFTM2tvWUxN?=
 =?utf-8?B?NUJhSFNUeE5KU1o3WEVZK2p4aGpkNzJoalljdlc2TzR1VDJJenYxdWd4ckxI?=
 =?utf-8?B?YWllcVlsS1ZpNEowUEZqZVJMUmU5TjhsQ0NIQlUrTmJmN0M3a1c0dVU0WEdO?=
 =?utf-8?B?blg5SzMrSTcrVmc2SlFLQjdmdEpLSkpXT1ovUDhjVUJlZkhhQVlHTFF0Umcy?=
 =?utf-8?B?WkdmVG5HRlRnTFpvaWw2NHMxTEdtQ1JBUU9MQzJ4V0JiZlpwYkVuMkVmNmQ2?=
 =?utf-8?B?UFZGSFhWZXovKytYUFpWblAxd1lFcWV5NTJ1bENjcmE5Z3FqRk00bmFib1RO?=
 =?utf-8?B?ZkFvQ0hKeTZXM3hmNUdTSW9RZ21UUm4vM0JBdVU4bW4vSnlFV0FrUXZsQXJG?=
 =?utf-8?B?VlNuNlVwc3Ywd3lodGxxUzI3UlpZTHZSUUxiWi9WRnRIVCt3QUg1ZGpDcjJv?=
 =?utf-8?B?K2dEQnRLMkdvNUxSWFcxbkxrTVEveXFwalUzWEVYSG9DYmJ0ZWFENnRZWU9J?=
 =?utf-8?B?WWhoL1RsOER4RTBZbkJBQmZSUmdWSEdlaGwwTGdEYldySDRKK2tJVkJxV2Ns?=
 =?utf-8?Q?LTYS+W5I85ydcbN1v7aIpTfRg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7300fe45-f032-4e02-af28-08db35b84fa1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 09:29:53.0767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IRIf/GiaRdEAt0DW3uEtdID2aavXiR4G84KvzcY2dlns7dQLrFQK19Aqcs1MW9AWZJti50QgeKG3qp1DghTDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8037

On 05.04.2023 10:59, Roger Pau Monné wrote:
> We should likely move the setting of vm_assist to the domain create
> hypercall, instead of doing it at vCPU initialization.

Perhaps, the more that setting the assist is limited to vCPU 0 init.
Which in a way makes sense when considering domain creation, but it
is odd for the case of vCPU 0 being brought down, reset, and then
re-initialized; IOW I think arch_set_info_guest() should further
have constrained the setting by a !d->creation_finished check.

Jan

