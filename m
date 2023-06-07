Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E217263A8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 17:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544845.850900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ugl-0003O7-Dh; Wed, 07 Jun 2023 15:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544845.850900; Wed, 07 Jun 2023 15:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ugl-0003ME-Ao; Wed, 07 Jun 2023 15:03:07 +0000
Received: by outflank-mailman (input) for mailman id 544845;
 Wed, 07 Jun 2023 15:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6ugj-0003M2-Qg
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 15:03:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 654a227a-0544-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 17:03:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8816.eurprd04.prod.outlook.com (2603:10a6:102:20f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 15:02:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 15:02:57 +0000
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
X-Inumbo-ID: 654a227a-0544-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V04r3tAeyS3cf/MBOabVA7fHQ4hYLaXMXfSsyfXLD2l5gVBGL5zeoZOyJI66BkDUiFz9F1/d+yxVG3SPFDsqugUlAHRxcvkX6A1HLq6+qQbldbOUtPruyFtZW45RH0LZUpzKjAxguLKrLQrrv3gYgQ6VER1DWbD8kxsRgw31Sm1nEQFqlKudde5jCX5IlNfop5hcYmri2EuGjzKiCNgt7hbolq2EtK9oZsdmXkjO6Q2e44IELj+AJmHlLw9UPUmSZeXct9lik5h08a9RLUN1p9JiKycd9qf1G5hfdGYK+FRe9sYrt/GEkLpJqGIaHfTghAHUowP0MXRJbtyV9a6txA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7EMO1kpZYHBUu+TatAgJD1QTGifOIbHgUy6aM/ox3E=;
 b=RBh1Vc6Xp1VZ6IR9+BlCWQHnt3qpfwiOxS8hAVfMZMLqUZDuVU9Sa/3Jw9rE0wiTtb0OwTmGF5OPzAUdZd5o2M+5eOudpbTug2fqkU321rDbmiDaW+cr7uWMenQpAmjTE98sIhA70Zd9hhwNozsmvi+YawaoQZZWAcm4f47l+yLd17uLyxz+Jx3/8jd06t3BF+cCgFxWGP8Qw2ydcklAqnJLwYY57Ny8+a1KBG2mKGkpv7dUfxtmtjzWbDQR7tPprx6BdEh2FBxEkG/WfVSUGAZgsD+nyWmRtNwUz72dj7UQ5MPJRE9wOqJJn/80DROhW56tYURnzT7FFM0zyIEhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7EMO1kpZYHBUu+TatAgJD1QTGifOIbHgUy6aM/ox3E=;
 b=Fl1Nr4QUrE/msWOJN4G812h5zsPiUTSkAyLyqO6M7LPis4bRDoguodJ2QhmEIMZ9XNNS7kIBl4yQgWcOktQOE1ePpPn30A3oa28NUvrGQhJkal+snRFR7+N1YfWOxjVC7a2wwhT2gnUAEc1M4G1RDPMQlXOgZYhnO9DUbL6WZLsMF0MfDL079BygsLb2n9RHRqIFGDFYlhurgLpSqc4+zGSU1XhQnHLpM/3auRsnm8LzOOFFAhkxGoWyLl+YhoPilP8iIuTx1petZMDYI0k696QtJStkuZxSHmaOJO4wxlVymAFe7gflzyiKYOfwXqWyQKBjCfT/KsrAKO2K8B+1iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e6e7d7c-7c8e-c031-1268-02b6bf96ffb1@suse.com>
Date: Wed, 7 Jun 2023 17:02:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] x86/hvm: print valid CR4 bits in case of error
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230607134638.53070-1-roger.pau@citrix.com>
 <3da62adc-b307-6505-f333-a7b211869a15@suse.com>
 <ZICTE9o0gdlq+ew0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZICTE9o0gdlq+ew0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: 77dfd9b9-c3ad-4f53-2801-08db676846f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G/dU/zdsfhJd7L+we0gfqTwSuwd0DGKDV9hItJerZrSRGjkVYHdjwowIvEJtJNfetC3LQU0y/eoW1FCY534BW544RtbV7R+JSAVDxmKbUbeMhZ8QbaDfK+hIH0gSWhL77t+Jcq51h1N80Ua9c55xHM17UmiD2wALiHZi6vxRTmBqQj2a3lC86KmPfROtlS1zmxFZQEODnkux9cv22d0AqxxkTFrJE/Jcygdru9QJNdx07mAp+/h9dYN9KZOe/t3w1ZxCfoq9ACgwZStEGDO1z9k48jq4p9BwRCgqGQORurxyT4ogpOW+A+rBNDLo2O1h36HJprMMoMelNVBzvVleklFsH4BrjYk/qyMdiOpKiGXXBg+lXfD2uhyJlg2HR+AwGFr/Kp5/rgqatGMBkvYodV2rKINAlLY0SwxtWJ3mA2ZoO9ul1Ma2rUGdZHivhwrfK2q3EA5/V9RibDEfSaN/Xjq+oFMWUMSZOTR86gTTO72lV4OA0Bq3++Ml/An3Dut2Pg1EoLnSK/ZDRrxEHxAYoA/UEFP4+SU17u488nUuu+8bzCQGSfRI0iZFDC17FQU+MyMhuc0+Y44c0fj4huObzXbmzP55RSNp9CRclf8MTEdK8WKausRI14BvSL5Phyc5zHpolJfh450OpoIVaCc9tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(186003)(83380400001)(2906002)(2616005)(86362001)(36756003)(31696002)(38100700002)(316002)(6486002)(41300700001)(5660300002)(8936002)(8676002)(54906003)(478600001)(66476007)(66946007)(53546011)(4326008)(31686004)(6512007)(6916009)(6506007)(66556008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEd5akwxc3BYdnZXYlpuTVpXdUlMVi9EbGJvZ1pybDRmTXNRQVVUNWMzeFBp?=
 =?utf-8?B?K1hlUThBam90Z3JEd3pHaGdFZ3lGQmZBTkdZekhqUjB5ZFR3UUxEanFRSWg1?=
 =?utf-8?B?djdkSXBlMk0zQkFwZ292UFpON3plZkJmMmZBVStyWmtRbUw3U3JZUDBIb0t6?=
 =?utf-8?B?a3VlUTEydmxzUHgrR01NMDU2NlF6Q1RQd1dSVTBoalp4Zk0vZ2N3NHh5dWht?=
 =?utf-8?B?WDNEWUx5L21xdjRyczY1K3hPcnpVbExZbGgwbHFuN0h1ZXNxeU1JVFlPc05u?=
 =?utf-8?B?enBFQ3FWYTBKOU5FaHN4T0srR0tOZGZmUnptalZXNzMzc2w3Y3BYd01sM21r?=
 =?utf-8?B?ZXBSNTZLYkxZa1dGRXd2NzNZMXNnbFkzTXRuVHJvUjRRKzlOMmtBZGRXbk1a?=
 =?utf-8?B?WmgvNzdRTkFBUnlDZGtnbjZQdllMNVoxNXNUaTUrZnVGc3dabjdZUUZUK0gy?=
 =?utf-8?B?dm05cTBEeTQ2VG1TYkVuN3NINi9GYmdEWWdkZ0tHL2d0MDA0UFJPREx6Qzd4?=
 =?utf-8?B?QmRYUVE3emUrZ3p5N3ZtOVFEbnE3R3Z2Q01YcVR6MmREeXVkczdPVldtU3NJ?=
 =?utf-8?B?Z01YUnVxRk82UC9aMGdiVnpXM3FaNUpSdUUvK2h0b2pub2RtZm9YYlAvWlN1?=
 =?utf-8?B?a21WVncvK0NFM0o5bkZPcGRvSXBVZE5yZEdZMngya3ljSkdhb2NmZ0hLZGN5?=
 =?utf-8?B?OU5wd1A0Ym55bStDaTM4NCtkMGJrTkkyVVkwU0t6Z28wa1Zyczduc0VZYk02?=
 =?utf-8?B?TW1vRC9KK2d0Z1orY3RvNnhnemUyOUYrdkVUYWZwYWNSaHZLU2F6WmwyaURF?=
 =?utf-8?B?MDNOYndNbHVkMkRQUGdhV2NiMWZ5SjNmYXVBUi9BUmo4NXRJS1MzOE1zK3Ry?=
 =?utf-8?B?cm9KTkZ2YWxCWGk5RG5CWWJIcUYwS1NIZ0c3ZFZFWE54LzVnQUd5eWpqSHpq?=
 =?utf-8?B?SS81RmcvNDc4dWxWV3JGUmdDU3ZtVTloaGxqNWluYmlvK3ZIMU9TOTRlZEwz?=
 =?utf-8?B?dXN0UFptcFVSTStZajJORndsK1MrcVFzMW1YTm1zVDRRT0d3eXh5bkdIK1FG?=
 =?utf-8?B?eE5VZ0NESXFiaTZZZFFNSWQzY3M1VHIvQ2lWQk9heEpDeVkzdHQxMDZ3S1Fw?=
 =?utf-8?B?eEd0MUc0TENTVVQ5OFpZUktEQXhzNFlpQWhaTGFhZEJOd3Byc2JBNExSM2JB?=
 =?utf-8?B?UXc3a09KWmUxbVFNMG40eXVZUmczaldtTHlNMHVZdnRlS3V6NE85Skl0dzI1?=
 =?utf-8?B?QTU0dVpQQUNYYXZUQmx6SXNVaVJTbDJuMWF6NGNjai9VS1lPN1p0eDFGakFs?=
 =?utf-8?B?Mkd3eXFQQWlvWFZQM21mNnFiSk9GbTJSN3FpaFhmUHh2RnJZclFFRGJBeUtX?=
 =?utf-8?B?eTh4Y1VsMituMk4yMno0cWxoNjRBNTVpZVRNa28vK3FMK0p4UWkyZ21Jbzlz?=
 =?utf-8?B?YmtZTGhoQ0hFN1RiQkpnTDBYR2FSbTNiYmUwYVBHOGtramMyU2RVR3NjRWQ5?=
 =?utf-8?B?c0djRTEzRS9KM1cxczAydnE4TnV5WFpCTzhXNmFtTGVFTkFZQ0toQWRRdXV0?=
 =?utf-8?B?NFpwL3Frd3pSZW1OblU3TDhDMlYrNGExNHR0ZStKSE9KK1dsbERzbVNLRy8v?=
 =?utf-8?B?cThXNWxUNTFFcDliTXduQW5lcU5RUmVsaXo2NHBsMWZtWHNaZTJidTcvN3E4?=
 =?utf-8?B?Y2RtWFNNWk56K1lBMy9YeTJ3N1JjVUkwNTNBa3V1OVhZODE0RW9yYUtjME8v?=
 =?utf-8?B?TEM2RURJVm1HVDM1dWdyRVZSZkNBdzArb1d0NzBmNFdRMWM0eHA1NU0vMm5i?=
 =?utf-8?B?K0VhYjdTdGRyUWxQbzZ3bTlpRXBlbnBSTjFuRDM1U0hWdGc5SjV1VzJINGJT?=
 =?utf-8?B?OENvUHVJZm5WV3pIVlNwajcvVHR4MGo2TkJSMExXKytCU0R6ZHhVUCtSRUpN?=
 =?utf-8?B?SlQzWE1Va25STG5ZQ0VFS3ozV211ckE0azNUSjRiWjExVTFqK3ZGUEJnam1J?=
 =?utf-8?B?MWZGYlc1NVNLRDllS3Q2TWNXOXo5L3hodFQ5eXhuTzhRQ2lJLzNQazlnbStP?=
 =?utf-8?B?S2h6Tm1FeFBQWWEzTGwvang5WTlsSExWcWtyOGFXb1hQK0VEOVA0dlIvWXVH?=
 =?utf-8?Q?QbQTCnLcHlkxW2WFA+5NtXsdb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dfd9b9-c3ad-4f53-2801-08db676846f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:02:57.0293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThhctORBIU3+ll+HQW4KklHvODe7lZ0DAubhOKcqdPqN32kNq4onZrAcfB9AnfGypggS363FhJ+NIMeLc7HzUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8816

On 07.06.2023 16:24, Roger Pau Monné wrote:
> On Wed, Jun 07, 2023 at 04:00:14PM +0200, Jan Beulich wrote:
>> On 07.06.2023 15:46, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/domain.c
>>> +++ b/xen/arch/x86/hvm/domain.c
>>> @@ -266,8 +266,8 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
>>>  
>>>      if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
>>>      {
>>> -        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
>>> -                v->arch.hvm.guest_cr[4]);
>>> +        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx (valid: %016lx)\n",
>>> +                v->arch.hvm.guest_cr[4], hvm_cr4_guest_valid_bits(d));
>>>          return -EINVAL;
>>>      }
>>>  
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -1018,8 +1018,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>>>  
>>>      if ( ctxt.cr4 & ~hvm_cr4_guest_valid_bits(d) )
>>>      {
>>> -        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#" PRIx64 "\n",
>>> -               d->domain_id, ctxt.cr4);
>>> +        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#016lx (valid: %016lx)\n",
>>
>> I'm not convinced printing a lot of leading zeros is really useful here.
>> However, if you switch to that model, then all uses of the # modifier
>> need to go away (in the earlier instance it would be nice if you also
>> fixed the pre-existing issue then).
> 
> Hm, I've got those messed up.  What would you be your preference then?
> (%#lx?)

Yes.

> I would be happy with that also.

Oh, even better then.

Jan

