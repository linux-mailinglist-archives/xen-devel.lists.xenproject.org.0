Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D638C7F77
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 03:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723733.1128777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mEN-0003gG-8c; Fri, 17 May 2024 01:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723733.1128777; Fri, 17 May 2024 01:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mEN-0003eX-5u; Fri, 17 May 2024 01:17:55 +0000
Received: by outflank-mailman (input) for mailman id 723733;
 Fri, 17 May 2024 01:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mIz=MU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7mEL-0003eP-H7
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 01:17:53 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46efe2cc-13eb-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 03:17:51 +0200 (CEST)
Received: from BN9PR03CA0709.namprd03.prod.outlook.com (2603:10b6:408:ef::24)
 by MW5PR12MB5599.namprd12.prod.outlook.com (2603:10b6:303:194::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Fri, 17 May
 2024 01:17:47 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::68) by BN9PR03CA0709.outlook.office365.com
 (2603:10b6:408:ef::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Fri, 17 May 2024 01:17:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 01:17:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 20:17:46 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 20:17:44 -0500
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
X-Inumbo-ID: 46efe2cc-13eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bs/Q2jv0yG8Cn7b+ptGujytF/rTmER1KRPEPyDGmxgmaNf8utFBfLzP+zhX6knag0xmb5L/cZ0xVIp5z15HKxC5uZuaZd2R5PhVPHx3ztQNLSG/tnWmUQQAV3qHQLnmwFPUGqJvB3MXENzoqro9I6JkYkcAfo8GZwSR9SJHPk2wcV8I0KFw+lB0cihQyc0jqhMZUSCiKryeHmFK93dRBYy48NsfY5jlermTP5lP4HjhlsCeJyDYVq1lUVRIy9mmhpea1vUn4w+ecZ0Sdznie/KYVwPz86L50tI5Nxl7gynSP1VthMpbKgjPkvUWaBjqUhNP664R+GzrkYycVKioe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp85KC0psuXALGt1cPe+mlXd7lcMqilrHi8mw7kjljQ=;
 b=PeEQBbpWtWNRLigApQDsH77U5eonflQ7bbYX++NCiWED+FRfsC/1OpNdA2DyQ4zPVVNPwgtw/Kt6vqkXRlV7RsXA+0f/Kn+SuXydLXTDYQxzVo56pbmFkc7hoiSH7YC8AH1CjhUOrIfA70tsZKmwFq6+4kpc5G0KuTXYwP9oort+RRdXOHxmOIK+zqDGul4hTbND/WpAitWW+1n5nd0xgqaJBbJVqgjLwwRGNLzitw8Cx5isSiSUUFWEK4/k5x8hWj+m3dMw1lo+JyT4JHv/rwAcf0tyGwqz17gHbv8OAdHyVoI4KV8ezAQm4rph49dccgir4zLiTfPM9+3mtFK2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp85KC0psuXALGt1cPe+mlXd7lcMqilrHi8mw7kjljQ=;
 b=PCBlgm/JytrDJ/4YOM67Mu/tTNpBvhOpYuiLekWU15SMbdKp/HWRyilW/kj8uvHjISrKw2fQruigUbpY4orYgncI8rp/YpKcLOoLP+AcC+nteKWzdPmOE8kbYzzU/uaQUzV7s5c2WfDDFPi8gweGyL5RkjT2dxuPue0zMrkpEVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1539e7ab-f27f-4cea-bb79-4c341bb3c69c@amd.com>
Date: Fri, 17 May 2024 09:17:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/xen: Improve the late XenStore init protocol
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Juergen
 Gross" <jgross@suse.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Michal Orzel <michal.orzel@amd.com>
References: <20240515014330.1044617-1-xin.wang2@amd.com>
 <alpine.DEB.2.22.394.2405151524270.2544314@ubuntu-linux-20-04-desktop>
 <028f29be-0393-4a57-83e2-ea27fe0320d5@amd.com>
 <alpine.DEB.2.22.394.2405161743170.2544314@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2405161743170.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|MW5PR12MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b122ba2-0dff-4fa6-5dea-08dc760f293e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TG9NY0lrajJjZ2Ezb1IyV1dzdDJBY2dCbTA5T1llckVzSnJjb01HSlNCcVAy?=
 =?utf-8?B?d2dCMUNKMTk0WS9ZS2RMenpkNzl4dUNaNEZ5U2JYU1ZkamZrQnVQcmZqako5?=
 =?utf-8?B?M05EWHdpbm52YnUrWDNYbkRrVmhZS09lNVlhZ3htTHltWFhJUGhrS1Z4cVlH?=
 =?utf-8?B?NGt6dTVyWXNndDZOdzZkWGw2TlVpcGVDblRLNHhqelloOVpJNjdRS0ZrYkVR?=
 =?utf-8?B?dk5rellRbnlYSmlhZE96R2orL3VINjZ0V1pXNS9Ra1llMFFQOStzdll6eGRG?=
 =?utf-8?B?bzlDd0pzN05zR0U5c1h5bG5LNVBRWGd0c3RORE8zdS9Wb0s2bndwZHhpV3RL?=
 =?utf-8?B?Z2xPNzI0V2lsR0pxYUUvVC8xOWJ4Y01EL3JGWDF2M3VMZzVxRVFxemlJQkcv?=
 =?utf-8?B?RHF4TFR6Z0dSMXdJUDhNTVdOOG5CbjNtVzNyTVpqcU1FaXp0d3Q5KzBpQTNm?=
 =?utf-8?B?eElidTFIUmw3bjArbUtHNTQ0QklZQUFrbkxLMk9tMEY4Mmxnb1JvQlZZeC9a?=
 =?utf-8?B?VjhpRVBpc2h0emtFTVhzUk5VTW1meWFUdURCNEY2TGNYUThNWGx5dVJNYlNq?=
 =?utf-8?B?S0NhZ0xETU52Z3pmcGI2NUxHZkdBOThLOWI1MlM4ajVtMjhnVUs3Y3lkRmE4?=
 =?utf-8?B?STYreHpQSEhkQzZiWmt4OWlobkVYK3BqblB1ZGNJSkJabWlvdjFTTWcxWDRt?=
 =?utf-8?B?QUgremlxanBNaEFvVHVzOUxuYkEvWGZRME9YYy9LUzJBZzRqWmtnbWJKOU12?=
 =?utf-8?B?WlBpNkh6QUF3UStzclgrL1l5UHdqK2g0andydVhJNGJLQnV1RkFNOUlmWU1N?=
 =?utf-8?B?aTFwSGw5ajhKaW5Oc1VlZXJ0aCtNeC9DMklOalhMUU1tYXBRNGduVTBPd2Fz?=
 =?utf-8?B?UVdrSnpYYXhQRGlWYUhDQXVLOElrTVdnYWpKZ2pwYkVrQlhzSzQ4TThTclJi?=
 =?utf-8?B?a0RxYWVOWHFPdVVXVU1QazNuVktlRzJCKzZqRW1TS1k0Q00rb2ZVVEtFYU1p?=
 =?utf-8?B?Szd6bUVoVUp4NVNhWitYMThEcWdWd1JaRGlmc1h2ZEZNcENKWXl6NTk4b0Zi?=
 =?utf-8?B?dE0zNlB1ZEJRTnJUb2ZrSW5WaklyTDFqSGQrTDM0aWJWZzZhKzJTa0ZRcEMw?=
 =?utf-8?B?RVljbXkrbXBYbVgyU0NHbG1Bc3VvY05RdFZjOS9qdTRrbGl5ZGd6UU5CcGUv?=
 =?utf-8?B?VmR5TVlvR0hFaEdqUkdnNGRkWm5ueENHbEkvQS9HWG4xYVAxTWtzUlo2T3A5?=
 =?utf-8?B?NjdEVHBRQk91dEM5NjF0WUdrRUl2YjNMK2FoUmpxdFcxY2lTYkR2QXQ4dDdw?=
 =?utf-8?B?WXRzNmRMU1pzU3gyS1B2ZDgzeUJvdWd2dWpXSzN6VDY2VFdBdnE3VjRqTFM1?=
 =?utf-8?B?SWxod2syZHFIQWExWGZFdXdsencrWThoNXVMYllsejExdFViN0hid0ZJT2Vw?=
 =?utf-8?B?Z0MrMmdZTy9ZZVhVbG5XT1Z4R0E4eVdOYVArT1BINi95K2xDTTNxWkF2dC9p?=
 =?utf-8?B?VWFUWEZJQjVNTU5zaDl2L3UyUXcvTnpsOERGREtXeS9jRDRlNy9RM1RaSXg0?=
 =?utf-8?B?SnV6Q2xPQS85REl0VkkvSzhoNTkzZjBYeU4zbzIrZEQ3WkFqUWNobmtURjN1?=
 =?utf-8?B?RklJRWJMeFlDdzMxVFhNbTArYnZraHBab2ZubjBIaUlVdE1tYzVFUmtsdkdu?=
 =?utf-8?B?R2FkUnJObHkrU20wTjM0WW9hVlJhN1c0UjQ1M0hKV2lkcGQ4aVlncGtqUUU2?=
 =?utf-8?B?bXdaa2U1M2pFWnlzdXNUWGs3RkhsZGJ5SU1QeVliSG5PU0hRQm5yYlFZVnBl?=
 =?utf-8?B?Ump0ajlHdnVFcVNBUmxvaGVUd3dGS2tONDNSMWZOVE0xRG1iN2tKTHIxQzcw?=
 =?utf-8?Q?UG2kNWVV4kE6b?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 01:17:46.7839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b122ba2-0dff-4fa6-5dea-08dc760f293e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5599

Hi Stefano,

On 5/17/2024 8:52 AM, Stefano Stabellini wrote:
> On Thu, 16 May 2024, Henry Wang wrote:
>>>>    enum xenstore_init xen_store_domain_type;
>>>>    EXPORT_SYMBOL_GPL(xen_store_domain_type);
>>>>    @@ -751,9 +755,10 @@ static void xenbus_probe(void)
>>>>    {
>>>>    	xenstored_ready = 1;
>>>>    -	if (!xen_store_interface) {
>>>> -		xen_store_interface = memremap(xen_store_gfn <<
>>>> XEN_PAGE_SHIFT,
>>>> -					       XEN_PAGE_SIZE, MEMREMAP_WB);
>>>> +	if (!xen_store_interface || XS_INTERFACE_READY) {
>>>> +		if (!xen_store_interface)
>>> These two nested if's don't make sense to me. If XS_INTERFACE_READY
>>> succeeds, it means that  ((xen_store_interface != NULL) &&
>>> (xen_store_interface->connection == XENSTORE_CONNECTED)).
>>>
>>> So it is not possible that xen_store_interface == NULL immediately
>>> after. Right?
>> I think this is because we want to free the irq for the late init case,
>> otherwise the init-dom0less will fail. For the xenstore PFN allocated case,
>> the connection is already set to CONNECTED when we execute init-dom0less. But
>> I agree with you, would below diff makes more sense to you?
>>
>> diff --git a/drivers/xen/xenbus/xenbus_probe.c
>> b/drivers/xen/xenbus/xenbus_probe.c
>> index 8aec0ed1d047..b8005b651a29 100644
>> --- a/drivers/xen/xenbus/xenbus_probe.c
>> +++ b/drivers/xen/xenbus/xenbus_probe.c
>> @@ -76,6 +76,8 @@ EXPORT_SYMBOL_GPL(xen_store_interface);
>>          ((xen_store_interface != NULL) && \
>>           (xen_store_interface->connection == XENSTORE_CONNECTED))
>>
>> +static bool xs_late_init = false;
>> +
>>   enum xenstore_init xen_store_domain_type;
>>   EXPORT_SYMBOL_GPL(xen_store_domain_type);
>>
>> @@ -755,7 +757,7 @@ static void xenbus_probe(void)
>>   {
>>          xenstored_ready = 1;
>>
>> -       if (!xen_store_interface || XS_INTERFACE_READY) {
>> +       if (xs_late_init) {
>>                  if (!xen_store_interface)
>>                          xen_store_interface = memremap(xen_store_gfn <<
>
> I would just remove the outer 'if' and do this:
>
>
> 	if (!xen_store_interface)
> 		xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
> 				XEN_PAGE_SIZE, MEMREMAP_WB);
> 	/*
> 	 * Now it is safe to free the IRQ used for xenstore late
> 	 * initialization. No need to unbind: it is about to be
> 	 * bound again from xb_init_comms. Note that calling
> 	 * unbind_from_irqhandler now would result in xen_evtchn_close()
> 	 * being called and the event channel not being enabled again
> 	 * afterwards, resulting in missed event notifications.
> 	 */
> 	if (xs_init_irq > 0)
> 		free_irq(xs_init_irq, &xb_waitq);
>
>
> I think this should work fine in all cases.

Thanks. I followed your suggestion in v2.

>   I am unsure if
> xs_init_irq==0 is possible valid value for xs_init_irq. If it is not,
> then we are fine. If 0 is a possible valid irq number, then we should
> initialize xs_init_irq to -1, and here check for xs_init_irq >= 0.

Yeah the xs_init_irq==0 is a valid value. I followed your latter comment 
to init it to -1 and check it >=0.

Kind regards,
Henry

