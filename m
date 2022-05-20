Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF852EC39
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334075.558046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1rZ-0002p6-42; Fri, 20 May 2022 12:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334075.558046; Fri, 20 May 2022 12:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1rZ-0002mX-09; Fri, 20 May 2022 12:36:13 +0000
Received: by outflank-mailman (input) for mailman id 334075;
 Fri, 20 May 2022 12:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns1rX-0002mR-J9
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:36:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6500e20a-d839-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 14:35:56 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2171.outbound.protection.outlook.com [104.47.51.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-Ayefw1dyNmOhXJ8mKmsSNw-1; Fri, 20 May 2022 14:36:07 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9329.eurprd04.prod.outlook.com (2603:10a6:10:36f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Fri, 20 May
 2022 12:36:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 12:36:04 +0000
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
X-Inumbo-ID: 6500e20a-d839-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653050170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUjSjzcVxflSe5HJLiKtUf57+IkleojLi1RQqpbn6CA=;
	b=akWElo77wTW8RUu8SeXtm5ssRYvmhtcl7OL9Di8JbOb8f7ZSpTcq2uDL1CRIu2ZAHFQjjh
	6m6ECNrG6qU8QXdeeYlONz7coo1LHHkHekagchzrUF8Q/HFulB19znnxuAMYx1s1tiUflb
	dC1ViuIsu8nOlGF7Mx9slyCEpcarsH4=
X-MC-Unique: Ayefw1dyNmOhXJ8mKmsSNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK62eiGu79ZD6r9HQFajcCkDJM042fgiS5a6pERVr1DDRvelx8KcACdZQN5K3E/FJw5HE/4zCxYerLuvOI8Oh/W597JFYIYMxj8kiOz7aF6sLGJyLF3N9SJdeJ93/xa6OHeh/YTu84Ra0nnM+eYv1Dunu52XXzWvBcnhe55e6ZD8G2Du8dZ6ID6bE4zpT81vmFtSNKyCvisKyLq7VqgBVIy4kdjQeGcZ89ySaZlLwkdSGU0Np0o12X/QAz9xRf87KfT6WZQ/Z5JsVGYTFu1iE4PBeNQ5rcuU8lPTS5LPwbxwuJDsMjFgB6DnisY1YWMO/ki4sHtvBPbkzjYLQfQwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbYbo1TrIzQ9/2UOFaqOBCVBcDWG3QjtI0iqOqpKkto=;
 b=hSsmUlKMs3DUhzYlPAueAI9iHPZQGUAvg6TZ7Gpb0xJHNtf72bbovXWOoRl3595vr3caX8YYxOFbM2HeyhVnwFQRUAyKAO7YMwcXM6a2tqUIUku8iQdlVGojxTlPaD3y+DwJ7UTGz2sb5/uiboh6Ax4X6Z7ESn+i8TUPqRe23kCnFouxkn9QGANn0zhr8lRlRIsVXqOzyJ8hpPf5u3xN2wcFkXHCvLNdOlk/l5eKe+AaJLhV571o0SqegbNHCJJ7sPCLhR+1aGKgyU8K48XePvxh4lmn8MpLg48zcH9WT8VJJ6j1qC93TyDDDUIdXxI7O7Lwe5iksqDDXljGhG9eGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae722d7b-a958-1927-abfd-43c04bc6b369@suse.com>
Date: Fri, 20 May 2022 14:36:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
 <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
 <Yodx21zhWtZCV2dY@Air-de-Roger>
 <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
 <7163fdba-c128-1226-e1cc-d210c5db06ad@suse.com>
 <YoeH+9eMU0ui68Mn@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoeH+9eMU0ui68Mn@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0168.eurprd04.prod.outlook.com
 (2603:10a6:20b:530::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86b78322-b4e0-43d2-4986-08da3a5d4e60
X-MS-TrafficTypeDiagnostic: DB9PR04MB9329:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB93294EF83196D6449809EE50B3D39@DB9PR04MB9329.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CxRayO9utJqCpUq+4e0DNi0lQTIkfyQbxj0Qu+c6V3L5l3qBsy+0JSBGC94IpcUqECwlVGpBGcs8JewcmpiQFuQzuxJO8Uz8BsuoFaz3KoN35aRSJkO0UkBRU7ubGjgpZPyf3wjccC2WXF5dXsgPqMhb8ZxtCGN6vd3zl6TYon2z4Ba+bJEVJ9lXoaEAhLTfr95q8w9WNKhaHwhFDz2D5GBgxlUSQxdY9DV3befbHN5v84ItHw1x6Uk4C08fa5sndbXbGHj5nYkPP/1PGFUk8cZlsv8fwDiffcMJmJaVTSxP81zoRP3J4CwILB1mEldLn/1Yb7ART7m/iPBEiQdaadvr4UqMw0dTkBiJi+kH+ifQXr9zXvoSGYdthDmUtD8nAXWv6xoXw/ZqrCZRXUds1AZlchOYenXKRSS3vMTo/qiA5QvL55l/m9DDhmkX0lnyd/4iqFMCv4DX1yJF+RIJZLeQl/3OtTcH+KdrmfRu+f+4Qh/nhQsdOI8/XeqsdwZY8P6YNRsqtAuhIBlIQM5oO4PVVDFlpcNsN3tHTkiCRxpx8BZIORPm2NbstNYQ+8pIzu3Z+25AxdK9w8ME6aieO9v2RudwThj7rzqocORKbz9VFWidZQirLwou994fIhif50kYcYsI7mPX4pEQunSmrjGbmyjLbOMroh40JNcidBbkO723jwwhTSRuzk4RXG7tFFpIBFc7QMhGuvz7xZv9ijxXEfoKmFWDTD2UVn83EKPhwlbaYpOcVFfeG7RFcuRZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31686004)(38100700002)(6486002)(186003)(508600001)(54906003)(6506007)(6916009)(26005)(6512007)(2906002)(31696002)(316002)(66946007)(66476007)(8676002)(4326008)(66556008)(83380400001)(86362001)(8936002)(5660300002)(53546011)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q8aUX4qjWUwCAEqeWG3zoTnKudT18tZnkdeD/pwCpj9cR044G+8bk/stc+e0?=
 =?us-ascii?Q?MSHJz2QcI7qBt7/NaIufvN3NUcOMWCcDZ6h426Cv5iXICdQ3Xd7YWl4OKoA7?=
 =?us-ascii?Q?9OuSkBRs6Ega3/sO7VfcjiUCIdKf4BZrnbgdsA3ERESkfKFeopOg5nQIwvA6?=
 =?us-ascii?Q?G0cPdja3CVgegLMbg1RByqsIhx+CWMa89n2CcAogILC2fDAnBTH4VXywNJgW?=
 =?us-ascii?Q?VojAeljw3CcDjZmXyRwnxVu2i5A5+8vpCpeAtaRdPc7hwqRCD4vsKvrzgPk8?=
 =?us-ascii?Q?IK/m+m7Os5h83Np+IRBabybI8GZ8kRmMHVUslrzvZkzHLleAU0C0WfbMVt3a?=
 =?us-ascii?Q?7e1fDBN+TMMRjHpbbMMgcodOl4AQUgPHmDPaEcYzdP6qfgxkrKBaS2BBkHtB?=
 =?us-ascii?Q?iTSM+KXY1PGQfhvFL5FyvQHnoJu3FGiT8QXIIo7UuAtJeoYwUs60Z0OHAVDf?=
 =?us-ascii?Q?VbOnkzsntxuRt/pBQ0Mq2IJfio61szyPG0ykM48Aw4TM+ONR7dEdN970Tbb8?=
 =?us-ascii?Q?k8nE5vNVE5zp0nvtqqg4LlCgIn/st8ezkpxtfDzQymJD0zfxs6MagR52G/+6?=
 =?us-ascii?Q?S2SXljJJj6tveqBMl1jGIhoz5BXltmpB/ipQRUZMXwcfwq9M84Fcs0y93Ubm?=
 =?us-ascii?Q?sHjyJp4+Nbfyp35127nVpwK98Mqg40KMSM//94pK9CCEWwthr1UDFaL8uHX4?=
 =?us-ascii?Q?EjTh/2pvtQ4aK/pv7mBPAKo/gttfAm6n4WU6jTQD9gGGcsiqf/NvvAHZqpCg?=
 =?us-ascii?Q?8Xk3TaO+vLKqQ62nSQpfyKMObTc2vzyi7d3L1vJrIolvwrqwDMN1bNws2GNa?=
 =?us-ascii?Q?qmNknXjcTT8IBQXl4taJCkglvSkjuNA7sGIM6rBKiyLIX056IFR/UZVzUcD8?=
 =?us-ascii?Q?cTRCaRlKe7OJIe0B42ivcnngn0XgNmmFPWHinehIs+9iYCO6T8rvJLxBPcN2?=
 =?us-ascii?Q?z/BKEpajpAOQ701w3v9kktMCDFX2Hyaw+TNSVcXd051RIVbMWcEsrHV1Nmt4?=
 =?us-ascii?Q?4Egh25exj7/k4Hb/WXtpi6O46QSyTOd9AqLkKD9uKCM25FPESuKmszmT1mnv?=
 =?us-ascii?Q?t67f60oSmuu7mQb1svmqnMNJhGco2T+rhTM+T3OAcpB6jfVwlZl4NkiP8FFy?=
 =?us-ascii?Q?Avnr/SAdd1r/8LTRPFmtDbX3OAhCc4sSr7tUN8UQ1RvWiP3OvcveS67JADFB?=
 =?us-ascii?Q?/CrwIZ7CKESjsozfCCL89WlAJoZXmuqb/r+MQtWfAY8o0CL880Jhwl2TYDlF?=
 =?us-ascii?Q?kjEA8Ji2mq2Fmpy/b80zTs8zO76HjvXvHkpgBJGPolEg0qMlnlRD6qnvfMEO?=
 =?us-ascii?Q?s0abzvtjo5gSB7qKHWlL46u+xzts5XEYBcKoDTYQRcm1wj1b6QErIQ+bpNjb?=
 =?us-ascii?Q?EdhWmQ56JClnWJdhnmI3kT++k66j2ycQYVxIQW0wLggHHbLD7B4sj7NYkcfF?=
 =?us-ascii?Q?BMMC+9LO5HLM41pvYFkQQitoBd4ZLqveuNBJLqhTjkcMQMEUWO2onpWeTdj7?=
 =?us-ascii?Q?ANBU9soYfmbi6OFzIrplSayRa0pk2M/tif/zfuHejZiWpU2jdu6OIbHu63A7?=
 =?us-ascii?Q?E0O0cM9XhRR/rEdrIayish6WpUGb5tmWo+0isNU9HC3AKJ2GcV9d7rpxxKDO?=
 =?us-ascii?Q?nbJ4YsYrjc4pm56wGTP981wPA3TuYqBqKTYpwExxSZHdbJSbpnQC9uJRdiro?=
 =?us-ascii?Q?8Bf+OKp1LKt2uFYd1HXiOCSQy6sM2LJAlbyHsynHM0njxuroNi7FbiTGI5bT?=
 =?us-ascii?Q?6rpar9eHgg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b78322-b4e0-43d2-4986-08da3a5d4e60
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 12:36:04.9055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LieC0Y8UUkqN69fgVlfn8goB9gD7VObzjl63dSn/pO2Rc9LdSl2F9M0sdV7TnuY3nVjj+Z+HtuPXkx/0tV55hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9329

On 20.05.2022 14:22, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 20, 2022 at 01:13:28PM +0200, Jan Beulich wrote:
>> On 20.05.2022 13:11, Jan Beulich wrote:
>>> On 20.05.2022 12:47, Roger Pau Monn=C3=A9 wrote:
>>>> On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
>>>>> On 06.05.2022 13:16, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
>>>>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>>>>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>>>>>>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
>>>>>>> =20
>>>>>>>      while ( nr_ptes-- )
>>>>>>>      {
>>>>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>>>>>>> +        ASSERT(!pde->next_level);
>>>>>>> +        ASSERT(!pde->u);
>>>>>>> +
>>>>>>> +        if ( pde > table )
>>>>>>> +            ASSERT(pde->ign0 =3D=3D find_first_set_bit(pde - table=
));
>>>>>>> +        else
>>>>>>> +            ASSERT(pde->ign0 =3D=3D PAGE_SHIFT - 3);
>>>>>>
>>>>>> I think PAGETABLE_ORDER would be clearer here.
>>>>>
>>>>> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used any=
where
>>>>> in IOMMU code afaics.
>>>>
>>>> Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm not
>>>> sure what's the rule for declaring that PAGE_SHIFT is fine to use in
>>>> IOMMU code  but not PAGETABLE_ORDER.
>>>
>>> Hmm, yes and no. But for consistency with other IOMMU code I may want
>>> to switch to PAGE_SHIFT_4K.
>>
>> Except that, with the plan to re-use pt_update_contig_markers() for CPU-
>> side re-coalescing, there I'd prefer to stick to PAGE_SHIFT.
>=20
> Then can PAGETABLE_ORDER be used instead of PAGE_SHIFT - 3?

pt_update_contig_markers() isn't IOMMU code; since I've said I'd switch
to PAGE_SHIFT_4K in IOMMU code I'm having a hard time seeing how I could
at the same time start using PAGETABLE_ORDER there.

What I maybe could do is use PTE_PER_TABLE_SHIFT in AMD code and
LEVEL_STRIDE in VT-d one. Yet I'm not sure that would be fully correct/
consistent, ...

> IMO it makes the code quite easier to understand.

... or in fact helping readability.

Jan


