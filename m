Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC35769935
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 16:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573103.897481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQThA-0001VT-RN; Mon, 31 Jul 2023 14:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573103.897481; Mon, 31 Jul 2023 14:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQThA-0001T4-Ob; Mon, 31 Jul 2023 14:16:24 +0000
Received: by outflank-mailman (input) for mailman id 573103;
 Mon, 31 Jul 2023 14:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQTh9-0001Sy-FC
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 14:16:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d19de2fd-2fac-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 16:16:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8859.eurprd04.prod.outlook.com (2603:10a6:20b:40a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 14:16:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 14:16:17 +0000
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
X-Inumbo-ID: d19de2fd-2fac-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNF1YZxS0VYvdN0ByNpcQ6NHufpW08bo+J0BlsQkXqtw/gAOkmti9gTs13uoVUjGLdKPX8nElpB08/SGo3bijXS1/WctK2oBMa2Nwt2IZBTsgZXdXXCZxQhfpnITcmvBg4xjkneN9BFCqGfJC07oJY9cqmH6R7VDupGsLqQdOcCrtDJGFbtkDLXGYRzTqQbVUg+jWNIiho/xtSJw8YenhZxZDKTbUSRMHEdrWwdk8NUdox/CAzZZgPQZk4yu/N/6rC/oJdBPOw38OxEc5nqugfeXuzovO91WlIFi+6FtzYbrn0fKZ4Wr/7thWVhMnd/fIZ6HGiu0qI2zV/bGyaV77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2nqBMasysDSGbivjSfZQvRhH6HyTeLAFSMh/oEQi1M=;
 b=V98+lINXIMEgpYGRkwCphfhbuonohW/3EOPF+hzoFxEFrXF83JRfIClZUFmk9H2dMtjkz31fmBMvV851CpONh3QSFKbZqLVv0nTq5eh8Atq4DxWFAYnAPhwwF/5YTsj03CqGFH3HcSLhl9DT38IgqWq2B51wZxz82dGLy0eRFtT5oqGCwDqIrGK9o2Kqr/mhePnK2lH+ja13O9r5EMjokA67sU9ledULnF+M+RCM5lmhFgBYk/h87CnytEGD4xvb+OsjprdHFA8H3gTc+gm2Bd4UZt1I9xlIoob62IhjzxCTnWA5EGPrZDo2xP5cMqEGdo88NbHLr2X1IWUccunJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2nqBMasysDSGbivjSfZQvRhH6HyTeLAFSMh/oEQi1M=;
 b=riPJ1tQfxGNoef5dkGF33UW9yh/7v3tf7YxlxPn2Sh9A9yvA6gVIumGn2V59Db4h7OOulPY3a6kFUlha9SgmP2xC4RobG291NvQNVf+E1B6r5/MZf51DwdD0GbrYbuoD4KKyT1XOc12AcJVpXQ9/1oKbQELuy+pYQB0rS8kYyO2zYTP0R1OKyiCNcM4V1ux087EDQHINO9cHAGfjT0r0HCuJ6MoqecJIgZAGaCQr23aAhD91cZtFUqWpE6z2bX4CFd0MpKzc3jOskfDiBMopfPX0NnVQWEkIAS5wFRy7khDACGdq1vKIR4NsL3KrN9T2az2eMkT/TBYGhZJ1yDnm1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dce3d16f-7bc5-a22d-3872-36d3a617c120@suse.com>
Date: Mon, 31 Jul 2023 16:16:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 1/4] xen/pci: rename local variable to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
 <c9c6dd21ec6e88895ebc15ee6fe96090168afb51.1690810346.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c9c6dd21ec6e88895ebc15ee6fe96090168afb51.1690810346.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 52670da6-4ed2-4bb3-8460-08db91d0b455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nBr2DTlWzYKLlU77I6tku8KKrWYPDSLceLNaJEoNkvd9ui0Ft5960d/iI3BVWoxV/xi8Y5HjUD2pjEeorTZPSibQfuHrxZDJIIRKqh6er8PymK87H5k8nWewulTqAeXzJdvrZmquvOhkH55M/txGJSJrFfCW1p6YAYdtzjXKTtGgP5ZJa/TAoPPaXAbSss/lGtVMJggeH+M+Wp0XtFH1FHt+DqWvx8mbVb/8a33DjhaVvRNygKV/PBHuWd+JOFFu65t2t7WTtsyRRJch8reXOd6O6jE8BuRFz6RHHHO3sep/542p+DdamxZM6sjeg+vcB7LHcL6moB34v1wnaqfUqJUU5tsI8oMdEnG2lPPBiF+IdZYELcXns1/18ehKROEOw7I1tsY6a66pyOwjPlHYQ/G4+Z6ERFVf2Z8iMbx0QToqrN9ik6oRObSJssv2SzGVdOSL6ZZiE4p71g2b6BVDls1KJDzUHUpLM9Vr9u93WYPRMUERBRSSqd4TBJ0JBPv2li0V6VQ4zGYxgSDT0oEJwjW07nP9JiaApvN4HdMGp2JHAb732H45pARY7poRX5+piwuO+5aoI9Mm8GsQ2SSumHfQTqvBAa9pycapnwx3zzzd6JNuNq3r2S8h14JsM31fdOcskJOxIl7r1EEhQMh8Vw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(6512007)(6486002)(186003)(36756003)(2616005)(31696002)(86362001)(38100700002)(26005)(6506007)(53546011)(5660300002)(41300700001)(8936002)(8676002)(31686004)(6916009)(66946007)(66556008)(66476007)(2906002)(4744005)(316002)(478600001)(54906003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE92UUdhRmMvN283SWNUblJscndGK3FGNDdkekdsZllBenBhR1M4K0NwWDNR?=
 =?utf-8?B?ek1SVmZVcG5NeE54c2ZVUzM3alo4TENJc0ZDb3p6RU5KcUtNM0FobVhIellm?=
 =?utf-8?B?MCtOZDh3dmhyTkdUSHphdTkxU3NLazdIZS84U1VUZlF0VUNrSlZlUVR5VGVY?=
 =?utf-8?B?RUJjRE84Nlk3WW83YTBKVHJud3h5bWU2YzFDdjlySE5kT01lYTJmMi81RU53?=
 =?utf-8?B?VVFJaExVS1FmbThLOW0xdVE0dWVRU0hmSVB4c28wZzhvellRZE12VDNkYmR6?=
 =?utf-8?B?VmZKZ1pjZmZUS2dQelVQZUF3M2xzT3JDUEVzckRtbitTTXFEcnd3TGY5OWF4?=
 =?utf-8?B?MVBVeGxqbytRZWhkNjN4a3p2QnhyQTY3dlR2UVVXS3NITnF2STVZQ0JmazJH?=
 =?utf-8?B?UUdGZHNrRHNSaGlmdnh2c0NxNTQvckJHb2hkb01YallhblExbkpCTThxOEJN?=
 =?utf-8?B?ZU9rdkQrTFVMQjRaU3B3VWVsU3J0cEpBNGtLK0x3NWo3V21weGpoaUpjUDBs?=
 =?utf-8?B?bE9LVU5CRFlRMmFaNkd5U2xrMEFVbFMrMERFOFVqNEdSZk52RUhaQXJDSWRr?=
 =?utf-8?B?K0x5RGZFaGxUVldYMEw5K3c3VS8zQ2tRa0M4VEd3UG5PNXVJY1lDRkM2N1Rx?=
 =?utf-8?B?OW9iTFhGNytWZWYrd08rcTZLKzkzenF2d2lIdmlYOGJvQmcyYkJibmtkSkJk?=
 =?utf-8?B?TTg0ZVdoV1JRc01NNCsxdHRDM21oaFdndzVaNTBCdHJhSzJjdElUTFJOMzZP?=
 =?utf-8?B?dEdrVTVQSGtmWWRYWHpDOC94clE5dEJQaDFFazVEc2tMVU50TEhYeDhoVC95?=
 =?utf-8?B?ZE5QcDl4MnpidHBFSytVak1nbE1ENll5dUozZmp0aUJ2ejBPczFYTENSbVRP?=
 =?utf-8?B?OEJnOGtRd0p6TDR5cFFKV2l2RU5xbmRFSElsSVRzTXFZd3NZcmhyT0k1ZFpo?=
 =?utf-8?B?UVJuZDRMeWI1TTRxQTlqQ1ZmQ09iem5lMlo3YmNkNURKUHBHYkpkYmZlcDBC?=
 =?utf-8?B?Z3dOVWJ1cXV6QjFoczVLenNqUUQ5ckQzZXJyRHlrUDNZaEFCWHFoN010R2ZT?=
 =?utf-8?B?Z1VtRlVUWmJvaUtsaWpTMjY3NEFhYnpDeWZiZGtoQmtnRG9jZ1lTbkI4REdp?=
 =?utf-8?B?Zy9OUW9QRitPMVYvRXlaYndIWFJVeW5BV3pLTXd2Rmc4b2lkcDN2bUE5UTVT?=
 =?utf-8?B?bnhYcXo5QTV1aUpJUDZJeGk3K0xnWlptaFpqTFdSYTBSeDJHL3doUUNiVGtv?=
 =?utf-8?B?NWYxVGRNd2dlU0ZvUENic1VnUlNySHpJSE9sR3JUS3NPT0R2ZHd0UnBWVzRK?=
 =?utf-8?B?cFAySndvZ0h3ZzFCbGUybmRacWlZanZqQlBCYkFzZ0VlVUJwUDY3Z3piakJK?=
 =?utf-8?B?SmcyYXYwdWM0SVYyTm9rbHpvS1F2UHkzY0lvNzJZcWc2WHJ3bVM0SjAzN1ds?=
 =?utf-8?B?QjNuV0x5SFRaMEIwWmEzdHp3OTlvaXVnTmFpVHA1dnRzRVUzYmxZWm1jOXVu?=
 =?utf-8?B?Y1Nybml1MDZyckdBTmpqVDk3SGYzbGdkSDV0cVdzZGRjd2l3ekxkOURCOTJD?=
 =?utf-8?B?VU51M0E4Z1hUUzJPK1VRVmhCc1BlZG5PeEsrS0NHcFRNTXhCNVlmNk5pZVF4?=
 =?utf-8?B?aWNON21FN2g1WG9kTE5CYUM5aXdnS1lqK1hUQkFOSzNxYTYxTWVqSXZWSEtC?=
 =?utf-8?B?cnF3R01OY0RPUXFUaTBXRlpyTk16aVBwLzJjZXRMZ3o2Tm5SK3FoNXhKWThn?=
 =?utf-8?B?eFRsQnIzM0NrR2g4eXEzaGxCdzB0bjdVc3ZyRU5sSXh4T0tSeGphN05oUHQv?=
 =?utf-8?B?SEt3cHhKZGt4b2huQnROUU5XRjgySWpkYXkyelZ0WHRwK2dBL1lvVnliRXJT?=
 =?utf-8?B?QmVQcWF6czkyQmFad2ZnbUg3ZS96UXkxV3VsdWdRZG9VYm90WW9lYzN6Ym5h?=
 =?utf-8?B?NWlVVVo2Wld4MVZPdFFjWmE1Vk9hOHdWSUd6eE1RK2VWazZ5ek1IelVqdndB?=
 =?utf-8?B?UjNmR3VtR0pjU1ZPL3dzZGFQTTBtUThoK0cvNkhla0x6VHVRTDJET3NrL1Yv?=
 =?utf-8?B?SzdCZDROeWxsNEpMeFMydHp2bFRWM21DQ3lVZElYWE40Sm43b3hMTExYaW1G?=
 =?utf-8?Q?3+/4xEMoYGhG2SSQOEavDL0im?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52670da6-4ed2-4bb3-8460-08db91d0b455
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:16:16.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3N1hBhAsuHeMmYD0s9Jg5VpSKJoqwuWAbLjyXfXqpwB6gy9VSravXe8YtVlnKzcHIsyfDmVntwg+dzIDaXXgCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8859

On 31.07.2023 15:34, Nicola Vetrini wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -650,12 +650,12 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      struct pci_seg *pseg;
>      struct pci_dev *pdev;
>      unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
> -    const char *pdev_type;
> +    const char *pci_dev_type;

I've always been wondering what purpose the pdev_ prefix served here.
There's no other "type" variable in the function, so why make the name
longer? (I'm okay to adjust on commit, provided you agree.)

Jan

