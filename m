Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D187A9194
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 07:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606086.943807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjCee-00006Q-HC; Thu, 21 Sep 2023 05:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606086.943807; Thu, 21 Sep 2023 05:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjCee-0008WD-Ct; Thu, 21 Sep 2023 05:55:12 +0000
Received: by outflank-mailman (input) for mailman id 606086;
 Thu, 21 Sep 2023 05:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjCed-0008W7-8w
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 05:55:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe16::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c5b2aae-5843-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 07:55:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 05:55:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 05:55:07 +0000
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
X-Inumbo-ID: 6c5b2aae-5843-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFtrr/97jmDMAu4dKRxHAju7c+WnH8ZFaPK/V2kteo60NiY+eReDZVhwrJ9P/FplGdiqbybW2kn/iHJSgJew5KaAVJXJLNKf/AZhKBFsFAubFALCcZtxG4mgwSrefjqxLoEdS6BTFfDt859c39wkU89YY5zV0dF47grHozrSlkbFiFtQSCV2WESNRFJiR5BWCmpV74E1YzS2u7R9MzJ65v3nWvMC7YW5YPtxOPZ53kPNKpSouGp511Tq9BS26vypiZlr02poIWk1q+KAfIQsLphL7w7hfXJma8lhFsEKnIjy5dx8qCE0x7Ty0/g5F6tm7cXPt+Nz3pdUgIaeNbQFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwDOF0KLI/NjX3R9cTZSSDe+phdzACtSF9+2umXAX8o=;
 b=QWzCTPwN13qM/8swPCJOiwYK+EllsL+dKJDFZ6ZGJfX0xWylV4x6zaKNWiFKt8S5Ly18ezJdCLSSCzoogLakh9r9lZQp0mvpSu7GrM7WB8w6Ifk3rg0GCb3vJNbVHPMNetXtJNLn2L0aKbl2by2MQa/uzISxCV6VyDm/ZNLrVQ6xy6QFAfDwf3zrnE+ALSPitGa4+0+/CsxGS0PxaN2JZGQxuR+XEPY7TywhPpsPxt7DX6vzZSptW+gGPs2vpBpMeuzzd7nk6JlUQXcd0YQBiozCBY2djaDZTpZxirXkeuJ7d15mRT/Df4SK3QK/Vr+EiUpb6RtjGXP4PvKJY0TLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwDOF0KLI/NjX3R9cTZSSDe+phdzACtSF9+2umXAX8o=;
 b=NwCLCH8Pmy3ZvzZfDqTitHzs3f1Ug79qDClBXmS+bVVat9evoaZL4dYFX2PfwnUcuf/b440jM7ORTDGeFhMOhWe8VzvGtn4axt81+hS4PtpzhrxBAib3gDTKI6lZ8mN/f6qc22HoJehALP53BH04bv00lCDvU+wJTebZJFmeYDi6st/joU021yA6rFyTd5DZkrDtIXXV+hXD2ur+BnmJIx06ym+eFSGuFKy30/NfJMtpF1fNwnRyAsM50w/oYneE6RGr5J313E6rWCU9fdyixTK9Z4QPsNZzVWpldWKXxbxPu31m2rv8pEnYV5QK2FcNFrGJ7BqMnUsMb7WS6GVGDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <229cca8a-60fc-89e1-8ab1-568fe855be8e@suse.com>
Date: Thu, 21 Sep 2023 07:55:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xen | Failed pipeline for staging | ea36ac0d
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 simone.ballarin@bugseng.com, nicola.vetrini@bugseng.com,
 sanastasio@raptorengineering.com
References: <65096f918e2e5_29a56047619e@gitlab-sidekiq-catchall-v2-84c6ffbc68-bt8nn.mail>
 <a5a252a7-47b0-3ee2-3157-0b18e5f0b079@suse.com>
 <alpine.DEB.2.22.394.2309191609280.3563@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309191609280.3563@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9b3c25-0407-489b-31a3-08dbba674f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SKg9mky4nnrU4SIF4Eez5WXz72TVYZMH0lKFba0qZXAP0NU8GjtxYO29iZ6xMFcMMD+rr7EVHyVGlXX4gU6i4OhsxlSjUZ95ZgajPN4TFMJE7QoNdoWrmJ6i1/M+ytpXm+En4gdG513VA9qYXQ0f8FDIhg0EzBn6wMeAA2Mbp2qlVIw1zwsVmXhzR9yPvdDkJ0D1cC/Wk2M8eYXoADabVPuctR+yXO1EWr3BRQ2haiAA1zaWWyUrPka2Ac4CuDuepibtBkySpENVt1daqi5E31wSu3NwVyXhsPh2dnINGhUv+BeGUGaQshMT8JqpFLpgZZRkvhegFUBCUttrcXln/Mbs6wT+mY0qs2+1Gm+/vI7rOzVkrrGdsJ985BXFhsL3gLtrtYXtIQs1O+PY1wy1NhOamE7+aBDR86cDSeyrPaxHoqftrwN5DsTxlyIEoO4uEPnKRVzlyxA3AVJNeYiYpLa4QWhp206+9bA7h8kxkTbH5EiODdztsngZ3FEdMdGZp0VMWYgR3ZuFdZVkXRgWQx7ZexlRYspE9w3F6qrLiKyKuSEgEjyKD9QLDSKB0iGoJYVbpDI8OHGyMeb5heWWTiomalZeUi9P4U3dwVYR1Zgxot2vH9ofAsKL6sbYXEvapxGN4DIrggBox10pe/kUkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199024)(1800799009)(186009)(478600001)(2906002)(5660300002)(26005)(66476007)(41300700001)(6916009)(316002)(66946007)(31686004)(66556008)(4744005)(8936002)(8676002)(4326008)(66899024)(6666004)(6506007)(6486002)(53546011)(6512007)(31696002)(36756003)(2616005)(38100700002)(83380400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU9ZWCtZNUx0Y0VUWTQrY25MZG1IeC9BVFV6T3l0NVgwYVlXQVQ2ZHZkbzhz?=
 =?utf-8?B?TmtrYUg0QjkyRXh6S0w2MUExSXl4T0pyQzhMcEdDcCt5b1FKaCtnMzZzOEp1?=
 =?utf-8?B?Qk5vUmxlUnBRdk9HL2NiSTg0QkhVRi9nenFuYmEzSVEzckVDcE5WVGxkRW5U?=
 =?utf-8?B?dzdja3RxZDJoRVFWMEVLWndHT2xKbnpQSU9aNDI0UVpIWnQ1Q3FVa01pVHJY?=
 =?utf-8?B?Qkp2ZVF1Q3FQcHM0Nk8xYnR2aVdmTTVCTTBOOC9ldWFpZFJOSlhwREFHcUlV?=
 =?utf-8?B?R01PMGc5SHdlTnRTWGM4RUJPNGIzYUtCU2lBY3VKdVJHK1VJdUNrL1E2NE9r?=
 =?utf-8?B?UUdYVVNDMFVJMHVtbXBGd05CdFVFblArYjVuQWdHSkdkaGNtbTlWanZLWFkv?=
 =?utf-8?B?NkN2b0ZxaWNDbnpMVDJiM2YrQ2s5YzFpUWVEOEZWRXlZaUJDeTFyYmRrYlkz?=
 =?utf-8?B?QldHTjJpcHJTQXF5bjAvMnF2VU9vUUJyOFNtbzlHM2doM29CTDk0SXRtVHJR?=
 =?utf-8?B?cFJ2UXpYcjBSK1ExUm5KWkpjWWFRbFNtanBOZnM0MzdQYzdib3RoZjVQTG1B?=
 =?utf-8?B?SkQwcVptZjlUN1gxdFU0djk2MFdpOE1uSzgwZkdMNTlUTGdSRXphVXBUQWVw?=
 =?utf-8?B?cXc1YmNlRDZYNTVvcTNzVXh6T1pjNHVlQlB0TzVTdlhia1lRaFdzc0pWYTYy?=
 =?utf-8?B?YVBoVFdUYUNLdDFLbWlmYXFDTXlvQm8vRlA5Vkp6a2l5RURxOS91UnRiYURG?=
 =?utf-8?B?VCs5NnRESXBxcnBDbE9ORk1tMEg4dXVWOTB3R0tWeUNuRFlJOHlzQzRocXMw?=
 =?utf-8?B?ZG4zQzBOSWFoaEl6c3hwZU9USGNCSFZpeG1zck52Zm1tTXZ5cVdTRzZRNHJX?=
 =?utf-8?B?dDIwMUtOZXEwN3pkRXlubEtqVTNLVG1tb3lEampENktmN2drU2tjdjhHN3c3?=
 =?utf-8?B?VktxcTRQRk9yUnJSSVJuVkhFaFAxSXRkNVVvUEt1cWtHMzREWDhVMEZjTCsy?=
 =?utf-8?B?c0hRUXNmb2d3amw1cGtlSUlBUjJBbFU4MEY2dHI4TXdxVFN2RVRmSjI2NGh4?=
 =?utf-8?B?NTFMNjU4YUt4eS9tYWZxcGM0WktNRmg1Vi95NGlha1JTbXFOQXlaWHpGUjVn?=
 =?utf-8?B?T3dEWTF2eURtNzJNakFXZy9iRzFMYldsbk0yOXk4K3V4cDMvZ2JZL3FLakNG?=
 =?utf-8?B?NDZpS1FQUnZ6d3dwbVhOOTlSWEFNdWwzL0lOWWFJdnRQNHJ6THIrQ3hCYmNz?=
 =?utf-8?B?MVB6ZWpOYWcyMHhMcDRTcjVpTU9tQnpOZWJ4emJPNjliSFJSR0VYYkZ4MCs1?=
 =?utf-8?B?cUxDRzBEdW4rY1BSWEk2aXdBVDgzSU1lOXV3WURGc1MyVldQQlVqbnVjQ2Qy?=
 =?utf-8?B?US96TGtSa2tjeGlLOWhxa1gwZDFVVlVST25rWlUwTnJ5dVNtQlNzYVMyY2dI?=
 =?utf-8?B?RE5rV0pmUlVOUmdPQU9scVdBQmlyYWZncEF4dS8wdHVaSkh3Q2kyNkJpUVVY?=
 =?utf-8?B?QnBOaEJQdnJCajJJM0MwSjNXUmQ3L3owTFBsNTFtckFCaHMvVzJnZm55UWV2?=
 =?utf-8?B?MXh0UDNKWUFKcHFzK3gvMjNwN0ViYnRZbkg1NVJ1aGFFY1ViUXhGbmlGOHZY?=
 =?utf-8?B?MU9GclNGVjQ1UitITUViWXdhMEpDd0RPcFJBZExqSGNGREt2RUZ3ZElWKzkx?=
 =?utf-8?B?NTJ0MnBnMjFRWXZDNFUwa1NyWG83S21LWVJYSDlLTkUxR1RuQnFpVmNtbVh1?=
 =?utf-8?B?ODhnTUhTbWFtaDFwNkFCVklBQ2prODJPUzFkYXRGTjRiQXRSdDJMRGloZnJJ?=
 =?utf-8?B?cktScGZyYUtMcVVleUdVSUJWTEFtVnBya3FWSURqTGVMbEFlVENwU2dzYldH?=
 =?utf-8?B?Z2JPdTV4NnZleTlTRUFIaWJwdDdldHNGTVBWMEl6bjF3a1JXcUNVZ3NjcllC?=
 =?utf-8?B?a0R1ZnpMTVZNSmoyRW5COXBaV1FQNmRpUmZPM3VZV2QzMWtsalMvblQvSEkv?=
 =?utf-8?B?Uk1jUm55Z1ZMR3MwbFYzMFc3NUZ5VndKWmM0ZFBsUVMzK1hmM25RR0NXdjVQ?=
 =?utf-8?B?aXBMT0pVdzRWS1l0dytNV1U0MS9PN3o0NjNQaVBYUFJNaFIrNlJCb1pQYkYv?=
 =?utf-8?Q?sVZh4kZI0K1K1W+5ns1hVwax4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9b3c25-0407-489b-31a3-08dbba674f31
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 05:55:07.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SllqqorWgMg5/oK2OtPJWiuJA4XnPC61SRuDcVt39MICLLxSJLnqWTWY8xVKtToafAVQfZ+MLThwXmn8y3FEeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9151

On 20.09.2023 01:12, Stefano Stabellini wrote:
> There is a second unrelated issue breaking staging. The PPC builds are
> failing. I am CCing Shawn. Please send a quick fix if you can to unblock
> gitlab-ci if you can.

I did send a separate reply for these. I'm not convinced it is Shawn to
deal with those issues.

Jan

