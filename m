Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4D596C8D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 12:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388811.625567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOFy0-0005Z6-KI; Wed, 17 Aug 2022 10:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388811.625567; Wed, 17 Aug 2022 10:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOFy0-0005Vx-GW; Wed, 17 Aug 2022 10:08:04 +0000
Received: by outflank-mailman (input) for mailman id 388811;
 Wed, 17 Aug 2022 10:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOFxz-0005V5-2z
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 10:08:03 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50089.outbound.protection.outlook.com [40.107.5.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a2d437a-1e14-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 12:08:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8232.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 10:08:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 10:08:00 +0000
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
X-Inumbo-ID: 7a2d437a-1e14-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HO38UZHR4eLCdOz87aldhJ+5/3bz77/tGnQQaldrgU3OafM8PWGrxlioF04fnNKGtn10zdZL4hMWU0/q4OxxzlFX0rrHW3+6wqG9vKjSTeEIFX1o0omerqrvZ8srAd0WFylQ8YyE65fuw4siZK0idDXy3OUFhIyn0vdlWRoUNrsCtX5vn6bUVvbavvwWCp6JoGo9wNOozm0cPzC83Sb2OCZEPiUGIZmDUIdt3lve7+1rNI1B4xFLZqioey3ISWjciIJRzIvPJEhnZADwc3a7zUPUuHQ/7Tvj6/3bzNZUuUSdY1kVucqNo+LctELTwtvMadQ4ND2duRvvFht5MBWFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWsENdGaDVZ3U2zu4bIt4TmP6GlsbLGULoII3Uvwx/U=;
 b=YeCSAkd6lvF9A55KLdkB7uN7WzF79jCnKnM1YdEcAcEK+jc2eY9+3hrZiO7kWbnZLzCEIALLabMuJkFU0GaLrfvTFKbZ5jf2nGfjJQnDzuIZfssYzAZz/PwWum90c7+CAaHKQmj+1DyMFkDe37MD4kToiwN+nXluO57VUirVxU8Z/M62l5G0LVq4MbDhLbhjSDi2gTmHVNtn49xasaM0loQ2ZZjFiwVfvk8X/isS1Jvn+KoqYqVe1EQCUj4nq42ZElzdz1wzcvPp8gyXHMTnDQ2/QUdzwkT/OAJaUOINQUG5Z/tXh1XF6ytj84PQTdHP6qW7UcfUl2ZPUzFEkd6XtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWsENdGaDVZ3U2zu4bIt4TmP6GlsbLGULoII3Uvwx/U=;
 b=clIAid9gvGP+l6gwrR6iFeeGNIE9YP9sX2kQLATvz+TomPiz3iQ3JZZLdRT1jvsHB+mirfDQ6JlHVT9jfiTOwRQPDR1LJgLgeycUTNKidDhL1963N1EZWlbOe1COFXbq80GdgknhSTSt+9Ppye2Ky7DKDu5UeztBox4VuNRe3jtKi+ftG24wqmz7vzCICaCiZOxiNuSWxgAjFdiLXuYukBO6vdyTXCLxpZ8BzdhGxx1FAtD2NAUisooFN+ZSxlCBCc5e2neWlAAvPbequ32KC05WwV3b0xoewru+kypX9XhXN5NkyY4pLeyDnfL6sKMPLODSv47JzvtOahcR5h2+IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e757a58e-5d4b-c948-1dbd-915bb195d93a@suse.com>
Date: Wed, 17 Aug 2022 12:07:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v10 9/9] xen: rename free_staticmem_pages to
 unprepare_staticmem_pages
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-10-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220816023658.3551936-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02b77890-b6c2-4c88-7de6-08da80385d8a
X-MS-TrafficTypeDiagnostic: AS8PR04MB8232:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3cyFW3x0aseiMsfNE5tInAHc2xGIdOt759ZfkvJrpgoaMRsM18d/wn7iDGtAUglhdxePwbm4I+Gmlml1bUiSceMY+/fsSojkm2OfZ1JwmtyXYq4r2V5xdyKf1GswNj8jmLixKJwQm5KE5qOKsNf+k1reAeZC7kEKhRFH7kXmYlc+nkoJ76EQJ8nPTVU3J8X1Yfc3DfztmdZZywN7aqoycc/JZ3h0ZSIPxYZtpF5PDs/QmDftKPHrZzRNjCa9TxGDVaTiDofsoSBtqeJOUAln8oRa8yJQQbW3IBCmvDqDFdPLRnUgxntan+YUmCppRg++Fip1TqTUnm28Ka3kDIW65eEn7qA+27G58wPJiTqCMsmwBRJ1SO4uY2A3pxlAXjM3C0cY8z9Vr/m1EScA+C02KlO5ZLHuiDK8LRGQOfC1sslw0j+yFm1gn5OEa0e6mUJju3B/GgK/QkAbQTXNI6+wl1rL92e3U4RMzN7Gtg+2dBdxy4mpk1E4T2sA5r4Iwgwr3ZiQyZ8ccRRXlDebztQ6KdfZMVDMMf0EhZBuKn/Dg0w4zbVfTjVXaASSNMRNqZigZxGYwPiCApP2/kuxw5Vyo1lEolqKeY4vahFT1Q4VGNM9WmWbLhFRHP+S9gAW0vSuLwUJPPD0nkIUVbrdnz3/w8FpjgmMO3npSGYk4FEAS6ZRkA+SgiMxgHnB5L+viHdz5j4hI6PKEtf6Y3iqeTBNjGlaLw5nX7egdAVh6MDhKWj+qx/CyQOgpqhd3I1Bdq6NF+CBROix/Rnpvq0nitHWV+aLfCT8zbC5PuUCxNuJxPOh+H5kuHWyyiZFdOkzc6Xub7Cs0cG0KdBoF2fXuqZiEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(346002)(396003)(39860400002)(366004)(31686004)(41300700001)(186003)(86362001)(478600001)(4744005)(26005)(31696002)(6506007)(6512007)(2616005)(36756003)(53546011)(6486002)(66476007)(54906003)(8676002)(66946007)(4326008)(316002)(66556008)(6916009)(5660300002)(2906002)(7416002)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHRlVXY1Y2QzRS9uMUVMK0xNNTRia0NGcDZ3eVF5dEdZTUdIYm42bTMwbnN6?=
 =?utf-8?B?REVwdlUwZGs2WmxIcVF2WkJXQjhTOGpFR2FvbE04M0FZampXWXBYNE1nUUNo?=
 =?utf-8?B?cnJzUUdTTWE3THV3SVVveWVEUDlRNE9LOWhQRGI4cWJPeFNIQWNvL0dqWStW?=
 =?utf-8?B?dWw3ZXQyWVR5Y2UrTjRjM1FpYnd2SDQ2aGJZMXFtcFRndHJGK2FMREhUbzNC?=
 =?utf-8?B?WVo1bzVQcDA4OXlpU2hrY1FZQ2dJWENuZTRQSUd0cjVPdXMzNVhFTHR4Sjh0?=
 =?utf-8?B?cHhtd2RyR0QzMWF0NnNWT0NzaUExcHI4Vk5uaGFHK25VSDFYQVpFUHJmMFpk?=
 =?utf-8?B?cThGM3lVTU9EYUN2MStvVHBwaVRtMEpXR2ZnWU9rWElYV2k5eE1oUnErZ3pI?=
 =?utf-8?B?elhzMlRsa0hlbkVUM2hGS0ZUT3I0VUIwSVkxSnphRjNFcU9NTjdRREI4WUlp?=
 =?utf-8?B?OHdEZmY5VHV6bmRpMGwvdUk2MDFoYzVCc08zMzhxcnRtOHAwM2hGdmwzNWhS?=
 =?utf-8?B?U3ArcXJTM24zNFM2Qzk0NCt1SE9GbC9CZmpzNGExdzFlWFBJbk43aUNocHlV?=
 =?utf-8?B?TitYY21waUdPSVFjV2RMUjN3Q0hEQzM4RkxaTSthVkR1Z0FtYXNmQTRtZHZa?=
 =?utf-8?B?clJFZnZMcTZtd0xSWUdzeHNlNXJ6TG9BNVBaTmFVeGZMSmxka29xOU04cnRW?=
 =?utf-8?B?Vit2cmw3WjA5eEpxWno1YmdnL1JzSGROM211eHg1VmhDbkpJbVlNZEZkZjkx?=
 =?utf-8?B?MEdvOUE5dlpKbTZYVlJodCt3SE5PYSt0eFJCRXdmU1NGQWtNRHhaU2NxUldM?=
 =?utf-8?B?aDNZbXBOREhwTncxV3g3a0t1TlRXaGlYVUNMbUN4Y05wY2lxTnN3a3BoS2o5?=
 =?utf-8?B?bDB2cjRRYXRlcEFnemNNVHRPdXdrdXdxUHhlUWIwTVNpbkJtVDZuTys5Zng3?=
 =?utf-8?B?WlJ2UDVmWncvMzdYRkEvUFlWQ3Q4YXRlaGJ1aUZiSTN0dHhvcjZHUndHT2F2?=
 =?utf-8?B?WklJMmoxQjJhcm8yeFJmcEF6bVVSTVpiemh0TVMwWi9rZGwwbXQ5MWFTVkF0?=
 =?utf-8?B?WW1aS0Rsbk94V2VRbnJQVWZKdEoxSW16WHI2dWhzaVJnU0MybWJjZGRDeTZT?=
 =?utf-8?B?VERZak9aZ2dYV3lhOENjZUJjejR0RjRXUkFKeVVQZ2lISENVRWFoa1JPT204?=
 =?utf-8?B?WXhXMW5MdVRUZjFIcU4waXBJVnkzM1BSR0VaVTczcTJrY284RkZOeTNmOStm?=
 =?utf-8?B?OElaOVpMcUJ1bFNMWFhkRHEyeGlPdlF1bzdqLzFBRFQzSFNKSXp2d0t5L29R?=
 =?utf-8?B?YnV0WjJYTmRxVU4zMjJmNitma05PV0psNlg0ZjJZU0lwYkFxdnY2OFZXUVBC?=
 =?utf-8?B?d0NIUDJGNzNyNE1rMk5FWEtQek1qOUMzY3ArSFRFNnBaUVdjcHFBbFBXbWZK?=
 =?utf-8?B?dktVdDBQZ2hkdkRZVTJ3UkdIVlhZMXJSVUNSeFU1bFFGdTlYd01JN0plUi9k?=
 =?utf-8?B?ZmxEdmZpTGdKWFIyUmlKaFNVOUIxOVFiZFFQSWFDdkhURFNvYU5LTDQ5MnJa?=
 =?utf-8?B?MGQ4Z0EzUHQzVnpoY3JDR2FWUkx3VlozQ2hpZXM2djN4aE5uWVVWbGZlb0JE?=
 =?utf-8?B?NVdQL0ZEQzN0Mi83ZHkyZUVzVitBYVFtSlJiUzJZQ2RWOENvM0FsM0ZCd2hp?=
 =?utf-8?B?MnQ2N2c5VTJEOUUraFNuSC9NM1ZkNWtnSTEyNURNbmJmNXBiUnlwWkxBdmRD?=
 =?utf-8?B?N2YvbGJkbUtuMGFTOXVCM2g3Ny9mbGxYUzNWZVFZRXY2NTYyaUJvYTIxYm54?=
 =?utf-8?B?ZThlbldkbG14ZFc3TGRqWTNvRUZycGdwZ0xUN0d4YnNaZC9rTkJhUVpPRVhw?=
 =?utf-8?B?eXBnQnVOOGREYWZvd0hKTkxXZ0NKUDRxdHQwK2tlMnZjWDV6bXpiUWF0bTJR?=
 =?utf-8?B?eVFmb3N5WHVjVUg0S1hQTzdlOHlDYkRsSzZDYXdtM04vcHcvSHV2NGhwTmp3?=
 =?utf-8?B?TlJibHl6SGlqeGdBU2g1K0hKOHArdWd3bUlzaFAwYjJrWTNHUUdmT2dRZ3pu?=
 =?utf-8?B?QTQ1QjRvWnVvYlUyQ1RlMlozcWdYZGRzMjJwb0V1VlU3bWJIVUJxWGpTRysw?=
 =?utf-8?Q?rEFVHIwN3Dnxqyx4S5sMPwTlc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b77890-b6c2-4c88-7de6-08da80385d8a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 10:08:00.3321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdI7GoeKqGY6de0CgfaPJJbEicV4ZIW8vQzwZAURV/ov8z7k7FjsNqCwGV0kLeEcn+jwcNpDqFTKbivkrD/vQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8232

On 16.08.2022 04:36, Penny Zheng wrote:
> The name of free_staticmem_pages is inappropriate, considering it is
> the opposite of function prepare_staticmem_pages.
> 
> Rename free_staticmem_pages to unprepare_staticmem_pages.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably, as said there, with it moved ahead of the previous patch.

Jan

