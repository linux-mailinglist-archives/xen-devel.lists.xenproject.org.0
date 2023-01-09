Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F459662B12
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473858.734683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuut-00075w-FL; Mon, 09 Jan 2023 16:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473858.734683; Mon, 09 Jan 2023 16:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuut-000740-Bu; Mon, 09 Jan 2023 16:22:31 +0000
Received: by outflank-mailman (input) for mailman id 473858;
 Mon, 09 Jan 2023 16:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEuus-00073u-HU
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:22:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf5acc09-9039-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 17:22:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 16:22:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 16:22:27 +0000
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
X-Inumbo-ID: cf5acc09-9039-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MT2kpAYyIb/PIcLodx9f2xKXPnIjq9crKeuRTXuRpSIhNlkQqC1kBuOm0MQHpA0zL1USfCJ1LYmPdov+zP4SaKpy9YojJQcLMpWWKE7ZFNvLQJS5YrJNLuIrpg5/Um0bMHt5Dq2J3XGiWWZLqLmfkF8jcxOfhUpDGfu/SkMdOvvG0/HmkdzzBtveCxQDaFDZkNQe+hsLXtLUrKsd2gPF01ueXQUMQHM/2TYfKwdhkCYSJOKqPpgb2R89LY4gKbOP9V/wap/a/BdJuM4rdzwVPUnouBp20CNr6aW84So2IRJOMbUsQ2cIq/XkGD0v/kmV1ipk1oV3/alSoS+gxHsirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgBFsUxeRhZbi1wZLbZ5QCUDhhErovrhDaq3a7acFbg=;
 b=URfuJg7BpvKIEp5dN5uKbFQKXAemcDE8iXZONegRu4dpmSeeWFFA/AwF/2O30/zzVWKTqdmZahn1Pr14HfY9PQKt3JuBJS3tl77NGjyNR/sn8qhVm5agoiCrxEuZtypIkp5BZlpuwQaoo58ttLFkhsnMCD/7YD9gJI+5IXHpf0bow3eFuq2vHoIKbrtLKXdyWrjHqoxYqyfHgCImatNkE8NI8QIuX6r4pvwRctk4yyoNyVqCAwVDp//EiZZleD1tuc+28jmGWa/Fhr6FMjgpMMAQ+lpv+Rd5SL9S6xn5j5/Z5bFnQ3C2rexPw8dIhqZ8rV48eDxNcKU6cHm76EwF/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgBFsUxeRhZbi1wZLbZ5QCUDhhErovrhDaq3a7acFbg=;
 b=W4PlZbtl7C/DaYSVXQkhCsTKFlr5+dHyjazXnTvg9/RBu1TC10eT/3udjsuQABS7Jov6TVjvT8PIpMyHFG7OLNxYFols7IM1jGX3cRjyPKlemgjHUf+5B1OayVdAc+ta8KyxxMyouaMiEhEajNpH00BcmPt8f6jxTW/H1A4me+97kc7M7iK2ob0IinEBcpCokdV4T0MIlg2YMamaian4ZR0570A3fAAZvZcf1dHHoo3R+nc4nj4ZWt42mp/Bgz6gSAzm0F7PF/O16fes6U5h6AYfcD20yUS8lBASaxvmqNmwJ3PkFDgrhZWg8dqabC1kIEoAyzI+TQyFDguGF6inDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bfbfdc1-e3e8-a634-26b2-eb48c5e1d646@suse.com>
Date: Mon, 9 Jan 2023 17:22:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] xen/riscv: introduce early_printk basic stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
 <527727b2c9e26e6ef7714fe9a3fbe580caf1ae13.1673278109.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <527727b2c9e26e6ef7714fe9a3fbe580caf1ae13.1673278109.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: 176e1609-12cb-4a7e-cb53-08daf25db292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KrnoI/kqUIr3j7d2lUizfM8cRAfi8UyFv4zJnKIo8Fu3Kx3V1EG3yo8btWUe6dxDTJgb58Lourvb3XX5AEYvR/AjRiFfpDiaMJOwIcITVA3ImsodXSLd05e9HMxHCO/oJp+EUOP3KefJ1lgWjvRYA9+He8XiQc9CRlh7txxnfOJY2et0HvQI0W+wKI39P5XQcHYTSXLfi1I6MTpk4oZVwg77HB2vo/Z3vfxF8ZTNQMTwti0r94u/OZqB7vzgyNWTtltWYoFiex4bLm82bnoJoDNkt29E0l7uTzud8ABfawMwcTiCfnOhK6K5OoXqNlueEnZIWCDnvwoO4cIDu3BzIYvnXx2cRN30g9iMRohyInkjQNBRrnlPNfkltcrg0Ak0t5bGAzjgs2boxJRaRZK7mWC9EBx9ifYFf9zXifRVxSn15FHeLfUpseJJAeN4YVkUQi9rnlpkRIi1TaifOTk7WwZ4355Uj+DORaaQw6nzd35Md6anEn9qexfCPbpIe2AhEQfnfI8Yo2efCeRWioUSM+43MWAiZ+zV2XR4/RbbqLUzCBwbRA7i2UtESi0NiLwVS5uNiyn/f9ixhYZgHsmf+oCP9w+OgFQKKI4TMI1xBIPCC8kOn1KzlhXdKd33/03Dsn30NTPLPl44Szq+pifY9cRg1DwXV00JUaNSRmomk+oUxrpGyILCYWlDuu8avrJyKWG6fZug/+PU59XeTe30EGDTFHr1zKM7Jd4KokgHjBI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199015)(36756003)(53546011)(186003)(8936002)(26005)(6506007)(6512007)(2616005)(54906003)(66946007)(5660300002)(7416002)(66476007)(66556008)(4326008)(6916009)(316002)(86362001)(31696002)(38100700002)(478600001)(41300700001)(6486002)(31686004)(8676002)(558084003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjRXL25QZitDT1ZnQjBKQUdwSDYyOHYzUDIyV0pRaUJBS2RCeFVrVTRmaHF4?=
 =?utf-8?B?U3dvQ2hvM2tOT2lkWnp0QVk3YmFyb1IrVEt0NDRzeW5hMHcxV0ZLaTg3Ymdl?=
 =?utf-8?B?REIyc1NSREd0SFVrY1ZucnZNVHdHVGxnOHp4UUlPZTNYd1dEN3VxcEI2OGxq?=
 =?utf-8?B?Tm5yLzJNSFJTa1hJWlFNVkY3T2pXUWNtaGNMdCsvcUU5Y2dEYU02THdOL0o2?=
 =?utf-8?B?MVhiTCsyMUxidFdrTFY5dk5sK21FeDRBVE1MVFdFSzRiWk1kbXoxWkdnRUNE?=
 =?utf-8?B?TmdGbm03SkJGVmp2YnlvRFIxV0NxZVlwTmdMNElDQTF1ejcyR1doOVVURXAx?=
 =?utf-8?B?eUsvSGcrWlpiV1M5d3h1YzFuSW9vcUppb0VMZVZ5RjJHcmRUSUxlQ2cyckNo?=
 =?utf-8?B?WE4vRm1FclNzZnNMNXhuQ3hvdFVwZ0VBeWh1M1JFRW8yUnNpenlzVk9qUW9U?=
 =?utf-8?B?bGNDdzM0M0lqRUUyN0RmNkVZWk56blBUWmg2OVNkSytMYTZBeWk3N010eVhZ?=
 =?utf-8?B?RXg1VkpFR0ZhcWV4cXFGeDE4YWJoYmFMRlZIaSt4T3ExRzNKak40WDhCZllE?=
 =?utf-8?B?VzRJWWNXczlVRHkzejZrVi8zNXQ5MUtiTVNOejdJS0NrOGNsOWNrMjFaNEhN?=
 =?utf-8?B?WlBicG8zZFl4MCtEbG5lZFBlbXRza2ZWbjY5RDhOeVZGYzB1MVRtVzY4NUx2?=
 =?utf-8?B?SUVmWHNFR0xBS2xjQUtYb0x0K0xjcllPZHpIdThudUFJRTdMR3UzTXhwbkV2?=
 =?utf-8?B?M0ROT2ZscUY2V2xPNlluYjBIUkFNQXhRUkJzU0RldDBPNmFoSkE1M1RhL1JU?=
 =?utf-8?B?YnM5dEd4NG92ZVFBNDlkOTd5VHh6bFAxeEJ1Zk0xRFZtS2M4Nktlb2VTb1d3?=
 =?utf-8?B?UlQvRklmQk52MUZEZjBMZjh3RnZ0Y0g2NytSQmVMRHV6aWl3OXB5dGljU1pu?=
 =?utf-8?B?MXBZbC9hS0d6NUtxYjJKeFpPUFpLRklsdlhvWDhtblNJY3FSUVRsVWR6Sklv?=
 =?utf-8?B?bEtMaHNabktGQ3dhNXJ4QzVBT3N4ZzhsSTE2QU1iRFpsbW9hbUZRQVI0MFBG?=
 =?utf-8?B?Y0ZnMnhmSWFGc0ptMlAyRUgxVk9hWmRWczVvcUNtUFo4c21odzVKL1hOalBS?=
 =?utf-8?B?ejBXeWdDRUJ6WFBtc3hKOHFkZFFtRDZML3ZQSG9RMlFMeUk1SCtKOUNqdllZ?=
 =?utf-8?B?VTlMUUVNQXNza2RzdVZJaVViejc2YlozcnNuMWcvcEFvNHVERHRXbm5vVGlQ?=
 =?utf-8?B?NTV1Mkc1eUxQUVB1Zk5IV1R3SkRNQXlYcElZbTdtSzFvdjVjT2JKUEFqcFMw?=
 =?utf-8?B?ZnhPUkJUa1hjTEgxL1k4bEtMZzZ0c2VkRTRVWVBVZVRTU0FnWjMzSDY4Rzc1?=
 =?utf-8?B?VUlhcTg3RGFBaTJFUDBCM2ZoVStxS2pYT0ZEK0l4ZG5RcnJvRzd1U3Bvd3Vm?=
 =?utf-8?B?VVBMSlVxYi9BVXlaOFcySFR0SDYrT003R2dRRzN1dUk2azZYajMzUjNTWDh2?=
 =?utf-8?B?cHVNUU1jMFR1NXB5THhBNG1jZFdFTXhSbFllUnZ5R0pLNjJDdklveVhMSWpE?=
 =?utf-8?B?VXBPWGJDeVYzN3RIYktPT2xKbFlhdW1IRlAzOXZOZWxUbm5GSU55L3hIQkpq?=
 =?utf-8?B?cWx6ZWEwbWo0UUZQdzlYaHRWTU1tV0NhekdIQXZwZWZGMjBiVStFa2VWbDRY?=
 =?utf-8?B?cGN2SnVFRnU4TkgzTWovWmliMVdjS0tEK1hqNW9sdmVGeUd0dDlOYnUwdG1F?=
 =?utf-8?B?SExSdVhaYWpqWXhubDFMaWd0cnE5ck95U2FCV2tnUmZsSzZNZHFDM09DUzM5?=
 =?utf-8?B?M0hoV2FmYVpqUVpDZ0F6cmU4cFVMbCs3KzdTQTcxS1FHMG1sL0tTRmlndjkr?=
 =?utf-8?B?dTZuMkZuaU10Z0dIRVU3TXpZalVLQUlMdFNnL2srNmt1UXFGZU1VWnJuWDdt?=
 =?utf-8?B?azlBU2x1WlJkN3YxVTJvY1FpcHYvQnFOSjBEU3dVWkRUaFRtcjNUSitNQzRv?=
 =?utf-8?B?YW9tbVBJSnpIdUpqQTRGWHc5OHl4TUNvYm1MUTFmakFUcUUwa2FtMDgwVVZh?=
 =?utf-8?B?Tldvc2MxbkdmRUU3VkZid1RWZ2haNzF6b3N3SC9zTkZrNUxySGZXd082aS9Q?=
 =?utf-8?Q?KvNgpBkwlzzP43U8+EVLrhc8y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176e1609-12cb-4a7e-cb53-08daf25db292
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 16:22:27.0066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxMaC6Ei2fcjh8NVJxyDT364JilGtcpojPVmFJ+GASxz2Brsr27gYVZZh9TJhG0vI4KPOiU6OofCv5c+HGhlEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8829

On 09.01.2023 16:46, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/Kconfig.debug
> +++ b/xen/arch/riscv/Kconfig.debug
> @@ -0,0 +1,7 @@
> +config EARLY_PRINTK
> +    bool "Enable early printk config"

Nit: Stray "config" in the prompt text.

Jan

