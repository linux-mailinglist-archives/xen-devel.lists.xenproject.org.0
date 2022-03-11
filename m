Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2FC4D6447
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 16:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289119.490501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgoc-0000jM-4f; Fri, 11 Mar 2022 15:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289119.490501; Fri, 11 Mar 2022 15:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgoc-0000hE-0o; Fri, 11 Mar 2022 15:04:26 +0000
Received: by outflank-mailman (input) for mailman id 289119;
 Fri, 11 Mar 2022 15:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSgoa-0000h7-My
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 15:04:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8824a789-a14c-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 16:04:23 +0100 (CET)
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
X-Inumbo-ID: 8824a789-a14c-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647011063;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=x9tpm+39mVbVQI2FWpCKH+QDqhktoDrl6MiphDSK+Rc=;
  b=gef2NVatEPcdFocjGEMS0nwhY/u+bt/bOfEM7LDlJJh7JTR5R6QSAutO
   aNwIQe/dYIqdvm5yhdhcPs7sxCDna6z5yT3UlSRWDwKzKhCTS4jdIZk/K
   sOT6wjzrv9LX0jn7+FWU3MKSbQ9oKspVZZ4QFER/xQW6/kvrh/MxBZSmx
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65493375
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:e+AfNKxBakqmsFDhQs16t+fvxirEfRIJ4+MujC+fZmUNrF6WrkVTn
 2UfD2rSaKuJM2r3fth/atu2ph9VvcCHn9BqTlBkpCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IHhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliL6NYyQRYIT2uscBU1oDExAkFoJl0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J0STK2FO
 JdxhTxHQi/Jc0UWE1ArT5c8292Ri2jbLiQFgQfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80igzqak/8mS7Q9+7WAe3yFaBtwQZUsBdEMU77h+M0ave5wuFBmkCQSVFYdZgv8gzLRQo3
 FKUm9LiBRR0raaYD3ma89+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznc/ReOo2N0PTPOxLsw
 3PRrBlkrJowpJtev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJczVzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meP6Gu9B7cJZRNGiJObharoWqzGKoC6SbzYugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UypEWP84k2ruH75DuVPO+szY7TqCLXwc5076uYdymVbPEetVWLdwRrxRAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhRRUXX8ave8pQNHsbae1IOMDh4V5f5nONwE6Q4zv89vrqZo
 RmAtrpwlQOXaYvvcl7RNBiOqdrHAP5CkJ7MFXd1bAjyhCR7P9rHAWV2X8JfQITLPddLlJZcZ
 /IEZ9+BErJITDHG8C4adp7zsMppcxHDuO5EF3P4CNTjV/aMnzD0x+I=
IronPort-HdrOrdr: A9a23:flejZ6j508n3vwU1Ku2YnyXt8HBQXuQji2hC6mlwRA09TyX+rb
 HIoB17726RtN9/YgBDpTntAsm9qBDnlKKdg7NhW4tKNTOO0AHEQL2KhbGSugEIcBeOk9K1u5
 0QEJSWIeeAdWST0q3BizVQaexP/DAsytHSuQ6k9RhQcT0=
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="65493375"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYS3WGciAvhCHTqoQpYuCps3XKEs/VcWQWEzUPstTl57hMt3Xgw4q4A0bR7CLN0PWIr4LiD2k3S6b9R811L5jIyufZmULyF7KPZ6stVfmhgMbKuPP0lLVg9SDHcXH4kgijF+AyFq738KHL4lwwEl5nJOppQ+PDuG2dKCqS9lLlpOrgXNPBbHN/F78Z+X10p+m8FNAvCoDAd6/RUjRWAtzCgr4in8NY06F1TF/lyNtDnynLCkwh9kgIW4M/piufX5ZEZQEO10PEn+HRbxbU3Pm9RoiXlqjFNh2bmGpvs7spNvRCszJQsG8ntwYzh0wtAmL2UVvhxmg6QbCQLLhyd5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgI5z3POU1knKetqPNIAXGK84/wxhJZ8VBSD/E8/dX4=;
 b=ad757i/0+WHSN/iEvXCTsftYQXQcF+MlVit6E2bCdxHIngD9anqRJqETEtN6Z5Pc/e1JBvgntz7XDrTtjpMDirmAmP47zY8H5JKKWXVz/z9c/K/nrUroQPPcAHpwly3VINc0X/OdF+1fx1gaQ9YkDWTArwuQbGXnh8zTe55JMOoqk6KauXJ6ZIGtty/XVG5cMGUO4wW9LH3z7XxM8fKbA1iqRMKsaO9MX3uqf0SSh+/vptl9qG37M5F12kYNzyQsGZsj5+eE6t6yGZXpjm0KconoRSRSGmd6wkwLyD9Q1SVrPID9mkoO334CWnXrrV6ccSUo52Cr/rImhqIJMfVl1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgI5z3POU1knKetqPNIAXGK84/wxhJZ8VBSD/E8/dX4=;
 b=F+nD1fzTnjGxUyCipgf72KE8eljvFzua3479Dl0eRpcflcwkLm29fvhk/tEtKYWwwH6mFVVp+d1w28sybfN2GO5Geosk0nq9MhYk+5dZjgEpBed3SsOt3XG7PiRaxOPER9jN7oMA9EF4FBCv8/KhG8ougdvZyvnQJ9m6JOneR0I=
Date: Fri, 11 Mar 2022 16:04:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Message-ID: <Yitk68wpP8HV4od9@Air-de-Roger>
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
 <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
 <YioddbNor6w/U9ed@Air-de-Roger>
 <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
 <Yiojgxgd4amSjHog@Air-de-Roger>
 <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org> <YiopXU65pAlnNVNI@mail-itl>
 <d2c63630-6ab3-b4dd-128e-72f871fb9e08@xen.org> <Yisp0Q/cNGbgsO/7@mail-itl>
 <2a5c59ad-2fa5-b668-8bce-0d55e89a4afd@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a5c59ad-2fa5-b668-8bce-0d55e89a4afd@xen.org>
X-ClientProxiedBy: LO2P265CA0490.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7c83a8c-3aff-4ba9-0109-08da0370694b
X-MS-TrafficTypeDiagnostic: MWHPR03MB2893:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2893D79EC1873AD1A50815878F0C9@MWHPR03MB2893.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITQGfpJF0DoH92MzL5kMGJor0rGXF9m9N4IrBYhse+Uil8qLI6/tszeMl/lL6Pl2hD80B+1aLwto0V2Z8iOpZzm4HOx2eOfJwhW1J4G5VLAnZPk39TbR937s8x3AICvh3sRoO0LdLAy6f82sNAIAC7/CgLqtO3t+IqPRwjUzy1dMPQ4y2zPIh7DZzYUb7kt0EYn5QWZ3CbCiGwpn1qWJWnrJyez1RpAhngaHwrCH83ScyYQzOiDsWV4u0ogp8MZe4WpsMOn8ZK47S0Ec8wWDw7i8JlljpHns8q4xzZIMwyf3gkw9dItnMS554lGQAZG8dMTeSPrP22CIBHM4Y+MxW2In///BdHYVSkNLL3zfXBUIA7dzOHm5jxQ2w9ZMKvJ0v/9qkkaOHQVMSfcyb4Oqz6rYAAqDEEfFBBr0s6m4OcgHZ5JaPfpl6KxUWjS2DPuaR03MUfbXdBuMJH5ZJZZ5DpNtBhNa9pMMG0rG/JWqJ00FntDldQXj0jjHXK3pjtfDwkUuUA4/1ICI8/tTSdtxcqeYgfxTweMorbmm4qgvTRE434QAzRWt091oihoGKppM5/Fq4xhWaQ4C/Ue9saOeUv8WZSlE+NL6y1kcSz3fHiwti66dJ9uDnVadQym+rM8fBZPejVMJvkjZIRBd6JEt/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(5660300002)(33716001)(8936002)(2906002)(82960400001)(316002)(54906003)(6916009)(6666004)(6512007)(9686003)(4326008)(38100700002)(85182001)(8676002)(66556008)(66476007)(86362001)(66946007)(186003)(53546011)(508600001)(26005)(6506007)(6486002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZExZbjZTZi94OFJROHJ4RkQ1ZDBNMEJvRUpIbm1oOUVLWmhYYUQyMVhUL3E2?=
 =?utf-8?B?cStGL2d3akc3M3lLdVdzTFpCNWYvY3Z1Ny9nWmgySzBqcENFRUJpWUZxVjBU?=
 =?utf-8?B?OXdJcXdiK3BXWDBqZzlwRWZuV1ZwK00xZTJaM0FacHVTYURCUmRaR2UwOTg1?=
 =?utf-8?B?ZlVreDR4NTRmMVhsNGdNSkhvVjBFbWtIVERHRWJ0amwybmFYaXdoKy9uVEZU?=
 =?utf-8?B?TmlKYVB1L2w4RzI2N3RZdFJKaHVUT2pyVTJ5QXNNWlhYNERuWloxRVM2L2gy?=
 =?utf-8?B?QmN0bVJ3SVFmSkwzYXI1WFVEcHdCd1BxNFBzZmc1WVJpdS9sbFFZWkdLcWlU?=
 =?utf-8?B?NWw4cERjekVUc28vVk1NN05YamZ0QmltZEVGYWNST1BuQS9FY3BiVWhnS0Ny?=
 =?utf-8?B?RzFsNWx6ODVscm1UUEFxUXVuZEZCckZVc3JiTlNqdENqY0hQbkFwQmFrdS9n?=
 =?utf-8?B?RmhVVklZWm5Fd1hpd1pWaTV3OXZxQW1Lc29HVVFlam5SbkNGdFZLSW1uSkI5?=
 =?utf-8?B?SUliYXF5UWpZc1VFUTRnUzgxbU5NeXNZZEtwbEpGSVRUYmJIaVRmU0hDQVdV?=
 =?utf-8?B?ZStQcG1rVW1ua21xaFhFcEZadUl6MUJiM0l0dkY3TXB6OGVOcUFYck9uMEV1?=
 =?utf-8?B?V1lzMUlVeitxakdZRVFCaXNmMy9oV2NBT3RucXUwTndaQ0FOMERTcUtBTTRZ?=
 =?utf-8?B?ZkFKeERvN2ZtUVZuazM5OXpjTEM4MXRWWE5MYkczdTdWMnlrOVAvTXMveHFL?=
 =?utf-8?B?ZTBndHZXdGRkclI2NzFQcS9NV0ljazcvRlpDY3EvYitZL1YvbjdKK0V3NnBn?=
 =?utf-8?B?K2k0Z2RjZlFTbTFIRlB0bmlNZUZNcGtkN0Y0Vy9LeVlvOGhmYVFjYmFUYmRh?=
 =?utf-8?B?NWhPK2lFN0dYRko2RUw1ekpFM2NNbzYzMVFmd1FHV3U5RGgySm5wbklac3NH?=
 =?utf-8?B?NWpmZjhDV2MwYlcrdkR0aFNMMXhkSWZaWllVc2VKdUtBejRaQ0lCQTlnVk5G?=
 =?utf-8?B?eG1OalVLM282S1NoeGpIMXhON3Fjcmh1ai9qcEkwQ01ON0xiNytrZ2lLWHVj?=
 =?utf-8?B?ZWU4VzJtVmtXMU1nNThIaTR0OGpIRDJTK2k0VVNsYlJBZ240NkhiQTd2NFlv?=
 =?utf-8?B?a2U5V21MM3lScG5HdTlQNk9OY0FIQW5CN0xHK3BrSElCcXJHalZiZ09uTFc5?=
 =?utf-8?B?eEtTQlRmSS9zdHpyak1qQWp3MzRsY3ZRVUlyVmtHVEdBUE5WN0grWkF5bFQ1?=
 =?utf-8?B?WmNyVUVidzdsbHNhWVRNVHd1QVN3UEtZRTRIeUdIVWZvd2hDY2ZwNlhNc1A5?=
 =?utf-8?B?cTIzMEQ3UnROMFNVZUdhWFF6SzVYeko5ckMwZzRDR2JpZy9Pcld2OGJxekhp?=
 =?utf-8?B?ZlN3TkxxQ1hBWUVFY0FJRHN4YmhxRGxZb0o4ektEMEQ1cUorU3ZtdmhvSHlv?=
 =?utf-8?B?OGExUkg1SkpyZFVUUllhRU56NFFZdVBuZU9SQ25HWmlTU0pTNFJnaVdHZzBV?=
 =?utf-8?B?bWQxbGd2Q1FMbDdGRFdHWU13VnpPYzhKU0Y3ejhodFZpQm5SVlBUa1d1V0Vq?=
 =?utf-8?B?NHFYb2dwYVFDcUgxQnNjdXRpN3E4UWFCNW9UN0ZUb2p5Tmx2dmROeUMxclNI?=
 =?utf-8?B?T1NTUDFYQ1RVa01lTXBQaWVlcXhYZU9HQUtoY2dXdktoeWJ2RnpwZnJmL0x2?=
 =?utf-8?B?TDk3UFk5dDVzQXBCQmQyY00xNHVWUTI5M0hGWk9RL2JLdFR2WjRtRzBpZkNB?=
 =?utf-8?B?dWFkRXNvYnNVSWJ3L0JJZXRFL08wcmpzQVFKS1cveGU1VmozVXhrb0VCZkVu?=
 =?utf-8?B?bVdkd0lUek1tdUdWVWcwcXJVUWkvc001TXluSXBNaFZvTFdUMm8yOG1nRWgx?=
 =?utf-8?B?a2JueXFWeHNIdnVCMWJJZ0xGR0RMckc2NVFrOUMrUWlpc05jOGhEZTZUYURP?=
 =?utf-8?B?UnRldTdLSzZmM213YVRlVUxDVmdycThOeWtZZHRUVk14TjVtUkgvSG5MKzR1?=
 =?utf-8?B?dW53MjBTcDVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c83a8c-3aff-4ba9-0109-08da0370694b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:04:16.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxJk5TpYKqaDXwsT09VuQ5RcedFSK3dIu7HOK2W14ybK8aLoeNqemREvIg2bxDnxJTCWQ5+C4OOCiz8R+GgB8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2893
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 11:15:13AM +0000, Julien Grall wrote:
> Hi,
> 
> On 11/03/2022 10:52, Marek Marczykowski-Górecki wrote:
> > On Fri, Mar 11, 2022 at 10:23:03AM +0000, Julien Grall wrote:
> > > Hi Marek,
> > > 
> > > On 10/03/2022 16:37, Marek Marczykowski-Górecki wrote:
> > > > On Thu, Mar 10, 2022 at 04:21:50PM +0000, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 10/03/2022 16:12, Roger Pau Monné wrote:
> > > > > > On Thu, Mar 10, 2022 at 05:08:07PM +0100, Jan Beulich wrote:
> > > > > > > On 10.03.2022 16:47, Roger Pau Monné wrote:
> > > > > > > > On Thu, Mar 10, 2022 at 04:23:00PM +0100, Jan Beulich wrote:
> > > > > > > > > On 10.03.2022 15:34, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > --- a/xen/drivers/char/ns16550.c
> > > > > > > > > > +++ b/xen/drivers/char/ns16550.c
> > > > > > > > > > @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
> > > > > > > > > >                                 pci_conf_read8(PCI_SBDF(0, b, d, f),
> > > > > > > > > >                                                PCI_INTERRUPT_LINE) : 0;
> > > > > > > > > > +                if (uart->irq >= nr_irqs)
> > > > > > > > > > +                    uart->irq = 0;
> > > > > > > > > 
> > > > > > > > > Don't you mean nr_irqs_gsi here? Also (nit) please add the missing blanks
> > > > > > > > > immediately inside the parentheses.
> > > > > > > > 
> > > > > > > > If we use nr_irqs_gsi we will need to make the check x86 only AFAICT.
> > > > > > > 
> > > > > > > Down the road (when Arm wants to select HAS_PCI) - yes. Not necessarily
> > > > > > > right away. After all Arm wants to have an equivalent check here then,
> > > > > > > not merely checking against nr_irqs instead. So putting a conditional
> > > > > > > here right away would hide the need for putting in place an Arm-specific
> > > > > > > alternative.
> > > > > > 
> > > > > > Oh, I always forget Arm doesn't have CONFIG_HAS_PCI enabled just yet.
> > > > > The PCI code in ns16550.c is gated by CONFIG_HAS_PCI and CONFIG_X86. I am
> > > > > not sure we will ever see a support for PCI UART card in Xen on Arm.
> > > > > 
> > > > > However, if it evers happens then neither nr_irqs or nr_irqs_gsi would help
> > > > > here because from the interrupt controller PoV 0xff may be a valid (GICv2
> > > > > supports up to 1024 interrupts).
> > > > > 
> > > > > Is there any reason we can't explicitely check 0xff?
> > > > 
> > > > That's what my v0.1 did, but Roger suggested nr_irqs. And I agree,
> > > > because the value is later used (on x86) to access irq_desc array (via
> > > > irq_to_desc), which has nr_irqs size.
> > > 
> > > I think it would be better if that check is closer to who access the
> > > irq_desc. This would be helpful for other users (I am sure this is not the
> > > only potential place where the IRQ may be wrong). So how about moving it in
> > > setup_irq()?
> > 
> > I don't like it, it's rather fragile approach (at least in the current
> > code base, without some refactor). There are a bunch of places using
> > uart->irq (even if just checking if its -1 or 0) before setup_irq()
> > call. This includes smp_intr_init(), which is what was the first thing
> > crashing with 0xff set there.
> 
> Even if the code is gated with !CONFIG_X86, it sounds wrong to me to have
> such check in an UART driver. It only prevents us to do an out-of-bound
> access. There are no guarantee the interrupt will be usable (on Arm 256 is a
> valid interrupt).

It's a sanity check of a value we get from the hardware, I don't think
it's that strange. It's mostly similar to doing sanity checks of input
values we get from users.

Could you add an error message to note that an incorrect irq to use
was reported by hardware?

Thanks, Roger.

