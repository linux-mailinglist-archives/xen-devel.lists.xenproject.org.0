Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C549B53F78F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 09:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342991.568116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTum-000324-RT; Tue, 07 Jun 2022 07:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342991.568116; Tue, 07 Jun 2022 07:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTum-0002zP-OQ; Tue, 07 Jun 2022 07:46:12 +0000
Received: by outflank-mailman (input) for mailman id 342991;
 Tue, 07 Jun 2022 07:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyTul-0002tu-HW
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 07:46:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2807bc1-e635-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 09:46:05 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-2AHxPTiDPIy9Vb68RN653g-1; Tue, 07 Jun 2022 09:46:03 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2892.eurprd04.prod.outlook.com (2603:10a6:3:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 07:45:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:45:48 +0000
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
X-Inumbo-ID: e2807bc1-e635-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654587964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ff1Ip9EsM18YRgzfQAU0fgBNQDcFsnC4bdh+5wp6gHE=;
	b=N+zF2jFgH9oaH2VZNO//FSvKPQG6OxfgV+qJuC+HfNEyz8+c1dDIsh/NeFya9Wf+4yDk9h
	iX33IoKObXlS0ghnmS7v+jlO0KIkbNg7RsY7EYeQxwYBUWnZK+VT47szWrIornRKEa2FDC
	/onXy0PoSuD8kr0KROGFkgnylWEPpEw=
X-MC-Unique: 2AHxPTiDPIy9Vb68RN653g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/CwzGdAwwb803NOdAUcXdWHtqTdJueA9TJ6sy1BGejaQryzclYHScbnOuoVDKMytvjlQ9gdU88uyiHDsHvtz6kHeempoiBWPXYjFy4q4qeRFaVN+a/oqvZ3P69qO49EfC9kHB+rSoaLE1kQ9pXV1R+abuqDpxXUQO5U3PAttmS978jc9Us1KhD+vHMGhnzm+N3dEceeiLg6ajZO9PhSTEc75FueA5ZcyZjwUhOcdbdBc+18jGUCwDxR8qBNpwMUe7Er8T7Fp7S6HwoJwTQo7whQHjxZI/F3rTp7Raz3ziHx/HXYPJduL2IP3GQxU0RM7v4GHalqMfpv1IBD+D5Seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ff1Ip9EsM18YRgzfQAU0fgBNQDcFsnC4bdh+5wp6gHE=;
 b=NxdhpoUgkwtewJUkTvnm9VJ2MVEPENo+utiIr+UWKs/DbTeSbC/MofdnezjbFZ82sH4ynkJ+kH+WicwLplKTjF4xBBDNmFan0mqm3OxjimbGS6KWRZJKUwnE1jyPx+1UszGKKCuVYfULtuv4PE2OGk/lttPJELWlrEkV77abEwA5QGRE3UjqJszwyF4sfXFa/BYo94mfyDSx37vUq4zsx80UoB0LVeSNw7JVCdllIJX5BE434PIVJJBxQ4/xkc+nZ3sZ7NyiGNL76p/ASRjovlj64viEKpjzxZVh4vy3ElL6491tx4r2d1ObKIvz0MxUyOmxtcEpufAl1k4+Cxp11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ff1Ip9EsM18YRgzfQAU0fgBNQDcFsnC4bdh+5wp6gHE=;
 b=U35rvm68jxrvC7spb63JRePTVuzgrQ5NDWDUN+ZH1bD/FeOrTAAkPd5VuWfhUa+yqWpdnqAuELdlnAf7XhN0n5cLQhsy93lG00StKKb47M6eDT89H5DDuJ+NX/Jl8YsEb73vkRUM85T8FnZLdl/V+GLUpPjvAiE2pv3Sj0CaM4pTX0ZzxFZ1NofbIcYOVv6f4T/uXoU7i2dXRevlqvw/HFblc6n941+VDBV/gyNjLA8DPGL2e8Ngl09L3wLuBbb/oacO3Qu1WnpejmmXRxqSEeqIKCQSbdqY2ss8cyohx56z582bNfgdTpfJ4htmOc4PFaplOCSjzUr9QTvXRTWPgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46f151c5-b7e3-527b-a7c1-4d06e612eaaf@suse.com>
Date: Tue, 7 Jun 2022 09:45:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 2/9] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-3-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220607073031.722174-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0044.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6157a1ee-46a1-4b5a-8410-08da4859bcb1
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2892:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB289231C16C35A50ACEA40B83B3A59@HE1PR0402MB2892.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c33ayWG5JlZphnsYbftwus38I+R6aHwT5yY9EwhbapRhEmX+BwWNMiR7H1MupUc8TM9dkDynDvhviAKBCdJnmqSAYuMpqkpn3J4u7Jzl4KMTuG9u0iLjuOPD/ITpfFwpL/fqpZev60shXoXl1poJ1I0mX4QQoSv7Nxppp0g2Yans5TQGWmTWNH+Sm+zHjxYwor2986UlzFxneqAhOyQpdF5jGpmvGwtiE0Ic6zmaVgjB+I9eogT0PogfchdlqKxrMoQQ4PJATJXLjz1JSgqQazW03hkHrH/e4TaKLb9/hLjQE097MzNxeRJuuqf783QLKXvNE3Y16rUa7Gcwg6MSSYpDOA7HQbWbiZCgirn7XsZfm/AoJpu4J6aUlehShENoNR/wpVtMkLzqhW93ndXWjtxuT6lMFGrDl+a+CvNBl+vWlnMZfFQ1HHNDbylDncgA0yLZZZw5eCaMUKL1wY293TvUbqp3vsPbFYUmO92veUnCao0efKbp4sqtu9KHGVGlA12QS+ZMx5Rqz6NXA4EJ4DiLO8zVqBCAuW4au4v7SZSRWS8b/fTcPe17ViJyMNPDqj9xsSV1ZuSoIfvruv+1rsdq9cpgwKRD0Szw7KSFLwC1ydzAES0zFZcqf+FnqaKJ0EXdIZzvMz67KE81iq33nH75c7QQqzrZvaSITXvRn4pOnWqfXD3NKAyn2PXC/gLU+RLHaPoE88TP7ZLirGZ4t+E1dC6G8MQT0a59ZXCupOeSFXBPe9eEMoXODh4akt6e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31696002)(54906003)(6916009)(66476007)(66556008)(66946007)(186003)(8676002)(4326008)(2616005)(7416002)(6506007)(53546011)(6512007)(86362001)(26005)(6486002)(2906002)(498600001)(4744005)(38100700002)(5660300002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0hFTFZmOUVKVC80Mm41ellCdSs0VEhIanR3aHdKYmJNOFVkZVUza2tvNGpD?=
 =?utf-8?B?Q2lpeHFlT0xNajJDQ211TitES0dBMnJ5RnJuWUhOMlhhL0dSc2ZBT0xPTXVV?=
 =?utf-8?B?Yk44TGN4ZEppVDhkQ1VVK1ZIOUJSZXBXK1FYTlpxUWZvZnM3Z1hnZXFOUUNO?=
 =?utf-8?B?UGgyNkRYNkVlSmQ0N3JxQnR6cG02cmpmV1NwV05zdnZDaDcyaFdoZEptRUQv?=
 =?utf-8?B?R21PbkR3N0ZvM2U3UFBMNE5jTzd1ejNkRkhrT3NuVHNzVkczalREejVEdXA3?=
 =?utf-8?B?R2Npa2xLU1NWQmpTTEE5ZE9NaVYrTGxrcENORytiVHdxSGViN1hYTzFrNXlr?=
 =?utf-8?B?RXJST0cxYXN2NEZGNUNleis3dGUrcVBNL01JUTRLRU4raE00QnVySTJYaExp?=
 =?utf-8?B?bk9VcDl4c1BiUGZLZm1LOGdpVzJldGl0ajdmbDdFd2J2UmVuZ2NHSUJ6VTh4?=
 =?utf-8?B?MWZOMVdKWk0yQUEwdUFROFhDSFpuMENiVEsvenVQdlB1YUdZMkZBb2ZidXFv?=
 =?utf-8?B?QjkzZEpXOGhnUjRScTdZdjVEWkd2VFYwa25jbkRabUUzYUFHbWR4cWVFa0tw?=
 =?utf-8?B?TzEzTmZ6N0ZQb2xqRFp3Zi91QkhRa1ZIRmxnUzAzK1M5T3IwUEsyb0JTVmtY?=
 =?utf-8?B?YTdwQko0MDNRejE0NVBrcTlJeU1COXR5MncycTczT3ZnelY5V1dmY2ZwRy9h?=
 =?utf-8?B?UWxQZHJnclBVZjBPczNiOTF1emk4SEt6aWpseFBmSElvSWYzR1F2SEI4UjNl?=
 =?utf-8?B?RzRYc1NuQWNITFhTQkNiZHpQMVVBWUVDNDFBNGRZK205Mk10K2xMVEYzTFVz?=
 =?utf-8?B?RzZrek4zb3V1VTBDSmxYMTh4UEJ3dXpXRmlEcHdvZkZtMGNaOWJremxxM0Rt?=
 =?utf-8?B?bUlnNW9rOTNodWJ6a2xkY2IxQzc0OUZ2Y2NSYUwzV1dOcUQxWWtDN21uNEF1?=
 =?utf-8?B?NTBhbGVZQzBGSFpYaThuTXUvSndTdFhvNVBKSHNQczdMV2p5cTRqeXFxcHI4?=
 =?utf-8?B?WUNPWmVMWmsydGJWeVp4N1ZhWVpLdGhYdnJUb2w2OWNXaWRneXlaYThVQktm?=
 =?utf-8?B?WDlSYitTY3ZOTEtjWVhvbzNkRTBkVTQ0aUw4WTJhZlptUGVrYThlOXBxVEI3?=
 =?utf-8?B?eUdqcUJQblFvRFR1dmtxcUFjL1ExYi9md1doWXVwcjlxd0JLdTRWOWFDMHFx?=
 =?utf-8?B?Mk1Yd0dCVVAreDFpQXB2OW00UVdWMGhzc25aQnB1Zm1YYjhwVkRwUlZZOSt6?=
 =?utf-8?B?WEkyYmZkZnIxYU1YejUrYXNkSUJNRlhEUGoyNWxpdVk0U1BHQ3VoL1BpVGp1?=
 =?utf-8?B?QVBDYVJDN2xiWDV2TThwc0Y0bVBBdkxraVFUNG4vL3hOOHgzU215bEE2Qks0?=
 =?utf-8?B?UEtjTm5YbVV2YU11MkpZekxmN0Jzb1ppV0I1UnVmM0Y4SXR5YnE0ZGlqN2Rl?=
 =?utf-8?B?THdBeEo0TjZaTVFTSlNuVlEwWk8xN2xNMWJvSHU1L1UrR0kwT3J3cUZIZ003?=
 =?utf-8?B?MC9pMmhwZ3BSRk8rSWtPQjhVdmZ5VmdnNEovKzhTMzRrbE5lS0xRZkkxaVhB?=
 =?utf-8?B?U3RHUGlqdGtpYjByNGFaQ2JwcWtjU3Y1TFd6WWVjVkNETko2UUZLb3FqMnBY?=
 =?utf-8?B?NHRMMzdrRXZHdGMxS1dDclNudlEvRzY2cDQwaENKaE9nZGJvMGgzTFBWTVh2?=
 =?utf-8?B?SlNHWXJMU1MvNWU1Y1NMRG9YeVVjQTJmMmtmbFQybXZ3d3JLM0Z2UGoyZjZl?=
 =?utf-8?B?YXJadGxQTHMwS2xUY2liQU13UHl6U0hLNWlKZlplYlN1Ujhwc0ZaYWFvMnFU?=
 =?utf-8?B?MVE3MVBmMXQ0VFVERnlyVW9aSmpRUkR0V0NSMWlyallxYVRPVHFENVE1eFFz?=
 =?utf-8?B?V1hwdXlBb3BzN2NnaFdtYlVQc2p1SGVRTGZqeGExUi8vSG9qb3p6M0V4K3FG?=
 =?utf-8?B?UzUwTmY5RVVDRUNWSXROWFYwbHc1bGs5a25waHdQamxoS3ViMHQ1Q2RCTzRU?=
 =?utf-8?B?NXNxeDZvMWc1WHQ4SGpzT05iVFAyUVNOcG5URFZWY3FGUnRRdEpHWW50d2hu?=
 =?utf-8?B?RmcwdjY5S25qblU4Tkt4K3J0RTVPczJvK3J3YytqWXcrTzFlQStpd0hJMFpB?=
 =?utf-8?B?aEZYWGFua2J1bFFKNDdRNXBiQlFhNndWTW8zMmx0NENDbmxFcFllQ1Nwckg4?=
 =?utf-8?B?MEdiRTZwYkhBNUNpMWc4a0trcXdoR3cwV3dJaGx3aGNBbDR2cy85aUw5UkFl?=
 =?utf-8?B?Mkc0MjV6N0ExVWE2c1R5aDZ0SXJSSVVGSFVhdzVOUFk0ZHZITkxRS01JdWps?=
 =?utf-8?B?LzVTMU9zUHNIcXV2Mm9USFpvR0VsU2lCSGo0VGhBQmdJQWhIc3psUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6157a1ee-46a1-4b5a-8410-08da4859bcb1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 07:45:48.2323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpakXyxUhy6Mad/155Gj8FZ+BNB12val6agMlfA67UEfZz+gSClv6BPyD/9naeWT9ZvpIrrbYVrerDdoTEdN0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2892

On 07.06.2022 09:30, Penny Zheng wrote:
> Pages used as guest RAM for static domain, shall be reserved to this
> domain only.
> So in case reserved pages being used for other purpose, users
> shall not free them back to heap, even when last ref gets dropped.
> 
> free_staticmem_pages will be called by free_heap_pages in runtime
> for static domain freeing memory resource, so let's drop the __init
> flag.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


