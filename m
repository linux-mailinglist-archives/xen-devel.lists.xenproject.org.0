Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0A7F32A9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637920.994014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SyA-0002gv-Rk; Tue, 21 Nov 2023 15:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637920.994014; Tue, 21 Nov 2023 15:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SyA-0002eE-ON; Tue, 21 Nov 2023 15:47:22 +0000
Received: by outflank-mailman (input) for mailman id 637920;
 Tue, 21 Nov 2023 15:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5Sy9-0002e8-HK
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:47:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40bb183d-8885-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:47:19 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6971.eurprd04.prod.outlook.com (2603:10a6:10:113::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.13; Tue, 21 Nov
 2023 15:47:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 15:47:17 +0000
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
X-Inumbo-ID: 40bb183d-8885-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUPhMSFnfTelg6rO4g3KBivgahbpgEsr7AyLL89eodDE0aKHbupy9pISZ44GDJ6AqfIHzSqSMueb3474jS47nDqy83WURgNuJQveD2my2Wvsf5d8jLcxIq8jb7v4wreH+inw6pJr+R4yhsMrcWPaBRb7nvReTgjc7KjskbIP/ZSBN8lt8IeloDf6JsRhiyPRBSSd2F2JMquYYRfACwiaQyC1M8nzBXoYZDwwHIdkAD/+B9H+iDEbuGe2yr+YoAEvEqZ7aWF7QaEjqA8/z3FXXR3RqNuJPt6lNMM8aua6OKCBo/hAt8SmrxNTYScGwdPDBh/A+CvZ1RH+GhNEJW6TVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoW3MA7IaiU5pC5iVJRA2U5jJgglhERYQvHCcGt2oFc=;
 b=BmT5EEpi+ShMNr02fHGk6E+SjSwfUDum9E17tl5fPsyjX4SzEexPgVK2lcsmI7Copdfx9WOxQdGUOaUgmZkdZbBatqZSSreJMjuXa6HuaKV+/3Wry3PGum0QMbxplHSOjAwtP+PeCqW0RvLOSy4hzIiqmy1cu4rz9XQFY5HsA9jCYUmoLukR4giofF2jq8guTGgJNkgtrTpKOPhcLytkpFdwDEAd0e2gHz55RoVMuErZUHM2o2NyvN1HwbTvUa9S50V7YEe+vBjHG+UKbZqDs65F/4mlPDTPwUnId2R/U4+UmleXFDgflErYr3ZTLGHVXyhMo6eg3yZxi2Hg28mtWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoW3MA7IaiU5pC5iVJRA2U5jJgglhERYQvHCcGt2oFc=;
 b=BifoIKW+E8DIwYyz+ZqQmAmqn6nzWc/sisVrjkrVII2gO4IX9JLEsjQDE/zrtPBjLCArWz9D0iHw26CJzBvZj4EOk8kqrwk0WtLEpPdyAdtOKjNtAiXXwg1w5Pc8HTOM9OvrL1IaT5ownT2tgu9CMvfn8RkXcJ1B+AZ2DQkRm9KgZMXbGHu1oyufhSG+eXqhgSAHlbN/2Xsnm0qQC7PqUIxBDCngF2NmORbHWdMIG9lemsrV6lQIAfC5PVmqbj1IAkL1OC85qeUiCfLU8b8OLqXuXdlzvSChdVhpkXbuHER2t543Leefjx68gT9HambIQ53otPmI+Z7CYIp2pWGgcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8f2f588-f033-4112-a5b7-66a85c6fbe58@suse.com>
Date: Tue, 21 Nov 2023 16:47:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] xen/asm-generic: introduce stub header
 <asm/random.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <9a2b8920df291915ac6be0d14e6e9896e81ea9bd.1700221559.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <9a2b8920df291915ac6be0d14e6e9896e81ea9bd.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0422.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 042f172e-0583-41ba-deae-08dbeaa92385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	edE7B14hMy51iSCUQBQw2G7S37N1vBZXkMAXtZFmRjsfkphR3jKcYdTq/7BiB09PvnYDmTZ18Nq3G9RFlecH2p7Nq3YNF8XzS/VfySt++d2/6Jm3LKxd3k+7+TraL08iI4U5ecS01JzUZl09gScPSQbnjx0b+LeTwEU3ISLLUDXu1FIWRlBJrogjeuOqwrJdiKPTSa/4o22qSY8hNb961cqnQR7FDGX4O34MWa018pjmQ0T6wtW8iM8WcrX6v/pBuyDUjj3Te36vt2VR9LhOnoP7v/ygwrswnvHJAVGug7KQLRFtG43zXVKsUOs4GaUd0d/pJd0S2EVsiZBHkay4icACUHGad2UmQBvK3sUmWYB8GoKQBmTXJWLwi2GiaAsQNFX/rYkq1lUd1EtWTw0U4kY8Dja72tPz1XTOfgM2WA82XlZAi4p1R7rtopk/topqFjpTpf7rqhtpe7uWe6ytA/dnA/v1H7DW0IHpVBW8tBYru0pfz7Fk0o8Lf3+56DO5XqfGX3TeGRwUh0HUARdN7OmPch6DyM+R4EguCEwTwtcuJdS2q9mR1Pe3LzbXaZ5nJ9R/UrDhkk1DkyeWPYoGlrbxph4r+4DHOx9r2fVLGeJhZu+lJRtGgO0vqmWC/2nfWqhIc2rhxcuX8KeEOHb/+Qm20nD6bqYKhmMvQ6yoqj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(376002)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66476007)(54906003)(53546011)(6506007)(6916009)(66556008)(316002)(66946007)(478600001)(6486002)(31686004)(6512007)(38100700002)(26005)(2906002)(2616005)(8676002)(8936002)(31696002)(4744005)(4326008)(5660300002)(7416002)(36756003)(86362001)(41300700001)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzM2TU12dHpqOHFJVnZaakNQdGlDVk1wQXVJQ2Fpd3k2Qy9jR0VBUWtmRUhq?=
 =?utf-8?B?M1hBSEFoMFJtQmJLNE5WSGN4RERhTlJPWHZVaVNXZm5QYXlzdTU2ZjBKblB4?=
 =?utf-8?B?Yi91N2UzYiszSWFORjRIaHZjckNoQ1Y2ajg4eUFNRlpuODU0OG53a2grWjVV?=
 =?utf-8?B?YmhOUjdtNTdVZEFudXYwVk9FS0crOGJFVXBJeHQwdDgyTjI4OXc1QUh6NTdH?=
 =?utf-8?B?V2svRjVJVGprMlREQ2lOQm5xZzM2WGxpQ2IvZFNXc3gwQkNqZTcwN01rV2tp?=
 =?utf-8?B?aTcyM1FFRkF5QWFTMkl0M2NhaVVwWVY1dTNiMVpxYngvWEZ6ZS8wS3NLc1p6?=
 =?utf-8?B?M1Y2WW1GVi9KbVAzcWxUeDU0ZzhHV1pwak1BOExZRWhVak9yS081eVkrd2JL?=
 =?utf-8?B?Q0J4VXNUNXpheUNlKzNWbmxzdmNMTDlnK3dyZE00VUZsSXE4NEJiRklpbVRm?=
 =?utf-8?B?dGZvajNBMGhYdWN6WmNFV3BnSk1XV0ZuRlVBWlFWS21RNS85YkN5VEwySFNY?=
 =?utf-8?B?eHdybW95N1VmdG4vV0p2THlldmtTWTljVGpyOEcwWGpYSlZwRUFpdzJ4S1Z0?=
 =?utf-8?B?M3YrQ0dXMXc3clYxdHNvL2ZmS1lCb0hCQXJlZ1ZLZ25WSndVeUQzNjFxZFds?=
 =?utf-8?B?bjJDdlA5L1l2dUM3UWthTVJxc2ptVjgwZzAzVnVIKytoL2llcmttSXN4Vmc4?=
 =?utf-8?B?MFdXTDhJdyttTDBsUllmV1BPNjhHeGVNUWNJNFZKMnp0blRma1cvUXJuUFA1?=
 =?utf-8?B?S1dhTHFTQk5HY3BkVXNTSWdsdXFnSlpJTUxUblYyaTZVaVF2VlM4bkpTZGZm?=
 =?utf-8?B?VjRFUloxQjZCU1FOOG56QkJhYkxQTm1qazZ1aVF5NlVVbGNRY0plTzY1TXJD?=
 =?utf-8?B?L1lzc3UraTkrSTQ2dE9MaWZ3aEp4ZDIwV1hpRnBsME5aL3FQVEFIb3FYdDhV?=
 =?utf-8?B?VlNIbG1ualZoYkVxSzFFZmpNNDNEVTVFL3B6S3QrY2k5SlkwcGlrZWpMMjhj?=
 =?utf-8?B?eTc4eGxnUXFFQXFwdE1LNUxyTkdIU1FKWEd3WUo5UTZ2TGJsOXNtNGR4bWdS?=
 =?utf-8?B?cDFvTXVnS3QvR2lTeFVCRE1DSG5jZ2g0N3NPS05VSVBtSFkzV0tvTWZ0RkNs?=
 =?utf-8?B?WldGSHl4NlJWSW5UcWlkZmhWTXl2UEgvdGI0K1lybjhUcUw5dXU0ZEVQbElS?=
 =?utf-8?B?ZjdhN1ZKQ0svcEFVSEV4bDJYL20vSlVSVnJjVytsWXUraHdnbGZkSzZlRFJ6?=
 =?utf-8?B?ZUQ4a0JjNWFJWkZNdUNUbnRXYVQzdzltWnNrTzgxTC9keVV2VWZwa0lUcjJ4?=
 =?utf-8?B?RloxdnZZa2tEL3VnRE85dTQwUFQwQ3N0dFlYdGhrMTczVktuVHVJd3UzcU91?=
 =?utf-8?B?R0pGbm1sL1lqcEZ1Q0R5Q3F4R3J0MjV4U1VqcW0za1Q3ZFdjMitIT2dianJX?=
 =?utf-8?B?MzVXVzBTbXFMYnprSTlXT3Zkek5vZVd3UjZHMDJwTkVTVGJrQ2dZYWRxRE5q?=
 =?utf-8?B?ZkJkM2VGNThXVmNtMmp2MVZnN0trQ0cvazVmUkJVdkpDZ0ZIemtZVGFIME1F?=
 =?utf-8?B?Zjc1OTdzbGk3SlhheDJOQ2VWRENNaUt6MFVFNzFpeGl1cSszVHBkZGRmNzZM?=
 =?utf-8?B?WFZYSlE0bFlLREVwYWpwMkJQU3dBbkR0Qk81NThrSTR6UldtODlFSEtueGh4?=
 =?utf-8?B?bHJ1ZFhNd0pVY3JkMTdDVEQ2M2MwK0w5SkRHZk9LbU5hblJYMDVUdmVpRFRW?=
 =?utf-8?B?UzFvWkhKWTVnY2hyalhabTFtOGNNRm0rM3NYYVk0U2NpakNUbTBxRzVlZGV5?=
 =?utf-8?B?Mjg3aEJha3FMZncyZEFFL0hpa2Z3MTU4WFU1cjVCcXUwcUxneHFvaDkzdFUw?=
 =?utf-8?B?K3pmb0cwWlI0NnhWVHBjeVViREVIeS8yOCsvT1NmakRTcGh0TTRzeTdpc2kz?=
 =?utf-8?B?S2JIZUJjZXNBWWcva1JjZ0dobmpEVGxWUWtmcS9Zc1NRM25NRFNacFRlMnlR?=
 =?utf-8?B?VDZNV1U2ZUtBVGh4WkVvQTlFeHFES2FObG1DSWpUUGdSNURVajF3dDNBT1NI?=
 =?utf-8?B?SllaMUdqb2lPNFBlYk1tTjJ6VUNZTDlFbmhsV0ZqbkdYSVZpYmF0cnAyNzEr?=
 =?utf-8?Q?rqHnv+oDDPyICMFuiCulPCP9f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042f172e-0583-41ba-deae-08dbeaa92385
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:47:17.0594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFflMmThelp0L+snFnR0q+rs6UPRc/0+6W7NTtEccpcGA0o2C8m/icXqnTDnVta1up8doXDOKm4u2SSRocAE9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6971

On 17.11.2023 13:24, Oleksii Kurochko wrote:
> <asm/random.h> is common for Arm, PPC and RISC-V thereby it
> is moved to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- /dev/null
> +++ b/xen/include/asm-generic/random.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_RANDOM_H__
> +#define __ASM_GENERIC_RANDOM_H__
> +
> +static inline unsigned int arch_get_random(void)
> +{
> +    return 0;
> +}
> +
> +#endif /* __ASM_GENERIC_RANDOM_H__ */
> +
> +
> +/*

... the double blank lines above here shrunk to a single one. Can likely
be done while committing.

Jan

