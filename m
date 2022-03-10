Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB3D4D42FF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 10:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288235.488801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSEfe-0001ct-9V; Thu, 10 Mar 2022 09:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288235.488801; Thu, 10 Mar 2022 09:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSEfe-0001a8-5u; Thu, 10 Mar 2022 09:01:18 +0000
Received: by outflank-mailman (input) for mailman id 288235;
 Thu, 10 Mar 2022 09:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSEfc-0001Zz-Qy
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 09:01:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3778abe-a050-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 10:01:14 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-h-chUmV2PGGIwSdQVvFpPw-1; Thu, 10 Mar 2022 10:01:12 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by PA4PR04MB7951.eurprd04.prod.outlook.com (2603:10a6:102:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 09:01:11 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 09:01:11 +0000
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
X-Inumbo-ID: a3778abe-a050-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646902874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2yjxOm8D6c4XeWmgPpGxL+AeZOmUk5Vi+/HZDeBBiis=;
	b=JZYoOaSdyEzqBpUPKbh2Z2K6i1DraV7Jij7tcQaa8ZSJoRSubxsIoq6FmBVkXswW60TaPR
	Q1sVXAusRlqPXGwM7Jvo87Gb7fdak2zzOvLey5gT7E0mtPNdUD4bqW1bCgT1uHNvpqoffF
	8A6/60vqH81k5/Ny7f2vKTp9vt5jtys=
X-MC-Unique: h-chUmV2PGGIwSdQVvFpPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnnW+PnMT/x8yUtLROto7nKxWWuZMBjXl0qYrTCwpg7J8apoK+zpkuCm+MuiaNR6+Vgnigo/SaUyjDTeu/2guTGXdIsLpZ2wI/122X3CrvU1c7/1M413gzXc0pvHbgZJ5UgCPAGKwOJnUtWx+lkjLAzt4nv/QO9JhkNaA2Dd2OKuhM+V99yQv+edp8z6sIbCsPXyU2Yu5VgYiZsNG+AlMQ4g6KElbCKbMOjns54wjNNoXTKMqQaXPHKh56pVmukLA5Xp/sEeJoplQ/gp7vqUFLHnUoCfsdV5TOI237ev95mkVsGs+KkXujLnHisSKwgCITPQPpizfe09j4HkSKtmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yjxOm8D6c4XeWmgPpGxL+AeZOmUk5Vi+/HZDeBBiis=;
 b=EAUeVq/h5l6tj0LxCkcVdYskIbxOfPwo2eYBMAGkcXPtI0ToXuwJSOoIahdUGAaT6vtP6qybJEEOMZ9YKFbmlMZlS/wQ1Fm49GWQItjY3B0V2SkWWpbZtRm9uHHYI0auLYUdi6yS2+7mdt6jC/9Glt14R6xZVh9Nr9l7RhfACf4Vq4bMQozBtAARbej38EZRMGXEHoskhVbPegYb7yzas4QQIYfHSBAYUq67jfleZ9Wyx+7REP8LuFMAxF6uUqFT9qNPNDXapS8reiYQ9op2y85ekBhmFWkSWP6WDAls3RrKDXPsQWQnwWQq54RPkUpQxfyd56aFmH0Twx5qgUmOGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f8ccbb3-d384-bedd-8fb2-18aab570b588@suse.com>
Date: Thu, 10 Mar 2022 10:01:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: preparations for 4.16.1
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
In-Reply-To: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::18) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38eef77f-135f-4ba2-1192-08da027485c8
X-MS-TrafficTypeDiagnostic: PA4PR04MB7951:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7951B0207CE545A238E11CDAB30B9@PA4PR04MB7951.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DqurgUhXX6jcABZRmUB+SAViRbUbxatlnYXMpo0x2zwa90hEvsqDXOkUcO7HKGrKHwjPyP3ZzpQKUmOo93KJxZqvgY8aEcWx2S+4fqwN0VSn1+6/r747YJaB16nhDQNJHCuY5uex/SvgWDWqc2iV9hoifTNMbIwDIBcG3gqu+pHj447JaBUXp+NyVFg6nzV3ZfWm5x2pl2EsvAGRtOeI9nEVlR8Ccr+px2+tyqUg75tRsb+6AGRV077VeKRzwX4Goy2Dn2LV4MBPqRhmc15IC9cdX0Z4Ec6svRfyK1p+iVXEAVDzDaVVeWt2/DaMnDlL85vbqMlbzyUf1uw/QR/gaR20o9C3MC4quljmaB343s7E8p0I3OH8PqrxV07zt8JvwA3vYbcZS3GRMsewO6q3NG7ThJZlGrX2Rz0xZET5Iaqg0xP6Vfx/o7HbOT5v5UXl/wHZyelv6wW0WZ/qzYEmRRnRqIDSbHfURvuY6yj+sjgRKT3nAuYX6l7q+PwQJCEl06b+vXYMP4nQ3leSfwGc0ZY9RUKN1cbIVQlFufVW0I0tAy7YHbd/uCKAbPD/74L059bcadb1ndsEeqXTpAf3RgJ083xdkY9YkTrLmZvKApnk6quWWvtSzCmJbPDTL07+mhITFI0Lm66hGPJkBWwrB7NZ1BEgDLqOKF+sBHAkLb7cCCSf9bdvMvkXByd1XwkGSeFiTLqgcRWPJcKWAzlC221jzdsXv2+3/cOsraxxp0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(6512007)(53546011)(6506007)(2906002)(5660300002)(31686004)(6666004)(8936002)(508600001)(36756003)(2616005)(4326008)(8676002)(26005)(6486002)(86362001)(186003)(7116003)(31696002)(6916009)(54906003)(38100700002)(66946007)(66476007)(66556008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elRrNUdCRnBQS1dRa2ZsRmRobWtrQ3RYMytrZDJWVjhhd0hvUkd0K1p1dFZB?=
 =?utf-8?B?bGVUYkZZMG9JQUZNYkhDZ2ZFWEMwQjllQUZBSy9DeTdjTUN6QmMwUVk3NHBT?=
 =?utf-8?B?bVVGRVNHUjJoTTZScElJVll4elkzTTRyT1Q4TjVoNnZTN1ZXbU9xM1VZeTB3?=
 =?utf-8?B?ZUswNFlydmdLVXVxVEtaNHRzRHhCd1pIWnhNbWlGdk95bmhOdUprZTdJbVZj?=
 =?utf-8?B?c1VqOGQ5aCtIYm9NUFcrc0lUZno5WmxFSHZWM2RTbzJnU212dEJCSklpRlhW?=
 =?utf-8?B?QzN6MllCOEsvdit3VUo1L2RyNURGK2NReERIakhPRFR3K2RmWWJTRmlxUDVI?=
 =?utf-8?B?NmJxYTlJNGhWTDZxNUNxL3RoUmJhcFFsRmxFZERsd21pcnozUmh5N0VhUkxY?=
 =?utf-8?B?c3ZwSEJEaUJSU21GT1FoekU2Wm4vUktGdUhlQ28rYnZHbHBINTdNdVJQOXcw?=
 =?utf-8?B?K2gzREEvZmQvWHh0K29kTkVDR0tEUDU5OHZQVUdTWFA1bmg4SnZHOXJ5Ylhr?=
 =?utf-8?B?azc4SXBYY1dybDlhS2lxS0gzZEx5M1BhNzU4MnJUdnFWdDNDa0pqRmJkeC9F?=
 =?utf-8?B?QUJRUXNZUDFlMWVxVzlVSjJTUjJBOVo2Y0s0aFhhSmNzNUVXYi95eXUxanlI?=
 =?utf-8?B?SG1mY0JRTjBhcnY1QUtlUEZ1Sk9jMlZHMko1QWtOMkl2dEJSSWhMWEdqZm1S?=
 =?utf-8?B?TzVpN3U4UUZKOVo5cTN4akMvWVlFMEp5endXSVhhdEd1WWtMUkx3Tm5sWWlw?=
 =?utf-8?B?OUFxaUwvY0JSSS9Bd2dQV3JDZXd5MktCVFJmTk1SOVV1UWV5bGpLWFIyQ2J4?=
 =?utf-8?B?NDg5VVllVEpVN3IzcVh0WDZ0NmJLZjJkOWpyM3VRM0pKdnI2TTl2V0M3UzlN?=
 =?utf-8?B?QjJvaWlzcjR0Rzl3cHBsbm95Nm5RZkJYSm5oRjRGbXZSRzFwZ05xUWcvNlcr?=
 =?utf-8?B?UmdHVE0wNE10MGsvcXdDbmNRK1pFdC9aNFVFUC9aMEdWZ1psZy9TSXRWeG5V?=
 =?utf-8?B?b2VlU05LMWtPRWdQNmtLNTVneG9zMmkwWUpSSFRFNkcwK1phM0hKazJTbkNp?=
 =?utf-8?B?SUQvbW1aRHBRLzV6TDZBbUdhRExtTHA5VzBEbXJpbHZ0dWpuRm1GZXNXMDNL?=
 =?utf-8?B?eWNzQkhuMUFjQzZ6QTJJWUR0OVhjbC9vTmFBbG82MFZxRWVxQ0p2bmlVakF1?=
 =?utf-8?B?NTh3b3VuRS9jMDRGL3EyWXB5bHE0SEdhUUcyVW9SbWZzQ21DbTZROFpUb0FW?=
 =?utf-8?B?bWs3OGdUcm9pOGN5SENIaUhjd2NBMjl1eXdyKzdjRVQwOC80N2tRMDJZN3BH?=
 =?utf-8?B?SU04SnJ2KytHRzdMWUxtYVNpS1JJdVI0MTVwUjkwYUw3SVVHZzl2d2RWS3I1?=
 =?utf-8?B?VWJ1TnF0MTlGSys0aEhnZUhPWkZOeVZQUEZKZmNjMmd1YmR6QnBPOER1NWRu?=
 =?utf-8?B?RjhnVVJveDZpWmUvc1U2NUtpS3h4QUZzNjNneHF1Vmd6dFQzR2p1eHpYQnNH?=
 =?utf-8?B?NzhXY1FEUVJPVmk2YXp5WGc2WVZjV3EwbFZPSlZQSVo4cVZUeGgzUDAraUkx?=
 =?utf-8?B?eEZQbS9nVThUaFhsb3VKc3hDQ1VLSnpWZjBvZEp5VWczM09NYnRWeVZOUWs2?=
 =?utf-8?B?MGlpMUdMaGs1NVc1NERqWlIwUlgwSVIxNEJoaGExNWJMZ3dxZEVFTUtySkRo?=
 =?utf-8?B?UEEvcEUwYnZWa2xCdk5XTHRKQ1NwRkhKOEdsT1U5ejZvODZNRVJyYlJkYUhR?=
 =?utf-8?B?ZkNLTE13Rm93OVlQKzlndjc2RDdjYnV5U1ZoMlBHSFhvWlFYZW5xVzNmTnpu?=
 =?utf-8?B?bnI0M04wY0w0REpCM3BJeWJkU1ZteVBuelp1VS8wczhiTXN5WTgwWXhnbDJt?=
 =?utf-8?B?QXNDU09qRzl4TTMyU2FhM0NhL3d0ZzBuWEVZai9XdUhkNDlMdjJnckF5RFFr?=
 =?utf-8?Q?Ct3dt05T1YIQRXPlogkwi/XE9hHOxKBr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38eef77f-135f-4ba2-1192-08da027485c8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 09:01:11.2008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QO7JEQuA2EFN9vYhng0FQyfH7naVU/cVYnYzRP6G3L1OOAXQnRN39O3Ba3ayF7fR5Bv3OsbchmVXv3OYusEOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7951

On 10.03.2022 09:57, Jan Beulich wrote:
> Please point out backports you find missing from the respective staging
> branch, but which you consider relevant. One I have queued already, but
> which I'd like to put in only once the pending fix to it ("x86: avoid
> SORT_BY_INIT_PRIORITY with old GNU ld") has also landed in staging, is
> 
> 4b7fd8153ddf x86: fold sections in final binaries

Actually the other one I'm aware of is

7d9589239ec0 x86/CET: Fix S3 resume with shadow stacks active

which Andrew promised to provide a suitable backport for.

Jan


