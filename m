Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED27CF789
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619267.964082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRbJ-0002ZR-Kj; Thu, 19 Oct 2023 11:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619267.964082; Thu, 19 Oct 2023 11:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRbJ-0002X9-I6; Thu, 19 Oct 2023 11:54:05 +0000
Received: by outflank-mailman (input) for mailman id 619267;
 Thu, 19 Oct 2023 11:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtRbI-0002X3-8a
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:54:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe16::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31ad2d64-6e76-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:54:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 19 Oct
 2023 11:53:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:53:59 +0000
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
X-Inumbo-ID: 31ad2d64-6e76-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbpX658C4iyrn7dZBOod++qCSRL66J0KIWrbuRHqqthy5v0L6gv3khEc7cAN4plztHfl9SXNTCpWd57VX+UoyfEEHAhr0RoQz1GP1PUfXZSyzrnkHdtrbAxlyfEV++0WA9cgtB4RjAxOaOoH56tTBqwbOR7zREQZ4yvNN/eb52Fl8P2kl2pNL3Qk2VmpoirCGXgHf70Z0CQw1eGE+f7B6oYavypgdAR+iO3G8c6IILrNIOy++MxQ6wMgzBjZE8QouVFqblKKOfGBUMvadz/L1+/QGX6EkRW9OMSQMbsli1S+9I8yMVeb4X6xJNybXCjhoUAgL0i/AjvGa2fi3QorqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0h8t8Bln9ZXhABezXOluNm5YVG/JEWtUZDPGiFLBuCw=;
 b=RXknKmFIk+mAgzHUCjzb1/qA56JVAK2mVxQssDFUxE/wx3Dg/xXrKb9DDEWeT5X0qoWZ7FZRQbaJIcixyOaMMNGqlR5KdFMzWRepYOJDaETtlx2lQud3PI3M4vg3wm96BtZeehwEuGywIvheLBgXbA1KHgbSU4D2lJbbug55VqZWRu3pIqpC/mFNiO7y2CPRmdu1DFY8iSdEzOUO15M/fCygh2cUkaIk4H8DIsd0wWjZTcXicJ2iyBvLg4ZRjAQFjG7855RJdZsz9flyArP4WogTIqQn0kmUtnO4jj8WBouRh0/dgM1BdlIQeS9zmF6JrfAz8OdExDtLy+jDtU9Dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h8t8Bln9ZXhABezXOluNm5YVG/JEWtUZDPGiFLBuCw=;
 b=IPzATuak96uJoFn/+N7mhilz1ZQtX14+tBXaUfMeDxs5PYSkO3JlfQOBDi3HMnUZk8GDpvIxfw/WcBVtBkK+peacAhUyOtECbTYy2K9ySCCFd4r0FNXSn4A0Dch1I2LUPJ7xVLSTy3sjqHcgSNZ/T057slAiIISzqBtR5dfaCoL2VKSk8xKr7AlffUrsGeKa5XJgLXP6gK2nD5zH7gICkHcpU7Ulz/64CRkwSvo9Zb2GSkTGBKPiGBer7iS7z98w8+eh/x9+hl+y7klNtWY0eWobRx32r8uaNjEg0PcAt5nM4EYL+r7Ly8bS17UMvRqDXaDDqIhXYFRiwqIckIHb/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19065f09-e278-5471-eff7-1dd3b855a9aa@suse.com>
Date: Thu, 19 Oct 2023 13:53:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 00/57] Enable build of full Xen for RISC-V
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f88da2-7344-4675-be43-08dbd09a1465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h/NEkWAPuSSxVzvHEkJfsDHDtvtBXWtPgNAS4CW8dNk+zsQWUnNcGM1AVW/OJ0Xs6Wej8Bt+gkHEuEs+3RAcf+FiO2JTxpzFYSSHdmLfHrMARAi96oi58sqAGoFEgj4X21To/DtkDwo0LJaIJ0jOITOcHCp3yllYZ5RAc2dLGV+ePzAzq7npGT2s7TgQwCCm3pT0zDIRpCKlcXIHBSB7NbE36wUjdvX7806F9uPlQGHX0j8horyjOs4td57cyOpxeeqaz/nGrggigYcRZzfdMggCNJpzPY/0ydgpXS52nP6F5+ixpKsSvSOjS03KMq1MIen2vhMDDx+Zqb6tei3mlH+35xLlajuK3DtCQ+C9nXBX9iOUAWRc3YXI7cQb5DCAUOrfXpTrPX+ulDSveBZHOPjcdPG0poRBi3J6bMD6tWTN1/yv+iPKF/KTzo6myi7MC0AecEJlKA9B4UJWSWUN+CkaPhPWvJ2h0w21oWUToR7LMUP7HMYFZpAUqx+JMsgAX1ju7BksLc9AFI6L7trZEO4glxOjcB0cjuy9gOpUcAKNfh5P9wvbJzoHm4k+Z0wL2uuSmZcZkTJFJ+dzgJM2PNx6wzl5ANEI5fykryjo7ABiXdud1nUXuPrBf5kVjv0Nm+GWB+pLdQpd/f5/rGlAew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(136003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(31686004)(38100700002)(5660300002)(41300700001)(4326008)(36756003)(86362001)(7416002)(2906002)(31696002)(8676002)(83380400001)(6512007)(26005)(6506007)(53546011)(2616005)(8936002)(478600001)(6666004)(6486002)(54906003)(66476007)(66556008)(66946007)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFVIWHlwMUZjNmxnOC84czg0SEhCM0pWc0JsVDFaYTRQMUpDd3Voc0lhY3pw?=
 =?utf-8?B?MTVBenZYelVqZE5rRUhXN28vUnBybFpZdGRpdEZJWHdMQkQyajR6d1hjdFNl?=
 =?utf-8?B?TWZ1NlRUeURsZVdpcHdIb2hQNHQ5ME5VMjcvTUt4MTQzNlBuMXRQTVQvYmM1?=
 =?utf-8?B?OGJTcEtsNzV1Slh1S1piYW4xdE42VGxHSUdXZ2ZtVi9VejYvUWhFaloyK1Ja?=
 =?utf-8?B?cUlETHRDSEdkdUhjY2ptNVdBMGN6eWFDMGJkbHNTemtDaE4zenVBekVKYlVs?=
 =?utf-8?B?b0VTZkszdXJPSjMxbS95M3FmTEhNanlxZlAxWlcwZ01pVnRLeTM1OFltUzJq?=
 =?utf-8?B?VE9OMGp4Y3FDdGljTkN2bVhwRFoySGQ3S0hxUGlab2x5RThLckFYcmdHZG1v?=
 =?utf-8?B?T0xRdmQ1MXZpb3dDREE3d2JYYzZ6TTVEZ3ZVSE5MNXpXazdvc1FpTUEyMEo5?=
 =?utf-8?B?eWQ2NXdwbXV6TjRuSkx3Szg1V2dHSG8xcGRLdGtMU2hGTnphTzltWDJ1S1pY?=
 =?utf-8?B?RWJ6U2UrcGg2U1VUVmVnL3NPUVB6aC90WjdDNXEyTkxMWnY4VjdzQ2VrNTZj?=
 =?utf-8?B?UVh3eFZmd1pja244RHFqb2kwdWVRbjRvL2dIdE15QnNyMm1YMldERDV6d1N3?=
 =?utf-8?B?TXV4ZWhiQmt6WVNLQUttVk9wUCtWZmVMbVFXYm85RVFnWlY0clJYTzNKVXlB?=
 =?utf-8?B?WTl5VDFUMC9URm9taVh4QmFpc2pjVXlocG1tQ1hlZVdRMlJkazBpdDJTMUk5?=
 =?utf-8?B?YkF2eTJSQzlBMXBsVnJRdEYxaFJwbVBuNStLakV1R3Nld3htN1h1Z1V2eC9S?=
 =?utf-8?B?dTBVTWJQZU81TCtycm43dS9ueEdGMFFHYmQrdm9OaE1xL01NbUhmR1dUVUtH?=
 =?utf-8?B?SVRkRHR1RFI0M0NiZ2R5SmhFSGFLOFFvR1hYaytaY1VTZEdySWw0MStDMzk5?=
 =?utf-8?B?MFc0UHVkQ2xPUXZYb3pBamVvK2xEUkY3R0Yxc2JYY1Ryc2R1NjZKcnlMdGJa?=
 =?utf-8?B?UWdYdFYxaUE2K1RoRi95UnUyS2VUQURjTHdWL1BMdnFrVVExWjVFdXNrZHJz?=
 =?utf-8?B?cHRVcXBla214U25NNG5zQjFyZlJhUUhLMmwzY0liaTRrZE83UFNZSStqRWxV?=
 =?utf-8?B?bjVzd2NibVFuSFJaYndoQzRjVTVtamlqRjRFazN5UWZQRXFoM1h5SFFVS1lE?=
 =?utf-8?B?bUdwUm5kV1BJYng3eVhpNVVCU3FlOEdZdUEvMEZJLy9sL3RacFFhUG9nWDJu?=
 =?utf-8?B?VnB0RXhrbHQrSnBpcTR5NUJhZ0U4QnlGbEk0M3VyTFQ1c05Eam5PUzJ2dE5Y?=
 =?utf-8?B?aTkrejRhcytuTXZ5Q3RobUwzZDBFTFIxaTUydnJhUUFiTHdnQWFrNGJINUNy?=
 =?utf-8?B?R0F0czVxRFlMTGJhSnRBemVHTFBaamVPb3JEUWlXYTkyQTY5Q0JzL2dJZGtB?=
 =?utf-8?B?SnNPVUliazV6QzZzbHkzVUxKY05hRGNXQ2c0eWtUOTBmTmh4OGI3VkFrbU82?=
 =?utf-8?B?NjRKRGxxMmdpbDVCRVRwRzZFajJZWllKZXZLTlhldmJ4WFIyVyt3eUN0aEUx?=
 =?utf-8?B?bTR1SUxBQmMwU2t0OVhzbVJLYlU2Ukc4K2NCanBsKzg5YXdBMEN6bENWc29U?=
 =?utf-8?B?ejZ6WEJMVTR2dU5WOXVFTVV5c0IwSVRKNUtmdnFiRWhBVllWZU43cHdVRkNF?=
 =?utf-8?B?TlNBeDVIZXFUM21LQ3FadG1MMjloQkdMYWZRaVoxbis4SEFJQXloZTJGR09k?=
 =?utf-8?B?NGU5YzA5ZWRaMXJ6L3RnMHR0eCtUbmcrTHdFUTREUFBabGJuSFhFL3BaSnpk?=
 =?utf-8?B?OGtCUE5nU1Zpd1N4RHRJWitHK2g0Q3hrajUzQUkwRTVnUTRkUy9pY3dLaktW?=
 =?utf-8?B?b29jMXl3N1k3RDJiQkNWUFkrTDlhaXpXT3UxVk1vd2t3TlNWS2dkZENtSG5Z?=
 =?utf-8?B?RzNBZ0lZV3ExZDdzRzJpNnRIQTV2eU5WTE8rVk1zc0kwUzFXOFlTeUMzayta?=
 =?utf-8?B?Q0YyenRFOVRJYUJoQkR5SGFkZG41a05RTjl5d3pTSllzOGg3Qm53ZUpXYXhr?=
 =?utf-8?B?WnV3T0RLRUUrZS9jNW83KzFBVUdFN0FSajREMFdaV01ndVM2Z0kzWmdNR2NI?=
 =?utf-8?Q?5H6PjWWTU8iJmxRaZbysUPkDX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f88da2-7344-4675-be43-08dbd09a1465
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:53:58.9994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucDgeqGmtd4XzldZbHx/kADimd8s7CgUIABmOLkJaXrYgoVWUXF1q+R++43KC8cmtJP/oUK5YCeC24OqAgPZJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176

On 16.08.2023 12:19, Oleksii Kurochko wrote:
> This patch series performs all of the additions necessary to drop the
> build overrides for RISCV and enable the full Xen build. Except in cases
> where compatibile implementations already exist (e.g. atomic.h and
> bitops.h), the newly added definitions are simple.
> 
> Also the patch series has open question described in the patch 57
> 
> Patch 56 is only needed for test purposes and will be removed.
> 
> Oleksii Kurochko (57):
>   xen/riscv:introduce asm/byteorder.h
>   xen/riscv: add public arch-riscv.h
>   xen/riscv: introduce spinlock.h
>   xen/riscv: introduce fence.h
>   xen/riscv: introduce arch-riscv/hvm/save.h
>   xen/riscv: introduce paging.h
>   xen/riscv: introduce asm/cpufeature.h
>   xen/riscv: introduce asm/device.h
>   xen/riscv: introduce asm/event.h
>   xen/riscv: introduce asm/grant_table.h
>   xen/riscv: introduce asm/guest_atomics.h
>   xen/riscv: introduce asm/hypercall.h
>   xen/riscv: introduce asm/iocap.h
>   xen/riscv: introduce asm/iommu.h
>   xen/riscv: introduce asm/mem_access.h
>   xen/riscv: introduce asm/nospec.h
>   xen/riscv: introduce asm/pci.h
>   xen/riscv: introduce asm/random.h
>   xen/riscv: introduce asm/setup.h
>   xen/riscv: introduce asm/system.h
>   xen/riscv: introduce asm/xenoprof.h
>   xen/riscv: introduce bitops.h
>   xen/riscv: introduce flushtlb.h
>   xen/riscv: introduce asm/percpu.h
>   xen/riscv: introduce asm/smp.h
>   xen/riscv: introduce asm/atomic.h
>   xen/riscv: introduce cmpxchg.h
>   xen/riscv: introduce asm/io.h
>   xen/riscv: introduce asm/hardirq.h
>   xen/riscv: introduce div64.h
>   xen/riscv: define bug frame tables in xen.lds.S
>   xen/riscv: introduce bit operations
>   xen/riscv: introduce asm/altp2m.h
>   xen/riscv: introduce asm/delay.h
>   xen/riscv: introduce asm/domain.h
>   xen/riscv: introduce asm/guest_access.h
>   xen/riscv: introduce asm/irq.h
>   xen/riscv: introduce asm/monitor.h
>   xen/riscv: introduce asm/numa.h
>   xen/riscv: introduce asm/p2m.h
>   xen/riscv: introduce asm/regs.h
>   xen/riscv: introduce asm/softirq.h
>   xen/riscv: introduce asm/time.h
>   xen/riscv: introduce asm/vm_event.h
>   xen/riscv: add definition of __read_mostly
>   xen/riscv: define an address of frame table
>   xen/riscv: add required things to asm/current.h
>   xen/riscv: add minimal stuff to asm/page.h to build full Xen
>   xen/riscv: add minimal stuff to asm/processor.h to build full Xen
>   xen/riscv: add minimal stuff to asm/smp.h to build full Xen
>   xen: add RISCV support for pmu.h
>   xen: add necessary headers to common to build full Xen for RISC-V
>   xen/riscv: add minimal stuff to asm/mm.h to build full Xen
>   xen/rirscv: add minimal amount of stubs to build full Xen
>   xen/riscv: enable full Xen build
>   test only riscv
>   xxxen/riscv: WIP ( need advise )

Just to clarify: With the later 29-patch series superseding fair parts of this,
is there still any need to look at this (version of this) series in any detail?

Jan

