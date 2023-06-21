Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F0737C97
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 10:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552504.862629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBsjr-000318-Tc; Wed, 21 Jun 2023 07:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552504.862629; Wed, 21 Jun 2023 07:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBsjr-0002zB-R0; Wed, 21 Jun 2023 07:58:51 +0000
Received: by outflank-mailman (input) for mailman id 552504;
 Wed, 21 Jun 2023 07:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBsjp-0002z5-KJ
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 07:58:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe02::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71a9a25e-1009-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 09:58:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9749.eurprd04.prod.outlook.com (2603:10a6:10:4ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 07:58:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 07:58:41 +0000
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
X-Inumbo-ID: 71a9a25e-1009-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1bNX1X6YgGGLMS19Dbm83EdrEd/IKGUdns+7WRSX1DOyyHQ8xIKQ6cqYKhZ/EqUWWa6qbUn9ZlNu9j/Oxp4AtLFNN4EFlSKZqcaHoQlAYHBXISyXB2p0TPDmUkkq/TRitXJvWCcuhy9a55fuiIMGNEs9fWLu9hrZ4l21c+ZI3CK4Jc06aDJ32fw4QnSLBFVRMJ5ngcOgi+0HV95iPXyjXTmay4kfUyuggt0lN2jWLpxsVH16HjxgDTLtNJqg6dtPqVLa+HqXsx5X8MmswWwJgvVR2AZOLOYGG4hBHCeFkerT7EDxAlrsgXSPnrGHRXpoO/0QzzOu06Gj2qUk+6x5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAfFwxHXDSjBDLqPWIAXU5ZPqOr60cP91v0ziC8JE8A=;
 b=Wd7hO93skmqVZ3iS6oNJ5DFz7j95rZj/8kKYmm2Qhb7OPq2OP4JxD//XOpJX9b8KnoK7RzLN0ZsLgTuaWvi8WhBb6ow53pFnzH1nfuDx0gmWx89i1BunODK8G4zoW7MXIyGBpuBGMUeurMqy/fvMW+nYOCRi4zlXbAQAS/+wZ6GGVpcXgUhbrLgu/wBCzPuxDUqpaHoqkH8nmByq9Jwjy35BR/0lpTp3lunjHFSUIaCTF/UGZ2lOlh6dCm9aBsx4Cec9+3VaHhQqXayzR+EB6/hJ5AwZA61xNs+f1TanvyPOpPQIjSWI663/pa3ffQiQ2jwySZXIAI5+9IOAQxI4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAfFwxHXDSjBDLqPWIAXU5ZPqOr60cP91v0ziC8JE8A=;
 b=X6iW/bD3yWoKPv2UwGuAMN0phBe2LH9LcImLBcrFdzMnQbAVa5OALgch6OcGrN1AlbQtPF1x/Tuhi3mtxcYE6Hy6/FqWYndqCjll3aKovfxwSiwVKz3DMzNMRsggmfjQV/iPCtOTwEVGMRBMeecmdFF//7yTjopwDlncCMzOag+qCjyN0HgJn4kQP4Usa9jEnrVk3zL3l5q3T3ZTwVUnwBISCLA3jyrURFmlQpOM6oFvA2W+og/Dpk5k1eJILDvTEq9EA6Vw37Jx2uUORjsxOwFCAUSxxfwMKc04+um7bWFzatPITUSxS/g6oHP5aC5ekSEjd8tCTqg2+P0ZiVyc/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05678680-e96b-3ab7-7955-2a4f99c971b0@suse.com>
Date: Wed, 21 Jun 2023 09:58:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-7-jandryuk@gmail.com>
 <66771ebb-7d56-ca84-89bc-14f69fe62bd6@suse.com>
 <CAKf6xptNyPwMghjgxYBiU-_DU08CLc0S7rLusL4F3JViC6z0VQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xptNyPwMghjgxYBiU-_DU08CLc0S7rLusL4F3JViC6z0VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db83d52-a987-4c22-5c23-08db722d542c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jtz3k5cf4JBr9Nmv/e6gJ+svHeDoSoESHIBXla080KWdF/13dSMsZ+sYaYekFjXM+x/wSM7RMNkrmM8or/zFGMKKd1XXW4vVpx1pcJwjqkK6d3uhGc7axAz28fXA56l+CNpfM9nYptT50ZKo6qJRg4cZfLV28MkYOacvxm/WkpogpOn8qW/6Vtes01LK5Tm4I2HAi7WzzvbPsRTcZqSjiIjVSLPQx4mbGQG5c5W0tE9smsvpfx5ULN9v95QozkAIn9Dn9Waph7R0XBu+0C6CShasE9TB16hc4umiQdFPjQWtsSqAmQrqVKKbgZm37pYro6W1JSzVdglpFvMZF3MddHsWl4wVyzzg/eWDeWN7XxmSt1fzBt5PEsBiVgZEpxTDo+SdV6V/b68c9P1X23VTjZn6g7F7WGK1MC1KBnZ5USKLK1korMxBYGosJoz6iA9am3lOvVFlznKBOwV+wx54UZLW5h9KL3OJtMBN/6KggLxpYP23gPFo5pyhoyvsAGeWuVUQWoFTDPmT0vWrvC8UQZF3gPquoMKRi1xub0gJRl1RXb/NNofXii3YU4MABdVjLEGfz+AQ4Ugr7DNgPV8R5yPF5rZPeSpteulC3NOGQmISM90BpfDjVdNu0Od49Zv9hvOF5oExWVBI1hAKRAUJnz95CpN64M5YrILtqdtCvyQk9u6Xyq0DSFB0kyj/E/DR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(31686004)(6506007)(66946007)(54906003)(66556008)(478600001)(66476007)(36756003)(2616005)(31696002)(38100700002)(83380400001)(86362001)(41300700001)(8676002)(6916009)(8936002)(2906002)(6486002)(6512007)(186003)(26005)(53546011)(4326008)(316002)(5660300002)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0hGUUU2UDNhUU85THFhdUQwOXpiZXkwY0tqRHFwOVRwaWNwMmhhd0tEZ3Ra?=
 =?utf-8?B?OFYwUjZSMUxMejRnQ3MxRDZ3M0pFaDRUNTJNejlkNWdaRk5wNXg0ZVhtNkNa?=
 =?utf-8?B?ajBtcDcxMmtraFphenh1VllzR3plT01RcXlDOVRMVWcxTlJkVFVIVUZpbDkx?=
 =?utf-8?B?Qno4KytFR3Z6bFJaVFFyNXpxTElBL2hDVEgxc0hXUGtzUDN5Ky9FZC9wbVhH?=
 =?utf-8?B?bkpaVk1NT1RPK3NQRm5CdzNaTEtBWjlMaDYxRjNLVUV6NlBGcXpJbnZQSGVj?=
 =?utf-8?B?akUrN1Zsay9JQmFHbk5JaUlmMGl0dlJUSXEvUEcxU1c3M1FaTGlaRDJzZ3BH?=
 =?utf-8?B?NEpXMi92Y3h0ZDlKeEZFZFlxcy9Zb09kRkZscm1ja2R6RnNCcElhbk0zbk5O?=
 =?utf-8?B?aTZBTmJ2anpKTnE0Z2xSa0h6Vm9MckNCWGxoNVdqRXdCU2MyZFIxd25zQlZq?=
 =?utf-8?B?Y3o3azM0blNOQVNsdnhlMFJqZy83R2cyZnFvQ3c5MGV3N1FUN3FhZzhOUWNj?=
 =?utf-8?B?OGNzd2dEaTZqOE5sZ1NsdmNnL3pWc3dZSno3ZHlnM3hoOE1ISGtOUzFlTDZz?=
 =?utf-8?B?TWJXTU1POFFKV2M5MnFKYk9QV1lDQ3hJbnpUWDBWNUppenk0dG9lUUFNSlhU?=
 =?utf-8?B?QzhSOE15bUl6c1FGYXUyOXdVQ1B1dHR6dEI5cXNuZGFqeFNkUDVhVVhFVmRl?=
 =?utf-8?B?RURRYTFSTnVidy9vSFk0QmdSYlcyNXl6S3IyV1NFblBCY1g4MGJFNUZwZlpB?=
 =?utf-8?B?R3FUQWl6Rm9RVWJ3TnhNQkFjSWdVSEpTay96WlFLSFhyWXRiNitwSXJJN3N2?=
 =?utf-8?B?ZmZEanVIM21oRzAwT3pCLzk0RVE1cUFZUXF1MDVoRUVtN0lFU2JoNlBQTlVj?=
 =?utf-8?B?RXRKcmdaTU44SFg1TVFsY0xzWHZpdU9UU3VTbVJ0dGxEZGR6bGM5WTBiS1hO?=
 =?utf-8?B?ZHBXVUpoYnMxdzRFV0c2ZXdjdDBGcHg5WU5ZcmI2TmRpdGExNzNCWmtKdTRz?=
 =?utf-8?B?MDdSaWJOb0N4TmluUTZRQldxa1k5dUtNaVpLVzdoUVdscjFIZWc2Y09VM3g1?=
 =?utf-8?B?RkNtVGZhcXpycUlIRDErWEFsZkRNOWxwRVIwamVjUExIR2FNaFNrNXIraTJP?=
 =?utf-8?B?M0tPOGJEVGtwaEVON0lFcmdDTnpLK3lKa1pTN0N1SXJ2NVg1NTQyaU13VXIz?=
 =?utf-8?B?Ui9KMTM2QTRrR2RFdm5aa0lCYmFXemp1a2psQnQ5TGthWEVBeGNQbG1Qd0lR?=
 =?utf-8?B?RDRNYUZKWFdwcExRMndURnBIZVBKMGpiUEx4MWZCT21Fb0kwUnRKUWd5VEhG?=
 =?utf-8?B?Ym1VUUxsUXJKdzBJdzZvb0R2eTFSc1RYL1pPaXlkTXBPWDR2Nks0UWtUOU5s?=
 =?utf-8?B?Y2FxREhsT1Znbm0xOGFQU1F3bzJCOUhtTHM4VWNxbXdYVHJjQ0VSMVpjWVZr?=
 =?utf-8?B?RytNTExLTm5TbjZxbEVtb0ZIRmFIQ0ZzNTU4R2o3QWoxVGxTdVFFdHBMeDRZ?=
 =?utf-8?B?WTJiQ3Z3UXRGVmMwM2V2M21STnF0Vjg5aXlLcjFVSElmQ09XZU1aVG0xZVNa?=
 =?utf-8?B?S2prWG9idHRvV0wyS2tDTFpmRFVPSTd5MlNVSkdGbENFUjV3aVBXU2xMbHhO?=
 =?utf-8?B?MjNIVVhZNExDWm1TWTNzd1BxNGRvRkY0RjY3TEhBMG9MYmVtMlRJOGVpbVlL?=
 =?utf-8?B?QlV0T3U4NnEzTmNvWnVpWDE2N1JId29maTRKU0x2UW9Sa3JYVS9EdFNnU0xI?=
 =?utf-8?B?M2FXei9DNm9nOFZnVy9BMWdTTnozWGV3Z0ppSHhRTW0vQjdST3VJN3dQa3pM?=
 =?utf-8?B?NUpSRlhHOEZCUTE0YmFpU0t3QjY2K3hibDVMTTNOZGw3R0tjWnRBQUU3OG8w?=
 =?utf-8?B?TmxmMHNFRmdNRlFZUVcvNDRjYXR5OWtQTndQNUZYZHZaWUYyUVRoL0I5Z1Qr?=
 =?utf-8?B?dlBlSEM3T3lXU2J0WndXVHZSajRSNS9SUnF5N1lyaVQvVURnY3dObFBTZksv?=
 =?utf-8?B?dlB1OVdEOENrOEwva3ZpSWphd2NTVjI4VEpFcW5QeFpsa0ErRlAwUElKeHps?=
 =?utf-8?B?Q2JIMk9OcVVUMUgvN1IrTWxZZXRwR3BpNWxsZHpFK2g3dXNrdit3dUtDRmZw?=
 =?utf-8?Q?a6jJAmmb3oassOnRwu7Gzjkv/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db83d52-a987-4c22-5c23-08db722d542c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 07:58:41.5473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWWROOIpM6Y99+Te/mZKiT3jF81hwD1OrVQBpa/T7sJEX3VhmfoKQbaBbZUeZhauWN8Ac9CbFbxz2UFA1LF8Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9749

On 20.06.2023 20:14, Jason Andryuk wrote:
> On Mon, Jun 19, 2023 at 7:38 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.06.2023 20:02, Jason Andryuk wrote:
>>> Falling back from cpufreq=hwp to cpufreq=xen is a more user-friendly
>>> choice than disabling cpufreq when HWP is not available.  Specifying
>>> cpufreq=hwp indicates the user wants cpufreq, so, if HWP isn't
>>> available, it makes sense to give them the cpufreq that can be
>>> supported.  i.e. I can't see a user only wanting cpufreq=hwp or
>>> cpufreq=none, but not cpufreq=xen.
>>
>> I continue to disagree with this, and I'd like to ask for another
>> maintainer's opinion. To me the described behavior is like getting
>> pears when having asked for apples. I nevertheless agree that
>> having said fallback as an option, but I'd see that done by giving
>> meaning to something like "cpufreq=hwp,xen" (without having checked
>> whether that doesn't have meaning already, i.e. just to give you an
>> idea).
> 
> I know you disagree with the approach.  I implemented what would be
> useful to me and Marek.  It felt counterproductive to implement a hard
> failure mode that is unsuitable for my use case.  Also there was the
> possibility you wouldn't mind when you saw how it was implemented.
> 
> Yeah, asking for an apple and getting a pear can be the wrong thing if
> your recipe calls for apples.  But getting *some* fruit can be better
> than no fruit if you are hungry.

;-)

> As implemented here, with HWP default disabled,
> no command line -> default cpufreq=xen
> cpufreq=xen -> only cpufreq=xen
> cpufreq=hwp -> try hwp and fallback to cpufreq=xen
> 
> If/when HWP is default enabled:
> no command line -> try hwp and fallback to cpufreq=xen
> cpufreq=hwp -> try hwp and fallback to cpufreq=xen
> cpufreq=xen -> cpufreq=xen

At which point the question would be why to have such an option in
the first place. Plus how to specify that fallback to "xen" is not
wanted.

> Unless some other idea comes to me, I guess I'll look at implementing
> "cpufreq=hwp,xen".

Thanks.

>>> +static bool hwp_handle_option(const char *s, const char *end)
>>> +{
>>> +    int ret;
>>> +
>>> +    if ( strncmp(s, "verbose", 7) == 0 )
>>> +    {
>>> +        s += 7;
>>> +        if ( *s == '=' )
>>> +        {
>>> +            s++;
>>> +            cpufreq_verbose = !!simple_strtoul(s, NULL, 0);
>>> +
>>> +            return true;
>>> +        }
>>> +
>>> +        if ( end == NULL ||
>>> +             (end == s && (*end == '\0' || *end == ',')) )
>>> +        {
>>> +            cpufreq_verbose = true;
>>> +
>>> +            return true;
>>> +        }
>>> +
>>> +        return false;
>>> +    }
>>
>> Would be nice if the handling of "verbose" didn't need duplicating here.
>> However, if that's unavoidable, did you consider handling this as a
>> proper boolean instead of the custom way cpufreq_handle_common_option()
>> also uses?
> 
> It seemed more complicated to try to re-use the "verbose" handling
> from cpufreq_handle_common_option(), especially since minfreq and
> maxfreq are also in there.
> 
> I didn't use proper boolean parsing to remain consistent with
> cpufreq_handle_common_option() and the command line option
> documentation.  I'm fine with switching it to a proper boolean if
> that's what you want.

It would be nice if you could do that here, but I won't insist.

>>> +        goto error;
>>> +    }
>>> +
>>> +    /*
>>> +     * Check for APERF/MPERF support in hardware
>>> +     * also check for boost/turbo support
>>> +     */
>>> +    intel_feature_detect(policy);
>>> +
>>> +    if ( feature_hdc )
>>> +    {
>>> +        if ( hdc_set_pkg_hdc_ctl(policy->cpu, opt_cpufreq_hdc) )
>>> +            goto error;
>>> +        if ( hdc_set_pm_ctl1(policy->cpu, opt_cpufreq_hdc) )
>>> +            goto error;
>>
>> If either of these fails the very first time through (presumably for the
>> BSP), wouldn't a better course of action be to clear feature_hdc?
> 
> So if HWP is working, but the HDC part fails, just clear feature_hdc
> but keep using HWP?  I don't know how likely that is to happen, but
> that seems reasonable.

Just to answer the question - yes, that's what I was thinking of. Maybe
accompanied by a log message.

>>> +static int cf_check hwp_cpufreq_target(struct cpufreq_policy *policy,
>>> +                                       unsigned int target_freq,
>>> +                                       unsigned int relation)
>>> +{
>>> +    unsigned int cpu = policy->cpu;
>>> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
>>> +    /* Zero everything to ensure reserved bits are zero... */
>>> +    union hwp_request hwp_req = { .raw = 0 };
>>> +
>>> +    /* .. and update from there */
>>> +    hwp_req.min_perf = data->minimum;
>>> +    hwp_req.max_perf = data->maximum;
>>> +    hwp_req.desired = data->desired;
>>> +    hwp_req.energy_perf = data->energy_perf;
>>> +    if ( feature_hwp_activity_window )
>>> +        hwp_req.activity_window = data->activity_window;
>>> +
>>> +    if ( hwp_req.raw == data->curr_req.raw )
>>> +        return 0;
>>> +
>>> +    data->curr_req = hwp_req;
>>> +
>>> +    hwp_verbose("CPU%u: wrmsr HWP_REQUEST %016lx\n", cpu, hwp_req.raw);
>>> +    on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
>>
>> Is this at risk of being too verbose when the verbose option as given?
> 
> For my client use case, it seems fine since there aren't too many
> CPUs.  But I think you are correct that for a server use case it would
> be too much.  Hmmm.  Do you think I should drop it or make it
> ratelimited?

I think it may have been useful for you during development, but I'd
rather see it dropped. Anyone needing to really fiddle with the
driver can add back whatever logging they deem necessary for what
they do.

>>> +    return data->ret;
>>> +}
>>> +
>>> +static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
>>> +{
>>> +    unsigned int cpu = policy->cpu;
>>> +    struct hwp_drv_data *data;
>>> +
>>> +    data = xzalloc(struct hwp_drv_data);
>>> +    if ( !data )
>>> +        return -ENOMEM;
>>> +
>>> +    if ( cpufreq_opt_governor && strcmp(cpufreq_opt_governor->name,
>>> +                                        cpufreq_gov_hwp.name) )
>>
>> Nit: I think this would better be
>>
>>     if ( cpufreq_opt_governor &&
>>          strcmp(cpufreq_opt_governor->name, cpufreq_gov_hwp.name) )
> 
> Sounds good.  Actually, with the top level cpufreq=hwp,
> cpufreq_opt_governor shouldn't be set anymore.  I left it since it
> would point out something being unexpected.  policy->governor is set
> unilaterally, so maybe this check and message should just be dropped.
> Thoughts?

I didn't realize this could be dropped. If it can be, please do.

Jan

