Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4E360A87
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111154.212544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX25j-0001Ci-9Q; Thu, 15 Apr 2021 13:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111154.212544; Thu, 15 Apr 2021 13:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX25j-0001By-5g; Thu, 15 Apr 2021 13:31:31 +0000
Received: by outflank-mailman (input) for mailman id 111154;
 Thu, 15 Apr 2021 13:31:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX25i-0001Bh-23
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 13:31:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a6c5009-3b56-43c6-8c24-fd45a1402bce;
 Thu, 15 Apr 2021 13:31:28 +0000 (UTC)
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
X-Inumbo-ID: 3a6c5009-3b56-43c6-8c24-fd45a1402bce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618493488;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=k20bNRLvp0VqnwJzPPXyOP2jvprM/TnY23QM4KXIT/8=;
  b=NdKw0XBiJz8jIFRDak4Wd/Czp4xPkBmS6Jp2vqFJAl2groXkGTHp5Rzd
   M7BX9acAiZ3xL+2hdZpI9mhUim4myC/cPUYdGJH9bAfnviGLU2I532RSP
   G8tvQtFAafj9dTDujxnKIQ+B5MI4WugMKoWg0MYkEXn+rOW1ls8AYhQgy
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lW3m7Vf3qU58HxPiHgqlmW60L8Pegctbcdon6jEu+k6chU3ExAJbPb4qgmAJlJNGS4HgGA5gVB
 YS3Q08Sl7wd9WbxPByoMd/hbSjlRR/ItaZgm9nLpO6efKWNL2DWsw9tOAWIX6Qr5ndHJyb2SD1
 auyXiL7xm3+4FZNxlLHCvPjdvAov+BBmPyZ0dTnei0D2M6s4HuTDYWpteB67RpKbtpr53rkcwK
 FoP8BuZnP2WserqjY95gTKGPYQy0rD3ciY+WOLJxIsOgyj49uQxj6/3HdstHnNvF+H7TZJGIJf
 vnE=
X-SBRS: 5.2
X-MesageID: 43154377
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FmM6iK6I+n2F1bmpRgPXwXqEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbDqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH7mGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnl4j41VTRTzbA+tV
 XUigCR3NTYj9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+2OVTat7XbnqhkFQnMiO7xIQnM
 DIs1McOa1ImgzsV0WUhTeo5AX6yjYp7BbZuCylqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VHAzuPFWB1wmk2/rWBKq59ps1VlXZYDc7gUlIQD/SpuYec9NRjn44MqGv
 QGNrCk2N9qdzqhHhfkl1gq6tmtUnMvJwyBU0gPt+eEugIm7UxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNS9spcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 r8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbchGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl+uoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdP3DXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 9DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEU4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9cbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IMSb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQTppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjBNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHEvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7NEBrIT8cSnyCFrHcsPyd57EQ+mfTzwRv/8SyW2mU8Dfe6GiUue5grZ/Wnq07qSPaD3M
 8n0ZYbve6sPn7wbdDD46fNdDJHIg7Sp2nzb+xAk+EigYsC8J9IW7/cWn/08VsC+jMUBsL9jl
 kfT6R2+6qpAP4lQ+UiPwZiumM0n9GOJnYxugP4AuUCbUgg5kWrS++h0v7tk/4TGUWPqwv7BE
 mH/wBc9/nDWTGf1bRyMdNHHU1mLGw94m9l5uWMasn5DxirbfhK+DOBQzKAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nCTdpyFyLK4L02GpR6qJcU6xMN8N19yxIlKXhKS2pOa1kTfsUDO+L30iur
 ctTz1ZUu1zzh84jIM21SCuSqv45mId+mEunw1PpxrKwYip4GDSAEdcFxbW668mBQVuDg==
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="43154377"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqeZngYPiL9uybW7DXHkbRSJ5PSNO/HeQD//SowSTMQpLYC2cxUVgxGVtTWFN+aSuUN3Co6jK7HMUMTZXMqAhaOgw9aUK1EWgDb2C5Q8kwH94NvhDY3c6rqSQpg+SCAbij7orXh/4CZMwIphvxpuDkfz/HbyUYykbXhYenmoxKZUVkphkbQwLwbuG37Ggl2eURJNyEPI6dgbTSTPiLS2IsQMgFvweAmXM0QmmE56nlkoYWQomFcaDR3sp/eZ8CKR0+CmXmQ7w7ttOuzl2VrUKKiC2poJAcX7mJU+DrOMKYXSb23xV4Z462qOUQvV+pezhprgLYzNwA96jfjSfzBowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mixK3H5yKy8vkzxJMSMbjHfRcDAWkTugFFXd2m9beUo=;
 b=ITGwLDkjr3kGVngnHe76xpNL+PMaBZN7tK6EBAJBDooyMhQ3dN+Z3EjAaoh14Nji+xX4mdpUSSBfR0gbCraD0Jceq7G5SxR7kAur5cZSEW6lRKD5PpWb9KOL1E2urHze/OGIJw8bdXr1AN273tRRD4wOMIwqIW4tbjBSBWgeN4tLvJMtX5+7yrANHUzLv9WS6RQutkeilwu4FKr3dHJsVTL20XB7ckyV4AHV0vYJco54zUTZwt0fv2QB7ayYxHRNI1zBJkrBJ71ta/ler5ZeV5jy0s/e5PVeB+KlKw55h0lCY7lLdbuJRICKTaQx/setrQQQ6CphQ5ZHwMECtJG7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mixK3H5yKy8vkzxJMSMbjHfRcDAWkTugFFXd2m9beUo=;
 b=TO+536uVL7tOxTAIhbh1iJXGxTNaS5gYTu/d3l6AT9MFrCE2i1YR4cUUjwwl8ZYLepTizt/oETF7XMkY9cxBj3nOlAOsEFzUY1msDLRsa0C7KKY7nUDy/RJ145CasDIsevgnEOjA6zwSVMizYfxAJXuI7Jq59DQrhNkMpFSlQP4=
Date: Thu, 15 Apr 2021 15:31:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Ian
 Jackson" <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
Message-ID: <YHhAJrTSMgLg/Bna@Air-de-Roger>
References: <20210414110433.83084-1-roger.pau@citrix.com>
 <20210414110433.83084-3-roger.pau@citrix.com>
 <29e8e2a4-3489-17b9-849b-ddfeed76451d@suse.com>
 <5fa30ed1-967e-dcd1-b9cf-110708f2c069@citrix.com>
 <af2cb854-ca3f-22ee-a7b3-8c24fdecfb7e@citrix.com>
 <12301367-e19a-5c89-5751-9937402ac099@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12301367-e19a-5c89-5751-9937402ac099@suse.com>
X-ClientProxiedBy: MR2P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71d8ed0a-8c88-477f-2c8b-08d90012c399
X-MS-TrafficTypeDiagnostic: DM5PR03MB2779:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2779724C4B653483BB45A64B8F4D9@DM5PR03MB2779.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0K+rb3a5cPUF9N6z3FImLzN2gthc7Y0kLwXF5x4OiXbMT68Qt/5SvNF+WRupwil8zmDM+dEm1QR/M2L4+DtUjOaG+6D2uJtBSzIdXYKoTQTp2+NtzTSyHpgauvCJ5xquQQcdgbXNBDIBQ1FwEJsZbfH36HIjBQHa49r/Dkqi9AJNi715QB4E5xziROgydtpfl7nhop8qYaLjsPXplBdas1cibjeBaykOXmOzmqLqkWNtJz/ZQqNbrFZ2nljm5qy8kHGYa/SXfe8GZq73uyiPZ/M+AMloLopbyBhuzP6lqHbxLwCkDrfr0uQ8oD6qI7XW5d40ASWSlQN/D68UkaGQ+jwrQGDC/rq9ubavaYcl8ilZ2eqLWG4Ah+E8WZ6z/3dOHt4nrVuV6g9cclmdkvqsf+kR3NfSH45pcDFjjWTyWCyzeEqXqBLidklBMBIR2Wa3kJTJhpxsX44qUWW3qAUpZKIFTrWego8Y1AWXF4Dh+udhAXiHwKLM/+ZnekIxPrQDXKHaG1g5/ve0kNyILyA2Fe2hAD4Xc/quAZLxh56FSR50pVauuT96W1HzZuHAQVOprEFrPMAbAe8l33DnKhIdUk78VOcVp6Q7Zte84cLvOIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(316002)(6486002)(38100700002)(8676002)(26005)(6916009)(83380400001)(86362001)(53546011)(6666004)(8936002)(54906003)(9686003)(5660300002)(186003)(85182001)(66946007)(478600001)(956004)(16526019)(2906002)(6496006)(33716001)(4326008)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1ZQZGxuaUljV2poTC9jeTdOYWVmdGRJeHkxM2YvV3RCSnN6eCtGR3g3cEUv?=
 =?utf-8?B?eGVEdzZKQjFQaUtBTWNQckR5TkVVUFo3Qml6a3NRVklHRjRkQzJycGxCUGdQ?=
 =?utf-8?B?c0FXcTlPQk1MZ2xVUjlIMFkyVXJ1Mm9veTBjUTQ2b2x5L0k3UjEyM2tYazF1?=
 =?utf-8?B?Q3V2bU1OTSttRG1UWERKaUJMYlR3RVNaOUdycUpINU1EMFpBSFJSbXZwdUtO?=
 =?utf-8?B?am5XNHFyWlJhN0V6cHdWY21kZG5LaUlFSHlDeGhmc2p0TjdtVzJBZVpkcHdY?=
 =?utf-8?B?NHBkM0FVbWplczZvaThYRnRMNi9GVnA2Z01NQ2VSdkNEYVhCV25NS0tvMnNo?=
 =?utf-8?B?aERCT2Z2VjIxVFpUSTVrMW9xYmYwc0NmdGlFRmlwK29zaXUrcUNNOFlmUGsv?=
 =?utf-8?B?WWx2SGV0TmVBWEJFNW0zVUtNUTJnVlpPczlPS2NsNWVuNlJuZ3I2Qk1QSUor?=
 =?utf-8?B?a256dnZUTExJVGtRcTlIUkdDZmk0UDVLM1hZM0w4d2k0c3RiV3ZPRVF5VFds?=
 =?utf-8?B?WDUvRStBUklaeHZlU2VtMW82WmFKSkc1VERyMmV1VU80eHgvVmwyaEpBVmFJ?=
 =?utf-8?B?dEg3TUxPc1JPdFh3MkFhYU5jdHh4d0VhTDdCRUxsYk16RmszTzhOQ2hHNXFV?=
 =?utf-8?B?Q2JCbEhERWdUMXR4L2gwdDZyc1FiL21VQWFzNXRTT1BKLzU5emZxZnkyaXpV?=
 =?utf-8?B?NHhmMWU2YllCUVd6ZkpKRStkSGVtc3RuMDhhVEt4OWZLU2FDc2YyMzlGRDVa?=
 =?utf-8?B?SUFZOE04R00rU2VoSnRFOXQ1ZURNYjhmK2wzYlFpNEZ0cUFyZUU4Zyt0TFMx?=
 =?utf-8?B?ZUJrTXRxbzFKWXE5d2lLVjJHcm1QTC9VMTVIMmhkd2lrTkF5SnpzSUxXT2xw?=
 =?utf-8?B?OXdIeGRhMkk5d1NSSDlvY0xnL0ZEYkZLdGJvK25mMnBGVkJIb0tRZnlxTXB3?=
 =?utf-8?B?aUlNSXUwREwzSnpMSTFSTk5xMWNwVFhjZEdxaXppclFDdi9oak53QTV3Sm16?=
 =?utf-8?B?MU93ZitYZnlGcnpzRnIwSHBDaTBUcDFpREpYMnMxcktIVHFnYWhSZ003dU5F?=
 =?utf-8?B?Z285RCsxMGJ2cnd4MTRxRnBQUjRaY3ZqdkJOUjZ1VVZFWkR1M0YvaHorSGJo?=
 =?utf-8?B?VFAwQjJFOGZQYkxRQlA0Z3hjZDlyb1BzMnM5TFRGdjJPL2Q2LzFPbmVYbDRL?=
 =?utf-8?B?dnpqYVgrUG5lS3J2NTQ0aHF3Y0xRMngwcEk0c2MxMm85MnZKMG96MWxKUnB2?=
 =?utf-8?B?YnBkMVptL3Ezbm9tVld5UWxCeE04Yk5TNnhSc3RlbWYyRlBQVlJudDNoRkJO?=
 =?utf-8?B?WG01TlBoY2MvUS80dHNkT08zeHZWVHU2YjJoTk0xV1FoMCtwVUIrMGo1d2lD?=
 =?utf-8?B?VmNGVHUxQlM3T2J2MUNNZUNXdStCT0cvQUFjRnE2ZytLeGtQQ3NXSTE4bDJq?=
 =?utf-8?B?MEk0cGtuQ2FIOXdjVGdGVFE4SVMxcEJPNHY2WU1aMmdEOGJIVU5WNmZkOGl3?=
 =?utf-8?B?VEtTRzRRMDkzU0JkdFE2V2JTYys4T0drd1hXMWg3NWVCcEErd0MvcnBqQy9k?=
 =?utf-8?B?ODhqdGpjNWVEYkZzcDZKNW9aZ1kwM2VWa3BVQUlLMXpZRkZhZ29MNDkycjFh?=
 =?utf-8?B?MWpZNk5yZ0RwYjd3UlJlVkFZYW1KRkNYcG5WZlFySktlem9yOG1hME9jNFhL?=
 =?utf-8?B?Vml6V3o0b1lpOXRxSld3L3RiSEZScHJyQ3pwOER2a3VFV3A0RFNVMzNxSmxa?=
 =?utf-8?B?c05HRUtzZWYwaUdpbXBlYkpocDRtb0dSMzJlb1Q0Y3Q3d1JjWWdPaUlRZjdC?=
 =?utf-8?B?L2RkOCtOLzI4aElJMmJaZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d8ed0a-8c88-477f-2c8b-08d90012c399
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:31:24.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RpL+D0zBMnMzS1h8BqFPwyFs1TXm8Qbu4avSQtWxIoobHeuqAeg7t4er30ZFdR+Ss+syHtG7NLWWXL3B9gk5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2779
X-OriginatorOrg: citrix.com

On Wed, Apr 14, 2021 at 03:57:22PM +0200, Jan Beulich wrote:
> On 14.04.2021 15:25, Andrew Cooper wrote:
> > On 14/04/2021 14:05, Andrew Cooper wrote:
> >> On 14/04/2021 13:57, Jan Beulich wrote:
> >>> On 14.04.2021 13:04, Roger Pau Monne wrote:
> >>>> @@ -264,6 +265,38 @@ struct cpuid_policy
> >>>>              };
> >>>>              uint32_t nc:8, :4, apic_id_size:4, :16;
> >>>>              uint32_t /* d */:32;
> >>>> +
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000009. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000000b. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000000c. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000000d. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000000e. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000000f. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000010. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000011. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000012. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000013. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000014. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000015. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000016. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000017. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000018. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000019 - TLB 1GB Identifiers. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000001a - Performance related info. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000001b - IBS feature information. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000001c. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
> >>>> +            uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
> >>>> +
> >>>> +            /* Leaf 0x80000021 - Extended Feature 2 */
> >>>> +            union {
> >>>> +                uint32_t e21a;
> >>>> +                struct { DECL_BITFIELD(e21a); };
> >>>> +            };
> >>>> +            uint32_t /* b */:32, /* c */:32, /* d */:32;
> >>>>          };
> >>>>      } extd;
> >>> Due to the effect of this on what guests get to see, I think this
> >>> wants to take my "x86/CPUID: shrink max_{,sub}leaf fields according
> >>> to actual leaf contents" as a prereq, which in turn may better
> >>> remain on top of "x86/CPUID: adjust extended leaves out of range
> >>> clearing" (both are neighbors in that over 4 months old series,
> >>> fair parts of which could imo go in irrespective of the unsettled
> >>> dispute on xvmalloc() - unfortunately I had made that patch 2 of
> >>> the series, not expecting it to be blocked for so long, and then
> >>> presumably signaling to others that the rest of the series is also
> >>> blocked).
> >> There is no shrinking to be done in this case.  The bit is set across
> >> the board on AMD/Hygon hardware, even on older parts.
> >>
> >> What does need changing however is the logic to trim max_extd_leaf down
> >> to what hardware supports, so the bit is visible on Rome/older
> >> hardware.  I.e. after this change, all VMs should get 0x80000021 by
> >> default on AMD hardware.
> >>
> >> (A curious observation of Milan hardware is that it actually advertises
> >> 0x80000023 as max_extd_leaf, and has two leaves of zeros at the end. 
> >> I've got an open query about this.)
> > 
> > Something like this:
> > 
> > diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> > index 050cd5713e..d9eb2878c5 100644
> > --- a/xen/arch/x86/cpuid.c
> > +++ b/xen/arch/x86/cpuid.c
> > @@ -311,6 +311,7 @@ static void __init calculate_raw_policy(void)
> >  static void __init calculate_host_policy(void)
> >  {
> >      struct cpuid_policy *p = &host_cpuid_policy;
> > +    unsigned int max_extd_leaf;
> >  
> >      *p = raw_cpuid_policy;
> >  
> > @@ -318,7 +319,18 @@ static void __init calculate_host_policy(void)
> >          min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
> >      p->feat.max_subleaf =
> >          min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
> > -    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, p->extd.max_leaf &
> > 0xffff,
> > +
> > +    max_extd_leaf = p->extd.max_leaf;
> > +
> > +    /*
> > +     * For AMD/Hygon hardware before Zen3, we modify LFENCE to be dispatch
> > +     * serialsing.  Extend max_extd_leaf beyond what hardware supports, to
> > +     * include the feature leaf containing this information.
> > +     */
> > +    if ( cpu_has_lfence_dispatch )
> > +        max_extd_leaf = max(max_extd_leaf, 0x80000021);
> > +
> > +    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
> >                                            ARRAY_SIZE(p->extd.raw) - 1);
> >  
> >      cpuid_featureset_to_policy(boot_cpu_data.x86_capability, p);
> 
> Well, why not set it to ARRAY_SIZE() and then have
> x86_cpuid_policy_shrink_max_leaves() (from "x86/CPUID: shrink
> max_{,sub}leaf fields according to actual leaf contents") have
> a go? It'll recognize the non-zero leaf ... Otherwise, if we
> gain a few more such special cases, things are going to get
> ugly here.

I will wait for Jan to post the updated version of his shrink patch
and then rebase mine on top in order to set extd.max_leaf to
ARRAY_SIZE and let the shrink logic deal with it.

Thanks, Roger.

