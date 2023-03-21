Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F7C6C3018
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512344.792313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pea08-0004BN-Ae; Tue, 21 Mar 2023 11:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512344.792313; Tue, 21 Mar 2023 11:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pea08-00049G-7P; Tue, 21 Mar 2023 11:18:00 +0000
Received: by outflank-mailman (input) for mailman id 512344;
 Tue, 21 Mar 2023 11:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pea07-00047q-6m
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:17:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07f84325-c7da-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 12:17:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8309.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 11:17:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 11:17:55 +0000
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
X-Inumbo-ID: 07f84325-c7da-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQpykAnt+cxFGVajXgYDQJ62IXVcqD6ib9CtTHmLt+a2wzo1dp39QmKEfmLq6icJx8MQrNHzZRGtk99mPxHBvmWIi/SR0soQNoOvEGc7oE0+EwJiXicbPvJxapBpgsossp7g+WeLYQn/9wkyvEMME+3MTTRKHH1HoQJIzsPGKjuK16mkpG8EScU92dCOOm0PQ9BR7DLWa3iCnh310MnCv5FMh3eDPl3PWYacVbS7tiEFpw1hYVHNat5uhhNdbDBIJNyQsMkSMMETzqfvl4K8CPS4ye1cLOppsnbHz1CqcyjBBhE6Tv8ItXhkrUMEJTwmZZsqhSKfLxeNaJAAGD5o5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znDf5s9/3LltS0fPY5nb1DsJ8gluU+1uUoXM5F/4f4M=;
 b=hYab4R3C5zde0HMRNDILQjE8h3P1pA8WWRY0tZDhtoKfyfn5B1TMLWoDfQT7dJHCB3rYFeQgEogAQBuzwc94ikntg73Ce/fDro4vtHTrS3D1MuFFYsqeplB8vqM1FnTL7xMF1bXTCtJg/QjvMaM08PT4IM3HjuvC2Tj3iKAvY2707A1PxJ7peiBOIdqEvs9HK8HjlxLmChPE6Q2RxeZVKgGLjlvA2JHMR8Qs0dgflzjUVqlySghtieb01lXL2t1B1oR4L/ajW8fNCjNAOYrScQska/CyybXLpHCOxo7rdeCjx3EM7BBd3KJ3ZxPJUEEZ8mYy7ee3CKbSPFMvfccjDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znDf5s9/3LltS0fPY5nb1DsJ8gluU+1uUoXM5F/4f4M=;
 b=3Yb00Jr4lnahUutL0KJi18cDXSKja7gSapaSsDTX7ry2j4DwORoTm32+Ily3zNwAkdZURF3tOsfJbn0Qwp39X654UUACfVPvwleeo1wU/5eTFiWdCyJOAzAms2tESWj+iwZzJ7c42MlPTbRgaQ1p+yeGKdPmfsT3198ejx8YFh1dhFMA+vNLxpWAzqys4RBbZrni2Zb75iZoRDZOqqm5M3ZdlBqtkG08+h72LBFMb2/53ONnub5+q3NOQEJJRX2mJf7z75BBjvQSqotbBCD+iT9b2WUvXnu8lPZn7+zpCXr8r4wDb6JnaU7NkppmsCdRKqKI1/E3p7xWK4OhTtKpmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <674d6337-dbff-fc22-fb32-d196c7bf6b63@suse.com>
Date: Tue, 21 Mar 2023 12:17:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/7] xen/riscv: introduce boot information structure
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <553b07e967f56b78eba2d27c9115cce707a45c08.1678976127.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <553b07e967f56b78eba2d27c9115cce707a45c08.1678976127.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db161fe-f3a5-4913-d528-08db29fdeb39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9lPZaH5WUreolgIoxLvAx9oaOOQSjnFriZw5QtpJ1Fnb+6WpTAzaSq3Fdp0XNxIaohuoRpzQ3yx5BWrcDhv8ppT96sAcCvDKIb3mJ+GkctZkFmuNxKWpNrT32TWx+cfonFSR6OIZrEtS6JTLnzal/l0BWNMkupeQjaL2UX+PbJTeMYgN8J1yVqOYa4QJ+ZCXzLYoF8/GLaFrUMlyciWhKn+vgHYPcvfnnxnPRWMVNVdBU2nDtLX+97he4YONI/Ix/NVOdIBjYqEkjHRWPYcZUEnxb/C3TWyCqEi4gUFtSU0TnVh+F9zauZ/WHZFa8x0gIjkDD2qOy8VwF9OFgzTsbuYIKntNvywpE8YV5ieixnQhc+CL+X/b9DelYJMPG3URu4dqG8OTvGoYUbXZqNWdp3xojO9uv3qx2Zr9OcqHyTOQ/snzS6KyKDNKoNOTHJDrnQZ6ukLM8xlofOKMke9vuo4QN17mINCMGLgzm2Ii6P2o8WeDHEiBknLz6t75fKK0gUizHNXPhs9NdqUUECV8pO5fyCdiafS3JRiKWcaBWLrgRtNVzBnkYo+WntEhZWbWdvvxIUVgrNBJ+zNkf85vDxPqY0MpWrX2BAf44xTRm8LG1wpQN/oMy0cFkT3DOcIwAgCGZhPkfEu5OkVinkFozZY2rGCCpyVbFNUM86YcUkhoeuEKjNr+UaEbizDteYE0vxoFZS6WqMQZyGzVZeafdrzBn0XlVGGBUmpCO3Apv5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199018)(2616005)(54906003)(86362001)(38100700002)(31696002)(4326008)(8676002)(8936002)(36756003)(66476007)(66556008)(2906002)(66946007)(6916009)(4744005)(41300700001)(53546011)(5660300002)(6506007)(478600001)(6512007)(6486002)(26005)(316002)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDF3dERtZEVjNWZ4ZzBFaXBRUzVoRklyZk5VWHhTQnc0bGNUTXhPRjhDWGhZ?=
 =?utf-8?B?VllxSDhQVDBSRzVtNEtJVFNQcFZ0dDJYV0FzN3RldXlEVWh3NlE1NFNaaXFT?=
 =?utf-8?B?cmIvZ2kveFUxUTlTS1labll6c2F3SDZZQ1JWOGh4eXJKR3JQWDludUtOaVBw?=
 =?utf-8?B?RFo2bFJxZlJqbDhxQ1hjeG1XM09vaGZKWkNVNmhwQjN3OHFDcjFwT3dPNnpR?=
 =?utf-8?B?Um5WZWd0aUF2U0tQR3hvSStiQkVBRlN6UEozN3pBU3lFN2pyaUpJQmJFeUU3?=
 =?utf-8?B?Snh1cUR4NzNvSDhRVUZzWWYwZ25tK3lybUtWOEQyajhXbmRmQzF4UW9pNk1p?=
 =?utf-8?B?MmtxcksyNUluOGNnWFNoTy8xVDJVdHAzTmFvSk5FVDgrU1E3YTY2N1NZRDE1?=
 =?utf-8?B?QjdrTFI2bHhicm9UQlpDclRIVEFqK1d5alo2WHdwcVUycTNGRjNwK3dPNjZR?=
 =?utf-8?B?SzR6dnFpUjJTWGhoYU9qS3RrVVZOUGpjbzREN3FVcmtFY3h3SGVIM1hIN05w?=
 =?utf-8?B?bjd4NWpVTHYwcDdaWUJpaEppUUFDcW1PT094M2pxMGJBY3JBRWl6OGQ2R3BT?=
 =?utf-8?B?R0w3TDIrTWRTRnFNZGJaZkRnQ09TbDVzTC92ZU9vNFROM2U5NDF2M0VSSzhz?=
 =?utf-8?B?N3lTd0pteXArT3NvaXZVK0pWYTlsTGp5c3E3R3RNQUxJVkhtOUcrZklkeDht?=
 =?utf-8?B?NC9MVU9LZ3JNZGtndmlPZlpoUGlUQ0JsdXd3VHY1WHRxeG9pZlpDTzhkbzFq?=
 =?utf-8?B?VTA0VlQ3enVodlVBQU5kZjFJOTZkbkd4L3ljUndURnhwQzluSVpMT1hzbm41?=
 =?utf-8?B?K0RvK3IyM1VoZk1rUjVaRUw5d0dFeWdKL1FwYXhMQ0FyaUF6TlJsUGd4ZmpI?=
 =?utf-8?B?dFBXSmh5WGxLOGUwY2llQ0llZ2xUd2pwNVdOeDlWZlZaNVFlelgxOUpzQ3hj?=
 =?utf-8?B?SGdTT1IvZW85NVh4Wk96NGlDOGI4MFdmTGxldTBmRG1ZQzlJdWdxS3pYVXpO?=
 =?utf-8?B?ZDcyQ1FEYWY1UlpTeVFyKys3WUQwNnAwZGZrODZ1VXc5aGZLVkFhbk1WY3dr?=
 =?utf-8?B?SXhZckpNOE9lR2xKenMybnBlOUtDSmswN1dqNE02NkxtdndETi9ublpPVW5G?=
 =?utf-8?B?aGZEbGluaDRpbVdXK2NPeWh1bDR5NkJBTTJhck04R29rRkM2cUNFd1JyWUYv?=
 =?utf-8?B?L0hINGRtbXBudlcvbzRpcDFDOFUyUG1PamRpQ3NxR201Q2I2K1ZqbnBtVmtj?=
 =?utf-8?B?bUxVK0MvZURmZUorYkY2anJYVTYvckQwS2VZUW5KL2YyNis1V21wN0c0NUFO?=
 =?utf-8?B?VlBkOTJqRFo1c201aWZkMlNEN3h2RDhSVS9taXoyYjhXNXR2alVGR0ZRS3Ji?=
 =?utf-8?B?WUNpOThRN3cyYmNVZGtWZkdFQWN3dkZRNjN5MDBFSEE5VDVZSWpITTRvblUr?=
 =?utf-8?B?dXJvQkpRdkxqREdhdHI0ZlpJOHlGZmtIeWxvSkNITHpBbUVJOU8vNTBBRmth?=
 =?utf-8?B?VjZlVW0yZjBIbjA0MGNJSjU0YVJyMVFUOE9KK1NyS3hnbkJON3pKOXdoM1dj?=
 =?utf-8?B?N051QXd4NjB2eWlEc1FPTXJqWGRZODZvMitBYUhsdGtLbHJoRjNOemRXdCth?=
 =?utf-8?B?OHJ5V0VHMUJFbGUzM0daelZFVDNjY1pKeXFMY3BOWVlGa0hXbjlMaW9SZHcz?=
 =?utf-8?B?bFhiRjRCeHpabTlFcXlOdE51RThwaUh1T2ZmeVRIZHJwWkQrUDN4Z3ZFNkZF?=
 =?utf-8?B?NkNEVkVQdUNhR01WQUQwY0s1YXFpdXFqcG5VdFNtUzdqeHRXWTRJSmVCRFZU?=
 =?utf-8?B?eFlxdkxrV0hYUnAxZjdxREJEMTFOcW9sZDIyd0NIcm1rMEg2Um9CNHpYQ0Fr?=
 =?utf-8?B?YkVXbThVb3Nrc3JnYXFRR3hYYjhvdnVtblZlcXJYUkdvUjh2ZVdNWHUrUFd4?=
 =?utf-8?B?d243ZlQ4UnM1ZE8vTHNJckRLOVlaM3ZLWEFHUW5hVm9uaktZK1Q4OUlRekxs?=
 =?utf-8?B?amlBZ29JWEduTnRUeUFEdWlrblF5TXNKcDU0Q0dSVmJQMzk4UHhXaEJFMzNE?=
 =?utf-8?B?cU5CWUh4OGszdTZPWWJPd2d5emprN2NzMm5Jd2Z2Um5MRm9VMVlFcFpZMmZS?=
 =?utf-8?Q?4q95qXmw8Ou0+CxLjGbJYShxO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db161fe-f3a5-4913-d528-08db29fdeb39
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 11:17:55.4520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1oAau/ZyR9F2h8rE5u0OiJOyE7Q3pdiY3X0YqX58FC5tDosnuzORjskEM4rTMtUcfmlv3sweW/tgPygKsjBLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8309

On 16.03.2023 15:39, Oleksii Kurochko wrote:
> @@ -50,4 +51,6 @@ void asm_offsets(void)
>      OFFSET(CPU_USER_REGS_SEPC, struct cpu_user_regs, sepc);
>      OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_regs, sstatus);
>      OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_regs, pregs);
> +    OFFSET(BI_LINKER_START, struct boot_info, linker_start);
> +    OFFSET(BI_LOAD_START, struct boot_info, load_start);
>  }

May I suggest that you add BLANK(); and a blank line between separate
groups of OFFSET() uses? This may not matter much right now, but it'll
help readability and findability once the file further grows.

Jan

