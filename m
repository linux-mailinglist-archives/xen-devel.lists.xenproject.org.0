Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB10975B185
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 16:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566645.885741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMUul-00082U-2a; Thu, 20 Jul 2023 14:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566645.885741; Thu, 20 Jul 2023 14:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMUuk-0007zB-Vm; Thu, 20 Jul 2023 14:45:58 +0000
Received: by outflank-mailman (input) for mailman id 566645;
 Thu, 20 Jul 2023 14:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMUuj-0007z5-1u
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 14:45:57 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20135349-270c-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 16:45:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7555.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 14:45:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 14:45:50 +0000
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
X-Inumbo-ID: 20135349-270c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT5tI1RYypbtc191YVojsjLOc0BjO+akh767hVIa9uyMTV+/DQCQ4KWnB0JlYWnvO72fiQt3jYRiYR4VF3BctUe2oKv0lvg8vqVBQ6k8gS1o6FccuQhgoAfK4fdAtKbXVa352n+7Px+68EJIulDHuKM49/GB1ZZPLz/MBZtca8NUKrdxgMm5wagqXMpannabpEh8VME9RyrNnnV841gAs8cReTvSOB5q0YfUOqdcLL26vrFk4EFRzK4x1LkcTVxjc9EP9Z3cwt9y65RJrbkmOGF3S0Pcc2o/NjIzyMkowpiTSSntTry+BojTjWieTdb8UeFOFlfa6n2tj7YQAmKPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcI7G2MYlMpaFZn8MK+aXDTAUpVP6WVlouUXqp4E5kk=;
 b=ZdvxPaUh1AAVsZRc0B+SQReRhyOxE77hEd9HbrGGBbUHsMFwThnkS6jHD1abJWiD3Xn1U0TlLVx70572mX1exRLQsvNJbAPWCZBkhyMo+TYe9MkIRq3B0gCfhR1g1Vhnw2Qv0/lwGaCkZwbA3FAMGtcpTHBdNHPXBhCe0IBri6E9e+Xqlg6Arb39QnyW5+cL+nsE5NhjU5tzKsfVcs3AU3y/cVtOaWXRV2LkKTw80wLb4I8dSnazg+eqHHmzAvYDPkMCm2z+df+PyjQIKc73vA+S/Gwu6rp2ae0RfSrERaj2qDns9lvi1RhPMnZyTaSrrpUgzeYVzsFsTxnp98coOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcI7G2MYlMpaFZn8MK+aXDTAUpVP6WVlouUXqp4E5kk=;
 b=CDdVwB/wKkqVavbhyIRLk9DYbX2LeCH7Z+OyP9f8j9l42LvKIXyAPbB+tZjWHE203+js4wZOaym9ys6lM5yhNRw/D5GlKcYQCj/w0dJ895DFu4tK1agMBuNzgydLR8DHYoCQo7nzFmG1HyL+XhAT7s8W2QFjI1KnGTlbO0UMzes5bFHxBMebnXOszcKmXxoOpD3UjLWU8/BEm9ijUJhpuBmIl/KZfkiaRip33U5PQdSGeLUYXtjl04JmQFLg2QDcLENvhh/OEllkLlGjhDsqqcTi0E++AfFduqY5wwwP89yhLlNvxOVDKQ9Da9BAEp2Ae6sdDkgIKQ0cHUpeDfJIRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e45a3487-fa84-f151-37b8-0102a5b2e65d@suse.com>
Date: Thu, 20 Jul 2023 16:45:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3] x86/HVM: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <129cc9919d8664e95812791a91ecb14fcc70b946.1689839462.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <129cc9919d8664e95812791a91ecb14fcc70b946.1689839462.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb46a83-973c-4b9e-b798-08db893002cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5MtcpDz5eflMp+f5wAOe1lda7obhi0HFF+aO7W+p1AiTLoLZTIRFD3ipdmkX6R3rD1SKBWjsH7F1HsCQ6LOU3Rop44MyT5qZ27V3x+eoTMS41vrKTW4NC89LMwJ4s4jaHgZQoWLIoGkJDj793BeAcO0JuQ0r2K7yOEfpQuvNcpb3LMjRozkLDbDkSKTF2Tu0iVq3X2Zg2cW1SfH9Q3SKnubUdcvoJXD9r9zXr8Po2Q/Gm/K4cGc/8IsOchj5XPHbSnetSGqjSXGRoxkxI6u3BQ+C86NSee2zYCHN/olkx+Mj/kKQ6VW5/N3sxYELRoa1Whtq3dnVV2KSpAgwGOdmWkmASQk5FZLMSJluK3iWcU3h890ujXPtCDuqVf+refVSrxVlPrlFrF47lG6tnKAND1eEsJIk/MGGlJ4fNUhlshgdF93y8R2spmgNsVAk9PyTuNKF2m1GhlyKJpUmi4dP1A1gd81VpSCn5KisH2WtLzTo2WEystoJmmSEoWNkei/fFnz1mE9be67LMMrTQu4OoVtPDJhG1+H2B+5/hgPiA7HwdLriGOEe/lXZz+nfzeQNkyrojHJC11iypOeIhFuiHqHsWAFtOTdlR5Qr/ZcMxRMM8bsl66TVN9fc5JrZJYKUlvOe7vRSlKGR2k97mdbcmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(2906002)(6486002)(6512007)(8676002)(8936002)(5660300002)(7416002)(31696002)(31686004)(41300700001)(316002)(38100700002)(4744005)(66946007)(478600001)(6916009)(66556008)(66476007)(4326008)(54906003)(186003)(2616005)(26005)(6506007)(86362001)(36756003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDY4Mjdveklubm5YY2VqaWQ0U1dqK0RGSVJiZmxKT2VkUDVTazNDdFF1SVRn?=
 =?utf-8?B?aUk5QVd3anNPbHE5ejE3endnOGhNMzBLei9uVUFNM0RwM3prSkN5bFdzLysw?=
 =?utf-8?B?SzMxTkdjM3RjYUpSYktsbVgwaEJLaTNrWDhmQnFpUSsxSUFWQkxxSUFyZWp6?=
 =?utf-8?B?ZGM1bUxRK042QjBiVDdKZXZjWjBwVGpiRzhuQjBlYi9FYjhBRlhUVXh1aE0w?=
 =?utf-8?B?Q1Jyd3ZWY0IxRVNQR1prTkpsQks5TFQwNWp1WGZkaEpQUFJ1UmttWTliMHgw?=
 =?utf-8?B?Mkt5M01odnpTNDIvOHJ4eW5HcnlsRTliczJuaWY0OVRsY2tEdU52QnBqWC9D?=
 =?utf-8?B?QWhsR3h6WjBTQ2F6UlF5TW80Z01zWTc3MnpkcjZxdnJob1RIL0FpeW5Oc3VU?=
 =?utf-8?B?NFJjOXJPUC81djhRNTJZRHBBRDk1MlVLcDFwbkY4TFBJVHNwY0NMMHJyQ3RJ?=
 =?utf-8?B?OXloYjlNZW5nVzJwTmxHcUVjSGg5dVRlQ0RpZ3l4N0R4Y1BzREh1aTl4cVk0?=
 =?utf-8?B?MDk0Lys2ajR1T0IzNjJoUXdaY0RLSFhma0ZjUXpVWGZvOWJBREprbWZIMVNV?=
 =?utf-8?B?THBxUlJCNE9raFZsbTAyK0dodFNja3lMRU9tdlhrbGxXNXdCTUlCcWlLNHZk?=
 =?utf-8?B?Wkl6KzNjRUVqWUhTanVmbmFpTGFaZ0JKdXExVnp3S2RZZ2RnQmFIM2NML0Jm?=
 =?utf-8?B?V3piZHc1aFlvbm1MMmUxeDkxQ1VUSy9TRkF0ZDk1Z2N2b3cxMTI0eDdLYk5T?=
 =?utf-8?B?L0h5QkZPWGl2S1luSzRZaW5pd1l5VCtjblRsKzJ2RS9JQmhIamxzMUJoeUlT?=
 =?utf-8?B?NmNOMzE2SG0zOU1jblR2eC9kR08yUWpyVUZMOTJkRm82M0JaNDVIbGNQenFE?=
 =?utf-8?B?UzcyWmoxK016M2dnaFFrSHNtck1aNzFlZ0tqYXV1MFIvYzd3MnE5UTJoSHdz?=
 =?utf-8?B?VWREK1VLbVJyTU9CM3A3MU1LelYzT28rM0c4YmJud1VCMWFaazhkUlZBRi9w?=
 =?utf-8?B?dVdqcjdJRVRxSm5KeWRTOVRWV2dMdytoam52c01LbEM3bnErbUFJbTZTd2F0?=
 =?utf-8?B?RTU4eFNZaWVXajdKTU9rQXdqZE1JYUlhWG1UOW1xOE1RTU81TU9qZThVN3Nw?=
 =?utf-8?B?ZzVmcmJuc0ZmOVlPZk9xSk8yWTNVczgvb3p4REhISTFsVTZJVXVuNmozMXpq?=
 =?utf-8?B?L1dHZEQra0pRcDlPbm4ranE1a2RFUWJNYmdacFd3TDUzSjdQVEc1ekl6YXpK?=
 =?utf-8?B?SjVvNTF4cVR1RW9qOTROZXFpTjFkQ0hkZ3FmbTF6eWg3b1A2K1pRcDYyckdC?=
 =?utf-8?B?bkNwN3JFajBoSTZOTjNhRXlJMXNaY1FpR3R3eXB0cnhBeUhiNFM1dUZIVDN5?=
 =?utf-8?B?R3BiTmxZZGRxWmJzMkc4WWpJQmxiQ2p3WHhac0YzQTViVnVEY2FBNHhtT3JZ?=
 =?utf-8?B?V0l5a045Rmc5S3k3dHZ4bGNkaUd3bURIRWRtL1k0ZXFUSjlScWZVdVZ3azBx?=
 =?utf-8?B?VzJ2d21VL1djRUk3NU9EV2pIUTN1K0lqMW5scGxkQnhyejZSUkQ3NFlMdVBK?=
 =?utf-8?B?cHNXOHdCNWdhQ3hoZUQzRFJHWHVGeHZOd3p2OW42WVJZOGozRUZpM2N2RE1h?=
 =?utf-8?B?WVZoUkZYbngwK0V2TFpHSkJSYkZxeTRMUnBxV3BLcWFBa0txdDB6WklpYVlG?=
 =?utf-8?B?cERTNmEzckJGZGlybU5BN3pRaSs4ZU1pTlBJcWo5ckNYdmpIUnl6UWhyek14?=
 =?utf-8?B?b201ZWdHZlQyTlVKaEcvTFA3d0VtcFp1L0JjT0pMclJlOVZtK0k1dW94VUhs?=
 =?utf-8?B?Y0R3OW9vL2VFTEx0WGZVRnZldGlkQzFMK1NDMTJEdXd2R1dUdm40RjFGY1JT?=
 =?utf-8?B?eWVaK0NreUdIai9veDBJcUdzOEczdWlqYk9wYkVjZ1VyWjMvZ1ZybFhWQjJV?=
 =?utf-8?B?MEM5ZmVuV084Y0N1N2VKTE9kdlFia051OEVoOGkzY3F5NUxaNnhLWXBGaWlI?=
 =?utf-8?B?cUJSbnVkQ01sSFpuRlBiVmhoOHNqRTBsNXd1dnVVSGJPZUNYMnV0Z1NvUlRN?=
 =?utf-8?B?cHFrNmpNeGxOeExjUDdSUVRydFVYUnVjN0lSTmNpRXc5ZWwvS0JTYmVpY2hx?=
 =?utf-8?Q?qt8xk9qJSNBPj0pLpLj1lzono?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb46a83-973c-4b9e-b798-08db893002cf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 14:45:50.2825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22kViThkmpOIHFOu9CMU9phztKdELOE9imj/nxV3jg9AdXH+uepovb533qQgPHM5KDs0hSIA72oWmsCd+kY4Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7555

On 20.07.2023 09:53, Federico Serafini wrote:
> Give a name to unnamed parameters thus addressing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



