Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB0A6716C4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 09:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480236.744516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4I0-0006cn-7k; Wed, 18 Jan 2023 08:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480236.744516; Wed, 18 Jan 2023 08:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4I0-0006aP-4u; Wed, 18 Jan 2023 08:59:24 +0000
Received: by outflank-mailman (input) for mailman id 480236;
 Wed, 18 Jan 2023 08:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI4Hy-0006aJ-Nw
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 08:59:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65e9aee7-970e-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 09:59:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 08:59:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 08:59:18 +0000
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
X-Inumbo-ID: 65e9aee7-970e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKv2Ernh7WKhXXoJC/evTqzfM5Nxvu5etqbU5GXbc/klCOMfUELfUhd59SUehIpEdrRJdC5vrnHfvSgcWZ33sHOBFyhi7V2GW+medWut8I6/mymmZKZFXmSAGHDLSlvImrq6MRGJyRB+miSuKVgW1hsL8PuLJninsbLQC6ltU5/JB9Bu2Xwy0TJxrZoZt603miCBLyjN/tL5gdrMEO8HiWjCtmH+0MPxf8cjP3QHPPS2izjDg53vKPwVgdltmmKnUV4DjM1y/AEZeRFtUoDUFHhznhms6b1p7Wgwxe13YM0IZ0nmQspcMWcOSWKIJqArF8rsqpSFyyprJo/bzbjkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71zGWGcb82+wBdIKl0Wpk5LPrXZxwf9fCZVf5L6JJgY=;
 b=MbF48F62B+59nUQVjM25PJud8fQ1VYdrY2qAy+jIDC+sdCKkUJ+BNPJMIcHS/gSTdP7CghNKZmc9exGZq3CsJ2HGiYO5kzAXu5f8Y634WrUildPDeZXdq7FJKjFnarqX3ESPf+ZDXlqwZhANWPfsaVAuIqIATe/LeDAdv28MEV00Lu86mFNZKw4/hSsoRRw+NZ8MN/udKrD18KFfGZD/WvGjWjIU/lUdDVfOT9TW7YHXxw5aJRNdfxuj4U3F7ppiGwHRJIK/j/j9CuCE+7iGiLpYhBNkIdl+sMKjkEBj2eBUD/NOgn9lFr2yxOOtNAYPpAixYemNgioOslBhBBPXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71zGWGcb82+wBdIKl0Wpk5LPrXZxwf9fCZVf5L6JJgY=;
 b=KnBVTWEz49RigOsu3UNstaQ+BfbstM9Z1k+ML3+OOFJq/XNmITkLDe0hDBVg5QwGQgOkS/SoOvGS3qp8KY4D5i8UZ4xNSt7i3CF6pwLbcECITLsnHy46PzeLpovkHuaGQe2XVeZ57PLsLhq3pVyqJH2QliOu+3U9Sjz4zAfZMxXaFMLR3RC1NAtwfpDvD1gm7CnwKfmmYSQlXPtuxQRdd7uELV6ftQMOGDNm5jKL8Fir0ShsYbx6oqx9J5QHLi1iYqFELe5/8Jxs4RFEtB784u5jxnfFoHvzIapPR0zritpMJpFrn3JyRuy1f9q9/54gz9HVLQ/Nq4lHjk07dW/z9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd8dbdfd-8730-8b0d-5b9e-14a13e679bf2@suse.com>
Date: Wed, 18 Jan 2023 09:59:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RFC 03/10] domain: GADDR based shared guest area
 registration alternative - teardown
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <214c9ec9-b948-1ca6-24d6-4e7f8852ac45@suse.com>
 <8d002c7f-a532-e8e5-0a71-801af4712d47@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8d002c7f-a532-e8e5-0a71-801af4712d47@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 216afa72-08e8-4140-749f-08daf9324880
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xHgSxlM0Shr+rFMvcPjVIcK2bYj6z3RsEgPd3hrtik1qMGtJkoPXKjlbPolz4fDPSEgv2M8O4HDnmpunoleGSZ8Yj857UQ764JqQK/xxazSbe1Chsu6LxZBUmNBcLdMTRMGtCsrrwZztqKXWYvV3HsbD1jla9gYfZGtBDUKixcms5ry3l6J3vddSG5IKioeZs0KuLtFsLCgkrexT0gOyuxw7gg4EoPs9fn7obnDTBWIx9Ttq1Ly5tvBQSnfJFaB8AkeYPAXGp7uIiggnVIYhHK2ok3I8JEac5Xt7hVj+9ZlWKH6S5Xdw5qdeTORk6c2ryLLIsK0LnNX6hgzZ6+ph6280qBAlrhYvBxAHnVRuXf1ymzON83BtewxE0nxDaglXPAZUKZCwJZhgFJmQLXmUJ2aFHZzPiJtHCvYkpHKicLDmZ7qBRC1li3LC4yPN1f+/eQ8udTADcC8lYwu6krMzhd7Rwt419e9p8J1Kk1ZCEg1vVfPFr+q0Jqx7lY4fVdElhuuFoWM+zgnU39TGGV8kbyByHV+cMkGN87UBnKmSUncC/Th9r9zU4EXx+0k2jRd/4WmJwzeToWSNxoRHO3rY0+ZEwlgwpx64VjNYZl1iSDFNBCZKUjUq38aUbwmHLwV6/9tp/1Xdh1M+9OBe9LYYEH/m/IUeEVVL/3kxdRwjxNgnRGb4pmkWYaQZDtlFlxIzPNUolU/+rRcO248Ro7Z2Qio8chLsFz+U8D+nae1lEPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(31696002)(86362001)(36756003)(66946007)(6512007)(6916009)(8676002)(53546011)(186003)(41300700001)(26005)(4326008)(2616005)(66556008)(66476007)(83380400001)(6506007)(316002)(54906003)(6486002)(38100700002)(2906002)(478600001)(8936002)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDlZUmV2VklJOWErQWJTSWt0OFZQNGxQMDdaOWY5bVoxQnNRY1FEMzdPSVJa?=
 =?utf-8?B?R2FhZko3UTd6eEZTTzh3MkV1Z0V6clIvdFZobGFsaUljK1V3RUJNQW5oY3I4?=
 =?utf-8?B?Mys2TExIOVpvSjU3bi96b1RQUHd3N0xoSG8rNjFHUm8yMHFUL2VlZXpXWHkz?=
 =?utf-8?B?Q1RKQlRPUzI2QmFOU1FITnNzQlF5c0twZlVGU0x4Mjc2WTZ6b282b3Q0TTZn?=
 =?utf-8?B?a1FQbjBxcHFDb3RlWVdWNWpBNm1uc1hTZ1dCWUM1K1NNdHhDREFGMi9ZL1k4?=
 =?utf-8?B?dU92S3M0STQ2OUlXcjBnT1VnQkJuMjJyUnE1QUhXVkFQY3VINXMwUVdrcGF6?=
 =?utf-8?B?V0tZbFlvM0U1OG1oWVZWVWR5MDIyVVNzSStydWVzSjE5dW43Zkc3Q0FqbEs3?=
 =?utf-8?B?eW1JRUZkd3JzOWZRejZ4NUpEemV1dTJGUXNKUlhOcmEyOE5kTmcvMno0YnVX?=
 =?utf-8?B?Mm9RYlBxUzBEWmV4NVdvTXM2T0NCcGVJclUyWlhqWS9tWVhyL3l5NnJQZVNI?=
 =?utf-8?B?bWFEYUFoK1RPQnV6cndEUFU0TEhkckkzN3BkMHJ2cmhQSm43UXBQL1VjQm5o?=
 =?utf-8?B?VXVEai9mZnRrNmgwSlpDZEN2UmFCQ2hnTVR0Qmh1SXJ0U1lxZTU3cFQ3L3Vs?=
 =?utf-8?B?VnRSeVhUbHc2ZGI5K0ovY3ZNZjE5empyMTByUTBDL3EwK0k0UjlxQ0xIMzZw?=
 =?utf-8?B?bkFxMkw3VFgxOWQxTThtZkNvWEhCcmJSaGVRRUR0ZTZLRmY2WTB2Y1ZCU3g1?=
 =?utf-8?B?Vi83T1lRSmRCUEZ4YUU1aEdNUDdWcUZWU1hjTExJWitnek9IelcrNXdzRVds?=
 =?utf-8?B?enh3cUh2N0ZNeU1UcUFxd2NPcUFBT1d2WkZhS3NtbzF0VGpPeUY2a3A5STB6?=
 =?utf-8?B?dnRudy9CWTFJT2xIT3pQUWJyZE9ENlVodEJleFhKK3hSMkFISm1GUUVGWVBx?=
 =?utf-8?B?RlZGYk1QSktOQ0Y1MU1ZM0MwVEg2RCtPeVE5SWx4dEh4c09HS2RBeFdES1Q0?=
 =?utf-8?B?VjJNNm1nREUxUDhBMEdHTzN5NDZCb1hXQ3JmVXlzcUxkTStRWnk3R3J1dUxR?=
 =?utf-8?B?T2dYWjVqU0NtYy96S3BYaUNyV3VLT1JjOFFLSmhTU3hMdmZXT25VOVluT3FI?=
 =?utf-8?B?S2g2YTAxTUhWTDF4WVpSUG9qVzJKRVhES0lNd24wUDJCQXJGd1oreVZBdzVI?=
 =?utf-8?B?Ukg2YkFrMTEvWnVXNnJLT1hNdUROcTFrbkR0TDB1ZUJJZGIrQU9yWXZzZzlH?=
 =?utf-8?B?aWhpWmFZc2RDVHUzUjNZNGRFTkVCdFMvT2F3d1d4UFlWMitneFdxbnY2OSs3?=
 =?utf-8?B?S0NtckpnVGxVK0R0YjI3SzJVeEJyeTY2Z2dtaGFicE1iZEJpZmlHeVQ1R24v?=
 =?utf-8?B?b2tnUzdROGhjTVdCWjFqakdjd1JMZWxRakNVQVhoSmxWdEl2TTV2VEZKNW56?=
 =?utf-8?B?c0dOd25CS2duWVdVaGpTTWNNcllnNml1VEwxSENMQUxuMytHb2p0b2JFMWZD?=
 =?utf-8?B?YUQ5Q2R1TUhHaEhScmtDREpvVEVrQ3dVaEsyLy96RXJyNXJCQnlLMlRvZ0Q4?=
 =?utf-8?B?UTUxZWZYQ2VndXlSSmZkUkNDK21yRlJmZGJWZ1QrQ3NnbERVMWp6VW1tWDdN?=
 =?utf-8?B?anJUNjVXcDNvY09FYjUwcXR6cTBwd1pnQ3U3NkNnZnN6T0dMT0MvdGtBamFU?=
 =?utf-8?B?c2NYbUNrbFM5Tkc1U1luUDRIWlh2bDhsVDN0aGthS1dHNENjRzRGOEpsaXp0?=
 =?utf-8?B?VjVzOHZPZ0NhZkgvd3NNMWp1QmcrR1NJclptb1RGdTJGdGVtS3NUQlQ5Nzhq?=
 =?utf-8?B?aHIreUhZRDJTOGtqSlJIaFZxdGVnRDR2Q251aTNYQUZZVDViUGZWVnVMWXUz?=
 =?utf-8?B?UVFRTU8rRk9udC9IYWpndVJlRDFtYkJabzN3V1NUUVc3ZklseWJiL0RUbEVj?=
 =?utf-8?B?YlJIaGdzRWVYc3R5SERmdmFnOTR2TU5rRVU0MEh6SXNuL1BMWXo0UWUxOVJX?=
 =?utf-8?B?TEIxQTg2RHBYTFFycUpORTB5Rjd4MlhxSGVibkhEZWQ5UUFpNGJFYS8wVWVM?=
 =?utf-8?B?djRpSU5MVkwvRVg5VWVyZEFTUURLZFZjSFdFN21sajhDYW1YUlZOM0Y1d1dG?=
 =?utf-8?Q?fPAKCOX9G8TKXDrpHRWQ4Xdzs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216afa72-08e8-4140-749f-08daf9324880
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 08:59:18.8436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Nolmg8YCt573bHz4mvUPZJDNRRlQMvdCCoOLwfgLI8hjgxZABHxNgWD5tbzPINEynDGGzP8UxFbJoZg2Y8w+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

On 17.01.2023 22:17, Andrew Cooper wrote:
> On 19/10/2022 8:40 am, Jan Beulich wrote:
>> In preparation of the introduction of new vCPU operations allowing to
>> register the respective areas (one of the two is x86-specific) by
>> guest-physical address, add the necessary domain cleanup hooks.
> 
> What are the two areas you're discussing here?
> 
> I assume you mean VCPUOP_register_vcpu_time_memory_area to be the
> x86-specific op, but ARM permits both  VCPUOP_register_vcpu_info and
> VCPUOP_register_runstate_memory_area.
> 
> So isn't it more 2+1 rather than 1+1?

Not in my view: The vcpu_info registration is already physical address
based, and there's also no new vCPU operation introduced there.

>> ---
>> RFC: Zapping the areas in pv_shim_shutdown() may not be strictly
>>      necessary: Aiui unmap_vcpu_info() is called only because the vCPU
>>      info area cannot be re-registered. Beyond that I guess the
>>      assumption is that the areas would only be re-registered as they
>>      were before. If that's not the case I wonder whether the guest
>>      handles for both areas shouldn't also be zapped.
> 
> At this point in pv_shim_shutdown(), have already come out of suspend
> (successfully) and are preparing to poke the PV guest out of suspend too.
> 
> The PV guest needs to not have its subsequent VCPUOP_register_vcpu_info
> call fail, but beyond that I can entirely believe that it was coded to
> "Linux doesn't crash" rather than "what's everything we ought to reset
> here" - recall that we weren't exactly flush with time when trying to
> push Shim out of the door.
> 
> Whatever does get reregstered will be reregistered at the same
> position.  No guest at all is going to have details like that dynamic
> across migrate.

I read this as "keep code as is, drop RFC remark", but that's not
necessarily the only way to interpret your reply.

> As a tangential observation, i see the periodic timer gets rearmed. 
> This is still one of the more insane default properties of a PV guest;
> Linux intentionally clobbers it on boot, but I can equivalent logic to
> re-clobber after resume.

I guess you meant s/can/can't spot/, in which case let's Cc Linux
folks for awareness.

Jan

