Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DF44A4514
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263041.455587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEV29-0006cJ-9T; Mon, 31 Jan 2022 11:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263041.455587; Mon, 31 Jan 2022 11:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEV29-0006Zs-5a; Mon, 31 Jan 2022 11:39:45 +0000
Received: by outflank-mailman (input) for mailman id 263041;
 Mon, 31 Jan 2022 11:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEV27-0006Zm-Sg
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:39:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b1dd32b-828a-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:39:42 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-hNifCi3-N-2PYzVZ2rk3Rw-1; Mon, 31 Jan 2022 12:39:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0401MB2325.eurprd04.prod.outlook.com (2603:10a6:4:49::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 11:39:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 11:39:38 +0000
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
X-Inumbo-ID: 7b1dd32b-828a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643629182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F0hDx9unIqijJLltZpH74YKrXDepTkbNRfZzErm3eQQ=;
	b=OOj7xAKKvM1fiqCeCrQJVa95kPLgYqsIXhB9INv/vZao6+jj/f/u2IJ7nlL/jLFD4hw9qm
	yhyB21ZACFZWYJim10Yuqovv0ws7D9MaLF5mgoHmhR/tzIEyMLBQESGlnVSYrJdKLf2qnL
	DRMQ40OWGHQdcIiNlQcqQCykpcF0148=
X-MC-Unique: hNifCi3-N-2PYzVZ2rk3Rw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvzz7FEojEpJAXdAdU3YBGgb4kgYC1YLR41RLxo/n1nMB991PBFyjD854Bp1YEcHdUX6B1FWb7EXHy45Z4rFCEjp6yB7YaeZpsYuOfSWOEDb0FSX/XPsWxMTX8gm5azxSm33iOTN9W08wzpuNamQy6mxKwXcF1zqKi/ReJnKlLKxJ2HxlMQbnSq0g+faDJoKjLq8cmGAs0dgfe0KBf9wT0ULb4dIuTuNyw4FPolI6bn8PYg9twKUrBRffvR/4/q7UtCSjoP2i5Lfajgb4SdjUOhqx/KjDGq/jm0c4FWE5EKBCRwTR0woy5vI36naXWZr6PPPn28rXoklciBTsGRldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTu9lvXVsXAJr+sX/VDW3XKNHFN6fLXIPP3D3GqpNfc=;
 b=DfU/DTH4esZ89Kqs+VkkbX7sAzWgmla9TLKJbjUiLC9FvFbsIMLofcngSnL29YB0f66yqysIKCVYIDez473eHhVkhsiuQUiJ9ZlMlTO3UZzZ4Yl6MwKx70E24sxki/CXVcmjoFKZfVqlrj5g99JdFChDmopiN/Sh13LbtXcumvhIeIN4xHLR7WhD4e6JN7jmmyJWFSRRqoapQa6ikHssW+vX13r0PTb4he02Dj7Vq5PgABH/vNdHKvhPMYivz7gson2FX+VgsUyhAzcCk4M+B7Viq42viZBzsXaQwKnnjyp5jL/z4LErfxmQ1tzDJ3MVEfS4AXtbEsWL443IvRNUbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36fe9000-87a8-eefd-9baf-331bf4bbf1ad@suse.com>
Date: Mon, 31 Jan 2022 12:39:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <YffDmW4JGk+iDIVF@Air-de-Roger>
 <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0063.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ce481ff-75bd-4cbe-5b14-08d9e4ae5d06
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2325:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2325E3AA96A9690B205116D9B3259@DB6PR0401MB2325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+H/F9NOjHks4jr0Xsqkc36SwueCq/PnIlWp4G4rUpQUy+tV0Xie46B/4vC7EzMGGQ/7D5hZ5E2BmgpCFtdTUokJxGIJ4kwP+/akOko+ZctNYijr5Sj8ri3PNlni1PdzQfygdNewLD4VCcZ4BLDTDITf/QrFzlpJF2gPpTLrPxPZxieKdh+7yePTyfj4Tk0RQbOyggGCmZHu4E8ChexuqTOEEa3GZ9eZ+N2D9M3WLFLKYf12JJS00JcKaUQNdJvWF9iZXC0f5mWp/J56d/vHHq88CvcoNy9887v2D3cbw/xIpK+xAhvNPM9M8eFNbafrOf/RyKFR9s0MdFl5uJW9prOByzPO9h6iZo5ZOXRmkjU1PCm4xkuoyhCct3qav8OirbYB+AnvsTCX2jEUsHD0oBUOIF64wqlrdgCJW3MmVgxIf0zfkU1/728ioe8FpWkeFHQXtCvTSQ/SfM0axeBb1uY5VcbNsxgH7WAQmk+OfAGUtX01Wb8li1+cOK2aKLMIhXttsyEcUDXahKrgiwIFOfpFzuMs8rSEwPHHeDkQvAAwBBkVel0f7G22IJkwwi2h3EyRxKPovN+dOKpFmsMu7qVp+qf04+oo67GSxtih4ZqGA/gEyYnQofJpJgReV4P2MYPn8vPuxAWbP3ZhMPulm+W9+OghkcTNQCqk3EkhGhJer7oZLi0GCJYk9bSrPMRkE/e1RsHEJV2QWetgfcP0qGi7Ky3RXsr4gu2XhXp/QV2oHEApIMXN1f+Gbu5DKwFYN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(6916009)(54906003)(31696002)(26005)(6512007)(508600001)(186003)(2616005)(7416002)(38100700002)(5660300002)(86362001)(6506007)(31686004)(316002)(66476007)(66556008)(8936002)(66946007)(8676002)(36756003)(53546011)(83380400001)(2906002)(4326008)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T8lddGrBubHX+q8OAeBsXPx3kE0eaFvCfbMPXWoBclIOYOLUDpRaZeVjHdZO?=
 =?us-ascii?Q?rIXiCO8qNUnuQW7cv0r2JIEoL+cHCBjUvxSTFMDgke12ELjpYJ38BJnA+j9e?=
 =?us-ascii?Q?zKS7V4oVGUQaBbWzL/DkIsgo5EOMHbLWvGN/hW8nEjrMAX18LZuF/z5UpPWV?=
 =?us-ascii?Q?wAbClwc/EJSOrD9YNqK9zCcvNO0dvJzu4kc+l1YEeV+soM6pSWkprqwDu+wO?=
 =?us-ascii?Q?7qIbf7bZb+ZaLx0ASuzwQRms5mV62mtvTbGLLOkSSK2wwbt4d5rGPD7Vw6VJ?=
 =?us-ascii?Q?2c0Q9UHDjFYYvYJlaJ7BPZqzzFyQeXU0Vioh+MF/gBayHt+QtbJJlc+1M7vx?=
 =?us-ascii?Q?FS/IyJC3njYUPxgzxPLI/7jUYMQVPsdSVedzVChBVDIwyswtZAHIxrPZnKZk?=
 =?us-ascii?Q?n8JKKebSjjps7yEnZ8GqA639LaZcDRPyqVmsuFxn2QILd8wJ0Pu49UEiP+v4?=
 =?us-ascii?Q?QrW9L8c1/yYdiSzIEYyeWz2k142H4ffgXx8uPTyJLSrFW1/ckLjDHY1/hUjs?=
 =?us-ascii?Q?xCOJdao6Bk6ghQPRu5MVf6P9dcMPwuoe/PUneVsJ6KD2iJP95wLX1JjlJNXc?=
 =?us-ascii?Q?uv7XWm5Fsi7oxM4MBWVk3LIot5zQMX1QGf1s/Zq61lYpZyZ1YWpQCXyTpCEA?=
 =?us-ascii?Q?GGs/p1tSjMpectBkfCJrHmfglDN940CkZ94N8Ca87r44XyhE3/Ba+vQuXre9?=
 =?us-ascii?Q?0G4g6l2TkPbVCZzV/1Etei7PerZlJSE1snOh9VOs7+jb+nYfUFQtj3ZzKuvs?=
 =?us-ascii?Q?onCuLfh/LkFeA4P3zi40HO9CywowKg+oLSPF2dKrLGRn3WQHt822XlDEP55Y?=
 =?us-ascii?Q?nDT9JHshABaBoQ61pZDgcNmr9eo2TC33c9Pf1wG9mlmYchqXCN7Ak03I5XoL?=
 =?us-ascii?Q?DeSpb62ytiZZdjVJvatPEn5K/zG1FwLcgJ91b0PqE9o/GqgQleWxX+lfNf2e?=
 =?us-ascii?Q?/a9CPUXXKyXm1OkPN3+cM/a0ZZFw4R/ygh2Pc/VAWHaznjg2FXdqWxeWfcdR?=
 =?us-ascii?Q?sHHcfZTFCCrqF8lGrBgubcH9Hic4bQySLuqIMmgXa6i0fg8TpT7XD1/pnuMp?=
 =?us-ascii?Q?lZfp2evQCWuX6Wgjx7S90UJcDxapHDomNHDMoBtwQb4FdTSleOk0uMNM7mxV?=
 =?us-ascii?Q?wNTjJIKFhMjvSRNZNRxxdZRqgdjEXnH4Fvr248JCaRl25PDizdqgYsiBFyMR?=
 =?us-ascii?Q?czY/BaKQxHQAcg/nXFfamKFmErr52h6VVBa77KzEDpVJ7NJoLzqG1P0gZcxJ?=
 =?us-ascii?Q?hg70cWmPrxAK47HrpxuvQZoEETknX5Mg616wSYAIwg+2DKnMtmMm6K9YhmKB?=
 =?us-ascii?Q?0cuka1oxNIXUhTU4XNaTsDPQc8CZLv2I5wqh3b7jGg4j2C6AEwtlRd9CAwWA?=
 =?us-ascii?Q?jFmT3Fw5Of8yPkGxJFbsGjuQuYUYQRzLMqiWZWDlKqfzukMLFmiFd2L/45A+?=
 =?us-ascii?Q?gtIBK9A/9htyDSkTqh2AoWxep7Lg8nMTqwDDRFSEY8MFs9BNwiINmJM4hdHr?=
 =?us-ascii?Q?BlZ57zw1GbKZko2d9TPd5jlU1CE4Z1m7s7NSiejQSXTmb5EIbfb6nNBIKctH?=
 =?us-ascii?Q?5wBH+Rvd7MaFSmUK3McxXvCfvNNaVXlmOMYpVgXyNhLwZCqEEOOxjr5G7Vla?=
 =?us-ascii?Q?CvpYcZ7MgXSCjViHfxR7kps=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce481ff-75bd-4cbe-5b14-08d9e4ae5d06
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:39:38.7650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17nxPH/F0XUeFf+IfOpR0Oakwv/dF0Rne68vu+sDgEQDMOewKTOkw6i9KnAwYhVSGa4HZJOOjpxjp0BFlH6Azw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2325

On 31.01.2022 12:23, Oleksandr Andrushchenko wrote:
> On 31.01.22 13:10, Roger Pau Monn=C3=A9 wrote:
>> Right (see my previous reply to this comment). I think it would be
>> easier (and cleaner) if you switched the default behavior regarding
>> unhandled register access for domUs at the start of the series (drop
>> writes, reads returns ~0), and then you won't need to add all those
>> dummy handler to drop writes and return ~0 for reads.
>>
>> It's going to be more work initially as you would need to support
>> passthrough of more registers, but it's the right approach that we
>> need implementation wise.
> While I agree in general, this effectively means that I'll need to provid=
e
> handling for all PCIe registers and capabilities from the very start.
> Otherwise no guest be able to properly initialize a PCI device without th=
at.
> Of course, we may want starting from stubs instead of proper emulation,
> which will direct the access to real HW and later on we add proper emulat=
ion.
> But, again, this is going to be a rather big piece of code where we need
> to explicitly handle every possible capability.

Since the two sub-threads are now about exactly the same topic, I'm
answering here instead of there.

No, you are not going to need to emulate all possible capabilities.
We (or really qemu) don't do this on x86 either. Certain capabilities
may be a must, but not everything. There are also device specific
registers not covered by any capability structures - what to do with
those is even more of a question.

Furthermore for some of the fields justification why access to the
raw hardware value is fine is going to be easy: r/o fields like
vendor and device ID, for example. But every bit you allow direct
access to needs to come with justification.

> At the moment we are not going to claim that vPCI provides all means to
> pass through a PCI device safely with this respect and this is why the fe=
ature
> itself won't even be a tech preview yet. For that reason I think we can s=
till
> have implemented only crucial set of handlers and still allow the rest to
> be read/write directly without emulation.

I think you need to separate what you need for development from what
goes upstream: For dev purposes you can very well invert the policy
from white- to black-listing. But if we accepted the latter into the
main tree, the risk would be there that something gets missed at the
time where the permission model gets changed around.

You could even have a non-default mode operating the way you want it
(along the lines of pciback's permissive mode), allowing you to get
away without needing to carry private patches. Things may also
initially only work in that mode. But the default should be a mode
which is secure (and which perhaps initially offers only very limited
functionality).

> Another question is what needs to be done for vendor specific capabilitie=
s?
> How these are going to be emulated?

By vendor specific code, I'm afraid. Assuming these capabilities
really need exposing in the first place.

Jan


