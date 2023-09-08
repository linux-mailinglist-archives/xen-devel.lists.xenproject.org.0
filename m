Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8D798232
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 08:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597779.932128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUlL-0000V6-K0; Fri, 08 Sep 2023 06:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597779.932128; Fri, 08 Sep 2023 06:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUlL-0000TQ-H9; Fri, 08 Sep 2023 06:14:39 +0000
Received: by outflank-mailman (input) for mailman id 597779;
 Fri, 08 Sep 2023 06:14:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeUlJ-0000TH-EW
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 06:14:37 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc4a1ca5-4e0e-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 08:14:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7483.eurprd04.prod.outlook.com (2603:10a6:102:86::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 06:14:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 06:14:35 +0000
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
X-Inumbo-ID: fc4a1ca5-4e0e-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HntPE3XTOFuvqsmdBHN27kW39IUw6g+D7hi1x6m3eNEcb3/NtpKhxBjuQGF+yqZtRuj2uU3Lch07V0rB6sXATD6OXQy22/1RTERyCZkaVkasNn9nVRJ0KmEawrNTPeMMfvGsi9UBBQkG7doZ5gHwpkV1u3vM6Rp+E+R05tdlx3eaPwfptEX1nSs2nPiyR6DdjkLXEeCAIN6OJU1/VaXWl7IMM0yJxNaPZVbwbeIGX8AWHPd4wgDnFHWOtzPyYA3vKxL9ioXt/FRSaimiBLCDTqFKkX8MJSZuP+mcyQt2ApT4TyNBYAc6NVNEL88aUVR8od8WUKaKUB1HSwLjdeIZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IZjPNJsBIC0HAb1Ix/VriCMSpqI8pj/UJpDYUmsmhc=;
 b=PHomsOht025NUKeLFUyTJepkNg+JqHuIvUZrsChivSD63Qbo3av+XElB4dLp/PG+VBDqpHU5NTeZXiBQDjzoDtRZ+2Ms/MMmvecKJl6Rq8vCYQxx68p010NJ0y2n9XfAqWtPbsbvNdznQcxMDFazOEojowT6ZChDb82LgXGwRTEgWOQWMYtf80TF3rWGxjlugQmHopN4fDRlF6g9FteqfjTw6Ns8bPBjsOqLdvwl0xCnePCAyLpaTk5FA8Zcu2zOmOwrcDW614toDON1eUxeSYJKyJYkkV9Z47RnRGU5K0GGgwbpbZz5fJOdj/XCTz6avxvajY67hhB9tOjAjLt1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IZjPNJsBIC0HAb1Ix/VriCMSpqI8pj/UJpDYUmsmhc=;
 b=1iI2T9ajOoHdrurPuLM18+U4f3qXdyHvWWBCO7v2PdTb3IiXXwefTNoNKbVE9UXFU3FRouX6LBVJWhWYgNDRt1ryNddWtUQoV2pRym2QWT/D2nxCF2gaV86JOlID82B3Aij8bTlBz07MKAZn4rUR9SGcDWDXKm8wu1XvBoxLXZ0LYrlz173NSoKH1uRK/gLKIyT+04H/D9HlO0j3rG/irJctd2tD2xYqqd49d2nVj/VAu8/tedqGgCtTwewAmjAAz3qpUJciGP/eQvOjGS/Tcec9mCzbIqx36i50qKwoDai0LZk08V7nU3WPBVYq30JmVxExmLHhtXvI9i09LOb+Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e434095-36e9-0cf4-349c-b104a9af2756@suse.com>
Date: Fri, 8 Sep 2023 08:14:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/5] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
 <917dc5517b69657b48e69c4100234383f5c70e0e.1693590982.git.sanastasio@raptorengineering.com>
 <692dae52-947b-5856-f1b8-5d9f03f78e6a@suse.com>
 <63d361c3-4b6a-1e12-db91-8723e3277252@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63d361c3-4b6a-1e12-db91-8723e3277252@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: e519525f-f17b-4c7b-211a-08dbb032dfb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rHNyAXx4VkeVB2bLqlHgsMrNVMEXzPmxdIPTnjwq6ziTSc9xcZfrm/HzeNYQiTeFfPA2Dbv0EsNalX8O9jiwocla64C9HEShSbqXWFBrDYEkoi7IOpPaCuig3W+CgI3/Vg0YjT//Xrum/fQ/wmv6Hk8g1Z0g4PpZX4A3q81RlUUdE9jQcuJOf++v0PMjm2cX8f7TNqR1dHyVYGTifnOuMxHs/6QTpdSxeekPJw1ijq+kSxT00RdujFZO6gOclfTgx0a2M6x1ac52MYbnUGm5xhrKoyHoYBx7j6AHxUDYr+LByoH1Oo4k3FcXyt2HG4Ou9klvosTWQZ+9+dmxMsGMLylIo4GbdQQ18Qxd1y5Sgeanez/c6Dqk0cc7x/p2SGWCbnvrLIQDAUOgywnCeDMH+Rw+1ZAx3YE+5MaP6Z9/13t86oZ+WtKtHb0Yr0JEquUwpJlJOwwK07O4yBxx8Z3QHv5KfeKN1Gq1MzCXLUJxWAhmSlv0uFaSi0jfwjTbqsp9J4SSXuEiuY5TZx0A9ZufDnFscmcekTCJ2QUl9aAlGlAOxkbxv4TVqPSXw4NFj0LU+Pr0PKOawqrN56Trqh4n0e7bCBSHB3ac/E8tSQmun98l1I9VsFOMeut8Swjd4fkpwPZpLnREaOHV3F7OdN/Jqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(451199024)(186009)(31686004)(53546011)(6506007)(6486002)(31696002)(86362001)(36756003)(38100700002)(2616005)(4744005)(26005)(6512007)(83380400001)(478600001)(41300700001)(8936002)(8676002)(4326008)(5660300002)(2906002)(6916009)(316002)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEJSOEV2YVlPTkxYZ0twRUphcDA0aTl4MFN6cnMyVzNsMTA4bFV2WHVwaGxn?=
 =?utf-8?B?NHQ2bnE1NjM3RS94ZFJQbjdjTHBxTlFiK0hmQVBtK3AvUVB1MHBWd1VWZ0VQ?=
 =?utf-8?B?VG5OS1AxKzdyOTdYd25wb3p3aU4rOHFvbVVBR0h4QmJVQmU1YlQxT3FOa3RD?=
 =?utf-8?B?N1dlZUdDdWpTNExObmp1d3A0MzA1amYyQ1hpOHQ3MHZodjkyL04wZ3RoZlB2?=
 =?utf-8?B?ZXBTZ083eGgvMzQvb3prV2tvK05YL3hicnRYQkVrODJrZnk1aG5RQWhRVndu?=
 =?utf-8?B?ZmYyd2x0S3NxRHJHdkJxRVF3VERlUWJQSXZaRVVES1llU1hKZS91QUd5ajZL?=
 =?utf-8?B?V0pHZStTWEJFQnFDazhGUUhoU2cvV1pDMUhCQVNWc0hzQ3lJM2o3OE5lL0VE?=
 =?utf-8?B?dUVYUUs1Mjhhd3lvZ05pZ2FFZ0gyYldtWlQwbkphMUE5elZGVFZGdjR6NFdZ?=
 =?utf-8?B?WmFFK0dtOXBUTGgwc2tBSDI0ZUVEWWN4UThuRldiRjJ6ZkU3c0JwVEJxdmJW?=
 =?utf-8?B?ZFc3VERmRnJEQjI0RXdhQXZGTkZYMUFPOThNUkIrT0FMN3hOYTlUSUpHS1Ny?=
 =?utf-8?B?VXFQbDdCRFRVN29tcTR4UThHTzRXZmlLYmc3TThYYzhqRkhwUEpvVjk1QU5p?=
 =?utf-8?B?a0p3R3FQWlVtaHNlc2l0Y0ZVZVI2RXdKWGxEOFZlQUJ3dyswTTB2NGQxTlZN?=
 =?utf-8?B?Sk0rUllPQmdzMW9UUEl4RzFFR3NCaXRNc3VMRVFMZHp4dzVUb1VvQzdpOTNN?=
 =?utf-8?B?UlJyOUFiK1lJcStzVmFRd0Y2OVBBbjlSSVh5Q3E5dS80b3JKY01sL05sNk1Y?=
 =?utf-8?B?cHpZN2t5OFBCbDNKNnZsbUpoNGVRTWlUUFJ0MC9rMWtaaDhJSXVXZDBkNXdn?=
 =?utf-8?B?RWp1UnNkZVQzamFlSFJCcFZlTHc2bXZ2S3pzVXU1TWJyRHg4b1JsblA4VEZU?=
 =?utf-8?B?ditZbGtXdFV6Z3huNkV3eXBzTTRoRTdkWWdQYTBxajdxbG85L0pEZnpaWS9n?=
 =?utf-8?B?NEhSVDFobTBsak9UdW5WZlBHZ3Z1YzNUMkhTdi9CQk1GcCtuMVM2Q0pTcU9X?=
 =?utf-8?B?Yzl4Sys5dGZXYlNKMkRjK2hTRitFOFo4cG1zUDhDaGZEcnpDbjJvK0ErUEtn?=
 =?utf-8?B?U0I1RHRYNVRiZmJpeXdlR0MwY3NhRjgvMUE5d0Vyb1kzUzRHYm1HWUhvVHRl?=
 =?utf-8?B?WmdmcEVQSmEwem9kMG5Ma2l3cHlCcUlzMHJ4d25ERUtoZmtVUkhWd2p1TGhz?=
 =?utf-8?B?YlRnL2hINHZuMnZiTTR5Mjc5K202RDk5ekU5Y1gydjdqSGhETFpPYU5CTXZu?=
 =?utf-8?B?RTVzVHh1SFhVeExFTnV4MDBRa3JqSVFYQ2h1UUtsTjZ3a3BMdXpESEtLenp4?=
 =?utf-8?B?OVFLTnJHVFlCWGg3VWZCaWFUdjNiNXlnYUdDUkliVUlNQW1OQmxlRFdqUmdv?=
 =?utf-8?B?MDIyL2dRQURkaEd2MkJOODd3VFdUZGozcWhOVm9OUFV1RVRNMEtqOGgvMkFp?=
 =?utf-8?B?WlJHcWV0ZEoyL1NPZ1FnV01OK3JWaDBnOU5HMlRkVG9MU1VNOFVmU0t5N3BG?=
 =?utf-8?B?di9zVVQ2c3JvSlRJanNObzFJbUJEbzBZOUN1MFhrcE1LVTFYeSt0RUtMUVl0?=
 =?utf-8?B?NW1Qc2wxQmtUSnRUVjY5clBoLzlad0JMWXFBb0pndyt1Zmd4N2dDU3dEbXd5?=
 =?utf-8?B?dWxUS1p6eWpPMWVNQVowdXhIWDJpdEV3QXMxNUIrNCtxN2piMkwyTXlkY2s5?=
 =?utf-8?B?M2F2dFE4MElHQ0FFbE1WZ0JUVXNCd0RpSmhQZHFaTU9HT0ZrQVZlaUt2QzJW?=
 =?utf-8?B?UlFPQkx2bG1sdG9oK0R3SzRBdTJNM3JtcytlK1ROckhmcXdiUjlHdHU2MEhM?=
 =?utf-8?B?dVVOUGsxWGlOT1RJdjQyWlpLOHZsQUpnVDBKK0RDYnlVWWFhcnhjQlJOS1Ns?=
 =?utf-8?B?V0pDTHhiRTdtYlFmLyt5cVdiNUI0QmQ1b2oxWFhHNFVSem56V1R2d3VYUm93?=
 =?utf-8?B?TFRZMFp4bitzOGVhVi9oTXJnVkhtL3l4RmxxVFh2aFFxbyt4bnhFbGY0TVQy?=
 =?utf-8?B?dURYOTFuNUdrMGlMYVMyczhOMXZsWVBHazZMNElQVmVtY3lDQzR0YXVCeXd0?=
 =?utf-8?Q?NTrk6R+oMsD7OX/pzH/G+OEpU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e519525f-f17b-4c7b-211a-08dbb032dfb4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 06:14:35.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nhYdfOnAwMWPhRo+2JQueWBHOwjKIDMsLP3AAaa9FIdOmtpO1yWEqIFyMdV4r7gG6Ly6o6gPaffGLszUdOZ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7483

On 07.09.2023 22:10, Shawn Anastasio wrote:
> On 9/5/23 9:58 AM, Jan Beulich wrote:
>> On 01.09.2023 20:25, Shawn Anastasio wrote:
>>> +static inline atomic_t atomic_compareandswap(atomic_t old, atomic_t new,
>>> +                                             atomic_t *v)
>>> +{
>>> +    atomic_t rc;
>>> +    rc.counter = __cmpxchg(&v->counter, old.counter, new.counter, sizeof(int));
>>
>> I can't seem to be able to spot where __cmpxchg() is defined. (I really
>> only wanted to check why it needs the 4th argument, which here rather
>> would want to be e.g. sizeof(v->counter). If it can't be omitted.)
>>
> 
> As you later saw, it's defined in system.h later in patch 3. This was an
> error I made when splitting up the changes into this patchset. If you're
> fine with it I'll just add a mention in the commit message that the
> definitions in this commit are not yet fully usable.

Sure, that's going to be okay.

Jan

