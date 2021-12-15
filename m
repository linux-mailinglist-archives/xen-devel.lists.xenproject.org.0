Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280A3475A10
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 14:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247396.426590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxUmR-0000Fx-AZ; Wed, 15 Dec 2021 13:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247396.426590; Wed, 15 Dec 2021 13:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxUmR-0000Cu-7F; Wed, 15 Dec 2021 13:57:15 +0000
Received: by outflank-mailman (input) for mailman id 247396;
 Wed, 15 Dec 2021 13:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iD5n=RA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mxUmQ-0000Co-4x
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 13:57:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e58f4a1a-5dae-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 14:57:11 +0100 (CET)
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
X-Inumbo-ID: e58f4a1a-5dae-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639576632;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=971pSX+Xi/lDpOhCA1Tke+Ysl99LDypZPs08PQRLQIk=;
  b=LK5mH5BsxuLB1zdzRN/Y13fg7DJ34Fjlui7kVBVjqc0fNQM1EZTOuFWP
   XpSZaTsF0zMa8FIh3hV280ERpMsrVxY5YYuw9ervtA3AOGcU5oLwv4j2P
   9BxwvndzynDmWYDi+E5kUES7KnyNCnFNk6WoyECK3fb5937wm+I7P6rMb
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: i/pK7wI4uPqswoz5W2tg9D+OP2NUXlyr8pioedD9LDYFZWvDv6nsdI+2hRVArD9LwH/XAHnz8n
 j/icTDZuG+z//OgRBdhPNqGkFOXlPg/9yUZyDtM1y6NvMwR4NTRB82MCvwQbGvnnUyclV1d0i6
 7kMcW6uSuY3fS0MQL0vyH4nh1FBLNHr4shSezUGIfHW7emq8gJAId52RQUZdJNC5x7jfPY/VI+
 Qp/X4lh3GUOVSJsCrwu180i0OE0P8epdx4Nsb2wFcd7eIoSxYlM3AHj1QSd7uhHrKmNStDJSsU
 pJkVv6ct2nKZurvPryuTpNDY
X-SBRS: 5.1
X-MesageID: 60024663
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Yisarq/ByWLeVoO1PVKJDrUDbXmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 zMcXjuDO/2NYmT8eIwlbdi/9k0EuZGAnNIxQVQ/qSs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug6wrRg39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhq8
 dBSqrCsEzsEI4eLnblHQzp7Kh1xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhG9q2p4QRp4yY
 eIQZWNPURjeeydUGV41ApEhh9y2hnnGJmgwRFW9+vNsvjm7IBZK+KDkLd79atGMA8JPkS6wu
 Wbu72n/RBYAO7S3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l0ZPR/Bm1GjI4YyNrL9l77t8VZgUW2
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2nS9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocNbxorqp5
 iFsdy2iAAYmVMDleMulGrplIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGGyM
 RKL510Buc8NZhNGiJObharrVazGKoC6SrzYug38NIISMvCdiifZlM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efPPBa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhWdyVmXs6v9JQMHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:G/7ot6lKZma5gH4mphjNF64lHuTpDfNXiWdD5ihNYBxZY6Wkfp
 +V7YgmPE7P+UsssS8b6Kq90fG7MDrhHZ4c2/hhAV7QZnivhILIFvA60WKG+Vfd8kLFh5tgPM
 tbAtFD4ZjLfC5HZMvBkW+F+rUbsYG6GcKT9JPjJh5WJGkGGsUQiHYDe3nrbHGeBjM2cqbRfK
 D22iMtnUvRRZ1jVLXIOpBzZZmxmzSkruOfXfaJbyRK1OGc5gnG1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym769f1t6YHc4+oGIPbJptkeKz3qhArtTp9mQae+sDc8p/zqwEo2ke
 PLvwwrM61Imi7slyCO0EfQMjvboWgTAkzZuA6laLzY0JzErQcBepV8bERiA0jkAgQbzYNBOe
 lwrimkXtJsfFn9dCaX3bb1vkZR93Zc50BSytL61xZkMbf3b9Rq3O8iFEU/KuZjIMr/g7pXdd
 VGHYXS4u1bfkidaG2ctm5zwMa0VnB2BRueRFMe0/bllwS+sUoJjXfw/vZv20voNahNBaVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOVfUki97aLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwbrBdeV1JNG/xjRSCG2XCjryMtZ+59l04eMA4bDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7v5IW7nCe9yrk7DsllpWDkjueEuy5oGsmO104P2w9fRx6Hmmd7oVfXQLQo=
X-IronPort-AV: E=Sophos;i="5.88,207,1635220800"; 
   d="scan'208";a="60024663"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKoX8p469MbGid/k9BHgQ0q1bm5OVYwNFdHk1ecVFdZPe99xwpXs7pKMpE4bB9t5UnCN0j/QI84XxooPlmQMp8DtqEIhXmxW4rw1C+BwPFLcB6Cm22G8VUcmAM0TSM/QsHAlAx1XDHMkDUjjfV5QGlQuq5BsTrDfyAAbGr3zrl5yKNqRSDdtEwqwZQm7mthaqaEbdqfTCLRt6UmRPTESEUk5F6CSPiRNH7yA8mfpwz9N+nKA/L50dWSZV02UwW7gOkfPtootNa2HH4O9HkBVW7tJRDdTQvlo5pDY944Mj0YfOt02F9zMHOUIlpGyuqpCGIpu2Zl3JRs9Ys/FQ/8/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZHD19mx1v5bAytFP65czEDogI0hoGJz/gYVrGxQjyY=;
 b=cY3AbsRO8KRlKyXCcguw8nguOgNQj4DGRXX+oeEVue/2w8r+47tFqmuCfr8tLm7knTNa2ZLvi6JLwq/618aCGmIIQRLVumd/h2/cRQC5K1LyP5jhLYnIcTjrMvIDYpwP61p1FbH8xqCsD3vX03VawAVpYrQc7Zjt32kaCuEDFkGv2tLMxNmKFq7225uOxazkvI+whTqmg1If+7OxCkxVQZfSy8afElBG2OxM9d9SLgE9NYWF54DyY5jYR81gESVsyAZ+JVxcjSyeNW4W1m6KBTujm8pptqchoHIvygzbrQ7LDj2qs97XuViYq4s5rqB5XW+Od5HVTa8SHuVf4vgTrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZHD19mx1v5bAytFP65czEDogI0hoGJz/gYVrGxQjyY=;
 b=cnzwd99jJAUuuZVibIMaPWy8HsnJiPLWQC9bj8Sie+89imALRA6mvSrmrN06HyFd9/VboPcKDnLmpCT39Xpu/UUvxykIMm44JOEP4tpVPGe1DntgnMzceuzORtIq8RS+bUEeRLiTxlyhYt3PI/L53uY427ETGT0NZHZMfcf5zK4=
Date: Wed, 15 Dec 2021 14:57:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 16/18] x86: introduce helper for recording degree of
 contiguity in page tables
Message-ID: <Ybn0LaRuFpUfcmoU@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <aab0b88b-7643-cc08-756b-0684f93be257@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aab0b88b-7643-cc08-756b-0684f93be257@suse.com>
X-ClientProxiedBy: MR2P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::16) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf500cf2-b25e-4065-d215-08d9bfd2c7fb
X-MS-TrafficTypeDiagnostic: SN6PR03MB4496:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4496C6E8C8D1844D91FC8CC98F769@SN6PR03MB4496.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QGyzykFIk6ii4/FgpMes75pCExa+4vsgwE9U9TDAkx9IaDdMPQlYZ8UleY8lEGqMx+rrYHoF9Rql7pm8agLeYgXxjB7gYLFQ4SaHkKgT9dj5b9CdoSq7fdouEJMpNTaJkQJyNyRGx6HFboEjLUi+N7pb5WsykejasFGjFTqkJLHB9atjqgDJ80P7sdUNTYVM/WtPUcMbM0Yq+xMcYiI5TE1pY48q2B1npULK9b3YNzWvv7Dfj63VMLBoiL70mq47PsVXLz9HXaSux1prpyPKpaBHgxo3jQ/Atj05wkTZhf+Rj7YyPndqPVZ4NVpv9qkSiUV+PnvFCZ1PjmcwalPhEXSgbLgwnfQGJN/rP9olO4Luf+9lRQQYsCbZE8Tm9u8YOR9S6/SIR/YBYp25qvk775MHF4LHMFgQVvEFYCfc0sDmBxrNIES0Ife4R6gJSGmny0lu+L6oNCuPQcuZzCGrjeU9RlbOD75DkhEAKLQTri5hJVbx8e1LlDNjUh3VoyErB+dONf9ZSbxNyI8GcbmCrheuKK+R/E83gpSoX6Gt3ZxaXJIVsJ/2XzIk+3XUKns1aTBMRKVWizPLRkizyWRvXml1EZTlMkDIy1qsioyQ8xa40aSF9CZY5f2+lYPl8XuuSxtgo0mP2qZ+34Skw3W97Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(86362001)(508600001)(8676002)(38100700002)(6486002)(6666004)(6506007)(82960400001)(66556008)(66476007)(186003)(26005)(6916009)(9686003)(66946007)(33716001)(6512007)(83380400001)(54906003)(2906002)(316002)(85182001)(5660300002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UERUWXhkZ2pSc1laZHB3WXJGRUpWdkJGcUpmUktBMDJHM3ZkUHdRRkx6bGwv?=
 =?utf-8?B?aGROa1hyY2xIVDlBU2ZXdUVsTkg5dWhmYkRjZk5MQVoxOXN5eXZDR3BGM0NF?=
 =?utf-8?B?QU5xcGE0SFk2YUlNWmZjMWQxMzRQNEJlN2l4WUdSRUJWWVptanBId1RNeThI?=
 =?utf-8?B?d2cvakdEYkJ5R0xsbEsrMldtMWd3d29tUXVWb0RmTWd3eXlnSUZRVkdPTks2?=
 =?utf-8?B?SmRRTFNoM2c2eEM5WmhuL25ZR09sUm42RFprVU1rbDAvME95US9wbm9PODFp?=
 =?utf-8?B?bkRtdStYRUpyN2pocjlGSkhjWXZ6dEZlVTQvejhVM0V3MWc3L0xyVDEyUVBW?=
 =?utf-8?B?V2padTZuOTdMbE93QTBoSFdBak9obkIzVERFT0xkTENRWkQvL3FkeC82SVM2?=
 =?utf-8?B?NWM0RzlocnRPQ1hoRzAxVmtaMHdjNjAycTJ2eWcraEtOQ0E3a3FQbllVaDNO?=
 =?utf-8?B?MWJuWHlQZFl2L3NFMDRYWjlNVnNIenphL3ByRHN4cnMyWGFyemhMTERmclBa?=
 =?utf-8?B?dUViSFpORHZzdytEM29Iai9EZUpQWEFkMzRHU1NRdW5LQWxsbkpVWmlMVTFH?=
 =?utf-8?B?WC9IUUNIRlJiSGpxRExTSmU0N2VqMjZYKzJpOXNLNUxrSGd2NXh4Ujg0UnpZ?=
 =?utf-8?B?SkQwUlhsOWhmRVI2dzlGNlFINGhiWG9xQ1d0VXVCNjlGeU9OUEZFb29pMWpv?=
 =?utf-8?B?V3FrZEpXUmp0VUgrY1ZKalhjRjgwcVNrRlBYMDZVR2pVclFRZjlxZWZmckdT?=
 =?utf-8?B?dkpNVmpWOTRkVEZvMnI3Y3BPcnFadVZrYlBCU29DR3dIcFE4Vmg1YkFFcisz?=
 =?utf-8?B?TmEzVjVTeVhKSTBLak5IQTZ4Vlgva2lhbWNwL0JndzZnbm16eGVxL1dGTG9G?=
 =?utf-8?B?T3FENW00U3poRFUxWktmcmwrV1Y0R3BZdFIyQmFESDF5VnYrTFB6QmQ3Uklk?=
 =?utf-8?B?aEJlblBSay9pODNVYUtQbjg5a3g5OERTQ3hTSnhFZ1NPempnNDVkUDBEWG5O?=
 =?utf-8?B?Y2JPOEFaSGZRUnBrd3R0OUNqbFN3eTl1eTIvZTh2T3U4cUdTNFgwRm1pNEpa?=
 =?utf-8?B?dmNYTldLVmpKaFJseXhwZWx0M3JGYjVaN1RIQUw4dHVKNFJMdVdTWENGY3Ja?=
 =?utf-8?B?WEJNeDNLaWh2SXJTYUZRR0kwTFJuQ1A1S0xYSjM1aVR3L3NrTHZLTzg3WGJF?=
 =?utf-8?B?aTlQOWFaRlpnWXROUTVKb05rTTVFeitSOE9wN29DaDFENkFnSytvcmExTU1r?=
 =?utf-8?B?b2Z0RVZuUTQyRGZFTlptdVk2QnBBSEI2VitTMWNVdlNTNjZWRGhoSnZ5Y2p2?=
 =?utf-8?B?cGV1S2RiSGFyOENuWExBMlExdEc3bjRiQ0lMREN3Q205Mlc5cXprZWI1VUtT?=
 =?utf-8?B?bkVVc2tKNVF0alRQMkpGdGVWVkpxKzhwYkxIL09tMmx2RURybjlvUGNabS94?=
 =?utf-8?B?TDBtMkVwY2t0ZmVnMkk4RzdUaTVaYXZHdEdUcUp0cEh5UkFtZE1pWlM3TUNy?=
 =?utf-8?B?cWRnc1dUMVZlVWg5MmIwRkFJNUUzZEpTMEZQSnJYbURmbEtTVVF0VU5WTVNv?=
 =?utf-8?B?L0YyTmdlNjd5WWZPSGxjZXl6YjFVL2Z4VGp5S2tkQ2prRTA5WFBwVml6WGx5?=
 =?utf-8?B?QWRJRktDN3NlSjZmQkRLZUtGSFM3L01LT1ZQcWFlV0xXdWtyQmpROEtjTzNi?=
 =?utf-8?B?Umo3UjRFU1I1RHhGakxlbTlTZ1gxSCtqQ2JDT3BlV2E5L3QwNndKNC91akxG?=
 =?utf-8?B?dCs3Um9LSEYyYy9jSmM5eEJTK0VkVC9GZVR6RFNSRWVwY1k4VlBVdTFPV3p2?=
 =?utf-8?B?Wm8rMm12eTUyd3djWDZFV2JCMTU2bXNYYi9tNWpSU2Q5dVhucG1GaS9QUHhk?=
 =?utf-8?B?ZjkyWVN2akJPdVIvaWN3VzV5Wk93VWM3UjBXRUdhdzV2QkJWYUJ6cmhGUmhN?=
 =?utf-8?B?ODE3UHZkZE1QZmlOTUp6eSt2MHRLQnZiZVJRZHN6bmpkNVVVdjlxa2lBT3ov?=
 =?utf-8?B?OFlJL3pxZ1VCYkNFR1lwbXVFaGpvRFNwZXV4OUFKMEZtdytHOGk0K0J1OUVV?=
 =?utf-8?B?Um5jVVBwWnNyNDJJM3RSTTBKL3R2VGE1ZVdxQmNvMFNSQi9FbkRwTUZiUlRN?=
 =?utf-8?B?Wld3TnM2bE4zNmRRTnZDZUptaU9NWTlKSERQaFVBUEhFVEcyNjFPUWNtZDg4?=
 =?utf-8?Q?z1xTsDlpgJhbFpGOyz4htrY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf500cf2-b25e-4065-d215-08d9bfd2c7fb
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 13:57:07.2436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jc86v99dqc1LB8vuBn9HP8a9L3ADn42Z8S6NfbdYAm3aJLBfOR5/Jr++XBIyLQtNAgQfNqr2pLEOwipLcMqMjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4496
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:55:30AM +0200, Jan Beulich wrote:
> This is a re-usable helper (kind of a template) which gets introduced
> without users so that the individual subsequent patches introducing such
> users can get committed independently of one another.
> 
> See the comment at the top of the new file. To demonstrate the effect,
> if a page table had just 16 entries, this would be the set of markers
> for a page table with fully contiguous mappings:
> 
> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
> 
> "Contiguous" here means not only present entries with successively
> increasing MFNs, each one suitably aligned for its slot, but also a
> respective number of all non-present entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- /dev/null
> +++ b/xen/include/asm-x86/contig-marker.h
> @@ -0,0 +1,105 @@
> +#ifndef __ASM_X86_CONTIG_MARKER_H
> +#define __ASM_X86_CONTIG_MARKER_H
> +
> +/*
> + * Short of having function templates in C, the function defined below is
> + * intended to be used by multiple parties interested in recording the
> + * degree of contiguity in mappings by a single page table.
> + *
> + * Scheme: Every entry records the order of contiguous successive entries,
> + * up to the maximum order covered by that entry (which is the number of
> + * clear low bits in its index, with entry 0 being the exception using
> + * the base-2 logarithm of the number of entries in a single page table).
> + * While a few entries need touching upon update, knowing whether the
> + * table is fully contiguous (and can hence be replaced by a higher level
> + * leaf entry) is then possible by simply looking at entry 0's marker.
> + *
> + * Prereqs:
> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
> + *   contiguous bits (ignored by hardware), before including this file,
> + * - page tables to be passed here need to be initialized with correct
> + *   markers.

Given this requirement I think it would make sense to place the page
table marker initialization currently placed in iommu_alloc_pgtable as
a helper here also?

> + */
> +
> +#include <xen/bitops.h>
> +#include <xen/lib.h>
> +#include <xen/page-size.h>
> +
> +/* This is the same for all anticipated users, so doesn't need passing in. */
> +#define CONTIG_LEVEL_SHIFT 9
> +#define CONTIG_NR          (1 << CONTIG_LEVEL_SHIFT)
> +
> +#define GET_MARKER(e) MASK_EXTR(e, CONTIG_MASK)
> +#define SET_MARKER(e, m) \
> +    ((void)(e = ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
> +
> +enum PTE_kind {
> +    PTE_kind_null,
> +    PTE_kind_leaf,
> +    PTE_kind_table,
> +};
> +
> +static bool update_contig_markers(uint64_t *pt, unsigned int idx,

Maybe pt_update_contig_markers, so it's not such a generic name.

> +                                  unsigned int level, enum PTE_kind kind)
> +{
> +    unsigned int b, i = idx;
> +    unsigned int shift = (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIFT;
> +
> +    ASSERT(idx < CONTIG_NR);
> +    ASSERT(!(pt[idx] & CONTIG_MASK));
> +
> +    /* Step 1: Reduce markers in lower numbered entries. */
> +    while ( i )
> +    {
> +        b = find_first_set_bit(i);
> +        i &= ~(1U << b);
> +        if ( GET_MARKER(pt[i]) > b )
> +            SET_MARKER(pt[i], b);
> +    }
> +
> +    /* An intermediate table is never contiguous with anything. */
> +    if ( kind == PTE_kind_table )
> +        return false;
> +
> +    /*
> +     * Present entries need in sync index and address to be a candidate
> +     * for being contiguous: What we're after is whether ultimately the
> +     * intermediate table can be replaced by a superpage.
> +     */
> +    if ( kind != PTE_kind_null &&
> +         idx != ((pt[idx] >> shift) & (CONTIG_NR - 1)) )

Don't you just need to check that the address is aligned to at least
idx, not that it's exactly aligned?

AFAICT this will return early if the address has an alignment that
exceeds the requirements imposed by idx.

> +        return false;
> +
> +    /* Step 2: Check higher numbered entries for contiguity. */
> +    for ( b = 0; b < CONTIG_LEVEL_SHIFT && !(idx & (1U << b)); ++b )
> +    {
> +        i = idx | (1U << b);
> +        if ( (kind == PTE_kind_leaf
> +              ? ((pt[i] ^ pt[idx]) & ~CONTIG_MASK) != (1ULL << (b + shift))

Maybe this could be a macro, CHECK_CONTIG or some such? It's also used
below.

I would also think this would be clearer as:

(pt[idx] & ~CONTIG_MASK) + (1ULL << (shift + b)) == (pt[i] & ~CONTIG_MASK)

> +              : pt[i] & ~CONTIG_MASK) ||

Isn't PTE_kind_null always supposed to be empty? (ie: wouldn't this
check always succeed?)

> +             GET_MARKER(pt[i]) != b )
> +            break;
> +    }
> +
> +    /* Step 3: Update markers in this and lower numbered entries. */
> +    for ( ; SET_MARKER(pt[idx], b), b < CONTIG_LEVEL_SHIFT; ++b )
> +    {
> +        i = idx ^ (1U << b);
> +        if ( (kind == PTE_kind_leaf
> +              ? ((pt[i] ^ pt[idx]) & ~CONTIG_MASK) != (1ULL << (b + shift))
> +              : pt[i] & ~CONTIG_MASK) ||
> +             GET_MARKER(pt[i]) != b )
> +            break;
> +        idx &= ~(1U << b);

There's an iteration where idx will be 0, and then there's no further
point in doing the & anymore?

Thanks, Roger.

