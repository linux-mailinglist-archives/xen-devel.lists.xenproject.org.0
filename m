Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4EB786743
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 07:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589768.921796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ3KM-00014R-1u; Thu, 24 Aug 2023 05:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589768.921796; Thu, 24 Aug 2023 05:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ3KL-00012M-U7; Thu, 24 Aug 2023 05:56:17 +0000
Received: by outflank-mailman (input) for mailman id 589768;
 Thu, 24 Aug 2023 05:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qZ3KK-00012D-5P
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 05:56:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edfae616-4242-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 07:56:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8396.eurprd04.prod.outlook.com (2603:10a6:10:24a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 05:56:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 05:56:10 +0000
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
X-Inumbo-ID: edfae616-4242-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJaOTIAFjZUye+SGRv9YQgNWlHyj9SKy5CgAiKF/Xh5xERrIdYlfkunNiqQfSnt5Tx8DDrnkGDTZG7DFSSI/IgeMwjBXF7wTLAKNjFOTrFzdE5W3WOfmum/63aZ/5Ip35mnSSKJoA+0Lt8GUtX8gf4eI2VoQbo9XmlcKuyxziZSsC98C3rTtMq11VYz9FEQbq1bvlDUcMRFQaldZOdp1tDXOPh0WQvuiDvYNfDi7gHwESvTl6qZCcT78EqPTe+jlVULvoHSYgDWaOhZDwZRJSNReNQ2jCHi0jKKWuqdSXdgx9wIGvdBLNQQJuhmcp+dPjZuc6licRxfQc+Mq2kHUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbMDKYXHmEoQyj1A3yy35uDnidbrrMOCLJc8HuTCpeU=;
 b=n0rxAzwuoUQCwSKFrjb4VFgeetYQfQOauPPoIlAZmJz5rNbJK5SHapU8VYvzYjpX1DSz2+9uqqb5DDdYy1yhSoy312cO3gzV1ejuVao5RqwzFtXYamKCjtVyi0Rrtite0IIH9aB/GFUBSNzvOwKMpWbHhb550AGu6TVjnQ8UJIdNUCTOGX0opesPDGmu6CSHWouuhxP/DRAI4Z65sqz4KHuH/Rzj3tzgs/hyQZ4WItRGfLewuXlvbpD1KZDX5XhDmxRQUDwlzeK87H1lKlHGI0kbf+7Zp+6HQoJKetldNERTk4dHCtDwet10l+8YmfB37N9Fl3bON/jMWVpYuG1Scw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbMDKYXHmEoQyj1A3yy35uDnidbrrMOCLJc8HuTCpeU=;
 b=RXjuNvhSUxmvfWekDghgK0Aw7XLLGXGwxTDauqet7eR8r1tT98SaICr9Z+DxiDA3ZLLDcP4GuB63qWGqGe6e5eBF8iljHcd1urmWAPsXZn4c44SFr4hdiGcdtWYo430RFn6YvKpRH9IOis42qzWYd1s89xGsFXzYfK8/8KddqrXV62CErqF11aiE55gfFL0MjFLwaOGlBZl24GsbWcqvveVcxBMnjqyFxxU/RagrgJ6abHhTHbksAwT0wnanoUdZNXSkO6FTiS+YZoCmhJv/teX9NRxkYV3U+OKuCjPbpIWoueDY9oFZZalmbyr1HIc+VklnmsG+06rPwmsJSBD6yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c51a46e-3eea-cffe-d31a-bda04cc43a78@suse.com>
Date: Thu, 24 Aug 2023 07:56:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/8] xen/common: Add missing #includes treewide
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <e786dd5bbd6c235c69f5b2e49d485397f155d393.1692816595.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e786dd5bbd6c235c69f5b2e49d485397f155d393.1692816595.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b214d12-38c2-44f3-1e19-08dba466d105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pnn/HUwdrcIqx9/Cskm5T2ekrYNTbfN60tIcZYPwj9nC6PwZQBO13n4zOaAEHeQgG0YvLucKY39irOIOvbCg0ARbSGAPp+6cQo3Wu9okkPwbYx75BRMqz1AZYxwYT4x8v/m/0QQqyJwfkCiPlwuyovcMxk3yXfnxUNwVvvbtQp52F5p1me/PaBmDX1mnNL0Qz5Jdk27NlmctXMF4F7+3g2nZDB4z1lAXh/RjR+TYGgn1gCZ+42fllVekAN0hAjAfANbVE2QHVWc9oazKP/CtqHEEeaT4Rzw9foUpy3jfdqoUjoYpPIYlQ/MGUuXGNdGiwiqk8T+CxIBtPDsgAMWJElHMvDtCWPLugfg4f4C07rwmssNmjcLOxirIHwHs9T9n/91egU27ddKO12QVfKARJYE8vrCjQqdh/NCiJzdH0udqRcBIlQoPP0TtbPs1B1q4bRNvsLngwlsEtQhkyYYPfus1lznLhr9NLluIt4z7LtnZ2N7DYzPXbuPrBHvpDffqvluzBL0vFqQzk7D4BuSm+JqbeicB7/9RaJKWphfjTU+IsloAt5F3JM5WVnnjYVqVJv211Jw+MACBXXd4dfQH0bou6HsVPxNQzvY3Zj4SlpMFQ1bRsSWYkeRW66vIRgpQsVuwH/yF1k0t/LdMCcWE4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(366004)(136003)(346002)(186009)(1800799009)(451199024)(2616005)(5660300002)(4326008)(8676002)(8936002)(36756003)(4744005)(7416002)(26005)(6666004)(38100700002)(66946007)(66556008)(66476007)(54906003)(316002)(6916009)(478600001)(31686004)(41300700001)(53546011)(6512007)(6506007)(2906002)(86362001)(6486002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U050YjJkS05scXNMTUkvU1dRSXlRVGNwZFFaT2pGcTkyWFI2bHpqSzg0Nitn?=
 =?utf-8?B?N0Y0Wk5xQ1FwSlFLaFJPamR4RjN5bUZxZHBtTDVsRnEwclR2bXR3TE1XT2h2?=
 =?utf-8?B?NG1kcVFNRkkzRTJIbWxnTmtZQTh0NUdiOVNZRDI2b2lBa3ZtMTl5V0dqdC9O?=
 =?utf-8?B?N3BtVzdiekYzZG12cTFscVp3dkNVTkVQd2JLcGVpRWFpbjVLVTJiWG5EQVJM?=
 =?utf-8?B?alIwM3k4US94d01WckVPM2U0M1dnWndBMGRFMGxqUTRaTy94NE9OcDlHbmVs?=
 =?utf-8?B?U3ZJTWVBL2Rid0lYRDFQbmRIK2Rqb2VVc3V4MXdWeXZtL1l3NGpaTDhtNlFF?=
 =?utf-8?B?c05JVklGVkJPZnZMOEpmNmpzNnhKY0VrZUhqc09lTUhpbm9EOWluaFoxL3hO?=
 =?utf-8?B?bjUycjVjNU5oQzJQWHdyQmRiNlM1bitaSWNXNVJCYy93bjZDYU1CcDZvWlhQ?=
 =?utf-8?B?YTlTUkw3dHFtWDBOWXdGWSswMjhSN0hBV05IRElSRzdDZklrQzZzQjcwYXRa?=
 =?utf-8?B?ZFk0MnJnZ3hnaGFQVTRaSDd3cGFyZjkvd0hDOUJHc3hWRkVTcVplTjI4RzlP?=
 =?utf-8?B?Tm9NNGFhUFJvWGtSQ2padDRYaHplKzIrZGloTG0vcUxBZnl0Y3o5dmJXaUpR?=
 =?utf-8?B?bmxmTlNadVRhaXN0b0htbm1NUkpBeHZKQ0lDLzBOalN6MEFpeTFWSGNQVm9F?=
 =?utf-8?B?ZnZXWjVGeEw0NXVPbEVrdU1BWHlCZWxJbVg5aEkvTmdHQk9MZ2dWNTllbG43?=
 =?utf-8?B?SENCbmFYeVBzOHIxRWM3cUtLd0JCOVgyYzI5bXd1V0tKSGJqZVR0cnNlVGpx?=
 =?utf-8?B?QnIvdUIzWWxJeWNzdW9rSW5OVmduejJaUzJ3SVNLK1RxdkNUdnZ4Y0dudUxZ?=
 =?utf-8?B?WHV2b3Q2a1VkM2M5cE9EdmtJSHJ5YzF4aTRVZmpicERJSUxNV1ZIcW5tbDlO?=
 =?utf-8?B?cTFqUnlaR3FQalNtV3V5SHoweFBoNE5xWlhjMVNBS3Y3UFJoNFQrQjhRTEUz?=
 =?utf-8?B?c3gxcThaaWVRN29Fb3U5V0RxNmdtTm03dERrd0Vsbjd5UC94WHppb21XU2U3?=
 =?utf-8?B?dU9NZ1pGRzlyL2FNaDZyTUZTandZSHpFbHFQbGFuZXY5d0ExTXo3cXBNSFl0?=
 =?utf-8?B?b0w3aDYwOVdNdkVobldyQ094dEJTdm9kZWNlejNTMmlLcEJMbUZtajZ2NjJm?=
 =?utf-8?B?cXMrSEhHSTNTRW92NmNodE9taHNWeTlOM050MVNkODlSdUdvZWdWZTRORjRj?=
 =?utf-8?B?RkYvdDUvM21VQzVpdzBoRVcyZXlSSjQ1ODN1UVIyVUUrNERCckN1Wk11b2ZT?=
 =?utf-8?B?T2FUdElZTHExSmt4UHpOM21tblNqQmFCY1h3ZEI2OHlFT25kbkpaWGlFMEtF?=
 =?utf-8?B?RUtHaW1uV3JJYzR0WVZqR09qc3plRzlCK1dVTjhoc29PNlh6R1ZoRnhMYmQr?=
 =?utf-8?B?VGxYeXgvenRHeFgyUUpyYUpLd2lBMG5aUFgvbUtRVUIvQXVnY1lvWmFzSlpV?=
 =?utf-8?B?bmtsaTAxWTdaL3c2cHFTNGVTb2xjakg4amg5MWNGaFBzQzd4MUR2SVhWamp6?=
 =?utf-8?B?MjFnNHNUWDA1TVVISjZKWmxFRDF5cmRISm9DdExDNzN6aHplaENwajArUVlD?=
 =?utf-8?B?MmR0MnF2dTVicFE3TmpRUmpLWnd0RUM4Wkd2bnk4dVYyZk1CTnBMMVFPOUVN?=
 =?utf-8?B?YXNoQzNRL29qdUdya2ZLeWtLU3IxT3Zlb1RDMHRhQlRRblNsalZRRUlTeE1v?=
 =?utf-8?B?c3o4QnkxSE9BWXhEZmJzZ3VHdnQwOWd0MXM0Nkl3dnNCSXo4SHN1bWJuYisx?=
 =?utf-8?B?Q2ozTzFFNHZpWnV3amw3TWs0RW5nTTRwRFNPY1RlQ0p3Y1RvMTBVM0FIeGxQ?=
 =?utf-8?B?OEVaeUR1OCtsUjJDUDJCOEVPWTZ6L0lMUmYyQ0R0RjM4WW1ld1VPK2drczFt?=
 =?utf-8?B?N21hc2syV2JUOTRXcElpNjVrbWFuRjhxc2V1WFRiK3VuU1NtK1h6dGwvR01G?=
 =?utf-8?B?bllXQXB4THk2TDVUN3hFWXlvcHRZc2wrU1hKMGNCbG5MeEVtWmtQdHptbWlM?=
 =?utf-8?B?Q29ibHBuL2NoSzB3YmM2czZMd2hkYzdJYUxQWVhZNWlOOW9BdTNhUXVEUkt2?=
 =?utf-8?Q?2RhioDYpyhWAE3EQ+IGrQvEeq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b214d12-38c2-44f3-1e19-08dba466d105
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 05:56:10.5726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65wRtISdEr3EGGNGfvEnhekovb4KE29zZlSj9zdKqZssqoTOo2XJ/sApI57lDx4VaNkq3b0LNv7dA351sTpTCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8396

On 23.08.2023 22:07, Shawn Anastasio wrote:
> A few files treewide depend on defininitions in headers that they
> don't include. This works when arch headers end up including the
> required headers by chance, but broke on ppc64 with only minimal/stub
> arch headers.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



