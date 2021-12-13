Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53E4725C6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 10:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245903.424179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwhuO-0004zZ-Cn; Mon, 13 Dec 2021 09:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245903.424179; Mon, 13 Dec 2021 09:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwhuO-0004wG-9U; Mon, 13 Dec 2021 09:46:12 +0000
Received: by outflank-mailman (input) for mailman id 245903;
 Mon, 13 Dec 2021 09:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0LF=Q6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mwhuM-0004w6-Vc
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 09:46:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d379ad6-5bf9-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 10:46:06 +0100 (CET)
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
X-Inumbo-ID: 7d379ad6-5bf9-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639388766;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0Sq8Zl1Ll3Th3Gv0t2nHSOOwJKe6TJjDdPUIJ7+qFek=;
  b=TpUG4NZWDSX0BFne2BnKM+rqRKVjjYIBrxAO6AKG/aFu/z28Xv+5EBFj
   f99jdlShr5qiMSehbQZoFAyye5yvrMbrCoiYBUmFn3cvtwK7BQzgCT3J3
   esWUaZlLcw7LWCvj8giXlSyqEI85v5ubktY+UQV2zb+r0cYHdu1tukp/0
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rlsmQixTcEc59mcTlm3rnJrGXfBuUPQT1UWpBkRphYsxrbyBkGB72/V7Jg42+BLuPIYOEnGu/f
 wDTgzCmxqfrfIoOJbFYuq8sqSsmtcJUz2/8JP6eCiKthdAzS0F25Sd2J/PitKmAZ8QfeB5ewOM
 KigecMNXZSvaKmcMLR1/R/mmLxwJK92otVJ07d3viglTA/pIV6DCycUGpd7ju4oTAJBPt9F0zW
 ugmpBilSvAARy1AYcJv2ipWwD5wCPY6W1zyiq1ASz5h9Lz9484Rvv5LoeRozAkWPurNxxD2gw9
 ekd/bDbZA+UX8Y8bt078/Uc2
X-SBRS: 5.1
X-MesageID: 59811934
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dA2RIateeYSbcoUnj9+YagTU+ufnVMtZMUV32f8akzHdYApBsoF/q
 tZmKWvUOPfbYmTyeI0kbYm39RkDv5bdxtU3HQVp/ntnQylH+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy2IPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllrCqRCcZN5P3qukHQTMHMRlRGrdG0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25EeRK+PP
 JZxhTxHUA/baE1VZHgrOcg3vMz2uFymfA0BgQfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQ6fpCkFCVgGsJB3U+VES5iem0jFakXNBSI
 FBS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vxDCFrmK2YTzSa7Lj8kN+pEXFLdylYP3ZCFFZbpYm4yG0usv7RZvVPCqOVvtTLIgP92
 SKg8woGqJIJjedegs1X4mv7qz6ro5HISCs86QPWQn+p42tFWWK1W2C7wQOFtKgdde51WnHE5
 SFZwJbGsIjiGLnUzHTVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMxkV4IjHOwFCHzBUOSX25WI551pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FKpf3VipKVPk3l2PeqwIhPVgDnH9W+I8ubcqjk0TPPUS2OhZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLaWX8UjyqZKdQpiBSFiXfje8pULHsbec1MOMDxwUJf5nOJ+E7GJaowIz48kC
 FnmARQGoLc+7FWaQTi3hodLNOmyAM0h9C1jZkTB/z+AghAeXGpm149GH7Mfdrg77u1zi/lyS
 vgOYcKbBfpTDD/A/lwggVPV9eSOrTyn2lCDOTSLej86c8IyTgDF4Ia8LADu6DMPHmy8ss5n+
 ++s0QbSQJwiQQV+DZmJNKLzng3p5XVNyvhvW0boI8VIfBm++oZdNCGs3OQ8JNsBKEufy2LCh
 RqWGxoRucLEv5QxrIvSnamBoorwS7l+E0NWEnP197GzMSWGrGOvzZUZCLSDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi/uYIwB5lEXPHa0WQJolhenTWj9NSsqBtx6NCvVfkU
 Ey45dQHa66CP9noEQBNKVN9PPiDz/wdhhLb8e8xfBfh/CZy8beKDRdSMh2LhHAPJbd5Ktp4k
 +IoucpQ4A2jkBs6dN2Bi3kMpWiLK3UBVYQht40bX9C32lZ6lAkabMyOEDLy7bGOd85IYxsjL
 TKjjabfg6hRmxjZeH0pGHmRhedQiPziYvyRIIPu87hRpuf4uw==
IronPort-HdrOrdr: A9a23:QWdcHqMIJDGIK8BcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.88,202,1635220800"; 
   d="scan'208";a="59811934"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUv1Ke8ECtu2NbVJjm1w4otV8vt516LfU5P2bT4KosKXHCBLqt6J7DyipEqIIA/fJ/Y0WwEEibUrSXYv3fQSgZerDnMY2463uIOgZHdWGtFFkqm6mcfwDMFxdkCuS50OSHFWTCdw5bwwdX9y5wv6VUPEe9/2uojzK+bNvdmoZQH69bO8+xdacQmP6FeYYvdtHRK0siE0JJ745/bqgaa5+H+30c0WsjG3fD3EkzMQKQdVZP910RrWeU+YsjVQOQU+Zr+hQULHw1F0Zvzo7jp/c4ehHNOFxdPM8VYdsFT8mYLn/nvqT9ZssG5Q7V4KUTLkmKiC+v7ELwCOfTkLdVyzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhCULhHec/tuhqvDPjk6+vqcrVCSdujL89mIN6CkgDc=;
 b=Gy9PfOckdjMHB3/Rbu/qOAmkVoZoRGze0FeG5zhh9Qm+ZO9UEkoI8+mVItHAx+1GnUK93FcT7HiB169WYNBxSQjRj1rod8LGCkZfUq3yI6/eh/+G3ggT6P9T9kxpxbz2NE4LKqC5VAGtucDCeDjczDnqNHClWVXDjdMtixHqrG/84e9QIJF0JiCJaez3T22At1m6M4K722Whsd9Tv7MfgTAC//WfljO9+QmzAxtA9e6XFghEpMoqQPjzty8FPFMZgCDc7584iJF5Pi9oVYxYkldhj59WvCWSa04P5BZ0g14ka9z3su8VuQa0hv4OO1TmMvnRbu6sgCy4VJOw+wwF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhCULhHec/tuhqvDPjk6+vqcrVCSdujL89mIN6CkgDc=;
 b=dT0csxKgu5rlhez6d8xwlxIlkOSDPp5fB/ASDLQQgmVGXqD0Qas1gC+Gc7va7fY6nCY0m8UjS3urdMltoI7geAQsh077cbbtXK4lcMwheSX8JCrdGtv42nD/KvjhcWhQBgBMt3FRpxMrK3d/yUKhgAoDdD7czPH381n82zJHo30=
Date: Mon, 13 Dec 2021 10:45:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 12/18] AMD/IOMMU: allow use of superpage mappings
Message-ID: <YbcWVRFFXerNqBPy@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc93398d-982a-edbc-4ddd-b5459cef8f9a@suse.com>
 <YbNtBPv1M1lIyEOd@Air-de-Roger>
 <d472fbb5-95f3-dc6b-8103-e7d76e71290a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d472fbb5-95f3-dc6b-8103-e7d76e71290a@suse.com>
X-ClientProxiedBy: MR1P264CA0068.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aac6334-339d-4be3-c268-08d9be1d5f88
X-MS-TrafficTypeDiagnostic: DM5PR03MB2489:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2489E0A7DF21BC37D6546B798F749@DM5PR03MB2489.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWraDrqXXd2XSCnoJ7GOMwTYyE/n9DxfGRFmhA98aPLJWg4AU+RSTGZugenUAeNpvkTzRetwB7L76j0WVE0jUghalmI3ZftEAEF4eIdWba8VYIDidjb2z+mbwjvNrcj9m87ecvThvhRu1oDmywjBv9GHdr1cWs3RAyhOpGoUu+82hRW+9NxTBabveFFN3XU9ktJonHU36gTsqF+vwYPKd4aa4ycOcxA8z+5Zm6zC8epvVUxxaHSXHgiVLChvgWoI5SnYWwsxZSS3KZnJtlFJP6G6IkoNTT0ZcCaENeK8/xn/ksVD6Fda9xNslvPv3NfsXIBfWKSBy+FZZXgiDjgq86+4rdLXofvywxGWrp/7K9i4gnXZ7H+per5Oz4xj+y9xIjft6XgOzmMnecRofGwQ5Mmr+HTINueWqHihQ2wTVPzHHU94hkF8jPxbU9wqjHD/vUASOWww1Yb7hOcrHm9GQCOKkjksUKMSGgc111MtgvJHSdtAiX8MSI6sUD2dForsZXU4gZyrSOn8gJOJmPoT1rBdUCDWz1g56dkevT01e+EF+RACz8+n3D+QPNMj4YAdwau20mrov80blUFuWo+2QtyYb43iovU2CjyM2n5SlwnnURc3HQX4D3nTfK7n2awqqJXMlkbW9nbES3wBDQYufw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6666004)(54906003)(82960400001)(38100700002)(33716001)(6512007)(85182001)(8936002)(4326008)(2906002)(86362001)(66556008)(5660300002)(26005)(9686003)(508600001)(6486002)(66476007)(66946007)(6916009)(83380400001)(6506007)(53546011)(186003)(316002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWlMaXdwSDN0bGZScjNiM0VVUlpXd3lsVWxuWmRCVm5DSVZ4RVB5ak5nTWRJ?=
 =?utf-8?B?ejdtYkdwaERSMjU2aEFnU3BCdzhZd3Zjc21leTUzcnU5bFhhb3V0TkJ4WnR0?=
 =?utf-8?B?UU43aCtYTWpnTjMxTUlLYTdXMEZHalp3ZCtHTTFpN3VBZ0huZUJmZ1RwQ1ZF?=
 =?utf-8?B?SXE1ZDFZakphVjVaNldteTZMN0UyZnhSeWFoamdyQTEvYml3WVRYY2crbUlG?=
 =?utf-8?B?cnFwdEJiNnNPamZWY25BTGhNVVJnelFQbFZpQ0plYllrTzkrN0NWeVBKcGUv?=
 =?utf-8?B?cGRDRUx2Uy9SMkIyQ1p0SkpIUS9TbGFFeitEb0h0aWR5VTZhbjBmb1FscjJp?=
 =?utf-8?B?TEJzZURoZzJETVZaQjJHNlo1Q1hOcE5TKzNaU0JHOG44eUtNc2t2cFFpaG5t?=
 =?utf-8?B?MHRRYkhyVG1PTTUzc0FrODE1akRKU29oLys4Tm9ybXJEWHJyeEtiTUtJMXl3?=
 =?utf-8?B?bDNBT0ZRQ0h3NXIvWFpwc0N6MWdtY1RpV1lTWG5qTDYzclBldXVVbkY2MmFa?=
 =?utf-8?B?ZEt1aUMyek84TWJQVnRmK0xMOUQ1RWgyMUo4ZUk3L2phdEF6ZjV4K0hWMmVZ?=
 =?utf-8?B?dVZmb0NQNEM0Zkdkbk96by9BenpoRVpxZUdydEw2dVdRTytxM2FjNUpHMzRz?=
 =?utf-8?B?QWtZM3E0RmVORjZpWGpoRys2Z0NtdnBJK2ZEM1JhK2hVRUpTd1VObW1kYVBP?=
 =?utf-8?B?V0ZvK1E0N1JUV0lyam9icU4wTEx4SnhmRDRrbWRJSjg5dmhra3pRSUFJMzJH?=
 =?utf-8?B?Z3NkMk9PdWFJZWNuTWJsbXJnSHBJbExIWFo1cmlpVUcyK1d3QTE2NHBnRTVr?=
 =?utf-8?B?eHI0SW52ZEZhV3k3NU53b05Rajg5ejN6WGtoYjVwKzlQMU5tSUcwU2tuT0x6?=
 =?utf-8?B?dVpDc3BXS2JrQk50dGlnMmh5TklDUkVaVW9LMWRHOFRIc054T1kwT0t6RStY?=
 =?utf-8?B?a2FXR0x0N08yYnlwNG11c1dNNWhQQTdiU05RRHU0QllHa2FRbGk0blpMQUdQ?=
 =?utf-8?B?WDRmamRNTFRHUUNhN2hUS0tmY2w3Zy8raTdvVHhuOXc4VGJvYUpxaHF0cmFj?=
 =?utf-8?B?SU12YUovQWdNRnR6TVVFclJKVnIvMzJmVW1jWGJxbTNsb21NaDNtc1E0Q01t?=
 =?utf-8?B?Sm5Ta2Z2RDRLZjAxTkRTcndaMmd3SWpKVmgyb0xweW5JV1NRb2FyUXNFRXdW?=
 =?utf-8?B?ZEdYM1FoYVVvdUpvNHVTd282cEVyQURkem9YOWhrL3hZSDY4WUNweWJXSVkr?=
 =?utf-8?B?encyWnZqMlVieVN4VEtEOE1ldGQ5aFdUSzRldTNOVjh4K0FkNEZnVDBQQWxm?=
 =?utf-8?B?T0JRZ1pzVTJhS09FN084OEdNMG4rVWRwRkhmSExTaklMbW9kR1JGUTZ3ekRI?=
 =?utf-8?B?d2pKZmZ5VjZZcGZqTXQ4b1NpMllTUUpqaFd4N09qRnhueFRMNFNkaXBnYkJl?=
 =?utf-8?B?YWZoaTU2VTh4UkVvZmUzWU5vcDNIaCtXazZpS2FCVGhmRzNQak83a3ZCMGZY?=
 =?utf-8?B?UkJQV1BPYjRpRXFZODdMSDJGRkwvMENIQWsvZ0dYekhCQm9HWWg5VWlhTElx?=
 =?utf-8?B?U0pHMjRjZmQ0Nlp1T3I5a3ZhbzZTdVNwUUJIUk1ValNNSFdPMzJlNjNTWFhl?=
 =?utf-8?B?dmlIUEsxV080d2RncFpSU0xKNTJIUU9JN0lYeW1idC92QTM1TmpudmRFeTFP?=
 =?utf-8?B?dnkvV3JjNnMwRUJkRExNV043NHJXY211Ry9KNG5nSEVtSmlEeDFlRHRHNFg2?=
 =?utf-8?B?RVE5N1FOV2VTR2VNTDlJVjhPZ3JvcW5TWkNXaWw4MGZjdWJuRkRJSzNxU08r?=
 =?utf-8?B?V2F1Ynk3dHBQd1RhRHNjM3V1TDk5ZlVZbG5WYTI1SWtMbjlkWTM2UVdHRm1q?=
 =?utf-8?B?S1MrajhGekhJaG1XUGI3WWpWeHVlenBZMG1oMk90T0MzaE9UcXZ4d2dBSjEy?=
 =?utf-8?B?ekxvUlRDWWVJMVZqa0xBM0xQa1VNUkNaWm1vNEg4Y3F0MXZyTWF5c2JYbzgx?=
 =?utf-8?B?ZkJXMXp0ZUl0YnhYbktRWG9EcEZ3VTRtS050alRDbWsrNFpvWnlsUDVjVStF?=
 =?utf-8?B?ODNxcCs0UlN3Z2tLVFUrMVg4blFpbDV4cWlWbXp5dGFScXpxOVVkd2c4UGlq?=
 =?utf-8?B?L25LQmtyQ2JRajB5Wnk2RjBWaWpUN2loNzdVaUlKSjU3QjY5NHVzdnBYTlJj?=
 =?utf-8?Q?Sz9Wg2rp/5WdZSNyaQR47zo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aac6334-339d-4be3-c268-08d9be1d5f88
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:46:01.8122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ohy/XJwTyi6fH83CXNTGYIRltyz/oc5bdYvNZpq4L9BUMoRQb1j7moC52eNJQPVCLC/BHP1CL4ExUC89DAJy8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2489
X-OriginatorOrg: citrix.com

On Mon, Dec 13, 2021 at 09:49:50AM +0100, Jan Beulich wrote:
> On 10.12.2021 16:06, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:52:14AM +0200, Jan Beulich wrote:
> >> ---
> >> I'm not fully sure about allowing 512G mappings: The scheduling-for-
> >> freeing of intermediate page tables can take quite a while when
> >> replacing a tree of 4k mappings by a single 512G one. Plus (or otoh)
> >> there's no present code path via which 512G chunks of memory could be
> >> allocated (and hence mapped) anyway.
> > 
> > I would limit to 1G, which is what we support for CPU page tables
> > also.
> 
> I'm not sure I buy comparing with CPU side support when not sharing
> page tables. Not the least with PV in mind.

Hm, my thinking was that similar reasons that don't allow us to do
512G mappings for the CPU side would also apply to IOMMU. Regardless
of that, given the current way in which replaced page table entries
are freed, I'm not sure it's fine to allow 512G mappings as the
freeing of the possible huge amount of 4K entries could allow guests
to hog a CPU for a long time.

It would be better if we could somehow account this in a per-vCPU way,
kind of similar to what we do with vPCI BAR mappings.

> > Should we also assert that level (or next_level) is always != 0 for
> > extra safety?
> 
> As said elsewhere - if this wasn't a static helper, I'd agree. But all
> call sites have respective conditionals around the call. If anything
> I'd move those checks into the function (but only if you think that
> would improve things, as to me having them at the call sites is more
> logical).

I'm fine to leave the checks in the callers, was just a suggestion in
case we gain new callers that forgot to do the checks themselves.

Thanks, Roger.

