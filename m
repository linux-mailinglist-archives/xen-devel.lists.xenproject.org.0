Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873F6BD19B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510625.788636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pco67-0005nj-GX; Thu, 16 Mar 2023 13:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510625.788636; Thu, 16 Mar 2023 13:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pco67-0005lm-Df; Thu, 16 Mar 2023 13:56:51 +0000
Received: by outflank-mailman (input) for mailman id 510625;
 Thu, 16 Mar 2023 13:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pco66-0005lb-5k
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:56:50 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64c8721f-c402-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 14:56:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8931.eurprd04.prod.outlook.com (2603:10a6:20b:42e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 13:56:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 13:56:46 +0000
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
X-Inumbo-ID: 64c8721f-c402-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTKeEOVhkPLGH6pGl7Ptfed8PqPkC+ZyBnw6vOQYbFZNfjjHL66/13DdPBuAvhKUJhifZH+m1r3YMJZqVxVbjCIyk+/ziZx6ioMeM4l75NgrhVQCd8HuxkuFFKjRhkfI8U7l85hVigVwoteBkf14w+pAcxpUJqEtbLq0yPCfoj2Ef1itN3ZG0wTQuomdPNFWuz2JGnU5FkRda2nZRwfuT0xljsrLgQpU9PmifXpCSyVJLqmGN7djyOmjDacuwPJReP4HHzOtAuhl4MC1O62mpzli/xyF7sQsdND9CmwkhJr/gGtxAzDY7AWKFfp6yIzA2QywwbRmJ+9aFoRFfOZiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjS3oVBNLLe37oSqFfjO2JRnUC3iQ34f+tPKUiqTF4k=;
 b=ACkYJKsvlH4QbETe+oAeEePtRlWI7w8t3iwiHlrcXvg5UEIOniP3xC4vnTkah6zD1hx0NCX3coLaQ5OsHHdf4aiNY61/ZB0HslJZneLA8GLFV/3t7G/XfiFXghrlsDDGsdGL4SXOxvlXQ4CHE86saJ3t6V5KURV0MoB3+oEihtTFKgydMdLl2vjBCfykG8MwEdegC1TfK47PbW1ra+KxCXZzuNWalUTmjBnNJEpr5ywQVHS3oOomIwb/U7LSB1zFk1OxUHqgVd4RKOsexSIe/7yRqb/7IQtCwxztl9TPICHT4WaToMae+A0ad77Lo/KYQsHDfLPHM6OYUDHAfAqX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjS3oVBNLLe37oSqFfjO2JRnUC3iQ34f+tPKUiqTF4k=;
 b=lpAedubPoY6wmq0xI3mNbB+3tYLiUw0W7DKLyMrHzVyEstxuIaWeDuK5m2uvYKMEQpGzbqejlcSNCexsPeZjHopBaaCm138rfw/RgPzQffItuBFeBPRmtv4FdwN0RCZOC/XpvF3dpIPLQ6nPY1RwKsnOUNWcRARqykpszwBf7+EBNHAsu2H27kweAN3dXaau64LRZeHD6t0q0R+nIN7PqdPNgzcTfc7t0n4Q9ABSGPNctJA8drr6AMxZf/eLv+8c7XkZnqXPAEhKuaHjAf9u0bPZdr80TYIrgy9Ly2NGbwtA+wW4JzlycQhngLy7Jiln01X8EjDjqiIT1wsFXVH0yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <040b0c18-8299-7c83-1541-13e976cfaef2@suse.com>
Date: Thu, 16 Mar 2023 14:56:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] xen/riscv: add explicit check that .got{.plt} is
 empty
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
 <7c066d6dcc0618749df04785b34b93819148087d.1678970065.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7c066d6dcc0618749df04785b34b93819148087d.1678970065.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8931:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f70e98-1181-401b-e6a5-08db2626481f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R9hzfvurbppySRoGgz+U5vzz/K10mpxrYG7UWtDsnBsVWpH7/fsldnjWrgLXRGMbf3aFgzvY13pqkr5hWzuSbrD8JdRfQ51lEib9MSKj5iSYidjQ+LPE+xEsPwHgtn3W3TGpoeaxPi8kO/tkbotRpS1vtjEPOj+aCSn+bs+S4/3erVTmoyrh0Am9syf2iXTPcYQR0E7pBNBgkZWI3H6u/mOZHRI/+B+0ORXLYHibhvMhtRSL3FAJJv6mNU+oOOwTD28VZcHMzmc84WikkQGfYG3uR95rGhX11eEoJItrqSDS5Fd8D93x7h/ghwx+vZqP4hUAf22A4XXr0XWppZbynVR9iwl4Y0eIJbViBEFa6kSjlT8q4hvlWIjbW1nPaPnAK98uGhpypuep5Nz1FRM3mVfyvDAgbxXctG/0C3W6nzuj+5kOSvSJRHen6RRBROPts8rSG3suOVeOylLjQ39im9ePBb5ZX4gKCgS8ZT3M3q35JBcpyKYXqXUMP04FecMvLOmaaX7VQVVvgpLvYNEax1ujvCbR6SVkEVxRmCuGR66fp6egk2t6fXMjj4liBVos7d74mITQi51q7gg59HDC/cpiD0/gXR/z/EBj0Xcu7H4qLHo6gGKhoMSEdE0NdeSM0r+BR1iwzKAJECCRxJs29XvDVqYHeP2x7xMvAfwAoA5qSsvhGlRfmjHgr2wjIMCPj7kHk3hsVK8k3yJQG/KTTFs56fp6AZocDUtGmGEaGotXULoh0AJI+6RH+YFY4Lv5bvwfURqlSTpn7aK2mfd49g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199018)(6666004)(6512007)(6486002)(83380400001)(478600001)(2616005)(26005)(6506007)(186003)(53546011)(38100700002)(36756003)(31696002)(86362001)(8936002)(4744005)(41300700001)(5660300002)(316002)(6916009)(66556008)(66476007)(8676002)(4326008)(66946007)(54906003)(2906002)(31686004)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk9sQWFkV05VUlR5anAzY0NPZnIxeVdma1R4bDdHYXhWb0RneldDQVhYcXl3?=
 =?utf-8?B?Z2R0NHhXUmZON1RCMjAyRW9yVDJaODdyUWhyOFRrV2trZFJrNzVlejd1M3du?=
 =?utf-8?B?bmtNbUpRNC9UWHVKR3lzRWRjOEIrWkZBeWh6eHF1Uzc0dldNa1RDVm9yZ2h2?=
 =?utf-8?B?ZEU2NFNocjQ4elFaamN2QkQ4dW1nQnljazV5U1dsWEtaS1FjdDZjcWtQd3lM?=
 =?utf-8?B?NytNWnpFR0J4UFh6eVNtUi93dEorbC9hRGtZTkZCK2t6VkFTbUFLdVFTbmN3?=
 =?utf-8?B?TzNZbmt2YUhTYkQrTHJLM0FNbVUxOHl0ZjMyZzBmSFF3bUt6R0RyVFhzRlNu?=
 =?utf-8?B?RVF0U2Z3NmRPK0JOV2lURks3OHFZdk5EUi9UZFhNSTZRRlAyODRzKzh3d1Ev?=
 =?utf-8?B?WWtiU2gramh0YVNMZ0ZKb1NBdlE0eGVIVnlrcnV6Tm4wUnpPbHE1OHRQS1dp?=
 =?utf-8?B?UEpFdi96eVNPMXhaT1V3bE5kSDRTS1dOODZYVTBNRjNVMjZodGNYdWc5Kzc4?=
 =?utf-8?B?MEpiOXQ2UkNLbVgwMWhNWUcrdHhpN1RRRksrclBjbGF2QmlKaFVELzZ5aHBa?=
 =?utf-8?B?Z1FEVTJ2R2pRcXQ1SWdWbEJjZHY0cFl3c01lclVZTWVkTnp0VURIUUYvVkFz?=
 =?utf-8?B?N2ZuZmJvUURlSENoNTJoOGhsSmNGSU1ONkJtTFkwMnBneTNnaHFkMFBucWhU?=
 =?utf-8?B?enU0VnlLTHZrM2ZvUGg1QXcrb00xY1BWdk01cE0vcExTYktraFRMZUNNL051?=
 =?utf-8?B?SnhjMXUxT0x4ODJUU1VZcFE0NFd6ZmxFSlk1TmQvTDRqaU1iZ3QvV1BSdjFk?=
 =?utf-8?B?VldBWDRra1ptU1YwUjUzOVNJME1pcGFVK05EMjV0SzVnK1lOMndzV2JIWm81?=
 =?utf-8?B?RFhKUzhMNlRsYTNmQTBkVkR3R2FPZUkzQThQb2hxWU4rWUVZT1NwaTBzZCt6?=
 =?utf-8?B?Z1ZLbEJyRWtmb0puRGhVU2hZQklydUpvQnM0eGNleldFSFBzUEpuVVJRaWx4?=
 =?utf-8?B?TUVPRW9jaUF1VlZTUEFVZ0ZkYUppZHoxL3BWV2RRMy9wTGJOUmtDdWJlRm5V?=
 =?utf-8?B?WWlSaGhYSnRQV1lCSlUvTFIydVh3MUNUOWJRSWp1VEF1RWJvdERXelM0RGZI?=
 =?utf-8?B?Q0J4TkdtVjBCWnlKWGtHV2pBNXdBems4Q1IrODgyUW40aG9vWHBKZTJsZmpF?=
 =?utf-8?B?OG1LUExtZ3grczJMNk80SlJNdGtPNkN5a3YzQUNmNVZYT2ZwOGtkOUVQS1ZC?=
 =?utf-8?B?N0dtZVcxZnN1NXMwMlNDZDFGZ0JiWTlGelNFaGY5c2NSMFpTb0tjLytKUEth?=
 =?utf-8?B?a3lIZ3RWV2dJS0U4bWN6Y2ppQ1J0ZTJPZTFGaDhqTFJnTklLY0lYMUU4Rk1G?=
 =?utf-8?B?dmtJSWhOYmoyaHRLa0F6N1RWR2M3dmNKeGZEQUVLdEhxVGNjeU5XMTkzUUdD?=
 =?utf-8?B?VzI3emlNYVlsRzRleStxd0pmOWpHakRUOU1IRms5ZGNmeWVxb0o0b3lwdWlm?=
 =?utf-8?B?MG1hV2J4enAvcGNtcm85TlBuZzNGcnJ2LzJZbzYra0x0Zk4vNUpqbHRxaERz?=
 =?utf-8?B?eUNjaTJhUldCWjlFd1VmSVJ2VjluZnMvVFlkeVRQZldhWGZhWEM2NFQzb1NK?=
 =?utf-8?B?SEhBNXZlclNjNm5DcHRxZTN5Wkw4S3V3WFpCeVlyUHNrc3FFMmQvaDVtajVy?=
 =?utf-8?B?R2cySWRocStheS9mSTBoalIzUlg4Tk15anU4b2VGTUx4UlRFLzNzK1BiKy9K?=
 =?utf-8?B?cmc5MDRGYVVaSVlieW5nb2pEUHhYYk1UeG01M2QzcDBKMFNuNUFKdU0rK1NC?=
 =?utf-8?B?WTg0OFlxVVNDWkxnVEduTDJGSVI4Vnh1Uk1rVXdPZCsyd091a0ZZMFJETVBq?=
 =?utf-8?B?R2JMSFY1ZllaajRDMDNTNWxqUkhrRnZnM2FQKzNnNTFtMFQ4T25NYld3RSsz?=
 =?utf-8?B?K1NMNEtsRzJISEp5WDJGRUo3V0RWRUw0SXR3YlFxbWl2UUw3Ui91c2psSEZL?=
 =?utf-8?B?RFB2bFQ1SVRNaHBvVk1nS1N2RVZybmk5QkNzSER1SWlUTm5Gdk5mVXhFWDI4?=
 =?utf-8?B?S3VEUDFYM0oxNkZLYmdhcVpldWhDTWtZTTV5eHpnaTYzOEM0bTR6cDBsRTlx?=
 =?utf-8?Q?Vx/elqXb4UAaQ9Q7lU6I3Z6Q3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f70e98-1181-401b-e6a5-08db2626481f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:56:46.5438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcsRwmipxqOnFF8WgTIkinRY4U7CuqOcBsEc3luILMwTnLLDYDyc6vmrrxZLF8oR0SGJ4qeTHqE9+ZO0W82huQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8931

On 16.03.2023 14:22, Oleksii Kurochko wrote:
> The GOT sections usage should be avoided in the hypervisor
> so to catch such use cases earlier when GOT things are
> produced the patch introduces .got and .got.plt sections
> and adds asserts that they're empty.
> 
> The sections won't be created until they remain
> empty otherwise the asserts would cause early failure.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

And again a Suggested-by to Andrew perhaps.

Jan

