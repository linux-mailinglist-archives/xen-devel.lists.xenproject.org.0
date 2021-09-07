Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66973402A2A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181070.328049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbVE-0006se-6v; Tue, 07 Sep 2021 13:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181070.328049; Tue, 07 Sep 2021 13:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbVE-0006pi-37; Tue, 07 Sep 2021 13:51:08 +0000
Received: by outflank-mailman (input) for mailman id 181070;
 Tue, 07 Sep 2021 13:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNbVB-0006pc-PY
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:51:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7256216b-c29c-4c48-85fd-64c86b5c82b2;
 Tue, 07 Sep 2021 13:51:04 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5--Wrg1pWOO-eZLwVB7v2VBw-1;
 Tue, 07 Sep 2021 15:51:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 13:51:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 13:51:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:208:1::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 13:51:00 +0000
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
X-Inumbo-ID: 7256216b-c29c-4c48-85fd-64c86b5c82b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631022663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oD9lEvFvJWfwl3ApFpXACR6rFLHSyvQV5QD0/g24X+M=;
	b=f3PpwEUzXbe7i0ifMyT1QoSD6FlOFZhxEXYtuZj1oZo0KuoUFgu8bdAEyMacqwhk7C0EEI
	7Pvqy0XpErEeZ9LE2GxmYhdybEug1GSLTIt7IPpCePoOb1Dk3NwRDaREmeGWh0H4+6BFuY
	4jaIckJbHyHyb/wYk9D6iQpnBugsNIs=
X-MC-Unique: -Wrg1pWOO-eZLwVB7v2VBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ned0cZd1dBZbzV6j7mc4luj8weeZVsOjB7ioXLV6QW8WAGVNxOa4SXoKB7MYRAVhfZeJIKDiYPIGxYe0OoRUtRoCRlSORf178gxbqgQLqU0zRlozhXsjXem3PEIaAzhBCCfLSkerAenGr1oxE0KpcqODIj5pBqC+fbX+Rv4aTmEf3kq6BBAgz0YWqxb0qzFoB2FYvKqy+99idZ4O677T15CCequP4qSlnmNWvsW6q1aoUsLR8DgYsoUaggEdVxUb8bV0YO6o2N9rJRAmt5abKvzJuNaCEw3SiIvQE+retMTe/UZ17r09o8HCLyq5UEzvJBmgslQDUIObVooQ/4/y5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=12dn3pQY22t0OvIVVptgaOURbegA5BTrCgl17yzHBvQ=;
 b=Q2BxwsHdGemQzr/oBDtl+XiBZgjCpiXxAiQ7A6AdWR9ezJTp3tiEpr8I1hgsnyGwNFgRNocsxkOwfDoUOBwWSQr9cbpfgsZjr72kchN672kJ+AYp0abFihKUApkiLRsKpeeP3m/oUxWexZUlfc8kI/OrMxetayPrKxNS0INKy6a1IyyxP94Usl+J1ixVjbopDUXQX2M1e9qnFKXqYrFPijlAzfXRVBmBajWUL4+wHwcvNS6zoBXiJ1tSbQuADf2GwuqiibhbHLntMTKONv78NsDIYKqriITbq9m8ecVs2/Zfdyf4occ2VcNmGESDR3ZmqUczg8U7gzXEB43tqQHz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 04/11] xsm: apply coding style
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-5-dpsmith@apertussolutions.com>
 <01c81885-9ea0-3ecf-66b0-009b9e7ba39b@citrix.com>
 <ef0d627e-cc1f-4b9a-7695-daa646968c42@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3a9207e-7ab9-5eb9-7488-74bc4203e7a3@suse.com>
Date: Tue, 7 Sep 2021 15:50:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ef0d627e-cc1f-4b9a-7695-daa646968c42@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:208:1::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50a728d6-2f4f-4ea6-097e-08d972068704
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686321243F67DD1C896C0DA3B3D39@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BR23Jgn5+63Wq7KKhHVcnogmEGxKfIemIg7d3RknOCH7AB5Bd6qr/I5OiupuEQcf5M9CvxfvEbjtwP4ZNXt6S975hLHVtTMeq6nyWHEktGCz/D6h2ljw2M/rptDkgX12jdNXmxFg9VASnFouXgOMzgDQS6mZMp8nppkUpVmGwez3bpE236/mw5pFWmX7V4vBxq0eLigQiBqtK6YzzsNGYlyZrL1L4fU27XpcICa5AFC/Oe94HSArFdT2XvLPFN3psi0anXzFl6kpjV29JuJbSL0yyu9/pZENR7bJzeNzl5wcaXbpblYK4IoPZTzoPJZuRN/U81rF1PRSskTJ/qdrfsm/Kb9+A+Xi+NuJu75sdsmFncncTQfUf1Uuew7gOoRo4wrjf8uE2aYnzCYhla6PAMgoIb2DBzmCNCKStyma9lDyiuA+5oXtHweazMVhDcCiGaaX/CRah/hkAZa4HFfv3HeRiJvAhwGRe8KQ/ekb7/GTo8G5v6Yy5m8FZUg36/ixHjiYX28Bcn20/uqjrZC3hKID+yI3khB0t3+zq5LS06M3N+0cUTJHxfMVdDoAeHQMkdBrRmGQFAGFMnAdvchgRs3RuL06NTHhIbYMgK2jWR4QylHULCTh6Q95v1wwnNoIDuBxQ+917gHf5WSiroPQpvVPT/MFqadw3Q+RglBmf63fWvztoeGHuGfvsSVgBaDfkl1FG1Lrm/dOntzdYi6Wi4ou4KilabkYTeNNRwFkf+U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(346002)(366004)(39860400002)(66556008)(31686004)(5660300002)(66946007)(66476007)(38100700002)(478600001)(2906002)(6486002)(6916009)(186003)(8676002)(26005)(31696002)(83380400001)(36756003)(54906003)(8936002)(2616005)(316002)(956004)(86362001)(4326008)(16576012)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VbgZAVlMZQXopuq0YOhPxSVGwvXueUBAt5SVmjJpVgRET6A5vhiXHEZYkTn4?=
 =?us-ascii?Q?YN+ZLMOhDDi3GyaCadVAuEmEkA6MYDZs0bdpcvwL7IZGGl0y82i1Imy3WcQE?=
 =?us-ascii?Q?ndPB6J+VUzyyVp+IoGNRlRQCjQnxcKZuZaj4g7JMWJAUErqjWgNTfBPCJ3R1?=
 =?us-ascii?Q?4kq6Begn2vEQDNpgXtmoIb3tqFLx8nHVp2IWZemwxXji3n05S3l9wiSD3t3X?=
 =?us-ascii?Q?nY+p0rrmsNJM7HEz4mhFIIDAn0rymxe9oBZP8gn8jBuKwnkXYLq514ShN3B9?=
 =?us-ascii?Q?+wNnYMtgbEBSPgEUdMgFhjcfXdpJ6zEVkFzx4EuUEGN1D0cZFLm/YnhbcwEP?=
 =?us-ascii?Q?s6JZ6HqkitphxjT3VatoVfsFnouDkHR9xWy1Iivtd3xzfxOjAiEOJmYxYf0P?=
 =?us-ascii?Q?p7VEkZvJ0gi3FgEnKimwfztOgUJpXnWt3XSR4QECvYhprAKIbjcId/6na3up?=
 =?us-ascii?Q?t34f++8G7ylbgSRYTiFcwC/lsu1cSaWcklak6RMolRy2pP5pkblCiHwZE3hP?=
 =?us-ascii?Q?GN6SYBhPewqeh14y7Xtd68j6K3GYW1K2PFpYQsKWZ1b+woGtpdDmR6Or3gIY?=
 =?us-ascii?Q?bUzz/DG//NoQ0W++xmVnWEgfb3nh9I/fxVbIRyHGoTKAEedkZRPcLzO5noQ9?=
 =?us-ascii?Q?PKXoc4ZSEvupPjnb2xRkHuQ/C+ZpjH6AcDjsPfRwor0f3bFgKYdpUQT/yn08?=
 =?us-ascii?Q?wkJm+6tddC7rHWCj5FdRwAqLTrSqEL3wlxmRLcR1T+iT/WmF5e8ZxnT0d7Bo?=
 =?us-ascii?Q?h31KDxkwsW3IXlOZavMYAq1ys7CTh9CtexCDWNvnb9lOmCi73WkQxpw7uwHd?=
 =?us-ascii?Q?aj/AXSg8/IAjncYRJqzdS103PSoDLLFjiOezYUUZFjasjMzJJpYsTCKKBVAM?=
 =?us-ascii?Q?iN7luGS3FQtfI7/Kb/F5HeLHDR2Q9/1qw38O7P8Lzc9FP3VekNQsbYPmBst5?=
 =?us-ascii?Q?CJkBFuuoYY1tRPGPUHVLBDBWYc9uK9z8I3OyJAwi5htVAGdsQ87GNBstqpM6?=
 =?us-ascii?Q?2e7zTCWDwRRQetK9r59V2/XdvZmWbPRLZkaOomiCo41ZWsUUEctx91bpaeKM?=
 =?us-ascii?Q?FcxSGMj+ML9SJbFxDs3GQoHD9OyUZiNmHVluOpUkunbOUizQu4ulD++EhzGg?=
 =?us-ascii?Q?zN8XoAUSumOkgC3nE7lw7IYl3fPAAoVKecsEyRQVQp6Wpl/iG/cmjrwuyEnU?=
 =?us-ascii?Q?T+9eQA1fw7N39h50tkf1bbTdAIKkCUnMifV5w0FBUNkBMF4L+rmdkYzj7O5k?=
 =?us-ascii?Q?ER/shWt6vaps/Aa6cdluLfT36ER6vJRDub3BL59CmdYNf1uT55OtthjVadeQ?=
 =?us-ascii?Q?o4NTRlcBfZ9U/jc4N5m1oTcH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a728d6-2f4f-4ea6-097e-08d972068704
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:51:01.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVtYRxV+7RVobiCVcg3M4gzyYheJJ9EsKgDiDvnIgGH0S5G5oh/W5GBn8VCCkJM6fmMevcv9ekvSSnHYyfMh4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 07.09.2021 15:41, Daniel P. Smith wrote:
> On 9/6/21 2:17 PM, Andrew Cooper wrote:
>> On 03/09/2021 20:06, Daniel P. Smith wrote:
>>> --- a/xen/include/xsm/dummy.h
>>> +++ b/xen/include/xsm/dummy.h
>>> @@ -69,8 +69,9 @@ void __xsm_action_mismatch_detected(void);
>>>  =20
>>>   #endif /* CONFIG_XSM */
>>>  =20
>>> -static always_inline int xsm_default_action(
>>> -    xsm_default_t action, struct domain *src, struct domain *target)
>>> +static always_inline int xsm_default_action(xsm_default_t action,
>>> +                                            struct domain *src,
>>> +                                            struct domain *target)
>>
>> The old code is correct.=C2=A0 We have plenty of examples of this in Xen=
, and
>> I have been adding new ones when appropriate.
>>
>> It avoids squashing everything on the RHS and ballooning the line count
>> to compensate.=C2=A0 (This isn't a particularly bad example, but we've h=
ad
>> worse cases in the past).
>=20
> Based on the past discussions I understood either is acceptable and find=
=20
> this version much easier to visually parse myself. With that said, if
> the "next line single indent" really is the preferred style by the=20
> maintainers/community, then I can convert all of these over.

I guess neither is the "preferred" style; as Andrew says, both are
acceptable and both are in active use. I guess the rule of thumb is:
The longer what's left of the function name, the more you should
consider the style that you change away from.

Anyway, in the end I guess the request for style adjustments was
mainly to purge bad style, not to convert one acceptable form to
another. Converting the entire file to the same style is of course
fine (for producing a consistent result), but then - as per above -
here it would more likely be the one that in this case was already
there.

Jan


