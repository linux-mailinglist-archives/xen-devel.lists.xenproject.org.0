Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF4B67C66C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 09:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484828.751658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKy4y-0007ao-3W; Thu, 26 Jan 2023 08:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484828.751658; Thu, 26 Jan 2023 08:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKy4x-0007YB-W2; Thu, 26 Jan 2023 08:57:55 +0000
Received: by outflank-mailman (input) for mailman id 484828;
 Thu, 26 Jan 2023 08:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKy4w-0007Y5-Kx
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 08:57:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83f81ca0-9d57-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 09:57:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7021.eurprd04.prod.outlook.com (2603:10a6:800:127::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 08:57:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 08:57:45 +0000
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
X-Inumbo-ID: 83f81ca0-9d57-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SS6inCbMqnb84+xIQpueDSHR/V0jb+47VoliqhOzyzLlbCeQg1FOBcbvlZqY0aqK1+KVrTtP49LQAhXf2wPeLzc1GsO09odbpWoiGCA+1YKbX6he0ZGjY3WLD9cLyK5iEuc+2T3zcU36/bRjsfcjC6KlPQ7ekl9A02Q8AvOVxEi6ESg8AA6jvJUATwpMcVGP0rCs0Q+dOKYYUSI15oPUzar/861EshyDML8a8L3sA3HspWGjsp169H713ys0zVy6eIT2vio8A8ZPwf0JmaK10RprBvIdibAFt1u7nH+DZ7ZvF8opCj8bo0nnqTB3W1bqfhVsvsw38guFTxcw3gbX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MW1uAeyzIXYgFzZDoCTqIsfkigZzerbTXM+ilyurhaU=;
 b=XFhW95+a+saJr91ZntAhk0Yp6Q8OmTRI9doD0IcYmZ+C+3NjViaOXgBrVSVSqfTkymiIowPb28jF4jI8wVhxnoXBPhsQAnq+oznCmsyhAPOwHh4/s8G3BQp/Osv/9JY1/A0FNxr7TqLk1oD075biYsHsyETS4CJQ4J1wjzsoKy6JInSOwuMEhXfCY5YKjJs4sPOeRq4Mm/RwUk+eEi77ZG6gKN9Pe2c4oSxxrPUJn4CiAsjOQHr3jl4fSUbTjRHrTYXEndmFzVTLXW6HURfWgEIBqGXgm4cKWEAFYE9SG/mc6yVJWOR/OIVuZSuH0T0NqnM+tIFE7ov2/3F8zyriJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MW1uAeyzIXYgFzZDoCTqIsfkigZzerbTXM+ilyurhaU=;
 b=N+5UlcIj/TWNcQTHosfRhJO8SJ4Qg3GCn0Pi1NphVFSxqXbxPxxc0V5jMXpBiO3hunt8QJK69dstzZm0AvBd9AuNHb2Vtg3vdjctEDw7WfavyiY46myE2s7yLycoiJMuVdP56tEssYyyxfPjCI/SWrmgtfsTUyc61q3AyLEbsNuEk0KquPc341RUzO0h/7wbdhsH81aRS+EnbyZV04KNGe5BggtpJGXSIpQRaaGd2Sz3t+dgkmq+HMes6/8gz3eRCgyqEBQ4H2LQmioL83xJGRM8/FqiXbleWhVAtzFyVgOMHH1JDK+X44Sk9mBb6wmztHm6xbXmEXZ6081y4SKjaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a07d6f8-a07a-d435-deef-1366fad29a11@suse.com>
Date: Thu, 26 Jan 2023 09:57:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen/x86: public: add TSC defines for cpuid leaf 4
Content-Language: en-US
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Reaver <me@davidreaver.com>, xen-devel@lists.xenproject.org
References: <20230125184506.GE1963@templeofstupid.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230125184506.GE1963@templeofstupid.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 19288d99-e591-49c1-9934-08daff7b642e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KOhWYqtn1fLxx/PLTPrLB89CsknCn1FmQrdyZK1gGiSLMNupO+VPd/q0mCKbwh4oUYmGVS3iziE8J4SxCvsOJzNY51gxbEztQkI5SQCUjQKsX+vKTIZkqBPBViKeaet+mMUTiHYVva+a2xXvGh//ow2eh6wJkF3J8EeOmdXCLY81GXGs3wcZeWZvPbQPPe63xFz5OtK3UjkrOOXMfFwfmXMfNeZRh12uCEWOHpbO3XdMjstLCyJnRQOe1BG/HlUq0GgTnjolSGtPUKiwdZhpeqJybjVf9nsRAgYCBzHUoQox2HrHg4n29Jemz0Z90lgCc1r7zFyAHOiKNg34fywCnoWHl7b0HeIcUElH6koF4qhSoUgvGiD5zuIC/Bof1mBVxwHrrUBHZcRgkWu0wHzQcFr5qxfZJaBcU7fhRaPAZKtQRpWnqqUxUzFFpeN6WkAobB+FdQtINZxn8jv2/vrHMLnKxQBJV5rMlTvvP1z/5yF6xVIDnsCRpTUAp/29cMzje2L3Dm7iMoOBbZolerNai837LzDB/pRbMcM4TWtN8HWxHDkxgkP5c0/eEU7aypD6+Q877CmTlr4pPkQnyqfS+/M3iuWcNev5ywkm9TEen3HXYOE6luBlPQuWueLTvevas1e4CfFsz/+eIZurirB+CY76zP2C9MC9oNdI1w+eGSM4XATdtS6xagoHv10sXmqyHDGjeNTrsDsfv5qdP15Neycv4c837pkp01LYnBeKhFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(2616005)(26005)(186003)(6512007)(53546011)(83380400001)(36756003)(31696002)(86362001)(38100700002)(66946007)(66556008)(66476007)(31686004)(4326008)(6916009)(8676002)(316002)(4744005)(41300700001)(5660300002)(8936002)(2906002)(478600001)(6486002)(54906003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFVyWGdUNXF1VnoyWmtjYlpRT3AwZlp3clNqYkRhUzNHNS9GVlJvTm03dmVM?=
 =?utf-8?B?QmZOQWhHaGExdTNsTDU2RUVjeDhLdEJlTU1aOXFNc0p5WC9TN0ZKamZzMlcz?=
 =?utf-8?B?K0NoTzhzT2dMd2ltUWdQQkdyRi9UZk5YR0JkKy8wcG1wdjNJcWRkL2p4NVR6?=
 =?utf-8?B?VWpEaWxxMmVFeFh2ekVJTXN6dFViV2szQzdlcm96MlZXNmg4V2NGT0dOZXc5?=
 =?utf-8?B?dFVmc0crenJ2TXpUOE14YlJGOGdtMzFXbURpWFpxZElPUjFsWGNTbXIrUi9S?=
 =?utf-8?B?MDdjTmVjRms2V0pvMTFSckl5NloxeWU1RnlMNjVQdU1UckRNNWdyWmpjSzVL?=
 =?utf-8?B?QzNGa3BNdXhZR0kzSHhqQXlqaVQ4M1V6UFFsTHZYYlY0amVONUtIVUpEYjlk?=
 =?utf-8?B?cHJ2a1F3SDVKbFpheTRLZlJrbno5U2hWOUZqN05SeXYzNHVsRThibVNFRDdm?=
 =?utf-8?B?M0JjaTVOTHB3WmJzY2hrTll6cFpxYVVvaGx1Vk5MK1VXR0JVenRqR0VGVzVM?=
 =?utf-8?B?YmZlTU9Id01qcER5SW5uS3d1b1pHbEJJMEI1L3RyRFFoZThnb0tPMTAwMWU4?=
 =?utf-8?B?bUIxRkNORkZNQkE1MG1jY0F1SE5WSXZ1R1FxQUF6ZlUreEVzMDJXSXh2aDdR?=
 =?utf-8?B?MGVKNVJzUVBnK3UxbXVnb2tpVitqMjhnQStITHYrRFdPSmsvdy82eDhSUjJQ?=
 =?utf-8?B?UlVmVVhzYTZtWmhvRjdwRlBiTDJSMG1OZ3pQYjd3K3BmTks5d2RQTk50c2pT?=
 =?utf-8?B?cmo4VkVpajhrU0Z3WDBUUTdWNUJ2MXU0WnJBalRLN0J0dHF6S21rQ0tKYmtK?=
 =?utf-8?B?Y0pSTHhXZWY5Tmd3MHZHMWY2Uk1ZZ0pxWk5FcVVtT2d5dWptRVI1dmNNTUVw?=
 =?utf-8?B?T3V3eHFveGRjbi9Rby9hQllnYm9IMkZXWFZTcy90bGFoTjNwV3BPdDhaTXBK?=
 =?utf-8?B?eVBtQUZ6NDBRejZjSUExQ1BjSkplbjRPSm5kOXU5aDBNcS9nMW4ySGFNZlhK?=
 =?utf-8?B?elkxNWNqN2pMMXNrVFFMZkFqS0NXQjE5aGoraEF2OEdIaHhTUW1IUkdhQWZm?=
 =?utf-8?B?ZlQvU25hYk50Z0hIbHdHRTdTaktTWlY0MDc2dFZhRldNcjNzTi9BWHltSkNV?=
 =?utf-8?B?OVl4aGExajQ4ZFJ4OXlhK0JUNG9GRTczQVZmeHV3T0o1b1FQWm9FRWhCM3hL?=
 =?utf-8?B?VW90S2ZwdFZaaHRMaDhzZlVBQVZVb0UzcTV4L0wvU3BCZE5oMmtpYW83aENv?=
 =?utf-8?B?SDFhays1R0FXY09tdjltaWlaNVhna05YWGl1WVJlNm5DU3NnYVVRem9nWldx?=
 =?utf-8?B?RDVuRW9QUmpucXJvL3JiSmg3K1djK0NhR0ZGb3NNeWFZc2sxbVQzdStqZ3FO?=
 =?utf-8?B?UHZxWUxtRnJ2MnN4L2ZreUlwM3ZYVVBRc1A1cFNQYkJUK1BNU1VJOUJqYi9x?=
 =?utf-8?B?R0Z5QXdhZ1c0VGt4STRldmxIdXVXS2Njc0gwVmxDSWJXYkJ3U1I4TTRrVjBR?=
 =?utf-8?B?aEl1QnpoOURFdVZNY3FQWCt2bHpCMkxqU0JJVVRicEFaNGIyc2tkaTB2WEMw?=
 =?utf-8?B?Nk1JSFRwU05sa2lOdGZJVjI4R3M5NEhGY25WK0lCSitsMC9paFVacTBnTVNY?=
 =?utf-8?B?WmU0R3N3OGdxUzV4REw3cEpQcE9SV0tvdUt5ZzRIT0VDZDVidDBkVVM1L3FF?=
 =?utf-8?B?eHZUWnZHd2FJUlVFSUFIbFVvbEhzL2hkWW5YTUNXUmpqVXZ4SjhMczJOL2tR?=
 =?utf-8?B?ZHp3b01aMUtFcllIQ0JQUlgrMXo4RlRaVFVBWVd1b01NTW5qcituUXVTWlFC?=
 =?utf-8?B?ZDg0Y1JtdGxkRGV0R1lXU1ZKUW55RUx1MmxlQTZpT3RlQXZRSStvQTJ2WUlx?=
 =?utf-8?B?d2NhYy8rUVViZ2pSajluTi9zWjcwTkZQdlJJcEVCc0wrb0NZOTltUmRjNDho?=
 =?utf-8?B?WDVQSnhRREZHcXF3MmxWOEdTYkdPT1VnUlBhVytYQUEwbFBtUFhIQzA2Z05v?=
 =?utf-8?B?MDlGOUR6WDVocFJpVGlNWGVPMi9XaDY4NWhtUDR1UmdXUDhqR3JaMFJFTnZw?=
 =?utf-8?B?K3JTT0ZxUVljWTdieWVvNjhSMzdXdEg3LzlHYjRWSi9FNEZUSDNocG5memJi?=
 =?utf-8?Q?7GH8iyufBYCmxY7Phv3mAGt0Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19288d99-e591-49c1-9934-08daff7b642e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 08:57:45.4744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22nqlTiDehuZ5YlJa6PUhDWvfLK6BCdg+fQAeGLhNDSjwtu0Mf4Th4drj4ouW9sgkVhWsjn0VHhrtRX5UXzHBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7021

On 25.01.2023 19:45, Krister Johansen wrote:
> v2:
>   - Fix whitespace between comment and #defines (feedback from Jan Beulich)

Hmm, ...

> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -72,6 +72,14 @@
>   * Sub-leaf 2: EAX: host tsc frequency in kHz
>   */
>  
> +#define XEN_CPUID_TSC_EMULATED               (1u << 0)
> +#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
> +#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
> +#define XEN_CPUID_TSC_MODE_DEFAULT           (0)
> +#define XEN_CPUID_TSC_MODE_EMULATE           (1u)
> +#define XEN_CPUID_TSC_MODE_NOEMULATE         (2u)
> +#define XEN_CPUID_TSC_MODE_NOEMULATE_TSC_AUX (3u)

... while I'm fine with the leading blank line, what my earlier comment was
about really are the two separate blocks of #define-s (the flag bits and the
modes). I'll take care of this while committing; with the adjustment

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

