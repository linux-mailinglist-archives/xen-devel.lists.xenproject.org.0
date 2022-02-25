Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559654C494E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279467.477177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNchY-0007Hd-3A; Fri, 25 Feb 2022 15:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279467.477177; Fri, 25 Feb 2022 15:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNchY-0007Fl-01; Fri, 25 Feb 2022 15:40:12 +0000
Received: by outflank-mailman (input) for mailman id 279467;
 Fri, 25 Feb 2022 15:40:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNchW-0005ID-Pj
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:40:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35f42b01-9651-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:40:09 +0100 (CET)
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
X-Inumbo-ID: 35f42b01-9651-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645803609;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=g1MzI94IsfiVMIInuKuZHybLDc3Vy+sXaMWZ+g/T0Uc=;
  b=QDeMbZOrNSJT2WVmJxu50FU+e/cfVm1SJJ9TLACcrEwt8YprAACb9RqH
   ZlVbE6Qc8aB6gChy2MDUz0iDuF1DXdJme1quJTjIkFRtopKjT+NTqcqTy
   iW1bGQZMU12LkFEQZiV6lYQxovv4vwYjW5ZUl8GP3VtHjkuwzwlrQA9d2
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65409743
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CmJS9aKFpS1efbFVFE+R2pUlxSXFcZb7ZxGr2PjKsXjdYENS3mNWy
 zYeCD2PPfbZYWf9f913aYzioUMB6p6EzIMxSVdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2NQ12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NodrLzgZyMWB4DFpsgUUAkINgh4YIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glt2pgfQqqFD
 yYfQWJqVRLLfBFhBlAKCbsck+Clr0jBNCIN/Tp5ooJoujOOnWSdyoPFLNrUYZqLXoNcxkKDo
 WTu8GHwAxVcP9uaoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdxLouV7UkDojYvdZLcEz6xHd74PSvi/MUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AjPNAuBRPtfNi2mUBb7zt6cowGGxFATpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpiH/JNwNuGkmfC+F1/ronxezM
 Sc/XisLufdu0IaCN/crM+pd9exwpUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Eb5rak0gECbamCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnmMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:XPmJA6BB+GlJ/TPlHehEsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90c67MA7hHP9OkPMs1NKZPTUO11HYVb2KgbGSpgEIeBeOiNK1t5
 0QC5SWYeeYZTMR4LeYkWuF+r4bsaa6GcuT9IHjJhlWPGVXg/YK1XYENu/XKDw+eCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njEsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLlcFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhCl2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TttgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4dkWUmxjIaLH48JlO61Gh+e9
 MeTP00pcwmO29yVkqp8VWGm7eXLzcO9hTveDl2hiXa6UkVoJlD9Tpp+CUupAZwyHsDceg22w
 29CNUSqFhvdL5gUUsvPpZ2fSOIYla9My4kdljiZGjaKA==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65409743"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dofb7jKf81jrfgbMa36Q0dYCqn27hZjf5dzHQyY08ITMuvwn4lzu03jzWDo67A6bN2TDSFslFH9bbiejrgV7fW40ljMJ4a0//Ey01twg5xs1jS8Vd7PXXHCbHJc9Lisx8vw/u1cKK2EkTMlQkiwN4Agwb5sfhfUW2cL9YDtFyQrjbcslWVq6QPQhiDLoJ4Ia7zvnQM6/NzRAJ+JJOSXx+XxYctD6SiFvrRA1m/k1O2otnkvvNP0rWYhftnbdLBDLNbnPefvH6yItWiNU5gkK7eh2sLm5fzJPxKQXbTzF/v40gRYaydpxgJ//grrhza0uFMEl4OeIybob7mYTFs6Tgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UvduzblfSFq8jsCANaC3GfwcTReX1ZLErddJKkA9AQ=;
 b=AWA5VHNPT9giPJvW0CsYL5av8ZURrHZ8fTKgnriehS4oAPzLfzq4VBGDXyGMU4cnrWd4daWuk8X7KVlM3h/VWWUiscPb9N7pZpCcsv7leAk3QqbqhK29uH6YnzDabO/g8/+vZrn2ek7VwdnRuqkzFJENQ9o0mopyXR/y48cDF2OJK1uM+/NGfVlazj/mcnxaQBEmQEC4kKmgrg1Z0lGANg4/vMahR5nvcTQxff7sggtKleIk88xLVjfjFX0EsbuLeOtKORudmHYlD/t5yRH3kphQQwzlGV8RHDEDodPMAlesHy9fgA253X7uEp9aIMwDh/mQmtasJc17phyy/Z4X4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UvduzblfSFq8jsCANaC3GfwcTReX1ZLErddJKkA9AQ=;
 b=hg55IgwCaZCEZPN6tm57OOU2MN8cPUn0uh+NU79u8e8kNVrT/sBBsJIk8KzZ1D/tfYdMQwOcw1kWAO8rHWU3JyvZnRD66J7Kc3xFIf2GUMrysmzDQrT9v4oolR5v0p5rAlqIONjTyZ2StCHlz5nH6717CFm9SVa7CbNNeztPbd8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Alex Olson <this.is.a0lson@gmail.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH v2 0/2] vpci/msix: fix PBA acceses
Date: Fri, 25 Feb 2022 16:39:54 +0100
Message-ID: <20220225153956.1078-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0174.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df0125cc-c681-4391-bc0b-08d9f87517c6
X-MS-TrafficTypeDiagnostic: SN6PR03MB3982:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3982E518B0773EA91DB982A88F3E9@SN6PR03MB3982.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vnxgOFocCTc0CGB98KejT5bkqwxZVi26rgOp83rO+eIkTz5PTE7TabnQYrTDcjrS9ZnrjmbFsl5oQ5ARcCx2bzvebgKcTcmNg7gkxNisglTvxdn16Pz/R+y6//Ez2PcJbaqbaSDCLNeQ4uvCBfIU7OlToNhC62KOEGIStCl65VleBLx8Z+WnniLbMcWDNsdYt17o5D0xGil7cd2zMtJUDB26yVc59AlwW7UwI7GC2GwIlQ0v6Hcre+z1SZpqpRvIDdTlWRXy1cVe1HTvJjhMj15d2A6yNPUWwpMljvCdE3E2cNUJLCCOShTM9G3/SQPPBpwJ9ycL5U4Kd1TsSX09cvoIhX9xLqiq/u99LByStMfUpaEGmCWh8jPAyxXuGMtGVJrBw2KOEU989jnp8Kd334nKcFKnhkxw/m4IU4NKKKj1oXlVZGKjPXL2+PwRN7/eXgs3e7nGILAFKb8+BUgdbhtR7uSnYgtrgH1TH9Lgr/xtPaWxYgRpBDyxhYWzbvnnIvrfha70IJnAGSAt3eYTNnbMQ/yiHxnMdRODOKLADnpz/bBfeoxYTBDj/XweyqfsDuYJMKiYkVzyiqNfFpGXxDipsBU6nxW6TRsGEPMcbV+0WYTUJc6AQgzxShsH+X6+lmGXb/besVLoS4yIBYx5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(1076003)(82960400001)(6916009)(83380400001)(6666004)(54906003)(86362001)(2906002)(26005)(8936002)(107886003)(186003)(36756003)(316002)(6486002)(66476007)(66556008)(4744005)(5660300002)(508600001)(2616005)(8676002)(6506007)(66946007)(4326008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a015eXNSTEFYejRYTXFvaTdVQ0pwTitOTDZkYk42dzVNeEUzMGxiSTN3ZXpw?=
 =?utf-8?B?MFpBOHIvK3dwcWtwZEZJbDZjbFNaRDFWSHVzaEFyMHg0cUxGd3FkVjhDZXhX?=
 =?utf-8?B?cUMybGhLOW1CQ01KMnpJMC93YWIrdG1HTms5VUlWc2hrREsvL1pKM1FEWGl4?=
 =?utf-8?B?dnluRjZhdk1ObmdxWFYrczQyVkpxeHdDeXdaM3BjMVBhMm5ISkhyVTFmbFRR?=
 =?utf-8?B?Q0pMdGM0NGZwaG9haTQyNzlpeE9XWDhpYURBWlRIR0FyNkdxVVNZTDI0dEVs?=
 =?utf-8?B?b1JMbDdyTTQxSDhGUERsT01nZVJBNTkzL0wvZFR5UVB2dkhITnhoSk9Qemtm?=
 =?utf-8?B?c3hhRVZOek4wZ2NNeldtWVA3ZmxWaUVob0NHUXpPRWd2akwybnl3UWtwOFlh?=
 =?utf-8?B?SXE1elI3L1BXU2h0eDNaRStWKzF5MEkvOUNhbUlmZnNlUEhyZVJ2QnAvVU93?=
 =?utf-8?B?ZG5UVzd6L2tlQ01xVE1NK1hKQVlpTXY0RU96KzVQWkFHVCtNbVFDTTZzUEgr?=
 =?utf-8?B?Mk9vdEdXeCt6elF5ZEg2cURKVWdYM0V3NTE4MnVSbUdYMzlPcWp2UUM3QUFR?=
 =?utf-8?B?amtGSlNoM2lUTnFUa2tQRjZuM1htZSs5SVFXcktmMmg5akVKSi90dXpCVXdV?=
 =?utf-8?B?N1llcEVpQ052VUp2RXNKc3BVUmRxL2lFeHVJQ1pCME95a1I5WWt0SzB6ZlR0?=
 =?utf-8?B?di9qU0JQdjdzR2VOWUtJMkVDUFdCK0xFb2lTejhhODdGYjhmOVNHWHAvVzBl?=
 =?utf-8?B?dmZDU2F1VlZDNDl3THlVWlk0V0hOdWhweUJzT1dYOVY0S0hYajBRbjR4Q2xY?=
 =?utf-8?B?KzdUZVJmWUdqK0NDbm9hWE5LcEJqTjczRHZsb3QyQVNJMzZJbFlpMDhlV0p0?=
 =?utf-8?B?WThyZWx2bHZIeXRqbFBQQ1pKc083NllMRlhDaEdJRTR0MnJJYWpzSTV6WDBv?=
 =?utf-8?B?Q2pJekNGT3BEYUlHeEhNM1VVUVkyOWVpRUxQMk5XRG1YTmJGaFBqVXNMZjE5?=
 =?utf-8?B?bnhES1dNMzZvRVVqWWNjc0RSNGVISVIvNnlFRDhQWW50NFRFRTI1OXBTNkxz?=
 =?utf-8?B?b20xeG91eWRNVjlyaklFKzg5NzM2aEpxVENCV3hJNGhyMDRETTZLeU45MjdO?=
 =?utf-8?B?QmJtQ2tVeFVTRFA0enI5Rms4empSQW5mUXBwRDJ0ZXBkV2NYTU9oWjkvcUtp?=
 =?utf-8?B?dXhQUC9RTGFmN2F3UzNBNHRqelR3TWRsU2U3SUQwZTBnM0VUQkRQL0dQcGZl?=
 =?utf-8?B?c2x3R1NNSDRCMVdDYUFTUmxNZXRGYWQxc2FSSXdhQjd5M2FYdHowOGNFUHV5?=
 =?utf-8?B?VWUwVHNVRkJvcEtyUWRKY2k4TG5iaWR0SmRVaDNrRGNFamszOVY1RG5DMU5T?=
 =?utf-8?B?SG1xamQzN2ZMdFJYZWZ6Zjc5WUxoZHp2UlVTTnhzU20wT2pZN25BOWl2ajVi?=
 =?utf-8?B?WTNZdFkwL3l6aTk1RmR1TXFQWnhUamY0NEN4ZHpWWDdxQll6aXpWVFRoOWVw?=
 =?utf-8?B?bmhUeWlpL200N0xxaUlpcEcxZTVwNDRRR05PQ1I0RWlOYWd5MmNZb3pYZzhG?=
 =?utf-8?B?RS9MZ0dFdjJhVmIrVXhkMlR4NU5BdHRZTHZJY3VNUUVuNkl6WktHOTI5QW84?=
 =?utf-8?B?dTFnQnhHZUNZeUh0bENieVpUOXJDSzFLdU9uWHBFenR4UHZ5K2NoWWxwM3Nz?=
 =?utf-8?B?QmxsWHVsa3V2bmIzZUFScWNWR1dKeXdtaEwrNnhuVDRETGRsdUViWEhPWnha?=
 =?utf-8?B?S2tUa2c4RTVWNEp5dm1NN1NnNlNkSlovWk0vWTZ4Z1VMcm1IVTJoYXN5T2pJ?=
 =?utf-8?B?VUNJNURzaTVVaEltamlEWDJTeVN0ZUdMYlRVWVVmRkJWTUU2eXZLT2UyZkNE?=
 =?utf-8?B?YjRxSm5DMXg2NTlFdDExZ1BjWUlIeWxnSlk5T3dTMDI3SEk3MnlIaVpCY01C?=
 =?utf-8?B?ZHN6SmlrMDMxZW1ha3JBS0VOdDJ6UnE4R0VWZjc1M2xXMmJsOWZkS2FYQ3R6?=
 =?utf-8?B?N3gxZkVMdThaVW44V1l2RnZleVJxRGMrY3k4VEl1TVJUYSs2eFZQb2tLc0NT?=
 =?utf-8?B?bHdLckY0R1k2TlBZZU1sTlZEWkdHOEhwdVdBaG1DcW9ITWxmYmpkbzNBS1ZL?=
 =?utf-8?B?N2hiMnNJWUdPWDk4SE9iaHBiTHdrWXlrdFV2ejVsMTZpcGExYVpFSW0rNE0y?=
 =?utf-8?Q?STIUVkqLuuCSIlMeUmZi8Eo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df0125cc-c681-4391-bc0b-08d9f87517c6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:40:04.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndCD/PS+nMGm3Q7WQwC7OLg7l0m/XkDvz11GsG0MIr9D/WRvhisGdpV5IJrRtLKcLYMuuyyE7s1PqyquN8YilA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3982
X-OriginatorOrg: citrix.com

Hello,

First patch is just a preparatory non-functional change to reduce
indentation. Second patch is the one that actually fixes access to the
PBA.

Thanks, Roger.

Roger Pau Monne (2):
  vpci/msix: reduce indentation in msix_write PBA handling
  vpci/msix: fix PBA accesses

 xen/drivers/vpci/msix.c | 78 ++++++++++++++++++++++++++++++++---------
 xen/drivers/vpci/vpci.c |  2 ++
 xen/include/xen/vpci.h  |  2 ++
 3 files changed, 66 insertions(+), 16 deletions(-)

-- 
2.34.1


