Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A253B52C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 10:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340904.566036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgFi-0000tD-2y; Thu, 02 Jun 2022 08:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340904.566036; Thu, 02 Jun 2022 08:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgFh-0000qz-W0; Thu, 02 Jun 2022 08:32:21 +0000
Received: by outflank-mailman (input) for mailman id 340904;
 Thu, 02 Jun 2022 08:32:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwgFh-0000qt-2j
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 08:32:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83ea4989-e24e-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 10:32:19 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-riDSTDHOOQGVVcQ6PWFMGA-1; Thu, 02 Jun 2022 10:32:17 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5044.eurprd04.prod.outlook.com (2603:10a6:208:c0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 08:32:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 08:32:16 +0000
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
X-Inumbo-ID: 83ea4989-e24e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654158738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbVkT9jt21FrSVa845FeKmjOc7k+AO9S1HY7jKZ1+FY=;
	b=aMmusv6APq41rSTXBnnkx0tLgrQEPjUFJ2ms6F2+Idpj8Ff+m7ofJYjQenVv0k1OP/wtOL
	dc0Yv5gqRd+iHNqeJflsgMif7ReXEcKslv7+/FFGBEp12xgX8FCsGjMio1FLmqnWVybKpT
	4faT7I2VRcphodKtPH81R+XV6MuqOuw=
X-MC-Unique: riDSTDHOOQGVVcQ6PWFMGA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0WtDOQbdmh97KpPpdZ2rh+PwY4JNkw31IjDe+iEUaeKLrL+BLwqEAPUYR8awskSlJWzEe38z1cMrYG6oLXXKtojyAILwlVWxnlRLcAYkCU0E3Ue7TdwNbHQDT2Xpv8cIwEaIkpAAaCsjmfbBF5/qLXS7C7z2sdmmCScn4Mgfe1Sb2F0HuWEuJIrWD3Z+LV+vEnq/R77dzk41lZoYOrndfKFLv2qJo004wnu/tTg9YwjoVV4cffeHn8pH8x0EDTPCXmxT1/SE4QO1FGAmQNmeMymEqc7bzhiORd6aoaMi2+iLoCngt4mUGjj7GOabc+Kk0azzXXW9jSKMvMVEI/Jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYw7DR/++nnzD2xe4Y41/Rg7EXl+Gj32T/ZsfmyxtW8=;
 b=Dpoc9SIYIVY/P6rVgGr2+OyWOGBtOOFNOTXgUdW2WyvCVz+BAS9QN1MupP467QdXisAlXmHrU0ut8ByDf0FJ72MYToIUnxMjHi2jIpjC0pGxV6FAQQe0LJLg7j+Eb6OWj59yhWcrBdrLOPQkmK4h0T46bGXPYu8oLyX4KFJsorFUMz/ErTBEylWo3hUdyj9xtBwkUTyFnbWeEqdeDTzQYGrBY4ahPGI0MnWjSJZfiw70CHaxKH5/r2CuXgFdVvsDrkCnzRAtFRWkCyjFy/ouC6IA6u6sfeRXJYjy0dEQh7JSsGezq8PZd8v4uZWtU96EsVeSK3exnzoDw+ywLmbYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f807d861-5ac6-318b-8faf-17a3b7d85b71@suse.com>
Date: Thu, 2 Jun 2022 10:32:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220523062525.2504290-1-wei.chen@arm.com>
 <20220523062525.2504290-8-wei.chen@arm.com>
 <6003b7a5-63c5-9bd3-03db-a4bac5ba8e00@suse.com>
 <f8674bd2-523f-bf89-2998-6f1176ad97be@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f8674bd2-523f-bf89-2998-6f1176ad97be@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0294.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b247b3f2-fc15-4746-7df6-08da4472661a
X-MS-TrafficTypeDiagnostic: AM0PR04MB5044:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB504436C0A8A6766A56006CD5B3DE9@AM0PR04MB5044.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MkO8UMkIp4FLBPjlfQXKxV9yEn+cE6gvFPdjsEUOEo3j0QIMe0P7N6MCoAmHw09CPR9lUdwza2vhLOk5jnzpUJAyIAaUVB6XWb2Mrky0c6vX/R5AYQX74jL/4UDfnxYpLctRb/yfSJLzU65J7pMoMTWsr9g7blltryoQhFW8o9HHljVD37uDczltGc0NSghAQATAjPvvSLFtSV6SxU/fG8jdZQQCtni+aAGu0gavpGLQ6wJXkijOYoufeLmx+ibBElL7N1JH3fsLweutd5OqSAEpR/fIOnL4L+oefuWZ1Rjepi2RG8qTP4utgKI/p/DsTcVhKo6RVMANAQkXtuSinLDEF1p3t03Uq4iKPtU/xWaRJgwG2ETH8NeztosyKLSbYavpNecOE67TxhwUGuPCoo8iZqeeO1WitVyFaVLsymWYJ6t71J54aYOpd2QHOmc9GaSacoyNwIAImlEUYXuIW+jfDuRnjnUg8FY4Pr9sN0hxdmb91jQoLBhxr3tMT1D8Vxq67WfuOfppUkXQHSm5mDiQS+i0bpjxx71a5rlo0/R/jF5484tPhnv8JegrNoYV21vtF5azioPv4/qog11+lsqnNE3Nx0LdjId7chH7+W7ak/yW/Tfm4sK9PgPpWSBFTGyX6hft+5C5KaLmMCr4ZY0QsiVVAFzIgu/aOA4k7O+Tn8zvPSTIP0R75tu7wevhtKJyhtuFEP6Axj1S8wcme0nLU9IxNd3ElBbkEezTGNwggsxCDDZl3XyX5JNYUkPR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(31696002)(508600001)(38100700002)(83380400001)(86362001)(316002)(54906003)(2616005)(5660300002)(31686004)(8936002)(66946007)(4326008)(66476007)(66556008)(8676002)(2906002)(6666004)(53546011)(26005)(6512007)(6506007)(6486002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y3V9SGfcaULqjHQlaQC9Whvx2hlTFaHltB8j4Hwaj0ncKshalp6l/CUoVcG+?=
 =?us-ascii?Q?KOfoUNmOiE3VinJw0zYBl5j7ZTGJdf+ZbKLQ/hwtHcSsttGNbfQl1zMOCD3k?=
 =?us-ascii?Q?wF0cpFaO3pBJpi1j+CS7HZL6Ccr02QqHbSc6aMvgkQudmwDEGkr1UihrT+lo?=
 =?us-ascii?Q?qzJpMfbo6IubFhVyuGrh3j6pf4wyhKkw5yQLCTUISmzPknS83TdIkHPN+AKG?=
 =?us-ascii?Q?9jzd52ZGLpM+TiQmJjbIW7cwWIgRNMrTaeq7i+AYtiL/oEfLM7Dftfc115xK?=
 =?us-ascii?Q?V5BDCi4r92DutMnejF9VsJd/7Q3F9yacWoB+2eUAAZhbEOSUCLth5iYfvabY?=
 =?us-ascii?Q?kLqAsrQ79G93vYdtM1+UXAUw9z3OmIcDFPOq+af4fJM2/7wKX+vjeszD/bpr?=
 =?us-ascii?Q?Cmca0KY8DSN2fLNxdhDLhx3Nmk0Kv+x7udahpirWQraqXc3HlIAWMWjZ7HJL?=
 =?us-ascii?Q?cECGhlEctONtRlZGO4Qd8g5TSpYuBEO8Dwoi6cBcv7O9Cc4Eyo817nkDUw1r?=
 =?us-ascii?Q?v17f6ba8dFz2ckV933zAH0+Ow0PBSgL+Z7Ke7YNahWILZ88NBbdr/dmpEE5j?=
 =?us-ascii?Q?CIm4tyJDGLRpXRhGt4K3Oa9CMY27kHP0sq81GF3DeBL+NhK3eWAoZT/4lQzS?=
 =?us-ascii?Q?b303HrN65BfmR9iLz9cTYDEGLdRUTtvNvQG8yw6VBXWtAwOiHQehjOeZ1+/3?=
 =?us-ascii?Q?1uaVTa4prFk8AkgfHfGfDakMAc32xM9rmHb0UMRnXTuklufZTeBRKZG4I0O+?=
 =?us-ascii?Q?g9MXApYrFOjcb8LKH8es+yjG8vLP9+oUbERHipCVUa8q4P4gQqbasU+/Je7Z?=
 =?us-ascii?Q?HRRnSgrGwfD8HsAXSxWNjyGxg18msoI6xUhB+zGKrHpTQUGvJ0qmaZOmN6gY?=
 =?us-ascii?Q?W0CXeD07XEG9VtHPhiLryDJgTTVwWsFnosm+/jD1T36+UUTdF1OSdPceQXDp?=
 =?us-ascii?Q?YjCtLKXQc1qvRoGJMtT/2mhCMCfpun5joPUC8+j7QXcS4Z1mMxOmpG5IqoJY?=
 =?us-ascii?Q?sp8SuvwiCTNyVA4dBAfiioOYXq+DatjZNN6cCCp3EsefW5RwIUGuXhzOlRqT?=
 =?us-ascii?Q?g+7zX6TcSht/EdE/pV4DgRHvRTP41XLvApQAB3o7IBlVlZ8dZz220S1QU3Vk?=
 =?us-ascii?Q?gsSqH+Ik5tBXKbZnSMe8Fv1T7hKrGSo6S3K+37WMSndQOlNI5sxer1OjybJz?=
 =?us-ascii?Q?UcA8WPWawf7i0PAbwLAGH9HNuyHqQ3Kj7WyJwqaRjowDRhLZbIu788TS+eI5?=
 =?us-ascii?Q?f/+igfEUGrQR53iy6IvE42V9N6fucA/hefnInsGHIP4wjvGXc+I8KxpkToGe?=
 =?us-ascii?Q?9xKGVc3ZdG+vsgBLid5tNlm26CIn2BjviLtozHKXT9cqYPK6qxttquysMxlK?=
 =?us-ascii?Q?4vNsoadfewOIpxgOtXQ1Eh1BreSdcG9li8Y+so16svCGWtXI1MUXZMJ1VDYu?=
 =?us-ascii?Q?un9OhHLvR2ONJOdeUWOCwCOvHuALRBWXxk8e+fwDdf4Q5FbfndRRtPl5i63g?=
 =?us-ascii?Q?eraxYwdrONkVa0sIOD0jMGkEUWMCRqtZ6FgWe5Aj6z819W0g2SDoIgLREPir?=
 =?us-ascii?Q?gh5A9XIhPcc/+vF/LOfzMwv6IJ/abJMzrqc4wDNaRvU4qbI8cY38T8NkYbyd?=
 =?us-ascii?Q?B8gqaddy7ONssmYx5NZPWWXJkaT2kVX5b4zgRF/oeTFIdsz6XFyT99WYFz8d?=
 =?us-ascii?Q?uNHjtr/qaqMfn+WA2PIf2oPtdVSHvcfPAwAVyy4pP+IXtxEGvavq6TzrtmiY?=
 =?us-ascii?Q?BEVivZE9DA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b247b3f2-fc15-4746-7df6-08da4472661a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 08:32:16.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWJGIHad5ETNzGPFs8H71j7d+wKeEIppWxVoRr1qsILprH7ztyThKogw0y1u30/5LIENZIHEovUnw1PYTvOiaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5044

On 02.06.2022 06:10, Wei Chen wrote:
> Hi Jan,
>=20
> On 2022/5/31 21:21, Jan Beulich wrote:
>> On 23.05.2022 08:25, Wei Chen wrote:
>>> @@ -119,20 +125,45 @@ int valid_numa_range(paddr_t start, paddr_t end, =
nodeid_t node)
>>>   	return 0;
>=20
>>
>> To limit indentation depth, on of the two sides of the conditional can
>> be moved out, by omitting the unnecessary "else". To reduce the diff
>> it may be worthwhile to invert the if() condition, allowing the (then
>> implicit) "else" case to remain (almost) unchanged from the original.
>>
>>> -	} else {
>>> +	}
>>> +
>>> +	case INTERLEAVE:
>>> +	{
>>>   		printk(KERN_ERR
>>> -		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u =
(%"PRIpaddr"-%"PRIpaddr")\n",
>>> -		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
>>> +		       "SRAT=EF=BC=9A PXM %u: (%"PRIpaddr"-%"PRIpaddr") interleaves =
with PXM %u memblk (%"PRIpaddr"-%"PRIpaddr")\n",
>>> +		       node, nd_start, nd_end, node_to_pxm(memblk_nodeid[i]),
>>
>> Hmm, you have PXM in the log message text, but you still pass "node" as
>> first argument.
>>
>> Since you're touching all these messages, could I ask you to convert
>> all ranges to proper mathematical interval representation? I.e.
>> [start,end) here aiui as the end addresses look to be non-inclusive.
>>
>=20
> Sorry, I want to confirm with you about this comment again. Now the=20
> messages look like:
> (XEN) NUMA=EF=BC=9A PXM 0: (0000000080000000-00000008d8000000) interleave=
s...
>=20
> So I want to know, is it [0000000080000000-00000008d8000000) or
> (0000000080000000-00000008d7ffffff) addressed your comment?
> Literally, I think it's case#1?

The former or [0000000080000000-00000008d7ffffff]. Parentheses stand for
exclusive boundaries, while square brackets stand for inclusive ones.

Jan


