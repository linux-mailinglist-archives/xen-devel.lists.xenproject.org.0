Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CB86D9446
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 12:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518822.805721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkN0x-0002QV-CF; Thu, 06 Apr 2023 10:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518822.805721; Thu, 06 Apr 2023 10:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkN0x-0002Ng-9M; Thu, 06 Apr 2023 10:38:47 +0000
Received: by outflank-mailman (input) for mailman id 518822;
 Thu, 06 Apr 2023 10:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYqh=75=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pkN0v-0002Na-QM
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 10:38:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32f213f8-d467-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 12:38:43 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Thu, 6 Apr
 2023 10:38:39 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 10:38:39 +0000
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
X-Inumbo-ID: 32f213f8-d467-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck/VP7+dRStZS8MyRj85qyc5ntU7HrUhkMjLWeSLsVvjRy8spyopnKIJzdudnmpYCK8v2xisC95TvVzjdNbWWxHzVZc2dT3KP15FdmPBHkSnqZtVEp/cfjNXYVTxaeaUTr7c4vaQ3xhGYm7sCjhkmh5B4MVln2ab+mmIrUTE+a0xMTpwQYOJHjMXNw+NYZIsKXPuwQRg4GxwviG2dEiDxuIiILn6kijCGdsEL3bB1vPhqVd2BB+3s1MgknqcJjpOMS4PftvuZJAcFGHUcj02amXqSUhe60QV8CAgfz56G3c0ol8sk47jpSRhGEvu2V8QyBAcOiN2jWSx3PDB2nR0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWk4Hi1mF1FVJiebOCrXEQgZdKxWG/iAYVMdyPMXGEw=;
 b=N8CSQWbxBtrxUGLZRwDlbonfxKxV//WIZlPHbGH27KVWvLDL0QGz2EQQBlE+kxJkci+im1N8K4mxsGc2OS7OAZaVBTAKfi7/q7E1sDtFzdbX74G6osW2E9Bm9H0r1FGNbbyxPCOC0njFV0sIeHDHUmbSuwopHd4Ai8xDs22aQj0LzrldyDeyol5oCjqXen0XSFp0lPcufqTD4pEkw4ov48pdnwbX582Zc7+MA6kRdXd6VZNMp+mLjsdM6uCVdswVPwdQtvlEpnpEE+rmTno+jjP2hmqNyzRjMrosnd2e1XeqaPSq7mVyi3o1LyC38K8m/va+f3LMZseTMwwsA8bk4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWk4Hi1mF1FVJiebOCrXEQgZdKxWG/iAYVMdyPMXGEw=;
 b=adywm6TV6IZYJ9WuZ456p9i70XkZT4KlGLF5NHc1DkjBJvQ1e0QBFRUHx8XSzVPTlaWrlH14njKHpS5fZyTGqUowL1oNa8qm28rTjcBHP1A06esKD4WrKmhMEVqdjUF1LqzBOdC7ut3rL+KlDoONAWTkV0XoBaSaLlyFzMWX2hc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7dc2a51a-f1bd-6370-6b42-0bcf1adad619@amd.com>
Date: Thu, 6 Apr 2023 11:38:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] xen/arm: vpl011: Fix misleading comments
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230405111750.12491-1-michal.orzel@amd.com>
 <20230405111750.12491-2-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230405111750.12491-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::14) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 91dd2ef6-1c2a-4cb8-4c11-08db368b158d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cmccy00UDRbYGrcMOtcO1l0CkJmtyHIEdGCU5UJVNvJz6R6qoY+GRmtu6wZp1hvw4omb5g5gn9CCMk+lmtBBj081vvqxZK+A2yELKcB/pbKqSz6gNf1fNcevbGxHpR5OcbqGtQ45tcO3zh2GgrffcGJIrhpEhpycDUbMYZeaeRApe7mkjdOj90oBtqfAzx4pPAP82DB/lUkN4gtj/aURz8H25mOKoTYSo29rzTj2NFkub+Uq4aMeZAFuQQkRbwr4aFzZCvX1cjmDz+kjRhRRuraaJchIPvAsiQ5/m8yAt/IpjQZZZz/GWhqfZ3HbUqDKQBp5joyhjiRGy115UlqzGuA9v5x73TkUZyGleklGwIsC53eFvQDn7d/b6hWoJ6kg8REUNK29djlXeNo3p+u5+0xc6D+dslK2R31RInQqmm3cC7ENOq9RnoMfC5JyFVlWqSm1CYFGKR16Dm6uXMbbMtxY/LeBvHox1rTeL2SYnXpebyTjx9ccpBy55oyNMWGZnRdhU6j1jMLjah8/mp3rOzbwUeXhZJvjL8KI0uyfHRAUQ/rZWlMAmD2/6gAtrcRE1g/w8z7ihmCdquUZAtqUHG2r/8tU6DmeI1M9VHzteQvcQmp653qEmOUc0uCtuU/vmhgOV6GEdjFsqgdGBoyHwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199021)(53546011)(6506007)(6666004)(6512007)(186003)(66556008)(4326008)(316002)(83380400001)(26005)(54906003)(2906002)(8676002)(6486002)(36756003)(478600001)(38100700002)(66946007)(2616005)(66476007)(5660300002)(31696002)(41300700001)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmx0d1RBdzIyRE53Wk9HNUhjRU5UNVZkVVdvTmdJT25GejM4UGZuS1hIQ0Q1?=
 =?utf-8?B?djJiL2xURm54WC9nMGJQS0FudW5CeXZhNk9YRk95VDdtdTVMMjl5Z1JPQ2Zs?=
 =?utf-8?B?Sm5saWFFSTBVNmlUSTN3WE1hODEreEVxYkt1d1l1cVpqNEkzQkt4ckJ1bENE?=
 =?utf-8?B?QVM0aWlYdXA3TU0vTlRvYWpNZUZxYWhSUWN0SkhtNTJxcmo5dzBYWXFjZGZV?=
 =?utf-8?B?MnNGYXNZazBPblBtNzQ2UFY0WW5hZVN0Y1JqTkFpVWNvQXN3OEhnYWpTRHhL?=
 =?utf-8?B?OVdQanVnVGdsS3pjbVQrRVpveVNOUy9BMW8vamtJNjNmTy9MQzdIdDJ5aCsx?=
 =?utf-8?B?c2Y2ejFOU01XTU9od1UxczVDVkluZlNURjJjc3JFeE9rZTlXOHVkbCtjU3VQ?=
 =?utf-8?B?aGFmZU52TGxyNnZHbnRXbzdscWNvL0xKVVUyaDh5Tk50RHZjZ3lmcWVGWGNG?=
 =?utf-8?B?YTdCSGlXUXA3c0ZPV3RYYUQ3OEN3OE5WVWYvZVRLUTBwUStTa2NlZWgvcndS?=
 =?utf-8?B?V1duZmxTU3U5YURLamlKK0RtT0d2clc3M3JJNWFxd0d3L2d4aDFIbVNodksz?=
 =?utf-8?B?TVE3UzdIRWR1clJaMnZlUG1vN3N4bWdzclJrSkd1SFU3N2RzL0FhMEk3MDEw?=
 =?utf-8?B?dGVrOG16a1hTTHpNVjhKRFFUcGJvQk1hU1cybi9UWWFjbnBid05nZ0U0WFNt?=
 =?utf-8?B?eEQyNkhINnlYVEJKWk9sbXpseDdSMVE3TUw5WFA5SDk1UFNmb0pJQ21rcVc5?=
 =?utf-8?B?N2xOdDBzMTBqcUozOE52ZXV2OG5CYnJQZ3R5RTNkNUhybzUyMFVQUnRDUjJC?=
 =?utf-8?B?U0dMTURaaWlxa3VQd1VTWGlsbFJJZy91RFhLU2ZSakpqTDBEZTQ3MXd6ek5O?=
 =?utf-8?B?bHBMcGZrNElmc3RGTENkNDJ1TitmVGxSc1QvbUR4OW83YkhkM3RJd0pUa2po?=
 =?utf-8?B?eEVRcEI3NDlvSGc0bHNjd1BKL1gyUmtTRTlTTG9KaGdNZ0xzN1pSeWZsQ2o2?=
 =?utf-8?B?cEJxc0s1M2hoRFk1NVl3VVR0TG8zOFYrMGlhS3ZiVyt4MWlaVE1KS0tQcVNT?=
 =?utf-8?B?cFl3UXJPOEZlUExqeWpsVVhJY0VBWDFXK2Q1SkVydGpvZGgycTlhU1JUdFhn?=
 =?utf-8?B?eng1RW9Ib2NmL2pCZXJXaXF4ay9LMSthVU8wY1ZHcTdqem9WY3l1SjBCVEJI?=
 =?utf-8?B?bjRzaHM4dkFpRTE2azJaUGl1bTNFMUIzYng4azJEMWx6dXR3Vk51VlQzWmhX?=
 =?utf-8?B?QU9JdTdVS1h3b29sMGdmc0lpbndNanZLUFVZc1NzaXdJMzdab3k4LzVab21l?=
 =?utf-8?B?dnRJRXp3bXBMV0h1ZE5oRjkxcFZiYUViZmhqMUZKSm9reGtERWhlNm9oZHhi?=
 =?utf-8?B?ZHpDMGlhSEh1ZjdPRjIramE5V3BTZDBmYXlTU2pCRmx0cWFZZCs1V25yK1lD?=
 =?utf-8?B?NXBYaFpsREZvdCt0VjEwUlN2MDJ0S096WnRSa21Jb3JSdDVvT2lFcUFoUWhB?=
 =?utf-8?B?ajM2cHBIZzNxZFA3a0syd2puQUVVU05tMDRvYXMxcmxFb24yWUlBQWMxbHR3?=
 =?utf-8?B?WmV4OTZ0K25LU1o1cjF1dXRhZTh5THFnMDVYN1ltZ3lvTHJ0Zk9xMGZ1aEln?=
 =?utf-8?B?WE9yMFRLSVlsMGRra29OQ29kK0ludEpUL25jbGY4cWZ0Sm1OSUwwOURxOU5y?=
 =?utf-8?B?ZnJNQUgxaTZjNFlQMmRSaG82UFArRjR4TmZHUEtEVnhpcmpjSk9xMlRranZY?=
 =?utf-8?B?Z3JVUVZTUHFVQ1cra2prRzhaUGx5bnRSUlR0Y0p3L0h5NmFCL2F0WDdsYWZG?=
 =?utf-8?B?U055R09qd01vS3dNYVFFNnM2Mk12dGRVc1JaOVBEVXhPeHZ1SGpWQmFkSHRm?=
 =?utf-8?B?NFhuMUxNbUJZZUFnQ3JwVGdiTTBSS25HUm1GUUxwdTlURUl1RzZuSTVtRCtT?=
 =?utf-8?B?ZzdIWG5nclhxcGJCZ1dwQ0ZCQ0tVcStoMFZSdGtjNXkwQ2dEbWdHajRDMnhI?=
 =?utf-8?B?UEI5WkdpblJtOEpQbEIwQ1gydittYytDSTNuMjRrMXZoKytJV2hvaHh3TkNk?=
 =?utf-8?B?TCtlQ2tCQ3ZpZEFXemxqV2NodXZqMnRCRUZNWEFVSlhRaXptQUE3N2l0d1hW?=
 =?utf-8?Q?5JEcC0ml3Np+eL/ElogBAamLf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91dd2ef6-1c2a-4cb8-4c11-08db368b158d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 10:38:39.5147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9eMoZak6cnD1XgZC1ZkWHY/Utova0ZYqWhGJocqykjw+yIXfR/DOzac8gON58H+TQFUO0heL43VSp4iuTqscw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369


On 05/04/2023 12:17, Michal Orzel wrote:
> In both vpl011_read_data() and vpl011_read_data_xen(), there is a comment
> stating that the guest is expected to read the DR register only if the
> TXFE bit of FR register is not set. This is obviously logically wrong and
> it should be RXFE (i.e. RX FIFO empty bit set -> nothing to read).
NIT:- I will prefer if the PL011 TRM is mentioned with the relevant section.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/vpl011.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 2fa80bc15ac4..0186d8a31834 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -143,8 +143,8 @@ static uint8_t vpl011_read_data_xen(struct domain *d)
>       /*
>        * It is expected that there will be data in the ring buffer when this
>        * function is called since the guest is expected to read the data register
> -     * only if the TXFE flag is not set.
> -     * If the guest still does read when TXFE bit is set then 0 will be returned.
> +     * only if the RXFE flag is not set.
> +     * If the guest still does read when RXFE bit is set then 0 will be returned.
>        */
>       if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) > 0 )
>       {
> @@ -202,8 +202,8 @@ static uint8_t vpl011_read_data(struct domain *d)
>       /*
>        * It is expected that there will be data in the ring buffer when this
>        * function is called since the guest is expected to read the data register
> -     * only if the TXFE flag is not set.
> -     * If the guest still does read when TXFE bit is set then 0 will be returned.
> +     * only if the RXFE flag is not set.
> +     * If the guest still does read when RXFE bit is set then 0 will be returned.
>        */
>       if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) > 0 )
>       {

