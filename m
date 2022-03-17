Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565F04DCAC8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:08:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291666.495202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsf8-0007Lh-Tr; Thu, 17 Mar 2022 16:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291666.495202; Thu, 17 Mar 2022 16:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsf8-0007JE-Qu; Thu, 17 Mar 2022 16:07:42 +0000
Received: by outflank-mailman (input) for mailman id 291666;
 Thu, 17 Mar 2022 16:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUsf7-0007J8-Jc
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:07:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b4bd117-a60c-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 17:07:34 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-18cT8ZEEOTqpUhgnsHl9vw-1; Thu, 17 Mar 2022 17:07:39 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR04MB2945.eurprd04.prod.outlook.com (2603:10a6:206:a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 16:07:37 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 16:07:37 +0000
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
X-Inumbo-ID: 5b4bd117-a60c-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647533260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2ix9lrDuwnC2mfvf9nilBBANmOfSzZuGKrKqTEQeeo=;
	b=Gs6B4hAyA/3/O3/vkfAqDbKNoDD/na2p9JCEmPrGgFxjHlqP7SwhqnlTJXiOLtTV6Gk2Fe
	+wwzp25Dk7wxY55B1dcappTJHCJ+1Bh4QF2OGaKPynFDGXg8zOnuUByu/PlpMR5HXcxxoQ
	ak7G+Imhf+UEXIB+t8CGmj+4Zoft6YI=
X-MC-Unique: 18cT8ZEEOTqpUhgnsHl9vw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7mevC968OOOLH5EA7LMbg1WkJbTCBuUbpDXNVYJR//iALWTgcQrstZ0eHWyAex3uUPvs+6LYvWPkOW8w1nlQflv0cbZce041Sx0yqd8n6cyeBT7mZCfX5L/b+JYF90qshPWT0um7Gjly2fVVtcBDEJXAzv6IJTEqOfTaaqcIbnP7RoR8yZN6S3vGHr+EyG6B38NRQaFM46cyGdDQGHmCp4Qaqc61g2vtd2tNsB8XePcH3np+IuIKKfQU9GmHRc9pRJSkzbwXRyPf43rtZ+Kj5zKpVy8Kec5GmY91oQcSOvCeOVaoFwgkQHq9HmVdaMZgg/gaPfp7PXssKZYT2KYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2ix9lrDuwnC2mfvf9nilBBANmOfSzZuGKrKqTEQeeo=;
 b=mqM9PlA/xheJFGVP/BJjq2F3yNEru6f1RTIvIo90UZ5VEr48xv0lRSrXziY87hjlcE0NNo7nBViATakDMut5qKtzKsox/OfZlt+k7yVZOLkm+7IgOQAViqYsASmwQj3pAzUIV4Hiq9jYJD7o4n1jGPmAcl2onxF5ExX+MENsiRob28OXYM7uqfVE2q+CaGwHpmSgn1zJc+xTwhggNFeDHz4kPTJVijXK2YvFBGdbJKwIpW7qZVnT08hcSmmQgprBbmo10eCg9W5xtGxKvSFxx08yxHI0kiRF3lQ+iVODHBDkUssrbzQcRUm9QiPfX+T908OUigoqIid4ICWHJhvOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f0a88cc-f9f2-2b9b-dd0b-52321ab328c2@suse.com>
Date: Thu, 17 Mar 2022 17:07:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
 <28f869eb-c6f0-cc67-8d29-9751447d2ad3@suse.com>
 <CABfawhnsbqBOuTyB-C4sY23GY-4-AXd38TXqVMemVt_duwSZiQ@mail.gmail.com>
 <3dc898e4-b00b-2e85-eda9-a28da6737ab5@suse.com>
 <CABfawh=FgBcLYgFr+4R7795bqKfeYyr5MF09__zDEpfk6hcmHg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawh=FgBcLYgFr+4R7795bqKfeYyr5MF09__zDEpfk6hcmHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0050.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b86fd40-95fc-4c20-2ad3-08da08304118
X-MS-TrafficTypeDiagnostic: AM5PR04MB2945:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB2945A634B6BF77E05873813CB3129@AM5PR04MB2945.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vYlPJDSXNhafZDs4m1Un4a/4/1HtVP0x2jIDqCLhq99S67FEGSKgzxPMPxrjML02Q9M55owiOZKL5n95ISso3+6UZNB+UTsPQaj7s74njlRj/TiW274hKLTrc5PoqgWzvYvoj/3ZiOJqc0xer25XWXKzXNu0hcPJIzvXDnisKRNMOMWOecJE56XPwLZJDqLy2CJ13NuFzmGaEcKodrBGqPxGEt0eI2wKtF3eZgB/VffYHuz3sIoNd3RLfoJMTU3AuIOqt2MBM5/E2Our7TJ4JI/xAToMEfFSo+BDVzD7/eJg8nmLD5uwUNRSjZHJ7tGna5gru3a1INcuH0/tEm/srl4NiJ3+71vQQv47ILHCmStofvkZ+AXD11VmLHdSlQJb9i7aYJe8gY/b8fvgrQKFDQ4IBfC2x/WL4A41gBRnivnMSWs6Du7VGaIKM6V/msLNCB1uA/bSFSiuzaVqGv8T30RtqcaTzTy664aPldrpZd46JhJg3w7RcWbf5N3WY2/ZR9x0ynjz5mxSPwmt01/1VMRmqNKkBB6KVldHxFtcxe5HgP6QXY1fHP5TM/CPXmjJm59fq4mflXwRut6U/kwjrda5ENdbmTKMqASt9G7MVo//Rv8JQYDbwC1DasaigcfE8fV8Ozl00yb5wDXoKNd/tPjNU98cGxQqiBzZxMAEM6BIhs7JIA4T0+TkfIPqwgPITTmAxzgghWkuC9KHAXUdxOIBpg+fMTajsyDV4bUuGSo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(26005)(316002)(2906002)(66476007)(66946007)(66556008)(8676002)(36756003)(186003)(54906003)(6916009)(31686004)(86362001)(31696002)(4326008)(83380400001)(508600001)(6666004)(6506007)(53546011)(8936002)(6486002)(6512007)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnNNRWxRR0FEUEd5Z1hqTlhpUnBEbVh2VWV1Wm8zZmdqbEowUHN1c2wrYm9O?=
 =?utf-8?B?dnY3aGlhbTNjZFZuQUxMcFZzdU5EVndhOHdtQWpIN0hEQVVJa0U3T2hkc0pz?=
 =?utf-8?B?OXJpM1V6R1hEZkdBMWhCTCtiT1dYeDFzQnh6M2FkVTdjRUdRcnhXMHo1NFFF?=
 =?utf-8?B?UXExdkJVV2w1cHBjdlRoVFpPSGZYaEJZQlhiaVBwT25sWnNvSnBMb1J3dHJr?=
 =?utf-8?B?K0JOcUF0N2xEbnl2ZTBUZEpKYThTM3l6aUtzWGxpbmJuTXpreVAweEdOVlpv?=
 =?utf-8?B?ZXcvOWF4SGxsTEd0bmxsUjgyTDJXYS9Hd0Z5WVpLakRaNThPT045RGR2b24v?=
 =?utf-8?B?Q01hL2JEMSt6RS81OHNOMnArTE5xQ3JzdEFFaURpcUFEZm9iMzBsOWpzbVND?=
 =?utf-8?B?QXh4b3BCVWhzM2hGVGZ2QmZFZWRwNElCWk5ydUlKeXdveUJVVExoWDliYzhZ?=
 =?utf-8?B?eE92dzFpL3RoVlcrNHFGTGREbm9HMllWUkRad3l6OEtRNFQ2WURGYVhjeThq?=
 =?utf-8?B?RmVDQlJNRzdnMkFOUEg3aFY3YkdVZVcvelBHYVNBY1JDbkZMdnd2R0l2RkQr?=
 =?utf-8?B?S2lnZU5QdHkrd1dNQmgwMEJOMW1JYlpZNThhT1Q3QS95eHdwUWU3d2IrbGN5?=
 =?utf-8?B?WTV4OGU5WHRtYlR6VWZhdVJqNEZuYnFvWlVyVmtBS3M5d29aVWJRT0hEVVVJ?=
 =?utf-8?B?b0QrMUhyTEdMYkw4ZExBMzBreVNqVjhvc3BuUE1ZaFBpSzQrUkltUmk4SDJC?=
 =?utf-8?B?SDFmdzdtWDduTjV1TlZvbEhYL2ZVbzBGWG5DQlppL2ZSOFRwUi9hOXpZdVhI?=
 =?utf-8?B?TnQxZ3VIQ2JCL1JWUlFQdU9MSDhPbGpmSTlsL3RwQjRXRE0vR0JDU2dmdVNn?=
 =?utf-8?B?OC9yWjFCaDZMeDN0YkFRaXU4WFZUMUd1dWdFSzZwYVdvTGgwL3A1aENlTFpN?=
 =?utf-8?B?UjlTREttK1BiZDFSTDlyMFd3V0tqOGFIVzdpMlAxNVVST2tFUE40VnM4MTYz?=
 =?utf-8?B?SzFyNUN6VmtCalBMSE9JWk9hU3loUXNMRTBXN1d4aXhIU285dmNZVkNXM0VH?=
 =?utf-8?B?dXVHT1h3YjdFL25Qbm80aU5ER1NXWlhjRWZnQ2xYbnhsWUFBTmUzNElSSFdi?=
 =?utf-8?B?cEh2aDVPMXExN1V5L0tMRE9FSyt6aWF0TWo3ZEFjNDl2aXFjWWJMekZ6b3lp?=
 =?utf-8?B?aDZPcllsVmNaWW9GV0hCTDJJSit1U1FzVWNKSUFZbmxWWUE5ak1ZZStScEpX?=
 =?utf-8?B?Q0tFQ0E2NXBLb0tER3pFQTRrVUNzQVNXZG9zY1U3RkViTGFJOXh2V1hsZHUz?=
 =?utf-8?B?bmJyK0txRGRlamlpK3JoNkJsUFlxeFdqdlNkUUFqSXlobUJlbDk2ZE1HTVZs?=
 =?utf-8?B?WFBkK3BhSiszdmkyMnhIbjJZdzZTb1BOTDRWeFFnT1BRWko5dEp2bVBRM21Z?=
 =?utf-8?B?RlRnQ3R4MVZMWCs3amNNY2l6c0MzT0xsNzJkd2VHbUhIUTZDKzVRZm1Lejlw?=
 =?utf-8?B?d3plamtJR09MeU84NW9YeDMzVzVEYUFuek1uL1dhRXZMaXRLc2FjZ1pWT0Jl?=
 =?utf-8?B?OEVaZFdKZWpiWS9PQ3ArMXJxRExsU3JmTk1tUUg3cy9IZUNjYmIvemdGbmNu?=
 =?utf-8?B?WW5TNXNRSFJjYlVZQ0MraVArMHRYTm5kdWhDQklvdVRHaUY3OEpPMDJyNzdE?=
 =?utf-8?B?MnlOWElSTkYrYUdLZGdlOUl3WFZidE9KRlRldTJJTzNhQlRLUkszc21Gb0tG?=
 =?utf-8?B?eU51RUFPY0ZBVUM2aEk0bm52dTVMbXlNTVVzNlBja3VyUXNRdHhUSTNIK2FT?=
 =?utf-8?B?Z0g4aFhDaGxCMzVpQnVwdzl3T05qWjFMTjFaOUVDdnoyZ2xuKzAzTUhOU3Vl?=
 =?utf-8?B?a1pIUi9la1pSQm4yWms0WW9OMWl5bmtlbDBuQy9VOTR0QW5QNnhHNHV0S1hp?=
 =?utf-8?Q?75yIuDsDwATuukJ2z4ALJeuxYmImjxDI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b86fd40-95fc-4c20-2ad3-08da08304118
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:07:37.1307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpI5Z1OOkAWL4Rkzn64/mvz86Baft00+DslgnkfH3bcTxT42kNbsgGsoX+LDQzQRYmMO/vRDTUsii0pvRhLCZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2945

On 17.03.2022 16:59, Tamas K Lengyel wrote:
> On Thu, Mar 17, 2022 at 11:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 17.03.2022 15:43, Tamas K Lengyel wrote:
>>> On Thu, Mar 17, 2022 at 9:56 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 10.03.2022 19:44, Tamas K Lengyel wrote:
>>>>> @@ -1155,6 +1154,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>>>>>      v->arch.dr6   = ctxt.dr6;
>>>>>      v->arch.dr7   = ctxt.dr7;
>>>>>
>>>>> +    hvm_set_interrupt_shadow(v, ctxt.interruptibility_info);
>>>>
>>>> Setting reserved bits as well as certain combinations of bits will
>>>> cause VM entry to fail. I think it would be nice to report this as
>>>> an error here rather than waiting for the VM entry failure.
>>>
>>> Not sure if this would be the right spot to do that since that's all
>>> VMX specific and this is the common hvm code.
>>
>> Well, it would be the VMX hook to do the checking, with an error
>> propagated back here.
> 
> I'm actually against it because the overhead of that error-checking
> during vm forking would be significant with really no benefit. We are
> copying the state from the parent where it was running fine before, so
> doing that sanity checking thousands of times per second when we
> already know its fine is bad.

I can see your point, but my concern is not forking but normal migration
or restoring of guests, where the incoming data is of effectively
unknown origin.

Jan


