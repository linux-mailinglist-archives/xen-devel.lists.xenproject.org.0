Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C583669C3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 13:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114405.218028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZApL-0005oW-Qq; Wed, 21 Apr 2021 11:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114405.218028; Wed, 21 Apr 2021 11:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZApL-0005o9-NQ; Wed, 21 Apr 2021 11:15:27 +0000
Received: by outflank-mailman (input) for mailman id 114405;
 Wed, 21 Apr 2021 11:15:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZApK-0005o4-0x
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 11:15:26 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3482a8a8-ffc8-42a9-b258-08e41c9b7136;
 Wed, 21 Apr 2021 11:15:24 +0000 (UTC)
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
X-Inumbo-ID: 3482a8a8-ffc8-42a9-b258-08e41c9b7136
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619003724;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bfAgSlP7XiOSEogiEYO0ymqI1ckJzivJgWtOpFXr0Ho=;
  b=OxYBkoNS88uwlGytCncDF/I0F4I/MZAkRHzMn1Dl6Pkwd8mNgR+BQA+6
   U3hO7f8PhBOO79oDczHkWXBfedMMksk3oIR5uYfThu5tVRT7J2u+SO/Vt
   HWrG5/Jx11S5z5veLAhqMQqrJzp1NbiWUutZQaKU5nM+RMI7KATEa1ZhN
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: E0XwPIk6eXVyBvSjrgZLUwsn/JhoNgd1zRE3rI/pvRdB0iJlZz3WkLJHNTzGsrocuaFSBUYiK3
 nnBB31zshAa/RxI7+hO3cBMroucwxXkLu3yswGPDtDDvyAyzMmlY7ZjDHetORqycSeyFr2amJB
 XgSXurjVhgiSRzf9YzrPq4KvJyOjiW75gwp57e4LrkvGRBIkHMy/G3FsgP5+DIDUpvwNC2lfQy
 QLlBL9G2f+RZXCSGdIZTJa/dVALAM0A+niNqoaJJXe2478t6HF/mDlL+fxBkMeCg09UpYcx5/H
 4YQ=
X-SBRS: 5.2
X-MesageID: 41901535
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RhW+HavOMtA4G/ubc0PrTpHZ7skCpIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde6+AqXYuKdg/gpWeuMcVe/ZLvqgeQfxHW28x88e
 Nbc6Z4AMDtFlQSt6zHySSxDtpI+ra62Y+yg+O29RlQZCVLT40l0AtjEAacFSRNNWx7LL40Do
 CV6MYChxfIQwV1Uu2BCnMIX/fOqrTw/fqLXTc8CwM68w7LtDu06dfBeCSw5AsUUD9E3N4ZgA
 r4ujH+j5/Dj9iLjiXy+kWWxJRQldvnxLJ4dbGxo/lQEBrAoEKFYIxgXpeLoTw6pvq+gWxa7O
 XkklMbEOlYr1/XY2GpsTvhsjOQrwoG2jvZ5nKzxVvlvMDjSzoxB6N69PxkWyqc0WUMlpVY8s
 twrgWknqsSNzzstmDBwuKNcBdQmk+9sRMZ4JUupk0aa6QyQvtst4AFlXkldqsoLWbBx60MNv
 JhN83Y7OY+SyLhU1np+lNix9GhRR0Ib267a3lHvsSU1g5fl2xiw30Zw9QCnmwB+IhVceg929
 j5
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="41901535"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byOswbFH0p/KjNNUJt/PC/xSjCTniQhGmuWEQYCpdsjVB0vHUH8I8AuTOEUPRpUdgP120fNlpPvMJLF8MO/UliDVnY9FZhj/t3z9kzbfzr8ZeAH8H20i0Gyi7ihniowaCjjjUcvgi3+yX+XDDPRj8BkROrYn6mox0QK9+T1BpnPekbvVxDRZm0AiECHbzROyWleKvcDo2Cu51xDFvoflz1JQ//2xHP2MdE2g44+Zr0cJMirS1nQGaJypmp4Xoog20F4l20Z0t1q0+8iI9imfwbZEs19wiOMGMVXoKzHMsm8IQlvyv9lCMdqFyXDTvpxZgZc1qrjOjCf3RSXWjZC/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYtVKgY6L2JsP/a0RYisySBjKZmx+Mtz3i+Bsh+uQeQ=;
 b=Y0RVZEZGbkwdYvnXTTvZF9opcTYYwAwWROQWOFdm/Da+FUA4R29ffCRbFYT3aNvwn7ohARkLZwDtEYICcI1QSPEnTQhbbgb4c/7OA6bipIoYy25WmkBlcc+gG7PoV3MjDUstK3gf6hkjCx+WB8/uOT13uncO4AUVbD7KgbHHcx9XBq2t36MNsahaH+f1HL3Jkt+qaNZjm1d6TOnGsuAHkmOnTwIptmm9+fYVCcAMwcFkgJoRRBpn8AgNvLBsZMkuxLXJwLlsoTFog4BFrs4LuOFxD+T0CdHn2smrvO2sfoL3wJ1moXiaYZFu0ZGeMa4CpdE36sFWbMnLQaiZrYlNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYtVKgY6L2JsP/a0RYisySBjKZmx+Mtz3i+Bsh+uQeQ=;
 b=NkKZlWlCahKt7xN5DqqWF2JaeXVAzjg2Rn3v9SEFp9pjldnTuuM3jB+DbdU+xwuxcaYlcA0wYqoCoYCDrcFxxucMSinY6Y4CnmhiHfvySLDeTq43XslYXhMk9dx5Saf5YtXazsNvNLl8NwGEuneamTHtGZaEGlr0BQecECtzD18=
Date: Wed, 21 Apr 2021 13:15:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
Message-ID: <YIAJP0SCq0nOKZVL@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <96cb4039-5f43-8eac-d855-c9f1587ed2d0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <96cb4039-5f43-8eac-d855-c9f1587ed2d0@suse.com>
X-ClientProxiedBy: AM6PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e93e47e-726b-4d4c-92b5-08d904b6c008
X-MS-TrafficTypeDiagnostic: DM5PR03MB2715:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB271564F3F34AA615278088F08F479@DM5PR03MB2715.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lf20rFurTOaswrnqTqMKa4GmWxUBBqFqHyMXD9g6Cu+lSb2f4KlM+5F+b+SK/SU6JqSlnzFTjL71tFXXQF1ciUzaAZ0EoXCecVcWNMj7rWMubm0NltJeKRel49d0j6Gnocz+9Jm8rNCJFT3YrF55eXWfS7afz4rZXdMF7FKH8WKmXCWa62R/ie17jU1+bAGixIpVJobpRLKmA0dI078cegi1xldMcKd6QnrmFMc4HAfV8U8shqkf2LaHn+aCZpiICz0QkkMiEz/zCdLa7mKk489SQWt0F/Sel90A3xKH4KnrLeM9prpkUwTyQSa+S0/b9Ti4Csg9IkHXjIHwZRZ6VnkqyIWcMiaUhiJnMmBKEu3Me3zdsUZsQiLk6jTaRdm/yeDNIxw34hGbSQlbIVWkVN07SuibtczBP9K8cQR2DdGEeXN+l4gIfDKzn1S9QS6wDJv5RMI8mIPOpk/ysjMYP0P6eSID5gpq/SRnhoztxgNfR32WBtxuexhpG4yhXrDK1NnylsWR4E8gflrsDQTE7cmlv6SmqNUyne2u7XbHSPb1w9kM/2NEF24kxpTMwctzlDtbUyccpOqgTt+ZS14FLlgUPZy/elP3DrUKEMVtMF4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(8676002)(33716001)(83380400001)(2906002)(478600001)(16526019)(85182001)(9686003)(4326008)(86362001)(54906003)(5660300002)(956004)(8936002)(6496006)(38100700002)(66476007)(6486002)(186003)(6666004)(66946007)(66556008)(26005)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXlkSndqUU92b0xNODRZTUlLQWw0WTNqR3cra0YrakdNZ1dTQ1BRSHg2VCtL?=
 =?utf-8?B?Ym1LWTlRa2svOGc0SjNDVVlaWUVEa1lGZHdBN1MyQzAvTWVjWmViMlZQb0R1?=
 =?utf-8?B?RWRaUHlVelYyaWZsWmkyZWFVQVpZdjNoc29RRkVvQ0F6WTlaeWlaSjJSTjhL?=
 =?utf-8?B?bG5xRUxqditJZTl2bHdBcHl4SSsweFRNK0JBbnBtcVhtZE82MHFPakxGMDlT?=
 =?utf-8?B?cDVWWHZQRFJZS0NSRC91c1dzS0tEeitxU1hjLy9zYnc1YitDRGFoMWZmM3N1?=
 =?utf-8?B?N3g1MUtsckpwUElzTllDb3JBRTlsWjdkZk81cUtXWm5iSzA1VzhxdUhhUGg0?=
 =?utf-8?B?eGJYalhrQkZxVEF0ckZKKzMvNHA2M0Zxd1RFazg2TStOWk44bUVmalduWDM1?=
 =?utf-8?B?NmNzY25jZklwTDlTZVdXMlQyaHppVGxxZ044V3ArTDdxcFlheWpxYVYrdFYz?=
 =?utf-8?B?d2dYTmRoWk03dzlPbXRvNE1yMjFmVXNVMGY2emRRNndwT3VSaGdIQ0V1VzVD?=
 =?utf-8?B?cG9DMTB4Q3VSYVk2VzdPSUgvOXBIRDV5WXFHdWFPdDZ3dXBkSk1wcllQcVVx?=
 =?utf-8?B?MEptYVJCR0phMUNDdlZFNml5VXFHSnEzazJ6c0FlN2xsZ1lqcnY0NE5MRnht?=
 =?utf-8?B?ODlDYjFPcEZSSGpIVlpaSEZkbEtaUlFITUw1K3djQURXeE5TVUVva2w5VzNa?=
 =?utf-8?B?SmpvQ3JMN0ZvenRTa2hTLys3QXE5VFdqR1UxZzRCK085d1lLRXlWMjQvbkhy?=
 =?utf-8?B?dko4cnZYZE9MSFJxbkZTaUxuSW1iQ3lZMFR6bTFxY0d0S0NMaFRkRStIMHJS?=
 =?utf-8?B?dWNwOU9CNnZ3Y0tYMUNsVE0yZUMyTndpRU1FNVFQc2lEamhLeWl4TDN3L25t?=
 =?utf-8?B?eFBaMWE1Z2pZVjNRd0dMc1N4bUxGS0EwMWlHRmt3dStVUjFPTFYvelM1VzlL?=
 =?utf-8?B?ZVNIVS9iRVdqZlJuTnFOdklHSlhkZ1dWZVlrd0daRHA3b0d1WW5sWDlQM2I1?=
 =?utf-8?B?eHhNamU1MlNtQS9FdWRRaDlUazV1TWdySUh6a3BEbC9odEdBN2VrZXIxRjRr?=
 =?utf-8?B?MitMeUZTWG1qQzNlSDBWOVN6azhRdERyV2lRVGlSNGcyQ3ZzdmhQNFVmR0VZ?=
 =?utf-8?B?NXNzQXVqWEtKQVE3UFp1Q3lyQXQ0QXRubjF2Qkkzc3VCYk9Zam5oRFZQS0Zl?=
 =?utf-8?B?NTQ4TFJEYzNKR3RmWmpwYWx6TzUyVEwxUVdzZUs3YkFpRkc3ZGE5YXJhTjNj?=
 =?utf-8?B?SFloUnlwd1hqeTdpMEp6dmV3ODRScmJzVUdGaWJvZC9QcThSNWtySHpUZ0JJ?=
 =?utf-8?B?WnRmcmRWN1VwaGxUZTUrbDVQa2ZMbjB3cjlUZ3JhU25GQ3VxS0tDS0lPNUVx?=
 =?utf-8?B?T3BvMndtOEx4R3VqT3diN1NScDUyVzVkYWFpRWNUTEd5RmtwTjFFT2JTNWxh?=
 =?utf-8?B?amdSK2FpL0swc2tOZnpKbkhsTjlmckFJVGM0VStBci9SMFJ5SkM2UXFkTzNq?=
 =?utf-8?B?TzhGNmN6ZWVLZTBmYk55WEdxd2JVbGVYRW9jM2VrYWFVSG5xQTlmTll6cWNB?=
 =?utf-8?B?S0ZkbktXaTJxdHhaem05VVZtWXJseDhYc3k1UjNBMHhkanNjZWFqcWNNeVY4?=
 =?utf-8?B?SkRhR0JzQ29aa0JtVHFTWkVCb3Zmd0ZBRmZMdHhsOTNZb21qekJhR0h2N1Vi?=
 =?utf-8?B?Vjk2WEE5YVNHb2RsSkUvc0NKSjV6a096M2Q4SGFCSTd2Q2dtYm1CWFpjR015?=
 =?utf-8?Q?WNgKbXxKizczFQuIctcf5lX9gMSQZQMP0rql8Vk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e93e47e-726b-4d4c-92b5-08d904b6c008
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 11:15:20.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDJzo8BfdJge4CgAfxzy+5Vxm1RulNFnumMZHDUkTCZcYNo+ejp0Knd8peZEuek6WeXBN/BNhygOYkYSvTHFGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2715
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:47:03AM +0200, Jan Beulich wrote:
> ... provided the linker supports it (which it does as of commit
> 2dfa8341e079 ["ELF DWARF in PE output"]).
> 
> Without mentioning debugging sections, the linker would put them at
> VA 0, thus making them unreachable by 32-bit (relative or absolute)
> relocations. If relocations were resolvable (or absent) the resulting
> binary would have invalid section RVAs (0 - __image_base__, truncated to
> 32 bits). Mentioning debugging sections without specifying an address
> will result in the linker putting them all on the same RVA. A loader is,
> afaict, free to reject loading such an image, as sections shouldn't
> overlap. (The above describes GNU ld 2.36 behavior, which - if deemed
> buggy - could change.)

Isn't just using (NOLOAD) to signal those sections shouldn't be
loaded enough, and thus don't care about it's RVA?

> 
> Make sure our up-to-16Mb padding doesn't unnecessarily further extend
> the image.
> 
> Take the opportunity and also switch to using $(call ld-option,...).
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This way we could also avoid discarding .comment for xen.efi.
> 
> I'd like to point out that the linking of the debug info takes far
> longer than the linking of the "normal" parts of the image. The change
> therefore has the downside of slowing down debug builds.
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -126,8 +126,14 @@ export XEN_BUILD_EFI := $(shell $(CC) $(
>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
>  
>  # Check if the linker supports PE.
> -EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10 --strip-debug
> -XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) $(EFI_LDFLAGS) -o efi/check.efi efi/check.o 2>/dev/null && echo y))
> +EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10
> +XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o))
> +# If the above failed, it may be merely because of the linker not dealing well
> +# with debug info. Try again with stripping it.
> +ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
> +EFI_LDFLAGS += --strip-debug
> +XEN_BUILD_PE := $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o)
> +endif
>  
>  ifeq ($(XEN_BUILD_PE),y)
>  
> @@ -232,6 +238,9 @@ note_file_option ?= $(note_file)
>  
>  ifeq ($(XEN_BUILD_PE),y)
>  $(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
> +ifeq ($(CONFIG_DEBUG_INFO),y)
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
> +endif
>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>  	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< $(relocs-dummy) \
>  	                $(BASEDIR)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -312,10 +312,60 @@ SECTIONS
>      *(.reloc)
>      __base_relocs_end = .;
>    }
> -  /* Trick the linker into setting the image size to exactly 16Mb. */
> -  . = ALIGN(__section_alignment__);
> -  DECL_SECTION(.pad) {
> -    . = ALIGN(MB(16));
> +  .debug_abbrev ALIGN(1) (NOLOAD) : {
> +     *(.debug_abbrev)
> +  }
> +  .debug_info ALIGN(1) (NOLOAD) : {
> +    *(.debug_info)
> +    *(.gnu.linkonce.wi.*)
> +  }
> +  .debug_types ALIGN(1) (NOLOAD) : {
> +    *(.debug_types)
> +  }
> +  .debug_str ALIGN(1) (NOLOAD) : {
> +    *(.debug_str)
> +  }
> +  .debug_line ALIGN(1) (NOLOAD) : {
> +    *(.debug_line)
> +    *(.debug_line.*)
> +  }
> +  .debug_line_str ALIGN(1) (NOLOAD) : {
> +    *(.debug_line_str)
> +  }
> +  .debug_names ALIGN(4) (NOLOAD) : {
> +    *(.debug_names)
> +  }
> +  .debug_frame ALIGN(4) (NOLOAD) : {
> +    *(.debug_frame)
> +  }
> +  .debug_loc ALIGN(1) (NOLOAD) : {
> +    *(.debug_loc)
> +  }
> +  .debug_loclists ALIGN(4) (NOLOAD) : {
> +    *(.debug_loclists)
> +  }
> +  .debug_ranges ALIGN(8) (NOLOAD) : {
> +    *(.debug_ranges)
> +  }
> +  .debug_rnglists ALIGN(4) (NOLOAD) : {
> +    *(.debug_rnglists)
> +  }
> +  .debug_addr ALIGN(8) (NOLOAD) : {
> +    *(.debug_addr)
> +  }
> +  .debug_aranges ALIGN(1) (NOLOAD) : {
> +    *(.debug_aranges)
> +  }
> +  .debug_pubnames ALIGN(1) (NOLOAD) : {
> +    *(.debug_pubnames)
> +  }
> +  .debug_pubtypes ALIGN(1) (NOLOAD) : {
> +    *(.debug_pubtypes)
> +  }
> +  /* Trick the linker into setting the image size to no less than 16Mb. */
> +  __image_end__ = .;
> +  .pad ALIGN(__section_alignment__) : {
> +    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;

I think this is inside an ifdef EFI region, since this is DWARF info
couldn't it also be present when building with EFI disabled?

Maybe I'm missing part of the point here, sorry.

Thanks, Roger.

