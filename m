Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E5039F155
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 10:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138346.256123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqXNV-0005FE-Bv; Tue, 08 Jun 2021 08:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138346.256123; Tue, 08 Jun 2021 08:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqXNV-0005Cc-7z; Tue, 08 Jun 2021 08:46:29 +0000
Received: by outflank-mailman (input) for mailman id 138346;
 Tue, 08 Jun 2021 08:46:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOFJ=LC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqXNT-0005CW-4z
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 08:46:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a46dd14-7b19-4c99-8ab4-f87176db0d5a;
 Tue, 08 Jun 2021 08:46:25 +0000 (UTC)
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
X-Inumbo-ID: 1a46dd14-7b19-4c99-8ab4-f87176db0d5a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623141984;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q4CnpP/8ScgdUckSIVKWIJFlvqHpnSa4umpufSvWRPA=;
  b=V4i7RXNzjbk8ekUNuyKylW7l9Snfs+w1rWF1gvNCfR6BhcKyE5ki/YOT
   fjT8GvrFOEzYmysiP0/Hfhn7ShWMEKan08f2YV0bxYchBau/EiZZqdpQP
   t0VoOMBlHk446ywNS7snWtWyIJuELbNjeHy0I54VBwJE0SS9kEeOvqA54
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NAj86P/2EFskdlSMZdQhm58RENexc4hoobekvvetm9bSSdKrjkZvOiiMCaLDZkpCnLMooPWWLO
 vAiqJvbMbYqpZcAX28BRujfQ9zYVWachRaybqsbyUm2WGFkBj0P6wZZL++bDWA66oVykkydS11
 vQCGZKYA9TSDU4lO3cfxTWqhZpKkDwndOKMd81txmyVSP4LelW+x/alLohERJpXl+yw1oYNnqv
 DHGvnhwsPAoUHVUn3A07XRtMr5c0kLx5Rn6Z17BDRRd9A+jJq1eoVn3dEHtQnYhX95Ka3QmSI/
 5bg=
X-SBRS: 5.1
X-MesageID: 45606218
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/xN+qKkSA3bcR+0cgRppqkYocjnpDfPOimdD5ihNYBxZY6Wkfp
 +V7ZYmPE7P+VUssS8b+exoYJPwME819fZOkPAs1MSZLXnbUQqTXcJfBOTZskLd8kHFh4lgPI
 ZbAtVD4dDLZmSS7vyKojVQcexQvuVvmZrA7YuwoRYdKHAPV0gJ1XYkNu/xKDwPeOAyP+tCKH
 Pq3Ls9m9PPQwVwUi28PBM4tgr4yuHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX292oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkFwnAjv0idsrD
 D/mWZ4Ay1B0QKIQohzm2q35+DU6kdp15Yl8y7DvZKsm72leNtwMbszuWsQSGqq16NnhqAi7E
 sx5RPki3MfN2K1oA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIVLH4sJlO01GkcKp
 ghMCgc3ocdTbqQVQGYgkB/hNi3GngjFBaPRUYP/sac1jRQkXhji1EV38wShDMB84ghQ55P66
 DFP81T5cZzpw8tHO5A7cI6MICK40D2MFvx2VOpUBna/fs8SgfwQrbMkf0IDc+RCeo18Kc=
X-IronPort-AV: E=Sophos;i="5.83,257,1616472000"; 
   d="scan'208";a="45606218"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRvtSgohSbNM1ztq5fg+V0bCPrECJctSfz0gSswatkdzmKbrleTMPxtRftchv5RzWqflKnXY/phfD57B3xC5PMq4hww9Fi1Qac7Xxj7wccyE3hG/NUXD+3UO2oRTlnh2LUMoDekmX1Ke5uH3mFvru5MZBeKCy7YW0Qco4uwQSrJ7S85hgkA8u/TQIIlCIm161FEFNizFfeL8EwZVCgH/XiOD5Hbax6Dk4iDGBwLs5DRc7Htawc42ZrOnL13sfnTHbvK5aH2SS73ubR0ovoudVQQFmeIqR+X2UWCBjU+3drAWRwwucR93thy/D1GDpPMLGx3wqIgpBbg91NnJc7CYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoACm74cXK7DNwzQN0F3UHM9GF591XLrksoHjFW1OZs=;
 b=IQTiF8gai8K3Pofc4JoIy54u0ItMGHzAj+wKoMc/pp70JGW30p++azRxFNwRfcrUsO+C0RtvvJBDJREw4OYSUueWs1ZmOPG+e04JhEjtWiAUQJsh/5Jb6mdQW40rJGqlsoZz0kq98ZYI2EVsoAoZcDFKcVMzIhgBTkp7D0u8Keh+SYHHce3d3olskaPd91rfbEzm/7msNokHEVhgMMPBidD8Ar7obfeQINguty4AF44mkbzcQYOdNKyQ1IIZgUTAW1haWno0JYW5H+gLTV6EIwif+U13CnEhqQsgVSvdogwdUsH/Q0y+B5sf5zCH9xFYMrBp433gmJDGFm8yk42qOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoACm74cXK7DNwzQN0F3UHM9GF591XLrksoHjFW1OZs=;
 b=DxBcDq1KdASb/8UmfpdaV6QNjw4mFhc3gpt9Imvq8VozlBaA4ssHqu0RzYKtvof6xWsydYvkpvqqBy6RkOtKFY5BIGSv/GcD5s6UfSeNBPGZ7GEIDVhQC1pnn1gI8ckL/YkI1/Mpc15jtEQoSEBuzuR1N8kbQA7JFOTAAlAiBXY=
Subject: Re: [PATCH] x86/cpuid: Drop special_features[]
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210607124141.24767-1-andrew.cooper3@citrix.com>
 <d09c3a27-4b89-be3f-6dea-37f3759df570@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <22ffd522-89da-d9fd-3918-bf07eae1be1a@citrix.com>
Date: Tue, 8 Jun 2021 09:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d09c3a27-4b89-be3f-6dea-37f3759df570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0411.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81563e72-d05b-416a-328b-08d92a59e3be
X-MS-TrafficTypeDiagnostic: BYAPR03MB3800:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3800D1E6412003400ABBF126BA379@BYAPR03MB3800.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EQxOIkqYJZvUl7eE4xqIiiyp7DUeVvipDihpJDUtbHmwRvg0YRBNY7Y7kbamQzs1JxektEzTJjfwBZBfItjQO4Tgm/g+uX4Q3qo4ZmS2K7uS4o2HFrYd7d9o33GDY2ePU5AeYnwLqiaDAgjivU1I7xNugU9mWNGAwW41906P4YO1cYG+QHnkS+HDXoKKDn0oX3NuKdwG/sGMYW/c7BxYt3IKYUo76LKd9TJNejbuH4H27bAKILTwDUJDtC0+VJOewEq9F3xsk/fKZw71ZdgHNCXFT3LkkJgqhZuLQFkBfi/T5HS5XHq2v8ufB5PR80dMm4mDgrUzTqhYkXaLGiVStgMjQICYkVlsPwLVvMEyFosaAoqU5Per2xh4B5FUaTB88/timVFMSpNGavbiAgkT4ueuKuJB7yBsYlN5AHUTaHqv0+Dqn7VB5KUQiD9fsWDK2Eu72Zs8LBQMToM9ghTASm1iJ+7MvMfWu/eYFjAajWBbAIYNl62WeQ/6mxR/Qf7xUYIVocc2Yo6no1H0Da8zOcPgfBKyt3a+lcOxae/P7oiFbCTv4tQc1aeeaiMXlxlcjz0Xx+h0EE5F/rx2Ahr8XFUq6Rz6dpsG9TZDISHtaTQLQswmXcIS97e6EJE97dH6GzbFbK4SGJFTwG4NhwXWMksI2fODxFfUA73kYK0nyjixgb2h2X1F1PUuZpWc7WtI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(16576012)(54906003)(4326008)(2906002)(316002)(26005)(956004)(66476007)(8676002)(6486002)(83380400001)(31686004)(53546011)(186003)(16526019)(6666004)(86362001)(31696002)(36756003)(66946007)(8936002)(6916009)(2616005)(66556008)(478600001)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUp4cDYxMmFqeVFBNGJ6TmtrYk5hY2NOUGhienl3Wm1PaUsrM0s5Y254YTFJ?=
 =?utf-8?B?eDVKSjVOeVljb0IxL0NjSU0wWGJDUmE3algxbDh3MncyLzd5TzBTTmRyTGpk?=
 =?utf-8?B?T0FXQU1ZamRJeTEvSm9NUnZLZEtDLzFzNDg1Zi96R3JXTCtsODUyQ2xoQWVN?=
 =?utf-8?B?UE1IdDI5ZEFNaFlyWXZWRjhlRjdLaFkrck56bnFUZlpuaFAvM2tFU01YUjAz?=
 =?utf-8?B?Q2xlbGR0V29mMko1Nk96dHhrbSs1SjhURGoycG1scm9aOE14eWd2ZUhOdmF5?=
 =?utf-8?B?bTl5TE81MlltcUlIODFiek9mc0RPSjkxUWc1eHF5Uk41V3pWNHJDMHNUaGcz?=
 =?utf-8?B?NldqTXJRVW9GL1IzKzRpQmlkaS96Z2FWN3cvaG1zVkJrcUJBSC9FYitVN0dP?=
 =?utf-8?B?dXRLUFd3TFZlMXI5NDRPeHdCeDg1bFZvUGFqTkVPQ2NlVE5SVjdwbHAzMitC?=
 =?utf-8?B?TWp3REc2SjdJK0FCZzdxdDdteGs2RmZxNlloaHB3d2FVWFZRS25COS9hWDc2?=
 =?utf-8?B?cC9jZXpEL3pObUc3eGEyVVhHQnB6Ym02VHFKcDV6M2JXcmUzeHJ3SmhIaGho?=
 =?utf-8?B?U1lObU0xdG5jcVZxQStkdHNzNVVNU3QrVTQ3MGhLL2dBSzM1YUF3b0F5MHpr?=
 =?utf-8?B?TFZNVHZ0eDZNRFJpek94aGpFd2dMbEZ6bEJubG1JakJ6V0V6U1BDVStkZnh6?=
 =?utf-8?B?d3VZMS9qWUR5VnRwVzJ1ZGt3TW5GMDlSd0lLOGIyS2ZKeWxWempGOXNESSs4?=
 =?utf-8?B?Wk91MXZSYldDWXh2TVVoemhOeFhSOWFZUkVZS21jWFY0SzV2bHhFbFV0VDBY?=
 =?utf-8?B?ZVNpalAya1NLSXJ1VjFpeW13N2h5d0c5bGxvVUdGaThtck41QU9NRkpTT0pU?=
 =?utf-8?B?b3k5aDB0R2UwRU03cnRFSXAxQ2J3NE94QllVZTVtazNXUXBBTnpHR3RETnNz?=
 =?utf-8?B?eGM5QlozZHlHZVdJUGV1UGF6RUlWZGFJTGIzRFJTeVBBZit2SVVtRjluZUxS?=
 =?utf-8?B?Q29hNzA4WlM3VEMwRER5RUtvNjJmU2xPMzNqaXE0eFcrcFArK2F0Rm1Sakxo?=
 =?utf-8?B?M0hBQUF6TE9CS2ozS1J5SnhLL0NuN1Q0RnJtWnNMcW4vUWRydTRLSWxXTUxS?=
 =?utf-8?B?ekRFNW5aM0d4RUcveWlFakxSY096RC9XajBiWmdxUnNpWkVhcHI4bW1XbU9B?=
 =?utf-8?B?YUNjT1lIQTBvYWRab1dXYzU2YkFyaDQwZ3Vra1ZGVmZpVU5JNXphVW52clNj?=
 =?utf-8?B?cjlmL3ZsTU54c2pOTWw1dnR3cS9uMnNLbDlSTUN5NkpoQnhtc2pPNWRPQXpT?=
 =?utf-8?B?SVZvZTlzeU9aWTF6NVM4OUc2K3VqcXQvcmxQcWNCRyszNUV3T004Tm80VWpS?=
 =?utf-8?B?Rk1ZbENVdjh0ODc4ODIwdVlXK0ZhNjZBdklyK3F1dzZFbTJQQm9qV0NsamtI?=
 =?utf-8?B?TWZFVWJOdFB4c3VMbTFXRXdESzI0Qlp3ZlZpUlZUMFRIK01uSGRTQXdpVE9q?=
 =?utf-8?B?RmZud1M4dEF3cjlPaDcvZEVtMmtCMGxhTE9WTmNxT3IwTEl3QUpFU3gxWWZN?=
 =?utf-8?B?WHpQcXJ6eXZvSFJWYVVibnNOdnkwbGRscFF5aGpzTGp4bXFoZUgrdFlDMTdO?=
 =?utf-8?B?cnRIVmQ2V0xaS00xNUVzaGtUQlhMSTd4cVZIQ0FHaHdxTzNYdHcvek12MVpU?=
 =?utf-8?B?T1B2ZTNZZVFEY0VHejQvRTZXRnBQVDZ5OGtaVUgvc3ZZZ0hrRVZUTDNrNDJa?=
 =?utf-8?Q?JJ8il83ZUaigCxjfhXygf4yWKeh+j59RIaPmKrm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81563e72-d05b-416a-328b-08d92a59e3be
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 08:46:21.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kq1oaMke+vwo9lLGCTYWMij5hU+jI8s8N+9xIOeN7+J6C2De+a9XueR84kEhLSR/oBnDI5iZUULNjGFSKGwX708+RT20uiwCY3bof2sNH68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3800
X-OriginatorOrg: citrix.com

On 08/06/2021 07:18, Jan Beulich wrote:
> On 07.06.2021 14:41, Andrew Cooper wrote:
>> While the ! annotation is useful to indicate that something special is
>> happening, an array of bits is not.  Drop it, to prevent mistakes.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/cpuid.c        | 2 --
>>  xen/include/asm-x86/cpuid.h | 1 -
>>  xen/tools/gen-cpuid.py      | 3 ---
>>  3 files changed, 6 deletions(-)
> As osstest points out this didn't go quite far enough, or too far:
> Either XC_FEATUREMASK_SPECIAL also needs dropping (including its uses
> in libxenguest and xen-cpuid) or, considering exposing this
> information via xen-cpuid isn't entirely without purpose, the script
> part of the original change needs undoing or making conditional e.g.
> upon __XEN__.

Yes - Gitlab CI didn't spot, because there is a different breakage from
PV32 blocking things.

I think I'll reinstate the gen-cpuid.py hunks because having xen-cpuid
print out the bits when asked is helpful.

~Andrew

