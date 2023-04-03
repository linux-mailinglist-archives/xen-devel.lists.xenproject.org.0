Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8912B6D4302
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 13:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517384.802625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjI48-0006z4-GT; Mon, 03 Apr 2023 11:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517384.802625; Mon, 03 Apr 2023 11:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjI48-0006wD-Cl; Mon, 03 Apr 2023 11:09:36 +0000
Received: by outflank-mailman (input) for mailman id 517384;
 Mon, 03 Apr 2023 11:09:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjI46-0006dQ-NP
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 11:09:34 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02c24cf1-d210-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 13:09:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8138.eurprd04.prod.outlook.com (2603:10a6:10:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 11:09:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 11:09:31 +0000
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
X-Inumbo-ID: 02c24cf1-d210-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljSShnzZ3IkJ0ax+6+k560RKBq9aS5R/zl1756FzVn67gASBQETSN3J7r2e+zFBxCd+wxnYkIglWd2OThtXynLq7UYnrV1rY8775syZYQ+aS/i8hzLBXJNNWp95rIg39vrO8JPaEUAdRryHapFka8YFabs1rPeA0cpxlnYLW/9jyE7AxI8vMjnAhYBqYeoTG/mATEovuAX+IUclidYAdcLq/ANU3OpQd3JRqWruugAY8TVGd7HUoaFkEom3hd0MvtPIGnx/SYxidbig5ZPxilZobIaExKKEG4ItF629K+xbIHNSSDs1HCo6CQaFe9lSt0Q9k0xaKmpUt8tpgLEf8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lh3DidjN6ele/jYXeFN/8iuMc38l5BJIsPtFgZxHUNk=;
 b=SWmsI1ck1hdMvxKjKoxdQvC5X6Tg9ZVpzgqkep0bCW0vvgmSdVDWRFoRlMpvfSBg3/z5euJVsH4YvwTF9jQshlMQS+8Z3Y0/DAJLTXcskgZh7ye/nHO9vZR9Y/kxqP/1ZE4tjdamL/z1NBlCbyJSn0N31Vg1GnRlYP/v1xJTKFZqSm7SDoEI0r8aO1pmaKth3b2cbeSc5Dx0UF2SEPJd1RIEI2dNKzgufEMnmTmwT86vFWIA3tWRpUDVjjLL7eQ4MVJknG6f0AchakX5wuY1c+Qkl+C72gOMkn50KTvgIEOrYEa7D7QrGAYmNFwlXdkeB649kzUsq4s3vFydtAvgVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lh3DidjN6ele/jYXeFN/8iuMc38l5BJIsPtFgZxHUNk=;
 b=PZG4a3XwCqHLcxXBY553XoTiCUgxN4C0r+2zBigjPE831erZH5pR4+sbuh3KBKQaMTAoA/E+Cnaimq8Dmx6yX9cl63Q8wfOZrB7B0t1tLg1smYth4icrutfa7Luhd/dOyHFbyYYODiyChgWIyfGvUHER3qUpG2V8+pxqjbRZ5kHATcDVgTcYYCKa9VBQ1hR88Da5ur6vAaaVuYs9lMzz2TvlDYnJ2g6GAGcHGqaIK7nqCSj3FUzrRxkJzJ6a9nP7QvVZGsXBxExufZol/0waDemXAP55FtloWK7pP5iEVj4OgvS1iic3ZuZyCB+zGtGp0tcRTinaB3+AuTpzKON2jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <245d1a4d-3bdc-21e3-8ee8-2909d6fe7b60@suse.com>
Date: Mon, 3 Apr 2023 13:09:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
 <ZCLNQGXvUBxZbIGS@Air-de-Roger> <ZCLX1qD/FmbF5ulu@mail-itl>
 <540906f7-4543-9d01-2b2b-a3bd70eda74b@suse.com> <ZCLjGhbzGD2jykT9@mail-itl>
 <9eb7b538-4074-4b15-4ea2-67d9cc0bf85d@suse.com> <ZCpUZI6HmzYKDhAz@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCpUZI6HmzYKDhAz@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 6181ff65-045b-4173-8cbc-08db3433e5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H1aHl4xkdWyX0+OhLb4OWAbIvhV8yZgq9IVd7OfwGTjNiJ6FmTIGK13kNdyE6QsnGxQ0fDjabnRcy3VNICeTtcENmGhbyTaEE9NeDn76mwWAMnbK51SDqS0lAqasR8IyuouSgOA7RyxfM1wXo4cAKK0/Y8oNTngFOI/LomHbsCcBBURKbyOscdcTTw1cHVRNa5RjxugeX1fy5QDv5Wv6u9xGiQwwkfwQQ0QRwTa/5JTqSgUIxM/HWI3zwz6OP4ksLh9do1Wjcs7HWD6sllTdWvFID8lJJKw1Ox2fHNelWj4h4lrDBKi2FM60/8poFhCxG1qukr75Uo/EZXxqxbnTAiqTu0e8WOY46GGQLbEqf53q3pN7ZmDJ1iUES7SRvB8YKk6z9DZ/W8/WpXXyYJsjtvWBa4odGZ0MpMu2w983BjlOcXFzey8eFWCEktE5MBxo+nzueCWkSXL+oy33tVhOSF4KGRYN+bA2hjQpq2OnUdhzBxPm4exe4dz8D61XpYYqP7jAwYnZKAADpoeJVgimbPjtIm/ru0wU6211v5IhZWLaUglP3/wEFpIq3YpxOsRHkJPf8u9enVqkXudepxCntkML29j8mA/fb9VNq93UxySDqyyQiRSlHJ3e11+evXpy2d4KbhZrIFY5x6tRcQWpfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(38100700002)(5660300002)(66574015)(31696002)(2616005)(83380400001)(54906003)(316002)(6486002)(186003)(478600001)(53546011)(86362001)(6512007)(6506007)(26005)(41300700001)(36756003)(4326008)(8676002)(6916009)(66476007)(8936002)(66556008)(66946007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yll5SjBuZFE5aHduaTR1OS9ObUF1OTlaUVJUWmJuV0ZseGVOaTIwZU94NjJG?=
 =?utf-8?B?eEFqelVxd0lmOEhId2Iwb25JaHVQYW5VM3NhcERQZTZOUHZtRzdPeVlzNDlM?=
 =?utf-8?B?ZWFIbFo2QWFEZWJ3ZktYQjNpTCs3T2dtWks2aHlYeGYxd1dTWENvaGNLZlN3?=
 =?utf-8?B?dkpXeVNLbWVhKzk2dHR4T1BsOGl0Y0JHam5zVWFRQS9pcThkK2RieG5QQmlh?=
 =?utf-8?B?VVQ3VFIxNlh0ekJyczhhcVVSSUtDK21ZSE1NNEUxREhYK2gxMXBpZ3ZWcHBy?=
 =?utf-8?B?MUNRU0NuYnJtMmluRFNvdmZKU1RUcCtIOTZNTUFRTk43TVBTcFo3UWNLV3NI?=
 =?utf-8?B?SS91UzhuSlRaSGlFU1ppaDRqZ0MvQW5hZVp2Nmk2a05tVjJiZkJCRU5nTVRI?=
 =?utf-8?B?a1ozckVRMnpSMVlQL3BrcVE5T3VpQkdHbWNJZ0ZQNHVMTnZKOWZOT3k1T2ZX?=
 =?utf-8?B?NHRHTjhaeThobVRFVUQvNEJkRHNidUFqemxWekpRZ1g4akw1OXlsYWE3M3lu?=
 =?utf-8?B?L2RKQTU1ZjRIa2NqMlRjbk9PZWlQc3BoNDF5RzMwalZsZE14Zi9PdUt0N0pi?=
 =?utf-8?B?SjVpME9xZHpmejVxU3hjbkdjQXB3aVdXTFMzbm9iempVYjQ5Tm5LSHJFTjB3?=
 =?utf-8?B?QU96WEhvSEo1aC9XbTlvQU9WTXUrbmN5NURKbUVJditrWTRKaVc3Y1RPUnVz?=
 =?utf-8?B?Q1ZLVm5zMUV1eFZiK2RzRWRMNnZkSnZlVy9LUTdpbWt4bDZrMjZ3NHBJaCt0?=
 =?utf-8?B?T1lpYnZlUWd4VHJuaGtPQjR6VWtxcU95azlPUjNMOUVQcGVuelhQSG95bThT?=
 =?utf-8?B?eDArUkVqei9iWlNSWmxzZkc4Mk5abEJBSnFVemFhcjhhdktTNGFHSnZyUkpT?=
 =?utf-8?B?eXIyMWhSTGpaMURZdlNaTUlKQ0ZnRDRPMUR4bHVKUklzSVRpUUJxWlhTbmFD?=
 =?utf-8?B?K2xha1hMUzlxSGNROGVXVlN1REpjem1GSFU3VllSRFdESkRJd3QwQzZuN3B4?=
 =?utf-8?B?LzdhSVVzc2poT1htTmtRNzVORTdrUTlyNFp3ZE0vM2tiRVppYkJKY210WmNY?=
 =?utf-8?B?eWJoRThPY2ZBVzlDeHF6NzVsRUdtQ1ZyZWFqeGlNYlFWNnNxUFZqcFVqc2pB?=
 =?utf-8?B?UlVxbisyTGxueGxiMGZHeDRQcjh5ZVVPc3RjbCtpQ2RFYy83bmxtSWtCaHUz?=
 =?utf-8?B?YjI0NWwyZVF3NTM3aGNWSGowdmFvTHBrRktZVkVDejczUEUwcFA2MFVoL2Nw?=
 =?utf-8?B?MVJoa2lFVlBCczR6Q2RrTGpkbWIrcjFWSHc5RjFpZklrUWt6MFBKTlNud2FR?=
 =?utf-8?B?LzVSS0RORGxsYzdaK3VQbGZiSTdHWmFIV0JnZWVyUDVwZ1U1TkdMT2hoTGJT?=
 =?utf-8?B?TDRPYlVIL2plbnQ0OGozTVZyZ2ZNdGMwWmpoRUpwL2pxcjFIZzhCbktaZ3NU?=
 =?utf-8?B?blduVk5vSTlWbEZHdXZnN1FKdWJxM1NSc29OUkJJRE9qazJHR2NaK3IrZFZV?=
 =?utf-8?B?elF3WDkzTVNPOVdrTWIwbldiVG5qcDMvQ3VvMzNWOE1udmsrcU5VU2ljSmVh?=
 =?utf-8?B?dHlKWlJaTFVZU1l6SkRoUGNadmVha1NYYkpCZjVleVJMZW8wN0Z2cjlNRVow?=
 =?utf-8?B?SW96UHhCQjAvblNnSmpGQklMKzZsR1JScDdxN1pMaEZ0dnN0cUg1ckN5b2FM?=
 =?utf-8?B?MTNVT0ZiZTg4MDJKUE5Yc0w3c3pvdVkrR2MyWTRYekd6SlRzS3p3RGpjSnpP?=
 =?utf-8?B?bnpNMG9WSFhKZ25MU2wraDRmWXR0Q0MxUmhlcDNjWFk5cVg4SW1RamFmSXA0?=
 =?utf-8?B?ZHNCZGJzYW5kTFpJWmxsVGZaNVZST3J6MDBJRjZ6enRZWldrQURWSTNYOExP?=
 =?utf-8?B?SXV2NHU4c3hSZmZtYVRRNGRpL2MvYm5qalluZG5zSTk3Tk9BdDR1aGRJYy92?=
 =?utf-8?B?VWoveUZpc3lvZnJMbGh1ckdWSmplNGljUVlYSnVjSlZwTlZoMTVKMmlFV05W?=
 =?utf-8?B?YXpDc1dDcVNBNFRFdVZJQnRMN2ZEZitXMktLUHhPR1gvU09MU2JhcjF3VVZR?=
 =?utf-8?B?VmpPd2VqQlhuUkdLK2s5RWRqZDBaNkFzTkduU0VUWHJvaFg1bVlpY1Y4Nm1a?=
 =?utf-8?Q?FKxjDwUFQaHqi1yie8dmYngBZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6181ff65-045b-4173-8cbc-08db3433e5fa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 11:09:31.0652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2Rj1ktJftMK6t7ODOcttf7WEBzgi5PHJ/SXgorruGiZI+qkNXH+sz6F0Ak2pyIgVb4rZSZzDrLKjk4gxrsdnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8138

On 03.04.2023 06:21, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 28, 2023 at 03:03:17PM +0200, Jan Beulich wrote:
>> On 28.03.2023 14:52, Marek Marczykowski-Górecki wrote:
>>> I mean, technically I can probably merge those two handlers together,
>>> but I don't think it will result in nicer code. Especially since the
>>> general direction is to abandon split of MSI-X table access handling
>>> between Xen and QEMU and go with just QEMU doing it, hopefully at some
>>> point not needing msixtbl_mmio_ops anymore (but still needing the one
>>> for adjacent accesses).
>>
>> Hmm, at this point I'm not convinced of this plan. Instead I was hoping
>> that once vPCI properly supports PVH DomU-s, we may also be able to make
>> use of it for HVM, delegating less to qemu rather than more.
> 
> In that case, this code won't be needed anymore, which will also make
> this handler unnecessary.
> 
> Anyway, I tried to merge this handling into existing handlers and the
> resulting patch is slightly bigger, so it doesn't seem to avoid any
> duplication. The only benefit I can think of is avoiding iterating
> msixtbl_list twice (for respective accept callbacks) on each access. Is
> it worth a bit more complicated handlers?

Well, limiting duplication (if possible) is only one aspect. Again
referring to Roger's functionally similar vPCI work, an important (from
my pov) aspect is to avoid consuming another handler slot (via a new
call to hvm_next_io_handler()).

Jan

