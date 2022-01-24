Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC5498159
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 14:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259875.448601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBzhX-0007Wo-7T; Mon, 24 Jan 2022 13:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259875.448601; Mon, 24 Jan 2022 13:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBzhX-0007Th-3M; Mon, 24 Jan 2022 13:48:07 +0000
Received: by outflank-mailman (input) for mailman id 259875;
 Mon, 24 Jan 2022 13:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nBzhW-0007Tb-8D
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 13:48:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40d19850-7d1c-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 14:48:04 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-Dz5-TRd0N2yZYkdavS7w-w-1; Mon, 24 Jan 2022 14:48:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4565.eurprd04.prod.outlook.com (2603:10a6:20b:25::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 13:48:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 13:48:00 +0000
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
X-Inumbo-ID: 40d19850-7d1c-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643032084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OEvldL7r+gvkyG7UlEiOP9ytDWewVxZDREslfjHbfro=;
	b=NsFLtVB20b+5/ayOW7OwSLTQMZBxfgyW93CJvys3OtEY6FJTgx8y9zdJK7ZAwB0ymCSjTC
	7TL8yuH+M0cwLTO00tkAnrqy8gjXNIxAVXZULG3PgGi1Alk4JuJQ8ViHuvV2ayRnn68Dnw
	H6WCVxr9npL7XNeXpUNOx8H9PPtYABk=
X-MC-Unique: Dz5-TRd0N2yZYkdavS7w-w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ufe/MQPOXmf4QAj/sr6WyidtOesw9hOcXUPICg4nGICrsPb+IYcuYMcJJ2omMO4P09ky02HzLcPuaLOS6t5OhPhMdAMIp2iI8bajxdpXLUmWolD41CaJldSkRO4/5SZRgJLWRNdj4eoR93rPrwfC49L5CbodJKzs5vJ6DuiOJ1fxhreeok7HD8ivdoJHBU4RTqa4VcWODxR93UXOlbqvIMrX6IptsTKHXKvUKXE+al3R1QSWZnnj5Q3sx1e00kPTGZh3BIpIlCr6yHVM88jxN2FDjEqWX4AGw/x8TOM6p84p3T3nUUlrPdQt7Iq3gdSCXCaZcDjA0H/hUqMggebtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEvldL7r+gvkyG7UlEiOP9ytDWewVxZDREslfjHbfro=;
 b=CCQcqGyp5mKvrJU6/4EHsI2WcuiJ03n7Ki3QIXxftq/lgrRUzhwU3soi9c2t0/Ghm1AoyWiN19S/4EDJl51hnTw47rbiUkSDka9hvQIK68gLCcJ9U0X9dOFX5AkWV0lmIJ9wrBNZaQ3zz1f0EMd0+jxCtHS++9qmDM/6ONgYty/CYltkb+EPBi8+MJNXgRs/JLM8pbaCRLUAqCYxyRj2KDsmt3tPdy9Hh2FH0zhB3HAN99ICm7jvGz4pSQDThgqkdypt1HSglbHXIjJ/cfPOom4mrAO14yQsIOeofAnFLXstVOeyglJzC/sWtbE63hxU9jdb7HnRgMIrJeaL+7vDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e96bf2e-a31e-da9b-2f08-adfa0928e5b9@suse.com>
Date: Mon, 24 Jan 2022 14:47:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] x86/vmsi: add support for extended destination ID in
 address field
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220120152319.7448-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0012.eurprd07.prod.outlook.com
 (2603:10a6:203:51::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 166ae1cd-8f7e-418c-5be4-08d9df4022dd
X-MS-TrafficTypeDiagnostic: AM6PR04MB4565:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4565996545F7C50C63B3ECD2B35E9@AM6PR04MB4565.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwFSqV0VqGsWdsafMoabhXlQ+B59d2TZMbYd/LEwYpNw6f1uIW4UN0qSg0s9jC/57t74dCqHF1pb7xsB1QitrnzxuaR6RQUmHAa+JRUhMEacvToEZIkm4YgOsDnJ0y1OKLu5RbjFE7E1n6TKK/VcmmF9G43E0QF8ZtIFW/wfhqbpGpOBAfgXrycw7FdbluqVPc3tQhaGAgAqYrjnUNh8s3/DDSavd4Wh8HLU2oXVzLUJ0B45FUpC8DlLEekb2HyNRK+/v2f3Kx3iC9K4zpf/fNYDd2NljMVdLIVq1F4vgL7CNBNJxkh08uOKHi0qAFm3sLxVbrAE4nC3G9Noqofw6jxG8jZTg8mvMeJFyjDUmKQ5lXhsGHF3RRm/nSOyznq9NU/8AT/1ECetNJAMv6pqXW5dMwYDIfCtQXlhb9Ph30Xrt1qNTXfA02FqsofYcNPa8SEmmqdwK91DOBorUK+mfGnNe1ihxEr11FqP/+AQeDX/zlgmmpE2A4Zs44eOh0XL4eyDUf6AWIagat0HB+x5NWantdKORKhG3tYeYW0acA0KIph1azk4BYCMd+MSffzYBqVgIA7XCRglDeZccR9m6T+xtVVDbQy4SZjNpikW0QqAMZxiyRNzYxfTGmX/NWIJzqJd3AJ+7V2RgsepUwsc4gqNY+9oFjgHRbQpRXPoRmt3wrllvrGM3UlfT7BZfeLQNbj7vfOTIrWtx/Aup69GEFWEJ7b1NWPFf/P774uG9rQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(508600001)(2616005)(54906003)(66946007)(66556008)(2906002)(66476007)(6916009)(4326008)(316002)(6506007)(36756003)(26005)(31686004)(38100700002)(8676002)(5660300002)(186003)(6486002)(83380400001)(86362001)(53546011)(8936002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXdIcEhiZnNWVWllS0g4dU1pZUdOLzR4VzVQM0ZlMi9mRXZBYUgvQWhqRmox?=
 =?utf-8?B?alRCLzhpSVFuZGFsNC82dFhOWDVwejF3ejRoQVN3Y09VSlQzVTZCcFFPUW1K?=
 =?utf-8?B?cWRSRFlnQlVHUzV4aUJDaDBuUHV2RTNPZlNzdGtpY0hqNHBlbSs1MEhtNmlD?=
 =?utf-8?B?U3c3NlF2dndaVDYyd3RiRGNHZ0R1ZXhGekR4eHg0MWVYejE5SHI2WUcrRzdU?=
 =?utf-8?B?SUV1VnZUYjREcjBIcStSYzdJVW14ejRvS09PODN4dGZuL2x3cEpOZWEzL1JD?=
 =?utf-8?B?QVpodHhuSmVmelF5azltemlrbTlGNUtZbHFFdnorYTRWVm40eHlBekdUUHVR?=
 =?utf-8?B?MGRWanhpOWVsRUpRa3F4ZmdET0xhbWc1ZUxVVXJiY2xVMGVsbXlqOWhaSko5?=
 =?utf-8?B?WFR3cHdvaisrcDNHZWw4Z0ptWDYxdjl0UU55TU5vRFRFTGtXdHp1endkTity?=
 =?utf-8?B?dy81bkdvWlRHOGlNRUp3K05BMDRkTEdGeTIxZy9TSFFZeFNkMENTZU1Ccm5W?=
 =?utf-8?B?U2p1Nk9KK1NCMG5LRzI2QkU2V1RsM0FZWWd5Q1hNaFVCTEh5WnVwRUo4MzB2?=
 =?utf-8?B?eThsNkJYSWQ2MnBxdEZTc2lHYjc1b3k0cFhlS3hXRGMzekFONWhQdTdPRU5o?=
 =?utf-8?B?V0tDV2haWnd1VWQwK0pTWHkvcnA1Zkd3K0VFbDZQdk5XbW5ZVldpQjNpc3Ar?=
 =?utf-8?B?R2NwUG1KLzBNV2JQako3ZzcwVzVNUXdkY2tSUmFPd1RiRGhUTWdtWVRVZ3pq?=
 =?utf-8?B?ZWlSbzF2Zmo2NXdYOEdVZlpiSG9pSEwzUEJzdzBrQXFFUm5NR1ZaNkRSdEp0?=
 =?utf-8?B?cnkrMERHdjRoNS9ZR1BoejNVQitZTUNvVSt6Vm9LOFowc05BWndueDQwR2cw?=
 =?utf-8?B?SWdndnFvMTd6Vjlhd2FMQU5yQUFjVG4xVE1HdmxOWHhzOHNnY2Z5UngyZUFx?=
 =?utf-8?B?cTRsdTQ1dXhtaEYwajNSQndpV0FRT01XclB4NHRFK1FlNTBRM1Fkc29ISTVq?=
 =?utf-8?B?OXFPS0UydGtland5K0M1OFBWaFpLV0k0T0lXNkMvUkY4bXQ3c0NtS0l0Vk1N?=
 =?utf-8?B?NE53a2w0VlM5OEZNcUZQZjI2UlhqMzMyVWxnVFFsbmZYd3BCVExUM1ExZUZj?=
 =?utf-8?B?U0plRjlSenhlaldadEc5aG9MS2xHbDlxR0x1MkxuTS8wdVRkekphSXY0aTJU?=
 =?utf-8?B?TjZOZGk4OE0rQzRJRnhkMnY3TGorNWdGT1JoL2FBRGRkdW1qdWoxNStsTGlx?=
 =?utf-8?B?bXI3Wk96M0trSCtERFdSdXIwYWFyR3lqMGIydlBhVHNuRVNsUzhaRXcrd0lu?=
 =?utf-8?B?TEgweTBPRjZyRjNBZkN0TFlpb1hLeit5Sy9uOVhrNU5WSWJMbzhnbGV1clFP?=
 =?utf-8?B?aUo2TVZxSGR2ZWR6NEtMUGk4d1c1aDNyUUhEMjhPWFlmZGpqUGlCcVJCb2kv?=
 =?utf-8?B?bXRqTnJKdStDOVROKy9GcFBuWmdEbjl5V0JXNFRVR3pxT1ltNTVmejVuckNx?=
 =?utf-8?B?Vm4rOThCVlIxWGo5eFJodzFwVmJwR3RVRjFSUGdHZEpqMCt4Ti9pbXB3ZEds?=
 =?utf-8?B?R2lsUVJQMk93L3JkUHBvQmtKcXk4eVF4RVRUcnZQQ0dlRWRocEEwUld4Und0?=
 =?utf-8?B?aU5vWWZWOVZSN1ZENG1YUTlGd1M4RHBiRlRhTE1IcnBhM2FCZzJxbHZZU1NE?=
 =?utf-8?B?T3JoQ0g0QTh4bWErWGlPY0NXenNjVWRkNkdtdWJIYm1hNDJwcnQxM0p6WFJ4?=
 =?utf-8?B?Yk9HNVd3eVpvNFlNMUdRb1Nxcm1oWFJJT2lvemc1VWhoaGRyWC9mOGlsc1JY?=
 =?utf-8?B?UDNaQjI5VjAyYWtDb01sUTF5bEgwUzJCWE10OEJiS0ZnSkNTV2psNS95c3VK?=
 =?utf-8?B?cmJDd0luazFHQldKWjh0VTl0R1pBcUJjTGIzZEhWV1VHbWxWdkx4Y2ZUdS81?=
 =?utf-8?B?eWdOS0hmdnR3ck9lUWxXaEpaTzQvVjV0TXozV1Z3M1YxelVyajVwaVdWYldl?=
 =?utf-8?B?ckJCTlpkOStra0p0SHJoZktuZ1BvVVdaMkREeFEweWtUODB0WUg4ZXJHejZ0?=
 =?utf-8?B?WTFhcUExMURET2llcEZFanZxWnR3bGl5bGV0MWtaVFFZc3Y3cEhEb3BnY3Nw?=
 =?utf-8?B?VXoxcDZkOEk0ZW1pY0R2aG1zeWtGRHlwVDJGdmJ1VlZuRksyV255NWFUVE5D?=
 =?utf-8?Q?2qYoeRsQCYdQjt1TzdCQbk8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166ae1cd-8f7e-418c-5be4-08d9df4022dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 13:48:00.6998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR5XvnNNWhy3LylQAPoMKxmqGi1HWafBQ4FOjJaYVxRwioPoPyrlLRi7IwIi8N+GZZxkOE3cK2vggD+B/cWRMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4565

On 20.01.2022 16:23, Roger Pau Monne wrote:
> Both QEMU/KVM and HyperV support using bits 11:5 from the MSI address
> field in order to store the high part of the target APIC ID. This
> allows expanding the maximum APID ID usable without interrupt
> remapping support from 255 to 32768.
> 
> Note the interface used by QEMU for emulated devices (via the
> XEN_DMOP_inject_msi hypercall) already passes both the address and
> data fields into Xen for processing, so there's no need for any change
> to QEMU there.
> 
> However for PCI passthrough devices QEMU uses the
> XEN_DOMCTL_bind_pt_irq hypercall which does need an addition to the
> gflags field in order to pass the high bits of the APIC destination
> ID.
> 
> Introduce a new CPUID flag to signal the support for the feature. The
> introduced flag covers both the support for extended ID for the
> IO-APIC RTE and the MSI address registers. Such flag is currently only
> exposed when the domain is using vPCI (ie: a PVH dom0).

Because of also covering the IO-APIC side, I think the CPUID aspect of
this really wants splitting into a 3rd patch. That way the MSI and
IO-APIC parts could in principle go in independently, and only the
CPUID one needs to remain at the tail.

> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -66,7 +66,7 @@ static void vmsi_inj_irq(
>  
>  int vmsi_deliver(
>      struct domain *d, int vector,
> -    uint8_t dest, uint8_t dest_mode,
> +    unsigned int dest, unsigned int dest_mode,

If you change the type of dest_mode, then to "bool" please - see its
only call site.

> @@ -123,7 +125,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
>  }
>  
>  /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
> -int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode)
> +int hvm_girq_dest_2_vcpu_id(struct domain *d, unsigned int dest,
> +                            unsigned int dest_mode)

Same here then.

> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -54,6 +54,7 @@
>  #define MSI_ADDR_DEST_ID_SHIFT		12
>  #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
>  #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
> +#define	 MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0

Especially the immediately preceding macro now becomes kind of stale.

> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -269,7 +269,7 @@ int pt_irq_create_bind(
>      {
>      case PT_IRQ_TYPE_MSI:
>      {
> -        uint8_t dest, delivery_mode;
> +        unsigned int dest, delivery_mode;
>          bool dest_mode;

If you touch delivery_mode's type, wouldn't that better become bool?

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -588,6 +588,7 @@ struct xen_domctl_bind_pt_irq {
>  #define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
>  #define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
>  #define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
> +#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK 0xfe0000

I'm not convinced it is a good idea to limit the overall destination
ID width to 15 bits here - at the interface level we could as well
permit more bits right away; the implementation would reject too high
a value, of course. Not only with this I further wonder whether the
field shouldn't be unsplit while extending it. You won't get away
without bumping XEN_DOMCTL_INTERFACE_VERSION anyway (unless it was
bumped already for 4.17) since afaics the unused bits of this field
previously weren't checked for being zero. We could easily have 8
bits vector, 16 bits flags, and 32 bits destination ID in the struct.
And there would then still be 8 unused bits (which from now on we
ought to check for being zero).

Jan


