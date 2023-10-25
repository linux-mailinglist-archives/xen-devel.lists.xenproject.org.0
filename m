Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD17D6D92
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 15:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622892.970137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveBu-0003mv-7n; Wed, 25 Oct 2023 13:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622892.970137; Wed, 25 Oct 2023 13:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveBu-0003kH-4e; Wed, 25 Oct 2023 13:44:58 +0000
Received: by outflank-mailman (input) for mailman id 622892;
 Wed, 25 Oct 2023 13:44:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qveBr-0003T0-W3
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 13:44:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf36103-733c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 15:44:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8177.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Wed, 25 Oct
 2023 13:44:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 13:44:52 +0000
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
X-Inumbo-ID: adf36103-733c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKb4IBSM1JgkurihWas2cwNY2hGa7j9F3AdIBDomV1m8KgDcMKT5idjT2d0rTtUyA36s80TGiMrKbRJ34E9QRdg9lCEPKpXRQvfU4+VKEKcnh+w8qT37NDNVoMNT/c4/1PE77BZAVfqmGn5Gjo/eeK6O8A2XYC8F6lPVH8VSAurlBL08k4Bf8TfeBh1dxeHYgf5WWH86+nsW9YY+FA9RFesoNVBScUe942O/8ZEFMOUSK72BEJuHyRl0AbTogAyAS2aJ6R7PzszkHqDZAnIY7FzphEVAGMJP/p6beb3z8b2xHLqYg6fmsKxIZwZQ8L0WmHyar5EcpNadyU3/S0yk9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjILXGLgkVcQ6YUxi+f72Areck7H5HhId2ONxK1ilTI=;
 b=UUs99f4Qz7SKsT9ZZ3pjObM7osCzOCIVuuKjvnYKWNURc1wiwR+OTTGw0T8NEW4j8o63YrQqTqgh0N8h8QUuOe6diB5XD/N3fIDp6dMuMz+y9rtqp7HHkSmFMUgShPKuLusfu3yqfjL2E+inZTvsoaqKAVzlz0A/c5/4qXv5+SWaSeDze0xM6o7UE3wkpEe57zAf9pkBJxYjFbZtQHROPWWjAdE4M5NMhsOKqfnIj7kz4lPQMTXrwz/WQPbfeyx7crBobshQz/zW29M44OaYKfqNJztHpdx4VmaS+bU+gP5OeZ/FdTzbzZTpifUUebE+42TYzsMfwNUY975tmjagFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjILXGLgkVcQ6YUxi+f72Areck7H5HhId2ONxK1ilTI=;
 b=oNMsuFRRvE5lovoJBawsurSUCLgToYtSdffeu96/eIq+ziqDK0eUiN1xZQPpCpsM+AnfaRBQi+AGQLUhE0gs2utCJ4Vs9UBiqpvrfD3TCkRBYqnHtpMWOGyiFzQ8XrA515P+3K2HnQqIWyP0ynesNTLFczef089o2OQDOijH4ZVyeG9I9lY55L4wsh+0+4DRWyhslwc/Ui4sV1Wx1o74rGCK2qHZrrjVL9u6nO7lDTSzvG8ErtlX1ga84Lbb179/SENP6pMCXhXc3HBArTh6G3MJnO2CYr9SCJkuZ6jPdkIVzRepGI8TuxUt3IrU79I/uNeVdpQEHAMr/iDh+9Jd5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b07f9709-5f4c-a079-140e-c3da371929df@suse.com>
Date: Wed, 25 Oct 2023 15:44:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH] x86/vlapic: address a violation of MISRA C:2012 Rule
 16.2
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 0133ef58-3a5e-4689-a764-08dbd5609058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MiTAbo8FNvdY/RcHovVQq6rQF/1TWiIOR6zUKHBlXTn8QZTFdQ8OqZQN2QlZ280evgCPzg8WV3g0LkCTm6QemE1ACVAT98VH0LV32dbodSNOkufH/LEdxiISqa1tps3W482QXpbIM8/lruNbAvVK64MMWBDFbBC87hMZ06homtZEYS6sYUDf7lKIAUta/eMCfZiIDPygsY6uzbrAgUhZBixu70+r0JQdHcpB/PlUUR8t5WDiAxwbW/xwU/EWfCPkkWDEsPZ90nV6xsi9HuMY/kXLK049Q+K6qFUbLEt2nvFi1l8LXRSyLHRi8PITYrkZrEsoQQIp/qbfyYEF+vNrHjMi2++cBJNk8lQI5LEN7wJ0sxJOS+WkiFcO5vnMLWs9jR+eZQs17Fu58HHygRnpH1WgyxYdFchAswBMGFCcf/4egHNbYqzG8R7d4o/1CTyNyy/TFrZ2nL0wrz8ARn+qwHYnjw4/ER495XqcmiDTZqJQIApA0TFWZrehpcDYqSAG5Gf2udjMrQNBRrSDk3T7pOImJIfR1J3PP1E/dTwl6QQ2tmitrYZZYZh2MejCaA140EwmB6SFa3kmAy7MIH0qCODxu9B1kU83IqS9k0h41zquyjhy01zrAWQjWaw3lLK9sn/5dKL0saDYVqULbAVhnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(8676002)(2906002)(8936002)(4326008)(41300700001)(7416002)(5660300002)(66899024)(6666004)(36756003)(2616005)(26005)(53546011)(38100700002)(6506007)(6512007)(83380400001)(31686004)(66556008)(54906003)(6916009)(66946007)(66476007)(86362001)(31696002)(316002)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXJoMVZLOVo3UU9Ncis4dm9uNjdJNmRLSjNUK1o2c09JUzNxcVZnakc1T3pS?=
 =?utf-8?B?azJnVm1YMmk2NWMyai9pdDNEdG5uT2tlT0lOWW1rMTlERmZ4RDNXelMzT21F?=
 =?utf-8?B?MFl4TkNpQXFUdCs3cG9SWWM5SXNtY1pURGpFU05MeUNpQkFxRHNHOE5Waloy?=
 =?utf-8?B?RmdiOTY5UGIrQmhpb0c5TmJWZ2o1Nmp6aE1LRXJTZ0tuSmZUM2ZVT1VidXlB?=
 =?utf-8?B?ZXl3MUdrMk0weWFweXg5MEU5d3Z0Tm43ejZMa05oRmZPYjEzT3hpa3BVcnJU?=
 =?utf-8?B?d2d3K2FVYlVLNGdwQWg3dDBGMklKL2RuMzBLNFYraHltUXJzcDJKcEJpSXVt?=
 =?utf-8?B?TkhWUlJ6YlZBdlFIa0VrWWs1Z0JVRndWa1lwUUcyQmYrNExjdG93RjdNU3hq?=
 =?utf-8?B?YUsvY0R6eGx3U0pvQVoybTIrWTFtaXNlYzFmMWJuajRFSlNWUU5iRDZ0dW9v?=
 =?utf-8?B?czA3M3RSQVJZZmlvZUp2YS9mZ1dPR0NZMnNvZEJ6RmtuTjg3TnFTN2lsaVhr?=
 =?utf-8?B?NDFIQ0tqeUdlcW1kQVM1bUNlU0NZcHlRaFdtM1dvTzlWVGQ1RkJwTkhTUzNH?=
 =?utf-8?B?Z0swaVZBQVdwSUEwMFRYdXRJNDA0MHc3VEdpMVcrWC9RUTduL0M2Y24yeit0?=
 =?utf-8?B?b3NVNkVMVTNKakFQZ25JRDVUWU5YOW5MbURHTi9uRDR6alM5cEx5QkRKcnFG?=
 =?utf-8?B?YUlESC9JejZMK0NtOHpEQlRUVy9Zd09YZS80V0d3QVAxZTMwUktLWTRIOVFY?=
 =?utf-8?B?N21Tb0RGTzRyRXNXYldoS3huQ0xqZytQYnBlVnZCa2R6YXVjVWYxdkVtazZQ?=
 =?utf-8?B?SEN4WmFueklRUW03VExMUlIyZHl4aVRJVXNISnRDVVBqeitRTE9FQUs4ek9w?=
 =?utf-8?B?ZnR6dlAzcnQ4WmpkQTRIN2QvMURZdFI5dlNjT2tkNmFZYXBNM1Z4ZlN5aVhz?=
 =?utf-8?B?R1p4K2RvK3AvZEg3NG5PaHhYeFUzeTl6TzBYbDdEc1RsT0lNR01rejJHaEhZ?=
 =?utf-8?B?cW9NUDZ1NXhrWFhZTGxVN1RPdytoV0lhZWJaQlhvZ2xpa2YxWThwdWVLWWhF?=
 =?utf-8?B?YUhyd2Vkd3ZBMm9qalNiU25MdkpXZ0lSOTMyNk5tQVVqeXpld1NOUlFrMTdt?=
 =?utf-8?B?Ny9wSXdIWVZMZDhLaWdtRXN6Z3RZWGUvWE0vZ2tiKzR1dmdjZW0yWEptYzZB?=
 =?utf-8?B?MHh2cnprUjAwRGZPalZEVUppWE0yYzJsT0J3VDFFUzBVL0Jxd2E2MVVSSDRC?=
 =?utf-8?B?UkhJWGxKcyt5S3paSzdZSEN1YjlJSEpUc3g4VmYzaGJwU3U1cTZKcC9yOU53?=
 =?utf-8?B?VGNZRzhQOXpzanFWUTJQSFk1YnVjQS9kbGJNUGN1WnlDMHB0WS9ObGlSVEdL?=
 =?utf-8?B?SnR0ZmwwYU1ES3ZQbWJVamhReE4yTE5sS2NDSkVmdHhwV2J2bW1BeHljSzhr?=
 =?utf-8?B?dDVId2lmQVBRcXU2SnQ1NU5DcURueXRTREU1allJSzhCM1JtUmpsTzl5dmky?=
 =?utf-8?B?aFVEc3FRa1RDSUk5YWR3eTZIdWFxVXFBTGVCRUowY3g1dFVxTGowb3JiN3B5?=
 =?utf-8?B?a0FRcWVCbVVWZGw4ZDdBWnBpYVQ0N1F0V2JDM3ZnaEg2dlJXSGFSaWFxYTdv?=
 =?utf-8?B?N2JJckV4L1hPR3cvU0ZySW4xblEwbzNuMDJpZy9NTjdNQ0plNHVGalVzMVRM?=
 =?utf-8?B?M2lrUkp6MXFaQkc3V0FDaDhvaXFlb0dlaWNTVm0zUDJFZlBlcnFHSDhtdDJX?=
 =?utf-8?B?VHpMK29Ib0dMZU1JTWUrV0t5d1g3SHRiN3c0QkZCaUJjVTlMU244MmFYRFBP?=
 =?utf-8?B?U1VidGFaWExlRDJPc2k3Y1ZTSmNsN1VXQUtWVmlDRDlsdytPQUpTNHJYNGo1?=
 =?utf-8?B?WkhZQURMRmFRYzg3SVZsSTRtajAwdUQzYzVBc29rQWtjcU5sR05HZGdVVStL?=
 =?utf-8?B?YnpPZUQ3OVdZdkUyUTRwWGNVM0luMFYyOElkYnhlTG1MRzhZeDE5R29uOGJx?=
 =?utf-8?B?bEFxOEx2M2RlYldSUWRKaDdCZDc4ZVMxWVZXWnVFSjlYckErSTRUZllQZmJ0?=
 =?utf-8?B?TTREVDlBVUZreVliejdVL0pjUUJZb1Q3Z054RzRjUHJEWkk0eGptS3R6dExE?=
 =?utf-8?Q?RBqhL0PAhk34hUkEkWqyFVCEA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0133ef58-3a5e-4689-a764-08dbd5609058
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 13:44:52.2101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFy4Rs+nE4dIOzJAxpvMhV6XUOfQmrUCqrwcXqIgnkgtzlcUHKsW0uLUeSmccMBl7YZH0totFz80AEeXWkZ+AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8177

On 25.10.2023 15:22, Nicola Vetrini wrote:
> The clauses of a switch should be enclosed directly by a switch
> statement to make the code more easily understandable and less
> prone to errors.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This patch is mainly indended to probe how the community, especially the
> maintainers, would receive such modifications to the code, and whether there
> would be consensus on the rule's adoption. Anyone is welcome to
> give feedback on this, especially on the x86 side, where this pattern
> is used more frequently.

The chosen instance (below) is one where it is relatively easy to argue
that putting the default label in an inner scope isn't much of a
difference as far as overall code size / redundancy is concerned. But
there are (perhaps many) other cases where the gains of using what
Misra dislikes are much higher.

This is another one of the various more recently discussed rules where
I think Misra is just going too far, dictating various aspects of style
for - in my personal view - no real gain. Furthermore, if you could
pick some more involved example (arch/x86/x86_emulate/x86_emulate.c may
yield a few "good" examples), I'd like to learn how you propose to
change such code, with two up-front constraints:
- no added redundancy,
- no new goto.
Either of them in replacement code would go against what the description
above states as a goal.

Jan

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1034,10 +1034,10 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
>      case APIC_EOI:
>      case APIC_ESR:
>          if ( val )
> -        {
> -    default:
>              return X86EMUL_EXCEPTION;
> -        }
> +        break;
> +    default:
> +        return X86EMUL_EXCEPTION;
>      }
>  
>      vlapic_reg_write(v, array_index_nospec(offset, PAGE_SIZE), val);


