Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F14CBE18
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 13:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283342.482313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkoi-0005mX-WD; Thu, 03 Mar 2022 12:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283342.482313; Thu, 03 Mar 2022 12:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkoi-0005kZ-SC; Thu, 03 Mar 2022 12:44:24 +0000
Received: by outflank-mailman (input) for mailman id 283342;
 Thu, 03 Mar 2022 12:44:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPkoh-0005kT-4e
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 12:44:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a64459c0-9aef-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 13:44:22 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-WgUbfknAMNWpiCWTHgjzPA-1; Thu, 03 Mar 2022 13:44:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB3963.eurprd04.prod.outlook.com (2603:10a6:5:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 12:44:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 12:44:18 +0000
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
X-Inumbo-ID: a64459c0-9aef-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646311461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAkocuTVtpPDAQB+SGtsJSc/HtS0wVcXFf7Bg9SihhE=;
	b=U2mMZ3tnkB9ShxNlDBTsuf6M41Xvr+JZRJK+2BP3SBnShD2xRcK4BMvvYjRdKlq5Fm50bB
	Q6SWivfgDe+JB/3o5a7sW8GBAVY9n89A+sRuJCquYUejnB9hSCVxoulns7Wa+WAF3glWCc
	dYd+dC0/cbLwXRTkUrxVSoskfZSWKCQ=
X-MC-Unique: WgUbfknAMNWpiCWTHgjzPA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBgpjckCcRhCIU12yyJKpZ/Xtmz31CNKWkIsHS7bDe264/TcUanIskNvALVZCQnQW10Jjqini8K8bUnmu3nirGcspWsuNRoWeIIy3Vy95wXL6FRgJeYidTuklqCVEjo6kfoArZEK0FaoljJCAQRsgw70WWfTSU1Dr1VNUZ7Kyp+80PSJD9j/kJfmeDqH4euKLKPVbyu5dAw7eMYIW9wbSRUP+vcNLqvLn3MkCsfOdlg5+jdOPOMHCFOIyfPgYbLfvVGcku7Ecf6taCKC41bnpRDNAAbTg9Vw77LKeR6qJf6pgsoQ9N+cH6Jfbq6AT29OHFGSaA37sDDUEFZoXmLGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAkocuTVtpPDAQB+SGtsJSc/HtS0wVcXFf7Bg9SihhE=;
 b=bzTJdLB2aDBk6/RPZEKc6KshCAAuM0cKAVLEBuOJSxgYcd/3yAVOcx0Vnr70pMFn4XaBTmUgyxxldp67vedNvI2NV3SHlb8RASW+zjJDwCCQsdX0M+kh8vbAKPUd3/qvRS7rSB4kGwRQNqogZcp1T6/aa4+cD8lWQgqpXb09/iVT3Kww5p+2Zs8qmoYCbnoVGgAg3OlsS67EchwedbITtDefv96aE85K8wCQvG+OKWyz6XkC9gSYdlmR2LZLcMG27H3afQ2Bs1hDonrdUgmxv/qvW6DBxfWM96Br3KlG9MoO7mGp4AeTe0P/s9Q1dxRGoWMdeydHh50o9rTYTn0lzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b986f9c5-0783-7998-533c-f1d2eec4bef1@suse.com>
Date: Thu, 3 Mar 2022 13:44:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] hvm/irq: tighten check in hvm_domain_use_pirq
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220303103057.49181-1-roger.pau@citrix.com>
 <20220303103057.49181-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220303103057.49181-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0026.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db8f1197-68f2-4cba-e6eb-08d9fd138859
X-MS-TrafficTypeDiagnostic: DB7PR04MB3963:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB396358095871714A007FDE91B3049@DB7PR04MB3963.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mre7XxV7TC//QOEPH2xKQQbjmrgWf9Rae52U+5aAetZ2THPgYWj0ApCoVq25v9z4HjFU23cOJVTL4qWZ0pxJ+Hae5DXdaan70/CKxbHD+2ioUjn8D9aUdUpySwvQc2J7tif3Hl66k+xiZhDrd0DTXX5NSrx7vpYn8ACf4vz8dlkCuf/ttFvn+7vCuJb0qbKVjkAWeB4gOT3wRAj8zEf4eqX15f2l3OPXGQZdz79Xw02YYojnDq5qJzqO86kVsqiUtoOEAfbyHblbgtJvHBJa+cDiWYiAGEK35zI8hQWYg1Pk32ctvYwr9F3ayZnw2N6rrsaSWQ+xpXKpq59mzE+139uwcXw+mhv/lz3YMz7JaooKCzqUaJoMOdu7HzNplXpn7G8Yk6O1gT/fKQSwgzpQj8Cdxjk155Iv0SB7hUkQBHzJfkakmfxOMq3FUj2kVsduq52hgM9bWL8xQhLq6cH1vrTopq4U1J23RFh0uOEf0r2jTI6KDgasSKwX59o6vJSlmzgs2OKTzHVRoDdgJhQNr1g5VA8jKHE3QWxPz0Imyd6DC375FCgPSQMLYca51iNEThdCx3UXRkp/PmNiy6EHYM5Ifn15Cp2Qm15XKr5PPPdP7Tvd6JjGBwPlF8OcbU7zYQ7PrNS5b7Fvww62Hv3U46VK99qJ0qaa3XWWFjtnztAeQGriQuQixoz6VAHi5Lnivyu3rCqHsKsBZtuxkVIqKXscSwoiP5v3uQ5MYgGYJYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(54906003)(316002)(6916009)(8936002)(86362001)(2906002)(4744005)(31696002)(5660300002)(38100700002)(66476007)(66556008)(8676002)(4326008)(6506007)(53546011)(2616005)(6512007)(31686004)(186003)(26005)(83380400001)(36756003)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXl0akJsdGFFRm44MGVxT2dkeHgwQnpaSDlFbDd3aXpPNTRyTTM2MGNsdUx4?=
 =?utf-8?B?WUx3d2VORTRVOTdkY3ZpMDdNY0dQSjMvY0xhTHFWczUwbXNtbFlCWGxmTkhE?=
 =?utf-8?B?Q0ZBZmdWMkcwVUhpbWdMUFhFTWtacGtrTldIdURkand5a2ZpbTYyR0ZIRmpR?=
 =?utf-8?B?RGIxZHQ5Tmd2anFUQ3Y4NTdwVFQ5WEJXWXpTcysvZXJoWXlka3MxMEYyanpR?=
 =?utf-8?B?L0ordC94OGt5bmV0VXY4SU15MVhjZ05hblpTM3NLV3FRdXpmMllLeDVIUXdj?=
 =?utf-8?B?N2tDOWVqVmRLc2xRQVlKOXBuTzBIQVdtMGF1bVRmaHNMZzlLSmM2SElTVWds?=
 =?utf-8?B?UzFUYVIwaDdqSWxTSWhYblVndTBoRzE4TWJzR2lRYkg1M3o5RnJIcTdiblAy?=
 =?utf-8?B?TFlXWVN2U0VPRHloVHRLbUJMR2Y4enhOL0RVMUhlU2d0Q2xmNlpJcnRCcnpK?=
 =?utf-8?B?RGd4MThyb1VqdFdVS3RWYkZBcVQ2R2I0aWQ1bHRRa2xWaGtFekp6aXNMdSs4?=
 =?utf-8?B?ZDFnSnV0cU5pUTcyeHBUaWFLdXdxVlVxQ1ZmSnBIUDAvNnFrNGZLT20yNFZl?=
 =?utf-8?B?WmRIWTlUK2RuMXpSdFZ4eHd6SkFQZG01Nkc2ZGs1cXVjT2RPUzRLWStRNHor?=
 =?utf-8?B?OTBic2ZzbHZMY1FLVEZ4SEdhM1EzTEVra3hWOUFSRjI3SWt0dUFjVG9uUG1C?=
 =?utf-8?B?SFZPdkJUeTZlZlEyVzkxOWhNNmdKY2F2aEFTMlVoTnRQZ2J1VlVaZ1BZTlph?=
 =?utf-8?B?TlpiTVhpN1hrdzFqVjFyRFNVM0FGT3lsLzM4QzVrUElmQjluT1BDVmxxWU9T?=
 =?utf-8?B?VjZmMTJRekh3YllWUGpkVU1vdi82TVBsZkJxU2hqVkJlbTkyZjduZlFhWUZB?=
 =?utf-8?B?eDBBUUQ0RWh3R01xUW8yOVF5RWE4NlpyaDgzTlBYOVFtYWdodmY3RndTZHpZ?=
 =?utf-8?B?M0huOGxNbjFxaUtLQ1lCRmdocFp6Qm10TTBselN2VUhIRkZDeCtyYSszbHp0?=
 =?utf-8?B?VDAzbTZzSnpkRlV4NWpzYkJnVXkySkRFQmtQelV4djZHaVdpZlVzL3Q2TUhy?=
 =?utf-8?B?ZUJldE9qZW85a0RGdEtteXdQSFRRcmozdWZoaWdFVTVGM1Vob0IxdjBWY01v?=
 =?utf-8?B?UFl2UmNHNUdkTGs5S2Nmd0Fxa0RsdllWMWtJejN5c0pMS1dzZDk0eVptL3V0?=
 =?utf-8?B?NXhSSi93b0xjWUNKcmJMa1FnRFJ3dk56WU0wUGYxS2p0OTVZb2lIbW44K2dz?=
 =?utf-8?B?MGxwWTZxQ3NKODhEdmRiYUdydE93azVYc3liR29qNzNXbExNZHg0MDdYWTZr?=
 =?utf-8?B?NHRTeVJDYUtiVFlzay9qbHRVaTF5S0ErYW9uSk5KNFRkcFFqbHE5NURIdFNO?=
 =?utf-8?B?M1FHUEhwaVZWb3N3N0M2RnBnRG9BdWFid3FNbUhDcDkzR1pQV0k5d1RqR1BH?=
 =?utf-8?B?eEdUWGFUR1ZNWlpoOFBNYks5S0lsVGkyengxcXB3eEYrTHBXTjNSckpyTU96?=
 =?utf-8?B?cklERGQxVXIxTllFZHBNeUJnU295WHpjMVEzd0ZOTEg5SmVtRHBoUTU5dDlN?=
 =?utf-8?B?NkFqbXhWRXdXQ1ZtaFRVMkVpdUlweHJlSnZUT1Z4V3ZreTRKZmRlVVAvM3lu?=
 =?utf-8?B?OHBoZTJFcUs0MDRudDZHTURERERDODBiNW5HYUZtbVlTcGVQZ29QNzZEWnJT?=
 =?utf-8?B?QTVhK3lZOUVhdFVIZ3d3SFRTTHJsdkd3alo3YVdLOTU3SWdmZ2I4bnF3WHFU?=
 =?utf-8?B?S0JxcWFXTTdTaUZTYnFBMDhRVWhZendTaVFtTEFRNjgwc3M4YUJ4RnI0am5C?=
 =?utf-8?B?aUVpZVBiMXZBZm8rRGxVWHBvZFZ0dXo1V29VTzlPdmtHdHE0c0x3ZzVNaU9y?=
 =?utf-8?B?a3BJTm5iYzJscUhuWXBFQktRNHUwN21yMHJ4dk9UTEwrNmVwbEJpS1dCVGJa?=
 =?utf-8?B?Q1NRVTh5dDJIbk96cjMvOHBOTVRFemVhYVA3U3RMWVlLZHQvSGkrTzlMWm9t?=
 =?utf-8?B?aXZ6MUJ3TGgrUU04c3RtVkR2K093UE5vTHhvUW9UMEV0c0VqeU9CQmJkOFFv?=
 =?utf-8?B?anpCeDhRc1VucWt1cWlYSS9vZ0ZybTcyRGdzNmZPNjB3TStiN1hkeHZabnZ4?=
 =?utf-8?B?VlIvYVpXZGR6VU81WVdtRVN3VHRYSVhiVGlManUxSjBVd3hQZ2pvaUxEeCtJ?=
 =?utf-8?Q?Xc0Dj+dAFQrf2B6w0gT+kRc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8f1197-68f2-4cba-e6eb-08d9fd138859
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 12:44:18.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpOfC0q6mBPe9ISBDhnTY4pSRhohKuij0fVBKPpuv0RHhTD0yXNNQkfoa/4SluAwZEdBZPL8ujcU11a7GvTKKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB3963

On 03.03.2022 11:30, Roger Pau Monne wrote:
> hvm_domain_use_pirq checking whether the passed domain is an HVM
> guests is pointless, as all calls originate from HVM only paths.
> Instead check whether the domain has PIRQ support in order to avoid
> further checks.

I agree with this, but I wonder ...

> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -30,7 +30,7 @@
>  
>  bool hvm_domain_use_pirq(const struct domain *d, const struct pirq *pirq)
>  {
> -    return is_hvm_domain(d) && pirq && pirq->arch.hvm.emuirq != IRQ_UNBOUND;
> +    return has_pirq(d) && pirq && pirq->arch.hvm.emuirq != IRQ_UNBOUND;

... whether there can be a non-NULL pirq in the first place for a
!has_pirq() domain. Judging from e.g. hvm_inject_msi() it looks like
this might be possible, but perhaps wrongly so?

Jan


