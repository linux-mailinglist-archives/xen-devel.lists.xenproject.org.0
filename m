Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9C4319F4F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 14:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84249.157932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAY5j-0002Js-2r; Fri, 12 Feb 2021 13:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84249.157932; Fri, 12 Feb 2021 13:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAY5i-0002JT-Vg; Fri, 12 Feb 2021 13:02:34 +0000
Received: by outflank-mailman (input) for mailman id 84249;
 Fri, 12 Feb 2021 13:02:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuCD=HO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lAY5h-0002JO-K6
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 13:02:33 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3073445-3aea-4e51-9644-b78427d8b612;
 Fri, 12 Feb 2021 13:02:32 +0000 (UTC)
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
X-Inumbo-ID: f3073445-3aea-4e51-9644-b78427d8b612
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613134952;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1/AllvgK6Hx3mzUhsExdxU6RK8zMUno01BN6XJRkCag=;
  b=TSprTE2atxd1+/cCNk3/iOz2l8pNc+ILKLMDnpv2R4NvAEUstN9d6TUs
   HJCvHfHtSkY2lAh4Ees6l+TfpLAY+zdJwcLOUVGI1W/pLIjqs6W2MKvlV
   jqLZZvY5swTf+CrZ+WNUYYSzuXzxM0aaLls/pZJvibGGHckTwVXUQrnfV
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HrKqCgRLyVC/XvQ2Cz2SiOfGsgkDN41n5dQoml39ICRvZg9F8n4oVoWPGqEBXK7pATkco3pQY7
 rYOBFrP4FiRTQ6MYb4L+kFDTMYfNut9Cmn++G9FteemVXdbTQmEe0s7R63uKgocTTukaFonbpw
 scG9WRKS/gU2sJhBxEG7TM9PZDxb6YCW7PmPbh6SSH03OWPVX6Qit1puTkbuI3+UWqoZeFvoNT
 llLJOuL253EKFPgOyxbIYSJmyivRStAN+aGsPFvfmZmUfOfhRudT16G/uyh63Hn7Kfmsr5+yTw
 wE8=
X-SBRS: 5.2
X-MesageID: 38492831
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,173,1610427600"; 
   d="scan'208";a="38492831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIkjZNpJ4ffk85qnpWP2g7FEM7yWQDaJAqg1RyzZobrvnqXobDsVJ8dd6JMMh1iNtlw0Ytxo1uXtj/1g6QK8psIbmKaQox/SSd7MJ7qsJHzsnL8vhI2QiKMXR5oYBG6MDXs5eCcQH6tEx5/lQIg5pftNcu7ysz2l+TKk4hqVT2Jpm40t7600oUMF/LDap3sOtx/2BoNK+qEISeaDhzUtVoFyMZljzqdTBmIjNzrPK6514wpkK6SuQoOpG/i6P94f/UDPL/KM5/4ImIAEdb5INWJ6vGoMXYzaloQekN2OAw4fvmPyII+y4HjzuKUJwAMIr6LMb6xQGwxLGvWk+UHZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuRljw37Pm8v4CMER+HIra1Dp97uTC9tAyl+hBTWkwQ=;
 b=XnDTQSDhQ0rWE9UMKRANR+6qB090KUfBNade58VLJgQ6V55cGsQyB9gJBB76t9Sl59gb2O9DwyISQ7FAVUWYmbCaKD9ZVxYMXBY3uw8OSlviOuOiTbqisz4XEwleMqqU3M+nGZx9b3hdPfZ3P8uoha7UxTmh0bASM19md1IVpdwpR3rbR1uFHDgH5DugQM48FKV3pmot2/ENMEHYYCPwdTAMeLo4KzphFUThR3AZW35lxgGa9LFyHjbJ8ANxhQn/fF0QDk9fC9xH5dNPL8wLup44iKgjRAvzO2FRDfBGXgdWm7WdKwXlJgA1DX0zatKiPZcXBbr+ke2nc3oei1Fw9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuRljw37Pm8v4CMER+HIra1Dp97uTC9tAyl+hBTWkwQ=;
 b=IRtS8VKSrxWuc52iS7swsxvpCoSzWBIjpxPxHaDLPGBNU0PfQVwwuOZNYoNYPclNBL/HKgGAQFLBhWOuYY1RiJLqlVsG+tbIAZeNDtbJQc1HhxlC260H/4dDPXlkW+3WGjUYG21o4hFQpFXrVGVUN5tI94yx3OI3FPhMvgRSTX0=
Date: Fri, 12 Feb 2021 14:02:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 04/17] x86/PV: harden guest memory accesses against
 speculative abuse
Message-ID: <YCZ8YB+Y/HyHNOPm@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <5da0c123-3b90-97e8-e1e5-10286be38ce7@suse.com>
 <YCZbToiL3+Ji3y48@Air-de-Roger>
 <ece2bf60-4154-756d-df5a-1f55170f9451@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ece2bf60-4154-756d-df5a-1f55170f9451@suse.com>
X-ClientProxiedBy: PR3P189CA0069.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e06f31ec-bc78-4650-b406-08d8cf567383
X-MS-TrafficTypeDiagnostic: DM6PR03MB3916:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB39169DB1EFAB2713FFBE2E6F8F8B9@DM6PR03MB3916.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Es59jSdTn9+p6Q/GaJclV1gsNRAH9gpvrbvxmjAo+DcZIwS+IAXKklGQehh1dd5WNnbOcXtgQAK8Zrm5FkJlY25MPHVxXX5bw/orNtSioZ2SGnUxPBaS8r4cXMuOJ6+MOPO3sh33sqVfpgFA6tdd2dirQBXfolPj5Iq5Oq6AZSLE7c1nDehQiJ43dv+2OgtnnqbSgR2hYp7QiVaFCIMKwYEVbCrXJKO/fusehLk2P8A7AuqnT5FaPgL+wEQo1JM0LAa/D4MZ+K69FxcT6Oslx+i0v6p0G5+wAey0Q6Jip9b4QTjjzL4hiPc5EEOf6im748ifWi4Jv4/yIHQJs+ZMSufahfxg/8OE7TicqwFnnUvAgMTTLJv65avCzEjuxAFieL5CgiZby2+4uE1SAFMUTEpllxN1UUkHODcOm+vV16DyOspUEGZD3VttRI7orpI87GlqqS86ZetEsxhh6KHnEC27IvaBUH3BgNdQnkXtNlf5sscNpianx0H5IcfoxlVR1kcWucPjb3xHtWFFFOaEuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(66946007)(66556008)(6666004)(5660300002)(2906002)(6486002)(66476007)(83380400001)(85182001)(26005)(8936002)(316002)(86362001)(33716001)(54906003)(478600001)(8676002)(107886003)(186003)(6916009)(16526019)(6496006)(53546011)(4326008)(9686003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TVJoVEQzTXNPZGtFa3RQRUxqb1RFZ3FMN1hYOEFqdTNBRXk5aGJ5MlVpNnly?=
 =?utf-8?B?bGo2U3JjRGl5NlVWcUhzaHkxYTRGRkdyVFdQSjRtOS9CYThNQ3ZuL0lsTm43?=
 =?utf-8?B?OG5lTlpKTHFyZFRIZkFBYlJzM0VYcnVnQm5tcXBOR3F0c1E4ZEpWd3RyY25V?=
 =?utf-8?B?RUxhdGw1M0Z4Vkk0a0I0dExWMVA1MGk3VVYxT1U4Sndjem1adWZ5M3g4aTBk?=
 =?utf-8?B?MXJld1NjSDdXa1BUQlJnTEppREl1Z3R1MERPM3l5T0lwUGsvcWRkUmVMZXE2?=
 =?utf-8?B?dzdNR2diQ1hKcDZPdm4yS2txV0t2MjN4RjFoUjJ3cmhEd2lsaXJuRnAvQlph?=
 =?utf-8?B?VUVWSVJ1cUM3QUhMZG90c0VEZCs5M3pmcUkvRldIZHQ4dkVjM1I3bXE3MTV2?=
 =?utf-8?B?UnhEUi9TcmdBYkRUNDg1VUhHTjA4NTBScjhsMVAxWFk2MURibUt5c3JyOXFE?=
 =?utf-8?B?eTRWK1J6dkJIN0NLdXVhSXBvdHBTTlRUZFFpdUNUSjNJeXVnT0VUZnhiOTZB?=
 =?utf-8?B?T2IzOW1KeUlScXY4N2p0cHlNYU1mRGovUXh0emRjSmE5WjhKV1lwTWt5VW9m?=
 =?utf-8?B?Uk1hL056MFlPc2kzckQ1cXdRb0ZWejJVUExSZGZPS2Fab2loQU92cjgwb0NG?=
 =?utf-8?B?QzA3SlVieXYxWGI1ekJFZUM1WmI1dWZMMVhjREZVUHBPUWFLZkEvU09GNTlz?=
 =?utf-8?B?UTl3VHp0a2U1R3FaUU5yYk9MbHlWWkdja0NtMjcxUzdneXVPR2tjWDd4RVlw?=
 =?utf-8?B?RVhnWElZdnlqM3FCaTY0WWMyRkQ4clNRTzUyaHdkVlNPbWNram5HMjgzdlc0?=
 =?utf-8?B?KzF0aUJERkV4M2FYNHpsejlGWE1veXFPbkltR2ZocFhyNG9NcEhibVNMd0xB?=
 =?utf-8?B?T2d4RXFjdUdVK1hyWlVhMTF6R1NRa2toZW9nMVFkQ0U2RnVKSkY0Qjhmc2dE?=
 =?utf-8?B?bmxUZ2Vsc2VjQ0dvOXRwdFMyeWZnZHVEQ1VOR2RYRmVubXlIcDdybkdqZTJ5?=
 =?utf-8?B?Sk94STh0RnIrWmNjaGJtaUFONlEzLzF4a2RUSUZiaUxYZFNMbDlRWDEveHpK?=
 =?utf-8?B?aW9wTGQ1dUVYUng5Z1JGekkwYjc0VkxKZFc4N09CekVwSWJKNWp0ajVnMWJL?=
 =?utf-8?B?NVpjVDlQU29WUHRKd3lmd1V2cmVOY2JYOWhEM3pwdCtpYjUveVB6NFhZTGs4?=
 =?utf-8?B?cFo5ZU1KdGZicXNGd25CL3pBVHFlcWdmLzI2SE5iR3BZMzBRb0Ztc3RqSDBa?=
 =?utf-8?B?RCtSL1dFU0pWNnMzbGNqeTdzYUlod05aZlR6MlhxdnZuVmo0c3R1S241RzFS?=
 =?utf-8?B?c3VlUUVNenkrR1pPejdCL3FiNk04TTl3ckRsUzhKR005aWNEU2ZZQjdtOTdE?=
 =?utf-8?B?WWV5UlRlbDBKSmZLV3lFR2h3V05Fcm1mcjR6OHpWRVVFLzlxZGt0NEZSTTZQ?=
 =?utf-8?B?cE1wN0Z5UFhPSnBWd0RPMG1HekxhRjJVZXc2dzZDazYyZFRPUzNzN3BGWHFM?=
 =?utf-8?B?MElFdWJJQllFQjFFTlNnOEpxV1d4b29EalVLUUdNU3hpdjY4OGcyTFZlY005?=
 =?utf-8?B?OWVpRnF6Q2h5VklLYkZ1ejhJeW1yd2kxM1NnQnFXaEE3eU95RHJadGFxc3Aw?=
 =?utf-8?B?ZnVpYmMvcE02R1VvU3BZWEp3WVJYeTNFZ2t5S2JLakg5UE5KOUVtK1JBS2E4?=
 =?utf-8?B?UUNUc0MycDNXTmp6aFNOQW1NeDVLejI5eUxvSHNleGxzeXo0czZ3c0Q4VDMr?=
 =?utf-8?Q?g5bl+IkRZeRQvYcA6H4vcn+zrkqXpKzK/5o5VcI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e06f31ec-bc78-4650-b406-08d8cf567383
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 13:02:28.7363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyAndKEikIHdCkf/toqSucDC6Vgv76C4/IblTqaQd1/+moK95rETor10XZ20IUn7VyeBh/xXYHkoyXQDpWOoIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3916
X-OriginatorOrg: citrix.com

On Fri, Feb 12, 2021 at 01:48:43PM +0100, Jan Beulich wrote:
> On 12.02.2021 11:41, Roger Pau Monné wrote:
> > On Thu, Jan 14, 2021 at 04:04:57PM +0100, Jan Beulich wrote:
> >> @@ -94,6 +106,8 @@ unsigned __copy_from_user_ll(void *to, c
> >>      return n;
> >>  }
> >>  
> >> +#if GUARD(1) + 0
> > 
> > Why do you need the '+ 0' here? I guess it's to prevent the
> > preprocessor from complaining when GUARD(1) gets replaced by nothing?
> 
> Yes. "#if" with nothing after it is an error from all I know.
> 
> >> --- a/xen/include/asm-x86/asm-defns.h
> >> +++ b/xen/include/asm-x86/asm-defns.h
> >> @@ -44,3 +44,16 @@
> >>  .macro INDIRECT_JMP arg:req
> >>      INDIRECT_BRANCH jmp \arg
> >>  .endm
> >> +
> >> +.macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
> >> +#if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
> >> +    mov $(HYPERVISOR_VIRT_END - 1), \scratch1
> >> +    mov $~0, \scratch2
> >> +    cmp \ptr, \scratch1
> >> +    rcr $1, \scratch2
> >> +    and \scratch2, \ptr
> > 
> > If my understanding is correct, that's equivalent to:
> > 
> > ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
> > 
> > It might be helpful to add this as a comment, to clarify the indented
> > functionality of the assembly bit.
> > 
> > I wonder if the C code above can generate any jumps? As you pointed
> > out, we already use something similar in array_index_mask_nospec and
> > that's fine to do in C.
> 
> Note how array_index_mask_nospec() gets away without any use of
> relational operators. They're what poses the risk of getting
> translated to branches. (Quite likely the compiler wouldn't use
> any in the case here, as the code can easily get away without,
> but we don't want to chance it. Afaict it would instead use a
> 3rd scratch register, so register pressure might still lead to
> using a branch instead in some exceptional case.)

I see, it's not easy to build such construct without using any
relational operator. Would you mind adding the C equivalent next to
assembly chunk?

I don't think I have further comments:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

