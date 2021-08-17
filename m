Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D863EEBE8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 13:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167788.306318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxcZ-0003sQ-ID; Tue, 17 Aug 2021 11:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167788.306318; Tue, 17 Aug 2021 11:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxcZ-0003qO-Es; Tue, 17 Aug 2021 11:51:07 +0000
Received: by outflank-mailman (input) for mailman id 167788;
 Tue, 17 Aug 2021 11:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFxcX-0003qI-3z
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:51:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab02d479-7adb-489a-a7a4-0c27c10903d9;
 Tue, 17 Aug 2021 11:51:04 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-YGXYKWkkNKuRGc4zS5yYnA-1; Tue, 17 Aug 2021 13:51:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Tue, 17 Aug
 2021 11:51:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 11:51:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 11:50:59 +0000
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
X-Inumbo-ID: ab02d479-7adb-489a-a7a4-0c27c10903d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629201063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+XtMwYBwA6alHSQ6ERZ4HOToe5A2jJvogper1CteHk=;
	b=fQG9MQ+eDWyHOEE7syt86a0ZN/+BLhbe00RBj56lQKJMXIF++zaEzhjw5bdnlEiS2ewZEh
	8hkUX0jKy7s3UNMCh1StM5YjiIqwveuCcY5oSRiF2NOajZERY3/4BQ8+uDbXHN1NCcn3Fq
	EOPjbj+F/VuvVJhPSO6Eq7EPbSbCHCU=
X-MC-Unique: YGXYKWkkNKuRGc4zS5yYnA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0eJgOXH31SiKxmF1VV/z/pVNMdS63305GesV6/mQIvMjJTwMu3WNvA6SmW6FC4oDTXmX6TU4OF+QJ8c/E0mz4yGtmdoE/ZBKbYLWurveOS/OXlBMnp5MxFabm7aCt+iVp3btVeHp81oWaC3KxKE09RjfsJc/UxsyPnvNSx+6VvQZeOEyQrA4twQAW53Ijita2LIjAVlOTpEtiB/CCBODlSG67/C0IUL7z0Tb/4WW4k3iGcOOp0opVgLQ3LGZ8OGbUXm2rHoOkzTS9O2//cqpWDuAc4l4OPUHBX5qXr99tw/maCFkBa6kHRUn7q3HiiLHg8Wv+OlpxLk7e/zowX7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+XtMwYBwA6alHSQ6ERZ4HOToe5A2jJvogper1CteHk=;
 b=Y6mzz4uIUT9crZ1Ndjp6JItL8RRkoLInQJNEghpsZeWeYkht6QgX7lElkssgHD+TmGcbLovnsK74ZoYjlV104+YWBSdReUdbyazsszD11zQK/DQNZS7xnQMX4uR1WahIUBwfErVJzmeniAt3ZOBH9eVB0elhgiSQy+rY4qzeFuPrsdJc1snzOkwTW1Yo+Gu78v2wvce/8wSL5wguBV7WiHyki8W7zF0aLNgsXUgiGTNWIDYNKiTU+zlLlsYg9xKSChGz30nZvblerGHF2Zy7bC99LsKYCBeAPHEnREYY0NwWV0Lp2b1BhU7vhhfOazQzdJruZbHtC0wB21i9FeGXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/cet: Fix build on newer versions of GCC
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817105656.19683-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8f63439-a37d-9cd2-85ee-7a1d06609bbc@suse.com>
Date: Tue, 17 Aug 2021 13:50:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210817105656.19683-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa0abf47-2771-4767-3193-08d961754843
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438167C546F6872AD0094637B3FE9@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	guFt691L9W3u2VPceQJYX6Sxpvx/XpcY4kiomegK/Kaq4+tPIBgJyZNwgZv0+CLhigO8YCfo+m0y3Chj6qwK8YfRb2hgqkrohsemO3DU9WFUjt4c8ave/WGPeu1Kk/Jim05ortCQm4dElSCN+dCXKHhcqagaT26TEEk0Lcshwc9KHSd7545H0LOatZfOUNFA0kAh/82LqrtSkxgZ/a6V4CaE5MVDCWSOcdkuTdNQDW2xoFNsZQQWUrpMstaAcLmTqO7qxUVZAALLx6gXuEiw1vv6aL5OxlADYPAU71GdlsobwEHTs3jMcdpCTIaY7nJRnZYOe9e2z+zaGxJjI6OIK72jcs7t1OhXKWNkbelwcVF6/CF20DgzeUyrnhIxN6589WhxLt6vQTMbLDA8uHUF2mBTvJmRs/Vj7Pt/W6zgzSvh6l2ZOrFVQxEmkuRhGo3twAp0zO1KMSOoK+INMJPBDEItOn0W+D2stGxrZoJwJTroLYZuVhSKbZmKbeSVQeRlB+VGmqnJcVD/vNzeteY4U4e9PP/aYmfrqmHr5tNeuOUTdjWqPFFINtyy4uS+h7bESfLUhP0XF90ZPQKptSr5L61Jjg69Rf/GDH+Xos35kQrlbQgXqWhHlydD96ZIVYglJAkgNw3DHg6M7djDl/MA1HQ3mjk2GRfcfaeWhFg/aDxZ8SZoVHIpGwqUQaMj190g4yg/oiz/QejC7t/vQ3ypiaS6rDxgyFmTTyaQCi4WH5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(136003)(39860400002)(366004)(54906003)(186003)(66476007)(2906002)(316002)(16576012)(8676002)(66556008)(66946007)(83380400001)(478600001)(5660300002)(6486002)(31686004)(956004)(53546011)(4744005)(36756003)(26005)(6916009)(86362001)(8936002)(38100700002)(4326008)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU1TMmNmNXZYMmw3eGdEVjZVSlVINGkzR0w4V2hDci9BWGl2VkppN1hJTG5Q?=
 =?utf-8?B?QzBDbFg5RjgxUW5BQlBQdHVzZUVBWHFWYmZCOWVlZzFaWER1cmdhc2k2b0s2?=
 =?utf-8?B?UmRFY0NsbDRRWEplMHFGdlVBU28rNzJPUzdNY3BDOGhjMldMbXY1eEVYd0h2?=
 =?utf-8?B?Y1FkZHREMWI3THpheUFKNTdTV2dxRzFkVlFTbkJoNG9ZanVlemhoR0lUTXc0?=
 =?utf-8?B?Z1BLdkVpWnRqQWdnRlR2R3JBd3dWQlhKSVJDTVFyNndSc3E4OXFlSFFqWk53?=
 =?utf-8?B?eFR2bVlBOEtaZTQ0UUJpQ2Y0ZHJuMmFnVjJlelFZdHlsVThnM3hPdWN3RGoy?=
 =?utf-8?B?SUFCcFVDK2pBOGEwVXlDR3hLeHRuZi9BZ3ZONXQ0SzBmUk9LblVHSDVhazJk?=
 =?utf-8?B?R1ZYZkQ0Yi9IU1dMK3h3L0x5cU9Lc1QvUit4UGJhZEZ6TFYrRFVFeVBHVzlR?=
 =?utf-8?B?cDJQa2JDdXVnaUU0MHZGNlU0RXJhVHkrUzRucU9BYkVzb1Rma0NJUHNrWml6?=
 =?utf-8?B?VHU4b0lOdmNYOFdoTkZuT3ZWTTlPcWxDU2NWSUhxTFVMYWxsVVB5VTFkSG04?=
 =?utf-8?B?ZjB6VlI3MkJXUTVIVzZNR3oxWFlLRlBzazBmY3RmYXcyOUJQMlZOMTQ2aU15?=
 =?utf-8?B?SUM1MEtvamRveDdHdUpSUml0aHpDWlZIVjhSV0NIVmJoRDlleE1qQmE5bkdt?=
 =?utf-8?B?dHlBNFNKTTlJc3lUWmxMcUN2Y1pjM3Y0dFJYNjI3NkNSRDdjam85UTFvUDhB?=
 =?utf-8?B?VUhKa0I3STd5S1FkQldaRVFzb1BEZlF5SDhNMi9ZdjZ2ZlVCVi81bmFSNElo?=
 =?utf-8?B?VUxmNkZ2dGllS1hhdkM4TllEOGhQTmt2eUtlb3JGYmZrYUlpZHd1c1JueldU?=
 =?utf-8?B?dG5MWFN6THpRTTc4ajc3YkNYV0h2enFndHoyN2hkeldGcDZRZmJITlhIMkM0?=
 =?utf-8?B?LzVpMXdqR2JDUDA5ZGVnbll1b0ZSRHcwZ1VidmFtUm9hR2hUbmczaktSRGF2?=
 =?utf-8?B?cjEvRmFYS3pkUlJ1YW5zbXpSSVhCMThZNzhBOGpCYjdsSVpQMDVidlVEUG1P?=
 =?utf-8?B?T3RveEVOWUJrKzJPMDdFcGFsSHdlNlRLUW5mSXhoVDVIVGRtMXliOHVOM1RT?=
 =?utf-8?B?d3kwM3NhQ05aeXF5NTB2amRZc0NkWTNaOWIybm50aW9sM2VMOTA5Wkd5K1Rq?=
 =?utf-8?B?eWtSU3VCcVc0eXZmcDBkYko3ZnViOWNkUnJ1OFpaV3BZK2RvQmtjZXQ4cG5v?=
 =?utf-8?B?ZlZCNVVER21EamNyTkl2NUJMUWhlVGhEcEladlVGd0k4QVNZWjZCWWJQOEZ2?=
 =?utf-8?B?Q0RyTWlzekIxTko1Z2J1SFJqMHNUVURLM01YUWM1K3hLalplc2J5NXZjMmR6?=
 =?utf-8?B?Q0hQOTNteUdLZ1FJejBpa1M2dW5CQ043ZGRuelY0L1hmWjBYaDFFY2N1MEZq?=
 =?utf-8?B?TTRoNzlyVlJJVmU3ZW1ZMHVxemY3eU9rT2czR0JBSE5yaFJQSHArVTl6UVlG?=
 =?utf-8?B?bDBVOVNXNHluR3ZZQ1hXRlB6WVdKa2VwKzF1bUUzUlY1MjdIM2h0WUZ0cmhs?=
 =?utf-8?B?bnRGY1kxaFN6R0JrdFZ5RHYyZHo5ZndQdFNJWW5sMW53RUVyMnR2c2hPSUdj?=
 =?utf-8?B?TFNDbE9FVk83VUE2MmlLTmg4a3pPZFQrTitvVlJLZXlYcnBlQUMyTll5Rldj?=
 =?utf-8?B?bUNBYk9mUTVFT0JvRTRaTE9jMU9ncXZUdmFMODFQU0h4UVRDeVRBZVBQZnJB?=
 =?utf-8?Q?0sfhj69c4FHnSaJJCwpVDyedngB0CbfWn7QE8fl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0abf47-2771-4767-3193-08d961754843
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 11:51:00.2026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKAcGMgYKRleFmwe2rfYU9aYzrDFOiS1B5WQVEySDX8IOp/JBttbKdwqvOYCH5+pwcgiG78HEzmha/m4di4slA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 17.08.2021 12:56, Andrew Cooper wrote:
> Some versions of GCC complain with:
> 
>   traps.c:405:22: error: 'get_shstk_bottom' defined but not used [-Werror=unused-function]
>    static unsigned long get_shstk_bottom(unsigned long sp)
>                         ^~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> Change #ifdef to if ( IS_ENABLED(...) ) to make the sole user of
> get_shstk_bottom() visible to the compiler.
> 
> Fixes: 35727551c070 ("x86/cet: Fix shskt manipulation error with BUGFRAME_{warn,run_fn}")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Not actually tested.  I don't seem to have a new enough GCC to hand.

Compile-tested-by: Jan Beulich <jbeulich@suse.com>

Jan


