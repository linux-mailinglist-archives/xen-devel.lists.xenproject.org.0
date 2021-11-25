Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2378745D83A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 11:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230838.399049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBwn-0003Hv-VA; Thu, 25 Nov 2021 10:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230838.399049; Thu, 25 Nov 2021 10:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBwn-0003Ea-RY; Thu, 25 Nov 2021 10:25:45 +0000
Received: by outflank-mailman (input) for mailman id 230838;
 Thu, 25 Nov 2021 10:25:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqBwm-0003EU-Qc
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 10:25:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b944863-4dda-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 11:25:43 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-rXm98cFNNrKHempSw_O1YA-1; Thu, 25 Nov 2021 11:25:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 10:25:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 10:25:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0018.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Thu, 25 Nov 2021 10:25:37 +0000
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
X-Inumbo-ID: 0b944863-4dda-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637835943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrfgnfnpmbtr2ACEUZk8n8GNGfnpkgC6pMU/KrK/Ojw=;
	b=D1XOEU1kZZSraQ5jVhkcf2+Xv80xV2BU9Q6cMNXETwyU4pFm9/dL0gsVkjCEs65XifIYsg
	0vN6UXofqwsSeyXJ5q8ftvXhjmcILBuvW3b6+qPzI6dpXKVgO2RXOxW61Gi3L9st4KAhth
	STHnccx8skaE8SmsyvBabSDKaTx6hsI=
X-MC-Unique: rXm98cFNNrKHempSw_O1YA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kob4bETzhzkllki0IRBkQKqINHK3/f864YOJLGHaxPX0nipQy2r5RQcaHo/GMZO4zexuN50ji5V0hhVYZkCaYM9l4wOzpZOivC1FQVsWObOOv8OP4TFbMzVTft5ap99hraKAawOlsCgjHtLwhpZDERP9Qo9jqoaQyjeRk1NxHoOMYM/k2b8ZtxqVvmDdY7xxjJzo4rUvgpavs3PdGLb81x4NkTggt+r5l9mpxMgHsH1y3DsLJZOJ4hR/J2urtI2lJf7sRicgGOC8L1CXUKihQXh0nxDtaOy3+A3MqpFKxJ+cu3IEpIVzvzQhkcaK5BlmnDFDpe3uZT6sKv1kKdz+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrfgnfnpmbtr2ACEUZk8n8GNGfnpkgC6pMU/KrK/Ojw=;
 b=AXsvEJWq1NehnF486nbqtJ9D+bLxtaoAtxQboUyqibTc6vuFE/epCIwVuJjLtQj294gIw++3i7RPi/iaGcVkqzGWPBTnjK48sRdx2WFeWQbCEbeAG0T3jgzRtzwQTQilKfvTlVQPu+lf4cSE4O2qYFC0DsRbcOS59ue92G91CXVIEQB94guU5J3HbiCCivM9+PgnBXQf2pkrlNWqnl/h5GogApjJbP/GikQq6az40uv2CP5Op7K7TBv+gvzRxUl2r1BgUa0YD3rSMr4GEbr75upBRCXLoumPpuOCJ2xkiBuWjOWauf1NYJL9I8OU6Z+2eSIXf2B5hzNzVHQkkKv2zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00c77026-1b65-c73a-b786-0e0b9d22e994@suse.com>
Date: Thu, 25 Nov 2021 11:25:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211124211152.1142-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0018.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7b55324-efbc-44f0-1638-08d9affdec7e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848B6C7621CBDE4DA76F5A5B3629@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yPi2irhjdId0TQzVirtovxNu09V2YIccNZUhTnpTbZUMbk3Kh6zXC9XK/YOd7vU+0feRvnTbrWo11Ut0XeIhfGKqasyFRYu5tHUJ26i7LNrrvoZXDUlId0hmUnia8rCc+ozUM2L0Jgu4tx+mvcERi+5ZHO6WTjg3hTna272TUXyQ/5YPImrVHelAZRV57BcRmLrNvMyZMbcSfQ5/DvqG5qgJlDqTGUIWEuNK0DgB6ovFEXtA71YUyTkWKGEJ0gzh+m1CnYlzGpe1t4VDOTUIJ9QRJ2WHtkbAtY8lrbNrjzC0V2cXqQvA9zeB7KguIqsCKzljx6f/26+GiCTEehDzpaXB3c34oJvrH1lD7aeTDuMqi1y9VDz9Kkv+uz60jI82MC2PmANq4kEKAEHAlZ7ZBE+pGqgoUOK7XzekMNoXyBtFxqF+udijDhUjfDjwZrwuMzE5H/VJ3vZip548eC/328ZJkfwxq1wmuE/QLjLorTgs+FTmRFz555eRooDbcEJgIfgDmfpv5aIucfzEqz6seF4OcSz2KC0weZoDLEsC8DLPHAcZhKdKOjGeDew7wXNbAzYXVdidxgdx0OMoRsoXObLEvegl89K6DHkMAfh8osE+akzPxwLKEzMzGDdg9VDecLvRPAI6ajcK8SsOSKzIHDunfuSPVPKlgM6mkRWzcuazGURyVxUzvBKWLhzhQWixfb9vQ+4RqF35dgp6xlj1PIiFGpm237x+vGEo50c8ZyYQnE3wq3Onxa/H5tAo1Dbw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(86362001)(8676002)(110136005)(66556008)(2616005)(26005)(16576012)(316002)(2906002)(31686004)(186003)(508600001)(66476007)(31696002)(956004)(38100700002)(83380400001)(53546011)(8936002)(66946007)(4326008)(6486002)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXNzNXhVQVFkOGNrUUNLK0V6VDY0MTdNNDBqREg2QVUxL1hINStmM3lZQ00w?=
 =?utf-8?B?Y2RzMzNJZUtOc2JjZ3k4UCtxUE40MHN0eWJ0eHNycmNGOWs2NEZocndSNHU5?=
 =?utf-8?B?RTB6a1MrOXF2aGgwWENOd2tPUDNmV1B1a2Q0czBOMUo3YmFxRjZWRHRUbFlZ?=
 =?utf-8?B?U1N0MUd0SUFyeitNRmxURE85emVQUDhCdUlucWJncWMrelE3WUxFQVBEY1lP?=
 =?utf-8?B?WHg3OTNpSHhQQ2t4aGhtbVQwSERUOFREaFRyY002bzdRZW9icGdENm80ZUdK?=
 =?utf-8?B?N21NWVI4UG9ueG5ZNERBUkk4OHlSM2szVGZES0FxTEZoVUhsMmZ0dC9JNHZl?=
 =?utf-8?B?VnZhS0pFQWNESUc5S01vd1BKN2V2SUxzdHBxNmtEc3owQkdjREpqbXprUmw3?=
 =?utf-8?B?TnQ0cTdSTW12cjlLbFRkZXRlc1h6QjMwMnBiTGlsRlVhbk9EdHlvVmRUQ2VE?=
 =?utf-8?B?MTl3OWt1NmdxMnhEbGJnUzEzSFNGT3FYRUFZUVVobEE3SkhSRm4zTTh5MGlv?=
 =?utf-8?B?Y0tmZkwwZThOazc5a0gwYTNGeEZZaE4zaTd6eTl0TEFZdGFPWkxjU1M2YnJQ?=
 =?utf-8?B?QnNtVERBbXlvVURkK2llT1hhOUQ4ODZwblQrdFg4WEQ5WFRKbE4raTlxVGFv?=
 =?utf-8?B?RXYrU21oRHVOSVVuK1p1Y29iU1MzM1pOMHBTSk5BNjExTVIvOHJVanE4MVB2?=
 =?utf-8?B?bzlZZ24zWGNXWmlSRkhyVXlRWTRyY2h6WXA4dHM5THJldVR5aHdVSmxWbUJM?=
 =?utf-8?B?RC9XMmtCVFVzcHFOeExxdWw3R21SdnNlSUZ2Tm5MTi92cmdJaEgyc25sS3A1?=
 =?utf-8?B?Q0g0Um40UCswbVpSSldZa2VUMzIrR0VBUXdPcDRsWmZ1YVhhNFJmVHRIOFQx?=
 =?utf-8?B?SHFKR0prb3dSWGhhcmJ3ZjdjUVAwN0FCQk9leTRhdWlWN2txc3l1MFQ4TTR2?=
 =?utf-8?B?YWtMVmpzaFpNYVkzNlNHUXl6OEE3am9FK1RCK1lYa1puajRXcnVEbks3S2FD?=
 =?utf-8?B?ZUxwNTF0azhsVjFnald1MUZINS9RQ0pPS2lldFNiVFNiZTMvcFl5T3BGcmU5?=
 =?utf-8?B?dDROMXhMTStmRlBTYlFnaWxJQ25IY2xuZlR3QjA2T0NpbWZKVytiSWI1WExD?=
 =?utf-8?B?eFlMSUlNa25rZXJPeDRCNWh0Q1ZBd09WRVk5Q1hHZlR3NmY0azlLMWV5YTlX?=
 =?utf-8?B?RUMzaUVoUDhDNEJNOTlodWJVaisxVzMxMFZMYXA0RjVXTTJJeHZIQTNaR1Ra?=
 =?utf-8?B?bG5hRVFQS2JwQ3BKeGF2bFpFMmU3MkRHd1YvdGEyNHlKQnNsVVJGUG1DdGNS?=
 =?utf-8?B?RTd4c1VNVnVUams0NHRNNGdqWmh6Tlg3c1hBdFhrSXlHTTBZcG02bE9oWEpK?=
 =?utf-8?B?SDB3cDE1eEJwY2MzWXM1cUd2cnlqMHhsS0FnWHZJb2FqejBiUnU0bVlvSDJT?=
 =?utf-8?B?V1RiQ1ltSlB0VzdaNXo0WU1zeGxyR3JHdGM3ZmJnemVPRGloS1h2QVNic1I3?=
 =?utf-8?B?aXhuaE9rNCtwdUR0ZjJ6Z2FuOEtjQzBLcWp6MExEV3NJYWJuQ2dadkwxb3gw?=
 =?utf-8?B?aVFhZDhhd01tZFlmZEEvbGd2Y3pKZ1BhM25lWXpEUFNETTVUMThLbEtpS21R?=
 =?utf-8?B?eEVlVUd3a3hsWGpYVGQ5QlRuRkhJTWp6RzVZa0w3M2lWN0EyUmFybDhTWU1O?=
 =?utf-8?B?T2swTzJzWHRjWTFoL0ZNRVNMaFEydkVYcUJkV0VtaU1KQ21Vc2pMMzV0c01V?=
 =?utf-8?B?NGpadjllNGVsOEJZL3l0cS9BWkZrRHBwUmVMVGZ1dEtGeHF5UXhZbUczbFdJ?=
 =?utf-8?B?N0pXZlU5cmlDaFJKS2prazlJL3Z2ZkRTd1UyTm13RGMrdldTcC83NmpqZlNO?=
 =?utf-8?B?K21tWkJ2SlRpY1NhdVhTOGQxUytJdWNWMXRrdVJGVVV1TE5mWTZGbUwwbWRN?=
 =?utf-8?B?VDVZUjY1SWQ3Q2pYcXBEUzFBMC8rSko2eGdlSHNucnZwT3phVEZXS1ZYOVZY?=
 =?utf-8?B?VDhmdTJuMG5sU3FKbjFpdklxSXVQMXUrYk96UFg2b25rb1BUeDRoWU5EeXY1?=
 =?utf-8?B?WHBWaHo3bTA0SEExQ2dlRDJ4TjhhZ3FCVlNtci9nQTUzWjJJT3ovNXdkSDN6?=
 =?utf-8?B?TGY2emIzbjFOcWdPUkJMNCtYcFVmdGZhZ0RWdUpRSWdwRk5ZeklnUERYMTds?=
 =?utf-8?Q?qz8LNdiX9QHo0CtdTrn7A8U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b55324-efbc-44f0-1638-08d9affdec7e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 10:25:38.0267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5V6sXRTc8U+/q2pTHIOvUb58RYWmhh4P18kmsY1s8PLkQBRApQaqlrMRpQkZpbDqjrRF+IMCawt0kduKbZZbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 24.11.2021 22:11, Andrew Cooper wrote:
> OSSTest has identified a 3rd regression caused by this change.  Migration
> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
> fails with:
> 
>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
>   xc: error: Restore failed (22 = Invalid argument): Internal error
> 
> which is a safety check to prevent resuming the guest when the CPUID data has
> been truncated.  The problem is caused by shrinking of the max policies, which
> is an ABI that needs handling compatibly between different versions of Xen.
> 
> Furthermore, shrinking of the default policies also breaks things in some
> cases, because certain cpuid= settings in a VM config file which used to have
> an effect will now be silently discarded.
> 
> This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as well as the
> partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (which added
> one new case where cpuid= settings might not apply correctly) and restores the
> same behaviour as Xen 4.15.
> 
> Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents")
> Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies max leaves")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

While not strictly needed with Roger having given his already,
Acked-by: Jan Beulich <jbeulich@suse.com>
to signal my (basic) agreement with the course of action taken.
Nevertheless I fear this is going to become yet one more case where
future action is promised, but things then die out.

Ian - I guess all this now needs is your R-a.

Jan


