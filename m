Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA8449741
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 15:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223412.386119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk638-0004MD-1f; Mon, 08 Nov 2021 14:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223412.386119; Mon, 08 Nov 2021 14:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk637-0004KH-UI; Mon, 08 Nov 2021 14:55:05 +0000
Received: by outflank-mailman (input) for mailman id 223412;
 Mon, 08 Nov 2021 14:55:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d70C=P3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mk636-0003vg-AG
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:55:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9bb4f14-40a3-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 15:55:03 +0100 (CET)
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
X-Inumbo-ID: d9bb4f14-40a3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636383303;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=utHCTMZrILp3s2D9e7j/UakdgUmNbri4ouoNGVdrwjg=;
  b=Q8PcpdLBiO6bJ9oiSQOTo+x0XMplgK5iah9RI85bl1DS5+NXUYhXxA4f
   Jg4lqCRTMFDDXau4+5N46UEHujHWN0Mw/eY/n4YgDM6VBDLr0gewRoMHF
   m9+CFLz3whdMyvS3RuD/W1xd76mwjfI7k2/qbRBOJGTQEHBhzacy3g71E
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +ARwKXGJqmyXxres71OVjUApJ/rfLC/aV2PhTXbZk14qwyV62k3tgERQhxZSD/LnV6f7+Am8Kb
 E7FmeC0CCvlZ/rHBEwMHloeAfU+w4LfEPKgTauBqa1JxRVoIyPeSL10RWUIfcw/8L7Wx0HawW6
 qT63TxqaLjsDoe8vXYSWPYoJILU89k90uQhPPi7F/nIPi2mIirlkoswyXbNnP6+A+FTbFvZuk9
 wde9Qocht5ASlfQfA2HuI9gWo2CzJhb5vdphynrkt17/AaHcaJDmEFh2l6lZeK4jOqZ3bsGkSI
 Skjr+yIR4V+Zi9W8FdyclURQ
X-SBRS: 5.1
X-MesageID: 57702826
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Hh2XXKpfB1Wcn2GlY04SHnXIBYReBmJVYxIvgKrLsJaIsI4StFCzt
 garIBmGPPeNYTSjL9sgaoyy/R8O7MeBx4BhSlFs/Co2FihG8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2IDpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncGidSwLIZKSpMBeCB1xAXlvOL9f/ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0RQq6EN
 5BHAdZpRCvuWgdzOVU7NLAZlqCJwV70IiF+g13A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZUh1mUyn0WGQchf1KxqvmkiWazQ9tab
 UcT/0IGoaEs+WSxQ9L6Xhn+p2SL1jYeRt5RHusS+AyLjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht9L2BxR/vbuNU3Wf+7yI6zSoNkA9MmsqdSICCwwf7LHLsIw1yx7CUNtnOKq0lcHuXyH9x
 SiQqyozjKlVitQEv5hX5nie3Wjq/MKQCFdouEOHBQpJ8z+Veqb4dbCDy0fks8pkb92dZ0vZr
 X0Wgs23ubVm4Y62qASBR+AEHbeM7vmDMSHBjVMHI6TN5whB6Fb4I9kOvWgWyFNBd59dJGS3O
 BO7VRZ5vccLZBOXgblLj5Vd4ijA5YzpDpzbW//ddbKiibAhJVbcrEmCiaN9tl0BcXTAc4liY
 f93ku72VB727JiLKxLsFo8gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/l6Lq
 I8GbpfWm0sDOAEbXsUw2dRCRW3m0FBhXcymwyCpXrfbSuaZJI3RI6CImu5wE2CUt69Uiv3J7
 hmAtrxwkzLCaYn8AVzSMBhLMeq3Nb4m9C5TFXF8bD6Ahil4Ca7yvfh3SnfCVeR+nACV5aUvF
 KdtlgTpKqkndwkrDBxHNMGs890+JE3DaMDnF3PNXQXTtqVIHmTh0tTlYhHu5G8JCC+2vtE5u
 LquykXQRp9reuioJJ++hCuHwwzjsH4Dtvh1WkeUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxSu45za8369b1iaVdywBoQCfCY1ixU+syKXiax8hf8KZKw+YB6wexX
 0uO/PhcOKmIZ5y5QAJAelJ9Y73ah/8OmzTU4fAkG2nA5Xd6rOidTEFfHxiQkygBfrF7B5won
 LU6s8kM5g3h1hdzaoSajjpZ/ninJ2AbV/l1rYkTBYLmh1Z5ylxGZpCAWCb67IvWNodJO0guZ
 DSVmLDDl/JXwU+bKyg/En3E3Ox8g5USuU8VkA9edgrRwteV1OUq2BBx8CgsSlUHxxpK5Ot/J
 2x3OhAnPq6J5Tpp2JBOUm3E99ut3/FFFpgdE2c0qVA=
IronPort-HdrOrdr: A9a23:36gQq60GTZRWAigut+ABnQqjBShyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhQdPT2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.87,218,1631592000"; 
   d="scan'208";a="57702826"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLq1KAdUKJ7DjmAyRqOTjkPLEIYR2KmQFOyO2I9S25iMTKN7rxTGNG4158oK97UtoNcNT+Mfix8uhusUU0u/qVrOCsXNQamDSL3015CHtn0W4RU7QugNljeP0TMh+poW4P4BUPB4Vh8ZYiQrEkBkRMt12djqr/Y0rQRI4wb2EQMpkeK/1K2Hmpnoy6aPZdFhFxxQgNDWAG/PJRNO9exs3NTX3pXvxS0PCm4X/3K+S/XOYVFqPnu+53DxM8kY8YyD2/nyPJLFv9Gu7YF6Y0X5ykL/0TpfE8j2X6KChK08gUdvSNAqR8YGPtl3yvseQ0anrofRKiWfIe/laD85PhFuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4dXLwhRCQmoR0TaLqZfQ9kL11x5WQRuTpUgjxYI9aA=;
 b=M4w5wETdYYVpWixmERV094cp3/rTIp7XzIDEFE0dwUO8sG4pYFEwcB/2AAhFC3ra3PeX3eXaV7ufnERkIlI9Ra034ClAZvvWn0+hP+nSq4BNtVy9UfMQSJXYvvBJqRs3UuaGdjGmVm9yCQO7WMOA1Ijlk6kbTa1yYUUWQBwl5DzJOia5vncqgnhOiVyQK9FxMTbjh3KyEfRJEtcXfErYLcB7UMw6hPN1F85BzeIXFJ67H5yv/IWY8dWYqS27smKXqlitFwSdtrjRGt9bxTs/iLr6Gq8Oc9vIwp6wU4hh99rBFBhnXEzJ7C1zjfq3LECG63x9CD5o7z1Gk/to8T4syQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4dXLwhRCQmoR0TaLqZfQ9kL11x5WQRuTpUgjxYI9aA=;
 b=CsCP7pmvf+ej8BylgrxE2uyLxvhSN9Or9OCghmpp1ihhc0aggY6nmCib2qbH4UqZuGq3cGglZZ8bw6h9Z7tCmB84pKEL3aP2RerNC/Pxmkyt6x0CsNvG6+2BSBjO9Rp3MM0TXtfguJQTwxETKYP8E0F/QZ7MXl1KQxaB2xVOMrc=
Date: Mon, 8 Nov 2021 15:54:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
Message-ID: <YYk6PLe+Vkfo4xFv@Air-de-Roger>
References: <20211104104834.10977-1-roger.pau@citrix.com>
 <24963.52610.316896.770905@mariner.uk.xensource.com>
 <8ae2c1ac-b220-a5ab-920b-244590ae3ef0@suse.com>
 <YYPkx7148Ive/352@Air-de-Roger>
 <24969.14415.979563.323346@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24969.14415.979563.323346@mariner.uk.xensource.com>
X-ClientProxiedBy: MR2P264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed999b46-d6aa-4074-9108-08d9a2c7bc03
X-MS-TrafficTypeDiagnostic: DM6PR03MB3913:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3913D227FB4F1008B51F429A8F919@DM6PR03MB3913.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ok7ieeWvES5qcUUat8H68Y6YIhAqAHdpPHaj485dSaEsnei2y22uAmpasxQYp/7RdIZcdC8ZxFEb8QNexoV4PUw15CYYeib7KHFuOt2uJnyEGbN4o4z79p6k2HSuu5RUwRcIy9zg234hqX2g2mt1kZNCovSVQ0bPsdwzNbCEx8Nnp1XCNbBJiKdppcqe+UG0T5Hw7EBpdXkTRPt0s6vnlI6dNpM8RJ1xholtein8Zu+xLt3JpcQsJB8iDF175oT96VSw2P/GKJj3xaHta2UvYeRfMe0Y1q0GFmrRQFywq6XWU9BvaijfYDf3XUze/AEhGEdnKhWWkgbUIYjlprku3rXv3qjxSjt7qsA9efnYmb+fq+JD4YWzhuTSWl4tg3vImAlYFB1qc03TPvNjg18+meaakXfKOZTQvR25BD3K1AG48y18UxE2KqQEWunSbwJ3Lm9j2zSBSmI2qnJsmSjE+7q0KF6M5HvYiymhyvofQ3Dzg5475mhb722zwgy72CceslXq4jJiYLFvMoSxGETd8gwtvfLlmTLpzCplPbFGb3cJb3yuUfYHMLDQ9idn5MQXEC35FgMfkKpdK922P4K7S/N4nHhsxJrjv2XyVQRM9CdRO49IicdUEfZB+SpGmMeIJDtNlxf151y7SmpLSLNQmV1/g9Wl5RGh/DNh088TcDT5fyytAL6BcEv15bYpHNoBugJqX70Hu9nBc5vyFftmyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(86362001)(956004)(4326008)(66556008)(2906002)(6666004)(54906003)(9686003)(26005)(186003)(5660300002)(33716001)(6486002)(6496006)(316002)(6916009)(82960400001)(85182001)(8676002)(8936002)(38100700002)(508600001)(66476007)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVl5YXhvRGVIZGpidklmYzErZ3RVNUxjSlI5OG1jLzdIN2V0bmc5cnZUQXo0?=
 =?utf-8?B?ems1Vzk5MWRxaUhjUDFMN2EyYzl3TGdVWnMvQWUxK3EwVU5vMHpRazU0cmhX?=
 =?utf-8?B?ZWtCVzdCS2tONDA5b0xwYlRnWndQcnFUV0NweVhyVGl3eTF5QkZOd28ybWFC?=
 =?utf-8?B?alBYc2NvVjR1aFFCRTJjTmtFWXd0Q0Q0cFozd0pkaVQ2L04vRURweUg2bG14?=
 =?utf-8?B?TlNhMi9IMUk3MHMvUmNLNGpFZ0o2dmgyOW5XOUs5TVFlKzZac2Nhcm1ldHo5?=
 =?utf-8?B?WWNNaWVEMUZhWm9uSjhzNXdtc3ZpQ1IzNFRxVFlCVEN1K252YVJGWE1wYVM4?=
 =?utf-8?B?NHhMMU9JcUJ4cG9pbEwzUVVNOTVnbzJGR0ZZSys5RW43RkQ3SHNWTVBWNVVO?=
 =?utf-8?B?OGZsMHpwM2pMRWZJRVUyaE8xRWNpTFBJdjEwNkJwLzVXMllJMW1PcGpuN2x4?=
 =?utf-8?B?eU1mLzJHZkhvYW1RMVN5ZE40MGJTSERweG11TFptL01NRG1YOVNNdWY5bXlt?=
 =?utf-8?B?eVF2N1JvTHFXMVVBTkpyMXFaT00zQWhLN0M2WlZXK1AxbFVjc0pnTXMwcFBa?=
 =?utf-8?B?UXkvcVFQLzRMUDA4bXFvN284M2w2S0lzQyt1NVVkK0txYkN3T3FaR052TUxG?=
 =?utf-8?B?SlBQUk9LVUlvcnNWMjRrbG5yaGs3cERjVXBTaWZIeU8wVTMwbUFLSHcvbkp1?=
 =?utf-8?B?ZWl5b1dHMmduWmE0SnczQU5ES1NiUlBUa3l2OHBPd25uL2J6dGN1MGgrUTlJ?=
 =?utf-8?B?Q3kzSmdHWVc4RWpwNVhuZ3liUDNseXVJNmx3NGpWbTEwWXlCZkpPZE1lbHpm?=
 =?utf-8?B?TDRaV0Q2Wm5HK1RPRmZyM1k3U05mUm42ZThDbHJaZy93cDR2VEpPWVFuVklI?=
 =?utf-8?B?TytWeUI1cGlidTJLUExHSFk5VEVOdlM4TVJKYkc4V0w2cjFFcHVwUENEVi8v?=
 =?utf-8?B?VGlOZEcwNWI5Y20yclB6UmFnUE5VdysvYjRsR1duc1Y2Ukdnd0U5VmFOQnlG?=
 =?utf-8?B?YWo2NkhYeWZKS0ZFdFZNb2dES3dEbzIxK0cxTWlld0ZYVVpCWlJTYWpxNDMr?=
 =?utf-8?B?ZmZzQkc4aFlFK1Z5V002NXUyamc3OXFJbHM0bEs5RVpraUFJU3ZxenI2Ny9S?=
 =?utf-8?B?S1d5SkxmVmMwODI0SmlKeEZ6bUdrNTh0UEhlY2V6aGpMK2JaTGxnK0IrZm81?=
 =?utf-8?B?RzNDTmZSTnkxZk1oaXFNYjNMWVhZaHI0ck5RZEFXaWFYak1raWRCQnE4WWJo?=
 =?utf-8?B?OGVyQzA2RlVodWlSWi9wZDZERGkrTkxqTThkaFdDSmdOZDBXWHlXdWZWK3Rv?=
 =?utf-8?B?SXJEZ2ZzYjlzREpPb2ZieCtlSExmeVp4V291SVNMT2RrQjVNbDc0L0lLUmZE?=
 =?utf-8?B?ZmVhQ3cwNWJyU2d2MUpXR01XMjYyT2lsa1pQMktaMGY5VThidGV3c1hCc2Vm?=
 =?utf-8?B?K0dMcGxiampMZFBVR3hxN0FOVHVwbnFvRE9GY2YxUzRXbmIyNlBIeDBoUFdR?=
 =?utf-8?B?Y3I0OEwwL0hYVnBSYnliYmhFdGIvVXJGWjNQQ0FsYnRQRzVOVjNBSEtsZ3hu?=
 =?utf-8?B?V2hrVW1TL0NwbDZGcDVKTDEwL1Q5aXoxQ3JsbDBMdlJBWGg4TlJUb3owK2hP?=
 =?utf-8?B?U1BQL1NUY25aTldxN0c3ZGdWcjhjR01RS3RDbUV0dGRHZ3g0WTJvZWJaemN0?=
 =?utf-8?B?RndFUkdRZ2h4Vk9NRzVpOGJFbGFHaXFBaUZNK0gzSjFkRnZNQTd4MDBCNmda?=
 =?utf-8?B?ZUNHaUZOMlZHcnNBWjNDYUFTM1BsR1VheThHN3pMbTdORzBaZ1NhVDNtbEk5?=
 =?utf-8?B?dlZjOWVyaXdLcXJGOEtjUjRCNkEwNUhtSGhqaGR3Tk45WEJ4bUpSaDg1NkZQ?=
 =?utf-8?B?R3E2cXJtSDZZcEgxQkdJOGZPdHQxSUthaVU1K2xqL1FremZOL2RIck5lSXNB?=
 =?utf-8?B?SjlEV2hjNGVqNHc5L3NuNXZXTTVvT2p1MmRoTEMrd0ozYWlCaUFHM0RiWkll?=
 =?utf-8?B?ZHFiS202dWtqZ2x2WGJjRFFNb1hLNDhHZlhabHVpYk5ZUG1PQ2tVRTY2d2hD?=
 =?utf-8?B?TXkwUW1vZzgrMTN2TEI1ZDhNUTZjU1RETEl6ZG5Ycmk0RWpkY0hNZUIyUUc5?=
 =?utf-8?B?NmVEbUsyQzUzNkNzUzM1ZEd0YnltUVFWOWF1ZC9RQSs2QThNdXRST2o0Z1Yz?=
 =?utf-8?Q?w6q/Oku0Ev1Dxvre5r+2z3U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed999b46-d6aa-4074-9108-08d9a2c7bc03
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 14:54:58.8417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFT/qcCqNGj1zHhVGr0X3ZmLWN7fRk2hRH0N+ouUiHmSSWCEiaDNjsmjeDlcyTiKBtrjl7kyqqfnz9U61sfGrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3913
X-OriginatorOrg: citrix.com

On Mon, Nov 08, 2021 at 02:46:39PM +0000, Ian Jackson wrote:
> Roger Pau Monné writes ("Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain"):
> >  Overall I think it's best to
> > express supported grant versions independently, and we might wish to
> > also allow to select a discrete set of grant versions that a domain
> > supports. IMO it might be sensible in the future if a new grant
> > version appears (v3), to select to expose grant v1 and v3 only to the
> > domain, and avoid v2. This would require some changes here, but we can
> > see about those when the time comes.
> 
> I'm not sure what layer we're talking about here.  The patch
> introduces a max version into the libxl api.  Is there any significant
> chance of a v3 (and hence, wanting to change the api) any time soon ?

I think it's unlikely, as it seems there's a trend to move data
transfer between domains from using shared memory to memory
duplication (ie: Argo).

It's also not clear to me whether anything similar to grants could be
made to work together with hardware memory encrypted VMs.

Thanks, Roger.

