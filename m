Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3813BD7FB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151354.279725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lMZ-0005ZE-5w; Tue, 06 Jul 2021 13:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151354.279725; Tue, 06 Jul 2021 13:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lMZ-0005WF-28; Tue, 06 Jul 2021 13:43:47 +0000
Received: by outflank-mailman (input) for mailman id 151354;
 Tue, 06 Jul 2021 13:43:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rBn=L6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0lMX-0005W8-6s
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:43:45 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2db3bbbe-de60-11eb-8495-12813bfff9fa;
 Tue, 06 Jul 2021 13:43:43 +0000 (UTC)
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
X-Inumbo-ID: 2db3bbbe-de60-11eb-8495-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625579023;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hvgz3TEw802RHWWn/UX2yl5qNVaWV55FSONQ61nvLGU=;
  b=Mhu/zKo55wg3jpYLzCiWKIFAgLsLJHoDsyrH1Dr3P5iyun+4r8szNK+5
   IpamfboGJpLAeFhuBx7vvzty2yevCWwfQ7kBW2W78h2ce+alBPvsJwVGM
   gp+VPQb1EANbeHNG7lz7XVJUMz8tJZYO8hEmkaLuolqgkcGmj0oDlrkJz
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6dqqENE+6v/S9yFXvC2xshjRvnEWl7M1MvQ3//3MNBTWvcfWNuVE/FQhv0RFgyju9tFI9BAX7x
 u8v6duw1SW41XzHA++ry3ThDmEnjAFk9xJ4eVCnoSq81pmiLpqlRbQHWeZ7RTE50S5YsCpxoGF
 EgCw+gtKHN9UdtByQz5pk4Kfj1ULX1XH+uYj9gt+9gO4y++7Cc5ssk/VxkwEg7AY17MmZQPS6s
 mOWjmNHb56PkbdZL+3UJ14GK4a5Qj0vujajUvje056K1B8/pd8GQLwG1DTSRTif8wuwFnk33lm
 LsA=
X-SBRS: 5.1
X-MesageID: 47637614
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EFgyTqlWN0im+9cplD8d4chVdjDpDfL63DAbv31ZSRFFG/Fw8P
 re/8jztCWE6gr5PUtBpTnuAtj7fZrjz+8T3WB8B8bcYOCEghrPEGgB1/qa/9SIIUSXndK1s5
 0QD5SWY+eAdmSS4/yKnTVRa7wbsb26GKfBv4njJyAEd21Xg3oJ1XYANu6IencWeOFUbaBXKH
 KNjvAsm9K7EU57UizDbEN1OtT+mw==
X-IronPort-AV: E=Sophos;i="5.83,328,1616472000"; 
   d="scan'208";a="47637614"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hf4JgDHsXNTL4oZCWXdSQ3btbXDxCrnaqEXFNbL04NW/9If9ujuzYZColgb9uW0rR1XILRWkpsVLfuo1VH8msOX4gfVhy3Br8QGYDmHfCUAZK+cSpw/l/mn06qVSq70noT/fM3e9ZZ5U10w4HYQPB8Ww92DT408sI8AuV3ztAPfV9zdTaaa24Vj2QOOyAnTHVBu/o26RaRYxB+2yE2pKQXF8ttv8qquryjUdG3Ae3nhILDxfLKUvFdanzVAtk1e/m5d9ycAyO+o2MQI5K3y/5QV1r3E+qygYkuGlbYVxQI/Z6g8vAKJenH8yAgdM4LL1fFfpAMSfzsVo4SqEqKoERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvgz3TEw802RHWWn/UX2yl5qNVaWV55FSONQ61nvLGU=;
 b=kKgC/Q6ZHYtcBYdQ6GRXH5pb0fDlV1CO7Ip7e7LDZSJHj8+6rWG+Ep4HSyjBBFbnr/EtQDUC+mz9VSntJ4/OxnXHuUUNWHwpu/kwoqUuXP+g5sGriFc5chqAk2D28dKmZSMnhjGnuZhLhL45qVIg6N1erEEpekNTLLQqgSmve2CCXKftvIAwOBZL7ypJsbwKio8dD0EHpYMdCX58GO3aaqYhYVWbk3IvKW6DdyluGqHDxbJvWXURZ7Y51YZUuDyrXh9OesPqYtNEzo9xbXOOuzwAHq/YlTjKZYByjo9ipAZbDOSMZT6TorlBDV/cS3jSiiL5nkTuAxCxmzVw6R5Mow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvgz3TEw802RHWWn/UX2yl5qNVaWV55FSONQ61nvLGU=;
 b=KIq8lcz+yYfJexzqr/2f+SC5ac0HhlV3gx0FlpbT17BYlthF/DO80W6Z6DPmqi2hMcAxUSDTNzCNRb5Jd8Rv3p4/C4VQMwHkw5mGdHBzts6R+NKfoJzVSD253wLGfHsZTGCV69rMzyDagdxTC/FAc5nHa5untSECgDkjx/B2R/k=
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
To: Olaf Hering <olaf@aepfle.de>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
 <20210706145804.1ab98f16.olaf@aepfle.de>
 <902720b3-d71d-82eb-9200-97f2b17dd264@citrix.com>
 <1fd51108-82d2-4605-5c37-410c3f4c65a0@citrix.com>
 <20210706153931.67481153.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ce619db3-4631-a9eb-c984-aa73b905a6f6@citrix.com>
Date: Tue, 6 Jul 2021 14:43:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706153931.67481153.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6547c0c9-b7be-4324-9eaf-08d940840e7a
X-MS-TrafficTypeDiagnostic: BY5PR03MB5345:
X-Microsoft-Antispam-PRVS: <BY5PR03MB534519A19394313F8F7065B2BA1B9@BY5PR03MB5345.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0J1L79BN+wnoBiTC0WnOciJDgbAd+sIeZM8SLEeks2HdkZ+sH7TNFG674QKKi63TxkdF6nhINlmXcdBoHU2UvQnTJo/mxwHpg3wFSfJW2QR+d4unzW7TFWCEHiK7M2xjcUzkmLHYW0JCypi0zp2MPwjbb/RaN5i8E41ZO5DbxlZ+CJGJfeeOPoMufe2HQDpOTj9OZkI3+chD1JVP+18OQWrto102K3HCTB1K3NI8KZ4muwFW/ebxUAParLVmGHNj2tCZj/BwHr1//zwaGO5Qiq8nCdchT7PVuSJrzYfDHGMZd4IWaN4Zr2+caweP5jp/35RtuTOSVQgAdD0RwOTPOF8YGdnWylCIGwocLBVwMdhSjAibHPvt79CruWtJN1OB389oTvVmW7/7CVR0coKM5N13nyMaZFZ/L7ZQt93o2T4QCRxpsjR7BfVbVN6yHR8MQ6ey5mw+MdJSDsZJwe2iKajZwlZtjqVJDCuZIa0V/wme6n1qH+Z/FarC/B6Ucy/i9gGslhPVUeeY9G06ceWx0dinz54lHjfYDsCaMHUgHpmC523GoHc6FbuzQGtp0xLd/j9nTGDpZTk8Wel6d4ABNvQll/+WNLpn5iyRoNq+MiRTTPOsAoh5ifGQA2JCIr/PR1l/KXAoKDw6TPfYSmElIuiYrlO43cWcDqwx2Gz+cVMi/NFzhQaydeWy6uRWWiYvFpBCpyuXepq1alWDvNwJ8V/+iU7/8zLDQtY3doA9SgW5q8IrIk7zU+aBdLH4xLdNYP405joZpypbzXxIcz+0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(4326008)(478600001)(2616005)(5660300002)(86362001)(26005)(31686004)(36756003)(316002)(31696002)(54906003)(2906002)(16576012)(186003)(8676002)(6916009)(66476007)(38100700002)(66946007)(53546011)(8936002)(66556008)(6486002)(6666004)(4744005)(956004)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SndCU1ZySWtrYWVjU0d1NWhGdUtST2RTTldJcmFQVjJvVUV6UXp0eU90d3pj?=
 =?utf-8?B?M28vTVR5N2ZCdmc2YlhYQ3JDY3VyR2h2bzg5QTU1TWlMcHgramR2ZEVJN2Ns?=
 =?utf-8?B?dlg5UUVaK2txbzdTMDdjbzBkNitmTmNCODhNd3BXMlJoVHRYcmlXQzJyelJJ?=
 =?utf-8?B?TE8wcm9BUGZ1V2lMMFZvd0RmNFJxaDhQY1JmTG4rc0xLMWpQeWZtOUZORjNj?=
 =?utf-8?B?eFcraVBNbFNwY3pCZnpQTXlFcCtrS1F3QW1nUVU1YkphV2JEc3BNbDE5S09a?=
 =?utf-8?B?aHZYYVVqeVlNMmJrZ3JxTkR2Zld4N0lSeWs1NjdPYzVpaWhubkRHaVNFNENz?=
 =?utf-8?B?V1ZOTWNPMTFuK0hrWEZMendMY25SdXFaM1ZOOCs0VUd2YWZNWkVFRmhlN2xG?=
 =?utf-8?B?eFJKZWZ5OWNRWk9qbzRsMUpnNTRseXRtUHRBODkwaFd0T2hPNCt4ZElIREhR?=
 =?utf-8?B?Z1F3WDB3Zm5HRncyWWdqaGtLQ3N6dUxlVzZGOVJvd3RNd3FoNnFFT0pQMjVi?=
 =?utf-8?B?TVFRaVowL2k3V0FETFlpWVZ1S3c1Q3BRNEtsTWtYSDJyTC9EZllwOHpNbEN6?=
 =?utf-8?B?RTJ2SnpqK0NvSU5qNjN4VGd3Vk80dHZBbzlockZHdldpVWF4aU9uOGE0enJJ?=
 =?utf-8?B?WVhiUHQzME9DYXlLRlhRZ3ViODd4cDVTOHlDYmRPanA3aSs2empOL3VJYzZP?=
 =?utf-8?B?MmpFdndWSWZQR3l1N0FRczVFdGc2Yi80dUhycDE0TmhrMzRsWXRTellrTG1t?=
 =?utf-8?B?UTQrQ0RtNUQ0UDlXbEF2WWwwVnEvOU4wL3VVVCtldktqcXdEb2FneUFFT09F?=
 =?utf-8?B?YmRRZU5WbU83QjhVTFp0L2hqZVY2Q3BVb0VYUnZvTUtFcTVrNjVrS2RDam5u?=
 =?utf-8?B?dzNFQnhsajJCanVuVWR4K1lRUXoxNDJFTEZBYnNCRUs3NEhuaGhQRURjcW1F?=
 =?utf-8?B?dzMxT0xKY3ZEWWV5NjZHQXBvVG5FaTRGNmxQL3paR1Q4d0RvQStJY3VnUzNG?=
 =?utf-8?B?ZUNUTUJBaWtVd3B2ZzN1WmhsZEp5eXJVZE9UQlZOK1FuQ04vOEM5Z3BIT0xL?=
 =?utf-8?B?c09NalU1aSs0OVdKU3VNanJuMmVreWRRclRZVzEwc2EyMlJtaU5VU0x0L09E?=
 =?utf-8?B?YmNDTFNzOUwxdFVWejJ3bVhqbFMrQkJNUWxxdS9BRW1Qb3pUSHNoeWZzZW9S?=
 =?utf-8?B?Z09ucDJ3K0lyWENBRjA0ZlRhRmt3aXBsVmNFRVE2S3NNcDhVZ3c5SUVzOG1p?=
 =?utf-8?B?Z2JtYVdkUitwYy9kdTJsWEU3OUNVYlQyMWY0NnNFc01vaTg5aytJZGVYYWt5?=
 =?utf-8?B?NWFMVDN5azJiZ2FYdzQyT2VVL1JRVUJublVndm8zVVExdzMrQ09qcnlFSzUx?=
 =?utf-8?B?blJKVU1CVTVVZTErVzlKTkQ3Q3RNeXU1dDI3dEFyc3VDelZNSFdqS1JxYUF0?=
 =?utf-8?B?K2pCc2VWV3cybEl4Skd0a2hsTDZsMHN1a0haa3VjdGZRZVlxNyt5VHQ4QXM2?=
 =?utf-8?B?R0pLRUFFelM5WGdMZXNZS1NTcWdZdUZETlhyNDllS3dXb3BqQkR1MWdUbWg3?=
 =?utf-8?B?RDNGY3FFSUhGS1NtUmJaTVJ4eGJOVDBwRDNzallmaWhYVmgyQ1U1OC9zVlZ0?=
 =?utf-8?B?NUNvUnpjcjBoSDVJL3M1dXl4clBSZHY1bVBKVmViSHVpc09LNFNKSjBoRzY4?=
 =?utf-8?B?S1pLei9NTGw2aGVoemJNYi83SGpWR3lzOWJIejlhd2dkOU5JUTlWTlR4eTQ0?=
 =?utf-8?Q?U9V5lrwhp84OgDO1KepaVfxe2VRlGML/t4xsvGp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6547c0c9-b7be-4324-9eaf-08d940840e7a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 13:43:37.3393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEQrh/fB2/MVegKYcIcDsFmpJQR8/0lPbe0aCoYfkFKTcQu0d/DWJfAFk5zrmlTllB6iqt5XTMbp8HUC96bAehtbN6zl4k5B1nJ14eo+uME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5345
X-OriginatorOrg: citrix.com

On 06/07/2021 14:39, Olaf Hering wrote:
> Am Tue, 6 Jul 2021 14:22:58 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> What hardware is this on?  i.e. is the Page Modification Logging feature
>> in use?
> At least it gets reported as VMX feature during boot, this is a CoyotePass system.

That logging is problematic (that means "this hardware has the
feature"), but yes - PML will be used by default when available.

~Andrew

