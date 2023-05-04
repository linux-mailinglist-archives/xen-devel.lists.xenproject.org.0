Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4D6F67FA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 11:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529644.824250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUwB-00026j-LD; Thu, 04 May 2023 09:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529644.824250; Thu, 04 May 2023 09:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUwB-000245-IR; Thu, 04 May 2023 09:07:43 +0000
Received: by outflank-mailman (input) for mailman id 529644;
 Thu, 04 May 2023 09:07:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puUwA-00023z-Ew
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 09:07:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f69816b-ea5b-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 11:07:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 09:07:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 09:07:37 +0000
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
X-Inumbo-ID: 1f69816b-ea5b-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4H1VA8bznmMSbKgMZocZJvvgaOwAHBFtDH/eX8KHjkbw4qHICIvLk8IvdOy9wF5Acv9nakuFlz3wieQYlRH9EvCEnerJIwiINrchDN55RfUeDMo7byptkcboBVNQ+nFYZNNPhY++8Spq/ewqWYOPXV32IoXySvD0gRyA1JWQVzmlO8p/kjgYXoXNBqoJy9svUd4a363Iyo2/qG3k8SU7lkBGMvsk4CR34JF+FGQhkcmIpc6FgQlKxDUm5ewaUF0EcHsmNMxzVFfYgxwEhvEHy5mDr6HirbflxmMTvtM1HeCdwxcUgv2RqSPrBp/6KlID8pRhfvVv8wWdeDyv1a96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlZrFoirnzlXG/C+nNjoRY8I/3VK2E7VhUCpER1XfAE=;
 b=Q9YDBDQcO5LfDPH7v4BaC8mR04ONiu29LMPfS0pORKYhaz9MtrbllcejolxtormKt650CNqba4gRxYzJQt5RriSccYQc8NrcpY1PgCgqZHgB+bGaV1HDQt2RPKzLjyE1Hp5vmQV+T6qzEwBAgELh3fhdI2TNucfG3HC6Sj6pUlHD2FkYRBizYjk2gH+TLAUzWFDQDbwfUjtfZobLLIxCkD0FSE7D3B4+r7d2x5OnAV4DNv5L8bx7biSBpq/+ieWmJ5mAezTJ/AM4CzZDTVsKUcqaZ7iXLjAJWYuyPuFLN8ztE9Y3Mn5z9gsczObV2GmlQCcm7/cQ6B4TYkYpouEuZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlZrFoirnzlXG/C+nNjoRY8I/3VK2E7VhUCpER1XfAE=;
 b=EVRm5HP1ARaBXSEdnz1aB5gBKt7VK2YZPtoJdqTHdnkIgATcv1fBQfuRXbJSpH/xkBo1DybK8CYF8jkO+WJ2uIC94NcdVXS+dhZVf+ETCPtDSN3331RJDrrJFJNWUUGaC1o4R2t+G4552xfJNVKhUSYaKqVLAeuB3enRVOVN+2hTI/Ux17fEXPdoF9Qaia1PqwjIF7tLQjPsHWLNzM/DUjq+dhMdWF1tcK5fkE6S3ygXjjELVAMn8LLfhk6Nzctkx1w8A6rNZuSHa/uGpS9AgHxwRh+o5WOkuT4jmLQzHH5YjPyh2VecUXJawPQCc2dVc+WOIKDmlOnQfEVbJJ+evQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e159a5b-b7be-c582-7300-154cec7a8e91@suse.com>
Date: Thu, 4 May 2023 11:07:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/ucode: Refresh raw CPU policy after microcode load
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
 <ccf68f0f-6fd7-a9a4-ef72-03999d11035a@suse.com>
 <b655305f-293e-a0dc-ab39-36b0c9787433@citrix.com>
 <ZFNrW5a/aY7a3KTs@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFNrW5a/aY7a3KTs@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 5718b1c8-f2d7-4513-60a6-08db4c7f0166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9zCrcCsnwpNP5iAQJnFh29r1DtLdbsXHRp12nm/Ea23tb0Wj4uOb4aX8QllUyA39muhmufyct8Tq6gHMukKg0qrebYSEDGmAf48hCNMDObAN4k21UtYZVZC2TWdUPnQF294hX+sHS50WCMYC2LWIaKubFRiKewBhlvZ0dvRIx6E+dyjPtprWBmUukr+E/9UGGpDgyb4lg556JzW8ip8hW50S3u/h8+VdnCT/ZaW3NNh2ZXDisdXLSz+3gp3IWCzDOSpfg4FnHZcnDB+hTHEbdF6xZ4t7aKTJQgDQpXXrxLymrF4QqHN/z18mautVH61EzvmwBl8oQzvesir5bwm5DR2MQeLN2uLDntSuqSnAFQXnq57R7azHztEmescyz6nU8uwrhIVT4YWX3qWDBzX9r9eGaQ/wNnXd3HNn+gp2BkJC3XwBz2igvD3RaXCFnwqLjf3TPYHAceUp7OiU1n2HxDjln4n6w9BsURTUPMsyJp/jitk8c+x/fsCfh7u3JNtjx+NeIVF32MM+TZGJVqqaQbCyIzBMtTe9SFfwEhXQuFpcH622jVj07kB7v0Y0ZUr8TyhnRMkTKVWdQmZqa2yjwBHnF1jiUXa3O0RoEK4wLAGB2dOlacelq1SLQvrpijpaoDmfTyl+YNad9eNjfj+zzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(83380400001)(54906003)(5660300002)(186003)(2906002)(38100700002)(31686004)(316002)(8936002)(8676002)(53546011)(6506007)(6512007)(26005)(41300700001)(36756003)(6486002)(2616005)(66476007)(66556008)(66946007)(6916009)(478600001)(4326008)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzZVQkVZZEtrdG9nWm1JZXRLVVpRUk1Eb1NOVGx2c1BEd1Y2cVpkeW5xKzV3?=
 =?utf-8?B?OTdIQXJyWlJ5NWZKT3k2TmV1bUpGMEJUdnBkenhiN1czdVR0Ti9xaWVJY0Jt?=
 =?utf-8?B?NkNBUXNYYmFBUEl1c1dHeHJLcDFPaWJSNk5ZSEx4ZjNicldoMXJ4NnUyaStR?=
 =?utf-8?B?ZnJPWGxOM0hCQVpSMWNrVnh4dzBJSXJ4ZVRjNzAyd3lrelkrQ2N2aFpTb1Iz?=
 =?utf-8?B?VEhTWFI2YjVGbnlRV1hsMzlFM1dzdHdTekVNazRMUXNRdmZYUmlaT2dqUWNv?=
 =?utf-8?B?L09jYUtXeHBUS1NJemxNNGhDdk9aRVdDVlE2VWVJY0duVjl2dVA4M29uazlx?=
 =?utf-8?B?c01DWE5oY2VzMkVoTXBQWHMvRHoxZmtwM2wzUDBIZTdmTS9ldFhTdDBtcnRH?=
 =?utf-8?B?MEt2TjlEdWJUQ2wvQ0EwcXRBWTJPOEE1SVVZSVFBRjBWNmxrT2oyYnUzejgx?=
 =?utf-8?B?aGd4elFVbUsxUzdvRUhWUWJRTFdWamwyQ1RwRDJjdTgvYTVIN1RiVUY0Wjl1?=
 =?utf-8?B?ZlJUcjRVR2xwWXFXYVVvUzBTdjNtSXNZOWVMUXJkYWpaeEk1cExZcVB1NHUv?=
 =?utf-8?B?MWw3ZkJEMmVrV3ZtV0ErQkdVSVVtb01pZHYwNzJ5SkNjWGRLMXM2VHRrN1BH?=
 =?utf-8?B?bVNjTHNIRUY3NEF4MmNucTdPMms4Y2JkSExvWEJUTmx3dzlvdWkwK21pWVl3?=
 =?utf-8?B?cXBMaGJsaE92anlleW1hT1gwSStzVjBmQ3J0R0IrSkZlVDhXSlJHVkg5Ynhn?=
 =?utf-8?B?Q1JjTE8vNWZ0NU0yb1RTaTU3L2wwaThkL2VodkNGQ2JXTFF3VTViT2s1TzF5?=
 =?utf-8?B?bzFrSjkwalkrQklUSjh0dlpvMlNzQjljVXdFb2ZyaHhSbFQ1ckc5dXFzdW1w?=
 =?utf-8?B?bXhnenVyNjl5MUcrVHd5M1VYb3ZieEhSRVJSell1M2FMQmZ6QlFEWjlwcFAv?=
 =?utf-8?B?WlM4ZGIwTWROUTk3U0I1QmkrRThzaWhtV2RJZUJzM3RHK3FrdnRPdEVlV2ZF?=
 =?utf-8?B?QTBQL3BIZUpqTTl6NnpDaU1QYklKSThFSTdyVG9FNGhCcU1vUFBIamlkei9J?=
 =?utf-8?B?RE50RVBtSXZ0RFBERi9KRWRzZ2xYbThkRWc0NW1VNDNhOTBiVmJ3b0s3clA3?=
 =?utf-8?B?STVBMEJoajZXeG9qNnRpUWl1bUUycjZBbjFxZ3h5UGpndGNDTXJyOHQwcWla?=
 =?utf-8?B?dGd2bWdBcmN1LzhPR1ZkY1RFQTFpMkZ0MDZZYmRPMGh5NkRXWFpVZS9XWDRl?=
 =?utf-8?B?N2dxTUdRandhck5qK0RLeGl4TUw2SWRxenFDMWJpZjZSS0JUYVFrMDRFUjZj?=
 =?utf-8?B?OCtPL0NaKzc4bU9MTzBMZHBLcTd4S202cHptQkpEaWpQeCszcWVwdU5kWEhp?=
 =?utf-8?B?UmEwVlg2UVJjc1l5MlJOcllTZjArS2xPMWRCWlpsOE1ORlBySmc1b2pWUUVP?=
 =?utf-8?B?NHp1NDNMa3lvRVNBYzBWSDEzdEtmT2d0RTdMZVJrNWNKSmNNVTRyTUFNTEtH?=
 =?utf-8?B?dHJ5eVNxdC8zWVk4SzJybWM3Mi9HbTdORWRYaDY5S2s4VVFpRE5LZXJOYkR0?=
 =?utf-8?B?b2xhMFE5TXp0aUYwWWhYVVBrbGFuMGt4TnA2L1pHTlRQQndrV2p0SlgxWE8x?=
 =?utf-8?B?VU1FMHRDbHRLclhMVWM3NTAxNGs3aWFucTJTRXZoRHZ3VkNibDlvSzByRWRY?=
 =?utf-8?B?NVkxbGh2by82OXJpK01YR1Jnc25IaTVQd2VnWURqSk8ycUduRzFQSTNCMFV6?=
 =?utf-8?B?Qm5KaTlkRk11a0ZIeVp4OW52UVNwVVkxbHBEbWhqUDhpYzNYdDlxSFY2QjdR?=
 =?utf-8?B?R1JvM3JaV3dVdHg3QmxPMFBkU3lLUmFoUWg1d2FKdmlPUFE4NVBsWElqUWlo?=
 =?utf-8?B?Z2pWRFdNWHByK0lwU2UzeWVDLzIxSmlKbEttaVFSYWRlS2kzNXJUNVptTWtX?=
 =?utf-8?B?Y20rRWs2K1IrbFNGTHpjTUVlWFlUZFJreDE4ejFTbVBsOFdBN09QSW96ZWE0?=
 =?utf-8?B?SzVNZWhXTS9DNTFwSXR2RWpsODY3TzcvZyt3N2poT0syTDR4VXFxd2tOa2Ew?=
 =?utf-8?B?cUc5TFB5bnp0U2JzRzN6M2lqNFZNYVlNSXAxZDU5ZTNTQkx4S1NDMjdGSU5E?=
 =?utf-8?Q?U05uGXxxoPehwn6En/yOyn/GM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5718b1c8-f2d7-4513-60a6-08db4c7f0166
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 09:07:37.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SWQqwkqyZYJH/YZCLou74z22vX1jX4iSbs6twqh1A6Z/P9muLJpan3TTxT5G97B6QOXQI2uXOAd4RoQEJPSpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

On 04.05.2023 10:22, Roger Pau Monné wrote:
> On Thu, May 04, 2023 at 09:08:02AM +0100, Andrew Cooper wrote:
>> On 04/05/2023 8:08 am, Jan Beulich wrote:
>>> On 03.05.2023 20:58, Andrew Cooper wrote:
>>>> Loading microcode can cause new features to appear.
>>> Or disappear (LWP)? While I don't think we want to panic() in this
>>> case (we do on the S3 resume path when recheck_cpu_features() fails
>>> on the BSP), it would seem to me that we want to go a step further
>>> than you do and at least warn when a feature went amiss. Or is that
>>> too much of a scope-creeping request right here?
>>
>> You're correct that I ought to discuss the disappear case.  But like
>> livepatching, it's firmly in the realm of "the end user takes
>> responsibility for trying this in their test system before running it in
>> production".
>>
>> For LWP specifically, we ought to explicitly permit its disappearance in
>> recheck_cpu_features(), because this specific example is known to exist,
>> and known safe as Xen never used or virtualised LWP functionality. 
>> Crashing on S3
> 
> Printing disappearing features might be a nice bonus, but could be
> done from the tool that loads the microcode itself, no need to do such
> work in the hypervisor IMO.

Except that the system may not last long enough for the (or any) tool
to actually make it to producing such output, let alone any human
actually observing it (when that output isn't necessarily going to
some remote system).

Jan

