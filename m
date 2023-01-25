Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D41567AA9C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 07:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483866.750277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKZil-0004kJ-Ch; Wed, 25 Jan 2023 06:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483866.750277; Wed, 25 Jan 2023 06:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKZil-0004hL-9T; Wed, 25 Jan 2023 06:57:23 +0000
Received: by outflank-mailman (input) for mailman id 483866;
 Wed, 25 Jan 2023 06:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKZik-0004hF-6V
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 06:57:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2059.outbound.protection.outlook.com [40.107.6.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82a2b530-9c7d-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 07:57:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8311.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 06:57:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 06:57:18 +0000
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
X-Inumbo-ID: 82a2b530-9c7d-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GusuMdDprl11HR7Wfd2TxM/tQvacf/s/VBiIOSDeBztnfR7o3CHdYy9xHB/bv50qW42Iv/r/BQMQwqNapCLeOp7M8lnLGgnxeFtwJ4ASSZ5IuNqMtEm9ZkkmqSLb7MrEXbKhJK89IvS2LoUz/JAFs/RqKNpbB6uFvQHTO/eErJbYKYRWnjpkegfdz5dYGSPofc1nKwCbWW19PlkvTMY6Gzq8bDaNLjBoMCanIBxMvgjLR0na0PD2utnv8Pi5q/FQNhWRpUqsPPaTvEEw4r8pceZ4IOeWNVls/T/Jcb4dBnn3FuYSh2XxPB2mVRRMAh69vj6rkOEgd3iHgtm5AgRYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMGxywd3OXSdXfdzAAZ9ttYRe4lHqqnocHfh7aGa3FI=;
 b=Y+ZBx0UQuG54rtKBtjJuQj1YjoB4wGocyKvuEBZmapgI33sjvp8fhOX5Nn9fG76bqMAtUIRzQTCznw7fzaBSPpkX9s9FKW/UzAdQpOnep1iGJ6ATW71k++UrLhDQ1arFSkn8x/vfJrSzbXTT0Y45FjbVcGcfbVQWgnCSCongsk1kymQvtnQgkSZ3OCJvm8sYxJ44jWR25o5sn7vH+GnA8dloM1BSFob5BiLfO86FP2K2JXeKJGhgsshma/Ytg5DY0zDdToQsBrFjtFOOVDaxpWzatwYLVvvSXnMtnDZG4eIquMPRdqnIpK7UFScJrUMU1QZlLamf2jigAV71/Or/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMGxywd3OXSdXfdzAAZ9ttYRe4lHqqnocHfh7aGa3FI=;
 b=Ph4ujBK3DUEtgw5dDK9E+ehVOpZ9NAhVQwD6NFdjr1+69urqKUEi26eXJ3rVVlK6sUmNYybH1V05dLytUdDTW+xGRgFEQ8GxP+Wn3vEqFmJfFZl+BDhQZvgNsKf+xKogHk9RZnmYThnO56l/sHa2i6OxOVlv+25w4dELIq6TqhjVOnJUeOrVQLd6ABQB2Jel0wvQq4q1zGJOgFjvb2w7vmKr0xRt1uV6Ot4olEjDAIW0y+sbfFqTwbWsUvoPN2pCoTwG26Vy+9GqwpRnaG79h32nYQWIYotdUnaNu6+t3/Hk3/NPe6TghqHLOeLeovKUd42W4CHIcpdt6snPOD0tVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <145a827e-4b09-5a85-cb12-eb8f3e0c4f2a@suse.com>
Date: Wed, 25 Jan 2023 07:57:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/x86: public: add TSC defines for cpuid leaf 4
Content-Language: en-US
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Reaver <me@davidreaver.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230124223516.GA1962@templeofstupid.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230124223516.GA1962@templeofstupid.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c5b104-54f1-451c-4367-08dafea165c8
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8FlnjAqWsHLO9JAL76PZYFahNh2wNIz2Su42BCMLnz+h6VbJPi97OTcYECNSAvFOWOVecgW10ZLDNwE8HA4aI+xAwP/nlTKrymIpLzXA+R7N72/ycthMMJ5S38vsmpav64t3gjsTgenB3ad1fVj0Kh2/KAs2h2Vv+OgnQC1oryIiFcE0Vk7BZaGgeiziTopRX8uIe5KoYi8BV1XUI+YW/4IZJMwqi3PQs9Jd3opLdSqv8rFyLIdi9AQv/IJGUcr29Ae/tieeBjPQ+K19ddV5LBrqffIorSbT5YrmR43cYAU9VCxvMawt18B3hPrZmrRUZyJVicE4k9s2fj7DUhfwKe5g3B0jn7PKLDSYofaNtzB5woJVsUkOBj3HanYtbE67KUGFp4ay5ZwjZ2MdYVygVKMVjpO67CZUUvhgdMLAbUuUpPfLjOd3dphvMUk0VJ5PXF6H/NQ2Q9VGkB06QzsUqPIoA5dKdvhZ5jyTAqNh19jVF3/5drdjL5z4ri9CVzNHrv2H1T7ZPj7YBbo82WA5Cg9Rhf5b1zRRlV0PAsb3jn2RSzmr8Bl9nxkrYXo54xjJgTAvJOMNOkbT7ZEhBK/J3gHfWM91k/8KYLUxIn3RVAnovAJ/+7+Pr3lmizz/hsncreMu1XR+5ueVGSQvchJHJMHrWnCTCXjloa6T6A+2TesNlqZeiXEm+87154AbnNhwFHvYLr9cEMu6nZ8dS8xyRdNrvikEaV1SYu4SIpdo7oc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199018)(478600001)(6486002)(31686004)(66556008)(26005)(6512007)(316002)(66946007)(54906003)(41300700001)(8676002)(4326008)(6916009)(2616005)(4744005)(8936002)(66476007)(53546011)(6506007)(2906002)(5660300002)(186003)(36756003)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUpJMFVobU5ZMFNpdW9TZm8vKzZwa0tGWlJBVU5ZTkhzTjIycHEzamFJOWdY?=
 =?utf-8?B?blJoa0VxUGliZ3djWThDVEhYNlU2ZW0vYWpxbnkvQTRjMzg1NDlWMXAvZTVJ?=
 =?utf-8?B?VjU4NjVlOWp5Z1ZGcVp6K29hVEhMU3hNaTNWR2p6ckFkZ3VjZnl0SkhLR0Rn?=
 =?utf-8?B?RXdIYlAvTkFlUG1GVTJ6MEkxaXVCL1AwTGhoVUM3bFBlYkJraGxST0tRUjdK?=
 =?utf-8?B?bTE1UStzWWxlYVdUeU0yMkxmZGNLb2lvdWtTbGRDNnl3ZXlvSWtYQ0ZNZnRl?=
 =?utf-8?B?WThaaHFtTnI4QTk1aUZIbmdEWWp2SHNIQXBBRzJ4ZldZSDJSZFZuaU5PNWFU?=
 =?utf-8?B?VWFpcUlQbDh5QzVWczM3aUxXNUF0bGlDdkhIQXErSzlTZ1Bhby9XZ2ROMWU3?=
 =?utf-8?B?SiswWEVWTWpubzZlY0FkNDJROWViTWw1VjMveVg2Ry9tQ29DS3hjVjNhWlll?=
 =?utf-8?B?dktCZjZ4aUNKbVBvWkJTdTlLSDRFUWZ5NlRQc0lueWNIQTdrNFpCeEZHbk9L?=
 =?utf-8?B?Nms3ZFN2WjhkSS9VOWU0aHl3TloyYVRoWUVES2JnYkx1N2hCOW5iMHNmUUJy?=
 =?utf-8?B?aUZxMk03dXhTOTN6MWRKZTNNVUFUNTBlVmFud3JKcTJ3dmtPaWttK0gzQVNU?=
 =?utf-8?B?bkExTEN0TWt1OWlQZDRETVRLWDZKdnhxY0lVaENmUnpBYTdTVU1laFczS3dz?=
 =?utf-8?B?R21WT3JIY1U1dE1uRFRvMVdNNHkwQWNPOHZHNUhGeHZaVHRYMUh4eGVKTFl1?=
 =?utf-8?B?a2JXQ1ZNWkp1RStkWWpaVldZRlQzWk5KaDhRV3BGMnFMRjZ6aitPQ0ZqQzN5?=
 =?utf-8?B?SFdvWk5XTzRZZXExTFJLNmpaWXBPWW0yYWttM1JuN3J2SHVmeTMzcDNzbU96?=
 =?utf-8?B?TC9nczJsV3A2YmxjTE1XdTczRHU3YWIrYVV4SVlJdFpkVGJ0OHJNbUF4V3Zz?=
 =?utf-8?B?ZkJiNTF2bXVSVDlxdDJoVUhjcCtmZnJFUno1WWJYWDY5N210aHp4MXdENlRu?=
 =?utf-8?B?Wk5qYWMvYlk0MHFITVRkVHIrQzZSUnN5d1RCMVhxMFRrbzhqK0QrK1RBM1k2?=
 =?utf-8?B?b0djM2FkZVNqdHpvd25YMEQ3R01WRUV3c0VkaWlrTE56VWxpRFZGTnpQZnBl?=
 =?utf-8?B?ZjM1TnRyOUdrazM0MldQejRHTzJCWk4xY2VwL1NlMlRFc1BRRUQ1SVFIbmY0?=
 =?utf-8?B?cEI2R0tqaHFJS1FvT0VCc2pXQzdxcXd2NWRqNUpxQlZsQ2hEa2k1ZFZuekFS?=
 =?utf-8?B?MUFHaGZ4QmdQbUpWZnlsdEc5blV3N0liNVJLeVdWc0FlM0JhVUROUkcrQUI5?=
 =?utf-8?B?LzR3OFVOVDBUeW5DOTd0QStVYzh1RTNWVlN5YUs0UGhDNHBEOFRyZis0NTEv?=
 =?utf-8?B?MUhwWTFZUjJjQVFudnA2ZTUwMjhxdDZIWkxFZ3B0VVBhams0SnhKbE4rWmEw?=
 =?utf-8?B?Y3kxdEJZZU90YnBjWFErS0QzNEpHTFJ1cElKSjNISHlWNGh1eEJOZ0M3OFlz?=
 =?utf-8?B?cVNDTTBieUQ5L2ZLWU9TYXBiQkx4YkkrNkxiaW5mVDRvWWYycTU2YzVkeXZu?=
 =?utf-8?B?a1Z1anFZR1JkWkF6SEFJckdxSzlnL20xTmk5KzR5Y2l3MnhKQ2VXeTZUeXg0?=
 =?utf-8?B?RlVqOW16WC9hVFVBRDNvLys3NGM5UmErVXlqdWRueFZtVlA2ZktlNHBVSlo3?=
 =?utf-8?B?cGo5OGUzMVIwR2NSdkV2VDMyRi9vdHJ1Vm5YeTNOTW9kY2hnbHRuc1dwVXZU?=
 =?utf-8?B?S2g4Ty9kVHBQYkZWZGNWQjlvMnM0R1FBU2pza0NXQ2g3M3p2KzcvcnZyTHBB?=
 =?utf-8?B?aVpMQUovQVBUU0RpRlQreTIxNXN6K1h2Z2lidEY4Zm1JT0VBMGgvNTJtN2dP?=
 =?utf-8?B?SXdab3h6RjlhaCtNNnp1NUpOZFRrcHA1RkFqQkJVaE8vb0NnYU1KWTE3SU5t?=
 =?utf-8?B?VHZ1UUtWMzgyM3UzREVlUHpiTjZYTXYxdDRYOStIVHM0VmpZREZDTVhVTEQz?=
 =?utf-8?B?NU83VjZSKy9xcVVydkQ1clpjcXIwUXJtamRIM2RJeGF6R29QVmZ2M2t5NXpV?=
 =?utf-8?B?NnVpek9kOHRXcFRMMUI3cW1IUk4yYVJla3FhcXhtQm54ZDRFQk5XWFc4K0NR?=
 =?utf-8?Q?MQOr6nV+00KwjchV9bgaV2ZpJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c5b104-54f1-451c-4367-08dafea165c8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 06:57:17.9190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bw+nEkbGObAITccix27FtLWZZvPGMX741BEZiPbtaSid2AKYJPQMlHzi8lFfm6E+AS+86tmRJSGqeMRedZnNQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8311

On 24.01.2023 23:35, Krister Johansen wrote:
> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -71,6 +71,12 @@
>   *             EDX: shift amount for tsc->ns conversion
>   * Sub-leaf 2: EAX: host tsc frequency in kHz
>   */
> +#define XEN_CPUID_TSC_EMULATED       (1u << 0)
> +#define XEN_CPUID_HOST_TSC_RELIABLE  (1u << 1)
> +#define XEN_CPUID_RDTSCP_INSTR_AVAIL (1u << 2)
> +#define XEN_CPUID_TSC_MODE_DEFAULT   (0)
> +#define XEN_CPUID_TSC_MODE_EMULATE   (1u)
> +#define XEN_CPUID_TSC_MODE_NOEMULATE (2u)

This could do with a blank line between the two groups. You're also
missing mode 3. Plus, as a formal remark, please follow patch
submission rules: They are sent To: the list, with maintainers on
Cc:.

Jan

