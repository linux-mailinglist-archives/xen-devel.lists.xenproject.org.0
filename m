Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67705749A7B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 13:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559864.875258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHN15-0006hS-DM; Thu, 06 Jul 2023 11:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559864.875258; Thu, 06 Jul 2023 11:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHN15-0006eg-9o; Thu, 06 Jul 2023 11:19:19 +0000
Received: by outflank-mailman (input) for mailman id 559864;
 Thu, 06 Jul 2023 11:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHN13-0006eW-QT
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 11:19:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a2c4fa-1bee-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 13:19:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 11:18:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 11:18:47 +0000
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
X-Inumbo-ID: f1a2c4fa-1bee-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5crOF8KVX7MiaaKEwWmV5DoJWiLWY8Feq+T5nUtkmmlwrR154lqx7gKF2lly+o4J1If2HWSDa01cCWMYSGLw3eUvg+6UWJTPyHNeOH/ERRcZ4vUTN4BCJkCh8ShlMze3VvsKsIhem0TA1od/U4EMk6NQLd06OqhWuBZ6t3fEGKraEbK/lhKKdH3n5myk3a2qiFZ6jSQ8w4xWY11yXOYGBE57TDUUCr+oBCNIduLWIk++TaBTtYRwRCiSXUiKvLhklgCBzdOrZauwFfiPiUvUafYSux3H5wIJh2ft29sYyMYMSgFp7skH5ea7iu5FXdETp0h1zJD+UtKjnb6yQ8TZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BttqFmpdTOAAXy7pC2eeykehOkY8SMzO0n6C4sL3QBc=;
 b=PsfWPa5QLyuSPHo7Khk21xjPBq1ss+SKOoTVezrCyhmunu/e5cMRcEyQSpQRo8GOUrcN82YR36gz33qy29Vnq/NPPkJiJaHZuV2i8AsMkCEGpl6TTuygHuoYp9sSQns5k+M9Fh1OuNi1tWK7Fim3MC9VmRlJp2QZ3EZZiWvR4BUp3ukNS52CtMfxC738Ikqw4MdVtXK/H1hvjSfYmCVEwpBP4NbnFCoNJYLfZrbgTdgEYm5C65e6DczWDIACIKPSfwIVyU0djW3mxKQkIMQBE1zXaqnqmL9QdrPoKHEoh4qK8v/FoTYdQW7T5vCVANtuE6yiJ0RavPGXMQKYQLKkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BttqFmpdTOAAXy7pC2eeykehOkY8SMzO0n6C4sL3QBc=;
 b=N5jYl4+o7Zr3GxJMwYw0LP9r85Iyf6CgpiP+xBLJZ1WXsx5Ta9AqRfLgq1XeUOReVbhg2Ppdq38fm0KfZCRHUaVm7zJ/+ydRBxvIFY3+ch/pg4SSjIK/9Tpdvjn2A1EXo+o/88BBPh/1BnCuH2vJD8Itvk788sWxKJ3iWRC9ARV/VhpOeK6++4zFQUViuniKf4q+F5CUkIEepXYLiVJ8r+ulxZRm9vtsRN2e2wcZAYUSLZwIXkGORoFRIunHwy4kbD3oH6eLu7BuR85Jr3KidHbQjvdspKJQ4aN/4uEXNB8DBqiMQ/ZAunQr9Rq8xWlCP9L27DVmpd5uDowAXpA4Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c716120e-8228-826a-bb33-298aa47b94f7@suse.com>
Date: Thu, 6 Jul 2023 13:18:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/6] xen/riscv: introduce function for physical offset
 calculation
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
 <f84bdc5ad9f10f864d070f7581dce663ccc9cb53.1687178053.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f84bdc5ad9f10f864d070f7581dce663ccc9cb53.1687178053.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 277f63b4-1247-4eae-e9ca-08db7e12c481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N1HOQIFo2uwjFq870GMByQQF6Wd0Uu2gsbfM7NqePQ7jm9GubI3s3DVCTVPlPlvMnKhGk0kwoCKJ5rnGTTr5KCW8xu3BzToC7HKMbv+c+DdgQXlElvd1hWD9hRdaXgdCOozoG8gsMzzqai1jkI8DoEbrnLBaBXOh4qxasZ8OzV4SE1x7yP91ydvR6k9lyhXqqMdROKfhFlVlDMFly13SQa4AKJjXy94LHz+Iqs2XrvdhmBMBfkY/NcAFNirviVlVgYw14tGXMYM+6r58nS3Zmuoz0i/E8nR1bkuiNanyl0CSqOQE4nRyQYivEQhK0ZcP4XulisdXjx+GSBvOORDy0aTDm/EMwZHYJ9n0zKD8hTVW084hOJUBrxxd1M766BELm3Ffw7HiK9FMymNhT5qiFhcuqb5QNoFCCuZ+NxTxmeGXc356Pp7xZ915AbaHvLvKQST0QZ+telJDnjEnNvNAZjB/pZwmQ+OA0oATFmsNRld0dBz3py4YzuGY1Mtj74i+Vp0ReE6KSNrcVXopsLKcHMtPJmOTn2+f38cbeSTSmWrpZb3+YAnUWLBxTtc5HcYh3YB3X+B+V4KCYroI26soLjGvgzifPIrFB0x9SetC7cbJbnvMRx1Otpz4ZHxCZXANp65lcL8NBkLNq0WctL3Ukw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199021)(478600001)(83380400001)(186003)(6512007)(86362001)(31696002)(6486002)(66946007)(316002)(38100700002)(2616005)(66476007)(53546011)(66556008)(31686004)(6916009)(26005)(6506007)(54906003)(4326008)(8936002)(5660300002)(4744005)(8676002)(2906002)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXBxV2llcE1CbnNldEdWOTRiaUdBakhnWGRVcldBQzgvVk5CUmZYMUl6cjll?=
 =?utf-8?B?R3FxSWE2Ym5YU3ZXWnhhdUpMRjQvbEhVVXUwdzlkWERCcWp4SkJMYThZU1Ju?=
 =?utf-8?B?Z0krT00rUGJLTUt5MmJtZm1XN0wxUElIVnJDbkdVUTZEcndEdVlMaThuNHBS?=
 =?utf-8?B?Q0ZodmxTcElIT2pReTdnZDFEWWpoNkFQTnkrWnBQSkpYYlNEUlBHb1Nma2Iz?=
 =?utf-8?B?bGdDZjMwVC9vSXNEOWtsaDVmWjBoRDRzUExnRk9nRW1ZQUEza1BjaEc2OTho?=
 =?utf-8?B?NjM3TnExSFU2c1hBTGRad2Zkd1NpbDA4ZS82Y0xiZkNJR2pIZjdPRXE2aWFp?=
 =?utf-8?B?VSttMFgvN0FoTTBPNmhRTGZKckdGWExjQlJFUE9oVWNEM2RGZUIvUVo5djJv?=
 =?utf-8?B?akxBZ0pBRVpWeEJLTDF2NFczWkhIN3VKSFhWSEw5QzlyZDd4Tkk5Misralh2?=
 =?utf-8?B?QmYweThQS3ZndWtmNWJqS3ZtOVl4elJCNEkzdUlNRjhBZVdNUVk3SzljYXBv?=
 =?utf-8?B?REQ1bTRPcmdoMUdQeTZsKytCdU1yaTkwVXZmeHBtQ1ZtNDV2aUF3UDZ2b1ZU?=
 =?utf-8?B?bWUzYTNRWVpzMCtYRk5Jb3RveE9ISFFNNWdwTGV6dGU2K0xYWkQ5RnMrUTNv?=
 =?utf-8?B?NEJtSjNxVjlCSXdEOGtuOEpDUE9ZbjNGN1IzNnhNNjdhdVNkdENyR2hPc2Vv?=
 =?utf-8?B?SmJZalNzdW9HK2ppc0c1K2tqRnI0UmlWNWFXbDBjLzNBaWhJWTdXaDNIdzJH?=
 =?utf-8?B?RmV1Q3ZVT2R5TXV0T3dISWkzd3JLYllvOEZ4bG4zZk9KUjAwblhNUEs0M2pT?=
 =?utf-8?B?aXo0V3p0Um4vYUhOeGJlaytwOXRxZXVpUWw3a2hCZ3BOVGkreHF4c2JEMi9K?=
 =?utf-8?B?UVFCSGkrU2tIK20wOW5jZ0NPRmVpcXl0bWZIQnpsdXNGbkJlNkdaVC82bDFv?=
 =?utf-8?B?L2pHU3pKeG5jTDE3QU1WZ3RyQm5uOEcyV0h2aHFHSE1zL2RSTWpUOGxQNS9o?=
 =?utf-8?B?SUNqeVRnd2RxbXBFMStINS91ZEl5UEdZZkdHZGVieGZaYThTQStMS3ZsQjEw?=
 =?utf-8?B?WHJRQ05TeFRjNjFaUFVVUEtvOHVqMEFDVWoxM2F3cG1FWjFiRjZkN21RYTNU?=
 =?utf-8?B?UkYxamFnME5RNzNUK1BhelE4a2lyUWxGeS9BcDlrUkd0ci9naXk2dEQvSlQy?=
 =?utf-8?B?cEtpcGRuSm9UM2NTSm8vc29OblRIekdlZWZCZDJxRTd5Vm0vTngyNzdDT3Uz?=
 =?utf-8?B?NWtvR01nc1VKdTZQYlJkKyt3Uy93MFFJVjhzUU9RRUR5cjlWVE53Mk5IL1gy?=
 =?utf-8?B?b1h6TWxQdGNweUE4NXNyZ1ZzRnNTZktKZDhyaVdsWm4yaGl0VFZleDI2MVhx?=
 =?utf-8?B?Y04zdHJORHVhWWo4SGNKSFlUZ0FoR015dmo3U2ZNSkpwNkdIMTk2ZHpqaENz?=
 =?utf-8?B?eWtvVFlzZmJQMCtiNE9SMzhKZFhMaFFIOXpNQkdxejFwSmRHRnpHVUhPdFV5?=
 =?utf-8?B?MDB2Tnp5SDlCWHF2Z2VvS1o4V2VYL3d2TkJMN2xIcGZjSmZ5eDRhRTRDbjhB?=
 =?utf-8?B?Mmo5YmtoTEx6b2lOajAzSjAvZjQ3NUhmdWR4dWFKRytDbTNnellxM0ZRUFBO?=
 =?utf-8?B?azF4M0NnUDEwcktKcTVZelVLMno4TkJGNEcyVG4xVHBodTdWQUNRQWVtd2dx?=
 =?utf-8?B?ZitGcUJuSDJKbHpIWWdMY1Nwa2ZGaHNzV2xEaFhXWkpJWWJURExJeWE2SkJ0?=
 =?utf-8?B?VSt4NlpiNDNacklOMVh5SHRoMlliSWpvd0hwSTRUUDZVSlVYYUFTa0RoT243?=
 =?utf-8?B?czNrZ3RDS3FQK2FzTDJyWjh0KzJNWEwyQzJNdTd3eE9FNXkxRXU4ZDFNVWE0?=
 =?utf-8?B?NlFYZ0ZRNXBDVzJTQ2ZxM1ZoblVRUmFGYzExKzM1M3poUFlXd2F6RUZHVzNF?=
 =?utf-8?B?NC9HUjFCMzZrZDhvK3FrYkZSMllrdENBV1hBSUxVdVNaY21FNWoySnk4OWV6?=
 =?utf-8?B?ZUIvdmZFMGIwaEEwWEFlNVA1V3hVL2RBa0owK201NGhKREFjcWIxc1g2eW5Q?=
 =?utf-8?B?WVNtTDRSeS9sK0MwV3VteXdXQnI4UVRWc3N0ckZMOEN0N1VQZE53NkZaWFZL?=
 =?utf-8?Q?GwkcqMY7WnxCkilF74fTduZPP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277f63b4-1247-4eae-e9ca-08db7e12c481
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 11:18:47.5604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuD4dt7le5mqXd3z3Z26V/o3XWzWeBGvwTfpEASkVsMXhk4BDmJIJVr9fqYlaD92tI/QeWGgyaWmHuEbnp38tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

On 19.06.2023 15:34, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -29,6 +29,8 @@ ENTRY(start)
>  
>          jal     reset_stack
>  
> +        jal     calc_phys_offset
> +
>          tail    start_xen
>  
>          .section .text, "ax", %progbits

Since you call a C function, the code to save/restore a0/a1 needs to
move here (from patch 4).

Jan

