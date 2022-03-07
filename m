Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A84D0129
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286101.485462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREJh-000234-3Z; Mon, 07 Mar 2022 14:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286101.485462; Mon, 07 Mar 2022 14:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREJh-00020o-0N; Mon, 07 Mar 2022 14:26:29 +0000
Received: by outflank-mailman (input) for mailman id 286101;
 Mon, 07 Mar 2022 14:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nREJf-00020i-7r
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:26:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91d8f4e0-9e22-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 15:26:25 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-wsMBWSRXOFqMQeJ5UkC2Dw-1; Mon, 07 Mar 2022 15:26:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4198.eurprd04.prod.outlook.com (2603:10a6:209:4e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 14:26:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:26:23 +0000
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
X-Inumbo-ID: 91d8f4e0-9e22-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646663185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipYBTJyVZYqQIjlvd2AgtoPfdZUZKUxC8m4xSwOfnsw=;
	b=e2IyFpQ35+QlgeRBlQnliTL1LFEFvXLQBQ73yI6+Onw5d4TlAJCbkz7wjijW7XwIi1ZcKw
	YMyxaOcI6x7jMiBfvHg+kVrtcDH8uAt5VGrQXWH6IzgZ0ihLdgEKUGvy2Gcd9w+wOGCbfI
	5EjXtwgsQr2fvY2dOMcmvowG6qauk/w=
X-MC-Unique: wsMBWSRXOFqMQeJ5UkC2Dw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeBhTDAmEBZu3NI9hHzVRfw5uqLPoNXpcsUQObgDpRKzSwkFf535SwCPdcyy4ChOn09YqpE/0G+opy90M6E8aCUUxL0hrIuQtxG7dmICjk/fA8GHkdg6cRB7sBLNZShYSQbLPrO1jc9vp5lSEQOqk/1qqUeZkboBM8HoyuN525i4O92lUsH4d3GmndxiodtkeQR6hxF31QpSX7wesDazkBLqMGvAJYZLB8ZV1qRv7U7d2aSosrU92gTW2DgoyzNJDAQ2x6NxVzPz9PTy3FaBwhzlU7aHCEd42scAhnVQzWmzZ8m1nXFtjLoZLj5mBpV9r1d2mhbs+42BKN6JPv3RBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipYBTJyVZYqQIjlvd2AgtoPfdZUZKUxC8m4xSwOfnsw=;
 b=hUwhyyk5OhqKBIi92PaRj9rof6SaE0tbyhULOZq3sKkWyuO2bW1uAg0DYN2oQcqKFqXs/g+N5hcyxE2ibqOCPkCFnUN24KXAoIaedaZZQ/T0IlOEA3BXwYOcfySF6U2PP06KZXL+PN6Hq8nxXwgmcRlJdp878M0r2u943qpjW+Sqd0a2XRoOJVQ3i3jGDCg5d+RFtX8mxHw4rfOz85gX7y10s1y2933Cssd7IlDXqPCN1reT7fSJ+RU9YKyBvwJR1uC2C1CurTnxkgqsP0+oYqNxr94R6lBkdWD6be5evitpEscEiJSEAjIvaL1JhonP8IY+Hu1eMVmVdpJMMvsd2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db353243-3fc9-3763-100c-67d79856b3e3@suse.com>
Date: Mon, 7 Mar 2022 15:26:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>, Bjoern Doebel <doebel@amazon.de>
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1646653825.git.doebel@amazon.de>
 <deb5d86b20c02312023959bae06b0fe651a4b2f4.1646653825.git.doebel@amazon.de>
 <8315826a-c6ae-0abe-a25b-74e37080383e@suse.com>
 <31b6eb2a-31cc-efa4-fe22-e0012acdf2c3@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <31b6eb2a-31cc-efa4-fe22-e0012acdf2c3@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 012193a6-a856-4655-f6e6-08da00467474
X-MS-TrafficTypeDiagnostic: AM6PR04MB4198:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4198263935C6BE857331191BB3089@AM6PR04MB4198.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	90f+g0Q5Nagny+Cf/asW6PGJwUz/UcA4PObFezy08W5Hl9bsauJ4/kaL/Y6u00A5w88vOYxgee71T46Q/OwFK0bKgb1AqvIyituUBSwmGGtanAUtsQCF+4jda8x67XzQdHPVu1GSuwZ5jzqx8mcOiIpfgAKJQrZUySWbBCyPbg/7koRbskS8POPvDpz5utisLlr5f6fFEfK3+Jw9ObRFgKwz3SmS5SA7Ma1DkTcGORlG56fUph7McCqNyhTSOa3dj/tcrDbSgm4yontcHlP4PPVsaU8Mz4aDyvrbS0kBWv0+q5yJjD+dpNG0kZ+a1EnbvOFnqEiPjoiA9nVb4B4xkMRPFdtQ4DP/obAr7psSvThKrUGLm9GUekmmmUTWCQcQtM3OFxq8BRH8eU5ejjRRdwHmlD3+ssFuwIfVAh+9tOd9beD+8wp9AfCOXBnE3SKvYNg8FEtbhk/LLc1zA03EnKZMFTeFfRv3iJN9xSHpl7Rlg4HexAHAG/3aS5fiFP7kH5xkIoz8mj/hPCDhKfcN5tKMAq4YrjDKdcUpumQGUdNP0eOT1YIjGTqJ+9DI9koNpNzsmiNr1CzeC0PdWNCmksn8pVnZEych/brnmr64nGVa0BoCbW/8D19lEXZIfMoVIQ9UYGkFiyoGxPdHgv3qQQS8uG59MnrYkbIgZKaRlazX77W8LZ3mUXKNImepHBZLcYuK5dE10YW7KGYfVhsotp41q0xZlpNhYR578FvoBe0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(316002)(38100700002)(110136005)(54906003)(26005)(2616005)(186003)(508600001)(6486002)(6506007)(83380400001)(5660300002)(8936002)(2906002)(31686004)(31696002)(66476007)(66556008)(6512007)(8676002)(4326008)(66946007)(86362001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkZaVmxrL29HR1lOcHY3UUNtOTBweEFQaGxIMTdJcWpYSUJCWnR4R3FlY3Nm?=
 =?utf-8?B?NXFKSUFRR3BtejBheDlQRll6OGRSQTg1ay9vbkdkSWQyV1VvMHE5OGJCZXZS?=
 =?utf-8?B?dGFyT24zVUNjenczc01RaHRwU1R0SFB5Q2ZxV3pJOUJVSGVKWWh6YVZ4TlpU?=
 =?utf-8?B?ZlNsOEZBN1F3Qks5WHlrdTk4UEVkOEJzeldNbzhmcm5PRy9VOVZoNGcyMHY2?=
 =?utf-8?B?YmtOQWMvNy9PTGgxcjN5TVBic3QrTUUvYTczMjV0REJKOHVJSXBVRldkalRx?=
 =?utf-8?B?MGdxc3VHL2FhVVptTVBacmdwU2hRRkpWWUVzWTZGZ2Zpazd1RzdaSzJIbEpl?=
 =?utf-8?B?dzhXOXF3US83eGNVR0VmUC9GS2tJZ05wdE8rQ3k2cDF5T010U2gvSkVZYnJF?=
 =?utf-8?B?TzVkK2FEZFNIaFptdEFEZ2FJcjNlQ21jQmVORkZpTTEzUlUxS0FjaXViVFIw?=
 =?utf-8?B?YWg3cU9XeThmZVlTRmpLVXJMNGRjUENTc3QyR1JWNU93czhUaVovN1p5R3Rt?=
 =?utf-8?B?MU54TTczbWRGaW0wSVIzQUo4TmlMZGRSU0ZhU0pTY3d6VmVxdzdKZnJqZ2x3?=
 =?utf-8?B?NG1BK3J0emRKSWFSOWZITDZQaVlUVmFEZVVPZnZLais4NEsvaFlLUngrb0VK?=
 =?utf-8?B?a1lSblhTMXRtY091UXR2U1lmcDd5TW1PT1ZpeEhnVHptTlZjM1BnWGdpRzFN?=
 =?utf-8?B?VG05K21SRU95dTdoWXdJcVlpa0dtY2F2MjgyTlJtOUpHZWE4NCtaTVpzOTZj?=
 =?utf-8?B?SUwvbmQ4Ykw2TEZackd0T1Y3emhZd0RtQklKMm1McVNTSHpBeHNCdjBjQUQz?=
 =?utf-8?B?ME4wZXhKRzNUQzl2cVFPSnZWYWFHMVNFc2daTEVjN3c0UnJEZndlcVp5b3dZ?=
 =?utf-8?B?QlZHOEE5RmVqeitDMTJMTEVzcFovQXZ0U01vK015dSs0bVg3MW9IRjE4VUpi?=
 =?utf-8?B?VTV3SWluaTFNM3poQzRIMm5IWkJENzRWbEZEMCtXa09QSUFSMWlLeHFnc1Zz?=
 =?utf-8?B?YXVDUXhkVVFQUHlueUFhSFl2a0UwbFhybWJ4dnVUUjg4RWM1RFlQRnVuRFdR?=
 =?utf-8?B?OTlQLzZmNFJxSVlVQmlxanIxSFNzQklxcVp3dDZHaUwxUVFDWm5ldm9Rc0hZ?=
 =?utf-8?B?UjkycEtyYkdRY3Y5a0dQOVo2NTZnZ1Z0N3hlNU5XZ2tWa1M0SWR6NFVZWlJv?=
 =?utf-8?B?RWRpUzNpVnR0VDM4Rks4bEpxZ00wcW5EdEFMc1QvMXRlTzZpWmFZQTMwSlJ0?=
 =?utf-8?B?L09XUWlBc2tIMDZ2WERBTXBMOG5uZUdobEtRenRxeE1xbVRncXRyOUJwd29C?=
 =?utf-8?B?UlZYSWZxbXpidjVzdzV4UEpoMnBSdHFEQnd2eDlVRlJBSXV6bEJVczBrcm5W?=
 =?utf-8?B?a2FzeXUxTkQ1NU1LMUFQRTEwaTF6MGwzL0ZFMWdrcUlBcWlxbmJVeGhGck9W?=
 =?utf-8?B?VnpRU2RvZDg0WlRxQ3lEQUhtVWdGY2ZtVWl0QkZGalhuMGZ1VVkwR29MUEtW?=
 =?utf-8?B?OUJaYllTM2JpbVVJWmZBeWJpQStqQ3A0S0tjYzNNYkxYSGtXT2xiaUo5dkly?=
 =?utf-8?B?MWFGaUVDRjFvblVrNXR1S1lIc2REbm92QUY5NjFMc3dBMUd3dVk5Y0RIQ290?=
 =?utf-8?B?YXQwZXpNUmh0MFFmOVoyV3Z2UUpMS0NQUGNFQmxkNHlONHozd0lkTi9may85?=
 =?utf-8?B?Qm5ja3A1QkRvR0ZMQUk3US9vSWhnODYwZmlqRXZ2MFZJSVhGeXhESHBZOWt1?=
 =?utf-8?B?MHpPSFFYbms2WC9PQVBLZVBBQ25JRXl4SVdVYnY1UHlCMmRFaFh0bDY0bE54?=
 =?utf-8?B?NXZJNmFPZzQ4b0dzSDVXYXQwV1hDSzZxKzZWRk9wZGYya1U1NkMzRFZZaVBH?=
 =?utf-8?B?OUF4ODgrMjN5bzUwSXd1d3ZtaVBPekF6djUyN2MrL2ExUjZzTTNLS3MxZFd6?=
 =?utf-8?B?MFZZQWxXYnNwbWdMa0o2MEhKdGJtRzBwWjFYRXBsNlpDSDMzMEVTaFJzWkZm?=
 =?utf-8?B?WmpCbmpUbWJJWm56aVVBUzRZVThPc21Ccm5OSEo1WDJDT25nL214cnlIUy9H?=
 =?utf-8?B?QWloSGZGYjR3VExDcVpXNkUyS3ZWWFRGSGFmSkw3STg4QU1BOGVkeDhjQlg4?=
 =?utf-8?B?dnhjZUsvT2lFVWZ6UGo5VlhaemxmSW1DOVRCbTF0Nm5QbktkaHlhWktuT3o0?=
 =?utf-8?Q?RYKHKNSHoV2agp6DJ1+m4I8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012193a6-a856-4655-f6e6-08da00467474
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:26:22.9285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qD26qim0OCZ+E3ZKp3UlXgnGJSMfERBV0o/I2/FFmxeBNKgZ/OpuBu1/If3YLPbO5uVBBQaBEfipMsIYPjFLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4198

On 07.03.2022 15:21, David Vrabel wrote:
> On 07/03/2022 14:03, Jan Beulich wrote:
>> On 07.03.2022 12:53, Bjoern Doebel wrote:
>>> @@ -104,18 +122,36 @@ void noinline arch_livepatch_revive(void)
>>>   
>>>   int arch_livepatch_verify_func(const struct livepatch_func *func)
>>>   {
>>> +    BUILD_BUG_ON(sizeof(struct x86_livepatch_meta) != LIVEPATCH_OPAQUE_SIZE);
>>> +
>>>       /* If NOPing.. */
>>>       if ( !func->new_addr )
>>>       {
>>> +        struct x86_livepatch_meta *lp;
>>> +
>>> +        lp = (struct x86_livepatch_meta *)func->opaque;
>>>           /* Only do up to maximum amount we can put in the ->opaque. */
>>> -        if ( func->new_size > sizeof(func->opaque) )
>>> +        if ( func->new_size > sizeof(lp->instruction) )
>>>               return -EOPNOTSUPP;
>>>   
>>>           if ( func->old_size < func->new_size )
>>>               return -EINVAL;
>>>       }
>>
>> I continue to be concerned of the new local variable causing compiler
>> warnings. With the adjustment made compared to v1, the specific
>> warning would have changed, and we're now liable to see set-but-never-
>> used ones.
> 
> Linux has a sizeof_field() macro for this sort of use.
> 
>      /**
>       * sizeof_field() - Report the size of a struct field in bytes
>       *
>       * @TYPE: The structure containing the field of interest
>       * @MEMBER: The field to return the size of
>       */
>      #define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))

Oh, I should have thought of this. Iirc it was Paul who did pull in
this one, so it should be readily available.

Thanks for pointing out,
Jan


