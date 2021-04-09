Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D8359534
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 08:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107608.205628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUkNs-0003Nd-NI; Fri, 09 Apr 2021 06:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107608.205628; Fri, 09 Apr 2021 06:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUkNs-0003NL-I1; Fri, 09 Apr 2021 06:12:48 +0000
Received: by outflank-mailman (input) for mailman id 107608;
 Fri, 09 Apr 2021 06:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7vn=JG=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1lUkKC-0002YL-P1
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 06:09:01 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a9550ed-9d7a-4469-954a-90436a789e06;
 Fri, 09 Apr 2021 06:08:59 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13965A6N016603;
 Fri, 9 Apr 2021 06:08:57 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 37rvaw841e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 06:08:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13965Pe7046365;
 Fri, 9 Apr 2021 06:08:56 GMT
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2051.outbound.protection.outlook.com [104.47.46.51])
 by aserp3020.oracle.com with ESMTP id 37rvb67163-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 06:08:56 +0000
Received: from SJ0PR10MB4605.namprd10.prod.outlook.com (2603:10b6:a03:2d9::24)
 by BY5PR10MB3780.namprd10.prod.outlook.com (2603:10b6:a03:1ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Fri, 9 Apr
 2021 06:08:54 +0000
Received: from SJ0PR10MB4605.namprd10.prod.outlook.com
 ([fe80::a021:790:7ce6:6f16]) by SJ0PR10MB4605.namprd10.prod.outlook.com
 ([fe80::a021:790:7ce6:6f16%6]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 06:08:54 +0000
Received: from localhost.localdomain (70.36.60.91) by
 MWHPR2001CA0008.namprd20.prod.outlook.com (2603:10b6:301:15::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Fri, 9 Apr 2021 06:08:53 +0000
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
X-Inumbo-ID: 8a9550ed-9d7a-4469-954a-90436a789e06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=QU+vUFAgfWQAcpiYJv8KvXXmhJ5GhVE0kd9+7VWGA84=;
 b=IvBVVKxBldXaj+o+EsNaKuQ7F0FtrMRgqtvNQXWimfBEyPRRKDlFUY1gUTq3K7Uf5xWc
 rGNCgGP085hJPWyxQhKP5KVEDwWdpSC0Rs4gGU57geJjUvPrFJWgSMp3oxUPLHesgpkx
 JCbA2ecPBOvbMc/bP+1ac7/xTP0vAG/P1TKotvbjXGBcOxQu+6ZrLB5rj3nKuOJUwjj6
 62kFWuuc3SrY6WafM+KRRWD1cy/b+0Hg04UYSNBTnnKRS+UlIhno/+F9gVvtSmu8th5I
 ttaHInpEsRB2fgvcv8kL9NqdIS0pjnD2hExRbmGvb2J937zmPgpkpChO0/qDZS8bR/Ws dw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SESaxICiWt4u3PcT+W2ccLPKa0Nu8hiPTlXD2c2Dv0DOFKrEFyf+0mlevwSf/2IP+QEwfQOqTNux0flj6BKQn5KvuuhGSglN2IRehZA2s2RTY8xaoCRTh95xc22RupZo+RrEFMOcrnq1GnOWqBE+s0FP5tNGXqA817VfONXlXbypBrR8QbMzk1XXIpTxt9LyKQBTJs1eyVAIYR7rYVMp2AsSKj/kjlBGaJ+4OFc29zLl2PIWTdlb4AaiEIiX/+Ij6rRJxURksW26PGJgcK9kEEIsEAQVTOJKLRxYt+r0a3N21vJb7ZVrI7ZdaSPna/OvdL4kge3rh4kjNCkZwS7nNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU+vUFAgfWQAcpiYJv8KvXXmhJ5GhVE0kd9+7VWGA84=;
 b=B8eyChHlh0onwzi/oB1/aQhntbRekYR7EwgGMwaM1bN6Fru+fTWDsmPv7PpiCzpHXJCartURA9gwYqZtbpRLTg4c3XoXqdYb0GqD5kGzYlHoLwxHT43wiF8i4hlFBCtes1xJj4FHsuHZiEm+WVUPZB57ln3nlZ+drGsKzpUL6CjbXoJngpJLaEpXbEpzrRTQRkS86L+VWsCTNCABmdUigWqAr9AHgWpBqsVwH/9b/IEA5PCNRWByfKD0LFt6BTv9FDOygKLlxRD0ZdtbhZ/BB/56bjvDzdjvzp8xmBlLrFPpasM5iLImA4Qh8A94ybFvZt46N10Zo41q/xE0HNKqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU+vUFAgfWQAcpiYJv8KvXXmhJ5GhVE0kd9+7VWGA84=;
 b=CjgRdmZrib4kkJA5AwTSaE0RwbAzIEXwu4HOct61vQtAf89cfW8z7SywZFcK++i8FAQCjOnJ+z/4iWyxYDKE8EfzVLg3VKaWqJuGe5HiJ7tuxOFlTDuZrgMdXU2V8uFNKHA4cysD00gBB2yFcLrVlJvcXZRB1gMfSW0gdiEUXGo=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
From: Ankur Arora <ankur.a.arora@oracle.com>
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
        xen-devel@lists.xenproject.org
Subject: Re: x86: memset() / clear_page() / page scrubbing
Date: Thu,  8 Apr 2021 23:08:45 -0700
Message-Id: <20210409060845.3503745-1-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
References: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [70.36.60.91]
X-ClientProxiedBy: MWHPR2001CA0008.namprd20.prod.outlook.com
 (2603:10b6:301:15::18) To SJ0PR10MB4605.namprd10.prod.outlook.com
 (2603:10b6:a03:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa3d3a38-5219-48ce-df79-08d8fb1df41f
X-MS-TrafficTypeDiagnostic: BY5PR10MB3780:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB3780C271D7FF9746F9035969CE739@BY5PR10MB3780.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zFcODhwnjlZH5XCqA/5G6orqKH0i4LZNIXx6F3UV0hzg/jl5akV/wkydsaH1dAuPZCo6eq3RIfFlXVE302cIHR88mRH8PKP4Tj65Pat0c6Y0UKwZGqnmDbriJY1/DcLrhSO9EWkP6+RBc0WhqtwP1sDbNaSiFbjNEM02jDTHlCm/Dubsap19PgtyYg9NOFU0+C9K7dwczKiJND34Ie6FHtRddU5j52CLhnkL+DQaEFkZCPiSWyOnO9QA2h6fyv7zEakkhfMQC2Yy9s/3dXz/QXYvzuGskG+9w6DduSk6dgR7939C98rcXtGnDhFXo91ACulEkO/RA8EOHm7eeHDRHXajkikn6znN9KNtR/iY08g+2/Mc1f+Uqe7JtDLWbbNjCBOqZi3M4zrCfJxgpa3iMNdgqV6Sadwf48RtCQZFhVM85D3lqQTqVeYn2SyOpJyggZmLFUuberCqeAP2xBlXjU0MPNhTgesaZudTU4/3+CYYU2RSJSuu2xfcd3M1cLI7CIJmwpVea4mzB76VxfznrjPSogXvjInkJ/rBZC1rsm3fl5ch5P0MHkeRMuIvl4rImvE/UjYd1po1EmhplHlfUvn18fXpoMwLpa90KLrvmQ3MZmvd45H3FTxfHy3kKvlYeIjZ3LfS4zHD9HHMiJbuSuZBVXraJZiwMj//Xn/OiByGEIkw1ZYaCOrEucuGqE6XaaWkDvutkgCR3dyatU8GlIW9ceWTKGWWQ3ofERXMngmWC1zZ4wf8LdbUtV7IL4ue+/9Mp9GgJCkkbE1s3XBPu7e4hPWAjnZegAK9emqpIUk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB4605.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(376002)(396003)(136003)(36756003)(478600001)(26005)(53546011)(6506007)(66946007)(8936002)(966005)(66476007)(69590400012)(956004)(6512007)(66556008)(6486002)(103116003)(5660300002)(2906002)(38100700001)(6916009)(1076003)(8676002)(2616005)(38350700001)(83380400001)(316002)(86362001)(52116002)(4326008)(16526019)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?XUfN5XHXYSncC4+RnOl5GZ5WHaG+XBTP2lnl9GFeLU+O1VAJkdoCTMRr2w/A?=
 =?us-ascii?Q?MmCnO+OS54VrSRV6EcG2cjsnk6jPbKXRzHA+Q+sGezGRhzaHRlB8mKhK72By?=
 =?us-ascii?Q?04SM8R+j0el4amU54Eht1+owAaoIeKhnwH+3yvYcLLjIMrPuLfgHEK/GPJNu?=
 =?us-ascii?Q?rwatFoj9Yxclmg7Y2OUr/pk62dQe/ALCh4TpeOwskWCba4MYFiaXmLwyzhNp?=
 =?us-ascii?Q?J/Dst8bHbD0PLIOGV3DMXF3lyQYhdaJa6Cd4QYI6AAXMxpc8qq6fgwoNMLTm?=
 =?us-ascii?Q?xItF9HRWoNMAECgNWAbXMKrSO5e/ZpZa9UIDWLDC94gVp1lrMK2Za7sewkTR?=
 =?us-ascii?Q?5VGbjkqsct2NeHkqyyFg1IfG7te6EQIxxpOKKSJfAE9ra+jTlfvaWSGHZuQB?=
 =?us-ascii?Q?G8Rec3jqWlvrYXth+pqWwN9UrCdU7KPPqrzYRF9uolh9hHK7nWAK6rJvC+D9?=
 =?us-ascii?Q?nFx1PrwziiQWf117tcpYG8FFI2NPAJ2ELDuOdB/esEnurkk5Doabj67upQKv?=
 =?us-ascii?Q?fBoIo8O0ntp/4/L7eA+GuV57phpeMg4MiKswaEbu/APqc6O0h/AsvxHMAkCy?=
 =?us-ascii?Q?dEtzjLq/0MAbukt8N3dEOjFQpKb7c0dkxw4yU/lo+2NxoB9NVjm7cVksC60a?=
 =?us-ascii?Q?fCAp7s+TeSf5nc/0H/kht/LyTCVXxIHi+IKWEpXSJ+54uHjnWsNoEoptT738?=
 =?us-ascii?Q?BM5XbvXB5dtnxPG37PvEJwnEoHDjZUi++JYR+iSAvMi/womJ0oMocDvxZLjR?=
 =?us-ascii?Q?i9ztJHXOjEVPD76PbHg8c0yu70xO0M3tDsKMLclJn0QFI/mtZ/Elou1LueKX?=
 =?us-ascii?Q?8DGzi7uEvDqjSWRtEDXBaWVSp34GeRK2UDKK/uqJtJ0QlpobPTBNszSl2+3/?=
 =?us-ascii?Q?UtCRd10aNhwuxpo2PT/xnhv5watHvl1CFZTMlg2n8yBIQiws7fAXLSUfAdZi?=
 =?us-ascii?Q?1MlFVZ7A6dQ3n/PnSgBn2VihRwtg+NL7m9HY1IvwRGZJs9GEpGClcUgYXffe?=
 =?us-ascii?Q?ZIKKYwcFFlgvw+l5X4Q5ECXMr80UtJMxxIKvl5qF2IOVh2bNut9hcaTGRxvX?=
 =?us-ascii?Q?NevWpms0Jn5NBEcJGI9VNzAoIgvuOmpgY7a68us5P2Zu6gNm7M45eC2JKmnb?=
 =?us-ascii?Q?2TnBvyLdTCp/cWErpgy9GUZkvY2N+Jf7nxyZRGZ+H24vU2Xqu5+K+uOh82Mk?=
 =?us-ascii?Q?NWx3k5jllPoRFj7CroFsGUk7UgF1RFRLAohCxUHQzbGcVFhVpeNRqXl4Gvcc?=
 =?us-ascii?Q?SpS41EcvfiPGvK3cel2LPlwAJiW5ZRaBN3cpeFOyuazQLu4DsS4kWd5cFAbl?=
 =?us-ascii?Q?GAwoymYE+vUac2qCYoX+rEjZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3d3a38-5219-48ce-df79-08d8fb1df41f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4605.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 06:08:54.2791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ey3sxOloYUZj9hBL+YP87iBuQirDuyxzt7LbWXWG5BmUc6E+3UG0m+tMpLiJLj89ZnpIkIGxJN945RxeJC/oiBSUEmBrfHgD9EXcF0a1YBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3780
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090046
X-Proofpoint-ORIG-GUID: EtO8WnLCk8vqCxSujLpDL3mrXsWT3try
X-Proofpoint-GUID: EtO8WnLCk8vqCxSujLpDL3mrXsWT3try
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090046

Hi Jan,

I'm working on somewhat related optimizations on Linux (clear_page(),
going in the opposite direction, from REP STOSB to MOVNT) and have
some comments/questions below.

(Discussion on v1 here:
https://lore.kernel.org/lkml/20201014083300.19077-1-ankur.a.arora@oracle.com/)

On 4/8/2021 6:58 AM, Jan Beulich wrote:
> All,
>
> since over the years we've been repeatedly talking of changing the
> implementation of these fundamental functions, I've taken some time
> to do some measurements (just for possible clear_page() alternatives
> to keep things manageable). I'm not sure I want to spend as much time
> subsequently on memcpy() / copy_page() (or more, because there are
> yet more combinations of arguments to consider), so for the moment I
> think the route we're going to pick here is going to more or less
> also apply to those.
>
> The present copy_page() is the way it is because of the desire to
> avoid disturbing the cache. The effect of REP STOS on the L1 cache
> (compared to the present use of MOVNTI) is more or less noticable on
> all hardware, and at least on Intel hardware more noticable when the
> cache starts out clean. For L2 the results are more mixed when
> comparing cache-clean and cache-filled cases, but the difference
> between MOVNTI and REP STOS remains or (at least on Zen2 and older
> Intel hardware) becomes more prominent.

Could you give me any pointers on the cache-effects on this? This
obviously makes sense but I couldn't come up with any benchmarks
which would show this in a straight-forward fashion.

>
> Otoh REP STOS, as was to be expected, in most cases has meaningfully
> lower latency than MOVNTI.
>
> Because I was curious I also included AVX (32-byte stores), AVX512
> (64-byte stores), and AMD's CLZERO in my testing. While AVX is a
> clear win except on the vendors' first generations implementing it
> (but I've left out any playing with CR0.TS, which is what I expect
> would take this out as an option), AVX512 isn't on Skylake (perhaps
> newer hardware does better). CLZERO has slightly higher impact on
> L1 than MOVNTI, but lower than REP STOS.

Could you elaborate on what kind of difference in L1 impact you are
talking about? Evacuation of cachelines?

> Its latency is between
> both when the caches are warm, and better than both when the caches
> are cold.
>
> Therefore I think that we want to distinguish page clearing (where
> we care about latency) from (background) page scrubbing (where I
> think the goal ought to be to avoid disturbing the caches). That
> would make it
> - REP STOS{L,Q} for clear_page() (perhaps also to be used for
>   synchronous scrubbing),
> - MOVNTI for scrub_page() (when done from idle context), unless
>   CLZERO is available.
> Whether in addition we should take into consideration activity of
> other (logical) CPUs sharing caches I don't know - this feels like
> it could get complex pretty quickly.

The one other case might be for ~L3 (or larger) regions. In my tests,
MOVNT/CLZERO is almost always better (the one exception being Skylake)
wrt both cache and latency for larger extents.

In the particular cases I was looking at (mmap+MAP_POPULATE and
page-fault path), that makes the choice of always using MOVNT/CLZERO
easy for GB pages, but fuzzier for 2MB pages.

Not sure if the large-page case is interesting for you though.


Thanks
Ankur

>
> For memset() we already simply use REP STOSB. I don't see a strong
> need to change that, but it may be worth to consider bringing it
> closer to memcpy() - try to do the main chunk with REP STOS{L,Q}.
> They perform somewhat better in a number of cases (including when
> ERMS is advertised, i.e. on my Haswell and Skylake, which isn't
> what I would have expected). We may want to put the whole thing in
> a .S file though, seeing that the C function right now consists of
> little more than an asm().
>
> For memcpy() I'm inclined to suggest that we simply use REP MOVSB
> on ERMS hardware, and stay with what we have everywhere else.
>
> copy_page() (or really copy_domain_page()) doesn't have many uses,
> so I'm not sure how worthwhile it is to do much optimization there.
> It might be an option to simply expand it to memcpy(), like Arm
> does.
>
> Looking forward, on CPUs having "Fast Short REP CMPSB/SCASB" we
> may want to figure out whether using these for strlen(), strcmp(),
> strchr(), memchr(), and/or memcmp() would be a win.
>
> Thoughts anyone, before I start creating actual patches?
>
> Jan
>

