Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A617F4422
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638676.995519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kgZ-0006LS-U4; Wed, 22 Nov 2023 10:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638676.995519; Wed, 22 Nov 2023 10:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kgZ-0006Ie-R3; Wed, 22 Nov 2023 10:42:23 +0000
Received: by outflank-mailman (input) for mailman id 638676;
 Wed, 22 Nov 2023 10:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5kgY-0006IY-5x
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:42:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cffcc9b0-8923-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 11:42:20 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 10:42:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:42:18 +0000
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
X-Inumbo-ID: cffcc9b0-8923-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAvhYEomGMHbvwUXt49v3qOz6vZUe3bGIJhFybeDGHDpQU8ZCORuh/x0PTLdkQP06XhF8p6HMbko7qO1yVHrUssaBl77+wzi+IWtMLgqmYNwdcpGhUs7uhaZae850zvzUd0HQB9AhKQ9Czqgns3KbMy/R3jZRKnzkZ3Tk7b1FYyhCvpLzBraUpDTcC3h2i58pU5oUUTr18SL1U9cJkeOZTuZfauaf7hVO1GjHTWkjeconv9QzIgs88f23/0QUUpFabPjeJgWxSqSZw1x8L5cT7E8h0W40u2voE4AJGd3vfY6+N5nVsWJ+JtQ64VZNEI7h69+kOH/7fBg+GooDRvv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDeAhrtDGl8fL7t9Chp+iJBISEnKJtQt+V9+uWdtvlE=;
 b=GcVpvpNIFUyYmW6XgkZVTyuq5OylFEfm9ZlP+5Z/rvWI9E8B6c8GHOHE9Kc7P5biOZ0RkWrOpXgBXpB9V8bscgDR9E7+DC+QYa3s85By+toEoNgCyglT1A0rKGqKb4syHsAMLs3FgJeD5yiarqhGZjml+mSrOU0u8PGZ/7siMMnu2EYnAYX22fhyBdy9MJQ0AKP0MU8aqGZK5wd6L8An+De0IVBRkVyzwPEstb4oOJY7WImv+Ap6wcv6AoUvfoxSPNjpLaeUuna+xTmUt+/o/hcjxTZbjwXcOk5fXfsXPRZKrwoxwRO63A8+7ZTUbT7RCzkBl1jcy0aJAocYwm9lUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDeAhrtDGl8fL7t9Chp+iJBISEnKJtQt+V9+uWdtvlE=;
 b=GWnJgKP3AtrRaPxbDGoGl6bsnNFhDJLCQHO/tDU8llYzzd/4lV1oEV/enciH7dSMVpbUZujqRRGW8s0irsPCYTfUUB9DSHDVwTQ0XIV4GTybVwgfTcOeuGXpWT5Np+ZnrtV8bopJwBh/8OAhCgw8M/WUPyAOAke1sHw7f3yZn8Tr+IDWh0gJoq9g8OE2npUH13MGohscJ8SSknq4S7eio+FeDQel0ofblz4dkD9ku72anNOQdJd8feKcb++SXfEOl6XUsQOKo04ugDmqa5DMaaRnU60giIg0Vj1QXayv71QLMd2c+eb+/pHX+mff50qLahyyzIgloAsgEABMt/ikwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <700ab3e1-0bd3-421b-8bc3-482ea2c84861@suse.com>
Date: Wed, 22 Nov 2023 11:42:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/HVM: improve CET-IBT pruning of ENDBR
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <40585213-99ac-43b4-9432-03d739ec452c@suse.com> <ZV3TL7BtSxC-sv7z@macbook>
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
In-Reply-To: <ZV3TL7BtSxC-sv7z@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: b524f8ec-59c6-4ecf-3fc8-08dbeb47b2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3aFDjRx02tssQwxaLfVxzE2anYo/lJBlLvZyzg0d2fwMSDLSe3kP6yZu+OXiVWYgjapDdRiJ71kUjdhwnR3L+hLsQ/ZOO6p8KIl1D9ztb9vKHTLzL2axU7UokIiJYw4ytTJPA8GwjTsCYLNsgn8PAbw3CoKs+1MhfiJqykdvQ6gLY8rhA89dke38SePZqfdGJ1yClDaGwnIy6yj3jWuDheUl/1Sz9+Rct1W4oPeefI6m8d61yHwghf8X69Qnw3HhISR4dPDWAaf+W8vUxXdgMskal1FENnlWkqBLsR7Iuqv2ewk9xJzor+2VEe14NUEn5oOrRp2DERln2VqAbjx+LPDETIj2qDubypEiAySTN+f0zo6ivqenli9dz2VbHvRG29F5KrzIaN583nTlc4PawDmnOm5Lhc4TzJ+cEmYj9U+XIYmef0gMIkcyqWWTLI72p0flclpcjPGhWSgMeD2TNvchCax3BZEcZR06IqfHopz5AvxkihSP4o4XQ2fQJBcpQ6wqctzC2zzZ0Ik2X0fageXVrbsA5/mr7znboq6iCrnyihFKX8+djhUNy0rAKUlBkksD07PUXMQLazY+QTXC2r/CrLtrWulYeIkssoVOXw7YxeuaK7V6xDyYxxfj+muWXj61rwfeAUwSxCqVez0VvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6916009)(316002)(66476007)(66556008)(54906003)(2906002)(5660300002)(66946007)(8936002)(4326008)(8676002)(6506007)(2616005)(6512007)(26005)(53546011)(83380400001)(38100700002)(41300700001)(31686004)(478600001)(6486002)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnN1bmxLSDRpc00xeUZGa0pWdXBHc205UGlNMXFmNk1hdDJHMk1YVlhqNGNv?=
 =?utf-8?B?UTFMOVBoTVNMWFgzWU54YmJpcm1QSUxPK1ZnR05IV0xPNi9UbWJBb1RzSkJy?=
 =?utf-8?B?a20yN2xnbTF6VDdvdGl2eEkyU2VCRUFUaCtFdDlXaEFWZFpQMWpYZklCNVVH?=
 =?utf-8?B?RE9mV3g4a1RyVGM3ckFlM0trRjlJYldUekJ0RVgzeSs2SU5BREdBZ1FMNkRQ?=
 =?utf-8?B?bWxJNTgyRGdCSURYYVE5TkF5V2JLK2xVZmc0SHhDNFVvUUQyd2IyMGp6NlRo?=
 =?utf-8?B?Rm5YbjVEZnlJbUp0WXBMUEhtMlovNy9JMk80cFFydDlPMm14RDJoZVZrU1pI?=
 =?utf-8?B?MjVLNmJwc25ZeWtJOWxUNFVEZ3BXMlN3djhnYjlOb2tIMWU1WDZ1dVNIL1NR?=
 =?utf-8?B?V0NzanIvbVlHMmkzcFFHL0pyMWoxQ1VTc2NCZ2tVcmFnaGdCbnBUb01tUHJ2?=
 =?utf-8?B?WWEvNWd3VFJGU1c3YU1JUnQyZTJPcXNKQnAyZThYTlZ6UmlLQ0NGblQwbFhz?=
 =?utf-8?B?YUJyYTVQNjNjYmhkdlVnajMvV3pqQWZKN0Z6RFdiYkhzT0t5S1RRNHp4UWhM?=
 =?utf-8?B?V1NtQzNiNjdnZ1pQc3RnMytWZVorQWJQUFczMUNjTXRVWWE4SllSaXB4S2JS?=
 =?utf-8?B?S2UzN0Y5WnQ2bjJUOFpMcmk1QlpHM09LK1J5L1NhbGRhdS9tTXFLdFRMNmh0?=
 =?utf-8?B?QUZ6amxBdzRCbjFoeFJGYVgwQ1dnUDB1bGN5bnRGQklObjdCVnh2R1N2Qmts?=
 =?utf-8?B?SWZmRVphK0hlWDFhMVBBQmwzV3lTeGlyd0FJZml3ZHFmOUVGRDVJeWU5cDVM?=
 =?utf-8?B?VmM5dEwxSkl6RFRXQW5nVWNvNXN5VDFiUm42QlBMalF1alc5cXBpMmIrai9I?=
 =?utf-8?B?Y0FPTlFRangrcy9Dbk1HVUEvVEhrMWU1a25Wdm9tdE5JcGdDaHpKUGJYTXlL?=
 =?utf-8?B?SFU1bXVNQzFqR1orRllJNWJKdlcxUmp4OEtQZnYwUVI1am1RU3RDWS9wZ2VL?=
 =?utf-8?B?K3lYQ0trK04ybUc3cE5Oc2RlVGJ5bEpFcUd3eXdVUWR2Y3E1Tm9ENlYzdkhI?=
 =?utf-8?B?TnRKR040L01YNEpVdS9YUVBGNkZDUGU0a0hUVHN1VlRERHNqWDF3b3BZYmFZ?=
 =?utf-8?B?STI2Q0NLaW1uV2VBRlJraWpqVlJ1OEE2NGR6QUdLV1YzKzlSemFYV3g2RlNN?=
 =?utf-8?B?cnc2RCtjTHJPTWwybTBFa3dzcmJITk1UTXQ1NXlzN0NWWTVXYWlkSUkzeXdX?=
 =?utf-8?B?bUg3dFFoSVdyRkdXZ2JRSlpnWHhDOWtadXpZV1Q3UUYrdDF1VnFyRzdvanZU?=
 =?utf-8?B?Q3BWNldJTVZRdmpWSTMvZE9uWFNldmZYcjRLUmQrZHVmc3FlT3g4SVdCT2NE?=
 =?utf-8?B?UlZLMmVkQWhNdytOYXRvMFdVdGNWaVdhOWpreUpDNEtoVVpsSjRrVnRENjRZ?=
 =?utf-8?B?TWFZdUVtUW1kcExxNDY0c09VMFlCWlFWV0xyc0Njemp6NnVsUDgwejBtbnNQ?=
 =?utf-8?B?MXhIMkg4Q1U0UXNUTEFpZDltT0VmdCt2TkM2a2ZLRFhJdm5qWmpVMzZnWE9r?=
 =?utf-8?B?RkFuTFlMa1FqQVdWeHBOMk9LTDhKVjNTajZpLzNJMmFGTVpuRmlRSXZDUktD?=
 =?utf-8?B?K0lDOHZrb2J6M2wzbzQ0aXNnTVZhTGlhR1lzUFpuMWMveE5MRm00VnREbW9w?=
 =?utf-8?B?OGN6S1ZGd01URHJIbGJxSlhlQ2RQRDFyek5UT1JydHpNNXYybnZpeFlzVXdW?=
 =?utf-8?B?NUs0MldnVTlVcTBYMFUwUlJ2WXhSdDJKbk5TZHc3eTVaRlMwcWxIVmpRN2s5?=
 =?utf-8?B?NmNZUXhUQUlhQmg3MEtweEVzaHRWTlBxT0NaREp4d0VmZ244NUZhd21HTDNw?=
 =?utf-8?B?dEd1UEQxZmNlWkVXTWg2K0VwbUpKVG9LZW5nM2h1Q3RGQzlKWVFRVlN4Tkcw?=
 =?utf-8?B?cmVmVTliL09uVG96bi9oRVlVdlY3OUtTUFBBM3NzYkY2ZnV2RjMxcXZkbmU2?=
 =?utf-8?B?QlBibVBON1ZZTXZqMERjaVhWalprYVhuK3VSWHZOQkVLbzF4SjVzckVVS1M3?=
 =?utf-8?B?UGNmQXpHTjRDbm5ZUHJpaTRKWmthQ3FJdTI0aDZxNGhKUHdxMHVacXoxUXNY?=
 =?utf-8?Q?2Sk93d7pvIsg2EdcA3cXB2+Bi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b524f8ec-59c6-4ecf-3fc8-08dbeb47b2d0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:42:17.9354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNIv2A77XGASc4Gh2bxHpHtSi+we/bAYTmYU0nD0Pv/mF+CDXngrR/Wys/Imh4BLkkR2vEwqYDmcZEA6gk2Rzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384

On 22.11.2023 11:08, Roger Pau Monné wrote:
> On Thu, Nov 16, 2023 at 02:33:14PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -2587,6 +2587,19 @@ const struct hvm_function_table * __init
>>      return &svm_function_table;
>>  }
>>  
>> +void __init prune_svm(void)
>> +{
>> +    /*
>> +     * Now that svm_function_table was copied, populate all function pointers
>> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
>> +     * much of an effect as possible.
>> +     */
>> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
> 
> Shouldn't this better use cpu_has_xen_ibt?
> 
> Otherwise the clobbering done in _apply_alternatives() won't be
> engaged, so it's pointless to set the extra fields.

That's better answered in the context of ...

>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -3032,6 +3032,30 @@ const struct hvm_function_table * __init
>>      return &vmx_function_table;
>>  }
>>  
>> +void __init prune_vmx(void)
>> +{
>> +    /*
>> +     * Now that vmx_function_table was copied, populate all function pointers
>> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
>> +     * much of an effect as possible.
>> +     */
>> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
>> +        return;
>> +
>> +    vmx_function_table.set_descriptor_access_exiting =
>> +        vmx_set_descriptor_access_exiting;
>> +
>> +    vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
>> +    vmx_function_table.process_isr            = vmx_process_isr;
>> +    vmx_function_table.handle_eoi             = vmx_handle_eoi;
>> +
>> +    vmx_function_table.pi_update_irte = vmx_pi_update_irte;
>> +
>> +    vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
>> +    vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
>> +    vmx_function_table.test_pir            = vmx_test_pir;

... this: The goal of having a compile time conditional was to have the
compiler eliminate the code when not needed. Otherwise there's no real
reason to have a conditional there in the first place - we can as well
always install all these pointers.

> Hm, I find this quite fragile, as it's easy to add a new handler
> without realizing that addition here might also be required.

Indeed, but that's not the end of the world (as much as so far it
wasn't deemed necessary at all to try and also purge unused hooks'
ENDBR).

> I don't really have good ideas about how to handle this, unless we
> populate unused handlers with some poison and loop over the structure
> as an array of pointers and choke on finding one of them pointing to
> NULL.

The looping over the resulting section is already somewhat fragile,
when considering other non-pointer data in there. A specific poison
value would further increase the risk of mistaking a value for what
it doesn't represent, even if just a tiny bit.

Populating unused handlers with some poison value would also have the
same problem of being easy to forget when adding a new hook.

Jan

