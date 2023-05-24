Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A5170F2CC
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538925.839308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kq8-0007fh-IY; Wed, 24 May 2023 09:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538925.839308; Wed, 24 May 2023 09:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kq8-0007dM-Fb; Wed, 24 May 2023 09:31:28 +0000
Received: by outflank-mailman (input) for mailman id 538925;
 Wed, 24 May 2023 09:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1kq6-0007dG-La
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:31:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be8fd577-fa15-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 11:31:23 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2023 05:31:21 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5643.namprd03.prod.outlook.com (2603:10b6:806:bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 09:31:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 09:31:19 +0000
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
X-Inumbo-ID: be8fd577-fa15-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684920683;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o0CYfAJRR1CdRG3v5ySaiIacTYnqN7+GTZRSVh8jMko=;
  b=ZlTl03E73+drb3hrIhYR+pnZKNnEpxeREkA0eCx+0g6A4++pNiDe2ic/
   1nwJpqEJc+/7jIARg3+VOkgQFHO0iqKWa9/DkT4gjbRZSae5gsBBR54nB
   6fdzS9oajBrfG3kIMTiDqAUduBT0h+8AyHhCsZektWh8gMiY1kQczpmR+
   Q=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 110598937
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xaBAyK15MwBau8GBQvbD5f5wkn2cJEfYwER7XKvMYLTBsI5bp2QPn
 GEbDG6POv2IYmbxLo90O9y28UhTu5KGzdQ2GVNkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFkOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfO08T+
 s4Ib2A3XFOR3/nr6uqASeVpr5F2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1AZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiAN9DROzjqZaGhnXCw1BJLDg7R2K8uP68pUi3R+tUJ
 Usbr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A79y9pog210jLVow6T/LzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:B1wpQajHhVovICtopNC8zpfC1HBQX8d23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewKkyXcH2/h3AV7EZniahILIFvAZ0WKG+VHd8kLFh41gPM
 tbAs1D4ZjLfCNHZKXBkXeF+rQboOVvmZrA7Ym+854ud3ATV0gJ1XYHNu/xKDwTeOApP+teKH
 PR3Lskm9L2Ek5nEvhTS0N1F9Qq4Lbw5eDbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK7aY+/X
 PDmwnZ4Lzml/2g0BfT20La8pwTwbLau5d+Lf3JrvJQBiTniw6uaogkc7qevAotqOXqxEc2nM
 LKqxIAOd02z3/KZGm6rTbkxgGl+jcz7H3Jz0OenBLY0IHEbQN/L/AEqZNScxPf5UZllNZg0J
 hT12bck5ZMFxvPkAn0+tCNDnhR5wCJiEtntdRWo21UUIMYZrMUhYsD/HlNGJNFOC7h8ogoHM
 RnEcmZzvdLdlGxaWzfowBUsZeRd0V2Oi3DblkJu8ST3TQTtHdlz3EAzMhapXsE/IJVcegy28
 30doBT0J1eRM4faqxwQM0bR9GsN2DLSRXQdEqPPFXODsg8SjLwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rIdGS3adM7gvGTAyGLHXQI/llltpEU4DHNf/W2XXpciFrryLgmYRQPiTjYY
 fxBHoMaMWTalcHGu5yrnnDstdpWD8jufYuy6UGsmK107P2w7LRx5zmmdboVczQ+GUfKyrCK0
 pGegTPD+N9yW3uckPEoXHqKgbQkwrEjN1NLJQ=
X-Talos-CUID: =?us-ascii?q?9a23=3ALOFcUGg5bWl38qkCjyUpTQV1RDJuSFOAw0XAZB+?=
 =?us-ascii?q?COyV7EKbIYwer+69hup87?=
X-Talos-MUID: 9a23:psJYwgt9bgzJdJPOKc2n1TRebuNNzraXD1kKlLoAstW9PiJ3NGLI
X-IronPort-AV: E=Sophos;i="6.00,188,1681185600"; 
   d="scan'208";a="110598937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6l1Vat6Z8oUyi4uFioKhO7h+BxXLIQTAaCxCNTD+7ylae2OOn3NmIxfl1otlJUJYpvXdS2KoYGRsbDIiZii7/8m1nAa4OQeF1aBXGSYbCw9XciaV14f1rF7YAOt7TZa0ZGc4G58Vn4oZgP7kmdqCpcEetqyyysZqDddpsI58L3+Xy0kswKax/YfdRnqzYOn8p1bgf3M6g4ldbLpJvsWLpmfAFeZSNcs/3dKQ90Cj8ldiZ9XL/iDq82ueuCjieyACDPlCNsELLO19rn0QMjvWdZ4dVHZw70zLg4KiFH/pBo7HuviTRim7NGCllgRQIC/8uWg3GVh1jojDIhuycDF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsWwIvUADpcI8Ht5ETuwIlS1fasThyPx7k8697c00R8=;
 b=A8wBnz+aBr2rSAIPytjVgg0B9KyFApJTCFn/rtt8R6UEvSIrotc9c8e6sD38raunfTJPpSwCIIrsrmV+Wb6UEncLSwvc6Awbic854oYN5F5vedPeAyW+ZnngmMlddZPcjZhrmKiqmMaDEo/OPlVDQzF7LfwEGXBnxemCyqyJn1PUn2BgCzmhRVgLqlvO8ld+QVANHNkL/b+hLD8KkJZiU4u0KDt1ZHNfG2lgLxJ3wwIpgj6Ui7DX+IrQS+913e1wgspqPX8DenawsCpZCR/G78DLbwOPv7iaPrwojsqA2Kei0kFsofKdal7yknZaq2sESsB/lOPVvbzTV/YiUlt1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsWwIvUADpcI8Ht5ETuwIlS1fasThyPx7k8697c00R8=;
 b=Tq/nah4LWcieNRlj4VGFvTIiEwu48g21reY+Gm/e7/GzA7rncG3Q32lA2V3NmdREaAPeWpYvKFgb2+wgON4Lz0x1Ky+CZKi7EzmDnDRkDCOfSRYp/HibhoUGlgI29FMCGNGARb45UfQmkPtsR3QfWnZ7JzKnQEU2FBpuEFK74EA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <27e599a5-c457-cf62-a008-ea871c823312@citrix.com>
Date: Wed, 24 May 2023 10:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 03/15] build, x86: clean build log for boot/ targets
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-4-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0128.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: 05dbf4a3-2f9f-4690-c502-08db5c39a0e2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3rTF6ygu6xoMi2D9SpKkHL2vVQsxhvxC6qvKWIOzR5584i/8FPI+AFXZEo8woPsAxpnCwULDXIYwjA/ezvhWPVMPe7ixJVnfn2vlVbX+tMF2gUob4OEWRplSTeK6b61qQQyTNs/wUOXQRX6iLkSvsSuq5XSpz80g5hIv7GETEsADD5Pu8zvONuQ/wwTDDwTpgkqT0FUp2K/64zVcAQohWCzM6BtFFmtm3rY2GCJfq/2dO2S88ciOOeLpp4zJHXUKVagZyltmt3OcoGM4B0lHlA2kR1bgTlKCOLlSMamvV5BmgCu7yB55PTOfi33U8nG/DNKZzGv9hdZr+856PcCvXq7/3PIGIfiRwObSHmzZn1P7oYmYavbGK+RhacmRuc+p0McAlpkzXuLXE5IwH4HoTPrHVpBL84M11sJWTctBperr3QoqtxWEquQLs6gLpQkEaORnVLjqiE0Skw9ej6AyCqU5/sftPX2VhdtK/sMYtd3VZOIKy172oWxPkUhlikjHIqdNs45IkAJw3sb7cPS8TIUxOr6708KavqeAY1Uvu0d9viD9n8cQ7ruh76jI+prN1OqBISdqgFlg10lmOD3fJuw7ZGus+80nHku7G3JeItkjdvPsvhBHVaS96GupPQbJ6r73QxVZuMMCIdpVN/8SiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199021)(26005)(53546011)(6512007)(6506007)(5660300002)(8936002)(8676002)(478600001)(86362001)(31696002)(38100700002)(82960400001)(6666004)(54906003)(31686004)(6486002)(41300700001)(2616005)(36756003)(66556008)(66476007)(66946007)(4326008)(2906002)(4744005)(186003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emI4N2JQRGxqcGlkdzhsR0pmMXZEQTJwNnZHYVc0Z051dlpCdXhUNUQ2ZnZ2?=
 =?utf-8?B?bUZRc1J1eWE0bkdoNlBTTnVJU2F3RTBpcWU1SjhEWGtmTXdLRlNuSnNZV0RO?=
 =?utf-8?B?eUlJa095VUpJQjRLaW4wZlJ0MHJnTXljOGMrdW9PbEl4MW9DenlQTHM4bUpQ?=
 =?utf-8?B?Q2I5eU9odXFDQVJoZHpzcFdraDBnWWR2K1F2ZmpMaUlwUVNWaElnT2JqOUJ2?=
 =?utf-8?B?c3c5a3R4bjZtV2gyWXVIWWNKc2tOZld2bDFWTHZHVXFwVkNHcjF3MUthbGJV?=
 =?utf-8?B?YXNhYXBlNGc3QWJ2S21BTUpLYlpLSDQrU0JQUEhlM2IyRlR2cUgrSVlHUnQv?=
 =?utf-8?B?VW50VW1DRzNDUEppZkp0V1hXaWRRbWJFQlhzZlpSaXdoSnV1YXRkNjV3My9S?=
 =?utf-8?B?VjFJT2JqdTlBajRoeStQTVIrZk8zUEh1WUUvcHJGYVpZSndLcHVxSmlDMUVJ?=
 =?utf-8?B?YTlWS1hFNndmTS8wQXNkcjVDdkVUajlEYWhyeThiVDdaKzI3YnZua0prL09y?=
 =?utf-8?B?R1NTM1BCeS80ZjhFcjlYZXFyK2o3THRNZGlTLy84OXFUMTh6aGtEMDM1Y3RO?=
 =?utf-8?B?OVNibmRJSVI1S1NDeFV6dEtSY1BEZTM1dzJSUTJnc1p2TXgvWFJkU2txazhL?=
 =?utf-8?B?WkpOTGJWN2VCc0pMcFRFb25DM0xHZmNKNVJUSDhCanVKWGJmdDdTTnNVUVEw?=
 =?utf-8?B?RFhVaXlKZVc0TzgyZk1ua0lrQnpxbVQzZ2c3ZlhDUHdBRDlPU2JIN3VLb2RJ?=
 =?utf-8?B?UVRKSkUyZUtHa1M2dDJGR1FKaEpUbTlDSFpMcW1USUhzT2NnQmx3cWwzZkE1?=
 =?utf-8?B?d0F5Uk9zYjEvYUcydXNQQXZtWmJOM3lNb0w2WmhYUHFxdktHWWFJalpkT2lR?=
 =?utf-8?B?c3kvNFlNdnc3OHF2bFdFRlUrTll5VGtTc0tHeE1KZGh2cTJpOTdaM1F6azlU?=
 =?utf-8?B?Tm1QcDV6MDc3TUFaZDNGSmdOOEt2UGl5dS91NmcvaVZmQ1R1bTBjaURjQ3RR?=
 =?utf-8?B?ZkNLM3VJUE5aQzRHTHZpcitjMUpIeTlpdkZkcnJLTHYvRHJSOUpHOGQwbkdh?=
 =?utf-8?B?bkxTNnNrZUJvc1FVQlhwcW40dmxaL0VYUGZFYW9hcTRrRUtJL0VsTTNIWCtN?=
 =?utf-8?B?V2N1U2FzOFczYWNXZXhZUmdxY0FnbmlVOWltNXpSMVVFVTJrNkg5QkN3VGlJ?=
 =?utf-8?B?TGVlUmtJRzRINW5tUWVMa1IxUDhPV2VQbGFZUXhHeXI3THRXK0pLNEVpN2lv?=
 =?utf-8?B?ellFUFY4cUF5cnlmdURGZGJKUDIxbXdnZDB2Zm9rM3RRemFTOTdEWG43VW4z?=
 =?utf-8?B?R29QYlE2eXJ5TWpVSTcyVVVpdUhqMGNqZHZlSitHdzM5dTRmcVMzVW4zeU9V?=
 =?utf-8?B?NzEvV3VXK3MxL0dlcmZrU2ZoVE45Q2FBSk1oZlpvZERZMVBSU0IzK3dwTE1J?=
 =?utf-8?B?R1YxWnNUckFxRTZEMHd3MlVqSUVBNml6bnEvNUxzckh1UXliSDc5VmgwZ0RL?=
 =?utf-8?B?a0NxVFZueTcxaHhUQ2RKZWNJU1g1ZFMvS3VpRkpKc29mUExHNkpjL0J6Mktk?=
 =?utf-8?B?dllFSWdpa3I0ZytrRm1ZaVhKZ2VEODZyZVNXcjU5SUhCcWYzSDE1QjNZdm5z?=
 =?utf-8?B?a2NnWCszSldUY3BrMlRWNHVUV2s5eGdkSldOS1FCQ1c1L3ZlV3RvYm5nNXFU?=
 =?utf-8?B?NC9Fd1NHM3dvOCs0VnNSeWxmMlhwRDhzNWtCdUNrMU90UVJmRGFKbzVkc1hq?=
 =?utf-8?B?Rkl6Vmo5WXdhRy9xVks1NFlQZzlSZGZGNzQ5NDhXMEsvRng0RFJKUWtEYU5Z?=
 =?utf-8?B?dXFRdGlqaHo5QXFWaG9rb1NHR1o4cnA0TFFTdXdhN3RDa3ZrVVlyOHVmd1My?=
 =?utf-8?B?c3RHenBQUkkrTjhHTDBpcWxsSHJnMFA5TUdlUTRFejNhQlFGeWtrU0N6UkFV?=
 =?utf-8?B?VDNhTEFpNHdqWGxaR3JHWFZ2QWRNYUhHTThSbE56TExzeTNURzBwcDlxbHhG?=
 =?utf-8?B?ZXBpQnlIK3Q1TWlLVWMxZU9BZFdVeDh4MWJUa2ppNXNuYUUyM2ZHM1FBWVRG?=
 =?utf-8?B?ZXZsSzRScktReTMvRjhtR3p6bUdGeW1GcDZRMjM2NURTWURLakxyczlxWWc4?=
 =?utf-8?B?ZWptUGZibzV4WktjRnFEQjNnbldNdkw0aXptdDYybnR5RC9DeTllS3ZKQmIy?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ox1QDD0GrmniYE1F2DMqiuGRbnH9KeEvWfo4Vi5f6y1eyN8mlTOqDW1RVZvkG9vIxbY4SZOI2MOK0Swyoq5gkCKyaxTqU3g+YUFnKes8yBO/enJ/bHKKqi2FzkkL1JrRdHtVAvjpZzXNGWTnktrZ/w/Nymfrw7kgax+ORTsg4Tp+pf0LktqOwXdu059FuCY6Mqiqb6wCBNcmxOWq3Wm4dzJiN13z5ySM/80UO73hNsBFfjSb6TjNGS3GafPZiuEOFmBBLZyDaFHpXaaKBFKL6oL7bNciJPVO2iDww+RXV1VRQgOnmLgeMZctUHvJD/BV/apxiS+nt43dcAGrzfPybZoYGb6K++cEXHZBkQOcVA9HrZHAzx3KfOKFeaLFHZE6S/Tz1/JMDO0fGVJ9sqYxHJc1UBT8J+PwOz0MJtTo4bKjrbsJWmezhTUziAJQ0ll4ucjSzzDkx48blibjx6z41Q78rWZbRBO+K2XYARVzZaUlXIePYMLABh2WUL0+Dg0Aylo4nP1tnLBD62xROOrVYRHzxBHzpJ1uA7OnZCO5bLhV98TjMxJfFGLy0BOVfIiCoh5mF4ldva73dYh7klLwB0YsuMDiqUWu8T41SnIU5uzJYjpD1oG5602b7DYdO59lEwn4WMrGi1QA09HcA8R6vukgb6LBbhjnpCQQ1VtLKnDG90A7WIV3xADriMzrKThfB67l3vlh7uCnLJhbzS/gthzCz7aYjGq2bfv0yPxgbOtpDy6BtxopDEMW98xMAvcYhWVxZUfObs1beWDgzcuIP2X+XY/ra3BQmpIxhM63MUbPKLP75uRFn+lL8zSvhcuf
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05dbf4a3-2f9f-4690-c502-08db5c39a0e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:31:18.9950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jq+vk1AQMFIbKblFXK0d4e0vbe5fg2MqsQZki93mee2IjEsLqxntDXVII8RRs8aTf1sTaoOeSljSoBX98PmcZPEXvWSmgzKBURf2GZKUVE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5643

On 23/05/2023 5:37 pm, Anthony PERARD wrote:
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 03d8ce3a9e..2693b938bd 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -26,10 +28,16 @@ $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
>  LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
>  
> -%.bin: %.lnk
> -	$(OBJCOPY) -j .text -O binary $< $@
> +%.bin: OBJCOPYFLAGS := -j .text -O binary
> +%.bin: %.lnk FORCE
> +	$(call if_changed,objcopy)
>  
> -%.lnk: %.o $(src)/build32.lds
> -	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
> +quiet_cmd_ld_lnk_o = LD      $@

I'd suggest that this be LD32 because it is different to most other LD's
in the log.

However, this is a definite improvement.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Happy to fix up on commit.

