Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F7695FDF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 10:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495088.765340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRs1C-0006Zb-QG; Tue, 14 Feb 2023 09:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495088.765340; Tue, 14 Feb 2023 09:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRs1C-0006XL-NP; Tue, 14 Feb 2023 09:54:34 +0000
Received: by outflank-mailman (input) for mailman id 495088;
 Tue, 14 Feb 2023 09:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRs1C-0006XF-2F
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 09:54:34 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94c3a3e8-ac4d-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 10:54:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7719.eurprd04.prod.outlook.com (2603:10a6:20b:29a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 09:54:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 09:54:03 +0000
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
X-Inumbo-ID: 94c3a3e8-ac4d-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmlwGEYg7jmD0S86TdNj3niTn/98VTNVNgBKOBsra2fS5WYjnzBOk3N22hH/6I8xmfEeQ/CVnkqiz3GVdMA4Vqy7neI3k1ks8SRCgVd6KqugFFINyvEg/byVvvK18dfK26+DB1SUKJJIC2pJxPCCTqKiPAAa0Hc8ys42w01GP6dr4VIjhSK01/vNyF9C7O0wj9Zer1xZbb/Pjar3HthJuNBz6B8k6ww5ooSQjz6FHkiQga8p71vct6RD5kUDvnFu2+mRhp+XKrlCjbczg/by2xwbbS6SUo9ogl4gbmVtlsawzSQmpZKa/GfFuAeg5LuYoqX3MmvaBKQYWi9GICKttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDPDy9oVSHVk9YQmfF2IW2uY0eWD8OytPNfXzBWjR1s=;
 b=ZXqIVGa5aNkkbnBJ0j5RW5cT1HCej94rc79IjAOjGzyidirtAJh94GUVGHKIeXlZfNMPVubcoB86bPRTz8OX8REk16Ld56XgIUsrtTOTIYrEf0Fwqu+Nsu3Hbh3tyzsQUla0Pmw59lU9dnyDtRzUNKJe5W2uAjZGc7B9JNM4uKjlUoE4MMDfjRAkD11zhrynJj2jZr1GWc/jULcN8yO7iq3YwULJkBgTVz4ekMGDn9YBQaPSjLTf/Rt62/RCLz8qk2z4fsXPU3//rOrHNzsefpDhYjWrlEL6kMru51gUnxpw9l3xQni1mm04gzG1CquIiFRCz0F2iZlANB6FCEnVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDPDy9oVSHVk9YQmfF2IW2uY0eWD8OytPNfXzBWjR1s=;
 b=oJ9oecmbg0S19Jle1OVyBLLmrAQlkJFsWsqXJixTRmVZcj168N84CvaPV8ZyiU1oQYswdfPRhWog6SCHvUvOfe0iXdebQZTbRr7bPEmIxX9ej/HrLXswiuDPyYJO/8S4YmC1yi48Bow4oeNlgtOygdKwlBKbBNxj7aX48AiZIM/tmS50PdKKhWB5Ykkgrzb5Hz5INhVar9/4xgIVYo8LpQNfBRiA3H2VrJJNPh37q9zYooP0pGQ5vcjPgwsS6WEdD0av3f0tGs5wLDbxAk6XJ2b0Xo7v5PIU8POz6F4IX2j3leJX3Pk43eqUOJqUXp/sdCxxz7dclrTpg2Zth2CzFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b893c489-53e1-7e23-c3c8-9fd6bc846e5d@suse.com>
Date: Tue, 14 Feb 2023 10:54:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/2] xen/misra: add entries to exclude-list.json
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230214085635.3170962-1-luca.fancellu@arm.com>
 <20230214085635.3170962-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230214085635.3170962-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f5398c-ccad-4c7d-c5cb-08db0e716772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Akv5o30/zWbO1GWb9qIuDJBeqIG4s0l2pwQ7jpFKhw4HHIC8TKDbvkQcQG9T7QWv6TmiZbVfiiZKe5KX+AAJkeopDWfwI3zQyKkGMddDDCU8WBs5SbBz5vq0RaA8WJgZ5E9gaeDxN1/3I1u9Lzqeb3QwUYlLKoNefJ3ZH8/DF9AkrDyarZL8pDaJ2n0GAzKYAYwtaHxXKj+rWexknFs8sqPV3Y/8FKBogeAwopzYu9hlXJN/59mMis1MBDSUcYO/Mlq69eBc2JanujCswv5Pp2oJ3jRtINQrdddSGsNB8Q55jrC3AWt6iIhwA5cI2ejrhB+UKq8FZ8ru9wZUOWWe4IKa9SXIV5YRzWvBkBRWmhXs+lW2uobFVLQaHpx8yx4fqTfLzA8+tu1g3Ks3Xj5V8FndwgXIrlRNRcaYpSpyi3EbcVdvCrEZcbTMqmBd7I2KA5X1aQL9sByz1iqLICc6H10UejoV/79mEg9wphBIRjWfj0hjUPa9tVnkGCqn2m8HpAgkQ4SiTyPoYCkSj/ycuJtsEJgCpd5rnmJ2Hynk/v5gxxx/xg7ndys0LRfjXBv5mU0xrWfqrP3XVxEAY0ubM3hZHDKzCAZ8Fpv7SHBpMspKO3hKANHJevXX9Hsw9CB1Bo6x/dUVyJ3lplBjav6kceAGbbTDlwPXCgyNj30dwSSoiUdTU139gXLrKZSktPjhT1LcwBaLAnCJzp69G6uJhv34wSjvYASW24lKGse/IJE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(8936002)(41300700001)(2906002)(31686004)(7416002)(5660300002)(38100700002)(66556008)(4326008)(8676002)(66476007)(66946007)(53546011)(54906003)(6916009)(36756003)(478600001)(31696002)(6486002)(6506007)(86362001)(6512007)(2616005)(26005)(186003)(316002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzJRT1hBa2poNFVYc0xvU3VlalBRK0YrOXk1RXNpY29rbFNIWmdscHVRWXVm?=
 =?utf-8?B?cWRWUE5hMWpac3ltdGo0RnFxa0tpemhwbk4wRjFjeUE5U2R2MVlnRW5pYXVS?=
 =?utf-8?B?TW16R1NlTVNwTUpXdkhpbTZsRURmRVo4c2MwWWEvOW5zUExKalQxUWI5dWF0?=
 =?utf-8?B?cHR3amUwdENhbUVRNWtPd2M5c2Vha2kzc1BiSU51ZW9HZkx6MzJHSmMzZjRP?=
 =?utf-8?B?VmI2V0g5M0FDdE94YVYyck1oalRLQkF4cUNLWGZrR1RmWFNhL3ltbjZqSTdv?=
 =?utf-8?B?OTltNVJwN3hSSlNYdk5EcUVPZHpIdWpsUFhlK29HYW9IRlhWdy9GWEErREE4?=
 =?utf-8?B?L0w2QlZlajgrRmNyMjZTdytFU3Q4MmhFSDNQZGRlTUxObDdwOXhJclVTTGN3?=
 =?utf-8?B?Zy8vWmhnV3hFTTVPVERJWmVTTUNIaHA1MGZBeVZRMm5KaFk0Z2N0d01tWXZi?=
 =?utf-8?B?bFZ2d3BYZ05DVlNzdkFZZEJmMkFZQ1FQMWFSdHFjTTBwdlJ6SXZ1MVV4RFV4?=
 =?utf-8?B?TDNxYnJFandjVjk1NUx5cmxDQVFPQkpKTjV1cU94RS85cngzZWIwRGc3eUJF?=
 =?utf-8?B?ek5FRlp0amF2Z1RnZ3c0NzhOYlVaaHltTVBTUTdZeHpkenhHd0d4aURNbWJt?=
 =?utf-8?B?ZmVuNXg1anlTMm15dThIVVU4K3RsKzFIeGZqVHBpeVNPV3pSMDFYY2V3OUts?=
 =?utf-8?B?dDVwRnpST1FzQjU3TlE3Mk02ak1oMlpMRk81VElONytyNWZ3MTNjdXd3Q1Vq?=
 =?utf-8?B?bmIrTGdDNzRucjl0TnMxcmNxZWJnZWhPS29kTnFRemJTRTYwL0IyMzNlZjZB?=
 =?utf-8?B?VCt5d09YVjg0R0ZBKzJ3SUtQa09XVndnWkhqYVNSZkhWTGUrYlBVWHB4S3I4?=
 =?utf-8?B?Y0tSU3lWUk9SM0VoZXdobjBKRGFPM2dBcmN5VEh4UlJIMXNHWkt6akhuKzA2?=
 =?utf-8?B?ajhSWS93YTlzb3pDdkFsdXZ6OVd5RFJhelBOamlKRFZ1MEZjQmpFYVdPSUtk?=
 =?utf-8?B?RzNpcUxJMmNrb2pmTEJkL1hVQ0F6aUc3RjBVUEt1ZGxmcGJtTFg3VmQ2SFFp?=
 =?utf-8?B?MWR1RU1JM3RxcUtENzhEbVoxYXRoZkhBbGdTdlIza29GMEs1UzBUanJZMmh0?=
 =?utf-8?B?MExaUXNnaDhraXVVY0xPSFlVRmNON3BkTWV5WS9yb0UwdExwbjRHbjFIRFd5?=
 =?utf-8?B?VVJJMEhSVFZXa3lCTkVCYXk0ckJIQ3Q2ZDBJY1VlbjIydUZsd3lweXVNK3dj?=
 =?utf-8?B?RXFRNWVXcGl6YXQ2TFpaZ3hoazV6UWF3ZXhRVCtyN0VkSXFRdE9MTU5YalNq?=
 =?utf-8?B?MlhoUEd2czNJWlovZXhNZTMxZFBUMmY3Mi9lRW5OQTdsWEdxMjcvOFNqZzUx?=
 =?utf-8?B?R3UzMzExWkUrandOcTdHYWVxNnlTSE0zdEVHaURvK2xDaWVVcy9lN3dGTG01?=
 =?utf-8?B?M2hhY0RELzNkL3B5UXpCRkxlVmJhZ2lDRENYYjhYR0M0NGxxM3ora095TkU1?=
 =?utf-8?B?Y2xVT2ZuM3VJYS8zN01HdThiMWlLenNiaVg0bUNOcFJNYVJwUVc1TXJyc1Jt?=
 =?utf-8?B?MHNSZ2Q0bmNRWWJ1TDdpbkU4TzFRZ0c3M1N5VDluaDlCcEFka296ZitVTGti?=
 =?utf-8?B?ZGppKy9aZEJJNWg3NitreGpSZTZOYkJSRktiMis3TEdNWmlIck5pVlJkRUFo?=
 =?utf-8?B?aCt6VjhDRXJPRHp5MzJKdzc1QkFobEFRZDY0SUFzbmZ2NHpYVVY0WmpXcGZE?=
 =?utf-8?B?NzN2bVV5WHA0K3FJQ2FObFdCam9qTkJkcnd1ZGtTSWhnRzNwd21TWjBCQzYr?=
 =?utf-8?B?TnE1MEswWEpkR25Ga0g1NWFuWFRFZGk2Sy9Mc3NXM2lrYWt6VDgzZjZ3QTY4?=
 =?utf-8?B?M01CaEF2bGtMRGROdTF2VitjaGt4ZDl1ZC9vT2czZ2tuSFcrRk51akJVVTZp?=
 =?utf-8?B?TlhLbTlOQXp3K0ZHSDlJamZCclZBNDdFNE11Q0lGamNuYWhWSk95SGJjZ25o?=
 =?utf-8?B?Z0tPZUlNQml0enZyWlJ1T1ZVZmlRamVITHhLM05EMStvUFd4L1RmcjMxRitQ?=
 =?utf-8?B?bkRUNWVOYmY5SFB6NUVXWnd6Tk05ZVZCRDVPQkpaVXpObkxId3duVkpoS1Ra?=
 =?utf-8?Q?22iyz+CAmXOV8ecqHtfC+dg86?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f5398c-ccad-4c7d-c5cb-08db0e716772
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 09:54:03.5069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuumUztOxphGd+x70EfxU9rEjyFwQ+brEFCzXaDtK1PXCLRrLdfd/PCZVcFekgOeDtitlrWCZiuy9/2EMjnhMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7719

On 14.02.2023 09:56, Luca Fancellu wrote:
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -1,4 +1,209 @@
>  {
>      "version": "1.0",
> -    "content": []
> +    "content": [
> +        {
> +            "rel_path": "arch/arm/arm64/cpufeature.c"
> +        },
> +        {
> +            "rel_path": "arch/arm/arm64/insn.c"
> +        },
> +        {
> +            "rel_path": "arch/arm/arm64/lib/find_next_bit.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/boot.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/cpu_idle.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/cpufreq/cpufreq.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/cpuidle_menu.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/lib.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/acpi/power.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/amd.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/centaur.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/common.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/hygon.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/intel.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/intel_cacheinfo.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/mcheck/mce-apei.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/mcheck/non-fatal.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/mtrr/*"
> +        },
> +        {
> +            "rel_path": "arch/x86/cpu/mwait-idle.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/delay.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/dmi_scan.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/domain.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/genapic/*"
> +        },
> +        {
> +            "rel_path": "arch/x86/i387.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/irq.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/mpparse.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/srat.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/time.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/traps.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/usercopy.c"
> +        },
> +        {
> +            "rel_path": "arch/x86/x86_64/mmconf-fam10h.c"
> +        },
> +        {
> +            "rel_path": "common/bitmap.c"
> +        },
> +        {
> +            "rel_path": "common/bunzip2.c"
> +        },
> +        {
> +            "rel_path": "common/cpu.c"
> +        },
> +        {
> +            "rel_path": "common/earlycpio.c"
> +        },
> +        {
> +            "rel_path": "common/inflate.c"
> +        },
> +        {
> +            "rel_path": "common/libfdt/*"
> +        },
> +        {
> +            "rel_path": "common/lz4/decompress.c"
> +        },
> +        {
> +            "rel_path": "common/notifier.c"
> +        },
> +        {
> +            "rel_path": "common/radix-tree.c"
> +        },
> +        {
> +            "rel_path": "common/rcupdate.c"
> +        },
> +        {
> +            "rel_path": "common/softirq.c"
> +        },
> +        {
> +            "rel_path": "common/tasklet.c"
> +        },
> +        {
> +            "rel_path": "common/ubsan/ubsan.c"
> +        },
> +        {
> +            "rel_path": "common/un*.c"
> +        },
> +        {
> +            "rel_path": "common/vsprintf.c"
> +        },
> +        {
> +            "rel_path": "common/xz/*"
> +        },
> +        {
> +            "rel_path": "common/zstd/*"
> +        },
> +        {
> +            "rel_path": "crypto/rijndael.c"
> +        },
> +        {
> +            "rel_path": "crypto/vmac.c"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/apei/*"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/hwregs.c"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/numa.c"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/osl.c"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/reboot.c"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/tables.c"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/tables/*"
> +        },
> +        {
> +            "rel_path": "drivers/acpi/utilities/*"
> +        },
> +        {
> +            "rel_path": "drivers/char/ehci-dbgp.c"
> +        },
> +        {
> +            "rel_path": "drivers/char/xhci-dbc.c"
> +        },
> +        {
> +            "rel_path": "drivers/cpufreq/*"
> +        },
> +        {
> +            "rel_path": "drivers/video/font_*"
> +        },
> +        {
> +            "rel_path": "lib/list-sort.c"
> +        },
> +        {
> +            "rel_path": "lib/mem*.c"
> +        },
> +        {
> +            "rel_path": "lib/rbtree.c"
> +        },
> +        {
> +            "rel_path": "lib/str*.c"
> +        },
> +        {
> +            "rel_path": "lib/xxhash32.c"
> +        },
> +        {
> +            "rel_path": "lib/xxhash64.c"
> +        }
> +    ]
>  }

Patch 1's example has a "comment" field, which no entry makes use of.
Without that, how does it become clear _why_ a particular file is to
be excluded? The patch description here also doesn't provide any
justification ...

Jan

