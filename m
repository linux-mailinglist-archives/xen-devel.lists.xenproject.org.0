Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8264176A8A1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 08:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573643.898525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQiSY-0005W6-C0; Tue, 01 Aug 2023 06:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573643.898525; Tue, 01 Aug 2023 06:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQiSY-0005TD-8z; Tue, 01 Aug 2023 06:02:18 +0000
Received: by outflank-mailman (input) for mailman id 573643;
 Tue, 01 Aug 2023 06:02:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQiSX-0005T7-5m
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 06:02:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6c888e8-3030-11ee-b258-6b7b168915f2;
 Tue, 01 Aug 2023 08:02:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 06:02:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 06:02:12 +0000
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
X-Inumbo-ID: f6c888e8-3030-11ee-b258-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnAcJlPfDSZ7LkZZ5QakF7zAqsyNSHzTgww3UHTVVG3fPh8k8uOGmIyt29avpoNv2JblDlVlA5BlT6poo3nhDpiwA4675j7f76f/14BpxR+/pR799RdlUm4VeK/Ee+o2OAn27TyR5zBN+cJHgfPBm6iwX2wohP4AYoNN6aum4SsTujqJum+xt/XNSvxeVBdudlDw9uLqHveLHmJGWm6695jWOWY45HgrZ0ynKD4k+oiN2p4nUqwVLWTS9wCoNlPuTSnYKo1yAXQlKGCGU+g1ZgaZrNNoPasMSaR139DgBqMSJFw5Z0W3RkNZRmymtf1sneQK+tEzorA+3n0RpNRuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSdxrGNiCrZdrayjyWvZ3Jn8fHxqXvISrwMl3XFogzQ=;
 b=PQN0v2BZKMtLpom/H1HbOYJKWUwAXsfg8mplvIPAWj9b6KC3oZwXfQxiC1AsfMdx7/MnCq3nKMMnIDkzfa62R1M7ydBfUP3vHB3PmYqIFNLyBDomB/rYSK2ry21ieLlL0eWEB2wqb3qm6w4avRQwYVFWLA6Eaqhmp7FfkfNL0h7MdKawj7wzAzrGR6fnCrfhBXxqojRfOCiXQz0PT6OQ5XXnEovCrd/4+2gucrmaF7ufQLjaXXvsMjRXffC7bT4HApgtnGw0z/IFt4M1/pHgwGAVRInmAk7dsL0OEMbNaqI1F7hojsUu2PaRVMivGL6BqCo5Ua6Qf61lTsi1d3yjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSdxrGNiCrZdrayjyWvZ3Jn8fHxqXvISrwMl3XFogzQ=;
 b=1FAJ+ohBPKSLBCA2VyA+sQajmGae6dXoIIHupIXUlt/tjpOhh00JaAbU0r++QoMtGihqIgrMBCjpZ697bXdcOYNZVddSja+xf0Qla0wbOe08OPELq28GEpr0neWUp1qlvHQh5gP9CIY25uysw6BVALPIECbzfsbiz7Fn4CHdOESvcrCbNZGuimOodf2g8cWkR3lVOSKRds0jN5MKrAEq0Q8sl5VCUNC5TJc/4aPwVnxbsrvui3J8AL53x3WLOw0qQZ/j1l2SOAWl2N4MeKWUlM/6FAOusEix3Qon9agr+HXplOHdk33VXaQun8GGAKgl1uPlKZbewsdyz+lp3GcZyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40bc7e49-c4be-3d89-c401-347ccf92faac@suse.com>
Date: Tue, 1 Aug 2023 08:02:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 1/5] xen/lib: Move simple_strtoul from common/vsprintf.c
 to lib
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <294e48747a0f9aee0be4fd178fcab029fa317528.1690579561.git.sanastasio@raptorengineering.com>
 <d280f52a-0d88-77f7-12d7-b952bd1a102f@suse.com>
 <0127f163-a96b-447b-5a1d-da048f293ea2@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0127f163-a96b-447b-5a1d-da048f293ea2@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 5791594b-5ded-4c3f-0093-08db9254d987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8B8ciYkJcTxttGTqkn10sat5QyJepFAgt8xBOfcuwJBhWnvuJE+Dl/046ycdCQ+dy9gqJkFMuP2XwRG7l6XtTTtDXpp2P3erPiBpJteNSzbJGOpl+Zah9+yDfA7s/0bSJpRGJHTOGR7IE/qYAMhBi2TOAZmZkC/iEc3YKa45uGJU8jlivLwiEBgJyDrYqq2aNFnAd4ZjcQT9z+rBYxWtGt4cZz+3GC0BJEH89kjSaqhel3TpxV+wePV+lxx4IUs3R5Fnugi3j6GcroPzvP8fYCaZGN50zwRkVsuLpjMFXvrP4nUuLR0dDLGxg1xYMdmwUpEGzJ8otaYzEiGbiON6Synze222VhycXlwgvZ7rFwGytPZBKIl+/PG+x44ec0z3wS/gYhKJf8DHjpawmYzVqpdR8Q0xWGSge5vB+LXMzstxZt3qaTZCAQGCkWE4KGd8skWF6sjG7HKIQj5IvlNxnrIJZ3A+PG3Bf9ix/wCKm8aAwJmdjx36E4foYaWTgIggclRHvEHRe/9VXkHJep3mhCEDLTMFG1/9wEkJ1G8GYusCvBLRiqCnxs1tvQNkCqsZ1EHBdA75qSMjBRLJuX8UHbP5qHUKtwQdtU+khZi04cl0kv6VfcPkytCaBGtVoSASWJE/02pasJ43B6FF/EqeDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(6512007)(6486002)(36756003)(2616005)(53546011)(6506007)(26005)(83380400001)(186003)(66946007)(66556008)(54906003)(41300700001)(38100700002)(31696002)(86362001)(66476007)(316002)(5660300002)(6916009)(4326008)(8676002)(8936002)(31686004)(2906002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTNwQzRsemRYZWpERmF2RnZHS0FlbnU0aEZXWm9QOERjT1hkeEgyMWI2ajRU?=
 =?utf-8?B?THJlQlhhNW9SemN6bFNjbklVcXkvUk9UT1doa2Jtd2cyRWFWM2hqbWJHaFNT?=
 =?utf-8?B?MGhyOURFSGFiS0YycnljVy9rQStFaFVkWjJwRHE4MjU1WHRRMUpzVHJjemEz?=
 =?utf-8?B?VTU4TjNERFFkVUt0em1LYVd0TW53NkZzQm5NWUx4bmYzRkFQV0pDbXBSS0do?=
 =?utf-8?B?T0lQbWNBU2pYMVpPK2hVWUl6QWdyS3pLYlo2NGRIK01YZDFUWUF0MzJBd1Ny?=
 =?utf-8?B?RkIyTGQ4c2JsTTdiMzBMcitFMkU5NG5TSEFtamdJOVIzaEk2S0VaUEliUTQr?=
 =?utf-8?B?K3kyY25SN05aM3lTNmEvL1JZWnlYT0pyMU1uTlQ5Qi9yQTNRL2lMeEpMNERT?=
 =?utf-8?B?Mk9acCtNaG1KSUtYcmZ2eTBGc1B6VjJEYkJLNzEzVG5IdU1mVWgzMFV1dTI5?=
 =?utf-8?B?U3RxOU4xc280VEd1dDJGZlEvZWIrdG1tSzdKcUZCdG4zWkVxSUdyMkFMZlRm?=
 =?utf-8?B?VEE3OGw4dU1BYjBRbVd0NUF3N0lSejl5TUlnTmR4YU81YU1qVzFmRVVNREFU?=
 =?utf-8?B?Y1Vmd2MxRzdMZjRrSlB0WXI2cDdtYWFkRzQvNTk0bkNyblNZTSttbFhoMFJx?=
 =?utf-8?B?U0JiRGpjT3dHQW1zZCtoYmtmS0NFV3BZT3Y3MzZwenN0VmtxbEJ5dHh2NS9K?=
 =?utf-8?B?d3p1OFdQQ1pBcFZyblkzbVdycTJVanlSODVmNUhCVmYyckNvaURMdlczTXdR?=
 =?utf-8?B?YVJZYW1NV3BHSndqOUp3TUR4RVc4OEhTbmg3K1V3WWJyNllPZkkxeVRwOFZo?=
 =?utf-8?B?MHdHSHdUcXJiSHFFTXpmWThOV2VlTzk4NzA0ZU1URVFFZHpiZ3lwNjBQZ0Iy?=
 =?utf-8?B?NW1wcStZNGllMlZXVEFua1NXNnQ0ZWhza1UrWENGcnRxTktQa3owUERZdmRr?=
 =?utf-8?B?Tk5yVG1QV0tTQ0ZNUndlNHhwY0xMRndKWXVyb0xxOWR2TDFwL1RuVk5BdXNT?=
 =?utf-8?B?QXBYaXg5UHF2blpzdGNHV1dyN1hrMVFrOHJwYllIdGcwTzBKTXpMRXRFWHpu?=
 =?utf-8?B?TUVxbDNyUzVOZFJTTms1djlhT0hDQ0Z6NUphV2VqeWM0RDhNYU1veTdMR1pG?=
 =?utf-8?B?Rkx5Si9qVTBKcVNWVmtJcWRETzRqcnVUNnhieEI1UGhxSmVpTW45emhsTUdY?=
 =?utf-8?B?aWpyMUtkWkE3WkxrclAzY284djRVMWpTZ2VHSld6Y1FQM05aRDNYNkFHb0pX?=
 =?utf-8?B?TDRWeTZoZzFzTGxsZS9CeU9pNFpEdjJpMFFBUmtpUjB6OVZZUjJ0L1FCc1hl?=
 =?utf-8?B?OTgreTNNcTF3WnptNVQxNVluQk9UdElobzFpc29VR0haYjMwWGdEUzM5SklR?=
 =?utf-8?B?N3lPTGs0UC90ZzV1bVFCMm5hMGRaWDJaY3ZBSmtmRmlleHp1NWhmMHNsRXlM?=
 =?utf-8?B?VElqNHBucDMzMFNzV09KdlNVWFYvL1ZsRHJrWEZYZXJNOHhlc1NIZGhIS3VX?=
 =?utf-8?B?emx3S0ZOS3dsL2NEdGY3MXI0Tnk2T3E3M0JtRFZHM24rNXpqMWRLbGlDTmg0?=
 =?utf-8?B?ZDJjb1pad0VDRm5NWnRmTVRuVUlEaDB3VkNjVCttNEJuN3hVdVhBRkJRa29J?=
 =?utf-8?B?ajlFS1NmNFMxOXlHTDdHR2lCODg2Nmd5VnlhNmg5L0lLU1J3dXFVQ2tnMnZH?=
 =?utf-8?B?bVh1OW05QWpkSmhNSnpReHJKY3pac3pMYzBBUTZqM0JLOC9OTjRnTDlWZFdE?=
 =?utf-8?B?NzdQUmtLVCs0ODBNRmdpVUE5WWp1Yi9Zb0sxRitreFJISitzeTR6dVBQZStI?=
 =?utf-8?B?SUlTMUFpQ1N3Kzl5WVg4VGFtRHIzbHNBTGh6a0dZdGJPU0YyMzd4RlZzQURn?=
 =?utf-8?B?OFBDczAzalBpTVJtcjVKajVuM3hBeXpqelVQSG55bEw1MXNMYmp6OVN3ZUwv?=
 =?utf-8?B?UEdDbTFybGdUYzRONGc2eUxZUkZwSGptRkxHWDh0K2J1dERyeERhSXMwT3h0?=
 =?utf-8?B?VlJyK3dVSDgvZDdNek5DZ0NZZHJtSjFicE0yZHRmd3JvZ2tPRmo0NzRFaDd1?=
 =?utf-8?B?cWFnWExqZDMwZmExT282cXRRcmR5OUFvSERlUGswMUtXVmo1b1Rab2ZtQ09Z?=
 =?utf-8?Q?I7b+4+HiRUb1F5JytOW9jYASl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5791594b-5ded-4c3f-0093-08db9254d987
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 06:02:12.9001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aNC/asvel6FMJQcVnL5SXWoqRjjCwkepTnwDRAwZfenyGTnef8aC+X8FXrEtmTK96jsXZzvQ/ppPYNPfAu7pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126

On 31.07.2023 21:03, Shawn Anastasio wrote:
> On 7/31/23 10:52 AM, Jan Beulich wrote:
>> On 28.07.2023 23:35, Shawn Anastasio wrote:
>>> Move the simple_strtoul routine which is used throughout the codebase
>>> from vsprintf.c to its own file in xen/lib.
>>>
>>> This allows libfdt to be built on ppc64 even though xen/common doesn't
>>> build yet.
>>>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> ---
>>>  xen/common/vsprintf.c    | 37 -------------------------------------
>>>  xen/lib/Makefile         |  1 +
>>>  xen/lib/simple_strtoul.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 41 insertions(+), 37 deletions(-)
>>>  create mode 100644 xen/lib/simple_strtoul.c
>>
>> What about its siblings? It'll be irritating to find one here and the
>> other there.
> 
> I was debating whether to do this or not and ultimately decided to only
> make the minimum changes that were required right now. I can go ahead
> and make the change for its siblings as well.
> 
>> Also please no underscores in (new) filenames unless there's a reason
>> for this. In the case here, though, I question the need for "simple"
>> in the file name in the first place.
> 
> From a look at the other files in xen/lib there seemed to be a
> convention of naming files after the exact function they implement.
> Would you rather I rename it to just strtoul.c? Or simple-strotoul.c?

I'd prefer the former over the latter. While your observation of
convention has been true so far, I think the shorter names are to
be preferred here. They're not going to cause issues, as I don't
see us gaining non-simple_* functions.

>>> --- /dev/null
>>> +++ b/xen/lib/simple_strtoul.c
>>> @@ -0,0 +1,40 @@
>>> +/*
>>> + *  Copyright (C) 1991, 1992  Linus Torvalds
>>> + */
>>> +
>>> +#include <xen/ctype.h>
>>> +
>>> +/**
>>> + * simple_strtoul - convert a string to an unsigned long
>>> + * @cp: The start of the string
>>> + * @endp: A pointer to the end of the parsed string will be placed here
>>> + * @base: The number base to use
>>> + */
>>> +unsigned long simple_strtoul(
>>> +    const char *cp, const char **endp, unsigned int base)
>>> +{
>>> +    unsigned long result = 0,value;
>>> +
>>> +    if (!base) {
>>> +        base = 10;
>>> +        if (*cp == '0') {
>>> +            base = 8;
>>> +            cp++;
>>> +            if ((toupper(*cp) == 'X') && isxdigit(cp[1])) {
>>> +                cp++;
>>> +                base = 16;
>>> +            }
>>> +        }
>>> +    } else if (base == 16) {
>>> +        if (cp[0] == '0' && toupper(cp[1]) == 'X')
>>> +            cp += 2;
>>> +    }
>>> +    while (isxdigit(*cp) &&
>>> +           (value = isdigit(*cp) ? *cp-'0' : toupper(*cp)-'A'+10) < base) {
>>> +        result = result*base + value;
>>> +        cp++;
>>> +    }
>>> +    if (endp)
>>> +        *endp = cp;
>>> +    return result;
>>> +}
>>
>> While moving, I think it would be nice if this stopped using neither
>> Xen nor Linux style. I'm not going to insist, but doing such style
>> adjustments right here would be quite nice.
> 
> Especially if I'm going to be moving its siblings, I'd rather just copy
> the functions verbatim for this patch, if that's acceptable.

As said - I wouldn't insist, but in this case maybe I take the time
and make the slightly more "complete" change.

Jan

