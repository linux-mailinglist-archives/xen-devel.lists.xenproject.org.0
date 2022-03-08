Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E04D1A6D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286992.486744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRamQ-0002TN-8b; Tue, 08 Mar 2022 14:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286992.486744; Tue, 08 Mar 2022 14:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRamQ-0002RW-3e; Tue, 08 Mar 2022 14:25:38 +0000
Received: by outflank-mailman (input) for mailman id 286992;
 Tue, 08 Mar 2022 14:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRamO-0002RQ-7J
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:25:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d361968-9eeb-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:25:34 +0100 (CET)
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
X-Inumbo-ID: 9d361968-9eeb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646749534;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=C5E7SwW8VUIqiJh+U2gAE6UYsz+6v7XFdWv3O68lJxg=;
  b=boRkJBCLj01u2+TKbPeeWO4t+7mz7W1WuafIyrvV6tHKsLsEynFAWX+m
   LYiO4KcWeCs0OanyOW31uKtbF36rEBy8/LtKb8vvjFQ2gNSRB5SziKyoL
   xD/HaBsd2KerjmmldmUNbttlaQu+ggsqdk7OTOCczvF9ohAFRS+DgfQRd
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68060263
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Fwm+mKJm7of2nVCDFE+RJZUlxSXFcZb7ZxGr2PjKsXjdYENS1DUEm
 DdMXT+PMvyPYzbyetpzPtjn8RkH75fcz9MxHQVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dY42YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MR2iaWSaVkoApHJl7teWQJDSC0lDZQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glg3p4WR6iFD
 yYfQQJydCXDbSV9AUw0LK4Tl8y0iWPvUwQN/Tp5ooJoujOOnWSdyoPFDt3RfdCbQNRPqWyRr
 GnG4mfRDwkTMZqUzj/t2nCmi/LLnCj7cJkPD7D+/flv6HWMwkQDBRtQUkG0ydGzh1SiQdtZJ
 woR8zA3sKkp3EWxS5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceXic23
 1WEm9foAz1Hs7CPT3+ZsLCOoluaOzURLGIETT8JS00C+daLnW0opkuRFJA5Svfz14CrX2Grq
 9yXkMQgr6Qosfcp9/u6wWzCjG3vrIPSFQJu1jyCCwpJ8ThFTIKiYoWp733S4vBBMJuVQzG9g
 ZQUpySNxLtQVM/QzURhVM1IRej0vKjdbFUwlHYyR8FJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCkPCI+TfNDKm8gj9yjn5ZLlfvEMZGPxL44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2PG86kn0n8iOrDPxZ5rIvp1nPUNYjVC4ve/G3oH
 yt3bZPWm32zrsWkCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAxMw4Aev1BXvdFTRAlg+OeyHYHqKhS9iVcDaFQ3zgCZLjEfGxPp3SqbbipF7rLwzl6AlF
 aJZEyhCa9wWIgn6F/0mRcCVhKRpdQixhBLIOCygYTMleIVnSRCP8djhFjYDPgFSZsZrnaPSe
 4Gd6z4=
IronPort-HdrOrdr: A9a23:TuM+TKv8TiaBUpQ41cPabD6S7skDctV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urtBEDtexzhHP1OgbX5X43NYOCOggLBRuxfBODZogHIKmnT8fNcyL
 clU4UWMqyUMbGit7eY3OBvKadD/OW6
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="68060263"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qol8O1aWTeKTgkjOBdGziA4SAL7MsAi3oQmeMqfd0P1z0BlPGXbMXZuFZpfNTswT+72dEYMLxu5DxGPbO63tYOWnlRpvd/MzCP66RBnpGDWfdpZ/rpKv21DFsbV5pnJMeHLkmdyEaYVzeWXubTfKBP+sUyjZ2aWYaXv3JM56WL80l8A4q/Uu5HgrPU+7zgwNyOseferUkcdWX5U+f9l0YoSaE1gWKJgaMiZd385mO6Ww+69U9TEnZWS+VT5pK9y+2+7stD4e/rzy5BLfEseCKa/EVZrx9QDezU9WZ2GwDL2V5SiEV5CEvjmGaNh4POAT5/PiI6AzpJJIBrnaEL/P0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5ltZMPfb1En8ZRTwyaZ2htxvbkAIRqrbEdV8aWrCJk=;
 b=JSX91YG7gsvsoZwL+QGKK8hgNNAdePr95lzN0lqBhQs3TU1jMjqlxWt4EqBsyCWgYebnYovYHRfieYqOLKvg88acb1pzg7dehJJnuy7MTGmcNdijupgD5G3J43DOn4RLMfJe3F9ygfz88GX3eR7CZWbOLRrA7Tle1/sRIptSr7uI11fKKzBZwehUJbrOkK1jEdqzT0mXloVEQ9rLzjydFIOyfrewTXIubVTvVNVxurEfLBg/Ur9FiamALqdHeMP0eT6WsQiCNfbUfaz0JMLCz/n4Vw1DHdQ6OETdHEwLBvpFgZixgRtVG/Dq3aUxI7w8V4RMFbrFG2bF/PqjvK3K1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5ltZMPfb1En8ZRTwyaZ2htxvbkAIRqrbEdV8aWrCJk=;
 b=tkU6J6TVby+MrYAeIdp4ZQj7DGZunc54WwMsrYzrdQkxn6YdlzPf1lH6ITO/FEuPY+chpgO1GpKzcGjgykzbs4QrBwp4/dYRLgCssPb7W/tVgAx9ZrLeZUTAIExbu0zaWt2LjFmUfK4HvxJPxkehKty+3mn9v6cMYJtXke5yLZk=
Date: Tue, 8 Mar 2022 15:25:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 1/2] xen/build: put image header into a separate
 section
Message-ID: <YidnUwzaitqSKkwk@Air-de-Roger>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-2-roger.pau@citrix.com>
 <3d08555a-2ee2-53be-d495-d3aaa6ec661e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d08555a-2ee2-53be-d495-d3aaa6ec661e@citrix.com>
X-ClientProxiedBy: LO4P123CA0503.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d69788-1d29-47a7-e0b7-08da010f7df7
X-MS-TrafficTypeDiagnostic: SN2PR03MB2224:EE_
X-Microsoft-Antispam-PRVS: <SN2PR03MB2224DF6F4091EF0B6D4FE6EC8F099@SN2PR03MB2224.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UArKKRfvodMyQLX3g3Pwanf4mKOQkGoSvTuwXo3hb/5lV1KqgHDQcC6ga1zOcPKchWchri0PztBBeSOo0Ktdp7EQ6YzEBZD4qyj3tSmnswZeOn734ua8dj3HfMn6z4188Zs5QBmPm7hU+l+hAWnLR6VJPwzKjKmmqYNTFWn/afy88KYZ8gocIdrb7QlVKkqfLJr1NRE7ZpTuklIzsjqImCK18ItZxOtFYqNGuvfUgZurvVqSLY6QLgoH8JweoihXRb3LEKArTcDs4SKPw97J9ziOKtMfLVo0wBlkZbL6nvX7Sn25HcRLc7DPQl2Gsi3Hsoo8ez54uOQ06HgaefwVhIoUFt0eG4TgsukWPdAR8gxsPhubl1QLrrGne9aRfnjsTVMruHskf5bfdA2girZ5OHhpXOpRQn6kz8ePshTY/BEQiYykv4DdjdeQBPZcU+eZ7B5lOsVEn1Q5eoYwAug2jXVRTz2+wY8FXa/WQfoR7Fk/cjQifuSwrh0RptFHBLVyef3eboEIR+C9R5PuDHK+ngOy8exYA+F6AaXQyR3VIbG+HaWbR3Y2go8rqgJuaGicfWGu0po+LJ+TQMefG/zfo98FRynUL1XZ08Gwlg/WbY+kwTiXjk+edJrFycp8Z/6zLJKAyzzg8HCXgDcQ8X2iFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(508600001)(2906002)(6506007)(53546011)(33716001)(6666004)(4744005)(6486002)(85182001)(5660300002)(26005)(8936002)(186003)(38100700002)(86362001)(66946007)(66476007)(6636002)(66556008)(8676002)(4326008)(6862004)(9686003)(6512007)(82960400001)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNWR3k0ZmpFV2hDZTZObWk3dU9BM1MxMC92OHBKMWNhSG4vWTZzRUo5R28w?=
 =?utf-8?B?ZzY0MzF0L2Q5VFhadjI4ZGQ1NW1OZjNOdDgreW5Zb2pHVjhPbXNQajdxbXRC?=
 =?utf-8?B?emR6VmdoTWUwcHNSSWxlK2l6WlNiQkdKMklSZUxlNjg5LzJ5RWVndjBpVy9u?=
 =?utf-8?B?bWRsMTdkNXQ3d3ZYNU1uS0ROV0p1RGhTRW4xbjRLYklvNG5tWGM1V0ZRQzEx?=
 =?utf-8?B?QnFlYitPSlkzSGhIWjd4dnA4eHhIMklZREw1SkdMdkxkTHhPSVFWOHEyZ1Ju?=
 =?utf-8?B?Uzc5WFIwN1ZQOGJWREVGWGcyN0h2MTREQTFIOFdkQU0xTGo1NUo2UjRGS3FZ?=
 =?utf-8?B?MjJvRjJQeUhxdnUwNzNjbzFyN2RjU0NudU1iQS9HT1pCd1NwcmJ3cU5PN1FU?=
 =?utf-8?B?NHlIQmFNLy81NC9FclVIbEhJUjk0aWoySmhEM2Q0b3dmUHVIUktrTTRLWU9n?=
 =?utf-8?B?bHJkL3RNS2s0SFN6bSs2MXh6bWRkaHYvakVUbzM1d3ZOSlVIakZ3anJ3VzR6?=
 =?utf-8?B?cXdSRFlCR3VocDVmaWc1enBYRE1tMWVxSWUzY0ZqeVJjN01EeWJrNEpNd0lI?=
 =?utf-8?B?bllKOURvL0N2ZTloQS94cnB3NDYySDRRSnpMd0dwdkhLU1VMWDZKQzRMdzNZ?=
 =?utf-8?B?Njh0cXREdnhUQUNBSSsxNk1BWnZNS2xGZmRvVmtIRDNMcWN2MDV4RXVYZHl5?=
 =?utf-8?B?cTN1TDMwOG9Yb0NHS3BUcjdmZFg4ZEFGMW9wbjQwUTRSRk96Ulpyc2hRU3Zj?=
 =?utf-8?B?L3N0cENXc25yRFpqaTlFaTFLaFBJRS9zbndtcFR4SkxxMHcvQVdpNFFheCty?=
 =?utf-8?B?b2U4YkZDM0xlNE5xTG1XSGdVL3lFVXphQ2pxMFVNREZBWHBIRE00WEJNb1Y2?=
 =?utf-8?B?eWJFU2hXdmhCS1VGem0yL0RWV01xcTB3QTdxYmpWN2piYnYxeEJDZWFpbm84?=
 =?utf-8?B?TklRL1cxRnNyRlFYdThjZ2RvTndRbytQN29BMmRLMjRhOXErak9HSkV5NVZu?=
 =?utf-8?B?Y2I2THZyWHIwbzU4MWtwUnNDWnQremhiWU9kRmtDTE1oQWJwYlJwZk5Ka0sw?=
 =?utf-8?B?L0IyQmo0cCtYcEF2c3FDZEVMZkpjcW9nYkxRMVVveml5NFRDSFhUZ2hINmE2?=
 =?utf-8?B?MFBtRE1Zd3dTTnBNQkxXVzA4WThsamRqdTRudmRiaHJXNk45WlpmWERBMjBN?=
 =?utf-8?B?bURJZEFBSGVGRTEyY2pja1VDT0R5eG1QaVQreFFkcXBMaEZVbE1ZYnlXVHFT?=
 =?utf-8?B?bTVDVjNBcHhBenNUZzU4YlQvamkyOVl6NUdhbHRCa0dKcXNQdWZlN0tGNEJk?=
 =?utf-8?B?MCt6Zk9sU1IwSTI0QXMzZTRQR3ZqdmtJYWF6cHRpZ2N5QVVaNzRSQXRtSlBZ?=
 =?utf-8?B?SGxBdU5SVXFjV25tVVFzQnBLSTJqYXl0STQrbWRmdlhWN0tCSXJHQ2d4T1p3?=
 =?utf-8?B?cDFZQU9KMW5YVTFvLzRQQUorVDBYdndibks2c3I4dWdtVnV3U21kUEUxMmNx?=
 =?utf-8?B?WjFNMldkelFPNjlTbG1BcysrM08rU1Y2ckppR3FvaUdGeWxxNGUySWx0S2E1?=
 =?utf-8?B?WEhiaEt4ekYvaFFYblAxeVdEM2pqT3lMME9RN3AxaS9NU0kxRlNMc2tjcCtm?=
 =?utf-8?B?di9mK1UwQ2w1OVpNQzdPT2VnMnN6REtTR1RLUk1NT2JQbys4RzZ3ODFscG9o?=
 =?utf-8?B?MnBaSG5HNHV6QUhSdUMzblpBOGdEZC9VcHJJekpoNEYvUWVqSW0rdzNpMDVY?=
 =?utf-8?B?ZjVWRDd5b2FlNDAxNDRTRHhtNFpMa3dPWFJKdW1hLzFXT3ZNSjkwTFN2eTVL?=
 =?utf-8?B?VFYrbnRjNEhjbU9RMHB4eXRjWE4zRWZacWhSSXN5M1VEUnllWE5FYUh4LzhH?=
 =?utf-8?B?QkcvZktYK3pNalB6RGkrc25yTkNDRHZDSUh6RVJFdDRiOGtPM2lDT05Eb0c2?=
 =?utf-8?B?ekVQRVMwZVpKNlJWRUFORFNncWN1MHovOVpWeFZqWHhZK2JFMGdVVDJxNDBj?=
 =?utf-8?B?VTZkL3BVS0xjMTdlaXhpSnZZSHhyMEhZMzR1RXRieDlwQTRYRWRobDdTeVh0?=
 =?utf-8?B?dFFvZitDMEZSMmt2a2NkSVlrOWdGSlZWVC8vWVAvdGVqRUdxSk1wc2QyRlNm?=
 =?utf-8?B?Ri9XSEpUTDlrL0ZzdzdZcFkzUXBORU5QaGYxYnNNWENyU1pPTjB6YmF2Y0hC?=
 =?utf-8?Q?MhKA0zmGiMN/neNmFXcwDdA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d69788-1d29-47a7-e0b7-08da010f7df7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:25:27.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ast+iOvPt6WrelALPiRKtFe5RsC1C5BgWZu0x/GJ9HuJ15/l2pu0/bITd45uMh1Ud1fJpHQdNjLZP58rSLq/1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2224
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 02:11:28PM +0000, Andrew Cooper wrote:
> On 08/03/2022 13:49, Roger Pau Monne wrote:
> > diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> > index 08016948ab..47d09d6cf1 100644
> > --- a/xen/arch/arm/xen.lds.S
> > +++ b/xen/arch/arm/xen.lds.S
> > @@ -30,9 +30,13 @@ SECTIONS
> >    _start = .;
> >    .text : {
> >          _stext = .;            /* Text section */
> > +       *(.text.header)
> > +
> > +       *(.text.cold .text.cold.*)
> > +       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> > +
> >         *(.text)
> > -       *(.text.cold)
> > -       *(.text.unlikely)
> > +
> 
> Most of this hunk wants to move into patch 2.  Patch 1 should only
> introduce .text.header.
> 
> Same for x86.  Can fix on commit.

The justification for doing it here is to better match the ordering
used by the default linker script from GNU ld. Obviously this also
benefits the following patch. Feel free to move, but I think it's also
fine to do it here.

Thanks, Roger.

