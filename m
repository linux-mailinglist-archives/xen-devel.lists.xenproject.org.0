Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F65679F4E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 17:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483654.749939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMcZ-0001UN-0s; Tue, 24 Jan 2023 16:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483654.749939; Tue, 24 Jan 2023 16:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMcY-0001SL-Te; Tue, 24 Jan 2023 16:58:06 +0000
Received: by outflank-mailman (input) for mailman id 483654;
 Tue, 24 Jan 2023 16:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKMcX-0001Rz-JR
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 16:58:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 445e686c-9c08-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 17:58:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 16:58:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 16:58:02 +0000
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
X-Inumbo-ID: 445e686c-9c08-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV8FGqkXwg7tfLhhl5vDFhSmboRQpUpLZ3uTyTLnAWk87CtIzlyaueQCGltmMM3xHYdCn6pnqAptLYTTJ24pMG/2K/WgIu5VrkGalLwaVDBYT4t7QxrcNBifFwxQFMRT3NaC/h2tPmG4yCHdguBuEwuCQC0h7H9NazC6t31HuxaII/6SQr6LdSzE1shDwCtWnz2bJFCITOz0CWfLHaCAvCn1PwzX4n74SGZWlVyl8FXkc+Yqnm2FgXbmDFHdiY7cM/2DwaLKSq4FvqP0IXWgnmttTqVQpNlgpFA0kQqhC4N9e0wVJUd8NJe1BgQfi+dP4WDoFLbMHlDXD1Cmta6J2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGEDp2wJiYU4P10781u6ZMMpV8VSOZAIW1y6Bd723Xs=;
 b=kQQDKOQn9USClJDzDF5NMJSHKQXkbGbadYUkrLxKbvkajVxYwnFUc0SI4qVso85hmoiRU1WB7PZYbCnqSPFv7vAXanNsecu18kbxt0ek46zGzLuxht6g99FFQPAJeOtZouAVUAiHRUnWdKXRvdVZ2dK7k7Nbj7vlycSYphwXBhXk+Nr3Pf39Goa0+Y4DoUASIWyXl8nYnNCmAYdC+nfni6U26lJOmYMFPLZoQxt4ZUHkcCUT+3Gq0sZHPss+Id2f6nU7rD0a4u9l4Gd5NF/jSakCYxtceLlVYh3JkPgFLABdmk9J+0kAAG/CWAgKIPkcaGz2/yKy4OxNE4WKpNIs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGEDp2wJiYU4P10781u6ZMMpV8VSOZAIW1y6Bd723Xs=;
 b=Mm/DdlGBouYMbU4Ul9J7UYbTswagxWCYmX8pY56+Pn/jEsfq+91rH96UjDBhNXCZ16d3ZibCnfiyQO2gTsVNgUVLF9SCkZY2Ag6XX/sUDa30dn+QtFZBMAXovzXdS2tT7mhT7epvwFb0mLSjFhfkhCEnQGk+IT/0QblbW3v91AcVoqxO84INq4aCwuXGMvA+kvK2b4n4HxFjiP3WJZAxuxqRjipQVER2Per2k17qhjgFs2ZOchK8/SN4Vg0ToC5HvuU4YgNsUSprdXT9IDo22IQ8/EfUMExbBif1XyyxTPDlNDlFzEev8eZj2J71/yxI3mLtXSAZROsT/yyW6DJuIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85697ead-bbca-bbdd-0fc3-c08d1da43978@suse.com>
Date: Tue, 24 Jan 2023 17:58:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 07/11] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-8-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230123154735.74832-8-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a626bc-6f9f-40ad-4076-08dafe2c2772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7n9KIPrpZbpucaG6irARSrh0/ofoAZo7J45CLvV3gYXU92phq7d7cWB1bASMGQaMRBQpWa8BtBGYI58D6odY/roFdj5NAadu9KeG56fm7ijEE7x2vx2Yn1xcRcLhQdhUS/shZMe4ZfKSZQ1y7GMitUYCp4P+W1DgQoGz8QjrsqHU8C0vgYsEBftFUPLP34JwewMnibrDNt7fShlas2kO15oZn99u257MktVVfaXcca4AdVzZwUFWDe8orYjTzieuoX5KJfyv0Jg9KcF309jf4BGDDqELuPO8+KhmfyNtx9Jnc5UriVs34OCHXsGtPRsZZmg/gwMn6BcJPZ5OYwUYNGoKCGJmNGrmzc6TuMF2zJ8gVbWo/iWFgdSrkDMaz2j6vupsV7jM6lddfPQ8JH/CjFUz8lJZF1y3EKCUHaF3jKxuwsCvpKIvdD8udHkynkqOP9Zk8xjXRyDuw8LMH90qbpjqvsajEMUigm3GD20C5RK7cLdvfMFhsMNBcvqQVPODx50JFJo8mQkH8sIOMva9vQF8IXDOdquwxcCyPdvfOJ+D/OU1BXrr6GmneACB8Kbdcw4PlXU9KqzzdxWouWvCTHYU3VHOUl9uQ8IKGw6ppbwH3PnzZiqoRwKf0bNvb5xH9KNnxcFE34xlsHgIfFboPsY+SRxKi19JczhgMmi5C5NSjS9jONXTWdMm+TT6+KcLoxysu/+mkw4CzDwwcMAjIup8CImXVbGbWZtVsAew+TI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199015)(38100700002)(36756003)(31696002)(86362001)(478600001)(316002)(66556008)(8676002)(4326008)(66476007)(6486002)(2616005)(54906003)(31686004)(2906002)(6506007)(53546011)(83380400001)(66946007)(6512007)(5660300002)(41300700001)(26005)(186003)(7416002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUdQZGt3OHZNNkFrbHFJaS9YQVZPMHRLL0xGY3ZBZDJCeFBaTlZCd1U5ZXVH?=
 =?utf-8?B?K0RYdnQwN2VRTG41TkRZeVo4ZUVkNHY0MC95TmdOK2NkLzV6RjVKTHV3RDR3?=
 =?utf-8?B?VHRpYnp6MnU0QXpjR0g2cGl2bERjMHl1UnRWRUczdmc1UjRSSll0bWNSYVBm?=
 =?utf-8?B?Z3plSmw4U0tndWVhUEpRZmlkaU5XcWU3ckRLMlJ0bDRMSDJJeUhsZ3ErNjY1?=
 =?utf-8?B?eXY4WEVEU3M4RW52ZnZDUHJjVThnWkNKUVRVS2pnSHAvSWZVYjBsRGZTZEFl?=
 =?utf-8?B?V2R3M3hsdC9UMkVYSC9tTnlwcWZuaXlrWWxTQld2UnhCdVRvbjVaUjI3dFR1?=
 =?utf-8?B?SktvaUNMbHFjNXFCc1lUY2JKL2hpbzhTbmU2bXZ1MFdkOXFtN0pMcWZUMHpw?=
 =?utf-8?B?N1JnNnU2WGFJSjBMbnZHeWIrdWg3WTJ4YWI2a1ZvemMyN2JVVzhMSWw4Z0s2?=
 =?utf-8?B?OFg2ZVArN3BLQ000MForZXd2bkxoZ0MvSFh3TTZpQ0JyZXhhQ0RmSk96dExT?=
 =?utf-8?B?TDl2YmcrR0xreUpBcGp5RmE1WkRoV2cxR0RqNlQwRXNmcVZBeWcyTllpamFJ?=
 =?utf-8?B?SjM4MVFmNkFZd0VncmFLUzZrYlRwaVN3Ym5JVnZwbWFqb3BtSlhXVk1TSGpm?=
 =?utf-8?B?UExVeGI3L21EZVpqUkc4OGVQSGQrMHRmbzRVUHpPb2ZYMHBuZGh3RXQ4eE1V?=
 =?utf-8?B?MTc1YjlNcFAyY1BLRUx2OWk5NXdleWhCSXR2WnB0b20reWxIbmZuSzlaSlNm?=
 =?utf-8?B?ZjNKZlgwODZ0OHFPcnZBWVpPclJOaUZYT0tjRDlNdG40S0ZTbjloQ0lkRzJa?=
 =?utf-8?B?TUZEa1VoUmxFVnJtUGpYbFBBc2VkUWpFdG92bjIwTkgvWkozR2xLVkhMQ1ht?=
 =?utf-8?B?ZWs1Nmp0NmpkUkx6YUJETGw0VHVlMkJDMnBQcSt2S3pTTUhMbVB5c0JhMDVq?=
 =?utf-8?B?Q2xhZmFjYURESi8yYVZVM2tFUzFiMy94M1pURnlwRUR1d3FzQnRHU1VVUWJ6?=
 =?utf-8?B?SjM3Y0JSakllS1ZFUnJBWG9GNGM5bVJwbDhwQWZlMkZHMGxucEJ6eFRBME5x?=
 =?utf-8?B?Z1FxTGFlWTZmYlVkdmxXYjc5OVFFSUQvZ0ZrbUs4ZStBNGpIVUVuc3BRaXVH?=
 =?utf-8?B?c0ZQaWdvZGM1L0F4WWtkRVlXSUozOXE4cnlhSk5qYklGU0lYcnh0ZVg3SnJT?=
 =?utf-8?B?QlorL3g3UlRrbTZyMmdoS3BGS1VxdXZHOUMxRFhsR1RzdGlyRHF0eitrc2xn?=
 =?utf-8?B?L3FnSkZWdnB0N1lYUHVzKzFYY0ZqdUNHNUV1YkFLTEJDQXR4clVDcytyamQ2?=
 =?utf-8?B?UGp4MkN5WU5mYkMydTZXU0MrWTJPY3BCaGI3UkJ2Tjh5Um9XcU83VFFxaU1w?=
 =?utf-8?B?ZVY4ek5uWDR0bUpML0VRSUluRkxtWFU3N05OdFFHU0I2aEFJZ3ltdXh3TVNp?=
 =?utf-8?B?MWtJSHJsUFlEaitGMytESjFQZkx5KzZUR1VwU3pKbS9jTDh6V2pBbkoxTitx?=
 =?utf-8?B?SnByOHpGSy9ZajZNZERDaXl6VFJ3ZitwVkU0M2xJVzlkL2kxSUNRV2RNRkZ1?=
 =?utf-8?B?c01FTXlIQ1RINklsZ3JkeFBOdkxkZGw5TjA0QmRFYlNXKzhOT0dCRHVIQlJZ?=
 =?utf-8?B?cVJCQ096VERkVDZtV20yYTZ3NmdHSGluY01sSDhSejNndURNWFZrVWJxeWpP?=
 =?utf-8?B?Yk83Zmp2TFFTUUhTaXhoM3lpeHhnZmpPSGFOeUNuQW9wdXZxRGtJNVFlVWJL?=
 =?utf-8?B?SG5EYWN1bkJrQ3l1a2p5UW9MOFMzMWNkL2c1STc2bnZWdkVTUmxmS25tWE5o?=
 =?utf-8?B?UHl3SXJUbW42NU1yeW9kY3NKRUw2cGEwd0IvS1h0WVlDSVFQRU9mWE5IS0Q4?=
 =?utf-8?B?dG5oMFU5VlIra003a3lxTzE2aDlQWlhRRFE4UnZEL1dOTThWWFdBcVFxeHlj?=
 =?utf-8?B?dEFkTXRwbE5DUC9RNHUwTDBobnd4NG9ZblQ2KzFJWVdxcnQvaGF3djJwSmtQ?=
 =?utf-8?B?R1JOWmFtUERreHcxaENQY3ZsV2RoUmxxNFpNUmtUa01PMGZMM0Y4cXNETmNl?=
 =?utf-8?B?VGsyRTZ3Z3dpVzZxOUcwRDB1cXJMYUhVOGNiQ0lJS1c1YnpSeHZqNzYvcXE2?=
 =?utf-8?Q?8E0ID/u1KocPwHpdSPX5wZxbc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a626bc-6f9f-40ad-4076-08dafe2c2772
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:58:02.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iw45stCCldsFb8Mk9a5PifMyA8uGxh3o8Bo0VoQ8CfldbcvKA5ykMZ5V0u0/o526UrFJSf0cR+CBgonUKj0yuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

On 23.01.2023 16:47, Carlo Nonato wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -299,6 +299,20 @@ can be maintained with the pv-shim mechanism.
>      cause Xen not to use Indirect Branch Tracking even when support is
>      available in hardware.
>  
> +### buddy-alloc-size (arm64)
> +> `= <size>`
> +
> +> Default: `64M`
> +
> +Amount of memory reserved for the buddy allocator when colored allocator is
> +active. This options is available only when `CONFIG_LLC_COLORING` is enabled.
> +The colored allocator is meant as an alternative to the buddy allocator,
> +because its allocation policy is by definition incompatible with the
> +generic one. Since the Xen heap systems is not colored yet, we need to
> +support the coexistence of the two allocators for now. This parameter, which is
> +optional and for expert only, it's used to set the amount of memory reserved to
> +the buddy allocator.
> +
>  ### clocksource (x86)
>  > `= pit | hpet | acpi | tsc`
>  

This hunk looks to be the result of a bad merge, as the new option should
go ahead of "cet", not after it.

Jan

