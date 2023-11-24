Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16D7F6EAE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640253.998247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rll-0002oS-NW; Fri, 24 Nov 2023 08:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640253.998247; Fri, 24 Nov 2023 08:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rll-0002lA-K7; Fri, 24 Nov 2023 08:42:37 +0000
Received: by outflank-mailman (input) for mailman id 640253;
 Fri, 24 Nov 2023 08:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rlk-0001P4-Ad
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:42:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 698fbf3f-8aa5-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:42:34 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8326.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:42:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:42:05 +0000
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
X-Inumbo-ID: 698fbf3f-8aa5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3wrR/bDLnky3EOUA77rTXfrDiSqhMRFMbFUci0HfjhV1jwdqC+Lylq4W7Zainyz/OjIboD+Gc5f9qYhjPVkB8/cOqL410oOCYhJXj41IurNXiXW6f4u9zAqkBsXpbS/BHZuILBvCt3GmsaxABVsZilxi2pbxNITg6HV0TS24dlArOZrArUSNB0b8DG33eD7Px2wm0NLQr05qWWXKYsfD8OcHMq0mGrDaJLqieNsVAGXVYvOyfn8yZRBA/uxE9TbAWGaFngz2Dz851yFdp3lszOZFcfPrb297N5u5i6ukyhYAOn7nvhX4EtdY0Cjki66d8FgmvNDlK6uYoTIlt7ocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftYnRUJLQ++Ykn0kaSep7/l0Wu+v0Hyt+dMv3J4zgKE=;
 b=TLrT3PGXvas2bIemW1+MkwTWLzMIrlMhTMqZDCmeg8FXBuQ1aMvNVsT2igyOHbQvzMIomApyjFD01/+rMiE4G0h7V2c+1DAsY32t3Hd/+wDuxO/kuF02dgk54Hs5OH1zJqELUok2tPAnGEv1dTBLMFLOywtJCvd3Gk6bLMmud5ssquWyDKyo1Xqsw/lDAx9sBD3b+TCKeC70lPbgYUmCK91n0vxmB9iJhFoOKqbp3W6BeYgLMpulcs+87CImo2ia8HtP6L4o0AdorgLnhqAmxWoMPU4HPeVgLTe+aN7bl0oNZS2rsSkeyAckZRR0W4H3NszPoRBvjh7aq426KLqGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftYnRUJLQ++Ykn0kaSep7/l0Wu+v0Hyt+dMv3J4zgKE=;
 b=fYXJKgvjbnMA18a+BgYq3E/kv2N090emwNU8dVl2Gl+gVRaH1LsoGg5rjOXrtrXbM8VrFbP1a9+NYWdWwN3DKxnbTORNxQxOMx4YIRsnW4AyHIBNKEUyb8hf2d/HWQysDia3ZB4DIsX4zJ9DjNeGpPFOUru3y2BXYw88if/cGrNdtHphSEJRsXUCXb08P73S2JxjKtaO9kxa85Ng4D37PbZjrh9rKS0SwSAlfMyX3IAZHi9/Kks7TdfdYR8nLb64oaIwCNLd4yDqE2LzRpIzabpwMukB6b70e5NbB7Qdi2Kxnowv30RxRrZGymzilX6bF7ZmcxKlAmbIxXdfW8GkyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <192d3c2d-6eb7-40e9-9eb0-484e57dd44bf@suse.com>
Date: Fri, 24 Nov 2023 09:42:04 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 11/15] VMX: convert vmx_secondary_exec_control
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9b1755-4a9e-4a04-57bd-08dbecc93ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GikPFv6qslVS+jFBMLPghVcxpjtgzDUrk04XK1hXb6vK2h6zs/YFMmGqTFLbXY+o6MmaPSB0AF2SoYjmHonhtweVRZ9Z7g8l+h3UnhK5iIqUQKU+B/XFV0nL5ygmRxTESJ+xsT4Mq4tealgOVtdDMOZqYQmuL8jChmHPuga3nLfCkfjxer8WK8mngEHiJFsq2DHCQ40N1AtUaRxAUmqiU9GxCcJM8iDrh6bw73qtOBwu7OrAl7YzrevKjXjOm0BnFc6MoOetnngBgyreSyl4Ztk/yjdHIvSGiJe3m/RpMDYuTCn5xvww424q1wwTH1onrrxm7WQejthxInLlnTWGSErtPa6gR0rN45fFwr8/dg+z/LuMRob3d2pnq/F2HsafAdAyflk15JhuydUc1cWIelD9u/I+JisLw1MpNDAFIjZFbEEj3EfGxtrKtXs1UAxd3jqbqkS2CusykkoFB8sSHAgbOkvvU5ySP4ws1UAsX5mZpimorV8pb5lYLQOHmQJ/Lflsu+mD5wUznibe0Y4ptdEB0QtZd6JRCOq2gW5RK8IJigBFbDdgVt5vwTqeQ26qFFCXD01TVDeNlZdJJA+62nPPRUfdCV0cZJTHGZi1bHq0DZSbAK+bl49WCjGp3NA7XN/wYQB+PIoF6uMHlZyPVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(66946007)(6916009)(66476007)(66556008)(54906003)(38100700002)(36756003)(31696002)(86362001)(6486002)(83380400001)(2616005)(6512007)(6506007)(478600001)(4326008)(2906002)(316002)(8676002)(8936002)(5660300002)(41300700001)(30864003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clVxdHloKzNoWlVIVDVLZ2VNVnhhZmF0MHcvdmtVaStZNHZtVHUrNUU0QUN4?=
 =?utf-8?B?QkRFbFcvNkljU2kwVCt2Q2JQeks2WHhlREsrUzB2VGQ2ZkpmaUx3VjZobmNa?=
 =?utf-8?B?Y3loSjYrcjNya3d1V0gwNDUwemg4YW1LWWRuZ2I2aEp4YmFPYVBkelZMR0RQ?=
 =?utf-8?B?MG8raSsyN0cwbEROd01XUk1ONUVWeU1FODBpS3FucTNZd1UxWFhQR3hpR3FM?=
 =?utf-8?B?MmJ6dFpZR2tQbEZRSnZCRC91Um52aWs5dGZvUEpMZWtkV1ErV2ZpU2dERkxo?=
 =?utf-8?B?ZkpESlpXc0h6UTBHeVU0M1ZpbjBueXYvVmhneWdiL2g2RzBzMUhITGNzK2pl?=
 =?utf-8?B?VFJPbDZHaWNCRWNzR3dYWE9Ba2wrOUc2bGRkMXhCTDh2VXFIWFZZTkhkbHV5?=
 =?utf-8?B?cmVheFRYQ2wyNjdZSkg1RFNlSVlvZTd2V2RDNmJibkxWeEpSclV0MDVRczZU?=
 =?utf-8?B?Z0pLK2dudmxNdzFRUGNCdFBub2Q1RXIveEdPRWt3cEI4WFpKa0p4Q2w0MnEw?=
 =?utf-8?B?cVViazVDbllpYXhuUmMwWkxHNHRQZFFQZHkxeFdOZzJWRjNXTHVmMENTVVNr?=
 =?utf-8?B?Y3VzRENTc2Y4ZGRkWGoyYi91aVg1aHJjYldYa3FkU3FRd0ZKb0lkTjNUNXRu?=
 =?utf-8?B?cVRGbWtXTEFLR0JLbExibk55L0pLN2VPbjNQNDlWbk9WL0VZaXJvR1VBQ0RM?=
 =?utf-8?B?dTdxSTFFR052WjJ1SWtGSEcwQjd5T0Nyb0NpZ2JYMXNzUVZRUnJ4L2FxYjlz?=
 =?utf-8?B?TlRTTE16blhzbTN4djdKUmxtTVZuYjVtZmJTRkU2RHY0UmFEalRScXptNnFF?=
 =?utf-8?B?dGpHWCtiRzVwSzBGd2VwcmkxN3ZqWUlEbTZMVExuaS92Rk5IbWZUdEQ5RHF6?=
 =?utf-8?B?UGdSWFRHdm1Fd3JwSXVkaHlFTHNkT2xPdkRoK0Ira2U2V2JaWU4ya2VzUzFZ?=
 =?utf-8?B?dlNWNklvQ3lMUDVqTVIxNkhWY1EwL25JVjA2cmhYUlhDY3ExV1ROUmp0RG8v?=
 =?utf-8?B?a2ZUV1haUEJVR1h1S2lkd1NqQXl3ZC91eGRBMCt1enl2Z1FoQytydVpFL0NH?=
 =?utf-8?B?dkRkNDNXYTJ4U25rSm14RFcvNjJLWUw5a1BRR3BtaDJWVDY5U1pPZ2s1RXFa?=
 =?utf-8?B?VVcyNjMrVWNCNndobmZ5UHdvY2JFY3h2bDNzREw5R1NYdlBSdm1QR1kwREty?=
 =?utf-8?B?RnYvZlppTHNYQTZhcWU3dzA0eEVBUVZTckdIRHY4bnV3WU0zWndWMnBIUjFh?=
 =?utf-8?B?TW1nZnVHbTNEM3o4bkd3MjdrT3BJY05MWlhudzFkZUMzTE5VMGV1dGFvQWRZ?=
 =?utf-8?B?Nmp3Q3VET0ZkWG5pcDZXcGtqdjdvRVljZFQ0aUZkc1JqTTJHcGVLMU5uNmxD?=
 =?utf-8?B?bjZEMXRhbG1nRndMb1dmOVI5c09UTDMwb2dXbFRSOWJ5Y1lJbGYveU5zcGl6?=
 =?utf-8?B?WFhNczNTRzgwcG9YWEZJY2ZpSEVYcHhCQzFNRGdUcnJGcm13alZiYjR3TlJD?=
 =?utf-8?B?ZVA4M1ZRa3BiNnJua3MyWXFXYi9ueDF2eVhMNUNOcEs0YlpnSFlGY3dZY3ZL?=
 =?utf-8?B?NGRWUUZKQmdyZ0NoZ1IyRTJEbnBCR3pJUG1xaFExUEprbXUvRStGL2c2Sk11?=
 =?utf-8?B?dDVDeUh0a3VjN3NYeXdVSldYU1IvSEFZTmNUNFU4VVEzaFB5ZlVDMzd2N1dr?=
 =?utf-8?B?TjQ2V2Zia2Nkd2xlQVoyc2c3Kzd5blJJWm1POGY0UmlVY3hzNU9TSWdISnNR?=
 =?utf-8?B?Mlh3VzFLQjllU1VLTnlIWHkxMkp5SFVmeGludXN6Zml6QktwMUg2YUpWRTVW?=
 =?utf-8?B?TTN6TUpIc2pkRnhPeXdhYVd1M0lHTHN5bVFORWJTa1VTSERuWHpsTTl4TVN6?=
 =?utf-8?B?WDFISEM0MWdUT3gvZTk0TG9BeUtHNnMwU1VCb3F0Umtjd0xIblE3ckI2dEVj?=
 =?utf-8?B?dmhkRjhIeEQrR25JRU9jTWNXSHdUZmtxZmZoeEFDSEpPTTUxdmR2YUFUdHF5?=
 =?utf-8?B?QllWbkpoRkhwMHNhNzhURDJPKzM0UVFibmhQVlZ0a3RXTHc5MXM5OE82Zm5y?=
 =?utf-8?B?czY1ZU9URFBEaWhJa012N2tKeE1qSGx2ZlExck5SLzZ1STNkR3lVUWh2TjBP?=
 =?utf-8?Q?a9i8UnL3V0XVKwuSN4J+YWIFK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9b1755-4a9e-4a04-57bd-08dbecc93ca4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:42:05.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrGVoOXikATh2TPxIcOekp98jSbjVDvECte5YRcLIcnCXYmjQ784L4v6sHOqJB3E+28VyKpTfGS/BzgEd7C1YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8326

... to a field in the capability/controls struct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_secondary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
@@ -237,7 +236,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps;
-    u32 _vmx_secondary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
     u32 _vmx_vmexit_control;
@@ -330,13 +328,13 @@ static int vmx_init_vmcs_config(bool bsp
                    SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY |
                    SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
 
-        _vmx_secondary_exec_control = adjust_vmx_controls(
+        caps.secondary_exec_control = adjust_vmx_controls(
             "Secondary Exec Control", min, opt,
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
 
     /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
-    if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
+    if ( caps.secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
     {
         rdmsrl(MSR_IA32_VMX_EPT_VPID_CAP, _vmx_ept_vpid_cap);
@@ -358,7 +356,7 @@ static int vmx_init_vmcs_config(bool bsp
         if ( !(_vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_WB) ||
              !(_vmx_ept_vpid_cap & VMX_EPT_WALK_LENGTH_4_SUPPORTED) ||
              !(_vmx_ept_vpid_cap & VMX_EPT_INVEPT_ALL_CONTEXT) )
-            _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_EPT;
+            caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_EPT;
 
         /*
          * the CPU must support INVVPID all context invalidation, because we
@@ -367,14 +365,14 @@ static int vmx_init_vmcs_config(bool bsp
          * Or we just don't use VPID.
          */
         if ( !(_vmx_ept_vpid_cap & VMX_VPID_INVVPID_ALL_CONTEXT) )
-            _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VPID;
+            caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VPID;
 
         /* EPT A/D bits is required for PML */
         if ( !(_vmx_ept_vpid_cap & VMX_EPT_AD_BIT) )
-            _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
+            caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
     }
 
-    if ( _vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT )
+    if ( caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT )
     {
         /*
          * To use EPT we expect to be able to clear certain intercepts.
@@ -387,25 +385,25 @@ static int vmx_init_vmcs_config(bool bsp
         if ( must_be_one & (CPU_BASED_INVLPG_EXITING |
                             CPU_BASED_CR3_LOAD_EXITING |
                             CPU_BASED_CR3_STORE_EXITING) )
-            _vmx_secondary_exec_control &=
+            caps.secondary_exec_control &=
                 ~(SECONDARY_EXEC_ENABLE_EPT |
                   SECONDARY_EXEC_UNRESTRICTED_GUEST);
     }
 
     /* PML cannot be supported if EPT is not used */
-    if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT) )
-        _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
+    if ( !(caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT) )
+        caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
 
     /* Turn off opt_ept_pml if PML feature is not present. */
-    if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML) )
+    if ( !(caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML) )
         opt_ept_pml = false;
 
-    if ( (_vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING) &&
+    if ( (caps.secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING) &&
           ple_gap == 0 )
     {
         if ( !vmx_caps.pin_based_exec_control )
             printk(XENLOG_INFO "Disable Pause-Loop Exiting.\n");
-        _vmx_secondary_exec_control &= ~ SECONDARY_EXEC_PAUSE_LOOP_EXITING;
+        caps.secondary_exec_control &= ~ SECONDARY_EXEC_PAUSE_LOOP_EXITING;
     }
 
     min = VM_EXIT_ACK_INTR_ON_EXIT;
@@ -420,7 +418,7 @@ static int vmx_init_vmcs_config(bool bsp
      * delivery" and "acknowledge interrupt on exit" is set. For the latter
      * is a minimal requirement, only check the former, which is optional.
      */
-    if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY) )
+    if ( !(caps.secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY) )
         caps.pin_based_exec_control &= ~PIN_BASED_POSTED_INTERRUPT;
 
     if ( iommu_intpost &&
@@ -432,7 +430,7 @@ static int vmx_init_vmcs_config(bool bsp
     }
 
     /* The IA32_VMX_VMFUNC MSR exists only when VMFUNC is available */
-    if ( _vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS )
+    if ( caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS )
     {
         rdmsrl(MSR_IA32_VMX_VMFUNC, _vmx_vmfunc);
 
@@ -442,12 +440,12 @@ static int vmx_init_vmcs_config(bool bsp
          * Or we just don't use VMFUNC.
          */
         if ( !(_vmx_vmfunc & VMX_VMFUNC_EPTP_SWITCHING) )
-            _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
+            caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
     }
 
     /* Virtualization exceptions are only enabled if VMFUNC is enabled */
-    if ( !(_vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS) )
-        _vmx_secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
+    if ( !(caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS) )
+        caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
 
     min = 0;
     opt = (VM_ENTRY_LOAD_GUEST_PAT | VM_ENTRY_LOAD_GUEST_EFER |
@@ -462,7 +460,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_secondary_exec_control = _vmx_secondary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
@@ -496,7 +493,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.cpu_based_exec_control, caps.cpu_based_exec_control);
         mismatch |= cap_check(
             "Secondary Exec Control",
-            vmx_secondary_exec_control, _vmx_secondary_exec_control);
+            vmx_caps.secondary_exec_control, caps.secondary_exec_control);
         mismatch |= cap_check(
             "VMExit Control",
             vmx_vmexit_control, _vmx_vmexit_control);
@@ -1074,7 +1071,7 @@ static int construct_vmcs(struct vcpu *v
     if ( d->arch.vtsc && !cpu_has_vmx_tsc_scaling )
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
-    v->arch.hvm.vmx.secondary_exec_control = vmx_secondary_exec_control;
+    v->arch.hvm.vmx.secondary_exec_control = vmx_caps.secondary_exec_control;
 
     /*
      * Disable features which we don't want active by default:
@@ -2166,7 +2163,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_secondary_exec_control = 0;
         vmx_vmexit_control         = 0;
         vmx_vmentry_control        = 0;
         vmx_ept_vpid_cap           = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -256,7 +256,6 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000U
 #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000U
 #define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
-extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
@@ -286,13 +285,14 @@ struct vmx_caps {
     uint64_t basic_msr;
     uint32_t pin_based_exec_control;
     uint32_t cpu_based_exec_control;
+    uint32_t secondary_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 
 #define cpu_has_wbinvd_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
 #define cpu_has_vmx_virtualize_apic_accesses \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
 #define cpu_has_vmx_tpr_shadow \
     (vmx_caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
 #define cpu_has_vmx_vnmi \
@@ -302,13 +302,13 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_secondary_exec_control \
     (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
 #define cpu_has_vmx_ept \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING)
 #define cpu_has_vmx_rdtscp \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
 #define cpu_has_vmx_vpid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
     (vmx_caps.cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
 #define cpu_has_vmx_pat \
@@ -316,41 +316,41 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_efer \
     (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
 #define cpu_has_vmx_unrestricted_guest \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define vmx_unrestricted_guest(v)               \
     ((v)->arch.hvm.vmx.secondary_exec_control & \
      SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define cpu_has_vmx_ple \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
 #define cpu_has_vmx_invpcid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
 #define cpu_has_vmx_apic_reg_virt \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
 #define cpu_has_vmx_virtual_intr_delivery \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
 #define cpu_has_vmx_virtualize_x2apic_mode \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
 #define cpu_has_vmx_posted_intr_processing \
     (vmx_caps.pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
 #define cpu_has_vmx_vmcs_shadowing \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
 #define cpu_has_vmx_vmfunc \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
 #define cpu_has_vmx_virt_exceptions \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
 #define cpu_has_vmx_pml \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
     ((vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
      (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
 #define cpu_has_vmx_bus_lock_detection \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 #define cpu_has_vmx_notify_vm_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+    (vmx_caps.secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
 
 #define VMCS_RID_TYPE_MASK              0x80000000U
 


