Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED259F801
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 12:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392393.630717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnqB-0007Te-8q; Wed, 24 Aug 2022 10:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392393.630717; Wed, 24 Aug 2022 10:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnqB-0007QY-5E; Wed, 24 Aug 2022 10:42:31 +0000
Received: by outflank-mailman (input) for mailman id 392393;
 Wed, 24 Aug 2022 10:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQnqA-0007QS-6t
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:42:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7328811a-2399-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 12:42:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5070.eurprd04.prod.outlook.com (2603:10a6:803:57::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 10:42:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 10:42:26 +0000
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
X-Inumbo-ID: 7328811a-2399-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGVOW/KBlGUGBOsNMEcN1LcDF8nUie208+t6cSopyu4v3MnyVSYw4EJ2BxIPNhXon1xMka9WR45pskh+e4WHZQ1sNKYDYGhGEu32KhSS4MgNp0sz1ddmx9YA+gxR2eY4pJ3ccDnZeIWxk/cA2B8TWTou4+1c4OjzmXpPHfXBdhDZuvFEj3cXT6fQyQ9uY2wsNIep/IC2OOvw2HVlaD7YJKS8AG8ciKeQJJ86VvNomQZMKQt/yt67kFfgppZ+L3S4op/W94dr84K6Uj1Rs4j8Ptn8RUMtX4HuRrg0P6RSdoccs/xTNxUBThFujuUORqbu01ars9UeHDqjSmHpp2A9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYcjVrWhIRhByjbAsj0XKTTuIp54RW0MRu/QBcwaDpM=;
 b=Jj0ke63y+31Ut4H3SMhvJNguMHDKCbS7KdBi/lxmGMlEaJix2nGpEyESTvUaEUfAOjlFVfSeegR7g2gq/ob/Q1BYKgtEOCQAs6xYrPRwY+4ioBFVqQD/BMBBcRziPw6N0upXfbKWHr/ZOHursYrPOBdS4CiN/DLDWpO1RcGF49U572KZSr6kaZo2K5rMwTbTxQ+cu7rgglBY1ricN9s4TjSy2zkAz5EgG7aJede9B8E2WlA18TYM6S4F/OHSCeBnhW3QiFgXeeOi47R1GRI56tMdWkt68m1Cc1JdAJVt6/aLi+NIm1yfflWNFdN/bUgs7o1x6x+CBKvbR1YnS5jdfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYcjVrWhIRhByjbAsj0XKTTuIp54RW0MRu/QBcwaDpM=;
 b=RauyGcgc9PFR2fYDs1wOBqrBzseI3Fy7+nTC/pGw5sPdnYMiJh2TivCc0NxFy5UBg41QZrzFLN5PXvaDbLuLrDe9uvq5GoOt4aDGzAmbidE+4vCuy+ct6JmmZqOQJXgBJyUSio+X2r++n31BZWZFIqJ9l+186ihx4NM/qrP4JfR/d2ePjG1VlVpPjzC0cHqifBXrQxUiWFtUhuiRzd9ZTEJV5W9rsInhFakgGKbKyJu65mtZDZTgnIkW1xr1/JiznoJk2+hArHQ22nwRCYI7JzWlAQeYYbTrgLR+lXGdbHSrXtg/FTWEyePgHXA8XbPcJm4P34mN3Npqo6gZ2ZlkTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd86cedc-30c3-3acb-c67e-313216ed98a3@suse.com>
Date: Wed, 24 Aug 2022 12:42:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v10 2/9] xen: do not free reserved memory into heap
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-3-Penny.Zheng@arm.com>
 <6c2d0111-3ac3-83aa-145f-432f5fae0167@suse.com>
 <8430ec87-bbd2-d074-b313-84d5f31def1e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8430ec87-bbd2-d074-b313-84d5f31def1e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b08a99a3-66ff-4476-fbec-08da85bd55d4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5070:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6M8ird98qI3xTPuFdTnVJym2fQmbN12Csd6c49jpX6XPRXTO/aLF62CGHpC72/DORgjNgIfCHfNOQtCeAKBizJTA77lG6nGZUbadQ7kHsNGwyppI40qBLGm7zaXjsrbAvWjXlPe8WqggANBr7Vv0lClI+YZLBNKAZONbtkZC0YatDfaDSwK1RO+tjcOj+NwwJC44fK35rpfz6OsGWwAnQQmTMV6NZ0So+xE6vnxh4LhopbPeLzTPqjXks1/tq0QGSVUKpQ8Ep7oKPdN9gfD0AXpFpHySPvAcIoVFrSstQtUJCRtokoEeWVfpYMNhTD3ZwkwtFqcTzMQ2XJiAnXrT8RxY/kl8G04djSIageYbJmW8IzMHcIs/INIymFTXCp6nyJgPxQuGY6XVaMSYVU2SNLQqPcc5fWt1xvRk7f74OO6sz6U1Q0WAUNijp1Jftn32s96bOrqvwseJVSW81RQcq7emmyM+2viH6aHe7DPcaBs/xS4rM3GwPCyefpXo9P08tWJmX7pzRkBS3y+yM+ch1TwQlJniMEZ/3/W9xyAJnWeeMtWJJIF2M22eP4iIahcS0haq84bObbyDRy7PQqhirjtkfXBgW+NtTw7TFfP5whMUKhqLmiZKXk6dp1Lu53R7K9uPdDhySGqQ5P87cwL8g3sh4W9OY81lLp9nsj5LpyrfkD2yE4rVy+c9FHFZvyDdATmRnnRpGfmZTUGBp2yD5gLdMMmISB3E1C4z1xP5K8tqKPmZlI5NphQCafltM09ZVSFj9bBi4e0/lWTt6Guaj2gY5XJF4Uy+lf7PJMiQIuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(376002)(136003)(346002)(5660300002)(6486002)(478600001)(7416002)(8936002)(186003)(31696002)(2616005)(86362001)(41300700001)(6506007)(83380400001)(2906002)(53546011)(38100700002)(6512007)(26005)(36756003)(31686004)(54906003)(110136005)(316002)(8676002)(66556008)(4326008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk1LUnFDSUs3aSsrTjlaVzhJUWM1TTM5MG01MkozLzBhcE5mMGRqOGRIR0ds?=
 =?utf-8?B?dkE2TFNXZ28zNHZPMlpGVkhhVUVuakVnRlYyNzhFUW8rUjl6eE0rU3RCQWxn?=
 =?utf-8?B?Z2JlbDZucGEwNGlic2VvUFpqREwxSHNIeHowZ2V0MUgwcDBkUHlDSkVYbExp?=
 =?utf-8?B?U0xEd3JwTVQrT2V2WmlJOUVYNVE5RHRUWS9nWllweEkwUjdwS2M2VU1ac0lF?=
 =?utf-8?B?ekEyeFVvR0pUYTIzQmxDVTI0REtJcjVPSlVjQkFwaGZ6QkpKWjFWMzFuYXFZ?=
 =?utf-8?B?bENvbmRxazgxaTBqMExDeDRkUDNWTzIrMUZUMSs1eVQ5S3hCalF0VlFnS1g1?=
 =?utf-8?B?MXhGRW8xNWtRQ00xSGpkT21kUEVrUklEU2ZRUmU5Z1lPdnYxUGlkc0RkYm5o?=
 =?utf-8?B?MFBGN3h4R3d5WDZSYmpCZmVIcHhiY3BKRnU2Qkx2ZjJwQk8vNytpNERRN1Yz?=
 =?utf-8?B?RlZQSjhNRE4rVVdiOTAzVk41aGlCTTN3K3ZzY0Z6Z1Y0MmRhTVlKeGFCdmtl?=
 =?utf-8?B?TjhsRWdqcFZTUEgzdW5POVJnY25Ga2xJdkVzb1N2U3VXd3AyWDB5T3Q3VkNL?=
 =?utf-8?B?Q0dCOGw5ZTExQ1I3YXg5eVlSRHV2T2RoeDJUMStnKzJ0RkkzUDZLamlTdTJv?=
 =?utf-8?B?L0VYaUlLSHhrVUEva1FVWHhQaDhjNXgwdG9MYUw2ODBsaEFWbEJLSGl0YXBt?=
 =?utf-8?B?M3N3My84MkR2TEFoYWdEM2hHcGJHLzFYMjM3MXJKcjl1bmRJTW5aUHFIbU0r?=
 =?utf-8?B?d0V4SUJ5eVZoV2krOUJrS1QrYnYwN0lwYXkwSDM1Vm5kTjd1T0ZjU1pzREph?=
 =?utf-8?B?UmpuakhIaW9yYkFuTU1RV2VidXBnTW1aMEdvY1JHcDlQRlpUYUQvTy9pU1RE?=
 =?utf-8?B?bHNLUmtxRTAzV2xVeEhQRFE3QWx4ZVFGaE5nTzBxcDMxWDZzWkRYdzFtUzZm?=
 =?utf-8?B?TmdsSE43RFUvMGZrTENXeEgwTDRHcU80a2drQWJ5dzRVWEFzVjlWYkhzQVNK?=
 =?utf-8?B?ZENWU3FEODVmR1hMakNkS0lsZ1BlTzhFS0lwK25mMDlhNW9KV2JIQ2ZGNzhx?=
 =?utf-8?B?cEVaUC9FdFRRdVFNVXpBVnRsamhselk2cjAyaWJLbVpLdG1WSkdRRzdCcHlE?=
 =?utf-8?B?aVQxZjJCRFRmZUVEQ0QvTXZialJnUjREU0YvTGtVYVNvY1cyWnd3VmdXZkJC?=
 =?utf-8?B?L01SSVF3RGFFS0FkV05zK3FBUWpwZGZYWmNITXNENzExK21iNjcwWmlIY2gz?=
 =?utf-8?B?SkpGMXZBd0ZxQVR2TGNCd2xlTjdpbzhwU0tIN2NVK0E1QUt5OVZGbGJMS0Ns?=
 =?utf-8?B?VnNOYWlDMkIzcHF0RFBLNmRHSnlkMGNwT1cwWWxUWDh4NVo4VUx1V0Nic2Fa?=
 =?utf-8?B?TzZNMXJMNTh1bTN0K0RjYzl2bEtuRW5jb093WndIbE01dEtERHZjZnhqYVFa?=
 =?utf-8?B?aXEycllFcG9XdHlsV2NiTFZXOU1jMHVBb255Wlc3dnl3d3lBUEJmMURNUWQ5?=
 =?utf-8?B?ZTJ1Q1cxQzRpY1JTb3J1enlTZ0VCZk42M1U4ekRaY3g3SGtGOTA2SmdpNDR0?=
 =?utf-8?B?QVdNaFBIWG9LUFJlUGNWRlVCM3dPSVpSRjZyVmYzY25vaVI2UFA0Lzlkd1pi?=
 =?utf-8?B?OVRuazM3MnJkdWxFVmwvakZ6a0VJb2pQdmdIY0FkVTJ4K1lxUWltT3dCY1Q5?=
 =?utf-8?B?M3lZWThaNVYzOUhzdVhBZ1h4OWNDNENNaXFuKzVERk5VcmthUzF0NmMvSGFk?=
 =?utf-8?B?Q2ptMWZiNmJJbmNUZmxBazNiN0NqY3JtNnppSUgvKzM3WVpBcjN6TWFYVkZD?=
 =?utf-8?B?K0tVVzVuVU8rWSttZ3QwV0FrM29xT1ZZRC9uK1pIMlRzemIzdEFYdTF2Rk9a?=
 =?utf-8?B?aHlZREdPVEVGMGlnV2RYempoalBVc2czM3o0K0srclA1ZGEwQjdGQjljNXRn?=
 =?utf-8?B?ZTFtellSWkNHRXRhWG5lV1d2NGJ6RGt4OExZd2QwdnQvRWNYaWtRMzVkcGM2?=
 =?utf-8?B?U3VBZ3lpMXZKdzRiQWZzUU5WN0cwNzgrYXVEdnpxcnBCRkk5UnVONHhHdFBR?=
 =?utf-8?B?ZnpGZkVNUFRGVUN4Uk14cG9sZ2NsZ2RDeTdWRnpsK3J3VjU2cC9pK01iTTZB?=
 =?utf-8?Q?EEWZrxedw04EvpaguAuDjEYst?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08a99a3-66ff-4476-fbec-08da85bd55d4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 10:42:26.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tA3UbyPcfMuojo2jdnlKsmpauxVGDH/kMLcuLel7llbhAKUsb3HnLgm4ufsWqvz5ZX7bUZUi26rNk6eUNlUzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5070

On 24.08.2022 11:03, Julien Grall wrote:
> Hi,
> 
> On 16/08/2022 07:40, Jan Beulich wrote:
>> On 16.08.2022 04:36, Penny Zheng wrote:
>>> +void free_domstatic_page(struct page_info *page)
>>> +{
>>> +    struct domain *d = page_get_owner(page);
>>> +    bool drop_dom_ref;
>>> +
>>> +    if ( unlikely(!d) )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        printk("The about-to-free static page %"PRI_mfn" must be owned by a domain\n",
>>> +               mfn_x(page_to_mfn(page)));
>>> +        return;
>>> +    }
>>
>> For the message to be useful as a hint if the assertion triggers, it
>> wants printing ahead of the assertion. I also think it wants to be a
>> XENLOG_G_* kind of log level, so it would be rate limited by default
>> in release builds. Just to be on the safe side.
> 
> +1
> 
>> (I'm not in favor of
>> the log message in the first place, but I do know that Julien had
>> asked for one.)
> TBH, I think all ASSERT_UNREACHABLE() paths should be accompanied with a 
> printk().

If you want more than just the line number, use ASSERT() with a meaningful
expression. That'll be easily a fair replacement for a separate printk().
And no, as said in reply to Jürgen's patch, ASSERT() and friends should
not leave any traces in non-debug builds. If you want such, use WARN_ON()
or BUG_ON().

Jan

