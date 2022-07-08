Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1950856B3C6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363263.593736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ifv-0004z6-Gp; Fri, 08 Jul 2022 07:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363263.593736; Fri, 08 Jul 2022 07:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ifv-0004vd-DT; Fri, 08 Jul 2022 07:45:19 +0000
Received: by outflank-mailman (input) for mailman id 363263;
 Fri, 08 Jul 2022 07:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rYmb=XN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9ifu-0004vX-2M
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:45:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8a3a012-fe91-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 09:45:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5162.eurprd04.prod.outlook.com (2603:10a6:10:1d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 07:45:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 07:45:12 +0000
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
X-Inumbo-ID: e8a3a012-fe91-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEywP+ml83p9L+uFRi90HyAvxHLOLdT729HPtZck1+cGDftSd+pmxVicjSxSZkvSbCyRLljPfv9S8LIkkw9HyE3RbEyEntxaaCpwJVQUf3Lozs8kqAqLNw5EWuM+5JrT+KoOdxxGxBWscqUYx+MFT5HF/Yuy/P5hqFIhx+pJV6tvbOEqOaif4fRh18vDqE38xqynA2hjE0dQlMUY6d8HT2iFalwyuOvUbUZ2wcmnau3nwkHR2ti3A4aWcgnC++Ntwq7M2Q2NelGPdxPQL+XVXejncJFVvBxXizXyNCcOcyq/bl5dn7CFk44uqJ+tA+m53f9ogyQnGjGxaOZVP8w8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4eikT7UR16x3SJhXouZIDaPJov9z+zIjrxXq/Q14iI=;
 b=TrlbbkfcQ9TTm4mpbRxpdAczmgYnZYEn1HgoGx/Uam1HqgWqxgPRBLqjsay8L14zKM2BtqhQ86UDZdJqWIkOVflsdmU1thGDW+AOumkgRNOUEewiSSY0C/p3IXAnfnH41DjDOmSpV6z5YzRw3Sx4e6mTxQq83nj9lZpA/nozG41LB0PI3hja7kMVhjiqV1qNWRTimvNYaQXXjiuoVwReXhEP1X4NZ1YGrsQyiiPfH0iKFEAO/QRVNlWPalqA5WpKP0JwupcNn/Wr+nNSPFQpRnnsSSXb6mWh23VNa53ic9o42WKktlPh9aLRm2DpHmnsKWW48gGPaY+gxbEf2Wf63Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4eikT7UR16x3SJhXouZIDaPJov9z+zIjrxXq/Q14iI=;
 b=bzfznHuph7j7S2aleIa70rkQbxqjOuWxsaiAbZGqs9OzT1PxdTl05G/L3O9xRY70icyS1UziZpomOlwkJ6u4+J0qLQcSCTmHrohL/8Vl9l8xUpHr2NVd9EdINFkP6dVxd8v6EkWfVBTwHPELhrB/P+4dQwicGMjXxJ0MG6ew9+EFhBHdRCD9VDXROxDcM83Q3I1GPRmc3JaVoI8wNWNSuh1USkFHUjUEQgmSwiko8Jcz4uzoi7HERrhz7atnp/w12Cr5w1/RvXoXSNc3tIRZlxCdYkW3dgq058N2/DA7UqcD6w7oOff6mKKGt17tCNA6O7hmBpF1xTLkr21BT85PcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22d754e3-f01d-4f4e-8a34-e8af65ef6437@suse.com>
Date: Fri, 8 Jul 2022 09:45:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] docs: add reference to release cycle discussion
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220708041258.10349-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708041258.10349-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e471cd97-5cec-4b8d-b051-08da60b5ca64
X-MS-TrafficTypeDiagnostic: DB7PR04MB5162:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZUcJfJtMEI/1WwV2AAiTRNE8mJY7B/d0XWL6acjCzvUvavV9RDoqgI/sn9rOCpp+tbj6Fh9tpy5A0Kjrk1WOg/Evzkhge9+QWOPEqLNUTD81iXceOOH6DG9TIliOvziAMQ5SjB/PFO2Dt+lMzklr0R2S4C6wgV7vLvzwCh3bgmZ3hAgqZ/FPUy4TQqIC4VzAJstBWhZotrB8A8GiopxnuoumxLVMpeMLpe9gfMWQaFIgZfb2ROyL5U79ZWgj0HtZKcsD8yauJgjnDxw6mcS39h7ksKfqmJooNrEotCmLyQWkkNmYS93l+elYpz3gbGwmzjAR0t2rGbBRA39L5598iM7u7Jwl3Hu+C+F/4lfJ4RY+8NDluduLxTdntVtOKGtxFWu4ID+FbP8+CT/oyAqQmDHV6k+5WruD7fxknwSiriLtaD4ka6M3OTHI0vgLrR4vrJIan5IepWKyIC15wtgKy169SGyzearP0+S3MeeT+pGj3KpArOsnpyTPKgM7UFKHT/8FMCdKnaZrqf8ercYBKV0mOs1RPJ7/mLtogdvqljYz7uJ2mUtRuoPd0OJd6R2ql7R8KIRKwZP1Rzz7AJ0633wcmc9fzkAcKn3dIMBPHKBTZWBOrwWM8tq3SQgV00s0lqg8AvAtZsoq4/Yk6M5BBr86BgyPyt+wu6nx3aommQrLs2nVQGkA7p+z+GwnDr2LY5Xdo+lxYM2BzkoiPRKA03SYM+RPhcZYh3xQWwqd6X+c7wbGA2p4jb0D7fjCxCe4i9e5UfUWAw3urt77Cyypd+ywyIgRgnKIVsgOAH1Ou/EwQUfTauTwKblAyEu1QH7176I7fKZHZlqM23eR+VO4cerb+EIV6+Lkzk9i839FvWQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(376002)(346002)(366004)(38100700002)(31686004)(6636002)(2906002)(36756003)(37006003)(54906003)(41300700001)(66946007)(86362001)(6862004)(5660300002)(6486002)(66476007)(8936002)(66556008)(316002)(4326008)(6512007)(2616005)(478600001)(186003)(4744005)(31696002)(8676002)(26005)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmxmanVaUXViMHV5SVlPNnNvMEpiUzFiSUZUcitoQk9uQnlqRGcyajhyOFUy?=
 =?utf-8?B?dWV2Y2VjOXQ2K1V1R21BSEhNdXNOeE45NlViMkxmbWhsNk14L3lwUEE0YzJG?=
 =?utf-8?B?M0Y4K1BQanFQNHp1S3JDWlEyVjMwK2FRZFZvck9jYWdQTk91QWZaTVl2VGdz?=
 =?utf-8?B?eFJXdUphb2xqU01oVzlHSE11OEFwUWZlZVNndklpSmpNb1NGS1lBeFhNNnB2?=
 =?utf-8?B?NzBlaXNHTnVXVlV5amRTeDQwWnJDVWhzblIzUnB2cnI5STlyU1I5NTJkeDFZ?=
 =?utf-8?B?VUV3ODAwcHpVcmszUkp3d3FxTFd0N284RnBzUjJhY3NIWVRKU2xwa2ZtTTJx?=
 =?utf-8?B?MndDM3FnU2R1enNyd1cvcnpLcUVrNy9zVVFiTzVIK0JBUDE3bUo2OUFsT21Z?=
 =?utf-8?B?U2tlQnBpYXRvMjdQRVdOcThlSU5OV0E2cU55QWVIcXhralcvTk1kdU9zU2Fw?=
 =?utf-8?B?eGdtd2dOcUNlVlp0amRLKytMWXM3NnJnL2NrY2tzdkdQdmk0QTNIekxsWm1N?=
 =?utf-8?B?aVFwZkxaV2V0U3VBSkJkRWIvQmM2cWFHVVZBSzFsWWpldDhQdFhXNlVPTHNu?=
 =?utf-8?B?ZUlPS3gvaUVENEZCMWw0dzA0blpMcTBSZzBhd2Fjbmd3L0J4NDgwOVhwOFd1?=
 =?utf-8?B?YVNSRU5jSkRWVTlwRG90d0VuZnJBaXVtYnpucXRQeVp4KzZYWHZ1SkZDUmw3?=
 =?utf-8?B?azlLWmRBZmhPbndReGxKUzl5NGhpdTJhK0RHY1AvRlc0SUZjVjdybDBhZXBz?=
 =?utf-8?B?SnltSlpYUVpSYTZ1MEtjTFlYTk1FT0FLL2ZOVWxKRXBGakxOWjQ2OWVzV2Js?=
 =?utf-8?B?eGRIYk1Vd0NKVTlJYUF3MUMxTmxNSGJBdjM0aUphanFzQlBOMGd2L3FlbWU3?=
 =?utf-8?B?czRVM25jUGdNRjlOY1RaMnFNeWEvY1BwWWdlUnNBOWw3Y3dEc0ZuNWJlNVFT?=
 =?utf-8?B?UUNIK3ZBNVRObDVkQWhoZGNqS1E0cFpyWW1ocmpCdVJFNG5GQlh5a21ibDJk?=
 =?utf-8?B?bmgwVlBTZlFlc3MvODBqNGlTSThlMWFQb3kvcncyVEZSZU1nSU9oelV1QVkr?=
 =?utf-8?B?V1BoRlkxMVdGWGdIdHd0dHBLcUFhMlFDSGpBSEpxN0NzUUNwb203anVmdXBa?=
 =?utf-8?B?Zy9hbUZRMnE4RjRmUjlnSnN4WjhCRGlFaWxMa01hT0s1NmlpTGVvbElyZEt6?=
 =?utf-8?B?aHpBS0F4VUdWWlY4Uy9VMTNzdWNCVUVpTG1PbWE4K3YweTF0VHJxekU5cmNJ?=
 =?utf-8?B?Q251RUJYVnEwbzlzUisxbms0ZEgxbGVvUXk2bU1JQjRoMENHelBPbFBhLzh6?=
 =?utf-8?B?MVVQd3orR3NjUERzdU9oQ2xkcGdOZXZKeTAzTVMrOElqKzR5Qjh1bysrREdm?=
 =?utf-8?B?Y1J5eVZLZE9zaFBHQTkyYW4zT1VsY2xWanNYdHIxSlV4OUFIQ2RaS3hHcmxv?=
 =?utf-8?B?U2cwU0ozUG1lUXA5dFEyTy91M28vZ2NFWmRPQVBudHQxYjAxRmRDMjV5RXpJ?=
 =?utf-8?B?dWxPZ2ZmYkZxVitkb1YxVGt5Qzg0SjZNeGpTOVVWN0NGeU8yTjd2VDUxWkZX?=
 =?utf-8?B?SDU2RXIwcDhCNkVCeHRmbkdwRERWNXVMaHhqU0owV0N1KzRoR1FxRjRkQzRp?=
 =?utf-8?B?ZFRaTjA0Wm1qcnRzOW1CU2JGR0FyMWptQnBaT2cxVFUxbW1sUHBMMkJCV2V5?=
 =?utf-8?B?ZW1hZWxKUkZxVzIxcVB1Z01oYjV4ak1TTnJhVXN1RGZHMVFndEdJMWxkMEJi?=
 =?utf-8?B?QzBldllDbU81T0p6elFTdm5JOVp4QzNMZGNWbnhNQTArQTZVSjZpemNjdUZi?=
 =?utf-8?B?UjFUYUxmTFJyc3hhTTUrenRQakNvcmh1aEZKM0FKV0lrbDdUOUpPQ3lpelZO?=
 =?utf-8?B?QlhCdmdtelphZzdKRkxwSC85djYzbCt4S0pWTUowK3RqOEpTZ1ZPK1ZFSGt3?=
 =?utf-8?B?VkVtZi9hQ0ZhekN2Um9lOUJ6ajFrTzJacFRGNnN3NHBoTXN3cjkwaUlxbzNa?=
 =?utf-8?B?NnNkb0pCRGtNN0pqa0tRSjlzTXh2RTZBRndQLzJCcDk5Z0VDeEx4b29QSHJh?=
 =?utf-8?B?cUQ1ZVVRc0pJNW1haDVoMDA4S08vdjBOVWtvWVhiUC9BbVhiQWxWQnRWQmVi?=
 =?utf-8?Q?S2gPD6uh5PowohaAV5jvwdGIb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e471cd97-5cec-4b8d-b051-08da60b5ca64
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 07:45:12.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6q9r2WyavcwTZ6TibVt/VniYgYoDN5tJHlHv8o3QKFsM6j/M3suEdh6HeorBp/vuvxubiDYs/nnOuzDTwe+QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5162

On 08.07.2022 06:12, Juergen Gross wrote:
> As it is coming up basically every release cycle of Xen, add a
> reference to the discussion why the current release scheme has been
> selected in the release management documentation.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


