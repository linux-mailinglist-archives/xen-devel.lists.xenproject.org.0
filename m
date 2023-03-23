Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC326C68F2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:55:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513856.795503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKTZ-0005Dt-5K; Thu, 23 Mar 2023 12:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513856.795503; Thu, 23 Mar 2023 12:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKTZ-0005CC-2b; Thu, 23 Mar 2023 12:55:29 +0000
Received: by outflank-mailman (input) for mailman id 513856;
 Thu, 23 Mar 2023 12:55:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfKTX-0005C4-Mr
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 12:55:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7889b98-c979-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 13:55:24 +0100 (CET)
Received: from mail-dm6nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 08:55:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6081.namprd03.prod.outlook.com (2603:10b6:610:b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 12:55:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 12:55:13 +0000
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
X-Inumbo-ID: f7889b98-c979-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679576124;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wSWYEN7zSfV4cBzOwi+3RYcgTcolYkKgAODDk82Eu/g=;
  b=LhLXRF13lMYH1WPTRm/qZj40bIl+ArMVRZF7kHbk7R8h9SN5dxF/psLc
   480WudGJiIRCOPy8vxG8jOVNtYpTfppMqiiTrYHEycQ9Etb/ODjjLq0dX
   R5bsPcEjAGt+SYVGK0NkPI80DmUpkxihr4DqoSfMwNfB///GKMAlcJQx5
   E=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 101380748
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4AGShKuRQDbE1YR5hTsUg/JVJ+fnVGdfMUV32f8akzHdYApBsoF/q
 tZmKWGEa/jZajOhc9tyPN6z9xkD6pGBxoI3SwY9+3pmEiob+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBxcAZQzfit2KwYm9ZbFhq+EmA8WxBdZK0p1g5Wmx4fcOZ7nmG/mPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oui/6xYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXhra4y3wHDroAVIEAzUH2Fr93+s3L9Zf97F
 14twi4MrIFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakcsUQoAy8nupsc0lB2nczp4OKu8j9mwFTSux
 TmP9HQ6n+9L0Z9N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLpm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:2lOgqqvwUEcOwReqqbSTEcQl7skDT9V00zEX/kB9WHVpm62j5r
 mTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="101380748"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYxoxGY+SOppr775QknwMPoxy/moIEuqr2qwyaHHe5oNLfKi9ncdZtCXgZmx9S5s1A/sMySeqRTRhV/NrFNwFaheNwjUJNh+clMJWoU55DlQnUIELT7f9zex1XPgLWWsldw2dIJ5Fv4owhLXSC2RXUm1yMhLfX0B+nMBRjs4t3z0M7y5jbXSqbMpLV5xUr7HjUnBsHClWt6bMF9pn1nHihGbWimOE4T5njMZJEp5o8AFuJ+x8vpmcPhT4OBQvSl6SNHKMgXZbSjq7uxONG5KnNMEdr9XQ7Wj6+gBnvByC2AwHCueijBcO6ZpdbzUK0zM0tX5Cp/U5cceOYqcOR9tEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSWYEN7zSfV4cBzOwi+3RYcgTcolYkKgAODDk82Eu/g=;
 b=DYYryNcHM2ANeN29EaxbUNRgm7tg6g24EKD6gCC3tqGnihUwCinwNODgsgNWSzVT65lyjopENkPNOOW0IH3ZmzUdXcFvYZBRNRRXPgGwYCxOXvn0gffnxfqGqDdLgMnuggLLNRSq0RLzzTRmZP93oJHbZtHjI1y6dSZrCJgvWNKkCKC60yi4T+wG14Z+qO7BE0d8ZvBeUoeSUAo7K5QtWa5TqihBGsR/0ZP1nC9Q9NYW3REV506x8q4FE/cklnNRN5v0YMSzLyCwlLRNyVylIOV9VQr9ctIwzaMmrMc7SutJiIM36C7x/LtR3o27Hb0KNmm6oG0fG8LmTo4U7ezGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSWYEN7zSfV4cBzOwi+3RYcgTcolYkKgAODDk82Eu/g=;
 b=OjHphiZQYz8xaHVtfABbp3EndPtlYeVlU0ey8q7xi8u72WkId96Q+nfAV3qFgPfeHr4n9AR0vTbRPTqdh1ZSvYK+AOYF0/HZzSaAh8moOnbL+alPmzebf7MmCfuwLz7u2L9/4zk2APt3r1s79cEMaEzxrLd1D2A1kisCrP4T12Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d1c78a04-beeb-9c9a-68f8-bb7dad2cfb8b@citrix.com>
Date: Thu, 23 Mar 2023 12:55:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 04/16] x86/shadow: replace memcmp() in sh_resync_l1()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <a1433e82-10d1-cf7d-eebf-fdf4aab8a2b2@suse.com>
In-Reply-To: <a1433e82-10d1-cf7d-eebf-fdf4aab8a2b2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f70183c-7ca1-45a7-f3d1-08db2b9dd79f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yfXWzP+WpPKdqg+6qZei38Mq2RHD2puD5HrbykbqRrMRF49IEgmLHWKv1LWdmF8meX3K20hJhIak0DaQ0qBZMP/mJYwvAkRZYoNOhuwsMERYGf894q6yLPRJ/nr9VRJfXZO2bkZNC2Ji4r9uuSgP9/f9RDPI+1f/dJZG8G1Ise6KlPNDGePcYKNt/2c0z/jvowgqIFxkTfT6Ac3Nu1wdlynuqO4n/4y4P70xf47gjBDza3Be5k56EQ6xcD4sgQmq5/eLb9h8qKnoudELs3ww+pVuTuyAl9HTIMJgT3rLmDYtdltoQbBLJ+FGik2BtTA8UrUTxNGo/nWEvKAVl2wTRuBaJe59f2FT6v0axAb6oE3zGP3uejToeluZoarnqCnEPZyRS4bk7fW/Bc9IfTswLt9Z+r+V6YJI+9VYtSfvXUm+7KmMpcm6zrrMYAEihmlk+Ojwyf/3Q6/3UPhf5vdbiwdb0Pj4UH0ShUO52G65jSmJkUsZfhgGhPz4JR+ZG5DgAOZpjep/wp1Vxn0FzG+z+RaBIUF5IBXI4jGUcyymY44sDqx1eqo9ZO0ysAr48Xsp0E46v9ZPJZZdgoHRTX4jT3W58bFlAvKvlGNrTVx+NtuBT1TpjWyEvfL7/483W0uxq62jpMNGSCzk+80AqWCTdYOINhIbEfKNOe4idzlxFuRQpn8BA8P/OiOHoYETPzoqiqDygte6VYXp5nd38ulSc2dkSI9Ko+8/zhqnePtVdVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(31686004)(38100700002)(2906002)(478600001)(6486002)(2616005)(186003)(36756003)(31696002)(86362001)(316002)(54906003)(110136005)(66476007)(8676002)(66946007)(66556008)(4326008)(4744005)(8936002)(6666004)(26005)(53546011)(6512007)(6506007)(5660300002)(41300700001)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjNEMU92cERFKzJVWm9FcDlQOEhrWklSaDRqY3lVTEd2K3QrSThhQ3RMVFFS?=
 =?utf-8?B?Nmd3Zk1tZjJWb0xrbHY3TFBEaEVhSDVuOGRqU0lzejNPV1dtdDRjb2RFQlBR?=
 =?utf-8?B?YjkzRFlVMGtIV3NDRm5mT0c3QWlSMWZVV0NPbnNjeGhrS2NVUGRlVDAxcXhG?=
 =?utf-8?B?Uk5NOGllNGxHWGR2R1cva3pZNm1Wczk3MksyMS92dGttRENpNVoyVWVmSmcy?=
 =?utf-8?B?TXVwTUN0Qm96SkN3SGdpM0o4cHBYZkV5T1N3SUxRcVNSbEt0QWN2c2ZrYVN1?=
 =?utf-8?B?YW0wSEtTMUE4M0hjcndPOEEwaDZOYmpINjErYWdrMlhSamdCNEt1V2VPZUpT?=
 =?utf-8?B?UXNPWHArZ2ZpY2g0bGxHdGtzakR6WDV4cUJVT2ZhVkw5bFRnT2E4WjhGZ0pq?=
 =?utf-8?B?bU8yY1dNNmRWT0NNVTZmK1NnNi9rcm40UU5NY2l5cjVaYVFyTTBBZ3JuSWow?=
 =?utf-8?B?SUVMNTVtdkFyQVFKbWVyRzl1SjJoYlhHMnR0MVl4NzVMMFRiVlBZcGp5eHBj?=
 =?utf-8?B?UzYxSmpkd3M1OENIbzBoTlpiVnNCSjJhaFk0bUR4NGR5eldYUHRlbE52V01R?=
 =?utf-8?B?N3lpNHBBNjI5UDg1d2NYdDZWNE1EZjJEWEd3eTM4V28rRzFtbnlMeFNqa09k?=
 =?utf-8?B?RjJhSFh4SzZwTUlTRjRUTWlQZjdhZlNhSUpGbmloMjdCa1JjamZEeUNRMkRk?=
 =?utf-8?B?aENCa2VCK2l4SXdFR05YTGhJM1d4K3RIWXd5V05lcWRtRHdqb0tUcGFpTEhh?=
 =?utf-8?B?OUU1NDdiUnNkdzZ5QS9hNjZWQkFPbEt3VG90WFFTT2d1YzhvUkMrQVZFQjVY?=
 =?utf-8?B?bmhKVGMyVUdBVEZqalBMV0tzWm1NSjdJcFR2T2VzdUxqMk1PNEdxQmRrNnhF?=
 =?utf-8?B?OC9tNlZuT3N3bkxmc2V5MSs5b2xsUXNLbHFqd0xTSS8rVDliekxqOHFlcEY1?=
 =?utf-8?B?Y29aUjk3bGZ3akgvakc0ME16bXNOTk9sektHRjd5bWx5MWhQbUx3NXNKRTdr?=
 =?utf-8?B?R3NOV2RGMVNTOHAySVNFMTRMeTRLU05iTW52dS93M2JMS3pESWlIV25XOXNa?=
 =?utf-8?B?enlOM0JHS3F4NXpYTndNMHAvR1FJYURMb0JXaHVPT1V6YkRGWXE0UkRKZnJh?=
 =?utf-8?B?d1dZYkhqcXU5MFovK3d5MWhMa1U5RURIWlhBekk3NWN3dEVPOTFkOGlwbnln?=
 =?utf-8?B?UlEyZjdac0VVbVU2eHUvNHNGelNPM2FYTUpDK1dmdENwZ1FIU2RXMGJ1RCtH?=
 =?utf-8?B?dWNTV1p0dndOWUZpUnY2M3grMG5ZYkpraXp4ZUpXaWxBT3ZLQnI5S2hYVlUw?=
 =?utf-8?B?NjM0V05UWEtlTFh5RVliVi90WnN0YkNwQ2xkV1YrNzFIcWEyY1lBNGRockV5?=
 =?utf-8?B?NEtBYnlEdjhvOHJ0aS8zQkVqeUNweXYyd2pRVUVTSEU2NkFJRTNXR2ZNaHIv?=
 =?utf-8?B?WEdiVGxxeURjYjFjM0tSVnJkUlQzVEd0MzlEZ1dMR1MxSjJqQWxUbkJBRDR3?=
 =?utf-8?B?MnpqUkRFbWF6VTN0MlZqVEdsWGMraXQ5R0RuQ05EaC9qZktoNFBGN1puaWRY?=
 =?utf-8?B?ODN0MmdYR1FvMzVIRlQ5amtXZzFsYnFIK2JuR1RlazVQdkR2c3NuQnNKV2Rk?=
 =?utf-8?B?R204UVFDMDJsWVZyRVorK050WkIyOWYveGNldlJnSEdZdVpVcEFaeEVDT3lh?=
 =?utf-8?B?SXBRbytHVXRNUWlKRXZQOUNTYk1rZGpkbDF1QnpTWEE3Um03eFRyWnV0VXFK?=
 =?utf-8?B?cUhrNXlJVG9HeDFjL3FrZ0diakdmV0pkZGI1ditGV1ZDWVI2d1JUSjRPU1hX?=
 =?utf-8?B?emx0MmNsNVc4bDd6UndSS2ZKOUpNU1dma0VtamUxNDlZZlFWMkQwZ0t5T0lN?=
 =?utf-8?B?QUROdVZPcm5ZZCtpdjA5bm05VlRZa1VwRFhLQWtpRGYrRk1BMWN2U3pqRnd4?=
 =?utf-8?B?T2R3SE5NbldZTXNZRTNoOEI1YkdmNm5UY2JLSGRMZ2FNbks4OUJ0N2hTd2RK?=
 =?utf-8?B?Mm5XT2FTbnFCb1ZoOGsvbHZqVG8vWUJlcGZDVXJCTHpDMyt1NGMybDltOXdJ?=
 =?utf-8?B?VXVKZ0doSTZSUVMxbkZFbmwzc3V5UlFOMytZSVg1Vmttc2pHM1ZVZjFjOEI0?=
 =?utf-8?B?dy9ZQXRkdm0wQkp5NmFiSlZSM3A5eVU2RWNMcnIxbXRFSXhVZlE2c1A3d0V0?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ton2XxlTL/yffsXXxls4WgIBPbzofQVeDTF3vxYDHm/czFiYt5cSbWio3/92P5ubnpdfp7V7q7re/ZTfSp1j0UJ8AjHlWJbV6aFukJgx6jUDnLYGmI6SlUjio1JYm9EN5U7G+cfxoO+pHEVRWMsCQw/4DpKDLbeMoWVFh1Rp5EtezyakUweMRQfZDTe7s5AG8uwq1zMTv2WiaVKl1g1w14/Aed39SukcZ1u89sl8AWfnGbSMjwj98gL4WeUW77WAzwgFd2Q/IE3lB/gCJNKgOb1cDk73oHAHr7x3i9KfnUB+kWd3ottm46Iuy8tAS2YxFodahvtCft4ntHqRRqqtCHLtm+0q0v6y7KlHELzceZsjaxxRX5abZpmXwj+946DiDt4v6Sd5uCR11QZ+1YGGLpzEn/BMK5QyaVz5RwiNHakscrn51oMBIBLm/KFNHw1ofzN/H4R5qFwiXinSzHs1fdT7TM0sA7Y+HnxDZzsvs2eyaFpocmIKn/phDYh5Q2WkZWIClv3defsVMlkmoZsMkvni0TiU8D5Y6RsAluwV45EAPkJrHjRRLCEGJ3Znj+MG+9KBCR/c+Fkru5BmeaiznTqP0+/MOK7PoRyr8HFok+Ja1mVsCq6aT9IPmQZRq5Ch5YSWZxjO35j9efOttOtnpN2Csg2Ebs0uIadWE38xJIGDNPqIzpj69eiQSI/GMEAdXZrW5PFK6uTQwZ399paVX3OEJgRn3Q4w3ss/p1qrB4RavroPSuN9JhC6/fYkszvUKivru9VWQix+XiIN3QdCX8diZl9YB9Trceqihq93Eweb2l2TlQt/s+PCPZID/We1Sz5QIGQwD3+PIlMpuQo5gA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f70183c-7ca1-45a7-f3d1-08db2b9dd79f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 12:55:13.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEoqxR8P6ir5GogmHfSF1SzFZHiZuVp/iKDciU5cuLc//Nrupjr9IunUr56RHLliAD6kUYv5VKGLKWsW7f6jmUZVsQQJg1NGxvggvrhdyDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6081

On 22/03/2023 9:31 am, Jan Beulich wrote:
> Ordinary scalar operations are used in a multitude of other places, so
> do so here as well. In fact take the opportunity and drop a local
> variable then as well, first and foremost to get rid of a bogus cast.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

