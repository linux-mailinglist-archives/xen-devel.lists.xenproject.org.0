Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E466A5A69
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 14:55:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503379.775631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX0RM-0001m3-CL; Tue, 28 Feb 2023 13:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503379.775631; Tue, 28 Feb 2023 13:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX0RM-0001jL-9U; Tue, 28 Feb 2023 13:54:48 +0000
Received: by outflank-mailman (input) for mailman id 503379;
 Tue, 28 Feb 2023 13:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX0RL-0001iw-AQ
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 13:54:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74b054cd-b76f-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 14:54:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7245.eurprd04.prod.outlook.com (2603:10a6:800:1b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 13:54:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 13:54:41 +0000
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
X-Inumbo-ID: 74b054cd-b76f-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNLIEmuF1R4GPCQ6EQ5M1sy7wuc+dziS9H/OCSExMpRrYsRNe+JB4ck0uvSTOxvfeQmsCbAAkeju9Xj7VbfmrFYLuwC7DPmCGByHdHOMGVraB24K21Ji5COXfLIo0H9bV63bTkCw0M0JV2tESSYU/5stMJw8ophy4CK1cP3SzHtBIdjYQDUSLRU/r9gEqqmHsJodHkbIRgm+B0j3lyH2QeqQg7jHxIamD/ZnIgWZwhjCf56RmhHj3fAzivIOglendSfNLft8QhMMDPKxwMj/x+lTeHTMB9VO1QP0YmIHWuF4jNYlyEtrBnBHMBZU/3kp2uO8/RdHi9jQ7wBK4fZ6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gykwv65k3Yffqhsud5qsfwAdbPu/bgdZv7XtGsphVcU=;
 b=eFHvYIsV97569V/a1ao0N4uutu04iy2mRzi0IMlV0vH0Af0IppHjuG1lp7UZ2FvSQinzHWgHVNisbsnfObJhp2rLADKiY7MJV972TMBXyqYW8MRJ0ngo9Qw8SRHMz7E4dknr/H4tlqgQX4FC/pHL9FpeqTw4nixQLORj3wRUJYqcDJ3dn93BmdEDoBRrAIeuzXF7vAyPL/j4J1wOdl/mvQqWUH+2RtxPH8SaqwCUnZTTrmq8kLEWgngZYgO7mJ6WodYPDf1lgKGLuNXDKMm9Jhca/HPEwSeKg/Mk6qYUt9p4JKkC1WhOECbiFH+W4dV5Ju5Ud0Z/y/3fG6gKkPu72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gykwv65k3Yffqhsud5qsfwAdbPu/bgdZv7XtGsphVcU=;
 b=EFP+h+5nfsMt74FxUgYnPzeVZp/4F+X9qRJ0PUZiWRwnMccBRLX+D+zxVHdtZ4/M+JGeYT1LckbJogz8r5ZdXcXiYe5uQkP4C5wjfTwZ00L0iuNZDkRwso6claFRwzXW2IuwpZrSL3tCApYZPPr2DBr0CEt0CiGysav/priLUV/oKJM/NVKNVGssM3AXsZjMa5Bm1d0d0oixH7VQ6BEnnjtGktqbZfRh7SLZMcPU83RHe5pt5WIPkRAdBArwmjkuoYG3Zhw7kfMDZw96qOe1qksiTEXyIlh4kvNkzqDcLX453q0W9+VvnulaDxcfg7Yxab7NTdLphKK7Krg5QSpqlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75987896-01d8-b706-4405-0b248498ec34@suse.com>
Date: Tue, 28 Feb 2023 14:54:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] x86/vpmu: rename {svm,vmx}_vpmu_initialise to
 {amd,core2}_vpmu_initialise
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230227075652.3782973-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: a98a3a25-1a25-4cac-613a-08db199356ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTY5qSHeuApbxrlgrscu+fhtITouID3+emQdbw0dPX/yakFoOf9VmzYgGxun91MHeXKsJ94opNA30zSPBnqMMiYH3qSWWi2EDxLIXOgtx4F05IrM7+O/3+ZYZd9ZjtnkFbxuo2VEiQhE/pjxmooMlPyO5eLV/FopplBmSOGbeQMswP4/N5raKibAaUaue2+tzMS5UyJraVkXIrmlph+Za85h4s1i2ttSSxLIoWpC6UUhQ0Hf1qFGUidXEmnrqh+D1u75lnLGpZk1qrDUE2lEZk5lbJCyGF+w4F17vJr1JoZCXdspoq83qy2V4bvTxlmyBo4YmlIoVpKH/DkJqc8Dq2RM2fgrzrmWjkidoIUUHosniT0qF3wLHZKOHWR4l9LDgje+wlZJRdi3A6/W5Mo5hHFKtM5+tqk/T8MRvNs5j3ny7JW8IRFsEByHQl8IuGz+ELSbGBNlGGTNRDJVsrhD8nS8/jRn0TVlkq5LkF2tYQ5eyF1sEaJPPD2u/pOhdn4qgklDyLKhCCp3hvMmZFo0K/3wjLYKykO4OEU+rWQsrqbkdxSYerr7d/73wBbnXBLrQoPkVCDt3yD1h8Z0IQi/zhKx3xlObcG9UFadXcjVyyFmuPL5IqjSCSt7bcpfQAmdmlIGzqtUJ9m9YWWQm6D1TLLVi8eYVY/9Bu3yEDhd1M7xaoY/x9DZ93K+dP7bpouREvK56O24Sbv36cZRbyONok3MOQdjqvj6HdPE8NUiW1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199018)(54906003)(86362001)(4744005)(6486002)(316002)(31686004)(478600001)(31696002)(53546011)(2906002)(186003)(41300700001)(6506007)(26005)(8936002)(83380400001)(5660300002)(66476007)(2616005)(6512007)(36756003)(38100700002)(8676002)(66946007)(66556008)(6916009)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9BWHltcDB6KzE2WHhidHhBZFB0bGJ5ZkJzSnlKb2FhOGtjOWJxWnQ1QU42?=
 =?utf-8?B?UWhaVk5oaGhaS1BJNHpXeFJBemlzOEJ2Nk8zNGtYOTgwZ09kcW95M3JCUjV3?=
 =?utf-8?B?aUg1TE1sSDdmRHJSL1FBaXdJcnA0TkR1TGhlT3lrTlM1cHUxZzN6RE5BbkJa?=
 =?utf-8?B?bnNYUXBrNWZOWVllMUxGcVd3QnJPMjZhdnJQZ3NTbTU4L3FxTHlWNkhUZFVB?=
 =?utf-8?B?MkM1YTNxaElTOHNkNEg2dW9PVkVVaGtpQUhjK1lWcVk2ZUdWQkRzWEhXd2l3?=
 =?utf-8?B?cGlnbXpMV2pvWDJva1NUM3hvcm04bFZWYm4ycHFKWm50Z2xzMFBReU5NVWd4?=
 =?utf-8?B?SkhQbjBjdXQ5YVFtbmp6LzdZUXpWcEFVci9sZC9hb240Y0RmT2MxQ0lKL0xh?=
 =?utf-8?B?VWw1aHlMNzZpbUpUUlZ6cVhnV2RBRjAySFFsV00zMUx6Sk94emZCSDhkNEJT?=
 =?utf-8?B?d2VLWVhmNVMzTENkbzlFTlRuMnphNjhPNXNFb2VLcit1UEFTN29yR0hpeXh5?=
 =?utf-8?B?eWplN2FPK2s2anVSVlZ0OFVveU5GdUNXdUkyMWtSZXBXeUhJZnM3dTIwVUFK?=
 =?utf-8?B?NTBveHkxU3p0R054bDFaSDJOZld4TXg1TVJiWCttbGZuZURFNEdYMU9venFB?=
 =?utf-8?B?Z2JqRXJvOWF5Wkxaelp6OG5qSHJ2YXNadldWSHU5NzNNVE9PQW8yaFFxM0Fx?=
 =?utf-8?B?SUJzSTZnamNUUkRFTEJvOTZ0ZTJhT1J5Zys1cmQ5V0xKVmZBcEVJMUpGMzFi?=
 =?utf-8?B?dWJZdnBUTktpcEhuOGpvUGxqSFhzbGVZeHd2RWMxQllUellab0w2TGJEeDdn?=
 =?utf-8?B?bmhzRDltTnFaNUl6RVlRVkQvYk05aFREVGZBMWxvT0hwVUtGWjV3aG5CQ0o5?=
 =?utf-8?B?L0xyV3gwV0NXcVJJUnFQeTJiczVuTlZ1aVhqbWJvV0dVK05NS09OSkhrdVI2?=
 =?utf-8?B?ZzBtcGJadkx2TVRpbEYxOGgyUUtJT080K2lmYlJjQWgzaTNYRzIwM3p0Rk45?=
 =?utf-8?B?dGpqTHh2aDhNQlJWVTBIbFkvcjFlSVQzU04xN2dJMzIvRGpxaGxqS2psUlRF?=
 =?utf-8?B?L0MycjR5V24vV3doOGNqZjZIbTEyOTFhVHR4M1RvZ2dUalgrSGc4eU1ZSUg3?=
 =?utf-8?B?Nk5QS09iUGtqbjRVcEFNZ09XU0s2d3FnUEp2UmRUNUQ5N05sM1N1bWNUZkND?=
 =?utf-8?B?OFhDTFQrSnN3c0wrd2c5OCtGQTAxS1FjUnBzQ1RZVGcwdVZpKzdvOC9NOXRo?=
 =?utf-8?B?OFRxMEtpUjRmU01BT0FhK2QxbkxyWE9OOVg5T2lZTDNKeXNVM0NEUDJFOVVE?=
 =?utf-8?B?d2RzK0FXQldFc2JDcWlTekVkZlBzK0RzOHNHL1N3cVprTTNOeWF6Q2V5Z3ow?=
 =?utf-8?B?ZlYwc0M5alNscDFIUW9ISFdzYW12VFJqK3NuSm5aTmJrd3Jmd2ZheUV5dFA1?=
 =?utf-8?B?S0RmU3B6RkRsdDYvaGp5Tjh0MWI2K2FkTG1QRURXcVVHMVRaeWJMZlhKa1pQ?=
 =?utf-8?B?ZndJMnFDOXREZmZmSHRFdm11dStwTXd5a3UxbVN1ajBzWWhmT0N1MVlzVndz?=
 =?utf-8?B?U2Q3MDhldEwrcjF6U3ZzQTY5cURQa2FPZTlqNEN1VGU5YVRlczVrZjh4ejRL?=
 =?utf-8?B?TzBmdVZKa0NCTEFlQVMveXdMODVzVDgvOGpQZFl4NG04QitmbFVDTXJJWGQ0?=
 =?utf-8?B?dy9kd1NVT2pGQnZ1NFhiOFRNRlpVK2x4KzFzUkh6aVNYNkJQRXZucGE2YTN2?=
 =?utf-8?B?TTlSM1k3YzRacXFlcUtmMmJMK0tKVmVBNmJiOTlhZStrYWJyRlhZRlF2LzBO?=
 =?utf-8?B?UkFZc3R5WndSU1A2WG9PNS9jL2FzZ1hMeGN0MnhGRkRnYVBjNjB3MExVdjF4?=
 =?utf-8?B?Ym9YR2NNOU1xMzJnVjQ5OUZJNjRjT1FlMDgzc3RaVE16bTlSRDVacmUrRm9M?=
 =?utf-8?B?bktvamY1bHNxYjdTTkdzTjMrVHNhL0QwYTRjdnEvZnJKbnE3UjBOVHlaZ3hB?=
 =?utf-8?B?NXlKM21HV2RWSXB3MkxBUm1TYmZJMzZpYzBTNjQwM29tcnlIRWVabDhLakRP?=
 =?utf-8?B?bTV6aUlwdTRpcE1XODZXZW43VStWVGJXdi8zek15TGN6dWRHdURWZUJUOEMz?=
 =?utf-8?Q?vpTv9q5Bm8C0loZp2zcJVeB9E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98a3a25-1a25-4cac-613a-08db199356ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 13:54:41.4216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9byzr0MHXk8jGqxid9nE2uSnjTJZeUaWv/GfHTDiESwwmt4c2KKoeNRkTxnxZOr3K5VUR0eqPbES1xd29aKDiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7245

On 27.02.2023 08:56, Xenia Ragiadakou wrote:
> PMU virtualization is not dependent on the hardware virtualization support.
> Rename {svm,vmx}_vpmu_initialise to {amd,core2}_vpmu_initialise because
> the {svm,vmx} prefix is misleading.
> 
> Take the opportunity to remove the also misleading comment stating that
> vpmu is specific to hvm guests, and correct the filename.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



