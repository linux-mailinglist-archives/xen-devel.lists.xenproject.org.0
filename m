Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868F747610
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 18:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558534.872726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiW6-0001vq-7T; Tue, 04 Jul 2023 16:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558534.872726; Tue, 04 Jul 2023 16:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiW6-0001tm-4L; Tue, 04 Jul 2023 16:04:38 +0000
Received: by outflank-mailman (input) for mailman id 558534;
 Tue, 04 Jul 2023 16:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGiW5-0001te-90
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 16:04:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76987971-1a84-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 18:04:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7670.eurprd04.prod.outlook.com (2603:10a6:20b:297::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 16:04:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 16:04:29 +0000
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
X-Inumbo-ID: 76987971-1a84-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWFx1fw4VP7W9ps/a2w1ZGyqb6v0879xA93i3ERNvF3ZzdYYRM7vZzUym8/iCYmsFPO4qfTjUjQtYmTllmCnNyx0BaKq/LgIq8fxx/xOJUzxErvHAWYXpAXI9hJI91sfVveuzqXudRFMLbUTMRQsW4BXdy6VLFOWVH7iai2PkkCXxPWwaz8WMwKq9LXPHDUzB2wo6pCWG9xHFCly6jCfmN3aoqJQZhsQtVDK80scxpa2ofPug+rrj38X1q6gM2K+98WO5Z09o3QHIqsKFQc8H6Gj6NqegdnkbmEefq8Pyj194YlsSJgrqE7qx7lthJV4anZ1SzhECSkumMBPdpmaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZ/t4T0Rig3rhkRljDfde0rpw+0rv5ls4JN3fAJGi9w=;
 b=mFKlvn2jq9vkg/k46N1PHA6fegOxTT1rOzPtB8GKkuXN8GudWNt6Y8d+MMCtuVwhalGbt8O2fFQEYpfTn0THX+ZLDJtjSmAUYa/fwer2yV4jsjr1JEnT0LXf1ER5PlaxcxAfKGWGG0B52RwFoN6mT+BRHwS4gQXhqYrN091CBQ24j5mL5/2luZIEz8xH9Nf29EMoePQVHKHGB3hf4BF+Wo5XhBJvw+fa9ooQ5jGmNpGM+zCX3XU7WxG+wVCAj1OGBLlbywtemC+3S9/VL1CpCYKLLtWWak+CDE0QZoOCAT7dnXX7Rm6Ebj/NCgJD+XF7C+THfyLoJjrFfCycmw7LKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZ/t4T0Rig3rhkRljDfde0rpw+0rv5ls4JN3fAJGi9w=;
 b=ECRmJYgTRXO6YuhXmkQVDNcpXIoDZMND0QlUATFkc5KtYoEE6xhhUMO2c33hDO0MX5sbn+wnW8VFbqjW2hJIj6sJiREtoX4dD2D/0ULwoBhqrFSvRBf4gRwSlOQpM7xJk67yCwtAHuR8qhSkrQUuXPJaD/NTSGWxXzwnWtP4HKx9ctXYFWtGt5f9iULWRa0ceM6o3OXGYptPo4YRMAxjNRSy0nCIepUNoy1WkDvfPeRX5sud1DZYyt1tkyI2u7PaXw92ZtksDNS2M372gmkl2uik9ME1mTBCgEeOVuwGI7jcUUqtMdIyxYtmy0amNCfvrtc8xJfHwHE+hczfRvSlLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39e5b62b-d863-ad2b-5e9a-461fab6c9d31@suse.com>
Date: Tue, 4 Jul 2023 18:04:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Backport request (was: [PATCH v2] tools: convert bitfields to
 unsigned type)
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230508164618.21496-1-olaf@aepfle.de>
 <ZJwBkHLwKJNuhekG@MacBook-Air-de-Roger.local>
 <4d049335-71fd-8fe0-0f9a-dfdd16fcf41e@suse.com>
 <ZKRA_X9uudh6TRov@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZKRA_X9uudh6TRov@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: ca527de2-58b8-4b9e-0b36-08db7ca8593c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QNw3w898k0cN8tAFG6/lJCshqNqsQzWd+7o5Z2kCGNm8otOTUPheSfhs5P7nMSnZFpO1oy1fpqvFdE/F6/B1TG1dm4+W6vLgThaMz+xd4Q94PMI+oq+isxXBZYC/UDjrwZXPfBho3dN4hOZXezcFpkPLu1HB57/x8kCTulhZxTVzHfCjKdUjnxMPbfzHrxOyy5Z3pEaPY3rUubM9E2SbStjDLKfeNJAEmlgB7daYXeV+HhhPZBWDudmKy4zSR5Txi42IMouNjd/QSO3hAWzs/p9brLDvQZ3bzuTSvR+mgIvPh+cB/QjY6C424nujZcW44OXU46PsxPGHISu+a7dbkchWXcAAs7hv4tUV10CniavukXU/sdCOyxu/Ax3U+xQE/gw4fvp8RLiShvgYCV8vDi/WubckGaG7qtBPHa4vmqIe0cgwnFbfC10/mRiOYqOECv3G/l4c5qLvAsw/D8Av7obO+026QKLgTHHChVTzZcan1eInlWZzCB7XV0E8HBhVgwLytEvOZY3ACbPc5w2Y8WS/lalwappKgNAk9mK38D+vBJw+nhkef1m0CN9XK2xeLVNSHQmCs2KLv5vAeIHOrgx+ngNzHG/1a77RNEGg1kLrUi2SKbFHv9RoC3Dw/KFFQIK/HzrYYweoULoLRa2GSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(8676002)(54906003)(8936002)(478600001)(26005)(6666004)(41300700001)(36756003)(6486002)(5660300002)(2906002)(31696002)(31686004)(86362001)(4326008)(316002)(66556008)(38100700002)(66946007)(66476007)(6916009)(53546011)(6512007)(6506007)(2616005)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWVhRHh4Wkd2UCtscGpCU2R5alhGejNOUFBYZnoxT21RdmdOQ0VEd2RjYkw2?=
 =?utf-8?B?cTRUZzA4U0pJa1E4WHZKdjZvRzdDdW9MZHZnQ2s3M2lrVmg2WWRmODlEMkpW?=
 =?utf-8?B?VlN0cklCTkFiRWJTZjdLQUNEN0xnbFhzRGlnTUNxTjN0bXBIbmVhVlFvSDlX?=
 =?utf-8?B?Yk9DSWl5ZklZOHpnVmxreEdYVngwUmJpcXZYeWYyaFl6OTBaSERLWmRLc29V?=
 =?utf-8?B?WWhqVnFybjU5d25BV3VyT3puNElTUU93a2tTNjVua1ZhU210QkNPSzhXTTdv?=
 =?utf-8?B?WC9sV24rLzBDUWYwNmp0OXpNYzBKd1kyWklQR0FNbkFNS0FHYXBPL3BBOG1Y?=
 =?utf-8?B?OHRkcHp2L3U4MVZnNGZHK3FvaHBLWVpVeDlsMW1oNVZzbml4RU9xWEVjMWM0?=
 =?utf-8?B?TGdJWjAxVThUL1VwczY0Vk9kb3lzbi82OTJoaFdVdXVZR0RSL3QxdUlZeUVI?=
 =?utf-8?B?UmZRVVNoRy9aSkRIWmpmeENRRG1Kd3NHOG1PSk9uSWErRzgwbGVWMU1XbHZC?=
 =?utf-8?B?UTZRcENhTGlmcDJ6cGUxSmpPUTFzVStVT0JNZWFTd1paN3hKRXB1c0hDRkla?=
 =?utf-8?B?YzlOdlUySFEzbEFMRWJIdzdQU2VWbE5saWlYS0ttaFExdVNQcWtpeW12aW5t?=
 =?utf-8?B?R2QrZ3d2cy9pRkY5UGZMT2YvWGtuWC9lcTV4UCtJcjlhbVlManp0c1I0Rk1r?=
 =?utf-8?B?Q05tOVRVSVIxSnF4cTdIQStJZVNxZlIxcVh2R3JSZXN6eDVUa0VERlljWUlo?=
 =?utf-8?B?cGZjejZaZUp4cytYdTJmMXZ1Z3BzNEk5SDE1QURjczl1Z3NRb0drQ2paWUJi?=
 =?utf-8?B?cUxGaVRYZGFKbVRvb3BnbjI0Zi9tZ0d1bVBqWFdaUVNzR1JIZ0s3THlaVXlk?=
 =?utf-8?B?bmpXay9NMUhCaGtwTWVPMlVQcVpoNzhDaGFrdGF2czVpQUhHRWZLNHFQSGFl?=
 =?utf-8?B?bHV3N01MNm0wZU1ZdVNRQWJBSVNHQ1B2NGhSN1Yxa2k0c0xLdjA2QXlxY3JR?=
 =?utf-8?B?ZTdRREZWWWoydmRsK2Q2SFN4UDZNTUlVYzBDQktZNXJKUkl4VkxjTC81VlNG?=
 =?utf-8?B?Si9QQ0VSaDZTbzhkbHNiektEZ2JIb2M0M3RJWFRhQTYvNjhqSzRkMDgwbjRC?=
 =?utf-8?B?Yk94d3dLRENGSVJiako2clV6MlRzRm5FSG56RVhaSDJpbGhlUzMxUXJ2dnha?=
 =?utf-8?B?ZkpobXFzUlJQalBRRk1tbkFSMWNCUEtUSEFFVXdJOTJuVGVCbHZpbU5PdVE1?=
 =?utf-8?B?dE5pMU1OQkVzakhVbUlaL0ZSTDVEbWxtRk04WWxpaU93bCtUK0Vpemk5Qmlm?=
 =?utf-8?B?bWJDMXN6bUY0SW1HYnRvbHF6QUxWZWM0dExFTm0zOWxKYjZ5bWZNUGtTVVYy?=
 =?utf-8?B?TFVKSW14SjVWbk9weFlhT3dUYXJWakhQdzNVMytHbS9BUUo5S2dMeitKZ3VH?=
 =?utf-8?B?akxSSkFzRTNLUEhNMUlVMURuVHczcm5HNnpwSWRTVUt3ekJEVW02RHBGRk1p?=
 =?utf-8?B?eTZsWGxFak9MVXo4TzRHaEdyZTdkZ013OFhwOHZrQmZiemViSWxUZkxVN2d3?=
 =?utf-8?B?NHd6TEl6aVRLa3pkWTI5azlsU3dsc1lnSFlhMFdIWGg2MFZYZEs0dzN3aVMw?=
 =?utf-8?B?MU9qZ293SmdkeElndUpCaWxZd1RBM1RxWU5yWVJRUng0R0o2eWhPMEwvQ1Fk?=
 =?utf-8?B?OTFLc2NKSzkxUEV0UlQwVnQwbW5JZVdLQTVXRW1iY21PRXJzQUQvODRMSFV3?=
 =?utf-8?B?UmhzbHBnbmhIZU5DdzFCWm1iZFVvZWs3SGJlRXAwcFd5aWdyeUJreDAra0RF?=
 =?utf-8?B?Tm12QTdQVm1ybDdSSG5WcTNyWkJnZmt2NFVVd1pWYklnRS9uSEd4UHptZXlF?=
 =?utf-8?B?MlMyUkowMWhsMXhKNGVacElFNndrR2xBNzY5QzFzUzZhSThMaXZWY2ZCTGNP?=
 =?utf-8?B?SWN1LzdtMUhUdnlFVEhCZlQrdU0rc3lKSFphT3RoRzJLdjAwelRzZmZuby9o?=
 =?utf-8?B?RlJuazJUZlB4d2RRV3RiRmFkaU5ld1BEK2RxTGlBdXQ2K1RaUUp5UmI4ckdI?=
 =?utf-8?B?cWo4K2dGVkNxbnhjM1VtTkh6OWFIU2JZOCs3dGwyTFppc1dSbUQxdDhvMVQ2?=
 =?utf-8?Q?FSFOH01aQ2mfJUEOwCufoQNYt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca527de2-58b8-4b9e-0b36-08db7ca8593c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 16:04:29.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDFUzbej74AZQDwkybiKsNZTOswAImw+sv0THhdmMn57+FH8FE/lFBR7xv15Nj4rYbz/QALk62SkO+DBNkTj1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7670

On 04.07.2023 17:55, Roger Pau Monné wrote:
> On Tue, Jul 04, 2023 at 05:42:33PM +0200, Jan Beulich wrote:
>> On 28.06.2023 11:46, Roger Pau Monné wrote:
>>> On Mon, May 08, 2023 at 04:46:18PM +0000, Olaf Hering wrote:
>>>> clang complains about the signed type:
>>>>
>>>> implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
>>>>
>>>> The potential ABI change in libxenvchan is covered by the Xen version based SONAME.
>>>>
>>>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>>>
>>> Can we have this one backported to 4.17 at least?
>>
>> Hmm, while perhaps simple enough, in principle this wouldn't be a backporting
>> candidate. May I ask why you consider this relevant?
> 
> I have to take this fix in order to build 4.17 with current FreeBSD
> clang.  I think in the past we have backported changes in order to
> build with newer gcc versions.

We did, and this is good enough a justification.

>> Plus is the mentioned
>> "potential ABI change" safe to take on a stable branch? There's not going to
>> be any SONAME change ...
> 
> Is there any ABI change in practice? Both fields will still have a 1bit
> size.

But what a consumer of the interface reads out of such a field would change
in case their compiler settings arrange for signed bitfields when signedness
isn't explicit. We don't dictate, after all, what compiler settings to use
with our interfaces (which generally is good, but which bites us here).

Jan

