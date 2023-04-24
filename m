Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174D76EC8D0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 11:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525245.816326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqsRn-0004UU-IT; Mon, 24 Apr 2023 09:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525245.816326; Mon, 24 Apr 2023 09:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqsRn-0004S8-Ex; Mon, 24 Apr 2023 09:25:23 +0000
Received: by outflank-mailman (input) for mailman id 525245;
 Mon, 24 Apr 2023 09:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqsRm-0004S2-Vw
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 09:25:22 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed5cc76e-e281-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 11:25:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:25:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:25:14 +0000
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
X-Inumbo-ID: ed5cc76e-e281-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=habRExT0SSnUBjvg3WdJK0dZLI4P1d1UwfcixYJx+CYz3NH7fryfKU4eXrVgTUaIXtN+XH/R0ovJJ29ZHRRkGdoBTFzlX8ABucCRLakJrHpDWVhxPopdvdUmp+XpN9twyYIV6vV5upmSWgtfvvoiDJEpra6qlkwB2GzvHq8mywO960LYDvffqyXpkMOV4HUDDKc2XLiez4sL+2nXH0bPXAe/FlyVj0u35ycldHHYpL1CSNrBOuDUSjtkrdml67BMeIY6KpqLw31eqpw1bbQuXKMP/x9djjbkh8UlAfGA9jBuoZEIvAjfMk9jhMV6LtmcuCtH/x+PMk65Zma1Dsejrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nC/EQbazuieMKA+YFrsvUJIrKhm83FWlyCJoYI8GTUs=;
 b=JeKM6dy6HnNMzwTXs3D+rsmgV9g/aZBx1FP5anqiZI7wEYRW4+3DxJV+j4AVv7EWxpuiQZIkPNYgVIfnwuQ0YrZ7OvYVf9xIQyejQdTjdi1kwX7BYhtiZpi7PDz9FhYljFUfwwgTXfMh342L6KVAj4RHOgdhH0Sbj7wUftf4kaXjXrVG8WvzHLBjeg7ZfapD90fJ9qiG9+hcKuIONxm8OL6wq/hNFWBpVaRfo53cFKNBy146LwfKjUHkcftnN0B28ATUMobpflIcZ+ed8Xg9jOg+Tw/ifvz+R7sqeHn6BRsM4PKrGIp5wuhc576QYCFzaeISQrqM+p9BnFc66fEtrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nC/EQbazuieMKA+YFrsvUJIrKhm83FWlyCJoYI8GTUs=;
 b=iHhKtbrIpjhYx/Tr2a9rj/asjhaxFBZwCBPdWwhCo2+HPHwPb0Q7X3trW29GuQhkVlGJNSX+dhCGKDLoRg4QKFr+9zortBbkImQQBqNwPVxokPTPpXlZBCuIg+2HTeUuljRWU59o7HdzeawnNe2i8JizB7tRszbRpHZ7A5zm3/XbbOtiLnhmnaw00+iNMAQxlwZyb+Y7koqzlG/GBQBf/5/Dfzw7zxl7fUrwZ90HAaLfk1Xeo0GpQIJX3ve3VQjAI+YachIInwikTfo7Lj03MAExt/n+Ao3P40hDMv3Hf5K4XzSKcDln60+O4E0f/MpNJXD/JLmZrNQdWLXkntVdBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a897eb7-f6c7-9e28-4f6b-4c4c43f7a4f1@suse.com>
Date: Mon, 24 Apr 2023 11:25:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
 <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b52e452-4735-4c47-c9f3-08db44a5cf16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z5FiXkb8ekjJTNYOW0AdjyCPPzjuYCXHhDcQRpOpvPCRPcKnork0LVUSeC0BpnWyCmPYm3lJ745xThNtqaq4jFDbZYNKZjSfs9Va9MhTQ+eAntobyjC93l3NqIAWn2taezCH5llZoAs/pX3B3JAh000Bp/DwATtWwXhNLFVtJq/ofXjcVF4clcwQhtULz1aHQQ3dGVfptjgIjD1rtF4I8TR7wz3Va4sQhVZS/GPy3WfUNTPn1QjQUsL5TTaS2d/gX9UKq3FDFv11CxrC9bVJBh/CHMEGznn4dI0jqohfqh9vFNeylxkE0RBfEOLS9Fal/9nchzXh38IyHoGAXDi5oHf9TQrMeYUWmxv/wHKDEJOrqXpjMJrNV9KztvaSXdjPg974y+iJ059IvATSM37ADP2ngxjFH0e1FtyQJK0N9zkB/npejrOXyaDFatD72VFTMUgf3GFyA+0MDMaHZRNBI2Pq5HNIKOq/jndTXRfgg8hYz6RCn+YIONHG+YnwmCeqVa1vqHpT/Z9M7xUZhIeoTq5S0mwPxyxKn1QeIk0eck3d+fvZmaGKBfTCN1NaM87j6qKiB7A7gQPQyNRGAdUzcMJpxiZ6oAOPjWJ56iPra85s19TdMiTX0gfMV0JnMQLAYo6ANKTqNWAQA6iv3k0U7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(38100700002)(6506007)(6512007)(53546011)(26005)(2616005)(186003)(83380400001)(2906002)(8676002)(8936002)(5660300002)(36756003)(54906003)(478600001)(6486002)(316002)(4326008)(6916009)(41300700001)(66556008)(31696002)(66946007)(86362001)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1lrejQwSmhCaGdBTFJITm4rS1JZZFk4UWozSFI3emNpa0QwYVFlYkFkYTBT?=
 =?utf-8?B?aWJuV0VXSGF3WDhBTkw4bUtFZDBwcEhrOUNUSVZDb1hhY1FESEJDNjV3dG1t?=
 =?utf-8?B?TWY2WTh1ZkZqd3JpVFgrRGRYR0ZZa05tL1F3cVJGOVV5Y0lhVng3SldqaUxZ?=
 =?utf-8?B?SmxldEJTR1hUSnhGR1V6SnU2UXNCNGZqYVZ6NGZFb2dkajVSVnVqMDJiKzZy?=
 =?utf-8?B?eW81L2pOSWQ0VE1IR0hGTWVLOWtyVGEzWG45cnBJOUZLZWxXclNTSFR4SnFS?=
 =?utf-8?B?S2NjMlNCeE9UeS83UGxZb2pHSmlIZDNlUENWb0MxNVV1ZzlzV1VNenVBMWlQ?=
 =?utf-8?B?blNIVUZNS0MraGF6SjZpSitoNkNoMmRsbFZCb2hDRUFBa1JaRkRRSVhPR21U?=
 =?utf-8?B?TU50V2NLYzlQUjZkNmZCMmI4SFQ3UGp3OWVIdEg4TEozZW4yN2U1R2craGhs?=
 =?utf-8?B?bCtQSFRPOVpKVEN2bW0wZmVtallDSjJRSDVMSmhNV05UZ2laYmo3dHBiUmZG?=
 =?utf-8?B?RzFWcWNUMklLQmk2ZExtTzhmSk4xTU5FeTFCZjJIWEJaa0NTZlloLzNrZCt1?=
 =?utf-8?B?eWlSc1dZbWgvd2hWSFYraVlxNDlISnlSN1JLTlAybDdXcVY0WTJ1L2QweXBB?=
 =?utf-8?B?YmhBNTNkYi9xelluZytrQU92MFlVQzhST3U2MDB4OW9lck9ENHdUY2o3aEtr?=
 =?utf-8?B?WFZlOVR5NVVFc2NPNmJIblRoL2o3eGptWWNVUHlHMWFTN1lmSU5LTXhoV2dp?=
 =?utf-8?B?dkRkM2xZOVhFeUttT1ROaC9raXBOSEtpalNZZ0lZWHNWRitvVHZINmpTTVly?=
 =?utf-8?B?OEtrTUhpUy92WVVLVHVWNVNSVjg4S282ZkIvWEM4d3JNQUVpeHRjSXpBL2pJ?=
 =?utf-8?B?eG9pNldHdXZFRHI5UjJWM2s0a3lleVBkZDhlMDJKUTBmcDRRQ1Y1aksyeEt6?=
 =?utf-8?B?VTROZnY0emdoYVRpTkpLaXFmWFlLYk52Q3ZmRGF6QUluRDF5bnBFcWhQTWVW?=
 =?utf-8?B?QmhFd0tZQlk5VU8rY09OTlorSThkWUsyVis2MkEvMDNZSGh0cmFDK0V3MTZF?=
 =?utf-8?B?cU9zK1dxZFN1YWsxTkQ1VHpTdWlXbmpkZE5CT29WRE1Qa243K0RkVHhidTJj?=
 =?utf-8?B?eUhqVmYwYXNFSm1heVNaeDFKZnpIMXFaTW1NcDFKRjFQSnNRMEpNWW9WbmRZ?=
 =?utf-8?B?b3NjTkdwWWFwb1lXWnJVQUh2RERVYitHZ0FHZG1FYkErRk9lMjBMM1dDUXor?=
 =?utf-8?B?L2M5L0pjTHBJaW9CY1MwUGhCV0Q0MUJIRlZtNUZIRjFGNmZnR3B6aVBva0pS?=
 =?utf-8?B?OVJOWHZPcmppTG9PMERlRXg2cjIwVFNRZUhRejR6aVIweUZXQVNwbFEzZ0k1?=
 =?utf-8?B?RWp0akdaN0l5SGNBeWNGRW5UOHlrclhvSE5ZUEE1Z1JRb2JrUEFDbFdXeGxw?=
 =?utf-8?B?Qk1EUmFkUTB3VVdydHhQMFp0UGlSTDd1L1B2N0c3K0k5NDk5Sm85NG9xUHgw?=
 =?utf-8?B?bkllZWpERDVCQmU0ZmZkQndzSzhKR2ppWXNKcXhZU0VJMXJzM3BjYkRIc0VY?=
 =?utf-8?B?blFSTk5nVU5wMkcwd3BBbWRqai9iNXNWSllBRUEyT1BSbzBGVXB0SEhjU3Ry?=
 =?utf-8?B?WU44YW56Ym9yUmN1Qk9RN0ltaEtsNkFLZWN5N09KVkJEeC9haER1Z2toNnA2?=
 =?utf-8?B?QXkvWmdNS0JWdmZJMTAzbWV5K3dUMkswZzBkWkh5OGVOYUVzREtSeGN3SEZu?=
 =?utf-8?B?R20vOGdrc3ZvMVMzSzBUWk9OU3N2ZTdyTUEwSjBwRWlKcVBzaldXRWNIQkJu?=
 =?utf-8?B?VWlYSXB5bDJyUEVhd0t0ODBuc0liUnhiTElSai8vY0FPYjd5NFpFY3BuZS9R?=
 =?utf-8?B?ZUQ5WmVleG5SZGZReWJxMXhPRzVBWnFBV3g4SVVKK2tJbFVFQjlmelUvSTRt?=
 =?utf-8?B?MEJiRTEwSUFzOUhINnl3K3REUC8zQkdjZkJoTVRDMmJaK1RwY0wyWCtVWW52?=
 =?utf-8?B?S1BkRy8yNW5mNzhOVWZBOVlDYXFUZW5uN3dSVDRTMmtGNGY0WVN0azVxaGNU?=
 =?utf-8?B?TmNGRisxYzJLVk1sNE5rTWo0SytwQTkyWmlQcUl5Q1pUWmpPallRTXpxMVUz?=
 =?utf-8?Q?pPThqgXkV4HiVQ50yUuzbHbQ1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b52e452-4735-4c47-c9f3-08db44a5cf16
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:25:13.9311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTrOEouoeH0bj6lNvlwi+TUAMcu+NWeNSsjlEJeRFaeXbY/CXQ3w/+zx3Y/8WJqfmNqPZdB1GtTeBg1m8v1Sog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8364

On 21.04.2023 16:41, Oleksii wrote:
> On Thu, 2023-04-20 at 14:58 +0200, Jan Beulich wrote:
>> On 19.04.2023 17:42, Oleksii Kurochko wrote:
>>> + *
>>> ===================================================================
>>> =========
>>> + *    Start addr    |   End addr        |  Size  | VM area
>>> description
>>> + *
>>> ===================================================================
>>> =========
>>> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | Xen
>>> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | FDT
>>> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | Fixmap
>>
>> These are all L2 slot 511 aiui, which may be worth mentioning
>> especially since
>> the top bits don't match the top bits further down in the table
>> (because of the
>> aliasing).
> 
> Than I'll add one more column where I'll put slot number
> 
>>
>>> + *     .................. unused ..................
>>
>> This is covering slot 510, which again may be worth mentioning.
>>
>>> + * 0000003200000000 |  0000007f40000000 | 331 GB | Direct map(L2
>>> slot: 200-509)
>>> + * 0000003100000000 |  0000003140000000 |  1 GB  | Frametable(L2
>>> slot: 196-197)
>>
>> 1Gb is, if I'm not mistaken, a single L2 slot.
> Yeah, it can be misunderstood. I meant [196, 197), so 197 isn't
> included. I'll update the table.
> 
>>
>> Also assuming a 32-byte struct page_info (I don't think you'll get
>> away with
>> less than that, when even Arm32 requires this much), there's a
>> mismatch
>> between direct map and frame table size: With 4k pages, the scaling
>> factor
>> would be 128 if I'm not mistaken. So perhaps you really mean 3Gb here
>> to
>> cover for (slightly more than) the 331Gb of memory you mean to be
>> able to
>> map?
> For RV64 page_info size will be 56-byte and 32-byte for RV32 but you
> are right it should 3 Gb in that case what will be enough ( taking into
> account both available sizes of page_info structure ).

Since you say "both": I don't expect you will want to use 3Gb for RV32
there? The table is, at least for now, for RV64 / Sv39 only anyway.

Jan

