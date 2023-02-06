Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C947C68BD6E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490401.759077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP18c-0002Ax-Es; Mon, 06 Feb 2023 13:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490401.759077; Mon, 06 Feb 2023 13:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP18c-00027N-A9; Mon, 06 Feb 2023 13:02:26 +0000
Received: by outflank-mailman (input) for mailman id 490401;
 Mon, 06 Feb 2023 13:02:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP18a-00024N-RD
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:02:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da5d16a-a61e-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 14:02:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7106.eurprd04.prod.outlook.com (2603:10a6:208:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 13:01:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 13:01:51 +0000
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
X-Inumbo-ID: 7da5d16a-a61e-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2UFhnChCzkM7VNIYHqL1YvmxQYTnGvC8ii4SHQ2+91DLwoBNt69nB6QhXWuwM/FHzRDhMSKt369zFbB046b4nVG6u7l65pOBOCvDDSQEp66Tg3rpORVvJAy/T5DUPPVl0M0xc9ZDD/o0KQbb/V0z1/nxXn/zcIeNkdXPzGuJgp3yYo2PEqXwjqFwE3TIKAI9cq/NVarx4RN8b8WId6VxQyKgytURVrdyJEWexHjjgIxnnQrBRuhacvQmPzv05x7Wggg/S38n6/2aMU4RTX8XSXJCySUj60sP8T0yIjkao73ASQtNpUsKmNwkNRUOJLeXzdTb5EBu8iUCVNy3Pb5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUYBT5u2O+lSXz0eh+VZUuWrUKtpKdr8gNbF+5CKt6k=;
 b=Tk+453IokEbiDeMO1qZ8UQG/WMFTy8yloCMgMhHgDLRdWRJYSGPmz2C1b1ef/fdH8yMIKT0QlfCPXeVn97nCZ+WqUrfN8czXZU3tzeB0eVcJRlRXb4E/lq76OVN1Use7EOdEBjR7o//y7aEUWUl7Z4FphaxImGaOuwTE7z6LyGCWDug+sQ3Jx4Gz8+V0XYxbZta41yE//uJzSqinPJTWMHgEzQNOwfJPpUHb/dJE1AOaab3QRvYQ4+oKZNaRTUstIC24YaKXsI2J9RpLDKI3F1+BWOPJXR98k9Mw4kHJFPGZvnIZqW6FzAa2c8UarkGGAV2nlyKLnJzG7lHeJFy3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUYBT5u2O+lSXz0eh+VZUuWrUKtpKdr8gNbF+5CKt6k=;
 b=I3i6z/gWwfteYZGtz5vilO51hvtpi/GkH5e+tmHGt26p0K4ni5XEZlc1JCNva/ARVPv1GsV4JWKDVJyzlwu9CPPVe4cjRKgExJAQGkivHKF4F+9lupTW2kqQL7riT3lrD23CH1xjJ4oJkT32f+1QRRDDGRU3NHKROHe/aaN8ApX0qgwNJ3nFrwnKDfRCsurmPqgY5i9Zqf9Ri1X2f1gh7j/Kk/Lm7c9QtZm+TPcy+jB+nnZQBa4KgTJXLQCZ2+vvgFmng+AOM3fPpiiLIVURKLMUtMyN1YArSMrE/2ExlT8XaqGj82PdnzW6ilwW2uOEkvhtoIdlB6qp2pjc7k9sYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90bef569-a49c-fd29-a855-5ef0b93b1056@suse.com>
Date: Mon, 6 Feb 2023 14:01:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] x86: do not include asm/hvm/support.h when not used
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20230206124251.911744-1-burzalodowa@gmail.com>
 <20230206124251.911744-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230206124251.911744-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cce29d-84e6-4059-87f1-08db0842503c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qSVxVWmfnrQSlISpF/7PUFtk3auDZS0B5zc0o7Krxtxm4P7/2A9qt607fu0ODNmTOHIJfJ0n7iDqPjzLGZdYVFI6uASQMHQLtou8TyUjf2ePuwLzwO6+VQHwB8YKpz6rqq90xi1ofm2Vzlsvk184x02cDpBz4i/fXiFSHChqKBcdVPppprEZvHsGbcgHQt8rd/0gSVcfR6ZiHoDs4FzppZ+3Q2kPYs7xaYOV3SU3zMLWV0vLc1I4zM0gfOISFl17am7/uiv52yHoQELdrjgBtF9KL0HxznvXVU+OZxvV5UzE0RzCspTXDRfjU5ZS82Vxo+zD0eQuJc8ieWvF9yT9M2qsNKdA0tWkTDJoQyFWXfRz+WGbDx4vejP/eW17O7EpAJHj4m8QLRLRzRjmAXHFeshJddg/tT6WO7BG5Z2R9tXsM7TiXaJ0V2ZsQe4fbQUb5WTmPxZjwrHLggCji3+5+EyVDU4Vx7pzMBFsPGqVztt0/YzddetGWd4aXbpJVEoweObAWx12oPuKr7IC6MJ9yD+ckRwkh8P5Ah0oXx1b4Lm7k0Xoa89u2Ob1bz/fUl5uaM4NYNwnRaqPondPrcTdvAxz99Hw5BXJNAdxbSyeIZf6x98Ct3ZTB+msbgSR88SKJNjXgAXBU2dleGX79h9qM2kW6GZKAeD0sigPDZ7oUhV4070gGWcSdGTvrPbVmndrDG2MCO1ek+lDxtdiBxD4Rxfp+7hh2dGKb1peZuvwRmQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199018)(36756003)(6486002)(66946007)(6666004)(316002)(54906003)(8676002)(6506007)(53546011)(4744005)(478600001)(5660300002)(2906002)(66476007)(66556008)(8936002)(6916009)(4326008)(26005)(31696002)(41300700001)(6512007)(38100700002)(86362001)(186003)(2616005)(31686004)(66899018)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzU1bFdNbGwvS1FSWmh1b3lMQmVMNDJ2cXFUS210TFZJTlk5V3Foa25WU2li?=
 =?utf-8?B?L3V3QytvY3BpWXNRUktIZDExOVp3K0p2K00xSE9IS2c5UkJvY2VWRWtuaG00?=
 =?utf-8?B?N2E5WkNJaVlKUzlYVjFTL04rR0N2R0R0ZzBUdGJzYnFSNXpzOEhYRlQvQjJX?=
 =?utf-8?B?NmRaTVMveXhzek41UGRVcGZZZmI3VUszK0F1cUNaWlRDaHNkOUJrbkZqRFNT?=
 =?utf-8?B?cU4vb0UwdUNJcHk2VjFUeWI3YTZUdjNLOWZtVnRGN3lGTGwxOWN4MDJMZm5E?=
 =?utf-8?B?aUxlOVRvWVpWZEU1U3JCaE41SUl3ZHJaZE55dFoxNEpFWWtyU0lHbjZhOFFu?=
 =?utf-8?B?eEh2WjlxbW5sT2R4ME9Dbzh1alZiM29iSkphU20rRzc5MUdCYkdORVJjSmJv?=
 =?utf-8?B?VXI4VXljNkd5emNhaEx2ay90V1pmamppaXpMQXNBK1dhQ2pYTTNyYkhmOUQ2?=
 =?utf-8?B?ZUJIcWxNc0trTXR1OUxQU1luZEdLdTE5NEgzcEh2TVN3SlM4Sng2TDRGUFFq?=
 =?utf-8?B?SXNOaEpQMWhIS2Uwcjc5U09rWEtSRXZnbkhhQ1h5dUVFNnNuRFpCZmk2OFlh?=
 =?utf-8?B?OXdqelg5YWZHaGJQM2VGNzBOdzduU0dlSmhyYzlGMDNzdFlsUVVRWEVCVnJV?=
 =?utf-8?B?RG00dUlwdm9uZmlSY20wTGE5VVJBb3NrZHN0VnV1dDBrZHdmM3p3TzFITUNT?=
 =?utf-8?B?am5meXI3bnBrR2k5YkM5WjBaY1g2MW45eDZkcVRKZHkwRUZuekpTY0FWYXBp?=
 =?utf-8?B?NjhTUkhlUG9pb2lIK2FZb2JHTlhwaGpHc1FWOTRXSTkzTFZkUk0xMHhVRkJq?=
 =?utf-8?B?cTlDWEdVYVpaZ25jdnhXZDM2aVFPS1hDWjlMZzEzcUcvV1k3QW9DMDJsY0FE?=
 =?utf-8?B?bjd5eXBpL0xkOTNnQi9VVENQT2RKVkRyMlZBa0c3MGdrdE5Db0FYbDZSc2sr?=
 =?utf-8?B?L2ZMRlVENktwT3NDZE5WOHhxc1ZQdi80WnlMQ2F3OHpQTUpLK3grY0pmVUJn?=
 =?utf-8?B?K1RFL3pxcjNNdkZ6K1A4UzJ3KzRzOVJBZVBlQ0N4TG8vOWlGMkZyMFdpQ3E1?=
 =?utf-8?B?L1IzaXpRd3JNWlFTUEdabDdmYlg4cWJsaktJd25mcWd2ZGFiOCt1b3pGOEpT?=
 =?utf-8?B?dmswSE1UYXkycy9hd3RyREtOVDdvT0lYT3JGcnZhd0VNMW9UU2lRRUFmalNY?=
 =?utf-8?B?L2lkVGUwRHpiZ2tCOExCdmdxdXlnNkF2cjU0Zzg3RHhRdXB6L3F5VlRtY2pK?=
 =?utf-8?B?cHBVaEVWSTVYWE54QVJyZUpGTXBpSFNIRXpoUkRXWkdlZ01DQ2tjRkppVkds?=
 =?utf-8?B?ZGRGVjY0eW1ScEd6dWxiS3VkQ1hBb0ZQS0lsYzdRUTBOY3hVQW5NZjhKamQz?=
 =?utf-8?B?M2RkRFl1K0NOaytMNGFVTkdmMEpjR0pEWkZ3eTMzTHhNQlcwRDBpSGJXeXpn?=
 =?utf-8?B?NS9KUkQ1bXc2eU9xWnI1RGp1bHpuK3NWc0FhNzFMWHpwWlpKak9jU1g2WHpK?=
 =?utf-8?B?bGVZVDlGd0xZWCs3S1BKMENBcmhONExxVTZXOUZRRHpsaTF2UjFOWk84VmZW?=
 =?utf-8?B?ZmhJeDJRWU5WejkzeG02anNIZmJQN2tLcDNrQ0ZndG4zdURLMjNxeFpHVDdW?=
 =?utf-8?B?dStEZUJaY2cvQVBrbjh2dWlJclpRMThndy9UMDdQakVLYUwwN1BUdWxBelAx?=
 =?utf-8?B?ZnMzY3hMMHFrbmRhMk5TQmpJMjU2TjBlZG1Xc3dwdWZqakx6RDNiSGcwQ0k0?=
 =?utf-8?B?SEVPa3V3bGp1WGdJQ0NOZEJ4eGdmTXZydWdPTnZHemRJMlBDTXNMNVVNUFI3?=
 =?utf-8?B?eUJYcWgxNFBKL0I5dW0wT1pKZlZlbnljSVZHdjRpK1Fnd2p2YkxzUjhITzA1?=
 =?utf-8?B?cHIrV0trSkx6YnBKWFJTc2dFclhLeEE3RUNPekFuVlRPYjhGWjhvMVgzRFA3?=
 =?utf-8?B?elNHU043NmFTSVZWWjBCWTlXTVQ4U3ZOb1kwQkJWWWtIQmUyUUVDQUZ2bTJs?=
 =?utf-8?B?eVhSU254L0JMZ0l2TGdiaUVyZWJBVHU1Ui9nM3czMERBaXhBZmtBeWVhR0NC?=
 =?utf-8?B?TGVKcFMvQ2dpczJNNTNRcTJYZ0tPa2s1bHVtbHZrWmVwWmpPWWlPamxDKzI3?=
 =?utf-8?Q?t+VSbc6D1XXykkcis08jNN5ca?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cce29d-84e6-4059-87f1-08db0842503c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 13:01:51.1471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPAbvDZz6JwHilWbUxbK9jPkvMXD/E9j9hBteY59tNv2/kcjYkxXB7CtXkZYmefFVBhGqeLzi143y1jO3N4UeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7106

On 06.02.2023 13:42, Xenia Ragiadakou wrote:
> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -34,7 +34,7 @@
>  #include <asm/time.h>
>  #include <asm/hvm/hvm.h>
>  #include <asm/hvm/io.h>
> -#include <asm/hvm/support.h>
> +#include <asm/hvm/save.h>
>  #include <asm/hvm/vpt.h>
>  #include <asm/current.h>

To be honest I'd prefer if only the HVM-specific part of this file had
this new #include (and ideally the other hvm/ ones would move there as
well, but I can see this being beyond the scope of what you're wanting
to do).

Jan

