Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C261F2C0EBC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:25:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34689.65884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDiC-0007ZC-GS; Mon, 23 Nov 2020 15:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34689.65884; Mon, 23 Nov 2020 15:25:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDiC-0007Ym-Bt; Mon, 23 Nov 2020 15:25:04 +0000
Received: by outflank-mailman (input) for mailman id 34689;
 Mon, 23 Nov 2020 15:25:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khDiB-0007Yd-3I
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:25:03 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d762adb-0ce2-4a6e-bfba-7831b717e676;
 Mon, 23 Nov 2020 15:25:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khDiB-0007Yd-3I
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:25:03 +0000
X-Inumbo-ID: 2d762adb-0ce2-4a6e-bfba-7831b717e676
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2d762adb-0ce2-4a6e-bfba-7831b717e676;
	Mon, 23 Nov 2020 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606145100;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ib90u/e+eUtTaYO/KZU1Z4//0YdJtvxkIPd9eDEj66Q=;
  b=Hx/cwgfLnE92RFSDsgNRBb+0DWHqveHlnLJqbundSsq3k8ZHoXO2HHOZ
   +dWV0lUhdahCy/S7bD6ZoS7+ULUtNY0NokuV5k6lP/JJnCr12FDUeLZQh
   5Tb/ek8X7bgQeqXnwqCeUKDNup1HWpSlfTFUFKigHkoZ1e/aVkbDBywRk
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BrZe3/oKhLRGhrzpF7iAOMaLLlpsXVbDtuzsJ08pyHEWqTgvtCpQFH83+p1s6fVhN8ZOqk9Hc9
 8cWuxBFl8OaMvA+v5xOMiYW6+nOWZgtBRSNMZuaPK6s2XdUGvSyCiEtKLHZGnnPGXwvdltZYRr
 VcQ40IhLSESWvU1IFBG5o7rG1CDfBJ3DvoHkM5NfhaDhBTdpddaCgTpwc8G/rBFFxQxv+4nABZ
 vT/hCDlsdDqW5v7vyEAXH+2murT6iVpLZN/Eq3DxiPsiZQJsSFUxqjV8TIVGrYGslWvBiRbcJD
 ruk=
X-SBRS: None
X-MesageID: 32911325
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="32911325"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJ8sJQrgAFeNoUz2h/seYIafOurN4TyFZLWZi6o1Nwwl55MBe6VirYox4MI1eOvwVfcQ6mobrbV+sk2J0agOonC50k/0pIZXlCZkwGi6qERXZxZT1WRNByubtBsh5yLmyGMpgNa7BocI5pRSD8UOI6sgXSOLIF/MH+8EEYbOVoyv9DoMTiBBlmWxsey1R2CfaHGXX85xTWrYeDVzi+Cw8NlakPcnCJUwda9k8iu/nxRcJftCwZOCyKqkSMP+gTfLuljQE28lVsLh9IKQx0eGMBTRyNAYvfncDyuSe7VC+CW/rzhs+3p3l4y7hRk1xbmsFJyE4NPQSaqvs/5yYWymgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqa7ZKI8l4naPhLwRnvT0E+Zu0CVzlLTZRP53nFoKpE=;
 b=j7VlZDWEPebLOpNiixQ5BTnZQp44aOKMSwxFHbIWVrC5quXmoA/QdmnI//klQLZl1SQ/n2OrXmDi/2OVnlErvjpKXPZr7BzcjhIKYklsv3jC6bzapFPNtLtQ47SuEKjsuA4ekfurLjgMJPeIra+CyOLqPrhLpm3pCyKs2CioJHHgynsq9OgHryLnjHykOzvt6JqkajeFH6DI3gai3C83A98Zyu7PkZ4Q2/nbfoEdQfZ0duBPOTbr5csGLxc6YNKCy11YQwzNjie1ldmKMjDgm8WkJjE3IWMJAtcT3vOOSFxBDpHgeFa49lNa4hKCaiYbU+UppPC/Ao4+X/NlQp5X+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqa7ZKI8l4naPhLwRnvT0E+Zu0CVzlLTZRP53nFoKpE=;
 b=WHVGNvNjcc2l1CqESTHpkqE344dSC+zK15Q/6Pm3kjwlJtwzAfHgrMIt3aU5dsKpKW/fgBlMOkcL5UMq2Zkc+vaz0s/3KwSbqq0/cXqCyM0gujgOm9W1XoNt5zsKB7zNua88YiPQg9jmldjZdfDrkSoJO0uHttzjZP5Xk0qLz5o=
Date: Mon, 23 Nov 2020 16:24:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
Message-ID: <20201123152454.yjr3jgvsyucftrff@Air-de-Roger>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
X-ClientProxiedBy: MR2P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 250508b1-9116-43f8-2610-08d88fc3f015
X-MS-TrafficTypeDiagnostic: DM6PR03MB3481:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB34815D9260263FE3244C623B8FFC0@DM6PR03MB3481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojLH8U+xe+WSb9S6av6XpaNJUHrUcRjXrfMjtbYBCrcEz4sy9DS2gh5nHn1t/YJo4V+fmEQxA/zQnG9AqEloEL3HlDxFj62d5yw5SP/TBxmD/kzJx7UMWwU4jZ5+j4/7vwg+aTR14WohU2uVH9jXYXIa6krv7qErqA3uEpsmYzWVU1bkr+t4whQQUm2Fk4UIuWusKsXGHUmsxFO0XTgIxcLKJOPyjO0pUIedX8t2ZOPS2sEghqHFQFdPX7nyLF2Mh710atVh5gECzOiaEQ+GmKUpF/GjcJdWx3fN3c9+K1b7c8EJ/6MGe7HZs5cuBrPiYWSXqO42AYJAvK8Zg39fxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(5660300002)(85182001)(2906002)(6916009)(1076003)(956004)(478600001)(66556008)(66476007)(66946007)(6486002)(6496006)(54906003)(8676002)(9686003)(86362001)(33716001)(316002)(186003)(16526019)(83380400001)(4326008)(26005)(6666004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: oF1Etf6fow4FI6ydalvy3iYg85b69TzDHkM2ptuJ9qd8BIAIxy2XBJb3FIAV6sipssmfazlfkTimJ4rOjLHF76OSsJ3XqJrpEY+v8P6mTAifnClHgDq/Qne7GCBdq6fubOPnEnMXbzIHfNdBjWM2cflDMleqSY7DALOpOL7kD3zsQBV395SclQzBxWW9ZEESahcek7i8WxI2VMmaB9kV6+X3Xh+lsC/pDJJczxwEXlLa96h6Z716UdHBNLvRj5m2pz00RM2o97Ylf+w1tslbJc9OVNMIU8dGq2LEZW/bFq2kRwbNBsuH019NjuN7GFIsuky3L5lOA82mL/VuXYFkzeel0FCm+UopnLhbfrGZLaHBHB63KFBVa/U7t/X8FdIaaLqXPv/hMgBfxVIoKYyGZsfd0e3KQF/ERAqh2yy/IYzbDcs7XOvOhv/6y+TB14NNMwA1MpJh5I3PsMUqjvKP0e/FN5gt5uLUIiwGAesz/auPAPnTOwXGOLpTBlHOC60bKjfbjnkzgtPlhHZxU+dDdPfFnwVyR/dDNiVGvN4CVmBUrbaUi8t1uE/B0Zia154mMKDCZy7t+KSfrcv3bn5J3kn76CsnMZq7Nr+NLlIx8u5s8NmaBJHPHNhvAwSHxrxyOL1Icvb3dToW0dL+TxViK3G/uicl3I1UHHrtwrgAWZrHKcEaU2wbSz1lHwOyzZv6VXXWf3O+i1klsYgjkv44Q+PVDnhEfFuAP4lElw4WND+lNjcxiSR1VO7PMzA+j0Klo7y6PYXbYHlacwX/WDzQhLwdnij8qymgA9CdjHVqqRTFXt1vPTQPy32m5kMamDbFc1+kHXM90lOYpzy8YzVSCM5najHOpkQ9ybTBAvQgtrqdj187AcUCeufjlLjeJhoEF3g50G2ylbctDBY/CQt+0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 250508b1-9116-43f8-2610-08d88fc3f015
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 15:24:58.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBfqvtvH0wqd71LSBQ5B626GznajZPz44ptqbE8fYCsd0/QIO4XtdCOqsABDWh3AnY8A/PE3yV9T8xUD33Yutw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3481
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 01:40:12PM +0100, Jan Beulich wrote:
> Use of __acpi_map_table() here was at least close to an abuse already
> before, but it will now consistently return NULL here. Drop the layering
> violation and use set_fixmap() directly. Re-use of the ACPI fixmap area
> is hopefully going to remain "fine" for the time being.
> 
> Add checks to acpi_enter_sleep(): The vector now needs to be contained
> within a single page, but the ACPI spec requires 64-byte alignment of
> FACS anyway. Also bail if no wakeup vector was determined in the first
> place, in part as preparation for a subsequent relaxation change.
> 
> Fixes: 1c4aa69ca1e1 ("xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -443,6 +443,11 @@ acpi_fadt_parse_sleep_info(struct acpi_t
>  			"FACS is shorter than ACPI spec allow: %#x",
>  			facs->length);
>  
> +	if (facs_pa % 64)
> +		printk(KERN_WARNING PREFIX
> +			"FACS is not 64-byte aligned: %#lx",
> +			facs_pa);
> +
>  	acpi_sinfo.wakeup_vector = facs_pa + 
>  		offsetof(struct acpi_table_facs, firmware_waking_vector);
>  	acpi_sinfo.vector_width = 32;
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -174,17 +174,20 @@ static void acpi_sleep_prepare(u32 state
>      if ( state != ACPI_STATE_S3 )
>          return;
>  
> -    wakeup_vector_va = __acpi_map_table(
> -        acpi_sinfo.wakeup_vector, sizeof(uint64_t));
> -
>      /* TBoot will set resume vector itself (when it is safe to do so). */
>      if ( tboot_in_measured_env() )
>          return;
>  
> +    set_fixmap(FIX_ACPI_END, acpi_sinfo.wakeup_vector);
> +    wakeup_vector_va = fix_to_virt(FIX_ACPI_END) +
> +                       PAGE_OFFSET(acpi_sinfo.wakeup_vector);
> +
>      if ( acpi_sinfo.vector_width == 32 )
>          *(uint32_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
>      else
>          *(uint64_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
> +
> +    clear_fixmap(FIX_ACPI_END);

Why not use vmap here instead of the fixmap?

Thanks, Roger.

