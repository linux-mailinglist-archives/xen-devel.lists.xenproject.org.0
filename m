Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B44E9B31
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 17:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295503.502891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrLv-0000Br-MC; Mon, 28 Mar 2022 15:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295503.502891; Mon, 28 Mar 2022 15:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrLv-00008k-In; Mon, 28 Mar 2022 15:32:19 +0000
Received: by outflank-mailman (input) for mailman id 295503;
 Mon, 28 Mar 2022 15:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYrLu-00008e-3p
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 15:32:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa037fe-aeac-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 17:32:16 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-eeKJUKXgP-2GqXNk_-auHQ-1; Mon, 28 Mar 2022 17:32:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB5387.eurprd04.prod.outlook.com (2603:10a6:10:8b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 15:32:13 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 15:32:13 +0000
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
X-Inumbo-ID: 3fa037fe-aeac-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648481536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pNa20O0jOpkbHA9LcSsbx9H6cWR7Gde29lvBVA+BK2g=;
	b=hJhTlLQJLoGhFJ0bgFxsDK0njzozu/sD1ZDk2bqVHleVEIfKiiIxSpkahVZKQRFi0PNATb
	YvM8foRZ1Abk1NV4e3wLARqzolntERXY3QqEYYK69cjqqCwZjCT/RBzc77qLLBx4opwq7o
	fnBG5Ap61ekYEuX5bdOJJCptTymE73o=
X-MC-Unique: eeKJUKXgP-2GqXNk_-auHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpxQVp7EtDregEzM7qkTwH9OnQUooBhnCKJt0RvNdw9/jZqIneYBtyC+lhP2XY90XS9tNJ4O1TG+I+IwrMIg+OzilwHAI5+fKM4EEFkoMxQu4/LIxC8AyCP+0Mf3wKQpolp10OIsSkBkXQnrjOu9mnsVo6yu8p6DPmPNgktUX7S2wdEYkFp6DspC5QvlX/kBJIspU0uO0rMsU71Hj/fJOxWnIekjuxKaWTafxTOKmlFkNb+usqhg+Of5Q2iS+2bxC5C0h7QUdhCxnXe+S+KTF9zFOfME9/qhppj355DHncByUNOI2BvRW+IlVANZtMmVveRmNBVljDmC0aqxR8I3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bgbAq2eYta5h0QAy9d/DArmmTv6+XJryUq1+OxNot4=;
 b=e3d9gWZCLGzbJ5/8ZsTiQZfuvgTv8+0eBC/d0+vjAHHB2YZ1RS+4yYgCpLCoZSR1pDLdpJNLOqJhfgjeiUqmHW9gtQCcWXdlSQSmrsEW0CEudR2D4V+UFeOyFJGIDgVDLtSW/MqmwwL3hgN+eUV7Ixi16OWIn3FwsQ6Z7xmiHmn9L439EF/hZXAajFVHDlKr7HB/jQZPfXJTB5jl1gp1QqvV61rQSxQYgMnNdeDwvOhmzUG9bzJO7GQZm1PIO0a405lO76XBHq63fMXjdK7K3uV6E0COSvKxuBfn42qsqA+CKPg/nbCPX+2rZSeX8fJoRPDphJxzRtZEl8HhZ4ZFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f68f1b9-46a4-cfae-0783-bb2edaeb7b07@suse.com>
Date: Mon, 28 Mar 2022 17:32:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220315141807.22770-1-roger.pau@citrix.com>
 <20220315141807.22770-4-roger.pau@citrix.com>
 <81e90bb0-bcc0-563b-eda0-9979164aaad2@suse.com>
 <YkHTQ47POJe5lpwU@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkHTQ47POJe5lpwU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0058.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::35) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97b9f033-3f1e-4236-013c-08da10d0217e
X-MS-TrafficTypeDiagnostic: DB7PR04MB5387:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5387E3327C7472A9F2A2EC4DB31D9@DB7PR04MB5387.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/sTnQALpN4wUPRSFgn+6Yh3XTNWDU+C/T++2HaiJ8osOy6N4Mr3Q8o/RDXf87jLTAxganwVloCWi+20fLrCaane9m1qBgcp1+j9zkH9wSFyY2sfGSurxhJ+lJR/Q3x0WkdM009cvAZA32/8oUUK3UgG72UNP0g8avJYdW2N5ZfD0vqyTcxj4IEFh8CMgO3jnXIQnu5I0fkUdf5GO5SfEls8OBgmhcTqv0vSscVmXTtHEC2JCxnfDxFAzkuCIrpiU17wsYWLRthf2ud7J7+iTJi2xk4+RX77WUJGQounwldvJRSvlMxjb82Yp5ib938m3V3aIovCNNIEy62XCuIFwYyHlQc5+Zidl5Pupa1Z5jFoqS6Kj7GDe3No5RB4VwKDpGsq71+KwxtAwqRqS6tU7TDAO53AZUwIZkwKs0EU3XzTfCzsGx0uVD8AB6PNaF2EyaYmO15ij/kqh4ALjkn9T68+eb5Yjg26aBzaitwVXbgoTGwiGTlYXX/0L0svNbJibVccrcO5HelYU2/m0hujHBUFqV3GnnlRWihNTMD0oQektSSKc+QFGk03Atys5F41tRSU6OM0z9q0Yidmaw70G0pc6/xsTqt42G6q89vuFwza+o6kpyHMMeS4E4lsDyV0doCglNyVMKCz3p18GDvOi40Mu1DDTz7Ia8biqewYOtl9q0X/ORkC+PDgn6k5ewPs/3kD7KXAaDc2+gtFka+ASf8/kEM12ykMDf5/KiXfA3B4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(4326008)(31696002)(66476007)(5660300002)(2616005)(6512007)(66946007)(66556008)(2906002)(508600001)(6916009)(54906003)(8936002)(86362001)(31686004)(38100700002)(53546011)(6486002)(26005)(36756003)(6506007)(186003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SHma18Dmsq7lkgLrMxn8Zr1zTeVklf7vlk66WucYC0xhqzvKHlqe8i+Sg6Ik?=
 =?us-ascii?Q?zWbyOZG0B4NqeJGZEqIDcSdfyeOBHgkKaZ3GNEm5U7FfYzZpB1Xi4nZM+Ia5?=
 =?us-ascii?Q?d0KvGmR4cXdkPiPmhtSSsGBsfPAKc0zC7RDwkTU1cnHfQ0wpKPlzZtaqlKKP?=
 =?us-ascii?Q?QoUZTUl59xRVn+Q45ViDEH8fPILXB1ytdfKWWShFoteAs8VVpByYfYx68xro?=
 =?us-ascii?Q?wvsatpBXHbeITdLU0+6I4y8UvwVSrB22VxUiJHErSPL4rU8fsM8yAj8BhU4k?=
 =?us-ascii?Q?cYurG5Z+AgHe3WHQQoOVAzrvUnsQ0Vg/4ZMADp/H2IZfgiXs+T+3YAkigQMf?=
 =?us-ascii?Q?CEanQRBSACd87iihT9Mqxvo2r23jWXw/6ZPZx6siCIFYsIqZ5jNtXS+PnrHl?=
 =?us-ascii?Q?sZWFuBzdC7B2Lalzq6TwB9pDxf/E7cp+uVfrnrqXRLorpMgloYgRUJhQ3eiV?=
 =?us-ascii?Q?QE9/c591CnaRjXx7NTWuZeqZMPB22Dh1QPpXiSi0n0Ss+Knof4+uj/Kgb7wv?=
 =?us-ascii?Q?p45cvHqU615mCYs3ZXqtHChwFxFeSf6HMEyH56pTrdrfU9UimcQmRI4OSNwM?=
 =?us-ascii?Q?zgLtLGrYjP3Erd5zh1TyPyV4HysuL1YZsG8SwOcpPNztVX0s/azk3Xb2CRvh?=
 =?us-ascii?Q?1UIgwWkfcHYYRQ5pZr2SpZmmniQhrQGym0P+GMdtFSHeXbcJyIxUrd4HCssx?=
 =?us-ascii?Q?YxXM2zTVvgZr91K5K1jeYfom6Ot3JM879FeI1NpHdr3tpGTrYMcvKQeVxhgh?=
 =?us-ascii?Q?g154An2W4v5mnbyhx1PfkLcNwOzUJPtdcJw0A9qg4RxAoOcOAgRZ6o4DNMRy?=
 =?us-ascii?Q?NRG2b2zwHpNz3FpDoW5dx3ygiWTtdJA7uQJBz/lZJR1U4ahyNRVYHUQih19O?=
 =?us-ascii?Q?HqfOXpjPs0sqXk+OJT3L2HR4wkA2OrT7BBzwb9W8r/PuJ+jIsMQpNBhqCDJM?=
 =?us-ascii?Q?NV12Eoq9ZGcCkRmknZBOYEecp1Io0HhsqM0iS04hvi8iV1VdAHOaiU1TTrdI?=
 =?us-ascii?Q?+0A7wF8l5bHbCW6EC1MuTIoRIXBEF2CLhVkVqb9V0/R+ddwEdRgLNAvyWUIo?=
 =?us-ascii?Q?QQsYoQj8o+ZGk736/zfz4OFaQ+Ga2/6Pwlr3LJHfQshfRqOHjZAJn9aYbHsm?=
 =?us-ascii?Q?MO9BjSs4akWG+6ezU2ff0Mq2ci4orFtI2XvR74bhzGR7mxzBfH1XptnRdCeW?=
 =?us-ascii?Q?sjcQXap9sP6Tv8U8B6QkFDxqGfoKI7dPoCsx7x/7kvApMTm73FCpLWmmSAZE?=
 =?us-ascii?Q?32CxL/NA4Bxo5xqbe3GCuKkm0CR59PHcdrSpbM3G7lpJf9+O/dP8zCT3YB0O?=
 =?us-ascii?Q?EIX4015qHvCAPjw7k5Dp081/eI6Mf4wJtlimzjxQc+x7HuiLVP2Fj+5b6H15?=
 =?us-ascii?Q?z9/ZzmPt7ML3kE14Dwp/R54/GY8AVNe2p94Yp5D5jXN5UTCo2bjweVAO2rs3?=
 =?us-ascii?Q?WpMYmTmHkwdCb5jEi6md09XknajH83CpvdsTo4D/oRQs1NABzoomx2ZzLOWk?=
 =?us-ascii?Q?i8MUIuyZqU+EQyUId1cRF259bt17CJR3BAO2eNn8An0y/m+6CqaZZUd8UYxo?=
 =?us-ascii?Q?psnJZIOHR1loOvqUxz7WQfh6+1kS3LA2AHe6/HnXcF0v2RZH5YH+rseA5UPl?=
 =?us-ascii?Q?XY5EQlTRTJmEU2ax7Kermd2Nuo1SXiQunTrU0b2dVpE07xQCRnDr57J2EOtb?=
 =?us-ascii?Q?Tf5AvnjJ6NTNCAe1znfQo9OjloRiYofcQZ5QXX52RAtPg1JHM6p1kw0iohqS?=
 =?us-ascii?Q?K7IqHiJWpQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b9f033-3f1e-4236-013c-08da10d0217e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 15:32:13.0306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwiapKAJrvWcDrEWcSN3VL8Tv/0Q8yptRtopvMoLfVEjJ8sibBkX6FsFFUgHckvFdLtZUIPx57FEjmH+oVEyUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5387

On 28.03.2022 17:24, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 28, 2022 at 04:21:02PM +0200, Jan Beulich wrote:
>> On 15.03.2022 15:18, Roger Pau Monne wrote:
>>> @@ -677,14 +680,17 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uin=
t64_t val)
>>>          if ( !cp->extd.virt_ssbd )
>>>              goto gp_fault;
>>> =20
>>> -        /*
>>> -         * Only supports SSBD bit, the rest are ignored. Only modify t=
he SSBD
>>> -         * bit in case other bits are set.
>>> -         */
>>> -        if ( val & SPEC_CTRL_SSBD )
>>> -            msrs->spec_ctrl.raw |=3D SPEC_CTRL_SSBD;
>>> +        /* Only supports SSBD bit, the rest are ignored. */
>>> +        if ( cpu_has_amd_ssbd )
>>> +        {
>>> +            /* Only modify the SSBD bit in case other bits are set. */
>>
>> While more a comment on the earlier patch introducing this wording, it
>> occurred to me only here that this is ambiguous: It can also be read as
>> "Only modify the SSBD bit as long as other bits are set."
>=20
> Hm, no, that's not what I meant. I meant to note that here we are
> careful to only modify the SSBD bit of spec_ctrl, because other bits
> might be used for other purposes.

Right, I understand that's what you mean, and because I understand
the ambiguity also slipped my attention in the earlier patch.

> We can't do:
>=20
> msrs->spec_ctrl.raw =3D SPEC_CTRL_SSBD;
>=20
> But maybe this doesn't require a comment, as it seems to raise more
> questions than answer?

I wouldn't mind if (in the earlier patch) you simply dropped the 2nd
sentence. Or alternatively how about "Also only record the SSBD bit
to return for future reads" or something along these lines?

Jan


