Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D36E64025E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 09:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451545.709310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11Za-0002zc-ON; Fri, 02 Dec 2022 08:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451545.709310; Fri, 02 Dec 2022 08:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11Za-0002x3-KA; Fri, 02 Dec 2022 08:39:06 +0000
Received: by outflank-mailman (input) for mailman id 451545;
 Fri, 02 Dec 2022 08:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p11ZZ-0002wx-R1
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 08:39:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c68dc11a-721c-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 09:39:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8317.eurprd04.prod.outlook.com (2603:10a6:102:1ce::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Fri, 2 Dec
 2022 08:39:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 08:39:03 +0000
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
X-Inumbo-ID: c68dc11a-721c-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhdTGmYm9IgI30OzapbNP+uwQ1KW1/A0OqyOG3xuUUU96bbWPRDUeDIEMn//zpNQn/AXGcNs3uM2VzayoJOQVhQDLpMnrfQcFE7ubXcR1f4DSxFCm4K0pEuFg/bq0qgTR/PdPj7mZJxOodMlFK7+z+GsXvOjuaKK6/56B9gMqbOsYRODI3Qq+BxVu7pXkctPs4sRt++wGTfVTcyf+F9nipu66AOswsa3AK/e5T1W0nUlHZaCBTdnJXU4XomjhjSNPSGc9cZXR/fAK1T6gTKEjX0TY8UxbLhL5SyNcLfmzdMBrqQWD3zCmjVG8SIEBm99gShvU+YNrFlAqV1AppL0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OWJ8qUSiYEjCXeJLwIb5HJ68rgWS3zgsiNnX43XXwo=;
 b=c47ZLNY6YyFmWLHnHtnfssR9nzohQG1wl7qLsig3emjQ5etIfAGZtzq8xbYLNpJ9RvR/9bDUkAehJbW3rRAT/nlZgxd7V7FuW+A3HuKk3jgMaklCJHDKIou2MpuUalf4GKg3A5IvqrZcx/wLIDD+uRJRttUeT8ZpeCNFg6AbDkcV6/56EzMZtdInrgGxNQ5C/iYsMhrVETduqKpZancH2rmvWDRMVraTyxcCTNPo3S1yspJDfrhgWBH2gZ7zSOjLgPRQWZ43BdAV0w/rTiyP6vxj9ZeZnMVPQUBiOj7JYNHbTq1p3Z1EeLc1BnNxUIGoD2QEB7mxheq8wen3EXLl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OWJ8qUSiYEjCXeJLwIb5HJ68rgWS3zgsiNnX43XXwo=;
 b=FAk9WZBeymTHwlxxcV2EbA2sNtwP3oJsFvgAXt2UxjljWWjYcEEjAufiT2Wv+zyHu07QmkkRBRZbCAgWLo4JNE9FZMv2FAihysd3qQqDMpsmE8QbDuu39lPzqypzBvheXaNJQDRBplPT9cstUdVZpeYkkeGzHJFO7PKCnYLNIgm/aavcNMdtT6vFD5ogUNgMX/K4eSf84UGsdyfZ7/hfApWp3AmxJx4f64ErGY6yKFc8SYhsyadfV7P7CQ6t0cdxiuy/J2ZMlvOWAjZ/O+kmhoIC/fjfU7sYnXjyXQSnuzoXUX1ADqlyKtPHGa9HFwEOEUVqCO3qroz5DRCss6V3gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9a8045d-c31b-7958-b325-0ee223fe723d@suse.com>
Date: Fri, 2 Dec 2022 09:39:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1669888522.git.rahul.singh@arm.com>
 <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: c5741a9f-05a1-4a69-6f05-08dad440aa68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BcI7th0NG+zcmtfr6ETM/TPCnIC3v6K3R2LthcWFccraKypLI5Kdv0hdVsyblBO6sLRrwTAGYCzUTk2ekWaaQgG6hURRgYh6t8zNy30VKiI0xBay0b6+52ROK1zSvuymBG2jL6lKfx6G3D2iIMbTQ5NtCkomivsZ3rba+pRkIyAhHtpdLXLHQ7HRCULOrQs+F3VkP9pDwGb2JKxtnt6pis5Kkj+NYfXsMcjX3DNDbErYoy/Y4fmx1SJ9w1XwBDtbYQPHTJ/5dY9s2e4vpUHxbJr3aIQFH7stF/GI1xZ47FfouiWxnLKXV+jo+NDj0DzF+j4/7AEVhg+dZVQemhmpWf1VG/GyP8n1d22NrRH6a0V9oMoS3TkBFZAIwBM1PyKY4Vu6pTTNiKCKD3BCwp3LUFpErbsasQ/DxEMPp9rjfW+hA8t6iUzPCS6brGjjQVJreEscGTLY6K9kkoasSVVMH5Aq4FZi3g+7oTqBVIziCJgAa+aMMow3B29x/ariOM/So67uNpBSUWQmXb9tmNfWjC/7u3QTsuJvI+T++NSksZv4OjUMNOjK2yQb/rn2CL3Rxi0Pqo3yK8UbfuYnwfiQ901kTy16P0qi+mAAwrwcNuiJrVzPJPSh9yyPa/pAa4fE3cd6FQL/kQ/wWcGrgx7Qcy1ck7Cd1lJKmudJHhUlSXJ1kUP+acfPsST6WsgAiNplc+IXc2JafcdMpexlW2yn+qx+P4B230HyfU7ZZxPWEePtyb/tVRgaNoRnajuMnFM/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199015)(31696002)(86362001)(316002)(38100700002)(66476007)(66556008)(66946007)(6916009)(8676002)(41300700001)(4326008)(54906003)(2906002)(5660300002)(8936002)(6506007)(6512007)(53546011)(6486002)(2616005)(186003)(478600001)(26005)(31686004)(36756003)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnF5NUdjYWNkbzRrT0loSklNVU0ydTF1WWozTTg2aHQ3U0s5cCsvUkFld3JW?=
 =?utf-8?B?aS9vTzZvS0ZNczE1b0hwcnQwVnFIejZYRkxjbVJCOCt5ZE1EM3J2K0hFYVNZ?=
 =?utf-8?B?T1FRSDhkTGhObjdwemwvQ25BdTdiN2xsMGFFOFVqd2IxcHBlaG9HV2RWdHFx?=
 =?utf-8?B?b2NvYmtrekd1RmQ2Y01vZU10eXBIb0RKd1ZaQ05VcVk3SW0xbmFod0hjQlZk?=
 =?utf-8?B?UWlrWlpMS1UxRk1xcXVFb0NtODArMVlLaWtIS1pLOFdHV08zQ21YcGRKQ1hL?=
 =?utf-8?B?cFRwejZkMlNmZk5zT1lBeGQ5TlJwcXpBYXpCdUpJSURhY3Z4L0pDbk9SSFVr?=
 =?utf-8?B?TmQvYzJhMU5xcmxjSy9XWlh1Um5rTHhBWHNHdEpZUkVLciswV3RoNG40SDRk?=
 =?utf-8?B?SFl1TjQ5TW04L05pWk1zS2ZadFRKeWNYcXRFK2diWmRZN1BGOUFuL2VNVXJF?=
 =?utf-8?B?MHF1eHFzRkRNOWxzSERjQXJKT1hvMVl0V0U5cUlWVkJsVXdRSTliTndjaTVN?=
 =?utf-8?B?N0tuZlVHbHlFVWZWZ3BSWGU3ZEw1R1JhQ3R1VFAyKzFld2ZvdU9PN1ZZS0do?=
 =?utf-8?B?OGEwakhBVlpCVSt5bU1WSHlKMkNqZ0RpSDM4SXlUd3BGajhYSi9tUXZteWNF?=
 =?utf-8?B?dUdZdnJJMURWMnBGWnl1ZnFMSlI3TkI2ZzRjQVN1dzRZZHlLRFh4NTRMemNh?=
 =?utf-8?B?NWFFV0RzMnhpMVhYaEt4VkVkajBwdXJCMStta295KzNxRjI2ai9vUEgwM1l3?=
 =?utf-8?B?K0VlRDR5cjRLODFDb01mNTV1L1VrUmxjU2VjazBjSlc4Z2R5UDBna3pEMXRy?=
 =?utf-8?B?NUxubzVVKzJRZ2JGR3YrWUltWlJFT3oxdkxncGxCTjBQS2ZJemNpQVdSRXVj?=
 =?utf-8?B?aDN3N0h5dXpGdmNJMHRzL0N4N0I1dEpCU3ZzV05weG9wZVJIUG9Vd01IRzla?=
 =?utf-8?B?amhXcElxNW42QnVNb21wbGc0eEVMaWVLL2RBdUFhbm50b09lWWdjdXRoVDF6?=
 =?utf-8?B?bTZLaEh0MmZhYkNFUUlsWlp0RHlGY3Y3SGNxRGpucUZLQ3BZZk91N2JTZ0dW?=
 =?utf-8?B?aWcwVlhHVnFtOUFLWkpHV0QvYTdxTXNvNVFodHBwQ0VCeWg4d2orbkpwOXV5?=
 =?utf-8?B?MnFQSXpleG9ZM3kzbHpwdjMzUGJ6VzBaOUJoRktiR3ZqcW5rTHAzc2ZnWmhR?=
 =?utf-8?B?ZGJqcUI1WkJVOUZoVGFvV0M5ajJBNitkNDV5dU5NSWRzRWExdmtCeWxwbkVu?=
 =?utf-8?B?RHZ1c2syZnd6ZUltL0NBdjBqS2dJYkNxTnZLMFIxUi9Ma21QS0g2MmhjVER4?=
 =?utf-8?B?UTJVSmc5U2VnbnZZQTFkVlZ0dXp0S3kwaVl2Zm5BTHhDbU5OU2Nwc2tOemR5?=
 =?utf-8?B?ckh2eGxlWUNhOHVscXdtVUNJb21nMlgzR0swelh0T1poSGMxOU5EekFmNWsz?=
 =?utf-8?B?bEN4eCtpR2xwN2RVb01tNzN5RFJ1a3BqR1lNUFlMZjByb0NpOW5qblNueVZ0?=
 =?utf-8?B?TDZHQm9DOHhBb3JDdHVGWld0VFV3bWVPZng3ZnZoVlJXbzQ2cUFqZ0FHN3RQ?=
 =?utf-8?B?RG0xSlE5ZURwZnBDTHRTR0hZYm91dk9YZkVHZWhqZnkrK2F5c2lMZ1pEMjNv?=
 =?utf-8?B?ODc3OWhtUThXYTUyNDFObzYvZFZYaWNrUWx4YWhIMjhlR0tjZmthUzBYd3pL?=
 =?utf-8?B?dlcwcHNLVFJ4T1FBcGdqUjRuTHJNZ3VXRUhTRzZlMUU4MEtTbm9BbFBWT243?=
 =?utf-8?B?aExGSXBwdUR2M3RGR3FwNVlIMFZqUFNzREF5YXoxUDZnbEIrdDhqSkhjbkhG?=
 =?utf-8?B?RjQ2RFhrb1ZEOWhMdXlwSDYrS1Q5QkQrQkRTdjlua2F5NnpxTUw1Vks0SEFq?=
 =?utf-8?B?ZGlBUzMyRm92amswOGRDeDVLOStqZVNOY3habFpqNTA2WEJIMzBpeWJaYlEx?=
 =?utf-8?B?bHdEQldWY1pzejNvUVBmLy9tcHhxWXN4cUttdnRGazRBR0hvQ0xKKzhNRlZF?=
 =?utf-8?B?RWlUMlZkMWlna1pob2RaT0ZydVg5WXNZRnU4SkpMMk02QUp6dk94RU1IdFFu?=
 =?utf-8?B?ZDBHZmZva0EyczZQdmowNE9vbzJtSllvM1o5VWkxb0FSbUE5U1pSSUV5dW4w?=
 =?utf-8?Q?BDjc7YzylJcvKIHQveVYEVMpF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5741a9f-05a1-4a69-6f05-08dad440aa68
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 08:39:02.9875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylpIgAS8yAj8MHffdWmhOIgvyoMd5oWjWBhTGjhTbYhJE0buqypVAwuadYfMQuf3zaY6AaFzRZ1y2U0s/Lcbzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8317

On 01.12.2022 17:02, Rahul Singh wrote:
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -35,6 +35,12 @@ config IPMMU_VMSA
>  	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>  	  translation table format and is able to use CPU's P2M table as is.
>  
> +config VIRTUAL_IOMMU
> +	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
> +	default n
> +	help
> +	 Support virtual IOMMU infrastructure to implement vIOMMU.

I simply "virtual" specific enough in the name? Seeing that there are
multiple IOMMU flavors for Arm, and judging from the titles of subsequent
patches, you're implementing a virtualized form of only one variant.

Also, nit: Please omit "default n" here - it leads to a needless
line in the resulting .config, which in addition prevents the prompt
from appearing for user selection when someone later enables
UNSUPPORTED in their config and then runs e.g. "make oldconfig". But
perhaps you anyway really mean

config VIRTUAL_IOMMU
	bool "Virtual IOMMU Support (UNSUPPORTED)"
	depends on UNSUPPORTED
	help
	  Support virtual IOMMU infrastructure to implement vIOMMU.

?

Note (nit again) the slightly altered indentation I'm also using in
the alternative suggestion.

Jan

