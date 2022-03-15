Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6BC4D974A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 10:13:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290693.493097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU3Eq-000389-Ns; Tue, 15 Mar 2022 09:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290693.493097; Tue, 15 Mar 2022 09:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU3Eq-00036J-KD; Tue, 15 Mar 2022 09:13:08 +0000
Received: by outflank-mailman (input) for mailman id 290693;
 Tue, 15 Mar 2022 09:13:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAQZ=T2=citrix.com=prvs=0668da279=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nU3Eo-000364-HT
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 09:13:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d2ececd-a440-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 10:13:04 +0100 (CET)
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
X-Inumbo-ID: 1d2ececd-a440-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647335584;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nytKIHuNmeKDGtWkw17nH15DWyH3LYfdFWJ48+7Qaqs=;
  b=Qe5QbQMYZdYdShWXhnRqPesRmf+tUT06GU906Msg9TzCPv0PHExVZUJ7
   GtsMr6auxencnzdo0y+roB+ivR9MEIiUR3CfUUcN1YNBtG26yOEQn92te
   ZL3NZ7oPK0UuQDkSd7wRFTX4PNM1Dqp5qPPolJ9eD7z/qY83CuoWrtHPC
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66258733
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GzQnOq9U+p6XKiAIwhuxDrUDl36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DMcCmuPb/mMM2unL9Byatu18U1T6sXcm4IyGgtuq308E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oHkW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaWKWDxwEY/Coc9DAjRdAhBZNKIY1rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4QR6uOO
 JFCAdZpRB3taj1CG2oMM4I7mNW5uWbteTJkhXvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0YuBBKLQVyg+04fSFzgOIN08NQWBvZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgLZ1
 JTjs5LChN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvG4kdR0waJZdI2WBj
 KrvVeV5v8Y70JyCN/MfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3C7SvPHOIrdZNcTjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX3BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:NR9pZq9y8J015TKy1Nhuk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y542mfvVmHZ6VO91xM/dfKla9Ny4kY1jiaGgOKsk8SgfwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.90,182,1643691600"; 
   d="scan'208";a="66258733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9G850S9vR1otsqpE1bh2Ofn3A8nQkBxH9uBjxaORwvjsETtxbwDtgmlHPqtmDsHwx6pkqrdQ+f5A0NbMspexuh7NGkvXbx2rOXTeSSedNF0000E3PqJGgLxLMVUrbMM/ZMjaI3jTxjgrJozqFqUtuqKZYAf3/jc+k68ae2DBrK3Fc8yznG9vcCd5yB+7r5fDI2Ypys0R/AKMizCAS0lYolkgFqteApYzuaN1WWH77gfsO1Y98SxYuRmsANEJrBSW+IVD6uR2WRJcUEBLKuwSljoM+RAq6iJ5v5Nw/eS+K6fx6SkDsxzadK9i3K89s0mCzCHJnrfYYcrqz3S2QLPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulnSyNwM29gB7uPPz885DJ6bbRUuMWcBYf/B3mmJW80=;
 b=OVNMsOKzsMe0aIA7b3FJq9KoizS22a0yO5wrry5KUqB9LXUy92sOPcecu4x+/KdXh1wYaLu4x/HhgUIRxIhxToHqKN0CyrHOY3pUVStMX1rGiU1cJHqxUormFgxmsY58Xy5mlQbCdjednSlCTDlW2nBAIvZTFoqPxwvPIOv15xJRrPr+htKsME7WVYScCP07CJfR65wrMTMYY82nLCsuaS/hJbwaYmwt4+CHGhAEa8/PFOvW56vKOhPt6LJ6pRaiKKBxVwsB2rLh7KhPFkiwwa6jsgBHDyJ/fI/M4ERhlJEu/a2Hf6XvRPmwBi4a92g1m68rJ5wccgW+RD+uBOZM3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulnSyNwM29gB7uPPz885DJ6bbRUuMWcBYf/B3mmJW80=;
 b=MdBoodKZBUvByxkGn4u60KHtwoZpV3P+cZYbGKszuQK62BtLgTK9GAB96x1OISPJQWBlZY9n3qY6/g+l70nwYler1LPQyLu0P8wuL3OKJtx/amDroy3ueXejkmsVtldt6HpRmJjZ2WakptVVKRfKhSXK64bGaHp6Wu+GXOJ3VaI=
Date: Tue, 15 Mar 2022 10:12:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/4] x86/APIC: calibrate against platform timer when
 possible
Message-ID: <YjBYk+xJMh1I6nrM@Air-de-Roger>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <cb7dd6bc-79a4-2137-5e82-805b9daf5d58@suse.com>
 <YitSc/Ky6PJb5ndV@Air-de-Roger>
 <d6bcee5b-abbd-5cef-f174-8609df94603e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6bcee5b-abbd-5cef-f174-8609df94603e@suse.com>
X-ClientProxiedBy: MR2P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9272e8c8-ea6c-4ef3-9d70-08da0663fef5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2811:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2811B19B78D0C671BDD6EC4D8F109@DM5PR03MB2811.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9LPL2L6I+Ek6Sr7VJ9Vov4xbWYUXYgaruZcZB0UVNfc4bIIQeKNWRHNjhV4KVn5nqCC8WNU6Jpd/XuLuogR01MrbOEQpoEXxPldDfXyL7AtgXgg4AsDZhUZdwOFjrFqvPeGTNEjYf81X/ARPcTRMfvk+qb6z0vNC985Hlstqiwn1gtj2f1V3PEBk3pzdMczyfKCoI31MEaspokFO5HIxClIW/kZ4X+KDSzx8a7fpFtmAJwOilbXztjIKFTO2469hKZs8g33hSRiOF1dBKXL1+KGtuJ8qPJhONDtcG1NhQNF8msGG4Y7QAZNMXAEHtloid4XwHsM/w3Mk+JQHASfSmA8rdKZQ4pb9yx8e5LarnTx60UvrHlYQEg0nGtq4VOevrYIs1cDntzB8ziVEg3FFC9ZVNGxl78ap5kM1Xihk0T3JEJlog+J/Z7lRMP8rr+FNIzS4GgwgH8ffoOEe10lQPzhtwIJxeoOAsvLgH99anIn8A8umVo0xdSVUdiKIoV0FMr5odKlRoouHjXBVo+t+ovf4qa0Lk7DDUy1dkLtef9RaTWrLmCz2JUZxfzYs3LS+ojbCon+tOOI3wWrnwMxvBKrRUNR4nrmj2p46f6Cq8lI+vQUwCkuAWk3+TBmre3n4TsO+Z6a5b/00h/jyXwERMk/tO7C8FSxNX0yUAzGTCqajech2eInIfLPvmtGeYvM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(82960400001)(38100700002)(5660300002)(33716001)(6916009)(54906003)(83380400001)(86362001)(316002)(2906002)(26005)(186003)(508600001)(6666004)(85182001)(6506007)(66476007)(66556008)(66946007)(6512007)(6486002)(9686003)(4326008)(8676002)(53546011)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWpieUVOK0ZLTys5eUoyWW1ybFQwbXplY1BZeWRRYXIzOElJbklmZGdJY01o?=
 =?utf-8?B?UnVOMXJscElQVjQxekdVUHh3ZjRpOCs2L0dBMUNKZXBaQUlzTGgyZFlIdTF4?=
 =?utf-8?B?OWdUQ3VPOEdSNmVDc1NJbkZORWo0ZFkxSDR3UHg1OEo1WHNReDNWWmNMQUds?=
 =?utf-8?B?d1lEdkRweDdIeVk2UlZmK3lIdUdaZHFZcjBPRTRtZzR0L2l5ZXFwNDBvRXZq?=
 =?utf-8?B?MUpTY1dabnY5c3dIaEgxUHU3NkFXRWtUd2phQWtCdDl5allNY2NlK2l6T2o0?=
 =?utf-8?B?L0lZU3dHbWlLWWZyWWw2NnZnTDdnb3pVS3VpYktXUjRUeHJqbGpFbFg2ZVBv?=
 =?utf-8?B?eUwwcmI0NTZITlQ0ejF0dFpsLzlvdGdzem1rbHJPUDJZUkYzNVlURm5oeHpz?=
 =?utf-8?B?THYvR2x6b3RDUXo5cEZCNzBCMFBtZnZmblVNNTlHd1VCSFZSd0FGMG1JN3dV?=
 =?utf-8?B?T2p6VmFOVW5yTVQ5VGE3ZzlwdzJwd1hCRE9HakxGYytZZTNoY05QeEQ1MnFC?=
 =?utf-8?B?ZUhMM2ZTdFlrR2ErYnM2MkJTaUJRenFpR1E3VjVGdnFXbVB3eHo5NHZSS004?=
 =?utf-8?B?NGg0TWYxWDdla0NLS3FTeWFtRFdPMHZQS3RjUi85RFI3NlFycXhmRmJWR29s?=
 =?utf-8?B?UHBRRG8wT1BtbitqNDBsT2poQm5rV25kT3huNEhlVlZjblhOWU5waUxaOER3?=
 =?utf-8?B?MzdQM2V2MmZTY21YL0dJamZpOERJQk1YaTd4cm4xTXdlQ05HWWllUzcvczl3?=
 =?utf-8?B?NThvL25id09BaG13WGJrQk9pYTc0TXFaQm12WEw2NzVzVHIvY0E5V1pWWFI5?=
 =?utf-8?B?aTNBRHAvSmFkaWhvcUl0VzZUM0hGSzI0eWNPamxOOHpaWUZCMDh2dTNseGlB?=
 =?utf-8?B?L0MxMHBnWWNTV2psVFAxZ3NwYlQvSEMvVlkrcUdBR2xSL2hNUDRSeFRHeHF3?=
 =?utf-8?B?cFN3dldzNk1wSXYvYXZaSHkwTjdMOUJ5Q0tEVExGSUFjR0xadEtzZ1J4UjBV?=
 =?utf-8?B?UmlWNS9FUTNqY3RzZHVXU25MYjVERXlQdytlMU96M1NCR1FtUGJoRFE0bmZz?=
 =?utf-8?B?cURpY1gvL2pxREZ2SThLSi9sRTI5UldiYWpaazBPMGdxNkwvUFMzRitDMHFK?=
 =?utf-8?B?eHgrY3UxUklZcU16UWIxU0NuY2Q0ZXg4QTBFS0orK25PQlRMUWRLbVovNVNW?=
 =?utf-8?B?VngvL09VWDNQUThVeGFaaDU4dEZJcGZvZEF6aTBmTHI0TkFhM3RoM0tYNEF0?=
 =?utf-8?B?QkpKZ2Z3MXk1T1RJZi92T3FOanJmUDNZRGtLdjFvTHhrSndPRE4zcENRSWt2?=
 =?utf-8?B?aE1RMG8vM0VDalZRZXRmRWJTeHZteUdSUGdNMWx3R1dsNWsvRTM2OWNlS3ZV?=
 =?utf-8?B?cFVHSU1IallWUEo4MGNza1FJM1JLcnFIcFd1dGp0b1loclpIQ1lGdnQ5YStE?=
 =?utf-8?B?Q0VxbXhMR29UeDZtdUJHTUNOQ3EzUGkzNlhicXZCczJndDlMRHRzc3d5eUFQ?=
 =?utf-8?B?QTBjVXBUeFhPbCtrVTUvOXlNV1NDQ3haaTBDY1djbDdRcmlFQ3o3eVp3MytG?=
 =?utf-8?B?NW5uV1RYWWorellHeFRmbG41R3BXQU9ROHBtRVpyNmRuZlRtUEVlanJtOS9a?=
 =?utf-8?B?NGl3VGlwL3crb2VOcTlDdGpMSVgvcmRyVFFHaXB2aXl5S0xTRFMvazlNcDAy?=
 =?utf-8?B?ZFl5RU5ubUFJUFRES1NralhyNVlXVE1hTmFXc0ZwNzRHVk9WMTBMZUxsQndL?=
 =?utf-8?B?Mk85MGl2UkhkUHFZanZmS1QrQjd0a3Z0aUxYMURIbFRMMnhIVDlDbVJ1OEVH?=
 =?utf-8?B?eGdTYm1sdksrY3QzSzFVdVM4aUJMbWJ6VHRsTm53ZnFPWE9jcUZSbWVVKyt6?=
 =?utf-8?B?ZENQTjlYMCtXT2hib2M0RkNreElRNmdQQlRUVVlOZktPL25EZDNmOC9Pc1pa?=
 =?utf-8?Q?rxEv7w1JYGRy7AJafoE1zG8GcQVbzfHw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9272e8c8-ea6c-4ef3-9d70-08da0663fef5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 09:12:57.6790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ehuxuu4S1PPNBwpTGztqHA5mNElAI4jBnhmDeXgQAIBvuNJse5ezZgqjHY1SbUK9Cvbp9auFLRG/+4K69wDsqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2811
X-OriginatorOrg: citrix.com

On Mon, Mar 14, 2022 at 05:19:37PM +0100, Jan Beulich wrote:
> On 11.03.2022 14:45, Roger Pau Monné wrote:
> > On Mon, Feb 14, 2022 at 10:25:11AM +0100, Jan Beulich wrote:
> >> Use the original calibration against PIT only when the platform timer
> >> is PIT. This implicitly excludes the "xen_guest" case from using the PIT
> >> logic (init_pit() fails there, and as of 5e73b2594c54 ["x86/time: minor
> >> adjustments to init_pit()"] using_pit also isn't being set too early
> >> anymore), so the respective hack there can be dropped at the same time.
> >> This also reduces calibration time from 100ms to 50ms, albeit this step
> >> is being skipped as of 0731a56c7c72 ("x86/APIC: no need for timer
> >> calibration when using TDT") anyway.
> >>
> >> While re-indenting the PIT logic in calibrate_APIC_clock(), besides
> >> adjusting style also switch around the 2nd TSC/TMCCT read pair, to match
> >> the order of the 1st one, yielding more consistent deltas.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Open-coding apic_read() in read_tmcct() isn't overly nice, but I wanted
> >> to avoid x2apic_enabled being evaluated twice in close succession. (The
> >> barrier is there just in case only anyway: While this RDMSR isn't
> >> serializing, I'm unaware of any statement whether it can also be
> >> executed speculatively, like RDTSC can.) An option might be to move the
> >> function to apic.c such that it would also be used by
> >> calibrate_APIC_clock().
> > 
> > I think that would make sense. Or else it's kind of orthogonal that we
> > use a barrier in calibrate_apic_timer but not in calibrate_APIC_clock.
> 
> But there is a barrier there, via rdtsc_ordered(). Thinking about
> this again, I'm not not even sure I'd like to use the helper in
> calibrate_APIC_clock(), as there's no need to have two barriers
> there.
> 
> But I guess I'll move the function in any event, so it at least
> feels less like a layering violation. But I still would want to
> avoid calling apic_read(), i.e. the function would remain as is
> (albeit perhaps renamed as becoming non-static).
> 
> > But maybe we can get rid of the open-coded PIT calibration in
> > calibrate_APIC_clock? (see below)
> > 
> >> --- a/xen/arch/x86/time.c
> >> +++ b/xen/arch/x86/time.c
> >> @@ -26,6 +26,7 @@
> >>  #include <xen/symbols.h>
> >>  #include <xen/keyhandler.h>
> >>  #include <xen/guest_access.h>
> >> +#include <asm/apic.h>
> >>  #include <asm/io.h>
> >>  #include <asm/iocap.h>
> >>  #include <asm/msr.h>
> >> @@ -1004,6 +1005,78 @@ static u64 __init init_platform_timer(vo
> >>      return rc;
> >>  }
> >>  
> >> +static uint32_t __init read_tmcct(void)
> >> +{
> >> +    if ( x2apic_enabled )
> >> +    {
> >> +        alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
> >> +        return apic_rdmsr(APIC_TMCCT);
> >> +    }
> >> +
> >> +    return apic_mem_read(APIC_TMCCT);
> >> +}
> >> +
> >> +static uint64_t __init read_pt_and_tmcct(uint32_t *tmcct)
> >> +{
> >> +    uint32_t tmcct_prev = *tmcct = read_tmcct(), tmcct_min = ~0;
> >> +    uint64_t best = best;
> >> +    unsigned int i;
> >> +
> >> +    for ( i = 0; ; ++i )
> >> +    {
> >> +        uint64_t pt = plt_src.read_counter();
> >> +        uint32_t tmcct_cur = read_tmcct();
> >> +        uint32_t tmcct_delta = tmcct_prev - tmcct_cur;
> >> +
> >> +        if ( tmcct_delta < tmcct_min )
> >> +        {
> >> +            tmcct_min = tmcct_delta;
> >> +            *tmcct = tmcct_cur;
> >> +            best = pt;
> >> +        }
> >> +        else if ( i > 2 )
> >> +            break;
> >> +
> >> +        tmcct_prev = tmcct_cur;
> >> +    }
> >> +
> >> +    return best;
> >> +}
> >> +
> >> +uint64_t __init calibrate_apic_timer(void)
> >> +{
> >> +    uint32_t start, end;
> >> +    uint64_t count = read_pt_and_tmcct(&start), elapsed;
> >> +    uint64_t target = CALIBRATE_VALUE(plt_src.frequency), actual;
> >> +    uint64_t mask = (uint64_t)~0 >> (64 - plt_src.counter_bits);
> >> +
> >> +    /*
> >> +     * PIT cannot be used here as it requires the timer interrupt to maintain
> >> +     * its 32-bit software counter, yet here we run with IRQs disabled.
> >> +     */
> > 
> > The reasoning in calibrate_APIC_clock to have interrupts disabled
> > doesn't apply anymore I would think (interrupts are already enabled
> > when we get there),
> 
> setup_boot_APIC_clock() disables IRQs before calling
> calibrate_APIC_clock(). Whether the reasoning still applies is hard
> to tell - I at least cannot claim I fully understand the concern.

Me neither, I'm not sure what will explicitly need the first
interrupt, and why further interrupts won't be fine.

Also interrupts are already enabled before calling
calibrate_APIC_clock() (as it's setup_boot_APIC_clock() that disables
them), so this whole thing about getting the first interrupt seems
very bogus and plain wrong.

> > and hence it seems to me that calibrate_APIC_clock
> > could be called with interrupts enabled and we could remove the
> > open-coded usage of the PIT in calibrate_APIC_clock.
> 
> I won't exclude this might be possible, but it would mean changing
> a path which is hardly ever used nowadays. While on one hand this
> means hardly anyone might notice, otoh it also means possible
> breakage might not be noticed until far in the future. It anyway
> feels too much for a single change to also alter calibration against
> PIT right here.

You are already changing this path by using a clocksource different
than PIT to perform the calibration.

> One thing seems quite clear though: Doing any of this with interrupts
> enabled increases the chances for the read pairs to not properly
> correlate, due to an interrupt happening in the middle. This alone is
> a reason for me to want to keep IRQs off here.

Right, TSC calibration is also done with interrupts disabled, so it
does seem correct to do the same here for APIC.

Maybe it would be cleaner to hide the specific PIT logic in
calibrate_apic_timer() so that we could remove get_8254_timer_count()
and wait_8254_wraparound() from apic.c and apic.c doesn't have any PIT
specific code anymore?

I think using channel 2 like it's used for the TSC calibration won't
be possible at this point, since it will skew read_pit_count() users?
In any case if we disable interrupts those will already be skewed
because the timer won't be rearmed until interrupts are enabled.

Thanks, Roger.

