Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D647C4116
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 22:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615151.956384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqJHL-0001k1-FX; Tue, 10 Oct 2023 20:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615151.956384; Tue, 10 Oct 2023 20:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqJHL-0001gl-CH; Tue, 10 Oct 2023 20:24:31 +0000
Received: by outflank-mailman (input) for mailman id 615151;
 Tue, 10 Oct 2023 20:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlcS=FY=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qqJHK-0001gf-Dy
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 20:24:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 020f4944-67ab-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 22:24:28 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 20:24:23 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::7c95:99c7:7f5f:c24a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::7c95:99c7:7f5f:c24a%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 20:24:23 +0000
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
X-Inumbo-ID: 020f4944-67ab-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPyT78ODqkHuXSzDMvstG3CAxlWAkBqwpkjlNaA4MMbiA1rC+gzrKQwz+8LslnyxgoGCd/Ix1PXw9EJgOvVBfr7FVybrArsw64sNG8IGxmyxj51IHfoYpZZLc52EbXpzR47gujtxOZm3IiDNeTzXOhTJR+dYqLFMaCfXttKZ4zKTF8vsYuo2Y1Gcj7Uo26XMkq3AaMVE/kE2rbzw08MOABLPQOSeQDS7w73cAvzVbkoTQ+r+BVAblaNnqQlmXg0oZ2XxFalDcD42MJs+9s/Jsb/Nx8kwqs0tWKE5ywzEWKKnT5ZUwgdf72WGRWZntS83RSeW39yqH6m8xqOvABrxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW5M88XSPh2mnv64QH1pzCHi+mM6Ti+xuwwtjMt0qZE=;
 b=fl5Vcai/94MefbUKUI3ej7buR7UCFn4xRc1fjNzeEubV0GXgpw1O0wMv3rYc2hp9GTs3cG50EQkZeWAIHbx2cx1gYhMP3qmE1c137AABi/GT+I9k3eutmZd8TzG+27YmbmKGCLcQ0C6re9uXe+OsOZcZFZQux2b2cnkaktJbOjnlP4Hky6e2yq/IxLArrxQHWTEWlbjfR1vL2GSAwF5OuCgjbVL6NhB9XD7tGgufFgJpalUCPztcWg1bEgZ7UvuwTwLsnTw8V0FKP9WA/em3D6gzBMwxl3IA51/odO9VXdd+GOHkccRzpsM4lH6vzFNvzvfRqmI7Mba3EwunLKGA2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW5M88XSPh2mnv64QH1pzCHi+mM6Ti+xuwwtjMt0qZE=;
 b=E7rISsO+3QxiIUkMMTr1oWeXSrvzmyxMaNT+U2+qU0tCYho5T9ljFz4XxvG/NH+iePHXfPms+qgSkoSJn7whmhO8/njWLaJhdf0ACVm8gDnrYiExYQVd1ORnjKj+jmOgRdfOEo/mMyp91SqNJ6o0XjNOz3vEnijfm9Xm1cx2gPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 10 Oct 2023 13:24:20 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, Juergen Gross <jgross@suse.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCH v1 1/7] xen: when unplugging emulated devices skip
 virtio devices
Message-ID: <ZSWy9P4tKvPv0M_d@amd.com>
References: <20231005181629.4046-1-vikram.garhwal@amd.com>
 <20231005181629.4046-2-vikram.garhwal@amd.com>
 <alpine.DEB.2.22.394.2310091651110.3431292@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310091651110.3431292@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: BY5PR17CA0061.namprd17.prod.outlook.com
 (2603:10b6:a03:167::38) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|CYXPR12MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: 66de529f-2770-4848-ab40-08dbc9cee424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3D770+FAU5q7Eu7a9jt8Mr2rmxpOHIuZeLeK0D3tw/OVyOz7tqHN/krtgnHgKn43tgOkFkZRAopbqPwXlhW5tk40cT163stYjr00sQOMsvernxFxGiJKSByLPYzH5Xwoxb/R+PL6VJUoAKEYzK0xG/t/4cPnXm0xsEyP8Q7YgPRZB8xda5me+3t5XvEN+HjFv2aRcAFPV3+BDZjUX4iLaAYwjKa40ltdIMkjg5hTC05d8Vo5Vddk5SNx7IMimNcACcIjp5t1+DR1TivuigZ0MvcukcNXDlDnbGH9T/jcOi0xRuncrj0Skl3nCzFvVHyOD9nPIeJMZWEwDkR2wMaSgqYUrNNjAyq+m7o1sP8xYYThGfA3AMjGaI5XB/rf/IxOblkwfonZ40Q5Z/9OIQ35pcttVMfKK29T/ZU/IR/uMuR33+6Eo+2ylwk2puU4v2iGtg4b/kWs+n0JI7bMYAW0phoIjzsbs8CENKM2SFnePCMdvCJ39i9tooOImYZ+wWUMt4j1jmfmevRpbGU+wSBNwPCciygE809cVpS1zjVbAecgVrl47zF/N9QS/OLeqY3P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(26005)(2616005)(8936002)(6512007)(83380400001)(6506007)(8676002)(478600001)(7416002)(6486002)(2906002)(4326008)(5660300002)(54906003)(66556008)(41300700001)(66946007)(6916009)(44832011)(66476007)(316002)(86362001)(38100700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dThVUytMeG1VbkRXUFVHT1dTSXlpWFJWSUx6SlJUT09ITEpqRVZ6bEhmYkZu?=
 =?utf-8?B?MGlXQjVTeGZJaEJibWkwWXBuYWNOeXhnWjJlTWFYOVlzRWNhS3JGT3B6VDZC?=
 =?utf-8?B?Z3NaZ3NSd2FGQUFvN3h5NWl6RDh0K0Eva1AwVldEV3d0eDlKU1EzdUFnMmZl?=
 =?utf-8?B?dmJrY1NKODRMRmI0Y0RzenpRTC9meFo3b081cVRZd2RUbHlkTk9GbkNkeW51?=
 =?utf-8?B?L3lCaStWUEJqZXFCWG51b0Zmcm8zZWsydEJNelNXTkl1d2lWVXVTZk5jTFBs?=
 =?utf-8?B?Q0VaS2NQeGorN1hibTBRUmxFM28yUHhlWTFoT0h0dUJ1NWxBbXRka043VHNQ?=
 =?utf-8?B?OThoVXNSSmg0VGRLU3I1WTdPeE5XbVlKOTNrU3h5YVF2bGZRdldROUcvd3Za?=
 =?utf-8?B?bnBKWXhmL2tLdldGVzY4U2NxWHN4S1lScG4wRG5mYTRyRE9VRjAvRCt1Wko3?=
 =?utf-8?B?SVVkQVVyRDBqTDQ0cW1uMjlEMnhvWTNpU1F6czVsSXZVZk04T2hkMkg4Zk90?=
 =?utf-8?B?TWxnMUtZcjhQQXZDV3htMkpXVEJoSXZVTlJFNFV1NkNFaFo1Ym1MTDYzbHZ2?=
 =?utf-8?B?OE9qWk81TS90WVRGQnBWYlAwemRnR2VYaEt1L0JFSXNVMUlUTHcxWjUvSDEz?=
 =?utf-8?B?cVpwVTJTY1MveWZuQ3BXNUxUNW8wbEthcW54UkpJZ1NIMjhHOU5VaG9BZmpv?=
 =?utf-8?B?YjdmYlo0cmJtT1ZuUGI2K0doOUhQVnJKK3d3MnBqanBLenRPUk5oMlY3YUxZ?=
 =?utf-8?B?ZURDTE9SRzQ3RWxya3VzWkplMlJNdFpIOG9YenYydUp4TDF6MUcycU5YRjds?=
 =?utf-8?B?STJscW9MNFlwbnA2Y2ZyU2JWZEdmbmhDbmZhR0dNb29TcnFZYkNNZjNIcmEw?=
 =?utf-8?B?NnhXTFpDTGtLT2ZzWWU0N0R0RCtFZVVuNDk5dThHbG1xT1ZPaHJ4d2tmMWh1?=
 =?utf-8?B?VWZENmUxS25MTlpmR3RsOEwyUlpna0hDTjhFa2lXL0RTZnMrL09wK2xCWkU4?=
 =?utf-8?B?azRhZjNoMmM3cmZjN2JyWktlMS9kbEJxcjVHK01EYjNtT0pKQk41cmZOa1JF?=
 =?utf-8?B?ZU9KYW1rRGFtbU92UHUvMGVlT25kSWk4SHhyTWpRRWdiUy9FdkpNRzJUdmpa?=
 =?utf-8?B?SmxUUURnR1lRTnB5ejlxUGo2VXBxcWFnUWdXTlZTbFp2cW8wQXA5bHlVZUpQ?=
 =?utf-8?B?bDF5WGJTOVZQaXJBNHI3dENqL0RRM3M2eHBLTDY2dnoxa1cyTk1lWUNMOFlv?=
 =?utf-8?B?d1JNZkdNb0VkTzEvL2VnSVdSK0VoSnFvSjh4T09vdEpMM3ZkMEluOGNNU1Nr?=
 =?utf-8?B?cWlMd1kvOGJQdkVKU1U1ZnRKTVQwK0dSdXdrOWo5alBIV0w1T0V4RStOeml3?=
 =?utf-8?B?MlRWb2ZsSU9QTUYzVW1WVXZXVm12Rld2UEFrUkNiZk05SXZHUm5pNTZsTm5G?=
 =?utf-8?B?OTc2K0FCc2ljbWJRN2g4MGJOekZ6V0M5YUhRTHhHZVh3VytBQXdaazRja1o3?=
 =?utf-8?B?UGo5RHFJNklERytKKzU1c0hPK29UOGxZcWlWT1FYTmVId2QwK3l6UE5od3dI?=
 =?utf-8?B?VmIxdG1XMnZ6UE45NXZybWZodUtCVmk0ZG1rT3BPZDUyNGFOK1JxTFJFaFZO?=
 =?utf-8?B?Tko4ZloyenZJN0ZlaDNwT21hQXhLeVpLVUUwTW9NTzMzd0FSRDlTS0VjckFG?=
 =?utf-8?B?K2t2SGo5SFlsNEpwTWo5NHVJOXdEdFk1dFhGMSt3bWoyWXBBMEovcTZ6N3Q5?=
 =?utf-8?B?U1NsK290Q3R3TG5CQW9tcVAvcDVkRmVtQ1pURkt6T0hLNTZzSWpJQjQvTExH?=
 =?utf-8?B?V1hMY0VwWkhXZTBoczZ2cDFFRXZNRzZ6VDlQcGdwcVQwRjh5NVJYSWt1alZ1?=
 =?utf-8?B?TmhyU2lhS0ttNDQ3Q3ZmQUZGQ0hMamNPS3NmaHNpN1BsazZWOVJvVVNEbDZL?=
 =?utf-8?B?Mmpxd2pqWG55amFZejhXdVFoK09uT0VrQlBDcWJITkFLdUdKY0hKOHFkbVla?=
 =?utf-8?B?cmNHK3B5NTgwTzVwYUFLOEwzdVhQYWJGWm9pTWVsdTBSelpqZllvMTAvUlV2?=
 =?utf-8?B?MVVzd0I4ejhJdlpYNFpXNHd0VkNPZExBNEdVN1hoeWs4aWVLeGN4d1o5ZEZH?=
 =?utf-8?Q?mp57rHOObsF7vZJ//YSYsKOQa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66de529f-2770-4848-ab40-08dbc9cee424
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 20:24:23.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/uFlsUs5OZVV4+M15Q+MMSym7k0/CrB8NjesBwEhuz9dUuyxRAj0IqQ+/BhoEtjm68uF06fzGULi5NcdXr4Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442

Hi Stefano,
On Mon, Oct 09, 2023 at 04:51:53PM -0700, Stefano Stabellini wrote:
> On Thu, 5 Oct 2023, Vikram Garhwal wrote:
> > From: Juergen Gross <jgross@suse.com>
> > 
> > Virtio devices should never be unplugged at boot time, as they are
> > similar to pci passthrough devices.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > ---
> >  hw/i386/xen/xen_platform.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> > index 17457ff3de..3560eaf8c8 100644
> > --- a/hw/i386/xen/xen_platform.c
> > +++ b/hw/i386/xen/xen_platform.c
> > @@ -28,6 +28,7 @@
> >  #include "hw/ide/pci.h"
> >  #include "hw/pci/pci.h"
> >  #include "migration/vmstate.h"
> > +#include "hw/virtio/virtio-bus.h"
> >  #include "net/net.h"
> >  #include "trace.h"
> >  #include "sysemu/xen.h"
> > @@ -132,7 +133,8 @@ static void unplug_nic(PCIBus *b, PCIDevice *d, void *o)
> >      /* We have to ignore passthrough devices */
> >      if (pci_get_word(d->config + PCI_CLASS_DEVICE) ==
> >              PCI_CLASS_NETWORK_ETHERNET
> > -            && !pci_device_is_passthrough(d)) {
> > +            && !pci_device_is_passthrough(d)
> > +            && !qdev_get_child_bus(&d->qdev, TYPE_VIRTIO_BUS)) {
> 
> Please update the in-code comment above to say "ignore passthrough
> devices and virtio devices"
Sounds good. Will update in the code comment in v2.
> 
> 
> >          object_unparent(OBJECT(d));
> >      }
> >  }
> > @@ -208,6 +210,10 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
> >      /* We have to ignore passthrough devices */
> >      if (pci_device_is_passthrough(d))
> >          return;
> > +    /* Ignore virtio devices */
> > +    if (qdev_get_child_bus(&d->qdev, TYPE_VIRTIO_BUS)) {
> > +        return;
> > +    }
> >  
> >      switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
> >      case PCI_CLASS_STORAGE_IDE:
> > -- 
> > 2.17.1
> > 

