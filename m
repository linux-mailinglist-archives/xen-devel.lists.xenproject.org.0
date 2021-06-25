Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860C83B42A3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 13:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147124.270971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwk94-0000tt-Kz; Fri, 25 Jun 2021 11:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147124.270971; Fri, 25 Jun 2021 11:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwk94-0000qr-Fw; Fri, 25 Jun 2021 11:37:14 +0000
Received: by outflank-mailman (input) for mailman id 147124;
 Fri, 25 Jun 2021 11:37:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwk92-0000ql-P7
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 11:37:12 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c959e347-9704-4013-9ac3-aac23a2b0688;
 Fri, 25 Jun 2021 11:37:11 +0000 (UTC)
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
X-Inumbo-ID: c959e347-9704-4013-9ac3-aac23a2b0688
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624621030;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F7jwxuSqjY9P9d1+WnxEdtyQype07kuO0mAqd2otHt4=;
  b=MoqJ0pqREreHJUAnHqPZcs0alRQmq/6SXtSZB/KUYqt4PHVmgDJy32tE
   R5W5xlovofvlFtgmForl/csLuYkJumo21t7ucQZI+Za6xFitfk9hfrB5P
   oxZseWFwI9goMXGxX5ki/kTax5A9WKfukNlkaqZGvSj2P9kVfFzFwpEZo
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Mpq/vtWK8kR1Bk+aeBGvTsAaXL7/Kzr/bmMOPMts2IBDztEfiiHZiZkSHlnQ/y0OdMOYfdrcTn
 NSVR/TTzTHL4mg48I1w0dC+XXSWm1QcJN2Fv7Mr6mSGoOZWUdkV5psTKKKPj5Eo8vVlIZQN6sG
 6CblbycOq+NYHuBg7ctao9DVV8a+LJL3OtYpVxfTehilWTzJTU3V7izLxTApgTFPjLaUWd9KdC
 /h105F806R8X46gdhhe4a8qb5hauVpJNkEyQUc4cIFRzKD0W2E4do8MHyq17ZifNBR5tIZYebf
 Vs8=
X-SBRS: 5.1
X-MesageID: 48575470
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UZIWsahbaMv1fAd8crKZvmwp8HBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.83,298,1616472000"; 
   d="scan'208";a="48575470"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za/kN/S8F17zJnRXLijtDqYtxKbTPjBVVDBMhBg7laFg+e9erh9Y0+DbxfTOhtzajkG7nVuKxm8RJuZ0+Y1yPjP6rgP4JDjZKN+rGdW/s7NAedXwozxqoam8usPGqk3AurY1gfN3qsYa04E0E8/Z35iCcmP0LtQYdpJ3x6ByhYEnZVjaHlPv0Cw9EYqKNROlTYVCLPQ5AW8uwimU+YBYQ4Eq12DuZmF0m5fcJiI3MCWFTz4iYhVO98nO0SeLyKhPeNKe4Va4ux7QaElaP/bO+mbI/1MgZdwABXOKY1JiBcmX1YCeSPdNiQcP9YNAI51ZICHRC2nNYNfBr//GEgMd4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=in9Lg7Ky5DALGXZNGc9gusfBYFGjuGqkZQqLp4Nv2kA=;
 b=FD39GX4Mz9fPWuBT4kAHlRyz4A7BG535Ish2DkZyFnhFXofFtKvZJyuuklUcpM4YU+fK/fMjty8EQQfyN20ggayVN66degh+bshnpcwror2plCVJ9Z8qk7Yn7hOAkKqm32smyMm30EIV/SkFoBNTA4tDtsldkEziqRTK27EGM7enqd8xAmzsFZqDnBJGyYYpJK/g1exYl9T378dfn4IIZNfCeIaK0lCOUaXocjE6e5tQFB6Ko8HDxY/hgW3GCpWEWK8JnlS1Tc+XZfq27FB5q/NmKBAODA1w2M9tAorbKS2M2rzWpTiAfMDYHkmryDYZeIJCTdq5oYhRoxeT+/kseA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=in9Lg7Ky5DALGXZNGc9gusfBYFGjuGqkZQqLp4Nv2kA=;
 b=bvD5Y6L1LpWlKAW3roDNo33lTKfG1atpqfJOPLD2HNfZiEUXJHX5TMlTYeVf5+0vxlbMhlzjFQkVcPyUhk6OLWZYIV/9gaIIDAo6GOl36zL/O6Cgil7e+a5ckg8lfl7AcgOwlSeZ3fS0BLAvgDzW4FMEtUL3lcJS5zwn8fOXcpw=
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210624175521.20843-1-andrew.cooper3@citrix.com>
 <6e103351-f3eb-39c8-441d-be926579f2ca@suse.com>
 <9c5cff0e-0ab6-7015-3667-bad2d9f5b31e@citrix.com>
 <4b360f95-aec2-935b-ce95-73a01cae98be@suse.com>
 <24789.46868.943149.770825@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxencall: Bump SONAME following new functionality
Message-ID: <3fc8f75b-fc60-78bb-f822-b87b6299fa64@citrix.com>
Date: Fri, 25 Jun 2021 12:36:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <24789.46868.943149.770825@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0149.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adee9800-b747-44a4-9d33-08d937cd8e6c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4424:
X-Microsoft-Antispam-PRVS: <BYAPR03MB442499482947B7AFD1F8DA63BA069@BYAPR03MB4424.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GCAgVLyyZ5UKHcQLs279DKnIeJBy5yyQctCfuJN2hp5y7K2OV5LvCuw6sr9ehp6MWFIqjCTdMKUpO6xSYhZyezePDVKgz+kC54o6fh9NlJuOR5Pb/C1cPEWxa+uKDrQjg3tVvTM9hOpwYS3Th6BOGeUgZjwDH/VGXtvCLsDqi/2LoxshArTJ14lhi8T3tvstzTRGMBz0+KJf1anGMNiFj8BGIywygOKyrnZl0de2npIS2+y/pHvJWaj3BX9GYwv7aOsQDYKoagbNanNrEc0OvYxo0rAgXUB545NirMK0RUfZ1kladQUAY68EJwimqVgRMky5Pgs7NAySTNCwVFx62EtewHkt1ZPy8VeEx44su57qtJh+yAfPcPPxCGDX9QADzE7lhJGFuRDwvhoqf5CJJDK4ddplhn6M5JuqlAZdxdqmModRXtBPXMNwavQVVIdtfktDlPDF1NlBYYdfZFVTxTqVLjtGnTzqNsO2xslrFtEYPruwNyw2RbGVxkepZRZn0KAB/lSc0v8Etk/thVbWdUGqFOfwpV8KE33Lof7q4NhRqc3rAfsz/hUXpgB3r+0BMmIXCFIWrB2nI11ZoPsPm0HxpfasH+pnLjL0o3pj5M/b/SilPmMh/meuNq8omHCqyxRoGA298x/Hpacp7REC5QIQabk66SuS349Xm6voErTmbdzsAYZhXOhDjWG/2Etj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(8676002)(31686004)(53546011)(66556008)(6666004)(6486002)(110136005)(5660300002)(66946007)(66476007)(26005)(16526019)(186003)(316002)(54906003)(478600001)(16576012)(4326008)(2906002)(36756003)(956004)(2616005)(83380400001)(66574015)(31696002)(38100700002)(86362001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHI4bWZFbDV6ZnBBcTNHS3kyWm9ZQ1cyMnZJZ2dvbzYvZDFsR1NjMnZycU8z?=
 =?utf-8?B?ODFhWmhnem5Ma1FrQjFyVXg5VXZJZ21GSWt2N1hoQ3ZzNFU4Wlp5MEg1eU84?=
 =?utf-8?B?eVp1V0pqOGpMNGh4V0wyOUk4ZnFVMCtjSkFTSStzL21VdCs2ZkRIYjNPaWRy?=
 =?utf-8?B?SDYxQ2dLcjN1MkVGZGNRVGNnZEc4WHdFVHpKZWlOR29oeUxWdHBWek01Mm9S?=
 =?utf-8?B?R1lLQnB3WUFNWDNiY1RZNElGMmpDSXNWS2VPKzBzQVZ5REdoa240V3N0QTF6?=
 =?utf-8?B?OVNUR0VPZ05yN0FxMmZ5KzI1Q2plczMrdVVuV1Y3bk1hRXVwYkcyc1FzMnc1?=
 =?utf-8?B?Mmd4Rk5WWnFjbFVueFBZOU1QU1QzV0tGVFBrRmhjZVdrNHBsL29hR3lRaldH?=
 =?utf-8?B?TlZkOFJwazNEQ3NMYmt2MHZPc0Z1T29MUC9kWG9LdCthdVJJamQ2T25QdFVm?=
 =?utf-8?B?ZW1MOWVDOWtrSHArT0ZsWElYNDhhUmlXVSs5M0kxK2VjZkZGV1B3dUhqZG1T?=
 =?utf-8?B?bTdDeUIzb2l5MEhRdjc4SmdlUG4reCs5U05CR0NhTVRWUEdkazEzVEpFVzd4?=
 =?utf-8?B?M08zQ1dodEd4VGxId3FtNHhrbUw5Z1JNN0xvbmEyMzdpTFl1OWFja1p1RXdn?=
 =?utf-8?B?bFVpV2I1bUdRRzZ2RXFCK0wrdVdoeXNyWTNIMzZXYUZlZ2t4NTBjWjdDRXJX?=
 =?utf-8?B?cGczeDF6MmlHeVh1M01GYmU3bHlyRjNRZWZEVXg5eVZ3R3YwUUc2WUtEZFgr?=
 =?utf-8?B?WjN6WTdqUWxQaVRpRGplcEpwOGZ2VWsxRVp0YnF3aERVYy9pTjN4a2VjaTRH?=
 =?utf-8?B?VmdaWlI4VEJqSHJ1c1NuK2lEVkpqRGIrZFM4cXdWaFBBTTZkaUNrSGdrRlNp?=
 =?utf-8?B?TmhpNlhRSGc1NzdnbURydm44dmJZMTc4VmRKOXowVGp4WlloektRZGIvOWJ1?=
 =?utf-8?B?b3l5cmRWNS90MWxuS1VtbzRRbXdkSjh5VjlwL3JJL1lzb25EcmNNWXgrb00z?=
 =?utf-8?B?UVpVZVFDVG1aQnpjekMvZ3Y3R1k2MGE4RTY1WHBXZU80b1lRSzZzYmJ4VkUw?=
 =?utf-8?B?ZG1mSG42V3hoamp3azBPTURDd3JXdllTRzMySjhnSDlHdUdyRkFVTHVGaHFz?=
 =?utf-8?B?YjJBY1REMit3aWwzZjIyUzNXNys1MHNkWjJnTDRpZ2x5MStCQm1ubUpoL3ZU?=
 =?utf-8?B?YzZtV2hIWXRWZ0d4THZTUzRlaENvSlhOUGtQWGw4SjhERFRTNURPOTI0U1ov?=
 =?utf-8?B?WnlkTmFFYWZibTVwU3FsNkFrb1B5ZjFzRm5RQUJPbVUvVEk1aStVd05Jak1h?=
 =?utf-8?B?QmsrVG11b212dXFaOXovYjNITWxxZmp4UUV4Y1dkeUZUNFdWTVYwaElGVlY0?=
 =?utf-8?B?NkNSaUhZdmh5ZmZQWmdEVVp4d0MxcDM4ckVlVzZMMmowekxUeWM1SldwbTdw?=
 =?utf-8?B?QWNqOFBEUEdxejRTbUdiMkk1WGR1bExBbm13WkEySDVTSEJqOEJxRDhHV0JQ?=
 =?utf-8?B?QjZHZnpWQ1Fiem9rRGJXQmFVcG5nT09sdjE0eGZRWkNuQXhWS1ZNb1BIakYz?=
 =?utf-8?B?UEZVQ3ZKSzZVTEpDOTBIeW9PQ2s2MzhtM1M3MTMyM0I2Y2tSdElVQkVXa0lx?=
 =?utf-8?B?QTNsbWQwQlBtZEhERFphVWNBYnJjMnR5YlV5dHRBWUdlNDBqNHB6NmlXZ0FU?=
 =?utf-8?B?UmV4WFlXcENPcEsraW5YUnEwaGRTalZacUo2RXVmL2FTelNYN0txZFU5UlVv?=
 =?utf-8?Q?k/eJPbXApWxYleE2Q4J+1WRBo5pWeBE280P0LGH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adee9800-b747-44a4-9d33-08d937cd8e6c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 11:37:05.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1WivpgsbsabHzWUKLdRkf4UouP2YdSAHiAqsnpoirhDlM8deKBf90zoCkhHv2SJ9G8GNPyVvycYs1OL9sDDduIKH7xkgIKAGiQFVOBYYVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4424
X-OriginatorOrg: citrix.com

On 25/06/2021 11:59, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] libxencall: Bump SONAME following new fu=
nctionality"):
>> On 25.06.2021 11:17, Andrew Cooper wrote:
>>> On 25/06/2021 07:31, Jan Beulich wrote:
>>>> On 24.06.2021 19:55, Andrew Cooper wrote:
>>>>> Fixes: bef64f2c00 ("libxencall: introduce variant of xencall2() retur=
ning long")
>>>> Is this strictly necessary, i.e. is a Fixes: tag here warranted?
>>> Yes - very much so.
>>>
>>> andrewcoop@andrewcoop:/local/xen.git/xen$ readelf -Wa
>>> ../tools/libs/call/libxencall.so.1.2 | grep 1\\.3
>>> =C2=A0=C2=A0=C2=A0 33: 0000000000001496=C2=A0=C2=A0=C2=A0 59 FUNC=C2=A0=
=C2=A0=C2=A0 GLOBAL DEFAULT=C2=A0=C2=A0 13
>>> xencall2L@@VERS_1.3
>>> =C2=A0=C2=A0=C2=A0 39: 0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0 0 OBJEC=
T=C2=A0 GLOBAL DEFAULT=C2=A0 ABS VERS_1.3
>>> =C2=A0=C2=A0=C2=A0 76: 0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0 0 OBJEC=
T=C2=A0 GLOBAL DEFAULT=C2=A0 ABS VERS_1.3
>>> =C2=A0 020:=C2=A0=C2=A0 4 (VERS_1.2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5 (V=
ERS_1.3)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 (VERS_1.0)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 3
>>> (VERS_1.1)=C2=A0=C2=A0
>>> =C2=A0 024:=C2=A0=C2=A0 3 (VERS_1.1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 (V=
ERS_1.0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 (VERS_1.2)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 5
>>> (VERS_1.3)=C2=A0=C2=A0
>>> =C2=A0 0x0080: Rev: 1=C2=A0 Flags: none=C2=A0 Index: 5=C2=A0 Cnt: 2=C2=
=A0 Name: VERS_1.3
>>>
>>> Without this, you create a library called .so.1.2 with 1.3's ABI in.
>> I'm aware of the change to file contents as well as the disagreement
>> of file name / SONAME vs enumerated versions. So telling me this is
>> not really an answer to my question. It may be by convention that
>> the two should match up, but I don't see any functional issue (yet)
>> if they don't. Plus of course you leave open altogether the
>> backporting aspect of my question.
> The patch, including the Fixes tag,
>
> Reviewed-by: Ian Jackson <iwj@xenproject.org>

Thanks.

> Changing minor version in the filename as well as the .so is not an
> impediment to backporting.  The actual soname remains the same so
> there is no compatibility problem and the change is still suitable for
> including in eg distro stsable releases.

Correct, although backporting in general however is problematic.

Until Xen 4.16 is released (or, we explicitly decide to make an explicit
library release early), the 1.3 ABI isn't set in stone.

Backports to older stable-* branches must sit on a boundary already set
in stone in staging, or we'll end up with different versions of Xen
having different ideas of what VERS_1.3 mean.

It also creates upgrade compatibility problems created for any distro
who's installs of newer versions doesn't have internet access to pull
updated packages.=C2=A0 This is a consequence of having different versions =
of
stable libs bundled in different releases of Xen, rather than having
them entirely separate and packaged by their soname alone.

~Andrew


