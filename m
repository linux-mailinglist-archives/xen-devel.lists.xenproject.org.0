Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C96C6A89
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 15:17:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513898.795614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLkA-0004dD-O0; Thu, 23 Mar 2023 14:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513898.795614; Thu, 23 Mar 2023 14:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLkA-0004bJ-L8; Thu, 23 Mar 2023 14:16:42 +0000
Received: by outflank-mailman (input) for mailman id 513898;
 Thu, 23 Mar 2023 14:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfLk9-0004b8-6x
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 14:16:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 537d1a5a-c985-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 15:16:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 14:16:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 14:16:36 +0000
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
X-Inumbo-ID: 537d1a5a-c985-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a73OuqHavSglcqbXVCHWVzs1ltClqYBv6JnTrcn5N4Fs5wsUF6k8B4gsju6Kp7rwUiXFw9gJOK/4t7/Lq5W1tfNY7wVCAwIQKmC97dydVRxdNBV+8b3J3piLRiO8fDlEsBQSxKaPehdyFAHKLOhXvZHtgwbFuQU5qEHEf/qWycjM/egRdtNopZ3zsoXOAwuNhAe2Ah49Xhoqu16BbcZgyGGtwxDDHu87YOdIz8qX+M7NVmgOXa8E7iwEMkg4lVDRTd8V0vHCymY37u/3kP1nNPGlWSfkemyDYzYQRfZeRaVi0cphifpBViz5t9CpvcZBXUgCspDXwBZEjSlz7G3JcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUyjMcmvYNsZDkA1+BkT4lbGAPxMzajNbEm0LFnJUu8=;
 b=cvEKTLPif323MrASwIWpdAlVri2KzFBZasVnh0F5y3kmDUCHHh8c90cR+Hmfmk16uyfAxU1DoEtGoPetiLrMkGBEbaqYu3X7DEVhyyQo9fvFgb8fBFXC44Z5eBqlULXxKReksburwC83xLLPaniWgHBTWmresQi30FmAN/S3WNtfR+MGXxE59j1HyBxo38HtKBEZ4XpdNrNd9bKruaf+0TeeODmPwDkDE70MLVuKFXktWvPAfH4BE28+mYaj+ILddkBvn48SDhbepTDTf3Wj5V8YE40jUEZnreLxtoG/9+0lnjnG45eQ13itlmhHzs/EAXdvoTbx1n0sb6rhwxDGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUyjMcmvYNsZDkA1+BkT4lbGAPxMzajNbEm0LFnJUu8=;
 b=36q8FDlBmSCpvwSkRYXjCT73E2mex6/v2CQLA4xTZbWU5Mqr5nW5bozWYWYTXjUE4eT8Ac0ykQcoKjlqy+JxxMtkxlHBgP3yVmF870vnNkxtZhTQkE/j7FXvd4Uy92GJ/Ht2gZWRTNtopDT4eGG5D5EE+eDCXCW6pv3R1Im0rO0LYS9sdASvKbmdy6YP5qAS25jlwIoGAVwu84g2aEOSzxTcDNqrEpyUAA3EHKh6zSQTgv5eSR5qOwHQRXoicDihzWWVCFUcacO6E50S9exFH8NHApOyGcXkaZREp1196ndJ33uNwjfSRXD7O1d0XpNUfwXCCdW4lwJn3UO54Nfg1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6730d092-f31c-a30b-322c-c5ef7a06d748@suse.com>
Date: Thu, 23 Mar 2023 15:16:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com> <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com> <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com> <ZBquOn8x7IyI33Pj@amd.com>
 <ZBrLsRebAYaspHrK@Air-de-Roger> <ZBr1k/B/ve8NNqaJ@amd.com>
 <85aa668d-9614-a80d-8f44-174ecbdcf1f7@suse.com> <ZBwpS+WD/mK40Qx2@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBwpS+WD/mK40Qx2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f4686d-00f9-4a9a-4686-08db2ba93655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	otu2gS+p5YAI29JopLWbXGeN5HLa9d1usIXdckRTBcC0/kX6Nf8oMvss4H3qUEuIiwPW/gmwaAmBC6pDVoTefZiLuio6AHQ08c1bST071d7v2c5JFhToPc95XzZ7NWmqQyduzx24W1SAyNWYrNzTxzteM1lS4/QhfKKx4KbCOF26bjjaZsrRHSQ5cgAYOqeJKRJr8eVsmciWRfrvnfZ4xM3F3wNHvGBRVuPsASgrPxyCcJ2OpwEvVoUp9uw+y6vvinfyd/kzGeLv1sTPnDkhy16VuDfBqa/SLAeIWRISJsZpbLNNIIh8w18XgjYGk0+EJ0wFdtKtcZleXDti2P2zr1JxZiwX4pj5+xT5cNIFQPeHN1rzu6Al/Js0W0Fh1h2ZHQrFDNwhp0wWu2eD9gj7KsZV6DsdHSPLNU6ZD90ffXNCrZYQ5MJZTiRiHBQhRkcnO/HDHO7A7AkfX58Jb07EX983jvrvByr/IlSLOj6t9X/hiUQczQDKUfOZDieWrE5J0mS6XyKJh6Jb/hoUi0cojXY1XnVJ+nWbJuOx2AZF5lF19JN2vH2qx+RNjWilBUWOFVQoIgtqlzNzZYF1B4s2goH14fPZ03/C0EqnHcOGE6KFBwBaOo5W89tmVsMHMdt+ZlIYX+6ujEIxw/uEM3XZLPnOwDZTx0fpIjpPIqj5T+VV+nusrd2qP2/bWVt7Xs2WjQ7KW1zBza6tAfv/AAhX2WtbjwR6lE0AMyw4XNepfoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199018)(31686004)(66476007)(7416002)(6916009)(5660300002)(4326008)(41300700001)(8676002)(2906002)(86362001)(31696002)(36756003)(38100700002)(26005)(6486002)(478600001)(316002)(66946007)(66556008)(8936002)(2616005)(83380400001)(6506007)(54906003)(6512007)(53546011)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0lhaURTUjU0Ulp3NHFqd0thZlA3QXBROFFEUmlyRUdRU29zWnJndmtwOTNW?=
 =?utf-8?B?WFRzczEreDNSZHVyQXpHOXh3NDVSOFhPKzNZdkZ3Q2djb0FmdmdLT3VBUmM5?=
 =?utf-8?B?VFZJOXJQcUloUmtHbGZzVm51WHB2Y2c0OEgvS1pqUCtxYm5ySktqV3BrNEZ2?=
 =?utf-8?B?TXFja2Jwc1dZRGh6ZWs0UzNqVS9kVlR3SFNNOCt2NC9NRkpKQytmSjZZZm5Z?=
 =?utf-8?B?U2liOUZEdHExZ09XdUtxaFVaSFdEVk82NFc0cW1GVVMvZHZPdEhWSU82L2Fn?=
 =?utf-8?B?Y2ZOblhWbFRwQjI4UHRjZGpYTnN3TmM4MDVkS2pJamRUeHFMdDR6QVg3OEl1?=
 =?utf-8?B?dDAyUzJDVmdQOUN4RWU0MXV2SXF1UHFoUGJWY1B0N0VaQVZEWFhEbkxURlBz?=
 =?utf-8?B?NnJlZnlVQlZZQ3VJYXVEejJvV3lrZ25HNUFGZWowR01yeG56TWEvZm1EWGlP?=
 =?utf-8?B?a2dUMDFnUFQ4S0JpczFqZWc5YUM5RVlFNW5FRUs1eVUwOCsrenN3VTNncm9x?=
 =?utf-8?B?TFR4bWRyb29IZzlsTTViUk0rN3VCbklrOFpCNHFINWNoQUtBR0NyY1JZMXJ1?=
 =?utf-8?B?SWNsQ3ZJTXhLSkVRVjJTN2Z4N2R4WUhJOEFHQ3hXcVpHUEpJMW9tZU03VG9j?=
 =?utf-8?B?RzZ1T2cvekhiRjBhZi90Ry9hMThyVnZyRXJkeTZJMm12WlU3eTlpaGhuUTNz?=
 =?utf-8?B?QzJadVRSL2cvclAzc1lGSS9xb0dvZDVmdDYvVzdIWEhqeHhGdTlrUWlRN0xi?=
 =?utf-8?B?TlpNRzBEM0l2dCtWZjJaQWROQ29kN1VrejdMRDYrdGNuZG1kWmZSL0prOE1h?=
 =?utf-8?B?cG4zcUk0bFkwUWloc2FRdWVGRWR6Z1o4NEhNTUZsZTlHaEtSUUtHS0NrNFkv?=
 =?utf-8?B?RG8yNXV0ZXUxQ1JRQmpjdlJmOWx5L1NDZ1d1UjNiR0JMYWxZUk1lZHhUTU5y?=
 =?utf-8?B?L0FoekpYY3hwcFU4dkJ6RWQxMnBhTVY3NFRUUjM5UXZ3SkwvbTFXT2k4R21B?=
 =?utf-8?B?aWF6dDhINTlDay96TDJYVFFWL1h2K1JVSi9YbXF2T0hNaWhRdjhuLzA1V0tx?=
 =?utf-8?B?OVhDQXRDK3NjdnJyenJQMWkrUUU2ZTVIVmZwVEFYSXkxeHBETHpOM3NpM2cv?=
 =?utf-8?B?ekpVRFdGazBXM2t5NWhlTlcvMXpYazQ4cGlLWWpSbVFwdllvbElvNDgyZ0xR?=
 =?utf-8?B?dWN1VU9aRlJZTVh0U09McE4yY2N6akdGRm9HQnhnR281QUNNWm42blpKMy9P?=
 =?utf-8?B?NVoreWxObjZrZHp5QStkM3RyUTM3cFF2dmk2bnprUzBOeU91dnlCQVZJd1VJ?=
 =?utf-8?B?TU0zeEM2a2k1K3RNZk9ETFlQMzRzdzlRWmxQNlQrWFowYVdTZU4vbnRSamdV?=
 =?utf-8?B?UlpUK0RlTnBtOGpRb0pTQnlhdVVSRGZOT3owMTRXRTZiZFJaaU12Uk5Mb0s3?=
 =?utf-8?B?NVI4dllqRHZjYmdEMzliL1BsVnFjajNsTzhQRUIrSzA2REl0VTFwWXdCUFhm?=
 =?utf-8?B?OXBNTVNCaU5NWTZLT0NhbmxydUFYN2h2RHE0K1Biejk4dHkvVzB2d2Z1SzhR?=
 =?utf-8?B?LzNNK2NIRzluNFJUSzJ5NTBQa2h6Zk1rZnZ3b2lveEVRU0dNcHpDUzlVRnJL?=
 =?utf-8?B?VmlvV2M2TTdVV2Q4T2RyTzlDVnM0cVZRRTl5anBwTUFOVWVsUlRmdzZnclFr?=
 =?utf-8?B?RTdmRm0yUnczc2lUS0REQS81VjlzNnRDYmt3U1ExU25nV0VrV0VaZzZTMFE1?=
 =?utf-8?B?NmxsOHJUdWVaRWZSUVFhTm5BSmM0TDU4VjhpY1dzSmJ4c2VGQWZ6NWdiazIr?=
 =?utf-8?B?SzByMzh2Zi9qOEdBMXgwaHpnanB3YWhVRFpOZWpoaDBLZEhndVlFTGg3QTgw?=
 =?utf-8?B?NWdLK2krdmF3N3FGeTFWSi9ZLzFzelVBNEZmMW1KenJSYVZIVzhJc21kd2ZG?=
 =?utf-8?B?VnNERVltTGtjOWlZVzkxc2hWTWhvbHUvYllMdnJoWm5ldjBqczFraWwrOWJh?=
 =?utf-8?B?MC83T0lMNmxNcFNWeEhrS3NYKzVXWkRwNWdVdEFNOWJ3RTdGK0xCbTN0QlRL?=
 =?utf-8?B?MnlycDhGRy9CSjJzZjdob1AxWUpvdHE4MlpFeE96NHhuOHdJb3BWRkd4bXlI?=
 =?utf-8?Q?qtn4jKxzQMAOlJIb0JcBcvjVp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f4686d-00f9-4a9a-4686-08db2ba93655
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 14:16:36.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHaKEBnEOPiApBS0Sr5QU1LBo+U23TM3GrxA5hD+DtK1m7rJExHzw7WVUJk4H2koMNxX3ZR9yIR2Z9+pqKImxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

On 23.03.2023 11:26, Huang Rui wrote:
> On Wed, Mar 22, 2023 at 08:48:30PM +0800, Jan Beulich wrote:
>> On 22.03.2023 13:33, Huang Rui wrote:
>>> I traced that while we do pci-assignable-add, we will follow below trace to
>>> bind the passthrough device.
>>>
>>> pciassignable_add()->libxl_device_pci_assignable_add()->libxl__device_pci_assignable_add()->pciback_dev_assign()
>>>
>>> Then kernel xen-pciback driver want to add virtual configuration spaces. In
>>> this phase, the bar_write() in xen hypervisor will be called. I still need
>>> a bit more time to figure the exact reason. May I know where the
>>> xen-pciback driver would trigger a hvm_io_intercept to xen hypervisor?
>>
>> Any config space access would. And I might guess ...
>>
>>> [  309.719049] xen_pciback: wants to seize 0000:03:00.0
>>> [  462.911251] pciback 0000:03:00.0: xen_pciback: probing...
>>> [  462.911256] pciback 0000:03:00.0: xen_pciback: seizing device
>>> [  462.911257] pciback 0000:03:00.0: xen_pciback: pcistub_device_alloc
>>> [  462.911261] pciback 0000:03:00.0: xen_pciback: initializing...
>>> [  462.911263] pciback 0000:03:00.0: xen_pciback: initializing config
>>> [  462.911265] pciback 0000:03:00.0: xen-pciback: initializing virtual configuration space
>>> [  462.911268] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x00
>>> [  462.911271] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x02
>>> [  462.911284] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x04
>>> [  462.911286] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3c
>>> [  462.911289] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3d
>>> [  462.911291] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0c
>>> [  462.911294] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0d
>>> [  462.911296] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0f
>>> [  462.911301] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x10
>>> [  462.911306] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x14
>>> [  462.911309] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x18
>>> [  462.911313] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x1c
>>> [  462.911317] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x20
>>> [  462.911321] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x24
>>> [  462.911325] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x30
>>> [  462.911358] pciback 0000:03:00.0: Found capability 0x1 at 0x50
>>> [  462.911361] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x50
>>> [  462.911363] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x52
>>> [  462.911368] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x54
>>> [  462.911371] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x56
>>> [  462.911373] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x57
>>> [  462.911386] pciback 0000:03:00.0: Found capability 0x5 at 0xa0
>>> [  462.911388] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa0
>>> [  462.911391] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa2
>>> [  462.911405] pciback 0000:03:00.0: xen_pciback: enabling device
>>> [  462.911412] pciback 0000:03:00.0: enabling device (0006 -> 0007)
>>> [  462.911658] Already setup the GSI :28
>>> [  462.911668] Already map the GSI :28 and IRQ: 115
>>> [  462.911684] pciback 0000:03:00.0: xen_pciback: save state of device
>>> [  462.912154] pciback 0000:03:00.0: xen_pciback: resetting (FLR, D3, etc) the device
>>> [  463.954998] pciback 0000:03:00.0: xen_pciback: reset device
>>
>> ... it is actually the reset here, saving and then restoring config space.
>> If e.g. that restore was done "blindly" (i.e. simply writing fields low to
>> high), then memory decode would be re-enabled before the BARs are written.
>>
> 
> Yes, we confirm the problem is while the xen-pciback driver initializes
> passthrough device with pcistub_init_device() -> pci_restore_state() ->
> pci_restore_config_space() -> pci_restore_config_space_range() ->
> pci_restore_config_dword() -> pci_write_config_dword(), the pci config
> write will trigger io interrupt to bar_write() in the xen, then bar->enable
> is set, the write is not actually allowed.
> 
> May I know whether this behavior (restore) is expected? Or it should not
> reset the device.

The reset is expected. To expand slightly on Roger's reply: The reset we're
unaware of has likely indeed brought bar->enable and command register state
out of sync. For everything else see Roger's response.

Jan

