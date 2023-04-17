Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E89C6E4572
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521961.810998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMJH-0008VT-Ma; Mon, 17 Apr 2023 10:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521961.810998; Mon, 17 Apr 2023 10:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMJH-0008TM-Ig; Mon, 17 Apr 2023 10:42:11 +0000
Received: by outflank-mailman (input) for mailman id 521961;
 Mon, 17 Apr 2023 10:42:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poMJG-0008TG-Gg
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:42:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2088.outbound.protection.outlook.com [40.107.13.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81309e2e-dd0c-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 12:42:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9779.eurprd04.prod.outlook.com (2603:10a6:150:111::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 10:41:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:41:39 +0000
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
X-Inumbo-ID: 81309e2e-dd0c-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXEB6ULl+4gfQW+/b988wPvho+lnD4bCa+7cJGrw7AuS+I5+raN8yPOj4HsgQm96/vl7U9EEjE8uEHndj95sTuCabZf0pebUqa05Pk9Ey78sSG8+9XrnB1rVuGYBvxIw+/EXN1QIBLtwIzdr8raj9jb0QMU4LNywflrFl4yt0hgxJR51cxDbO/TCKP+wU7VpeZmTMxmZOAW6eE/Gi0Sd43I5LIyTUDLi5zSSmBWEyWhj8AgJeMsURseuTWf/Zz3Yg+JKbwruKA6YshyPAQMKTUmbTE+hOUjTOs90kMTzURE1heS5pJyhGPXz+BvcHRJOYY+wytWjCHjXYAB1cRlqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2VvzppRbmXMivGi/k2XbuKnAJw7QqsWC5xHrhvSiBs=;
 b=b7+eKypfvMVVaKJfsRSyh4MAjomvd07r3ta7ero47nUwQze2Gf7+xPgKE/Mv0rCpCTHBfmZ1zhmQ28smq65AnooyNzjgikpZKIOOILFF6wFwZTh6r7JuYzo6A+fG0ShkGkuLWJAxB5CVf5Nwhin1RewjHPBHknWkZXoSpAXvBZV3x9KKpujGc6cn6vfpQf9iFVcoV6qVMRN1Z20kRCGJGwGx3spTyZ9q2e8SAe1YN9lf/MDPczyKUuEt2jghF2FtDjurZSpKN9TCXISnPC0fidHLtZ7xDehTyQ4E/eWFC2nwJK9MRepxzPH0XZgk/ycSKD0VUrXfeDtwfN4qdCSF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2VvzppRbmXMivGi/k2XbuKnAJw7QqsWC5xHrhvSiBs=;
 b=2q8DLpXIjlhlQAA1pNPRL3LJZArUK4Z4yIcTT/WrratsTfsj/st838Lwhd8BoJyOxrX1Sefc5jdsH2KbXbldG5/q4uLyagwWlY3SVx7BeUp/ddenKmtzMDET7l46ktwt2Ch5n/1Z88b/PDEkqWNbe3sYUrLp5X7Yo+58Tzlerdz4CdjQP05elm4ZbxPY4MhAop/XSYyGlyNJ3r0R8eBvTroeE6bGh53MXPszgXmJN+hKX2ddztXGN/XUJbs4aLx86pcye6k0ypvg33vlzo7Rss2jnX8cuZOqmC91GoWxLRoRnUY1stNVXodWUZgvA/8ADzyhLZ85J2jWoT193U9mvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b8c7abe-9bc5-cd8f-b650-1de0205c4ee9@suse.com>
Date: Mon, 17 Apr 2023 12:41:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] xen/livepatch: Fix secure_payload() in non-debug builds
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417095815.3734434-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230417095815.3734434-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: ef57b071-87ce-49b5-9f28-08db3f30537c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yf7rq9wqSJvPrHxLDMfeSlfxA89XcpCzbAtUQeDxiVqt12o7H8bykzwDdPSmeKE9Asetv7Dk2OMtIPR/T7kCJyapwbrt5J1feCYAKDEKmCEOVnKtBziqxXgPZmmyVkD5y5Ol6p/cLkkEyoEzoSKvcjii2HsC7ziA3ntxRXFS/cua7rfbb0B7snvgwSqpLKawS3zWw90cTjfM323O5wuWPsV5fllAPNpfsDl8qp6qFBc9C3xgPb/ubPIYfIqdVchA40mCuCN72phQNxhb9lmkUyZFYNF0P/v2uvPojydXsJy/DG1aHXwHEyirTPC+2sfk3xTEq25Mm0LcFzR+OVeySUBh8WRU/8iMPU22szS35YO6tJF/58s0YjDYCqqOjoiWF8Pr1xF9HQZIW/3DNVpUegfHfW3GUfpiLxXvKZom5KxcjdC114OWW+8YRy5ijb9P6GzjmBSDdxcfF+XZx8WFJEEGMb8xo9teb7ciJx0/I4bvdMTHQH2IycGC77Irdb7pJxf9KadZ3xmSCoQpoQ6HvcgYI3OZ121tYVxoiVyhqIA/8toXEJ6QLxwLnBhaOjrarUwDP5Iau70wT+msl7JaaR7FgGGoHyJ6b4laVh3j1davqUXH0uI/jjytU0G2zXtc7n/jza7QcrE7IyuMDnMChQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(8676002)(8936002)(41300700001)(5660300002)(31686004)(66946007)(66556008)(2906002)(4326008)(6916009)(316002)(4744005)(66476007)(31696002)(54906003)(86362001)(478600001)(6486002)(38100700002)(53546011)(186003)(6512007)(6506007)(36756003)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkpwREdpREhHbE0vYjNkZFNYc3ZNR2dFMms1T2dPNjRkWTNSVnl1cG9lb0Zu?=
 =?utf-8?B?c1FLQ1BGWTVML1lqRENmWGJGZlRqVElPTlcwc1FQVDNsRDEvVzZNeXlpbmQ0?=
 =?utf-8?B?aHQrZlhFa2JQUlJlaFltb2t0RW1YbGJWb1hocFRzR0NMQkdNS3o5SUNmcXNi?=
 =?utf-8?B?NTdKTXFMaHpWZ3NGYUx3cllkbkt6OVUyYUpRYVdzYUUxMUZwcERNczg0WGpp?=
 =?utf-8?B?YjJ2NGxTNFE4S28yU3gyRzloMjM1cXhJMWV3ZlMvTks2Q25kVWJDbUhyU09z?=
 =?utf-8?B?OWh3RExYTDlJeFB0S0d2OHNWd3BBd2Q5WUliYnQyamJEZ0ZnN3BOTnYrbElS?=
 =?utf-8?B?Vkptd3BMeDcvajNCMFVQWm8yck03UjRRelpRdHNLcHJwTXRSSmFHRERzS245?=
 =?utf-8?B?L0FlYzdlVHRIcytPQXUyaHFsRTJyZ05BMkVUc21YWXdPZTlwWEJGWUFPWStY?=
 =?utf-8?B?QmdWQXpQU2NBRy9GT2RoU2diNkxZVW9GZ0JENjhXSzRIZFlzMW1adzV2c3pP?=
 =?utf-8?B?ZkRzZ3F3TDZQMmxodGtUMlh1aEFML2lldXpxTWpXSGFaYTZpZGFYTjc3ZGJ0?=
 =?utf-8?B?Z0xNWVFETkprdVMwUDF4SnQrL29sMVFDS1cxS1NEWVN5YWNDTnluRTFONU84?=
 =?utf-8?B?WmZXTVVOVVRad05EVkVkTEJiUUNTZ3lKdlFqZ1ZCaXRyNkRHdGZCS3FCemZy?=
 =?utf-8?B?MTZBUHZsMTE3aFVtQ1ZNMk5tUEtqdmo1anRwRDd6MHB5N2VlMHA5NU1hQ2cy?=
 =?utf-8?B?TjE1d21PKzV3bjZQemxHOHp3T2JweTBYQ2V5Z0YzSFUzOGx6NU1Ec2ZOSFVn?=
 =?utf-8?B?NWU0NW1TTTRnNjlTOVpSSFc3aXJVS1haUlZuSDMzenRvQ3Zsbno4OWI5Z2x1?=
 =?utf-8?B?SDFnMFdReDE3VElKT1VoOGpFcXJ2bC9hQXMxNnQ2aUJoZzQ0aXlpMldjWmlu?=
 =?utf-8?B?anVYRktLNkpMWUl0UG45aVdqUDBKVURXLzh5N1kyTlRzOHhtY0M3Umx0Y0Jk?=
 =?utf-8?B?Q3FxVmVraTZHYmtLQWhINElVZVp1cTdnNWxzakg0aHBiM1ZMaERuZU5DSzFJ?=
 =?utf-8?B?djVzMi9nUnI4U01FeU1paVJpOHZOUTM0WW91REExdnl0ZXQ1SU9IamFhUWZi?=
 =?utf-8?B?dEg0MGh4SzZuQ3ZjbkJUSWdDb3dwUXR2SWE5eGFnNUZQeW9iNHY4SXhQbzlx?=
 =?utf-8?B?dSsrbW4vNUZnYlZSYlZxRy9aNTRjdDE3TjFHb1lXOU1JOUVzaS9LMWJ3aTJB?=
 =?utf-8?B?aFMzOUlsZEROaXJyUGp1WjlWNi9TL0VQQno5bFVRVVdac29oSTdKNXEvMEta?=
 =?utf-8?B?YVlaYSsxVkd4aDM1VGp3Q2RZSklYRm5BVWc3YTVPUWwycC8xVURXdFBRQVJS?=
 =?utf-8?B?bmtzbGZ4Q0lsZHh5THBDbmRjNTE5WVVpZC8rWTJ4aklhcmpYV1JRVWNoQVdl?=
 =?utf-8?B?eXVLN0dzMTdrS2Rqd0NvK25scHhyQmxiM3A0N3NhdU1JTmZ5RmcrK1M3K2tt?=
 =?utf-8?B?dUpDb0pjZlhwYUw0TVNzZVlXVzR4QmZhZnduelNPY0tuVkdma0RNemJucTBw?=
 =?utf-8?B?TjhtbU9iT0RVaGR1dTZYSStZWUpaamNzQlgxbFlXdDNuUldUU2FITW13cWVm?=
 =?utf-8?B?Z0NrejN1cXdGbFpwK2RBK2JwWW9hYTFzRGtsM3FmSVdPM0JnNDRQUUwrNWFG?=
 =?utf-8?B?aSsxbWhNcWowRlB0RjJpSTVuRjNrWUYwT3RodW1BVXdEckJ3K3hCNFZSSG9O?=
 =?utf-8?B?RmpZV3JDQ0UzUmErYkRWSFNuVSszem4wdnowYUpmcFpLZnRaY2RIVHJ5Y0p0?=
 =?utf-8?B?ZFhDQWRlOXgrSWhUa1pTeHEwSGNKaFVWVUFrQndLcVphZDhYS0FyeVdwcVVG?=
 =?utf-8?B?dDY4U093OUxrRCtzUE0yZkkyYlJua1ZLNXQ0MHlsVmw5MFI1ZUpkUjQwcVAx?=
 =?utf-8?B?VVdsYUFORGJ3OS84dkJMR0NqTkRLZEh6OGp5bG5uQ1E0bFR2Wk54Y3lRb0lK?=
 =?utf-8?B?eGtCd3FHN3E3c0F3ZFFWVnJGRzBCcisxZXhZRHd0QnRJMnBTV0hhRUlYUmdw?=
 =?utf-8?B?WFpBejNCWmlHYjZNckNrTldRTkx0TGdWQndZbFhMRm5peVBlU3dGd1dEVCsy?=
 =?utf-8?Q?IfLANljzRSeKoMAMBhA+b9Enw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef57b071-87ce-49b5-9f28-08db3f30537c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:41:39.6997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/euP2U+/dHK0qKbMTBuryDJl8noLjGc+kjB5FLIbOyazlwcmMUW9uQayZJv1AvB/3/KBZoqjTye3DP8Z1/BJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9779

On 17.04.2023 11:58, Andrew Cooper wrote:
> The ro_pages + rw_pages + text_pages != payload->pages check is not something
> which is reasonable to skip at runtime.  Rewrite it to not be an ASSERT().

Isn't this merely a sanity check? IOW isn't returning -EINVAL in this case
misleading, as to calling "invalid input" what really is an internal error
in Xen? But anyway, I guess I'll leave this to the maintainers.

> As the code is being shuffled anyway, rework the logic calling
> arch_livepatch_secure() to reduce its verbosity.

By "verbosity", dym lines of code?

Jan

