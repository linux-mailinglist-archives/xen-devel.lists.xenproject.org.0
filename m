Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EF569E193
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498930.769892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSw8-00010V-B1; Tue, 21 Feb 2023 13:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498930.769892; Tue, 21 Feb 2023 13:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSw8-0000yV-7V; Tue, 21 Feb 2023 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 498930;
 Tue, 21 Feb 2023 13:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUSw7-0000yP-58
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:44:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc125f51-b1ed-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 14:44:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:43:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 13:43:59 +0000
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
X-Inumbo-ID: cc125f51-b1ed-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkveMoSjrFPh+M3TT4E6u/r2jlusw7dqCvSLG4GLr4vcD0ox/hmxGroNQOcJHRAX78ihOHqO/mkyJ9Rcf3eL/kdS8EaeDGpv/NoHkQd5bfRAs8oquBSFQoZs03QsZojeaY/3TsLEINWQXuyiIXG0sihO9ZXoQcvNw1c8yVBZaA+Jrb40W9jHLsENR1O62EI3E6iit8OAZijiTvWG78Goy1H8f4mr3zVb6aD9FeuXEZMpYQOdT/grsReEwYKwIKsZ7CRaFKUIalqILsjCe9CIge25FksjmcAiZsV8e8NQe77CJBaY9oD1vOMgg9tczZu7TZYVL5U1aY0wngfdlBdg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0h+IFmTm7H0B8bt9+u1IPd1LTqVSaMnnzLYj4qgZWw=;
 b=VT9tvHTyC6iqlUb8vPwR/UKBr/eT2zRY8hhioKVR2GYQhKxWnV/mJBc47nmiorA2Uwd9lk0jed2JyKOWDbQdGhTX3cF8ax8ud0pdK0T5HYnZ0InLYLJc0XnidCcCkiqW9854J9rWXSUWlNw337N2QT4iT+mRQIWGqw7E9j+9hTHd6eAoWcfOOAOyg4SCnzJcMo7oXl3945XFjMLkSkeE/lbnNZTFfogMnRgah7J38fO46C59c0ANtHMSu7xlhMpCkr4NUYBgGUZcYfngRsOVXs7VCOfVBx4AHP4BmV/SHv9zFZqQrs/p6EcmjucGlR9D8BQPf+Kh8RJXUlE2VzI5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0h+IFmTm7H0B8bt9+u1IPd1LTqVSaMnnzLYj4qgZWw=;
 b=kbzXeZvy4TjluGYFGfVrqb6Ekt2I8LW35PDK2mmgbqpjHA1C3uW39bnzM+Bm3svKSl0GyescQsLK5LBAHAgMrsTvEwpVxaW64VitYaI9PHooeI8cEH7Pd6FK9SO4349t0ReZOWbCXW3k5nNiuQ/6+fNEn8KgUY+9FXBla9xZUpaGcWsyxTPenOHIk1A/FTUGQq9n2SAVm6aIZwsHzaNk6kMucA/2+KDvg7SbqP/UJNBWoorpduXPSKQiWHWAT4Nh2pnpB5DPu2pEDYt11CNeISExCnHI67CWl1tbzB7M57n4ydmKUIYefxAVj92sUBCtTbxbDpEBxSn86reFv40BZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2def744e-e074-db7f-cb8f-3ec2e6ed273a@suse.com>
Date: Tue, 21 Feb 2023 14:43:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Ping: [PATCH 1/6] x86/Hyper-V: use standard C types in hyperv-tlfs.h
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <f62c157f-b4ed-6bb5-9862-992d8b881bff@suse.com>
In-Reply-To: <f62c157f-b4ed-6bb5-9862-992d8b881bff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd8f451-76a1-45d3-9762-08db1411af3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7qMLB7cns0A8D7bQ15wOPl3AHL3MhXZ4mtUmHR4fr/WPZLhwuCPBsqfbM2WzhBJBn28yqP9oCEeTXsZjjN7zas1jaj++31rwl/x6G4tInRhzJgQ7qmH8wKps7qGluSFfH8AGKnP8fII9eVe/FLgZLyqcqOQ1E+aFUN11li01q+XHCBjsohz8VADk/CRL//5WMYj9xGclBJTmPb2AASqokTtAj6R0A4DTNWiHOrveA+BNIj2qmabrJNiR7i3YGtmKQd7X5EtMIq1kCUp5/XL1tnezM6bs/U3DhduxGF1aBtTa6FUqi6KZhs6m51jsKqtgjcw8IXcs11imP8BMeGEyq3AVUSsl75ENpzKJXGqX5t3980Jl9nATgczjNOGQ2J+nyIjhbjdIDUIwHhRl1sP8YwRODFIRbbZ+5alqRRIRmbx34uhxT7ixTgYM40/Jv/OHUvRy3Opibrkw5V1PEBR2++M0bIZ1xT7L5UPhSPCNxmEwXniX6D8wzF5J0PXYkGwp1JQ9PfzGkwZdH/J7E2QRAvWds1idwyYGL7Ew9itkILvf0J7ELcmkMmDik8m9CmM4cPkWuihWHOLlfZfvA49ILgOABxEB2T7f+N9jeLI6AgnZ5iXKXR8w/4WhfybtCN5AcutCWNnEwjhR+0Vy4UZpSUp4wyKiYlfSdK3d9ygRwXngKhuXtV2kc3xz0RsD7iGgw/9u7k6OltL+nbOHMxy/KgET6yKSMRgg+DGlxMKz6uM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39850400004)(136003)(376002)(366004)(346002)(451199018)(38100700002)(83380400001)(31696002)(86362001)(36756003)(8936002)(2906002)(41300700001)(5660300002)(30864003)(6512007)(26005)(53546011)(186003)(2616005)(6506007)(4326008)(316002)(66556008)(66946007)(8676002)(6486002)(110136005)(54906003)(66476007)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmRPMU5JZEVlZlZqYTFDbHhSWUFuZnUrdVZjaUwwUDRvSk02WVBCdmc0VTRK?=
 =?utf-8?B?MlVid0tqUzE4SjNnekRIZnhicUxJYm9zMjYvM1JpMk1mYjRieExVVE9YMHJB?=
 =?utf-8?B?L3VYS3FONkJnQUllbVpMWTNOTVBuazFTck5Zdk5pOGF6QTNCdjY4Q2NuanVE?=
 =?utf-8?B?cHRZNCtJT2kvckF3ZlNqMzZZV21GYWtoRGdrOFQ1aG9nSmRNTngyazRsSGJG?=
 =?utf-8?B?NWV6NWZReE93SDNVS1J5MjhSSklkcS8wVlBEQXZFUDZlSUxEeXp1TC9wcHV6?=
 =?utf-8?B?U2k0ME5VcitwbVFjcVVEd2ZPektjYmNMSFIzdG9SWGxOQUhIWk1zL0t2T092?=
 =?utf-8?B?NGpERlhzU0NjYXhRNVNtbE9Qd2FkWmkrN2xvckdYSGZmNzBsck5iMW1EcXZK?=
 =?utf-8?B?K3MxVnJ4cVRab2JqNmNZK0JzVDd1UDJIVmd2WSs0bG8xZ3hYMFdPMHBwaE5K?=
 =?utf-8?B?Z25rQVNRbnovajJXUy9WWVVFQ2xmeWlYZnM2RHJ6TmFsNkRGTGFyUXB6UTdG?=
 =?utf-8?B?b3VYdkRXM1J4N3NFa0pVcEFnOC95Nm5pUk9LMW1CRjBFV2t6RFF5UWIwNVV6?=
 =?utf-8?B?aFc2RG1BRzR6M0FSRkdLbzZMSHowUUpRVzBkUVROSnYyUlQ1VkNZVE92K2Qz?=
 =?utf-8?B?eGt2b3NVTjhsc2xubTRqZEY4Q2haWi8rL2EvY05iaTFzUE1Lb0hHeklkVSsr?=
 =?utf-8?B?RXB6bE83Qjg1L3l3ZHZTbWp3VzdQK1YxWGxaL1gzOFczY2kxcUN5NS85dWNt?=
 =?utf-8?B?N015VHVwSkFscVY3WmF6U3FGZE8ySVk1c0ZzbFNHRjVRcWRFeUh5U0VEc3B1?=
 =?utf-8?B?aFRmK200OWFPQm0wNDBkaHZla3pDc0F3S0VjdzRjb2xMYUt3MVp2TitOWXl3?=
 =?utf-8?B?a0czbktvWnBqc241ZDh5Q1hKVkZMa0xveDB3ay9SM24rTldxQTZKQUZVM0tH?=
 =?utf-8?B?c3lxdXp5dzNLemhZNjhmNjBTUEZXN3VNc2hycjIzOFZBZjc2SmN0M2ZDV1BS?=
 =?utf-8?B?SGVyRE1DNDJCbytIRm9BY2FQSmtpUjlnU2JNLzlVUXg4bThlY2VFVkprajlY?=
 =?utf-8?B?dmNLV0ZwcTBnQjBQbTBvZFFMUG1oREx5VmpwYlk1RlhWQjBLUjJDV3Vtc3l3?=
 =?utf-8?B?VnU5OXRYWlBxRTArMDVoaUk3T3dOQzVNMmhJamRtQ0tZMDd5dUg2THZKaXZI?=
 =?utf-8?B?ZHdLWGdUcnRMb0d6MWlSMm5WbUtxQlpZSHFzbUc3cnJETmpOaCtJZ0pQSmhI?=
 =?utf-8?B?b05YVGdObzdIcllQY2VOV3VadklMZlNGbmdmc2ZXT29TcWxld2NCWE9oZ1pR?=
 =?utf-8?B?T3NsMEVGTEV6KzJac0U2VzBGZU5QZjRlcDUrRERzK3RsbkZncnpoK3FaWUlh?=
 =?utf-8?B?K21GVVEyakN2VncyNlJLaDR1RkNaMHI2UWtIQnJKR01RVjl5MGVISjliWEpr?=
 =?utf-8?B?a0Z2WkQ0cEl4K3E0cXNQS2FudlFQQzBwbjhBUlZmblM3RTZvMU1PWVpOS2hl?=
 =?utf-8?B?dm9DV0crNmt1VmhaanRBZllxV3U4ZHBVZWNxSnhkdzg4S3RyUFE0WS9VMGV2?=
 =?utf-8?B?c3c2MjJadVBBRW1CcFA2Rmx4bGJuallyak1zSkVCemdhMG9OWGpxSUEzZUpF?=
 =?utf-8?B?K2JQUUROaFcxdXJiaVRxSXVYbDdnM2VmMUEwTllGUTZ1dEdnVXBQMXNWRzhn?=
 =?utf-8?B?WTlla2FYbXpUMStScnVPUEdrcHJrb0U0UFhGcjIvY0lRcUlUVFVmb0IvNWhW?=
 =?utf-8?B?eS8ybmRIRUVFeWd2VVlTUFl6VERUbllUZTYrS3lyTU1tS0owSFFzMFRWS3BC?=
 =?utf-8?B?bmlqTDdlNUh1QmJ5V051WUNPQUVyU1pEYW5zaXkwaHd1bjBFSUREdGk5ODB6?=
 =?utf-8?B?Q0ZlU2JGQVhuTlgxTXRqdi84V2Q3T2pNamZTZVNXdDMra0F5L3hkM3JDclVr?=
 =?utf-8?B?K1kwNnhnb1VGazFYOGJ6VDIyVy9LSzlNSHlxUW45YWtnazR0QmZEdVcxbm5Z?=
 =?utf-8?B?QmJHbkhDN1B4U0I1TFhDMjJnenlaVU0yVnl2RXhRa2MwSmd5SDFFYU0rUnBH?=
 =?utf-8?B?bStDN09RWDdHY1Z4TlNzYmJ4U3dUdGd6KzFrd0U3QW5oanErenM2U2h5Z0xo?=
 =?utf-8?Q?N7PeMQnims5aY8ZNojBDIC6e6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd8f451-76a1-45d3-9762-08db1411af3d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:43:59.1980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hgyiwY+w2xSHMZPCaXQ6ukXlPMYO1/YisDrpay0OILI8EhxdU/m+AnyziiP2WCgmx5vEC/Mje7dkUDwFa19gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295

On 09.02.2023 11:38, Jan Beulich wrote:
> This is the only file left with a use of an __s<N> type coming from
> Linux. Since the file has been using an apparently random mix of all
> three classes of fixed-width types (__{s,u}<N>, {s,u}<N>, and
> {,u}int<N>_t), consolidate this to use exclusively standard types.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ping? (I'll wait a few more days, but I'm going to commit this eventually
with just Andrew's ack if no maintainer one arrives.)

Jan

> --- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> +++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> @@ -283,11 +283,11 @@
>   * Declare the MSR used to setup pages used to communicate with the hypervisor.
>   */
>  union hv_x64_msr_hypercall_contents {
> -	u64 as_uint64;
> +	uint64_t as_uint64;
>  	struct {
> -		u64 enable:1;
> -		u64 reserved:11;
> -		u64 guest_physical_address:52;
> +		uint64_t enable:1;
> +		uint64_t reserved:11;
> +		uint64_t guest_physical_address:52;
>  	};
>  };
>  
> @@ -295,11 +295,11 @@ union hv_x64_msr_hypercall_contents {
>   * TSC page layout.
>   */
>  struct ms_hyperv_tsc_page {
> -	volatile u32 tsc_sequence;
> -	u32 reserved1;
> -	volatile u64 tsc_scale;
> -	volatile s64 tsc_offset;
> -	u64 reserved2[509];
> +	volatile uint32_t tsc_sequence;
> +	uint32_t reserved1;
> +	volatile uint64_t tsc_scale;
> +	volatile int64_t tsc_offset;
> +	uint64_t reserved2[509];
>  };
>  
>  /*
> @@ -343,21 +343,21 @@ union hv_guest_os_id
>  };
>  
>  struct hv_reenlightenment_control {
> -	__u64 vector:8;
> -	__u64 reserved1:8;
> -	__u64 enabled:1;
> -	__u64 reserved2:15;
> -	__u64 target_vp:32;
> +	uint64_t vector:8;
> +	uint64_t reserved1:8;
> +	uint64_t enabled:1;
> +	uint64_t reserved2:15;
> +	uint64_t target_vp:32;
>  };
>  
>  struct hv_tsc_emulation_control {
> -	__u64 enabled:1;
> -	__u64 reserved:63;
> +	uint64_t enabled:1;
> +	uint64_t reserved:63;
>  };
>  
>  struct hv_tsc_emulation_status {
> -	__u64 inprogress:1;
> -	__u64 reserved:63;
> +	uint64_t inprogress:1;
> +	uint64_t reserved:63;
>  };
>  
>  #define HV_X64_MSR_HYPERCALL_ENABLE		0x00000001
> @@ -442,10 +442,10 @@ enum HV_GENERIC_SET_FORMAT {
>  #define HV_CLOCK_HZ (NSEC_PER_SEC/100)
>  
>  typedef struct _HV_REFERENCE_TSC_PAGE {
> -	__u32 tsc_sequence;
> -	__u32 res1;
> -	__u64 tsc_scale;
> -	__s64 tsc_offset;
> +	uint32_t tsc_sequence;
> +	uint32_t res1;
> +	uint64_t tsc_scale;
> +	int64_t tsc_offset;
>  } HV_REFERENCE_TSC_PAGE, *PHV_REFERENCE_TSC_PAGE;
>  
>  /* Define the number of synthetic interrupt sources. */
> @@ -499,30 +499,30 @@ enum hv_message_type {
>  
>  /* Define synthetic interrupt controller message flags. */
>  union hv_message_flags {
> -	__u8 asu8;
> +	uint8_t asu8;
>  	struct {
> -		__u8 msg_pending:1;
> -		__u8 reserved:7;
> +		uint8_t msg_pending:1;
> +		uint8_t reserved:7;
>  	};
>  };
>  
>  /* Define port identifier type. */
>  union hv_port_id {
> -	__u32 asu32;
> +	uint32_t asu32;
>  	struct {
> -		__u32 id:24;
> -		__u32 reserved:8;
> +		uint32_t id:24;
> +		uint32_t reserved:8;
>  	} u;
>  };
>  
>  /* Define synthetic interrupt controller message header. */
>  struct hv_message_header {
> -	__u32 message_type;
> -	__u8 payload_size;
> +	uint32_t message_type;
> +	uint8_t payload_size;
>  	union hv_message_flags message_flags;
> -	__u8 reserved[2];
> +	uint8_t reserved[2];
>  	union {
> -		__u64 sender;
> +		uint64_t sender;
>  		union hv_port_id port;
>  	};
>  };
> @@ -531,7 +531,7 @@ struct hv_message_header {
>  struct hv_message {
>  	struct hv_message_header header;
>  	union {
> -		__u64 payload[HV_MESSAGE_PAYLOAD_QWORD_COUNT];
> +		uint64_t payload[HV_MESSAGE_PAYLOAD_QWORD_COUNT];
>  	} u;
>  };
>  
> @@ -542,19 +542,19 @@ struct hv_message_page {
>  
>  /* Define timer message payload structure. */
>  struct hv_timer_message_payload {
> -	__u32 timer_index;
> -	__u32 reserved;
> -	__u64 expiration_time;	/* When the timer expired */
> -	__u64 delivery_time;	/* When the message was delivered */
> +	uint32_t timer_index;
> +	uint32_t reserved;
> +	uint64_t expiration_time; /* When the timer expired */
> +	uint64_t delivery_time;   /* When the message was delivered */
>  };
>  
>  struct hv_nested_enlightenments_control {
>  	struct {
> -		__u32 directhypercall:1;
> -		__u32 reserved:31;
> +		uint32_t directhypercall:1;
> +		uint32_t reserved:31;
>  	} features;
>  	struct {
> -		__u32 reserved;
> +		uint32_t reserved;
>  	} hypercallControls;
>  };
>  
> @@ -571,199 +571,199 @@ union hv_vp_assist_page_msr
>  
>  /* Define virtual processor assist page structure. */
>  struct hv_vp_assist_page {
> -	__u32 apic_assist;
> -	__u32 reserved1;
> -	__u64 vtl_control[3];
> +	uint32_t apic_assist;
> +	uint32_t reserved1;
> +	uint64_t vtl_control[3];
>  	struct hv_nested_enlightenments_control nested_control;
> -	__u8 enlighten_vmentry;
> -	__u8 reserved2[7];
> -	__u64 current_nested_vmcs;
> +	uint8_t enlighten_vmentry;
> +	uint8_t reserved2[7];
> +	uint64_t current_nested_vmcs;
>  };
>  
>  struct hv_enlightened_vmcs {
> -	u32 revision_id;
> -	u32 abort;
> +	uint32_t revision_id;
> +	uint32_t abort;
>  
> -	u16 host_es_selector;
> -	u16 host_cs_selector;
> -	u16 host_ss_selector;
> -	u16 host_ds_selector;
> -	u16 host_fs_selector;
> -	u16 host_gs_selector;
> -	u16 host_tr_selector;
> -
> -	u16 padding16_1;
> -
> -	u64 host_ia32_pat;
> -	u64 host_ia32_efer;
> -
> -	u64 host_cr0;
> -	u64 host_cr3;
> -	u64 host_cr4;
> -
> -	u64 host_ia32_sysenter_esp;
> -	u64 host_ia32_sysenter_eip;
> -	u64 host_rip;
> -	u32 host_ia32_sysenter_cs;
> -
> -	u32 pin_based_vm_exec_control;
> -	u32 vm_exit_controls;
> -	u32 secondary_vm_exec_control;
> -
> -	u64 io_bitmap_a;
> -	u64 io_bitmap_b;
> -	u64 msr_bitmap;
> -
> -	u16 guest_es_selector;
> -	u16 guest_cs_selector;
> -	u16 guest_ss_selector;
> -	u16 guest_ds_selector;
> -	u16 guest_fs_selector;
> -	u16 guest_gs_selector;
> -	u16 guest_ldtr_selector;
> -	u16 guest_tr_selector;
> -
> -	u32 guest_es_limit;
> -	u32 guest_cs_limit;
> -	u32 guest_ss_limit;
> -	u32 guest_ds_limit;
> -	u32 guest_fs_limit;
> -	u32 guest_gs_limit;
> -	u32 guest_ldtr_limit;
> -	u32 guest_tr_limit;
> -	u32 guest_gdtr_limit;
> -	u32 guest_idtr_limit;
> -
> -	u32 guest_es_ar_bytes;
> -	u32 guest_cs_ar_bytes;
> -	u32 guest_ss_ar_bytes;
> -	u32 guest_ds_ar_bytes;
> -	u32 guest_fs_ar_bytes;
> -	u32 guest_gs_ar_bytes;
> -	u32 guest_ldtr_ar_bytes;
> -	u32 guest_tr_ar_bytes;
> -
> -	u64 guest_es_base;
> -	u64 guest_cs_base;
> -	u64 guest_ss_base;
> -	u64 guest_ds_base;
> -	u64 guest_fs_base;
> -	u64 guest_gs_base;
> -	u64 guest_ldtr_base;
> -	u64 guest_tr_base;
> -	u64 guest_gdtr_base;
> -	u64 guest_idtr_base;
> -
> -	u64 padding64_1[3];
> -
> -	u64 vm_exit_msr_store_addr;
> -	u64 vm_exit_msr_load_addr;
> -	u64 vm_entry_msr_load_addr;
> -
> -	u64 cr3_target_value0;
> -	u64 cr3_target_value1;
> -	u64 cr3_target_value2;
> -	u64 cr3_target_value3;
> -
> -	u32 page_fault_error_code_mask;
> -	u32 page_fault_error_code_match;
> -
> -	u32 cr3_target_count;
> -	u32 vm_exit_msr_store_count;
> -	u32 vm_exit_msr_load_count;
> -	u32 vm_entry_msr_load_count;
> -
> -	u64 tsc_offset;
> -	u64 virtual_apic_page_addr;
> -	u64 vmcs_link_pointer;
> -
> -	u64 guest_ia32_debugctl;
> -	u64 guest_ia32_pat;
> -	u64 guest_ia32_efer;
> -
> -	u64 guest_pdptr0;
> -	u64 guest_pdptr1;
> -	u64 guest_pdptr2;
> -	u64 guest_pdptr3;
> -
> -	u64 guest_pending_dbg_exceptions;
> -	u64 guest_sysenter_esp;
> -	u64 guest_sysenter_eip;
> -
> -	u32 guest_activity_state;
> -	u32 guest_sysenter_cs;
> -
> -	u64 cr0_guest_host_mask;
> -	u64 cr4_guest_host_mask;
> -	u64 cr0_read_shadow;
> -	u64 cr4_read_shadow;
> -	u64 guest_cr0;
> -	u64 guest_cr3;
> -	u64 guest_cr4;
> -	u64 guest_dr7;
> -
> -	u64 host_fs_base;
> -	u64 host_gs_base;
> -	u64 host_tr_base;
> -	u64 host_gdtr_base;
> -	u64 host_idtr_base;
> -	u64 host_rsp;
> -
> -	u64 ept_pointer;
> -
> -	u16 virtual_processor_id;
> -	u16 padding16_2[3];
> -
> -	u64 padding64_2[5];
> -	u64 guest_physical_address;
> -
> -	u32 vm_instruction_error;
> -	u32 vm_exit_reason;
> -	u32 vm_exit_intr_info;
> -	u32 vm_exit_intr_error_code;
> -	u32 idt_vectoring_info_field;
> -	u32 idt_vectoring_error_code;
> -	u32 vm_exit_instruction_len;
> -	u32 vmx_instruction_info;
> -
> -	u64 exit_qualification;
> -	u64 exit_io_instruction_ecx;
> -	u64 exit_io_instruction_esi;
> -	u64 exit_io_instruction_edi;
> -	u64 exit_io_instruction_eip;
> -
> -	u64 guest_linear_address;
> -	u64 guest_rsp;
> -	u64 guest_rflags;
> -
> -	u32 guest_interruptibility_info;
> -	u32 cpu_based_vm_exec_control;
> -	u32 exception_bitmap;
> -	u32 vm_entry_controls;
> -	u32 vm_entry_intr_info_field;
> -	u32 vm_entry_exception_error_code;
> -	u32 vm_entry_instruction_len;
> -	u32 tpr_threshold;
> -
> -	u64 guest_rip;
> -
> -	u32 hv_clean_fields;
> -	u32 hv_padding_32;
> -	u32 hv_synthetic_controls;
> -	struct {
> -		u32 nested_flush_hypercall:1;
> -		u32 msr_bitmap:1;
> -		u32 reserved:30;
> +	uint16_t host_es_selector;
> +	uint16_t host_cs_selector;
> +	uint16_t host_ss_selector;
> +	uint16_t host_ds_selector;
> +	uint16_t host_fs_selector;
> +	uint16_t host_gs_selector;
> +	uint16_t host_tr_selector;
> +
> +	uint16_t padding16_1;
> +
> +	uint64_t host_ia32_pat;
> +	uint64_t host_ia32_efer;
> +
> +	uint64_t host_cr0;
> +	uint64_t host_cr3;
> +	uint64_t host_cr4;
> +
> +	uint64_t host_ia32_sysenter_esp;
> +	uint64_t host_ia32_sysenter_eip;
> +	uint64_t host_rip;
> +	uint32_t host_ia32_sysenter_cs;
> +
> +	uint32_t pin_based_vm_exec_control;
> +	uint32_t vm_exit_controls;
> +	uint32_t secondary_vm_exec_control;
> +
> +	uint64_t io_bitmap_a;
> +	uint64_t io_bitmap_b;
> +	uint64_t msr_bitmap;
> +
> +	uint16_t guest_es_selector;
> +	uint16_t guest_cs_selector;
> +	uint16_t guest_ss_selector;
> +	uint16_t guest_ds_selector;
> +	uint16_t guest_fs_selector;
> +	uint16_t guest_gs_selector;
> +	uint16_t guest_ldtr_selector;
> +	uint16_t guest_tr_selector;
> +
> +	uint32_t guest_es_limit;
> +	uint32_t guest_cs_limit;
> +	uint32_t guest_ss_limit;
> +	uint32_t guest_ds_limit;
> +	uint32_t guest_fs_limit;
> +	uint32_t guest_gs_limit;
> +	uint32_t guest_ldtr_limit;
> +	uint32_t guest_tr_limit;
> +	uint32_t guest_gdtr_limit;
> +	uint32_t guest_idtr_limit;
> +
> +	uint32_t guest_es_ar_bytes;
> +	uint32_t guest_cs_ar_bytes;
> +	uint32_t guest_ss_ar_bytes;
> +	uint32_t guest_ds_ar_bytes;
> +	uint32_t guest_fs_ar_bytes;
> +	uint32_t guest_gs_ar_bytes;
> +	uint32_t guest_ldtr_ar_bytes;
> +	uint32_t guest_tr_ar_bytes;
> +
> +	uint64_t guest_es_base;
> +	uint64_t guest_cs_base;
> +	uint64_t guest_ss_base;
> +	uint64_t guest_ds_base;
> +	uint64_t guest_fs_base;
> +	uint64_t guest_gs_base;
> +	uint64_t guest_ldtr_base;
> +	uint64_t guest_tr_base;
> +	uint64_t guest_gdtr_base;
> +	uint64_t guest_idtr_base;
> +
> +	uint64_t padding64_1[3];
> +
> +	uint64_t vm_exit_msr_store_addr;
> +	uint64_t vm_exit_msr_load_addr;
> +	uint64_t vm_entry_msr_load_addr;
> +
> +	uint64_t cr3_target_value0;
> +	uint64_t cr3_target_value1;
> +	uint64_t cr3_target_value2;
> +	uint64_t cr3_target_value3;
> +
> +	uint32_t page_fault_error_code_mask;
> +	uint32_t page_fault_error_code_match;
> +
> +	uint32_t cr3_target_count;
> +	uint32_t vm_exit_msr_store_count;
> +	uint32_t vm_exit_msr_load_count;
> +	uint32_t vm_entry_msr_load_count;
> +
> +	uint64_t tsc_offset;
> +	uint64_t virtual_apic_page_addr;
> +	uint64_t vmcs_link_pointer;
> +
> +	uint64_t guest_ia32_debugctl;
> +	uint64_t guest_ia32_pat;
> +	uint64_t guest_ia32_efer;
> +
> +	uint64_t guest_pdptr0;
> +	uint64_t guest_pdptr1;
> +	uint64_t guest_pdptr2;
> +	uint64_t guest_pdptr3;
> +
> +	uint64_t guest_pending_dbg_exceptions;
> +	uint64_t guest_sysenter_esp;
> +	uint64_t guest_sysenter_eip;
> +
> +	uint32_t guest_activity_state;
> +	uint32_t guest_sysenter_cs;
> +
> +	uint64_t cr0_guest_host_mask;
> +	uint64_t cr4_guest_host_mask;
> +	uint64_t cr0_read_shadow;
> +	uint64_t cr4_read_shadow;
> +	uint64_t guest_cr0;
> +	uint64_t guest_cr3;
> +	uint64_t guest_cr4;
> +	uint64_t guest_dr7;
> +
> +	uint64_t host_fs_base;
> +	uint64_t host_gs_base;
> +	uint64_t host_tr_base;
> +	uint64_t host_gdtr_base;
> +	uint64_t host_idtr_base;
> +	uint64_t host_rsp;
> +
> +	uint64_t ept_pointer;
> +
> +	uint16_t virtual_processor_id;
> +	uint16_t padding16_2[3];
> +
> +	uint64_t padding64_2[5];
> +	uint64_t guest_physical_address;
> +
> +	uint32_t vm_instruction_error;
> +	uint32_t vm_exit_reason;
> +	uint32_t vm_exit_intr_info;
> +	uint32_t vm_exit_intr_error_code;
> +	uint32_t idt_vectoring_info_field;
> +	uint32_t idt_vectoring_error_code;
> +	uint32_t vm_exit_instruction_len;
> +	uint32_t vmx_instruction_info;
> +
> +	uint64_t exit_qualification;
> +	uint64_t exit_io_instruction_ecx;
> +	uint64_t exit_io_instruction_esi;
> +	uint64_t exit_io_instruction_edi;
> +	uint64_t exit_io_instruction_eip;
> +
> +	uint64_t guest_linear_address;
> +	uint64_t guest_rsp;
> +	uint64_t guest_rflags;
> +
> +	uint32_t guest_interruptibility_info;
> +	uint32_t cpu_based_vm_exec_control;
> +	uint32_t exception_bitmap;
> +	uint32_t vm_entry_controls;
> +	uint32_t vm_entry_intr_info_field;
> +	uint32_t vm_entry_exception_error_code;
> +	uint32_t vm_entry_instruction_len;
> +	uint32_t tpr_threshold;
> +
> +	uint64_t guest_rip;
> +
> +	uint32_t hv_clean_fields;
> +	uint32_t hv_padding_32;
> +	uint32_t hv_synthetic_controls;
> +	struct {
> +		uint32_t nested_flush_hypercall:1;
> +		uint32_t msr_bitmap:1;
> +		uint32_t reserved:30;
>  	}  hv_enlightenments_control;
> -	u32 hv_vp_id;
> +	uint32_t hv_vp_id;
>  
> -	u64 hv_vm_id;
> -	u64 partition_assist_page;
> -	u64 padding64_4[4];
> -	u64 guest_bndcfgs;
> -	u64 padding64_5[7];
> -	u64 xss_exit_bitmap;
> -	u64 padding64_6[7];
> +	uint64_t hv_vm_id;
> +	uint64_t partition_assist_page;
> +	uint64_t padding64_4[4];
> +	uint64_t guest_bndcfgs;
> +	uint64_t padding64_5[7];
> +	uint64_t xss_exit_bitmap;
> +	uint64_t padding64_6[7];
>  };
>  
>  #define HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE			0
> @@ -794,17 +794,17 @@ struct hv_enlightened_vmcs {
>   * Synthetic timer configuration.
>   */
>  union hv_stimer_config {
> -	u64 as_uint64;
> +	uint64_t as_uint64;
>  	struct {
> -		u64 enable:1;
> -		u64 periodic:1;
> -		u64 lazy:1;
> -		u64 auto_enable:1;
> -		u64 apic_vector:8;
> -		u64 direct_mode:1;
> -		u64 reserved_z0:3;
> -		u64 sintx:4;
> -		u64 reserved_z1:44;
> +		uint64_t enable:1;
> +		uint64_t periodic:1;
> +		uint64_t lazy:1;
> +		uint64_t auto_enable:1;
> +		uint64_t apic_vector:8;
> +		uint64_t direct_mode:1;
> +		uint64_t reserved_z0:3;
> +		uint64_t sintx:4;
> +		uint64_t reserved_z1:44;
>  	};
>  };
>  
> @@ -816,70 +816,70 @@ union hv_synic_event_flags {
>  
>  /* Define SynIC control register. */
>  union hv_synic_scontrol {
> -	u64 as_uint64;
> +	uint64_t as_uint64;
>  	struct {
> -		u64 enable:1;
> -		u64 reserved:63;
> +		uint64_t enable:1;
> +		uint64_t reserved:63;
>  	};
>  };
>  
>  /* Define synthetic interrupt source. */
>  union hv_synic_sint {
> -	u64 as_uint64;
> +	uint64_t as_uint64;
>  	struct {
> -		u64 vector:8;
> -		u64 reserved1:8;
> -		u64 masked:1;
> -		u64 auto_eoi:1;
> -		u64 polling:1;
> -		u64 reserved2:45;
> +		uint64_t vector:8;
> +		uint64_t reserved1:8;
> +		uint64_t masked:1;
> +		uint64_t auto_eoi:1;
> +		uint64_t polling:1;
> +		uint64_t reserved2:45;
>  	};
>  };
>  
>  /* Define the format of the SIMP register */
>  union hv_synic_simp {
> -	u64 as_uint64;
> +	uint64_t as_uint64;
>  	struct {
> -		u64 simp_enabled:1;
> -		u64 preserved:11;
> -		u64 base_simp_gpa:52;
> +		uint64_t simp_enabled:1;
> +		uint64_t preserved:11;
> +		uint64_t base_simp_gpa:52;
>  	};
>  };
>  
>  /* Define the format of the SIEFP register */
>  union hv_synic_siefp {
> -	u64 as_uint64;
> +	uint64_t as_uint64;
>  	struct {
> -		u64 siefp_enabled:1;
> -		u64 preserved:11;
> -		u64 base_siefp_gpa:52;
> +		uint64_t siefp_enabled:1;
> +		uint64_t preserved:11;
> +		uint64_t base_siefp_gpa:52;
>  	};
>  };
>  
>  struct hv_vpset {
> -	u64 format;
> -	u64 valid_bank_mask;
> -	u64 bank_contents[];
> +	uint64_t format;
> +	uint64_t valid_bank_mask;
> +	uint64_t bank_contents[];
>  };
>  
>  /* HvCallSendSyntheticClusterIpi hypercall */
>  struct hv_send_ipi {
> -	u32 vector;
> -	u32 reserved;
> -	u64 cpu_mask;
> +	uint32_t vector;
> +	uint32_t reserved;
> +	uint64_t cpu_mask;
>  };
>  
>  /* HvCallSendSyntheticClusterIpiEx hypercall */
>  struct hv_send_ipi_ex {
> -	u32 vector;
> -	u32 reserved;
> +	uint32_t vector;
> +	uint32_t reserved;
>  	struct hv_vpset vp_set;
>  };
>  
>  /* HvFlushGuestPhysicalAddressSpace hypercalls */
>  struct hv_guest_mapping_flush {
> -	u64 address_space;
> -	u64 flags;
> +	uint64_t address_space;
> +	uint64_t flags;
>  };
>  
>  /*
> @@ -890,11 +890,11 @@ struct hv_guest_mapping_flush {
>  
>  /* HvFlushGuestPhysicalAddressList hypercall */
>  union hv_gpa_page_range {
> -	u64 address_space;
> +	uint64_t address_space;
>  	struct {
> -		u64 additional_pages:11;
> -		u64 largepage:1;
> -		u64 basepfn:52;
> +		uint64_t additional_pages:11;
> +		uint64_t largepage:1;
> +		uint64_t basepfn:52;
>  	} page;
>  };
>  
> @@ -903,32 +903,32 @@ union hv_gpa_page_range {
>   * count is equal with how many entries of union hv_gpa_page_range can
>   * be populated into the input parameter page.
>   */
> -#define HV_MAX_FLUSH_REP_COUNT ((HV_HYP_PAGE_SIZE - 2 * sizeof(u64)) /	\
> +#define HV_MAX_FLUSH_REP_COUNT ((HV_HYP_PAGE_SIZE - 2 * sizeof(uint64_t)) / \
>  				sizeof(union hv_gpa_page_range))
>  
>  struct hv_guest_mapping_flush_list {
> -	u64 address_space;
> -	u64 flags;
> +	uint64_t address_space;
> +	uint64_t flags;
>  	union hv_gpa_page_range gpa_list[HV_MAX_FLUSH_REP_COUNT];
>  };
>  
>  /* HvFlushVirtualAddressSpace, HvFlushVirtualAddressList hypercalls */
>  struct hv_tlb_flush {
> -	u64 address_space;
> -	u64 flags;
> -	u64 processor_mask;
> -	u64 gva_list[];
> +	uint64_t address_space;
> +	uint64_t flags;
> +	uint64_t processor_mask;
> +	uint64_t gva_list[];
>  };
>  
>  /* HvFlushVirtualAddressSpaceEx hypercall */
>  struct hv_tlb_flush_ex {
> -	u64 address_space;
> -	u64 flags;
> +	uint64_t address_space;
> +	uint64_t flags;
>  	struct hv_vpset hv_vp_set;
> -	/* u64 gva_list[]; */
> +	/* uint64_t gva_list[]; */
>  };
>  
>  struct hv_partition_assist_pg {
> -	u32 tlb_lock_count;
> +	uint32_t tlb_lock_count;
>  };
>  #endif
> 
> 


