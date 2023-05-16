Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF8C70454F
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 08:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534955.832477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyo9U-0004kk-8N; Tue, 16 May 2023 06:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534955.832477; Tue, 16 May 2023 06:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyo9U-0004i6-5O; Tue, 16 May 2023 06:27:16 +0000
Received: by outflank-mailman (input) for mailman id 534955;
 Tue, 16 May 2023 06:27:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyo9S-0004i0-DC
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 06:27:14 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1737ce8-f3b2-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 08:27:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8242.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 06:27:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 06:27:11 +0000
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
X-Inumbo-ID: b1737ce8-f3b2-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keyXqCQUp9/f6ky5njaEl9zt9E1lJdvUGVhXpYRAcTdaM7D5pU9vZZZz6jw71I4MEl7vyQgxSPQquOUd2n7GqR4HCI9mSmHgrREACe/n5M/wvN3gmbIoGvIfQU3SLkzS9nNBqNgtwjjskv0AqcK8Ah3I54aveIyFijXt6WmWDbdJVXytIT4EXQXA8LT0jY3Zzvo46l450YpH/wnPvYuNLbOHfMmZo84lpF6AH9l3rDXKCgWxEb+sO3rcMVk6TDcFYXyC64Jt+ni5LA5DL4fjH7sHCl43TBqOFZRnrq+POt5tf7UdxzgbLs6hAWw58V6J6byDaJW2PQUZBN9sKviIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAVow9u+Xh4x/o8AdSzCfnId7jaatw6Kd5EYpOSo6I0=;
 b=htkky16RIMz7Qb2Umt+kFfUdPklzWz0t9QdcXgq+dpYmqjiTl5nM9ppM6xZHqBZYJZFe0hnHvtI0DE36XxWrc2N6Qw5BKjl5y3JcibsWvvsceyQ+HBX5xBZkqNS9AY4176shqpqp9lQ96eiph85bVIMH2t+fUfwVjEaQsPKd6vIDmsbje8Y1sHLDnirtsfXHmZgqGiHNJfUUSQrails6MGeGwTeVfJH7CzRvhJ9S0YsHqofPMb6RZBNY2KFOoJNK3SDGe1P2PbrI91iDRmntvylJ1LbZKEQcxtklWQ6njhbE6ynGK+kHfvCgf6ND7g+ZnANyBsmJqk0XY8alAnrk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAVow9u+Xh4x/o8AdSzCfnId7jaatw6Kd5EYpOSo6I0=;
 b=kCbMHCeCFqTzT6eO6iXkuGjK5GHOehLp0LziVbOhj9LYV3upbwmHXxr3baQ7JJVab0gli0ralm4LvaERpMrjvqkSa7dR0JWeI6CQ+fcqraBsKtk0ibllXxM2WPVSxKFyf3iTmYZrC/JIOe0KKUM+EWjJc+bum4VV7gXXtpdIEdJG8nl1eQ5fweagSRAS6SoN5X2I4mA3iEqci+VAPcc5dK7XpddaoTGUVSjSBdjcVm9wZ2AT7FczfVaTxXo9yGivQuj72J2L0j7JfyVpTVY+NRZ83ZUaovmWP9tEhAMOgp3ZDj/Kxkwt99lE1RJR186ZrZZ8JzwzTXz+WvMSkzuNfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad78afc7-8733-dca2-e9e5-26435661d560@suse.com>
Date: Tue, 16 May 2023 08:27:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 Xenia.Ragiadakou@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
 <ZGH+5OKqnjTjUr/F@Air-de-Roger>
 <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: ad499888-73ed-4f92-259f-08db55d694ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tZhUEuKkJojRSxJEkDCJp+LsBeD+yvNo5b7ecCG7Ca4eOYQicrDHIPydNsHv/dkqmt0OlgGyfLxNVxP0Swol6HannomdCwLpl9pjsYiAVmWcPsv7CNmRoEMmrpdqgw408AIal0SShNmrp7SZKmNV8QtiuK+BwnACnel7xDwH8HRP5+KTrWWkyxmhaVUqHlmamy+tf5pFcSvy9auLHfuzvxs460/bYLpKUbr+eLRTJDm0jATtVrX4iKVgmbRtecxDCp5KaLNZuvjRWv+Bm+jm+8xNAuRNTqPKr0DeckikZQpgQ4Hs8VffHLY0q40j9iIlnGBqsUwlom58e6lNlhEZjATiPkJzJy/06cqWCsnMk3cG8dJBTVo8V7nIkoaZiFb/0C8abq3JgjLOf+rY7zZtOul+WKkVHtMZ4KrStcEjLAgQlI+hHdF8L7X6lsGRmwkyqr4I1LmvFdKyt9ypfXY6VzVgGsUore2uNr+rRVa2eHf5kV9W+kosfgOdv9QgB2KGyj5YVlymCy9lUSNLy8X9kQWuYnV2kM5i/Qfm0gesopZb4gM1m1X+5wLFKvTy3+ACYmhElZzz6g1OCxA8D+3ofKxA3yewj6/Pg4uG81gPnr9xY7/LOh2DJzRiD7k4slHnH0KloMPTae37fP0ELzARaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(6486002)(53546011)(83380400001)(36756003)(26005)(186003)(6506007)(2616005)(38100700002)(31696002)(86362001)(6512007)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(41300700001)(4326008)(316002)(6916009)(2906002)(54906003)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm9aTVdtM291cE9pVzNmeE9MWEkxbFBFUVo0SWdQV3VCM1gxbnU0eElBUWZM?=
 =?utf-8?B?K3Yvb215OEEwNzIyTVQ4ZUJDVTI1bFMvVEhOb2ZmSHp6VER2RExTbWk4R016?=
 =?utf-8?B?WjBSOUFWQ0dIT0ZMSFFsUERuR2VvZGtpZzV5cWlnZDBhYlpqeE1xU2QrUVFZ?=
 =?utf-8?B?NWpwU0xzcEdhRGd2OTRTUUtrMG54RDFjTkdZSVQwdE9IaVpuMVhwQ0lkOWZw?=
 =?utf-8?B?dnhJbXMzbWphMVRVb0VJWlRSSnB5Tm1nMGNpTHA2SDVhOXVtelowNFBUb0Zw?=
 =?utf-8?B?SXdwZjQrelJOMmd2WG5wZ010ZWplSW5UNXhWeG9WUDJjY0tvT0I1MVB6LzVw?=
 =?utf-8?B?cXBETGlJSHpiYndSWlU3dkNZVnoyMldPVTFGQm1ScnN5RWdYamFreHVoeDAr?=
 =?utf-8?B?eFVIN3lIc2FvWGRyU1plNndGRDlSb1NqL3hCNng3UzVTRS9NTGpKRTU0YVlV?=
 =?utf-8?B?THltTDRqckUwaGxYU0lOOUY1bWFqSHRDd24xNnJlWVJHR3ozS0szUURZeGJT?=
 =?utf-8?B?RWRKanp3NDlOSjlia3ZuZ0FHdzhCY2xZVkxtUC9Rd2dXTUpKRm5aYklubXRB?=
 =?utf-8?B?SHdleXBlQmVZZGpULzlRbWVodk9DMnRJejR2YzFJRUNEZUVUWllHV3V0cTdB?=
 =?utf-8?B?YlZZU3V4RHljZllRUE5NVEt2dWJZd0ozTmFPWlU3TFN5bno1S1FuYUFxb3Jy?=
 =?utf-8?B?MjlWc0ZxQ29WVWh2a1dBREg0akVOVkpvZU5XcWY4YzhzemRTL09pZHZWUmpn?=
 =?utf-8?B?cXJIT1QxS21BZGt4QWZKRkwxd3dvQiszaUY1RjVaSCtOL2w5dmVyTVZTRXRX?=
 =?utf-8?B?U2lRNjlMcUUxZlRkcnZ3STZWYWtOY0hnc1RwU3FTOUorSHVPL2RTa3pkUkRX?=
 =?utf-8?B?UHRUejFLdStYcnRUT2ozTG1EMDNDek9VRnI2R3dweGFYOTd4RUthbXhmVnpW?=
 =?utf-8?B?b0h2MTVUZjExaGlkRVoybU5JNDVHdHpWZU9ESlhLZGdmaCt3RzhZdHlpVU9H?=
 =?utf-8?B?ZnNJVHBGTGFnNXJCTmwzQ3FTYmpLZHk1SE9oOVNNWDU4ZXZsem0zb1ZsaUZH?=
 =?utf-8?B?cnVCeStIOTNINlg0dld2L1VYeUM2bjVFSkxBM1h6d053OWJESVczNXpQL1hr?=
 =?utf-8?B?S0dWRnlOWFQ4cXpPa1U3UWhXK3g0eHNFN2M2UE9tdGd4Zm5ZY2lkNWZ5ekhT?=
 =?utf-8?B?VzUzQStTVFNISkI5UDVKeWpMbXR3bm1oWERvaFgwS05kL3JaQ0x0NnBRNm1z?=
 =?utf-8?B?aFFoclpNWEhHVGJEUWZnT1NpbjBMYVNpMTNXV0dFZi9zQlZ5bkFMVTlreS9a?=
 =?utf-8?B?S0N1dkthYW5xNGhMOUtmd1V6MlI3a25KOTN1QWRjQ1JJcUl3VjkrU3hwdzRE?=
 =?utf-8?B?Mk4zWG44UTAvSjdRdkZBYlM4S3RybllmUlVRRkpaczNPUlFSYVRwU2tiR3Zl?=
 =?utf-8?B?VFlScnVGZW11UElGajV5WnRXeUZ4VVFJSWloNHBvSTVuclNYSEZqSVg2cTE5?=
 =?utf-8?B?dzJjcC9PRTB3ZWpLbVhXV1dFaVBWa01scU9Ic0dta1k4M0lwaTJobGpDVVJu?=
 =?utf-8?B?WlpyaFpleExVcGNSWmZXUDRLV0RhRko5c2RaZEdCZTdGa3lBOS9vZ0VTNjVs?=
 =?utf-8?B?cjhkZjhWVUJiVHNoTjJyTElDV3dIYWNlNGtsRnlySXZBR0VxRU5BaE9UOUpU?=
 =?utf-8?B?WTMzenEyVVE4cGIycS9lR041TDZ0cGNoRlJsWWNLV2hkZlMwNndQc3c3Y1Bk?=
 =?utf-8?B?QVdvc2VpYXRVTElzUm5SY3BFaFREZGdsSEZnblNScnp6c1ltajlOZGwvNHA3?=
 =?utf-8?B?K1ZIVndhRDV0eHVqeWkvc1BYbmUwbVRSOS9CenZ0NHlPUSt5UmNoVi9ObTRV?=
 =?utf-8?B?c3RqUXpLb3VGb3l5dWFqMll5L213YWFXY1VkUWY5aEZxQVVPSnRzTUxhRG9k?=
 =?utf-8?B?QzlkckRTVFAvWDBDSzh2SlpNRmVOS3p0YzZHdG9pNXllTGxWckZrY01NL283?=
 =?utf-8?B?NzRBeWJack9jK09Od2VVam9EcFp4Ukw2dm9NQ2ovdDZ6bEt4K0x3bjUvby9v?=
 =?utf-8?B?ZDR0bklNc1hIaXkwTnZuMHluYkhXa0E2WXoxdFY5aFFjTFUrMExsTzQzVXhM?=
 =?utf-8?Q?Q1Wqv/+1xJ1wxjrauTwnA3VZ5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad499888-73ed-4f92-259f-08db55d694ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 06:27:11.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIvB/znV6YJuoR86nOriTHyQReo4mTxUnayK2cciWLRtukmsFnF4e+l+vt8DoOmtiiYjTYIDs12le+ySN3b1MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8242

On 16.05.2023 02:11, Stefano Stabellini wrote:
> On Mon, 15 May 2023, Roger Pau Monné wrote:
>> On Fri, May 12, 2023 at 06:17:20PM -0700, Stefano Stabellini wrote:
>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
>>> the tables in the guest. Instead, copy the tables to Dom0.
>>>
>>> This is a workaround.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>> As mentioned in the cover letter, this is a RFC workaround as I don't
>>> know the cause of the underlying problem. I do know that this patch
>>> solves what would be otherwise a hang at boot when Dom0 PVH attempts to
>>> parse ACPI tables.
>>
>> I'm unsure how safe this is for native systems, as it's possible for
>> firmware to modify the data in the tables, so copying them would
>> break that functionality.
>>
>> I think we need to get to the root cause that triggers this behavior
>> on QEMU.  Is it the table checksum that fail, or something else?  Is
>> there an error from Linux you could reference?
> 
> I agree with you but so far I haven't managed to find a way to the root
> of the issue. Here is what I know. These are the logs of a successful
> boot using this patch:
> 
> [   10.437488] ACPI: Early table checksum verification disabled
> [   10.439345] ACPI: RSDP 0x000000004005F955 000024 (v02 BOCHS )
> [   10.441033] ACPI: RSDT 0x000000004005F979 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> [   10.444045] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> [   10.445984] ACPI: FACP 0x000000004005FA65 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
> [   10.447170] ACPI BIOS Warning (bug): Incorrect checksum in table [FACP] - 0x67, should be 0x30 (20220331/tbprint-174)

With this line I wouldn't really call it a "successful boot".

> [   10.449522] ACPI: DSDT 0x000000004005FB19 00145D (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
> [   10.451258] ACPI: FACS 0x000000004005FAD9 000040
> [   10.452245] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> [   10.452389] ACPI: Reserving FACP table memory at [mem 0x4005fa65-0x4005fad8]
> [   10.452497] ACPI: Reserving DSDT table memory at [mem 0x4005fb19-0x40060f75]
> [   10.452602] ACPI: Reserving FACS table memory at [mem 0x4005fad9-0x4005fb18]
> 
> 
> And these are the logs of the same boot (unsuccessful) without this
> patch:
> 
> [   10.516015] ACPI: Early table checksum verification disabled
> [   10.517732] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> [   10.519535] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> [   10.522523] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> [   10.527453] ACPI: ���� 0x000000007FFE149D FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)

By instrumenting the kernel a little, it shouldn't be difficult to
spot where this bogus address is coming from. Inspecting the
relevant tables right before Dom0 actually starts and then again
slightly later (perhaps triggered by Dom0 itself, again via slight
instrumentation) from Xen should also be possible. I kind of expect
they're going to be okay right after construction, and become
corrupted subsequently.

Did you check that the E820 table properly covers the ACPI table
range(s)?

Jan

