Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5614AC07CC3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 20:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150801.1481803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMk5-0001dA-N2; Fri, 24 Oct 2025 18:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150801.1481803; Fri, 24 Oct 2025 18:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMk5-0001aq-JY; Fri, 24 Oct 2025 18:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1150801;
 Fri, 24 Oct 2025 18:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0w6I=5B=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vCMk4-0001Ng-84
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 18:42:24 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d8ea93d-b109-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 20:42:23 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 CH7PR03MB7788.namprd03.prod.outlook.com (2603:10b6:610:251::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Fri, 24 Oct 2025 18:42:19 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 18:42:18 +0000
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
X-Inumbo-ID: 2d8ea93d-b109-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kc9IRSwX6zSkjkkzIy0CfdHhe+5BOyUcFYeitL6+bqJh9fuKIIh2OPAUV5VqD3UrqFrpo2+6sVbHb2JIJaVH2+oP1HkE/rSs5E7EsZKFLDK0nVTdh6o1H0IXCTdj/tNcvKtIq72h8WGh8M52Fz/A/XVhUnEgjjdGkfbdPQDq2NIK9T0ACbdsIEQ1+b04x949BcP+3ymNQW+DVVcRGaLyBKIaK8N/awJWmMTe/tPTEDehPSU2VlY/Ru1XGz4LfJTyhKP8JQwi0PhM9i6xTRJO/GUsTCU9UUl7TckCe0AoqRqvI5tOHDFzqF3SKQLbBRzpZzkJ7PZksGB0TBOnO66YEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vE1y6FNzT4pI7/8DOdPBsWCnWxSInWmP+RqtgYTDOQ=;
 b=dYt+8oOYOBm6sR8jWOHkt2Ojh/cpz5o2vA7Je0L91OnQjnT53DZNPih2GleckTdkw4fmX8EKD2f7F5YzhX34l1guP0vuW4j5xNtC8uVdZbqTuNTcDOWQnkMRHI5uqtUmkTKKc+PuLhnDPKHAvl5Ogd2/ZJqQHkQOkt9hTwoTE0QI7sYw62Dq7MfDMmZOL6/zI4HdOAoKnDHV0kqsFG1M6W0i72dOEIz7hRJPXJwCYfomMRvegJxZAlf8IgPRXjM0tsOyWG26Uxw42GCMyfzEngou1RTq8Kev0w846m0vFkGu0rRd6ye0iln0x3eFBxKmRCZpubhOejb7o05u78a7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vE1y6FNzT4pI7/8DOdPBsWCnWxSInWmP+RqtgYTDOQ=;
 b=hFvyx6xmmCLrP7Z3TtFTHYmJGBsQs4m0vJsM9auUz19XcxFWK7AFaemmekQQIjqxxoVd0NyOxSJSM7A2LyFhqkMCJM9vVpZXQHIAXxRdGezHwigc12QuJSo+9CiXoOmL7dD7YxB4X4v0r8d60AHkMjtXFMyk5P1Ig5U17JEwz0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <88682de6-b736-4809-a29c-7add716abf6e@citrix.com>
Date: Fri, 24 Oct 2025 19:42:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: vpt: make hvm_set_guest_time() static
To: Jason Andryuk <jason.andryuk@amd.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251023150541.556368-1-grygorii_strashko@epam.com>
 <94ab0a1b-63ce-41e5-9cf8-54fda5f3b6c9@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <94ab0a1b-63ce-41e5-9cf8-54fda5f3b6c9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|CH7PR03MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: bd793c24-93f1-477f-3817-08de132d0f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ai8zbS92cmJjWEhGRG9TZlZJb29Gd3M5bkRPZit5Y0NSMkRjQ1ZaY1pJU2F2?=
 =?utf-8?B?RldhT282MllabklwVEorcUtiVVRtdXdOMkcxWm5vdlBpOXRST2dKRFFTRHE2?=
 =?utf-8?B?cXJCUzB4TkZuQ2JTMXRjaWh0ck5KUG54Sms5dk1vTGNobzRqNXYvalR2Nk5h?=
 =?utf-8?B?NjZCRzBqMVdJMkJ3ZDkrY1BUSU9pMkNUSk1nRFJvSVVlU2poSmozN2FpOVho?=
 =?utf-8?B?Z1FGRTFuTWhSRjBkMjFCU1kzSHpYZlNXTjk5TXV0VXJxL2hEa1hxcjdGL1VC?=
 =?utf-8?B?NEIzMHpIdjlwU3BBMU56V2U5dmgzTzRRdGRXVlltYWNmNGkxUElEWlh4NUdE?=
 =?utf-8?B?OFlJUFVoRE5rNlFQU2JscmF4eTcrM1pkbS95QjhpTDlHZ3VQN2ZsTWdNeUQ5?=
 =?utf-8?B?R0lqcDZrZVB6VjNRZWZFTmpXTTNYZ00wWEVUYkh2bDlocCtBVU5aVG9NNjFN?=
 =?utf-8?B?SWx6cnVwbG82anhWSURHU2NwTHk0Y2hiVjNab25qWGd3MEZZSXhYUCtMcDVW?=
 =?utf-8?B?a3h1UU1iem9XSU9kZjB2cU1aNnNVYnJDUHlSbHAwZkM4RmdDazZpZ3JWVlQy?=
 =?utf-8?B?WlZwUW9oNWM1UElBekREbmttSTlLdkFlQXRMa0RjK09LZjQ0T1RQNWs4OHBm?=
 =?utf-8?B?Y05ENlRCZHN6d0pWYVdmbW44dGQxQzFHUEFmSEZQRWJBcFBQYjBIbEpRQlVq?=
 =?utf-8?B?SmVWWWkwQ0VTS0pXUFBPTGMrVk5ycjE4ZTNvZCthUmhQSDI1WjE4Y0U0ODJU?=
 =?utf-8?B?OWduS0lvbHh3VVJXRlVDMVVJWXZSQ3U4dFJBS0dtTkYyVDlaTnFyT3o1MVg3?=
 =?utf-8?B?ekMvckRKem9KamlLSkY1ZHJ6Skl2RkpoNmUyMjIxdGpHU2pJZzBUVlZMR2F3?=
 =?utf-8?B?QWhpMUJuMXI0NENpejJqZEM5VW9sbVBMR1dDZUpDQnpXSTR0MHNhZFA0ZGFR?=
 =?utf-8?B?bVU0c3k4R0w4OG5EQTQrMEdhbStrYUdNMSt2alVUa1EyMC9uTzBnRSs0aExT?=
 =?utf-8?B?OThtRzB5SHR6K0IwcU82L00vS2w5Q3lSUExqaTh6K3IzcXp5WlVWa3dsMzJw?=
 =?utf-8?B?Y3FYVVZKZGo3ZzJNNWlveE9WWjB1RzNTTE5FYUUzTnJQUGdEYVVKU0VOd0JI?=
 =?utf-8?B?dTF5YnZtMndXcHJyeGFPS2tQT2hNcEZKcFpnUlE2dHo4Zmpia0I3NjlvaWdj?=
 =?utf-8?B?dTlMdE4zbElVUFQxSitPV1gyK2xaaDZSMWJvZTJIOFcrZXZDell0UytmWGZD?=
 =?utf-8?B?R2ZMMmZ6YWwwVUNmUjgyWG5PV0pzY3A0bjV3eUsrK2lpMGlpcjRQTzUrT1Y5?=
 =?utf-8?B?bWlPYlk1RU81NnBZUzM4Z0I0amtHanZDYVpjZlJiOGJxMHplVVNmWWoxZFZW?=
 =?utf-8?B?SEM4aWlaRnMvZzhadmJUM1Bucno1ODZ0QW9rNXlJdmxjVTRPSHFkRlYyOWxo?=
 =?utf-8?B?UE5jZXVrVUpQSTJiK3RXN2VQRW9zbE1rOWpBTVMrL1NpWTJyTkxQNjNURmxa?=
 =?utf-8?B?Zm41TjFVL2ZzaEYyMm5hNGJyVERDSGtqSkpxaHRYQ1BValRqMEJhSDBUdG9V?=
 =?utf-8?B?ZVZNQXM3a3ZmL1N4azhMcGRPU0pLd2JkbVFhaW9iMjVYYmdSdzR1NTQvbUIv?=
 =?utf-8?B?ekwzalJ6M2pQbVdtUklpQk9CTWNsWEVvcnRUTnNnbXVHN1hKSHJRbEVsTUVs?=
 =?utf-8?B?UWVlbEJZd0lybm90ajA5cHJ6cnUwS0dDWUliMURISXc5ZnByUHRBMTMyMk14?=
 =?utf-8?B?UDViZFkyaUdGUUxqekk4cW9FQWI4SHljU3JsbzlpK3dndTVhbTVuV2RzMmNP?=
 =?utf-8?B?akxCeHlwT0pXdys4T2VydkRiRTJ3bUFNcysvQ2pZV0VKU0pYQlhwTHV3OUJo?=
 =?utf-8?B?eDlqZFRJc0ZWWkpMenU4U1drR0RCS1NHalpqcUFseFZYellPbDFRbWhxZUU4?=
 =?utf-8?Q?JoZENe//1kzb7essB4Q8bFl+FWggRs1f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmtuTk1aeVMyVDIxZ1ZBUEd4aDhoMkxqWG5zek5rUnBjcWtwSkxpdll0Y1A5?=
 =?utf-8?B?bnZBK0JQSkp0dlBKOFU0b3VFN0JrNGhFMW1Nd1k1N3Z6VDBDUnZ1VG9sVmpY?=
 =?utf-8?B?VUdETEJIWkwxVURoNzZXTGo2QXV5MXdwNEkwT0EvaWNwUGE0dHVhUWNuTm5r?=
 =?utf-8?B?NEZnejRtU0lFbnBra0Z2NWp2VDFmOVZML0dkY2h0OUUzREQzVnRTSnRENnJX?=
 =?utf-8?B?ZGZJTzdXY0pUM2N2U3JjL3JYZWF6TXNId1RsSXVSZmRGUUFua2RTMUh1Vm4v?=
 =?utf-8?B?QnlyRFZZTW9kOEg4N3Y2bTlBdkY3YkFyUGsxdllVY0ZpWDc1Z3NiNy9maVpv?=
 =?utf-8?B?V0FiWnlrUEhhalZLVC9aVzVsNXp6VjY2RmQ2UTh2dkR3dHNTL1ZtaEJyTVpU?=
 =?utf-8?B?bGNabVdTWWZMTFlaa28renY2MEFqcExGNEtnR25ZWmxkeDc2S2VrV1V3eVpi?=
 =?utf-8?B?dEVPMmFLRXVnQjN2eDdXcWFodlNsd09FbCtlVWgyQ2JnVzBkWSsrN1ZwOTM5?=
 =?utf-8?B?RkMzMGhmMVIrNnF2MGtEbGZJN2ZCQlFIbllkcm9sanU4WS9tME10dVVLTmI5?=
 =?utf-8?B?Qk82SFZoZ2NwRExueWlVaDREKzlFcjBXdmh0d0RXVzdvL1VLb0pWY3RNM29t?=
 =?utf-8?B?ZDZQOWUrTm1PVlJya2NRT0srMzRCd0hQZDRZVS9GTE9IbzRHK3l0TXpiUjM5?=
 =?utf-8?B?dkliaURoZHZ0bEZqeEpISS9DbHNHWXdtSjhRNzU2NUxsVEtrM3RCQXdDWFZS?=
 =?utf-8?B?RUxxRlNhTHlTZmNoSTdRYjhjZlV2YTlGQVZXRUQ2Vk1TdFIwRlFybnpSWmJH?=
 =?utf-8?B?NVUzSHVCM3k5aEt0Ri9jSUxFeHJFbDY1SzdZOWJwYzlCOFNURWxYaTMyK080?=
 =?utf-8?B?UG5RS0grZWwxSHEyYlp0Q0JHZWJwVVRmU3U4bEkwWmh4WnJsbEZ1V0FaalFx?=
 =?utf-8?B?dHNrYUs0b3RlaElOOGZXcHdLeUYzRU54NkZXdlZFcmZSWXNWTWo5VHpWNXZH?=
 =?utf-8?B?YlZ0b0FvdkRVODZCWTZidW5qRHNvaDZJZ3BFMVZsMnhJYS93RWNITTF0MWxS?=
 =?utf-8?B?dndTUlBFNEFXcHlpMzJtci9EMUtaRmV1ZGpZQmUrS2ZNdEV0azNMTjFMOW9D?=
 =?utf-8?B?TXFTbnN1bHVrVmRDZCtPWldGUmh5VUs5VzREM2crOHhKTTBnUjlZT0xvM2Nm?=
 =?utf-8?B?emx1MHI5dmJlVlFnZmJXa2Z6L2V3THJLbW1XWUVMRllCMTBlNnBrV2kxZGt6?=
 =?utf-8?B?a0FEWjlwTkpZTitFZWlJSGl3N1FMWGZUOUpqU0RVcjJRdHlWWG50MjgySTFB?=
 =?utf-8?B?ZWV5QWp6NmN4T0xnZmFxL2xhalRZbGRxenJ3bDBTNlZHTUpFalIzSEhlTU4r?=
 =?utf-8?B?QjBxeFVMUkFYRitweFBkMjRHQjRzaFNPRks0ZjcxeWNUNUNncmE5d2VwZDRR?=
 =?utf-8?B?SWVOaXRkM2Y2Y3IzbHlsQlhOY3ByaW4ySG8rVWpFKzd3Wm96WU45N1ZWdSsw?=
 =?utf-8?B?UjdwdU5Zd3RFSXFueHZncUJzdzREblE5dDN5NlJja0dFMk5ieml3bnhyTnQz?=
 =?utf-8?B?YzdnZGVyWHJOQm44RTgxYUs5Sk9Oek80Z3hRVi9IZlN6ZFJFdEhnVlFSeEtt?=
 =?utf-8?B?bmxYV01ybVBHdUducGxVRnByODZNV2FGc1V3WEY2a3c4d2FFcG1XSTlORXR4?=
 =?utf-8?B?emQxbnplL1ZGb0JEazkzTTBnMnlmanF1Vmd4bWwxVTdKNzZaMVJ3c2dKWC8z?=
 =?utf-8?B?b1Jld3h0OExoajFaSjZ0SU5zRGJDRGV4TGMrT2diTWc1ZDlhQ3BvVUlZWWdk?=
 =?utf-8?B?OGhnZFhhNml4NXVseTUwUTluMmxjSVdaZ2xNWHRPZ25RelpBM09NRDRWL3p4?=
 =?utf-8?B?NmV1R2pBYWlDOUh6K2VTdzNiTUl2aGhiNEViVVdWYzErNlpZdG90ZUxVMmVK?=
 =?utf-8?B?K3RLWmxzWm5KdzJSUEZObUdiUy9sWk54VFRPYjlNbi9GQjMzUUZvbHJ5aVVh?=
 =?utf-8?B?NUF3OGlNblVBVGhQVUQ1N2tvVkJlcUtEWXZDV1dzVlBPSmhXdVlmaGErSy9p?=
 =?utf-8?B?YWw3Rm91c0ZIYWhsVDQ5Rjl2bU11QmluZ1YyN1dvTTA4dmZ5WVhlaTc0VWJB?=
 =?utf-8?B?VmttYWtpN3ZOSUNVZWdDd3BScSs5STFxdFZ0MWFNc0ZhWVhQS1hHbFJZWHlU?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd793c24-93f1-477f-3817-08de132d0f5a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 18:42:18.8386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ca/yOg08WhUc7aYfmV7pQNaCAisjyOh2ER4UYlQdpOaLaZbmelvJZtd7ocUUbgATfD6/RaPjMCABC2KOTJ/knQtJup8LZLcjcUNXJ6v4eH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7788

On 24/10/2025 7:40 pm, Jason Andryuk wrote:
> On 2025-10-23 11:05, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The hvm_set_guest_time() is used only inside vpt.c, so make it static.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Queued for 4.22.

~Andrew

