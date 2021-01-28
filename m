Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08B030820C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 00:45:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77512.140409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Gxu-0001KT-9A; Thu, 28 Jan 2021 23:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77512.140409; Thu, 28 Jan 2021 23:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Gxu-0001K4-60; Thu, 28 Jan 2021 23:44:42 +0000
Received: by outflank-mailman (input) for mailman id 77512;
 Thu, 28 Jan 2021 23:44:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5Gxs-0001Jz-H3
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 23:44:40 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98b18ea2-4df2-4855-97d3-b3243278bb13;
 Thu, 28 Jan 2021 23:44:39 +0000 (UTC)
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
X-Inumbo-ID: 98b18ea2-4df2-4855-97d3-b3243278bb13
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611877479;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eqqpATa8ID8CCQKfk8m8sGBWfwXSVeOIKj/A+SDc0D8=;
  b=Gz/vbFXZgXIivXcmeRlKRuTwT0ILNW8tTVlB50/k4bePUperh76wRaz6
   wcURxH8Wf6Fv1e39kqyWV5WdRY8Oh8imhE9AaqU+BTICV1n1WZAfrRgR3
   IoNB9GyicKxwQ0Wt7OxIAV9MitN+Ma6nhhapBlSUqvziJ1hADc5sxrDDc
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Fxd8QU/oIC+vJPrKSUWoBTYL147tS93ET+m/u9kv41IIrtTUa85s6NoKmJYYSBSciTBBn4ylcO
 t0gJB7AsaFj/dDxuaaGD2UOkgwl3NrPpgyyqAXyInXjSvBT+4FtoyAtFzIxQMMtNpozc8OwpKH
 4IZOmHDxYOrPpvbbzSOijN1N310rR19QfaqgURmMpwkpV7O3puNuneWL++hZrY08CnUh8XxLDl
 ZqfynzunP97T9Kc0m1UVuE5AlTvVJ421Nr4JnnNxnZMJ0Q1K14sFKYL8Q1sUiZecwlXI0H/UQ4
 dDo=
X-SBRS: 5.2
X-MesageID: 36315510
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="36315510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQQCSfD6POTpqZwBqxK6cyePbvn857zqk+OAcL7qytFA0rkjtIj2P81kRyfg0JyyLXsCUkFYgHNc9Npqwy2IR//pxV0Eiya6jdlrWoVIf+mlNa5cgL40jQU4T5EGMdlRvOuS290BNOUoOUpPxc+LKIDNdOI4fZI8Gmn03NmvAqaHuTB9Lfi8QeoerszZXdAzDoLJ34o/LwH5BjX5kc3JzfIMVpGApenAVv5otkMCbFGcFBVTl7Neyvts+Er6371CNO40VSfmNlV8SXltAtg7Wuhk9HvaoT/X25MZbYYjxtHkpxuSolS952chg5oRMjIzuYFmZ2pLE+NrLFE1tPrL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXrPne8cK9h/XKnni9YEgUSC/llPoUQIw06Jr8zNK4E=;
 b=Gm9WPvPZKmJwZcAomEKh9isWZI47uqhtSLlCoUS7kLFD9/Jtc2Ih30Xnl87GYPjp+BSW52btPcR/5Ge0ZPLhTDPJA0J3kuD2EdmGB+FFnklF4euIoAhArpShJFlG2Co5xLMuUtjk9Q1jqrWB6us14njTXN6dN8kuonpygRcqv92HerLfz0f5k25vglXHQbENrpXJhwVz46FbSn67q5/o1xS49ToJwnbhoNZ6v0snKg1N1PJZbK6l+2FihmVmEnHUnpGDyKiK9AkUrf8K91jDlD6dL2VOc+LQtseFRUDCRs6reUrAqllroOCXhSBBMoMRWHlEUanwP4Sz0qIpNk0KCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXrPne8cK9h/XKnni9YEgUSC/llPoUQIw06Jr8zNK4E=;
 b=LUiwjWPT18rdgEKU+pBU0UtmeWSLRZDRCUQoc8vQw/IgbdNW6jKFZ1FVk5wtcjV8Q4ydxZmN5syGhKrjftj9QHv3kKzXzA9oNtnfVvvCnPdc11UVMVyTVIP/X3WGQHlZPcsF2QHI2VoEM8Hm1OvNi8qTZwdNmOIJ0VvmCJ3wbOk=
Subject: Re: [PATCH v3 7/7] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
	"Hubert Jasudowicz" <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-8-andrew.cooper3@citrix.com>
 <65d256c1-e9c0-3859-b6fc-d3b7a41ef964@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <836bc7bf-7342-96b4-253c-dedb00da92f6@citrix.com>
Date: Thu, 28 Jan 2021 23:44:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <65d256c1-e9c0-3859-b6fc-d3b7a41ef964@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0432.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::23) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8524ddc-14a2-463a-c314-08d8c3e6aa81
X-MS-TrafficTypeDiagnostic: BYAPR03MB4278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB427857CC52C63E80EDFE9185BABA9@BYAPR03MB4278.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rw40zTl2LsqoAN5SZOzptdCKKyPbgLAY3bLC0k7r5Cv+8p3RKfWrHDarNcHuWpbQYSdcWzGdHLpNk7alKuw9LKsLxSU5fdb25cLAlMTV3NrnQDX1ij7+GJAtl2n4DlinncazvnmZhPPr8Y8tk7ZyR8BHtPTmZAXSEgtyMDe4Cy9gJNU3aDhWRj9Z9ezaNECz4mSo5JH8eqbl0jxEWsMT+5gkIhscmduCWFQjUMYfIcuBqD8A3jdbIW6fJZlF7uVRccfRvtLpkCnF1uGt14V9YLc2ixpWHPS56LCCmRz6IFLYhyjmy0wBjy/7A6uQZgr08stIiaD5gVd+UGdUb6yL0669hkRyVBL061YsveP584JMjvqjHVk/AJsnQxmn6USLIa7xqv44MuP7nqRjFr7CLmJw3zLTahM8BQ/Td1/5ZPGEIAz7MdRi75r6CGHGTLOhe3Ss5McqZJVx6OxbHALadrmJSNUNmy421t3Zr3OrZiJ0mD/gO4UmfgXWH2WkfFsSVeFC+JvpjqhTcYz/o8Bd0b1rQFncmDB0zt4/+SFYbXyY2TcTQwSsW5XtIvB5fufH7REGqcBtTJHtNn8qr9PJWsTT2IZ6icN/xlbdmehesGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(16576012)(6916009)(53546011)(6666004)(6486002)(16526019)(66946007)(54906003)(956004)(8936002)(478600001)(83380400001)(31686004)(66556008)(5660300002)(2616005)(36756003)(8676002)(7416002)(4326008)(2906002)(86362001)(316002)(66476007)(31696002)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUU2Ui9EVkdxc1ZXV1J0ZzdWZDlERkhhRG00cnlRRUM1SkNUdnA3MmJ1R0ow?=
 =?utf-8?B?dEZydDVIL2N0anE3L3VxSHJEQ1kxSjNrekpEa0cyV0l0aFF1MXhxNVJkdC9Q?=
 =?utf-8?B?azBqSEV1eUpRYkR2cklsMUc3Z2hBa0pZRFBQSHpmQThzbDVxWjdkR3ovdDZl?=
 =?utf-8?B?dUFzVTVmclRId3AyNDNrNGdmUTlBa1dVV1lxL3RacXlEMFhDbWRtbUJpSDlv?=
 =?utf-8?B?bjdIeWNzbFB6UUZ0VXBXQ0FHZktzTkZuYlJpZTYyYzBMUXB5alVYVEJySXB6?=
 =?utf-8?B?MGJ6dXJyYUdaMFJyWlFwTm54eFFpcElPd3B4aHNsOHV1dUVwRTdBc1BzQ2hi?=
 =?utf-8?B?emMxOVRQTkU0OVNUTlhYUlJBSGdaU2h2YlNpRWFLb1lIQlpya09GZzgwOG8y?=
 =?utf-8?B?SitzbEpGUG4vei90aXlUdENsUFErcTBwbDREMDJZNndWSUZla3h4bk53cVMv?=
 =?utf-8?B?RG9zS1Q3L3NWaThYZTRkMmNEbGhlam05TWRJc0lzeTdiVHRWdE83VlZPbTlt?=
 =?utf-8?B?RThUUjBkTXp2dmp2azVINmkrNm9VcGFraC9KeEZQeE5tcTl1L052LzBuNktl?=
 =?utf-8?B?NUZTblFuMTJPa0FSekJKU3Q2MklLM3Q1b0VDN2Jxay9WTnFjZ0VtNjh0QXR0?=
 =?utf-8?B?TEdYbGxPN0hqSkJtQlZ5OFJ2dmJtbUNtaW0wVUIyRXI4UlBFczRKNWt5Y1Er?=
 =?utf-8?B?eEs3M2k3Z3ZXVytTM1BSVFg0NSt3blprZ2NnM2VuSFlSK0FVOGtKLzA3RjdB?=
 =?utf-8?B?QmZSZTYwelh6ekVIUkJsN1pwVGZidC9nWTB4YXIyenBJM0loWVhuL3FRRjhK?=
 =?utf-8?B?NG56Y2NyMTlyZDVCVVRQclk1THJLeVljL3NZQlpJMlUwWkt6K2s5NDFlSFB4?=
 =?utf-8?B?NXJPbmVIajZ5VmtUdU9lVHROODF4Yld4Y0VZV2lpTUQrVDNMejdnL09mUGFz?=
 =?utf-8?B?RGEvamZBdENJd0ExT292R2JyeFRWVE9USU1KbFdoaGxFMlNkVzJsdmVMMXIx?=
 =?utf-8?B?UlMveEJSbmlicDNIajdSK0FsbUVKbHJxaFhabEdmODE5Y2ZjdFhkN0I5QTFW?=
 =?utf-8?B?TjRudTJzNUZhVjVSdm15VzRQdHlrd24xL3RPM1dVQkdHTGJ2ZXlISGR1bURF?=
 =?utf-8?B?Mllpb3FHUGU0M0FkeExrOVlOMFBaQXJtN1MrNHhJVEl4NTNzS1duQ2RtcWxF?=
 =?utf-8?B?SXVjUVFMZmNOendQRW9yUkYzcmhhNHBMNDJUNFJTY2pNaGNOWUlHK3RIZkdR?=
 =?utf-8?B?QnptV0M3MVpmd3RLTVZuZlFGaE9zSFI5MWp3MTBmZDFVWEtSSE9EQW9Xak5Q?=
 =?utf-8?B?ODFVTzBWVGI3TXBEYVBwcm9uY0d1bkt5OFhpWTQ5VklIT0h6aDE2a2hxYlEz?=
 =?utf-8?B?QXJJL2M4NnI3UnlWdDBRNTRHS3dKUEp3K0JpYVdPR1JzZVMyQ2IxM1g0cFpx?=
 =?utf-8?B?YlZjWHZnbHR4VzhkWUtHMEJjMHJob0tROWJXbm9BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8524ddc-14a2-463a-c314-08d8c3e6aa81
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 23:44:34.5189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V35vTcNKeJo39RGsarZGMvwpvLReXDpOQ2L4rEEZUkfd3xgs6ma9olH/UDHddC95TPVfbKzp08LwBLw5HWVyy156zjqH9SEFcWSaeCza1pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4278
X-OriginatorOrg: citrix.com

On 15/01/2021 16:12, Jan Beulich wrote:
> On 12.01.2021 20:48, Andrew Cooper wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4628,7 +4628,6 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>          if ( id != (unsigned int)ioservid )
>>              break;
>>  
>> -        rc = 0;
>>          for ( i = 0; i < nr_frames; i++ )
>>          {
>>              mfn_t mfn;
> How "good" are our chances that older gcc won't recognize that
> without this initialization ...
>
>> @@ -4639,6 +4638,9 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>  
>>              mfn_list[i] = mfn_x(mfn);
>>          }
>> +        if ( i == nr_frames )
>> +            /* Success.  Passed nr_frames back to the caller. */
>> +            rc = nr_frames;
> ... rc will nevertheless not remain uninitialized when nr_frames
> is zero?

I don't anticipate this function getting complicated enough for us to
need to rely on tricks like that to spot bugs.

AFAICT, it would take a rather larger diffstat to make it "uninitialised
clean" again.

>> @@ -432,6 +419,28 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>  
>>              if ( xen_frame_list && cmp.mar.nr_frames )
>>              {
>> +                unsigned int xlat_max_frames =
>> +                    (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
>> +                    sizeof(*xen_frame_list);
>> +
>> +                if ( start_extent >= nat.mar->nr_frames )
> Comparing with the enclosing if() I find it slightly confusing
> that different instances of nr_frames get used. Perhaps best to
> adjust the earlier patch to also use nat.mar->nr_frames? Or is
> this perhaps on purpose?

Good point - this is before the shuffle to avoid double accounting, and
the code gen will be better by using cmp consistently.

~Andrew

