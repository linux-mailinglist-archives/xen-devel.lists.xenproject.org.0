Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37E73D749
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 07:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555302.866964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDf2P-0001XY-2q; Mon, 26 Jun 2023 05:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555302.866964; Mon, 26 Jun 2023 05:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDf2O-0001Uu-Va; Mon, 26 Jun 2023 05:45:20 +0000
Received: by outflank-mailman (input) for mailman id 555302;
 Mon, 26 Jun 2023 05:45:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6QYu=CO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qDf2O-0001Uo-9b
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 05:45:20 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a11f787f-13e4-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 07:45:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8187.eurprd04.prod.outlook.com (2603:10a6:10:24a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 05:45:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 05:45:14 +0000
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
X-Inumbo-ID: a11f787f-13e4-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fq3f+NlR8lQ9IVQzIN8mp50TutrIXgU2Wub7g/KHHmpk3ZTEW/KNSIfrPwHyZqK9JZwJHF1lOGm+s7lcHZbEU0jrNQTfkpQCMgSLq/q63l78ZgeB12hIoArWm3G/JnzL3BGePoLjwQR2Ycxjz6CnYOqeo3QNFLVrPdy1W1njc7WPhaDFfZSyubeYnmjSJAGmEW9sslv0V1+4EEA68CjtyerP0jHcClC/8NBcoUzsfx98ntVInT8Zgo/d3ribLXXWNLkKG8vyh2dFmxwzFsZbwUXJ194PI9BBNBDPjs5sobLctHSbgUCvLkqaxuUayAk1Ai6H0eDdWz5eaIGIt7jwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osy2r5Vr+/zIZXhlsFCIzg6PPd+zfEb4uA78Zi23SnQ=;
 b=KGCtJcz3M+3VjAE//jZU8m8tNY8HH6eqFh5c7kz3naxC+lmOXyVi3fFruSepAjRt43A9/8LdoGoiHGTyxWQLE4Pp3d29LPNocLmoL4W0qXEFcX/Dv2NhdzsezzoGmOIXpLWjeGambEbDXLuSn+wwjAsZSqnoGyRvxbkvJ1HlQmsBNiG9+ZdvGgnNhpKUYlbBPrr30pVqQVb2dX6maB87BC2FcVZ4OT0HxJLODceYGs8evfPg5IyPz8HT4K9qaiZ0MbubngIlT7U0iS1jm3NVr6Anb3L0zBqGJBQFmC9Rt38RCgAzYb/cEenQ+d2ub2z6jVg3dXrEF6VmsfsIA/Dg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osy2r5Vr+/zIZXhlsFCIzg6PPd+zfEb4uA78Zi23SnQ=;
 b=eX+eI7LUW1C/EgTCxQBsjbYoSzBGinaVSZGeBDE9zz/zKamwR6obl276AEFy4yBOiGdxhkpIIdQVQC//6TCCaSecflSShQsw1gT5wK0dYLlUjIIHQuDpBNbd6sxJlhJ5jqDt3pgqgTKfP4o+OxffLZ4rqCzLylFZlVYqBxzfS67u07LHDxpFWatgVOKbs2I4SovZKGyvucmT+hinY9JHAqYSZSZMsGQiqw6M3CLFZsFHbWWOV1c3AZ+J/x456nr4YXfqaFHkDHuEB9452BDstl1hfk721bZ5VKN2sFfr+K+JsAZbZrmy/x2oSkSvsjPMxeCeOSj8GiPw6NmrV3R3WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f916d99-6c1b-eb3d-e40e-6c881dbf4185@suse.com>
Date: Mon, 26 Jun 2023 07:45:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/9] xen/arm: Enable UBSAN support
To: Julien Grall <julien@xen.org>
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230625204907.57291-1-julien@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0099.eurprd03.prod.outlook.com
 (2603:10a6:208:69::40) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: b3603a3f-918d-45cd-0235-08db760883b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	parLegnif4Ym9aTEyyxjQmAQ0416ff1IGKL8aJqjc70rWNkeOyLUyLTEVyGNQoWzmpH5ZAdpv3RvxCMzBO4IeFtKyoAQfICcHlupVMQpty+8YsUK8hBnYOGXDbQ/5DWAVCX7BfvSBZnW/95IulOCVCivHxpu0Ii2p3LJ75NWjOe/fPNa3s18XZ3m6KQzndOmJoz8+Xale2PTJFwyxW8IvyGBgyr6pMV/JgpwZ9jQMgnTvOE06vGUoBk9RK/kgm6iS2chJXUJB7NQk1zBS61+D/3YRToPzG+VPx5ylBJOuXxmiorqMqXW1l7gBDNWTsUmXjkdvtT9zRYRXyevVjAhJVrceAvAiMvycjyZYeXu046VNOn6PKZKfapfCWUVPN+jZpYUJP5hPc1AT87BkFYwZtNFbdXPAPwgqM4+fdslBMszqEhNqJIcB+iOYnd6Fl5rDaGUZnBgizvm6mvIlD6bCEJA51jnPRoho+SJvltqweqJrWc39kM1Uh9B2sKtyPeAVpD9ZECFIGJR2P1pKWrlGXr7VWqOzhqIlN9vu89x4890L+ajQNYkX1yYXN87oomRMnEWqi5/i/WOuKmvrIup3JdXedip0rLI3HkKB2DmdubetWj3zEfrS9ce1ODuYmUE3cSF282CjvUAop4qDahKDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(2906002)(186003)(26005)(38100700002)(2616005)(53546011)(6512007)(6506007)(5660300002)(41300700001)(66556008)(83380400001)(66946007)(66476007)(8936002)(8676002)(36756003)(31696002)(6666004)(54906003)(6486002)(86362001)(4326008)(478600001)(6916009)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjdFR1ZUVnNzUnFmbDRnb2kwVTdFTWRxMEh3Z1BaMHhYbURBSkowVzU1U0hz?=
 =?utf-8?B?elIvMThjdkJwV29takYzRXpVcExWR0pkSFlIRHdXTVYyV3RnZzNOQ0RTNFo0?=
 =?utf-8?B?WDJZQyt0UWk3Yzlqc1gyVGlrQmpiamRYRlcrU25ZU1BOZGVWa3VNb0xESENp?=
 =?utf-8?B?akJCUDQzYzJtdGFPSXFucHJXcDVtTmRoaGNVZU8wL2ljekt6UHUwdkhCRmhU?=
 =?utf-8?B?N3cwWmlxcVhCZGc2UlhpQ1RNcnN3dFBsUFpRYkErNmRIMEQxQXYvaUVXRlov?=
 =?utf-8?B?SndmYkZ2T0t6eVJWQzU0emgvMHJYRG9GWUZWdjRkN3BkZ1oxbW9NWWFlcFpD?=
 =?utf-8?B?ODlBQjhUK2JjM1UyVjR1SEZwZ1hmMFJDUXBqZmhlZmFXdlY3SWJaVFRQRHdQ?=
 =?utf-8?B?TUI0Q1VDQTBodThoR253M1krdm9XM2tDNkV1SXBQR0tSaGo3ZjNOSVJMRU5p?=
 =?utf-8?B?d0ROb01NOVNSeXZBZ0xkNkFBcVV0Q2lscS82MURIZFVOMnU1OGVsVzZyR3RM?=
 =?utf-8?B?Vnk2SDBEMk1GckN0czFmb2QwLzRlM2c4b0pQT3hLdlNqb2ZiRXgwTWhiaFFp?=
 =?utf-8?B?N0pORDgraHB4TjNXVUR5Wlk1UWdNUGhONVJ1ckpJdFZlYUVtOGE0U2ZuRXZm?=
 =?utf-8?B?SDBEc09qS2F0U2lOVEVoZ1ZDcjVuSmorUnZCekd0ZHkvcERwZkNkalhoM1hR?=
 =?utf-8?B?TU1pRXl2NVlLdXIxRlQzbSs5UjVkOFFtUzBXRU1YK1pyK0U1YTR3bFE4b3E5?=
 =?utf-8?B?TTNMM084Z1RyaS9OUVpDQlNLSExFYTBlRDZ1TlEwc2F0ZXAwN0kxWmFUZ3NC?=
 =?utf-8?B?Yis3VlozaTQ0TWtkazBMMmJKa2NrY2pqdjUwTVJNdmQ3d2dwUzhMZlY1d2pJ?=
 =?utf-8?B?NjAvWEZySWVzbUJpL1JKZWRrRE44eThVSUhreXVSVlZZek81cDhEUERiWjRs?=
 =?utf-8?B?MEVXU0ZYblVqd3hlbTdHR2M0SFFOOXlTSzV6anRLb3AyZG81cW50Nk1Kd0JH?=
 =?utf-8?B?MzVFbk4rY3JrSEZOejkvenRqVnBzK1VOYUFkc1llRWQyaFV5d3JrVTN0YnRv?=
 =?utf-8?B?SzIrbGxPZDZrQ0JReS9hM3VSMW1YTkdoQWp3Q3NXcW8vRFE5SDczQ3RzcVRN?=
 =?utf-8?B?ME1tZjhvY3V3MXAvS3lVbFNjb1lmdUZ6dkZzcWZqcE4vUlc1aDR6N3FBcEV0?=
 =?utf-8?B?WW9WZzhSV0xlQWxxdU1FN09qbHdPMGtMb0N3NzMvSFNyZnhyanZlSnE2K1g4?=
 =?utf-8?B?WlZ0WWVhL00xY202SWw1NUlsUWNYemJWeWdqV0tXS0pNUzlzVWdybk9CNDdl?=
 =?utf-8?B?TmpPMW1qYTN0YUVhVkFzV0o5UWdUQ3puZUdnVTdqakEzUDFLNHJXN2hONGZn?=
 =?utf-8?B?Tkpjc2ZpY0UzZk90bUxSY2NtZXNuQXdoQmRmWEl1RnQ1ejc3L3ZYb01jL1V4?=
 =?utf-8?B?RVRqVVdZeERFNldnZDNNaFlPV3NVcW8rNloxcVpuRkF0djRzTFpCZ2wwQk83?=
 =?utf-8?B?VUNqWjNTSlVSaEMvbnFCYzI1Mlg2a3dKNFRRMnBsYkE2VUtDSTc4ODl2TjdL?=
 =?utf-8?B?L1FhZDZGcEJwYS8xTTUxc3hyRVZpZWdVcWwyZk9XZkxlMkQyTzN3MnRaZzBi?=
 =?utf-8?B?SkhZTmkxeGhQY0M4eFJkM1F1a0p2cW1iYjN2TGNFOFoxeTRoVG4yZFN4dzdF?=
 =?utf-8?B?a1oybG1MTTc3Z0dPSDlzazA3cXFqYnlXaDJQT0tGMVp3M3RPWHpIR0lhdUI1?=
 =?utf-8?B?ZjVXVVlvbDdUaFEwNnpwUU1sVWxtZm1nY2crQ2FyNXRTOUVyVllKVkV3d2ti?=
 =?utf-8?B?eHNxVnNhaWlzUjgwcFc2blVFRlNFVVVxUzVZVkNCQUR4SE5RcHFBcFhNMEJV?=
 =?utf-8?B?eXQyMDBveFlrRU5KS3FBWllndkhYa1F5eksyYmxueDQ0OHgvVmQyb29JbnZ4?=
 =?utf-8?B?MWNwQXdoL0xnb1g2WWN5VnJldFVoZ3JhRnJaN2xIS3dOOExzNFphQ3RMR2lS?=
 =?utf-8?B?MDRsNHhNZlNkZUpqd0FqbHphZjV6bjJiMm1FWjRiM29YUTZ0aUZQc1EvUnVH?=
 =?utf-8?B?Y0lKbXNRTHBUSkpRTG5PSmh3bSt1VmoySEZaNWJwMnRDOWRmdzhiRFN6Q2Ry?=
 =?utf-8?Q?TRDzdRjLie4tt4cmvEFm6QfQs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3603a3f-918d-45cd-0235-08db760883b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 05:45:14.6937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZF2h9Mwti+yaIMdyBLhKimGvPGQ51eWFYF2UgMFDtJfTOgjuHdlAapw9do3A6xK/PZCxkBzKc8zXcsBkBjv2rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8187

On 25.06.2023 22:48, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> At the moment, we are not able to enable UBSAN on Arm because the
> final binary will be over the maximum size of Xen we currently support
> (i.e. 2MB).
> 
> This patch series aim to lift the restrictions and also
> enable UBSAN. Lastly, at the end of the series, there is the first
> issue found by USBAN.
> 
> There are a few of others. One will be fixed by the MISRA work
> in [1] and the other is a bit tricky. One the splat is (the
> others seems to be for similar reasons)
> 
> (XEN) ================================================================================
> (XEN) UBSAN: Undefined behaviour in common/sched/credit2.c:2437:5
> (XEN) member access within misaligned address 43feefbc for type 'struct csched2_runqueue_data'
> (XEN) which requires 8 byte alignment
> (XEN) Xen WARN at common/ubsan/ubsan.c:172
> 
> This is on 32-bit and UBSAN seems to complain about the check in
> list_for_each_entry. I haven't yet dived into the issue yet.

At a guess this is because the list head struct, living in
struct csched2_private, has only 32-bit alignment, while on the
last loop iteration pos doesn't hold a real struct
csched2_runqueue_data * (which ought to b 64-bit aligned, but
isn't in the special case of having reached the list head again).
If I'm not mistaken rwlock_t is 12 bytes for Arm32, which would
match with the address above ending in c, assuming that xmalloc()
returns at least 16-byte-aligned space on Arm32 as well. If so,
in this particular case some rearrangement of struct
csched2_private ought to help, but as you say this is a more
general issue and hence likely wants addressing in a generic way.

Jan

