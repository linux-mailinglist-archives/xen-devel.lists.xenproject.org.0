Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5588875BF17
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 08:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567364.886318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjvb-0005N2-Cn; Fri, 21 Jul 2023 06:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567364.886318; Fri, 21 Jul 2023 06:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjvb-0005Kg-9o; Fri, 21 Jul 2023 06:47:51 +0000
Received: by outflank-mailman (input) for mailman id 567364;
 Fri, 21 Jul 2023 06:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMjva-0005Ka-9n
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 06:47:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81517f35-2792-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 08:47:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7875.eurprd04.prod.outlook.com (2603:10a6:20b:236::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 06:47:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 06:47:45 +0000
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
X-Inumbo-ID: 81517f35-2792-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzZjJY6hhXX2aM/lODMG98VA3qeLPjJdRbpQAuVusO6i669oGeE0BeUg9dVMJqcaDjsvjihZ+RF02w3i6otEhRCENtlSw8GjuVGvY4y4v65MMykoPAt5r5GHWdNOtrWus4SGbwNgukjeSIH6ziIh5nC/Q2Hw9TCgGzSZBDOXpYgZCyWFkoEEf23ZP3QA6EsbPNbOA+1kvUP9pD9LhwS2Uns9B1kewphiWy9btQPYBK6Rn01g85JGg4pgUFppYXXMskeA/VHKzo67ryJj1bRxg0qOsU3uCO48SyDYGmcJj4Yin6VuLmReoZJm/Y5FdFqjVo+k8hCLCWghSofIFxCBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcfVGahNlNID5Wlbevt3ZC6KDLW0OY6KlwdQk4viVF4=;
 b=XQBYCOiXWQIsLx+J/i/ruUjk5GZIt55fBnoJVJQ57Fd4ZR9Xlb4td11y3TkRAW/dh2c4aJ9u3UiRcBVmLwzpQQ46GPGt1iAMsOZVD2fU0nqeQ+nhEa5cZl0xC4CAoG/ojBjD+3Ea8mnQTEjGXOltM7N1TP8fz24VFvVITWglrjXN4Sx8BqJQ9WGA3uBk0oQtbEmxirOxCjQOeOdA4CTMw5eORvkBdDlKG1odIbWijvSnXnb7RFEPrnNteYbv1Gh5QgFNeqcASE7tZWstairXrWTqgA1xZQrekpFxFuCHw01dkNPIA7zQsXsZTwOJxpCafPQdS7hWNL/WpyODXS1a7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcfVGahNlNID5Wlbevt3ZC6KDLW0OY6KlwdQk4viVF4=;
 b=v3p12VSlhUphb4ms7Bgts3KqWIC6S9/b6INTfPIyNb+wOFoVpGbBQM2FkbHGimRFOGrxmpYx5PB27XoS2jj+/GmKQI4aNge1hAj0++oyyi4TSslYedyFJ68nqGa8UROIoDWpMrTR8ehRS55oUSFLoLjUQU3x9OdSvWDNBXuhe42ir/3zqjZHZN3n2QHM7Nt2pIIsw7YhEFxBgnlD1xYXOA6T3DKfSBrxKnMh2Hua0FfwFAS+yVwNrM8/zr+mLp9LPfy9h/h/8UDGulMxZX5TjiNyhM3uyqqDqv4X5aSgNZE4nONzf3/rpAl4AmnKHYHS2WG6Vbc3+Jg20c8WCsXDkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <795a6937-a50e-91fb-f59e-7a4e3d8f500c@suse.com>
Date: Fri, 21 Jul 2023 08:47:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] docs/misra: add Rule 1.1 and 5.6
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230721002322.3457802-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230721002322.3457802-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: f62e841a-2168-4f56-c4d9-08db89b663b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	osQEeDBAOZijAiTFrrD1jJLDLKavj0m02dQhOQ8wvZso1yAXheR6zSavAwCz0snK9Gi3OsDmpQZ32tc+ysHzxdkC7Zst533kSisqYdOXabp4xVIFOSWs8VgeyNQbuwTy4t0wRrssVXXXRSda95NqyNT/C06/JrmApTwFpzRf4aebZfdxKpLQeT/21/HzTMsS118RMAp9davX2fozVEftXXhZH8ULwy3YxIFIlm66mJZsJNx3UQ612D/tQACwbIGDyu4BLf7P1F1Gkpvc2/dieoEr3HHvpshbmY+yU1QPVGHRzi/cyHcJZUzade9jYo+nIyG8I0EAHCxTwkG3TqH5XZGvXxBE+h2rtnIzAMo1ORnKjUDmVXtZTYG/EUb4aWkyPfVu2ibHQ1WYiVtaokKJzg2ZVhncsZkh1mBIXtn6RylStLn5HZKHwH0lHecD9wDB0t//adwnt7uyTchNvndFiDKHA0a7eqcUwwu+yGeNamENlo/WpA0a0i2Noc4Q/KHBVp7jWYPekg+oHhNdQkzKyGrE2A8IBFuPHKtoIuZ6ElNbmkfsLXdtd5Xv3Eidzp0GRxG5Y/qLwOB8+7Tg9l+yRJDPURhk8zLyaJDwn1z1UK8s/bL1gqkGoxsnoGiNCbtPv9Wj/WblGNsn69KmpHfU+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(6512007)(478600001)(6486002)(6666004)(2616005)(26005)(186003)(36756003)(6506007)(53546011)(4744005)(2906002)(66476007)(66556008)(6916009)(4326008)(316002)(66946007)(5660300002)(8676002)(8936002)(41300700001)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkNtODlhVEhWNFJuVEplcnBuM2FCb0JPWVRwS2t1UWpqWEs1SkwwOTN2VnZt?=
 =?utf-8?B?ZWhkVytOeUs3WlZ2YXBzUnRvdmw5NlE4ZFNuRUlDWmJqUmNtL0ZDYnZhTFBB?=
 =?utf-8?B?cDVFemM5em1UWU5JQWh2NG1sQXhSdi9RZDh0eGgrdWp5ejJMUHlXenJOajhE?=
 =?utf-8?B?SVJVWFFLQmVIMDBabEh0aUUrNHFVb1RYaUowQ2tWR0g4U2FtR1pYQjFZUCtO?=
 =?utf-8?B?RjNhVENnb0pSUUx2Tzl1VUVHNHRwTDRZcWlUajJGT0thL0tHeFdDeEtzbERX?=
 =?utf-8?B?RE9HUUJtTEJhbVErdk4yY0R2TFZDZzNzZTBBOHljN1hadS9XUUQ2NW1JUTJG?=
 =?utf-8?B?UXZwS0grNS9aSHd5emUvZEppd1QvZCtzVXFyZTJSNHQ3WEx2YmlHUUVQYjVr?=
 =?utf-8?B?V051ZFRRM0VtdmgvV0pSZEpSVTNCa3NqbVNMWDJKcCt6eEFaQVZ5cDVKcllj?=
 =?utf-8?B?eTdrak1GLzNCZDdrTnBXQUxBRWpVZE96T09HRi9wWnhCUDFFUW9TSUZXTlJR?=
 =?utf-8?B?N0lBcElWSElVdTFHVEw2U0d4RExWRThMbXNaTGhCQXVNU2xFbE9CaGRCN0Qv?=
 =?utf-8?B?NWgwLy83a3NkTlAwd1hrV3pkNFBJMG5rOE1ONWk5TG40OUhvSEZuNUM3Y0R3?=
 =?utf-8?B?bGRlZHdISkNRdjQxSHRkS1hsYW9vaHNtRi9jR2pGKzFjenVOeC84eDZoeHJa?=
 =?utf-8?B?aC8rNGRCM2xONHRkWW9Vb0gvNjVidnNvNlZUR3FCL3RseEtRYnc1ckRTRjZN?=
 =?utf-8?B?M08wS0xWbkhYMmRVU3o2M3piYnhSb0YzZFZ3ckJiY1VneDRFNm0wR2hEcVMy?=
 =?utf-8?B?SmdZSzNuOGpHeTNBekhhMHVyOTJDNDluMnd0OFFReUxkemJJVUhlVXpWUFpO?=
 =?utf-8?B?VmNKOWtESnhSeGpQd1p5WkpHdCs4OUtXNU9DRW9GRkFRblhTSTduTWZLVGFD?=
 =?utf-8?B?Sm84K3RseXI5alcvKy8xUENLMUdFK2w4Uy93aGkrOE5VZHl5S2pXREo1Ky93?=
 =?utf-8?B?TXJhZTdiUHJkd3BNUE1vRjZNVFEwV0xoaG9vdkV4TmpvR2NhK3lIaDZxUGFp?=
 =?utf-8?B?RlpONHdSSnFtb2FoSTdDT1ZPclhhVzdKdUdTd1ZXWVg2bVVIdXh3OE16anlz?=
 =?utf-8?B?SlFqdzVQVXFDc3NGZXIzVExBRzFXY0NuU2ZRTlNVME5Xd293QmtNeW9KYVJ3?=
 =?utf-8?B?YWhnYkI1cERVU20vMzB3dC9vR0dqb1ByZG1Xci9MWllKUnh6UUd3THhQWSti?=
 =?utf-8?B?d0t4V1VhWTJwWWcrWE9Bb01qMDhIU1d1VERWWnlYVmpzTGRnY2tDYXYwZEtv?=
 =?utf-8?B?bG9XV0ZHa2xPSk92VEtybzgxMGlibmhldGVWSjlJNlRTNFRIalh0WGFoaCs2?=
 =?utf-8?B?emt6L0d5OHIxdnFGVGRpa0xlRFl4Q3kwRWdRWUIwVUJLWWpaS0V2dFQxRHFX?=
 =?utf-8?B?MlRhYW1wLzVxRUpmeURYSldwSkVIb0VYWHFORzc2dmJnMzIxcEw3U3dBUEhn?=
 =?utf-8?B?TDlrelNBREF3R29WcjNubzZOQk1WRENERDRmMVZRNUM4NjhaUWtnTC8rZ3kx?=
 =?utf-8?B?YnRzN0hBOEhTN0RoODRSTlVVN0RsSkRheGlJYUtuTHBtNjNUbUVOdHM5Mkg3?=
 =?utf-8?B?ZE5jdFgwRHMxeDdWUVNHbG5IcjJIYzdlUERLQ1AvdkhlQVlnYnJxemswSk54?=
 =?utf-8?B?dUhjclRTSWR6Y2JXNk1wdTNjakIwc0h1VElZOVRYSkJtOFMzd0prVUcxMlBJ?=
 =?utf-8?B?a1R2N0xHdldlTUpHbWF5U281RlRFTTJjM0xENGlCRmx4RkpwMEM2UFkrSFgx?=
 =?utf-8?B?alFHZWFld0kyRnFEWUlwaGVXTnorb1NiRm1ibXAvMFRwK0laanJsS05QR3lr?=
 =?utf-8?B?ZWsxRGpSa1FUSTVFajdlU0ZGR0kybXVxUmxYWXU4bTFGWWNiSlVja3NwdGVs?=
 =?utf-8?B?MkV5ZjQ5VUZhT1FjNmx1MkgrdWR3WTFpT3JCSkhhbTdqY09sQ1F2dXJpelJz?=
 =?utf-8?B?ZlJYL09aYXBESmhsSjNBVC94V0NaZEZEcUJPMEQvT3dtSUQ5eVlSK3FJVzBE?=
 =?utf-8?B?cWVWU2l1MWhKQlNoOWx0YlRXd1BLTHRFNmxxVXY0MFAwMkxUSk5FNWFtR3dF?=
 =?utf-8?Q?620SvBFlVnFxfmr5uS2NbGwGn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62e841a-2168-4f56-c4d9-08db89b663b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 06:47:45.3949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAXc8xXuKRog4rCmXrTIdAowV7aOUY7s7f43p4uW6riuJpfdpp/PAXLhO2oZKx5D1CVO9BiKYTeOUwY5ljGh0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7875

On 21.07.2023 02:23, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Rule 1.1 is uncontroversial and we are already following it.

Except for our extensive use of compiler extensions. I thought we had
agreed to add a respective remark?

> Rule 5.6 has been deemed a good rule to have by the MISRA C group.
> However, we do have a significant amount of violations that will take
> time to resolve and might require partial deviations in the form of
> in-code comments or MISRA C scanners special configurations (ECLAIR).
> For new code, we want this rule to apply hence the addition to
> docs/misra/rules.rst.

May I ask to insert "generally" ahead of "apply". As mentioned I can
see it becoming necessary to add such in new code, then right away
with deviation and suitably justified.

Jan

