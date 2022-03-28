Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D14E9AD6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 17:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295493.502857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrAE-0005sG-TZ; Mon, 28 Mar 2022 15:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295493.502857; Mon, 28 Mar 2022 15:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYrAE-0005pC-QS; Mon, 28 Mar 2022 15:20:14 +0000
Received: by outflank-mailman (input) for mailman id 295493;
 Mon, 28 Mar 2022 15:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ynyj=UH=citrix.com=prvs=079c560b7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nYrAD-0005p1-04
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 15:20:13 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8daba7f6-aeaa-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 17:20:10 +0200 (CEST)
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
X-Inumbo-ID: 8daba7f6-aeaa-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648480810;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=t0QYkUvEqX9lFMQEFNBKVXQTF6KzN7PxesmJ3wwwQzY=;
  b=WueMmwLkobpbYcrn4u476ARAoPhRLkJOETskmUaalESqX9TyTEjL0pSs
   3/Hc+znZa5HEEcR3wB9SueVju9WgnrrDPVJWZQDNOkNX/iq2aUZidtAln
   YFPjyOCJjx3SasXdoK+hdr4NhhrXW4JS0mzVXI/IL7wQSX1CZnOJpWAEh
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67253827
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4jA7568SVSvFk5GO6rPTDrUDlH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WUaWT+COvqOZ2rwKdkjOtzl/E8D65GAytFjGQpvpCE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oLpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZa9eB8RGerpobwEWEBhOARYMZdo1ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4RR6uFN
 5BGAdZpRC7mfxcQYQxKMshgu+eqt3LPahcbkU3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9QvkXKoCGbv+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0UddhC9UdryS0krPfuj+yI04IdBBsQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP+D2BLwQKChRqlEGp/ZgPb1
 JTjs5LChN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGEifBgzaJhfJ2+Bj
 KrvVeV5vsU70JyCN/IfXm5MI55ykfiI+SrNCJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DbSmO3KNoNdJRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKl7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:to2mma4cpEPnnhgm2APXwPvXdLJyesId70hD6qkmc20tTiX4rb
 HKoBx4vSWftN91YhwdcL+7VJVoLUmyyXcX2/hyAV7BZmnbUTCTXedfBOLZqlWKJ8SZzIBgPM
 xbAstD4bPLbGSTIqzBkXGF+3pL+qjizEgI792uqEtQcQ==
X-IronPort-AV: E=Sophos;i="5.90,217,1643691600"; 
   d="scan'208";a="67253827"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0IV10VqGBfPaY79kloG3wvKLLLqwBBpyCsNTTMMKZ8cnuHsZo/Ekn71A9+/5Ui0V452yDmvGwJaJaxHrdJBbt27Nv2LfYQgxfhzEKTxl7dCF2lcWepmVxnu8Wgdg3ynlCZ3Rjg0mDMgle8xkTwRjuyVz0oWBVRMbieaUtC3fm7d8GsbRBXKsKsyWtiMhRRaRlOPyHIIUD7Bxud8QACpoWxMVyEAQR/kCnYZZwDrRZMm0BmGEVB8qIq6hQ1qnzBCIy9K2rpC7AKWE655Ycnai3kaummHF55vi0+3V4LA4Wl7MpuVpH1S0QpqN/hPRjuvjQt2vs670nAKUm1OEVdK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lM8Q8VdPi7mV2bL9P5TFzN1kXs7rH6U8+nD1vY3+orc=;
 b=Vp53GmiW2ooqJpDU16w+FgWnJhRsUsUhda0DD3qlCG+OQShFu7hviH8ls5vmi9N6Fj2CPu/9VZYntFLAh58ZNbyPXHozegBuHi087Vu8dNvej0k/zBvjtgdD7EFPm2jDosPY7NuvfFtvibxK7Ka4zMT3xWPlmZilvvTileeA1oWJQ18XZCfQAjKsV5a4LTP25GU9Uwq3OPO4rul7m10aqKZdJv3upOVmIfvHD6B9XskDCkmeX6SqEhQ/5y/No20Vxj94hBh9NdRCp10XK3R0rri8M6mwOXrwBh9kYv1OGGA/McFW0C4//ktsC+GXaqfbgPXCmjPZicD7K8BlDnyMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lM8Q8VdPi7mV2bL9P5TFzN1kXs7rH6U8+nD1vY3+orc=;
 b=Z40Zhxsduknkq6I/K8jagsQQNulBgLPpBZnwROjo+oXWjZQdAJKidXrycqx3P0YErKYp6U37cSrriSVlXu3wp20jAwab99hgC6dfhyL9nX7x0L62lsJ4gHXCQG1I0VMR0qJZiSY9zwvTboFXtJqgnn+iB9QREMRCyuuLvpZlU28=
Date: Mon, 28 Mar 2022 17:19:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Message-ID: <YkHSHj9nlE50F5NB@Air-de-Roger>
References: <20220315141807.22770-1-roger.pau@citrix.com>
 <20220315141807.22770-3-roger.pau@citrix.com>
 <033ec463-f20a-a6d0-d877-51e4f476a316@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <033ec463-f20a-a6d0-d877-51e4f476a316@suse.com>
X-ClientProxiedBy: LO2P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60f36b1f-f4e1-488c-120e-08da10ce6f05
X-MS-TrafficTypeDiagnostic: SN6PR03MB4029:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4029DBCD01B124112EACD7868F1D9@SN6PR03MB4029.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UNVeY+n4YLNcZMw+rL5fB9K/SVHSiO1ieolWWVMz1pp9GvuBNCd26WttQW/0Cp+S0cHs1TDlkckzf6tMhDJc1Sj9PbTpZBWn1t3CkKh+B0vUMqNNRLNIxHZzUWDPTG8edzIicJeeHbX+7azc1k5msLMtySd3Not5Pr2J4z+ZvD/EYS514iLyZQx3ssmhF3Vken7ZDzCNbGTgd5TruRCK2KysGMUy0rxwo16VbNBcrxb/i15TV0oeiTzKJ56ckt1WIxo/RJG165BhD1v76HZgYFOCxI8vDf10D0atPtTCQIex9kOjF/BRkXgtTyB5kSnPasPfoBkEAfraVwBcZ0D91Il0A+pNMMP64WQ5RuxEgLzZ8wIy4G1JwWipPLbZ0g14wE4BvrCdlCP37AT1K7qtalP7oKyHM7JWFO8d3BFg5XsEIhwDJfZzEcL8rdyOfgUfJGFWvwnYFd9WtmR+2ylin2rCFwp507AI7q2xXoDmVgU6+K90V/YUIctkiaJFqgIlH5DZhA0oRG1A5fe0HTxUizSqa4LhlX6YQ2KuxGSzGQ7RoOJAPTOF5FkyNOSOJqLs+QuzkXmbs4HWjEPMWnKgMkpixj34vrPzeaEUaDVGZ7r60ZS37rk5ekYywI3/A7qOVh3zaMFZB3FVLC84Ot6MIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66556008)(4326008)(66946007)(8676002)(6666004)(6486002)(66476007)(5660300002)(8936002)(85182001)(83380400001)(38100700002)(2906002)(86362001)(54906003)(26005)(53546011)(508600001)(6506007)(82960400001)(33716001)(6916009)(6512007)(186003)(316002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1hvMWhPZnd1WUE2QjcxelUrNStSUHB1ZWtHUmZXRDVLdnkxeXJYc0VFdGps?=
 =?utf-8?B?WWRheUJZMU5YWWtFSVo5bE83akpSbWdIdm9TQmRPMzNLaDFCZCtJbnhwOWpl?=
 =?utf-8?B?TExQVWxwUEx1VnlmOHB2V3JxZWpoeHViV212TWFhR25Bc3pWTGNNdE9nSmxK?=
 =?utf-8?B?UGNzUkVNVnVubFp4UVdkeWt2LzVlTDlUTEc4L2pUMUFRcm00VG91VmJscldT?=
 =?utf-8?B?N3BqTTZzUnJaaitjaWdnaUpRNllZVjdvSFpJandMYzZTMVJtWEprRk1DMy8w?=
 =?utf-8?B?a1VITFFUVkpmbkFEYmYxNkEvd0NrNTlybkZXT01MTW1pb1YwcEtrQ21sbTFP?=
 =?utf-8?B?Ulo1cVlCNkk3YlFGdkJXdnlBSkdnOEtYRUg5L1pvRXVjRVYxWU5QN1N4UmxZ?=
 =?utf-8?B?U1hPMlA5WkdpTWkwY29FOHFQOTRxVVhqVUlWQ2VteUhvRlFVdkE1QWNhaE1w?=
 =?utf-8?B?UjhsbGVYRnZhOEpxclVMckFCMnMwQTlzL2hubFdLT1VSM2pHMDIrSmp4TGRU?=
 =?utf-8?B?NkJzNnZHRmwzckVOU3Zsd3UxbFloUkxqZjhvRVM4ZlJxVTRGeHBEWEJxTVow?=
 =?utf-8?B?c1h1S2gzTnlxaStLRThVL2JLaURESURjMWhiZU45alkrSWdUMUJ4MWhSUlV6?=
 =?utf-8?B?RWJNODZPSXkyNklxNy8wZGZpTHB2SkI5YVF4UC90dWZwLzdmZnFJMU5FWEU1?=
 =?utf-8?B?RHF5Yk84cVh0dFp5L0ozUlRwSERMTmwxcFVHaCtVemMwaGY2U3RTTkhFZzZ6?=
 =?utf-8?B?ZDZFdFN6R2ZDYVZDNzkyZ2hESmcxaVMwV1VsZG1BQzNHdjFrejFPVFNNcG9o?=
 =?utf-8?B?akQzWE5zQ2FwZG1YT1hweXdKc0syRjEwYnV6cmNOakJYZnZYa3ZuTkVqYng0?=
 =?utf-8?B?RnozbzcvWmxla0tkRnNmUVVLSkp6VmdTMWlITjN3L1VIY2owWDRLWWIxNkE1?=
 =?utf-8?B?R1ltKzZvbXlhaWNlT0xnRUgwTTRxb1BJb0RFaDkxY0ViMkRNTENZNCsvRkJw?=
 =?utf-8?B?OHhJWDFGbVFnaXNwWWJiYk9uVmdDeTdoblZHOXc1cWdOb3JXZVAyZVJLbzRk?=
 =?utf-8?B?QjdwSVZFUUZLZDRCR0dBRXROQ1lGSHdkT2Y4TzJkcXg1eDNxRXVxS1QrOFZ6?=
 =?utf-8?B?OE02b29rTFh2TDZRTFNZN0JQMm1NMEN3RnZTQnJacllwY0ttbTY4SDN3aU5a?=
 =?utf-8?B?SmRYckh6cWFLMHo0dFJ5akt2cCtTYVQ4RGpRQWJwZDNSS2dyakcxWllmczZN?=
 =?utf-8?B?VWZKUi81aElxV3JudlJSZlhmSG5WN3M1Y3hLb1JkWmtnWUxoTHN3UXcvaDZz?=
 =?utf-8?B?MXI4UkFOMHJoUFFVK1FrRHhxaDFRaE4xbTVZVG1wd3RNbWJUcE9uUVptUkQ0?=
 =?utf-8?B?bmY2UUo3WXYrcmhDd0psZWtMdktHbm01cGMxR1ErdDcxRGpOWm1sN24wOUwx?=
 =?utf-8?B?QW4vK2g2Mnkvc1VLNGpsL1NhaTgrVUluR1NCQkREa2dyaE1TY3YvSmhYYmpR?=
 =?utf-8?B?U0NhUDFjUFZpL2dVZGNiMTlPUzM2cFNYZ0I4NGgxTU13ZGhTRE00a0dqOUhJ?=
 =?utf-8?B?akcweTAzK0lzODRibTF1bG1ZaXVpSUljd21VRlJnK2kxLzU5VlZnWGo1M2ZS?=
 =?utf-8?B?alRKV0xQMWhoK0RwemV4c2tMQnlkeDhLT2V2UC9XMEd5bkhlMlozZUR5MW9t?=
 =?utf-8?B?ZUdKNXV0NkhGM24xMk8reE1TNnVuS0k2cXFrK3h0S1lzN1ZHNGxvRzZhcHFX?=
 =?utf-8?B?K3J3eFFZYXJXTVNEUmU5TFZYenFFQXNMbjh6dno3aHl3QzAwOHN5Njl5aFpQ?=
 =?utf-8?B?UUhJRFNhQjIyUlFCYmhTaU04cmxiNGY2bU5WM1BhRHV2TmxMU000R0N2UUFl?=
 =?utf-8?B?WEJqSDYwZEIxUjIwQ0ZPQmFMNHBPZGZ5emNHaFBiN2k5RElSUXA2OTBNWFZj?=
 =?utf-8?B?NE90NXlEcXJjODdjVVEyZUVBMW1mY3FJc1h0UW5nQ1RnMTdrSHZPSEp4b0Jy?=
 =?utf-8?B?ZHVybnNCck01dlZzWlloaXZrV0diWUptZ0VOL21XMmNxWTYxLzlmSVFtZktW?=
 =?utf-8?B?TnJiREsrQXNnVWxzN1Q2bzhRTTNNekZKWG5LTzQyQkljYjRZejE1V2lRaFY3?=
 =?utf-8?B?YXI1TUVtUDFGSHk1SFNrZXlKb1Vkc29RWnJyWjZXeVdwUTRIZGUwcm1OMHY4?=
 =?utf-8?B?QkFPVnlsQUFUT29MYTFXYzR2T1RBaWNUQjNvR3JsdnplRWdDVXlEenhlVC9u?=
 =?utf-8?B?SjcvL2x1ZmpBSlN0TGptQkxORFEzM0xTbUFVS1lHUmEwN0ZDRU0zY0NSaDhj?=
 =?utf-8?B?TXRGMis0NC9aNUVLM2JuZE1GdEdaY2FnT0YzU2JEODNiMUdFODVvK2ZHRGg2?=
 =?utf-8?Q?PkEwhjNkf8XVS/gA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f36b1f-f4e1-488c-120e-08da10ce6f05
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 15:20:04.1550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io8ipKYNZp5ugt72HPNfapKFLKF4Vj3YLprkX5Siu/NG2avK4sU8tlZekOsiEQwankn1cu8aV24xw/KWW63t0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4029
X-OriginatorOrg: citrix.com

On Mon, Mar 28, 2022 at 04:02:40PM +0200, Jan Beulich wrote:
> On 15.03.2022 15:18, Roger Pau Monne wrote:
> > Allow HVM guests untrapped access to MSR_VIRT_SPEC_CTRL if the
> > hardware has support for it. This requires adding logic in the
> > vm{entry,exit} paths for SVM in order to context switch between the
> > hypervisor value and the guest one. The added handlers for context
> > switch will also be used for the legacy SSBD support.
> > 
> > Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
> > to signal whether VIRT_SPEC_CTRL needs to be handled on guest
> > vm{entry,exit}.
> > 
> > Note the change in the handling of VIRT_SSBD in the featureset
> > description. The change from 's' to 'S' is due to the fact that now if
> > VIRT_SSBD is exposed by the hardware it can be passed through to HVM
> > guests.
> 
> But lower vs upper case mean "(do not) expose by default", not whether
> underlying hardware exposes the feature. In patch 1 you actually used
> absence in underlying hardware to justify !, not s.

Maybe I'm getting lost with all this !, lower case and upper case
stuff.

Patch 1 uses '!s' to account for:
 * '!': the feature might be exposed to guests even when not present
   on the host hardware.
 * 's': the feature won't be exposed by default.

Which I think matches what is implemented in patch 1 where VIRT_SSBD
is possibly exposed to guest when running on hardware that don't
necessarily have VIRT_SSBD (ie: because we use AMD_SSBD in order to
implement VIRT_SSBD).

Patch 2 changes the 's' to 'S' because this patch introduces support
to expose VIRT_SSBD to guests by default when the host (virtual)
hardware also supports it.

Maybe my understanding of the annotations is incorrect.

> > @@ -610,6 +611,14 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
> >      svm_intercept_msr(v, MSR_SPEC_CTRL,
> >                        cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
> >  
> > +    /*
> > +     * Give access to MSR_VIRT_SPEC_CTRL if the guest has been told about it
> > +     * and the hardware implements it.
> > +     */
> > +    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
> > +                      cp->extd.virt_ssbd && cpu_has_virt_ssbd ?
> 
> Despite giving the guest direct access guest_{rd,wr}msr() can be hit
> for such guests. Don't you need to update what patch 1 added there?

Indeed, I should add the chunk that's added in the next patch.

> Also, is there a reason the qualifier here is not in sync with ...
> 
> > @@ -3105,6 +3114,36 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
> >      vmcb_set_vintr(vmcb, intr);
> >  }
> >  
> > +/* Called with GIF=0. */
> > +void vmexit_virt_spec_ctrl(void)
> > +{
> > +    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
> > +
> > +    if ( cpu_has_virt_ssbd )
> 
> ... this one? Since the patching is keyed to VIRT_SC_MSR_HVM, which in
> turn is enabled only when cpu_has_virt_ssbd, it would seem to me that
> if any asymmetry was okay here, then using cp->extd.virt_ssbd without
> cpu_has_virt_ssbd.

Using just cp->extd.virt_ssbd will be wrong when next patch also
introduces support for exposing VIRT_SSBD by setting SSBD using the
non-architectural method.

We need to context switch just based on cpu_has_virt_ssbd because the
running guest might not get VIRT_SSBD offered (cp->extd.virt_ssbd ==
false) but Xen might be using SSBD itself so it needs to context
switch in order to activate it. Ie: if !cp->extd.virt_ssbd then the
guest will always run with SSBD disabled, but Xen might not.

> > @@ -1069,6 +1072,10 @@ void __init init_speculation_mitigations(void)
> >              setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
> >      }
> >  
> > +    /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
> > +    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
> > +        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
> 
> In cpuid.c the comment (matching the code there) talks about exposing
> by default. I can't bring this in line with the use of !cpu_has_amd_ssbd
> here.

Exposing by default if !AMD_SSBD. Otherwise VIRT_SSBD is only in the
max policy, and the default policy will instead contain AMD_SSBD.

If AMD_SSBD is available it implies that X86_FEATURE_SC_MSR_HVM is
already set (or otherwise opt_msr_sc_hvm is disabled), and hence the
way to implement VIRT_SSBD is by using SPEC_CTRL.

I think I need to fix the intercept in that case, so it's:

    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
                      cp->extd.virt_ssbd && cpu_has_virt_ssbd &&
		      !cpu_has_amd_ssbd ?
                      MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);

Because it AMD_SSBD is available VIRT_SSBD will be implemented using
SPEC_CTRL, regardless of whether VIRT_SSBD is also available natively.

Hope all this makes sense, I find it quite complex due to all the
interactions.

Thanks, Roger.

