Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77946589D73
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380440.614591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbnF-0000eU-3A; Thu, 04 Aug 2022 14:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380440.614591; Thu, 04 Aug 2022 14:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbnE-0000by-VS; Thu, 04 Aug 2022 14:25:44 +0000
Received: by outflank-mailman (input) for mailman id 380440;
 Thu, 04 Aug 2022 14:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJbnC-0000a5-UV
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:25:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51cc5de4-1401-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 16:25:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9509.eurprd04.prod.outlook.com (2603:10a6:20b:441::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 14:25:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:25:40 +0000
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
X-Inumbo-ID: 51cc5de4-1401-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJWDntqK5rzWqYowUdmdH8BCTrANJ6w9nQkEHGwClWzIMA9fEqF1dM1DiiyzKTefjXdtPuhVFQcfA4q5BtYo7IrHNcmlkDI11o+oQlA4/NhWo5OZ4US+yLASwlfd7tnt2Gv7XAaa2A9v6/uC4wJl+mELy0giIuQ7cBoiuL/f6wEbbC+Xb8qo3dbxXH0bJ7K5X4iziGAqzXeTqcaUw2RklPG9czXWPYtCaO4N/7BV2KdW3LHv6Tf21i4SH+sn8Rji8Y8rlI2DEzU3PMvF1FONIHK7W6qxkg63f6HNcBxV1Bzs7Zn/Q7kf+qegHk5AKQvL06QRD/cU5Tlk1iN2VKpSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IetbBMoHWffjM0VzmYCcH5elwtQEE+dgMmJZJyOKucA=;
 b=cAKTT3fEG/DtzhWqvnnsgtYJHgs7K86MeyQUnE3MB7oB3ZvqnDcf/aAzunC+B/LsR64Ubxx/Ab4Nwf6RICZohYc14O3/gFfUaUrKiXTeugDC5CRjnLFSWhG2qHPIRzjBYSU5qvIap6UiD3mrDxRj16UWw2de1tCKB+Jtw+cB9FqH9zWzyCPQFCBHZVhRXX/ZJJzNv3vSbqHPFhzFFHsYmNsCUo5s0SmaCRmC3PPQIZbJsBk4AeSKO0qYYVmS6ZhMySwrnnnL7xw7i5KbeVzNWflgpgJtvrD2U6tOb1yUn+dZn+C0N/wGlJxoicjUxO3zxjJK7vAn69mCXqOetdnHSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IetbBMoHWffjM0VzmYCcH5elwtQEE+dgMmJZJyOKucA=;
 b=4wThRCTcN/NtLAmy5llhmm1cgf4jiMKlWVgfjeaIsi0lTwB6tu6IYsuZyLr5bSo068yaVXClHc1KFttKejb1d3/4n7O5qOeTtVFMEHDExIwN4MOCluCJK4L5GYLhj0NcZ2l4TUkqegqJpxAnJVByTA5w5skxGZYHxvcRNFoFFAexpo6R2sIPCd9s0X9V8c4S71u0ZBef4HmC7PqP7AzNrxeH8s25KcvOjPP5qw9x9d9Cl+3dKwL2LH98oX84rHdkBJKHdUFF4jovmKjf5gBVnXoxIB9bzeEh9yj1te7jPgskslJ8Yc19BzZGCzQbzDAlIzsoCyWT7WM/q3IdFFi0OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbffdff5-04cc-f314-98da-29f1984149e3@suse.com>
Date: Thu, 4 Aug 2022 16:25:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 05/10] IOMMU: add common API for device reserved memory
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <6a99f9b99b419a20e895d54db2e345c80270248c.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a99f9b99b419a20e895d54db2e345c80270248c.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d7e8089-cd1b-4620-75d8-08da7625350d
X-MS-TrafficTypeDiagnostic: AS8PR04MB9509:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fn9IZPkDspiUZ+zK/Bo1YTuELJZiKm4sdO8WboCw7mkOkOv4tnnHZprFVPUpuJFDU1VMFQlmLvRw5y4Qe+RDwtKmfQXwL/Cb5gOU4jMecWXMEyTB3Sl55sFDJ50suO7x43syIPr0gyBlFsTITbF9spiQAskYRrB23n46jN7zUhiToyoDn2m4vEYAN1XBKnc1my3nnSSWf/sgl6h7Zya1Fv/DLuVh5Z4CQj+ddRxvfmUcWjTdvZdAu81rguN31uZKCLDyT7H5BBbJeXKxvMqQdSAsJyD2VqbVEhTd/rPZhAcTGc2MrpLMceDUDwwRhhwNp1vzBkjRdG3ZigPQXR5FdYETHRbSpCILb4cAR0AghYVs9BzhB3iR6M3bHrfSqPy7+uxEKqBBuwkBnnDk7B1uWXnN0mDb+NMksgGD3h62g5CnNoCtkSg26ggC921EzkLKa9ooJe2OIHwtUG+eNH1dk2LEP1imm2enN3nZEMPe8K5YXzNEt9kP2ZJ2aOqCr6ICaV9ZFpwqjkijm4WIoyKi1ydkUyC2UaRnftUKvt9m7lsy4t1gdbgvaTPNRdcaybFrNXBbak/zg2YUU6JplRjZb8HAOTNaQS+LEnQQHOLPsdbI0mNmk6Ue3/nO3QXSYX4XGudRS87zyy6t0c+WO935ucA+8eZfXrKOSiTBuPe52+iUl50xlm5McirXI1iwvUU1KyrmonfOfkWCaexlcfKikjejKxzhIsXsSdfAhuc6+o3xycnIJXi9yfKVoTSLp9cgfl1KFk188zA5mAg7MPsDNTFsEnqPCkqj6nZPLYFGawABHMHmnBTFWwb8Lbx7AsS+brVO1wKK4cvecfFUvtUucg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(346002)(376002)(38100700002)(54906003)(31686004)(316002)(4744005)(6916009)(186003)(36756003)(2906002)(4326008)(8676002)(66556008)(2616005)(66476007)(66946007)(6486002)(478600001)(8936002)(86362001)(41300700001)(6506007)(26005)(31696002)(53546011)(6512007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3RFZzA5UmhiMENRSGJPYnNSdC8xS3FIVTJ4a0NEbnVpS2lKSXZTT24xNHIr?=
 =?utf-8?B?U2tJMmpNejBqZXNuaUxQN094Q25lRlpjYjIwWUVOdGRrRlJ3SG8xeXhRVFpk?=
 =?utf-8?B?d05HeTd1dUFWQkxqcUFKbVFHNjhiNkNaOFpVSGRMRGdjR2NoUjVyUSs4MEF6?=
 =?utf-8?B?ZDRpMWY0MVFDYWYvdno2VVlvWTZyQ3gwMm1qc25DMjVEdUxzYlZXa2RDcE96?=
 =?utf-8?B?L2NGVXVTZjlKYkpMVm5Xazg4VHZyWUtQVEx1UU5GRVVDU2RtdUlNMzRUVzlT?=
 =?utf-8?B?a09LeXEzTDd3VFNmeFhVdGczVVYreCtKZEl4b2hBVXJTa2RJdXlwbGVsdFRo?=
 =?utf-8?B?cXowSW9wUTJDVDRXV1JXVWtxVGxPNkdScTk3eFAvMzFNQmN3TmlmMTBjVWRQ?=
 =?utf-8?B?bTd5WmZhb3VDRXpqRDF5S0lrNVIxUHNpKzdtY1RVT0tRTnJoanFLOWFTWGFn?=
 =?utf-8?B?TnF5azhvRTVmK2FJUW9UdVZJM0VpbmZhZHQyQmx1eFZSSzJUb2pQVVMrcXZh?=
 =?utf-8?B?QTQrRG9Ja1RQRU91ZDV0UnB3ZGl4WEdPOTZINGZxTVBuWDJNakJkL1lVYU9r?=
 =?utf-8?B?ekQ4MHhTWHpib1g5WldJSFR6UExibU1ZbURkSnhXZ3hJbWx5OHl0TVJRSVg0?=
 =?utf-8?B?YWdBR3FlbGI0a1RyRU91Rm13aXh0N2ltcXRJT21EcUFENG91emhjSTFkbjd2?=
 =?utf-8?B?cnpmK0dhSjZlMi9MRUVrYjAwU1Y0M0UxVHdMNlpSY0R3K2FId3RmbWYyam53?=
 =?utf-8?B?M3pxbXV5aU5IYVc2US9hL1Z4RUVIQnpicXlGWDlXM01nc0FVK08wdTIzS2xI?=
 =?utf-8?B?VnpoVTZxMlFLNk9VQTlNcjg2L1V6UzNDWG5URm5HbzVLYndNSkIzR01LdWRn?=
 =?utf-8?B?UC8wOGVmZ216eWMrQlJLTFpidFhFM1RNS0EySVM5NXJRWjB5YldDa0RQbGN0?=
 =?utf-8?B?akNqUnBscFpHVGV5c09VVlVrdDFUZDBhc3BrMzZkNUFsZER4OEJlYUFCRFlG?=
 =?utf-8?B?Z0xVSm9lYVRKT1BCamgrdmI0WThUTlFVSGZCMUhjZ3FvcmVCVnd5eXhBWHRK?=
 =?utf-8?B?V2VJdzlUV3hlQm9vTnd2MTNrQUtIaUZsZFlWSHF0dEVHaThZNkVtYXRmZWRt?=
 =?utf-8?B?WFFsTVl0c0hMVm5UYWhlVUhkaGtNV0RaV0txaTZiTGJEOVNNenlnNkMwWDN4?=
 =?utf-8?B?R3QrcVJkUUZudFpXTEdqc0xuN3Y4UW5GREF6emQvejZFV1VlTENreUdJeFlS?=
 =?utf-8?B?ZjBpdkU5eG1TbitmYm5KbmxXMXQyWUJCS21tUTg1UEJhSUZ6UFcwMHNydkY3?=
 =?utf-8?B?NThpMkJ6MXdWUXQ4L3BWdnAvVmdnNjI1QVRkbWdvTExJc01TSFRhUmljZ1dR?=
 =?utf-8?B?NUJyQjMyOVdKODlFNm9maGV4REFOQW9OZHBjNkREblQzeE1haGVMOHh6MnFt?=
 =?utf-8?B?Z3VyTzlNU1dhZGVGZWQxdXZYQVpReXZFNWdiem10YWZBUk5zdlFUdnAyVko2?=
 =?utf-8?B?WnVGcTZMb1E0Yml1T3ltVjhXaGY4Mi9Cc2RUeDUvSG5LNE1UQjBWUWdIZkox?=
 =?utf-8?B?RTJhTkZTbjBSaGFpRXdzTmNlVEFyalo0RmRrcDduQWw2SHJCT0hOWXBkOTR4?=
 =?utf-8?B?UVlVWk9wTUZUblJXQ1dQVHc4N3FKdWdHNjFYV0wwMkN0YkQ4ZXVTVEw0cVc5?=
 =?utf-8?B?NUZ1ZEUrQXRYR2J2OTJtb0NVdWIyYTVHSnlJYmROdEJGWFNoR3BqU1daSGJi?=
 =?utf-8?B?QzFjVGVQSHN1TEFpUHdJVzVPVVRkT1pCc2JiNjEwK3ovV2RaNEVtTXROZU5V?=
 =?utf-8?B?bHFpZ0s5eUhMOC9SR28rVkZYcUFCN0JzdFQzd0FHQ1hQSXBBV2NvQ1pzR3V3?=
 =?utf-8?B?N3BGYnBGTzE3dnpDcVQ1MGhLQmlyNXFiTlphYVM4Ykw5Qzk2TW5XQ2tCTXBo?=
 =?utf-8?B?c2luOEtPWHEzQlpxYTQ4TDdJc2hudVJJcFNqYi9lN2VlNGlGRS82bWtjWW1Z?=
 =?utf-8?B?NHI3blo5U1FtN1hHaVdwSnBDbUdENWFBcVUxall6Z21oSkR5ZFFkV3VjL2RU?=
 =?utf-8?B?TFg1Z1JBQVVHY290R204Z1F4czcvOGl6WFdMbHBPQmVhc1pScUVVdkxMU1FQ?=
 =?utf-8?Q?iqa7NnEIUnkpQ0mjKqktreHVu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7e8089-cd1b-4620-75d8-08da7625350d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:25:40.3538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlYHmQNC74PJ5HQEEqr1j3yNNjaq+tFSg6pUXCLHLEtmQoRVsH3NUKqFxQmD5LQfLKlo87S/iOruLcSj0FygwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9509

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -651,6 +651,51 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
>      return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
>  }
>  
> +#define MAX_EXTRA_RESERVED_RANGES 20
> +struct extra_reserved_range {
> +    unsigned long start;
> +    unsigned long nr;
> +    uint32_t sbdf;

It's not easy to judge why this isn't pci_sbdf_t when no callers
exist at this point.

> +};
> +static unsigned int __initdata nr_extra_reserved_ranges;
> +static struct extra_reserved_range __initdata
> +    extra_reserved_ranges[MAX_EXTRA_RESERVED_RANGES];

With __initdata here, ...

> +int iommu_add_extra_reserved_device_memory(unsigned long start,
> +                                           unsigned long nr,
> +                                           uint32_t sbdf)

... this and the other function want to be __init.

Jan

