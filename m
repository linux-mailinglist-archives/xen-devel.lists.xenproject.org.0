Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E229649CFA5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261017.451487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCl7a-0004lA-72; Wed, 26 Jan 2022 16:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261017.451487; Wed, 26 Jan 2022 16:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCl7a-0004i1-1p; Wed, 26 Jan 2022 16:26:10 +0000
Received: by outflank-mailman (input) for mailman id 261017;
 Wed, 26 Jan 2022 16:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCl7Z-0004hv-6K
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:26:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7232141-7ec4-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 17:26:02 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-_UmGEDB0MjiyNPnp3Z_Iwg-1; Wed, 26 Jan 2022 17:26:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4647.eurprd04.prod.outlook.com (2603:10a6:20b:18::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:25:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 16:25:59 +0000
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
X-Inumbo-ID: a7232141-7ec4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643214362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luucFCMsAoI9aYqg1BjC3cocxqtbGm9oOWTDcbdrRcA=;
	b=U+Ki79XGKo53Ryv33tmEqcZnHr8uz/pCxp+NdsbiH3zptVsdgJkwPDj2ScAmugQDZJ0kC7
	DBsW5/QP09jFDD4ClBWwyfp5n630BbBcM5Q57bKhMQiSrYeF79I6F427ZkFpwpSXZmujJO
	QvGxvBvtcQnz9SwCZ9QdRsa4voujW/s=
X-MC-Unique: _UmGEDB0MjiyNPnp3Z_Iwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2i90S3uRWhcrWNcsiR/71uYY5lfh3fToeil/RzMrZcUYDAwPS3JUM8g/bmXGquwqLn3gLARU/4HyxG3lLrGogupGn2ERn+ydLdNWnAZvzlWfI7DzIPG1n5Rggdp/333LG9VwDCxQ6NvlAs8Nl8qFN8AJwYvonc6ioAtPMcqouWc/oRKAlknGaV2AqUbB8Bzz+nLBoBCbLQlLqduRzZRbY3nLgEBJHL0npY/D0pjvyvfCmr/aW+7TBkIhfchwd3ExnX6GaJjTQEpWNhnq4VnOzB7QonefOgLdK5kII+t1b2P8ypKhl1YGDX1wcgTBCBGgbDpctBMiD8DKb3Xn2LYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luucFCMsAoI9aYqg1BjC3cocxqtbGm9oOWTDcbdrRcA=;
 b=oIL/icJ6k9gBFYkgGF3/BL+htdkQbtPjqBSht0QontMz6EHVC+tD6xjl/SOTNIbBFOXfm5sOlVDnx/1I9b6EF77BXt2vBlwEaNqa/Pn4dag1q4Yi/mJsYKJD5jIIe/lQCmc2vDodlOTvP3H57mRuCZm5G350EzbePIF4351LYM4VBiKgT5SxDUWfPy9ZQPNVv2vQqrS7U50Pl9306Sr73argKMOmwlbX8uyrHH+zvHf27e0G7VjuyZhSIfOOSSkHAalvFVHszPhRF7N95VGr78ou8EiztR+OXB5YLx1mQgk2cOg63nCoprT0jZ3ngvPPrxxHCzTpTA8wJlOvuJQoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <beefcb76-7e97-9676-cd10-4a8b40e597ce@suse.com>
Date: Wed, 26 Jan 2022 17:25:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] xen: Replace arch_mfn_in_directmap() with
 arch_mfns_in_directmap()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220126155919.36706-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126155919.36706-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0022.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64372c92-2cde-4810-0b41-08d9e0e88933
X-MS-TrafficTypeDiagnostic: AM6PR04MB4647:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB464784D66FAF28BDD2DAF5ABB3209@AM6PR04MB4647.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8a56KdPyV5JNYQqPTL4qQUs9FSwCaPrSRqFztV9dIAGzwGk0VGcvP8a8z/R2Xz75I739nV75S+MuloUitv9MwLChF94DqEqz0wpNFg3Bu8qMHsyNVWFq1B1XGgFWGo2i7a5ETxRweSado9va3WiVWYS5JZ32dr6VZuQhqBMXy4olva+Qbmhf6N4VtIgWUI9jESljmkZtmhO/B15lTDpIkUqt2TaerlUlRbJq79EQqZjgBYPkrQ8iISznhkSMpYHKVWfEjZNL3ry0vuWp3grJ1qlzofIwY3aoOu5RcMdV4JiAUGrWORktMzSEJYB0f/me6WNPmwKnFrU5LrmLpcnfd6Rb6hq1WJPg0pY7PfeS1gz6ET5mFtvMmOYXJ1UHeiNjcW6C/Rn1dJnSH8CwNNoHSikBhVuEQHOYTcie1kvqMRkZ/iU57oqYwsUpP22USb9TQOA5PVDytrKeLKK2+x75BQLG7DZsmlxZakodj1L1scEGARAG7gPMOqvhx5zqW7MEhE/r6jzIYN9dn/0njHmy8oifocwRjLMdqQjgpw9xFibxUsMGc/fHfeIRY6+5Tej1l6vw4xbg9+ptPwzF9lie/WWphWWu7gBVtX3oty0pKBpOoLPwWFVQe5p+JahhklSN+SFNbS5q2ux4sNLDiS7YL8BPZ76AFQaQf/eSpXV13I+4e6P7x/pyBE5oMB7kobvWPHmExycS4rrPXDn/1ukYScirnLKGUI8gDjoKOFXA0hbwjk7jn6coXcwmfYbvjufg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6512007)(5660300002)(6486002)(7416002)(36756003)(31686004)(2906002)(53546011)(31696002)(86362001)(6916009)(54906003)(66946007)(316002)(4326008)(66556008)(66476007)(8676002)(8936002)(6666004)(2616005)(186003)(38100700002)(26005)(6506007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHVrNE5IZ2J4MVFnMG11Q2FIc3FwSitqdFN1NlppTm5uemhjUkNVdW9uaGZR?=
 =?utf-8?B?c2puV25FaG5SMkQ0Y1NyQ2tJenU0K3kxb05WU0o0c293YTZDaXpOMFJjNGpL?=
 =?utf-8?B?L2NZMllaWmtuclVrZGtBdEwxNmVkT1A5ZHV5cnBNbHl2aTNOS2ovdllhVDIv?=
 =?utf-8?B?V1VzVytzMnJtaEJHQ0FKOG82N1VveEdGMU9FYXZaTG11dVZMSEZNdGo0Qlh1?=
 =?utf-8?B?WTJyVkRWUC9xemtFeUFhUGpVYXhNN3lWeXZUR1B6MHlKTVBDaElQLzJiSG5n?=
 =?utf-8?B?K1g0UG1na0dYT0E5eWNpNWZPZi9BbXBWQnlUZTN5VFo3RzRrbHdSWnVPaE9M?=
 =?utf-8?B?amFXRWhCN2c2OG9LVXVNNWc1bG1wM3JWMXBqSWZmOGRreWh5bEkxQmNzZEFa?=
 =?utf-8?B?WWY2STkvMmlMUkZ0elMzRFNrQjQwa01tOWVRSjdGd09teFcrUFJpRXBtN1U3?=
 =?utf-8?B?dml4YXVlbDE2RU9scCtnZGoxbzJIU1h1ZFZzbGMvUThFNlE5L3A2aVQ2c1VG?=
 =?utf-8?B?REplM1RsdE5IcjdLZXQzS3NTcnVUb0k2S2NCWU5WNG1BaERORjIrYnh6YmxX?=
 =?utf-8?B?Y01zVUhBQzQrWnBzb2lrY3hlRmVPZldqWnpCZDkvKzdvTlNOTFBOdUovODl3?=
 =?utf-8?B?dGxTcG5ncTZFM3p3ZWwyU3N5Vld3T2hibkI4MDdOQ004a1E0ekJObmlUY0JK?=
 =?utf-8?B?MGx0cDF3UFBMNUhIMlhLeU94R2h5b25LK2x6R2lOTFpjeWxnTVNNdCtudjZN?=
 =?utf-8?B?aHlFRTN0V0JBTndjY0gxZ1R0ZVdkWk5ZRDZibGk4RWgxMDVrcXVKZS8xMTN1?=
 =?utf-8?B?TUkyM0xFYTdRbFpEOFB5Y09RK1BySEpGUHdsQU55K3NXSTNCbENYZjcwVGFp?=
 =?utf-8?B?NVVSWlY5cjUxTDJabC9qQnQrNW5MSk1obFk4SmIwalpPY2hLOWt5eXBPbDd0?=
 =?utf-8?B?cHBrUVlOaFJoLzg5T3NqTzdpSmJvVFdHZWt2TVpRVGVmUVZkZmlKb2p5blB5?=
 =?utf-8?B?dDBkTG5qUkhHclQ4SDE1dFNQY29UUjJITnNjUStkME1ZaVVCNlFqQktQWEpv?=
 =?utf-8?B?Q05HbTNobHhzSEt0VG9xa0FSdFkxaVJ0VTliUnVwdHJ6YmVqTTVQR2IybE0y?=
 =?utf-8?B?RTBMTnk3T1hZbGh5SEYrQWYxRGxqZ1NybGhXQ1BwUHJFdFJKUC9qV201M0lR?=
 =?utf-8?B?RGltd2NvVllMd2ZTUDRISmMvcWxwbmFnbm1hNGhudGxVeFVDbWk0Z3NPV1kz?=
 =?utf-8?B?eDZHbTJpWVMzME1LTDdsWjhZMWZ4MHZaTWU3ZFBPd2RaR0o0eUZzVk4vUDBv?=
 =?utf-8?B?TlE5azFxLzA4NGtHd0ZaY0dyUnFxNXE1MWsvWGJMNjRKL1VKYUpUb0VCRFZs?=
 =?utf-8?B?bUpHWENGNktQWTlzTU12ZExUL1RqR21MR013UlBrbnVBVDE3bWd4V280eTN4?=
 =?utf-8?B?dzYrMC9XQlc3dit4cWkzKzA2U0tWbFdQajBsSW1ybFAxM3JEd0NaRm9Pa2hI?=
 =?utf-8?B?dHlpWFI2RFVOZ1JlNkNCSGZGbkM1cnZvRVNtNThXRndDQVlFM1NQZVBaWlpo?=
 =?utf-8?B?ZHVIZSttMW5PMVpsQmxaYk1iSE0rcVg5ZUZIM2JHaXp1bGthNlBpNEVZeXZ3?=
 =?utf-8?B?bzJkZTJ2aXhJL0pMdXMvQ0lBckJSUWRwOStzVCtEajJ6cFc1dStuZlQxS25E?=
 =?utf-8?B?T3BQZkxmNjhkckRQQmFNcHM2SjBkMzhpL0NZVE9OQThYODM1YlhiQXVRbmdG?=
 =?utf-8?B?U0g5WlZZUUZ1U21KdFV5MThScnQrK0pwS1MxWWdRSmNKREtNTXJQeTJJVm5k?=
 =?utf-8?B?QXBqMjhGTzFIemo5T2VQWWF1ckEzbFpFcWpTNmJtNDhmNmdCQ0tlUU1tZzJX?=
 =?utf-8?B?MTJGSC9FSWtNU2dNTmVNbFY2dktLR3NXOXNpOVBuTmM0c3dKWlk0c0x5TmlF?=
 =?utf-8?B?UkZGc05XVWREM1pjN0d6MkdQaG8vdHkyd292YlRDb1VPVTRTS0tjL0Erb044?=
 =?utf-8?B?TURHeko5Z1VRaE44R09mNnpudXVpcmdHUGt4YXdpVzdtSXYxRGM1b1NPd3hk?=
 =?utf-8?B?OEgzTGlQNHBuQmxKQk92UXhrUldZaVRYNm9hN1NaVjB6Y2hHQTVkOG1wWWt0?=
 =?utf-8?B?RUZ2Qzd6aTBhZ3Y1TmUzMDB0cEZkWWFTY3RQQnA1aWRHczZwakg2cWlLTlBz?=
 =?utf-8?Q?ITtXGpDkOKwPfGH6efjQ9T4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64372c92-2cde-4810-0b41-08d9e0e88933
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:25:59.0369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IH2UiQz+T8AJLTTbabGqVMZYAolWwjdfnMfAhoB/STLRZWgl98opJf4MsGQdlHQS0TjZjI+1TLFGQyHG7po3Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4647

On 26.01.2022 16:59, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The name of arch_mfn_in_directmap() suggests that it will check against
> that the passed MFN should be in the directmap.
> 
> However, the current callers are passing the next MFN and the
> implementation will return true for up to one MFN past the directmap.
> 
> It would be more meaningful to test the exact MFN rather than the
> next one.
> 
> That said, the current expectation is the memory will be direct-mapped
> from 0 up to a given MFN. This may not be a valid assumption on all
> the architectures.
> 
> For instance, on Arm32 only the xenheap that will be direct-mapped.
> This may not be allocated a the beginning of the RAM.
> 
> So take the opportunity to rework the parameters and pass the
> number of pages we want to check. This also requires to rename
> the helper to better match the implementation.
> 
> Note that the implementation of the helper on arm32 is left as-is
> for now.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


