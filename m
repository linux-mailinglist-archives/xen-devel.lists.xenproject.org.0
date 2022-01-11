Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC548A826
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 08:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255613.438058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7BIA-0001k8-LP; Tue, 11 Jan 2022 07:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255613.438058; Tue, 11 Jan 2022 07:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7BIA-0001g8-Ga; Tue, 11 Jan 2022 07:10:02 +0000
Received: by outflank-mailman (input) for mailman id 255613;
 Tue, 11 Jan 2022 07:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7BI9-0001Zw-2m
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 07:10:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c72fdbb-72ad-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 08:09:59 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-DLGt0T33MDi9JlOCWPIMqw-1; Tue, 11 Jan 2022 08:09:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 07:09:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 07:09:55 +0000
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
X-Inumbo-ID: 7c72fdbb-72ad-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641884998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtUQoS6bl1zAfjQkrt2xEIAfoqxDEyoUBxOFfjsbyuE=;
	b=cT9lGEyLFj/+WqYpnIGFolVYKv+Um/HEaPt+DQk5/hI/IKwiPjTjg8mWLHwFtWbqjDfDdi
	XjSLLhnvmMaMKuaw3cxwo3rSkDWYEsgP+dQpyRsT6RhxG6iOAqxVEyfSXugovJo87Nz8fk
	6a/0S9XE5bG3g2RX1LiHlQFZ1SLpI/M=
X-MC-Unique: DLGt0T33MDi9JlOCWPIMqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYS8RRQvJHXzVPr6N55WjxIGO/QSfVg/qmX26Ml4zUsN2ksaKNIARl/9h7SluGlJgJw0nWCIqNZPlefBLhN0K8l5IzSh5M2SB+7sV7zv5FWOcPshee86O59yO74C42Bf2c/Cnliv2a++ce678yyqlKelUArJiIRpjFFUEVrGGZxawjI8ZdGoIFrve/WarRy0qKzUGLsvNigo/oCMu22VTgTSeTDTjgVIm6S3c44q+ZNyBRsndlFxoxRGxyuLawV9dt6TU5eOiZqYL4sUSTh1AegkBZfYp1RbFIpvAwJ/ZGB7lnH6+i4oEGObUGV4oTs5rNFDipLoJSd1IlifOu3uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Rg5aORLBy2VyxCSBoNlGxFi+WpuKQMtr44s6uJCrDc=;
 b=ZmYf5NiRz6Z8PAbQMHMMoapk8fg3aMuTaAS2rHPgqe9EAmkFuns14bXrhMtO6Cw8VxQnGPnO7wknmEFb7euiTSIV1+ToU01aoOeq7osDcdQmxZ+Zy0tHTaXxvk921QtBxgBF9JpZ39BzrIS311jDHeibb6MRNfG3t9FJV/wffxb9tsnAB9D4507B2mfYDjQi9OpIfiPXH3vh0nyCZkue6pylLB0syD/RWdYVo0lor2Ghmm1C5sZH90hHu840U1fI3pFRXw0LGrU6WXGfS5weOh3RvYyA0wMhL7W+pIv17whmGZY5AykV8kdzsr6pTfTkaYPy4znFwB/CFWaqMW6v0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e019850-5d9a-f5bd-3aef-cff45d2ccb53@suse.com>
Date: Tue, 11 Jan 2022 08:09:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <amc96@srcf.net>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <YdwodzmyvNwGJaSM@Air-de-Roger>
 <539e31bc-3e68-9e9d-3bb3-2d0f1b2834fc@suse.com>
 <0b2d6240-5780-b8ea-8828-ece44047cd63@srcf.net>
 <d887e3c2-8d89-8855-887c-943ebac6494d@suse.com>
 <42287336-2d9c-c4d1-9253-ed3e9fbedbf3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <42287336-2d9c-c4d1-9253-ed3e9fbedbf3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0136.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 546bcef2-c11e-4287-fffc-08d9d4d15ee2
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686355114B4E8EFDB46426B9B3519@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rd9pSsnPNEzH/Z34q68F2j5xZdCmoIxL5zHQCNPI3LdrMY+wfJhbqqtm6XmE3cCdVj7FqeeXs9l+LxIY6afkF0fgvQhu2fM8tfM4GHQHr0tcL+mSynxU8x3eahsqCFeLmzvqumeVKmCtVaVCs67sVoPCrajbX1klc+5RpKHdQi1kIxbfoni1/cES0ItwuI5NqBvhTVmLhU67x+JGcYPsW+ONboyYqW9LW0ero6ZmbtmMb55SyV+PUqvcFBtcyIJ30xT9H/fa02cAUs7ab/bMg4T90ps8fRpAvruZjLRFFk/qgYn+cMkOB1fjm+D1qSLZKJRJ/+VGzB46DJNZd8W7PSXHic/2eadZ0E5fdd691pOtWwRQQZ71oUZ7Cp/hbTPj9UtMWFHF+4IFVFcWxWL+p48RBuNsUJbBPDhAL6y3YcOImeQNPt+oiCjkcj7nh7BYvyRcMsiunNlit6ZsKCTWUMovmZzgFp8cmzrLkUT2ruCZhWDdtvBiMPPzCj/YsXy2vRSYyKEQ1nBZ/CXZqnh0lBKRwoJ2OkscOIgfdDRZntC3j4iTPoAOkQ/cOrFIKkFO6IPhbBOVrmqWWUyB70OMV6Px1+xbv1UttWGqFrfGvJju7D2qkIJWf4SY6fmXpspJPstV4XpEsNPtftSH8/d2YjkDO/WUmFIU+fDQhq/Pn3k5wDuYOKBPBuvUjeWff2rmDEAasivQsvF6oH7NOUKkbY0MNujv8X1jewyBDcYfUS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(8676002)(6636002)(37006003)(31696002)(8936002)(316002)(54906003)(2906002)(36756003)(31686004)(86362001)(66476007)(66946007)(4326008)(186003)(53546011)(5660300002)(6862004)(26005)(38100700002)(2616005)(508600001)(83380400001)(6512007)(6486002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fBjXKPf8U4+Utc7NRm5VZzTSqW2SwoDR4OuPB4+5VcAsi4zZmR+b7SkgXwbn?=
 =?us-ascii?Q?gh+KGTf2Spm5rN6n2/m2V6q56IW8NS1/MrwhmPedHR0HtPQp65Cqbrxct/J+?=
 =?us-ascii?Q?WtArmW4XbOplXTSsbK06V2KooDbkWMH4RuqABKFC/xw15uYe1geiKwZ/w9AU?=
 =?us-ascii?Q?snf9Ny+iyLH1NUvZkyCccuCNK6D9YntgOfc62UANn2GeO26ekhnnH5o/6IOU?=
 =?us-ascii?Q?tw6P9BImiQxflws8QKdx9pMlEc378qJ08EKnQ8VxS4M/ndjvQ3wZCKpc9URn?=
 =?us-ascii?Q?JxDSkrnTeKpQZUOmVGs6I86Ab2vq8dDjmv0VqysdCsjkW8fakabR1FxnOhl2?=
 =?us-ascii?Q?LKr3etQ34KXzE01LYDVSqEo+VfuZR4BSVIc2i1kPfBBbHBJ9pjZGSzd7rESD?=
 =?us-ascii?Q?D1Taetx0NYi/3SB+a0rXE90KaT8iJZt9gbq1gTTWD3y8vJeieSPT69+mJNxT?=
 =?us-ascii?Q?8L8EmI22ICHWCEzoE22G/qjWfDtdX0kbbbEwTqO/AjO1B4botQGAV5EA1OqV?=
 =?us-ascii?Q?vrg/a3Mw6ZeU5n2D233zrF3Rh20AsBuDD1pTXLrEy+wPR7AH/KLyst+amtNR?=
 =?us-ascii?Q?1NMOPFSgnQ5hP8Zo/MJE54FA1+MzXS3r+W4D4K0cQLnmIrqMWsjyDuODNxSF?=
 =?us-ascii?Q?yJ5g/fwbOXhl55GsSDysy/roQl01+7sWehYXmN5ett1Nak3rXOQzUR4f7M9U?=
 =?us-ascii?Q?6vM7QES+wprtaZIs8snUdmZXvkrkf6qL6EuKvxUfPvT5/0dGrcq5N3JduO7t?=
 =?us-ascii?Q?EWXFiL6yNbvbovho6fn//ld4TVN/xyBW5tXkgOsoR2vM0AwH+zyiX/mLAZ05?=
 =?us-ascii?Q?z/ZxcDh6PO7Pdq1mDnyuqgE8MhK6IdyHsQsq0YFkGJq34ING/+a7OANkeM/V?=
 =?us-ascii?Q?N+p3LFtCu6FpIBWs8GigmaG0sq4fu88OFkb/E6tlRdh/aJN7WjEwOig36nLH?=
 =?us-ascii?Q?/dAxKHUdU0GnzJAODFqxAwmD4WfDKMQypOxaXqN0PmQNlz0q3tp2RCtTEKlG?=
 =?us-ascii?Q?RhnvLjQXLW+qRDCQZeJhIN2l2qw6Z8HWqfbsaeqVAdK5/E8yMx2O2XE2KvIb?=
 =?us-ascii?Q?/C4tfJhb7ZDlACV8vFn46wGq+7+W5sHTYwEaCIhDkFgtfDeJbX3a3gDDPp9b?=
 =?us-ascii?Q?u9o+VHNWO8QllzQzwdBr9d6vwPfhB7kUEEqFQa6kx9GOpxVuLGqlgWx92EmR?=
 =?us-ascii?Q?dzhS880j6Vahc8CFeIlRxPkb8wsULANj5unODQ6Vl0RyT51e930upzN8rDyz?=
 =?us-ascii?Q?dkjcsoqPpshOKVFfjFbH9+K14rYMOGlt3SeAPHXQFlugaF9E5djGSD83B+wE?=
 =?us-ascii?Q?IQGc1gcIo7D51KqxcCI17LEOk5TJloHMEFijMMgB+tZFJ5V4D4X7LeUbQa2N?=
 =?us-ascii?Q?O/oKgfh+SHAn8hvuQNF8FWjeOuglbpMX/OZqa7ySqVgZ9IW6Jslh+kYvoE6E?=
 =?us-ascii?Q?d+lyXaAZ3WVnVafCvIzaBqd9eTVfGQ2sChQR0sbXoBCFE/zaHFFvVtFSNh7r?=
 =?us-ascii?Q?DZCDocQ6s27xVxdOhTL3AUbHC8OM3iGm5pI3cyfZCtTvm50EwnpHvd2jo6Hx?=
 =?us-ascii?Q?n1ldMKa27HyEYgohLEtBqLCkj0F6UXtF+67/XGPoMXQD+8MRu/lu4zA8N6rI?=
 =?us-ascii?Q?gF+KUsDVtmttDOq7QSUw4Wg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546bcef2-c11e-4287-fffc-08d9d4d15ee2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 07:09:55.7242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J2tXbxtDjyCaxna/pLg0+P899Bjx2ph89/0tja3EcZWXXdXdwTcVWHUuHMyxg18mOqyEFH4HYeu9t8fIDVrlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 11.01.2022 06:32, Juergen Gross wrote:
> On 10.01.22 18:04, Jan Beulich wrote:
>> On 10.01.2022 16:43, Andrew Cooper wrote:
>>> On 10/01/2022 13:11, Jan Beulich wrote:
>>>> On 10.01.2022 13:37, Roger Pau Monn=C3=A9 wrote:
>>>>> On Fri, Jan 07, 2022 at 12:39:04PM +0100, Jan Beulich wrote:
>>>>>> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>>>>>>  =20
>>>>>>       pts->frequency =3D hpet_rate;
>>>>>>  =20
>>>>>> +for(i =3D 0; i < 16; ++i) {//temp
>>>>>>       count =3D hpet_read32(HPET_COUNTER);
>>>>>>       start =3D rdtsc_ordered();
>>>>>>       target =3D count + CALIBRATE_VALUE(hpet_rate);
>>>>>>       if ( target < count )
>>>>>>           while ( hpet_read32(HPET_COUNTER) >=3D count )
>>>>>>               continue;
>>>>>> -    while ( hpet_read32(HPET_COUNTER) < target )
>>>>>> +    while ( (count =3D hpet_read32(HPET_COUNTER)) < target )
>>>>>>           continue;
>>>>>>  =20
>>>>>> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
>>>>>> +    expired =3D rdtsc_ordered() - start;
>>>>> There's also a window between the HPET read and the TSC read where an
>>>>> SMI/NMI could cause a wrong frequency detection.
>>>> Right, as said in an earlier reply I did notice this myself (actually
>>>> on the way home on Friday). As also said there, for now I can't see
>>>> any real (i.e. complete) solution to this and the similar instances
>>>> of the issue elsewhere.
>>>
>>> Calibration loops like this cannot be made robust.=C2=A0 This is specif=
ically
>>> why frequency information is being made available via architectural
>>> means, and is available via non-architectural means in other cases.
>>>
>>> There's a whole bunch of situations (#STOPCLK, TERM and PSMI off the to=
p
>>> of my head, but I bet HDC will screw with things too) which will mess
>>> with any calibration loop, even if you could disable SMIs.=C2=A0 While,
>>> mechanically, we can disable SMIs on AMD with CLGI, we absolutely
>>> shouldn't run a calibration loop like this with SMIs disabled.
>>>
>>>
>>> Much as I hate to suggest it, we should parse the frequency out of the
>>> long CPUID string, and compare it to the calibration time.=C2=A0 (This
>>> technique is mandated in the Intel BWG during very early setup.)
>>
>> This, according to some initial checking, might work for Intel CPUs,
>> but apparently won't work for AMD ones (and I don't dare to think of
>> what might happen if we run under, say, qemu). Imo we'd need to deal
>> gracefully with the case that we can't parse the frequency out of
>> that string, with "gracefully" including that our calibration still
>> won't be too far off.
>>
>> Also I wonder if we wouldn't better prefer CPUID leaf 0x15 / 0x16
>> data over parsing extended leaf.
>>
>>> If it is different by a large margin, rerun the calibration, and if it
>>> is still different, complain loudly into the logs.=C2=A0 This will fix =
a
>>> one-off-spurious event, whereas if e.g. the system is thermally
>>> throttling due to a bad heat sync, there is nothing software can do to
>>> recover the system.
>>
>> I was already considering to use reference data like that from CPUID
>> leaves 0x15 / 0x16, but I couldn't really settle on what "large
>> margin" would really want to be. Imo we should try to correct not-
>> just-as-large errors as well, if we can.
>>
>> For the moment I continue to consider my plan (outlined in another
>> reply on this thread) superior to what you suggest, but I'll be
>> looking forward to further replies from you or others.
>=20
> Didn't Andrew mention that SMIs can be detected to have happened via
> an SMI counter?

Yes, but that's again an Intel-only thing. Plus, as said elsewhere,
I don't think it can be considered sufficient to account for SMI and
NMI alone - there can be any number of other things causing delays.

Jan


