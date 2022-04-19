Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC55072B6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 18:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308368.524093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngqS9-0005wl-VL; Tue, 19 Apr 2022 16:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308368.524093; Tue, 19 Apr 2022 16:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngqS9-0005tI-SG; Tue, 19 Apr 2022 16:11:45 +0000
Received: by outflank-mailman (input) for mailman id 308368;
 Tue, 19 Apr 2022 16:11:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngqS9-0005tC-4h
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 16:11:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67b41b99-bffb-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 18:11:44 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-_OJbGZblMEunJvArff3yjw-1; Tue, 19 Apr 2022 18:11:41 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6692.eurprd04.prod.outlook.com (2603:10a6:208:178::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 16:11:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 16:11:35 +0000
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
X-Inumbo-ID: 67b41b99-bffb-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650384703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFmZqkcXGhKN6K6YuRYlFKj2+yOjbq+whtO4ONUfnKA=;
	b=a+t9cvrKsJdH3L08ZgziDOG0NRg5vFupCKB1AfeRJM6Ycv2MYFp/pClObRQzrEV2BTfyGh
	96XDLakGCZCwE38Zf5cHvSfdUE420qZNDicSUB7PIkiHcPcDnzje6driMByLit8ny2jkSe
	2a1CifhJwktVN21Ys+eEWD2A/00u8oI=
X-MC-Unique: _OJbGZblMEunJvArff3yjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hs6AHmNvjG+SmkqrhfHKD2n+FPWyWSWeXVW2II8yE4VlOKM756VjerMH0/gSbZFDDX+CwgSEN0FPnrRHL2Y3wuXrTJ+qRh/ZrtseQeRKw+WjgHjLIzwEzK60WsSuNJYv2jPjTejSe8anew6VfhEpukd3SkuLkmObSwohnJ64DxOi6zvziRCZO62kZb2qukVJDMLinbxy05YfVe4J5hMI2uOkOJgp7xCmZwYdDhceoD9oX2xkxoQRl8RTYDHxL5VGz8Q4S9m8dXsv60rgYkSKxCP0LR8BCdU9jnMr2OOCyDf15iKbpfEAlZq7H8cSNBd1CeEvVkyRJrBeVaIfPMfuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vilVxsJ+tP9LA+TwxYNqiVL7yWsVR68kFLREE+H37Rk=;
 b=Ip52erZispz/GD6wxQI03uVUfElVe9pdnzxsgjNDIjOMMCWq6do+atszgk2AhY0GaKJz+x85R6QFSIZTurYmxQnWdvVUnHqgb7307lCJ1/FiUplPTyKGvCunOKjLTg8jw691oZlxZxih0rWe3qJwkltUo6PR0RAp9yI31SvNwVQohFchFupxqA8q7aA1Cs6KNDMW9shp+qECfnItCSvKbd5SyK2s9GLVusiZyOurNPYFalpcfOZQzlxuv5WuKyDHSMmDrblNGUfvUksQeOcpyMPfPeAc17PeLsvOxWHX7/zsSNdaca1Dkab0HohQyNFtW+Rt64BhDm5FCVgXwfRFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <677f8b53-0a62-a76e-cebb-db8532f3ee45@suse.com>
Date: Tue, 19 Apr 2022 18:11:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/3] xen/iommu: cleanup iommu related domctl handling
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220419135254.21729-1-jgross@suse.com>
 <20220419135254.21729-4-jgross@suse.com>
 <1d1dfeec-6268-1be1-48e1-44b38eed36fd@citrix.com>
 <93390fcd-4bef-588a-a8e4-ae0a5278acd1@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93390fcd-4bef-588a-a8e4-ae0a5278acd1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 298043bd-d871-42ee-43cf-08da221f4713
X-MS-TrafficTypeDiagnostic: AM0PR04MB6692:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB66927913445DE856EA5E25DAB3F29@AM0PR04MB6692.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2rLInjf1xJspMsovFaBkZUpah1YZObqpkAPgOUjY4lIwgdd8adbmtJWpoXvq1YhvOOMW2QbDPF4bBcDNARZbdkhJ47B8WVCRcGzs2BYEgJkGgs1vS0JIjo73p8b4XG6PbA38pagBOe6kiFpeL4/STytgpG/JY6f0bS7pGhgGCsGIm5VwX0CmZSFP+B/t84eW50k3WKJDsZwv8KjCN6P8RrY/tqgVF44hsKpYe5roLsy2d5c+9MrYSNj5WmwHPEvvEzhv9ffETmNb4+uljZ60RLxISUG4PxDlTGK6ISuvcO/Qpdc7EI+WwMY3Bsn3NgufSwko4qBNGmgMBtLF3KXOAPtBnvMuqblA+JG1614r79pZZOlA8wvcjfZbTJmhUyowOhJOkCsZOPwsma6jHxsiNqfC0J5pqel6Cu0SLyZIhsCJmiXqPUkeRFX5pdG0NPGOyl8fTZlj5Sab1v3kE1QVJt6bzTvJZGo5iGbgLkr4t42MSx0QpDczhu8X8WFzwXHxlCmo42ubQp2N2JgzGJjbnpTPoAwobuY1iOUPbjsEtmHPOJcyXapzwbp7APek15vt8UbnikkZxs7dZepXSsycgWQuBJ+oLI458zRK7oAQmupqgZiFOINEi9umiwi5l9KXh2fFqEL+/NdoHiOg6/DlS11uHW2F+8IjFbo1xjvNspHlKDCcZ3YkwtCiEqjZ5G+6EgRkch2c5tuLdcJocQDpUw/1DqelIZnJss445Enl7HZVzyu8lte+bVOmZ0D4xbJa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(66476007)(26005)(6862004)(66946007)(66556008)(8676002)(38100700002)(5660300002)(8936002)(2906002)(508600001)(6486002)(6512007)(86362001)(31696002)(6506007)(53546011)(316002)(6636002)(36756003)(31686004)(37006003)(54906003)(186003)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Hpr+S5NZ9SsRtvNHUEdlA/o43cANdDquIbxa+9aaBpxr5Zy8JASKLISyiCc?=
 =?us-ascii?Q?jO3GnwQlyV0JOvr+290s4zeuqjoAXhPpoqajS95yCg6b+bzyqm1AV62jmVBX?=
 =?us-ascii?Q?feIDkbYDzGi5kgpr/2hT7gMSa/6tKWy6ejxCEHyZJGEPfriNSfMuGnwrtpyC?=
 =?us-ascii?Q?Io/DyurJrlsbErhNstELMY9lHod/eiF0YyNtQRhXwfc3r5yJyCtKSxhA56vm?=
 =?us-ascii?Q?Yyay1V8Wd4RibWdYMdEmIq+ThPn/22ju/VHqMPsEqHInO4he9i1lZSe8Yqir?=
 =?us-ascii?Q?bWhZj9Liuy+qiIADgT81kWvHZWVydp4Zmcjtpw6CIIfx1gOwEQsrzeRTBw1Z?=
 =?us-ascii?Q?++FO6BvDl5UagdIL977Z+sELQ2YpF3rCpDmZWSelEMmM+ALIwscxMER0t6Xu?=
 =?us-ascii?Q?kVlUj46wz14rxf9nk8aJpWFq19exsscJhLIJjXgV3iZ9RdBdTvsvCSlKrdlu?=
 =?us-ascii?Q?DDT8i7hh1U4I48NZSm2SIWngLlIU+AOVZfcM6agxCPUMZpkvF99pJ/hYI8xG?=
 =?us-ascii?Q?iXm1xPEi1GN0ajBKJqVTpdBNEs6Hd00m4610o/bqtwqU+SHcOxBp+9SiwD0i?=
 =?us-ascii?Q?l4MKznZv+wKYnuvNNecdM62V0/3Vf+KWak2iqg1kwMDFjPBMEqnbLB8Epaf9?=
 =?us-ascii?Q?ubXMfQoXdCgEByaq8DE/+CmdiXLrmhMoOssb3meejagaxXJCYy89ZZuwqQsa?=
 =?us-ascii?Q?MlDYsss6sq5B+XQ8Qxt0qVyWf9Hl6hG9MhomvhqfQNkgY6HGR7RWNBAibFGN?=
 =?us-ascii?Q?pOaUyWHZMCXialEzXKaFycn1CobtW4yvTIeaVTXZfpqn91PlnaMqShmsiNIC?=
 =?us-ascii?Q?S8MSdDysVaQeRzst8BuL73RtAoCwTbM/Qvy3LV9pc+7U1K4fl8rchfk1sMLi?=
 =?us-ascii?Q?7VhRfiscKLda8IBlI/6EHOlpg765AR9mOGKAFoccl3NGE6gCM8Z0AdKqz7Vu?=
 =?us-ascii?Q?F60ikD76Fqfl7lJLqaS5rGsGRDAwFy3DsS5ZzO5/bE6Ou1FzfB+ZP9x6CbNk?=
 =?us-ascii?Q?P8Tnoj91X8a7aXE8rADuRlboEy8NwyV6S7tjxyfV1d1AlRe9yVYBYMUYGrH+?=
 =?us-ascii?Q?jnhP41ZT/I7TlNrMlE11GxHOhJ1E/w8a6ozndUiZnGpnxBWwb/EadlPwQQ1/?=
 =?us-ascii?Q?G9+l5Tca09pOFfoiK46Bv6938/T3IZoFNTsEsPsKLFb9IFJEK8qA31bJRYWQ?=
 =?us-ascii?Q?nCMBWA20R+xINirjWVKoKzZYxntCNM6kp68lVdJeyhc5U9I1l6eDirbPuSnf?=
 =?us-ascii?Q?nGjINfPaeRfXSi065+9jDdpDEGNpULlWs4I5xST8w/SayUze9qdsV4CktlPN?=
 =?us-ascii?Q?nzsoAX3gK5U97cC2s/1cvs/blsCw+CQYW9TvJLduEOaBH+r81onYu1RslXJd?=
 =?us-ascii?Q?Cx6XW4gaKyXrbtnilKnAKAyiODWD7BRi+IiyPi/V0119WR4tYl/FzQJ+hN8N?=
 =?us-ascii?Q?jxPaOtF6bPWiYR7cnbCXAODQLf+Fo3ZaRwn2Ejh7J8HXScJCLuXC6mqw44oS?=
 =?us-ascii?Q?OWdpi5FZ5dIDsESTCZaCvpWPnnWSwoqAW++/2wpSwRXmvzGw7O7SsEd+2ELZ?=
 =?us-ascii?Q?o6sZ/AWJJqjHJRoRSLCSSvWwRq8BYZlLxqH4XiB3ohHadhVKhVvcdEyTPcFP?=
 =?us-ascii?Q?PMEnbm091+JpCqh8EFNIUZykYoxu6/cUTsYwzkM9uNBn1imnjK6+0e8195sM?=
 =?us-ascii?Q?66cPcXM+FKFR+Ra7epQyFA/GGioWR8Sthai7yH80hYsiO48/A/gbGGhwuXiY?=
 =?us-ascii?Q?/uUgwwG3Og=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298043bd-d871-42ee-43cf-08da221f4713
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 16:11:35.9059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZnK965oB4tj+xon+2ht3ZqjTzgDRt6nmRuNC/6EHQ4s9mUwnCeXKYrlcq95DUTTYF0n0uNUWcY0VvGehbvuYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6692

On 19.04.2022 16:56, Juergen Gross wrote:
> On 19.04.22 16:51, Andrew Cooper wrote:
>> On 19/04/2022 14:52, Juergen Gross wrote:
>>> Today iommu_do_domctl() is being called from arch_do_domctl() in the
>>> "default:" case of a switch statement. This has led already to crashes
>>> due to unvalidated parameters.
>>>
>>> Fix that by moving the call of iommu_do_domctl() to the main switch
>>> statement of do_domctl().
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> Another possibility would even be to merge iommu_do_domctl() completely
>>> into do_domctl(), but I wanted to start with a less intrusive variant.
>>> V3:
>>> - new patch
>>
>> I definitely prefer this approach, thanks.=C2=A0 In addition to being
>> clearer, it's also faster because there isn't a long line of "do you
>> understand this subop?" calls when we know exactly what it is.
>>
>> However, I think we need stub for the !HAS_PASSTHROUGH case now that it
>> is being called from common code.
>=20
> Okay, I'll add it. Jan, are you fine with a stub?

Sure.

Jan


