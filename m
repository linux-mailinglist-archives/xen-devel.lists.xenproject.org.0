Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6199A6C4449
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 08:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513141.793716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petAH-0000AV-8K; Wed, 22 Mar 2023 07:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513141.793716; Wed, 22 Mar 2023 07:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petAH-00007l-5M; Wed, 22 Mar 2023 07:45:45 +0000
Received: by outflank-mailman (input) for mailman id 513141;
 Wed, 22 Mar 2023 07:45:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1petAF-00007f-Jx
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 07:45:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b057da9-c885-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 08:45:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:45:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 07:45:39 +0000
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
X-Inumbo-ID: 8b057da9-c885-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmHuOsVvi2JhrbGkV4CdHnhhXAl4y1LVpZjRcwtcWra68+BNV+QT6sFQJnwgVnD5cmDkbpk8eiOOI1Tr/yg6QHBHDra95llc4tNDiX0LYJoBsYOBILnexN5z+W7sRbO8TYAPvxYwmDF0p7r7u6VtoaSJexmX4gCAWaudvmsconjYYs+R4hz0ARid+T/Brd+O31dvhGfxTCbO0ja7m/iadnqOeL2T5hYQ6kuQAqt7kHcvWuuevq2t+vnIEmd6Ck87jCx/+GBlAYCK2g6a5fcweHvz0kb4wrLSDSgDP3QPY86MMA9mKvDEhJhtF+IVPj8pKLCU/IMWXNsjnaJXd9nrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmAoFQtrOSWqKVqGT0oPhflUTQhAY3VxACereX8y3AI=;
 b=oU1iF8wPGhn+WTYbSfOjWaVJdlDNW75/xJHRKNL3Bva6yNrWoSEVbO86M3eG3dIoWlaYLUnOvGc1RZY/yTVbX8xah9olwrZ4CAzvhvQdV0CYaGgVOJ6n5EJVKtrCtycoL01yRIpHH4woQlJ7h8f5P7sPswC+1MjywHMZ6JESc51SHDSQgN9HvBwbH9O29SyYlmuCmYi71HBV3ktRQDh2Xa2U+IY5Z7CQguFNEEcAUE4wH2whweikBcjbpsRTiOHHvId3/iEbDnc+dz3MeIs28X4QUjGwNrt0gPcrZdw2BV3soxkjo8Jninm+8707MVhev9O4P2QGO/TfBudpVOvfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmAoFQtrOSWqKVqGT0oPhflUTQhAY3VxACereX8y3AI=;
 b=ktrTkf95ZLYfoRJZ6gumDyzff2Ywj66x16gEqPAi0gjv4x7hdg63hPIvby2icStk9YwLrfymZnvz1hQ8YbhrroBUAL45Kr+gMX7NNxhAEk7RBd10ksj+ip6v6rGzdK3N78rDblGq7juVZRllvtwOm8Vf/HPSghHf2WKCBIm2t9tHSGv4wykD1o/gQvLZ+sElbEsCNjNUyXlxT63MEpwRATkd+8E7+yXzWhf82cWd5YksnR4QdJMA1hqbcZN/+NM6P1icJli8EnpdG4CCkqoTOWwDXJJgxawsdR0NRRoLMbdyaOb5MvwqTudD1sZSgImI0UBUmBGUHXRwCT7xkiWf/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7543a154-4ac6-ceec-dad5-69f275025c21@suse.com>
Date: Wed, 22 Mar 2023 08:45:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=ef=bf=bd?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com> <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com> <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com> <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com> <ZBmrI3wrrwsK5Q+0@amd.com>
 <ZBquOn8x7IyI33Pj@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBquOn8x7IyI33Pj@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0a4538-d535-43a2-d5d4-08db2aa96e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3IycOV+TlLEUxEU9LfI4MzoX+KZAugJ9jEMrSJwnZAf3ZOCFoLGQGpZQXqrgLVqVFmoQzhBWxXbLZXt/8arCCA6Ktdz3U0mckjDV2O19uQ0UGwScSjOYU1PVr94VJ3BMjFxc3wiEPb+twTVXye5NWy6ynh/jZO/tV9oJJX3Rh1h8t1jsM77onwNZMNpV/dgf8xAMDMnkmMi0hKB3WanRmdSwcmwWy4FNaq/tYcjizhVpZ6n8Qd7UnckUXfvbItLw2ywaEeypiM334b0/1k9TMCtYoM4d6yEllvG52iW6XeAsJJ5CU7AG2NM52Dl7q9Dgje+6FT3QdcCporiXYmAKa/Zdk+gggBWQelAC7bGDfYxJ2/M3zHNU6vVWmn0FAcvh+dEBVscZ+Qhvj/bBdiDan3xXC7aoU58Z3UmSUU6MY4UWN2FgUtNbVrNhg47+PpHltbv3K4v5JSNV0g0CR/MrYpt85BBzFRxlWvnaFmP3SntKHseqLp4Lc6XpEh31Rbd/RWa4PAYTvf98lk7hyCH5/sicDQiaJaLPzBlRcLKofcVNN1fGcdSfV3LW8W3LPROAY/bjtjLfOpKONJNKNpggfzj5q8Jl31xqHsKflm1xUvAPST4PXqWfUBeI1HuzSyhop9PgwaBUQLjojeN/yApiSh67ihBfAq+EWIJn3o7/HziNPA7sZKDO+EOmItel4kv5R6PcnVfLMjKzQU52ug2MM+wcPHFrIjNxb1mVpYxKJJQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39850400004)(366004)(376002)(396003)(346002)(451199018)(2616005)(6506007)(6486002)(4326008)(186003)(478600001)(83380400001)(316002)(54906003)(6916009)(66476007)(66556008)(66946007)(8676002)(31686004)(6512007)(26005)(53546011)(8936002)(5660300002)(7416002)(41300700001)(38100700002)(36756003)(2906002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUliNjFUdWtOT0MrZWpQc3NZN09QZWxkMFY0UzVpVE52QUEzSWcwQ214Z2J5?=
 =?utf-8?B?MHh2ZWp6RzVsQmZJV3hJYmNOd09VbUVabGJOS3dYakdWT1NWdGk0VndKMWpw?=
 =?utf-8?B?SHNZQ0RYRmgveC81TkZQNmZXOTVyNnJtWHVoZDhibk5SUCs4d1FDZDBsODBn?=
 =?utf-8?B?c1lDaFpmYWVjbWxTTU5raS9sdG0xK29pYm1CTEQ1bVdxUW1PR1k2ZGhVYXUw?=
 =?utf-8?B?ZHd2VzlFWjdPS3BVUWlIbGgyTmxnbDRiS1JERDkvUWJUY3NTZjdlV295OWxz?=
 =?utf-8?B?OUtVTGpOb1h2VlFDUmxEMjgveGRZOEErcU5oMkp0blNiSDJtNFU2M2ZVQ1hj?=
 =?utf-8?B?b0Y3UGk0QmRLdDBPWjNVcVgvQUl3Y3ozTStFenE5R0lhbmljdVRaTTN4bFND?=
 =?utf-8?B?Vnp4R3R0cktURTF5WjFHUVN2VlgrVVhIdnIrcGIyM2pjOGh2WWJZSjF1VGhl?=
 =?utf-8?B?M1ArdXYyb3Mvd0RpMVNLSmJWSTdRR3k3ajY2RUNvOGF3SEVRT2JXUVFEWlla?=
 =?utf-8?B?KzNkT0puZE50eTdocW8reVErSzZSR0RqckVZd1p2ODJ4d1hXR0JQN1FBRHR3?=
 =?utf-8?B?Y25qNENTd0xrMWJ4WDdnSUMrL2gybDlXT29kR05Xdml4cXhrWlN1a0xkbUU5?=
 =?utf-8?B?VjBLY0VqenU3cWRmUnlXZUI0M1NCa1hhblowMUkxOXRaVHhhREdhdGxpVjJi?=
 =?utf-8?B?RnZzR2Y0VXQ3dVlFTjFKUUFlU25DaUtCczBBL0RJNGVUOWFLdUkwbk4wL3B1?=
 =?utf-8?B?MVplajlSd0dMajd4VXRCZlYvNXdLaUxmZTYzSDhPSkpzUjFuQjhkY0tyYTls?=
 =?utf-8?B?WCt6djJTbW1PZUFYdXUxSjJTSWs0NThQNTVhTlRQamJ1cm5VcGUydzl3OUY1?=
 =?utf-8?B?akExNUpnTkROTmR0RTV4am5BVGNza3k3cTFWSGFaVXhFOHZ4TnpXVVAwMDQ3?=
 =?utf-8?B?WWZaeGhkUWZpUWZUQVdBVmtneU1SWkU1RktDUFFXWnB5NTU4dmpWRW5Ua3VK?=
 =?utf-8?B?ZG1Gcm1PWXBVZlBDelZlZzIrclFBSkZLSmZvL3YxMGx1a3FiY2M0TVMzWVln?=
 =?utf-8?B?ZEdDeEdZclNWWXNCRDZITXR5UWRZdFh5NFVvd0RVOTA1TXQrOURuWDBteWlL?=
 =?utf-8?B?cGhNWThFRXg5UjdjRFJmNlcySVhZSFVPRzdxVWJDLzlEeXYyL2x4OEtOK2dr?=
 =?utf-8?B?K3QybmhNTW8zcENsM0VLa3JESXowcWZFR0R0ZE02c1R3NFQ0MERPTFZVMnR3?=
 =?utf-8?B?dkhuaFZrNGtpQlQ3QzZZVUM5N3Y4WG81NytkeEtrUnh0dnREQ2VFOUxxMC9M?=
 =?utf-8?B?dUFlMHgvSnBWMGxRVitOSmo5TEl0cFZQb0t3N2hLZE9JeWUyellEemxQRGxa?=
 =?utf-8?B?VEhKTG9OL0tFVDl3Y3ByZFRoUzU4eUREanU5UnkzaEtnaUFsMHh4clNLQURR?=
 =?utf-8?B?STgwU0ZNdDBKN0ZrS1hyRU5GR2tPelpwbEROdUoxWFlTdXpvKy9XSEt5a0gv?=
 =?utf-8?B?bzVmTTVrUW9FdkxIamFBcjZnL0dOVlVBUHJ4azF2Z2l2M0gzSnBCbG13aUNL?=
 =?utf-8?B?TFIxSmRhY2VzbWNCRzNpN3J6RVc4Umljb2pwK080bkVpbzE5dXM5Nk5Wdm1x?=
 =?utf-8?B?K1dXbVJQS1Vrb01ackdYQldGSHpNcUQzdEJCZUExL2w4K3c2bjJGaXZGVnRE?=
 =?utf-8?B?UHF4TTdmOEEzRTUwMmJPOHJhNkVyaExSU1ZVc0tGa1JpL0pFamdpcDFueUFK?=
 =?utf-8?B?N1daQ2g2ZmQrRFJadW1abkx0SEthUDFtRUgzOFBmTWhhZ0ZOMG9LSTdpb3Ey?=
 =?utf-8?B?YnZHMTRnM0dnaEhJYWZxTnVCUThHaXQzQjJDZThDcjdSM2FuMlFQODFWb2RD?=
 =?utf-8?B?ZFBLeVhIM290OXpyQVVRd01OVjNRbWhxWEQ5WHFDa01tcTQrdE5lSXoxWGh1?=
 =?utf-8?B?RUtZemduVVFacGdoOXdmSGV2S2Mzako3VVJ4MUlVM250aUZkWjBUaVJRSW9K?=
 =?utf-8?B?c0lVOVlsa0VuUjNvdFFlQjdiMzUyK01MT3dQcWM1a3NjcVF4UHhTdXRZcFVt?=
 =?utf-8?B?em9IdUxWNDFsODRJd293NkNlNy85RXE0QlF1dFJKb05scGZiM2xGeGI5T3JH?=
 =?utf-8?Q?ESyDkCXkVxRoYWOjt+5ZxNnmD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0a4538-d535-43a2-d5d4-08db2aa96e29
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 07:45:39.0694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtYHZCfsQV7cpDAK36+umOU6qxznPrINFPyO2Rv3NNMboOCRw4Ai4+bQM2IR8Q2eHDAgUyveY0j/zKRuWU9R4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854

On 22.03.2023 08:28, Huang Rui wrote:
> On Tue, Mar 21, 2023 at 09:03:58PM +0800, Huang Rui wrote:
>> On Tue, Mar 21, 2023 at 08:27:21PM +0800, Jan Beulich wrote:
>>> On 21.03.2023 12:49, Huang Rui wrote:
>>>> Thanks, but we found if dom0 is PV domain, the passthrough device will
>>>> access this function to write the real bar.
>>>
>>> Can you please be quite a bit more detailed about this? The specific code
>>> paths taken (in upstream software) to result in such would of of interest.
>>>
>>
>> yes, please wait for a moment. let me capture a trace dump in my side.
>>
> 
> Sorry, we are wrong that if Xen PV dom0, bar_write() won't be called,
> please ignore above information.
> 
> While xen is on initialization on PVH dom0, it will add all PCI devices in
> the real bus including 0000:03:00.0 (VGA device: GPU) and 0000:03:00.1
> (Audio device).
> 
> Audio is another function in the pcie device, but we won't use it here. So
> we will remove it after that.
> 
> Please see below xl dmesg:
> 
> (XEN) PCI add device 0000:03:00.0
> (XEN) d0v0 bar_write Ray line 391 0000:03:00.1 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:03:00.1 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:03:00.1 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:03:00.1 bar->enabled 0
> (XEN) PCI add device 0000:03:00.1
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> (XEN) PCI add device 0000:04:00.0
> 
> ...
> 
> (XEN) PCI add device 0000:07:00.7
> (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc0010058 unimplemented
> (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc0011020 unimplemented
> (XEN) PCI remove device 0000:03:00.1
> 
> We run below script to remove audio
> 
> echo -n "1" > /sys/bus/pci/devices/0000:03:00.1/remove

Why would you do that? Aiui this is a preparatory step to hot-unplug
the device, which surely you don't mean to do. (But this is largely
unrelated to the issue at hand; I'm merely curious.)

> (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc001029b unimplemented
> (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc001029a unimplemented
> 
> Then we will run "xl pci-assignable-add 03:00.0" to assign GPU as
> passthrough. At this moment, the real bar is trying to be written.

How do you conclude it's the "real" BAR? And where is this attempt
coming from? We refuse BAR updates for enabled BARs for a reason,
so possibly there's code elsewhere which needs adjusting.

> (XEN) d0v7 bar_write Ray line 391 0000:03:00.0 bar->enabled 1
> (XEN) d0v7 bar_write Ray line 406 0000:03:00.0 bar->enabled 1
> (XEN) Xen WARN at drivers/vpci/header.c:408

None of these exist in upstream code. Therefore, for the output you
supply to be meaningful, we also need to know what code changes you
made (which then tells us by how much line numbers have shifted, and
what e.g. the WARN_ON() condition is - it clearly isn't tied to
bar->enabled being true alone, or else there would have been a 2nd
instance at the bottom, unless of course you've stripped that).

Jan

> (XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    8
> (XEN) RIP:    e008:[<ffff82d040263cb9>] drivers/vpci/header.c#bar_write+0xc0/0x1ce
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v7)
> (XEN) rax: ffff8303fc36d06c   rbx: ffff8303f90468b0   rcx: 0000000000000010
> (XEN) rdx: 0000000000000002   rsi: ffff8303fc36a020   rdi: ffff8303fc36a018
> (XEN) rbp: ffff8303fc367c18   rsp: ffff8303fc367be8   r8:  0000000000000001
> (XEN) r9:  ffff8303fc36a010   r10: 0000000000000001   r11: 0000000000000001
> (XEN) r12: 00000000d0700000   r13: ffff8303fc6d9230   r14: ffff8303fc6d9270
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003506e0
> (XEN) cr3: 00000003fc3c4000   cr2: 00007f180f6371e8
> (XEN) fsb: 00007fce655edbc0   gsb: ffff88822f3c0000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d040263cb9> (drivers/vpci/header.c#bar_write+0xc0/0x1ce):
> (XEN)  b6 53 14 f6 c2 02 74 02 <0f> 0b 48 8b 03 45 84 ff 0f 85 ec 00 00 00 48 b9
> (XEN) Xen stack trace from rsp=ffff8303fc367be8:
> (XEN)    00000024fc367bf8 ffff8303f9046a50 0000000000000000 0000000000000004
> (XEN)    0000000000000004 0000000000000024 ffff8303fc367ca0 ffff82d040263683
> (XEN)    00000300fc367ca0 d070000003003501 00000024d0700000 ffff8303fc6d9230
> (XEN)    0000000000000000 0000000000000000 0000002400000004 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000004 00000000d0700000
> (XEN)    0000000000000024 0000000000000000 ffff82d040404bc0 ffff8303fc367cd0
> (XEN)    ffff82d0402c60a8 0000030000000001 ffff8303fc367d88 0000000000000000
> (XEN)    ffff8303fc610800 ffff8303fc367d30 ffff82d0402c54da ffff8303fc367ce0
> (XEN)    ffff8303fc367fff 0000000000000004 ffff830300000004 00000000d0700000
> (XEN)    ffff8303fc610800 ffff8303fc367d88 0000000000000001 0000000000000000
> (XEN)    0000000000000000 ffff8303fc367d58 ffff82d0402c5570 0000000000000004
> (XEN)    ffff8304065ea000 ffff8303fc367e28 ffff8303fc367dd0 ffff82d0402b5357
> (XEN)    0000000000000cfc ffff8303fc621000 0000000000000000 0000000000000000
> (XEN)    0000000000000cfc 00000000d0700000 0000000400000001 0001000000000000
> (XEN)    0000000000000004 0000000000000004 0000000000000000 ffff8303fc367e44
> (XEN)    ffff8304065ea000 ffff8303fc367e10 ffff82d0402b56d6 0000000000000000
> (XEN)    ffff8303fc367e44 0000000000000004 0000000000000cfc ffff8304065e6000
> (XEN)    0000000000000000 ffff8303fc367e30 ffff82d0402b6bcc ffff8303fc367e44
> (XEN)    0000000000000001 ffff8303fc367e70 ffff82d0402c5e80 d070000040203490
> (XEN)    000000000000007b ffff8303fc367ef8 ffff8304065e6000 ffff8304065ea000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040263cb9>] R drivers/vpci/header.c#bar_write+0xc0/0x1ce
> (XEN)    [<ffff82d040263683>] F vpci_write+0x123/0x26c
> (XEN)    [<ffff82d0402c60a8>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
> (XEN)    [<ffff82d0402c54da>] F hvm_process_io_intercept+0x203/0x26f
> (XEN)    [<ffff82d0402c5570>] F hvm_io_intercept+0x2a/0x4c
> (XEN)    [<ffff82d0402b5357>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29b/0x5eb
> (XEN)    [<ffff82d0402b56d6>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
> (XEN)    [<ffff82d0402b6bcc>] F hvmemul_do_pio_buffer+0x33/0x35
> (XEN)    [<ffff82d0402c5e80>] F handle_pio+0x70/0x1b7
> (XEN)    [<ffff82d04029dc7f>] F svm_vmexit_handler+0x10ba/0x18aa
> (XEN)    [<ffff82d0402034e5>] F svm_stgi_label+0x8/0x18
> (XEN)
> (XEN) d0v7 bar_write Ray line 391 0000:03:00.0 bar->enabled 1
> (XEN) d0v7 bar_write Ray line 406 0000:03:00.0 bar->enabled 1
> 
> Thanks,
> Ray


