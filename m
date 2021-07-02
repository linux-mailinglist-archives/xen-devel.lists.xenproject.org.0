Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B23BA353
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 18:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149232.275908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzMD1-0002k6-UP; Fri, 02 Jul 2021 16:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149232.275908; Fri, 02 Jul 2021 16:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzMD1-0002hK-Qm; Fri, 02 Jul 2021 16:40:07 +0000
Received: by outflank-mailman (input) for mailman id 149232;
 Fri, 02 Jul 2021 16:40:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1lzMD0-0002h8-D2
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 16:40:06 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2739fb90-db54-11eb-83bc-12813bfff9fa;
 Fri, 02 Jul 2021 16:40:05 +0000 (UTC)
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
X-Inumbo-ID: 2739fb90-db54-11eb-83bc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625244005;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QNDiYe7qVvD77weSt/RSAqaII0v+IS7MsePnmosmZoc=;
  b=aZ+B1dvSV/EP5yq6ShYqffUn7bQnn4FxG2SmQuf1tIrtNQvZOXobi8cL
   gK8prKz4M9vAcLo++ROrH5hEFP2wTUouq8TzgAtYwKfM7VKkivXeaArtB
   JEs+OWO6afiZCXZCJojVdnz50cpCJ9MJ9Y/xgBzEa4NZhFjNyeqxRWz8+
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AKWCZRCYTFADERGXdBnNoVgL8cG1cUINEViI9ewxcS1f3XMCLff/dXSyBI4O4fn7qtQiorhgEP
 ozMKJS4GPp7LRG9FIBFThXbZ/kOiAUT/ZlxjtyW/V2XUiyhApogGG+4s7L90Tu/DAb0T/8OBae
 nhPTMCeN2cw0T1kkeHeWf1494R2xktTLTgQBNSWrUBXKjXidY5xE9ZU3JHdnxD6WTZcuxhT2r9
 8eDjvT0gBYDd7epne/8sLGMqpTn4lY/wIXE2Sh8GT1g2k+x3W1m/RJfs6hN+04BI/v+kPLj+Dt
 qFo=
X-SBRS: 5.1
X-MesageID: 47544408
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cgiyBqPF8dnZYsBcTyr155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyCMbEZt7eC3ODQKb9Jq7PmgcPY8Ns2jU0dKj2CA5sQnzuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAUqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKSPZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS0dL7t0YvFLf2VYUh6bD2pChuYdA99WPBmcEa+d
 BVfYPhDK08SyLdU5ix1VMfsuBFXRwIb1y7qwY5y5WoOgNt7QdEJn0jtYQid0c7heYAoqZ/lp
 L524RT5ftzp5wtHO9A7Nloe7r/NoWbe2OzDIvVGyW+KJ06
X-IronPort-AV: E=Sophos;i="5.83,317,1616472000"; 
   d="scan'208";a="47544408"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGFbQr0/jn0AE2GyCa/iadBmTp0FVWMg0cx3KANoN1L9/ELG8Lo22P0IXgjRQJo8S2SSfOibPy5moFL0m4yvtGk5hz++whJ9dmR8piBdSi6QetT/t3O0Gawvt4+xZdcdiJ7JmXh8x5XtEXx8+NEiEvzvHZsd6XRndywV68t3vHzN14mxoPCLF+whPymWyKvb7EwxgFoUOEBz4OzSEEi7ZNMBksOtukxJdGPNWB5+3QBV8AD+O0Du2OAI43FJBXyH88virPlLR9pq7X3QbZfTN25iTih1RIFu5BJkdKD6IP9XiH+vPuQC2utBbflbCbMpgZq0q1v7KbdNwQ5mCK7N2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxkcVonICac42Pbf/BOtB1iAtPYZZwEMizz0Pojn5Xs=;
 b=dqB7GuavQ5hltphivSfSED2D6wA2NOisMq29uLOcl9grBKpIJnH955ZYO3f0o6z7pqT/RqZOYnZvytdoMpSUA3gAuU8kwGfsA3+5vgoTtqxZUavn/vtW1875i2HujBg4XO4AGlMNCFkxQOsTuS2ZaXQDJW+GSScWFxk4lVq+mefa1s9pzMndtsH3K+PC5diKEbYc512KAHmz6zLfJCUUXAITb8stcKHFeqDmGIogkuN904AWygI3nNCrVDX0JhOij6YFJQVfLNQIzS68nGch6MVYNHCN6/QMMbF5AVeNNTjNIx2itTP9nsscLNseaT3LJ/YnmPqJ3dd7LG/yWWbSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxkcVonICac42Pbf/BOtB1iAtPYZZwEMizz0Pojn5Xs=;
 b=uuJnD5Y1w2TG3pBfKH5+bYzVjqLWtHiYb5WiBu2vJvmD7oQQxzwJEOP7gfNBUQZkoH4gDmgEYrdFirPWpiK193Xqn0rU46FKUZHXSpiIpdPDYsL2mxkEDypAHEKhrinFbYo3WlCKzSmbUbT/mSHiLoP2nEbD5lXD/WygQBcF3zQ=
Subject: Re: [PATCH v20210701 06/40] tools: fix Python3.4 TypeError in format
 string
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-7-olaf@aepfle.de> <YN88m0tvHKxF7+NI@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e285cef0-4c85-35a1-37a9-f56ec9122002@citrix.com>
Date: Fri, 2 Jul 2021 17:39:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YN88m0tvHKxF7+NI@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0423.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68badc1b-971b-4609-547f-08d93d7808e6
X-MS-TrafficTypeDiagnostic: BYAPR03MB4166:
X-Microsoft-Antispam-PRVS: <BYAPR03MB41662E31E88747986123B647BA1F9@BYAPR03MB4166.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V93+PyxjLhMoQ7hmRua8HwSUDtVlpPzWWyItnsP3kA9UYM7DY34uHjqvBIHlr035D8cFKRpVpxByyJR+5ut3uMLFqxX2lbw5P6uq9DAlAADh6p1vck4jqaJnw/hrqmunH79RFc7UCIF0bczq5Tb1kCDGskcXfOIGmKqhNTwF6HQoeIuWkHkgeUYktuLigf2BIf62p6fvEAUDmaXkqUaTy+/PcyVJpU3jQEJdeJ2CY3QUknY6x0QwWn/sWtrZGQgINQ8s2BzHUzZjPfWVBBrXjz6TDX1WvH+Y3MYuUofqRUrMKFhuZX+5nEb1nCEI2KJg4q5C7rWJZz5xQoYRj1n0PlhsPh4duqaZwbZ/KQia8GGLVVT4V7L3/dLgLROnQc3f7tKIlTSl27cSc+vy5DjwUA20oNFunqVGS1tM7pmNHNXCTCzcfoPng2iggkpMTvEWGPEw50P/4POvkTB/v+17VjpWMUGbTsX7glbeRF1phjDsjoQeMsugMmorxxqDvJ50rRZGG9iwsiJouCkIDeh6DAgTf8LIVHmBjgNJDP5LUP84c1JY0ZW+FA+8YKXGeh9lIWTUYONRA6ti6hpW2kpjW++I+VBbTHUWsanP74XNkNgKMOmoSD9szXgGEJY7X7229PFV/gPOotc0BCW0R1YK1FKuZA8t/btQPGk/kUomLoHexnfFDB2TJT1YvK5xPItRUFcMlCL97YozaxhW3j30dPPmW2g5xeb56Ipw9OyTnQ61eCHKqwigkBV92q+ojNqO8FlIwWPj3rAebRVT5vL2ojV2XtIc5J9ONO6TKveX0A5TFgEzFwkTI1a20OPPIC5h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(316002)(6666004)(16576012)(8676002)(16526019)(31686004)(110136005)(31696002)(6486002)(2906002)(86362001)(8936002)(5660300002)(38100700002)(54906003)(956004)(2616005)(83380400001)(966005)(36756003)(66476007)(478600001)(66946007)(186003)(26005)(66556008)(4326008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmhmYzJEMHQ1N0VHV2xBOThrcVlGZUM1Qy9yMmp4THJYcjJmclR0QWdSdDM3?=
 =?utf-8?B?WWZ2U1ltaW9NMUtHa0JUaVkxTHdIemt3azQrNDhGWHdxWTRxdkRVM3ZPTmFt?=
 =?utf-8?B?Z053NlExS0VxYlBvdXI5QXBzdXB1dVNCMDkzZmRmK1ZwaG83QzFsbmZHYk1P?=
 =?utf-8?B?UmFlRzFRVDZwekpwNGJWNWxxTm9YK2p4eFpKWTJIK0N4SURXb1JNc1FrMlV2?=
 =?utf-8?B?YmRrQzUzeTgzYXppVnN2bkRUcVIrc05yNFB1M2h1OXBPRTl4TDlEL2I1YzN4?=
 =?utf-8?B?bS80TnAzTjQ0WHN6cThXdndJb1U1eWpJMUpIdC8reU9RNzltU3hoQXRKelhh?=
 =?utf-8?B?RkhpeHlSVWZoeEM5TXZCQ1d3b2RJQTVtTHVqME1iYXN6MHVETkgvb3JRMnRS?=
 =?utf-8?B?Z3pad3gyMThqdS80SDRvYzdKU0RHelFOSlJNMUFtbVNvUlg3UHp0by9FWFU1?=
 =?utf-8?B?ZjRPL1RrL3RzcTRmTzhHdnJTa3M5SnQvZGRUb1hxM2FCWlRwNktKbVd1Q3Bk?=
 =?utf-8?B?dDdLNzk2NjB2WmljeTEwTTAzeFZMNElBU2srcVB4ak1oa0szMlAvOG4xeUpJ?=
 =?utf-8?B?Ly9RemVMeFhkSUQrcExPVE9IWmhRd3FCRUhVSVdHVHI3QUtXYjdDc1FjSHJR?=
 =?utf-8?B?OXpMZmQ4SU92YmE0ZllabU1qVDIvL2NDc2tTVzRCVW4xUkg3NWRsYXR3TDRl?=
 =?utf-8?B?WTdhSjI4TUgyNllHL21YSWZhOUVVM1FNU2Rub1ZkREowUnVwVWpJK0pJQlFT?=
 =?utf-8?B?K01Cc1QyQ0NIK01TVHJSTHZyWXhVUGZZR2Nqek5QNzhSTUpsK2g0aEFSSG9l?=
 =?utf-8?B?ZGZsM2Znd3NoYzFjL3Zwd3ZFZmUyVFlIbHFkTjlqTFM4VW9jL3J3OEk2QWVk?=
 =?utf-8?B?a0VjZk5Ba3N1ODR6dnc3U3RqMnFEUE1iL0lrNGNGem51Sm9RMjNEODNNb2Qv?=
 =?utf-8?B?RkhjTmZrT2hSUTZZWENiRGMwTVJ4V3kzZGZUWHgyeVpsUEZ3eThQL2c3cVNQ?=
 =?utf-8?B?Q0ZzcjNqcGJUY2VIYjl5NmNmSm1pcStaNUVOWGQ5RVNRbDhCd1ZheFZhVTNx?=
 =?utf-8?B?QmtmYTBqTlNjcTNERUhUeGVpVFZEaVVIYnM4ekRZSFNTN3VwN1MzT2JHdGh4?=
 =?utf-8?B?SWFNTlhxQ1ZVUDJnQ0d4RytraTBQNnJVZzloZGJmNThIYWFjSHpxc3Z2R2ph?=
 =?utf-8?B?VTFzanpacEVZYnhKZGJ5Q3VRVTJxV3kvMUhWbEZ3UUlBNFA1Q3FINm5pUERU?=
 =?utf-8?B?SWpqN2tGK0FWWEREcWREcERlVTJuUWxZMFlkVWp0dVFYNkhwZU9MNVlJbnp1?=
 =?utf-8?B?WU9EclJKR0FIaHI2NHpsbkpGKzVLbnlCSG5EQW9IY1k5NXg5QnZiVExqRGtO?=
 =?utf-8?B?K3dMYUFRcS80MFJQbkNra1NYZnoyVnREdCtPNHVZOGNwUnlMYmU0WHMram91?=
 =?utf-8?B?ZCtwcXBrZkZjTi9BTDlIUldUcW9sdVMwZFBkYUNXMWZTM0IvVDJXbmNWcVM0?=
 =?utf-8?B?SFo0Y2Jwa0s2WjIrb2RlY29lLzFEaHJUUEd6R05sK2JlNkxWbGxSZ1RHcGpS?=
 =?utf-8?B?bGFkd3RUMGpueUgxckRab1ErcGxqY3d4OEhXb2IxeVFFT25MaFpCZUFPcmMv?=
 =?utf-8?B?eFV5OVhwVGNscTVKZjhFeU0yYUt4ekljS1VzcHV3NVFXVlRlb2dTS1BRaFdI?=
 =?utf-8?B?ZW14cUhneGFvOXFERjM0MDRZZG95YVJrbUJLOVNYcnJxRlc5dTRyZ2MyMEpT?=
 =?utf-8?Q?2zEpd+gePenZtoiStoVknIEZfo4URMbtLiVL4E1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68badc1b-971b-4609-547f-08d93d7808e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 16:40:00.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNBr8bs/awouGz0XcaFq4mCvg+q/GUUN+mPTf2Fg9cAzeoSnR7o1jniXjzi2MvmvQfofQtwWMFQ8HFhpxaUQnjKIfWFpY6RbOL/e10+1ze0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4166
X-OriginatorOrg: citrix.com

On 02/07/2021 17:19, Marek Marczykowski-Górecki wrote:
> On Thu, Jul 01, 2021 at 11:56:01AM +0200, Olaf Hering wrote:
>> Using the first element of a tuple for a format specifier fails with
>> python3.4 as included in SLE12:
>>     b = b"string/%x" % (i, )
>> TypeError: unsupported operand type(s) for %: 'bytes' and 'tuple'
>>
>> It happens to work with python 2.7 and 3.6.
>> Use a syntax that is handled by all three variants.
>>
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>> ---
>>  tools/python/scripts/convert-legacy-stream | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
>> index 9003ac4f6d..235b922ff5 100755
>> --- a/tools/python/scripts/convert-legacy-stream
>> +++ b/tools/python/scripts/convert-legacy-stream
>> @@ -347,9 +347,9 @@ def read_libxl_toolstack(vm, data):
>>          if nil != 0:
>>              raise StreamError("physmap name not NUL terminated")
>>  
>> -        root = b"physmap/%x" % (phys, )
>> -        kv = [root + b"/start_addr", b"%x" % (start, ),
>> -              root + b"/size",       b"%x" % (size, ),
>> +        root = bytes(("physmap/%x" % phys).encode('utf-8'))
>> +        kv = [root + b"/start_addr", bytes(("%x" % start).encode('utf-8')),
>> +              root + b"/size",       bytes(("%x" % size).encode('utf-8')),
> Why bytes()? Encode does already return bytes type.

Yes - I've just tried this out on various version of python (including
https://www.onlinegdb.com/online_python_interpreter which is the only
place I can find Python 3.4 easily available)

.encode() does return bytes (Py3) or str (Py2) so doesn't need the
surrounding bytes().

However, the % (phys, ) with the trailing comma is deliberate to work
around a common python error, so wants to remain if you're keeping the
%-formatting.

~Andrew

