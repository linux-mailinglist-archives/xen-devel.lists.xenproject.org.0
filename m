Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1A66623E8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 12:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473515.734162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEq69-00006k-3J; Mon, 09 Jan 2023 11:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473515.734162; Mon, 09 Jan 2023 11:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEq69-0008VC-0Y; Mon, 09 Jan 2023 11:13:49 +0000
Received: by outflank-mailman (input) for mailman id 473515;
 Mon, 09 Jan 2023 11:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEq67-0008V4-UI
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 11:13:48 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae9c549e-900e-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 12:13:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7043.eurprd04.prod.outlook.com (2603:10a6:208:19b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 11:13:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 11:13:44 +0000
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
X-Inumbo-ID: ae9c549e-900e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhbA+xF5F9F0s1xVFYRMqPNzCKXaC1w9xi2LIfUOMOoDpfGAKKEpLCpi2peH3Qx9yAWjd461nOTNGgwGRFiicZW5+VCGg3LLTVJLW4QYdBhsv0jFSCm9tQEBcYFb0oDy62XFhMgBl6kjskJ0z5W+dIZHWD9PsSb0REdbzZt0jIHJ4DXotY1EqU8kJlAVLwwl/ntoFBkF3o5YyRZ96cLG/7VJmiC/QZgio9PYkti/CjERGstwE1dhTPTO9SV4reMANy6Hy4/2mqb4IS38Diyak5YbB2pEwDwtX2CzbAOyZcc+UfWyumz40HWBV43a4UyuFJadppQWZmq0NMNiGYGxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7NX/w/IBF0btVz6DIEesT3r76F6LqndQWtRaYgCeiU=;
 b=AJ8oo8EyeJFy5//LG4xnC/POfw4l54Pqia4MCqO2I+8acB+w4kJ3slG7dxfcF2Y2I2JYjgbxIqc065DsLQlkDPv8O5poXzCDsvrEX9Bn8ZWj7ZPXi1leocp9DdntEGhqyOzGBO/rx8ONARn6UC5pQMcthSt1wQPAM9J9g/wntBStN2eSnGPZI53gNsL1Id/UX7w1qdTX4V9Vm9s6USqqMLuaqHEUb5SN/0gjRwadVzNGIr45x2Hfb1Db/fGXr+Hh4Z7WO7voh+uFhikapFekfv9bn6vUcP4FnKgkDoTeP4b3Ckf2YZqcJ4SjoWBWuDOCYiWpQKZF8lofBO9miyR93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7NX/w/IBF0btVz6DIEesT3r76F6LqndQWtRaYgCeiU=;
 b=iqqUeP7Z/2E+ZgCQG3tUTqyxqN3zhliLWpjsjWyyzDDKiR1P9oDCmaOtBbOBb482eM9y11kAzXdRsuOm8BOjilWzAfMUUxyW+k4NVH0QwmoS7bn00NiMmxDyIUl5K2dmVMq7syyI66LvWLJiVb588jWKqWngRJm/9nkj5wlNlFpqT6J5beqKY6L+7eph7trTTqpRtmEVSFCbhGrUhKM6EwtnD6E5TbwAwXSoNAM0tfqN7FcQC3WO3R1DoOz6vtf8x89UjI76ORf8pwpCzEEJnR+VgFJEBptGJIJG398BkssZWREwGWiNAMgAddfC/gAw2LVgZAuLGoDJTHRMqWwIgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc720181-6f1b-a8d7-df27-2d90f64306d4@suse.com>
Date: Mon, 9 Jan 2023 12:13:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: LBR and Sapphire Rapids
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <3a80b974-1ddd-2063-863f-8aff3453d545@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3a80b974-1ddd-2063-863f-8aff3453d545@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: b80541d4-406b-44c4-150a-08daf23291dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dLLpeHc7J4IiVywpeHdNEEVS70oFymKLLWDymlQuUb1xaqkrXmiMjaygX1m6bMvQDj9RQsUYuregeaBpaQ1OYv209+NhZnCmqER0uWFMV21zpeGddt1iPz4th93NLCNHD7g6TElEaoSvbTfjpAb+aQMGuLhXba2ATElLFW34aR/dgkRGROQgbF23BDS5lyMZk5Ax238hsRx7NrEpIKceFguaekA25FuXY/oIq0I4PEHLgUp2XziC2572JrMtjrXcyy77CzeoIy3hfplqkA9iHbyd8cRb72oFtxteqU1rFPz334Lty7z8tCXjVZRk+wX5MogQwFrqW4P7K5iUjwwfXVoMhIzNWss2ooRifj2HkdMEHbVy4LUjW3RXWYQqWpng7Pgbg+2+Wsaa4PeUcinniDsT2Csz2DlZV4lU3tKlN7DjTw7tkW7p+/pNjsXYJQSRcLJj8VGTQul9zn102QnUvu6MNL55hb77QAmFXne/qTDt0/AaNR1kEL5IEgiDEZRn6Qp7+uBJfgXPnl0bvQTnX8xp5f7L6mNsKnnm+ZXfLf4Fdv1sFfScCJgFrnul3z+jPUejRC+nDBXvEqj9yrvzhT8yQWWNKonqMMOi8YvhYupVTxuPQeCUhrOdRPulYnP+uwquye7oaRc160gIV1gsI1uowKdraUC3owNT3onkic65cqlc/WWfRO3b63SSQjNhDSS0c3sRonGtaN4oJiS3WopXQ5LFU2YDMHz5lTnv13U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(3480700007)(2906002)(83380400001)(54906003)(2616005)(66476007)(66556008)(5660300002)(66946007)(26005)(186003)(53546011)(36756003)(8936002)(4744005)(6506007)(6512007)(478600001)(38100700002)(8676002)(41300700001)(31686004)(6486002)(86362001)(6916009)(4326008)(316002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVBweHV0Ynk1YS9jQ0Z3ZFJZaDJ2R0dxRmNSRjlJQUQwNVRtOWY5MkxoM1Ar?=
 =?utf-8?B?VjJBYzNzeDZGbVpvOWdXRmNqcnAvUW9UYlBMa2Nnc2xzejFuOHhzYlptUTJo?=
 =?utf-8?B?RDB2eldVRnV6S3AxZEVHZkVCZ280RVpOMkVJNzZJUW5zT0t6YkFYSFFiRjZE?=
 =?utf-8?B?bGp3dGdvNHJaenEzSHgyV0w0b2ZNeUtWL25xeEtsTU1iSXMrdWNVckJvZisv?=
 =?utf-8?B?WWhTSkszdjFNT1JFL1hWbzkyTWFOYUdpdE56Vm51b3FYYWhqVWpCOUUzQVFQ?=
 =?utf-8?B?N1pJNFRnNms5ZE5MamxqSitmaFEyOURMdlhxQ2tKbXFIMVhTeFhBTkdMUlRl?=
 =?utf-8?B?MmluMDNtNEFiTkdSN2dHLzROL1JWTEdDRWFPUmJ5ZE5Ua1hRQm52M1JiZHd1?=
 =?utf-8?B?Vk1OV3MxMURCQkJwdzgzaTJ5K0wzNzV4K1FsMCtOTXN0V1JEeitraW11dW0w?=
 =?utf-8?B?QlErOW9mZmszZjNXajRsTEJiQVJEdUc3ZGVSQjJTN3RSdkRBQzNkNDRJSmpY?=
 =?utf-8?B?Rlc4dytIMTgxSEtFUzFFV3B6ZzU4QlVCZk1QcFpkS2FmV2h4MkJLVCtSSkVM?=
 =?utf-8?B?OFd5NVRiR25Sb3Ntay96cTY1RUN5RGs5azNya3kxejlHNFUzeXNaM041MlN4?=
 =?utf-8?B?NnY2NEZZWDc2ckt4em9EWGNZcVBDNlZFUlJ0by84VmtkNUtkNkZmQkVoWW44?=
 =?utf-8?B?QTAyOVROMUN0d3g3TkdJMTVKTnYxWDBrOGZQRWlnZlZXMFhlQjV0enE4Vi81?=
 =?utf-8?B?WUx3Rk56U1hxRzZOY2RINEFsOFFOMlJWZnRaNXI2Rk5wd2ZTUWU5QW9GYm9x?=
 =?utf-8?B?anR5YU9ZbVZLSmpJWWtyTVFzdEVNcXptM2pDTFJlN1p2UFB3SSs1UEZOYVo4?=
 =?utf-8?B?akJoajNGWGE5Q2VVdTNXTmJpV1FZZHZEemhCWWV3blJQOTlaQXlxOVo0OGVL?=
 =?utf-8?B?TVZkYzRDVjVOd2FQbEpHeG1tRDI3ekhaTEVGZHkyNVRJZU1jb2FKbGFSMlJx?=
 =?utf-8?B?SmVkU0F1K0Y0OGl0ZFNEQTV4YmxvaEptWGRIb3QrNmtaMEJlRDJoclpWdm5N?=
 =?utf-8?B?NjFQeWtWZFdQZWtyaGxRV2V4a3k0ZUxJUzNJbXJiOHhmQTM0NGVGMWliVVFE?=
 =?utf-8?B?em0xTjB5d2hHdmEwVW1kM0QvMVBjWVpnTEFIUXg4SHZQdU83SG4yQ3hWWFBq?=
 =?utf-8?B?MWY0UXRORDZCOW05MHhKMjdYTkU5Sk51YnBkNENDVjd1NW5nRTRDazcxcDdB?=
 =?utf-8?B?akhNMTlRZ0RoeTdWd1NqOHM0SFZwZW9MSmxBREVCeXEvaG1NZlloZUNiNDFO?=
 =?utf-8?B?L2pDZzZFdTFHMEdiWG5aTnNHcE1nVkY3dWkwZ1U1Y1RKaTRkbkdwS1VSRDBP?=
 =?utf-8?B?cFZ4Q0o2SHZVZXVldWZ3b2FSam14UlNSSVBzdXZIUmI3U1FyVmlmcXZIM3NP?=
 =?utf-8?B?SEg2cjBGakM1T3RqNUo3UjFOaitNeGdxNER2TXFqUE8wdW1CMStFZUE5d1B2?=
 =?utf-8?B?OURaZXV4ZjlNRk1wRVlCcFRBd2lmUmVLVnZoZlJpV2Z2KzFQOTErU0RSM1N3?=
 =?utf-8?B?RzNwV1RkR3ZNakh4RVYzZi9iTm5MRTB1WGQvL2pOLzVqNHNHQ0YvOEUzUlM1?=
 =?utf-8?B?OHNYWkJrTzJZeXBhTTlGY0k1RFlFUXR6MDNuSkJQZ25neFhGTk15RXo4NTJh?=
 =?utf-8?B?bnFUVDgzK1Z1ZGhRdEgxVUlFTUVRTENHTWRsZnR1ZWw2dysrZTF3Rnd4c3hL?=
 =?utf-8?B?VUxOOVluc3AzR05qa1VGYjEvRUQ2K0JOQUZEQ09waHp1RC9GdFBhMzZvM3l0?=
 =?utf-8?B?L1N6S2s1VDE4TE1sblozSHc5dGE5aWE1alB2N1FEMitWUzRzK1R2a3NaUWlN?=
 =?utf-8?B?a0JURFdML0FCV2U2YjdoWC96Uy8xSjFKZWkrM2JPejEwdGNMK1R5ZE5vN2w2?=
 =?utf-8?B?d2RVUTIzVi9PT3N2SjBPWmxDa082YWFtY2Q5ckdRL3AvMlRVd0lzR2Q4ak1u?=
 =?utf-8?B?S3dZNnRxK01TeHh2S3lTTDVOQjhmN2lGSDFxSG5QaVpwSkVPT3pUVjR2Vksx?=
 =?utf-8?B?THNVb0V0VEE5SkM5cmcwc253NmtQeTRIeXZuSURDSlIzU1lNaTRhalpnQmtJ?=
 =?utf-8?Q?n++Sxu8r35sOhYbLU7atCLA5P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80541d4-406b-44c4-150a-08daf23291dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 11:13:44.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wj4PbyWldqr1VVJoXCez8QvC16zLZAYQQUS9w+wUQKVy9Of2eyWscF5KdPA925MuHieKd2UDvbKLhUzi0cF09A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7043

On 06.01.2023 19:21, Andrew Cooper wrote:
> On SPR, MSR_DBG_CTRL.LBR is a write-discard bit.  There really are no
> model specific LBRs, so we should emulate it as write discard too.  More
> generally, I think we should apply that to any system were we don't know
> the model-specific indices.
> 
> I think this will be sufficient to avoid crashing guests on SPR.  Any
> software actually expecting to use model specific LBR would need a model
> table anyway just like Xen has, and will not get it updated with SPR's
> model number, so for the (more) common case of not having migrated,
> things should turn off cleanly.

Sounds reasonable as a plan.

Jan

