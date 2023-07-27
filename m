Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE376497A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570823.893053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvr6-0006rK-Mv; Thu, 27 Jul 2023 07:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570823.893053; Thu, 27 Jul 2023 07:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvr6-0006o0-Jq; Thu, 27 Jul 2023 07:56:16 +0000
Received: by outflank-mailman (input) for mailman id 570823;
 Thu, 27 Jul 2023 07:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOvr5-0006nq-2A
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:56:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e47169c-2c53-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 09:56:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:56:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:56:10 +0000
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
X-Inumbo-ID: 0e47169c-2c53-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dzg0D3pOwl0i/eYnwRJNXWuCFrv1CFsj5lwwrLYe8TtrcWmb2+jNVbKagjKVYRh21QBFhNK2JxDiMu6OmqsaD5U7Cx1F2XjLqvlUTX0hlP220Mu5rfJtgwlHQXrfbskmuRCYQIwWWfwReWdAjXYnlVd+2WbPNtfC3gnJMxmbhiopOB7aegaDS5ZCwt5yAXvvh1sQgmVm+MRvzKQOR/QvZ8zeupjNYGk+q0/juW0G4xJgE+qGFqQdghHTv3ty1EzDHJYSAlKrW1aWH2SkPqK17j9M3n7PB8IguYO2H2TcuvRaf/neqzDG/syJPxGgVITa9HA35/VR2B7SOAOZPoWhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6uRZHeEOxuz1S/2fBVUYkIpbMNhp6erjcMWGv5MTBU=;
 b=BgUpFzLtDCrBdoGzQDkTVds1GQco2c9PJCj3bxGpVKSsf+khs8LB0EeL31U3wBOzC5+VCQMXZhJj0Q+3Ays49G2u7KAgBICRijQuR8JGtZmQcglO819OokIxgfk8vy5JumSmpn+lUVOdPBGDY2cjsz2gVm7pgKtZjejstQucE0QzrRzm7jJAE5sE+z8Za4mbdTFvarHi2yicLNN8Fk4pnaBURcoav2jG9vFg6OTKiRp7CUoH1ndu8BkM0FmoEQ5eJty9lGTNS97urKU2qdNxpf2klk6E9aRMod38sCpFG4r4w84ewonkz/0HfVaNq5M5/vEDoYHj592tlQ1EJt7JCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6uRZHeEOxuz1S/2fBVUYkIpbMNhp6erjcMWGv5MTBU=;
 b=vyzsu9byD/zSRH5pqIW/g+XdgzHDGXD+IrTfHM6yIRjFlb4kN35cdND87xGQtsCAhkFPLRa5Qxiet7++DON6GckJWIjb16YR8VLTPYb6z9iEf7aM2waiuSjNZJs9uLySjtfN3SV09Ke3i9Rf23XXFIKyQfSUdNVMTNIN21enQeg48ZFfly6ZW/UBPM/6XP5UCL/+MKtZ875y/sQo0SBdSFp7ohSbFlSvpnSxIZ2NP52o6XPW0DZm+0F6m82mZo0l+MVGy+8JVLJah2j6oIgpREtnKUtR/+KheFdT1FbisKHCDAOexFBnOBnh3K28PSkR2brAkxqGLmR//Ktzd7OrmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a277dacd-56f6-a5ab-6982-b5cc4f9d507c@suse.com>
Date: Thu, 27 Jul 2023 09:56:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] vpci: add permission checks to map_range()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20230726140132.80151-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230726140132.80151-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1860ec-aaac-45d3-3b92-08db8e76f125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w2fd2j+9rpCoZ+boX4DYpzyn2DSCi3O0bBUZkLxmE5kWc3F5tfaAZwLgprZRkTxAInCHpQpcBDezjDsQEpxgI0UHyJOUUrQj4EPzhK2LadJds+hsSCktZ/ZLyghPFxvqhqXk3WYBwp59qQlYYgRo70LzsLF4659c4crhSnbspBChjbkUG71yKR0l57w4RY6zZ9vrFVLLGQ1NwPZYGOLm+AWG4GQ7+1unrV+Gyjzo1Nb2YPKZEPWpG3dv9Y/7sSUlessR3/lqNCTAeoV7eLnmOxtsD9tXURpz8flqMCKe+zpN3kPoMIp61LyktkoR/vFzwR+1gaCF+ve0EVCG+AXknMmhcIU8+N7PhDuZMgwnGQp3Fzf9aDKdcXgI/ca+38HuFZmPtVOO0q41FCM5QDWNKvs6UZwlvlvsMYHFRFEbi64FvNNNI5WFTYbGzW/+vkJ9Q3CTKhduMowOq1u7Oja4qUZIN3ExbkIDF7vvHzqZHOCKr6uARafQmbyUDyZYX/T2uvNLT9Aqh3MC5FMyEeCh1z111ArRF5vPYPSF5IVlF8JoCLtQyMFcBMv/pUaoNPz0nM871DtkGHoDnrHH7igo6/0/EnmWUjovUl0Bn0fUSHarblfLr4ZxorxtG24IZppF8hqVCLrOstarCQk1WSAiZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(54906003)(6512007)(478600001)(6486002)(66476007)(26005)(53546011)(186003)(6506007)(2616005)(2906002)(4744005)(66556008)(316002)(4326008)(5660300002)(8936002)(41300700001)(8676002)(6916009)(66946007)(38100700002)(86362001)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0syNEdjbGo1V0hwMk5jM2RIbXpjV1BtTXVGaU1rek5wSXJ6S2lwaWpTN1dZ?=
 =?utf-8?B?VXVYZmVzT2p4WmZsbUhYZHFNYVV2enBVNExFMlZoNTdQSUFOdU1QalRDZjJQ?=
 =?utf-8?B?a0RXRm5xZG5uQ0YxcmZGZW81VjlRMFMxc2p4R2RON3VNSWFDa0JNZ25WZDJ0?=
 =?utf-8?B?dTgvazZJQ3FBazFWajcrN3NGYmRnelpGT1o2OUhpMnhuVGcyMFB2OFFpWVM0?=
 =?utf-8?B?VTBabjR3QWlsZks1TUtJOFZEQkdtQWZOSGU5bDR0ZjVQZ0dEeEY1QUZqSnJt?=
 =?utf-8?B?YWtFL1NKWmtFMTFEV3d4S08rVmVqSHUrK2JXZWVidlNBVGhpRXdESEFXQjRB?=
 =?utf-8?B?YU83UlpxOWZZb0xOamtNQVdyd2JBeWFndngxNlhqMWxISUIrSmRjU1R2eDZv?=
 =?utf-8?B?a0dyN2F6aWtMemFFMElqWG1RUnJYcHZHNDVUdkp3b0pibVlGN1MzcWgwcUFp?=
 =?utf-8?B?ZWdJRGR0NW40UGh4aUxqdHovQ2RTVnV0NS9LNFhVNEVXc1NtKy9QLzFpWjRK?=
 =?utf-8?B?amFQenEzelFGYjlycGlsSHNEZCtrUi9jMEx0NlMrN2VGZUoydlBMN2NVN2VC?=
 =?utf-8?B?Y0pMajJRcUx4TTd3Z2FqOEVSL2l6VkE3VHNya1ptakI4VHVOQVZzZ2E4WUJ0?=
 =?utf-8?B?V2JUdExBVVdYZ0VXdHJmalZPc0gzVHlsK0NXN1BDQUJkQmNCelI5Wjc3eHlU?=
 =?utf-8?B?S0xXV0NzZ0ZuWm5ub2NHQ1BBUThmVnBOcXVnOEFWeGV6d0I0NWtabXNVRCsw?=
 =?utf-8?B?UmhYQ0pIaVhsU1R2YWxYc29IcEdXYVdoaFJjOHZCY25hMWZlSnlOeW5CK1VL?=
 =?utf-8?B?elBTVGpZNUVhdHQrUzduOGxkV292WEZYQ0FUVmoyUXJYVCs5cFBZcUcrc0h0?=
 =?utf-8?B?V2pvdmZhajdqZVZJYVZ0WjFjRERzUkN6VU1SRUczcjBHV2IyU0FKY1lzOGFI?=
 =?utf-8?B?YUxNUndlM2Z1a3A1RHhwSWFzZ1RoT2tFZUs1V1ErQ0Q0clFsM2lOeHBVY2hG?=
 =?utf-8?B?MThjVTc2Ny9lL2wrU01BUithY3NpT0dLN2JPamcxTWhQT0RsZm5Ud1dKMjhm?=
 =?utf-8?B?TzhiYThPWVRZenA4RVMvOW1zM3AxQndjN1YxYU10ZUVtYnNKVmc4dkc1OFBv?=
 =?utf-8?B?Vi9JZmpIYjFJWS92RnVjbytUN3QyZ0RqbkRjZFdGNDY1NWkxb3ZKVDdSYUNn?=
 =?utf-8?B?c1ZUTGx0TXRTM2drOExoL3BFdWMzUDNUQ2MxTmpJdUV6U0RMTER0bzBZY3h5?=
 =?utf-8?B?UTJ0dW12b1NzUGllVGF1ajdla255aFZPRmQ2RC9GNVFYcjBvajNTb1Fodlh5?=
 =?utf-8?B?Mm9Vc29ud2piUFM3VHZJTlJjKzdVeVNTYURwdVNDd0NDckl6M3duc3NyL1Z6?=
 =?utf-8?B?TXYySWU5ZXVSWFdITmlma1BkQkJJTFNDZ1E4YnJPbitZRDhjODA4REFxZTN0?=
 =?utf-8?B?ZkE2emlQdVVkYVRHVVluQkhLaS9hMk91Z1hWanl2clc1YkFxQnNzWTJqQ0VG?=
 =?utf-8?B?ekcyRDV3cFV2RFFLNnYxU2MraHpRbmJENDFsR1BvYUhMQy8wZkxVU2hRL2dL?=
 =?utf-8?B?TkU3TG15RHdLZHdJYTNpVWFFVzhsUTBmRHFNeCsyTGhiM2VETGtxay9KdjFH?=
 =?utf-8?B?R0VGYk9OdVd0TzRGSXBIYytid3YyYW5TcjcwTUhiVDJELzh3RmUzb3lRTW9n?=
 =?utf-8?B?MDNORmZxK3ZXRVVKbkZEbjhEOURYekFENXNCNERzbEhURzMrQ1ZMZ1Fkanpw?=
 =?utf-8?B?SUxEVEcxczQzOGh4VXNPdjBmNnBGUHFBbXFiOE5pd3ZVaWwwYnBnZTdieTFK?=
 =?utf-8?B?TlA4dlpqQytiS214MWIwN3ZtL0NRS011djdvZXloQ2xHL0kyak1DSnUrY1NY?=
 =?utf-8?B?a3hEaFRWR3NNOTlKZEpYeGU3a3R6SHA2MTg5MVlzNmVKZUFnelNkRERCb01E?=
 =?utf-8?B?UUVoVzJ4cGVJLzlhdzNXb3RUS2E4TW5wekZ5MlZONndMYXd0dkFVaFZJSi9K?=
 =?utf-8?B?cFordlJoQUpJb1d1NnpFUjFWUTBDQnFhS1FhK0EyTGQ1YWVNRmFPalhQK2cy?=
 =?utf-8?B?ZGN1MTZ3RFU0b3R2NjZlSnl0ck5Xb0V5VEwrY3VYZ3hYdkdFdmhoUUgyQ0Nm?=
 =?utf-8?Q?IS5HCk2wlr28te3rHhtg5hp60?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1860ec-aaac-45d3-3b92-08db8e76f125
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:56:10.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0WobuZOlkPRM+sQsXuxU//GlHQyrVu363Dou3fOrBLQW4K2Bkb9v+7lRghSeOuzA4dMxDlBz8Wln2UDqlOX1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798

On 26.07.2023 16:01, Roger Pau Monne wrote:
> Just like it's done for the XEN_DOMCTL_memory_mapping hypercall, add
> the permissions checks to vPCI map_range(), which is used to map the
> BARs into the domain p2m.
> 
> Adding those checks requires that for x86 PVH hardware domain builder
> the permissions are set before initializing the IOMMU, or else
> attempts to initialize vPCI done as part of IOMMU device setup will
> fail due to missing permissions to create the BAR mappings.
> 
> While moving the call to dom0_setup_permissions() convert the panic()
> used for error handling to a printk, the caller will already panic if
> required.
> 
> Fixes: 9c244fdef7e7 ('vpci: add header handlers')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I've committed this, but despite the Fixes: tag I'm not sure this
wants backporting. Thoughts?

Jan

