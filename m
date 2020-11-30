Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1172C8253
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40883.73892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgah-000282-PJ; Mon, 30 Nov 2020 10:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40883.73892; Mon, 30 Nov 2020 10:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgah-00027d-LT; Mon, 30 Nov 2020 10:39:31 +0000
Received: by outflank-mailman (input) for mailman id 40883;
 Mon, 30 Nov 2020 10:39:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbLm=FE=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1kjgag-00027Y-5t
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:39:30 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.123]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8a74955-bcb6-4a05-be71-64c76c5f235a;
 Mon, 30 Nov 2020 10:39:28 +0000 (UTC)
Received: from DB8PR02MB5740.eurprd02.prod.outlook.com (2603:10a6:10:eb::10)
 by DB3PR0202MB3484.eurprd02.prod.outlook.com (2603:10a6:8:2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 30 Nov
 2020 10:39:25 +0000
Received: from DB8PR02MB5740.eurprd02.prod.outlook.com
 ([fe80::258a:bf9f:fc0f:5381]) by DB8PR02MB5740.eurprd02.prod.outlook.com
 ([fe80::258a:bf9f:fc0f:5381%5]) with mapi id 15.20.3611.020; Mon, 30 Nov 2020
 10:39:25 +0000
Received: from [192.168.1.109] (86.127.52.143) by
 VI1PR06CA0203.eurprd06.prod.outlook.com (2603:10a6:802:2c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.22 via Frontend Transport; Mon, 30 Nov 2020 10:39:24 +0000
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
X-Inumbo-ID: d8a74955-bcb6-4a05-be71-64c76c5f235a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlCYa3XLQdrBggSb5abn3o5I0qRPYS+wDCo1Ek98/ES0dWM1ehkoauUwK2Bay/wZGMT47yk9TrUie3qDeR6ZQWMeIBI2rFL7fupV7J+Eecax+DgGtQQ/kQ7TbYJ90qAjdmpQwj2ZyKD6NriQKrf+EUvcc1XIyoxhY8sUYMNEePRPS26xCHgUFzBb7xgOfHUe9vrl73c55gp8z/RW7iRldx6V2HZltk5TWbAv2s6qpWNdHQyGh0H+yIzSXDq/GH65KwV0w8++OT46owxKRK4Fk0dneqLj9YFYky1JQ6F/AFMIVXuvRj4RVsP1ofPgJL1uoDvzL35/86XnHEPdnf4sQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9DiQhYKayoFWZlhVMSSV5VnP10hD7SjHfBowlZ/e+o=;
 b=aJf7s1+Kqg5IwyhMljj7avfk2aJJhrosPa7M6FJm31zQXUHs9natflOSiJTxiElnLpqBblqQltsJG5q/zPNuYdig0gCkhKpu1Yb4/7yzOVDBU15w7Z4Usfb8ns0efcM2VRg3s3cnKXe+pdTEsQDJTbw+EuJGHPTCgDq8DM9mmj5PasYY8DboJRjSXS/SXGh7suUwFBhwSlSvtlxkMlaL9O1CKxaaEN8wfCSUhbXQ2ko3S+HN0uAGLSLzudMaiwRWe2m6iVPXnjfzxROVluHjr4nhsfq92UWSBTw2zBGHZIzmBf5sRZPnGM6Eod5uyzaupR/OIXDskwuFhU4b6YeKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9DiQhYKayoFWZlhVMSSV5VnP10hD7SjHfBowlZ/e+o=;
 b=WNPZ+8NoRhbJkfk3xnQE2dggvBJrfBHNcih+E1RW9uuNrI5rRudvSJsM52+SDtlluL2N4pMFPzR1LV3Ki7iinQAel/qBQEBqjxBvVxMF1DfprABmOuISOjrWp3j3QhqE/U83a/Mj5BI9YVuEg4Uzb9UqXHhEchW0/YVm9MLzBhA=
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none
 header.from=bitdefender.com;
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <lengyelt@ainfosec.com>,
 Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <0c51ad57-0d40-0fa9-7992-d747fc31b441@bitdefender.com>
Date: Mon, 30 Nov 2020 12:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <d821c715-966a-b48b-a877-c5dac36822f0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [86.127.52.143]
X-ClientProxiedBy: VI1PR06CA0203.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::24) To DB8PR02MB5740.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b821afee-ae32-4d77-4df3-08d8951c3506
X-MS-TrafficTypeDiagnostic: DB3PR0202MB3484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB3PR0202MB3484A18BE68C04F1B048749CABF50@DB3PR0202MB3484.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LGQJfUG2V/urQkKkx+ueznn5wmdXKfh+5+gYhMttiMuVEreiBLRFwd8thkAKEJS2GNAbDx+BUldbtM1HzK098p30kxwaWyKX5zvznJSYgRRR29T+ToueBwOgGPsrDXLHAPxPl4py7nIphlMMOqxPdNK6UMwJOYYDLKhNtFFGe3VX/KstVyTCL8NCA1tTwXAVuaX9xQhnq5kNb73wVOT4ouO1m+85k19SNAH3iUfE3zwAKfF0VZMb1mFLSsg7cSFPf4mWFi3U7vbg/EG6dh7i6moA7e4IYIEV8vUKuaf5VhdvfrxG+IYq0/N1UWn1ado5zUofch5jo9kJ6nf6dQTW8SXYlvcFZMtGwAjbg9jGCIYofPX/PQLRms6y27Ja1wFR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5740.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(39850400004)(136003)(366004)(66946007)(110136005)(54906003)(16576012)(2906002)(316002)(66556008)(66476007)(53546011)(36756003)(6486002)(107886003)(4326008)(478600001)(36916002)(86362001)(2616005)(956004)(8936002)(16526019)(186003)(31696002)(26005)(5660300002)(31686004)(8676002)(83380400001)(52116002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?Q1EvTTJIU3NBQ2VYMnpmZCtCVTZhbG50OC9Xd0lpNm9KM3dsSk4vMmtlVm9V?=
 =?utf-8?B?WWpIMExxbnViT3BMREY0dU1pWm9PRGRrYUtESTFXdjlHbk52NFZTYmNKUmNE?=
 =?utf-8?B?L1ZyK3VSU3VTNVJ2T1FFVHVzazc3TnA5c1IzOGVaVDdEMTBaaXQzNENHcCtZ?=
 =?utf-8?B?N0drTVJnY3FiNmpJeXViQ2crYUNoZGZMK2RIVlAwUlNpd0x2amUyd3dIaTVJ?=
 =?utf-8?B?TExVdFBNb2pGblhoNFFpMDhGYTVnY0E1MG1FZVdib1kxd290dHBQaXdwSHFx?=
 =?utf-8?B?eHYzL2dNTEQvaURrQjdHK0RKSzM2dHFodU1iYXN4dWhxUElhU0E0K053ejFq?=
 =?utf-8?B?TDIrSnJWbkl0NjZGaFh3aFRjbVkrYjdkc29NQ1dtbUJIb1ZhK0xpdmxveGlq?=
 =?utf-8?B?eSt4OTI1UHUrWTNDY1dnZ1IxTWZ2MVlQUkJ6eXpZV1VMUEFXWEhtYytwd3Nt?=
 =?utf-8?B?VzhZUmhVS1pab0FuM09jdlh6bVNFSFcxQ2dxWE13VFoyb0RES0tiNjk4NU5Z?=
 =?utf-8?B?TlpaWUZhOE9PRDVROXcyRnRDeFp1QzN5R2R3MHRYUEE2S3BhalEzQlROU3dS?=
 =?utf-8?B?dzMwclFFREROUmc3R3BWZzNzalNLTWdzdmhuZndqeHhVZnl0ZGhGNXN5eU9W?=
 =?utf-8?B?TG5BY01yUG5Td3g0anBDdTNBRWsxd1MzYnNHdkgvVE8xcjBqMlhsV1FJNHhq?=
 =?utf-8?B?VjBvdGVDaUI3b2Y1RXRlUGxXdGFOUkFGZHlEc0xmd1pQTkk4LzcweU0yajA3?=
 =?utf-8?B?NnVNUk1rSURXSlJLVnBNbHFMNnpaVlQ0TmQ1YUpxZGxFTWVNalk2T1I0TDdl?=
 =?utf-8?B?S05jc1NqYlNuWlZFYnlOay9SRTRIT2FHdjdhMkVMdnRVZVNxYzRnYTBEMWQy?=
 =?utf-8?B?bXdQVGU5SkRyQm1lSWJzR1ZUWUg1L1VGMEpybFB3NXIvdW5LQzNKRlg4SGkr?=
 =?utf-8?B?MmhtMmdTZStQZk5vR0llK2JldjRxL3FveWxtc1VDT2FiWlhRd1NRMDNLYUhy?=
 =?utf-8?B?MHliamdEUG9WQzhNSGpsMkxMWEJ4WW92blkxcVpnSFd4c3NTYkZEdUlhR1ds?=
 =?utf-8?B?RSsrS2RRQjErUGdqOUlOUGdodi9rdnlsYkhsR1UzN0Z2Kyt5dE5FbEJ6ejdm?=
 =?utf-8?B?ZmpoSDBDMzZOS2VyOG44c1NNaUJ2cVZzUDRGZWlPRTR5S3B5d1lTeXRGMUQz?=
 =?utf-8?B?V2o2WVVYTkpNQXBORDMwRTFVcUFBV2NYZ3hhQ29BN0Zyb0t6WjJ0TTZKOEtZ?=
 =?utf-8?B?V1RRMTdISlhIWlozS3EwVi9odmRqNjZoRVVmaFhrOWZxL0FGZVFNYloxb055?=
 =?utf-8?Q?SmhesIxotQ1ZftNdamuF/RtZKZGfnTjHRG?=
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b821afee-ae32-4d77-4df3-08d8951c3506
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5740.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 10:39:25.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5uQRl4ORvI7KpWgo4THAMxThwgXZvgy7FGaZ+trHQumujMh5bHV/M/TSubSqUeB2HCdFxU4NW7STaO2gk6vL5z0teYobiprKVUJ5cGKdeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3484

On 23.11.2020 15:30, Jan Beulich wrote:
> While there don't look to be any problems with this right now, the lock
> order implications from holding the lock can be very difficult to follow
> (and may be easy to violate unknowingly). The present callbacks don't
> (and no such callback should) have any need for the lock to be held.
> 
> However, vm_event_disable() frees the structures used by respective
> callbacks and isn't otherwise synchronized with invocations of these
> callbacks, so maintain a count of in-progress calls, for evtchn_close()
> to wait to drop to zero before freeing the port (and dropping the lock).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Alexandru Isaila <aisaila@bitdefender.com>

> ---
> Should we make this accounting optional, to be requested through a new
> parameter to alloc_unbound_xen_event_channel(), or derived from other
> than the default callback being requested?
> ---
> v3: Drain callbacks before proceeding with closing. Re-base.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -397,6 +397,7 @@ static long evtchn_bind_interdomain(evtc
>       
>       rchn->u.interdomain.remote_dom  = ld;
>       rchn->u.interdomain.remote_port = lport;
> +    atomic_set(&rchn->u.interdomain.active_calls, 0);
>       rchn->state                     = ECS_INTERDOMAIN;
>   
>       /*
> @@ -720,6 +721,10 @@ int evtchn_close(struct domain *d1, int
>   
>           double_evtchn_lock(chn1, chn2);
>   
> +        if ( consumer_is_xen(chn1) )
> +            while ( atomic_read(&chn1->u.interdomain.active_calls) )
> +                cpu_relax();
> +
>           evtchn_free(d1, chn1);
>   
>           chn2->state = ECS_UNBOUND;
> @@ -781,9 +786,15 @@ int evtchn_send(struct domain *ld, unsig
>           rport = lchn->u.interdomain.remote_port;
>           rchn  = evtchn_from_port(rd, rport);
>           if ( consumer_is_xen(rchn) )
> +        {
> +            /* Don't keep holding the lock for the call below. */
> +            atomic_inc(&rchn->u.interdomain.active_calls);
> +            evtchn_read_unlock(lchn);
>               xen_notification_fn(rchn)(rd->vcpu[rchn->notify_vcpu_id], rport);
> -        else
> -            evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
> +            atomic_dec(&rchn->u.interdomain.active_calls);
> +            return 0;
> +        }
> +        evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
>           break;
>       case ECS_IPI:
>           evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -104,6 +104,7 @@ struct evtchn
>           } unbound;     /* state == ECS_UNBOUND */
>           struct {
>               evtchn_port_t  remote_port;
> +            atomic_t       active_calls;
>               struct domain *remote_dom;
>           } interdomain; /* state == ECS_INTERDOMAIN */
>           struct {
> 
> 

