Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7CD631B87
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 09:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446439.702015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox2G1-0003eA-AO; Mon, 21 Nov 2022 08:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446439.702015; Mon, 21 Nov 2022 08:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox2G1-0003at-7F; Mon, 21 Nov 2022 08:34:25 +0000
Received: by outflank-mailman (input) for mailman id 446439;
 Mon, 21 Nov 2022 08:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox2Fz-0003an-80
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 08:34:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130059.outbound.protection.outlook.com [40.107.13.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bf3532f-6977-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 09:34:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8273.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 08:33:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 08:33:52 +0000
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
X-Inumbo-ID: 4bf3532f-6977-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjG7QIyISG1RuCEKsXUOBY6f9EBN8MGUPEFO0eENjMDoTgkZoZIztv1b5N+KwJdGjbkguw6zYs4bemVvkyqjGrgB+ncgncVJV/oQAMEFK+fiftl21DVWW41bTxVGIJg3KRQh9FzbJeCq+SXsqRa3QOihzJupx35XSjIlv3EC+I3HUVgCRV4V4ZovjYTpzVx1aAAXswAam2xx1n7NezuNXJ/Jikab2WFQ+2wV/5HmUyBq3apMo9ZX/oenqtP/KdIQZfwZ+L2fFAFoHx+i2/SW/l3uuurZ+QmbBxOg+dAaqT+RtOrNQdBgisPuAlk7PWP2G4B9ZUyaJOQctSSe7ZWNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/ZsOhRYGx9QcVg/XJaeGGZ4mApFDuRwmnp8U76S0wg=;
 b=BFoKZnwb17+ILd6NE5WbmUAC+FXziIU2IS5P9Vd+PBkEuQg2t/cn+fOCxxWrOcsaaB6+ymRSqF3BnQCiWFkHMO2Z10fkx4/e4FelmjBBnR6Z/b8e7I1SH1i1jYuCoH8lAKDkI1694qlDinLtM5VFEXXpXezDaXee4ZyeEruc0uwztocI50VtBM77Eq5HBV4r8eu7a+7ujs+k6Fb0wyewKAJADoC5XLqB+fvJ6CuzShp+e4p22R/Wy4n4kw7griF5dfEDtWBAuLTudEMNHtrIdY79voDz5VDnf2g0Pq+8XXbLgFA2IJaOpbqaRAi6MBthkzW2KQ0KpOh0cES4X3dPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/ZsOhRYGx9QcVg/XJaeGGZ4mApFDuRwmnp8U76S0wg=;
 b=zyIEVuTXpnWCT00qzXB8y8aYFkO5NGnb4Ejpt0gwx/+ra7slR2G8rXok+NwTTFiPhCfJqCWAqXF9PF27c3DfmMaC6QSe6wJ3pJQF/KK7sAdZSp8ZP0rwT1ZpKWttrvw72Qj3N+V5rhTw9Vf/V7UHTiHNzxfFgDOwp3qUXz6CikGzRBWHioVyLC1OjouXBwuiArHp8+23jki3620srjZulftnoA+Gv7DEJtiiXbDLf24vwAlsXtLhRGlDv/KHWlBLjCX+Yy+Cx0k8c1CIiZao53qnzoEYSPToPFSmutc8cxuyjmn2U5a3AkHkO51+FWOJxxdQOOIP6VsDA29y7dF5Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3add150d-ab4d-9147-005e-3f3160ec9667@suse.com>
Date: Mon, 21 Nov 2022 09:33:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <Y3eWISfCCW/ktjB+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3eWISfCCW/ktjB+@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: a5660669-5dec-451f-00c5-08dacb9b1f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WzG12CwahfLN7vnOkDp9C+j9QcctkhqK4yL3xtQNsr7BwrFFFBc8PtoJrkYXf9iMV0iXUge+FBKvMPQNHZPeEwaPF3imyFpngqPrx/Bsr9LTbi9krHX6oexRchVHQNga7YWgM1Z+RWvnGnGoFzV+uyoJsczcrA9FSEOOYtTjE90mlE8DgSGZzlUgVg5M9603HBkkoKnGw6/vmd1AaRnZMz3ZRcFbvUxU6nljC7MDeVLH9PszzvO/BTc4+s3a80xWuboDbil1teHDuYxaP5RiUB9/XF4Y9Xm5HlQx72V6I9sTFFk0RplKix3takvPMd2Ol3H8MMYVgQsQYJ1ra8kL2MmQUwk7dQLyFVNxGZyu+QzGyKSBUz3xgT2pHPt8Hsd423JGiLFJ2Q7qyg+TaaU0seVURFEX7vlV9Q72tmSLQJxLFxTKyilXhh79j4+gnbrz9FyyrOAmSO9zPlttyV3C+XSX/SY5pfWWi10tMCqrpKk3VxKZtQ+g/lCKj2S6+WuY0JgPhHpFgTNkaIkSe5vur+W5AoVAsBTE+OS5bDFMBk9AIpliFBO9xgYUbysvZ9gbxXiDPn/3P+8KbKTeIn3Qc979f8jlIWAVRdXdjvWfgmMr6UpdPip2BKnWnUFv3ySlGA6ylCODDobbjV2tBLpeKW60fB4P5GF89RJtsW76hJ4V2+wVS2pnQprQMNirux1JBrSLJZrE4fB+IQ3PHE+Q/nbbn9SeOx8oH+YTG41/agY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199015)(86362001)(31696002)(36756003)(41300700001)(2616005)(66946007)(66476007)(4326008)(8676002)(186003)(8936002)(5660300002)(6486002)(478600001)(6512007)(26005)(316002)(53546011)(54906003)(6506007)(38100700002)(6916009)(66556008)(83380400001)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzMrc2FhZUNXaG1lY2ZBRytuTWlvbjRRd1RlWmxqNlB6YTJjRTgzNk1IWG8v?=
 =?utf-8?B?V1oveUVuMW9pdWZBNXI3T2V1amNHRU4yTlNRUGlMTjlVZm0wT0RDbzFUUzVt?=
 =?utf-8?B?NmxLbHhvRVo0MGkwVHY3d2NRekJnTWc3RjNpalhLUHZFdEtzcTBqY3o5dFNn?=
 =?utf-8?B?ZFd5bmRCanJnbHJxMzNLay9nWWljNjRGbDVDYVZQdnQ2MldQV2JLY2lVV0ZM?=
 =?utf-8?B?RGNvNVVIYlVCNlY3dldjVUtHQ2hVa2x1STNtUEVRSytzbHY5bTE3WjhkVXRH?=
 =?utf-8?B?eGdnYW9SSVdVclpxcE1WMnBxWGlLZTZaTy8zUDdzUUxpeEVUY2laWlVuV25Q?=
 =?utf-8?B?UTJJL3hvMUFWQndoOVV2UHNSd1p5bGhyb21ySTJrRnVOVWdENHFJaGxnL3Mz?=
 =?utf-8?B?NXBVUFh5WHMxVE0rRG8xVjFVTklWUWphVWhZWElNYUNaQ1AzUDZMZzZ0aytN?=
 =?utf-8?B?Sks2NmFQSC9CUWJjWnlIMGNYdE04V1JsVEFFMFlyVmtCdWgrRXR6d3AvTkNl?=
 =?utf-8?B?S04yQ2Q0S0t4OFdPNXBETC9qR3FYa3VLcnhnZzRla2tNK2o1ZWZGSkNVQzQy?=
 =?utf-8?B?MlJoNEtLdVlLQ1Z0cDBOV09LT1BONlZsZlllNjFQU3JrUWJvT1FxSzNVSmUz?=
 =?utf-8?B?WjAxamh4d2tSUGZKQkQ1Nit2WFpTdkMyR3BrQ0x1VjFzaHN0YXVzK0tBcVZC?=
 =?utf-8?B?cUttVXNmdkgvYm8yOHBLUzRGQUhhWmt6UTRublcvblFEdi9EMkpJYnIvZEhR?=
 =?utf-8?B?anR1aER3bkg5cFFZZjBCN080Tkd4WTlTSENFVUxlTCs4c0Z3VmNGclZoZ0tK?=
 =?utf-8?B?STBoV0g2bFpRbi8zaEFHdUM0Q3RYQ1luRW54Q3FYQmwyNTAxTVZCOHh3NmRQ?=
 =?utf-8?B?ZHZaeEp4NGZaUUcwNS9QdGhYeXI4Nkc3dEpPUDh6SzV1cVVUdUQ1aXB5ekNk?=
 =?utf-8?B?eE5XMTlSckU2WFRuVmVnMXFRV0srUC9NYVhVSHJmQjN2S0pOaHRWYVdkUWxr?=
 =?utf-8?B?OWlzS2tTNlBXY1JLc002b0dSTFV5c051TXBPUm1acnBxTklTKzhPTGVDRHND?=
 =?utf-8?B?N0xsZzJ2TktNUVdIc1J0UytrcTdiUjNzSTlyVEh2UkZXQlhTWDNsTUFNenhi?=
 =?utf-8?B?UFZBekF3TGc4WkwzQ3llMngzcHk2b3d3M0gvSjZlL085UjBSamp2ZGRXWHBr?=
 =?utf-8?B?UmNKU0xWNS8xTFhnUlFtMm44aFdzQWUvSWVKdS91M1NaUzNjS1FuVy9OMk10?=
 =?utf-8?B?ZVJyM1FQTm5PY0g5OHRtUFgxbUhLbHB5RTFYc2plSWFiRVBaNzhhUFFOU2pE?=
 =?utf-8?B?VTZkcDh3SXM5eksyWmhua2U5VXl5a1VTOXdVVE5WR29pNEpSeDEwQ2JRL2JY?=
 =?utf-8?B?M0NiMENFUTJRdll4aHNxSjZjLzIvZ3pxbjk1UnpMalZqSS92SUNGNzlZNU5q?=
 =?utf-8?B?MDNOTW0yVTlJUHNpMElYdEJYb3liNjRreVRQVDFCcThuS0dwQkd4QTRaQnRw?=
 =?utf-8?B?TURkNGQ3TVFHK1Jmb01rRlpoZTRtTEEzVGZqQXhuY2I0bUN3cDdaZVlpYmVQ?=
 =?utf-8?B?SjJKWjZaUVc1WnRMZDkyVVVORC9uOFhFOVRpQklITUcxQnJvVk1hbEh4OStp?=
 =?utf-8?B?ZFJGQXdsZzVXYW1ZdnNLbE96ZTg4bmZPRGpkTnNvTnJlSTU2bHNtV00xTnN4?=
 =?utf-8?B?cDdYQmtpditIQzlaRXU2cGtyWVRMeWd2SlUwdTNoY1EvUUVSa3BpazFtYTBG?=
 =?utf-8?B?cDdoeFdQRkRZVStEMEJMWUhCa0E2T3E4WUhFKzB0ZmpRTXB3dGs3QjF5V0sx?=
 =?utf-8?B?K3hMVHNzMjlRVVkvZ1ZkRzB1NUtWNnQrZFFZOFhtemZWQmtXK1dob0d0TGJy?=
 =?utf-8?B?OWkxRTNMTk1GWkFJcUluNml0aDFKdnJWQWE4TE4zeUh1MXd6UHA4RHJpd01N?=
 =?utf-8?B?MHcxdDFmSWVkQ2hQQVFVaDBNWmZJL0s1THdYVXExc2FRbUtjOEtpL2FDZnJV?=
 =?utf-8?B?eHBmN3N4QVRmQ3J1RzdFYkNwMy8rMEVlM0duMms0TnF2V0JxbXBKWEtCYjk3?=
 =?utf-8?B?SjFXelRvUk1qd1NUa0k4d2xnMDN6cStveGVscWl5bFdTb2pVZjJzVkQwZGor?=
 =?utf-8?Q?hZxKUwn+IOI/MaPspu2xTDrQk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5660669-5dec-451f-00c5-08dacb9b1f09
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 08:33:52.8962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59jKmPE8h9rpq/2a/EjoG9ecgPU5UcIoVveoHI6qz2YVDR5OzuGpnTGetg1Q/rNOp85CntAHHQCWUiac8ZwtKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8273

On 18.11.2022 15:26, Roger Pau Monné wrote:
> On Fri, Nov 18, 2022 at 11:31:28AM +0100, Jan Beulich wrote:
>> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
>> exposed a problem with the marking of the respective vector as
>> pending: For quite some time Linux has been checking whether any stale
>> ISR or IRR bits would still be set while preparing the LAPIC for use.
>> This check is now triggering on the upcall vector, as the registration,
>> at least for APs, happens before the LAPIC is actually enabled.
>>
>> In software-disabled state an LAPIC would not accept any interrupt
>> requests and hence no IRR bit would newly become set while in this
>> state. As a result it is also wrong for us to mark the upcall vector as
>> having a pending request when the vLAPIC is in this state.
>>
>> To compensate for the "enabled" check added to the assertion logic, add
>> logic to (conditionally) mark the upcall vector as having a request
>> pending at the time the LAPIC is being software-enabled by the guest.
>>
>> Fixes: 7b5b8ca7dffd ("x86/upcall: inject a spurious event after setting upcall vector")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Don't one or both of the Viridian uses of vlapic_set_irq() need similar
>> guarding?
>>
>> Is it actually necessary for hvmop_set_evtchn_upcall_vector() and
>> hvm_set_callback_via() to call hvm_assert_evtchn_irq() when
>> evtchn_upcall_pending is false?
>>
>> --- a/xen/arch/x86/hvm/irq.c
>> +++ b/xen/arch/x86/hvm/irq.c
>> @@ -321,9 +321,10 @@ void hvm_assert_evtchn_irq(struct vcpu *
>>  
>>      if ( v->arch.hvm.evtchn_upcall_vector != 0 )
>>      {
>> -        uint8_t vector = v->arch.hvm.evtchn_upcall_vector;
>> +        struct vlapic *vlapic = vcpu_vlapic(v);
>>  
>> -        vlapic_set_irq(vcpu_vlapic(v), vector, 0);
>> +        if ( vlapic_enabled(vlapic) )
>> +           vlapic_set_irq(vlapic, v->arch.hvm.evtchn_upcall_vector, 0);
> 
> Shouldn't the vlapic_enabled() check itself be in vlapic_set_irq()? We
> certainly don't want any vectors set until the vlapic is enabled, be
> it event channel upcalls or any other sources.

In principle yes, and I did consider doing so, but for several callers
(potentially used frequently) this would be redundant with other
checking they do already (first and foremost callers using
vlapic_lowest_prio()). However, looking again I think vioapic_deliver()
and vmsi_deliver() violate this as well in their dest_Fixed handling.
(In both cases I'm actually inclined to also remove the odd *_inj_irq()
helper functions.)

> Maybe best to add an ASSERT in vlapic_set_irq() to be sure the lapic is
> enabled, as other callers already check this before trying to inject?

Perhaps, yes (once we've fixed paths where the check is presently
missing).

> Also, and not strictly related to your change, isn't this possibly
> racy, as by the time you evaluate the return of vlapic_enabled() it is
> already stale, as there's no lock to protect it from changing?

Wouldn't this simply match a signal arriving to a physical LAPIC just
the moment before it is enabled?

Jan

