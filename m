Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D641D4B6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199490.353583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqnm-00086r-NY; Thu, 30 Sep 2021 07:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199490.353583; Thu, 30 Sep 2021 07:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqnm-00084F-KB; Thu, 30 Sep 2021 07:48:22 +0000
Received: by outflank-mailman (input) for mailman id 199490;
 Thu, 30 Sep 2021 07:48:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVqnk-00082o-N1
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:48:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e79797c-0778-495c-bb0e-042f04840ab7;
 Thu, 30 Sep 2021 07:48:19 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-xryZEqKIPumBwEgTV9hQxw-1;
 Thu, 30 Sep 2021 09:48:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 07:48:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 07:48:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0064.eurprd06.prod.outlook.com (2603:10a6:20b:464::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 07:48:14 +0000
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
X-Inumbo-ID: 1e79797c-0778-495c-bb0e-042f04840ab7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632988098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X7HAhWs+o1SPKsixdaXKwcMz49MgaVt+tkC+p8wyH7Y=;
	b=GgrVmYLd+2ujItqxv5P1rkFrDSYvw+6f5mKUbOdTOYOb2aPHWA06bH5u2XHNQTN9eW6mC6
	bCIs/gsV05jh9m5mnpLmvH827I+rPu/pfYd0Lp8T9zzqwSA4wvFtSPHRFGoD9sww6q1WAx
	Fj1nwP7yTCQhdlA+aCks+5LGOr3/MNg=
X-MC-Unique: xryZEqKIPumBwEgTV9hQxw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ohB+IxDjBSxZwH+rtV1DyBSYoSIL7r860l4RhOwawwm37JCRw+gyZsgBlApyHOm98rqIso3vUwUchHdlAuwgVBzA4Qa08jaRAOQq7HpHu99omEWv/oQ4bsFv0Pib3kyoPWkkk33ID49jnk5GjtiUggr7FYQ6uGI5Ucqii1vLgQ8o19Q1GXLG4iLCMEBiGQ20NIJUZIQwIik7UZlOSe3RUW6u8WjK+zP4F47vsBft9s9ujSiVZoTTj6gBaQGH9aruzS84lFvUI7twHikxZ+19gf0WSEHG5SPhas8b0gMet0dKRi86VobaHCqTyfrBxrWh1cjHswFOdT5thiNFJjNwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=X7HAhWs+o1SPKsixdaXKwcMz49MgaVt+tkC+p8wyH7Y=;
 b=dG9dwnOFgAkgj6voJQCY3AXnQbuBm3n5fEhDb7A0rbj/J1nK2ftjduHaP5jyVmhwkSszMK/f2O1+s2K9L+JfXpm8rxxhhwTKBPO+3AJUaAzLCmmH83qKO5KyXVqAIl3ER8VIhpyW6G6SFtcEZzkj88akTJGmqsmhh7zFsiNvlJcilE3ARu096tW1K+K7icc5YM949QEESEcE6rrwo+zhH34xGxok+Tfsx6Ye7j1uNr4WZsRzzUA4Kaov5L2RhHuMo+O9iC90MHgYotRCa/IjC3z6IAdfzA81+vAOZHpcPDCeWx7DC81va6feeBbjIlMnvB33pbvsQnGQe256J8VKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andre.Przywara@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <c40a520d289799e52234fb1865e7f3ef1fd27431.1632847120.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109281638210.5022@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3478d1b9-7043-3505-a125-700eb3761ed4@suse.com>
Date: Thu, 30 Sep 2021 09:48:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109281638210.5022@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0064.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08afe28e-23b2-4d42-0992-08d983e6a913
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54729BB76710526BC72878D8B3AA9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T4iD3lfsZdWjF1cw/ED1torz3izpTiCDmN2Txz2pxSOAuiF6fvLXcHyRwRvpRnJmMj+O87AKzzeLCV69OSY3Wsl7Y0CPLkaMzh/YwcAcs3e54Q0+wFHGC8NF94z+hBPpKEFOGE1mDoPQfqYbncA9YL8gMlcK8fm/MIpvrmS5SaHB4gLXL9gpKRl6QIBxDozItgO4yaG5tMT2j1r/fxZyMzEKAEd4JTbAAELttgTtvkznAoUN9o21BQTHYIhP1ycFVdlcKWZvwcOP2ZrNQ3u/z91UjXCt5zw2gqG0C7Eov25n5q/kxdD27DGVArutv02EuRRv1UZfQCrqQ8wIPuE3/gwuo+es8KO57fPLKyM2vhxXGE+7OSTEeO0GK+PAKkCSD2p3Y6+/KFQG+Gq9JA9BYUkbkXnHcTIP/oPB/X0ISbl3EPwcQKQnf3vTGb8fsbkv5AFiGEuYSetDHMsLPUjtaq2q0VgkQpyXshenptVHRbd8gkttbyEHYH0nZZ7h2CahvkeP7fynnn8dYWMQtEmZTzORf4CHvZqvw6X+VpoEbXlIOxUNolvvTW4XRcdVJY7taypNqw8mN0v9eao+i+CkgfPLuqni5ubdBdSiR5C3uQ1WMr9/8t98HHQqusYxnM9R7JJV5QKePCbeFXSnJPomEB91hBjfgJmrY8fXBMxHSPmEmbZN7NQSkWREvII4nwzcoGtiJbPoKOaXqBk8Qr9065PedrLXxMgW8QLDm2xdntICXId4BhNvbv+nntYltfyGuHfy4etWWruJqD8YYaQWIORZyVqTi6ISnzFQpLfyhoGvAcAKD6zBvNBZUCMx09gjmsfSy/djkQmjfc1AVv9mCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(54906003)(110136005)(4326008)(6486002)(38100700002)(16576012)(316002)(8936002)(66476007)(66556008)(2906002)(8676002)(66946007)(5660300002)(53546011)(956004)(2616005)(31686004)(86362001)(508600001)(36756003)(31696002)(186003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TS9WSjh3VlN5MzN5dWFndllscVlxeTV4TzQ0dzN1MHg3ZGNWNXgxMVVoTm5G?=
 =?utf-8?B?RmJTZlZPWEl2YzBwNFU0UTlxUGE3TGp0TEthM1RyZTRPaWJ3M3FMSnEwZGdn?=
 =?utf-8?B?Zm1xUjNETGJ2ejBEcTQzK2p3S0xFTGhhKzFuWm5uYVNuQWRBQ2RLZXA5cG0y?=
 =?utf-8?B?WG5kZVFUdFpndXlqL1M3dE9LaWhNci9iZHpCa1FiQVp5M25LMDN4eUJ0NWgz?=
 =?utf-8?B?MXFKa3BEMUFSSkMrTHRDanIzT2dwSVB4TUVUUTFvVXF2R09TL0VnUmRsbjZ4?=
 =?utf-8?B?akRodEhHWHZINHBKSGhNUzNYSjdnSGgwdE1aRy9sb2UwK2FjSG9jSEtiYkIx?=
 =?utf-8?B?MFFtbWFSRHlLQTE0TUU1QmdrQkpVRDRLNHM3TzBORWtpdzNMVFNicm9DYm9E?=
 =?utf-8?B?Ty9CSSt3T1RuMGtBd3BTQ2pzTHVqWFBUOGF1T3JsWDBZUERBenFNaENmSUlr?=
 =?utf-8?B?Si9sQ3VoNFpiU1JZL2s1bllOZk5DUWhJYXpjQm1kTm9oMmxqSHJZRU05T1Iv?=
 =?utf-8?B?Y1Jadm9yWjBkeXBla2FLaG1GNXJvdjc1UmY4eGRGL1FZMVBIMjJvWFU2UEtT?=
 =?utf-8?B?NnVqbFFLWXJWY0pVVWhGekFBTVlNSS9UL2IyS0toUHQvdmZaamFUYXBIZ1Vz?=
 =?utf-8?B?Q0drTWdZUkIzYWF5S0VNeVZQNXpGWDk4S0w0cG9DMmR6T1ZLVGZrMGd5U3Fv?=
 =?utf-8?B?K252cXd5YkJZR0V0bDJWUTkwaHRsQlBGL1pWdEdDazY1cDBCa2pUTFM2MDNM?=
 =?utf-8?B?cWs3T2diQ0oyanZiRWpYRjZDaW4xQ3RsZHozeWkrZUZSMU1SQllldWl0YWYy?=
 =?utf-8?B?SjhvL3pKTUxQVmE4QlFBZklkTHU5UDlTdEVhRVNOU0I1VktObWk2M1dxaktO?=
 =?utf-8?B?aU1PWXpPRHdjQkNZRE96bHZIWk9yRU9FNVRnMG5ocEN2QVJmYTdFWFEwci9P?=
 =?utf-8?B?MVBpV3Q2c2M2UW0vZW5BYlVKaEpJejFZbFBreS9HT0ZENDQrZUlYSE5qYk9N?=
 =?utf-8?B?Mk0rc1JpekdCM2UrWGpDN25BdEJkcVQ4bjBnakI5TEs3cEZHY1hKaHlzSGpt?=
 =?utf-8?B?UkprY3VraHFta1pGVThxa050K1dlQTMxdG94a3ViR01YOWtxVkdXditadUc4?=
 =?utf-8?B?QisraUFtK1M0aDBCTTEycXphNnA2VWFiRURhYU8yZDFBMXhkMmdZWGQvdDlG?=
 =?utf-8?B?OE1tUDVrazdLVWJ4b2F5L2NIME9wUzZWUkgzT29pakQxZG5DWkR1NmRpZXJ1?=
 =?utf-8?B?dWxIa051RWwxL2FGVjZZRldyQ1VQdVIweDBMeXVmeXZXMVVKRDZERkFKL2Rp?=
 =?utf-8?B?SjE1T0dsNWZFdk1CRWc2RzFvTXMwYVFkVGdpUVlRaU1kc040bkhkTVhNYTFD?=
 =?utf-8?B?aHVZVmhVQ2kxQnJGZDlUZmtHcXBOcWhwRXZrL3hGQk44UFpVOGpOSWMrWnRa?=
 =?utf-8?B?SHJyS1VES1ZBWFJKZmhKcEhEU2p3dnJLd04rQmVTc3VVaCtMdGV2NUtHaytp?=
 =?utf-8?B?R21Lb0M1SzdwL3NjTlNwK282aDYwRXNIVTB0bzVuWnFFSSs1SGJ2WjRqbVUz?=
 =?utf-8?B?d1R1VmFKclNWT2RBeGkydDlmUGRabFBXRTE3MUhCZXBhNVdkRjgvZ0JEYUI3?=
 =?utf-8?B?bTFBSHcrMDlNejU0ZUJJMkQzVmI4U25IUHkzT1cycDZjVTloMGsxVEVhSytR?=
 =?utf-8?B?WXNWTy9HSG1hQ0ZaZldIVzJjc3JjVGtZQnN6SXJHQVdjYXBZM2hzSDRaVXM5?=
 =?utf-8?Q?9Q3dR2gr5El5GCmB1rwGUTlsl+lEHr6jUHdPBLS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08afe28e-23b2-4d42-0992-08d983e6a913
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:48:15.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjbpjsinJYxKTDoTxJSxumdr6T76zr3mfI4zC7HkMXQjrNPUPAFObcH0tcv4C6S6oeQNIDcadL9YXMcyC07u1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 29.09.2021 18:41, Stefano Stabellini wrote:
> On Tue, 28 Sep 2021, Rahul Singh wrote:
>> --- /dev/null
>> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
>> @@ -0,0 +1,63 @@
>> +/*
>> + * Based on Linux drivers/pci/controller/pci-host-common.c
>> + * Based on Linux drivers/pci/controller/pci-host-generic.c
>> + * Based on xen/arch/arm/pci/pci-host-generic.c
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <asm/device.h>
>> +#include <xen/pci.h>
>> +#include <asm/pci.h>
>> +
>> +static int nwl_cfg_reg_index(struct dt_device_node *np)
>> +{
>> +    return dt_property_match_string(np, "reg-names", "cfg");
>> +}
> 
> Can this be __init?
> 
> 
>> +/* ECAM ops */
>> +const struct pci_ecam_ops nwl_pcie_ops = {
>> +    .bus_shift  = 20,
>> +    .cfg_reg_index = nwl_cfg_reg_index,
>> +    .pci_ops    = {
>> +        .map_bus                = pci_ecam_map_bus,
>> +        .read                   = pci_generic_config_read,
>> +        .write                  = pci_generic_config_write,
>> +    }
>> +};
>> +
>> +static const struct dt_device_match nwl_pcie_dt_match[] = {
> 
> This should probably be __initconst

__initconstrel again as it seems.

Jan


