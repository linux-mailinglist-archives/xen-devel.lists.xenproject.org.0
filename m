Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9071FE06
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543052.847641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51EG-00005m-UF; Fri, 02 Jun 2023 09:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543052.847641; Fri, 02 Jun 2023 09:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51EG-0008Ur-Qm; Fri, 02 Jun 2023 09:37:52 +0000
Received: by outflank-mailman (input) for mailman id 543052;
 Fri, 02 Jun 2023 09:37:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q51EF-0008Uj-9u
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:37:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2073.outbound.protection.outlook.com [40.107.13.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23a51660-0129-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 11:37:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 09:37:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 09:37:20 +0000
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
X-Inumbo-ID: 23a51660-0129-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSUD3jv85tYtHNouGWNvvoecwX/6PnWgTQcp+LPnGfI/ng7qKqTuNGyjqi046TiSaamX8rp2tkgiZzm8nw0CJ1ZJtw18q0iV3e9lmH8bA+P2OhVPxOif4UgRqdXgu80Kuf8ARfYioIPglfA0YxPmXbMVTZ5xBM5nWaEDyuqMHex+wY2uAVOEjshyVhXX1qwPEuv3O2C34hQ2EVSJYEMOSj/RxK8fxUSpLx1kaxY2VqVW7FZKL7TIGSbGjU2tOUPGgf56oSz6yJoTfpcLYZnEp+4GAGl5CvXK/VEzQuQa6OEhOLmYV4rRZ5XyPwCb0FISWRiwgezXUxU8cTvl1PNYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUMsk9y9w4YT14qEQaGRAb1qh+6UP6t664wN/g/fR7g=;
 b=e7p/kmQmr+ETeWwisR3HlPsR75gMpNN9XN3fVYQ1Q7CfWLBml7grIscLtlo+Pd9RXDqj6C4Q7sYzKA3lOt/czPpjAzkil1kT08UOaH9qZkdh5UgRauKwq5Kjs9IoEKZTwOKuJadWao9oIYoNRVLs797eQzQUwG1zvFDY2sfnkYnZvLHLM9dUDk9BFKi4J/Kh8F/uNS+wyAELqJz/hKbGdC8qlF/WYmeLLUeoKHa4u3ztIXOfeK2zTAL48ioSKWgQKtFayaZauxhgZd4nl49S4l6+yzJXS3VcW929Vb+RJmSU4aiiG75mJNmnMTRsjLjnKn8NyTh03sk1E2v2xVYkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUMsk9y9w4YT14qEQaGRAb1qh+6UP6t664wN/g/fR7g=;
 b=AnvyK7nC06tn3B7AyC9XgPJGgzOAVv6217BSoaU4TCAp0YNANnoBgbxjgpZvs1u2IColZ6jaZVE1uul3LzjkAhEnOV6fiZWtA5nJhhmoSzCqvrJDLubXU7Cb+NjjVfRFn7yk0x2RxIIXLYv577TkdgRyg1jb3Kgs9GZG71aIKTvJ6oSGWSSDx6LZ7tIsbwoAOTX6Bf7qLlyycMyyQMZmJP/X/ls6V0nZocvL0lYN0CCOf5oCdCl+piNOxazPi06FoeJ8Qi5+GEljfMPYA0UcW3/7iNrovG6K7XQC+BgMEPy54aLZPnashvoO7w+NlGgNzwEi2Ih7bSfD86EKLsGCEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86f5e0c9-df78-aa9b-efeb-331dbf23590d@suse.com>
Date: Fri, 2 Jun 2023 11:37:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/3] x86/spec-ctrl: Rename retpoline_safe() to
 retpoline_calculations()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601144845.1554589-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd70267-bdd7-46e6-9f9f-08db634cf5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6d7rJ0mzmbzaMDQqv/Z8UFmDuX6Z3pSZTaNd3koeyr4AgcPZaD1XZbIyNZepwHjt3DoeJvyzyg0xVSPuZbNxtmC3txqTRIwECg90E6FIsSASNmohVe6CV7ZeiAs2pvYkVa63y/7+asAKuutJ/vwLXa/mfM8wMeBFz7kbjyHkUEstnxuNjiAYLIu4OqP33aDCnQ6/bi7pF9/4nsyA3wSwZvsSehEw/PjbQhOJZYzZI++kNI4/3OIi3MmCLuC5WGzh0V428z65uryr7ejl6ru+DDimKmFq97IPt6VNgnIMjsJkIxK6n1HZVOH9JoJlHaX5PC1LdQuVIZYhERi65YlBW7EF4YLciThsJvxW2JfrA3OEdUTTK2GGq535wyGwLva0Q7xLJKUWszayYnpI6tuVa1WlxWFbuEOKxn/woY5SdJExPzALuFoDFvbRW2VZqeMdObxXpWLPK/vkTuyvqNWGDeElhrpAPut7DQl1ZKZY0eVpWyPlRTnPtWWIAwACLyT/S51f8xLAH9C1Y4mMPO/Pv6OirZ7MQtHqF6KN/U7UnuZDYoNV1gjuIXaWJcSTP/HL4d601jNYhFsK+AA/i9/FXH7gbI1KVYMGi3DEuz81UxZnZp7RTx3sW27U4vfjuEPvKSjA3xCbnzWr8afoO+6Tdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(38100700002)(31686004)(86362001)(66476007)(54906003)(478600001)(66556008)(66946007)(6916009)(36756003)(31696002)(4326008)(6486002)(186003)(26005)(53546011)(6506007)(6512007)(2906002)(316002)(8676002)(5660300002)(8936002)(2616005)(41300700001)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk1BbjNNVnJwQS81TkdFR3lIcGVKdnFXUWhMVmlGZGxPMGlQL3ViTVRvbzRx?=
 =?utf-8?B?eUR3S3NQbWNZOXc0d1dMVnNGVE1KeVc2SDBIUVpoRCtBM041WmhjdWV5WnhQ?=
 =?utf-8?B?K3FZSEF4dWpTd1V6cEFHOHQ3b0N3TmlBb2dyTGUrYTVtQzNhaTdxNitQWVE3?=
 =?utf-8?B?SklsRExnNnh1R2dFQVNMcG5yamJPdjN1bVE2cnhUTkNlRm5lMHJlS3duVHh6?=
 =?utf-8?B?Y1VKRzBZeG4zU0x6ZjJJUk9acHBRWkZBVEVLR0tMbE54bUxqNnBqbEYvRjA1?=
 =?utf-8?B?dDV2ak1vdHFKandUcS92Yk10MzUzcE1oampFaHdaUzJHNi9kVXBFZE4vMG9H?=
 =?utf-8?B?dlB5bjB0dlBtanZ4dDVvQ1NKTGEyeFBWdmk2M3NsRTBiTDhtRGtKYW9qQTRN?=
 =?utf-8?B?RWJ0N1ZObVNwSTB2NUx2Qk5HVk1lVlBYenhTdDduM2R5aGVGVE5xd0I4N2tk?=
 =?utf-8?B?YnQ3MGZ4S1d5c1pKK0hxc1k0aVdsY2IwSXF2WUZUYUpQYStSSW1DYTNHZS9m?=
 =?utf-8?B?ckRkUThabURyemZwREZhN0ZIRVF4Wm1HcnVSK1lzSDduOGJXUkZMVmZ2Y1Ji?=
 =?utf-8?B?aC8xSDhnSjg1a0lTS0FIK2F1N3Nnc05jRzdxVnVkKzFZaHpubUtRK2owUDZV?=
 =?utf-8?B?NUZieTB2M0gwTGRyOTNyNm5sN2kwRlZ2bU1sQ01KOHNaejlMOW9ZOG1ZUkR0?=
 =?utf-8?B?QVFaS2MwZ2lPR3oyUllwN29Pd29SNFE0aEZNL0g0Vy9MUjVOYjMrdnEwdHN1?=
 =?utf-8?B?VVNBdXpJRlhwK1ZXdFdqUVY5T2NOZUtDeUQ2NlNGQ0Rkdmg3a29SOVlJRHpD?=
 =?utf-8?B?RVJtRTRuV3J3Z0tqaEVnZHVGcUF3L3FZZGFyK05nVWgvZjNxRFlibjd3cHhV?=
 =?utf-8?B?NzVySG9URnhid3huVDVtTENJTFFyZXRGb1M2VldwZ2JxSkJsS0QxNXhPdHVy?=
 =?utf-8?B?OUYxSzV3MFJXVk5RRkxkcXQxbENaNE04TXU3eUEzOGdiQTlVUTh0TTI4TkFU?=
 =?utf-8?B?ZkYzSmQvK1M4eWhyc0gvUmtON1d2MS9Rb01aQnNSSHE2VkJtME9mZHMwM1Nj?=
 =?utf-8?B?ckh2T3dOQjlZaVJnNTd0MDZ6SnVjVThxNDNlQXZOOFJGRWcxVmZHZ3haY0lx?=
 =?utf-8?B?dHEzWk14OUFEK2Nqc1Z3SjVmUEVCRDJ5T3J4U09TNUtRdTdhVUNwT011cDlI?=
 =?utf-8?B?K0t5b21uMDNQOGVSTWo4RDdRQzAxVHdQT0FmTnB3WGpDVW9EWTd0RmJ3Sng4?=
 =?utf-8?B?UFBkTmlNaDlQTWI2dmF4OXZQNGQ0eUJFaDhjTUQ3UHJFdERialNXOHR6MHd6?=
 =?utf-8?B?eWNGcEp1WjE4NlI1L3lReDhBSkVkUC9qOGZyV2lDbE4rc3BjTXJzcFRGUzFu?=
 =?utf-8?B?THRRSFNTZ3p0ZEh6T0JYU2hySXpoUUNRb0ljdjNTY2tLMEFYM1ZDZ0pzMXRJ?=
 =?utf-8?B?a2hyZTZINm1tK3BRbk5yNVJDWFhnVFo5cnBDTWZlNmZ1V0EwUUVvb2h1QTg1?=
 =?utf-8?B?Y3hSM05BYlRHZDVER1BGQ1RsOXJDalpkdjJyb1BrYjlXdjlMM2E1NlZuQnUr?=
 =?utf-8?B?L3B4NXF2eEVvK2FLRHhOSSt4SHhSUkp4djJ6czgrOWxibzBuanlTbkk4Rll2?=
 =?utf-8?B?WnF1a3NPd29YL1VkTzROL3dTRDI2OU5SeElhMGpsandyakl5QTFobzlDMEZI?=
 =?utf-8?B?SlVTN1NSUW4rN0F4OHR0WmpHdktjTElORWlvbE1GekhBNTkwdEZOSlM3T1do?=
 =?utf-8?B?c2NzVExFMURXN0xiZW5zUjJCbXJJeE9YcDM3citzbnZEZFFzMmpsajFNeWV4?=
 =?utf-8?B?akw4d29TNFJ5SkRPZkV4RzZ5RFkvdEpPaUNmYXgrekNhamhiY0RXLzJka3l3?=
 =?utf-8?B?bUpSdTJES05uT0VLaEVFazFscjVpeTM4R1YwNDJwa3M5cUtqajJ3aU9qOE1Z?=
 =?utf-8?B?UmVDMkV6L3p1Qng3eFZWRVNSbTJrSXIyUUhWWGpvenJWRTAwNThyMlZhalo4?=
 =?utf-8?B?M3NwL1ZUVUVGNXlyNU1VWFVOVzlIU0VVWTRnZENrWnNCTFdnM2R6TzF2SFJ2?=
 =?utf-8?B?UFY0L1I4ellSdWY2NnJTKytvUkJVNUE4b01Nc1lpOHNiVGgrcW80KzUrLy9J?=
 =?utf-8?Q?9b8qQTY5FsjOCsl5rs2do/Ian?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd70267-bdd7-46e6-9f9f-08db634cf5ff
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:37:20.1207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IH2a95O+ayL/Pn/UnVCMBor2cQ0FMfYtA2ncgzkSDQoSYEgxEsTafu/WUr6F4ZpJAXA4sEGkWOyhSqc2Y/1M9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468

On 01.06.2023 16:48, Andrew Cooper wrote:
> This is prep work, split out to simply the diff on the following change.
> 
>  * Rename to retpoline_calculations(), and call unconditionally.  It is
>    shortly going to synthesise missing enumerations required for guest safety.
>  * For the model check switch statement, store the result in a variable and
>    break rather than returning directly.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



