Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA2C78423E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 15:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588479.919984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYRcQ-00040P-8A; Tue, 22 Aug 2023 13:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588479.919984; Tue, 22 Aug 2023 13:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYRcQ-0003yT-5L; Tue, 22 Aug 2023 13:40:26 +0000
Received: by outflank-mailman (input) for mailman id 588479;
 Tue, 22 Aug 2023 13:40:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYRcO-0003yN-Qz
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 13:40:24 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71229482-40f1-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 15:40:23 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAWPR04MB9741.eurprd04.prod.outlook.com (2603:10a6:102:37e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 13:40:20 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 13:40:19 +0000
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
X-Inumbo-ID: 71229482-40f1-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYb3JDOkrnynJKZW3hf/98l68r5XKWDLp94liixhy7FwFZuVfDTSMEZGN/ov7OlRQ8pPaZoQpXFkVJzMxJ4cMk+BTKYqTupw4iq76uBeu7gTJmOtEeFhiEGedAXe6G6i3GK2RHKjCMdKBp5EmTqNBAAR0nkaxejo6Etq7FOiIXI4fBbuXQ3v29E6MNLHeUxzWmqn9ZwfoAtWek4wqZZCuXcVy9ySrSSa0Nraq93/DD2W2GLXU6sEWV56PDzDB8n2978k3d+kI/zNrTllMXukENwDJ57V/q4f+D9SESGkdR5P4JS6BooFb18+/E0tclyXCFUA4Mt2NoCkUiglXgC7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSZoM99ookfYqK8mLVpIPqwIoQbLgyvrXM2nSJsj/xs=;
 b=VOYBCcyEDH0eHPE7I7vQL81o1RuhosfpmW/ra/0nt4dLLJJGXmo4Qdxne7pd1z5IaJnvpama4xvH+Wx7iQ9sWDaum+CYoHYs+qK7KEOhAV+wCkveR7JkWTxWgAQe+T0InLJETEBxySI7M5p28ZaTEsQPO5YVkGWs1GWDdl2fLCPBqSU9UeUmZiE/LfGorCo6Yarjb7x2A9KoVBGXmtLZV4NgML5weW+To39eV4w5n3dAnL39Gw3v/5x/2nvR6AdA+3f9V93iJsjJeusaYY0ztGtAF6X0V+j6xoI7HYV8uuJgWqOnnBllX8myGh2p5nFWUZTpibtBq5o+xxYGfTE+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSZoM99ookfYqK8mLVpIPqwIoQbLgyvrXM2nSJsj/xs=;
 b=gtKk9yRR1XQ1XAd6YwY0CgqHr8yp2MHLsIn32ihT9Px4Wr9Wreo2c7WWCEARSkreHJXs0obD4fJQWsYJGZ9934N49bZkHorVpnuztBz8O5Pew7LWikErF9TGZbmixaMNdltkdse7NaurtBOdqx7l5PN1k3flufrxWEcWqTCEuXbcHezdaZegQYQSWZQA+w3n5buYXQ+UKDZVHEJ98jmjFetZK8BDnaPkUsIIz8VPkmxXRA1h5mzgsyKhMZqsR4WNmsjvWXZjujuoFjGTlxtVqPACOHsBKyBoLUS+do1lsdkI53ZMsHmam9Mj9AxKOGEIxAWa8e3pS0qMnM2ahSdzEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b29df408-0ba9-c8a7-4817-6c2066763d15@suse.com>
Date: Tue, 22 Aug 2023 15:40:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/4] xen/vpci: header: filter PCI capabilities
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
 <20230822012955.312930-4-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230822012955.312930-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAWPR04MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: 653f8d6d-cbe9-4ffc-5f19-08dba31553ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	81BbOuZSXZwn8XcGr6p0zVGUoRbl5n6rt5YcLh4bxYpUp3wopUN+EQ2LgS9zFNp3MwVKeZrsDQXAMB2HWC6rnC8YZjbqKN5fV6Bg+S5+lnrXwynBlizS5xjIN2vLnsNfCjloIrV0VyoBU2/tbWzRIdUNbq/r58tG8KlAtyaTJ/r6P7pAElQPI7T4CF5v0mXq7+Z25gNePrmuUiNab9abtgJuwzQE9vMpxIc4bEHN70JX4OVJqW/ETQx7rGdvgi5vkJQsEcTGqnqkk09bV8d4X99KgbZsEJjBL9BtrEH1OvKWkTbEdChfA2ufWL8dTmp+Txk/u5M9QuvKaJFxRptvP1lwwtLngPsuP4i0xcQxxxKSYbDMx0u+5Q5nE5XMFghEBcsUUlXRSLvf1dm4k25r0jj26ejGtXcf993or/Xkza9OpeqfrU7p8Wqq27Wh7321VAwDQxKFWzn6t99aPED2OGmeqpYU23EMj3zlQoPA3GmTGlO8Nl4BVkvH7DipEoXzkvnYbPFej394E+S8Axn4a06nSZaIFFdpc9hqO23ne67qEkn8W5oV5vv7P4cNos4KS1GlB0Yu8I6sj4z2Lg8EUcQeukKUPIqdkorw3RD49XXWHCrEUOJ5ubT83TDUhF5rv40kGnHL1ak182duRlpK+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199024)(1800799009)(186009)(2906002)(38100700002)(53546011)(6506007)(6486002)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(6512007)(66946007)(6916009)(54906003)(66556008)(66476007)(478600001)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1NtQ0FZRkYxV1JxM3AzREZPK0VreldyaFNuNjRnSTZWd1ZLNGdaUG9VQkIw?=
 =?utf-8?B?YWVRUDBYOEZHdHJHM2ZyTXdrcDBNR01tNTJqSVVSVXNOSkxydStCNEdBdm4y?=
 =?utf-8?B?YWo2dWx1U3BYYzlwNWxObDJpSHhXd3F4VEQzVTJ6NEhzUFBBK0Q5djhxM0cw?=
 =?utf-8?B?czJmYmI5Vnh3WUR6b1p0dnJZTHc1OHAwVWloSkV1MVkvQXlZQjh5L05uYjMx?=
 =?utf-8?B?WVAxVXI0djQwQmRpUE5OSVZnMkVrVGJzeDQvVkRyNmZmbmdIbkxuakVMa2JC?=
 =?utf-8?B?NGRKR2JWa0NmTkdZRFRYK245QWx3SVBpRXJIQjhGKzhOZ1BzaHFYU3UyY29x?=
 =?utf-8?B?WGZGaHdURTR1WGJVcmhydmlxdldUYjU4SnlhbEdPaTNZazNPK3FUcWdCVyt4?=
 =?utf-8?B?TnNXaWNPb3lDc1k0NUV2WXo2Q3FzT1BCQjlPYUJSc3NJL0xvVVBPN21ER0JV?=
 =?utf-8?B?ZDZkVjZpN3V5RExUVHh4WDhEaGZIb2J1eXdNRm5SSXZkUG1GQ1BOZHh6clk2?=
 =?utf-8?B?WWd4TnlObEdOOVBQVUxPdmltdk8xY2VTUEpyU2pQM3VvdFU5cnpNS2tOK2pt?=
 =?utf-8?B?cXB1VlN4N1ExR09ubDdWQTMwVmVUbnZXQ2ZEODFTY21Sckc5TEFmTWF3dUJ4?=
 =?utf-8?B?d2Z0UC8wcVR2YVN2aTBlWklEY2VZZGZQUzdEN3FqcEh1cVd1ekY5RnQ1VmJV?=
 =?utf-8?B?TTYrUlpubGdBekdXNlRReEYvNkxOWlNXck5QT3lsbk5zS3lDUENoT0d3RmVK?=
 =?utf-8?B?Wk5oSnBub1U1ZGl1ZVhoMUV3amI5WnZkTzJtN3l1bFV3cjl3M3lVb2RFbDFF?=
 =?utf-8?B?QXpXbEx4TXgyeUV6UjZzUEI4KzliREFyc3pyK1UzNnc5SHZwM2N1SW03Rm8x?=
 =?utf-8?B?Ui9oeHVuM1N6ZkZ6N2YrL09wUm81cjZUa1BSY21zVFRwekNwYUR0a01IZnVp?=
 =?utf-8?B?V09jMGtLbnQ0dTZ4T1NOQ3JiNkh2cGhvY1hwUHpmRHVFSWJLZS9oSFI5aU1N?=
 =?utf-8?B?REZ2L215TXU3S1Y5RjVpcTZ6ZGh5S2xrNVVOd05WUFR3QmdzbDVTYzF5L3NB?=
 =?utf-8?B?NkQxSExXQ1dDWVpZWG5Fb2R1b0tzd0pLQkZIcFJHZ1U2d2RBSGtIN09Ub0du?=
 =?utf-8?B?YUN1empPd0FtTkxwcDZCZU1NejM3VDhjRmJaSG5YSXFTOXhKVG1vNFJzL1pE?=
 =?utf-8?B?ZmRlV2pHK2ZaMWM4Z3k5MG15MTVDSVg4UjAvNk1sR0ZERVZoWTBib2hHMDBT?=
 =?utf-8?B?aTdnYWJXK05uMktQU3ZzMTZaMktVS1d5TWR4S2p4aFV0N0NEbVJsakk4MHll?=
 =?utf-8?B?OVZScVdWT0tPWEpFamN6YUl2QUo1QmZuZEl1Vm5lbXRJa3ByeFhPYWdSNUJV?=
 =?utf-8?B?ODFTb3JMbjNNRXZNTjg5VnduVnhlYVhUYnI1V0VyZ1ZFOUx4bWNtZ0FSKy9t?=
 =?utf-8?B?SGhKeTBJVGVueWExcUVadyt1UTF5OGw0NEt6Nm9xN01Sck1xV0dqZ2wzUlN0?=
 =?utf-8?B?QmkxV1h4UHhJRDlBSWFoejdjYzBGTHQ1NWFjL1J3T25JeWZYMEdIRlgweTB5?=
 =?utf-8?B?cWFRcGluSWhOQ2NNeDFJU3hodWJiMThqSnpTeXd0SFpHMGhpeUFtOEx4RkU1?=
 =?utf-8?B?T09TcitnaklFc1dISW4yZi9qeGxiWjNJNTl3QWZTdDBXMzFVbE41TkJGMDRK?=
 =?utf-8?B?a1Zqb0dCYkNXUXRnb3ZVV1d0a1RaWXdIdk5IWjhudXFmQ0FFVXJMck1xczdL?=
 =?utf-8?B?SHVLYjNDMWY4akovZjEwNWNtdGd1NzZsWXFDNGl1NFR3THhvTFgrSnZhRStv?=
 =?utf-8?B?THJ5SU10S0R6SXMrMmJQdFcvTFRjWDg3akZ3YW9zdGI5V2FxS05ET2JyemFL?=
 =?utf-8?B?dStZbUh1c0dvdTNCVU9XNi9Wbk1NRjJsYWRWQnp5SHdycGpZM1ZJdUZTaFR2?=
 =?utf-8?B?bVNDUXR3VnVhY2ZZd3NMOFhHRkhScVkvQStMb05QMHRiZCtGelhyK3QvVkw5?=
 =?utf-8?B?L25VRHlMdlVGUmFOa1JIQlFTM1FOUy95SXE1NFhiajZNZkxMOHVtanRNeW52?=
 =?utf-8?B?WVRadXBvK3lYWUJFR0crRVQ0ZVIwVFlmL01qSVJldWVtZUgxSS9GcndQMFdi?=
 =?utf-8?Q?frHZ0P81v40kFdmdaM4bWuwPI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653f8d6d-cbe9-4ffc-5f19-08dba31553ac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 13:40:19.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6PdH8VJlcAVdy1vwG/gS0lwBaWe9XF+hLnK35QgfbRYHox9FHwWRoO7UG5CMHozoHs1ycEB5cBJNu+EZD3z0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9741

On 22.08.2023 03:29, Stewart Hildebrand wrote:
> Currently, Xen vPCI only supports virtualizing the MSI and MSI-X capabilities.
> Hide all other PCI capabilities (including extended capabilities) from domUs for
> now, even though there may be certain devices/drivers that depend on being able
> to discover certain capabilities.
> 
> We parse the physical PCI capabilities linked list and add vPCI register
> handlers for the next elements, inserting our own next value, thus presenting a
> modified linked list to the domU.
> 
> Introduce helper functions vpci_hw_read8 and vpci_read_val. The vpci_read_val
> helper function returns a fixed value, which may be used for RAZ registers, or
> registers whose value doesn't change.
> 
> Introduce pci_find_next_cap_ttl() helper while adapting the logic from
> pci_find_next_cap() to suit our needs, and implement the existing
> pci_find_next_cap() in terms of the new helper.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v2->v3:
> * get rid of > 0 in loop condition
> * implement pci_find_next_cap in terms of new pci_find_next_cap_ttl function so
>   that hypothetical future callers wouldn't be required to pass &ttl.
> * change NULL to (void *)0 for RAZ value passed to vpci_read_val
> * change type of ttl to unsigned int
> * remember to mask off the low 2 bits of next in the initial loop iteration
> * change return type of pci_find_next_cap and pci_find_next_cap_ttl
> * avoid wrapping the PCI_STATUS_CAP_LIST condition by using ! instead of == 0

Looks mostly okay to me now, just two things (pointed out before):

> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -39,30 +39,38 @@ int pci_find_cap_offset(pci_sbdf_t sbdf, u8 cap)
>      return 0;
>  }
>  
> -int pci_find_next_cap(pci_sbdf_t sbdf, u8 pos, int cap)
> +uint8_t pci_find_next_cap_ttl(pci_sbdf_t sbdf, uint8_t pos,
> +                              bool (*is_match)(uint8_t), unsigned int *ttl)
>  {
> -    u8 id;
> -    int ttl = 48;
> +    uint8_t id;
>  
> -    while ( ttl-- )
> +    while ( (*ttl)-- )
>      {
>          pos = pci_conf_read8(sbdf, pos);
>          if ( pos < 0x40 )
>              break;
>  
> -        pos &= ~3;
> -        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
> +        id = pci_conf_read8(sbdf, (pos & ~3) + PCI_CAP_LIST_ID);
>  
>          if ( id == 0xff )
>              break;
> -        if ( id == cap )
> +        if ( is_match(id) )
>              return pos;
>  
> -        pos += PCI_CAP_LIST_NEXT;
> +        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
>      }
> +
>      return 0;
>  }
>  
> +uint8_t pci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos,
> +                          bool (*is_match)(uint8_t))
> +{
> +    unsigned int ttl = 48;
> +
> +    return pci_find_next_cap_ttl(sbdf, pos, is_match, &ttl) & ~3;
> +}

You still change the original function's signature. In this patch, the
prototype for it should not need touching at all.

The other is the imo excessive use of fixed width types. "pos" has no
business being uint8_t (but that'll be taken care of in the earlier
patch for the case here), and similarly e.g. id doesn't need to be (in
the earlier function). But I can see that at least some of the cases
here are on the edge ...

Jan

