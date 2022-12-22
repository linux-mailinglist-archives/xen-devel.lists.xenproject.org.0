Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC07653D30
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 09:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468299.727366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8HMm-0002AD-3Q; Thu, 22 Dec 2022 08:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468299.727366; Thu, 22 Dec 2022 08:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8HMl-00027f-WE; Thu, 22 Dec 2022 08:55:52 +0000
Received: by outflank-mailman (input) for mailman id 468299;
 Thu, 22 Dec 2022 08:55:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8HMk-00027Z-VK
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 08:55:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e8a2adb-81d6-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 09:55:49 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 08:55:48 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 08:55:48 +0000
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
X-Inumbo-ID: 6e8a2adb-81d6-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwvRYFMOg+KXNxz638g5bouqwo53De0Sx8i+S6mwHudMofzuP/AT+Hk3SISd5wmHaAkEu1gBZ1T1fkfS5sEProKxkay8kIQlz7uDePW7JLDXNfegw5kdn74R3/DVbVOpBz6oDVbBsE6B8jB2or7dTw6ORm2GegqxLfaNCfxNUpfXd9XHnYphzMg7OHErOWKpoWdhwPuWUpgAUtMI5n1yc4BDSLpMfTOgB09R7ZuGhEcgwIPoMzRDeQhvP56ZB3ZRiyCO2e4iOF/aoA4tr48lpchcs/YVJuE42k34QWRPEzxUmPMagn6Ug88TtQYp53jWQGf5jCUP33FuXF/tP+jS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0c50J5W2cXgLWG7IlQjtG36wAIqVwS7VEqUDMHpHMw=;
 b=gzD0NiI6C2/bQQHI/ARux6uJpWXYbzBkiAemnMaAkmkvLTdpJmxyxtHg2B+xCxGtKS/EwRg9i8bcTjA2Hl3pVJZJ3J7hmnLgy2J22dlR5k6/zUERDTjzer01V0aTRAijPpPT1mwgFX0h6zpO0Gp9/hxiMVp4wCBt44FxOCyyAzFXWdQ5PRZ/LdonPzq6kkIu20G31YeTjqipM8/4AIpGMO2qqSH5JrWi5i1Tl2TZIoH4uyIrgqC8CiTyI0WYebGTVuMJup2ECVT8RDma2q8pOPMqFQRjib3Ey44o8vLVobiV/dIIlPoBoDVvYlAttyKb3gW/i35F/AQQAqYTGQvbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0c50J5W2cXgLWG7IlQjtG36wAIqVwS7VEqUDMHpHMw=;
 b=U4HHMESGRs5r0yjr17lYeS8gAnXUE7xjcGHtK8UW+LZeown7hfFoiWF39TqsSwjvPBEs6AQx7NMQ3oV/XU1dK+QtSbXE9rbsG34RAQCIs7SWS0QxffuuPF9IRR/YDzmPzGXZv7vDsmKN0iu10WiTAHnVdjpgI0CPDKITIkGyX8s/frVlHADprks9rUZiyxtLPdlL+EOGW0pu6zBOm6d5YMV6/eVL/1163vjEamGPmcLal9Gdj9cwpnekRRqzH3DIUZMfSYwpQaOfrOMsnY37L1UfHptq0KB/SfOC6ncvbV585mcJVYQA9N0yOlPRylq3jFX7E1MVQHFD2hFFuBppww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea8e423c-4a74-bf09-f7de-93849e801dd9@suse.com>
Date: Thu, 22 Dec 2022 09:55:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 01/18] arm: cppcheck: misra rule 20.7 deviations for
 alternative.h
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org,
 wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-2-luca.fancellu@arm.com>
 <072a9427-57aa-81ef-1f7e-7f0b5f26e5c6@xen.org>
 <alpine.DEB.2.22.394.2212211731450.4079@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2212211731450.4079@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: d06e520d-1150-480d-8755-08dae3fa5212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N6Te7s1Ta23P9VPBI/MubZvXGzZ5DYJX9djmCX545T4XfjahjuqCba0Zuz7UQLngit641v4BKuhbdV3sMJYf4K8rjcZ+WYgjuxDc5/2vNJ7mB++7kxr4wD7GCOfrLy7gF6DOEfXGHd1WNrxcKZSBNTKx8HdQEUeYxqhZ9RcOurqtaH7Ia90+ho0CQjruh0YfKxksCTEWa91PRzVhxI6UgAw7CAvz1NJEpnt7+kyCffGFjwjrd8BzoTWIWYRjgb8cxUE73j1ZrAF9FRyCCl4LYYNG5QdmKusqiSf95OkyFlbcGGjFRR5MYydtcDpC55pCyR6NrHKx+xHSryG2M0dw5ZDZgUfperwzd93VppOLEHJPGOZg7WL5MelGmdztZIAierLmcKFwSXnTHuta/HCPBUlNxx0tVEpZmmFBfT0M/Y3NEHm4AwnGvgt7FF4c3BYcMNr/1AxspMcuRz2xVnglMFDEpe/wzfQHxkRdBtjPw2HNqyRU5qwhrXI0KpU98QhCsdRaMo5oCo883SdDZu/VME79WsD63tYkD4woWKEd7oQqHVP+HJFPhcvFi3raufBGkzYTuVGGHI+gt6Z04Y18IDCKaV93g+x8yYSthKTFxYq/vYcm8/3Bu4CqRot0T8RQAhVseHfo06IQ7hbiW6/qqzoNwUwXPYpzt53q6h8vQ+mZn9uzmGgiSQxOPwO50QGISWHDrC11RozgkkZLRsEY3GJ0N6pr3ALKQbQ9stqVyc8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199015)(31686004)(2616005)(86362001)(2906002)(38100700002)(186003)(6512007)(6506007)(36756003)(53546011)(26005)(478600001)(6486002)(8936002)(54906003)(316002)(6916009)(8676002)(66946007)(4326008)(41300700001)(66476007)(66556008)(7416002)(4744005)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SitXOU0rYjIzUm1jOFZYbGZzR3FOWk5xY2VlWkllOGV4NGcyV2ExMzBGc0ZI?=
 =?utf-8?B?OXo2SHkza3dYa1JkU25vUVhkWEN1eXM0ZzZnNW9XTmlhR1JaR1FhbUlXSXVt?=
 =?utf-8?B?QnRWTXVuVU5ZaWY2eE55ellreldEODc4K3pjaUJldGh4dGZ1VnRrNFkyM3cy?=
 =?utf-8?B?MEtPbTdlbUlrQ25DVkQ3eXlVb0JrL3EzQitSZmxVeWRMbE9VUVgxTm9hMGcy?=
 =?utf-8?B?OEV6bXRCckZCMDF6L1NJMFhaZEhubnFRSEpnVjhxWjFhUGpQRHJnNUVZdito?=
 =?utf-8?B?V3h0WDBPYkxqWFZncVZTem5pTDZsTDFPV1pwODYxQ283V3kwaTZrbk5NdHlK?=
 =?utf-8?B?c2JUNjRpeXFSekN5eTF6R2JFc2xYdTFPdzYvdGE0SWpwTGZVYVNHUFQ5VWtK?=
 =?utf-8?B?Y0pCR21GdUk2VHExUXFsYmlQQ2N5NWNsenZEU1ljekxpS25yektSOWc2azFs?=
 =?utf-8?B?emhscGQyYUhLMHlja2VTQ2pacEdpZlMvS1Y0TW1SVkZoYmszZUZ4SzJ3TUVw?=
 =?utf-8?B?ZkhOWlFUMWExb3loaTJ6VHFHQTJwckZLRDV6TU9JZ0ErMEd2aXBPUzNsY1lS?=
 =?utf-8?B?dll4a2txWXMzbkpHT1lkSTJ1Z2RJdExqYU9wblduTzJLRE9ZRTArM3RFU1hV?=
 =?utf-8?B?d1FpcHhJVldlTEdHUnE3WVZSZjBoNnVqUE1KRlprUk5PNmZGa24wY0xya2h5?=
 =?utf-8?B?dURNR0xva1dqQ2JnL0gzdVc2ZVd3aGdaSmZOR2ZQMlFQOWlWUmxzV1dmZU5p?=
 =?utf-8?B?UU5zeldvUlMyMnU3d1Uvc0xsQmJOTnVBZFpjeHNQaU41ZGIvNWpkQzJibnlF?=
 =?utf-8?B?UlFyTWk0N2lxMTRJdzJ1NDhEMWV4a3VxS2c1bkJDVm1vWkJSS01ZNnIzQ2h1?=
 =?utf-8?B?YzZzTjhRR1FRa2hRbUtUK0JLd205VjkxUFVLNmUzZnFUdnVLZ2pXZnloSjNr?=
 =?utf-8?B?S0dXaVNkd1pvL04zcnFya3FBKzh4cktTVVFZcUJBNnBKaDFRTGpNZVBNWGto?=
 =?utf-8?B?ZUx1Z3h3TlhObDlHM1dKL2tYTnFKUWE0S2xVZ2hOZW5PT01PSzQwaXMxa1RQ?=
 =?utf-8?B?NVBxaWZzYlYxZHFHYnc3WjVzTUdTdStVdHNjak1IMmtKUTN3L1h6dFVSekVR?=
 =?utf-8?B?dlpMWWhOWU9KeEtWK01rZDkxUzV6ODdNQytEakFuRVErWDduVVJhU2Frb3p4?=
 =?utf-8?B?cU5nU2h3d21Ib0N2NFQyN0U1akNhNjFPdzFoNFRxNVYzMUtpeStZM0N1WWdE?=
 =?utf-8?B?NDNHV0FmdDl4eUVMTzY0SnZkbll6ZGxxUFZNOUQzRzJPWFBDYjRjU1dCVWEr?=
 =?utf-8?B?WjNKNVpHVnlQcUQ0bHpDWmI2eCtoT1JaejJueDM4SllGNXVDOWYwaWxaY01T?=
 =?utf-8?B?UThRaEV0NTFOMkk0OVFzQmFzMXlDYUFCMm0wdEhDN0lnc1VDRHdmRG53WEE1?=
 =?utf-8?B?dEpaSzJxb01JU1pBV3BaWU5laFhJK3NKazhFdHZucG9XZFZmYW1SNG5ZVWdi?=
 =?utf-8?B?bXRqOFgvVzhrSkI2V0ZhUnVJRzdjS3E4dC9BZTMrS2JOU2g5dGYzb3V4OXZD?=
 =?utf-8?B?RnBBQ1l0RXNPU2R0VCtqMDUrMkwyci9ibmkrbCs4NmcyeXFFVjE1a2o5MXJU?=
 =?utf-8?B?VnJieWl2U1lncTMrSHpmczR0ZzJpSlVCaVdrRmI4bFlqelhvQjVsRXoyVGFJ?=
 =?utf-8?B?MnFucjdBOWpBRUJ1RmpLU2txZ3N1WkI0ckdsVmhKN0lKNUczeXhuRUZVc1Vn?=
 =?utf-8?B?NnVYMU5qdEhOelEwVW9NalMxT3ZSMElnWll0eDB0WC9odEVHRy9KTnJ2TThP?=
 =?utf-8?B?OW1SVEgzbEZHMFQwbmZ6TmQ2aHp6eTJ0Vlh1bW80OXFlVWxZbU9UUGlkdEN2?=
 =?utf-8?B?blFlTlhScXdwQ0dSWnlVMGlFRHhvK0JudHdObk5wZEpGbld6Ymhld0t6N2Nv?=
 =?utf-8?B?WHg2c3MxQWVrdXVuMURCUDhEOUhCQW1wVFlIUWNscGthTzVOWTluUW01Uy9q?=
 =?utf-8?B?NVJXQldIdlJQT0NjdU9SbjFISDc4RUNaOFJRdmdGSHo1ck0yNXFWS0NaNHdB?=
 =?utf-8?B?OENPYVU2ay9vRWo3RnpZaWdkdC8wMlUxaFlTZXBkRGMrZnZpcjVhWEV1SHFJ?=
 =?utf-8?Q?6u4KRanUDhvxIK++2FKh1/uew?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06e520d-1150-480d-8755-08dae3fa5212
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 08:55:48.5871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dW+tnFogPYxumBiXteHaZzyjVdyQyeNscIiTlqa7fbkWkdQT1OlG736/Zk3t4pAZOrujMxe+ah0/lvLhMpyBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113

On 22.12.2022 03:01, Stefano Stabellini wrote:
> What do you guys think? Nice automatic 20.7 scans for all patches and
> for staging, but with the undesirable false-positive comments, or
> no-20.7 scans but no comments in the tree?

Anything automatic which then also bugs submitters about issues should
have as few false positives as possible. Otherwise people may quickly
get into the habit of ignoring such reports.

Jan

