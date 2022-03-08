Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748AB4D1CF9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:15:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287170.487029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcV3-0005C0-Bj; Tue, 08 Mar 2022 16:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287170.487029; Tue, 08 Mar 2022 16:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcV3-00058q-7z; Tue, 08 Mar 2022 16:15:49 +0000
Received: by outflank-mailman (input) for mailman id 287170;
 Tue, 08 Mar 2022 16:15:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRcV1-00058j-FA
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:15:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00bd0d27-9efb-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:15:44 +0100 (CET)
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
X-Inumbo-ID: 00bd0d27-9efb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646756144;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vbSmVbnA8x/4/Y02BePB7RvH6v4Xp+9l2OFZvg43UP4=;
  b=MKqaqc7nBHo7JsGqrwQIIsP8LXr/V9owuOizIIwAkYp0lJ1G/ZfBU2Ks
   1m+RLAkxvOm9weXQTHH9aU3wkkX7LLt+zooMRBeW0XgJqzBoJfSrfIKhW
   ONZaVxnDX6/tLSEV4shVMNQPDb7CbkrbRfENA0RhX7DeuSMOYwzhCi1MT
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66121252
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sq99GqlMKBdGOVg3WgGxUtXo5gxQJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdDziBM63eNmegKYxybY7kpktXupbSzodqQAc/q3gyFiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1PV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYUwVxAIn9pc8hfT5XAR85LYt35rvdGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6iHP
 ZNDNGAHgBLofhwVGnM0WJkCs8yjgUPlcRoBkF7OnP9ii4TU5FMoi+W8WDbPQfSPXcJVmk+Tp
 UrP+m3rBRdcONH34TmC9GiliqnQnCf4cIUIHba8+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVXRe1vXqFtR40QMdLHqsx7wTl4qbT7gyUAkANSzdTb9pguMJebTkpy
 3eAmtr7AjopvLD9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iJsx1izrf+tILICSgc/LXiHW8
 i6OthFr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDDtLhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iQsJGeBj
 Kz741o5CHpv0J2CN/cfj2WZUZhC8EQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnHL5jzXStBUPQ6l1JaotvxN5dxnUjSIkuJGfjGI+mPi+LCNBZ5t59fWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/quYuwaQxBSFjX/je8pUPHsbae1YOMDxxWpf5nOJ6E6Q4zvs9qws91
 izkMqOu4AGk3iOvxMTjQi0LVY4Dqr4j9SJrZ3J9Zw30s5XhCK72hJoim1IMVeBP3MRozOJuT
 ulDfMOFA/9VTS/A9ShbZp74xLGOvjzw7e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:BzpC9ao46gnv+wCOhccNNm0aV5oDeYIsimQD101hICG9E/bo9f
 xG+c5x6faaslsssR0b9exoQZPwOk80rKQFmbX5Xo3SPzUO2lHIEGgK1+KLqQEIfReQygc378
 ddmsZFZuEYQmIK6foSpDPIderJ/bG8gcWVbdi39QYVcelJA5sQiDtENg==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="66121252"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0y1kIf8KBf57b2XpBZNhurOMT6fHV7ILmXJv2NegUjxBElUtGdp9GFF9MlBbhFUociMYMIg64eXP8h1gikOL3WPSJayrL38IAfltoqX6JnF7CIJnaAkjbqxsNeCNdYq34rG3drUrTeQnwK7HRfiqkg3MHCc26k3isVd8dMrNLZud5hj/TBQvni9uXz9IuRt722Du7ldgVk7DSuph5IJXGe/jEO267A9MA7jz+Mxd/ZVADsqVx6vwRwpEzlZDkjoxhktoCyZcbJBDUbD3ZgJXOq6uflC30sr3H6inWRw2KfdrG5C3ZKM7k80/25Ml2fOV1oXbtVuqXX0w3hmjESpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRh513p/AsQY5XbW32P7IOjnQoyPaNleodqK+9PVZwo=;
 b=Ap5GlqYCob1BXLn3X9WYu9tpUyOq/ZGQU6BFcMp+DuFyXE4oCHCFbL2H7Ci5iKUfZV9w/IAcwexDL6XqXkrFJzqWenkY/oJaBaNHg4G+idDCEgkQHxPjVopXVj6Pgpr57YZGzbMP9IxNSg+GoJYfRBDwMWHpt7UcSDpfKCfE/n7NBnLTkFZ8eZ7aP0hIVkvB8X5KgMqNzjdrZAjxir/BWw2WR+7rJfeXylKUmoWOgpfs+W5F9nEPDrbZauH2SX4U1XI0M8RrGeym8wLJtew6qyHlLjsBiU/GpdBnnAnhc79qGJH9sVyyFscTZiPiq/I886xMVO8VVKOxp6LlGg0egQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRh513p/AsQY5XbW32P7IOjnQoyPaNleodqK+9PVZwo=;
 b=BzaHv/2UPVBXuEsC2TedTiSQWtLJQE4pS5EGQhHPzO5H/hK5bRNfyzOuFJEUUp2OFqeMCN6OSH364D9kq9YTWkMrptGY/EesIoP6kA268f12yvT4CLSBiPLCGrMjbpFcgrFsHvvKFkzX8P9PbzCmBOyLFORZeFBadf6nz/UwWgs=
Date: Tue, 8 Mar 2022 17:15:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bjoern Doebel <doebel@amazon.de>, Michael Kurth <mku@amazon.de>, "Martin
 Pohlack" <mpohlack@amazon.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1] arch/x86: Livepatch: fix overflow check when
 computing ELF relocations
Message-ID: <YieBJTHJBiUUqMCU@Air-de-Roger>
References: <b74a68b038c31df4bb94a5b5e87453f5a249cfe2.1646753657.git.doebel@amazon.de>
 <c625d90c-ec0b-a2c3-cf93-08c99cc2f3ce@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c625d90c-ec0b-a2c3-cf93-08c99cc2f3ce@suse.com>
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88e566ce-c608-411b-b586-08da011ee206
X-MS-TrafficTypeDiagnostic: PH0PR03MB5832:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB583249174AC051A6831099288F099@PH0PR03MB5832.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +clHahwdm64rA+qJmAkaJXZwfE0Se6zASlPnIQ1yrsBF0HVJ+YUhjdLa33EezYtFAM+k2gEyJyK3gE68bQ77TwQ1AUlQKfXJk4tFb2xXcQCWELfXzfFaaPA6DOIVCKIwrGQM/tiNN2inPhbfa+mSS+jNJfqjB7V+Pixzqb/YjrueCNLc/QcWkVJq6qnphsdrWr1f7zWesXvnoo/1D93h1JY8pnB1r1had1i0TX8aBUOdLE5PFlfMqgROFUU3qdWbG+QLDI4KqqnyPwGeYkGeMpLgsDVFvhca09F70c/lE6piuhR1cmv7MpSLOLERBnMpqLdL9L8ISjpXQXughoTldLjWD11IEFYPKWSR+0wKBAc90ASA5FzmmEWJqzseNI7SfyxWfMeQpxJ6Vl6UYMZjEMmjmUI6eQs0RYXUzH/fbKSND/R9iYAtvXd4w3YD/R1r9zNZQL3XNZaCmRi+GpoHLf+YUrljoESbXn2kT8AtGpSElwBoZ9KFSDiRN1Vaq8LB1AHXrblRgFDUOC6S97xIHrRdYwXBPaCpamAxxHtCL8WhkzKytEAlONHO5GlrHrnaX/VfRi9Si7odQ5sBtkrQNvU/Qqrq4imM6Y4XyjB0FyqZIv3Br9ynLoz5ijfM/SxdhjIdvWW+AHLTF61t6bFX4kppUQ2Rn32C2a9X1eSjMJcS6fEVfsXIyRwXkEVHJASWf9P4kqK2CAZpcDaRcP45r2CIBEzqJTXP3H0MFE7lz5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(83380400001)(5660300002)(66946007)(4326008)(2906002)(8676002)(85182001)(8936002)(66556008)(66476007)(508600001)(316002)(33716001)(6486002)(966005)(6916009)(186003)(26005)(38100700002)(54906003)(6666004)(6512007)(6506007)(53546011)(9686003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXVwU09UYTZWQThjWGRSQ0pWblFCekRBMk9NUjFxK2Nib2ZENzNwSXhWWW5M?=
 =?utf-8?B?MkdlZVNNa1I5WEZHbHByRkhVMUdzYVloMGkrZWZocjJoOFN6cFZDeHllb01H?=
 =?utf-8?B?Z2hjYkZVRk1McG94cHNidlF2dHRLMnIvR2xDdWtvOHFBV0NDMUFpRmVsVFpQ?=
 =?utf-8?B?d3JhSFZXRHEvNW9GUEpsdmhZckdkNmcvVnA5QjA5YXA2RjdGMGtsaURYUE90?=
 =?utf-8?B?a29KYU9GZ1JSRXRScG03dHZTdFk4bE9XUGhYQktodDRPcmQxcHJiU051VkZi?=
 =?utf-8?B?aTNwLzZiSFdtY3pIZm1KT3dvS21tMFBtZXRnc0FoUVV2d2hEUFlnWnduRkI3?=
 =?utf-8?B?bzVEREZVSEwvMFg1cHc0WVU3WW1JajZWZ1BvVzN3eG9RTDJUVXNiYzBRb1Zq?=
 =?utf-8?B?dFZjUmdsdnVPR0ltS1ZNamhSa1NkeFkzbytJMlorMXN1SnFVcmpVVGhJU052?=
 =?utf-8?B?TVFJKytCTTNyM0lUQm85UU1aQTdiUjRUQlFKTDFmYms4VGVEejlybitSU2RX?=
 =?utf-8?B?NXIxN3V6Uk10L1ZiSmtURy9kdmdPcVo4TzY3RTRZaVhrRVI1QVVjQmhIODRN?=
 =?utf-8?B?L01Ia3N0c21rTDZPYnM1Q24rVzhjb29lNXFvV25PSjAzU1FJZTNIb2xETFM2?=
 =?utf-8?B?UDBmMEs4ZVBSUkx5cUsyZkZieFZnMCt1em42K2xQV0paNGFMeE1iWlFEZGg0?=
 =?utf-8?B?MlU1UmJZNDc2NTdWdEE0cGVWOGFUczhNcExYNGUyQ1NZUDlUcFZjbzNJUzk5?=
 =?utf-8?B?blJBeXJKTHkvYTI3clg1Ym8wSEcxb2tueUlQZ3U4d3VVSVRLUnNVNjJsWnNx?=
 =?utf-8?B?dmpZRjRDdG8yVm9lV1plL0NyN1hma2FCOWZablNpSmlUaEMrSUw5T3RlMG5r?=
 =?utf-8?B?QWV6a042QmRLZ1p6WE9RMzEvNDA2QTFweUErdFJqUHMvRDBGOCtZU0lRTkpE?=
 =?utf-8?B?Slc0c2s2bGQyM1d6Z0Y2cUNLQ3VEdkZqUkdNNEpQN1B0cDQ2QkNka1ZZc3Fw?=
 =?utf-8?B?bnJtbnhsMCtMNXZNdXpBaUd6ek1Vb2FyRFMyb0FWOXJKMThLaXFHcEdpekNn?=
 =?utf-8?B?VllYbm1SVWlYT0VmVG13QzYvYTJ3WncyNG9JWnRLSEpnUlh5aHlOcHErclpl?=
 =?utf-8?B?Ui83bGp4Q3FWRFBMZjYrbjVsU2FPeUQvbHFHdXFrRWZKaGtsT2RJMTlWNUhI?=
 =?utf-8?B?MWZtaUZMdmtxQUV3YXdlNU5XWEhDNForZ2JkNnl3L3E4Q2gwLzR3Z1pKVXQ5?=
 =?utf-8?B?NkY1ckQ4SEd6V096cFhZbGliaExhRC9aZEdKOW52WEthQjlkQWtxNlVwNkNO?=
 =?utf-8?B?aGhSbEtBL0VyTXd6NjBDTnVvYWR6RkZVSkRrNURoS1pmS040TWtvellzR2Fs?=
 =?utf-8?B?NXBlK0tKK3NwbC9rMEtkWXllTzJXSHJQVmZBN21jMGtKd2wyZDRhZXBDcGpF?=
 =?utf-8?B?SCtlMC9uYnE2d2RJZFRaWVBLMVp6L09sY3dMOXRnN1FmTVNldTd5bGdqMGEy?=
 =?utf-8?B?S2tuV0ZyOTk3U0lNbnZqYTFFRG1GcEhGMWVPdzVOWURjbCtqQ1VBZ0N2dHli?=
 =?utf-8?B?UGFHVTFQb3V3eTNIY2IwUnpLbjgrT05mYVRBOXhWc1F2TExncEc0VnEzYlJn?=
 =?utf-8?B?VVdZMEJ1Y2FnTjJLTER4OS9DVXJXeXlLcUJHRW5Ndys3K2U4MHAyZ3NpTyty?=
 =?utf-8?B?dklMcnJuOFB5RGVlYnFjazIvZ29GRlVXTk1FNEZaNXRYa2pNajNKRDk5U05D?=
 =?utf-8?B?ODJicGZiZ3FyU3A4cHhuU0RiUjVzUE4vMitJd2FyRnFibW91eDF1TE1GM3FJ?=
 =?utf-8?B?bEZ4Z2k5b1VKTFNMdEhBak8wd1JNSy9qZ0dSRGx2cndpZzcvMTUyQmZ4WmIy?=
 =?utf-8?B?RUROVmV0ZHNRSEJPTTc1T2N3bjBFd2h6T2syeDU3UVlLczZzdWxENmFQVFRZ?=
 =?utf-8?B?WERxVTg0TFl0S3JvWTVRREpmTitHMmo0NkVWdDZCbC9Dajd5WWFBbDBLMDMx?=
 =?utf-8?B?NnVoTGU3NmYyNDhUMVZKZmVZeTdCQjFuRFljUGNDSE9xQm8wUnN5Tk5nVEI1?=
 =?utf-8?B?TzlHYSt0ZVpzS3dLSi9Bd1h3b3Jkd2hkWWc3cjQ5MDVwa244c1NVdUhiK2Fv?=
 =?utf-8?B?MThzZlNFYldpU2FyZlMwbyt3T1IxRStVbjBiRkJFQVUvQmRxekdQVk9NNTdW?=
 =?utf-8?Q?6i4XjIKpSrmCfXe88ushr0Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e566ce-c608-411b-b586-08da011ee206
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:15:38.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9ye4X6ma0uSLYOkbqwXzcG53Y/dbZzfXaVFazkSEPCZNuK26Ddq5koSiR077/J8CjWJJ/zcmvkUQE7fA5bu7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5832
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 04:45:34PM +0100, Jan Beulich wrote:
> On 08.03.2022 16:36, Bjoern Doebel wrote:
> > --- a/xen/arch/x86/livepatch.c
> > +++ b/xen/arch/x86/livepatch.c
> > @@ -339,7 +339,7 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
> >  
> >              val -= (uint64_t)dest;
> >              *(int32_t *)dest = val;
> 
> Afaict after this assignment ...
> 
> > -            if ( (int64_t)val != *(int32_t *)dest )
> > +            if ( (int32_t)val != *(int32_t *)dest )
> 
> ... this condition can never be false. The cast really wants to be
> to int64_t, and the overflow you saw being reported is quite likely
> for a different reason. But from the sole message you did quote
> it's not really possible to figure what else is wrong.

It seems Linux has that check ifdef'ed [0], but there's no reference
as to why it's that way (I've tracked it back to the x86-64 import on
the historical tree, f3081f5b66a06175ff2dabfe885a53fb04e71076).

It's a 64bit relocation using a 32bit value, but it's unclear to me
that modifying the top 32bits is not allowed/intended.

Regards, Roger.

[0] https://elixir.bootlin.com/linux/latest/source/arch/x86/kernel/module.c#L190

