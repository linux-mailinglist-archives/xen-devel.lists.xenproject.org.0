Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B871C3F6F21
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 08:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171780.313463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIlyl-0004xC-C7; Wed, 25 Aug 2021 06:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171780.313463; Wed, 25 Aug 2021 06:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIlyl-0004u8-8c; Wed, 25 Aug 2021 06:01:39 +0000
Received: by outflank-mailman (input) for mailman id 171780;
 Wed, 25 Aug 2021 06:01:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIlyk-0004u2-3s
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 06:01:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e79f9bf8-0569-11ec-a928-12813bfff9fa;
 Wed, 25 Aug 2021 06:01:36 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-y2beSj3-N4u-D-Am6vsk9A-1; Wed, 25 Aug 2021 08:01:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 06:01:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 06:01:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 06:01:32 +0000
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
X-Inumbo-ID: e79f9bf8-0569-11ec-a928-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629871295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+if3v/ywVlklagBboiTVEoG2MtAHbmWL5mdN2N3hfo=;
	b=CE5+YfO6OL8Yqg/R65g6K1d/aG2f+ePm1dbm3/aVHBd8g5SixscGCbLVBT83zfQVbNov5O
	1r5VpYLllhNpuEfB+ON9MT1WGAW/j7Vfe0daB3cD3ZhmG0ltdKyyvU6SYRz6JzQQ1Fiyo+
	vJ/fiod4xRUog0x8wz0OMQqttqSEF8M=
X-MC-Unique: y2beSj3-N4u-D-Am6vsk9A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcZebtD+4b7Yumgy/Y0dSiYS6CtSQPq6VEN+BooNATZKhsx5Q4MtHMjDJYTr/rZMft/Itcuh80FRooVbk1O5eAW/pdqpuEyN2aFaDXuqD17Nzx0ZOE5g+P9wgCCqilw0fXlAyvXUbBpq+cWUJ5L6qIIFfQ2sHmZAqF7GK3Hsl+Ui7jQ08vaLxrA/czU+KInXzqiU/weFgrrH2XHbFVSlBjMEELFMieEXD29kkL/BwWOu98cimU13+MIrS9OKhPlc8f3IU//IOBIoGd1Ivc5WgcE2S3Ki727xXrQUFV2pAeNud44bLA+qM+niFYz+BZ+ji//ujIFAio6yGLhQZhn94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qysnwWpWaAEYat+THO75eXDzTYF4Dld7hvJDPpzOulM=;
 b=Gtp+Scht2FOxHB4oKRZxWymhy0OOOz5UUaG+UP9Qzb//1FrOfqwmQ4Wetjjy5Fx+Jmb+K7kmi/iID09Kbo3tJ/p+vhQ9mIYmXZLmbSq8Tmfyi5C1HUTlTCIZhoCS2EShgcLLXiW5eVNvmU+sqOynOmpGJV7S5L++G7vhggoshrZIDK/axKpNX5CEk+1qXpU0JxVF5A8S8HUOVKkM094/UaxrSMktbvGokymL6jT3sKYVbEbXnLyHaER5601mnZCtUXAq7hjkPUf0fhcIMF56RtNW6gkkNyuRiXRa3VaPBEb0cKEcfr5cqQir+KeXusUuNdu4/vKZbHlRnmXjx0vl9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] IOMMU/x86: don't map IO-APICs for PV Dom0
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d01563bc-ae9c-fe91-b313-19a30af09170@suse.com>
 <2edfe6a7-a69a-df75-a11d-ee8348235c54@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6032595a-f9ff-bec7-3fe8-43d6a205ffc5@suse.com>
Date: Wed, 25 Aug 2021 08:01:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <2edfe6a7-a69a-df75-a11d-ee8348235c54@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b20b829-f9f0-46c1-e49d-08d9678dca06
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168C695B489C429FEBCF9F0B3C69@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8AhBh9mf6NxwTSoDPpex95oUpWHEZa9fkMQdIvzRbR1ukve9sUUDbhh4A+Rr69MRoCcw5On4yLBUKVnD4frFRtNNpoFVnVFzvRWj5GFoQnIWkmMAPu5fxq5Ln5NQF/i6wraWGICwpPqLuFb0WEML5R+DEoOPAYGXnrQ7pArsCqksHkd4/r7YMfBqjpml65WrSEouov4otofEgTX+GjyIRfWpMc1d/jdhjSAXXTxLtNQFRw08Lo+Qo8zDgXa21ASynYAjJRjMBolLGitpBh3O11RZds5WeDJjQyarYgXYZvvgYL1qL26PoS4JO5utj6b1Mn7RCOU5TvkYm+pPxW/o/hU/KpniOBJSGKUteVENzexl9e8gV3jJvu9oRoB4M/0FAADzxgeITRQsGZRfynanAbxu92JcThfTgsxhJRpqs3K6vcR5POzeiCIY+/FE4MxtDxNdGzKhBLjJyM1mNmpUzfwNcx7LLWvJF92zZUnSXU+TolyoaqhI5eyTr+6oBv7zTw9lWQ/eslevJf95ydGOY6xiZTl0CtASiPAK+mpLJI9FaXW/ACezaAAMH12mZK0tJ0YIEo4xE5Skpj8ktm3e11X9zHXIGYlS0HHl6x3tz7JZtcYcWIgduw9xGEJN6H0JGLPfeAZXQnggwS1/xTewmuXcCdx4DBrb+isy+r5VnHerZNFgtQtyyFNAhTLRxreUUPs6GjDSnNPYSrH6WtGOkMm10G2hicMk0ftp4WJsReg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(346002)(396003)(366004)(136003)(83380400001)(186003)(36756003)(66476007)(26005)(956004)(2616005)(53546011)(2906002)(66556008)(66946007)(31696002)(31686004)(16576012)(6486002)(54906003)(478600001)(86362001)(5660300002)(8676002)(8936002)(316002)(38100700002)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8jz+FkcZnU0yXwyOFfWJOc6+6c/RPvxNoFpQFVs6RgoC7DPKriLjRJwhMshW?=
 =?us-ascii?Q?NWWqN8X9JMUz6bNq5njux3EOAjbTlN1xVjvInGna/IyTzkyNMxFfeJw4bG3V?=
 =?us-ascii?Q?pwj/VFFuWva6NylKwO44dHkbEubd57WGto2uWgf+3kwe7zPRoWVg99JBE5hQ?=
 =?us-ascii?Q?y2yR+HeSc1pjvybjQklsLXallBXCA42MO/uT5zxrQoR2BqaoaPUvkhUK9V+p?=
 =?us-ascii?Q?3a2d/OXOYvhB5Xp6CgEhsA5CyvGcKBFOx0Fgl44wkPVAtxhyIye6CTGifiQh?=
 =?us-ascii?Q?pg/c7kl6xTtgzaGvvH1+2ts1tAOjqCmKmubtyIvJmMqb8VS7x+E7iw3BO1jn?=
 =?us-ascii?Q?oHTedbKXj6bUy4hqgxQ4x7K9DmXKbKZdjX7Lm4mTXgH8AxK119NuUc0In+r2?=
 =?us-ascii?Q?OIygdTV9RoHglNABsKrGbFrM/HzjdGsGLdR4JcC4vHf1yD5VWQLpRU9hRDVq?=
 =?us-ascii?Q?wUzzgPs9fmnTNf/KTqpBkjiJL8rB5G6qVGQsWwVY3qpgiWR5q3nb64nogPp/?=
 =?us-ascii?Q?W3jn1OSjZmDj3UhBSGeWeLMLeOwHh/4J3GDUly4ulzhMr5zupkgb6Hk+KRjd?=
 =?us-ascii?Q?SiFiTf23ACjXczQ+GcphGqaM/mAQN0kETi6/ykrjexTeTFT4y4WpTB874LJn?=
 =?us-ascii?Q?NP/MekvOIdP/l8cp3vhvAr621YdD79NLvyBoItLUZyQhY2qfyt/NPtaSmNje?=
 =?us-ascii?Q?8vsrv7oyt3bmXzueSQcEwlzbi8qwQ0mJZdOaZfis1Pt5WzglWLnxoQpkj1ZL?=
 =?us-ascii?Q?Uw9rmYqrhyUs0tJJudESazdxDzc8YEAf/VirW21PujCzgcXFzTMTlosuWG2G?=
 =?us-ascii?Q?0rYlO4J4p/K94hVPav57ZtR2YA1KPfhyO9QC3msuJmALcZbbaiksnhy4H9WL?=
 =?us-ascii?Q?Zi5tCvjAEPHqDIuv2SHfRXX/fXxyMKy8JD8h2u4CNifHPimP+dEZ3UV4fdVV?=
 =?us-ascii?Q?3lMSEf+QLIOtlzvCdnbN/kAKrLRQ3ACxi8X+C74r2poGb4nJRVo+ZNQS0Qx0?=
 =?us-ascii?Q?Af7ncUXUbYmHrVEgPAkk2JyxJ6xHNXFAOQbLEJLTUfVgosoDO84FVPc/4H4+?=
 =?us-ascii?Q?O1/5Y4nocZMu9us+6WTacWrHOxubxQgdYh+a4suU5AOtTMfbfE5OtrrYeSi/?=
 =?us-ascii?Q?3iUYHv62Y2jLDUBkcSuCgxKa+B8ZCvfibsvsU9fwohjP+BRkA1uxWZ16HRAT?=
 =?us-ascii?Q?6cd6hlK9V/s25eaaBOWybE2dItjoinqN0kqWKQ9Q1MnnM6zHb2kNnUYrizo1?=
 =?us-ascii?Q?Fdh6YS6i9D4TDG/Ffb2WjRh7ftbStO2v2w20kuDDwsEqCW7i4EeeKndwpOfH?=
 =?us-ascii?Q?SlqouT8qQl5Rghy1p7oH8urO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b20b829-f9f0-46c1-e49d-08d9678dca06
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 06:01:32.9303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYesUGPhTzIdp+bFINR5c+OdN71gxtq4lA9OcNBtDydJWfzliVIrVAAOQqSs4i/mjm2XUUTTKRoGaObuhZJfAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 16.08.2021 20:31, Andrew Cooper wrote:
> On 16/08/2021 16:31, Jan Beulich wrote:
>> While already the case for PVH, there's no reason to treat PV
>> differently here (except of course where to take the addresses from).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Honestly, this is already a mess but I think the change is making things
> worse rather than better.
>=20
> To start with, IO-APIC windows are 1k not 4k, except that no-one added a
> "4k safe" flag because IO-APICs weren't mapped into userspace by Linux
> at the time.
>=20
> More generally though, if something is safe to let dom0 map in the CPU
> pagetables, it is safe to go in the IOMMU pagetables.=C2=A0 Conversely, i=
f
> it's not safe to go in one, it's not safe to go in either.
>=20
> Mappings (or at least mapability) of everything/anything should be
> uniform between the CPU and IOMMU pagetables for any kind of sanity to
> prevail.

Just in case it's not obvious (it just occurred to me to mention it):
There's a similar inconsistency with all other MMIO: HVM/PVH get this
mapped in both CPU and IOMMU, while PV doesn't. If mappings were
mirrored to the IOMMU, the patch here wouldn't be necessary in its v2
form (or the form when integrated into the larger series), but instead
would be correct in this initial shape.

So if you think that's the way to go, I can restore the initial version
of this patch after adding a prereq one to mirror MMIO page mappings to
the IOMMU. There's one difficulty though: We'd need to have a way to
tell when it's safe to unmap from the IOMMU again. In case of multiple
CPU side mappings we can't unmap when the first of these mappings goes
away.

Jan


