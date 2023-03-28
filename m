Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527ED6CC548
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515945.799343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phB0J-0004Hn-KZ; Tue, 28 Mar 2023 15:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515945.799343; Tue, 28 Mar 2023 15:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phB0J-0004G5-Hd; Tue, 28 Mar 2023 15:12:55 +0000
Received: by outflank-mailman (input) for mailman id 515945;
 Tue, 28 Mar 2023 15:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UojI=7U=citrix.com=prvs=444182d81=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phB0I-00045m-0z
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:12:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 010b01f9-cd7b-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 17:12:52 +0200 (CEST)
Received: from mail-bn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 11:12:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6686.namprd03.prod.outlook.com (2603:10b6:806:21d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.31; Tue, 28 Mar
 2023 15:12:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 15:12:41 +0000
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
X-Inumbo-ID: 010b01f9-cd7b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680016372;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=62CUmrKHz5/Yiu1/hglKt3oKSpLc7KQ+Dth9He2xVdg=;
  b=OBE31Gl39uOS8z7U6iaRemOkvW1teKK7ohaHtZ9bxeqxHcdS/L2hbSOB
   aEeKzjk++R6JRBjuexCBUwrA5U/2rCxICcwPxjW8/Vw3D4VMseY49B7EH
   PaLpuRIoxUHhhiUUFlJbOeox6jcmjHYB1DXQhxH3WLFu1DCWLYcdMskDr
   k=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 105791202
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VXVWjqwPjL+YSTQ9C0l6t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkUPm
 jcXCz2Aa67ZYWb8LthxYNuw9kgFv5Hcn4Q1HAQ/+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6AT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXN/q
 toRFRUfVTCkp/3onLjrW/Rjxct2eaEHPKtH0p1h5RfwKK58BLrlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjGVkFEZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjBd1DTefgrJaGhnW3yFMJBB8OZWHgqPeeyWSEB8xlD
 nQbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A6d+6pog21kjLVow7TPPzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:2QU0067cjUQV9uDC9APXwDjXdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0EEMqyWMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="105791202"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHkXQozOopYkAzrRzyXTmgJgcXDZRdOI62EsNJZ5nEBbxduERU+8aYRRkRJy/36H22xqx0tPTpoyxKrMaOBOIrIfU3kUhyIFEIGzhuyYaVnrx+DEyi2sw9e6qTFwjuSn+wQ4iPjoV8fklXPriXyA11UgD7ZqR1kyhjDZVQ+bPTejHhmx58KIpUj9HUgd1zOCJRPZZznS3adu/Ufgf1CP1wBc6kCBSEOS/O8cxKkTmRdFZRCSuKcEJAWl72ijGvVpSWsB81dMnHC/ICi5mJCYK+SPDGuxaiCd/afsNZKJwAV6jTVxiw6kBfLDeVkx2lGG5Oc8GEawySMcNyPdB4kryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STKRbWgEKugg+vE+Eiy4QzTPIKFoFyR0NEe/djv8Pa0=;
 b=D3RtMtJLKb8s1pBjBOsz1VAaIfO1H5jH/StSU85T9zG5pna2c9xM4/1Tgh6cHBQzt2gE9q0Hw0TryZsufBO2njeURywV93oxnFzj5yQDTqJ7Y0X0opRJjFj3oozg2muFR3bgDiw+3S2W/iLBAB3ztK5wWyci2FdE/z5RFWrSNSbkurkIupFN7IQu0ch9Q+NVZJUguIopJGOyXLNjjHP4alqM13+Vp3rCdk3yVbZvn2qhQUt4VVYl85gEAxeyfIy4qLGuUuWncNGHvDvOMxmuiKFT/4xhyIJ8ZNp0zXJtmY5uYD76dno/KtBsiAnkqSvyFoLucfdYqT//waXNtAZ5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STKRbWgEKugg+vE+Eiy4QzTPIKFoFyR0NEe/djv8Pa0=;
 b=qrFokG889IjiBZACB8haVt5eURZJ8prSjJ0yMkhvP9Vqd0v47SbOOQnsQeTR/TbeAo1vIh+ZIM9eh6i0hZ4efk154rMoyG9FVXmvwgtHVayYgrPoK1wfCS4Az5X7ezpRwyxvq9oMj7BHrW4j3rNXNpx0SsQuMWz5kfgeN+cEzvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <61f32d99-67b7-d7f9-db93-12105266a03f@citrix.com>
Date: Tue, 28 Mar 2023 16:12:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] x86/ucode: Cache results in microcode_scan_module()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-5-andrew.cooper3@citrix.com>
 <8e86b93e-06c4-5998-5ec1-5543d357f960@suse.com>
In-Reply-To: <8e86b93e-06c4-5998-5ec1-5543d357f960@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN4PR03MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 20bf2d48-f82d-47c9-93e3-08db2f9edfaf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gKp7eakp3VHy+/dblLYlXDPvr3PgL1ZK42BnNDuU30QcRuzTP1LXnWUC8Ue1VxhgIvLFBD1OXby9dTKkYLd0q9y99MO4AwPFn3K4g2z7w4ZbxofOo15u6rZMXdv2i+S6zc0Uf5TZP8/mCkcUrKZ12unvRqydZPYD+Xt2AGjCvJf7Eh/y+ECYV7MbDNy1G/CUD5dtbygoVxcihn+wvPVlQBDkQWMJs76XHrYlxhhvNakxj+80qAUktx6UneaJslfRYPyYAGhXHsVof+v/7n8J2o6oIv7nF7+BRcruR1Ue8uLYtp8wYDNTx20KFWAZWa9X5QyNqfnjq8fHyGWxwdbXUXN8zgRjfVsPE9r6uOJtsfx7B2mZrRwUocqWud9ARPILPXLPSiDkkFVBuOFZuCBST6o1buZPWiydlzsLavTkkyfTH8gf/Vhgbbj2gg0BJuz5yeSsmOEdcf2WHMxDDexwvha3YUbm3t6bwiY7haoso021yGuJha1XVrVsel851yFqq6K0fTEGYg7p4BsDr3QZL6HyHoh67sTkVYNFiONIlE4B4g+mlc+JpCxJZ/E5F7TaNsWuDDoy5tZFS7x+MOB7SYQcEXD097Hek31Zeg5OTbHWNcb8U4uUfJz3t0kEb8POJ0sATTKRvEVr+qr1jHe8ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(6486002)(31686004)(31696002)(86362001)(36756003)(2906002)(66899021)(6666004)(478600001)(6512007)(2616005)(38100700002)(53546011)(4326008)(66946007)(6916009)(6506007)(8676002)(316002)(66476007)(186003)(66556008)(8936002)(26005)(54906003)(5660300002)(4744005)(41300700001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWdsYmtlNVplU05qbVdKY2pla1lRbnViUWR0K01RNkZwa1dLNU1TQ1ZEZk44?=
 =?utf-8?B?amJWQmhqWFBTUkFPaWJUckFXdHl0Q1NCRFpoc3ZyQ0JheFQzR0h4eXllbDB2?=
 =?utf-8?B?MVEyMzkyTE90bkd5ekt6SFZOTWE1M2loZnBzUU1lYzNFOTFYVThjRVUvVzhl?=
 =?utf-8?B?YVlKQXQwQUNlbmM1TlNDRlJVUkZjWE8walZLMlJNcWxLNGxmaVYxMUx3OGlB?=
 =?utf-8?B?bEZYbFRXOHBFRWlOazNSRWtSd3NIREpEOFZLaXB6TXhTcURzYWIrZHZzeHpu?=
 =?utf-8?B?Q3oyNmltZUdaMTFmWkFZazJtTkg1TlBWczc5RG42T3BPN1NFZ0dnblJsUE9t?=
 =?utf-8?B?dWV1b294cjlvRHFNSmxIVGFaeFI4QlgvMk02czF3SGMrNk5vdUlmY0RBZFB2?=
 =?utf-8?B?RXRnUEU3cUEzTzFKMVA3ditkR21kcjNQcDhBWjFhbFJvbmYrUjltc1VmY0NQ?=
 =?utf-8?B?TVE3MUxVVnM0cU1RQXNLTk1LUU9VVWpZVU1pL3JtMzJsQmNYOXdCamR4dFVo?=
 =?utf-8?B?VitaOUYyT1pSdy9WcFZIeUlNSUNUd2ZzYmVaWVhXWVVsYWxjZU5pZiticU1p?=
 =?utf-8?B?bE40NUtkY2dMS1RBanNaNWh1QmRjVTBFdHp1MUV2d2xkNVRoL05lUUpOMTd5?=
 =?utf-8?B?TUEzVHlGRjlXekxNZm85ZXhweGthN0c3cDNXMEpzVmRhbUxzYjBUTnVIdGpI?=
 =?utf-8?B?Wm1sRmM5b0dvcXBGMVdwRzQ1MjRqS0tBTG1DVzBhMnhDbXUvNDZxOThQVFJO?=
 =?utf-8?B?WjRRU2E0WmZ1V1VuY2E1U1YvMFNLTFdIeUtwNzQ5T2lrS1pNSTZjc3FNcWVC?=
 =?utf-8?B?VHRMRUNhUXZWVlJDTDFzTllvelV5ZWJpOVp0a0lxekhUUER6RGduTUJHZ0pV?=
 =?utf-8?B?azVMRHJCcGVhVXNXY1lsY0NwU3NoM0x0c3l3aUJKSHNMYURDSW9ZVWx2V1BJ?=
 =?utf-8?B?T01zdk9oWjNaNWFnQURyTEk0NTVSc1JTU3JrUTJCMW9hKy9WR3VTVTI5ZWNr?=
 =?utf-8?B?U2lGcktLRlZsMTkrbnlCUzYzNmFiQkVnb1JEU3FZaHFobkVKUVpGaU1TWCtV?=
 =?utf-8?B?Q09kaTIyT3JnY1VzRGdhQnpzdVlsN08xUDRWdHVjTm9FUWxWVTVPZy9oUW5U?=
 =?utf-8?B?OFZLYVhGc0RQcERPWERjalV4YjBhWS93Q3pRZkJXaTMrZXZpdzF2ZlY4Vys5?=
 =?utf-8?B?ek1JdkNVYXIyMmJOM29Hem9YVERkdms0eG5rdStYR2dIVmEwU1BJY2thajJ5?=
 =?utf-8?B?bTBqNjB4TFR0RVRZQytxYVhzNWhxaEJLOTUzU2tQdnFoSGVtQkJibktsZElX?=
 =?utf-8?B?OGpwakdiTCtUak1QbHg1MUdSY3hQQWdoL0xXakhpU2p3MXdTdTNvdzRIbGhO?=
 =?utf-8?B?RU81dmh6WUZ1bkF2S01kcHRGVVg0VHU0bVNwdExSdDh1VDduRmp0cUd2QlN0?=
 =?utf-8?B?NU0zUDJadlNnM2xnN0N4ZkVHdnNKaFg3aVB3blZ5S1JzT0Rwdjc5bjF2T3pr?=
 =?utf-8?B?dFJWNFRzclhKVWdxWGtKb3N2RmgvM1BPMCtyNWdrOERwSG5tejh3L1IyaUtP?=
 =?utf-8?B?VzNPQndjNWFadDVlS2NVOExJTFRMdU9Xd0pwNk9paVBvTTFxSzloOHZMeE9z?=
 =?utf-8?B?Rm1pNkRWbEhhYkNxUTlvYWE0REVjR2tVUWx1WFpra3RuQTdVeGMwcHpxUlhu?=
 =?utf-8?B?ZUR5a1B6YWU3L24xWm00WEpiQjZJU0JDK09YVFlhTlBORGhvQ3AyRFdFak12?=
 =?utf-8?B?NFRGN1l1V1ZnRmV2eUlhU3NDVkhkWUE2bm1ZUTdVREhFUE5lb2hnaURiZG02?=
 =?utf-8?B?cjVycW4rcFVSZFYxcUp0dzI4T2pHNXNrWVZaTVZCcjJrV1VhdUJJMjRSTStR?=
 =?utf-8?B?UklKTEJ6Q1BWcXhlN29Hc2xkVzlJeCtWTWc2MHNYL1lmVHpGRHlKSEROeTVx?=
 =?utf-8?B?NVJBMTE5RmRITTJyMnFzVVJtZGdkbUJ2VkFwR0xVVitiV2VqWEYzT3ZEYnRU?=
 =?utf-8?B?aHJCaEk2QUNMUkhTYTVkVWdZQTg3bUhnWkhJMWFwODl4NmkwNy9KVGxUQXB6?=
 =?utf-8?B?NzFlTDR4WjNncXhUZmRRb2FKZjg1bVU4VTVRWFhSNjJFZWlsVkFmTEQ4RTVI?=
 =?utf-8?B?ckNpUHVXbXlrNThGd2hPa3VCcklzZlJycXo4TithUy9uYXZ3S3pXT0JoWFBY?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+dj3OyXv52OHUPaITV7cfjJsbewA74R/qlu0PEb/CFVZty6b3mSxcQfmDhjorq0UXXP30k/L5tHjPN4C+xtds76AwscwxllGJCa5tXokyWBCjmzsP8vjFLCP/M9+sCwnXt4rvmGbt/d8FYbNmvywMYEsZt4XZYF0DFWhE7cmuY/wjFuvdO3tBN0yRPVgKTbrpX6zkqIBoVg2OcECLGwiodznOjPv/5uemrLYHj16wioivhmltwxTzCvn4A9xhG/Lojcs8ZSWawrS7wYmmr9Wwf4qKghy1nOrzsC2UXkMpId3dgalkPkpNzQI8a/PqTumZXQPt422J2ZhQv6STACtkAXN4HToylvnNK6bteKQ3vzdcAZOdY+05CaW6rbWhiRK8nGiiaAdOGR4E6YgjMfrQog0yUKyghmmEKUGQvox0NdFpRpuIh8/KDdBrbZY1SI+4fAl4KKLgdaV1V0rPMofqpeToVgDJvb9HychIUqaNYykqGSphNXvYWjSl5KFPjqoHWGTlE2ya603NIKEKO+4HicyFg2NqFZ41LfdEzezWOwdttABtNqirKRaVtpqzmmGjfPblcaAhmhk5nCS2xG5bgt3A2MftAD1G+LTiz0tn7dpGfCwhj1qDQR0bQ0UAnOCg75U8I566zxX26xfyrMfXS/XhTwWTsmZaoKOKrRW6IuNvLl70gKkpcpY7PkDJTmLAABIRd3Co+E22s2Bb2YzSiVLrMW8Cr9Grkhm8XVM+25X5G8McezPMZYPWL6b8sTYL1dUvoZqUHseVGcKWtzdDjW/Ab3uvT5Th9NVj8UDb0QDEYdTeZd/xNxmNt4/1Ixp
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bf2d48-f82d-47c9-93e3-08db2f9edfaf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:12:40.9838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYAAYYcEwL02H3DKLTfZGNQv9WWPwGF8wJZeY5cp6xB0/gERmUAOxs5iUrXVkfq1SgT5hFaj7kwwcTLf3GVnEVqsPNaFcoQitUCTdcHjTQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6686

On 28/03/2023 3:19 pm, Jan Beulich wrote:
> On 27.03.2023 21:41, Andrew Cooper wrote:
>> Right now, the boot flow depends on the second pass over
>> bootstrap_map()/find_cpio_data() altering ucode_blob.data to use the directmap
>> alias of the CPIO module, where previously it caches the early boostrap
>> mapping.
>>
>> If the scan is successful, it will be successful the second time too, but
>> there's no point repeating the work.  Cache the module index, offset and size
>> to short circuit things the second time around.
> If the scan failed, it will fail the 2nd time too. Maybe deal with
> this case as well, e.g. by clearing ucode_scan at the end of
> microcode_scan_module() when nothing was found?

See patch 5.  It can only become true then because of how the callers
are arranged.

~Andrew

