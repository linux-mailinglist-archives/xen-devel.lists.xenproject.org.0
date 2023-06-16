Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4573304F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 13:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550104.859007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA7uM-0005MH-7j; Fri, 16 Jun 2023 11:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550104.859007; Fri, 16 Jun 2023 11:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA7uM-0005Jp-4r; Fri, 16 Jun 2023 11:46:26 +0000
Received: by outflank-mailman (input) for mailman id 550104;
 Fri, 16 Jun 2023 11:46:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA7uL-0005JP-IA
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 11:46:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ae8df68-0c3b-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 13:46:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7550.eurprd04.prod.outlook.com (2603:10a6:102:f0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 11:45:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 16 Jun 2023
 11:45:54 +0000
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
X-Inumbo-ID: 6ae8df68-0c3b-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gePkfqGxg4NkHJh9eGgqRzqbd8wq6YRwnHPtImMwOzCUQnF4ZxxxE/IrniL5I4Yt+YUMtQ46XHsCMDmbkTpHuObMXjnT3poOJXE+7IKHXELdBVZY1UZTXiTYeEniGkwBFPDVRBcqD4eH+5wctm8I7oMkK7bDoRfPoSXWlFKtMPQgDMLTQiMPCWJ4KJlEiiNlurXarz6/A6i/QcdlhPo212MHCkhNtLfNxGtqV1ogGLOdfTDvj+wrEY8aptf8Z3JK6TUBogdPVk4a7CZjrvTeTSJVwzpdrB3bUKbfiwIaF0lNQfcwOvSnT7VWwFabOUmn4DMrrjz7po/aY6JNRbUkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gP/RNkMO0WWOMIc3XgIlxMNETbrI+EWOuYsy8qTCyU4=;
 b=e6aOxNvVmKNQFL+29w+/7B7wuDoVONQ78uUpjuLiP6UtBWAcJcSwdp/46n9WzS9w8dufk5ujF81HMiN2kVlsU9K/727Bixmfzo9RLFbcLclRVOdz6u8YZagxup6QOiK+EnBeDTbmz5vupHeHVtL6Fr7a6Aah7AQXWmqS6JVWoc90/lNnJUhq32Ha0DLCH4mAsuMFXRwmJsyu0UOuX0ZjA1fSajPsqIftOb32Q5ykHrZYBbodfwRYQog+jFDFcIFX1/2hSNeIxbCJnvwAl4qwXG1lD0gtnNGFhcFItZKeFL7pVcU/Vs10Ci/Mh+4sZ1t0Cs/S8fo0ODBz5VXPGjBP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gP/RNkMO0WWOMIc3XgIlxMNETbrI+EWOuYsy8qTCyU4=;
 b=eHX+SjklDsK+MeC48g7P8Z1lyOR9rYursjbpqf32QQYx2QabST8wObRkAhGAamwBaixX+Y0iCDOuyaMLeLa87g2u75C4UU79aC4GPAeBIuv/2VoA/3vLyuF1uqpfvQJdvaaIkdbAEcbKPixfA79f7FoL7Bz3p1KF0DCRxjI7YWpVy2C/gMbUapYuNJDayWlLS2x+nZnKasDhlojQBhxdtO0FdaNCA540ZSG4WguWzAVHUQb+EXXUFKiiB5bZFs0MwHSdAogMAqqrDauvYhlFnttuYCqyImuMbLrMrjVg7mxvpcuEeJ3YV+BBIG0jarLCJLFQx29myBpShzN2WItesQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25c54a63-4d59-16b3-6833-a3c7ba6c43c8@suse.com>
Date: Fri, 16 Jun 2023 13:45:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] Config.mk: update OVMF to edk2-stable202305
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230616102908.59109-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230616102908.59109-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1e6192-4cad-495d-8c5c-08db6e5f3dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	80qqoujM9nkSdpxxxEhKKxDhRXMzYthf8Z26iBomMi5cnW4RGuugHSTUVrRw32kcxdiXJrqYRSugcRaBD6pzDZ8knPgnVKX9aZHHVdAL01SYTJRA9X4bv70NOMTJUvitqlelOXPWwg67B9tfVuYyqD1fWK+87j3fQZHF/HQnDcKG9k0pzgHc37UA6xHPdSfz4tQVA1nBnr4B3AvuTx64pGITqcywt8l+zBqjaM+2LMbQgWuvwnoUfBVJWbthQeD2kFM5eGDYi1dtTYnnXubUL+kAMuXvYsIE2P4XqHsbUF3sgGVLAlhyNP4yrIg8ailMz5ELpBgTAgS1JMjtER5e9hh8UOJIKTWlSdLISkpMdTBHkvqOaEsaYionHrJtimwa5nSKQ5SQBFr/LEUB8dBh2pV1akjvXhrC80r9hu4NLeNVKVvxLb2wcZmxzLcL3fp9v+RcgtaLYLdZiEuzKxY0TxnQdIjhHUUsHZKdWh769ggKFv0pk1HBt/GFvveG9l5wgNrmRRd2DFyWHDaPHY/ZvY4KctkUjeFdmtNppgDWfO/EKzZvlJ+VORJ7xRv+gKbtQ+MnVmTItaMrGpUM/xjj0kxXDaNeCrrwuCL8e+e0DmAWtutvCN5vkoWEbhdCWsKB2o3bMh6X9s1r9Q8YgGVGTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(54906003)(478600001)(66476007)(66556008)(66946007)(38100700002)(316002)(6486002)(8676002)(8936002)(4326008)(6916009)(41300700001)(31686004)(186003)(5660300002)(26005)(53546011)(6506007)(6512007)(83380400001)(2616005)(31696002)(36756003)(86362001)(15650500001)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlVGUml1dHl3SjBhcjZrOCtORTAvSUZKMUpZTFpPUEp0ZlEvU0lpNGZLQzJ1?=
 =?utf-8?B?R1FnRjkxR3AvZ1dLd3hVT04yL29vSnVGOHYrYWxKNCtSb1NKVjVyOWJwNW9Z?=
 =?utf-8?B?ZHF4V2FKdkRlaGgrNE44a0tiSFlVVzVmQnlxd2JFdG1JY1Ircy9IajlpblRD?=
 =?utf-8?B?dFVXempZc0JzWDEzUzZydlFpREVSeCs3WGRUTFRHWGJBL2hOK0VjT2tSbzE5?=
 =?utf-8?B?MmZNWGtIdW9TLzFNY1BUakpKKy8xSXRCUlh1dmE1cWRqWHZ3N1VXL25LOXZr?=
 =?utf-8?B?NnJxakVIdEw4WElqNE8rc0hIS1VaYmRCWVRKUXAzNXBzMkU3TW9tUzNJVzI2?=
 =?utf-8?B?NklIM2dqUFIzLytjQTY4b3NjTllLdGU2dHBBYXJrbTUyRkVnZ1ZUN05XM2tv?=
 =?utf-8?B?b3hUWlg3TmZoUng4TWZkbG03SitqTnVaeFpFSlY1dXdwWEpzbXlFanljcFgv?=
 =?utf-8?B?VjdvRFFiTXZ4VVdiWW9Vc0Y0UUZGTm81aUV5cnBSK1RWRzVJb252UjJrdk9Y?=
 =?utf-8?B?Rm1PM3JzNlRFT1VRelZXd3hYa1JKWENhV3lORVF0TENLNjBJTXdBa1lXdWE3?=
 =?utf-8?B?TXpwZWdVSUlvMUQvTEE2dlFjRnNyL2lsaGFrK3p6WEVJcFc2aGl4TUVOUGx0?=
 =?utf-8?B?akluVkpVZDdtUFpDKzFaaXdNa05EVHByTjhEbzRONHY4N1FTU1FIdFpJOXIv?=
 =?utf-8?B?dFprSmxHZ1N1VWZGK2w0QmJaUmZwUG1kMU5aR3pmMGRnN2FESnF3QnVxWEtZ?=
 =?utf-8?B?eVBjRFFLQm9oaTNiRkZBZ2MxaGpVNVBldzF0QUVwVTRrNTdXcmI3K0tLaEtW?=
 =?utf-8?B?Y3JrbGNPWHdmT3UraXlpY2FlMEhoZXA1dmNxWDdDK09DMlNXYkIxa0huc3Vx?=
 =?utf-8?B?Qml5aU1nMmoyUmdYTDBObjBBaU1JNC9uQ2YwTmFEajBHQnV1RE5xS2h2Ykxl?=
 =?utf-8?B?WEtoMG0ramJzcTRIenoyK0szQ2M0ZzRMRUYzT2RIWEIyVXdEZVN2Z1dXejFh?=
 =?utf-8?B?Znd4THNmcDVJQ0l6NFFBZGc5MFdDd2RmbWQvRjFQQ2xNUkdBSTY4NGVaZ1hi?=
 =?utf-8?B?c1E4RnIybDRWS05qdE9TdzhHVFhOZGh6OU9JTVdWUytxRDdyWUVOTDRkMENu?=
 =?utf-8?B?NVNhWTdsQkJzVHFmRFRGMG5FenU4OEtKbnZKWnRHS2RVditTSHdRbnZ4aGxk?=
 =?utf-8?B?SXhkOXUvRDB0QkZzSG5nb2dYYWJGSWdpRUsrdWdsSVgwY2IwMlpLd2IzNGlN?=
 =?utf-8?B?S0xTZnpYSTlBbW40NWRleDhzWi9KSnd5TXZZYWNyQTZ1Nk5DNk1NcExKWUJ0?=
 =?utf-8?B?MDQvOUVEUVRyRmpkM0REdzF1QlNhWUt2MDN1YTQvS2JXS1lVNWordDYvRHJk?=
 =?utf-8?B?UVV4TzBtUFlrcWp5eHFEaFFMZkhuU3lMT0xwbHZyVncrMXMzRzJGNVlSanBJ?=
 =?utf-8?B?UVljbHFjWmsrRm4xQ2tlS0lvSVBkSU04SWYxQ0NTeFFFZkNTdHRLSVJvc3Vp?=
 =?utf-8?B?UE5OQnZmMXNrK05KYTVSSmRUb3VqVXlpQkxYVFRmWTVNVlpXRGl0QjkyTXBj?=
 =?utf-8?B?M0txZXU1aVo5NmhpcUhSZ3hndktwOFk1aHdrYWFlb3FZMDlZVTYxNkNaaDhM?=
 =?utf-8?B?dFNGbEN3ODZWZFVzcjJPWllqcGZvOW44OG41VmdUK1NmVEFFNGF6ZkFjVlU3?=
 =?utf-8?B?eUFicVc4MjF3c3R6Z0RoRlhmeW5KN0FadUp6VXFJZWhNV2M2dzh3N2tPUnFy?=
 =?utf-8?B?V2VPNWd5ajkzVGRnOW1XckYrZjJLRitHNU9xTDRqaldNOG95U01JbEI2N1JS?=
 =?utf-8?B?VkRYQi9yWnlzQ2U4d1hwTmRWcmtOak84U0R2WjJFdDhLU2VIbEhFa3BBVGZP?=
 =?utf-8?B?UktZVjVWbDhSZFVVVjFObkI0RWpENTEyZzJOZmNLeWlwTGh0Ykg1T2hTL3dn?=
 =?utf-8?B?N0RNYzB1bkVnaEE5Q1NvajQ2SFBzMFdwVnNNV3lVc21hcmlsSEpibHdNM1d3?=
 =?utf-8?B?MExETzVjeE9WbVVONURDM2F0SS9aUWlWUVRzMXZGMGEvWk45UXBFdVBPVExV?=
 =?utf-8?B?RFFnM0dmcjUrdElDdjhrTGpFdUV3OXU3b3VqTUQzVDFoZ1RRMldTbmpyRUNO?=
 =?utf-8?Q?yvuuiMjlKrwzWoFAVCXNdfUGp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1e6192-4cad-495d-8c5c-08db6e5f3dbb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 11:45:54.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4Uc65TVByRYEJCkVKpr7wF/BrOKk42vJIHoQ+8DW7b0chEEFK7FuUC6UXW7I1Y6c3AtVC5XmTTSRRARXnEaOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7550

On 16.06.2023 12:29, Anthony PERARD wrote:
> Update to OVMF's latest stable tag.
> 
> This is been prompt by trying to build Xen on Debian Bookworm,
> where edk2-stable202108 doesn't build. Also, it's been too long since
> the last update.

Hmm, yes, almost 2 years.

> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



