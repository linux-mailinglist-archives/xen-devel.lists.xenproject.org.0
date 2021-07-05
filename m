Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50543BB8AA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149889.277222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JmR-00052q-An; Mon, 05 Jul 2021 08:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149889.277222; Mon, 05 Jul 2021 08:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JmR-000503-6s; Mon, 05 Jul 2021 08:16:39 +0000
Received: by outflank-mailman (input) for mailman id 149889;
 Mon, 05 Jul 2021 08:16:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0JmP-0004zv-O0
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:16:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 696cd4ad-1918-44cc-999e-e09b143261ec;
 Mon, 05 Jul 2021 08:16:36 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-sgVTTz8FNU2OOCCQhsMMZw-1; Mon, 05 Jul 2021 10:16:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 08:16:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:16:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.7 via Frontend Transport; Mon, 5 Jul 2021 08:16:32 +0000
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
X-Inumbo-ID: 696cd4ad-1918-44cc-999e-e09b143261ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625472995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4bKf5hBbXgEo6a5rVtd54OMqS2mdJQCMJAA/Bq7mGw=;
	b=HFzJL0U9e6VY9li11eMf0BfssvFw/iCWpMWwP5QJ2kaL8nYxVqhBM6zfrfOQOf0LUQldl5
	Wh4mIAzRaQJ0L05QsklxbouwyOWzUNr2zph7tMg9iUiBrcy8i1t16bw7HZurzJ3k0bz4fP
	fxNdHI/penldpnmFSj4eQGHbUI5J/AM=
X-MC-Unique: sgVTTz8FNU2OOCCQhsMMZw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8OuvjGo2WBn4reXFgbCk9ESC1683XMZTjE0OYuPvlvEh/xhsjdhKixQR0IG4lP7REOPb0ZVRa3KRqmqMhts88JyvPG81bactes/x6oaXwtVr1DgNTlV0fbHFbE4eJCay+Wd3YyKRuaTGtMJuAjfhuzCqJ8yzJokPh7ui/xOt9D+cHNmj+nh7C9EoSnuT1kvoysxqO1gYNaLzxel5AqOciBEn1AWWVFvn+HNnNycwvMxIYzryvt4GXevuyqUF+yPfePYRxRsDpaAM2BsjbI2uwB+GDpahiNsdmvICwtLXNAA5nzlnRS+lv7PXR4IhkLxzxHAGk6OUSQqiACUkOHU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9CNVMBAy2PKdkWdmPmAm2tOflzPZitdmZ52sv7Jn/M=;
 b=jy4Aw4JyCOzNuTFx4U0n8MYDpGG6gN8ujwa2x1vkHHqAqw+8L6Hh9GaH0fhqNLUar0KhzIVe7JN393iyGQURuNeOWPH53MHeN0d14tiPLAuYz0PotF/tO3yRSuWEgE6cPh5c9s2hHDkGe+5A3IGDq4HFm1oFYtkTp8ZQt21sviqxakOiyvgqN+Dd24Tm3+MXHkPmXGkTC+6JnfiDh72i2rvJOKuiQ2xJp6Pk8CSW3J/oCVfznv/u6j1v2LnEQvjQygH99FJqewCqZ+wjBvzHjJy+P675HHkp6h2U88INVkJlekTSDD+Lb2mtofF+mCjv5A1/urRAzExNq666ylwMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] xen/Makefile: drop -Werror
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
CC: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210702170602.890817-1-fontaine.fabrice@gmail.com>
 <b920b793-734a-5f1f-6c4c-0d31ed27d01c@citrix.com>
 <CAPi7W81h=81ztVG6X0kh0+KEn9ryxAwXtK7-BWxonrXLJBZXaw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f56c54db-d3b9-33b0-2c8b-6ee9098e633d@suse.com>
Date: Mon, 5 Jul 2021 10:16:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAPi7W81h=81ztVG6X0kh0+KEn9ryxAwXtK7-BWxonrXLJBZXaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 391d14e2-f72d-4c2c-b6e1-08d93f8d330a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32954A82A9308C0445ECB4F4B31C9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	am+6zSCHFwha9591gd5o+rObWULFTHXg4CUFMr+iUMzGC5aYpsmHDyzyZ6lkv4rT4qPddfvYayQVTvvlZGGPhlS6+cziD8ykJw+wXAkCERwqtMZ+rut6NN4wktNkwMJpQNWp2lQPKt592t3bfZOEhUdM0QM4G8lSdZQ7jGyF2v0/NauPZ7vpc0tXrXMSeGjkDGZauH6jb6g5S+oyilh3OB/227YMGMkT1A8F4EYnekglKiU2ZxhxzpuxP3WGQ4jkXPLqMOQHcdEOSBvkvCVFEalcxf3rZYLv/upXq/USSR5HSJJMPcZFjMlqgPcWimzMT2DkDulbdim3N8fRJAsGuV327a/Q8elRf/nv7aeFvcqY/PWnEp2JvdNQNfFoy2BY+Gvv9K/gtOkHobn0FefhFaoVFUotXKvJygVVny/0edW0fowplHpiSAx9rE1/1cOwFfBEtjFqQjO//edbNqVm85r7uEE/nSJgS93xUhwJoYd4TrtrV+cIz/5v2xES1EFuqNn6xGT+HkLRAVqqr8FyErZyGf9n2vLmUGZGJmtTv555vcMnPEUTzbKDI8BgnHlB1JbIZ6QjXXIGbHfrURubE2QztXkRh80rHeaBSNuinK/E7ar1oJintXnLTovBuPSNhsxPfgwyua6NONL+va8QJmrNnpXyIRDLXU2hc/2LuWumkwEg2lPe/An9gmSw6W2POqcdi0Yzpke4pbftbDDNrjVXBTsSlN/tJahxGKizRGNArFGiEyIbR8F0x39tn7soiNbHAXt8LCesZ/dkhXvPJfgPulUG2p6vr7EnU7MztOIcWHlQ1yUoku3JAC2iRXTe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(376002)(346002)(366004)(136003)(66946007)(66476007)(66556008)(66574015)(956004)(53546011)(2616005)(83380400001)(38100700002)(966005)(86362001)(6486002)(8676002)(4326008)(478600001)(2906002)(31696002)(26005)(31686004)(36756003)(316002)(8936002)(6916009)(5660300002)(16526019)(186003)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3euCP8dflLixAMhamcGdQFxH1QN86a9W7IKADArUDOCeh82bQ45TYST8RT+C?=
 =?us-ascii?Q?urAa010GFF0CDNvHK+Up8RQfdBpXdRZmwKMnKL6RACxXB4W4C+br3P8aRCUG?=
 =?us-ascii?Q?pBAOGBdGxYKjNvH7wuJ64DDP7fbO3hVAlQE6wQ+D2AwpSve1CTKxE3tORd8e?=
 =?us-ascii?Q?iTrfHNGD0mi7WJK0lduSGPDWJ5HzkHTOFvBi0CrbRrXDMvxRzqjLIEK40aro?=
 =?us-ascii?Q?HH635AaKtsghJJ6sfPXdFYtrjD7tZglqujaOMEFB4c/aAlUIUq2REq/CVpHZ?=
 =?us-ascii?Q?/F+7ct1CXxtqEBw0b3h3v16SSpaHANPRaq6d6Fu94PM/FIJrlaSLoTX1UfZv?=
 =?us-ascii?Q?M/RmIv1LKCShU2+UL/YPytvnDz9aG1NBnosX5ID5RXudb9I/x97NC1KBGBB6?=
 =?us-ascii?Q?bc60AstpcBXcqCjjVWy4tslSaNxyCXxofDKDpFx+dw+DdEOmI5ntfY8+2Hi/?=
 =?us-ascii?Q?s9+7et0T2zs8nd3/OxA164AI2DKdWLW0p+UXGM60ULyfKqerT/NblBrBvUJw?=
 =?us-ascii?Q?w2c2ROVDzGt2dhnm8m35G7t1XuU//MdhPV52h4/UiM1do1MNaM1yP4O6OeGP?=
 =?us-ascii?Q?PM03346leNxmVzNB3rZO1wjSfhXTMqt9fMAjCMl7XgJE3s9yjEK/WqRjGf/i?=
 =?us-ascii?Q?k6PC4I2MbTFSzGemzTZe9+8iQPm7+MsFbJ1TH7t4iMDiUlUDEvjfbLo3rE8W?=
 =?us-ascii?Q?4AWK9t9Qc0bDYoZOq5WqD7uWaDR8d/yDprV5IUa+G4BIuCFw1/SURp3huhaZ?=
 =?us-ascii?Q?zQKrjadMtTTOYHWU+OIxq0B3/JpvQ6vLuf0UrsmZ2x3Qo1mOA3y2G/4O+Wl4?=
 =?us-ascii?Q?z6KN8a5j4u6GFSLZSWZrnSZ0kPqWFVt8rJ8Rr0cUmITWDZYUTX1y4wz3riz3?=
 =?us-ascii?Q?EI9b/L5s1JwgiaXe1k0yLLRa7YDA+9aPcfInuDZ+taTwH3GnJICSFOETrZLG?=
 =?us-ascii?Q?FAG6aR7r74jfh7a/6+hdXSPiYNq3DBBTXgsIGV96bKJRKw0HTn69EULq6fJr?=
 =?us-ascii?Q?A7kPj3tG7cyX896xzQV0fLcoQTYoC+z3kzJlspqjkANc/RCLd9URiEt0rfu3?=
 =?us-ascii?Q?MMg5nRybOCOBtTww+0HrtRVMouxFRUQH/JIWz8HQw1QmE8+NnPI+imM2Qzbp?=
 =?us-ascii?Q?2zNVu+RyXg87yEPSHVOkj+8u+Xx3nso70R85AwzEXabJlwh6/dZLPgonriC9?=
 =?us-ascii?Q?xiYo3KQzLSbMvxAf00V2Fwi3Cf4sW0XG974tjuifWszKNP49WpwmmMqm2JOM?=
 =?us-ascii?Q?TcL98SVjXTOvK+qjkb9dQiIO3zPJUYPMZwUR8RRgl5UMNKSAxirRAtD/DLtx?=
 =?us-ascii?Q?y/CtMJQ57PTLs/TDy7Sdu9LX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391d14e2-f72d-4c2c-b6e1-08d93f8d330a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:16:33.0583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uae/tD/rspd66FK2AmluqWm03eFdXcww89PzMI6MnWWX8pOwtRZRL8iX0GCorQ/FCFP+mvmkR7WCidz+bwD/ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 02.07.2021 19:51, Fabrice Fontaine wrote:
> Le ven. 2 juil. 2021 =C3=A0 19:34, Andrew Cooper
> <andrew.cooper3@citrix.com> a =C3=A9crit :
>>
>> On 02/07/2021 18:06, Fabrice Fontaine wrote:
>>> Drop -Werror to avoid the following build failure with -DNDEBUG:
>>>
>>> In file included from <command-line>:0:0:
>>> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/xen=
-4.14.2/xen/include/xen/config.h:94:0: error: "NDEBUG" redefined [-Werror]
>>>  #define NDEBUG
>>>
>>> <command-line>:0:0: note: this is the location of the previous definiti=
on
>>>
>>> Fixes:
>>>  - http://autobuild.buildroot.org/results/66573ad0abc4244c0dfeac8b684a7=
bfcc31c0d4d
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>
>> For better or worse, It is Xen's policy that -Werror will remain.  95%
>> of the time, it is the right thing.  We will however build failures
>> whenever they crop up.
>>
>> This one is weird though.  How is NDEBUG getting in twice?  What does
>> the rest of this build environment look like?
> NDEBUG is added by buildroot in the command line if the user sets
> BR2_ENABLE_RUNTIME_DEBUG to false since
> https://git.buildroot.net/buildroot/commit/?id=3D5a8c50fe05afacc3cbe8e734=
7e238da9f242fab0

I suppose the build environment setting is really intended for user mode
code. I question its applicability to the building of kernels or
hypervisors, but I can see that opinions may vary here. If we wanted to
honor a pre-existing NDEBUG, how about simply making xen/config.h have

#if !defined(CONFIG_DEBUG) && !defined(NDEBUG)
#define NDEBUG
#endif

? This then raises the question though how an external environment could
achieve the opposite effect of suppressing NDEBUG's definition despite
CONFIG_DEBUG being set. (The main point - hence my view expressed above -
is that we switched to Kconfig to centralize where settings get
established, moving away from taking ones from environment or make
command line.)

Jan


