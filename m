Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D616278D662
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:06:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592974.925846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLpX-0003mG-PM; Wed, 30 Aug 2023 14:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592974.925846; Wed, 30 Aug 2023 14:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLpX-0003is-M0; Wed, 30 Aug 2023 14:05:59 +0000
Received: by outflank-mailman (input) for mailman id 592974;
 Wed, 30 Aug 2023 14:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbLpW-0003im-04
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:05:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 549aecdf-473e-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 16:05:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 14:05:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 14:05:51 +0000
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
X-Inumbo-ID: 549aecdf-473e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX8rVUyM2xY+CY9vrsRj769zC1KotDkqILxJ/cgCm+g4H1x+1Lo6eII8zqmRnPEanDhmY2+O2JM9N90aWlfLp+kvtOHJwbjLZtCPrf0xh0YyfWVeM55JrBGGJZT6FJN+lRFnbQAkQm8TVFFfpXNl+TWxJIT+qmTnVEX2qdlFosLlPzI1rjQ41EubsPO0OKjtydr76vMbjMbrI+mQzslmkv3K2OrouPIXji38L1v9vf1/Ntqsw5ZT63CchDWnujYDAJ+o08vNkLwGJRHh/woIrVeSXuLC57oyi86adOCONvgaEFlPkI51wlmSTSVk4l3GgJ1lShAx8wcbk2zheJJrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsfTMXvQVdDEuFdvBEEpnO9qmsEvBLcT+3eRQEbnF9A=;
 b=i7hhi4l4/W/sNxUqZR3g15SKCOUgVl0EMNMAV6oJ1wiWggIopD/PA3+AOEoGMj0QQWfyTiiCDjm3Tlf2pxwyBLjww2ruwrObSR5XIvFokl+JdLocGq9QWgB9XrvKA5NlI0QkbWaCrX3EQzApGlSA//OQ3P+noFv6chrhdchFMW074QACbuPUoCEOUSc+mlU6sXLdr5Gxd2VtloproTnw4IpQimrffSKrI/Uf2aCjn7ghCXfMV+ml0oIjCB7qvaXHyRvqg2ij9YvkX0zODXOagIEvJopVD1lUNLvY9GNHPyEybZpAk2rGxONSHDefi7O3H4JtBEQiABNDsFLap2Yasw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsfTMXvQVdDEuFdvBEEpnO9qmsEvBLcT+3eRQEbnF9A=;
 b=HLBxfvFtvJnxkNnHDlO7a/Z8QRtTNyk4W7wq4EeNvMaFdcDSv8wxcHYJIi+1iOcsvpfawUvpHIjSZqUhM7SLSAp5eMU04gEmIyfQ4yDPxK5zK6Lq2B4UQZZXoYTbPvraoWDRgujo02ZxIpAOSyqq+MGhc5MFNzPg7JYwa0L9VmccmzobcetkB4Dl9qoGtPVa+ydBODjqux7aS4sSvtPCPK6PYyIGebl1a6ELx8JUqyiNWcB1FpJ7os13i0BDdRJaKR7LjdPka3QLVxJ/xzPvZr5I4SK0G9VxAPKCpfvJC5LWBzt9+of8r6/rhettvcP5cWwcPdw6b3KALjRW8fHrMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a082785-7da1-caf9-3193-eb0a9a77a7bc@suse.com>
Date: Wed, 30 Aug 2023 16:05:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 4/6] xen/vpci: header: status register handler
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
 <20230828175858.30780-5-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230828175858.30780-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: f4bfabec-f9c7-4a8a-e4c2-08dba962379a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Om+5oLMrWL/bQVwuxZAjM3VqzXzBenPeP1yWCocwDIFWJFrAZKToCk+vrEqUbV1PCliQN90ddGz8sIZslzQfr0jVFzGxtitoPrQmysjPWsrEpssAqELwEGZGfVSNabkZN7NbW8R+5swBztbMRbJXmpKiHDe2zSb6W8bBT3xSx+96aSwpDInI8Qvz5Qoa9D8C748Ct6BgCCwCxxOKjj7fGjuVGnG38rNfiNCJfsMI1ODpa9oijZIUDI2iuudt0u3u/PV/pkkEn5B5AwARVo8k3vnhj29ZtXaS0UfcqUD7gPtJ4r06a3NuLLt9u1zFxT75ZRWdc0S6iuD7QDRmESnTsoKfHNggGxP7yuocwpBZh4oykZyMSrFLHOjmU69GAW0xftAIYgmKkiLuPVb4wxdfbJ7pU/4biWAMqhRq4I91e8c7rym2ccdxIxlMEq8SkX9QDIwNnCiNqvEZigZzdLHp+5+835iy8S6DYzAy2LATDDNp0biYtCDofYreKXhftMLhOQVf4qZgAMD29pXnU41XFvRM2egdFBa32KpA9H//C+jMEXTeN7x16cPpTFFxO3olqs4bQzRzQiJFlUYX8HT8oJsI1CTnsCXvT2J/x622ZWsN/EKBDhb5x/MiT6hQDava+zxMwK5bpof4dmfTulvixA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199024)(1800799009)(186009)(36756003)(31686004)(83380400001)(86362001)(31696002)(41300700001)(5660300002)(4326008)(8676002)(8936002)(53546011)(26005)(6506007)(6486002)(6666004)(2616005)(6512007)(478600001)(2906002)(38100700002)(66476007)(66946007)(316002)(6916009)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjdEOXE4VzFVQWtJU2ZPcXJOMVk5MHNDZmhyaHJ6WGU1Qyt6UHBQM3R1dTVy?=
 =?utf-8?B?YjhURU42NHRwUlU2Q1BuamJEelFFbXl3YklhN3h4bGorSjE5ZzhJckJMUy90?=
 =?utf-8?B?OUxUekViQUFkbk5VczV5T2JjcW1kUFpVaXBld1BqSzlLUGYwUTNwQkVnVVN4?=
 =?utf-8?B?eGdkMHRVcTNidmpuWXYvWHl1VE8vVEFvQmJjZVRSRElabmZuUlVsdGJRVjMy?=
 =?utf-8?B?M2JDMlRVYmtvWjl4Y0JJVGhUY0EyalZoSFZxWjJoT2owa2RZbVY5NXZobkRn?=
 =?utf-8?B?d2hKYVJkY284LzlwNnorTmFoRHVWM1NnSHRxSVdiV2NwS2V0QlIwd1FIOXRX?=
 =?utf-8?B?d2lMWUxwejQxbi9OVDY5cnZVNTFGRGdwc0VvdldGeXk5TmFOY0xLZ1BEQlRm?=
 =?utf-8?B?ZUZEalQ4clJodTdRZ1ZKelZncmpMYjYzNUZ6Z3NSSlJ6a05abFkwdmEyNjRG?=
 =?utf-8?B?R0ptMk42MXRJQVpmaGpSVHZRVXQ1aUVDbC84N1QzbFlFcTFrdXY5YkZXeDlD?=
 =?utf-8?B?T09oVnQ0QXF3S2xPK2FxVXdmLythT2t5Wk5YSUFUa09qb25vc1FMVnVFbnFB?=
 =?utf-8?B?MFl0ODBaQzlPQlpoVXlFOGo5NWVHd3g1Q2hRN2ZKOXlpQWE2M0RwRGUwSWRF?=
 =?utf-8?B?VnMzK0p2TE1jQi9aczlMNjJmd2Jkak9CazlObjFiUjJoYS9IaTBkMERrTjYz?=
 =?utf-8?B?alZrcjlJdE1BcENOZnhjeC9JaGQySUVyV1pVamd5eXVMd2VwckdtK1ZkWExo?=
 =?utf-8?B?dnA4M0tndmRTYTZmdjRlQTJPZXd5NXZuNjhmWUVqTjF4bGdmd1lOZ1JVQ2Q3?=
 =?utf-8?B?WVNZdlRVZ3JuMVpOQjAvejREcWxSVHk0RVFmYW5VZk5iNHU1TUY5Q1RpeDJ5?=
 =?utf-8?B?dXpuVlB1bW9kMzV1TC9hN0RxYTFhcmhaUzUrcEQ1QU9VZm5heVdhNytqUHd0?=
 =?utf-8?B?T0ZjWjl1Z00xQ1hnU3VBY3R5TmtrU09qSHdMemJBQVFrU25hcStPcVM3VFVx?=
 =?utf-8?B?NTNmdG05Qm9qZ2pGYmdmekw5VE0wVkd1Rjc0Q2NBQ045aGJhRXJhTVBDamZD?=
 =?utf-8?B?VUZGS0hGK3VzYkZEVUJWTHFDZjF3SXA5Ync5USt6dWt3RUtNODkwbTQ1Skgw?=
 =?utf-8?B?VGlLczZaSlJOS1BEOWh3MTR3VXlRSGRVZHROWUVhbC96ZjRQRVVQL25DQVA2?=
 =?utf-8?B?NEVTRlR6QWV2NVA5VmR3Q1RGSFR1eE13RVdJeVl5MVVKdGkyVXIzV1RFeFZO?=
 =?utf-8?B?NEdPWVgxbHhkWlFRSzdYMUxnM1dCSEg5VU4zU3NwUXBhbU96bE9EL1N1VUR5?=
 =?utf-8?B?NGUyV2Z2SDY2MjVaRVA3NW40d2lJVXJvL2xWbWJrWG5OMkxYeE12N3U0YkMx?=
 =?utf-8?B?dDJmd1hQcmZjN0RITnpRUUFXZElyTEVwWURhdCthTHRHM3VaWFdHc2hKOVhX?=
 =?utf-8?B?d24wUTJvZGtyYldacHRtNkZHMHRwazQ0YStTMFdCOGYyLzI1V1VJMWFLZW5h?=
 =?utf-8?B?T3Z5Q21kWVgxYldENGg5WmV6aEhQUWoxaEdIdHl5Vnl1dnVnc2tQZ1hWN3dZ?=
 =?utf-8?B?NjcvZ1BSRHB6MlFlTDhRZnVFR2o5V2dSRDBINVRmY0x1MUNXT2xPUHBYYnI4?=
 =?utf-8?B?dkdKUkxVYlIzTXA0QSsrUjF5YjVVUWsvc3Z2a04zTVBydE1SRDVlN3dyL294?=
 =?utf-8?B?eFVDbVFaSGtoUXdBSE9ZNU5VNTB5ZC9QdFQ4MC90ZzJSVjdDWUgrKzRxbTBI?=
 =?utf-8?B?TitJRzlWKy9Ed2pPd1VBZDdnYzJNK3VQY0loOFViL1ozcTAzUkhLWTkwVFlR?=
 =?utf-8?B?VXZWaFJVWGJ3TXhpb1pPZ1ViZXRYa1l5ZW8wTTBTNHVLNXExKy8vN1JoMjEw?=
 =?utf-8?B?eVdLbC85V2lNRk16aksvSGVJV09PMGI2NFpEcUo3T2FPNXoyY2ZyTHVaRENI?=
 =?utf-8?B?aVNINW5odnlJQXowcWRVeEFnT0NSYXlYVnRZYmNxdXhvMU9KZlM0NmdVcmV3?=
 =?utf-8?B?RGJhaWFMSlhUMFpqblU5QUFMVnJPSUJiMGx0NzEzSHRlajFwUnc1cnVwRlRS?=
 =?utf-8?B?OEY3azVuSlZyQkk0R1ppVGdKS3Z5OVZIYU5TRVN1eEZkejhGK3QrOExZS1d3?=
 =?utf-8?Q?gUYCXSvA0wjxAnXFGvcYgJSgy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bfabec-f9c7-4a8a-e4c2-08dba962379a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 14:05:50.9332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArmkAR8rIsCqMCnEZprkVwnm/x4q7WMHRLT/I0x53EUNMSZLvGQ4P8/XsIqFjr9bqELORcIcKp35zWA+bdxUhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7979

On 28.08.2023 19:56, Stewart Hildebrand wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -413,6 +413,18 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static uint32_t cf_check status_read(const struct pci_dev *pdev,
> +                                     unsigned int reg, void *data)
> +{
> +    struct vpci_header *header = data;
> +    uint32_t status = pci_conf_read16(pdev->sbdf, reg);
> +
> +    if ( header->mask_cap_list )
> +        status &= ~PCI_STATUS_CAP_LIST;
> +
> +    return status;
> +}

Imo we also cannot validly pass through any of the reserved bits. Doing so
is an option only once we know what purpose they might gain. (In this
context I notice our set of PCI_STATUS_* constants isn't quite up-to-date.)

> @@ -544,6 +556,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    rc = vpci_add_rw1c_register(pdev->vpci, status_read, vpci_hw_write16,
> +                                PCI_STATUS, 2, header, 0xF900);

Rather than a literal number, imo this wants to be an OR of the respective
PCI_STATUS_* constants (which, if you like, could of course be consolidated
into a new PCI_STATUS_RW1C_MASK, to help readability).

> @@ -167,6 +174,7 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      r->size = size;
>      r->offset = offset;
>      r->private = data;
> +    r->rw1c_mask = rw1c_mask;

To avoid surprises with ...

> @@ -424,6 +443,7 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>          uint32_t val;
>  
>          val = r->read(pdev, r->offset, r->private);
> +        val &= ~r->rw1c_mask;
>          data = merge_result(val, data, size, offset);

... the user of this field, should you either assert that no bits beyond
the field size are set, or simply mask to the respective number of bits?

Jan

