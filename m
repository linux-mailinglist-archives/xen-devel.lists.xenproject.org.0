Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE145FC201
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 10:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420869.665943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiX8d-0003HI-58; Wed, 12 Oct 2022 08:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420869.665943; Wed, 12 Oct 2022 08:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiX8d-0003FC-1d; Wed, 12 Oct 2022 08:30:51 +0000
Received: by outflank-mailman (input) for mailman id 420869;
 Wed, 12 Oct 2022 08:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiX8c-0003F6-3d
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 08:30:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150087.outbound.protection.outlook.com [40.107.15.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ca08a5d-4a08-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 10:30:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7048.eurprd04.prod.outlook.com (2603:10a6:20b:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 08:30:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 08:30:47 +0000
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
X-Inumbo-ID: 2ca08a5d-4a08-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISFIED9PqVbaaAlq7hY5PKZuLng7UPazmI7qTME+glzO2pvHnrp/CF8QKgoRTyAzAZB7Ex5Phx+KnUY9+7jyVF/YY0m1pdNEJjmP+7cRf/DUxSi6ryoCCBZxSw8B4SyVCxUb+lpLH5AhqWuyTzOZYanRKyT6G4eog5N6AiqEoRz514FzkKa+lXJe8afcSI/Tp8lMIaLZXruJQ2WskpyVSwgipML/YHsiSdWx793WVZ40ICCHv9Hpt78L8Rxyv9UGdlRfAFnyXTL4EM5sl02gP11d4T//1PzZCk832MHlCB/qAeU5E7Jjqk81+dp3UFIzchX05E+KI1IcKo2DpRseXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlRd0ejKm2CgnenIsDYyRVNhvj0pW/NxbxCBLpCkHD4=;
 b=bLuyl4Df2h3hVZD6ZSnojLrxwwCVqjod6taUTTzAqc5TjPhmU9VgjaxQmBqbz4me1lGbBOSa0E9OoxKQyh8KvZ6SWA0MpL3kxS9UEDwiVhRjYnp1Ykjv6q2sVBzLl+jBlnursdGf8giyKgZ4w1GATj54aKariGJdVabeEsrNDlFb5/7o14uTWj4Z4YOBnNfu2i2CYq/fBikTWaRiq1ZQLNLXiypym3ma2M+6y32TX2n1KvPTyRmX5Nlm1ryH7QfGb8DvA+9Qa07hRxlClDbBJMRT0knRhJDNejkLmzkmE65IWkiR9EmZGpYfxB8zIW/a0SHUs/SNKq4NBcPzBFyosA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlRd0ejKm2CgnenIsDYyRVNhvj0pW/NxbxCBLpCkHD4=;
 b=EXZK3fT9kcLPZcAAa/kxqjXWfiK+ndKfsPWNj99ng8+GZi7E2LxjdmqyUB5syE+yizDgNO0n0MmOoDWLGobpJ1VdW6IyC+k/jhLo6BcFvgmZnkTAj2x/Ro5lX2QzO968ZXGjZN0TMkDjANTcDbEAzEZii3qgeA7PEMmjEMqA4gclcEm8oMYuc1/evDVS/lvKzfgb5FSbStnM+yqEufiI8vfifCRCsBt0FZ2IgX6/8n9KnpPEmAzZ3YpFWHUr4ER9xt3XU6lSF6fAm90IlyrvhvtB5LEdf243Yy2r5u3Py3ZfuZqgLCjKIpGv/OuQtpNZ8sHaAYwGNJOJi5cp/PmPeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce274b68-4f9b-0b1a-6b1d-faf002ecbb54@suse.com>
Date: Wed, 12 Oct 2022 10:30:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH for-4.17 3/4] amd/ssbd: remove hypervisor SSBD selection
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221011160245.56735-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d7eaac-517a-4b74-f8c8-08daac2c1023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k230hvDSx1OyUYx5xQU6m0hXdr4RSZpp67yhVhJHV4ucG42EJeov/ZkMCbG/jjjswtmd10Mwmt3k/MY7Ml5++uSuR6aklkWEmNNkv7tAxnZkQYbBLMwZeKjA+zNM+0OgDBn7TUnLp+6Jos7WRVQl7LV6iLGJZVUqgQqY+sZYbxr4ryk8EEQO45BarrOgxj4dVQIYD5bOw0f3UiG6byZ+OQDGJ6vsaaA1pbcq//Un7q0BclEWoDqEJAydEX4cS109EGfgIsN/P+uX9zSqs7uqF9ShB1m/rsQVtZGHQxDcouy3CdfqdBdCZl/G3LJO2UCZ0hM3h/RMD4FLlLQSShkomI8App/S6/1iOM/HNlSRm5YckcegCylqFZaKbbV+iIBio+2mfe+Z0rjbnU2Rfvbwi5WiVUcOdTeiA/xo3he/Oy1bzJMzfBg4IQbC1BhaTXS5iRZnlWI8wFYZKGo7alNlAc0NO2HNY5IGLNoWA7j/gevVnh8RJdTBzsXklvXKNBKaj0D3GWcX/p6X1ZJ6EryusApHFZmo7g4aOxKxzX57jB8L422D5Zpfv/Ck2bqWhx5t4EGl3VYseSdbgFobgqwRaPjZdL2JD4E/MeOPKUCl3I+BmZ56mDvfg3v5tHZ1VGhltCfTXs83XZ7r2Eh4xLi8wc6TrLS+ErSa3DudoZw8a/HLoQ9Q4TTGD70H6cgCQHVnODAg+n9PQqgXwZwN0LsCAkxab7GFl8XMPvabIpRj3ysR9IbQkUihxvJKaDeRdMhI9wmLL1yG188XyOAy+F7LYVx5POC64oCxXMCkGd/Nmzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(136003)(366004)(396003)(346002)(376002)(451199015)(83380400001)(8936002)(66476007)(66946007)(8676002)(54906003)(6916009)(4326008)(66556008)(53546011)(478600001)(6486002)(41300700001)(6506007)(36756003)(38100700002)(86362001)(2616005)(4744005)(31686004)(2906002)(316002)(186003)(31696002)(6512007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWRvV1VGRUNHZG15TGZRelViVHFvNklQK0xLOTZ2SDA4eGJRR0cwNG5nTUoy?=
 =?utf-8?B?QVZSV0RiRDZYczVqN2Y0QUZidkFWaGNBOTlzK3ExVjZzU296M2x5TnZsRC9j?=
 =?utf-8?B?STFWMXdtQ2ZsWmx1Wmhmd3ArWXY3UHRIUTVxTHVDNng2Z0lEVjM1UGNuZXh5?=
 =?utf-8?B?T3E0Sk5yVWwxMHprRWRBTzB0eHNYT3RVQjlXS3NZbHpCSEVaOWpSMkRhWmxO?=
 =?utf-8?B?Z2ZQOFFWV2dTd1BGNldvRVhhbXJ3THRjakZrdFZkUHJhUUFteFlNdUJvL3M0?=
 =?utf-8?B?Q3E4bENvMFZobDVEd0xjcHgzam1QSXpEa0dlNFpHN1VLOHFLQTVRSUpxMnl6?=
 =?utf-8?B?QXFJT2JSb1VFN2xjNVI5UUhsbHhHa21CbVBMTG80OFBsTVZpYm9jQW1mS21v?=
 =?utf-8?B?VEczbjBib0RJWE8wbGJVYWY2ejczTHlkbnhDMUFoZE5RU25hVlNBL2NjVjRR?=
 =?utf-8?B?aU9RcGMrV0tDeC9qaHpkemRXT0VhWHF5NEgxT2xMMTZ6V0VtSm1kMmZBSWZk?=
 =?utf-8?B?Qk9rTVBmZThiR2FiWkxEYklucUJRK205M3BlUVBTL0pZei9WbXZrL053aXNo?=
 =?utf-8?B?QjMyMWJJTVpzNlVNTmRqRlIyYjV1MGxTazE1Yk9HTGNFY3dnWGZhckFqYWo2?=
 =?utf-8?B?ZHNoUS9udVJCVUVxN2JjM3BuTDc2Nlp5V1I3REJZMzZxM2drMFhERW82clZh?=
 =?utf-8?B?UmNrVFMySUdvUTF6QkhXcnJWTzhHbGNvSDJzaU1xRDRBcThKY1kzb2NJNVpX?=
 =?utf-8?B?NnRFdlhFenZYL24xSGJIdDZyRHV4MEhkNWF3eWNYVlJZMG5ZcFpNOWVnZStF?=
 =?utf-8?B?a2xkVTUzbnNSMjZET1ZmT1NJenc3djFXQlZqUXRCU1hheElNTVhwYkVCWW1y?=
 =?utf-8?B?R2o0NytGMVlncVN4a296bWhVeldDMTNGbUk2eHBoQlpndmtSWjVlbDE5eTFT?=
 =?utf-8?B?dXlVakxwTHYwbVJ0dkl2ajRaQzBFWEl5dmQ0RzlaTDMxYWhESFl5Vml4V1ZZ?=
 =?utf-8?B?QzR5UUVVSTFUcnVVUng4MmlBUkswRURsRHA4NDdOZitIQ2F6aEdSYkJRSW9u?=
 =?utf-8?B?NmZHM2xrSzRxS0tnL2VTSmNTRStVWEFDSnZManJvc2J3NGNEZlJhcVpLa3pz?=
 =?utf-8?B?dXhmL3drQmlzc29LNEtXYlpORWtOY09ZZHZlMXdxS3JWQlRzYlNtWGJwQzZt?=
 =?utf-8?B?R0ZtQjhBUTArd2NNYytuNnBoZFFiM1B5TE51bG9HcUViOEZLbVdiU1czU0h5?=
 =?utf-8?B?ZFp1ekNxQU0rZ25HdTZOdkdvMlVkcVgxbW4rMytPZVVzNm9tQWNaaWRYKzZF?=
 =?utf-8?B?RlEyd0JIR3NvRDI5TjNEc1lkSDkxdkI0MlRzdHBzNXY3OVUxMW5mZDhxY0lp?=
 =?utf-8?B?aVcrQkU5U0lhWnFoMHM2eWVBNDZsbzhRekZrZ1JrSmZCenhzK2JZUlE0M01K?=
 =?utf-8?B?R2lmS3B2MlBYZXUzL2twdFJ3N09FWTFDSWNNSHlDcGpxaXJES0dpd2ZsYWd4?=
 =?utf-8?B?bGJrN3NaQjRpZWtYeEJCSXY3OFJwdXdvT2QxeDJrUkRUeHYveUlXS2k5dTZH?=
 =?utf-8?B?NVEvcVZ2a1YwOTM2TFU1STh1VTVRTU14U0oycXdubldzMzJRM2JaUFBwR3pY?=
 =?utf-8?B?UXBDdHVhQjd5MXdJblViblVkb0RDM3NQbFBRa0p1bHVETFNkRnUvdXJqWTVi?=
 =?utf-8?B?Y3FiNW81b2UrLzBZbzNJRVRBWVhRdTI4MFhZMExzamNLaWd1bUxMSlFNQ1RP?=
 =?utf-8?B?M0tZVFRZRXRyTWRpMUtXbnAvemJrNFV3dy94ekhaYTZpYVJBdGIvaTJtVEJL?=
 =?utf-8?B?TXF4NWpsMHduazRpQThKRjlmVkdzOENKNTdjSHNaUnhVMy9Md0lYaUFLcFFG?=
 =?utf-8?B?VmY1REZnd1l4bVFSZXgzOTFFYVNYT29nc09RejFNdFFPTDlGKzZaN25mc1o3?=
 =?utf-8?B?Rk1QOENLekxuUjNFbGs4cTRVd3lybTNWS2t1UlRwTU9CUk4yQjVrNEllUUYv?=
 =?utf-8?B?L3RNQjZnQk1CRW96eGVseFp2YVFlTEk1dG9EUWMxU2ZVaU04N2prOUVzVWZy?=
 =?utf-8?B?cVdiUWlmT1RsUXdwVzdkbCtUbndTbDN0SWUxRlA1VnJMK2hHZ3h3dms5b2s5?=
 =?utf-8?B?RERFRXhQWTRSTTA1YVRHT1VNcWRadGJMTVFOd04zRmsyZDZnVVVDWjY0Tkdp?=
 =?utf-8?Q?jgy7VqsgzkbPeDnpFJu1UkWJ6slD1BGVexg+9PJovfFg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d7eaac-517a-4b74-f8c8-08daac2c1023
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 08:30:47.6771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9C9enkXZAbdwYzrtNedxFi8e5FyvysmbY1jnrXHvco42b1Emyu5ZmSKo0qJOhjlqit9NjkZHfhofSLZ12gurqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7048

On 11.10.2022 18:02, Roger Pau Monne wrote:
> @@ -2365,12 +2365,6 @@ On hardware supporting STIBP (Single Thread Indirect Branch Predictors), the
>  By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
>  when hardware hints recommend using it as a blanket setting.
>  
> -On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
> -option can be used to force or prevent Xen using the feature itself.

Why would we want to take away this level of control? Shouldn't we turn this
on while in Xen if so requested? Which would then either mean enabling it on
VMEXIT if a guest has it off, or running with it turned on using the OR of
guest and host settings.

Jan

