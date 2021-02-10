Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 975AB316629
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 13:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83582.155878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9oJw-0006g5-Ai; Wed, 10 Feb 2021 12:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83582.155878; Wed, 10 Feb 2021 12:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9oJw-0006fg-7L; Wed, 10 Feb 2021 12:10:12 +0000
Received: by outflank-mailman (input) for mailman id 83582;
 Wed, 10 Feb 2021 12:10:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08uA=HM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9oJu-0006fb-0E
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 12:10:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4468b0c-9790-4a28-9777-3cd9c6daffce;
 Wed, 10 Feb 2021 12:10:08 +0000 (UTC)
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
X-Inumbo-ID: c4468b0c-9790-4a28-9777-3cd9c6daffce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612959008;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZZh51H33LQxyXrcaxFY1fF6FmsB/GQQ3PE7hJpqwODI=;
  b=JNGZf7jhEb95yW/U8urTm2iKv9uPbzcN1XwYYLQKmsz4MtBvPDk++Tk5
   KouRVz0QYarbJw8GhEHwQqiLa7BtNm44Ey3N2h2kMS6C/iqCeI7v5ZGnJ
   zvh0gVf96fTrvKPWTkUOMeOQt8bPfz+m2rTVJ1QSihztBe2VvWmWqOE5k
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Tp//KLyitTQZwlNHM4U+Mtql86HlxFVvM0Qq5bXzp1YOiLnFsV2zrC/ewIfKghfc/rDxL3C7Mw
 0xg6+o8ossfN4epDHvoeznf1lxLfp/uXH1klZu6jlz55iaZSry1qEaFqxvHiXY+SZfbJ6IkRXN
 XrUZ6pMUjq2oOrnOBfrVoNO8R17qkI/g3aL8FXd5giv3mtSYzrWQkGIyQhzcNz5xXbkvgohfhj
 VAatX9Hrc/WvBlrIronvjCUu2lOlVkHeDpUCNCMhkZ2aFwiaCXD0TxE/NVU7PTDTjhDmYX0YF9
 viA=
X-SBRS: 5.2
X-MesageID: 38301100
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="38301100"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+QR3Jx///i99qgMlIZBsrHx4z8azwmwxkXbJ38zLTYnWtTFcfAUPqeW0Yn9lpNn0V/lfSTqXHwF/6snSbNrlj5GfF0q8jdvI4O2sODPzj368elW9ya+P+oM4QK3g+tCaaWby+WD/MXavszylEBD9zueS06K5+IMQRtbVjogDRgg/S5SZMcN+lD/POHNGhfYpNCqrkBp3QQnH02KCjlvl6NIT5VHUVKwHvZjBUctMKO8td2nfEYb8KqToYYqhSasLoi4wvvt93J01zGeDZ7eVVJm2v7o/QdFGA11YlZ2zZwe1aVGQR1KGgmQ6huxmv7TWDuJbjbXzXTm0eVAjLnvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVhcAl44TWDzt7zo21fEbPet6O5DdizLMhnWHNpIo6I=;
 b=iIFZp7CL4yYc4PTWZuq+huKJXCINb7nnzt8Gj+Gb6Sm+leoDrq8Dy4IuBgo5nKbjD7b7y/N06U60Mzzs+gnfCDrywd7mxTKrDJ+Pac7zLXPkTel7mu/QcynO3tuikNrQ/mAeB28XIDRPiQYLPlDv5lGhCeIKHcjlOhXNO7tElg6er6qXEW4vNIyqAg8rV+mbTs7+SQMZzXN+AgqaEBAEIttPqzmsPZAVWFqZ1jENPDmkfyy1a8IDhwHbUkr3TpnPrgHLyUxzXLiTM+ZsMgr7FrbOoLQCdRSwxVlkJNxayHEAeEsPaelUuS3XSOcXPnJ++Xlk1rsCuYLbC2nFtTxpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVhcAl44TWDzt7zo21fEbPet6O5DdizLMhnWHNpIo6I=;
 b=XXkCRKaMoBHAodb/530AK1DrkqAmK+qvtOmQcu0Ee1YIS5kTv3dRJEdFa1YLKr8qi5PfCR5kOOhm8ErBkdW8qFInHo/rhnVlDolFudur5JA6QA5l/563rDZUpsqqHQX0lqOLnlwbkD3XOphrG1LPNnnIi64W0L4KVHPNgwGFrME=
Subject: Re: [PATCH for-4.15] x86/ucode/amd: Handle length sanity check
 failures more gracefully
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210209214911.18461-1-andrew.cooper3@citrix.com>
 <87d6982a-00d9-3daa-ebd7-9afb8ee60126@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7a91591c-5401-2419-c636-7e456bcfe911@citrix.com>
Date: Wed, 10 Feb 2021 12:09:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <87d6982a-00d9-3daa-ebd7-9afb8ee60126@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0342.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ba3b2f8-f5b1-4783-91b1-08d8cdbcc627
X-MS-TrafficTypeDiagnostic: BYAPR03MB4549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4549F3D2062F1E0F223D70A8BA8D9@BYAPR03MB4549.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bADLNTQE6TP6nvR3Zt7vbYdiEh3y6G2vVNfVNSSL3uSPNEnJ4LRme2BIDJMva6FUhrQXXHdgx/VoU2fBIEq7Vi7EyqfcVmSxnolX0CQA7IJMKjAxalpFP61SFNb3B1Pr5agMb/QJY1Hc02gbjT0FLXGyNXMwp9LYZ+gBqjMpBr0XtfqdkvFfkSevhnGtM3ftTSdngP7sBbe91DUjthMjiwxPdwBDtHV3Nw9YoLw+4/OHKdsEZrhiGAGufeMIg1OI++6t+6yWwP4QtY+vHPtOKC2BiU3kTWKm24Yp0IaMIDP8SU6b1kiYt/EnbsrDW79+7HuOhaSn2gDHA2t67sQfuorKbW2Wk9MIF4cwwW1/jV3wjNwXm1D5BIgD3QgzWwmHWmsBKh1bIh99sl62LlzDH3vrLFMgLkCbSxe4ZYA7i7Mw3Rhcz6nznWsaidp65/EghzxyISAQfwZW48Ve8KyGk0MnZpXU0GzeTUnrYSl5+5uBfyNT60kKswTAcP5mcwD++TF5nWTRIVKAlIXcO02JKh0qLbVganUjP3h0BU4duuCqCASjn1ObCLX5aqC8yCYvMxxQuoovSn9oFN3KxBTBtXGpVMyyKj+3yPIhEQ/0Z1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(136003)(376002)(346002)(5660300002)(26005)(86362001)(478600001)(2616005)(956004)(186003)(31696002)(36756003)(16526019)(6916009)(8936002)(6486002)(66946007)(16576012)(316002)(66556008)(54906003)(66476007)(31686004)(53546011)(4326008)(6666004)(8676002)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mk9semwxSk1rVXNlUHY2Y2hCVERhMTBGaUc2UmU3blV5d2hpYjBVc3QrbWpE?=
 =?utf-8?B?RGtPUzJwUlhuNTE4NnFGdERSc2pXdGdaRDRJVTFzT0hZVjFVMDM4QUpJUCtU?=
 =?utf-8?B?ZEF1ajBrb29GVHFDUWRVNEVNeElSb2JIcm0yTGdjOFhuOFA1K3huWDdkL1lP?=
 =?utf-8?B?UHd0ZGRqUEtpNkUyeU9OVGE4bWZTOS94d3ZrVThybStVR3NlMyswZHllbk9k?=
 =?utf-8?B?K25BSTIrUSt0RC9IUDJVdUpISGxTWUFtUXRSdVVsd29zV1pkcVo5Y1Bpd3BB?=
 =?utf-8?B?cnhmSWtjdTFMdXFSRWpuWldwcWtXeWdaRm5FbzVQTlNoVnhiRmhqclNJUDlR?=
 =?utf-8?B?NFhRcUR5YWx1M21nd3J2OERmQW5NckpNTHJJRnVuSTFnNXVXakdYWlN3eTdH?=
 =?utf-8?B?eVJYQ0plM2VNcERtUDdqdS9CeVFmdDgzSS9SOWhnWGVTNlJDYWVBRERyZlZ4?=
 =?utf-8?B?aC9KbWVKeldiK0NJTVVQOUhCUzl3OUhuREdJeWpodXRERTlGTFBIdTdocHQ3?=
 =?utf-8?B?VDFuNGd6cFY2anc3Sy92WjlmbTcyUTdSSVlPYmlzck1FQmtuS2hYN2RUZ0tO?=
 =?utf-8?B?Qks5VUJOZDRabGJuRENFQjBhUzFvUkRqeDBOQ0JNakduMXg4WUs3Wm8rT05N?=
 =?utf-8?B?ZWpTdlFWaFY3SlZudEJVY2hkRHNIU1FJYjF5eldXNXFFQ2NDQ1V0dkpuMnVT?=
 =?utf-8?B?QmlvYzgvWFUwTHBjQXZqWGl2NXVNTVp5QzdGU2JyZzFOdDNlbStaVGIxNnhz?=
 =?utf-8?B?eHdJOUx0OE1jdGMvallMY0lKaEZFSG1jMis0bVJyS0MwWmpNcWlmRVJiTU43?=
 =?utf-8?B?OE9xdS9SbDVwcDdqbk9YdkUrMXNlU1ZYWVd3T0I3MlE4ZGV5MkM4ZkJ4SGJn?=
 =?utf-8?B?SmM2Smo0NzdnZWYrWHkrTTM2Zlcyb1FQYUliTGs5Ykk3UFFSM051NFF5SUI3?=
 =?utf-8?B?ODlNbnFDN1BnTjlzNllWS2RLVDRkb2RiaUh2RXRRQ21lNVNxWVJibXZ6aFZ4?=
 =?utf-8?B?RXVCMTF6WmJ5SURvai94ZTlab05yUWR5bzFwVERYcDhVZWpOVDllQWp5ak5l?=
 =?utf-8?B?Zzk3bFZ0RnpvMHhDZFJPTVQxWU56emxBelNZZXRnQ0VDWTVrbktka0FDYi9X?=
 =?utf-8?B?bHgwak1WQ0ZFcEZreUFmb1NSaDV6Z0t6blg1U1FieWd3eFBtb29Vbkg5ZnFU?=
 =?utf-8?B?dGJzaGVDMk0xTVc5Z0VhUFJBYjZoWUIrZ0RPaXhQODBwdTNZK0tjdWRGNEFs?=
 =?utf-8?B?TzhaczFCYWJCdE9LcGNJWnRJc0RYb25SUzloa3hibEs5Rk85eWRhMElTSEVE?=
 =?utf-8?B?ekdSRHlTMndHTmYvOVhtTkJiSDZLYnEwOGhHMmFOZWFjTk8wQ0VZYlZCa21r?=
 =?utf-8?B?YnBCaHFEWnJ0OVp2c1BoNFRTb1QrK0l3WkZpbENDTGx4QlQvVFB6Q1VYMkMz?=
 =?utf-8?B?MnBZRERoT1pUM2E2T3h6ZW1Ub01yYjNyZkFyYnhrSUs3Q2hDMHlQWTZrbHht?=
 =?utf-8?B?Y0V5bk0xUzBTd3lrd241b29ycWd1bml4RjJ0SHBGTDNKd1pvbDdzSzV2em5x?=
 =?utf-8?B?VWNTRlc3Y2t4UHptcERBTGRWL1N5OUFuVzZoM1RTTEJpYXh2NTFZMDdza052?=
 =?utf-8?B?WkIzblliRWhvempWbURZSXZnR1pDSHVnV05ZWkkrY05pOHdFTXNDd2p4NStR?=
 =?utf-8?B?dERHUUpXdWx3dHYxS1FPREJxazhiQ3lpZldNZzA4cEdvSlZ4NnZ4dFIxcm5Z?=
 =?utf-8?Q?ikKYwB0rpltUj3wfxtBr6NkCVdYeedYPpMBSe7M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba3b2f8-f5b1-4783-91b1-08d8cdbcc627
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 12:09:53.9130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32h+zmIE7iDRMtz1/9RnTJZs+2Ugxi7syPzzD/q5oUB0HqjFK07BQV5jYBhL22pku7bGp1AYgOBRT2j+fdeGrewOTAL+MZ6uBqzyfxiOD1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4549
X-OriginatorOrg: citrix.com

On 10/02/2021 10:55, Jan Beulich wrote:
> On 09.02.2021 22:49, Andrew Cooper wrote:
>> Currently, a failure of verify_patch_size() causes an early abort of the
>> microcode blob loop, which in turn causes a second go around the main
>> container loop, ultimately failing the UCODE_MAGIC check.
>>
>> First, check for errors after the blob loop.  An error here is unrecoverable,
>> so avoid going around the container loop again and printing an
>> unhelpful-at-best error concerning bad UCODE_MAGIC.
>>
>> Second, split the verify_patch_size() check out of the microcode blob header
>> check.  In the case that the sanity check fails, we can still use the
>> known-to-be-plausible header length to continue walking the container to
>> potentially find other applicable microcode blobs.
> Since the code comment you add further clarifies this, if my
> understanding here is correct that you don't think we should
> mistrust the entire container in such a case ...
>
>> Before:
>>   (XEN) microcode: Bad microcode data
>>   (XEN) microcode: Wrong microcode patch file magic
>>   (XEN) Parsing microcode blob error -22
>>
>> After:
>>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa000
>>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa010
>>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa011
>>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa200
>>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa210
>>   (XEN) microcode: Bad microcode length 0x000015c0 for cpu 0xa500
>>   (XEN) microcode: couldn't find any matching ucode in the provided blob!
>>
>> Fixes: 4de936a38a ("x86/ucode/amd: Rework parsing logic in cpu_request_microcode()")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> After all we're trying to balance between detecting broken
> containers and having wrong constants ourselves. Personally
> I'd be more inclined to err on the safe side and avoid
> further loading attempts, but I can see the alternative
> perspective also being a reasonable one.

The more I learn, the more I'm starting to mistrust the containers.

But as we don't know whether it is us or the container at fault - and
have an example where we are at fault - I don't think blocking loading
is an appropriate thing to do.  (Amongst other things, it totally kills
any ability to test this interface.)

~Andrew

