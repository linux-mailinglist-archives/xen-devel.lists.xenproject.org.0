Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1E24F14B4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 14:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298308.508132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbLkr-0005P4-BV; Mon, 04 Apr 2022 12:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298308.508132; Mon, 04 Apr 2022 12:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbLkr-0005MC-8T; Mon, 04 Apr 2022 12:24:21 +0000
Received: by outflank-mailman (input) for mailman id 298308;
 Mon, 04 Apr 2022 12:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbLkp-0005M6-D1
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 12:24:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24cd6949-b412-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 14:24:16 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-FBN4-9o8N3KyuFmjP7A75A-1; Mon, 04 Apr 2022 14:24:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3901.eurprd04.prod.outlook.com (2603:10a6:803:18::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 12:24:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:24:14 +0000
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
X-Inumbo-ID: 24cd6949-b412-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649075056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjMnPwZ7m8IZ+ecuoW6woJMJGp6qfOFF3ydUULjBm7s=;
	b=Nafu83mRl8juRIT4EM0VFlFpyQD5kK3hiYEH9yCADI7qLi1jIa3wX2AgPGz5AIRRrOzfnl
	PJZ353JwYKdwqQhWOWTAAsmfk1ezw3TDAbWMYagVLG9wLFCzcoOnWg+9fbBp3Iru4Qki6S
	xdDEPUeCijNqw+JDMapI4Jpk/oEZyec=
X-MC-Unique: FBN4-9o8N3KyuFmjP7A75A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBZK3+VkR7eK817BA8XKvu2vp1d8TW357VrZdnNy5fDM15ZpqyruST3PUgTd4yR9hyBm24yTfmCPR7adcpU50cEw1g/pBZw5NVZc+8y2GZAqPJIYHZoykO5njMKXrwFe1oiiJDhpqAwJqWCQaurzb2CBUU5F4S/qR1WolU53p3KlHec/3koiUALtnCrgK7PNglInnmVZrhGJXUMn9RW6kEwbMJaR/pzCl6TFVPLUb8Sx2m+da5vIX5115YUjp0diHS1MUlXHlVYXuRcoITVXV3+hp0/624kIdoXSTpdU4et4rwWpnixydQ1GpyzxV0wtXVJCfxLTTm91qaURQeyA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sxm8HqgC8PexNqelQlzfhshAZSS8Xd130eZQG9yoWY4=;
 b=F3JiEvNaSxwYIiS/dL5szzstaYY++fjwJswEzXz4lgxvevNd2xY+Z1pgZqJO06yPINFwlDesvWzwDCcsvM6spm5JvqYT+DUuHrBwdrUYtU08ofXI2B4G9ii1u425mObouHSLwzQ6Zym77CguprUmBp1zK8+Isgm6hCg16eTeskWiX5UMZPbZS1JoZZaeKLA9wkwpFhHVnMWT4wSx1DVO6yMSumpSTB/UjYHlCXZV6b1XttMDv7G2L8IHPXzfJ2d7xoHBb6eDzq2FS5LMM/cccK9CYol8X7b91DHCDxA1s2T21TTqDXhZlPmCpfIY6+1wGdRJn9kcnhXmT716mo6+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42795f0b-0fe7-0bb3-a4a4-fe4da986e889@suse.com>
Date: Mon, 4 Apr 2022 14:24:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, scott.davis@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
 <90fd48a1-446b-fb7d-a732-d2c1ede0921b@xen.org>
 <Ykqnj/7gEc8Omsvr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ykqnj/7gEc8Omsvr@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0300.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d238148-4fdc-424e-edb5-08da163607aa
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3901:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB390138A51D867A738BBC1C97B3E59@VI1PR0402MB3901.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K7e5Bl5XXWnhreij3CPDoNrBwfAKj3LJdjNPI7QUq32cN8m83YJfjbEJlEuaR21Crne4AGOs/wGOlyjL14AIsckPm+O49A76U3UT2/gpauUv88I5aMkKpGwEW81IrJQ5aBH5VxVXBEzZxXcM5Qr1vQ0My7vxo2jBqo1Y6eZ5LnS+0rZL/6pwcT9cdmDxYI8vBM43k0wHM2ozyOQA3d35RIdYdIpFS/qoOQC7UcL4BbWSNXfUNXWsSuc1wOw1dtwH7Mw3La0s0eYpTb/HfM4/8Gvq27IrP+SRvwV5rEHV80Y/tYg5kdUVU0guSPkdHeI7dHeiCVRuoQF50agExi/Y1Fh0I1RvRdh1WpwN9YzQSvXdx3AryCOtzLwxkoYWJ3gAhnJpfivq4t2msZJ0ssJ3e8UC+nbAVPS3Cvdc+5AmLgn0fEWRC1Mf0siK4A1UmERlbdUF/olGFwlKW62BJY3FhCzBBcKK5OZ8W0ObHb0MTpaX1fIkAVxJGHc9tpuDNaVTgZVtx8y06T2Ccm/pQE161eT26zm0Bop7S2HZtsfOulJYP9/0WoAdRjjVugRFMzhBNMCbPlZb1Mg6z5lAOUizJ/OjkSPiToYczednIi97Qrxn1DuDGEj9KQAeh1tHYicMDQsQbGjQ71LOCW3tXSgbveZlhifTgzS5o1DxYn/mKzqGC3YPJLI2wdQZXrePiG62Xi3SAjvT9/j7AqzF5V8zn2AzUuBRLfgACqcjxBECtoc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(4326008)(54906003)(8676002)(5660300002)(6512007)(110136005)(31686004)(6506007)(6486002)(316002)(508600001)(83380400001)(66556008)(186003)(26005)(53546011)(36756003)(66946007)(38100700002)(2616005)(86362001)(31696002)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7KvcJ+j/yt79A6yPn5mXbA4bIlWi2RrcBEyNbHTAd9k8uYibya51tvSRIHO0?=
 =?us-ascii?Q?wGjYyVAdoPe5n/JEX47v+QNm1vjfBDV9eujjmrmENPVnNUOusHXdJxU7MOia?=
 =?us-ascii?Q?jRIxsyeeb4LHQ9ZuPEZ+uKNK664/N6aifdyA9PxzwTH1p8ObQIlQbUdHIWep?=
 =?us-ascii?Q?XbnWq3+DpSiTThv6OuGC2IG65jjtxDKT2vnZtMlueoSjUkFMlLFSf3KVwnVa?=
 =?us-ascii?Q?mw7H3W2JUw5O19u4xUC+76uUnT9Xexak6rq4L1VJRylkmKdyu7HI/0ot2X/k?=
 =?us-ascii?Q?E68ay5kTbLZ11CC7+wzi9NlU5nzoaL3eZgMGKBUlPcvTu1sUhYJHQFuz/UNK?=
 =?us-ascii?Q?ouHXgRCpjZQHkemscNAZ/71DwCV/3MeLGVG3CuKg9vxzfW1pocrZ6gNre+3J?=
 =?us-ascii?Q?arzZqoAinRxc8DZ7v7LKmlrYNbq8UvAUbZdLDCLyCG6vmAKKaRAIjoOea1rN?=
 =?us-ascii?Q?Mrf28UOEX+4XCAnfadSjTRX32fqul1oOulnDXPawprbJklmJPIyiMoetRNg4?=
 =?us-ascii?Q?kk/kkgx16mRF5Ffe8Tcp3LwFJnmmt8QWgzWs83Dpeen3iB4YNt1+g/9e3A9u?=
 =?us-ascii?Q?g4/CNDt7uP2DzUsIIpmuyc5aRedspKzN3+32vOm/GUZy6ppFNpJF0y92riVk?=
 =?us-ascii?Q?Fp87lxIhqE03DY0NQrMyHObv0MDqqTCzrJkoFHQRav7l6zQJb57Rq12NcnjP?=
 =?us-ascii?Q?K1tR/2Zck+YY3LcWqcnr/mqXrflX3NaZohjqAPh9LLm/T008ca6kBThfFUvq?=
 =?us-ascii?Q?+W0brMEeqyTknRVCoA/L4w6HGY9s5xMN0pFB0buIi/m0g1rttQsY/+ELU3fg?=
 =?us-ascii?Q?Dlwo2xynjmDELcQX0f4Fzaj1OppsizN1SPI2471Joz2jDDTImgVrxVwNTGUX?=
 =?us-ascii?Q?538V7kod6TC1moBLoq1e+7oXgw1iSN8T7xJqM0RU8RKhT2IwhWGsctp8YYBz?=
 =?us-ascii?Q?0+4VkcvS4WjuTGA1oYnMZynJL/kcDnJZvVA2oryN3DopQ7brLr6e85f5GaBo?=
 =?us-ascii?Q?kyxJKYjH/IV5E1fTUX1u3jMubtGpLCzkt8Y9vpdnr90fLRlH5aDBvZ/wWywW?=
 =?us-ascii?Q?xqrm85aBFg6jG0YzDNHv36F5GTcKbbvB4ZcnzlHFieMGgsMQ9Xb+4V7phzW5?=
 =?us-ascii?Q?Wp/OL0LFpw/RDFhS375/pegcsoqPL8WzCCVeaPP5PthZfHHlNtQrpRNPlWIl?=
 =?us-ascii?Q?izDTsNu2erW7PXuUZBMZwhOvAseQJs5zeL3ppAFlm2MRSX9ktumyxEXtFjLJ?=
 =?us-ascii?Q?Sq8K8yHtD+Gj64EBsv25/iQZUDaepTJzs7zOR4Q/N/uqkmjF7SYHClPpf4qR?=
 =?us-ascii?Q?4y9m2H491NM5klN4XQuJaZtzH2CDiBOcq4Z0CjrhF++UfVVlq5jvZZ41PweT?=
 =?us-ascii?Q?B/qVRy3gD5JkT62M2rjOUsYvPjCnf2BPM4XUTqkiA83EW9fDGwoJdHi47wqR?=
 =?us-ascii?Q?Z/wtPwtd7nZZK46UZeOEGBUbehq4ExP0vzfv6Cf+Dt2TLGnq7GEMMf7dzWo0?=
 =?us-ascii?Q?zq9QHW0d73NjiLOK/WXIZJ5MDu5zKDpWHH8bDGKPKS4iIp3j/OpEnzcx19Cy?=
 =?us-ascii?Q?XcDWe0bP2pW+prIvNm+uDezpfGNWrl+ufoKGcgIwnumPFnvmn573r7qY0ciU?=
 =?us-ascii?Q?wxHF6Qg6taPMrc/X/qKeReveRfzDf9M8rpjc0t6vNZhQmrPIt1ggaMFvco3l?=
 =?us-ascii?Q?yWR+jpzA4U/MDCQKs1jPrfV2K4E5Ggc3RmDoagDjJc/renPZTVLBnUX2Qmcb?=
 =?us-ascii?Q?I4780Hmcyw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d238148-4fdc-424e-edb5-08da163607aa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 12:24:14.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5l0AjwJ/umrk8JmNWW/NoMH+v5qm2ZfsuHM3ULTZXh7bRnlru9LbQOYkA5PgelWLL5Ru5FHInc4Zz5rWXkoag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3901

On 04.04.2022 10:08, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 01, 2022 at 06:52:46PM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 31/03/2022 13:36, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
>>>> There are now instances where internal hypervisor logic needs to make =
resource
>>>> allocation calls that are protected by XSM checks. The internal hyperv=
isor logic
>>>> is represented a number of system domains which by designed are repres=
ented by
>>>> non-privileged struct domain instances. To enable these logic blocks t=
o
>>>> function correctly but in a controlled manner, this commit introduces =
a pair
>>>> of privilege escalation and demotion functions that will make a system=
 domain
>>>> privileged and then remove that privilege.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>>   xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
>>>
>>> I'm not sure this needs to be in xsm code, AFAICT it could live in a
>>> more generic file.
>>>
>>>>   1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>>>> index e22d6160b5..157e57151e 100644
>>>> --- a/xen/include/xsm/xsm.h
>>>> +++ b/xen/include/xsm/xsm.h
>>>> @@ -189,6 +189,28 @@ struct xsm_operations {
>>>>   #endif
>>>>   };
>>>> +static always_inline int xsm_elevate_priv(struct domain *d)
>>>
>>> I don't think it needs to be always_inline, using just inline would be
>>> fine IMO.
>>>
>>> Also this needs to be __init.
>>
>> Hmmm.... I thought adding __init on function defined in header was
>> pointless. In particular, if the compiler decides to inline it.
>=20
> Indeed, I didn't realize, thanks for pointing this out.

The question isn't header or not, but declaration or definition.
Attributes like this one are meaningless on declarations (at least
on all the arches we care about; there may be subtleties), but
meaningful for definitions. Iirc even with always_inline the
compiler may find reasons why a function cannot be inlined, and
hence the intended section should be specified. Plus such an
annotation serves a documentation purpose.

Jan


