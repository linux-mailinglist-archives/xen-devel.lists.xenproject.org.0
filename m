Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F96B2ECC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 21:38:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508364.782985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paN1b-0006Mg-1c; Thu, 09 Mar 2023 20:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508364.782985; Thu, 09 Mar 2023 20:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paN1a-0006Jm-V5; Thu, 09 Mar 2023 20:38:06 +0000
Received: by outflank-mailman (input) for mailman id 508364;
 Thu, 09 Mar 2023 20:38:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65Ms=7B=citrix.com=prvs=425245c8a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1paN1Z-0006Jg-5X
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 20:38:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4681e6e9-beba-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 21:37:59 +0100 (CET)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Mar 2023 15:37:54 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5813.namprd03.prod.outlook.com (2603:10b6:510:35::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 20:37:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 20:37:52 +0000
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
X-Inumbo-ID: 4681e6e9-beba-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678394279;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vavPBTFiPsNgZnkGf0uBgt2DagTxUIpL0RO9CFJpYjY=;
  b=QRwbvZgGG9jieI9Is/Ka3xuddgLfg33LdBIkfUZbFUpY8pKv5Ea/YmTO
   Aammy9pL7dUovxjgqr4TuMp87agkHgxyqQtruyOq5JCgjBJrFPYK5Hw5C
   j0Pp2pMLGPzvcXBXTAse+qyzWQRw2r07G2NkXczj5uHr2c8XClnS1mcj5
   0=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 99602539
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4YE6HK9kbKRM10Lh2aSIDrUDq3+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GYeWWmBa/aMYWbzfNEia4S39kMCucfVytQwSVA++Xs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqga5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklky
 NUcGBEcUiupgv+dkI6bdNFKv/gaeZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAouFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqCdxKTuDjp5aGhnWdzF08OkU3XGeWmsurhA2GBuJ6K
 3Abr39GQa8asRbDosPGdwGxq36VuRgrVMdWO/I34keBx8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf/LqJqTK5OQAOMHQPIyQDSGM4D8LLpYgyilfKUYxlGavs1NntQ2msm
 naNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:wmrrYq6l4zs0yX8DfwPXwOfXdLJyesId70hD6qkRc20sTiX8ra
 qTdZsgpHrJYVoqKRMdcLO7WJVoI0mskqKdiLN5VdzCYODIghrKEGgI1/qF/9SPIVyGygef78
 tdmmpFZeHYPBxVi8D15QX9KdomzdWdtIi1mOa29QYIceinUc5dBs5CZDqmLg==
X-IronPort-AV: E=Sophos;i="5.98,247,1673931600"; 
   d="scan'208";a="99602539"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhGBKCXTugaef2ONr59Z/PYV4rG0AJ7Nvjr9ovEyJLcGElqYeya1qM8dG71CUSV/xSRZHhqbi8bD4JHnzBDw4sfsWoKRmzncmQF6ZFJsWK07a/bwKLhnGsDmHcnBG9LLW6pbUkKZIAelBkwarNAvtrKZxDssiBeoUOJ1RIWjm0JMwtyto2SO1dPvVdEb2Ba1eahXOFIGRz+Xx/SZuZMzYOnO0ut6paqeNcqFs6spMqgwdFWxc+Y6dt2WmNtpz1/tP8XVaePnTQX9gpPyUOpOuGw21hyNwRuRH242XcEc5D+z50m1u7qSN4nbdXqjNJ9xZg9r0FZGTKissA3VgF7bGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X762uWGr8AqErXsFhTRawFm+W4LsH4MPhr5iRM2QoSM=;
 b=dBZBBlF0WQ5Js+VLqz3R97sou3DzS6PSknSdykX1QfI3GHOfyZZs/GFiAMwe1UBSk1ffIlwLR6xLGH5x+u8zenwDOEnjhGwWWjq58/JVqYPVcs8hWHpxyuMYGjd1NSsmJhW5pavWpCxuDG/O2OB77rNK4G1IwASGwatZjgasub9EPA5VwAT1PNz7/E3FeUpyn6Ef6NlvSsSNVeJnnZKdbhwY2xDcnAENydNRqgjYnJxGzAC9dNr0xgj7NEcB/8KOFZS6eEO4XVJ1JV+1O1tNtJwtgzANqXN6k2N0+EMeA+h3PsiRP2pMBRR56scbyUl5f4Rnzwr+Do5KepXg2d1h/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X762uWGr8AqErXsFhTRawFm+W4LsH4MPhr5iRM2QoSM=;
 b=mKERNT1g02sK5K9WntXBjXkizxQ5Iy9XcIYAUhVr/GwpI1bfgpZhvj0IYBAHz9WcP3rHQNTpMpaThwomTcOHEwedJPsJ/ftnfADQJWc229/PRQRBtlK6iU2SVltfdYhPr1xRmZrZp4A4QBY8UFr0sueVgamhpKEQJVeUM0xVmNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
Date: Thu, 9 Mar 2023 20:37:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Language: en-GB
To: tachyon_gun@web.de, xen-devel@lists.xenproject.org
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: b27e2945-372e-460f-a242-08db20de2759
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UES6GYsXnQ29cDLCK2Mm1oggIxuU0sZ/dv5J5p0SycLQdSQilmPoGH7TkrEYRbTqsBWMMNFSMDsmIGYmbarmJh1uq3AlIF7bsquZXt1oW+m9tEIUA+LgsNe5K3ySrDEQGlO+NqibL6peVPo7SZybjnOehjj0HjlF/nccIU29qcOejB/OHV4eIZCBjVmwtt4/vRmK/cVfczIDunp9/4V/CrxbxCltYvPkI6pbYp+45N6MCESetVCAFkKXyitTUAyRSqhy8pkkohkS+xeG+8XPDnJRQGMaaMdbaP985blGRwOHXt2UElef4oWb6ZkPSsrhdwyHnRIrxyoDbLEGpvXVn1FDTlA2MpPZthnoWnbzRZ1G48Uno8OsB/0wR+Vl2BwcNBEFGS7Y0b0Wt3U1YaGIgeP891OE/a2wmslZMJGdaXORr9tDIoUAAhTzTIU0X8i4DYlT7T/XyrVqB0lc9+LOV/Q2BP1yzhY7A0C5voVhnf5Fo5RToYWsA9knwdxS4FFoGQIIMfpF2vlTdaRkrcV/cKtTKmobaKY1QWmz8rFDlsrrRM9Pg7QJ0UO69B2dvRr1KDFC7id/tJF536QVN65LL99esMzHjnsbv/dobOwGyLnAoccrdLlMswnVZ6L1+ywi1YQqhnZFAtirNJRtGLWBP1wd836AJG6KTgJV1rsLBFB/GJr3/1kdRcmkXvPnFFW2NBxtxj45uCgI705QtrvZl6Jx5YXW0GJIIPyUNfND1Jg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199018)(36756003)(186003)(6486002)(82960400001)(41300700001)(53546011)(107886003)(83380400001)(6506007)(26005)(6512007)(2616005)(6666004)(8936002)(66476007)(4326008)(8676002)(66946007)(2906002)(66556008)(5660300002)(316002)(86362001)(38100700002)(54906003)(478600001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmFUL0VDcE0yaFYxRUplR3VqMFFhb2l2amxLakc2aUpMZVdzZjFFcy90UHpU?=
 =?utf-8?B?dTA4R3J5ZnBrU3VFREphT2JSYTNrbzBQMVFVTG8zQTBBMlFsSmxLWVgrUlFW?=
 =?utf-8?B?anVIZ3VrMCtURnh0V0Q3am0zdVF2dHFxSFFVZkNIRlhvcmxwZ0NZaW5xaDE3?=
 =?utf-8?B?c2Zpa3BjWENXWWdTeWxPb2Q5NW5UZzRUVGF1RzVMSXR5K0owUm5paXl2YnpM?=
 =?utf-8?B?TU5QWUk4TkdvdHJCVnE1SjFqd1E3ams2UDVvb1E5NGRBRlNEYlVDd3NFTHps?=
 =?utf-8?B?V1N6RjJiYWxaTUpHYjlwRW5Cc3hZV2YrNTVvVVNpTWNlU0pZcnRpVHdOZHU0?=
 =?utf-8?B?bzk1Wm1Oc2dzMmZBdCtQWFNkanUzNWNvZ0lBY2gySTA1NlRYTmFtWU54blNy?=
 =?utf-8?B?MWxZUFdUUEtoa0VqcXgyek5KZDZKQkRTRElSeHAwK0JRdU1mUGZqdU1EOTl3?=
 =?utf-8?B?SFhEVmxtQ2l3SmVOMTFvaGx5c3JpcjZvOEpzTEdESys2R2x5M1pzMEFJeC9Z?=
 =?utf-8?B?Q3NkazFwZTMxSGZvMXYvRzY3Q3crVXN6dTlWbFo4d2ZES1VRaG5FVzVSU0E4?=
 =?utf-8?B?cnpTZXJZU1VWdlh3WVpiaDVhVEdUVEFDVTZjUitHVFRISExYQVhvc0NuQ29i?=
 =?utf-8?B?Vzg5NVVXQ2JNaXpJNWpQN2Z5elRDV3RDUUtuRWdId3JiaDk5a1cvdDRRRmhX?=
 =?utf-8?B?VGk2WGVQUmJDSFhZT2ExSHBiR3I1SmtneEczL1VaTmk2U3pBWmZjbmpoZ0tw?=
 =?utf-8?B?VVdSV3BYMWNGSzN1d2NDU0xseitSS0l0eDh0QThpYkh6VzU3aWEvSGZ2T0Iy?=
 =?utf-8?B?Yk81d21xcGZWakRmOXNJRll2MHRDM2ZFM0FpYTM3M1Bha3VNWEczaEtaUXVY?=
 =?utf-8?B?S2o5YVdFT0pzZTJPNnpmSVo0aFFXN2o1cFRwL2pzWHEwNHJuN2cwb2hFQWpW?=
 =?utf-8?B?cmZpYi9MVXJ1dlFWc1l4V1pJUm5LUXZaY1dmdkdPNnhISmUzVnFsYXBWcGk1?=
 =?utf-8?B?eitiK0p5R1IxeFFUOXlUSERhWGhVZmVVUXBJZFU1ZVM1eHJWWDJWSlo5N05a?=
 =?utf-8?B?UEpjRjg3UEFYN3R0R0I0YnkwdGRadVduWmJFTjdxY0gzWk5hOTRwMmhSS2hL?=
 =?utf-8?B?WmtIdlpJdlB3bTM5QUlKb3E2b1BUQnFsWkNsQUNES285UkVQZmdrdXV2djYv?=
 =?utf-8?B?em5CZXhIcWswZ1pacXlqeFZFcUJKMUZ6dTNrVkZ0bVZyN1BOSG9JTGlQTDZ3?=
 =?utf-8?B?NS83WjVkckk4SXg4ekliYVFqdUtmY1B5NXhIYU1NS1kyVmNXVWNza2pweFgy?=
 =?utf-8?B?YWk3ckxpNXhqY0NNVkdMeDBIczZGbkI4elhCbWdIQnVMNFhDbUh5Tmd3NDhk?=
 =?utf-8?B?REZ0R3I1T01Ta1d6N29RaUR1RXlISXJYWW5KZlBlM3h3Z1pMSjhkWHpXRWo2?=
 =?utf-8?B?QnNKbUw3UjBKdGloc09ZRWFQdEtoeXMxUzUwSmwwY21sOU1rL2ttb2JKRGtm?=
 =?utf-8?B?K3Jmc0FCR29jM3dBUkhyOHBHbGI3NldqWWFISWpCdXh5N211NTFSaXlXa3JK?=
 =?utf-8?B?WDRJUTZUSm1CSHVCcmNJOG04ZWtvZUxnMTNNYmFrU0xndkdZZUpwVER4cnhm?=
 =?utf-8?B?cUhNbWhPZjIrQUJxRWREZFpneDhDM0I1c2lwbWhCUG5HcUxFamlHTncwSlZN?=
 =?utf-8?B?RFVFejk2VTlGeFdQeUZRS0ZJY0dtcnpjL0xWYlJIZlFqWWE0R0tyVFJmOWV3?=
 =?utf-8?B?TFloWFlxaXZMQisyaThPT2VaUy94S3JQb1p3Z1BqdU1DZitUUVkwNXRQU0FX?=
 =?utf-8?B?Uis5K1BLcU1ZSHAvR0dTLzNmdm9KY2RsSGtyVEdHNStjUlQwSVB4aWdjd1py?=
 =?utf-8?B?bkRFNWt3amw5cFpUYllLUmZ4ZlVaNzNGRlpqZjZSbDBITUdOQ2NxZXlIdUYx?=
 =?utf-8?B?YndiWkx3dEtDTWEyYlJLNk5SZ0RGS3Z4Y3hERTNML3FZaUJIQ0psaEovcm9D?=
 =?utf-8?B?aTBNSGFOc3BuWldkT3pPOXRSNVdFU0pVUWNVOXJtT0w1eFZ2Zy94QlB3S051?=
 =?utf-8?B?MytqczlnSE5mMHNLeUcxZ2ZvUHF6VGR2NHR1SWJ1azcvRHFkWXQyUWR3V2Fo?=
 =?utf-8?B?R2xJdCtnK1ZUZlh5N3VmanFSWHJ3ZEZhT01sL29jbGR2RExuRXJzdDhuK2o2?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bFqGGcCd9immRvpyLEiKmtsGP7Ftc4UVyKpR7NZzGqEwkLB+qWJJZ+Z+057YbrO1Oy/ClPlDzdbDQwQwMXJzaYc66s8MFpoih5/aPKNRkicX4BMp0qCIOuvbbVFPDX+0pRluH6qAUpp2O4c1bphy/ltDw9EgTubr7d2y3+javFm20XyL7WX5lMlH8mn5k2nTzqg+7foqKwWX4kBb7VGBRtL0GRrRr5erB1qoKEa/CVm7wFkVJSOz4+KdUFYqYeZ5wLb6PjDBVFFBatJByQ43kfsMktAcr2Qkjosh1ui69fND1s3aEe1/A1GiSceGELzspEUw0UYRAMyYsCRLkUlsiB7dJl8g4I9gg9ewWkXnOihl7x7jUDIAr+zCmNxrxPOL1tqJmVIP1cRrLxMpKhlmP6t6zCOYtE+O7W0sXLpNmVRYE2qvwbhVQV4PgjFqMOy+GqIuWf67caBZ0U7zDXMKzvJUwvX16lZN7eraJAGjCxR8S4tK6q63myLuBx6In2vBvy6+jtRTznTUcpL+cgsSGbk/07sKIM6c8Tf8hcSr2jP9bxDOzrtfEAxzuzmdRtM0Dkc+gXWA9JgBVjAmr6txqzxkLRv8aCQxmvN4nAaLBZOpozVQ10fuGx0yIvO1Qeynk4UIPFPpoPMZKkF1KP/2xv6Lhsr2wXkqUtVTOeyG43MlqlTTWv8Mc8IUMs9Q0P+BHeWoPNwzt1nUQrH3dVbdpZuHn1weohL7YbSAgd1hTwVk39s/zUIctH7mF2tQQda/flVvRcuEL5UcbPOaMgJeyj8AkNiP1wRLPLz1nkb6Pyz0k93G4+8K5PpBr2nCJ8Ma
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27e2945-372e-460f-a242-08db20de2759
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 20:37:52.1352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaS7kNwvygUFhjLGMSMufA7mGeV7ks79E4zypMV4g4O0dX8K6OOSPUheBUqngnCG7SOK6zP2xvbOAsC+D8ZRprl6Wi9dr6bDX4QyjX/DjXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5813

On 09/03/2023 7:34 pm, tachyon_gun@web.de wrote:
> Subject:
> [help] Xen 4.14.5 on Devuan 4.0 Chimaera
> From:
> tachyon_gun@web.de
> Date:
> 09/03/2023, 7:34 pm
> 
> To:
> xen-devel@lists.xenproject.org
> 
> 
> Hello.
> 
> Following the advice of Andrew Cooper (thanks for helping out) over on
> OFTC.net in #xen, I'll post this here.
> If this is the wrong place, please move it to the right section of your
> mailing lists.
>  
> I got some problems running Xen 4.14.5 on Devuan 4.0.
>  
> The AMD-Vi and I/O virtualisation are not being enabled when booting up
> the host system with Xen.
>  
> Hardware used:
> Mainboard: Gigabyte GA-890FXA-UD5, BIOS version F6 (2010.11.24, the
> latest version)
> CPU: AMD Phenom II X4 910e
> Memory: 16GB
> Storage: 2TB Crucial MX500
>  
> A short snippet of what I see when invoking "xl dmesg":
>  
> (XEN) No southbridge IO-APIC found in IVRS table
> (XEN) AMD-Vi: Error initialization
> (XEN) I/O virtualisation disabled 
>  
> What I would like to see (taken from Xen 4.0.1 running on Debian
> Squeeze, in use since 2011):
>  
> (XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
> (XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
> (XEN) Using scheduler: SMP Credit Scheduler (credit)
> (XEN) Detected 2611.936 MHz processor.
> (XEN) Initing memory sharing.
> (XEN) HVM: ASIDs enabled.
> (XEN) HVM: SVM enabled
> (XEN) HVM: Hardware Assisted Paging detected.
> (XEN) AMD-Vi: IOMMU 0 Enabled.
> (XEN) I/O virtualisation enabled
>  
> My question would be if this is "normal" behaviour due to older hardware
> being used with newer versions of Xen (compared to the old 4.0.1) or if
> this is a bug.
> If the latter, has this been addressed already in newer version (4.14+)?
>  
> I'll attach some log files (hypervisor.log, dom0.log, xl_info.log,
> lspci_vvv.log, acpi.dmp, ivrs.dat, ivrs.dsl).
>  
> Thank you for your time.

Let me braindump the investigation so far before I forget it.

Xen requires that there is an IVRS special-device record describing an
IO-APIC 00:14.0.  This check failing is the source of the "No
southbridge" message, and the cause of the IOMMU(s) being turned off.

The MADT and IVRS tables agree that there is one IO-APIC in the system,
but that's the northbridge IO-APIC, not the southbridge.

The block diagram for the southbridge does have a PIC/IO-APIC as part of
the PCI bridge, so honestly I was expecting the MADT to describe 2
IO-APICs.  But OTOH, I could see this legitimately not existing in
configurations where the PCI bridge isn't in use.

`xl dmesg` does have a few unknown irqs, so there might be something
down in the southbridge really generating interrupts.  Or there might be
a IRQ misconfiguration elsewhere, and this is just a red herring.

However, a consequence of the northbridge and southbridge being separate
chips means that all southbridge IO is fully encapsulated by the IOMMU
in the northbridge.

So irrespective of whether there is ah IO-APIC operating properly in the
southbridge, and whether or not it's properly described, I think Xen's
insistence that there must be an IVRS special-device entry for it is bogus.


Furthermore, Xen's decisions are monumentally stupid.  It takes a
specifically safe (IOMMU-wise) system, and because it can't figure out a
partial aspect of interrupt handling the southbridge, decided that the
system can't be safe (a false conclusion) and turns the IOMMU off fully
to compensate, which makes the system concretely less safe.

~Andrew

