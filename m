Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E85363DD3
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 10:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112709.214960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYPSc-0000E1-QC; Mon, 19 Apr 2021 08:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112709.214960; Mon, 19 Apr 2021 08:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYPSc-0000Dc-Mp; Mon, 19 Apr 2021 08:40:50 +0000
Received: by outflank-mailman (input) for mailman id 112709;
 Mon, 19 Apr 2021 08:40:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2xPN=JQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYPSb-0000DW-6J
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 08:40:49 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 199c554f-ac9a-43a3-a809-fbc8fddb458e;
 Mon, 19 Apr 2021 08:40:47 +0000 (UTC)
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
X-Inumbo-ID: 199c554f-ac9a-43a3-a809-fbc8fddb458e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618821647;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Yt9mOtrVJgub3xZSeJFeYv+LL9w6HVYBBgwiR5K3YyQ=;
  b=GLRyvH1c9PLx1QyjCR/Zmv9v6GiF+EfdMR6BZhpSokf/X9aB06MOgjiK
   QfVgDAf5qTv3ASdKz6vJdTIjuCGZvFnjDfi5bJ3imp1VBKeaXq6t90qOo
   yye7OyXbezWDXYX0VHg0tsQjPWftvc8heiPjl5MXpTsNMhc5b9zqO5i8L
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6B/JiIUQhOJSR15BmUZebsFPhJgD8Ub/VwG3v8K3VIKzOFaVIizwuWnfFvy1kov1Bj8IGfaIiG
 rY96Brl+f4kmH2eRoMxdRbp3UyJFLJ0/5X79cj72/46o4tHR6d0G6Otpy+KQmpcu9pHWj2lIPI
 emRqEk1KeylCt391y7UQ4AsY7nZzYHd73OMCuVvVDm7ZPWXBdQBP7WegrYJCFhIMs8SzSvgR/o
 Er9OapWofvsEARSqqOKSvqm9bpG7areXZ5pbyp8J4bSmumd31+YmNCU6Em+uW+p62zCjYzlBq8
 DqA=
X-SBRS: 5.2
X-MesageID: 43351947
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VrOMPaPx8Fay6cBcTxv155DYdL4zR+YMi2QD/1xtSBBTb8yTn9
 2vmvNe7hPvlDMNQhgb9OyoEq+GXH/a6NpJ8ZAcVI3SOTXOlUmJCMVZ7YXkyyD9ACGWzIRg/I
 ppbqQWMrLNJHdgi8KS2meFOvIB5PXCz6yyn+fZyB5WPGNXQoVt9R1wBAreMmAefml7LKE0Hp
 ad+cZLzgDIERgqR/+2G2UfWKz7r8DL/aiMXTc9GxUl5AOS5AnYi4LSLh7w5HYjegIK+5gO2y
 zvkwv15qKs2svLsCP05ivowLl93PfkwttHLsSQhsYSMSWEsHfUWK1RH4eskRpwjOaz6Es7sN
 SkmWZdA+1Dr0n/U0vwgRzx1xLu2DwjgkWStmOwsD/YjuHSABcZYvAx4b5xQ1/ixGcL+OxY6u
 Zt2VmUspJGZCmw5BjV1pzzeDxB0navrWFKq591s1VvFbEwRZV2toIl8EZcAP47bVnHwbFiKu
 VoAc3GjcwmF2+yXjTctmlr9tSmQm4+KBeAWlQDocyYyVFt7QlE83c=
X-IronPort-AV: E=Sophos;i="5.82,233,1613451600"; 
   d="scan'208";a="43351947"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAaT5tfj9uAyl8yKWuIymw9ZvcTed47W1o/+/06/tSbj71cWyWhEG7r0PYqxmTl1XJc/uX7b5NHDxiPkdTqMldN1ZXbB1wqGPSLQDEIruvUwHy1BYJ+5w60OE6bEKzJOeg7n7EoqiJgRNvoBFlW3FNfA5fHV66fnwK8QirVETl1e36dBAm7YW3uCChElIkAuUs8XtykwaH5VNDA/RReOBqwQpQrc/yb9PBNV3cVw5gFxkk9yvVcVQEmnWa34bOEb2XN7Xm377BjZb5Q22h/CH8q2auEtSWI1psvqYtB2aPsYab2Ijz/O+slhqVA1YL3l9CdsiDU/t222qeGHB/CR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qS4qYbsKAhBbTBxZ05PrDEpCYVl/1g8QT1mGJsea8+M=;
 b=LMnm+L6t2al1raxSwhLu6cw1hLFIkw0+LCxt31kIf1mMSZv1uiFdgtAmgnqsoxiL4BjY2bJRcm08kd3XsXAZwRqkH2rkxK90sZhc55JqJpcIFyXPhxYV2eic6sganPUJGPYm7Wd44v3Bs73QtRqEOfP0cDkHC7quprZfKJ89v1yBnQtpUVCNOg1q7pdSAhGKz49OP2G+gkGdAVd+YW/K/aC7UOOTJJV1DxpqgjW0V7JXmMRzHtEbk0Rpj/Jqh0RVNvGVLbPJsa9j2YYngx/M9aPtwnP+oM7bUmZ2tzTL5cnHVP80kDH6eIzANhfgEu8oVW65RLfdZ1m+Zjs1ofT29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qS4qYbsKAhBbTBxZ05PrDEpCYVl/1g8QT1mGJsea8+M=;
 b=FDewZpzI0RLSoTaLYgYY8UdBdCjDNno2cXXLXvEMSEWhYKEncFK1h2CsaG5Kiw5AqcdcS4NkGDio8DpJ+jFzokZreJAY7og/XnSdRJNDkMNmPGg0qLdVhESLSK8GmiBY+Mx/SHIc/wi22FbIxxhylKXccwZYCK3Py9rbmnXN484=
Date: Mon, 19 Apr 2021 10:40:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Message-ID: <YH1CBP8At7lVoHCz@Air-de-Roger>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
 <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
X-ClientProxiedBy: PR0P264CA0233.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90916fed-9bf9-4cae-9629-08d9030ed09f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB45397FA6C33E1B99F26E86F98F499@DM6PR03MB4539.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dYzP3Y5JrsPAE4/kfPNQdHAAEDiYwf22a02eIDaRrZ4iS7fr8GWIuFGVVaJ/KMR/80Cmd48f+Cgfx2W254Ic9vSDFqYhzQVez9pkeHX94HDnGTUEGLRIKAj1RFRxyjq8nHtWOURCGxqCPcKYLl6aehbk3aT5gs++5JleXaUOHmq9aKhSh8HBPn1PMq04ffqW16CmX7TUU8WZPQsezHrkcYFp3XLrvLDMpUyBeUvAfq1jzFvvgqiXfF1uCQpl935BjwZ5L2SfZpowzBB8OdIK9euEgvFwR7n8+HE/Y7HDi9K3Yg64w1FdREMyLQYfqaEmd0t4pESu1hgwLQl40Vez2EfvIhDLU62dSYYpadB/tiW/ptaRiWobteIhJxSwTPxPdWywyxRvVICP/SoOJyOJVKugmmSMt3ZJY0mv3dooabL9yJIfMLHfAaDe/jvneDY7uwfZZy85ey+z/hONaEuaJbyW0yeOd7FnrQ4EYkaeKk8qYCMjnjzzQRJtx+623dDEeT2EY6xLanT+725Nx0Gv19c/GJn3fMOFiuA+5wfw5aMBM8iudbHm2RsbVx+5IO759QGgKfXTtC+UABIwxEHWAhjgmBDxsLUwmGNPdfuxYvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(39850400004)(376002)(136003)(366004)(396003)(2906002)(83380400001)(186003)(9686003)(26005)(316002)(16526019)(956004)(8676002)(54906003)(4326008)(8936002)(478600001)(33716001)(38100700002)(66476007)(6496006)(6666004)(85182001)(86362001)(6486002)(7416002)(66556008)(5660300002)(6916009)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dFozM0VpbnRtcUFaK2N6aC9wY0I3c1ZUcWFCME10ZktFbDUzUy9EVFhlaFlV?=
 =?utf-8?B?NEhxeStQa0h2QmNoV0d1VE4vSzhJcXhJNXZEYW9BODNjd1VYbmtVby96ZlEx?=
 =?utf-8?B?MXYvbkdPZDJkMCttUUd3WVRJcWYwQ1lNNWVTUHZmaUFERkp2blRFZkROQXNJ?=
 =?utf-8?B?TlRqdHAzdU5vQ0tvWGFSZFNwUFFHbFNDTUpKR3BYOHZZUmxOK2Z3RXdnZ1k0?=
 =?utf-8?B?MnJnbHZWcnJlN3F4RWg3M29Ob0s1T1JmbW9mTG56SFVVOEpQMjdYQWF0cy90?=
 =?utf-8?B?UGt2dkFtVjUwUmkwQlkzb2pVWnpZaU1QbGVkZ1JzdjFUTkljU1VaZU9zTmV0?=
 =?utf-8?B?RVRGK0ZBekphVU5wQlV0UjM0eXdmZnA0RG5HUTBaWCsvK1pLVzl1Zjhod01P?=
 =?utf-8?B?SUkxTEUvU0FsUjBqekRKdHE4RXI2WkZZNTdET1p0eis5cFBaVHhBTi9qVzlR?=
 =?utf-8?B?R3kzV0czNVoxZG1DZVhVaUxyamZTK0J5MEhMTUZZU1I0Y0UwT2sxYy9lZWFQ?=
 =?utf-8?B?Y3lFbkVwRDdBMVI5QlNWc2diVlVBMlZwak9CamhsODdiNW9ydVo2Sk1uclhR?=
 =?utf-8?B?Z3VzTUpNSHlzeVEzM2s4K0d2ZWZjb0dsN2xWaFNKeE5XenVUMzAvQkZQRnUv?=
 =?utf-8?B?UDBNdG1VM2VQdXoxblgyVUl4VWxUOThueERWRXhDVlJSUGxGUnJxY1N0bnZZ?=
 =?utf-8?B?QzY3WUFTNWdTMFFvVDNLbitlZHU2WE9aaFRFNGVWalg1L2IvSjgrTHlLTGVi?=
 =?utf-8?B?OXNVMk9YdG5uZ2VScUUzZnl6azcxMDdzY1V3Ui9SNGc1RjZrcVJGSDVMV01Y?=
 =?utf-8?B?Q2NEakZoSEwvWU1uaHJqOHVtQWlwY1lpZ2NqU2JzMEtwS1pTbCthZXNYNXUz?=
 =?utf-8?B?YkhnTUxaY0JyeTk0ajN4YkVTamZVR2taMStLc2YwOFF3Vm9mMStXNUF0N05C?=
 =?utf-8?B?UlhYY2NSQlQ4YXFyeUNxOXlpRllTM3NVT2lianpwS2oxa3dHZ2R1L3JPemV5?=
 =?utf-8?B?TGwvWlg2OHNoL2VjZ0FQYlFDWVRWSnVGT0p3T0lhdm8rT21lVXhXR1pnZTBj?=
 =?utf-8?B?Zk8vbjI2cmw1djJ5amFyNFhqRFFNMld1eEQxY2cvWWM1UWZabTFGbTdXRXFH?=
 =?utf-8?B?Rm1xclNVamZMbEJaMTd2RXFra3RTNGQ3K0dKdjBlZHJyOC9CSzVuSVRLMEp3?=
 =?utf-8?B?a2J3dEtCNGhnL1VRZ1Z0UUtpT21PemFML3preENBVXVQbFNxSHp0dHI3VDNG?=
 =?utf-8?B?OWFPQmh2ZTl1UzZDQ0w1MWF0WStUUmh0eUQvTkR5Z3E2THFObzgwM3ozWlU2?=
 =?utf-8?B?WlRWa0R3MzNtbVpvOG5kRTJsRDRhcU52dThvV2h4ckRRV05oR2I5SVJRbW5r?=
 =?utf-8?B?RDNyZHFRVGJtWUd6VFBaNEV3MGZuRTBOc2o5bGo2Mjc2RytuSzgwRXgvSFlM?=
 =?utf-8?B?MWJORjI3T3RjSWhCdXlCa1ZTM0JVZitYQ3paWk1MSHFWbVFTR2xkQTBXSm1p?=
 =?utf-8?B?dGRRTCtuNFNJdFQzNEpKVngwZ0VzejBKTGdFbnVHelFJcExqenZBTUczTjZ1?=
 =?utf-8?B?dE9oZnpIdGQ4YW9Ea0pmSkhsYkhjVVpKc1J1OVAvVU1kOURwZ2UrYnpNY01k?=
 =?utf-8?B?OTkzdWhEb1Q0L1ZxZjd4RnFIaVloTkFtc2JjVnRzdjNJWldmVkMrZVAxalRk?=
 =?utf-8?B?NzVCQ2IrcVZnTkVxbEZKSEVpWnJuaE0rT3FJc1BYMDh2T0crci9ucVpUODM4?=
 =?utf-8?Q?cYEQRuwej3uq2lExc5BKelohsDDpuAg8GdKtUsc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90916fed-9bf9-4cae-9629-08d9030ed09f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 08:40:41.5634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Btp83+SL0cCy6CbLjPrV+foeZV214vPnfXKibcNFPcOkRf1dSzN4ZehMgG4zeFHA1v5O2NsTSc/H9K8LF6merw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4539
X-OriginatorOrg: citrix.com

On Mon, Apr 19, 2021 at 07:16:52AM +0000, Rahul Singh wrote:
> Thanks you everyone for reviewing the code. I will summarise what I have understood from all the comments 
> and what I will be doing for the next version of the patch.  Please let me know your view on this.
> 
> 1. Create a separate non-arch specific file "msi-intercept.c"  for the below newly introduced function and 
>     compile that file if CONFIG_PCI_MSI_INTERCEPT is enabled.CONFIG_PCI_MSI_INTERCEPT  will  be 
>     enabled for x86 by default. Also Mention in the commit message that these function will be needed for Xen to 
>     support MSI interrupt within XEN.
> 
> 	pdev_msi_initi(..)
> 	pdev_msi_deiniti(..)

I would drop the last 'i' from both function names above, as we use
init/deinit in the rest of the code base.

> 	pdev_dump_msi(..),
> 	pdev_msix_assign(..)
> 
> 2. Create separate patch for iommu_update_ire_from_msi() related code. There are two suggestion please help me which one to choose. 
>  
>      - Move the iommu_update_ire_from_msi() function to asm-x86/iommu.h and also move the hook from iommu_ops under CONFIG_X86.

I would go for this one.

> 
>       - Implement a more generic function "arch_register_msi()"). This could call iommu_update_ire_from_msi() on x86 and the 
>         ITS related code once implemented on Arm. Introduce the new Kconfig CONFIG_HAS_IOMMU_INTERRUPT_REMAP for this option.

I think it's best to introduce this hook when you actually have to
implement the Arm version of it.

Thanks, Roger.

