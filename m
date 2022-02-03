Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF864A8636
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264878.458147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFd9s-0006qO-BR; Thu, 03 Feb 2022 14:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264878.458147; Thu, 03 Feb 2022 14:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFd9s-0006nu-8T; Thu, 03 Feb 2022 14:32:24 +0000
Received: by outflank-mailman (input) for mailman id 264878;
 Thu, 03 Feb 2022 14:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mjBt=SS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFd9r-0006no-HF
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:32:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18178f12-84fe-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 15:32:22 +0100 (CET)
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
X-Inumbo-ID: 18178f12-84fe-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643898741;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=oBUglG6X8uiWkqddQZ6935oCf0m9hHKC4JL6UB+D6dQ=;
  b=PgrO+KHfxcEy+JtMzvi1LnkWNBf7o19ngq/z2nbpEcJjZGtuV3IloZzt
   7uYAjH2x2FUd4j4CXoC3h3DJXhLtS3Q50YJi419xDp2D1RkKJMFciZVmy
   mcZ9+dxFhpufOW/d1BcgtOR3K7au3f7OTQiXqWjOV3PhkT+6X/070oZHq
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MCNAOIjh+atY4GbeYkBGJiiWl48Se2YP6bivFr9byG9pU1fhnyB8Gq59t8ksoVQXdxGrxcoxcz
 e8w3JbkNsIo/gK6wvJ5ACJS8Kzxsn90/q2/v3X3yFimzSHOqQrawz7txKA+Mp016TDQfdvMCmT
 WsAtXhK7KloPi4GcN02t4ApiMupvDYGGzI6zfSwGwijEcczqds3KCPCGXA0cHbITOvDCY/Jhfn
 6ffFJNnNNUP4mGMgD4zpIi8AV1pgg58lubH3wGdh+tfZcK9y4NrLgU6xwxp8j9+uqiVpj42sWF
 Q6YiFzlQqeyqdB1JI1YRzspN
X-SBRS: 5.2
X-MesageID: 63417709
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zgNHJ6vnjQMD/4t029Oji8QUeefnVKdZMUV32f8akzHdYApBsoF/q
 tZmKTiHPfmNM2Hycttzbt/k8R5XupLUndZqHgU9/HpkFisX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplsr3vcgoqO6z3xOlaDzJdPS4iLZdFweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JsSRKmBP
 5txhTxHYQbvYk1/Og4tNtFhxNeY22jkVxRhkQfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80jUqhbg/8gqsVNaVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLm8lEQVMa9knj5M7AmAB0
 3GGw8PTBgU65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM53jXznG0gpkmRF4g+ScZZmvWwQGitm
 G7S8EDSkp1O1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 SBsdyu2trlm4XSxeMqlGr5l8FaBvK7tDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0Nv88IYSX3PPQoOOpd7vjGK4C6TrwJsdiPNrJzjmVZLlfbrEmCm2bMt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepbbDOmM75ohIvZ8FS92
 4sObKOilkQAONASlwGKq+b/23hQcyhibX03wuQKHtO+zv1OQzB8UqKBnO96JuSIXc19z4/1w
 510YWcBoHLXjnzbMwSaLHdlbbLkR5FkqnwneycrOD6VN7ILO+5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:ETTkA68MonO2Z2R7Yypuk+E0db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhORICOgqTMyftWzd1ldAQ7sSi7cKrweQeREWldQtqp
 uIEZIOceEYZGIS5a2RgHjaLz9J+qj6zEnCv5a4854Cd3AOV0k2hD0JdzpzX3cGDTVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+xg+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlYgnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxWIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8O1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh4LD3xHklXqvoIRiKqbzOSI
 JVfYHhDbdtABmnhknizyZSKIfGZAVxIv+EKnJyz/B9nQIm3kyR9HFotfD3qE1whq7Ve6M0md
 gsDZ4Y5I2mNvVmFZ6VJN1xNvdfWVa9Ny4lDgqpUCfa/ec8Sjfwl6I=
X-IronPort-AV: E=Sophos;i="5.88,340,1635220800"; 
   d="scan'208";a="63417709"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcPEZFcjmRHpE2l+MQRNP+mIWWP2EvvsQHApnda30qSZsPL6dUiwkU8izpy3gIrky6p00gQVB2tqa/hk6Xrg1A/Rm0Vu7BQNAqQv7A7u9utw/U5193DObg+AHKdpIo4WMIC8z6HS2JMnvs8OQHhbfjzq7imAue47hBSZsOAZDtbS9F1xvO4x5YFEJUU3Puhau4N2NLSwOyEV1XN8lOVjCLrzZUiK9ua2aqN4f7aTOo1KnmuSrtzxnHQIMfFTQkQslnxzXacZ5uJ5TbQX2NAnzbpckeM1/ZrkykU14biZOlcDLFuYY6zLJGttSmZSIOwCjKdK1P6Ea0WsslAioooxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdZCE3jW8S28XPDZ2yi5CBt3HMczKkZ71EmvZ40xOhI=;
 b=IcV5Of9PPlCDp59QzR+5xV0BI4lpELCsSu/8+jE8ExKQMGdfnCJdZtZsyI0AZ9VpkQu6OW0eChXCltNtRbS5UlOpaZ7L+K79wGd2qPK34cCnoZQxemZP+1AeW6pdlwP/rBl842RewdTKL+IG3OhoKow6yr8QKQWhLljT5rEv7B2qdgd24BowImgfxNDihAabmUnCnaDm7HjTn8wzL+KbWDlDR8fv14avjItGDPWiK7cj/M2OAfwhGDgk4BnDvOiB5NmFqGxB1LLkot0QIh6a3yZLxc+b0PhWjX0/ivqoCQYN5jy8AN6fpX688LiSv8a9pSfKFW2qVS1D0q2ZKA5Ubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdZCE3jW8S28XPDZ2yi5CBt3HMczKkZ71EmvZ40xOhI=;
 b=JaQnCxFLeoT3OUrQNEz0Rz7cousvE7v9gSaj/REn7SRnLp+7yYY2i2Ijlki2UcDNBXWWbB14n93klJx9hXT2Pd3YP6bIuun1mUO+CDM+kToGolcIgM2yTfFGWbOhGT8qzQqTrnQoE9yyOl8qag4cqIXhYyPdhVLltg6V77QrfR8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: [PATCH v2] tools/libxl: don't allow IOMMU usage with PoD
Date: Thu,  3 Feb 2022 15:32:11 +0100
Message-ID: <20220203143211.18967-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0457.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d57dc1a3-29fb-4de0-c564-08d9e721f952
X-MS-TrafficTypeDiagnostic: MN2PR03MB4942:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB4942A8A09A8BC3963CDB269C8F289@MN2PR03MB4942.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uRTZzmOuuR9181fwqoT61dIhqLzP4DDisH5LBzaPGdHSY5zI8rP2zMX+MfO1KV5DCxBCU8XtrZO6kxM1e05aLgTn8DMI7yi1pK4LcrsgPd0R1GvhhVOam+RozE72n9E/JRstxyNh0HTlnMF0hSPvLhc4xzlbuXKzgt1UvkXsDd0dZTniyqxUhP2XKSh42ERjeDRioSpNFVuaEYLEHFZKAWUc4LLGhW7F/EcLOoTikKfEUN5XBW2YdScVUDtl4byWl6aNbkGe+705f7FiPfZKFOYYgRb6D6ZylMpV31xHwf2LUNa2NtCg460/Keeq1SBNDpFNYXTWoMChoRVKe4MyJ79mITRyJh1UIUNqSJHOuqgFA/3NxdFjctrsgO3E9JzTqXnHjkzzMgiasclB7DrwkUWzcA15PrsTt8GqtsH25W5ZffSh7g2i1mIHjkEKrKkd2nlDOnzBfBXgs1ZjQPxv8jannHUtB5Mo+fRojuq+Mxq67z+jCRy3E3+XK9Bie8QFh8an3/gfoZhHIQ5JTS8XArvDwelddlN3YE60s3DPhZZQRfLNzWI2u1D+oBPFfP/VWNN2yfdrVRDc7ou/CiesMPLXBpsWm3NGR+PuV+5gJhMsa8liAQvdH4a5kYmgHKwklPvLVpXCoe0Tkm8wr4GEBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(6916009)(38100700002)(508600001)(6512007)(86362001)(316002)(36756003)(6486002)(8936002)(8676002)(5660300002)(6666004)(66476007)(66556008)(66946007)(83380400001)(6506007)(26005)(186003)(1076003)(2906002)(2616005)(82960400001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE8rVi8zQ25yTlNja1FYTGZWb3dic1BVZTNGV0tiSkVxNXU1cEcraTZZUWg4?=
 =?utf-8?B?dHRyKzVnSWw4TXl5VmJ3ejFiOWxXMXdJQTRaQlhpdXc5RFFvVFFwMG9tb2J6?=
 =?utf-8?B?eGZURUJsbDlEZU8wdGhCTUpzOWZnQTlnblk5M1pGZWdDVkl2OE9aUS9FVVJz?=
 =?utf-8?B?U1BlUkJOc1BwbXpnK1pOMWM3UUp3YmtIUE1NRlVtQlFza3k0TjAvZExzOUZn?=
 =?utf-8?B?NWlTeFNKMkNwQTZROS83ZnFVdGUzWFh4QzZQQlVQNWIwY2R0ekFQLzZMdVcw?=
 =?utf-8?B?bGdRSlhaVWo5MGdHT3pNZFJBcE1YdEh5N3ByNG5CZXFyVUFoQ1IxNXQ4bWhr?=
 =?utf-8?B?dllwbTRNZ2pYWVNlTG8zcWlpVUN6SURsNGlXYjJtdUNxTFlvTThlWWhJMkVn?=
 =?utf-8?B?aXdhaTRHeW9YeDhWY0p4enpsUEplOXg5WUhWUExsL1lnT24yQ3VLdWRKTmRr?=
 =?utf-8?B?emJQdXk3bTMzSWptcHVURVZnaENQcGt0RWNwOWxXMmdLMDMzM0hqL2hheDlo?=
 =?utf-8?B?RUpEZEdla0t4OEU4SW1XczR3bmpIdDlSYmFnbkZwZXpGWkZlaW8vb1o5aTY4?=
 =?utf-8?B?TzRkdDc0ZFpaS2p4S2JSQksxZFlJbGhWeWluaUs2bUcxTm8vd1F3ckx4MmpB?=
 =?utf-8?B?WEhFUDVnZEs2bFJxK2RhWFFNR1F3ay8wVXRoeSsyT3pkREE3T2YvLzJlVUhk?=
 =?utf-8?B?NUxGNkpHUmhCNVNDYzdZcHFsdTNVaWFlTWRKM0xhdFdCT3FYMkhXRE5ZeXR2?=
 =?utf-8?B?WEZ0QmZYT1FXZitmbUdSMEpBSmZWc0RQeWJoSmp3VzJoU1dUZ1U2RDJJdGZ0?=
 =?utf-8?B?c3NWODR3VUNlN1lqaGpRVFZjV2QrRFRmbGpDODBwS00zSzYwK2w5dGZQczNx?=
 =?utf-8?B?eEpoelg4MXlYK25ZeU41SklxRWE5cjR6bUhBemM4cUd5T0NrNXM4cXZDU2Fi?=
 =?utf-8?B?RHpZclNMdG83MC9kakJwWlRlbGtjNkhNeTNtQTJtTjd3NkhrMnA5WW5ianNT?=
 =?utf-8?B?ekpVK0FDL21IeHE4ZzBRNjhEUkZvM2VmNmxmTm5mZ3Jwek1FUEwxV3l4ajAv?=
 =?utf-8?B?bWdYaWFhK1dRZk4wZXBuV3BYbUJWdnNtZW5MdVA0OUwvWlhsQjFtc0RyY29Y?=
 =?utf-8?B?V0JIUHU2YkU1a1BwRzJaTXlQUWQybmlsUFpoWTg5OUpkVjQ0TkVuVHB0bzBo?=
 =?utf-8?B?WUhuNDM4eWVkZ2poY1pCRS9YcEVPZUkwclNseWhGVjVLTlNMRnE3Ti9SZ3VH?=
 =?utf-8?B?ekhZc3M2a2h3bno2OFVHMzFxV3IreXZGNjkyUlBoK2Iva2REZXlDa1J4MGZO?=
 =?utf-8?B?V1FZVnpTbTZHSVFHdFZZU2F6aUpleTl6R0RzSGx0VkplVmtBMXVGMThSVXd5?=
 =?utf-8?B?OFo1RlI0aGhMZ016N0tycnVyQXkwREM4SEhxaFI5S3ZLQk9hK0I0VDBSejJL?=
 =?utf-8?B?RjV3UnBpcnllZFBnUXo1Zkp2Y25qeDdndGtrdEUyQnhyRzV2T2lWZWNyMWNk?=
 =?utf-8?B?Q01LUWFqc1JsUStFamI3c29WLzhZdEpLc1dCaEQ2YjQrUGxNYVI2MlY5MzA1?=
 =?utf-8?B?dVc0Skt0WkdwYWJNU3NXQzFYN1RnQlZ4MnRxM081c20xaDRLbzRIaDVpd05N?=
 =?utf-8?B?SFF6THV0aFpEZ05ITCtQd2pOeVlGTXZZVTM5b1NCVzVMOVpSTHB6MUY1V3hY?=
 =?utf-8?B?YzE2ZU1CbU90SEYvbDA1WVViU0duaFlsOWh2d0F4UGFGbyticmZJbGZmSnJK?=
 =?utf-8?B?dUl3eU9JL2JBLyt4WDM1aDNBNDV3WVdDa2VtMHo4RXlJMHY3Yk9UWTZDektp?=
 =?utf-8?B?U2pYNmRBdVJpMit4aTBLaGdJbmdEMnVYeFJGM2dDRU9XVDMyckJ2S1ROc21X?=
 =?utf-8?B?cThmTG1kVkVhZzNEOHAwSVgxUmZiZkNJQTRNaGFwWUdrWFI4N2o3aUd6MjdT?=
 =?utf-8?B?Q0d6K2tmRXVUK0R2KytqdXJjNjM1RnFjNENGNnBXSmpHMHZaN1AxdnFzbENa?=
 =?utf-8?B?Rk1UZkJNd29WV1Y5aXAreFhVR0N6c2VXcVEvTlo2SUZkQkxabnRtRzZxSTNQ?=
 =?utf-8?B?aGNleWxXUE1xWnRqTUs5K21hUnVsbmVWWWhNcllYZFlaMUNWZ0dCbmg3RGhm?=
 =?utf-8?B?aGNjOVRMSVV3TjhUZWtnK3loeHRxZC9kUUlVL0MwRklsMjZBY1BXWUdGaXcw?=
 =?utf-8?Q?nx8TTjuybVaSFqEFCEGfxl0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d57dc1a3-29fb-4de0-c564-08d9e721f952
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 14:32:15.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjaH/8ZWXeZUMX08K5U2ambf3w2EqGgXIFauCvQNZd0sk5Q6g1ui6oOWF9R4kLAJMWlNxo7+hYJAVnzFpoiT5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4942
X-OriginatorOrg: citrix.com

Prevent libxl from creating guests that attempts to use PoD together
with an IOMMU, even if no devices are actually assigned.

While the hypervisor could support using PoD together with an IOMMU as
long as no devices are assigned, such usage seems doubtful. There's no
guarantee the guest has PoD no longer be active, and thus a later
assignment of a PCI device to such domain could fail.

Preventing the usage of PoD together with an IOMMU at guest creation
avoids having to add checks for active PoD entries in the device
assignment paths.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Reword commit message.
---
 tools/libs/light/libxl_create.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index d7a40d7550..7499922088 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1160,17 +1160,16 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
     pod_enabled = (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV) &&
         (d_config->b_info.target_memkb < d_config->b_info.max_memkb);
 
-    /* We cannot have PoD and PCI device assignment at the same time
-     * for HVM guest. It was reported that IOMMU cannot work with PoD
-     * enabled because it needs to populated entire page table for
-     * guest. To stay on the safe side, we disable PCI device
-     * assignment when PoD is enabled.
+    /* We don't support having PoD and an IOMMU at the same time for HVM
+     * guests. An active IOMMU cannot work with PoD because it needs a fully
+     * populated page-table. Prevent PoD usage if the domain has an IOMMU
+     * assigned, even if not active.
      */
     if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
-        d_config->num_pcidevs && pod_enabled) {
+        d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED &&
+        pod_enabled) {
         ret = ERROR_INVAL;
-        LOGD(ERROR, domid,
-             "PCI device assignment for HVM guest failed due to PoD enabled");
+        LOGD(ERROR, domid, "IOMMU not supported together with PoD");
         goto error_out;
     }
 
-- 
2.34.1


