Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BFA7D480A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 09:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621699.968430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBY2-0005IE-0k; Tue, 24 Oct 2023 07:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621699.968430; Tue, 24 Oct 2023 07:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBY1-0005GC-Tz; Tue, 24 Oct 2023 07:09:53 +0000
Received: by outflank-mailman (input) for mailman id 621699;
 Tue, 24 Oct 2023 07:09:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvBY0-0005G6-TQ
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 07:09:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53182828-723c-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 09:09:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 07:09:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 07:09:47 +0000
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
X-Inumbo-ID: 53182828-723c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEWn6qtRjXqZ5MruS5cOcPucnVUziCM8K5usxi9nTAbwTxJ5DkNEaXKxHe7Pkze5eW7SitJCE14pzE08ITZioUR9a2gitl816/RHcx2kZ4SXd2x/IhFq1CYwnPeocr0bKj6EOiPABhB/lIvlzS09weRRtUBIK2E1a6N6uVASsNvCpRc88AJiVzTram9aWkS30Ykokpsn1tL5U2AeqqvzY6gHn5aKXcD/VzuUwrio7ZpIf4hJd84J5xCuKGKvTx2aqorU6Eqnos66gITxSmfMfWh2VFMdo4kczxrXypmdOswdpLEwL9b6x+PvweVMv+r24FvNJw2CBUU50Y//GqoE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sVVJL9gM6QUiOtMPVuB4fvd0ae2WaUfjFTUzmfgq4E=;
 b=SdsnWvbAg+5c5ptNx98CEIbX2rkIguVjt7+7ZpkTSpjhetNMyNAKnbIEUHn9hYEYQxfP12PSyzgjgT4iskmPxxTCi5QnNTesievhMyKZMD4VxP424tzAMUNPphtJonwYIgEbYSx46/umkH1sLtjasQU2kZWE0dR7Do6/58UUxEGDA+j1sMAuQjRMllTn8g+2LHQ8IVaWKjmUcKaekdZtUhlvap90rLIImeN0/oIRrNWoohWoeN5O4IcJy/7peu6lYWOgieK34HcGkufU7IHRekZ3ALUqUFTk0iV8+jiHyXRm1ew3kKSkR/ba1s1ZSfp7+u3jseuLxJiXNggmN4B+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sVVJL9gM6QUiOtMPVuB4fvd0ae2WaUfjFTUzmfgq4E=;
 b=AZmTTXMC+K/52MJTLPNPTfFhtSDMCDio9K94BLLLPkLgye0s4OXzzruoD8CZykIougqW5ErV43T5omUp+GWex5TOirj7N//Ie6bSdxUKz/nC8ihtmouiuWWOhh2UbvRzm19R61sNTSjXQCD3bwhDsCTSh9AAfdf7y+DIntLeFqC4CS7xyJCCK2UY7Pl4LFpv5zBSESGh5k/PRXr8mT+QLwVoWzAutxX3P8uEwQnzCcyc3CVKErF+hq19005Tp38adjiry1qG2pJCyPNNddTSWQBVfxgrsNOK6ezPMwAh0oqiAg9R5f4CSlWpJQoz64FxmWFJjSF/DSdDHEIQprMj6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ef80dad-5ae6-786d-e89f-d0c3af44b485@suse.com>
Date: Tue, 24 Oct 2023 09:09:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen/vpci: allow BAR write if value is the same
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20231023163615.693462-1-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231023163615.693462-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f80003c-524c-41a4-791b-08dbd46034ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SAiHUXlK5bSvYolT9Nj8KHLSqjF1kz+xuLM+gIRg32NUl5O+DRF8Z+scJCwDziRj9/1GWS4eMNXXt7ZeughAKt+VNH5Nl1zYRVeJtpv/IoCycHEEvu36m7f8tJ0iBAHsFR3fNq9Nqj0cYSgq+xw0+zu0KUmrILGIl+DgmMUYX+8yR+hXw2rhMAlkWSRbyJTY9Lso9/eNeYi81xQW1HQSDas8BTjdPgH06/b+Uqgruxzdaukl0wYNBX1gSUBZ6CqPKUBy3uSf1DxehuFLWUw4h31tTIB882x7gh6aMneTJjTP6YfWjRSXyoWVlCDJQjyGECGibnX/z4hbmgJCeIVszjhLVss1f3f8gQbHZSX4nXIcmPhHpk9Vv73h2plRdXNGxnFUmMbSrIocUzCu7JDLemWb/CQNLnidp8dS7N1ielovyk6rc8zC/DBhazRoN4xC4ccAG1IX/kQy2spDWjpZJpfSkeZXnXPS1cDpbuGL/SxO3NT7JaXPhoRt1EWYUybog8bDgy6HroXL/qi/Prmg/hR2uh3ANCc0FguV9GuDhR4rlGfyu36z8+/eIYyRMe+Yb1QZCYta9K87jgjzL9Y0uxJ70P+RarVrDob6ue+sdF82XtHtn7q9iYDXtFsdUA/8b2uRQuVO8GlagDrgv8EnCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(41300700001)(5660300002)(4326008)(8676002)(8936002)(31696002)(2906002)(36756003)(86362001)(6486002)(478600001)(31686004)(26005)(6512007)(53546011)(83380400001)(6506007)(2616005)(66476007)(66946007)(66556008)(316002)(6916009)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmJHblhFYllUcnh6a0cvVEVtYk1wdXE2cUZlZG1NNjI5TnExUlVxUjBhZHZU?=
 =?utf-8?B?aXlzMys1b0JYVzlzZEo0M3ZpSmE1OGxoYjRsNDQ3WE5ubnZveU5mOFcyMmJh?=
 =?utf-8?B?MGJ5emZsMG9XUVorYXVUMzB5M0ZybnNwMnFlTHQrUk55d3RKMHlJOHgzaFli?=
 =?utf-8?B?ZjFZRzVHNVlZVkV2UWVJazVNWWtJMGh0ay96SlpuSm5COHp4VnkxUGtxL1gv?=
 =?utf-8?B?Sk03elpTU1FzNVAvSE9QK3ljM29vejVhRFpGWGJraU9uOEhEWkN6cmduWkxj?=
 =?utf-8?B?Q0NUSFF5ZGZmMDg1SjZpU0lVZnYvclhTbDlncXB5dE1nTjdaM3dFd05Bd2J6?=
 =?utf-8?B?Q3UzK3B3Yk1MbFE4bGZYU1pxQXh5d1lobmdHL0tMRUcrb3ZtWUR6OXJpNnJJ?=
 =?utf-8?B?dDR3YjlqNE15VHFKdWF1aGVTckNrdGpsQmt3MDVEQVVDYmQxTFBzclpCYjUw?=
 =?utf-8?B?cXB5ZjJ2cnV6RjQ2R243dWRrM3lyOFBMNXhxYmhlZ1NtVHp4SUJnMlpKNzlw?=
 =?utf-8?B?elpXb3M0NkpLbU9zRnVrOHVjWmQwMEw5MStvTGdpenhCOGFJSjB4ZkwyR1gr?=
 =?utf-8?B?MDZqclVTcFBRM3V3c2JVMDM1MTMyYnl6ZVJJenlDMHM2UUFYNHhOVXJxVXdJ?=
 =?utf-8?B?SHB4ajRhVFFIQjlJY2RMeFF0RC9YMHowdjB1N1F3MzV0QzN5bnhLL1FKeDIv?=
 =?utf-8?B?Smw4UUg2a3VvaUVvY3A3V2RxYXBPNlJvUGNSZEdPbUJEZTg0TFVhWi8xZHNP?=
 =?utf-8?B?WWpJcGxGVStpYTloRVVwMUhoWVk4SWpqVDFxd2t6eUNvQ1VhNWlNNWV2VEll?=
 =?utf-8?B?SFAzR3hnTW9pUzBXSi9BNVFZSFppTGRYNDNFODNhWVJBM0Z3djFoUHVyWnNY?=
 =?utf-8?B?K2JYekxXL2tsTXJkZTNqVVdxSk1ya291SGpZaDdEYTcwaHQySDJXOHlCS1hh?=
 =?utf-8?B?U3FJamswekQ0SDA4NzJzWWRkMS9qa2ttZ1plK2JYeXFPOE5GNGJ5NkUrd2tn?=
 =?utf-8?B?ajdjbXlqTWptQUtFdk1WYlZ6cmhBS2s4WWhXbmpTZFZhSGp3SHhkcFBCSkcy?=
 =?utf-8?B?eFJKN0lNVzZCY09jOG5SWkYzeXhERWtiK0xsSUVJWkRjc2k2ZVc1Q0t4TjNr?=
 =?utf-8?B?MC9pNzZrWWFsSWwweXozYkgrUHdJanpEczI3cDVwYnpFamxWZXNDOVA3SDhM?=
 =?utf-8?B?Y29YWHUvUEpUQnYvR1Nrc0QzbGJCUDlFNDhJTXJnNWN1MTdFZFRXWWpoU1kz?=
 =?utf-8?B?eEpmYnV3VGFWMGRSeFhhdmhPdk8xZzZWTE1meFFsMjdJQVhZL0pJVkRrTXp2?=
 =?utf-8?B?ZDIwVFJvRUs3bmFJRnpUU01KNG1Gdm4veitSV09rUlptaFoycTlsMXFaOWRZ?=
 =?utf-8?B?WTlmbkZOWHg1cGJOV2pEdnlZdWYwdGx5aE9UWTBDcTdybytKRXI5UFp1eXFE?=
 =?utf-8?B?RzhQVFQzWS9FQXVJU2xNVFNzNm1BZ0Nhb1N1VE85dVlURzh3RkhKZlZsclhz?=
 =?utf-8?B?akd5T0ZJcnBtOWNybVZxbGFwdkd2TXhRd21xM1dJN0c4YllXWkZwMjFYR1pj?=
 =?utf-8?B?RnFpU084TFhWdFlJdGNhSmVLZ1plVHBCZGFnN1ZGSmFSbjlzQklhUHo1aFYr?=
 =?utf-8?B?Ny9SVmFjUkM2Y2IxU1BqTzA1b3NmK1BTak5iWmRmMVE2dlJWYldSVGFsR0Va?=
 =?utf-8?B?bkFzaUdmbnZmTW9jWDlKYXhKQmxOV2tBNDBtMkl3ZExIZzc0SDhJa1RrNzEr?=
 =?utf-8?B?QUpNSzFOejJ2Ulpxcnp5aDFQTGNEcUROTENxOUNEd3JKMkp0b0Fnc3ZxVHhn?=
 =?utf-8?B?YlhPSG9UTllQNkYvMm91b29sMm5lZzBoazlRbi9Pd2RnTEY5Z1ZCTkRUbmZj?=
 =?utf-8?B?K0c2RGxRSW5BbjBmQkQ3alAwbnlObDFIRGxRQk1Qc3MwZTd2T0h1NVJ6SkR4?=
 =?utf-8?B?TmFIQ0JRNEYxQzJNNXpFU3FNMXpuU3lKLytmZDd0MFhqd3BqVWU3QjYvdlhv?=
 =?utf-8?B?Q0pleTcyYytTRng5MElpdDByR0kvS0NWVEVKZ3RxSk5aRVlQakljaDFOU3Zq?=
 =?utf-8?B?RmxiZDJnZTlUTk1HZmtzVytld1pvcXVxakU4YXI5a0lWS0o5UVNkOU5rTVZ2?=
 =?utf-8?Q?tvBhYyNuheYM9V/iT/k5Jdy9Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f80003c-524c-41a4-791b-08dbd46034ba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 07:09:47.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPnAX0H7OriWSdfwfhRwA5JYamcJ854gHrJNfaQf8g/6igTdCXfYGpnY8VqL9mWCVfbzAjHYrGY1nYclpvAMog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088

On 23.10.2023 18:36, Stewart Hildebrand wrote:
> During xl pci-assignable-add, pciback may reset the device while memory decoding
> (PCI_COMMAND_MEMORY) is enabled. After device reset, memory decoding may be
> disabled in hardware, and the BARs may be zeroed/reset in hardware. However, Xen
> vPCI still thinks memory decoding is enabled, and BARs will remain mapped in
> p2m. In other words, memory decoding may become disabled and BARs reset in
> hardware, bypassing the respective vPCI command and BAR register handlers.
> Subsequently, when pciback attempts to restore state to the device, including
> BARs, it happens to write the BARs before writing the command register.
> Restoring/writing the BARs silently fails because Xen vPCI mistakenly thinks
> memory decoding is enabled.
> 
> Fix the BAR write by allowing it to succeed if the value written is the same as
> the Xen vPCI stored value. pciback will subsequently restore the command
> register and the state of the BARs and memory decoding bit will then be in sync
> between hardware and vPCI again.
> 
> While here, remove a nearby stray newline.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Do we need similar handling in rom_write()?

I think so, if we are to go this route. However, ...

> We may consider additionally checking during bar_write() if the memory decoding
> state has become out of sync between hardware and vPCI. During bar_write(), we
> would check the device's memory decoding bit, compare it to our vPCI state, and
> invoke modify_bars() if needed. Please let me know your thoughts.

... iirc we discussed earlier on that doing resets in Dom0 wants
communicating to Xen. Any way of resetting by a DomU would likely need
intercepting. This way the described situation can be avoided altogether.
We may go further and uniformly intercept resets, carrying them out on
behalf of Dom0 as well. The main issue is, as with any config-space-
based interaction with a device, that there may be device specific ways
of resetting.

Jan

