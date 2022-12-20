Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B807F65228E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 15:28:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467079.726079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7daV-00065s-MT; Tue, 20 Dec 2022 14:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467079.726079; Tue, 20 Dec 2022 14:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7daV-00063A-J1; Tue, 20 Dec 2022 14:27:23 +0000
Received: by outflank-mailman (input) for mailman id 467079;
 Tue, 20 Dec 2022 14:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7daT-000632-HM
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 14:27:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2066.outbound.protection.outlook.com [40.107.6.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 377c24f6-8072-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 15:25:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8961.eurprd04.prod.outlook.com (2603:10a6:20b:42c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 14:27:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 14:27:18 +0000
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
X-Inumbo-ID: 377c24f6-8072-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4dG0ZFDb8tdwNtQBjhtx0misKvqkF095cIlx/dXao/+IYCpL7mlQV2S4glIkYxhVRFiSjHjtGTkXW10Ifv98fDid87mIgL74hl7pKjF8hj97bHyB20k2yY0kPd+Z47DJ7f8xmFD+67gHcaZ0Gu0qY8Rp02BLJfdf39+ez/0WZOj/7MnqYegxhjEy5N42N3s+lhq1NkIzFVEY6cyCxhj+xOpsYVA4WDweGS9dOFUK+/ZpV6mzkCQM8THDKOlw6yV143MA8ETv87UzhjbIMqB8CzwaDpfWlxwiV4020WSytXiRfYo8ORJF/WQvDvS8O34iH0eWDpcCin6/q+LLeYN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcDV8O5y9O21/73FuR54Y+llr3CHg0t7vFScg3m02V0=;
 b=mTByqq+vYi70R1U77UHarD4SqRMHMQLEPKfeX/keo7840Sy9hnojxxnDoSBgJIeBN+lU+09CLQ1LtZ2m7x7G/aUYBlAtoRiBa+eATsZXNY2eKsE8mgZe2U6Z0+MIiokFzeZzwKJzhfJ7wr+NWkDw5T94Tm8oa46iQ1XH22u4RApd13arftN4lj+84n4mgbbTCcpgAVLpAEb+jn1/f1qEFzb/KRMfIno1GRjrtQOplrnX/za9RQRdnH4o/PFVVwM9K5dn/SE6j/ymP2pXDZ8oWAYgcb+9KX/cAW2hY+ziW0hzp7Wdnbs+DF4YKo7yF5kC1qfslr1kgbNQy1QBwQmwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcDV8O5y9O21/73FuR54Y+llr3CHg0t7vFScg3m02V0=;
 b=4nT+sX2YwyNXrls/lExcPhHw3QsEQIaQQO/ycWBRb9jwk7jRRq9D3H4w18VYtdJlkvNbtRf4OQkloL6OWzPlo8jjZkon36LXZLYx03AzZ/+2cf+ol2QIYGocbN44xoPHW5UTRa5BQt5nOemDRZfeMXRnqrupJsgex5ED8S17VPkv9cFMTV2eAuiSwGcFli7WaLq/1qJS7iocWCSfBDgajKOK0su9tXFGB2I4JEZt5TcCLz31M9qRNw80mCKtLZlcKtL9CRTN8OjWiRDjCBHVoPb0NymTXwELQxepW9PU2iI67eDwa/MsCa9BPPGejq+sWQ336/u21HJhN5h8nYQ99A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17364182-13d4-9120-e1ea-b9ab588b6459@suse.com>
Date: Tue, 20 Dec 2022 15:27:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/2] acpi: Make TPM version configurable.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
 <20221215170934.123889-1-jennifer.herbert@citrix.com>
 <20221215170934.123889-2-jennifer.herbert@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221215170934.123889-2-jennifer.herbert@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8961:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e245a5a-0f03-478c-4d8f-08dae2964c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W5ECA7OU8TNLgJaGJlPmpmrk0A3Yy+cxoFD940PQisHjtsM4AaHz/k8jb/N5Vowa3s1NfWVbyRQFeP9aOIyXacT/MvpeXMGFelhYJB1AITJusjxjhj4/bt724iNpW9uR9fvsSjwehAo/D6+YIuungYwa/YwxqDPCvbXJzeap8bsUMrCzMKU1upKxiJLKCu9JvTGTdvt5Il6aOWewmY3e7GAZdT7VLIs7nvKkgWtqMMOO6qfIJf0TJmeg9PThyEZsL4Iwwcfcfu8RhFNyfxOTOUjTWl9B92csrRN6GXF9JrIc7NmT7bcu9nhdd2Lr5//XhOSScoIvNDavmtiIfnIEL0ZKV03Qfgnx88oFl2GNONnSDQmFyBhkrmW80U+2Of5TE3PDjpHPIWAVfWKvcwYkt4NrYZ65jZzp+zsEI3E8S4s0jiLkEA/Tltw5rrHiJUqb0Nwx4oPywiyIzlUlVSkPyJwiKPfd4j/b/0zkuklx1iEqvc6Yde6nybzw6r1UUYDpMGQHTQSyt6lmN1KvPZFRilwSKbsFV7HEXOwsnyvm84GPrhQ7iI6rdfIT+UKouQVKj/wgB7fatc2cbtMQONAiwQP0jsXtWCB6Lk7TVdo5T/2IEXsDwX35eyo/MXqMJivJocFqIJHtpxpddaDL8XkPSbC1bzj+Y2dclr8J/yoPvEjlGXooRG6cRWPUZ083wLbTV/3TcnB4Bs4gGNp32YSezZu5i2YVPfZ5tpj8rG04C84=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(53546011)(31686004)(6506007)(8936002)(6486002)(6512007)(186003)(478600001)(26005)(316002)(54906003)(45080400002)(31696002)(86362001)(66476007)(6916009)(66946007)(36756003)(2616005)(38100700002)(4326008)(66556008)(8676002)(41300700001)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dndaUDZRQUJYa2JpdUc1YWZsUXdXaytYd0xqTTBpbC9NMW9FVlNhWWg5MGJT?=
 =?utf-8?B?T1JCNmRZMmkrMnF3eXFwdWxlZW5Rb3NTY3JIbmVRS3gwTTJQWDBhZTYvTDd0?=
 =?utf-8?B?UUFrOHZRdTFHUG9FTzZyRm9GeWpxeHl2RllNdTA0Vzcwd1R0cDNSbFBVOExn?=
 =?utf-8?B?WFZoeFpEN3lTRE5NdXdGZE02SDcvRHJUV3paSFZGUkZEaXBpbjhUQW9La3Fk?=
 =?utf-8?B?SHFBQ2JpRUEzbVJlTFpOMWtjZEc4azJycTVjZWRpalk2RUNacytYNXFyUGlq?=
 =?utf-8?B?ZlBUQzNxVFRmSmZtb1hqekNJOXR3MWkzMGp4SERVd2MyOS9MRWlBczRqRXk0?=
 =?utf-8?B?N2l6TjZxRVh4cC9mVjJRRTFuc0plajVYdGFCTjF2aXJPbThUTDZzblRYakJV?=
 =?utf-8?B?YUJSL2h4NjdlanpQVTNaMGp6azVnOTE3WWxrdjkvcG1ZZmdndWNabWNLOHVT?=
 =?utf-8?B?a1FNcldId056dm9vcWE2SE9TbFNtemJmbE1ObXpKM3Z2aEFWM2VldUdRY0w3?=
 =?utf-8?B?OC9LVVR3alFjbkZRMUhsWE5JZThFNDVZcENOMHZVZW83amhORjA3b3B3ZXhP?=
 =?utf-8?B?a0tWaTd3SEU0dVJ6dEp5cGVzd3NSQWFNd0w4eWFGNmVNN01mc2U3SCt1NTcz?=
 =?utf-8?B?NS80U2p6RW51Ym5mZ1FrQktjZEhXRE1Wb04reHdoS1EwSzUrY1kya01QUmRp?=
 =?utf-8?B?T2JnV2p4bDYyY2ZjaUZ6QjRwc3p6TU9Cbnp1K0NNTWhyRDl4azhQRjkrRjdn?=
 =?utf-8?B?STV1TnJoUzNPQWJsTjFhVXJSSXlZYWF1aVFRRDZ5V2tQTGMrQmlCN1ZqNjk2?=
 =?utf-8?B?WVNUUEZrSk95TUtGcWY0M2RTbVlEeXpRTHVTUEVmZy8xeUpaQ3Bmcm9QUlZl?=
 =?utf-8?B?K3E5L3drOE9QMUR0eFlrUVNRVVFNaG9nQkxyZTZWdVBuZnppaWg0aUlhMmU5?=
 =?utf-8?B?WlliSW9Zbno5MEkyWlVmOS8rcXRvOHdaNS8rVW1kNk9JZUpvZ0dBemtQL1Vs?=
 =?utf-8?B?UzkzQnYyTHoyN2tldnVTK1F1K2UrYUxCa3lsSG41YUd0d1I5cFJZN0xQQ2Z4?=
 =?utf-8?B?R1BRN0dYZmMxZXJCUHNJeTN5aXJWNHpnbFZseDE2YzMrcGF1Y1JmejZ2SE5F?=
 =?utf-8?B?UHZ1enlobExiMVFFYWZ2OU5MUE14OVA4UDRJdW1FUzJDK2dIM0IvUDRsTCto?=
 =?utf-8?B?d0tXeTJIRThzVXJueU1GakxXQlJhTTErU0ZGTEM0S2JrVkdCb0FBRzZ0WUhZ?=
 =?utf-8?B?VmNiYld6N2tTdy8rMlh0UUpoWEE5Q21nWitYMUI5RmwxK3lsaFFVQ05IT2hq?=
 =?utf-8?B?TXYrTVhxbmpvZnVSUzVnbStvQVI0VlFhTk1WdVJBY0lVY2JVUTk1Q2YwU1Vp?=
 =?utf-8?B?Ynp1bFk3N2ZPRTBmdWdKTHJqaWhnNjZJZVE1bmpPbml3QXQvTERlNVhhV0Mw?=
 =?utf-8?B?U3BMM242QUlVSWNhOTFoMWZBRGhwNUhhUEYwVEt5ZVVoeXdJVVFJNEdBVk01?=
 =?utf-8?B?NDVkRkxVSFJjb2l2anIrTUpUaFk0ek5oM05OSjJ2SHgrdS9CVk5uSEFTY0pX?=
 =?utf-8?B?YlEvSW9Zd2lIaUJuY2ovakx1Szczb0FIcGxlN2V6akZmcGJ2Vk51dGlkTkNs?=
 =?utf-8?B?OHhQK3R1djhpdjJ1bjJhOCt2Z3VtQ042SFYyYjhuMFc1NUFZUVh3aDVma2hk?=
 =?utf-8?B?R21kdnBwc3JXQ3F1aW10NEFUK3lJQ2ZmMWtiU2Y0ZlhJM3pZajM5ZjhOMmlG?=
 =?utf-8?B?dXdTM1FvWkpJT0FmU2FIaXVoemJkU05XdG02V1Z0bjF1YjgvUXh2L3lXejlV?=
 =?utf-8?B?Rzl6TndFOEZWZTBRTWFDbXlBNDU4ajR0WVZlVkRsRGUwZXUxbzloQ2M2ZmxP?=
 =?utf-8?B?bkpESlpaSThZN3dBUkx1SHh4Q2dSMDQwblBhN2l1emlzSFhTOHByeXpoY3Vk?=
 =?utf-8?B?UW1QVytYbTdrUm9KckV6KzhQcGRNRDRsY3hKSllRcStLRnZ0VC9wWERncDM2?=
 =?utf-8?B?K1ZHOTE0TmRjNnhhUzN5cnI3MVM3UnBtcE5ZaVIwc3VwRTV5WWsyR1ArSW55?=
 =?utf-8?B?ZEhtUXBJQ3orSER1L1ZEVm5xUGNxbEpNMVE5Vm1jNkhFV2FKTzVTMENwNVla?=
 =?utf-8?Q?5rtrxTQahLu0XUpm/pKE3xK7R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e245a5a-0f03-478c-4d8f-08dae2964c7c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 14:27:18.3782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMDDRbLJUA4OxeGsfKD+uYJr0l/2z0fG1WamlBzNb20fLU+qj3S9NT7bpqlIv+rto7eF6E0waoaoJxm4bHJ+nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8961

On 15.12.2022 18:09, Jennifer Herbert wrote:
> --- a/docs/misc/xenstore-paths.pandoc
> +++ b/docs/misc/xenstore-paths.pandoc
> @@ -269,6 +269,14 @@ at the guest physical address in HVM_PARAM_VM_GENERATION_ID_ADDR.
>  See Microsoft's "Virtual Machine Generation ID" specification for the
>  circumstances where the generation ID needs to be changed.
>  
> +
> +#### ~/platform/tpm_version = INTEGER [HVM,INTERNAL]
> +
> +The TPM version to be probed for.
> +
> +A value of 1 indicates to probe for TPM 1.2. If unset, or an
> +invalid version, then no TPM is probed.

And who's writing this new key? Aren't you regressing existing guests
by defaulting to "no TPM" in the absence of this key?

> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -994,13 +994,22 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>      if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
>          config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
>  
> -    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
> +    config->table_flags |= (ACPI_HAS_TPM | ACPI_HAS_IOAPIC |

I'm puzzled by ACPI_HAS_TPM being present both here and ...

>                              ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
>                              ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
>                              ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);
>      config->acpi_revision = 4;
>  
> -    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
> +    s = xenstore_read("platform/tpm_version", "0");
> +    config->tpm_version = strtoll(s, NULL, 0);
> +
> +    switch( config->tpm_version )
> +    {
> +    case 1:
> +        config->table_flags |= ACPI_HAS_TPM;

.. here.

Also (nit): Missing blank after "switch".

> --- a/tools/libacpi/build.c
> +++ b/tools/libacpi/build.c
> @@ -409,38 +409,46 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>          memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
>          table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
>      }
> -
> -    /* TPM TCPA and SSDT. */
> -    if ( (config->table_flags & ACPI_HAS_TCPA) &&
> -         (config->tis_hdr[0] != 0 && config->tis_hdr[0] != 0xffff) &&
> -         (config->tis_hdr[1] != 0 && config->tis_hdr[1] != 0xffff) )
> +    /* TPM and SSDT. */

May I ask that since you're altering the comment, you make it "TPM and
its SSDT"?

> +    if (config->table_flags & ACPI_HAS_TPM)

Nit: The file is predominantly using Xen style, so please adhere to that
(also again further down).

>      {
> -        ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
> -        if (!ssdt) return -1;
> -        memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
> -        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
> -
> -        tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
> -        if (!tcpa) return -1;
> -        memset(tcpa, 0, sizeof(*tcpa));
> -        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
> -
> -        tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
> -        tcpa->header.length    = sizeof(*tcpa);
> -        tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
> -        fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
> -        fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
> -        tcpa->header.oem_revision = ACPI_OEM_REVISION;
> -        tcpa->header.creator_id   = ACPI_CREATOR_ID;
> -        tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
> -        if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )
> +        switch (config->tpm_version)
>          {
> -            tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
> -            tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
> -            memset(lasa, 0, tcpa->laml);
> -            set_checksum(tcpa,
> -                         offsetof(struct acpi_header, checksum),
> -                         tcpa->header.length);
> +        case 1:
> +            if (!config->tis_hdr ||

There was no such check in the original code, and I think it would
better remain the case that the field is set if and only if
ACPI_HAS_TPM is set and (now) version is 1. (Aiui this check actually
covers for the double setting of ACPI_HAS_TPM commented on above.)

> +                config->tis_hdr[0] == 0 || config->tis_hdr[0] == 0xffff ||
> +                config->tis_hdr[1] == 0 || config->tis_hdr[1] == 0xffff)
> +                break;
> +
> +            ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
> +            if (!ssdt) return -1;
> +            memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
> +            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
> +
> +            tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
> +            if (!tcpa) return -1;
> +            memset(tcpa, 0, sizeof(*tcpa));
> +            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
> +
> +            tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
> +            tcpa->header.length    = sizeof(*tcpa);
> +            tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
> +            fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
> +            fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
> +            tcpa->header.oem_revision = ACPI_OEM_REVISION;
> +            tcpa->header.creator_id   = ACPI_CREATOR_ID;
> +            tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
> +
> +            if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )

Nit: Please wrap this line (it was too long before, but it's getting worse
with the re-indentation).

> @@ -78,8 +78,8 @@ struct acpi_config {
>      struct acpi_numa numa;
>      const struct hvm_info_table *hvminfo;
>  
> +    uint8_t tpm_version;
>      const uint16_t *tis_hdr;

Hmm, sticking a uint8_t between two pointers is kind of inefficient. How
about putting it next to acpi_revision and, if so desired to keep related
fields together, moving up the tis_hdr field?

> -
>      /*
>       * Address where acpi_info should be placed.

Please don't remove blank lines like the one here, the more when they're
unrelated.

Jan

