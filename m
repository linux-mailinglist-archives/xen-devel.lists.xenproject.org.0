Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0616601E3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472677.732994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnVf-0002n2-Ik; Fri, 06 Jan 2023 14:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472677.732994; Fri, 06 Jan 2023 14:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnVf-0002jt-FN; Fri, 06 Jan 2023 14:15:51 +0000
Received: by outflank-mailman (input) for mailman id 472677;
 Fri, 06 Jan 2023 14:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ggnj=5D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDnVe-0002jl-P0
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:15:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ecebf5f-8dcc-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 15:15:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8804.eurprd04.prod.outlook.com (2603:10a6:20b:42f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 14:15:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 14:15:48 +0000
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
X-Inumbo-ID: 9ecebf5f-8dcc-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErnpGFYYvUKQPCgH7ZKSSwUdvqUNMkGtZqaxORVlKUJO94OC/cHO738bRKuFrouO2vIuOiCzlWfaLSE7cRTRVLp39IAZjaJTizWm8KSlDx0Tmdk6QyS6uxzaR7/BTLSELQUXBj/JswI4taDZD8Oy7IrEqUg+kwUTPKteZq5FI3X6974TeQqfdNAKas38YPGIl6E+NttZDddEFAw4ZeEsIoZiDqkrK4PDcgTdg8JVZOaQZd2Rj4lpp17j1oydf/kFlXlCSX48kSQRteV3/dnNUMbI8essHDFw++fyM2ca8mAzqlSSOVxAsb97IQzmgPLYLpY+jvqFbuo5BB9312mTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwcgD9BxLJS1uqkaTVy7HqdrmgombZtt5wnEh7+I6Dc=;
 b=cRzaDVcCXY6sLwGCunnPAZ28lg6XvU3hweHGkmOmRx5Ckx4UYkqV4RsMKwu36d2xMCRmqrK9YqEQcgR6XF+OWrsCq4itBpnO9qWifKOwtZMlhy5fPYUjykEUy9oA/FkkDklwFi5WyiZrsUHLLkIeYySNdYu0YHBz/KuYPqIW7tpw9F0tWLAPfIAVOxcZ7HPSn7URzdfMb68RkA2MkogJZtPAXfxcy5DzvlKqS5JbQnxGZd/NVWdYfnbCRyHRll45wEYIYGEauAz7eJTZfd5dQQapEDizvwgGM3rEYgjZW0jf6DTPG88sFWqyworl8i8ukPbRlxIedTlGWjQNH8hn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwcgD9BxLJS1uqkaTVy7HqdrmgombZtt5wnEh7+I6Dc=;
 b=Cabvio0plZdPZQFyYRIMIma3OaOl1IYRNkwrhm7rCTXynh61fDe2Jr3ClHapIpt1YqIDnK6qlsy6cUHQunK1089ppGT+nwNo3L4qJqe1SXpWa8/6fhezi+rFJV2tra7cJHwZ+Lynyzjd7TuhWGUvF70uNnlZfe/sSo/CgqYYAv5Ln1HrtiM1gI0hPnWL8sXJF7JkcLen3Oih8A7iH6nEwZM7QIGuWZx8yU3qOfrMWRweInfRvKoS5B1R2XZdynK7rDQU7elXMOaM4heta85RC3AG9nkaN76TQbM5S493lrTAsMd4DjVcDdzDWcC0QqAzCsx/m8x+Dr17yyV7+EMSRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c93ee8c-1c7f-d1aa-c0fd-72518e37a74d@suse.com>
Date: Fri, 6 Jan 2023 15:15:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce stack stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <e8f65c43d20ebdaba61738200360b14152531321.1673009740.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e8f65c43d20ebdaba61738200360b14152531321.1673009740.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: ebafbd80-91ae-40d4-80ac-08daeff08255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wP+azzrjv1nZ56NX2/jndl/qwA3Zgvu8CDhiN1Sk+wHCDNXmWUaX9a98ggfvS3zF0rWAq9i9H0qjP5c+cF9fSvm/20+NvQUT8Jz+Uq7m26E/syeBK2/SY0FxcD+ZqHMQl5iA8Vtv5qRqr7Hxh+8Mb0v69GopZds+s7V2XP+9RqCvipGoUW2WfzkFeGQ6djyQ72bEKlWJJ4ZcgHFOtWHeoqGj7U2QNN0dBPAD65B2xbvLvbDr1Tf4xtHdq3KXnkZPSQn/9r/tzYe2KYHA8Im5konitW1QMk+P6Ceb9lb5LWRMZbRuW0TwyTrBcYcoh6nZc+asJ7xblkFh8iihlvaOGeuFjPNft+X/1uHRZ2eXvF8pczKqxoa/hl8e1H7IxE+dVHouwyCrp4bMnDdNWwoSg8tE0zduwrE/QLGDb8fL9Dbu2PPVgvSaaQgMc5EoTKNZ3AQdeaRUqVDcQwrzi0E5jwrQkdi9tFIFHfAREqcUy+Fmy7X4cCS6dOaQWpGc+DUzHNMf4ThHGlww5L4PgyUXwGuTmkEHIgcVfBQx+xNPxAaHiCrhdK+gMkMFEjaGGZfJHV/Z2OWsQdA85idwn7AS341kcG2Lo2r9SRuYeuvgWZ8h87IlIIVEqdUXkp6Xj/CsuT77G8GjUHSCg8+vL6iigJw8rskUL8OJt2HteTE3iL48z2Qtd5eR8H+POat9W955Oo3fWfcOjRagylVBge3dZFDErCbwYWqu8eZoZ8B4lBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199015)(6512007)(26005)(186003)(2616005)(31696002)(36756003)(38100700002)(316002)(6916009)(4744005)(54906003)(31686004)(2906002)(4326008)(86362001)(66946007)(41300700001)(8936002)(5660300002)(8676002)(66476007)(478600001)(6486002)(66556008)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czVSVzdmZGNuekxPWDhRcXc4ekJHZCtJOXJ2a05ic0kwR3FZUjF5QjJvRTVh?=
 =?utf-8?B?dVB6M2c5S0lqWUFPNG56a25lU1R3b1h2djVzQUVRNTVyalpxM2tITTY5RTgw?=
 =?utf-8?B?UENXY2tKUGhTMFloa1FOT2xMZWpEVDlVRTRhcUdqa1ZhbHFPT0J4Nm1KV3VE?=
 =?utf-8?B?RWlVVTBQYVpya2J1ZlJZUHBmaWtBY1I0Sy9INVQ5MVQvSkxCc3FMR1F5Tlk0?=
 =?utf-8?B?c3VRWjVNcHJoS0Q3TEo0SmlGa1Q1QXc4OTRhSlloN1U0VmxQWHdWaVMrU3M4?=
 =?utf-8?B?cFlDL1Jwd2I3alE0V1dqNzJTZ1RYTC9aRm1DeUpncmQ0ZUVmVyt0STZiR3NF?=
 =?utf-8?B?aTdqYjhoeE5qUHRqV25BNmtqeWp5M1c3VUJJWHFWeTRoTHV2ejlhYm4xbHVt?=
 =?utf-8?B?eFZXYkF1ZjV6dlBmK3VUNkQ1djI3cUpPcmpqbVdVNGM1R2w4d0lYcVoxdUxD?=
 =?utf-8?B?aXh1T25XNHNVVU5Ob1luY1Q4dnlYaEJkK0svN0dLYW5JZkFSRjVYNFF3YUNs?=
 =?utf-8?B?Qk5qdEJYZU1LRlVyWXFZa2ZoUWJQMkxnOU9BN1VaMjlQTHZVM2hWOXJUTXNP?=
 =?utf-8?B?VVR3QjFobVRmWkZ2NDA5blRUL1lybnNnbSt5TTlLM2ZtS0ViN0R2anpjUEhj?=
 =?utf-8?B?aU1IUU84Sm5BSWlpVDMvdEJwZTZQZ2JuY1F5YWVmMXRaWVBsRmhvczYzM2th?=
 =?utf-8?B?MWR0ZWJzbDlHSlpOQ0dWazNRekN4M1BnMmRsek1vWXgrRXh1elFhTHp6bWh2?=
 =?utf-8?B?ZXk3S3diSHFvei9KUDVIUU1MUTFsZ3BoTHlBYkNQYWE3alJPU2M1THg1aXNo?=
 =?utf-8?B?NkVtQVhBUDVRdjBzUkhuendhWjJuZkNZcnE0WWJ6eVkvOHo4bVBXcThsTUNi?=
 =?utf-8?B?cjdBRk1GZnBCeUJGNHorL2NhZUgvMEJrQXdnbXVyNERoeUJFYmxlTk1DZEk3?=
 =?utf-8?B?TkNCMldlWktkVDZDOGtOdm90MFh4d0t0U0sxQ3dsTTZTL3lPUkM3YzVUekd5?=
 =?utf-8?B?cG9YL05ENVNZQVdJNEFsVGYrM2VOdkdTZ0FDN20wd2lBdmx0SkMwQkRZSDZH?=
 =?utf-8?B?a3hKRzNod1lsdmo4K2d5cjc5eVM0RTVmZkpkM1FhcWVYdzlzTlA3SEYxNmNG?=
 =?utf-8?B?SVdVSjlISDl0UmZ2TUUzQkFOcVdTTnZyYmZMdndQU1VsQUpGQUgzcFJTVFdM?=
 =?utf-8?B?LzVEZVRSRmJFakZpYTJzYVl2MlNoZnNSczFGS2lvNDRuQzc4Njg5dmZLTnpQ?=
 =?utf-8?B?VE1KYWJNeitEZ050TGwrWURLc1Y0VHl5clQ5K2NxU29nOEtpcHlKWXBjdjQx?=
 =?utf-8?B?ZFE5cmFUTG43QSs5WkN6dlpRZ0tXV01DQkVuWFlicnRoOEwxQUwrNi8xRW82?=
 =?utf-8?B?cEY0UTJETm84WGZNcVk5UHJvQ0VwMVJUNW03RWE4ZGhJSmVNN2R2dFJIOTRF?=
 =?utf-8?B?bFprankwMWZZbHN4TG15VGRrR09SQ3dSbXNXRXFjWVAybno3K09VUUVsU2sw?=
 =?utf-8?B?SXpOSkxjSjRETitpbjFmWU0xcFRadUlLMHRvalhUL0xZNy85Nk85ZmVRN2RB?=
 =?utf-8?B?VldoS2Q4QzRybHpSdW4wdGd3Q3I5UmpyVGxRZ0pIWGhqSTdUOUovc09nTEpM?=
 =?utf-8?B?amdIU2kybXJ4UmY3T3ptaGtQYVhqRERLVFJ6ZjZqVStDM1JNTEdGZEl2Zk5u?=
 =?utf-8?B?ZXhkcHFveGpUNldoY2huSUpNalFLVkJsK2ROMVRldng2L250UThhRFpib2xZ?=
 =?utf-8?B?dEpyZmpJQWozRkMzRng1ZzEybGFkenY2aHJsaFRSN2xMR1JjUzFjZmJDVS9I?=
 =?utf-8?B?UzFpOWxhN1FUMFlORFNrSTNIZGlOZThLMVVpTG1jZVBwNjN2eFpHRDJNV2Fy?=
 =?utf-8?B?eUVGeXhzS3FxV0RiQnU3UnNCTUJGNDRBTml2akpVUlVoOVZuTFRQd1d4ajIr?=
 =?utf-8?B?Y1ozQTZhSzE4eEdxV1dRVktpa3cxWEQ4Q0p6elh2TktmaU9YczExcEFnTkRh?=
 =?utf-8?B?THphUERFWVplQnJJbW0vMGRUZnMzMlRER2gwNVMwc0JpelhNdjkwdzFSUGcy?=
 =?utf-8?B?OEc1R3o2bmJXWmlJbVNMNjdUQm9xZ3RORlh0UUpRYm1xZDRZRUFiU3J0d0VV?=
 =?utf-8?Q?Bij+whFGccS4t7DA3//acna6V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebafbd80-91ae-40d4-80ac-08daeff08255
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:15:48.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDsVYOKeq9YkEKVU3gx7WERb2ApMY6TOrOjUr5dMthiadyGiFEbxSkzIzfSpsm4AGq0IBIdA7IPad/7tGzrNpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8804

On 06.01.2023 14:14, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,4 +1,10 @@
>          .section .text.header, "ax", %progbits
>  
>  ENTRY(start)
> -        j  start
> +        la      sp, cpu0_boot_stack
> +        li      t0, PAGE_SIZE
> +        add     sp, sp, t0
> +
> +_start_hang:
> +        wfi
> +        j  _start_hang

Nit: I think it would be nice if in a new port assembly code used
consistent padding between insn mnemonic and operand(s).

Jan

