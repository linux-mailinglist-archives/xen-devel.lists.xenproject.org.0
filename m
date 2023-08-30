Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEAB78D68C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592988.925866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMDk-0000FI-0N; Wed, 30 Aug 2023 14:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592988.925866; Wed, 30 Aug 2023 14:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMDj-0000Bo-TJ; Wed, 30 Aug 2023 14:30:59 +0000
Received: by outflank-mailman (input) for mailman id 592988;
 Wed, 30 Aug 2023 14:30:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wycy=EP=citrix.com=prvs=599e76caf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qbMDh-0000Bi-Km
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:30:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2653ab2-4741-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 16:30:54 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2023 10:30:51 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH3PR03MB7314.namprd03.prod.outlook.com (2603:10b6:610:1a4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 14:30:46 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::7b93:d9b3:b043:8c8a]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::7b93:d9b3:b043:8c8a%6]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 14:30:46 +0000
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
X-Inumbo-ID: d2653ab2-4741-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693405854;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hfRGcW9HHNcjrVbjxv50n6A8BUU9ZAZmD5krWgh36g4=;
  b=aviBojdCqKqL4z9xOmrK/vSGxcnMlWJpzOZBVZk2vtVSZe71QS3/qs28
   43t+NqGrZpLvBLilTq1Lr/UcI41XYAwCs7nZXJh9552O9R4vU/uPvnmP3
   CLP+EggrROGFgPpYlu/L1303JyfvZSGqiFtk5ER6uePz3+gnwT/PPWkEC
   g=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 121554694
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ouvXcKJA/SVoKt7VFE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENShjIGn
 2JOCj2AOarfYGf3ftkkatng8khTsZDWzddjSgZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7gdmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5YAm1v9
 uY6eAoIVSyShLiTxbGKQLdj05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv237KSwX2qBOr+EpW3scdQj0TO9FAfFSM7ane6q/W/0HKhDoc3x
 0s8v3BGQbIJ3G6BQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY/LHLqzq3YHARNTVbPXRCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlRdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:kNbhkqGW4VvjuYg4pLqE7MeALOsnbusQ8zAXPhZKOHhom62j9/
 xG885x6faZslwssRIb+OxoWpPufZqGz+8R3WB5B97LYOCBggaVxepZg7cKrQeNJ8VQnNQtsp
 uJ38JFeb7N5fkRt7eZ3DWF
X-Talos-CUID: 9a23:1Q48l22YegsBMdG02yiNSrxfNcMpU37H7ifqJnSEGGUzbbiWeFXO9/Yx
X-Talos-MUID: 9a23:ws4PhgnWqIEoz2SAAkUndnptc/5S7L3zOnwBjKsrhOWFPyB2YQuC2WE=
X-IronPort-AV: E=Sophos;i="6.02,213,1688443200"; 
   d="scan'208";a="121554694"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZXOy3RHKEJhEE9SlFMC5ix2CGhTdm6JgDnJniT7wv4KgGhEei00A1zaS9/qgJjGU+PBKXAY6ujmhd0ZO2PzX41+Jm+izUNJdeEncHV/vWN+NYkPU8m9JEX+2h9guQHA7N5JG+iUQdIG9PPdJUl12/vLkhZoOXgTF0aROz3lvv2kwvC+ZmbE/hwa8kMKuu0yAAJmCc42vMthPLYLhhe3pw3nfjaDalZOyhJ0TUvwhZzjWl/DW0SsQxAHWlWGhSAyh/CclAlU5e6AkuKvj6CZzpm8m6gyHe8c/tiRhRZVNPel33RkLBSsS3fvTQJhKm4wH1cHtrYeuNCUdI3PlamLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrAntrUFS0PNER1y/IkKcmfhlTu6YHWWNlWMkeAMyPY=;
 b=d53GmECkc+gaR3eJfUJ7taJ3FZzbN2u3s+Wz7ZXa7c+H/7E9a7EFHHPTVfy1blJQbFzTNE1rWdPGiw1leopQX0jwoVpcvGsUzHEZGVhAUAtqlliHcFjlK4aOocHH5kHjTR49GrStyjiEjFesN3I0KGD/lbKMJIXTOc3zvKNbtmFUQzdxAd56Aj47r6uaP3Ie5eTYIHKPAXgvM/Muae3z/bLWMSo2buNI8JgQOMYiwuBk0my5z559P79LLCCXlB2Q3NOTwIEkgbAHlBnMjDGvEq6cy/dnwqoYfMNZzbncL0XMxIa/5HzEt4PktyVwo3KYSyuQIn1qKmu7H20RWGY0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrAntrUFS0PNER1y/IkKcmfhlTu6YHWWNlWMkeAMyPY=;
 b=A0sDdczfdgLhlDy8kU7S3mIc+tdtMgIDNkKwUCgx2vObv/jJyCsxmC8AjeTzViimW2FHCdBl7FNedauj2xf2rZgJd2CDngOwzPfFWnXlR14y/kQFEVfACIDsL6hSas5mRtWopLPXpbyui8uecbvaMHZxAJeZ65Zv+DBJLBmbxVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 30 Aug 2023 16:30:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul.durrant@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/HVM: correct hvmemul_map_linear_addr()
 for multi-page case
Message-ID: <ZO9Sj5YDjiKIh1G-@MacBook-Air-de-Roger.local>
References: <5B98D7CF02000078001E7AEA@prv1-mh.provo.novell.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5B98D7CF02000078001E7AEA@prv1-mh.provo.novell.com>
X-ClientProxiedBy: LO4P265CA0189.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH3PR03MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e357ca3-aeb5-4e10-3376-08dba965b2c9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9LmU2W4zkZWo03Cj6EAhlhYP6eth25qBvlC1kJvXWgCGu1unyK4FxGDxWtfUeKG9DrUxHeGFbj6lqTv6gGIWR+gsoGNEb96Wp/RdnR1MrsGlvJWAG7pkLVH4SGl7vIhzrhSbsBU0padzq/VSM4khFgMOA3EbOZZpmo/fhj3e7MJooynf7X6IHVZ+zxTH5SJzxSQnyNYmHgpJXrf5GeXbtM7TDInf9GbtxSNjb8G861AqojNMGOGZLjUnbLfN/ME82QUjcwbe/jgoCxkJNFI93qUG+3vH2psWElUOgLE3P6r/HXHLRjnHmRZ8gkfiL5bPwym3DdAgyGL6jsolw0XpXg4UZNH+YuXoZuUwFvd+st48oCiZwZFruEVvPbrz8+jOiHXV2Tp7QKprvYJj9fn5yML2vTO43Gbo13Qcpmz4dd2JQBr64qCh18ET9HZJzAEZ0IoljA0GLYgEb71rcD1ayXKubHjUbO7GntjoURGKSWqFQGPTUoMY50N40ZEpQF4hxZm5Sqkapki33OrrAUjxgwsl/82to1nUlbwx/chqbTqWUSqHUKUy8G0pVYq82MZHjkmstSBMPxFslElJjYlDyE6yOCcHzryHIDK6L9glM5AvwyR9RdRNs9nRcKUi+5uH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(186009)(1800799009)(451199024)(6506007)(6486002)(9686003)(6512007)(6666004)(83380400001)(26005)(478600001)(107886003)(6916009)(316002)(41300700001)(66556008)(66476007)(66946007)(4326008)(54906003)(5660300002)(8936002)(2906002)(8676002)(85182001)(86362001)(38100700002)(82960400001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmFkWnNlTXMzQVQ0dUVxTXV5TGtUT2VkWHhTbWJHYSs4ekN5MldpaG00Ykpo?=
 =?utf-8?B?d29id2tNMk4xekRnSHFWUkNDOFltdk5yWFluU2pZekhHRzlCREZuMU9LMzhh?=
 =?utf-8?B?a1RNNVR2aHBaMmh2Yk5aeGM2Y05MaFk3MW5CM0o3UTY3QytkcUhYL21MbWNP?=
 =?utf-8?B?cEpkK3FFamsrL3N1d1lpN0FPaWtmeXJFRmtvRyt4S1JuMytqaUtYQm02ODUr?=
 =?utf-8?B?TWVDODBDRnVNUm50L3dSMmVMOUIxbTRZVVlaTEFsUFVxa0QrbDdzRUlHM3Br?=
 =?utf-8?B?SmlaUlNLRC96QVZweEx2b1RrNWE2ZWo3bDUweG0wbnI3RndaanBEZUhyLy9k?=
 =?utf-8?B?dTNpaU9ENnNBRUF3eWVwTHcxZjIyTzdWcXVhTmg2UWF0YzRLUEl4K01NZmZw?=
 =?utf-8?B?R1FNTlo2a2pjeVFOUzIwTUpReHdXSTRFV05pVjFMOTVQemw3VjZCbDVLRHVn?=
 =?utf-8?B?ZE9xL1drZ3dMejcvOUZkVTRFYUZKWFV4aXVsR1dSSS8vNXhWaWZvVS8rNVpJ?=
 =?utf-8?B?Z2gyM3liMVRwN295T2xaL1cvVXE2MEk5Z0pPVjVKTE1Ua0g1NVNUanZ3Yk03?=
 =?utf-8?B?REFvVHJ4THFyd2R5Tmc0dHNrVTJLcnByWVdNOUJMY3loWXNNNzVWdDNSRUFo?=
 =?utf-8?B?K1NoOHdVMEVBVEJOZjRCVU5IN2FIMlkvdVBkamU3c2ZVNWJra3crWkw2cGEr?=
 =?utf-8?B?YVVKOFVjWWJmZDdSSzB6QVJRNmJtMTR2SE9FeWZQY2lGbEc5d21NUVA1ODZL?=
 =?utf-8?B?UUxSS2JOMG1LK1R6NStlb2xBSUhSM29zVWZ0WGtHd05pVWFUamFWZFJndzNh?=
 =?utf-8?B?OHpaSzBpMEJ1bGpUWEtuV1g2QzVEazBYSUpKL1dETWNna1ZvYlcvWUxmZUtr?=
 =?utf-8?B?UU5yWG9XYXZoZm5nQ0pQaW5vQUh1Q2hnbE8wdStGMEZyYzlyaFl6QXdML2Yx?=
 =?utf-8?B?UXc1U3VxMVVWRGYrUFZYbmE1U1dLWThvelpYRWl4a1ZYdmFDTjlhdHJhT21U?=
 =?utf-8?B?bkZoNmt6a20zdjM3QXZEa1NTNnlPK3NHbFVSb1ZWYlphR1h6Zmo1WmEzeVNZ?=
 =?utf-8?B?a1ZJd0ZuSUVIeHRtNzkrNHk0S0NKaVlCRkJJUisraVlxeEtEbkpSSHRpZy9L?=
 =?utf-8?B?SjFia3RhRTJqUGpUUzJyUzBZYjl3Q0lqS1pwUnBVanhad1Z3UFVPS0ZaL1JV?=
 =?utf-8?B?ZEVVK2NPaUdQaVNtMm81WWlIR1RsRUVxc2FnSi81My9zbUpVL2NGaUNJdUI0?=
 =?utf-8?B?eEl1Ui8vUWJxeTJMNUFRUXFVZXplUW5ydXhLRjBLRzFEdjI4S2pHSUV4RHFK?=
 =?utf-8?B?NlFKVm4wMTRIWnhSQ1NNemhZYWgzZUZrNHNuYndNeG1malQ0Mk5Cb2w4OThI?=
 =?utf-8?B?R2d3SHVqQ05kUUQxMDdXUWJTd3NFMGlGQVk1cE1oRkdRUG92UHliblJXNGdT?=
 =?utf-8?B?SlVlcEpwM05jQ2lJektiTXg4SnRxYlhmbGdTeE8ySHhreEVuY0h4cERJck5w?=
 =?utf-8?B?eG5JdUpBUitVdVRCcHFXUG9YUDc2RThRZFVKMkF6ZkFaZlkwN0IrSHgwaHZq?=
 =?utf-8?B?RDkyU0NObVBYazFva3F2MnJheWdFMGVIM2tvall4ZE1pSTJCLzZTdEZDV3lH?=
 =?utf-8?B?QStiZ21UekZicER4RHBKeGtEMXVjYWx5THJsTGwzRzk2d0JGblI5WlFxL1Bm?=
 =?utf-8?B?bUhvNXMvR21KRVNGVXZFWlRtYWZlTkhVYWxuR3F4K0hweWNoeHN3Y1pDZFdp?=
 =?utf-8?B?dGROcHJGQTRnYys4U1VsRW5pYW54ZzBCa3d6MThwWlZYN1RpaGdJMDJOM0Fj?=
 =?utf-8?B?YkluMlMvWFovMWM2R0E0MGFMNEROSHh1T2JMREp5NXNwZG9PMWlSdDRQR0Vm?=
 =?utf-8?B?alg0bXMyUGJtaFp2QU5ac05nYkQ5MnhlWFBUcFlNMTN2MmFqYVFpWVROWUtV?=
 =?utf-8?B?aWNjREJ4Zlh3bEJqcmpFWHFKYjdSNkRqNTJSNnRQaGdzQmtYOHBzeCthVmQy?=
 =?utf-8?B?Y1BYOERuM1FXaWpZU2o5ejBFcFJyc2VrMVNXbDBPbitOSjdGUjVmTE1XQ1VR?=
 =?utf-8?B?WlBFczd2Kys5a1dQZVZaS3VTc0hHRnpXN3lpdmhVdVRpOFFhUElCNUY3OTNC?=
 =?utf-8?Q?8t15YzlBAUrasNreqz9DxggtA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l+cNrlKGuh0BCCORnhek9gaSLrX/r4V1sTpRFK9PIuhJ5Ze8IJ5pCOAtWGiTo/NHLOviyjhiaVZpz5HsHHhvenAti1qXVdKgo7TJxAtSI8XZ0nwXGzzp1hAeTX4nwe1A/iNamxSVWly1NNIEFtxSPqbhq+fD2XJLUHzQhedSvYcNToN38HzrxGlGrIutBq0E8yFOB4cgJPHxkUWQHnssY6UK745jVXdn4HQ8SPc50lch/XzQf8J8u35RFsWnO/s0w0WdtiSfaJraFjb0gjfjUIMCln7tvYP2EhwX91PEclnw9QQEOk5Nszfy2Wm9BeGtYJqRaplpsz1KbQKtITT8Cy4sU/Dlllu4e4R2XGbvilhlJaklC8KvfoYzCGt9vauPrJwv3tEcH+oqHDEM745PVu9CFRDOekBXvo/I7WuHE1UjZsw3tx9lkzbYoy8j+Hs/8FjzGnNEZyYpgG0I5x44w3gfsCMxQY8vFyzrv+VlgVb62Yfg3RPmQsfOaRObXQLJurVHV4lco+lf5YotDhhvbx4IfccHj6dNeeLRC++a+QjIfbUNHUJV+1NQkuv7flN+R4ohI98cLb4Lt8Fxi/Z02kCNvFKQpqGZ7zYV57lDAGrAPZRk/sKOdo6+KnlIfPRulPxhoZbmHidisEhLYXK8YSfL0pJInizL5ywP9qRsdJ3n4YnR3ELN856QeicSV5+NEjsAUjSUo2PonPv5mw/hx1hTR1rv4pcNszlv9aoiHcxvvURFDp4xcfMKOMYKzS+g0dcLhd3xUGyWjB9yq4vwGy9/yw4mY0oTtIJrlZkRnqc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e357ca3-aeb5-4e10-3376-08dba965b2c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 14:30:46.4805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGvzPLilq/doyX+3MO4V7YbJTyaEhoQyQkGk2Ih2Tl5/+1tc1jRlHItlAL2aC6FXXFQ7HXF3F9onO209kskeNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7314

On Wed, Sep 12, 2018 at 03:09:35AM -0600, Jan Beulich wrote:
> The function does two translations in one go for a single guest access.
> Any failure of the first translation step (guest linear -> guest
> physical), resulting in #PF, ought to take precedence over any failure
> of the second step (guest physical -> host physical).

If my understanding is correct, this is done so that any #PF that
would arise from the access is injected to the guest, regardless of
whether there might also be gfn -> mfn errors that would otherwise
prevent the #PF from being detected.

> Bail out of the
> loop early solely when translation produces HVMTRANS_bad_linear_to_gfn,
> and record the most relevant of perhaps multiple different errors
> otherwise. (The choice of ZERO_BLOCK_PTR as sentinel is arbitrary.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -531,6 +531,20 @@ static int hvmemul_do_mmio_addr(paddr_t
>      return hvmemul_do_io_addr(1, mmio_gpa, reps, size, dir, df, ram_gpa);
>  }
>  
> +static void *update_map_err(void *err, void *new)
> +{
> +    if ( err == ZERO_BLOCK_PTR || err == ERR_PTR(~X86EMUL_OKAY) )
> +        return new;
> +
> +    if ( new == ERR_PTR(~X86EMUL_OKAY) )
> +        return err;
> +
> +    if ( err == ERR_PTR(~X86EMUL_RETRY) )
> +        return new;
> +
> +    return err;
> +}
> +
>  /*
>   * Map the frame(s) covering an individual linear access, for writeable
>   * access.  May return NULL for MMIO, or ERR_PTR(~X86EMUL_*) for other errors
> @@ -544,7 +558,7 @@ static void *hvmemul_map_linear_addr(
>      struct hvm_emulate_ctxt *hvmemul_ctxt)
>  {
>      struct vcpu *curr = current;
> -    void *err, *mapping;
> +    void *err = ZERO_BLOCK_PTR, *mapping;
>      unsigned int nr_frames = ((linear + bytes - !!bytes) >> PAGE_SHIFT) -
>          (linear >> PAGE_SHIFT) + 1;
>      unsigned int i;
> @@ -600,27 +614,28 @@ static void *hvmemul_map_linear_addr(
>              goto out;
>  
>          case HVMTRANS_bad_gfn_to_mfn:
> -            err = NULL;
> -            goto out;
> +            err = update_map_err(err, NULL);
> +            continue;
>  
>          case HVMTRANS_gfn_paged_out:
>          case HVMTRANS_gfn_shared:
> -            err = ERR_PTR(~X86EMUL_RETRY);
> -            goto out;
> +            err = update_map_err(err, ERR_PTR(~X86EMUL_RETRY));
> +            continue;
>  
>          default:
> -            goto unhandleable;
> +            err = update_map_err(err, ERR_PTR(~X86EMUL_UNHANDLEABLE));
> +            continue;
>          }
>  
>          *mfn++ = page_to_mfn(page);

I have to admit it find it weird that since now we don't exit the loop
when HVMTRANS_bad_gfn_to_mfn is returned, the item at mfn[0] might
point to the gfn -> mfn translation for the second half of the access.
AFAICT that would happen if the first half of the access fails to
translate with an error !HVMTRANS_bad_linear_to_gfn and the second
half is successful.

I guess it doesn't matter much, because the vmap below will be
skipped, might still be worth to add a comment.

In fact, if the first translation fails the following ones could use
the cheaper paging_gva_to_gfn(), as we no longer care to get the
underlying page, and just need to figure out whether the access would
trigger a #PF?

Thanks, Roger.

