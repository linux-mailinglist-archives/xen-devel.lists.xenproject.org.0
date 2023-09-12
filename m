Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3976379D5CD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 18:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600624.936342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5vR-0007aE-AV; Tue, 12 Sep 2023 16:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600624.936342; Tue, 12 Sep 2023 16:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5vR-0007Xh-7f; Tue, 12 Sep 2023 16:07:41 +0000
Received: by outflank-mailman (input) for mailman id 600624;
 Tue, 12 Sep 2023 16:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qg5vP-0007Pr-Fq
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 16:07:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e9dff0d-5186-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 18:07:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8949.eurprd04.prod.outlook.com (2603:10a6:10:2e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 16:07:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 16:07:37 +0000
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
X-Inumbo-ID: 7e9dff0d-5186-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n019QKSE+TLI1ILiH7EJu1dcxBwPnRb3RRVy44fGoEmo44/EADua1pVhcIc0ydkN4IAy1G4uXvkrBhmXR7HNTokFifMfJO+6xX/3af5itqp59KP54poswkCQnsumfdhwrBmqtPRJbUisAs7IUwuz9/krjjVA8IEsVBaGMtesKstXfPZTF1+6DTWQ0m6HRVyR16pKvpKlLhFV/SbpgBvbL3632CbOQuwExvcXvFgdZA1AisGkqL3joN0N9eoZxR7i6uq8Dtwo9bXokd81UcgJJeMtOEfbAACr1U4kfrNnebjxP+1BoAJ+Vl8/Z+IWLbFtdDyAh8Ve35Ar68PcnD2vBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCU06Ja0kH7t2lhMxq/LOq79Old3jT8gHSkpaX/i3aU=;
 b=aQmV1qzbehxpWxZfXxpxU6TuSa21f1QmZunERP4PJDoZx+Y8zzdZu9KWDl8AyE3m3BGcl5w9m8GIG2cMQGPnz5xTAFOPXRfvXxhrGdJyHJwcSNnZtJv9UZ068UW69cQm/6jzTnWDnHQXnnHuA55dTFLUpAQ9xxNQuXDzykxEaEZxgDJLpgWDHKe0IzgVsqvOcyddrce74B5efbKw4rDIe2T4j9YW4RX3KbDt7ud/jiNtEyhWdCs3IAiT9tSG2KWZwrIaR8mQuvgAdJM1axKbI5gZVrAqQ4xk6ZJL6wFRoHphI8jbqvIX8Dqmu7+Y03c0Dw0nJsCrEPQ4uLImtGvMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCU06Ja0kH7t2lhMxq/LOq79Old3jT8gHSkpaX/i3aU=;
 b=pFZLWlqv2Ew+qR0XWglBjE+t6mSF8nDk+D5PhWUprPPYdVJAh6J47N8I/Y7inyHXAOknjzXLSiJbgAk0WfniyE0pVrGe5bYwPi5KpBrYcyL/lrC4HWkyju7pNSBWtctQb7LLt1vF1oSG6svaa09DQpYVvlSaDAOJXaltY41iVeoh6kv5D9fT8VwFMmBcyJzzYzYsfODv3CQuhVyYB9G6OBTOxu85ph3BF7EGptVpQRevPWynL7pfllnI4qeCukAmeh/Kmpl5wEfHbFQg0W7SBmUirv9vQtUJDLfM3s25TpH/kGHc4+nv3XP8YTujW5AymUpq+yJx7qhR6GVh+OKttQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac42edef-844c-3593-0b10-db0c030ebd56@suse.com>
Date: Tue, 12 Sep 2023 18:07:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v6 4/7] xen/lib: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
 <f92e8ae0d980779bd7dd4b21b70ad779f2e2488b.1694532795.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f92e8ae0d980779bd7dd4b21b70ad779f2e2488b.1694532795.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef39598-0f16-4622-a870-08dbb3aa61dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fqLEfFwSM47DuqHiqYqLWxGv3xE6CY/VmAf2A/EGHn/orU/ozCz9KOn46+gLGdGCyulliTh9PQZZvZKcep7bJSTyG1i3mQoAg82NYu+ezEqKAGVI28IMlUqZqXcQ7s+2S6W661Z9/X12OnbhPeTxBHWZ0hAUlw03WbWqrr14XBxyqGC2miGpd7BaBz4X3mrlXn/Hq2RGlG4yJ91GZD1ysIbVcDU/z9gReMW2hmuMEeCTlNa/Bn1UgQG0+iZRNLsG9wBfFhw7r8DK+3EpnpT/1S5VPalofZkKUqYRVADZa6mxBOWge4r7opRA+RNndJuc04H7/7dFTRgyNW+jwYSg4Tld3KItju5oyQ5vwTevhUIfjOFNNc3/lSwfm+nm/Ws5pZ77mD3z6vXnDzSaxCKXJ24tPYl5KoZgYadunm/IrChf7UIp8iLS9yeIErGEjH0dwlB3zpvdZjaFN9ucVt3eJaePRUahpdkVf4Qtn6ZRv1HqC9SZovzaYjPfAXBBPwRM+tWaT55tgBZnasiwrGtT/GaVuulwnq9Pki366FEqIhGQenuWGIfRgtCg4CapJICbixluPJNAUQY98ZI9Iy3Gh+PWWsqhDkMkLZ512NXC0Io+GYwQzpNr+S8faXh047BCEF0fomBoLO1tZek/i9Xckw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(186009)(451199024)(1800799009)(6916009)(41300700001)(316002)(26005)(31686004)(66556008)(2906002)(54906003)(8676002)(66476007)(4326008)(66946007)(8936002)(5660300002)(4744005)(478600001)(6486002)(53546011)(6506007)(6512007)(36756003)(2616005)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VitCblhqamFqUFo4OE5LMktyOTRzaHNCcnZLMS9qRzgvd2VHMHFVdzRMS0Vz?=
 =?utf-8?B?M1NRbXNxRWZiS3pkRGt0MUhxVmJoY0JRNG1TZFNNNFFLVU9PcDJCbFlBMDVu?=
 =?utf-8?B?OVR4eWRQVkcrWmtHMmp3WEdGaDlrOFU5MlRhRFM4UTJUaEs0dEo3TlUva1pQ?=
 =?utf-8?B?K3RURTBGc0h4ZlNaWC9WemxzeDhNYmtDbDkxL2FFM3RTandVakE5aUliN0VV?=
 =?utf-8?B?TW96ZkFjWkJYa2R3bGlqWU5PT2xuUmowZU03dGVaaVRlVFB6c1JLRW9DZW9E?=
 =?utf-8?B?OXdaQkhsSFJXVTYwdHpyWmpaOGJyWVdUTGJIN3hmOW9hMzNHN2pqQ2VvUVFF?=
 =?utf-8?B?S3YvbEJDUjlJeG4zSElwNytaSWd5WmNpWDd6dWs3c0wrSTZaMTBxamJFQmd4?=
 =?utf-8?B?RTQ2MDZTNTNzaVpVcnVISjRaUlYxakI2MGNnT3J0VndqQ1pPcm1uOVFubHVW?=
 =?utf-8?B?TEdQbzVBYWFreit4aW84SmZVNTRKancyZ1owM3JhdVJIUTBuNmNGZEVCOFVh?=
 =?utf-8?B?QXJzR3VTNnhWTjRQMDUxK0Jza0JuMTE5Smp5Zk5CRVg5TlRRTDNGNUtnb3JC?=
 =?utf-8?B?aDlzSTlBbGlMRmN3V3JoYU1oYmY0NFphVkw4bDFOTFRPM3RKbVhVaVk2UnBn?=
 =?utf-8?B?MlE4eTNlK1luRmpKNmdzL2RNUXZuKzRxVmNtVG1uUTUyTWkrNldqbkZ3NTFx?=
 =?utf-8?B?a1dmelQzTUY0Y1N3MnM0SWFOWWxRZDRiTnN1R3VhbFNaNUlpZmNoZTRyRVMv?=
 =?utf-8?B?bzhFUy8vWitCcWVtVlovbm4rTTVnT29zUnV1eWVDNzZJUFFpbTA3WGtQWEtH?=
 =?utf-8?B?NVdHMlFZN3BtVGZNSzhmV0RUQUxQdHIySUdkclNTUXZ3VGh1QThpZzl2VzVS?=
 =?utf-8?B?b1dXTDlBREw1Qm5xbjVPRWhDNlNteGdNKzdvQ2Flc3pYeDlhZEF3c1NGS0p2?=
 =?utf-8?B?dVNMQ3pSV1c5T2NEMTVtZk9iK0JrZmw4Zm9GYkZGaE1sK1Y1dVFoV29uRjNE?=
 =?utf-8?B?NWppWUZwaUxMRjRka0krZGdZZ28wdFYvSDNNR2RGcWNUak45ZkdGTHdqemFX?=
 =?utf-8?B?OU9Cc2xEZUtBSkgyV2dCZkN0L01qNXFXT1ZHZzNPWWpkUW4wZTczY1YrN3JS?=
 =?utf-8?B?RXNPSnhkUDdIb3RPQXIrYkRZRVd2T2NxaVU5WmFNalVSbTM0cE54T1N5RmhF?=
 =?utf-8?B?b1JaVStzQ3lTMXk2V1hNdk4yYjd2amcycC9xcjNnRlkrV1BocGRoT0Nmd0h5?=
 =?utf-8?B?ZldvdGVmcGkzckFGa3JhY08rQW1CTGRpVVp6eFYvN2tCK1hSQUpCdENTZ29S?=
 =?utf-8?B?N09VK0JHQnZZbnoxTWRCb3p4TmNUeDNPRHQ4NXR4LzYzLzVDM0pLQS9JeDFY?=
 =?utf-8?B?SXR0WFhvZUJtWmJkL0wyUlN6cUVuSmttWFRZRW5BZzNIRnB3TWM3TlVFczNz?=
 =?utf-8?B?MXN6TUpZVVdWcUxCT21Lb3Rua2p4N1lnaVV0K01wL0Z6NjZKOVBZQmJFcmtT?=
 =?utf-8?B?NzIxZmFCVVdMRG05UUhkQ3V0T2lVTEh6T2ZVQzFNbG0zVEtXUktjUGNhUlJy?=
 =?utf-8?B?VjIwR1NoZjM0bFlVZHR3UHJ4eWtFUTMzUXpnNFN0Sk9zcy9pd045M3AzdzdC?=
 =?utf-8?B?c0lycnkxc2d2QjV3enFvc09La1EwQWtZakFLMlMxWk9WVHJaaVB6QnYxZENV?=
 =?utf-8?B?RmlpTGt6N0ZCd0wzZkJYYWRMdXRURzhDYnBsK3R6RmlXQUJoWkl6NyszWURm?=
 =?utf-8?B?RHJIU0QzMGZRS0VaR0dONmFWNTc5dWs3UUV3T1ZRb3hXRGRMM2lDcUNNQS9H?=
 =?utf-8?B?RUo3NE5ORUp0SzgzWnR4QlJCbUp4L3Bha2JYZ2xLSGY1ajBML2ZGajkwWk1Z?=
 =?utf-8?B?L1Zzbm91RG5VdFhWUStJVHFQazJGZkxQVWp2eVF1R3kya21mMGNUaG9XSWZ3?=
 =?utf-8?B?b1JzZUN4MFNXTE9oRTdJYXdUQzc4V0YrMWFTUC9VOWhYaUpjc0l6cVhEVS9N?=
 =?utf-8?B?b2x5Tkh5ODc1OGpYRWRCdjlZdE5KU3l5QWY0ZXI3ODRLbzVzYlZpOXFxNktw?=
 =?utf-8?B?Q0NGajAxWXpSaWcxRzZxb0VVV0VkRVAwRzBvOVBvVnYyeDZtVWdlZlVDWUhq?=
 =?utf-8?Q?VawlLaY3UgeCFX0UafYNk7Q9G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef39598-0f16-4622-a870-08dbb3aa61dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 16:07:37.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0UTSjsr128m54v713vjXxhorBzJeJRdiGiCDppur501enq6/JjvLxk2Hd74X9e5tsBpLZAbX7eU+vtCEpvfpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8949

On 12.09.2023 17:39, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following change is made:
> - add the 'U' suffix to switch cases in 'cpuid.c'
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



