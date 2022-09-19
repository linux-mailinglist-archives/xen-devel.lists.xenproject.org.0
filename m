Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE95BD793
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 00:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409000.651833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaPTD-0000KK-RM; Mon, 19 Sep 2022 22:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409000.651833; Mon, 19 Sep 2022 22:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaPTD-0000Gi-Ny; Mon, 19 Sep 2022 22:42:31 +0000
Received: by outflank-mailman (input) for mailman id 409000;
 Mon, 19 Sep 2022 22:42:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gC3B=ZW=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1oaPTB-0000Gc-Ao
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 22:42:29 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54f9dac7-386c-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 00:42:26 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JMQCnj028825;
 Mon, 19 Sep 2022 22:42:22 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn6stda04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Sep 2022 22:42:22 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28JMXOoW016459; Mon, 19 Sep 2022 22:42:21 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3cmm98e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Sep 2022 22:42:20 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MW4PR10MB6511.namprd10.prod.outlook.com (2603:10b6:303:225::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 22:42:18 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::70bc:4817:75d6:48d3]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::70bc:4817:75d6:48d3%6]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 22:42:18 +0000
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
X-Inumbo-ID: 54f9dac7-386c-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 from : to : cc : references : subject : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ZUDRru5dXfisBBHvA9fyqdSqWDmQ2ycDGpseeBP+EQk=;
 b=LrKW5WY67h/ADONKFjQR1eChrGaBvkErgTf+yKP5DlEIdvvvyh8A6o3U+76Y8VTOmAYU
 Nu8jZj4sMHOFQFAsGjajvityM71G4VRekfB4B+/Ere0fA9CAJ5hWoFV+vdv/5giAokGL
 Y7ChMM8yysJdTz2ipz6GTe/7/+AIEuF4JssrRDMYNDhi9Ez6Oa2ttNh9LjfHA25Sc3VX
 PTBiEXRVYCQ7gcoaVAK6OkzWKDHmTd/0mK5VBK6xayuKgX9GgADYk3TcYPEqn/iigQ9S
 k/POaSkiH4svLChJa8hsVUWk5DqzJff++mOnwaQXx3wwGjbcEOkAgPD2sFesAWHQnzX1 Jg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWKzOXgzKRkUQOx/Z+yGkN2q4AfUbU2QDbKwBJsKuLVaoDEr8LRqilR0M8jDInEoCAonLRAzT7i1qf18lIpmeVQJpD1Q88Fk1tnaCRlosnVCjyDQPXcuMqB9n+evfUu0Hm/DEi7EXCdwROJxvR3+T6TZKxjqgVf9Nan6H7rwpZsbu0GxYHvo5fkDxbnvyvZ1IqfTsg3dCqXgQKeUM80hsmn0Lhqu7u9kVpdsMQssnjnIE4ye2eJ8nfFbGiXgMdeB1nsvG4klZlc68vWitsn9vMA2Fk57CbK0kfglPWnnxMjgiofqy2OzD+HA8kKfcnC3e3mtIsKfejGURF/3uM023Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUDRru5dXfisBBHvA9fyqdSqWDmQ2ycDGpseeBP+EQk=;
 b=hVLkVXDTjslvGL960+OcEuNzWpgAI5ZA6pdDtXRrzZowezsgkI9ToqHAHm012nuYjvYo2tTvfq1jO8jo0lBcqMAtrhPwD/hhEC1bIjHjePl3V3mO+a7pDyJDFCjLeeUtjBFqv2hztBHTSaLNyTvv2E63LxlLvUxCjOsuvZ2YtY39w8MyZpF9/fHymkroWP0bTdiXe4MziFw7ff63RU+Kuopk47sjWLurRL4v7n7nE2mPkI7B/qG9BVkMJEblYo7kR0ERL/Khz2bH8lCOrE4gXesKNNEvEippTrjGbpygbuKFLw/LWaQrz0Ana2cW7NEoJw0H4erRaF6SLiusYBYYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUDRru5dXfisBBHvA9fyqdSqWDmQ2ycDGpseeBP+EQk=;
 b=pN3Wl0D7GaxkxyK2bjJ+nmuBCjNy+8Gg/N7KSwEjeKkwDF/hmUQXqE2TlMSiVgTtCc4BfBo27aM0c0VAyL3rwtWIGeH7VdcqHgv8RVLMh1qLF8zbfdiRlkM8bdDMgWf8wT+LMWJ8wzc7cNKoQdxm8okxgv0PRGj3ZtiOgxH2y0E=
Message-ID: <ffc59d24-7862-b7fb-e11e-b5f773129b0c@oracle.com>
Date: Mon, 19 Sep 2022 18:42:15 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Jan Beulich <jbeulich@suse.com>,
        Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
        Tamas K Lengyel <tamas.lengyel@intel.com>
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
 <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com>
 <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
 <29d29f64-b799-d56c-1292-661fb5127728@suse.com>
 <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
 <406b7f6e-d092-fb6a-d0dd-60a9743027f6@suse.com>
 <CABfawhmrnL1HGOWS1fkEv5X4CwfkrBj-+APJ=hM1GCzzgjW4zA@mail.gmail.com>
 <5d1b06f0-fc20-585e-9da0-fb24c5931ad3@suse.com>
Content-Language: en-US
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
In-Reply-To: <5d1b06f0-fc20-585e-9da0-fb24c5931ad3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0007.namprd11.prod.outlook.com
 (2603:10b6:208:23b::12) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|MW4PR10MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 79388891-8389-48ea-513b-08da9a903507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jKCD/t+IDl5CO02G6nP/oBdp4etzLiJD0r1sssA/Jrnbg1zSnE8JwHxwPr17x+08xtigAG4rAsaDZiRnMw+jnSiDATHmr9oXFC3Kk/Dlg3tShP6S5evMAiz1mcKmpqvNIsPqxmNBeg7QGm6GyDHycHlkVrQHp0CR9tIYs+IWfxidZ66vgr7OzknrwD2juCl2FFVxMSZfiSeMC4YnR/fb7yi0rILoJHqZEicxG5CBAY0JoCoGoLDzeWPLhczU5BrCVhda1QtckOXlLAQEc/bSuobm65c9+Cq1labYmERKV8wtsO/foJKgg7StCilh20dYKUPcEUQslJLM8RIcKekwNZKrhv3b4EjMsZFEedDXkRTkqmdl5QNZOfu+0MzzCPy1busy5VK7echTm7d+isNjJObLJBnGhQZLswITh1QKa61Scal/xcSagv13OGxE21xRHGUjmY4S2OJaTiZ45rdM37ib+WXwhnwTdFQlqfHjgDUS88IQLdIwTBvlTzSae5CfoT6quH3aRtTV8fB+RxoX6RhT/fUWBN6zM0x8oDDOqvohfUrreJA05PF6ufYIuGsovYvauAgI/+fF9O23t8Qz3xlmTev17rAanvp8uhI9WCyPDErGBpsSmpbTywyogs3PcW5BqMkomu7yrYWT95TsMbFRKi9WsmkJQ9NqhIc06ZVAvZewlx2uBYeF3IZFuUgQhvHfc+gUWi30kWKfMZu6zBQJrsToxt4lTtWHSGFQZ0GSO34jtGMvycu6SrMZkpXFwTl1TW6C2VbIHk0l6qsXzGIMOVcvRNPvZ3YshEmF+Fk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199015)(66476007)(31696002)(36756003)(66946007)(44832011)(86362001)(38100700002)(5660300002)(2906002)(6486002)(478600001)(66574015)(66556008)(4326008)(8676002)(110136005)(8936002)(316002)(54906003)(186003)(83380400001)(41300700001)(6666004)(6506007)(2616005)(53546011)(6512007)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEV0SVRwNGVaVUhZYzVpck4rOHR3TGZXS0g4TkorUnNqY3ROOWE0SmpJVzlB?=
 =?utf-8?B?VjA0ZUdkak9VYW9VR2VLZDZHWERtQmhqWm1kQ3h1R3FIa051cVlINGFCZFI4?=
 =?utf-8?B?WldXaVIrZ3JuNXFPTC9UOGp1aERPcFVhNUpSREJpL3RWS3d6ZEFxc0tVY0lE?=
 =?utf-8?B?elBWSUJ6NE5LQTdFL2ZRdTVMYVlQK0dwYm10cUI0NlRNdnN6YXppSVRtMjI0?=
 =?utf-8?B?d3VpU2RqWGhSUmZxL0VWekNBKzh4eTIwd2pMRDMwYXdhWE1LQ3FHbzRXdTBU?=
 =?utf-8?B?aEtaY3phV2xHenEzZnlSTmpBNlVYUElWTDlzUHhES241Yk0zb2cxaDZ1RkRn?=
 =?utf-8?B?QWJRSFpoK1VQc2ZLYmNLbloveWRVQ21xT3QxM1VHMElQeGZBRkNjYm16Ui9Z?=
 =?utf-8?B?UzYycHZKOHM1VWZuMnQ3eUFybm9kbXlrUU5JakNZWkNhbHIzeUFqcmRFMS9h?=
 =?utf-8?B?dnZKcFRFUnhFSi9zd0NwUzJZVjNpRnpuczJ2MlM2TVEzYlpUOWhZNEpLSE5U?=
 =?utf-8?B?NXRCU0lvem1ySVBuSzJycFQzbUNxam1ZVjQwcE9Ta3VEeWo3b3dwVSs5WXNI?=
 =?utf-8?B?WWtCQ0x1aWZlcGRuUGhVU01aTDY0TUp4NDROQVRnT2RzTzgwdVFkczF6cXR0?=
 =?utf-8?B?SHlwdk1PQ2c4NDgwc08yaTFwMFdMbmxHMkRtN1E1aEU2T1c4TjQrWHVCMFVu?=
 =?utf-8?B?SnlwbTBOYkZ2eVR3Mm9jbitCbGtGTFVhVFZGVzUvbm41V0U0RUQ3bXBhVlBD?=
 =?utf-8?B?WkpKZk5oY0ZVU0M0MHc2Ky84dGNBMml2WEc4dEx5YVFUbjVpNkNLamllOGFX?=
 =?utf-8?B?dVJ6UnBjSk1FMDV1RE9VRElrQmUySEs5SWl2d21MYWxid2xmeEhiREZ1MDEv?=
 =?utf-8?B?a09LTWVIeStuQlBuOHVSb2VwUVBnL2pYR0FuRTAyb1FvV3ZNam5sVGg3SitP?=
 =?utf-8?B?ejBpaFRYdU1wV2hYOXNBNW9QVGN5ZjlxRWZiKzJEV2VLczVhVkc3Mm5rbU1s?=
 =?utf-8?B?SVI0bGRFSHpkUUROL2V4elpETnFVZnJWZzdoZGFpK1ZkbEdVbHRHVDlZdVVW?=
 =?utf-8?B?blRnVmhXRFBFSEtpQ2hEUld5OU5Pb1VLZHBWdmpQMldSU1FEcVA5OE9BelhT?=
 =?utf-8?B?Zkt4Yzd3cTVlaHJyUTcyYkJqbm9va0xLbzBvL2d5Z2tGMDZndkN0N2poSGhQ?=
 =?utf-8?B?NC9YSmYyeU1MK0NId29XbUdjQ21rWHpHeFMveHliYVFkUGlFTkhDK2pKck03?=
 =?utf-8?B?Q2JIdzZpSUU3YllaYUJSSHYxOGlZQTlCYUpiU1RENHp1a1habEFkVmxDd0R4?=
 =?utf-8?B?RDZXUWFQTkxlQjFxTGNRcDJqZTZqdUxwMUxoNU9LZFRoWndBb3BMZ3lkRmNG?=
 =?utf-8?B?NUdWNkVKenEvMWY1VVFBKzFEaUNQR2RncXp3WklNREhHMWd6Q0FXSk15bDNK?=
 =?utf-8?B?UU5aYVd3MlVDUlB6QkYxZCtTckdlY2xFLzM1dk94endLR043b0Yxc1lkT00x?=
 =?utf-8?B?eGV1Z0NacGZEZWs2OWE3Vlh0dkJnWHFRQUNibENxY1FHcUpTaFplWlJDYXFv?=
 =?utf-8?B?dUhGRXFURi9XbnZYeFZBbExaSTJ2WS9mLzBCSXNwa0U3d2l0T2xxeTRJN1Ro?=
 =?utf-8?B?OG1KRGVqc3BpRGxVemozeWVZQTJXN1Z5TlNaUkZWTGdFM3FsUE9VNTRoUE13?=
 =?utf-8?B?UFgxY1dMa3FkM0dpazc3RVN5eFRNSnQvZWVVRDFsUHNNd3d2ckgxeFdqWk9a?=
 =?utf-8?B?NEZtV3RmU3JLbStocmlvTnJodVF5QXpjVmM3QVRPU1FyRzVaK3puNFhMVGZx?=
 =?utf-8?B?K0pDU2JBa3pJTW4yK2FDTTBKTUo2RnNjcEM2Q05OQXNQSk9WZHpCU285b1lP?=
 =?utf-8?B?MEtTRkRPcEIwZDRqOWZKT0ZMWWl4dU9SMGJQQWUybnRzWjVBbnJkS1VFN01F?=
 =?utf-8?B?SHdoNWZySmcyK053SHdGZ3JvdUoxelptenBFTnRtWTlkd0xYeWRZR0IxYWRG?=
 =?utf-8?B?V3VMQUhuQ0Q3S0pidDJaVmdUQ2tjaFB4S0FMeUt5RmtNZ044V2x1WWlRNDNv?=
 =?utf-8?B?UUdybnRsZFdpSS93NUJRYngrQkE1NEhrclZLU1hUTHg4c29ibEV0Q0twOTEx?=
 =?utf-8?B?aXF1K3poUVp0YjRyM1lzRjV1OHR2SENZNjlEU3BzWE5nZkpRSWdIUlhFRlk1?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79388891-8389-48ea-513b-08da9a903507
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 22:42:18.2767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdHwpdfh2HwyqUukMQUY0TU+UNGg3Dj5hNEeQY2x/OjdHgdn2/bqDb4Fap2na5cKyn0TSNjs+7Gs07c1+t0KpoRX8tm1c0VU4eNNEO4KX5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6511
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190151
X-Proofpoint-GUID: Yja_HkMapCUZ8HWgVMVrI3KGvkxjw5ot
X-Proofpoint-ORIG-GUID: Yja_HkMapCUZ8HWgVMVrI3KGvkxjw5ot



On 9/19/22 10:56 AM, Jan Beulich wrote:
> On 19.09.2022 16:11, Tamas K Lengyel wrote:
>> On Mon, Sep 19, 2022 at 9:58 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>>> On 19.09.2022 15:24, Tamas K Lengyel wrote:
>>>> On Mon, Sep 19, 2022 at 9:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>
>>>>> On 19.09.2022 14:25, Tamas K Lengyel wrote:
>>>>>> On Mon, Sep 19, 2022 at 5:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>
>>>>>>> On 16.09.2022 23:35, Boris Ostrovsky wrote:
>>>>>>>>
>>>>>>>> On 9/16/22 8:52 AM, Jan Beulich wrote:
>>>>>>>>> On 15.09.2022 16:01, Tamas K Lengyel wrote:
>>>>>>>>>> While experimenting with the vPMU subsystem an ASSERT failure was
>>>>>>>>>> observed in vmx_find_msr because the vcpu_runnable state was true.
>>>>>>>>>>
>>>>>>>>>> The root cause of the bug appears to be the fact that the vPMU
>>> subsystem
>>>>>>>>>> doesn't save its state on context_switch.
>>>>>
>>>>> For the further reply below - is this actually true? What is the
>>>>> vpmu_switch_from() (resolving to vpmu_save()) doing then early
>>>>> in context_switch()?
>>>>>
>>>>>>>>>> The vpmu_load function will attempt
>>>>>>>>>> to gather the PMU state if its still loaded two different ways:
>>>>>>>>>>       1. if the current pcpu is not where the vcpu ran before doing
>>> a remote save
>>>>>>>>>>       2. if the current pcpu had another vcpu active before doing a
>>> local save
>>>>>>>>>>
>>>>>>>>>> However, in case the prev vcpu is being rescheduled on another
>>> pcpu its state
>>>>>>>>>> has already changed and vcpu_runnable is returning true, thus #2
>>> will trip the
>>>>>>>>>> ASSERT. The only way to avoid this race condition is to make sure
>>> the
>>>>>>>>>> prev vcpu is paused while being checked and its context saved.
>>> Once the prev
>>>>>>>>>> vcpu is resumed and does #1 it will find its state already saved.
>>>>>>>>> While I consider this explanation plausible, I'm worried:
>>>>>>>>>
>>>>>>>>>> --- a/xen/arch/x86/cpu/vpmu.c
>>>>>>>>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>>>>>>>>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t
>>> from_guest)
>>>>>>>>>>            vpmu = vcpu_vpmu(prev);
>>>>>>>>>>
>>>>>>>>>>            /* Someone ran here before us */
>>>>>>>>>> +        vcpu_pause(prev);
>>>>>>>>>>            vpmu_save_force(prev);
>>>>>>>>>>            vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>>>>>>>>> +        vcpu_unpause(prev);
>>>>>>>>>>
>>>>>>>>>>            vpmu = vcpu_vpmu(v);
>>>>>>>>>>        }
>>>>>>>>> We're running with IRQs off here, yet vcpu_pause() waits for the
>>> vcpu
>>>>>>>>> to actually be de-scheduled. Even with IRQs on this is already a
>>>>>>>>> relatively heavy operation (also including its impact on the remote
>>>>>>>>> side). Additionally the function is called from context_switch(),
>>> and
>>>>>>>>> I'm unsure of the usability of vcpu_pause() on such a path. In
>>>>>>>>> particular: Is there a risk of two CPUs doing this mutually to one
>>>>>>>>> another? If so, is deadlocking excluded?
>>>>>>>>>
>>>>>>>>> Hence at the very least I think the description wants extending, to
>>>>>>>>> discuss the safety of the change.
>>>>>>>>>
>>>>>>>>> Boris - any chance you could comment here? Iirc that's code you did
>>>>>>>>> introduce.
>>>>>>>>
>>>>>>>>
>>>>>>>> Is the assertion in vmx_find_msr() really needs to be for runnable
>>> vcpu or can it be a check on whether vcpu is actually running (e.g.
>>> RUNSTATE_running)?
>>>>>>>
>>>>>>> You cannot safely check for "running", as "runnable" may transition
>>>>>>> to/from "running" behind your back.
>>>>>>
>>>>>> The more I look at this the more I think the only sensible solution is
>>>>>> to have the vPMU state be saved on vmexit for all vCPUs.
>>>>>
>>>>> Do you really mean vmexit? It would suffice if state was reliably
>>>>> saved during context-switch-out, wouldn't it? At that point the
>>>>> vCPU can't be resumed on another pCPU, yet.
>>>>>
>>>>>> That way all
>>>>>> this having to figure out where and when a context needs saving during
>>>>>> scheduling goes away. Yes, it adds a bit of overhead for cases where
>>>>>> the vCPU will resume on the same pCPU and that context saved could
>>>>>> have been skipped,
>>>>>
>>>>> If you really mean vmexit, then I'm inclined to say that's more
>>>>> than just "a bit of overhead". I'd agree if you really meant
>>>>> context-switch-out, but as said further up it looks to me as if
>>>>> that was already occurring. Apparently I'm overlooking something
>>>>> crucial ...
>>>>
>>>> Yes, the current setup is doing exactly that, saving the vPMU context
>>>> on context-switch-out, and that's where the ASSERT failure occurs
>>>> because the vCPU it needs to save the context for is already runnable
>>>> on another pCPU.
>>>
>>> Well, if that's the scenario (sorry for not understanding it that
>>> way earlier on), then the assertion is too strict: While in context
>>> switch, the vCPU may be runnable, but certainly won't actually run
>>> anywhere. Therefore I'd be inclined to suggest to relax the
>>> condition just enough to cover this case, without actually going to
>>> checking for "running".
>>>
>>
>> What ensures the vCPU won't actually run anywhere if it's in the runnable
>> state?
> 
> The fact that the vCPU is the subject of context_switch().
> 
>> And how do I relax the condition just enough to cover just this case?
> 
> That's the more difficult question. The immediate solution, passing a
> boolean or flag to vpmu_switch_from(), may not be practical, as it
> would likely mean passing this through many layers.
> 
> Utilizing that I have Jürgen sitting next to me, I've discussed this
> with him, and he suggested to simply check for v == current. And
> indeed - set_current() in context_switch() happens a few lines after
> vpmu_switch_from().



It is saving vpmu data from current pcpu's MSRs for a remote vcpu so @v
in vmx_find_msr() is not @current:

      vpmu_load()
          ...
          prev = per_cpu(last_vcpu, pcpu);
          vpmu_save_force(prev)
              core2_vpmu_save()
                  __core2_vpmu_save()
                      vmx_read_guest_msr()
                          vmx_find_msr()


The call to vmx_find_msr() was introduced by 755087eb9b10c. I wonder though whether
this call is needed when code path above is executed (i.e. when we are saving
remove vcpu)


-boris

> 
> However, going back to vmx_find_msr() I find that the v == current
> case is already included there. Which makes me wonder again - what
> exactly is the scenario that you're observing the assertion
> triggering? Would you mind spelling out the call chain, perhaps by
> way of the call stack from the assertion?
> 
> Jan


