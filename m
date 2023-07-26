Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51956762C20
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 08:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570085.891422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYTd-0004Ao-AA; Wed, 26 Jul 2023 06:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570085.891422; Wed, 26 Jul 2023 06:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYTd-00048O-6u; Wed, 26 Jul 2023 06:58:29 +0000
Received: by outflank-mailman (input) for mailman id 570085;
 Wed, 26 Jul 2023 06:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOYTb-00046K-O1
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 06:58:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0f5f0fc-2b81-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 08:58:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8944.eurprd04.prod.outlook.com (2603:10a6:102:20f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 06:58:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 06:58:23 +0000
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
X-Inumbo-ID: d0f5f0fc-2b81-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNtVIyNK9r5nxgZ7mqt1b9m2JpEYWL15dQ46rriWF9LMxecxyXD6G8R+KjkZn0v7Z2EUR1ivMj4ItMTAYmPi6/unnc4b3EIDU5bLmbVm0Dtoo92Tk5MTTvZ0SSkIDoEhwu5+EcBvcoL9ZP+Ce+qMj0ucZzOt/GG0lFVRZwlkZ6RIrIz0IYRAPN8yZsSCHJMXwXh6avD/rQ0cQQDjWY0/2/dDPMu65ln+IE5h27tpKIbmsbo7AgEShImMTJ70LS23vmHT8caEz1M9E0GW2UjOikp7LwASYg8yJcztvv1MPlXCXWdwrSTLlzqKFa8UCS/vPt2J2K+plbhKkbFsuR8uMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCZKq6tggTefDdsAdG5ZksUbgsc10sUhZIUnGfnlVak=;
 b=mBRlM5yZf1Hhen67R+QNdHLS5TWHqSzY5OG6BNoe2lOIJ1dz0we3ghRqJc/qj9Vtp04szRUJjrMOIFIODaUy9a6uQNa+rGLNl0zymoxVjuuFvuERYf7RcJoPMyLlALbTVJLTHNb4Y+iEn89cJ4ns6L/Uegt8781NqTiUraj0DYyFvWgGRkiql0p5mu972daBUPuh9I0+Hd4YOJccpe8jfd3rYUWf1QU6+q8K9UdCUKPraikYEJtNgMVZG8GuH8N4jX3dOVoerK+5l1WSuM1KDA+HuJD1NUWjjcUZfXUAtWmzfyPOLoelmfSnatLm02PR4XR12VDTKV0/GgbbNJb0Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCZKq6tggTefDdsAdG5ZksUbgsc10sUhZIUnGfnlVak=;
 b=jMTnK3bHVcwjlaRj5LCD/lTJbESZi+BJQPmaz2LJJ7brAKkLeXN8XR8kVhjg6GqI5lQNF2kjInFtn9zsGhQU95kAr6T5y7X3nhv0SEwsQKixvHAwmLA4MUnAKZfIFetICk0UABW8EANXuGDwnZG8/eLdI0VoOfoYrXmgrh9GOuiAfLSzN2JJVwHOTUpj7pSkCxIbSGaWtfWb2Q9VKeFkOli3vz53hGOsEbT6IsvuE8wqRCfubkh/PBB8j5Ul7vuI+10Ull+yWugGGkH38rZVd4oWyCnJEvB5IcHlHP/kr/ZkphPLwYGekQ4fe0ftWnJw67TWBnRS+CwofUASwhgo9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4025d346-848b-730e-38a3-de7763edcf39@suse.com>
Date: Wed, 26 Jul 2023 08:58:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/cpu-policy: Advertise MSR_ARCH_CAPS to guests by
 default
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230725213611.2405811-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230725213611.2405811-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: 6152739b-7557-49e9-fd7b-08db8da5b3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R0g2gyyEVNPuG9Raqwi0nJtHGkVgYUn3EgwFp7MMsYCmOHfYcZsj9ykgigKdO+5bXfNMCWyLJ7duP0vqNbxHDZAiroVK+ygUhmoRS0WDJra9Ib/KlaBq5rYe/55KJn9uy7J++1dokdCZkyLhn9wfVMOEWB9qGt2pUHNiNcoATPt7OtX6KhwYW96/DkVKynhTyubqqWveuCODyJei92XNQdzqnDfQaFM9rUHZ8uLlO1uHajfeCbQg/NrebcX6GStSDAKGfExiPrwrHZolpy9hnGnEgWzVctazBrAdulayGmVEujKkywc1xIMk5esoMxPdUe5oMOb9FbxLHaPFdmKUJExOWz/R9OzsdNKOeC2EcpnKVtX4T0zOYAQHFCaewakZYnW8TKGKqBz8jowaK4hZHW4YNEG1CYBZwG5RIbW74EPGJX93BS4DtZQ1mzyuE6FK6OsgaHQXE49hcjrdmhvpBZNr6YGL7oPfhvXHV0QsnAJPevMkTmnUqSreBp0IB7u1p8UeyksIQ4Q5HvYcOmoPEXwgvjXG4zHGGo0GjyS5m0/KcCMNbvdqUfS52Oy7KYv6SNPNG767LHDRmxtNscUbSYwIT+OYVcg1cDd+ef/PoTXJcDk/843Q2KUnp5kxzzbD/mmaaSIRsLAsnu2L+sV/xw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(6506007)(26005)(186003)(53546011)(2616005)(4326008)(83380400001)(66476007)(316002)(6916009)(6486002)(66556008)(66946007)(8936002)(8676002)(5660300002)(6512007)(41300700001)(478600001)(54906003)(2906002)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0liaWxHSUF2VzkzK1dCb2Y3R3MwRzVoRlp1Rno2bnJ5UldwR0ZHQ2x6dG52?=
 =?utf-8?B?WjNpR0w2N2FTUVJnYUk4cnJzd1ZBNlh0QXVoVWhudDBlQ1Zoek9yYk5HUU5H?=
 =?utf-8?B?V01jTldDbk1EVk5rWG9rODVqTGVOby9ZNzJwU1Iwenl2TTl6MDVUNFRQWGJI?=
 =?utf-8?B?TUUwcmRJQkdGc3pHK29PckNGN1lVMllLZHQvRXVTdW9UMkgrNjY3SSthdWJx?=
 =?utf-8?B?U1EzYWs5S0s1b2xMSUZWOUZ2UitUdFFBYnFncXBXVmI2T2hzbEVqWGNVaDJ6?=
 =?utf-8?B?Y3l2QkVtS3VIdEtsbTRnUzZSbVUrZlZlQ3hCdndUVXNGdmpLalF4TkJla2Vr?=
 =?utf-8?B?QXArbjdpaW5lWGJrdHpEYmdOejVPTkFNb0dxb1N1WU5TSnFWUmIwYWp4Nmdi?=
 =?utf-8?B?Rlh2cDJua2o1aVBTU2ExSkF2ekFMakM2eHk4U1hrdlZnRWkvcTRUaHBvTGc4?=
 =?utf-8?B?cEVrK2xWYWhEVW9PMkpmVFZCSmN3M1g4MVdhMXhKcC9FdmZyeEpBL3NGOGJl?=
 =?utf-8?B?VWRSdWtFYjB0dGVQM2dFeXM0WU42MFpCK3dTRWd4ajVlNGRtY1RwUTBDNzAx?=
 =?utf-8?B?VHNRM3k3MFB6azRJLzQwUW01VVdPSDRWMVdpYWFYczMzZmVnOGU4eVpGZEY4?=
 =?utf-8?B?aVpOdUlQOTZlU2NsclZXTFNjWW9XM3o3bDhHalh6bjkvbW1RSThvS2Z4a2Y1?=
 =?utf-8?B?N1hzUVhaTUlORUpXK1dQZ3JubVVldGt0SXhrbGN2N0FBVDVBQ1pVME1ON3ln?=
 =?utf-8?B?TnpPTHNYOFhwT2w3TVFiTGlsOVM3aEdEZ0UrcHZNUjRUaWZKRHBhbU9iZU0x?=
 =?utf-8?B?WHJwMXR3ckVUTndxblFjYjBhRC9EWGpMbUhLeHk1cEtlVzJJSDU0Y0Q3czQr?=
 =?utf-8?B?RCtwbnhqMi9wU3QyblBUMjZoWWtXb2dacmNBSEEzWmtqT211VWgxZ29ZbzRG?=
 =?utf-8?B?eUxDclFGa0tNdFdpRHAzM0o4ZS81RGNnM3VNbHNrRWQ2LzhnUU4xZjVxak04?=
 =?utf-8?B?VlNTY2w2bXg1R1ZOZ0V2M0p3TzRFMi9VbklSRS9PWmgxTUlNa2F6NERuNVJr?=
 =?utf-8?B?YUFhdkQyUVNCVXdGSXAyQmFGWWtnZlNMd2NoQnJjanREYmEwWXdjMlMvR2hK?=
 =?utf-8?B?eWIwdmZPbG5RSEtEQ3hPNnNRcWJMSnd0RW1KK01jZXR4bVROVm5aTTQ0WjIz?=
 =?utf-8?B?NHRWWHFZSC9CSEdTK2dQa29jUEd2ZGdhN0NyNnNVNTJtaHR4ZGhGcTl5NWh1?=
 =?utf-8?B?Vmlvd0E1TFBYZlBtblBmaTJrR2U4OFlheVlVRjN3T3paZVVlazRZek0xUUZB?=
 =?utf-8?B?ZTVzOU1QOXkvNFI4Q3ArUG9OQVp6bFJIZDQ3VWJIU21WdTFkeWVFSSt1c1VT?=
 =?utf-8?B?dy9SWkNJTnFBVFZwbjJSV0JRdGlsZDlxQzIrU2ZMajBMTVdWU2t1MTgzK2s0?=
 =?utf-8?B?TnZ6aUUrVHRxMnVaWVdHM3NuYmZKMTlkWm1iRVdBallXTnpMaWN1U0VtVmNU?=
 =?utf-8?B?bk54aUo1VFRKcmRxVnFqY2diSUpVY2RBRG1QUEgzMXB5UjJXNDZPamt3aXo5?=
 =?utf-8?B?bGxRUmc1OTVaVkM1MHRDbzhBZXpFYzY0SUVKcVVwSVJEaThHakZDM1NzMnFv?=
 =?utf-8?B?cXE4eTI0ZElWL2svZFdmaGpTdkRGMVB6RUdRVUp0ZmdwZ2FsL3lSUnU4Z1JC?=
 =?utf-8?B?bzV3SmMwR2VFZmFwQ29sVGJqM2x1eUJ6eitqeUhFMTFwYUJIZ2pLeEExZWNG?=
 =?utf-8?B?Zk10UHc5eGNjc3Y4MTNJSE5Ncy90Ti9GZytuSWZ6eDRJVTdOckgzblk1VnN4?=
 =?utf-8?B?VlI0d09xZ3ZBOWxSdG9yS1dmbW9taXZVcVlYOTVwdFprTkc1YktVclJ4Vmxi?=
 =?utf-8?B?NHNsWk1jQUpFK3paR3NiZzV6OU5aQUJacEVUQWNFcGNXcVNMSkdmMUl3M0Yw?=
 =?utf-8?B?diswbUhFRE12R0lsaXltTUtta2NKY0FJK2cxWXBjV2lzcGZsYjdHUnA5OVlM?=
 =?utf-8?B?Y2F3enJST05OUEsyUnJ5VkU2WmRIYTJPRXFseVRka05MVExNMEJLK2NML1k0?=
 =?utf-8?B?NC83THJqc0pncWlOOTdCbGJicjVxL0VOM1lwWm1DK0g2Z0thUXNRMWthMklN?=
 =?utf-8?Q?O6QouEdfnlpwZPmLj573H+nCD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6152739b-7557-49e9-fd7b-08db8da5b3c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 06:58:22.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnuceHHJZXxIDAjB4U/OoTEHaucRrG9ckNWy/SjcmXVAqU+lsP0lI2fwjNS2jSnmvHHU61mWqfrisN9pPV4QaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8944

On 25.07.2023 23:36, Andrew Cooper wrote:
> With xl/libxl now able to control the policy bits for MSR_ARCH_CAPS, it is
> safe to advertise to guests by default.  In turn, we don't need the special
> case to expose details to dom0.
> 
> This advertises MSR_ARCH_CAPS to guests on *all* Intel hardware, even if the
> register content ends up being empty.  This is necessary in order to safely
> level two hosts which cross the Broadwell/Skylake divide.

Could you expand on this, so one won't have to dig out details from
elsewhere?

> On Cascade Lake and later hardware, guests can now see RDCL_NO (not vulnerable
> to Meltdown) amongst others.  This causes substantial performance
> improvements, as guests are no longer applying software mitigations in cases
> where they don't need to.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> Not to go in before Roger's libxl changes...

I was about to comment on the "now able to", when I saw this.

Preferably with a little bit more detail added to the description
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

