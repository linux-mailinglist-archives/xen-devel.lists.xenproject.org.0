Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB22A4311EB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211777.369428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNj1-000858-NI; Mon, 18 Oct 2021 08:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211777.369428; Mon, 18 Oct 2021 08:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNj1-000839-K1; Mon, 18 Oct 2021 08:10:27 +0000
Received: by outflank-mailman (input) for mailman id 211777;
 Mon, 18 Oct 2021 08:10:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcNiz-000833-Ku
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:10:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b116ad8c-41a3-42bb-a0d3-c3618eb88100;
 Mon, 18 Oct 2021 08:10:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-UEjl64wLOcS9ViY8LlvGQA-1; Mon, 18 Oct 2021 10:10:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 08:10:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:10:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:206:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 08:10:18 +0000
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
X-Inumbo-ID: b116ad8c-41a3-42bb-a0d3-c3618eb88100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634544623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SA5a6hHmZkTNFxPKlvV5iOMZgWohXyXRfJN0wSlrnY=;
	b=mFOPBosMf3ZbZGNlXUvta+sLsfgRrQ8TEByBttJAtEWChj9sw15QK6h/nK4oby9D3T7VjT
	rjpOZbHHqR+QgHKyYKdJ8bU6nS1N6WO5G1TD38YdHK96DGWHnH4slozWDQKvHP9+a8NLu+
	b8K/QTGjU4R+qzLm580BWFMRwyhRl88=
X-MC-Unique: UEjl64wLOcS9ViY8LlvGQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOLluS/85ylv4ZD8AC8SjLBpB6PDtqyEiSrXqT6GxiY6bkt3/KbVM3fkbnxucQN9xSeu0KhmdwpXYFEIRxsT53pswfUaIw9R11Tl51btib5g9gv4UgHqIBV3s1MmKtGt4mjIH1Idev61U7TvI6LohjKAlHsLcD1DZXQkfoNzuSDukwM4Z+uQqXtF6NTgE1hf2cWfLbtqywvM4Y9KcP7vLHNr++eoC5ZDcNwDHpAH5g1HHvBRzLUhNpvad9sthhoSl/boml7ymmI2/cD6FxMIRL7GayrBIfBiH+oJvHeaNJo0oxe9erEDUXzfjXtiHGk9H+/BViahR89A2e0K1ddLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SA5a6hHmZkTNFxPKlvV5iOMZgWohXyXRfJN0wSlrnY=;
 b=QUTBDYNxUtOwV5joFsSkZsillA6G8M9VDgV61N7iKBBB/U5SdY+GtkaNyOvzayjMtm1HiObGKZDTHtJHqD2+aRgjv5c4YzXRhA8hKhZlsB+GQc8nDE3StB/ktaIxPrjOzBQmZCs2jq6S3HEhKSzqip9BeyfsajCMWi+NKVxMLa+dtji0ei+dqA0V9+34ObLZFbmujWl7SECsTDRfKCIjy3tKF7k4cX3H76edeH9xbT1J1VU37o6M+Zym6xE3W5k7NqKrlPyEAAREl9a++2wKtysUepObVS04reZUsx9sByJzZwSKleYOKw0S2eVmFy0GnFJDnDqg/8k96HvCCSvepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH_v2=5d_x86emul=3a_de-duplicate_scat?=
 =?UTF-8?Q?ters_to_the_same_linear_address?=
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <cf935e11-27c8-969f-9fb2-a5c0e85ccff1@suse.com>
 <26495a3f-d250-4445-ca91-0d0aae336fe7@suse.com>
Message-ID: <3b1b038d-3cba-f947-3458-297ca21a262b@suse.com>
Date: Mon, 18 Oct 2021 10:10:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <26495a3f-d250-4445-ca91-0d0aae336fe7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:206:1::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2deb69e3-9bc7-4695-ab67-08d9920eb9f8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51652292284659EDF02D445FB3BC9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	af8iNQsfBKFBZPDrJNakhlLAFvioLc1evd8qNBrVNIe986PeiDVBjuEjC9qr5czH/rDhltN2lSATS+Xx+dF39LKTYQBDRDfOlz+XAXrATJXGlGzC52fUEi0/L3U5xqUfC8TILGaGLX5pvTYCO3RRZKutywkKakqz9nhLwP6nZ1+3qdtSmoOkcXrj6ZEakZIb94w3p//0FnZNKcOrRF6JxS6UYbOUBP8i6QWTh9yXIC25kET2eJcoNT7LrDaHsNXah9mrnnwdEgpkz4fgpIsz/oz8VQAwojwYhuL1RyGHqTYDnihtY9A5oAxsp6qvrjCRbupgDlfeL0vYQOMgxhUz6y7BbJ1L+LD655SGkQfxmiovNX69akesJMfROrezi0F0ChLisgMuFqAeaYdJLmtoSEIEj0vkTPh5ZXq4pZHcRni9VeBnFwZq8Jon9EFlGi23bH8DJjyLEl5UlmBOvfdN96uUjUQh0h9YRbcyQ0Ann2huFWQAZLnKlWUq3G9XAT91sO03XVVKWctqOO5t5DPb6QcxGlJMGbKH+a6Jx+AZmoRTVid+t+whARI7vtty8uR6G7xM3oRgNJDWRuUcx+zt0xGD62fNRBXU6u3dR0nwhromTDafn0KOsVK+BDUlK7RDuheWJj5yxSYBaSGUlrWGj8GZsL2une0GzK8YZ/fgFVNLjaibEtUhiratfR5nw0I3F5VQILnjFBLNkDyYuSNKwDKe3OWqslhC68qth9eFDxk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(956004)(316002)(5660300002)(54906003)(66946007)(83380400001)(66556008)(16576012)(38100700002)(6486002)(53546011)(186003)(86362001)(110136005)(508600001)(66476007)(8936002)(2616005)(36756003)(31686004)(26005)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1Erd0JMVlJnbU9vbWhTMFdNVUNTK0lWczhLaWNuc0RlU21WK201d0tOamk4?=
 =?utf-8?B?WUswT1Q2M3lYa3gycVdoMGUwVEVzUWh3eXZibm9sbDV4Q0ljbm1waldlU09Z?=
 =?utf-8?B?dGlpN29hNVVhOTdkUzI0UFdhdGNOaHo5cE5uNk1iMjlDZHF5RzhmRmN1clFu?=
 =?utf-8?B?cVlOS29jNUp3ZWVNYW52MjN5ZVNpWTQvdjdSaWxlV1VtVnFxR0ZGamQ5clpo?=
 =?utf-8?B?RVhDdjc1R2szd1k5a1FQWG0xeUZHdlE4ZGVkSnBTaDhrZHdrUFVIU0hTSG5m?=
 =?utf-8?B?YnJSZy90c0ExM2NYeHArTWt3OE9wdUZYTVBJN2ZsRmEybnoyZEhiQ2tVa0Vp?=
 =?utf-8?B?MkhibjkyVEZwYVlnYnk1MEFEVkpWcDI3ZEtWSzNvdVNDck9ReVczNlhrc2ho?=
 =?utf-8?B?S3BCMHgxV0FDcUdtU24vanpPWjg4bDIreTZ1aFhtelAxR2wxZStnNU14V1dG?=
 =?utf-8?B?SkpSYXpYTmZjOGpReTRINmp6bXlueTR6TU9OOWRDSjY1V2ZwTmFyWDE0ajcy?=
 =?utf-8?B?YmlyWkM2dVc0UTM4OW1Xb01CT1pBYVBjdEdoS3d4NmJtN09adGExeEtTN2Zl?=
 =?utf-8?B?bm5HZ0d2RlNlQjAxZUVTL28wQk1HSzJxRXIzaDRtSzVmMFFRc0dIQi9OYXZE?=
 =?utf-8?B?Qy9mdDNnNFBGNHRwZ1NacFVtYlNnYzQ4SitLT3BMcFRsd0lRWFVXYnE1aXVh?=
 =?utf-8?B?Y3BnSC9LbWNMRkpRLy9CcVIvdDhuZzJpYnRJaFdtZ3BId2NjZ0hoMS9pYXN5?=
 =?utf-8?B?UHFMZmtxM1FmbS96TVNuK0huRG5LWW91bEdlRzVNdjdjMW4wQWtFMGxOeWFs?=
 =?utf-8?B?eFdkeU1BcmNDMFhSL3lsQkJUUmU2SnpkbnpiV2QzemZwS3Q0S09ja0YwdnM2?=
 =?utf-8?B?cXBxTFZDREFqQ01wTENubTlrU20vUW01OCt1VHRCQlpGSmRzVFI0SW9ORkpY?=
 =?utf-8?B?SDNMdVZHN2tVSzhvS0Frblp4cE1nclk1TG02VWtqMDFBQmFvcTYwcWJyZVN1?=
 =?utf-8?B?NElWM3UxSjZXejBmSUgyaXFWdnBOQStqbEpSdU9sMUNEeGtnc20ra09BMFlZ?=
 =?utf-8?B?K1QzMXkxd1BGTjY1aTNBenZCeDNmaGdnbnFtVDFmYmFxS0xXMm5NY3F2Z3RE?=
 =?utf-8?B?bUkrcjlSSzNMcHF1TStFT0dQR3o1cFpGS2l4M3J6c2laTkZkdmVGR2tUbWps?=
 =?utf-8?B?M1lKYmlzdEYrcmVwU3JTbHhYTnRNQ1g3R0dpOGlJckhreFVPeXBuVlA5ZWxy?=
 =?utf-8?B?dDJVQjB3RnJnb2ZzVkVzR2pIMk1KZk91KzRRQ01RcTRIc3Fmb1VsY3JjTnBy?=
 =?utf-8?B?UW14RTkzd2tWNFpndnFiV09INkZVbHpVWXhzcitqV3Z1TDZEUkViL3JUd2FG?=
 =?utf-8?B?cytkenA1WTlCZTI3OWdTOTZ2Tkp1NW9WdG5LT3RFTUUwZUxkTy9sL0wxMHBs?=
 =?utf-8?B?MDJTMUNESEQ3bW9TZXpxWC94aDBjUmNhWDBxOGJZNmJTUTI5VER1M0x6ZlFT?=
 =?utf-8?B?Mm9ZN2tGMmxPdCt4SVAyRnAxUUlxanVsV1hjQ21MYVdxZmkxZDd0RURyZHZB?=
 =?utf-8?B?K3o0V2VZcWVFa2NobDFLY2JOL1k3VlFDSll3b3dETzN1YTJtM1NKcjhhS2Fh?=
 =?utf-8?B?ejBDdW9iZGJJRzkweDlWWjBER0Q5T1NuSThqVThpWmMyYlJRK29nUysxaFYr?=
 =?utf-8?B?bmpHeUE2cnhHSFRabm1YUGtTTGtYYVJNTnpMQk9qYWxvQnZFV2dNcEEybHJT?=
 =?utf-8?Q?kxMjzDJ8rH6QFLzp4M3s1X/j4Stjl/nYARIuxda?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2deb69e3-9bc7-4695-ab67-08d9920eb9f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:10:19.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfvVM3XaEkvrIXovQp1JfCoFIlzvdxGhusHWqsAYjwYTcSHj90E+EzhM2xiPxySciR4MN4oeprhHFTdAo3koqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 28.06.2021 14:13, Jan Beulich wrote:
> On 20.05.2021 15:34, Jan Beulich wrote:
>> The SDM specifically allows for earlier writes to fully overlapping
>> ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
>> would crash it if varying data was written to the same address. Detect
>> overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
>> be quite a bit more difficult. To maintain proper faulting behavior,
>> instead of dropping earlier write instances of fully overlapping slots
>> altogether, write the data of the final of these slots multiple times.
>> (We also can't pull ahead the [single] write of the data of the last of
>> the slots, clearing all involved slots' op_mask bits together, as this
>> would yield incorrect results if there were intervening partially
>> overlapping ones.)
>>
>> Note that due to cache slot use being linear address based, there's no
>> similar issue with multiple writes to the same physical address (mapped
>> through different linear addresses).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> As indicated before, this is an issue which - afaict - would be a
> security issue if introspection was security supported. As such I
> find it highly irritating that this has now been pending for well
> over half a year (counting from the submission of v1).

This continues to be pending, despite having got submitted well in time
for 4.15 (Nov 2020). Are we meaning to ship another major release with
this bug unaddressed?

Jan

>> ---
>> v2: Maintain correct faulting behavior.
>>
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -10073,15 +10073,36 @@ x86_emulate(
>>  
>>          for ( i = 0; op_mask; ++i )
>>          {
>> -            long idx = b & 1 ? index.qw[i] : index.dw[i];
>> +            long idx = (b & 1 ? index.qw[i]
>> +                              : index.dw[i]) * (1 << state->sib_scale);
>> +            unsigned long offs = truncate_ea(ea.mem.off + idx);
>> +            unsigned int j, slot;
>>  
>>              if ( !(op_mask & (1 << i)) )
>>                  continue;
>>  
>> -            rc = ops->write(ea.mem.seg,
>> -                            truncate_ea(ea.mem.off +
>> -                                        idx * (1 << state->sib_scale)),
>> -                            (void *)mmvalp + i * op_bytes, op_bytes, ctxt);
>> +            /*
>> +             * hvmemul_linear_mmio_access() will find a cache slot based on
>> +             * linear address.  hvmemul_phys_mmio_access() will crash the
>> +             * domain if observing varying data getting written to the same
>> +             * cache slot.  Utilize that squashing earlier writes to fully
>> +             * overlapping addresses is permitted by the spec.  We can't,
>> +             * however, drop the writes altogether, to maintain correct
>> +             * faulting behavior.  Instead write the data from the last of
>> +             * the fully overlapping slots multiple times.
>> +             */
>> +            for ( j = (slot = i) + 1; j < n; ++j )
>> +            {
>> +                long idx2 = (b & 1 ? index.qw[j]
>> +                                   : index.dw[j]) * (1 << state->sib_scale);
>> +
>> +                if ( (op_mask & (1 << j)) &&
>> +                     truncate_ea(ea.mem.off + idx2) == offs )
>> +                    slot = j;
>> +            }
>> +
>> +            rc = ops->write(ea.mem.seg, offs,
>> +                            (void *)mmvalp + slot * op_bytes, op_bytes, ctxt);
>>              if ( rc != X86EMUL_OKAY )
>>              {
>>                  /* See comment in gather emulation. */
>>
> 
> 


