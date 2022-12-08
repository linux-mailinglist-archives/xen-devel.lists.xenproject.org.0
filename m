Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538D646A3C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 09:14:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456853.714692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3C2j-0007mh-NU; Thu, 08 Dec 2022 08:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456853.714692; Thu, 08 Dec 2022 08:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3C2j-0007jG-Jf; Thu, 08 Dec 2022 08:14:09 +0000
Received: by outflank-mailman (input) for mailman id 456853;
 Thu, 08 Dec 2022 08:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3C2h-0007j7-Vl
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 08:14:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 476bcb76-76d0-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 09:14:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9047.eurprd04.prod.outlook.com (2603:10a6:20b:442::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Thu, 8 Dec
 2022 08:14:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 08:14:04 +0000
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
X-Inumbo-ID: 476bcb76-76d0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbOQnHJsh6a8zEiNXqyXUlBB/+GvA5IiO+uWJcXWONT1NxvPo9m+A1/U/r34f16nQBVklIhAhLPHAcz6A7/jzqIhiNDe6Qd+Os+kDyeuwBELNfWH/Tiq7wUy9jXbdbIWXiJttS780xQ+qJzzb6XJVBWHqdDcF4J15JpAiXruQ1Yf35sGoyTHBRirI+cxB54nKM4ZFg6hjSHjMgkWNag5AOpg3poK7pYbfF5eezhZ2YF7+Cpi4dFbesD5m7fhb1+vUEazkEhuXCRJD0pguUJgK0VAhz/j0vMrEALyTpDG+dPHpjmc/1oz3vbonJQ+/gqvwfL/GwtYtZ0iJ6y8CXWfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcubySrWzrcMqOg6tKo/4xWo0j/8Zmid6GQzXN/1e/g=;
 b=i8HWQi5jrXF0mMtdDi8+ayrQaJsmTiTYHoFUIJ3Kdi+wv/R9xcT61+UPcImB8qp38SvFSIq5obwz30PHLX5ic3CVYVHsJurW5GIT5Zecz3GWmqk9X4/dEtm/mO+lFBAFO/Ipt08/XZO7y6N+oltwMLRdgc8Dh296NwQgK1kdQsDfuP5P/o/H1h5emFk8dIckjHtcScFrgdepJq/gveWblBF8cIU2+XMIHpkZ5/Ya3q6P5sLdwyJrA4kkp8eOakHfkPbqakGRwOuMYbXrp2rTIxV+I7h6dZkcf1QjWUwOteRGDLtYKmY7sVCxRMti147UnK7+JcitinAxMIDOV//d5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcubySrWzrcMqOg6tKo/4xWo0j/8Zmid6GQzXN/1e/g=;
 b=2dtMK/vZG+GkR/ieVMUTMR08mWFPjibF6MKgMaIufBKF8y38AJILh06BSCXEt/n5kZah8W7Ks603YmObG74nJQbuoMlbZcoWAm5pNJBJi4yTFqARPEGKHtys5PIUCb4IY2fa2ID8LVtj9fsFa//It2ErNYRoI7alqYdfX0v3QAemnODVAQWw+3K4IuVw6msTiQXuWqJdJMhVdAnupS7fKR6nWNWsExK/az4AlJFkmTo9rA0NKzlSRjNmfWL1JWS2nxFUtStdhXmKdPmZ5QZQzT5cLYGgriLi7+hYN/Ju6ILHnjIUZIWiOIS1zIRcxrituWSjQNsyQmSRaIvEC8Y7gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a1a478e-76bd-2744-4a74-25e8af76d051@suse.com>
Date: Thu, 8 Dec 2022 09:14:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xsm: misra rule 8.4 fix
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: dpsmith@apertussolutions.com, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2212061808570.4039@ubuntu-linux-20-04-desktop>
 <d9ea8f69-8cbe-abda-4ca5-b71b502a3fb7@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d9ea8f69-8cbe-abda-4ca5-b71b502a3fb7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: e2559bfd-3a61-4ad5-1537-08dad8f42b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2TRAaPhL0+39qWmAkN9boIu5fO1ydp/3ThKHXo8OsRNyQT4TGsOfaXPkrfUD4FJtH49dF2bP92R6UCzZXq4qhBq8AflEP4l6NsQI239tcc3UxfPJ1aBwbSjCtcXGtaTPm2pUpIqUuERMI8pyNlpZrORP+Uva6brYAWPWyyumvSiMPRCFlZJlGAjH+DuIBwC9x59vmlN1HxS1QZTWs6BkxCLOq48INRpX4SqfJnZFvlCrm4G/Qz4K/m7tVDHBsyNoPdbyAwiU8PPuNWgtVGazMFyI/FsTJqE5Ul23iS1BuU8RT66gUlFSgcQqOBIcqfswLHxAqEeOamYIRBYu2SzmKuCLDfAspAtcEFjI971zFsa4gUZSLCW8PlWX6Qr99B8NxF42lju6m68/kqPslTDGMt3K9v7tIhtbDvK7SCqBCn6PLJ/3YlN6HMcqlxoCxr6qVthPFj9zgAaX/C6XUMog5M4ow6QaTNbI8YmdkyzTSnUpx08nYKebzy/UxSLGbc76tohR9J2MTat+pn1anAnYcyag99n5xha0u7ThtbOgiESZQbu7W1Ti0EBR/PMnWNJiY1zRod/C0qlWflo6MUdBidoLhToEmSMarybqSduzDbx7xDXf3v4F3KiRmorfw2upWVCBjjG9ib/OjYgT6w4tHepocZw+gFyp+2RKqloZZdLXyKjJB+jzUiLL00hHnx0Ahp1T+ghSExT0X6LFVErlbkVkg7OTA8xu/E0iJty7Qy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199015)(31686004)(478600001)(4326008)(66946007)(66476007)(41300700001)(66556008)(38100700002)(6486002)(83380400001)(6916009)(2616005)(2906002)(36756003)(8676002)(316002)(186003)(26005)(31696002)(86362001)(8936002)(5660300002)(6512007)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHdJKytpRE5lYzdGS3NYZE9vWE9BNlNsYzNVVFljRWJpL3RBUTRFTzdqMGNY?=
 =?utf-8?B?Z1Z5aVlkRjVyRHpsTm0xWUM1VklOL3QyRUhkMkJxVmxJeXBLNVpVblowV0ww?=
 =?utf-8?B?U3cwMTh2UU4raGdCRmRZMGN5MVEwcnJSRDJqZ0JBWGZlNzlHN25BZCtSK09N?=
 =?utf-8?B?MHlEdXFzTHVrVVVCN203enhTa0UrM1Y2Qllhc09rZVNlVk12VzRrYVJTNEIr?=
 =?utf-8?B?blBZVnNvVVVDS1BQSjQwcGVsQnkreUtPNTRzcjF3UHhrYmJWS1lpTDhId0tQ?=
 =?utf-8?B?R01FQ1VpeHVIc1hYUlUwWmRFV2JjZmZBWUJyWkR6LzZLWU80eURGTVU5djlm?=
 =?utf-8?B?eG1lbUhIdkpaRmJucHRIcEpiS1l6Q0ZIUXdEMHpvaWJ6ZTBRM3p5ZEdSRTc5?=
 =?utf-8?B?elkrRGhYMStsQk44ZHJtRHZ4dXBhMzdOalJlSjNOUG1xaXBhMkZ3WWJ0OU1k?=
 =?utf-8?B?cTc4dFhhcDlyR1Y2TVQ0QTczczlqQjVHckd5aXlIZ2Z1UVRhRjRlTTJ5SERl?=
 =?utf-8?B?V0Z4aU9yN0I0UGFmWTZtdDNyUlMzc2dNLytRYWpCZnJUdjlhRnFUU2ZSL3Ft?=
 =?utf-8?B?d3ZjU1k3enZ1QVlzMjQ5S1Noa0VpZnIweGhRR1IrVGNnQWxvYmFQL2xDcXJh?=
 =?utf-8?B?UEdQQ2wzaVptN3dueDFkdTU1bFFEV2VaRkN1VWg4dHY0eHVybEkvcHNycFBN?=
 =?utf-8?B?M3g0RFlicmIxUGpTQVNHUWtWdVZiZkk5QVhjTkF0N2N1d0RJM2lXV2NLMjc2?=
 =?utf-8?B?NTh6NUloSms2aW5mOHYyQ0ZYZGQzdjlPOWhtUXQ5VEt0L0tRd0RDZkRsMHNr?=
 =?utf-8?B?TUhBZUdEemZxZXFQeUg3eGFLRzEzTTdaZG9mV2FWZ3JQamt6WmlEOUR5RTRu?=
 =?utf-8?B?VEVKWkk4ZXlpNG9ZZ3lSYXB3eVR5a0RiMTVkcmEwYW12cm1tT1ArdC80ZStm?=
 =?utf-8?B?ZWordTlpb3Y1VkEwaUhyT1Z3R3JNZVBoNVNENDIxbWhVdGRuWnc2cW8zUTZS?=
 =?utf-8?B?MjBHMU1CT2R6UHB4NjhVMUxmUHBoQlhaMlFZOXVEQ1gzYkdzVFYzSGVsZm9p?=
 =?utf-8?B?dzV0RktibkZJS3J0cjFEL2FtRTRmemlxZDBxVFFUcWR4Sm1qcWErcXBYZEtk?=
 =?utf-8?B?T1U4THNDMlg4V2o0dWw3VTl4cnB2ZnU3ZXZxMi96djVFNXExN0hZRDRORVFY?=
 =?utf-8?B?ZXR1bXdCMmNKZ1NkdkdybDd6VGxrZCt6RnJRYmhhbU1Qcm9qZ056cEE2Z3pm?=
 =?utf-8?B?cUJQL25Ra3E2N2J4V0h4TzR1OCs4Z0VHWlFKZXZJaG1lSzEzTEd6WE1KNEFM?=
 =?utf-8?B?dk53ZU92bUVYd2RhRmpobHNJT2RQcU9oTVMrdTkyWDgxa25XcEd3V0dTZUNL?=
 =?utf-8?B?Z1lURDI5T0QyLzNuVFFFdU1BamJXODlLZFpiVEtwaDBRUmJ4Z1Bvd2lpUmo0?=
 =?utf-8?B?WDUveDNOZVd4Q1RCTWY0WWRJUStxcHJKOFlsU3RkSHhEZkdaN05WeTErd0Ry?=
 =?utf-8?B?L2FRRVRRZHFwcFg1cUpVRXRTY2pCaWVIaGR5RkpKVEd5VXJOK29hNG9rNnFU?=
 =?utf-8?B?M0syWnBoK3VRa1R2Lzcrd1ZqTkFqWnFoNHdEcklZMERsd0FPUThUYnpxRHBu?=
 =?utf-8?B?MkpFNHNsanJ2YWZvUC9uRm9nSVFHVXowWUdXQ2E3WDJTeUZPcjhEM1ExQlhh?=
 =?utf-8?B?R2Iyd050bkk0cTR3Wk9XS0FjZERYUWVweWtNaXRQRkNPYmk2aVRtenp4VDJt?=
 =?utf-8?B?S1pLdDBaNU1SQ1gyUDJWUmUrWExGWGlMbjB4RjJ2NGV0YTJITFhVZGhQNUF6?=
 =?utf-8?B?dWczakJFTkp5S3p0eVE3N1ZUa3JHRi9nN0o4dTIyMXNUUHM2anU5TERCVHlu?=
 =?utf-8?B?WGpRQjhtOFRyb3BIRm01SE1wVGhueElTNk9FaVdwamNyMHdPWk1oVkQ4OWh5?=
 =?utf-8?B?L08ySmE4YVo4azluRjlTZzMxZitNbkJHS2gzL0cwM2IwMnVsd01aZDcwcmhs?=
 =?utf-8?B?ZjBJc2sxdkE3Wng5eTVlV1ZvWXlKdFAxQkY4ZmxlWjRXWDAxOEtwVzFnaTQz?=
 =?utf-8?B?cy9pNnFpQTJYVE1RbWJxdkJZZEEzM00raldiSjJ4K0NKK2RDdzJ6bjNqaGI0?=
 =?utf-8?Q?yGSoTSF1VE2uP/gKtYb6TUvMZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2559bfd-3a61-4ad5-1537-08dad8f42b95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 08:14:04.4281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAPJJwwZNR0egeEwMFoY/6m2yXjPdavqIs9WCNeknDhjA5yf67sCv20mXBjozGa5nHkn95RDBilHybClazHXfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9047

On 07.12.2022 13:33, Michal Orzel wrote:
> Hi Stefano,
> 
> On 07/12/2022 03:12, Stefano Stabellini wrote:
>>
>>
>> Fix two MISRA Issues Rule 8.4 ("A compatible declaration shall be
>> visible when an object or function with external linkage is defined")
>> found by cppcheck affecting xen/xsm/flask/ss/services.c.
>>
>> Fix the first issue by making policydb_loaded_version static and the
>> second issue by declaring ss_initialized in a proper header.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> cppcheck also reports findings for rule 8.4 with regards to the following functions:
> - security_get_bools
> - security_set_bools
> - security_get_bool_value
> - security_get_bool_name
> 
> The prototypes for them are stored in xen/xsm/flask/include/conditional.h,
> but services.c only does:
> #include "conditional.h"
> 
> This include refers to xen/xsm/flask/ss/conditional.h and not to xen/xsm/flask/include/conditional.h.
> This means that we should also explicitly do:
> #include <conditional.h>

And Misra has no rule disallowing such use of two different, identically
named headers, for being potentially ambiguous?

Jan

