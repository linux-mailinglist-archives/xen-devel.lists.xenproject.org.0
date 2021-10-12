Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4137C42A038
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206933.362623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDPt-0008KC-CC; Tue, 12 Oct 2021 08:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206933.362623; Tue, 12 Oct 2021 08:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDPt-0008IO-98; Tue, 12 Oct 2021 08:45:45 +0000
Received: by outflank-mailman (input) for mailman id 206933;
 Tue, 12 Oct 2021 08:45:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maDPr-0008II-Oj
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:45:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7640fcb-2b38-11ec-811b-12813bfff9fa;
 Tue, 12 Oct 2021 08:45:42 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-peeFuJZsM_aZ4wEQjb2epw-1; Tue, 12 Oct 2021 10:45:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 08:45:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:45:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0055.eurprd04.prod.outlook.com (2603:10a6:20b:46a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Tue, 12 Oct 2021 08:45:37 +0000
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
X-Inumbo-ID: c7640fcb-2b38-11ec-811b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634028341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPt/E1JfLJqoDnFH7T65ED/KwnzJBIlFxt5MNN0OBfw=;
	b=Mwg4l9WPMG4Ji5Beih+dmcFb2f3DWCSRzzLt5zKNlGhljsSfjuefrZylwFy1EDHpsewTRd
	peiIscCxHchYNwRuqK3C7Hvu4wK1pvzvrhlVAmyeyl9cxXft7/Mr8s7OI9tmy24cj7SlD3
	zthIKpMNKSSpReqitM36ASHj8z01uac=
X-MC-Unique: peeFuJZsM_aZ4wEQjb2epw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0hp8R84309ZbQDxJ7rOC9z/5SUpYHRxWXxK/K/vPlzW1QIi7CLZhg9HlcM2HHcy73kH8pPl8TNX8G4pM7Ln3WzFMHrgesP7kEAOPrQ68SLJq4CA4E8yg4bmUBGzuJlaafgZnWQPH783UXfT/jVQnMLx2+TMJOHDHZvp4ajuvcEzi3wY5ENyzwqA2N6GT4nnFMBepDVw55IyoYCnkmIoOAwFh9JIeTipGnHj0QuUOcO0IR5Lm3X39/s8Yk4AO4pW1Tbwn5HlDylZK08jDYsxFy4sXvP7xbopx6VFAcMXgptayFOm6yODApMYLQYW3rMgCSGhHXNv8OjNhuk7c8koag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPt/E1JfLJqoDnFH7T65ED/KwnzJBIlFxt5MNN0OBfw=;
 b=SFpN+a3Q90rUedKBDY7GyUUMIdKDA4e4pA8seEVLDOmNXjxKy5c/VUqxOVTL9NxhpUi/1JZ9g9OZEjqL5wl7cii4navmnoxeD1ApsEvBbZfJyA6u82X8/2NIHH/ZM1jt8+KIuIk0Lold6H7oYi91CUbDSJ0cEns2GrTmoDoXGqn5z8K33LbG7gV0ctgCohx1V/IhwkYJdRUnr5Wp25sBq4DTPoBEQJvYbwL49gAFbPWcKF2aWXujOvylp7zSsLErC2SsDbie96YU1tpd7DGFfm8l9Ynm/mouhgFuOXStKyWx9eZCj0cGoXk9jY7kMhtnjN5Ol3i2XGWXhymvyxMupg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211011181528.17367-1-luca.fancellu@arm.com>
 <20211011181528.17367-2-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f29c8062-8430-6e08-7d4b-02096a6b049f@suse.com>
Date: Tue, 12 Oct 2021 10:45:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211011181528.17367-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54ff1f14-7092-4c96-1ae1-08d98d5caa01
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61764DC53F03A93A19F9AEB9B3B69@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:209;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6RjXkSZ9M3t2YJWv4KJAMtplbtreER0elHdZ6SIEcUyb76ELwotGueHh/NX4n1wt6XorfNqL3fNfUZa4a4tXDc+7q1/JlOaFfAoz94LrKY5MnhB/i0BM0mHShdJGPcbYL3hStbf97Lwgq9JdK/0Rrek4CdSugiUVhIEFgWWJ/n4LPiWWvyDDYCI3+fxvR6j1DJYEu+xb3itzLraMObuJNr8bm39UK0FSBitobzS03OJWZzPTqnr2hRbFr2o1GjjDd9IrmPspWgH/vX1pJRUGb/UXSHog74JJgQrG5QQP2JhroKj1lfYGhsfMIkAWffBEXQKu+QidqlYtZTJ23SM6YGv1O2LQBJyaREFoZVQh1QOLzkajArr/02JV4lztzMStzccDhAcYXyyVK/d/kdbcCJE8YccmhQikaacPDbfwpi/eJd+J6YHCERofANZbMufGTEF+vMt8u7DsFVzEq7+DdAC4Xwu3mosZ2oNh0mPxMPxlrzRiXmAxbAsZoMIZ6dwLYGrvpfOfT/Eppj8wLO/igXPenzEeq+oz6MzJjJdtxRFmQvmSHmTkuMUr7t2399vmBK/Zyb0MDy248EqwD35jJt8naGzkQaylbFzX90e/QINW/xrLw5XEWvZr7RMNWinyDNdAy8/nh1Ls5LGiiZeQQLfLLXVubJYUaxdG1NDkb/ztUc9FRVfzcGfUiKIPVGymvakycdEt/S/Z6rtPkxaxZL6YDFz4znagDPIdrZwwWQMS+SkpzMBLt4Mlu0srkAEa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(186003)(8676002)(6486002)(26005)(2906002)(31696002)(54906003)(66476007)(36756003)(6916009)(38100700002)(31686004)(66946007)(508600001)(66556008)(4326008)(2616005)(86362001)(956004)(7416002)(5660300002)(53546011)(4744005)(8936002)(316002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXNlN1N3MU16dEt6TUc0M0piblk4V1FHR2l2bmoyRXlURzU4elA2S0ZpK0E2?=
 =?utf-8?B?K3czdmM5bUNMZUdncU5xaGZzWFB3TWk2NVc5TG8yaVZMdnRjQWRtdGNyZENo?=
 =?utf-8?B?OVJrNGE4MFk3SGhnWnVjTFhEQjdlb2Z2djdlak9WSGJBbkxPUkllN1g1S3p5?=
 =?utf-8?B?SElNd2FqWEIra0tmaUt5QjZxbkdROEZiQXNXb2xBcDJSNW8vUXZoMjdrQVV5?=
 =?utf-8?B?L0FBWWwyMFRhMXU2RUpBYnlUNlNOSXNuSDd2RVVZL1YwSWw0aTM2OXdKMTJv?=
 =?utf-8?B?Njl6bkFyVEVKU1VXYXp5Wjg1TzAxOXlkWjNiRmdvaTlWSVpVQjBBL2JQTG1E?=
 =?utf-8?B?TFdaaUlwZ016UHRxRlBBbkw5bytQcHoyMEtvRW9TZG1wbGRGWFh2VldCZ1lM?=
 =?utf-8?B?WTJ0Zit0azNNN1pkNnJ5WmZnNlRHMHBpOU9tOFAvTVc3KzQxbmtEemZiWTJ4?=
 =?utf-8?B?ODk1ZGRKTU53REdxdHE4RzVERkNPT01pdU5PUFNaWHo3K0FmeTJaUGVrNTFi?=
 =?utf-8?B?WjdROUNYNWlUWlZOTkZHaVM2WXlmMkhXbmFkT2F0TGRWSjhXdS9XK1k5VXAz?=
 =?utf-8?B?K0xaNmpDSkVOM2E1NDBnR2NaaUFVUjFFZFlxK2FzNFIvVGYxcHlWUjRiRDJI?=
 =?utf-8?B?REZyLzJNd2ltdVdiV2xkdklIZUg3WmxscDlaakp6UVArSFA1aDlFbEdnRVV3?=
 =?utf-8?B?WWtxRHpERHZKd1dLZEhxKzhvdkpjdnJNOUZMdWdVMVc0UVFqcDdjUmRsVmht?=
 =?utf-8?B?SFNXNHJtN2k1K01jOTYreXNkMlByRGxWQTNJS3F4aDVJNUxmelhBbFRFd3Va?=
 =?utf-8?B?emJmUkpISmtVK0o2YXhHakI2a3lqTTJOK2pHWUdsZ2ZIZGJNWEZMM3RUUEZZ?=
 =?utf-8?B?QlZYYVpTdCtuczl6SjhPYTJiSy9QemNjS2F3UzlYcE9Cd0Evcm1ndTA3bmlR?=
 =?utf-8?B?Q3Y4SDYyUzM3TVpGUUp2VkN0cVBlOUs2VHB0ZVFLKzNKWllVV1hWa0x4QmFM?=
 =?utf-8?B?ZVNYangvb0ZjYXBaTzNxODNueHE1anFsVHluQUk5U05KbnZ4YWpRNDdLVGdF?=
 =?utf-8?B?Y2I4MzUrVlpvT2NvT3BkQmt4WE5ZeUJWQWxXbU10eHNhclpNbVJUVm91aDV5?=
 =?utf-8?B?Tkx0cUM5blMrUEU5Z3pTYW1UMjV6VzQvc0pPZXBzVFZhc2U3c1JSRkR1d2ZN?=
 =?utf-8?B?UVBxak9xd1RzYWZiYitEUHpJMHc3M0tONWErcDJERTUrZjV4eEYyOGJDQ01l?=
 =?utf-8?B?V0cwRUNoeE0zdXVVeXRZVjdUWDBxVUNsV00yREhWbnpTbWc1VE02S2dKNkJn?=
 =?utf-8?B?Rm55VXpBSlNuWmV4T1c2a2hnMFV5WlkrRjRWQzU2cjBtM0V3cDZveGtMY3JK?=
 =?utf-8?B?Z1Z5MmRKZllFWnpUSW04bEJMYjhPbmYwS0RuY2V6ajVmdWxXeXRaSE1Fa3hj?=
 =?utf-8?B?cmVVWnc1amJ6c1dXR0N2VUIrdjNETUtIQTl3STI0RXI5WTJadG5RY2lDcUtz?=
 =?utf-8?B?dEFZR0ZHM3N1bzNQdlRzcisxUExldHVrSUlKbVRxM0d4WE8yQVk2YXFSRThh?=
 =?utf-8?B?RnZtcTJCdExFYlg3aVVycHRRVEpGRVNRZXdpNnhMbEV5dDFDMlpkZzljUS90?=
 =?utf-8?B?NDlRejNvWGFqY3JVUmVINVRtQlYxRnJCNndRSW9WTjhoUGRqcjR1QnlCSGVO?=
 =?utf-8?B?akpPd2IxOVFMODlyUkxyZzNNN3hWY0FpWHVCWHJ3TjE1aGt0MDJQZ2RrZk9I?=
 =?utf-8?Q?7w9+obaC8y4g/AuS9Ss+zVETgXsUGVbDzYgcf/e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ff1f14-7092-4c96-1ae1-08d98d5caa01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:45:37.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMLpg1gJoLhCn8zLdyWmQamfOt5s5xl8gxtfxnfESYfmFJhFv7idY3Ol2XTfP8PsiqadQYeh7kPnFhObByj/eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 11.10.2021 20:15, Luca Fancellu wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
>      StdErr->OutputString(StdErr, (CHAR16 *)s );
>  }
>  
> +#ifndef CONFIG_HAS_DEVICE_TREE
> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)

Didn't we agree that you would drop "inline" from here?

Jan


