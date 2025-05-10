Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9C1AB2488
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 18:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980680.1367289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDmgG-0007pl-N1; Sat, 10 May 2025 16:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980680.1367289; Sat, 10 May 2025 16:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDmgG-0007o7-KF; Sat, 10 May 2025 16:04:04 +0000
Received: by outflank-mailman (input) for mailman id 980680;
 Sat, 10 May 2025 16:04:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xf+W=X2=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1uDmgF-0007o1-Q8
 for xen-devel@lists.xenproject.org; Sat, 10 May 2025 16:04:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn20812.outbound.protection.outlook.com
 [2a01:111:f403:2c17::812])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61c2f2af-2db8-11f0-9ffb-bf95429c2676;
 Sat, 10 May 2025 18:04:00 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CO6PR02MB8804.namprd02.prod.outlook.com (2603:10b6:303:143::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Sat, 10 May
 2025 16:03:55 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8722.027; Sat, 10 May 2025
 16:03:54 +0000
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
X-Inumbo-ID: 61c2f2af-2db8-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5JHj/EfutujMkhdbOHhj+B1g+qkZhYOOYCQjO9oPaBdlGBPNikBzvG8JXS66T/UoCHVrcuf+7aSkFKIXnaumV2wnnESVVUxmsqfU3aMBfu1peVuf4dsvt4bnoqRurME2v5+szEGNdok39cbk7grE7TnaF9Xya8dB+cddIPSaYO5DHYtRCs25lp+e4qTJMcg8hCoKbBQ2WU/wKVbgAy0o0r95jOdbvNmPf/Pw+72AZ/JJUXkZe1hlhIScFNkYdmgGt7VLQB+Ttcdh/bT6hcZxSaR/Hhpj0Ur7JmLwWFu+X5Cblq610m8+tf2xcqDGMmOmuGbo+nZcWIp4iOIeqDLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tjs5AmFLgTWYdxmohOlPee4q0M1+ZDvdtNJL9cCkKtM=;
 b=lWwOxaiqOZURx41hKG8Q14Q1iyJ8Mj5gaKWPtK18m4JzlBe0N99f/GIgG8AvbskqrpHfnQSTx4eXFEEVzA9S5OW3Oh8B4qNtzVfLav7WFUllH6SyOlDVfUaAdWSV+AoxDRnDMOdkA32WuYlSUWG70jL+Fvp3h8hYUdnFuBdPmM0ZVnkID8v1uFg4j6zViXuJH2NydJDPQwuWoHYsIf6ZLVSI+ERcAU3niCNang3rS4D9DZuAt7vV/iM5IuAq10kJ8sc0JoPExfm7edSCUaXXsxMAOyOrm0ea1XiIVn6CI0zYYTToO+uvBCQSWwgKGUkvxgDX7wHJyvD5OH0+d3+XpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tjs5AmFLgTWYdxmohOlPee4q0M1+ZDvdtNJL9cCkKtM=;
 b=pYcGDj0iTkVy3A6I43utBkwj+Pxm5ifuYtYnEHBNkRj+iNji0CN4GZI2qX2H65XrCSTs0esX7mAClNWL/CaPmfUsdxMLZ77rlK4aAYpmPgVJvEPrLNgMpEmVLg7WyvrqJ+GYtMla96mbhZ6ke8zI3ytnc+8H30Gnb3QSiBi/yAVsSACKUac7TEPzeATYJHz/spRNecmMlVCKNUlfnFVgo2RWpGi2GNl7cjuZFwRM4QarahMgi74s/cMsmRHEl57TShoc3Y098MsfngUcpkeoRo5tolCs8rwjHVe/6TiHo1idmV/yUrUNLbMtMkIfyNlQJv0pVUDQusRnzHAy/Hx2uQ==
From: Michael Kelley <mhklinux@outlook.com>
To: Juergen Gross <jgross@suse.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>
CC: "xin@zytor.com" <xin@zytor.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Sean
 Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, "K.
 Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>
Subject: RE: [PATCH 0/6] x86/msr: let paravirt inline rdmsr/wrmsr instructions
Thread-Topic: [PATCH 0/6] x86/msr: let paravirt inline rdmsr/wrmsr
 instructions
Thread-Index: AQHbvmhEFeeiouIdcUmtZAu/e2cRwrPMDIRg
Date: Sat, 10 May 2025 16:03:54 +0000
Message-ID:
 <SN6PR02MB415797F46C1F8F7CCEEFFFE9D495A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250506092015.1849-1-jgross@suse.com>
In-Reply-To: <20250506092015.1849-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CO6PR02MB8804:EE_
x-ms-office365-filtering-correlation-id: fff4f73c-6843-4351-b608-08dd8fdc43b7
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8022599003|8060799009|19110799006|8062599006|15080799009|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vW/JLr2XhErjr0LSZjs/AQhpI6vRqhTp9yJZTyoS+c5uI1i+63qphDxRJoWG?=
 =?us-ascii?Q?8qo5H9CnZkNQiIb5INZn4mMtOjgIU3m3DPkK8TuWxWzExJeW9yuW9zmET1f5?=
 =?us-ascii?Q?Wf2IoIA6pbaH+PBj9UwFqWaTVVxabv4BntupXgTCCYPXtf4VhEjTlTX/1amU?=
 =?us-ascii?Q?rnJ73hdJd14DtLXNMGsB8Mt5Ui0y9SpZThcjWk8s4Nvsahm+PqGEacEfZ7/R?=
 =?us-ascii?Q?uJqhXM3csG2B493OaQ9HuZWakrUTRF1vYQANEntKaoruA1q905zYN8csIIM3?=
 =?us-ascii?Q?eW4LsmXYmO2J0GndJ6plBwVDtqApG9HNQO4q32A/hWOmNxByj6frXDlhLPlB?=
 =?us-ascii?Q?+WmFWP2Ui1/r3on6DZkxdEm00fJ9XOaDq0BZ872jc0bveyJwOtrjZY3Q5ugo?=
 =?us-ascii?Q?eff3l0fL44zrfbLnwEXqsU3i/0zEk4FtiwaN0RcC2Kb27O3Bu3B7XXrI8M/h?=
 =?us-ascii?Q?6BtzqMuv2HHS8H1PaU24eNrMuv8wiwCebwoh67/woEZYOtyVYhdtLanuVgh5?=
 =?us-ascii?Q?TKJvY3OvwJPe3hWFS7R9Lc4rD6WQcor7KZrtZGBlert9vzsfQaME9HtCrl0c?=
 =?us-ascii?Q?/Bhpjf32KXYAaCK1CBpOuOqBukkqhpIzvGFhqaMvEN+sv/8mmCH4HCCcInQK?=
 =?us-ascii?Q?Rl3QlJVF2b7mX1SJHEmmVcKkY0M7WXsQ04/m8mdEJof+GmH74T5tCItPSxbJ?=
 =?us-ascii?Q?+QZ/+AJmouNROpsYT4lfzBCHEY/InvUbSZmyrWqoM5ZpkJBr5fjCHlDv8A51?=
 =?us-ascii?Q?dVqNpVXXu0vYgdIQwvdMP/U5jIUEg+G4Vrr/UV7eP07dYjlgCDMeftVlXfJP?=
 =?us-ascii?Q?K1JoDey7uiQTct4iuR3BSZ1rD3xBeKMkaSTlQ17nneC2oEysrSXXefdDrcfS?=
 =?us-ascii?Q?gSVtUdJyL4LSXqkzljU2XiaRt2aKb8Ce6oLGC4UU2x2TkeoiUpD17E/Y0zQi?=
 =?us-ascii?Q?io6LZQLEV7sZZycrHSeklbu7CKg2r7OyvtXSKqh8JuhFJB6s+bnIxdbYyRhS?=
 =?us-ascii?Q?+ttahkmZuhcRwBRKIT/9HyJ8QwslgX5dtN0FD6JkMB12E2hSBe5AYRdYvwNs?=
 =?us-ascii?Q?YYivGUzChRP6mTUpvOZlEiq5+FQ9M5VBCt/wXCwb/C+4dY5WhsA=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wCl/61ooYViviLAx3f755R653/M30G6YIHnuI9Vh+zJQrQZskXgQYyOimGBl?=
 =?us-ascii?Q?SmDpMIU6NsqbDoT2PHdntrCZ5EMVjfS9NmUlXEikH95icX7CNjcbhRLgtJhS?=
 =?us-ascii?Q?VmfMQ2jgFwbucT2rfufJAMFiMQnjXtjW63jcZKojlrH42SeUZMHS+iigAD8r?=
 =?us-ascii?Q?2E6P2JBBExaU81q+MF3ScYG80YHf3jfljBl2MN30YpiwXpOY+vI99HLud87q?=
 =?us-ascii?Q?1iOvShu+5VVH3U6z4LckreUUYA/CE7aicyqo112RT6o/mqRd3MAGRPtDbISp?=
 =?us-ascii?Q?Cu7AgzqibHUU1pASe+H5YM2DTl6J3n/KKpfJ1ytQkcx251yU+tDx37yftoGe?=
 =?us-ascii?Q?XiVR+bgVVmy+NgWlkUtij4WxVP1V/TZW+dhWu05xdirtODoTwfX6hzj1iHm3?=
 =?us-ascii?Q?MxtNrumTZHNzMwbQX9Gy1tU6aIfacZ9/a2VLjqIQn4TUPuAZd2gk1mTG0Qiy?=
 =?us-ascii?Q?7tW9Mxm7DXIODDkCVR/JM7ktGFyHU65iVOKGyii8b+HBTfqZRaVnjsESsacR?=
 =?us-ascii?Q?Xa1G3uznk75VEiL8pj2ZRXa8PlIBh5xBihbHr0Rn2thP6i8KzJrC1EpStNK5?=
 =?us-ascii?Q?pJ7/u9eRbGINvbXPTmugsBSgpkOMWnorPRUq66Los9fPPwytEuUvQXZNEvzJ?=
 =?us-ascii?Q?3v33fk7WQAz49DPFWLdHu8CELoMCdnckQopYtUfIBMk2HY4e+FGdlCa4MEzi?=
 =?us-ascii?Q?6XYUMDC+8+/JMx88EDJgTQLB4B4WBF6sneKqYMTa495nNIFePqy5jXu00RUt?=
 =?us-ascii?Q?pQxL7ULRP6HD0uBqPBrit9sMy3v13XvcUHpjRJxcd38tNg+Fw0rs9Y9sUKsh?=
 =?us-ascii?Q?XNL6KXih45YVwf14F3D1Oi8hB7hn3XXV+daBNiBLbzSWAUTMfU9Ohh39B086?=
 =?us-ascii?Q?FGO36TzKxhaHBQaLRW4GLVOUibK7sdccK/KX7xPQnP7Tnq8RwxZ8dk7whe2C?=
 =?us-ascii?Q?L2/JqrUVQjFRUSOk3CC1UYXppKQgubhnsA6H0NK7NpNkyh2Fx20gvUY5GSyf?=
 =?us-ascii?Q?95Wk2RNdYtpj9pYuWlcvYnsSg4/rrb+jtis3YqRemrtBozP+JohxuGh1gZN8?=
 =?us-ascii?Q?QhJ4yBY4gr0dO+sXAYKNX7wIQuvhDU0tSDMvvQKPGfKABKpg+jqCwsdrGTwW?=
 =?us-ascii?Q?5s54TRNoTI0Mv1mxYhKixEP+aqb+2tMBvlFAlioDWiUfhmscQvFBkamy3Kyy?=
 =?us-ascii?Q?b+j5WbOqP6Y0g6c/lSCJQF4upo2B6HJTbCUO/uvX/ya2DsIU6cIWz5QClSw?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fff4f73c-6843-4351-b608-08dd8fdc43b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2025 16:03:54.8149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8804

From: Juergen Gross <jgross@suse.com> Sent: Tuesday, May 6, 2025 2:20 AM
>=20
> When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
> infrastructure will always use functions for reading or writing MSRs,
> even when running on bare metal.
>=20
> Switch to inline RDMSR/WRMSR instructions in this case, reducing the
> paravirt overhead.
>=20
> In order to make this less intrusive, some further reorganization of
> the MSR access helpers is done in the first 4 patches.
>=20
> This series has been tested to work with Xen PV and on bare metal.

I've tested in SEV-SNP and TDX guests with paravisor on Hyper-V. Basic
smoke test showed no issues.

Tested-by: Michael Kelley <mhklinux@outlook.com>

>=20
> There has been another approach by Xin Li, which used dedicated #ifdef
> and removing the MSR related paravirt hooks instead of just modifying
> the paravirt code generation.
>=20
> Please note that I haven't included the use of WRMSRNS or the
> immediate forms of WRMSR and RDMSR, because I wanted to get some
> feedback on my approach first. Enhancing paravirt for those cases
> is not very complicated, as the main base is already prepared for
> that enhancement.
>=20
> This series is based on the x86/msr branch of the tip tree.
>=20
> Juergen Gross (6):
>   coco/tdx: Rename MSR access helpers
>   x86/kvm: Rename the KVM private read_msr() function
>   x86/msr: minimize usage of native_*() msr access functions
>   x86/msr: Move MSR trace calls one function level up
>   x86/paravirt: Switch MSR access pv_ops functions to instruction
>     interfaces
>   x86/msr: reduce number of low level MSR access helpers
>=20
>  arch/x86/coco/tdx/tdx.c                   |   8 +-
>  arch/x86/hyperv/ivm.c                     |   2 +-
>  arch/x86/include/asm/kvm_host.h           |   2 +-
>  arch/x86/include/asm/msr.h                | 116 ++++++++++-------
>  arch/x86/include/asm/paravirt.h           | 152 ++++++++++++++--------
>  arch/x86/include/asm/paravirt_types.h     |  13 +-
>  arch/x86/include/asm/qspinlock_paravirt.h |   5 +-
>  arch/x86/kernel/kvmclock.c                |   2 +-
>  arch/x86/kernel/paravirt.c                |  26 +++-
>  arch/x86/kvm/svm/svm.c                    |  16 +--
>  arch/x86/kvm/vmx/vmx.c                    |   4 +-
>  arch/x86/xen/enlighten_pv.c               |  60 ++++++---
>  arch/x86/xen/pmu.c                        |   4 +-
>  13 files changed, 262 insertions(+), 148 deletions(-)
>=20
> --
> 2.43.0
>=20


