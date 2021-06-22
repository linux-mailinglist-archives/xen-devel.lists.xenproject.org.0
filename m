Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08933B0A56
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 18:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145973.268509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvjFh-0004wS-9N; Tue, 22 Jun 2021 16:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145973.268509; Tue, 22 Jun 2021 16:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvjFh-0004tp-5G; Tue, 22 Jun 2021 16:27:53 +0000
Received: by outflank-mailman (input) for mailman id 145973;
 Tue, 22 Jun 2021 16:27:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvjFf-0004tj-0O
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 16:27:51 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc0bb070-2254-4ae4-8cc3-99988f5ef58d;
 Tue, 22 Jun 2021 16:27:49 +0000 (UTC)
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
X-Inumbo-ID: cc0bb070-2254-4ae4-8cc3-99988f5ef58d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624379269;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VtVlYcU6+/wbuJX1pOjnPD5Exirrp4sS0B8dgtDtJ80=;
  b=HMQK5oxfjSoj7zG0TxqOJI99NnekFhmXuB4GPw+3ab0ameqXhh7/Qq23
   vWTOLjgx4gWm0ruDOn5AlGf5g3jUQg4B7ts6pXgC1BDuVD6a62uEVBzxW
   ESr5iTdOcDmY/C/WxUwS/2vk0/vbd+IrwfY4KcFlThi79XRGLn4KmaQBt
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ioagPGl7N+nv4jQXrGQ8gPeLSnUJaM+5K600rqCKIlW7Up7/EfwrX/nB+vrOX5VxhgAjblbGba
 UohJqLxAyJwT0ZYyYeOD0ybCP4el9Z/162MbUojLiEIZsjeKLXsl0Nf0TNkPPmvhvZ2ICcvdMW
 ddBBg34SGHs4ixIOOB0iHWHyY/vffVUEDvbRvYR+UVP+2+jydggPtLKhU83yT4oqGtwovCo3h5
 /GFOJPZTVzeFRfl5GKlEzSeYxwTziEIjNRNgeMBeNaBKa3B7c+1XAkgfw+enoBzK66VdrRHi4A
 ByM=
X-SBRS: 5.1
X-MesageID: 47072762
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0Xi4xK+LRZLJpZa66HRuk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.83,291,1616472000"; 
   d="scan'208";a="47072762"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8B/am2kDLy30FrAkr5/+ytjhFRKIzhL5nqr2bY4Td+nl5cMtQz0M4qzory+3jhMxP1t8ZBkK42Fid014L/a9pkC+F5ejCyC+BNxzBD070RfEjUogIh+rOgoBZUuEQWlmF6mUSoTNkDrOT8oG2R+zrNjk8cDn4X2UDU1xUw1bscnjmgGCKrysjflV7HYWgSLxSPDoNWOAdQqWO6IqYn+olEFFgZ/G83dQtH1coWbwWiA73O/4SGdCRM97t3sPTKsAbLIRlFTHj+i8C0TqRUo4l11EZB18KIrfDRSoN2ujT0ra2VO6t4glGIbqVEE+ctLMjKr+Jo1MBCOKdsSDX4MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTfSzXv9hlAttnN6XQ5b6pwrnkXJF1fp8R9V9tpTRKM=;
 b=L5+WkHy8UIFwfyRJmyI5tGqW7IFCa8Rdgb/QUUMyYwNslOm45zJyAlVlglB9psXe2Aam8UesvV2znNDzJzpBACxwuh8MDjnCKMLELJs4zRHK9K1Z2GBPMz6n7ru5fMcyJaa6mBXMep07yejDNNjbYSp0UI5Hcyyju7ldQCSzCRwjLN9RFOWkqieY+gnUK+ZFDsCe/46hDDBcWcz1eRT9ZtA+A9lrArW7STPvAFZ9Ow64q1bR+jqPp5h8fXHKRj9AwsrBOTI5fNZ7VaAlR6sUP2OsBhfhsFGgef0xEBaxoLLkvze1q3HnklPdmc7RtWyDiATJbG4BuMhhI5HGDbRzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTfSzXv9hlAttnN6XQ5b6pwrnkXJF1fp8R9V9tpTRKM=;
 b=b6bHUgKjBVCA2M9Q2nTRQr788XAerYB9TAsTPTuKBsbKGSdT6GOJhJFnUlF2FIzVGCFMSgWaWMhVsG+z6DTFxR/0nylhU3y4cPkPD8qynUaEj91hUr+T9Y1QCvv50T3JCdKGKvaVPVawGbmAX1PhUwWZWiX6Uy74PQ/R8u1CHnY=
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210622153930.16003-1-andrew.cooper3@citrix.com>
 <e3104d67-d988-06f7-58e1-92ed3ef739bd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] Revert "tools/firmware/ovmf: Use OvmfXen platform file is
 exist"
Message-ID: <58ac70ac-f205-564b-184b-a86c19bd2906@citrix.com>
Date: Tue, 22 Jun 2021 17:27:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e3104d67-d988-06f7-58e1-92ed3ef739bd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11486de7-d4fe-4f98-613b-08d9359aa94a
X-MS-TrafficTypeDiagnostic: BY5PR03MB5047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5047C0FB5745ACA87C64566EBA099@BY5PR03MB5047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5TZKEgkLXuhYuZ5ilwWaQewSCxGQSrC0tpjAJgqjyjMv37APgJDgiMeq0eF3tD7am5Zozwsy5dc6p3kyLcKJisvOv5WR8IblbE5Zrmigy3QWOnOHukS40qo4Z4ybEuhvlhvqiQjBNfHPO4rgJ7lrTHEKSAq8qlAOSDeRQ6ktXl4SEAsTlSbiwlQ5t8ecphn9sLUgZD1E/Zj2vINTN6RdSKwhqoeffD7s6AICRcDfFLtpLY54mqZx99Inv5kV/saBgHn7EsSjrIJhN162sVFw+Ve0J931U0ua0/A++VOyXyeBBhsqnEYy36KwOft1KypXOxBsvRfPgkQzJ/Gao5Zv9a9Ot49DwhOwgifVvpA5zaIeW+R0J8tagoKpfdqckZx6yLUQ3ljkSSUwv8Cc01pu+m4F6KEW+mfT1Qn9r4NoyGbMDGSePBeToLehIk8OUcFKEn1opXb5ooXax0Vq+pyuFQGgb/n+B9ZUet4QBdWnBUb9nMWU8dvAeZt0j5H/c+tfadBJikQ08YHcS7XTLsMZDnWYK23BCiyN7CpeW1r+yoa5O53JLjUb7EZQcsGw0eSNk7C7U9jw6XE8SyTuWWQ9Mt7rF47bs4gAOkThirLJywbeU9P7/elrb3OWtbzgPCJb0m2eoK/nastB9e3qq6f5x+fKgMO/8OtFqn1eu3SXFloG5g72g5H84kXKPmJSqy+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(36756003)(66476007)(66946007)(956004)(66556008)(2616005)(2906002)(8936002)(8676002)(316002)(16576012)(54906003)(5660300002)(6666004)(86362001)(31696002)(6486002)(16526019)(186003)(53546011)(26005)(83380400001)(31686004)(38100700002)(4326008)(6916009)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3Y1TlBhYVpBdlozU2NqYyt1WjZhZmxMOVpIRzg5cjJ4TFhMelBvaS9lZ0Vm?=
 =?utf-8?B?ZmdsdkR4VkFXTWNySUNzclRRRFhQSFpDT1NhR01vSm8wNXAxcEo2dC9jS0Rn?=
 =?utf-8?B?R3VjMDJMQkg3bURXY0ZMemJ2eS9TN2JqZXp5Z2I5WHNZUnJqbUVlS0ZodjZ5?=
 =?utf-8?B?NnhBTGtsWDhtakhzRFQ0d2NuK1NnN1Vla3EzQkprTWlvdHVHL3NSR1Z4OXY4?=
 =?utf-8?B?ZFRxTnVMYWY5bkVmZEtYMzVIU2lkWDJ2WWJCNkoxNEFzR1hQKytZbnBoVHZN?=
 =?utf-8?B?OGgxVElzaDA1NEsxOXlvYTgyM1NmUVIrTG00OEZ6OE94OUwzTEFmeHU1aDND?=
 =?utf-8?B?cFpyUG02OGZlRW9yamcyRGhlU0wvL0Z2SVY4NEkwZFBjRWFBMWNDYU0vd2d1?=
 =?utf-8?B?bGFMNkJKSUR0RGNIV1JlM3REVnYxN3dLZnRlUExWZHFlWS9sTkZodWJLU2Jx?=
 =?utf-8?B?L0h3cWN2aFNXSXQwbnhoYWQ5L3g0bXN3cnczV0xFMUZVUWZLUjRZdmp2SnFH?=
 =?utf-8?B?YWtDLzNwRklkZDZ2NEQrd3lCRm5TY0k1UUdCQk55OVNSK0J6b1k2em5PWk52?=
 =?utf-8?B?MWNLcXFsU2ZGVVFHTmovK1U0MHgra21NTnJBYWwrTzJlNmN2RjIzeVBzc2Uw?=
 =?utf-8?B?bFFhNHlVb1VzV1phbm9UdUdMWCtEWURmUGdFT284R0pENXpiYUUyOGlLL0p2?=
 =?utf-8?B?dmtQWE8rMDQyMVFUK3M1Z1MrOFpqQjY2dk5OM01yRnV4Njh1ckpWSEJNak8r?=
 =?utf-8?B?aFpUdFpmQlhpM0paVWlOY3h0aWlMamtyaW91QWlzRVRGa0FTODRVcldoR0F0?=
 =?utf-8?B?eTJpQVFBcWxQTTQrZlkra3JXSmlTMmozT1NiZStzR3l3WlNBK01ZdTJCY1Ry?=
 =?utf-8?B?VG5OMUFOZVI2VUxIUlJJRFFrdVBmTDhQNlNFZkhvQmpTdCt3SitkYVdORkNG?=
 =?utf-8?B?cFFRMGZGMEtQRGV3eGUxUUdUWERodGpIYTU4WXd1YjdoL0lJL1NhZ2g0M0wx?=
 =?utf-8?B?bTNLcEZxRHZ4WW1RbFZEUFhyemtNdkhYUmxpREgvTmlpalB4eERkZi9NYTAz?=
 =?utf-8?B?YWlXMWVpRDFkT1ZSSVJvdjQ3a21IVW9RM0cvTDFoKzVMM3U5QXl3K2pGMUZI?=
 =?utf-8?B?cmkwektsSlM3V3JhYmkrR2VVZmI2RGVLZGlmRkJDQ1dMVjF1YmhLNklibjhK?=
 =?utf-8?B?NEcybTFQSFlHc1U1bDJ4THYyZDFBY0JJaTFydG83UXhtZEFoYllNakJhNGlz?=
 =?utf-8?B?UUxqU0RVeEpjYzJ0MS9sTUl0T0J4NVFicEJ2NlZlOEZhdXcvVFdYR3hLdm16?=
 =?utf-8?B?Zm9EMit4ZVp1RkZGdWlycU4zYkR5SmtVdGFDMEk1NFl0WEZ5ZnlyZ21EaHRi?=
 =?utf-8?B?citkam51TFpHNlVGWU5FbmI1NklyVys4cFhDamRCcElNRWNwc3VmWWF1UWdW?=
 =?utf-8?B?S0lJc2ExeU1OdVUwWThkRTNXOU84NEgwYi9nRjZZKzduUEw1eS85ZVVHNTRO?=
 =?utf-8?B?dFdSejZlaXcrOFlGd01jSnJ5cU9Lb0ZEZWRvQjN6RmlvZWNqczN2NkxkZS91?=
 =?utf-8?B?N1RqY0hvRkc0a01vd01VMXNkWkdLN0ZKMGVVbFkvZ3pFQ2NGTFpHU25LTWpl?=
 =?utf-8?B?ME5vd21QWDM0NXlISXB2bVpmRXloWk5sR2x4bXVhN3MxZGRJOWVTMWFBcHJz?=
 =?utf-8?B?OThnelB0SHd3UCtLNW1nOTIzUHFBU3lIZ1drajQ2ayszNkRYeW5qYkdJSWlj?=
 =?utf-8?Q?fErSOpDSHPG/ipHTr1rwSr5EVi9yHQOvAHJOAe7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11486de7-d4fe-4f98-613b-08d9359aa94a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 16:27:43.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEDSQL3WkLjScBg3YM6j6qW1thQgLA7c0jtTLMnGaFxbMZ6XC3o2YEYGrSs5AGNIxuS9Fv4g5RruzLJE+SYkfVAEwnz4r84x0JL+0x9iS08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5047
X-OriginatorOrg: citrix.com

On 22/06/2021 17:10, Jan Beulich wrote:
> On 22.06.2021 17:39, Andrew Cooper wrote:
>> This reverts commit aad7b5c11d51d57659978e04702ac970906894e8.
>>
>> The change from OvmfX64 to OvmfXen causes a change in behaviour, whereby
>> OvmfXen maps its shared info page at the top of address space.  When try=
ing to
>> migrate such a domain, XENMEM_maximum_gpfn returns a very large value.  =
This
>> has uncovered multiple issues:
>>
>>  1) The userspace hypercall wrappers truncate all return values to int o=
n
>>     Linux and Solaris.  This needs fixing in Xen.
>>  2) 32bit toolstacks can't migrate any domain with RAM above the 2^40 ma=
rk,
>>     because of virtual address constraints.  This needs fixing in OVMF.
> And I suspect even that presently enforce boundary of 2^40 is actually
> too high, and things still wouldn't work when getting close. At the
> very least the tool stack then depends on a fairly big chunk of memory
> (2^30 bytes) to be available in one single, virtually contiguous piece.
> Iirc 32-bit Linux can be configured to not even leave this much space
> for user mode.

I tested it once during Migration v2 development, and it worked for me,
but I do expect that that is as much testing as it has had since...

A 3G/1G split is the default under multiple 32bit kernels, and the
allocation is made right at the start, so there is a reasonable chance
of finding space.=C2=A0 After all, it only needs 4k alignment.

Whether ASLR has changed the chances in the meantime remains to be seen,
but honestly - 32bit toolstacks on x86 really don't exist in production
any more, and Arm still hasn't implemented logdirty support, so the
limit has little practical consequence.

~Andrew


