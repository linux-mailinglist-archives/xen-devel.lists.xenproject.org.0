Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB641AA0B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197720.350931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7pp-00083z-OI; Tue, 28 Sep 2021 07:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197720.350931; Tue, 28 Sep 2021 07:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7pp-00081d-JL; Tue, 28 Sep 2021 07:47:29 +0000
Received: by outflank-mailman (input) for mailman id 197720;
 Tue, 28 Sep 2021 07:47:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mV7pn-00081X-TA
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:47:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52a2f6f8-2030-11ec-bc71-12813bfff9fa;
 Tue, 28 Sep 2021 07:47:26 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-kJ1uxjtzOjWfG3LP9cstbw-1; Tue, 28 Sep 2021 09:47:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 07:47:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 07:47:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Tue, 28 Sep 2021 07:47:22 +0000
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
X-Inumbo-ID: 52a2f6f8-2030-11ec-bc71-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632815245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxtsIan1PrQvtx+gwpLNKBF0Z/WvVABN8IPG8rsHM0s=;
	b=e9RnNWUc53EWKgoYFPB6sv96ATzdeqzoqDp0TR++X9N9M/qCu6/isO4h9AAhaXsRzYCrZi
	7EUMvdgiCED5DRZFkRNCpnb3bw6WW3gCQfb6nMcXgSOck/rDMlya1LpP+3zd6Em751VSLI
	Et8j5D3s0UdQM+zvzn/z/tC9DEFs8lw=
X-MC-Unique: kJ1uxjtzOjWfG3LP9cstbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rx7RTimmKan4Xvj3IKNCHnIYPiRGMMHBF6nXBzHPRORCbf8/hq9LURACLkIfeAtX1wSK1CumzCAleXSHDsKyOENW3mbvbGkYjsuv+B6DhRf9ooMEsyrkmYc4KkMXgvOY5mMax+FEz0Bsr4H6/YWG+rr54RWaJAj9Agw4GrUxSPlj01M8OOvdJcZtg2nYdGIj4uJEPSxr94QEEdk8cKd/sQgBXP/c0DqO0AcP2tUMfQOoASJdOW2OvbUE9psWK+xfJB0+i4wZVIJSN5k4RjDt85CLrW6XbWaIYC77/kaqBctzFpP35OFIHni2U8xNy8rX/wSzgtvxO6nZgTpQvOAg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LxtsIan1PrQvtx+gwpLNKBF0Z/WvVABN8IPG8rsHM0s=;
 b=ZnaEN9F+ixnXvrWDnoDY9zH8d8g4RI7TXOwEjMK2lf+LG3AjxQM07qkhVnMO1fBC/8QcGptXEIpJKWhMDxsm88OWyXl+BRsBYUJiCj9xA9Mww/6RoyacBGFBuNFrfeuc1ODq2thy/N9gTmpVT98F96wKKrdx6fsK+aRDJTIc1yqPETZByaeeZr+FqO8U+919Ri4WivKSK9rq+gyiWT3kiDRG505Y0+wWpCvsJmxaynv5ihkojt0USphBdDKk1XoiGjLhIGmancRyeSgqBUblcu9Ch0seK9ILSipVDiyOKp5FfzqLe0dWJ++IZxCAlhlfRZbojOcyfm0JQu0QQqTJGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v8 4/6] AMD/IOMMU: respect AtsDisabled device flag
To: paul@xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
 <14d1c1e1-d2d0-d041-e206-608e876d43a0@suse.com>
 <d300aaf7-dbe9-1bf8-6abc-1693bb13ec56@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a46e77e8-7686-875e-dad1-e0713b9fd46c@suse.com>
Date: Tue, 28 Sep 2021 09:47:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d300aaf7-dbe9-1bf8-6abc-1693bb13ec56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a262fcdd-4eea-46ad-1a8a-08d9825434f3
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB736047D07C721C691312C680B3A89@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VwD06BVdCpJptkir0V/qgmHPavVwTAzmyLRkfm9xtAKfA+JJqeWLH02ZkTXOT3BVjwqM1D1dDlQhevsVx2HqDqlqfXDVW9FmSzwNl/qdRXaP0mMeNrSRoGSTL//EfS8vwKc60MX6Sye/WeA72aZ3DB7qBMkHX02O5v5bq9MH3aYF8syvgPlTrVZ225asMt/STVbPnP91gnJdcw22NATg4fpEZgq/B3oG04VXhamYLBVhXlyJmGDLpV1p6Jyj2/FqoN+VlwRrtEyt9FrejQNi48U1SonXN61FkBqUp1y2WF0U46cIcK1fg1TC8abLbWnE0v2qIS7jxfs9AO8BLEpgpMLYv+K3JU99WvjeH6tD7lls5ixLCQA0iJPI+bYRSqwzkhYwJCcR/5XxwaXbxvJh4dBrCOkZod0VsMI2ZCOBRij6ZWc7N+kt/NmT/lorJoRJMhwJO3RJe03sw7Xnqkd5xkJiBCtr+a46D02sCIRYNysTCSQJivajK9ygSMTrq7F0OKOGqVLnlJn/wdCrvh4Ihdsn6yYPZsuBkdXnJOqwxHdp1+wewFbliPqEDmwaUx7kETal2bgTVKn3M3V0wQHJr2g/RAKZ3o1q2WQ50MNJNbqstXOV1+P0qzlkqKwHS3jg2RDF0i6kR19XeGAjLiR5muMU6X2e1AgERBihzANWnTGJ1oCSCHCEnPQKbBLSB8QWcly9DMdoE4mkaSlNM3nnQ4NHF18SdyQxP56O7YJflo0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(508600001)(31696002)(38100700002)(54906003)(66476007)(26005)(86362001)(5660300002)(186003)(31686004)(2616005)(66946007)(8676002)(316002)(8936002)(16576012)(53546011)(6486002)(83380400001)(2906002)(4326008)(956004)(36756003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGRVTGwvRTlBY1I5cGJ4ZlFxck81ZDBpOUNqeUp5VHhUZERhRHU3NXFOMTI4?=
 =?utf-8?B?QWtvOTE1b21SQ0hJZ2ZkMG9tMlBSOXJOVVh1SEZCK29MUEE4WDdrN0hzU0d6?=
 =?utf-8?B?c3ovbHFJYUNObEpFODlhblo5WlBHNjJXSnFNNGpUNy9ITGd5SU80Tmh5a0Ix?=
 =?utf-8?B?d0xtM2I2RVVERHk2SWNZU0U2dE1SRmtHY2tBZ3NCQkdVamFFb1pkYVpkbWZ4?=
 =?utf-8?B?d2lMS3pPRjlhRmNxb0djV0VVeEhZNlpiR0g1Y1hYQ2JqbFRzNjVkc3RLVkpC?=
 =?utf-8?B?TVkwWjV4MnMyZUV6UU1YSmRrZ0xLSDFhOXgxU1lML3BTVWtjRE1YSkJGR1dP?=
 =?utf-8?B?Q1hiU0tjeHBMcVFRK0VibGhYdDZ4bkRmVUtyL1BHTDFMNWYxcUV6R3dBK1N6?=
 =?utf-8?B?WXhHNlMwLzFSaEIvNVVEUmQyUDBhbGZRby8vdWpjdi8reW1xUlFjRWlwVkJi?=
 =?utf-8?B?b09WRTg3ZGJRaXVPbThuOWhYMzdzR2F2SjArMWo2YlFRSXlvcmhvRWFZQTh4?=
 =?utf-8?B?YitnZXp5VVBXNHRnamFCc3R0UFJqUzlWZ0Z3RlZuSk1LS0JyMnFzbzZ4RTJt?=
 =?utf-8?B?NFpFQWdzRVdLWEtEMXhQSVlWMzBwMVdha1Q0SzlBRVZpWG1veExWc2k0YUIz?=
 =?utf-8?B?R0IrWm84eVNPSVVUVVo2M3ZraGx4UzkvOHByUlRocklCeTBvL3V0REtDVGdx?=
 =?utf-8?B?OHg2cC9haTFXL01jYXlKLzljMERmWjM3ZU5ReWlFNTdNUUZDcFZUSUJZL2V2?=
 =?utf-8?B?b0t4cWUyMUFLUGVEdTNjZnZocCtPS1BPa3pRZ1prZzZ3Z0Z0UW1OOHhaUXRk?=
 =?utf-8?B?bzJaWHhhQ0tLenpKU25WalBHMVZyU1d5L0VZWE1jc0RkdFF0ZDI2cCs1a1FS?=
 =?utf-8?B?eVNGcTNLUnAxRTJUa2QzNVkwS0FkRDZvYkZsMFBpcjVUaEprY05qc3o3L0U0?=
 =?utf-8?B?OFJmVUlGdlJGZlZsMkgzRjBBbkJZMlBhemZKWHpybEdhVE93U1J1VjVvN2FU?=
 =?utf-8?B?OGVpVkw0WnRPczg2TE81SFpEUDZ4dUNtazhybkpLOERFUDM4MlpNeW1JeVVL?=
 =?utf-8?B?UEt4UnphQnlKWnBxZ0NPTGJqRXlMSzFvRjdJYW8xRXM0VUVVeXpZOEFIZWlp?=
 =?utf-8?B?cFgvRUQwbElZVC9uaS96bnFZYi83UXFwQVFRc2JQRlVQZkFTZFVqRzRwNDE5?=
 =?utf-8?B?MkhUOWxVMnVXZytxOThVUjA1UjR6YnlOTE9VcmcxbkJEV3lENGlpK3ZBNFBG?=
 =?utf-8?B?WlNTQWpYMUJBeHp5Vy9KVkhGKzI5cisvT1kzZjQ4YnNoR09UR2JadTRySThE?=
 =?utf-8?B?RzU2QWVtb2NNYmtHdjM3emNLbG9sZXlXOC9kaGxLWGtlODNQQkhPMk5WWmxT?=
 =?utf-8?B?QkRpdnFYMGRLZUw0S3VnVFp6ZFVDYmF0SkRmZlg4ZnQvRjdMdjhrYjNsMU5R?=
 =?utf-8?B?SVQxaCtKNnlHRnZxTnZtblA0VytxNXcrekFML0VFUzFxTEFwNEdCaC9LUXV3?=
 =?utf-8?B?aHREVlNqTEMvZU53Yk41R0ZTcFZGYnE3WkUyNXNGbnRsZ1RhRFlzV2JGOE9Z?=
 =?utf-8?B?TlJ1cDNaeUZEbktHdGxVN0gyOWx5djdZV0lETE5CZ3MvT253YmRWbzN2Y3o1?=
 =?utf-8?B?bE1kVWl3UjB3V3N6QjFTRmgva0EvVWtUL2dSSDRWekFoWlArbEJuVXVxSjRq?=
 =?utf-8?B?L09DdjRWb2FLVlNYKzBKNDBEUTZoemE3OFh1bk1UT1V1K0o3eXErdlJVenNN?=
 =?utf-8?Q?qkzZwCFS5nr2FAkR5k1Doq4RgZ6EGncO4Fgf8yB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a262fcdd-4eea-46ad-1a8a-08d9825434f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 07:47:22.7976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUDmJEh47bgtwudZwGD4ZDCsoP7QwsPWxV8BASxW1i/gJbyf3JLmupS0n3Xsx0jt1Z7CFITgM2AZuiIuXvORtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 28.09.2021 09:34, Durrant, Paul wrote:
> On 22/09/2021 15:37, Jan Beulich wrote:
>> IVHD entries may specify that ATS is to be blocked for a device or range
>> of devices. Honor firmware telling us so.
>>
>> While adding respective checks I noticed that the 2nd conditional in
>> amd_iommu_setup_domain_device() failed to check the IOMMU's capability.
>> Add the missing part of the condition there, as no good can come from
>> enabling ATS on a device when the IOMMU is not capable of dealing with
>> ATS requests.
>>
>> For actually using ACPI_IVHD_ATS_DISABLED, make its expansion no longer
>> exhibit UB.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: As an alternative to adding the missing IOMMU capability check, we
>>       may want to consider simply using dte->i in the 2nd conditional in
>>       amd_iommu_setup_domain_device().
>> Note that while ATS enabling/disabling gets invoked without any locks
>> held, the two functions should not be possible to race with one another
>> for any individual device (or else we'd be in trouble already, as ATS
>> might then get re-enabled immediately after it was disabled, with the
>> DTE out of sync with this setting).
>> ---
>> v7: New.
>>
>> --- a/xen/drivers/passthrough/amd/iommu.h
>> +++ b/xen/drivers/passthrough/amd/iommu.h
>> @@ -120,6 +120,7 @@ struct ivrs_mappings {
>>       uint16_t dte_requestor_id;
>>       bool valid:1;
>>       bool dte_allow_exclusion:1;
>> +    bool block_ats:1;
>>   
>>       /* ivhd device data settings */
>>       uint8_t device_flags;
>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>> @@ -55,8 +55,8 @@ union acpi_ivhd_device {
>>   };
>>   
>>   static void __init add_ivrs_mapping_entry(
>> -    uint16_t bdf, uint16_t alias_id, uint8_t flags, bool alloc_irt,
>> -    struct amd_iommu *iommu)
>> +    uint16_t bdf, uint16_t alias_id, uint8_t flags, unsigned int ext_flags,
>> +    bool alloc_irt, struct amd_iommu *iommu)
>>   {
>>       struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->seg);
>>   
>> @@ -66,6 +66,7 @@ static void __init add_ivrs_mapping_entr
>>       ivrs_mappings[bdf].dte_requestor_id = alias_id;
>>   
>>       /* override flags for range of devices */
>> +    ivrs_mappings[bdf].block_ats = ext_flags & ACPI_IVHD_ATS_DISABLED;
>>       ivrs_mappings[bdf].device_flags = flags;
> 
> I'm assuming the above indentation problem (which appears to be repeated 
> in a few places below) is more to do with patch email generation rather 
> than the actual code modifications so...

Hmm, I first suspected a Thunderbird regression, but checking the list
archives I don't see any corruption. I'm therefore now suspecting the
problem may be at your end ...

> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks.

Jan


