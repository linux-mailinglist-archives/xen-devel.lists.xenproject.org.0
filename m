Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C049E4C8E5E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281614.480022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3tu-0007a3-QS; Tue, 01 Mar 2022 14:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281614.480022; Tue, 01 Mar 2022 14:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3tu-0007YC-Mu; Tue, 01 Mar 2022 14:54:54 +0000
Received: by outflank-mailman (input) for mailman id 281614;
 Tue, 01 Mar 2022 14:54:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP3tt-0007Y6-RA
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:54:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cdf0156-996f-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:54:52 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-iUytBLa9P8e6U2MhzJ2smQ-1; Tue, 01 Mar 2022 15:54:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 14:54:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:54:49 +0000
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
X-Inumbo-ID: 8cdf0156-996f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646146492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JSzYXa+uvXP7Qbjc888Jb9bpDn0cbEJLg9c5rCWs+Xk=;
	b=Ml3b1ZKgvpEgZrVd05CowdUW6Cdz31MUORyT8b+JtMf4r7VVqsC2znh0Bgoeet77cdl/EF
	fklFJ0obAcnibaMuRH69P/RsgMlYH93EvXQ5adoRscJ0/AOiKFMD5Q15Wf4Y9zdo0nG6V7
	oxwLOYp0tGjuHJ2hgknA5b5JdQ9kaek=
X-MC-Unique: iUytBLa9P8e6U2MhzJ2smQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chHom2qJAfCnO6VF5aT4EeqIgMOvUTCsQSgKmLA8EVw9OEMpNhmw/gGFAAx8JkW0BxrGtVn5KyXNyO74Lk4bFiTI9M73C2aFDa8Sqw0kPLB7i+iUTltvVtUNR8iwmqD6RBSkbqNzSnP8mItRSI2audaMJHvZEhe0JFezdaHlji+uYQyUijIFZaQl5jUdrPxCFT7GpcKw7irOyNZfUl+urkUe4SKIW8EYAK7QzP/bu3V52D2WPRyvT1lCKYaAAuQICwo8frSfassFq/ecw35bz5vlTkP9oYap3ccwzSnKl2gOK0wvC9CkOqv7D+4zJrcVv13sK4+wxaDmzBNvGUP30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijX2WpQj7tEuuyqNL6tA3cFiHwcdr+MngAW3Zh1Lo6s=;
 b=Ctb1JVmH062s3GGxyFe9/C8jA5EdSF4S3neFzar6AuV3ac1WDcNgZLdrQE1FfDCahBlyqUAsVepa5C/r+zv8CSt+EzPwyOsaujjTNt5x/WhFS0FrUUkwoicOpTzcs7t/q4fow+o2iSA8Adv6Va/g5pBsCqgX1s97E3EKvjq+dN9l3gbyhfQZLXpe6HG23iCH0WImh2+GYiAVTdLYkgKjdF3OSQ48ceWimwgnmjHPBGNGguNeTn1M46M1+CvQU31xxg6tYyWeVgTDHIT/QE+kSYRln9N7qpTTd1AcWmgeSXsZrXu82u9DS/2f+dbZ9XxgjTeyeKh+opxBn1+5T/E5lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ee69f56-e37b-ee00-5705-231f8f300f5a@suse.com>
Date: Tue, 1 Mar 2022 15:54:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/altcall: silence undue warning
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0e3594ff-c637-46f2-bc95-7a26b5471b86@suse.com>
 <40306bc7-f61c-d330-0ec7-d986e4711d88@citrix.com>
 <06452eab-653b-458a-048b-cc709151353a@suse.com>
 <6f005e15-eb81-c41c-7296-4929e85eae21@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6f005e15-eb81-c41c-7296-4929e85eae21@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0100.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7220b249-7756-47fd-ea1f-08d9fb936f5f
X-MS-TrafficTypeDiagnostic: PA4PR04MB8064:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB8064E1D82F4BE31FE83BAAEAB3029@PA4PR04MB8064.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	642Vybm1g+WHoGd9jBjGksl0vec9z/rKnRpclnBWnoAC140kfN6aQnBEldR+CiFR123EqgzmHQrFEgaz0bRP8VYEGWzNAT7SRyP8j5Jv6EvvuSktFp7dxL6fpSot59RaVyKYLYrdlhgWIGLaWuhHV07j9EHOemHhpmuimvU3qB1iexcMMOW09red/YB5XuACEWQvVU+57+pHAnD52dXXwOB/C4FovxAjp1FsHA12vjYgL02nnJ6wh8NJsfYxwHkfwH7fKPfibfVQVoHak0cta058emgfvXsZJuMpT8nXtRSftbfpihM/Rs28wDaIZO8vI/VobHM0REKq1R3zIDI0aN9T+wbPqBojFjld3nhRq5vj4vAdJm86k8SkpX/shdLKxiDej6yOQqdf7hNzOwfXixIb8izPRvsqbr+TQPo4lG9H/sVth65nbWaeTrK2A5ikA1hHrbPDfGcAi13d8A39caiEHiKscNfKUuTxLQ2b5bHRtMTywSYS+y2fO2d+TaSVd78P7gHP0szSbcqxEZW401zuO1XYB60hM/BH7M9cA5d2z5gKuC5oxM/Ld+wWO0tEORB1hvlqvbbxwFZcKKbYOJh40QppHVLP51QEoaNu11Apcu8w/0u791FyD9YocK7fvCM1Wu+54+mg06goLsoxQs4USQL9fPuyzNWLJsn8JHK6MoWyTzTaSYPE33H9DokxDx1tqLJQS4cWp4TovDXhp4xddv2PYNivLwWmynOfA7OsX7D2CGMH2vf/Le9BRJg8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(53546011)(66476007)(66946007)(316002)(6506007)(66556008)(4326008)(2616005)(508600001)(8676002)(83380400001)(36756003)(86362001)(26005)(186003)(31686004)(6486002)(54906003)(6916009)(5660300002)(8936002)(2906002)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7U7c98db4FZRy1M5qtW453tXCxoy64nP7JlGrQ/Osq24hIGeXdatTilf8oyk?=
 =?us-ascii?Q?/bdD0Q5rVnf/Pk8G/n8C1DDcRKdcpzM1/8JHm9H0Zqr11QPBwhk3GYV/955c?=
 =?us-ascii?Q?WUN2RDrMSW5DeZ33RddbmghsQCtq6mWMjnH2mKsNFHoh8+4DGtLDdgAqmF4V?=
 =?us-ascii?Q?f7lrg9xnryX4sjzxlbVk/1bPPaXwnSsRpLpqJZvEQAKQrrzNtFpGbIQJq3Gb?=
 =?us-ascii?Q?AWCML4h3RQXwoInPa+dDeYVclgGiflQyEJht8hBBfPJwzWkJVvX9IOKnmOcC?=
 =?us-ascii?Q?tGwwEdLtaTilYMxXTNiE2dBQ3J34T9Lr+kXgjrJLI2bz7eOYwZeWBxCi+Zki?=
 =?us-ascii?Q?tFJuncWTQgWkaj9wY7IiWH/ji1XZKLXqyd0pCE/ADaftU3J/vy8QEGCtINlc?=
 =?us-ascii?Q?lbvE9XFi4VniNfzTZjTkMWnlQdXsr1CkVLk6FWXhQ0DPJ5ayusiZ85QLnW3u?=
 =?us-ascii?Q?VbCnkUKC+4zNmBIsxBSePMfQHtgggsA2K8tF8nrt/gMwCGvRu1dVNTups2Dr?=
 =?us-ascii?Q?eMdzZItUvPOVIKe+v6cTsZDzzpFiNCFGRe477xipBFuwu7dZ8SoXhg9FMatD?=
 =?us-ascii?Q?BQKDhe4B1Hlb/+5KwzyN7pLtlUu1IoDjm5hW7NlR7Fy6fLfr71GWkn8zTzTt?=
 =?us-ascii?Q?aDKLpyhR7y23E+Ck1ycRT6BkBiDStU8JqS5mbnDvyrUCWeUcB0HOwnDRLAiG?=
 =?us-ascii?Q?rdjRviQpw83AavThYqXzJAKCdcHmtcWdUl6mg+8/8BKP6AF5qgRZ0e+acDAJ?=
 =?us-ascii?Q?O/dwlR9lLA1ru8DTbN/Ix1pkQ/pBgCR8L+96maEB3xhVw2fmxF2qyRwoNIvJ?=
 =?us-ascii?Q?luhb9EOWOOiOVE0BbVD9x5mCgg7SdbDSoqNKjilukoWtZ7CVYHdrB2ezYGcs?=
 =?us-ascii?Q?yMm2JFYvs0CeUWa9mH51HqYjOrPACONk1wynMoueVnSuf1eqLMAAHNU2igtH?=
 =?us-ascii?Q?2vBdkXAfR8xCRbhWnkp3Zv109acK6tUpWoc0ulwZBHqGutzD6Xsh1pKi6xcr?=
 =?us-ascii?Q?IMli8y3kwqHVk9x8bX6HWH8U7OvJx6ThbCBJcCAcnLylP0uBaFvU1wfn00Ec?=
 =?us-ascii?Q?q2Vv6XI/BBubDZFntj61F2sW4YXxIXZNQHogP9Ylx1TW522RAO1G7FYPv7fE?=
 =?us-ascii?Q?ls0yvMUTjk595Jls9PeZLBGDUeWtUJbtsBAUPLDyvZwIzQBKhjMXxIPMlj4E?=
 =?us-ascii?Q?SZ6tuecDFzmEjT3+hknTwSZUDMMWCt7BddrcBVcqIcQAkDORMkZRf9F0rhAa?=
 =?us-ascii?Q?W9DJWVtwfOOZcXgdxPOIrcgynarIetlK/d07BfjJUeCCO6WeihmjpoV8tC/K?=
 =?us-ascii?Q?Hoi2s27HINzsuigws193L4D/Ox9IF6IE+j+W5zezfJN2ggdbwCLY59TyrHEO?=
 =?us-ascii?Q?SPKGgkNxig/CBsPg8GMXxDLYG6gdhrck6ICk25ZKYBlz4B/W9FpYjHkKbi9c?=
 =?us-ascii?Q?Mt6ep7P5+3do0eQVqxiRGaWLc8Ufl36B58cJm/OCrOVJbK/fzV2tNcGQOO7X?=
 =?us-ascii?Q?d3u7mkWBJwn/RkHIYygeNdFDAcfhjmjQ3HRgPqR+2+b7Fh7XapFF/A6FB2Y6?=
 =?us-ascii?Q?Qimaycldt8jnDwTSwcpRPXZkyOs/EunBrE7H3Hcd6RvrzHDKiQavImizOt2s?=
 =?us-ascii?Q?GoN1wYqbG/MfdM0DweNHOJA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7220b249-7756-47fd-ea1f-08d9fb936f5f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:54:49.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBcrWwbk3FOmmvMw4F16HLh8pWci165ACsXkqIwOt5cA93LUEjk7i+jfSmwY9wPHYNr3ykN2fQqY2hH1Qax4Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

On 01.03.2022 15:23, Andrew Cooper wrote:
> On 01/03/2022 13:34, Jan Beulich wrote:
>> On 01.03.2022 13:48, Andrew Cooper wrote:
>>> On 01/03/2022 11:36, Jan Beulich wrote:
>>>> Suitable compiler options are passed only when the actual feature
>>>> (XEN_IBT) is enabled, not when merely the compiler capability was foun=
d
>>>> to be available.
>>>>
>>>> Fixes: 12e3410e071e ("x86/altcall: Check and optimise altcall targets"=
)
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Hmm yes.=C2=A0 This is fallout from separating CONFIG_HAS_CC_CET_IBT an=
d
>>> CONFIG_XEN_IBT.
>>>
>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Thanks.
>>
>>>> ---
>>>> Furthermore, is "Optimised away ..." really appropriate in what
>>>> 37ed5da851b8 ("x86/altcall: Optimise away endbr64 instruction where
>>>> possible") added? If this really was an optimization (rather than
>>>> hardening), shouldn't we purge ENDBR also when !cpu_has_xen_ibt, and
>>>> then ideally all of them? Whereas if this is mainly about hardening,
>>>> wouldn't the message better say "Purged" or "Clobbered"?
>>> I did have an RFC about this.=C2=A0 Turning ENDBR into NOP4 matters, on=
 a
>>> CET-IBT-active system, to restrict the available options an attacker ha=
s
>>> when they have already managed to hijack a function pointer (i.e.
>>> already got a partial write gadget).
>>>
>>> From that point of view, it is hardening.
>> But then you don't say whether there's any optimization aspect here.
>> My question was really about the wording of that log message.
>=20
> The optimisation aspect is direct branch target +4, because that is what
> saves on decode bandwidth.

But that's the other, entirely independent ENDBR-related piece of code in
the function. All we do in the loop ahead of emitting the message here is
"add_nops(ptr, ENDBR64_LEN)". There's no counting at all of how many
times we advance a call target by 4.

Jan


