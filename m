Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF27AE733
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 09:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608319.946725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2wk-0005IQ-9j; Tue, 26 Sep 2023 07:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608319.946725; Tue, 26 Sep 2023 07:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2wk-0005GY-6T; Tue, 26 Sep 2023 07:57:30 +0000
Received: by outflank-mailman (input) for mailman id 608319;
 Tue, 26 Sep 2023 07:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JCSl=FK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ql2wj-0005GS-31
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 07:57:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56407c3f-5c42-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 09:57:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9188.eurprd04.prod.outlook.com (2603:10a6:102:222::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 07:57:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 07:57:25 +0000
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
X-Inumbo-ID: 56407c3f-5c42-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJf5XJ4us/okNJOuoaTotuIG9Jh3EB5cMMCQ1va+aepsZHb+QZV+NOJ4ZbJQ0osMxqT7524F8DJHnlAIOua4gD3PuMSDsJBq+/p5++X9QZSpJ+yB6lqt8vcRL8f1OQQpvxfn/ixWgpC54J7W3QbzGqyaS0XtBaIFX56wyDBWVBG78pwJSvUhpE6No/gv9qQe9JHW4sEI+ZTbTfJRd6yBEI3dIcweKVD/4WXmm/zvoG7hFgkouwwhTuQItlaCtEfMtLhVQ1k97aukaFdlJfd+ZZrtUgxXADpHvKIINAwXZcBcJaqgtZuxhKHt6bIjWa/9KotgyMN7ktNzJ+aI9E7SfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AkAkYna7Kmz9Ysq8cHo6Tdv+BmzUMpUCx8jq7TBk2A=;
 b=iJAFuRevbcPw7KHIstKmSqnpWKWJ2xocq9wX/KunO16jYZ2odvQ4gb1ut6y95DS2RleLefWr8lMtjXlY74gbOHtuLWKSw3mJGvcdZmHffoSNbskDSVze5EQoMcq+SPeTTgR9+PpAZC/w1Udh28vF75h8F/jm7RkY2ce7r7O8v8Ke0MdD8BDxfiODNHCdIBnNQ3sDrqOC9+P5FO+1w7yCyGFf+fmad9A6X0GcCW+MuswT9NW1vNwjJXGjsG4QVGbvJ7ymrNWb9cwN5sSzJNvIfbB9hSalKFdHN7psduwzWRpbCkwLptT8v0eXBZxh+cn4xiLJQWLfbABHjPEcGcwAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AkAkYna7Kmz9Ysq8cHo6Tdv+BmzUMpUCx8jq7TBk2A=;
 b=Go4G19sjrm53brvvFAJ3CLqdOWk5iyfBgvhUvjNgw3QyLG6PBzsqclBHJGfOGfxsRU5Ce7D+DARpAQZ25a0OvINqXiCwQVCBZw/R7aZ2JT3nVzq8qbI7K3uOxBmMXG92Z8onCz+Lm3qZXh3pB8yjqvUKbwNQ48m0z+UiTifv2sABu73k+P38Pr27L3wTF4di6QxX7gALDn+prLPGPu8r/EffuSdXPNSNSBOgsrAT/DhpYpaJI1FUK3se/jLyVDdLvEUYSCpqOviFBQN8I/tHOmLIJL2GPi+6AjLXyz3LUdcdPN0nCu0dujpDdad1MCf/l77wucOqrm+VZR0HESwXhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3262609-895f-32d4-1d53-af907e648b42@suse.com>
Date: Tue, 26 Sep 2023 09:57:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v4] drivers/video: make declarations of defined
 functions available
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, roger.pau@citrix.com,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com
References: <5830a4d838883a20a6b320dd9af44ef4bb18ddaa.1695632599.git.nicola.vetrini@bugseng.com>
 <28310181-d7f5-a8b6-f1fd-ea9ca0db56cb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <28310181-d7f5-a8b6-f1fd-ea9ca0db56cb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 750cd00c-b48d-4999-f7ee-08dbbe6638c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yMYS2vVLizyrikWS3lIrb6acWqP+r7YL0JO/F3xhbqYM1+9ZpyAwqzG+UHqkMCcBwspbCQ/8ZfwJHWI8AMTLBt604qLl5AOkbPuYdLEOUus0kStPf+w0tAuLgazFiI0jF31ik0KVE+ax5O7IeLaoq8pr2JZ01SNVMeUClURLy7GOQGwQTYQZfusWg80vvdhworvGjSL5D2Acyd0LsTid/ZqZRyIpYuObR5FAYAm6RmcKEKH+TAMd8/6LiJQ56c2cR01pdmdsQoOOLWXpZAUwB6FXUzMrXlmUiHDFSMfhRh3LtQC4+UAFtZtSBBZT4pAKi3UiWtCQ+TIJJ1YOglid6vgJC7bmyGzTKIjYLuJ+lk5ud1Pf4ZM2N0uXh/R6dZRmlQZTUVhYukiMrFvDZe/cvA9MjUOhF36jWfNGiSPKhaR/Vvt/FhDhMd3sOTEMxuP9M56wlO5FuuHQ4A3BxAraFxCyHmAoF9PwaWlEr++XfCGJRbqkWzJzXFgiWqji3O/Pb+bVQqjoHfoivfeVljtk0Ct/ijdlPYg6kgeMcUaK8fOxUbOIdJMbPtecJnN3oB2hG5jFyuYgaIjoVOyWwykigK75BiUOjGSv2G1PHoQkwxhaOyBB+pXhpuHi5/8h4lthWN7SSyS2LWXRe3yWlWJKjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39860400002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(31686004)(5660300002)(4744005)(7416002)(54906003)(2906002)(8676002)(316002)(6916009)(41300700001)(8936002)(36756003)(4326008)(2616005)(66476007)(66946007)(66556008)(53546011)(6486002)(31696002)(6666004)(6512007)(6506007)(86362001)(26005)(38100700002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG1WcFFLeTI1WEk1NzhyajN5M2xPWGF1RG9KcEhrWmdjMkNrOVMydmRaVEkx?=
 =?utf-8?B?UjZSWlF0U0NhMXE5elJJZ1Z2b2pOTi9vOXRpd3ZEVk1LdWFSUzJIWmt4QUxY?=
 =?utf-8?B?MG9mWnJIaTRqK0ZRYTJ1TGhmYjdDOGc5SFYxaS9rV3hUYXI4OWVIK3djNGhr?=
 =?utf-8?B?ZzA4MkwxTzBvVTFXLzg3TkZQMmc5L0N3QWQweE1KN2I4THowSm5YSGdRbEFo?=
 =?utf-8?B?bWVMUXZXZ0h6b2ZLZ2tHODBzMUdIMHFsNlcyM3AwTDgvS1NlZk04Z1FoYXds?=
 =?utf-8?B?TThadW5tZzEzczAvYXl4NzRmcGpaWmVmUU9CeEVvSXdSM2hsTXBMc29ZQllR?=
 =?utf-8?B?YndWUWljNkI3WXhaVnBYa0pBV2tUSTROa2Vwa1J3WWlWdWwvb3c1bVkrZThV?=
 =?utf-8?B?SlRJVFlwcVgwL3J4OWZlN3VRY3pVUHJraStUVWNsZjVBbmFrUHRVeXFmSXRo?=
 =?utf-8?B?UC9sYmtlKzd2eW9KYUlxUkd2ckVNN2dvMmUyMG5xR3k5VHhrSk5JQmhQdVlo?=
 =?utf-8?B?U01IZmF5QU43cEEyWktka002enFwdGM5RE1UeVVQdFVOV0tPT2xBbHA3bnNs?=
 =?utf-8?B?TWo0aU9mdEhIdmxVS3lmWmt1cUlraDlmMDM0eUNFeHgyMG5vaW1DVG8zbkE1?=
 =?utf-8?B?UmNtSGJVRHVnMjF4alFrWlY0Q0t2ZjdmaGc1Nmx4d0x6R1BpbXh0UUJxZXdT?=
 =?utf-8?B?SG5UM1kwMGdCbkNoODFrMHRiaER6MEN4YVA4dEVOM2I3MmovNFNlNmJibGZG?=
 =?utf-8?B?TnFNS04xR3BiV2E0dCszanBxUUVTekxIeXo3YjYrbVFONDVFZlN1NkQ3Z2xK?=
 =?utf-8?B?bGVmZnRXZG9YeldGM054NmlrZVY2bld5ZENLUGxqRXI5VUpEdkVkZlRNdlZv?=
 =?utf-8?B?dEdodStIOW9icnNoZU1nOEo1TlNzUXNrbUx2VUdTTDFheEtTWXY1RGV2WTFy?=
 =?utf-8?B?ME01cWlxTGE5eDNnZS82bUlvd09qQnA5OFN6QkVTSExZWmk0U1dZVi82b3VF?=
 =?utf-8?B?Q3ZYOTB6dEFnT3hBS25nTkx5YUREcmM5K2I5dDFGL1MxWUJYODRJYXd6djEx?=
 =?utf-8?B?NTBBbVFKZmRobXlNczNPZ0FRd005akFQRUVYWkp6RWpzUFJhZmQwbGFscDhj?=
 =?utf-8?B?b0pPQU9VczdQZ2twaXRObDJISWxaWmY0QzZHNmwzTFZBcnZjWUdFT3I2NU95?=
 =?utf-8?B?MWJheFZtZDBWdElnVjRjTzZobnd0ZmZiMFpKWEd6U2tJcHFwUG9sZVZHS0tM?=
 =?utf-8?B?TU0yUE45dWJlS1RFTDNKQm8wK2g0NkM0dG9acGNmYlA1MzZza1dzOFJMdkVU?=
 =?utf-8?B?OHpqbmVQdUFiVGwrM0NxQTdLUnNsSVdSMlYvc2w2S3NwaE9VeC9lUDNNYUpT?=
 =?utf-8?B?SWdhcmdLcVpzMmNmTFMvcFp1QzJiTW9LT0lGY0h2dHl6Qy8xUDhtSHJKdXFz?=
 =?utf-8?B?ZTJmNVFuK1RPWWxiZU83L1lQYjlHS2xrUkNyblpZOURJeEd4MHFXaUc5dHJM?=
 =?utf-8?B?a1BZdytLR1pnZkFKbytSZDVFdnpwU3Ercmd2NWxoaFF3cTM1YjVDMDhBNmlU?=
 =?utf-8?B?V0lBTnYyWEtBUlpUUXd1VVdOYWFFTUNYK3dwSFNGSjZHT09ha1ZDOWpQUlJ2?=
 =?utf-8?B?VFd4K1Vwc1dIbkk4cm1BMHFJcmJxdWgyTHM5eFR2OE1jWXdCT283cjlCcTNP?=
 =?utf-8?B?VjhpRDdmS3FtOU1KM1UwSllsclpKdVh0MFVqdVlacVJxbUIvTWhvWDVhV0Ny?=
 =?utf-8?B?NU9ZejQvd0lwYkd0bnZXMnBkR2Z5c1Y2bWJUb1hhc0V1dU1DOHA5ZTU2K25N?=
 =?utf-8?B?U2tRdTN6VC9mRTlsazhNeDBnVFo2ZmNYb2JyWXhyb0NkQXc5SWxxSUIxOTlp?=
 =?utf-8?B?RnhpcTA3cTJTbFcxQ3RIZzN1UGM5T3JiRktmQnFOYWhYOHZCQ0N0ZWxyMmRF?=
 =?utf-8?B?cHA2d2k3d0JsR09rZkcyTDlmaVdYZ0FLU1FFUmVDODQvZ1dvb0VaUnZORmZY?=
 =?utf-8?B?SXlHN0Exbm5WUHArZG9aT1lVd0pISEx0VytYZm5TdFM3cVhmanBQdjRNcnhP?=
 =?utf-8?B?dGNvMzc2aWVQb2h1UGF4V1hqM1VVcnNTTlk4VVRQZzRWaHpwR013MGdCTXRj?=
 =?utf-8?Q?0nKAvc8mbjGghD/6vqUc6C7Vs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750cd00c-b48d-4999-f7ee-08dbbe6638c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 07:57:25.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y88HdgDf8ikRyM6HomNBHONMXxqmhjt0P9NHAxrmDrKXiQisbT30NVQN2MIGkQWbmLLIelC1jjBSZZ341yVPOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9188

On 25.09.2023 12:53, andrew.cooper3@citrix.com wrote:
> On 25/09/2023 10:11 am, Nicola Vetrini wrote:
>> diff --git a/xen/include/xen/vga.h b/xen/include/xen/vga.h
>> index f72b63d446b1..9b2c47971d0c 100644
>> --- a/xen/include/xen/vga.h
>> +++ b/xen/include/xen/vga.h
>> @@ -13,6 +13,12 @@
>>  
>>  #ifdef CONFIG_VGA
>>  extern struct xen_vga_console_info vga_console_info;
>> +int fill_console_start_info(struct dom0_vga_console_info *);
> 
> ci
> 
>> +void vesa_init(void);
>> +void vesa_early_init(void);
>> +void vesa_endboot(bool keep);
>> +#else
>> +static inline void vesa_init(void) {};
> 
> Extraneous ;

And with these adjustments
Acked-by: Jan Beulich <jbeulich@suse.com>

> Both can be fixed on commit, but we're in code freeze now, so every
> patch needs approving by the release manager (Henry, CC'd)
> 
> ~Andrew


