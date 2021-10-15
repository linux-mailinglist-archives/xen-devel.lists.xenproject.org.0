Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D828642EB3B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209881.366454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbILN-0002Ab-Ou; Fri, 15 Oct 2021 08:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209881.366454; Fri, 15 Oct 2021 08:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbILN-000282-Lj; Fri, 15 Oct 2021 08:13:33 +0000
Received: by outflank-mailman (input) for mailman id 209881;
 Fri, 15 Oct 2021 08:13:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbILM-00027w-KP
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:13:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7c7e29c-2d8f-11ec-8227-12813bfff9fa;
 Fri, 15 Oct 2021 08:13:30 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-iEm7GL59P4O0A_wZhzPs7A-1; Fri, 15 Oct 2021 10:13:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 08:13:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 08:13:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0017.eurprd03.prod.outlook.com (2603:10a6:20b:130::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 08:13:25 +0000
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
X-Inumbo-ID: c7c7e29c-2d8f-11ec-8227-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634285609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G45z5wBSzGBfXED+oSoJraWC/ttXCnIGd8DrKcdFqVQ=;
	b=M3BX5+b0db+NmlyTioL4D3pqp6j87Eh6VsddAiComZyc94nzTjJfL7TvcMHQChvH5XHnoK
	FKSdb4+WHusx7jLXiYPN6LgQZUPwkYEDgK57JjCGvhf48NplfUyXTV57xe3Ca56YtzcbKj
	+Dg++GE0FKWnmDJVrWHbvLRba7OFz2k=
X-MC-Unique: iEm7GL59P4O0A_wZhzPs7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLP0TsDcpRLTAwb17doCTDD6nGHdTBqj2Vwly4TJU2FR8OtGFdWzUMa0k32k/e8fndkLdnZbLX6WdbkwC8o9bVxfY0vNJ32afT+wwjZ5vp7nGdu2z5SeYhTNvZoKkuhHmqBo3i9FO8Jj/37XTTgzB7mLo3w0YfauRs3jAg+OyMRkXwDLlAbUfTVhr8IYOY5++rUyOe3idSo1c21elPFLfBhwULdmHb8fBtCUlRFH+/y6Rwq9NFLILxFOKWvdpsLAAiHdnRSl77JYiBzlfDZFIJRFbbC0/llM+TLOIOpmdva3vwoMBTCaUQLLtpie22UeMU4o6HNdIcPAnoqg5VVO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G45z5wBSzGBfXED+oSoJraWC/ttXCnIGd8DrKcdFqVQ=;
 b=PDTT7Kej2n3Tp/rDdmsFynv7OxM4hW2t9IHiCf0TVmtn3tHUBMBRFqtmSAEkyliOBCLua9gRbtEAbNLHTZ16ZXImkzFaHp5uOAqhdC/kZxuD483bB4IeQ99KZXyBVObM0k97xnDwtR6kIFYQGoG/s9Vkbkfzp9iIk3XKOjQDZcgCKZ6oySePHrCPJobg14Yu5hynPcNejcCInzs9Mygxxhp4gMyJN/HgNs1USIRg2BQVYILxIv0XvRFCA9bpEJRnHOSkVJPjfuvlS6aOGrsRPMoTK5iHc4BaBqpyGsPolf+VuRlVBDoQRCJ21bbJCdn7RALtFQp4yBPU1/nX7wQN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <20c73f4e-5a8b-c127-f3a7-b841f50b1a4a@suse.com>
 <6C71E132-0A78-4DA4-AA52-E62833912145@arm.com>
 <8a7d1370-ee58-8e95-efea-8e4162e1e5f7@suse.com>
 <152124C4-9A34-4F5B-B6C5-CBCC6A175665@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f0f8e0b-c989-d2ae-39eb-6784446fa6c3@suse.com>
Date: Fri, 15 Oct 2021 10:13:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <152124C4-9A34-4F5B-B6C5-CBCC6A175665@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0017.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cac025c8-da4e-4982-7f4f-08d98fb3aa32
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176AE10A6A1C71F58124F86B3B99@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oKjvIJHKO944Oevx1vAHEcduNvWFL/9YLjl/xsrMxZ8pr1XGWlrS1gXm8bkNggZNhpjVgle/HwkHo/r7pZloldPonOZf4M/CE4fyUVTb+y4dAjI8Qghj0LuQUmbNyTwt6SNcDqS7nGP1yRbsuaUU9zvi7++uluLM0+yqqZQDpjwbwpNMlZDSr0LRpPOftpM+08tfatSWOfj1yw894qB9GVzdb6MyYllxkKj4azvjDu7MSHldTFzzgOhuFZz2xMisMjSfc7NOu37X0KE9ubxeZbZH15TwZP+RkMtm1P1nmxCN9U0rMop+5RQZhX18B2LKVpeV7GYmISGSMBMpveqQo6Ff5TV6bnwWA8e2is0Zqe1Oa265nHkbP6kpy9QwUAM0/9mAGdBbpsDEp7oHhDG0ckyZ1MDeueYaZDBAd+ixfEyUbDJzBPFiSXGCXeasV4uLHV/TG6Prr7/AKlYCjrqs9AXZmOmrRrifU9Jzadbr6TXTDqJSsOGC58tUThpPbOwq2+5qz2Ych9urQPkRW5ABZUmkIr5amQlgkY9vy5O28pMW+YNFiGjqpn5oxzkR7uxLaNiKWeLmrlePpARpHCcp2VLPXfkVj3FYEMHts9hjOY3vEdnB8y9tmrNcem0mebiod7dDuTuC0fRaa4Z52bxRHPpbGZWjYIz7L29JCpe4EtvS2Qo9MlLnTNsnl2l9FZyjOo2HUxmyCeSEW3IIrMoTkazqI2FvJC4m+CGMFvDE0fD4whfQAjM4+evmn7jJCfjZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(31686004)(8676002)(66556008)(66476007)(6486002)(16576012)(8936002)(4326008)(66946007)(86362001)(956004)(508600001)(2616005)(316002)(38100700002)(54906003)(110136005)(5660300002)(36756003)(186003)(2906002)(31696002)(53546011)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUI4MDBpaTBSK3J1Q1d1WWw1S2NKMGxtVm4vL01BWC9naW9FbURKUWtPbDBB?=
 =?utf-8?B?WnpGY1RmWURUV3hKK3pJSXVHQVJMM2p3bis1NHpqVWtrbXhXczI2LzJtTXdO?=
 =?utf-8?B?WnlmSWF3TzlLL1lhZFkxamJFbndKUnVxOXYxVVFkaGFRRVFaY2ZaeElKRGFv?=
 =?utf-8?B?TEFBMWFFcEMvazkwMzJ0T1l2Y3pUSHpLOGVnUTQ4cjRoc1BOd2k0Y3hsUTVL?=
 =?utf-8?B?VGtrVEtTd2VqOGNXcG04Z05nQzRRL0huMEVDYWVGTHhZYnh2d29YaWg5NFZR?=
 =?utf-8?B?MUhJNmJ6TFlXQmZpTmxEd0NXTW1iOGZRK2h4dG5LdTVDNERsOG5KK2hYeFNj?=
 =?utf-8?B?NkphclIxbEE5SkU4RnArQ0crZi9nazVERHo3VVFqOUN2NUdJYldYWHNhdkk5?=
 =?utf-8?B?eUM3OXFtaUpKNUxjV215VkNSWVk1NnlzdTQvSWpPZWhQQzNnK3NITXpzYk1B?=
 =?utf-8?B?OGZFa1VnL1Bub2txV09zeVhEOGdoUlJvR254bERrSFBxTlFLaVduN3VjVGdj?=
 =?utf-8?B?U1lJTmRVMThXMjl4NUdONk9mekdZQ1hmaGg3V3lndXI2WmFoZ2g5SThiWWRF?=
 =?utf-8?B?MERhOVdlSVNKdEFxalJEdG80TkFkWXBoU2d2RTgzbitxUUVmWjVDdmRwV3VL?=
 =?utf-8?B?ajFoM0tHZENWKzI5eldjWFN5UkNsZVBPYW5rVmlhbmVudjRsVGZnOVpBcktG?=
 =?utf-8?B?UlpIK0pvc3pUV1Foc21QVWdTY3RwNnRRdy93NTl4V2p1a2NhRUIxTnVSR1JC?=
 =?utf-8?B?eVo3RXphSmUvMDNwQVJidmEwUDhldWZ4dnZIcUpaNUpyclUrcUNDeHlDUXJT?=
 =?utf-8?B?Z255d0orZ1Y3eXFFeHBZZHF1VlFZUjR5VzBvVWcwaGgzeEdESUhVcUI1d2J1?=
 =?utf-8?B?N0wyTG9NZkpkckwvcjFhL01KclJoci9rMVdtY2hhNXcvMmJnaVBBdGlFcE5w?=
 =?utf-8?B?eXcrZno4b01NOE5janJZaTJIK214RlArNDhTc0tGQWkveG9xempxUnBRenhK?=
 =?utf-8?B?eTJ5anlhTCtneTFOM0s1YisyUjJoMzhTTDljYXFrY3RQQTNxSDd1dFA0K2Ry?=
 =?utf-8?B?aXo5RmRydy9HWUMvVndsS1pSdWFaZTBwcHhnNUp3REhuQUZvWjdZZjJHNGV5?=
 =?utf-8?B?dUk5RWxxdlBDUCtSZ1FEU1hpeUpKdWdmSGZKTUdpbFpBM0RSem5OK2FpZEFB?=
 =?utf-8?B?bk9jbWhtcXEzTW1XYjYrUkNWMEt4NEhzcmdhYUZDaXRZMHV3OVVKREx0UGxx?=
 =?utf-8?B?bVdNSXRsVEhnUDR4WUpITGNhenNvZFU1QmxDdXhRNHhzUGdnR01peEJwZzE3?=
 =?utf-8?B?M3psRFlMT05kOUNldmkyRXVtNVV0N2JVOExrN0poOGVIUkNneVRuOTUrRFdI?=
 =?utf-8?B?a2NPWGQyTHRELzd4NHUvOXl2SU5lNVVPbmN3MTFkdVpvSU9DTDdod2FFWFE1?=
 =?utf-8?B?Z1kyVDdNUWdGOGxHUUtJRWs2T1FaRGlMWk1rbU1vd2JpT2M4WmFvdEs0Q0p4?=
 =?utf-8?B?cHRoYWJVRjhWYklsM2QxVVpLY1dDaWZPa3Z5c0VETHF0NDlYeWlIa01IK1pm?=
 =?utf-8?B?bHMxRmNWL0U1aVN2ZE1aS29xZXRrTTJPNkhybXVnRTFsYjZSMkdGTFN5WHd5?=
 =?utf-8?B?LzB6a2lXL0k0MFF6N3I3aXk2dVFTdzhjNFptSUtaWFpzV01JSlpLbTVGT0hH?=
 =?utf-8?B?MXpHcGlWbkdOS3YzOWg5aHF3ZVBleTNVTkgrU0tRTTQxVW9zeTFmR3MwMFNr?=
 =?utf-8?Q?5O58HvpifL1/fU/cNZjDkuNKG/5OIpymq8Vj2fJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac025c8-da4e-4982-7f4f-08d98fb3aa32
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:13:26.8439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOn8HCF9ERpTNOzV1+bL3+kly1WgOc8WSqHcC9dacioFMzDdC9fhqc+EG1AnlFVT0dV29m0Rb8TxMZ59C+Q6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 15.10.2021 09:37, Bertrand Marquis wrote:
>> On 15 Oct 2021, at 07:29, Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.10.2021 19:09, Bertrand Marquis wrote:
>>>> On 14 Oct 2021, at 17:06, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 14.10.2021 16:49, Bertrand Marquis wrote:
>>>>> @@ -305,7 +291,7 @@ static int vpci_portio_read(const struct hvm_io_handler *handler,
>>>>>
>>>>>    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>>>>>
>>>>> -    if ( !vpci_access_allowed(reg, size) )
>>>>> +    if ( !vpci_ecam_access_allowed(reg, size) )
>>>>>        return X86EMUL_OKAY;
>>>>>
>>>>>    *data = vpci_read(sbdf, reg, size);
>>>>> @@ -335,7 +321,7 @@ static int vpci_portio_write(const struct hvm_io_handler *handler,
>>>>>
>>>>>    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>>>>>
>>>>> -    if ( !vpci_access_allowed(reg, size) )
>>>>> +    if ( !vpci_ecam_access_allowed(reg, size) )
>>>>>        return X86EMUL_OKAY;
>>>>>
>>>>>    vpci_write(sbdf, reg, size, data);
>>>>
>>>> Why would port I/O functions call an ECAM helper? And in how far is
>>>> that helper actually ECAM-specific?
>>>
>>> The function was global before.
>>
>> I'm not objecting to the function being global, but to the "ecam" in
>> its name.
> 
> Adding ecam in the name was a request from Roger.
> This is just a consequence of this.

Roger - did you have in mind the uses here when asking for the addition
of "ecam"?

> One suggestion here could be to turn vpci_ecam_access_allowed into
> vpci_access_allowed

That's what I'm asking for.

> and maybe put this into vpci.h as a static inline ?

I'm not overly fussed here.

>>>>> @@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsigned long addr,
>>>>>    reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>>>>>    read_unlock(&d->arch.hvm.mmcfg_lock);
>>>>>
>>>>> -    if ( !vpci_access_allowed(reg, len) ||
>>>>> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>>>> -        return X86EMUL_OKAY;
>>>>
>>>> While I assume this earlier behavior is the reason for ...
>>>
>>> Yes :-)
>>>
>>>>
>>>>> -    /*
>>>>> -     * According to the PCIe 3.1A specification:
>>>>> -     *  - Configuration Reads and Writes must usually be DWORD or smaller
>>>>> -     *    in size.
>>>>> -     *  - Because Root Complex implementations are not required to support
>>>>> -     *    accesses to a RCRB that cross DW boundaries [...] software
>>>>> -     *    should take care not to cause the generation of such accesses
>>>>> -     *    when accessing a RCRB unless the Root Complex will support the
>>>>> -     *    access.
>>>>> -     *  Xen however supports 8byte accesses by splitting them into two
>>>>> -     *  4byte accesses.
>>>>> -     */
>>>>> -    *data = vpci_read(sbdf, reg, min(4u, len));
>>>>> -    if ( len == 8 )
>>>>> -        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>>>> +    /* Ignore return code */
>>>>> +    vpci_ecam_mmio_read(sbdf, reg, len, data);
>>>>
>>>> ... the commented-upon ignoring of the return value, I don't think
>>>> that's a good way to deal with things anymore. Instead I think
>>>> *data should be written to ~0 upon failure, unless it is intended
>>>> for vpci_ecam_mmio_read() to take care of that case (in which case
>>>> I'm not sure I would see why it needs to return an error indicator
>>>> in the first place).
>>>
>>> I am not sure in the first place why this is actually ignored and just
>>> returning a -1 value.
>>> If an access is not right, an exception should be generated to the
>>> Guest instead.
>>
>> No. That's also not what happens on bare metal, at least not on x86.
>> Faults cannot be raised for reasons outside of the CPU; such errors
>> (if these are errors in the first place) need to be dealt with
>> differently. Signaling an error on the PCI bus would be possible,
>> but would leave open how that's actually to be dealt with. Instead
>> bad reads return all ones, while bad writes simply get dropped.
> 
> So that behaviour is kept here on x86 and I think as the function is
> generic it is right for it to return an error here. It is up to the caller to
> ignore it or not.
> To make this more generic I could return 0 on success and -EACCESS,
> the caller would then handle it as he wants.

I think boolean is sufficient here, but I wouldn't object to errno-
style return values. All I do object to is int when boolean is meant.

>>>>> +int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>>>>> +                         unsigned long data)
>>>>> +{
>>>>> +    if ( !vpci_ecam_access_allowed(reg, len) ||
>>>>> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>>>> +        return 0;
>>>>> +
>>>>> +    vpci_write(sbdf, reg, min(4u, len), data);
>>>>> +    if ( len == 8 )
>>>>> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
>>>>> +
>>>>> +    return 1;
>>>>> +}
>>>>> +
>>>>> +int vpci_ecam_mmio_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>>>>> +                        unsigned long *data)
>>>>> +{
>>>>> +    if ( !vpci_ecam_access_allowed(reg, len) ||
>>>>> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>>>> +        return 0;
>>>>> +
>>>>> +    /*
>>>>> +     * According to the PCIe 3.1A specification:
>>>>> +     *  - Configuration Reads and Writes must usually be DWORD or smaller
>>>>> +     *    in size.
>>>>> +     *  - Because Root Complex implementations are not required to support
>>>>> +     *    accesses to a RCRB that cross DW boundaries [...] software
>>>>> +     *    should take care not to cause the generation of such accesses
>>>>> +     *    when accessing a RCRB unless the Root Complex will support the
>>>>> +     *    access.
>>>>> +     *  Xen however supports 8byte accesses by splitting them into two
>>>>> +     *  4byte accesses.
>>>>> +     */
>>>>> +    *data = vpci_read(sbdf, reg, min(4u, len));
>>>>> +    if ( len == 8 )
>>>>> +        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>>>> +
>>>>> +    return 1;
>>>>> +}
>>>>
>>>> Why do these two functions return int/0/1 instead of
>>>> bool/false/true (assuming, as per above, that them returning non-
>>>> void is warranted at all)?
>>>
>>> This is what the mmio handlers should return to say that an access
>>> was ok or not so the function stick to this standard.
>>
>> Sticking to this would be okay if the functions here needed their
>> address taken, such that they can be installed as hooks for a
>> more general framework to invoke. The functions, however, only get
>> called directly. Hence there's no reason to mirror what is in need
>> of cleaning up elsewhere. I'm sure you're aware there we're in the
>> (slow going) process of improving which types get used where.
>> While the functions you refer to may not have undergone such
>> cleanup yet, we generally expect new code to conform to the new
>> model.
> 
> I am ok to rename those to vpci_ecam_{read/write}.
> Is it what you want ?

Yes, that's what I've been asking for, and I just saw Roger requesting
the same. (I'm a little puzzled about the context though, as you reply
looks disconnected here.)

Jan


