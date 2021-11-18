Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B94557BD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227231.392949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndOO-0002fU-Ac; Thu, 18 Nov 2021 09:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227231.392949; Thu, 18 Nov 2021 09:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndOO-0002ci-6r; Thu, 18 Nov 2021 09:07:40 +0000
Received: by outflank-mailman (input) for mailman id 227231;
 Thu, 18 Nov 2021 09:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mndOM-0002cQ-NR
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:07:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9b94281-484e-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 10:07:37 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-gETXgr83M-K0NwTFqNP48g-1; Thu, 18 Nov 2021 10:07:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 09:07:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 09:07:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0020.eurprd03.prod.outlook.com (2603:10a6:206:14::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 09:07:34 +0000
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
X-Inumbo-ID: f9b94281-484e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637226457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4bWeNmVqAwW6LErwWdvJs8IfPn5jq2KBv1UVogp6CY=;
	b=XkT/EyH2p3l7OWNxrupH9NA1JJMbm4zNy6+V5HPuJdL94wCuweOOMp3vFr3dHj323YN5Vi
	G1NzqsJF2wcSwzQuQ0HWSxwF74ltmlpae7DXrNMpc0pd7xbxhWypUd0ZpQMy7bORfLZiGT
	hkIAHXJq7NlPygfhEbMUnmMk6O0UJbo=
X-MC-Unique: gETXgr83M-K0NwTFqNP48g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMyq7d48hsBbYFdhfSMpFoZKVDpNBUtVf4fYi4NiHl6fpA446jtxCzQx+jj/ZcsLC/C1ek6iYTANz8OAS3pivo9e5P/SR6Cir+hYsx6T2Rmp0SkdcRsLWe2rcjLil+Clzh7I88ptzfK+Q8nxpjqDEO95EFiCFStJY7xdd1JNecDYx3MvJXla35kyA1ImIRX1jBL/R19p7bd7VNO4cGMPoQjwjYUSxegh2LgY8EpxuETnQ5lZhRYMgDcoqvcYnhJTiS3KMmLrpFuEi15VBvIZGfnGLoMViTrPKOosE3D2LEfTrk+S5hXizz2v5ezAauvVatRYn93lKHudQm+qOa0WlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8xtDLJmzjvodvz6QGmljCHX2yrkP0d2yAIfuv20+EA=;
 b=lSsyK43B08B0neGQ5canwaXv3CwDjmO0MvWCA1vPIWxOpOliJGYH8FrHT/8V41VzFgt6TJhFQVqBchu8YNE1C5WQBOGj2wFy/df3G/UlIE5BAvWLYfy7VoPNsj694PbBZxL7xaS/iQlBemuv587HVB7jOP25DxjnvqaKY6+UtuYqCnRiiQTqm0qmnS8xmOyY/yEBljK1kWI9TATOwgmrEfsHVojGI10dXEoScVCM9w6T57RSkJ8c424p/7IUqk4AxQzV2ujaQ5k7v5DdORL9nRFSJWP/4u4uu2+66cioxViPwF6h6Cp0FCuTGAaxrsWA8mtgeq1i6omjqxtchWzIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <854eea65-1450-a764-638b-2781b463f8e7@suse.com>
Date: Thu, 18 Nov 2021 10:07:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] x86/ioapic: Drop function pointers from
 __ioapic_{read,write}_entry()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-6-andrew.cooper3@citrix.com>
 <e220b6f2-3cb9-e7b0-6b74-4b266e4e7fb6@suse.com>
 <6935bdd8-6b4a-80f6-d134-768dc0d37abe@srcf.net>
 <e16c1767-0e3b-4bac-b07d-05fe6944ae5f@suse.com>
In-Reply-To: <e16c1767-0e3b-4bac-b07d-05fe6944ae5f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0020.eurprd03.prod.outlook.com
 (2603:10a6:206:14::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 576acb53-9802-466e-a59e-08d9aa72dc12
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5903367B6A7300DCDC93F6BEB39B9@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lC6QOmFdL1OweVjCE9pYFNSuruORiVejNURWbphGdLoB4SIugGjd/ecwLW4Y+Tq2MbhLBU5nAnBoAizvGRd9bCEpfN2pWr+gZnzMb6jzY+DkdMCqYv+H3qs/5PFuXgSPCV6eXorFRnLQaltgwvR6kxUQTLoeR9YQG+YqRDLf2mx/qG+y/eaoHWuQiWLjYCDpOKC+61Cr/FRGRn3SPwi0afI05ZMEsXkcHiNE4QK3uZ8sbHLHDXrjdEPjaXNo9tM/ntC346nePb36OA3grMIGlvyrtPyIvfi/qSrPgPkWadapmLMeNZWyCb126BiKtr7eCLAWYck+jzY2sanN7hA5cnJ7P2RP4nlJmstEhnzL/CZxL4FOynQC+hoop/78uWbNLd5VozNne/fI5gp/5avibqXKqYVz/2Jf9ErzcAMMTec3YZrzJNdguXonzuvOncM4tu5qylOJggLffhfYxCLI/nAaactoG5RGUHUM3z2aJHHBgqRWnqtNW26QHKBr2Pp2MfsC3M4lHRqdPtUPO2qDw/vTlM+wJHpktdpetfGXUQi05XreTOAMHVyCtwBl3UoEeKURkWOi1kOKx6VCzCLcJojrFkj4KVgzvymMKNwwaK+hJdxv+ygDrnmL2GNZS/TJzuHxTHOtH3iGLC/C8n7hqYazukr5I6sBWQUcKZCOcMPEqA73m0i8AP9oJasiq2aOLQQidZrb4hnHbQCF+pTNCk40HsSVleYA6jJl1gGLLHdJINjgEAaZB8uVR9dKuwWA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(53546011)(8936002)(54906003)(110136005)(5660300002)(31686004)(316002)(2616005)(31696002)(86362001)(956004)(36756003)(4326008)(16576012)(186003)(2906002)(66556008)(66946007)(508600001)(26005)(6486002)(38100700002)(8676002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UvgzBWZzARs0XRjcFHe/s3eryJNl/IH7GfpkWhDfHmlPTeF/Y5t3yIqZ+odf?=
 =?us-ascii?Q?vHpXmGu8CQGcdn9kUl1+ZrmBPu/CzNZyyt6VGi9grOifcKhe+9MSGlerh4Y/?=
 =?us-ascii?Q?EV2rlYOA1ZU25NxGIMFhfi6cwu/RV2GkutJwv3b93vJloyzGap+1TR0KxOFv?=
 =?us-ascii?Q?yVewox4iQ6O5lbOG7TlsKMIZJwkV+8xFw+UET8lLQknPEGH1o4PmCYluBrKb?=
 =?us-ascii?Q?5MsLrvzvgve9pv7LAJOXWHrO0OpOyijLV2xZz+r4v8mj0sjqAUFxhBehDywl?=
 =?us-ascii?Q?l9roySsymOSjtbmyrouGBrLkt6qMswDi88lWj/onpsBpzQm6kwR7X3c0M5Lq?=
 =?us-ascii?Q?JxzIv3vlK/20U7/fhzmGi+IYuY4B3OTAwp7hddpxT9gOJFO3S+lPvV7ULIAc?=
 =?us-ascii?Q?C5r4HV7gcxqu4+xuvJe0xFigzt7nMA4EPs2+aliBRiOzzjS6ekIQUpyLr1Y4?=
 =?us-ascii?Q?dUF2tSZbD9h9qzb/vS7/j7zKc8b3pxIEhIADxsbsbaVrLFxoHmFoWRgckDCb?=
 =?us-ascii?Q?bXQ78lTTGJ4OPNMTb7B1Z1dYjruvQqj2BLyrw1DUHCLsbyuS6W0f/jkC7DQX?=
 =?us-ascii?Q?dUVBuSW6i5uY6vI3BrxzC8KGi33WwuXUq/EV8lJ/Kp16RxW+EFs20Qdo57yX?=
 =?us-ascii?Q?ken1efZh5QLwG+qVf/IM+NLYFVg8S0fvGUlY2kg05gFwhyy21MpdgWeskRyL?=
 =?us-ascii?Q?hLF05Qf2ucs3XbX8tl9yrp6r9qdzofjZOyZ2lKw4p56r/gzlG99hfD0rQ26r?=
 =?us-ascii?Q?dngyqQHsCo0WIGtM3z1G9xnpIunMcjZ4bLJZnptF2bqO07madwjV4zYTyIva?=
 =?us-ascii?Q?yW+YATmHTZDTPr3JS9Fo5Vv+PXp8xqRCJvNiKGENmCbndPOjCu4Wa6WxHV6E?=
 =?us-ascii?Q?RnEdsGTA2fwcB5ZaWDfAcDlZsrPBoLgQSW7/Cw9AJLP+DhdpAzWR5CJkVUYA?=
 =?us-ascii?Q?lt4RE5Go+5j1uW7vtCmZmOnd9911t01/+JD1nRxc9/0omVQiZieweD7OUCAc?=
 =?us-ascii?Q?vLTtidDv3C81KWUG0gjdhGTAon980Rk+m0VHVrX4XSB6sLe1xtZBXI/L7huT?=
 =?us-ascii?Q?zXdw1tNeUwD4BRnerfz3tZ2vS/STg51+FBICYO8hfJr6eQ3h+OYMiHT8yVFT?=
 =?us-ascii?Q?P7oXHd7tUK2GCMu/C/HL7vB5VpDBJAwxEYvHRKOkuuurfHIigG3xsyUbu7ly?=
 =?us-ascii?Q?AxzoBmHqdDtCxXzd7N5Ij6W20V4Ewm1U/t3gE55OOfafTemMwsKkqne3EMeS?=
 =?us-ascii?Q?R+RAdLZs5BxojiHfmMwynIaSYUTrHR0ZcQ2zzhZI/vCmfkTOk/xU3bmQYFlc?=
 =?us-ascii?Q?hkShaW4k1xw47UpGJK0OOOr9+2QtfZZxdjqHClPcfrSzzJfiIsO7asqn3GI1?=
 =?us-ascii?Q?W0h6gXloVaywYhmq+vG/RjHcYj4uGqGhbvFOyHsWMrhtB/7Ncrbd/10ycJT6?=
 =?us-ascii?Q?R3QAIlyM7SQ0968bs751ZLmPuojPKz0lZXj039mPSWSqPvyLlbBiR9WWExQS?=
 =?us-ascii?Q?EMy4xvlz0QVO4EZLiismsRMNqpUSlDMjd9SKKKkxE4lsBuqWFo6EEmeJCMg7?=
 =?us-ascii?Q?mq6FF7sA30T/zkhBQ27YACqll/usVQpl0FA3UwgghPOErEJi0IuXNkQIvh65?=
 =?us-ascii?Q?NjNBZGPxAWBvWQe7J1pynZo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576acb53-9802-466e-a59e-08d9aa72dc12
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:07:34.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17mIzBScTceJhPFsoaes0AXQUdzCOEw0/clDQD0LnKBCtg7aKsBjgDgEMXlf3ToNYIIQiVle7KiQ0+8T4pp2ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 18.11.2021 10:06, Jan Beulich wrote:
> On 18.11.2021 01:32, Andrew Cooper wrote:
>> On 12/11/2021 10:43, Jan Beulich wrote:
>>> On 11.11.2021 18:57, Andrew Cooper wrote:
>>>> Function pointers are expensive, and the raw parameter is a constant f=
rom all
>>>> callers, meaning that it predicts very well with local branch history.
>>> The code change is fine, but I'm having trouble with "all" here: Both
>>> functions aren't even static, so while callers in io_apic.c may
>>> benefit (perhaps with the exception of ioapic_{read,write}_entry(),
>>> depending on whether the compiler views inlining them as warranted),
>>> I'm in no way convinced this extends to the callers in VT-d code.
>>>
>>> Further ISTR clang being quite a bit less aggressive about inlining,
>>> so the effects might not be quite as good there even for the call
>>> sites in io_apic.c.
>>>
>>> Can you clarify this for me please?
>>
>> The way the compiler lays out the code is unrelated to why this form is=
=20
>> an improvement.
>>
>> Branch history is a function of "the $N most recently taken branches".=
=C2=A0=20
>> This is because "how you got here" is typically relevant to "where you=20
>> should go next".
>>
>> Trivial schemes maintain a shift register of taken / not-taken results.=
=C2=A0=20
>> Less trivial schemes maintain a rolling hash of (src addr, dst addr)=20
>> tuples of all taken branches (direct and indirect).=C2=A0 In both cases,=
 the=20
>> instantaneous branch history is an input into the final prediction, and=
=20
>> is commonly used to select which saturating counter (or bank of=20
>> counters) is used.
>>
>> Consider something like
>>
>> while ( cond )
>> {
>>  =C2=A0=C2=A0=C2=A0 memcpy(dst1, src1, 64);
>>  =C2=A0=C2=A0=C2=A0 memcpy(dst2, src2, 7);
>> }
>>
>> Here, the conditional jump inside memcpy() coping with the tail of the=20
>> copy flips result 50% of the time, which is fiendish to predict for.
>>
>> However, because the branch history differs (by memcpy()'s return=20
>> address which was accumulated by the call instruction), the predictor=20
>> can actually use two different taken/not-taken counters for the two=20
>> different "instances" if the tail jump.=C2=A0 After a few iterations to =
warm=20
>> up, the predictor will get every jump perfect despite the fact that=20
>> memcpy() is a library call and the branches would otherwise alias.
>>
>>
>> Bringing it back to the code in question.=C2=A0 The "raw" parameter is a=
n=20
>> explicit true or false at the top of all call paths leading into these=20
>> functions.=C2=A0 Therefore, an individual branch history has a high=20
>> correlation with said true or false, irrespective of the absolute code=20
>> layout.=C2=A0 As a consequence, the correct result of the prediction is=
=20
>> highly correlated with the branch history, and it will predict=20
>> perfectly[1] after a few times the path has been used.
>=20
> Thanks a lot for the explanation. May I suggest to make this less
> ambiguous in the description, e.g. by saying "the raw parameter is a
> constant at the root of all call trees"?

Oh, forgot to say that then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


