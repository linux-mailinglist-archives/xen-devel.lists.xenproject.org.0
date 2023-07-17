Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD3755BE7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 08:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564164.881437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLHu0-0000eJ-Cm; Mon, 17 Jul 2023 06:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564164.881437; Mon, 17 Jul 2023 06:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLHu0-0000bV-8j; Mon, 17 Jul 2023 06:40:12 +0000
Received: by outflank-mailman (input) for mailman id 564164;
 Mon, 17 Jul 2023 06:40:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLHty-0000bP-En
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 06:40:10 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5288b8c-246c-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 08:40:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 06:40:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 06:40:05 +0000
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
X-Inumbo-ID: c5288b8c-246c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3wBIWQb9wMYgmCQvwOTcE8wlf6saM44kONMJVGRcgLbHJ/U5yQJp6sg/qyrKvaBz02UIu3/JGztqv95jgwosc/BGfhsffHUvTjGLvg5ea+LEMrxJCpRvDhXEkjq8C4U7JBlLaf+W/mmOzJHL1zJL1DrV8G2obTfh3FmmKEJ8eQRWILu/ioMKqvfbO0hdpX6s7UO/mNJ/vT2bf40FCBcHI7iKnnjLRARWjgawFEjAfFkxxzWu5uLjMUYdUW7QtMtFqKtgXBzNIV/+073SRC4kmnJgdlOsViTvySDTPimeT9A/FSPjkAZysXo8fhpV7IwrE89A6TLRFC7hNm+qhaD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKmexXTbrUGTn9DQSN9fpZ/XfjPhjBUEKn6DOlNpc+c=;
 b=DRRU7xuf3pi3n+eR/ak9RB5zS5aW+gu30QDaw8vOQuq9c8I8oRjmMTzXyNGeG2PArI3P/YVp+VXuX6vpzIRsr3dNfvqx70it95zJTi4WIoJwMo9E2gYh4l1yDKPSUrTQ9nPoWlP1t+0ysGECGVCW/WCL2NrN+HK2eNyb5+3iobLQBJN+CzzakmT2TQGcbh1ckLosjIkIOYEF7WYAhPdXUIBCpv9DJewz+Ds+uobBkAcBHSMvVmf0FW9Vv/fu4iOdYwoMuIqd6/QCPsiEsY8q9Dnv3R9hDtZuKvAyBO3yw2ciKPZ3ctc+uy6Rfg0b9Dj4jJ8UfgM7skt4t/qsvsDWiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKmexXTbrUGTn9DQSN9fpZ/XfjPhjBUEKn6DOlNpc+c=;
 b=v5De/NQLDu15xxC2ZzZApL/Whmd7h/ZfOihF/KWCSmxfWVA43cyOAmRxJ3twjYvFo0SBnBTfUGiz+/sEUHUB3C6E46VsW+M8y4qKchj6U8D59s3lPFwMYWU1iIZvzvmu0N3CPdL+XQbXxch2RkefWE6oKzjTd2VAYja0tZfEK77mFUh62fKnsEsUwwTzL1KVp1NT6vFZGn3reo2XF1AGpyoiP5XoIXOsV72X4slYX+jEMd/GzH1fM3okICYGnoNymCI7THHDPARMI7QvQtZtFQQ6+8pBg/Zh7+l4UQz0wzHFD8xigwJaCj52tzequJgk/BNfHB+nyAsnZeK1Z/gCIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a2c1e47-767a-4029-bbc3-b809b0baaf75@suse.com>
Date: Mon, 17 Jul 2023 08:40:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
 <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
 <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
 <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
 <d84482f4-8be6-e514-58a7-a529890c8feb@suse.com>
 <ZK7JwEhrB-70nlla@MacBook-Air-de-Roger.local>
 <6d0ed712-0807-33b6-1586-a0588086c3a7@suse.com>
 <ZK_gHltq-1se3fau@MacBook-Air-de-Roger.local>
 <c2de675d-b4cd-1040-efa2-1b8b90448d90@suse.com>
 <ZLFyVugKWItJklcu@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLFyVugKWItJklcu@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: bc05750b-9332-4864-d57f-08db8690a7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rP00HS9BhJleFT5xe3U2EERZCGRMRdGbqInNcaQ2aacmeqXYLRzNxT4ubWXpFrNp/MsZQEHXFkvCjz/GHlr99EDfp1oxR5s3OA297cOppSWiTFpz3Jl8mBS69nCHRVpivD8cmzpxR67ox7yQiQdp3bQ1J1rm6Pa1r507HMrfyAiToEge3vlDYbxTgH/j6ecXtsH7JqkesqBbvT/lcgRT/T3aceyZLeM1F4fWaBNz/+z5pMz2ELZNM77EKiCb129F2cY3e1k2k/Y3UHAVTF336h0u5rv3+giB09Orw+7hDHwIGgZ0h9KIeMUuXIR8/Obgu/RGnRE0dfKnWkmEL3OmOpBcaIAr2M5NiujPxXgJgGb8Tb7ODByBK3bbC5RzMv8GZ4k9Zo0E0Oy/foLAwPjCZ1sGTwyA4I24e0azRqZ674o7PmawyOAjdD4cPrZ3CKaQOpmzHOWK6a0FZQT2lPk/yj2aKlv0lnlaEpdl96hLy6oYL3JkH4ikrXWjjcjgTzkMkg3jqkyQ985UV6RogM1w6uJCEMkPKVtxZWtDZZJMRKk1frhU1fbLoWt04rxFloLW8zUoD5a4IovBo0u1rBKZia4EOxpGrsP8JkX+Sv4uEsQKhwFQ9MLy0+hew9w8YgUo6cd8JgqIrHpS7Yme2fscUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(39850400004)(366004)(396003)(451199021)(6486002)(26005)(6506007)(53546011)(6512007)(36756003)(2616005)(86362001)(31696002)(38100700002)(186003)(8676002)(8936002)(2906002)(41300700001)(478600001)(4326008)(5660300002)(316002)(6916009)(66946007)(66556008)(66476007)(54906003)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjZEc2k5aTdwMXVwQmNQbXJRWHYyZVJFVDh4SzVCK050a0FiSzhxbHl1V0VD?=
 =?utf-8?B?bUptZE1tdFhhNlhrdTNTM3VrRER6TTRtdU1waTRqRk1oUW1TTmJCYysxckNy?=
 =?utf-8?B?N1FrTHBRQXNrQUp2WXpkYWR4ZDE2dGhFNU0yN2MrWGdpcXFNQkxaN0s5RVRD?=
 =?utf-8?B?RlRlMGRCWDQyQ0NVNFpvOWF0RDdNeUhNc0dGa2c1Z0svSGM4cFBFRTNnQjlT?=
 =?utf-8?B?Q0pCa0dJSkNwZ1BCWE1uOHFtanA3bnE3NlVIc0FScXVMVmNXajdvajcrZkps?=
 =?utf-8?B?ZU9MbHIwKzYzMlZtZVZJRUoxdXM1Vnl0UDRKWHIxVjZxTHRMQzFKeW41WTRV?=
 =?utf-8?B?emZsQkxrdzl0WmhTaERsQlFNai8rbWdPREg4U0c5ZmFWMzlweEpSSmYzSUcx?=
 =?utf-8?B?S0NrQWY1Ykh5R3NGS1htcGh1ZVE0OXJuTUVOdS9FQ0Y1bzVQUnF6Qk93U044?=
 =?utf-8?B?SmNwRlk4QXdiL1dRZ0djUTk5MFFPRmkvU3RYM1FodFovVXR2WVN5MHRxbm1F?=
 =?utf-8?B?VVE1Kzg5T0lIaWdXRUxXVTBPeGhzNmV6Sk0xZ3BkNVA0WVFTalJKcGFOK0FH?=
 =?utf-8?B?WVhiZjBkTU8rMkN3LytRT0pLNDNudnNsZXhpVG5GclpxM2p6TkRIYTF3TTN5?=
 =?utf-8?B?NXN3Qi9JdGRJZnZ3a2I4KzhGM1hmcUdMbHR4ZzRQZS9ObHk1cmhIWUxXZndG?=
 =?utf-8?B?K3YvNjh0d0JQb1E1N2QrQUw5dnc3cDV2ZXlqNGxkL1VLRkZWaWREMEg2UGZt?=
 =?utf-8?B?c1Jhd1VIaWJ5QkNmUGZmdFREVHBKSDBkVHR1MytVS2NHWHdEa3BlRitvK29F?=
 =?utf-8?B?SEhpWjliU01QTDJ0eXdmMjFtS05nU0ptZytTSWhKc3ZaRW9OcDFzbEhpVk12?=
 =?utf-8?B?azVRcW1KU0hEeXRCa2FGQ2ViM05MOXZBTnkyQWpoVEZRRTVEYVNuRHVzRmUy?=
 =?utf-8?B?cVlmMFM4SjZkblhDU2JHRmdjMERUR3ZMSmNnc2tUYmc2VkFGZXozakVsYVdw?=
 =?utf-8?B?NVZIZ3hrRlNMVnpxc0QwZDRsY2xoUE1ZelJoS2J4NEhwRE1HT0lKWXhpT2lw?=
 =?utf-8?B?WHVPemxybXAvd3BDdThhcFF3QUpvVUhPYTQrU3M1RlE4N25SYnRmdHpnWmZ6?=
 =?utf-8?B?VnBYa1A0M2NIZG8vanhqbWVFWU1VKzBPVHd2WnQzc2s5cUFxOTB2NnorZW9K?=
 =?utf-8?B?Zkh4YnlSeWUwdFcrMlhjQktjb2hVSFFjOENYcWxnckZFZjJNQTFUWFBRUW9E?=
 =?utf-8?B?ajJ5S1JHUXVjQkN1SUVEV3J2c0sza0srTkRTV0pjVTVxTmhmU2ZCaHRhUmxV?=
 =?utf-8?B?K0NSNHV5VGJYUENmNk1hUHJHRDFhdG5iaEppMGN4YmxUWVdPUVRYem02NWZ4?=
 =?utf-8?B?cW8zbm5mRkxxbFd0UW1uR2R1V3lMZThhNUlFcXhrMjVSeFR5UndwRWdRQlJm?=
 =?utf-8?B?U2R6UEZabXNkc3BhYkhyVWVpYjN2VkptTFpxNTB6bGhCNzU4WU82QWJuS0Jr?=
 =?utf-8?B?SG9OeXYwbUs5c3ZOWTQ3ZE14Zm5VWTRJRkwrM2hkUGlNUmlER1M4MkN5NHgx?=
 =?utf-8?B?ZHB1ZGk3MExTL1NBSjFmWEdHR3lKMzcvQlhxcTA4cC9RRk1OSnIxS2VVOG44?=
 =?utf-8?B?THoxNUdvZDdEc1NNLy9QTllIaUN2QmZMKzBxYVF1OEZraHRqSVJkSHRKZlZO?=
 =?utf-8?B?SVExTS9VMFJ2TW9ZcnVvdDFQbUk3cXk5TmNpcVZMZzMrOHdXUXNXV3BzUS80?=
 =?utf-8?B?NW9CTUFOYnNNQlpoY3NKamRRcEdveWgwOEFYbWQ3NzF5d3g3QlVraUF2YWdI?=
 =?utf-8?B?LzF6VFhjNGFLakREOXNCRzBnclB0Z0hyKytWbFZRZ2RnSVlZcE85RTd2V2F1?=
 =?utf-8?B?eW1sMEw2dWJVOG8yOXNUVGFYdVl6eDZZT1NWbFhCMThXVkVsQlBTMUFGOXcz?=
 =?utf-8?B?cWZ2TXBuNkVaMFIrUzdKRk5VMTRBQzRPZDVvUmMvMkY0WkpXaVlLYVltR1lK?=
 =?utf-8?B?b1dEczlCV3pQM3JVS1NWdFFyM2lYQ1lJU09leHpVZ1dEYlZrekRvOFljRlFk?=
 =?utf-8?B?NzFSaW5aRjhjRWx1eldLanU3azZ0azFUblVCYTA3TG52TnR5RXhla1BTSmxx?=
 =?utf-8?Q?G2gt11aGFTCgO1Rzu0c+856WO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc05750b-9332-4864-d57f-08db8690a7c7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:40:05.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sl7eEwChtSlKm5XS0As3GD3N7lrbbmn5JsG5EyzgKiSPSU1wqWmUgPfVkqVpoO8MQjROAzs3iApjuNZ77TnoTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295

On 14.07.2023 18:05, Roger Pau Monné wrote:
> On Thu, Jul 13, 2023 at 02:18:29PM +0200, Jan Beulich wrote:
>> On 13.07.2023 13:29, Roger Pau Monné wrote:
>>> So to recap, I think we are in agreement that calling enable_IO_APIC()
>>> just ahead of the call to setup_local_APIC() is the preferred
>>> solution?
>>
>> Well, yes and no. My preferred course of action for the issue at hand
>> would be to convert RTE 0 to ExtInt (under the mentioned set of
>> conditions). I agree though that we also want to move the masking of
>> RTEs, and for that I further agree with the placement mentioned above.
> 
> So I hacked up a change to set pin 0 to ExtINT mode (and avoid doing
> the masking early), and I got:
> 
> (XEN) spurious 8259A interrupt: IRQ7.
> 
> This was a single interrupt, but still I think the masking is the
> critical part to get backported.

One way to look at it, yes. My perspective is different though: If
there truly is a (spurious or not) IRQ at the 8259, then it needs
dealing with sooner or later (in the process of booting). Aiui if
we masked pin 0 initially and then later unmasked it (after
switching to ExtInt, if not set so by firmware), we'd still see a
spurious IRQ7.

Jan

