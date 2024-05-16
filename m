Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D85B8C7003
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 03:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722765.1127065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Ps6-0004Yl-1S; Thu, 16 May 2024 01:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722765.1127065; Thu, 16 May 2024 01:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Ps5-0004Vt-UT; Thu, 16 May 2024 01:25:25 +0000
Received: by outflank-mailman (input) for mailman id 722765;
 Thu, 16 May 2024 01:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Ps4-0004Vk-9X
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 01:25:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27157e62-1323-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 03:25:22 +0200 (CEST)
Received: from MN2PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:c0::31)
 by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 01:25:14 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:c0:cafe::8d) by MN2PR05CA0018.outlook.office365.com
 (2603:10b6:208:c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 01:25:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 01:25:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 20:25:13 -0500
Received: from [172.31.69.246] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 15 May 2024 20:25:12 -0500
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
X-Inumbo-ID: 27157e62-1323-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUwY4z/BNf0i9CeyyIUmfNIDs3jVw9yM+kHYkC922OmOqhbS4M42QEfR2+DrMlUyQyrPFjH6JZnCVPljMfREnjcc1WAmMsSiie6pcaSpfpZbsi9nv5Fshvh2fiJRcvOocOs187ANM/A5aHLRYyq4MdkddJ4X2PoOBS0f64cjmi3KX8GIcyXa61rJ+I/fNE4ZxPQtZ4GT83GbAKluuBZoIlwa4e7dGChQioPZ01FF0GPl5XUb8jBstrjR8Bq7gZh5ovJlBipmoKLiXvc7Yoe8fpc3b6CRLecG3jMPSF3sRU9FGjQWgZGViR0vSF+J4pnu6RHFWD3JMTrbJKyaGiJYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hl6KpEUCprwIyfEVtjKZLElxzKs+PEABLDLKQP7oidM=;
 b=b0M5ud0A+QzfbwQEt73RKvjp0fnjHX/a8bFpGqV2/F1cFnhCYthqWHb171FWvk4GIiQxvtJTwvFawjnA/PxHeVdPY05jXonGLGXM5JF0hiy0a2tW0dO/XEF0dbP0ytYnNDQDL6fZrbv/PtuPGkWvEmtf6SWyXf0FOMsYegEaD8qA6td+jfqaiNNHJj9Ovr0X4cAkHCL/mabVujYOfFw821qs5oYB87KQdU76vlx+zlrTTZte9k/OVArNKXOaq0MfgbGxBwbKh6nxrmq7IAJ+nSTb3WOZq/eVW1dLVYrzQqtf7VThvRS9d0AdTl6cWrHQXWVI7Pyrh0OwuicbTkJIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hl6KpEUCprwIyfEVtjKZLElxzKs+PEABLDLKQP7oidM=;
 b=PRaAIAzjraUJq6ggN0SY5GxizpbvGWSr0Gg6Nu3Qxi7PvRYS89J7iUHOVMQCO8PKZqvCHWnXkWZjY3S5kInnb/tLiKFUhcB4mOLN2zxtVZGL08ki4Zb9IghLHGNvY2U2BjgCGfKKUjMWho0D2b6s4MXILRtg29xf6vYuwYkl1zU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <028f29be-0393-4a57-83e2-ea27fe0320d5@amd.com>
Date: Thu, 16 May 2024 09:25:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/xen: Improve the late XenStore init protocol
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Juergen
 Gross" <jgross@suse.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Michal Orzel <michal.orzel@amd.com>
References: <20240515014330.1044617-1-xin.wang2@amd.com>
 <alpine.DEB.2.22.394.2405151524270.2544314@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2405151524270.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|CH2PR12MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b50aafa-ee8b-4675-1c77-08dc7547099e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1MzdnNSTSszR1hVMHdmTWxnUEdiM2w4K1FTN3FpMGF5MTRibjNFSW0zQVhn?=
 =?utf-8?B?djJrcjJpMnltQ2NrRjEwblc5TUkrS0ZPSHBpYzM4ajltT2tqcjdlM1NtZGxh?=
 =?utf-8?B?cGZsS2JyQlgyc3l4R0sySGJodGk5RU0rMCt0OTBIV1VqVHB3REh3bnAybU00?=
 =?utf-8?B?djRzODliM0JwZVVtVmN1NWY4OFU2dlNaSWZoSnNnQnF4eHFWRHpSOHNoUHls?=
 =?utf-8?B?UDFVbE5xekV1Qk5xVk1VZHc5YXd6NnYxTHB5TnMrcmVIWTNBbUYrT215OUxR?=
 =?utf-8?B?OUhWWHkvOGJmY3BJcGxNeTlpZ2J6ZXkvU1hxWXZGUFh0Y1RaVGNtQW9aOVVU?=
 =?utf-8?B?SHVhQklFQ0p5K1lOWVpEZlpXN01OdEpDZEl0UjQ0djFLb0FQOVRHdjJlRXA5?=
 =?utf-8?B?clZXbWhDS3lLQ1R5QlNYT0IwZlVLMnJqWVI1TEZwRGpzY3QvMHlPTXJ1dGVD?=
 =?utf-8?B?bjFFZlhQcXJIci9MRi93czk4WlhkZTU4SGI2NjBjUHduQ1ByQi8yVTJucGVU?=
 =?utf-8?B?L0hvaUJnb1MvdHFJYVlCekpYb01HMXB1UnBzNXg2SkE4d3lXWVpYYXBQakxx?=
 =?utf-8?B?UVlGb2VHNlFGYXhhcHBFMWVNNEo0U0p4ZTRuRDVPYVJ1dzlETmt4RGJZdndt?=
 =?utf-8?B?clRTSDFUblRPdDQ1UGgzOGZzNUczM25zU09nNER0VmpsUmh6RG1GWWJieVZP?=
 =?utf-8?B?Sk1lSzI3RzRnbzVCOVdSVFM1MHZKc0xRU2E5WTdLaFRaSlVSVnB2dEdZUWVJ?=
 =?utf-8?B?bUZON0lORmVZU2Q5TkFXTWhocW9hcmFFZU1CcEVLMjlNcHRmaHFpclpoNEk2?=
 =?utf-8?B?V1IwT0k0WjdUb3luZ0luVWQ4eHdOWXRWdGlubnZOdm9md0ZaKzBWNE5PeHcw?=
 =?utf-8?B?SkR1S1V2Ti9zQXdjVFpUV3ZnSTZoUmFZZDBERlZxVzNUUzJ4VG5MT3pCWFBX?=
 =?utf-8?B?V0NHcVhwb1FHbmdReVFJVW1LRFkvcVNvSmxwL1dkYWdtVmhaQkUxSVVpSmo1?=
 =?utf-8?B?TDlMYmxUelh0eVI5VnptendDdlVwYlVieThWdWx3YWtUNlFCNjVOZnM5MDl4?=
 =?utf-8?B?L1VsWUdIV1FiN3RWdlJNQXBST2phYjhkcTZ2RkJWZjhVbktTNXN6aHJRb0FH?=
 =?utf-8?B?clNsSHZTdm84eUt0bStITThJSzlvT29KK2tOQU1UNHdNb2RIL280UVltd29F?=
 =?utf-8?B?dTI0cnFZYzlvQ0NxbFVGaWVEUURDUG9kVmNBbm9FY0RuenlDUWdTVXl4ZTFp?=
 =?utf-8?B?UGMrdDMrYmNwbWUxYXRMTTJOZU1CTWpmOGRSeHFpL1lSVWZNYUhvQU40c1BX?=
 =?utf-8?B?Mi84TDg2d3pFZkNwU0NvUmxoUDBIVklpaG91L1dUQ3A3Qm1XU29qcTd6dmJN?=
 =?utf-8?B?TlBLUDV2WC95NFkreW1DaGVFam5oOEY1Z2wxRm9CSWlpbWxwY0hwUXJteU4x?=
 =?utf-8?B?Sk9ERi9JWGM3Rk9aQ3dSeFdyTzUwczdoSnE3Y3RGbytqa1RSQkhmcFUyOUJC?=
 =?utf-8?B?MG1EZXRyZVpVSUUvbkZZOGxkMkFLYmlqd2NhODk3aTZmd1hEU2hvSFlhOVFJ?=
 =?utf-8?B?QkljSnZJTWY3L0JUVmhkZnhxcXBIUXNsY0p1cVl0THhuckJ4RkJyRlBoMmVr?=
 =?utf-8?B?Y3ZYZ09OajBZaVR0Z2E4eTVVT0JlVUdnTnpuTkh1VlBSTkI2bzB5ODhVN2oy?=
 =?utf-8?B?UXNIeDlLd2l2V21HUHZUczZQaWI3Q25iemVTekMxMUM1YkYzRUl6Tno5em5E?=
 =?utf-8?B?M2xoVzRLUEI5Z0hsWGQxVk51Y04vSGEvWHl2cXpRM0cvaDM3RlN6TXFVZTUv?=
 =?utf-8?Q?9B0xr7ZMo3/SblJDfDUNHJEPKZfDFAm++Hx2w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 01:25:14.3783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b50aafa-ee8b-4675-1c77-08dc7547099e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262

Hi Stefano,

On 5/16/2024 6:30 AM, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Henry Wang wrote:
>> Currently, the late XenStore init protocol is only triggered properly
>> for the case that HVM_PARAM_STORE_PFN is ~0ULL (invalid). For the
>> case that XenStore interface is allocated but not ready (the connection
>> status is not XENSTORE_CONNECTED), Linux should also wait until the
>> XenStore is set up properly.
>>
>> Introduce a macro to describe the XenStore interface is ready, use
>> it in xenbus_probe_initcall() and xenbus_probe() to select the code
>> path of doing the late XenStore init protocol or not.
>>
>> Take the opportunity to enhance the check of the allocated XenStore
>> interface can be properly mapped, and return error early if the
>> memremap() fails.
>>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Please add a Fixes: tag

Sure. Will do.

>> ---
>>   drivers/xen/xenbus/xenbus_probe.c | 21 ++++++++++++++++-----
>>   1 file changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
>> index 3205e5d724c8..8aec0ed1d047 100644
>> --- a/drivers/xen/xenbus/xenbus_probe.c
>> +++ b/drivers/xen/xenbus/xenbus_probe.c
>> @@ -72,6 +72,10 @@ EXPORT_SYMBOL_GPL(xen_store_evtchn);
>>   struct xenstore_domain_interface *xen_store_interface;
>>   EXPORT_SYMBOL_GPL(xen_store_interface);
>>   
>> +#define XS_INTERFACE_READY \
>> +	((xen_store_interface != NULL) && \
>> +	 (xen_store_interface->connection == XENSTORE_CONNECTED))
>> +
>>   enum xenstore_init xen_store_domain_type;
>>   EXPORT_SYMBOL_GPL(xen_store_domain_type);
>>   
>> @@ -751,9 +755,10 @@ static void xenbus_probe(void)
>>   {
>>   	xenstored_ready = 1;
>>   
>> -	if (!xen_store_interface) {
>> -		xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
>> -					       XEN_PAGE_SIZE, MEMREMAP_WB);
>> +	if (!xen_store_interface || XS_INTERFACE_READY) {
>> +		if (!xen_store_interface)
> These two nested if's don't make sense to me. If XS_INTERFACE_READY
> succeeds, it means that  ((xen_store_interface != NULL) &&
> (xen_store_interface->connection == XENSTORE_CONNECTED)).
>
> So it is not possible that xen_store_interface == NULL immediately
> after. Right?

I think this is because we want to free the irq for the late init case, 
otherwise the init-dom0less will fail. For the xenstore PFN allocated 
case, the connection is already set to CONNECTED when we execute 
init-dom0less. But I agree with you, would below diff makes more sense 
to you?

diff --git a/drivers/xen/xenbus/xenbus_probe.c 
b/drivers/xen/xenbus/xenbus_probe.c
index 8aec0ed1d047..b8005b651a29 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -76,6 +76,8 @@ EXPORT_SYMBOL_GPL(xen_store_interface);
         ((xen_store_interface != NULL) && \
          (xen_store_interface->connection == XENSTORE_CONNECTED))

+static bool xs_late_init = false;
+
  enum xenstore_init xen_store_domain_type;
  EXPORT_SYMBOL_GPL(xen_store_domain_type);

@@ -755,7 +757,7 @@ static void xenbus_probe(void)
  {
         xenstored_ready = 1;

-       if (!xen_store_interface || XS_INTERFACE_READY) {
+       if (xs_late_init) {
                 if (!xen_store_interface)
                         xen_store_interface = memremap(xen_store_gfn << 
XEN_PAGE_SHIFT,
XEN_PAGE_SIZE, MEMREMAP_WB);
@@ -937,6 +939,8 @@ static irqreturn_t xenbus_late_init(int irq, void 
*unused)
         int err;
         uint64_t v = 0;

+       xs_late_init = true;
+
         err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
         if (err || !v || !~v)
                 return IRQ_HANDLED;

>> +			xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
>> +						       XEN_PAGE_SIZE, MEMREMAP_WB);
>>   		/*
>>   		 * Now it is safe to free the IRQ used for xenstore late
>>   		 * initialization. No need to unbind: it is about to be
>> @@ -822,7 +827,7 @@ static int __init xenbus_probe_initcall(void)
>>   	if (xen_store_domain_type == XS_PV ||
>>   	    (xen_store_domain_type == XS_HVM &&
>>   	     !xs_hvm_defer_init_for_callback() &&
>> -	     xen_store_interface != NULL))
>> +	     XS_INTERFACE_READY))
>>   		xenbus_probe();
>>   
>>   	/*
>> @@ -831,7 +836,7 @@ static int __init xenbus_probe_initcall(void)
>>   	 * started, then probe.  It will be triggered when communication
>>   	 * starts happening, by waiting on xb_waitq.
>>   	 */
>> -	if (xen_store_domain_type == XS_LOCAL || xen_store_interface == NULL) {
>> +	if (xen_store_domain_type == XS_LOCAL || !XS_INTERFACE_READY) {
>>   		struct task_struct *probe_task;
>>   
>>   		probe_task = kthread_run(xenbus_probe_thread, NULL,
>> @@ -1014,6 +1019,12 @@ static int __init xenbus_init(void)
>>   			xen_store_interface =
>>   				memremap(xen_store_gfn << XEN_PAGE_SHIFT,
>>   					 XEN_PAGE_SIZE, MEMREMAP_WB);
>> +			if (!xen_store_interface) {
>> +				pr_err("%s: cannot map HVM_PARAM_STORE_PFN=%llx\n",
>> +				       __func__, v);
>> +				err = -ENOMEM;
> I think this should -EINVAL

Will change.

Kind regards,
Henry

>> +				goto out_error;
>> +			}
>>   			if (xen_store_interface->connection != XENSTORE_CONNECTED)
>>   				wait = true;
>>   		}
>> -- 
>> 2.34.1
>>


