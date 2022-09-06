Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4255AF707
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400181.641848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgI4-0002ZU-Gy; Tue, 06 Sep 2022 21:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400181.641848; Tue, 06 Sep 2022 21:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgI4-0002SU-9Y; Tue, 06 Sep 2022 21:39:28 +0000
Received: by outflank-mailman (input) for mailman id 400181;
 Tue, 06 Sep 2022 21:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgGC-0000Cs-AL
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:37:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a6a3d4c-2dc1-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 10:53:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 08:53:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 08:53:47 +0000
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
X-Inumbo-ID: 6a6a3d4c-2dc1-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvErLYQQOBZ1sX5nKBS3NXhTFftCGnxNIf+yrLjlvz4rCni6mQRQ9P6VMqdb/rn7ZPN0i2gxYO3BP0qsTVkHfzWMiI7YgrdAS/xJccvlkOJJAvNWMysHrl011EP+DnGXUF2twwm4LVxnwmmgOIbZdV9DrAYhTZBHsLm6yRkKRZoVpTuk2/KjNLtTRq5bWLywdUMp5btxh5MO71zqn2lqCUJ+ckfP56cFMkj39yPmF4vOlAJR/WyJpjEhboaiUxTjebhwVfCJWZs77vud1GwHvzEGBR+XwG7Lm4xjcmaUPRdpY/ZMC3HMl2923lJUdp3GJj27Z+AroZ+CulSfP4UFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFe3S9fToKmfWXmXNYX7xeWC318ja0UwmItRMLycIc4=;
 b=mvTonxikV52o+rmA+vgh2sVj0oeRPQTnR7VG53CirGwcrn8fm4e4Zmp5DUhlNy2lql5B2PPU8EHvLXIlmlrHdoT/8LqsfhYECXoSOmNg2HKoTKMQUCQ9qB/irYyEsC97tSNrbFq6Tlr/C4FXHCDEtnl+0pa0tr/utZI0C/Rj75LpWJt0lf/UjP4Oy1qzLG9Kj58N5gf7pdrA5XfTqXjkflBXCF4+nUEGoP1VGJdlbKOYLDS72mGaIZTXcTygDOCapBJD3Y4g1W8+73y7HLMFqCH5XtIPnAOjRniQxPBUvCsxRtnuEsAYnPVyk/wf6vh6XeWjgx+Tlib7F0WD4b8QjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFe3S9fToKmfWXmXNYX7xeWC318ja0UwmItRMLycIc4=;
 b=oeTiUCOnW+6vxP98ZkPwrpaRlYB5OaaqL3EgWM+2TbyDnID2CQ8J62SwBLwb8WPC7RZpy8qHIWTM7dcuHXAAlM4YR+F0oTLQXu/P5dm/5GW2y9eJcS1CDSWx+tnu8CUL8Gkqzlbc25ja5rYdQS/c0w8PFnXExHfNj0XYB8LqQD+DZdtHUqTpT5DXjGb8OTIzY1vhmqCiVImmIEk/L95zKZAbMeMGOWjk493ABFaY5XZ6U75mNA0ypsyDPco7HpzxlPMUWqaKVu6LMazUjpt8HKmrRryj8T7+QgHSAxnf1lyOOqZTEDR2yg79117HfPmvMnPC4umpjE1u7YBUpAxmIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f40f1ac1-fe19-9d62-06d0-b049d4edcd85@suse.com>
Date: Tue, 6 Sep 2022 10:53:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, Rahul Singh <rahul.singh@arm.com>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021719270.3931@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2209021719270.3931@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48d37ba7-b010-4506-a1c6-08da8fe54ff3
X-MS-TrafficTypeDiagnostic: PAXPR04MB9201:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nz+BfkijkhDianvZGoT3Rr0HM1bECrgkKAb1leHHfIscEnlkFZ7muxVWF3jkwD0Ra7ZewEjkk0dBGKkCTCO9KaNzC1Ewd+4tiUvd4eAiiemgHlVdjygqW42Vb1rPLnoTjxtc/eLcD0oUb0SFMWkuteGm228dpeoDZ+iJenZgiadw4hxeZVZHTPJjgTr/jdrWk+Ds0+VfcFtQ2lhcG/2l02SAdZGHDEwdht1Z/ljcsiK3InbcnmLLTx7c4bUChWiEhry00mzb+KgqsLKGqf2kCiIlPn372KgHUUWeSrw5gtvBaTIPcmlwkFaE2QPxaH0shN7wi7PWM1P3jb/qTPiCCcwilyUGeU2jUtHKiTSeNRRQo1bhqcrhCnfLZwCVWOlwe9X4ulBNsL3ULuQazt9YjgCYTqTOBs6YT5i+a+WybW6OrcavCxU/uAQ+JaLPoDHpLPXxJRsApT5ZcXdp9fObxfm777kIqoEueoJw/GBwhrXsNb0Q5lC5b8sN0KlIyQoswyVb6jKaHX3Dmwo1jx6Q98ZknAsUMzf4/FagfDixuakBqVU/IBw1GtfIET7BfmCQHVBDYjBxuvxwYLZcqjAWzWD9tfDbngEoKlnP15RCLT3cOwpJbwdznjeRqxNvN4P1sUHKnzYq6mClchGtwLckdUUbNKkPSxCzQVrkrEjQIsIOhbN7spqKN2Pp48CY05htuH5a9MpklXV+Sl+JyGp9CvQpy91LciDPDcZe20FKcj30lCudHH0uG3H+7+pDXfQmxSbzIEncbqEobCC2XVgxteQA1Vtkg3/deceEhHxr7bA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(6486002)(38100700002)(66556008)(86362001)(53546011)(6506007)(6512007)(26005)(66946007)(478600001)(316002)(6666004)(41300700001)(54906003)(31696002)(6916009)(66476007)(2906002)(31686004)(186003)(36756003)(5660300002)(8936002)(4326008)(2616005)(8676002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTJPQkJKSUxZQmcydzdHRlFSZHZYVEpFNjZCdGhXZDIyVkdMQVAzWVlZaUVk?=
 =?utf-8?B?bnM5ZUNlSUJKbzNZd0drUy9SbTBkTkFrZEFocEp4Z0MwbFk1OTlTWDhabjYw?=
 =?utf-8?B?bGd0VWlJKzVyNVdRdzR6VWsvcitmRHF3d3ZxOW5nUWxWSDhTeVBhK1BYU2tJ?=
 =?utf-8?B?cERrbXdzU0U2L2V1SlFHSWpRNE1MSFhDT3YvT0NJU1BhQ285YlBnLzFJYzFN?=
 =?utf-8?B?Q1l2UXhWS3BuKzltcGczcjVhVllXdzk5VC85dHJYNVRpT01TUFZadWdHVGd5?=
 =?utf-8?B?Z0JwbVoyWlFTVGU1RklpM203OFhRTlV3dS8rZzFKWXBaRjZhN2laRml3eXlP?=
 =?utf-8?B?RjBVb2kzeEhZRGZ3QUJvZUwyNURWY0dESGJCVFJlblcxS09lT2FORUJvVVlH?=
 =?utf-8?B?TzB2M2puRDZ3MWhuOW9uNXd4NlExTkxreGZWcTBGQ0lGMUplYitseUh1N2Vr?=
 =?utf-8?B?L0YrQ280bUhNSVVxUDJnb2c0UytoQzBiYWhqQjdwNmZuNHhGdElSTzRXcTI5?=
 =?utf-8?B?ZVF0TU8vLzlDQ1c1U2FlUm9ENkg5NUNSWlRlZUFpTVZJUzgxUDhaa3p2eko3?=
 =?utf-8?B?dzVnRlhDQW9aV25kOXhVNWptZ0FqS1BLSkUyQW5aY3N3Ti9HQlM5biszVVA3?=
 =?utf-8?B?YVlvM0ZxWXdpeWRRbHVmWStBYnU3VUhDQTdwSzR5U3BUMmdDL05ROWVNNmsx?=
 =?utf-8?B?TVRsTFhETEppeFZTTWVRc2trREFyTXVXUXVKTlpQWFFOYnZHLy9VZ0JiUFlO?=
 =?utf-8?B?ZmlFejJNcnh6d2RxWVM1MnFJT21ESnJLN0drN2RLaVdhb2Jha1h1RytmSWNY?=
 =?utf-8?B?ZU9JcUVkSWFON2hWTmFrbkhGRm9FSEIvSnBDcE9GcWlRMkNudXVIYXIvL1hD?=
 =?utf-8?B?amNlZXh2S001TWlSMVo3c3ZhU01scFRFTEdFVHNhMzlSMWk4N3NSamc0L3R3?=
 =?utf-8?B?QUtDS3lRN1ZETHBtYmZKWnA3NHRoZ3RaQktuWEVDb0NIQWVISllxTTdwb0RQ?=
 =?utf-8?B?TFZFUUwwc0xzZUxqVGFveitsSm9JRjhnOU5SVXlvaDhUYzVCT0g5bWFNRGdE?=
 =?utf-8?B?cHFVUzQyR0lFR0J1MUVHNlJNNFpPRjFTbDdUYkVkMHlrZFFVSkcvcGxnb1U2?=
 =?utf-8?B?c1Fsc1FMS2UrdDE4NWgwV0J3akN0bkdQS0wvUlRZVFhkbXQrcDRLZWx5ZFFC?=
 =?utf-8?B?ZTl2c0ZkOFhYcm5hK1NtS0ZKRGRXeTh6THpSQzJoY1pONklxaExzOStmZnhy?=
 =?utf-8?B?ODllVVJkOStaTGUyMzUxR0V4WUlZNmJXbzFYUEhBK1NXL3BrMTdJME85ZitW?=
 =?utf-8?B?YWMvWnhScE02WWFmTnJmci9Jc2g2RUV3US94U21KcEE1NENZRC9kWmJ4c2o0?=
 =?utf-8?B?QWw2TDQ1cG1aOHg3QWY5SUlrekxRWk00Q1pUZ1lVa0dHZDZyZFNoTnprcDVT?=
 =?utf-8?B?YmQxUGt6RzJ1L3VpWHdNeFpPbEtOL2xRTmlLM0gvdncrMCt2bDlPVkJQaW01?=
 =?utf-8?B?eVVjSHJNQnJrbmZPajE1UGlUVHR3M0hMeUxmS0J0UVd1bTBQZlZpd2hkcXNo?=
 =?utf-8?B?d2J3bHVwQkkxZHhMZGRnTGVwQzZDTnY2SXpvWHVFKzR5SHVmNys0dmIwVE9q?=
 =?utf-8?B?RUFMRE0vZHUwT1FmbW9qVlJhcGh0dkU0MGtEdFVlUU1McnpFQWhXbHRvc2No?=
 =?utf-8?B?OWVDMTFsYk92bTZhVWRFbzVkNFJlVmhXQ1Mvak1yTUQ4V0lVTGVKRHVLdStC?=
 =?utf-8?B?bnJUV0MxZE84Q2ZvZFlIZEtCS01BYTVHcDVFcU5qKzBPaVVsajhqQnVBWkRy?=
 =?utf-8?B?UTdxaDdvOXk0QVRpY2c2Vm9kSU1OSnMyeStwWlRuWUREQjBDZTJTSm9MTVpv?=
 =?utf-8?B?S2J6TjRsYzFlRXVhR2V5Zzk5TldFcHBWVmdSYk1GcWYrcUNSNHlVNTZIb0hS?=
 =?utf-8?B?bGdVYnFDcmV3ZVUyaG5NRE9lS3gwQ3lFR09keEZhNWRGMHJ1K242MklETzdF?=
 =?utf-8?B?YmZHbFlBMkdTWUhEb3I1Rmt1aUl1Szh4WkxHR3BIMHBHWEpkY0dRekJhMDVi?=
 =?utf-8?B?Tk16c3Y2RUdkYTZpRWlHaTlVM0pRMWVJTXArbGoxc1F2OE94bnJLOW1IZWZ3?=
 =?utf-8?Q?m6VsS/X2UFJ1LPEfPM1/Fdr49?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d37ba7-b010-4506-a1c6-08da8fe54ff3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 08:53:47.8933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YI2GbW3w7bJQh1tJuj4xy+ocMrMRKGq74IfhU4cSHI7bddY+aTXTms0+c4V87TSpI+Z9bXR0Rv6MmT8ze4l8Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

On 03.09.2022 02:24, Stefano Stabellini wrote:
> On Thu, 1 Sep 2022, Rahul Singh wrote:
>> @@ -363,6 +373,39 @@ int __init pci_host_bridge_mappings(struct domain *d)
>>      return 0;
>>  }
>>  
>> +static int is_bar_valid(const struct dt_device_node *dev,
>> +                        uint64_t addr, uint64_t len, void *data)
>> +{
>> +    struct pdev_bar *bar_data = data;
>> +    unsigned long s = mfn_x(bar_data->start);
>> +    unsigned long e = mfn_x(bar_data->end);
>> +
>> +    if ( (s <= e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )
>> +        bar_data->is_valid =  true;
> 
> 
> This patch looks good and you addressed all Jan's comment well. Before I
> ack it, one question.
> 
> I know that you made this change to address Jan's comment but using
> PFN_DOWN for the (s >= PFN_DOWN(addr)) check and PFN_UP for the (e <=
> PFN_UP(addr + len - 1)) check means that we are relaxing the
> requirements, aren't we?
> 
> I know that this discussion is a bit pointless because addr and len should
> always be page aligned, and if they weren't it would be a mistake. But
> assuming that they are not page aligned, wouldn't we want this check to
> be a strict as possible?
> 
> Wouldn't we want to ensure that the [s,e] range is a strict subset of
> [addr,addr+len-1] ? If so we would need to do the following instead:
> 
>     if ( (s <= e) && (s >= PFN_UP(addr)) && (e <= PFN_DOWN(addr + len - 1)) )
>         bar_data->is_valid =  true;

But that might mean (in theory at least) a partial overlap, which has
to be avoided. The only alternative that I see to Rahul's original
code is to omit use of PFN_DOWN() and PFN_UP() in this construct
altogether. Assuming that's correct for the passed in (addr,len)
tuple.

Jan

