Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D06D67CC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518003.804103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiqX-00006F-5d; Tue, 04 Apr 2023 15:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518003.804103; Tue, 04 Apr 2023 15:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiqX-0008VP-2Q; Tue, 04 Apr 2023 15:45:21 +0000
Received: by outflank-mailman (input) for mailman id 518003;
 Tue, 04 Apr 2023 15:45:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjiqV-0008VG-Ts
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:45:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1bc3d2b-d2ff-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:45:17 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 11:45:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6774.namprd03.prod.outlook.com (2603:10b6:303:178::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Tue, 4 Apr
 2023 15:45:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:45:11 +0000
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
X-Inumbo-ID: b1bc3d2b-d2ff-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680623117;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=natFjPgAl7txcGRKd3B57/LBN2sPc/aWTAD6a6f26Ic=;
  b=AoJP7Mo6SG49VZZVxJ5/fv9L7/KuLKsqISAgBj+xnNSQbWwnwFar7TKA
   R8TPZe47Ddjmr0EqLAmZLJy6rUN9ih8Kvxn3DPJEPIG2vUwNTOBv2EXs1
   cQPM/+XUrHw3Oge7LphKtXbcXH4Ww1sf5YZvN6g8iSemSzfcOM5thG/T9
   A=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 104324439
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rPpuEKtxc795TysPU4fLfUfc9ufnVHtfMUV32f8akzHdYApBsoF/q
 tZmKT3Tb/qJYzb3eop+aNuxpkgAsMOHndI2TwNt/yAyQylB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGyyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwc2o0UhaB18mM2OzrdsRViJ15dev6I9ZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4C9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqqUw3AHIlwT/DjVHVXWfu8P+lnWQSvV1L
 m86y3QhpvI9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2gheRSN9mSfSxloesRmu2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:59KGOahpJr2OVMJT8QakuOCf/HBQXtUji2hC6mlwRA09TyX4rb
 HKoB1/73SftN9/Yh0dcLy7V5VoOEmskqKdgrNhX4tKPjOHhILAFugLgLcKpQePJ8SUzJ8/6U
 4PSclDIey1M2VFrK/BkW2FL+o=
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="104324439"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKFLHhphQVUZ8V+XFFeyv1IK25gLUzIOQl7NlH8re9kF/JAyBmNHAvlEyCFlqVAb412bYB3wHH4zI236O/tIW8DaDLS4ydPMB9NKVIBcCMOrE6cCvPMFfnrumzgGulXAapaaKWXcw9+Ik0fxA/ZZIYfiK3fMk8mmWLIJIcXY0pz8xuzgh7+Ej8NTBRMyx1zAXG7BsdAS/4FI3gFt+xdNQr0bHNA3WNbAr4WlZQkwPhJGcxYeHuknKeYgVHfkGhNgOOr2WobruYZpVuR2gCCdx5OQ2s7qk9upWIZME7QvGGi3+3ClscQtBdjNAk+rg1JAaEN/VRa+A7c05NffOZ9GIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdMLLuwbV3BYa1fUZZwxBbHCaaivCL4vH/hihHVFoZY=;
 b=TuOX77v8o4rO4+pD0FDjrVzTupFWLqyuLPqpwL7l5ZLhOVJtPa6xCRWZTLEGavE5DpmdrLZThqa+psQ5bzvT/olmHQ3PND5sVL4WUrkgCZHXu02wCPUTQ6LtS3nfjxtJW4lbpujOyLFL/SE+h77/vwvt5b/gpm5g20x6LkMSG890DhDcraD79NxsuDC+yN8d8Fh2Ut4YsYHJZWzve7gmbFmTLl7VbyLf9S4OL3BRzHu/uYOqDTOPFjy472OqOvkSsSAJULcV50/r9FFYFJtRJgzTJ5RcAG9Ugwr9tByPFO3HpmLqIYJvqvuWyqExzw201rH6vXX7edxw7tRFYf8p/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdMLLuwbV3BYa1fUZZwxBbHCaaivCL4vH/hihHVFoZY=;
 b=uDduHxDWUZVzTQxn2nn0IkXd6y2/Wk+P0gXyJ5GVLGhQ5VisiJ45qj/kKXugv6uqukfxl4DYPs/ygc7G9lP8fm4KdMb52lnq3pbG6m31v/QMID8fC/r9KBeuGV7uA0H1ZjOKqMxQGFpACTSjLk2di9hJaLX2JqUlu/U5i6j9BKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0c43546e-0333-af19-efa5-71cfaf5efa3f@citrix.com>
Date: Tue, 4 Apr 2023 16:45:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 11/15] x86/boot: Merge CPUID policy initialisation
 logic into cpu-policy.c
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-12-andrew.cooper3@citrix.com>
 <087536dd-96cf-84f0-4b8f-d4de4d6bd093@suse.com>
In-Reply-To: <087536dd-96cf-84f0-4b8f-d4de4d6bd093@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0337.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO3PR03MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a18d73f-ce1c-4eec-1248-08db352392c6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AQxiMrV8mXXBToee8J/wqingWEbZSZifVA+xAPV3KUkI4Ji49S7QOMnO14HCYhhQQJFHZzg/lIXzUWsKIrFGaOYzfF3Iqr4SS0lYT5RZm8P7WiA2lHZwB4v5bwTE5Svm9FPcBYo6COxgqg+bDG1PjFVOLdZEbUXF68OI0kySFXp/HRR5403KOMIBxfhqBDcldRW9r72h9m7XGJ0k7TCVqb3KXHnxOW6Sq9HDV7KmxrAX+QPhDr9/6OR8aLxFYtz4ntJxRaV+SGJgoD6BBQx8EFo9eK1ortiyL/cEvimR0JkXqVUJNrw8BLgYbXLPLgbICHQ4vNqGy677kT68/Kqy7Hzc/eitkrSnzcE3XkB0Dqk3TpvVtFVtFwfpfOZCQ5iN8ScIGSS4aG24ecoIen1dAZdCpiPQeMsJrraliMyB9Sf0R8j3rHoOGy0+wJSOuSAv7YuvNsFBgoipMcJKOuHfSdEUcxHXcp/Wr21beZzGpz6u8vGHq82uwgSKLNvuf3O/CiBKfhm8uhOfSMWtTe+XH5qrisgXuKFzmhD1F6/d+f5wLwjS34LztYDPuGHS4ZpRqPjdkVNFjj5LykAXaC1uapUMdFrfRxw5vrXtU3KbhJ6qG7PM9z+mSWC31iLjHPRR9BVl/wSPnx5jB9QlvXADNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(5660300002)(38100700002)(41300700001)(8676002)(8936002)(82960400001)(31696002)(86362001)(2906002)(6506007)(53546011)(6486002)(6666004)(26005)(83380400001)(36756003)(2616005)(6512007)(31686004)(186003)(316002)(4326008)(66556008)(66476007)(66946007)(6916009)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVNEUGs4Mi9taGY0SE5NMS91MzZmQ0cxaFdTVXBiVUxBZkZMZWRQWXhPUnBi?=
 =?utf-8?B?YWg4OFVDbWtqQW5yV2l0WVNYaFNPdDAyQ3AyNkh6WUdGcHhjMTR0d25EZHYr?=
 =?utf-8?B?dExjLzV1elc4VGdsUDBTK1ZqTkpQN2dYcGZuUDA0WWRFQnp4NlVTbnk1L2p5?=
 =?utf-8?B?dWh6ZUVnSitRRG52Nzd0ZDZHbEg3cENjbTZjSGE5TlZJKzlZSDVqU3pqTVNX?=
 =?utf-8?B?dnRyNjRTNXpxRWl0L2JPV013S1J6Q2ZTMGFYRWo4SDk1R1M3NUFxQ3ZnL0tL?=
 =?utf-8?B?cmdKSTE2RG1acUFVeDRVcXZIQ01McmlobWcyVDVLcG5WMmxZaTNxeHh3YzVO?=
 =?utf-8?B?TEV2MHVSR1ZYN1dEaG1JQ3dhQzdsbWJmcmcyRWZjcnVzMmpTZTI0eFk4QVZj?=
 =?utf-8?B?cmEwTjh0UCtKUC91WFJJd0NZU1pEYkYwQTJiRXBIZDFweVJFVFVhWUh0QXov?=
 =?utf-8?B?SEQ2UWZSV2I0dkdNS0hDQ0JuYTdBdEZPNzFXRW5PQnl4MjlaaWtDSFd5d3JE?=
 =?utf-8?B?bkR6R08xcTNmK1BGaEpYZklIN3VaemNUd211SFRxelJWNmpKZHk2cytjYllt?=
 =?utf-8?B?eTlxdlYvcFprSTQreTJjbEMvbFlabmtaczZJZklqN0FaNkM4Wjd1SkpQWThp?=
 =?utf-8?B?RlhhT2pmeEtLUjJ3MVYzeSt0UHhsU1B6cjJsQWEydlZ6TmNqaEVHa0FuUW56?=
 =?utf-8?B?RDhiYXdwQjVyUzNBU0ptOWJ3SUtSUmVMdE03WlRRL1B2UUd6KzlCdzhKdks0?=
 =?utf-8?B?eHZJdnlKQmRaWUR0czE2TTRBdW1admJacmpzaXZScFQ0UE5OM1hScGVxcHJO?=
 =?utf-8?B?N0tKOUo3ZWR0K3B3bW41cGMzVkY4TUdOU2ZLU2JZSjRoZEVPL3ExR05GWWhn?=
 =?utf-8?B?SDhObTRjeGhHSnJWMC8wQ3Q5c0tNQ2N1TDJEbVNIVG1vUHBWNEl4Y0E2a0pK?=
 =?utf-8?B?K09GalFqc0IweGlGZ0s1SkdDVkZacDdOMlRtWE5Jd2ErOTB5ZWo4Y1RYMW9S?=
 =?utf-8?B?UmdXNlpyRnBTS3p4YS9IMllZYTFBNi8zQmRoVC9CbTRtTVJMREZIMkNZZHQ4?=
 =?utf-8?B?Wkw3QkhuajNYbzc2dFd2a2R2OXZKMXdZTzZyREE5cHNGbnUzekQ1VmZtRTNF?=
 =?utf-8?B?STFJRmlxYXJjanN5Mmh0SW9rdzNxSE9oazNVUHltZENGUmxoS2NndmlBeXFk?=
 =?utf-8?B?Q2doOXJTQnFrejVMdm83RlhKdWMxaWdDTHovWkFlRU1Yc3YrcU9vdXRvOUVU?=
 =?utf-8?B?RlhaYzdnZTVoVGlwOGFucEtnbllwNGlXdXZENjBpWFV3V1BKcDNhZ0NBMjlW?=
 =?utf-8?B?TzZXcFVzUjdsOW82ZGpJcmtybEtLTmtqcTNKZGJNdVNwb1RzeVhhSHFibVli?=
 =?utf-8?B?bk9jYjVSb0Q3OWRHM0MrUEszbVBUci9hakRONVFmM2lOK1dFa1VPdTNlVEJ2?=
 =?utf-8?B?dkJReW9WTjVzTkZzUGp5MU9EUi9QMXp4dnNDNEV2SFluSXQveEVXL3hMSFBt?=
 =?utf-8?B?QUFLYXNiVzhhdkJLSWZ6cWRwcGRadWVtbW04UDlnSnc0QTR2ZzJ1Y09yNkhv?=
 =?utf-8?B?d2M0eU0rdnBxMTlOcXNKbFdBSDU4WU5lUEJFNWlMYzhRWjdYdHhlM3NNYVF0?=
 =?utf-8?B?WWJ5OUF4OXFrRFFNVDRiSGV5Z0FqZ1RWdFkwQVpmSEFkZld5azlPRnFPTEhY?=
 =?utf-8?B?ZmluMkdUT1VnSUFIcC84d2ZoZ1RjWWVBaDhzRWJDQ2RTdjB4UUlLakZ6WFZJ?=
 =?utf-8?B?d2d6UHVIYS9hZWhGM0cvRTg1WFdsSUhkYUtteEt5VVAzckxhWGkxTm44RDQ1?=
 =?utf-8?B?MW1VU0diQzZQMEJaYXB5MHRrMVhyZjV0NTJrNnJVRHQwYjVHb3BWTVh4dnBL?=
 =?utf-8?B?b2FhY0xLaFplb2U0VFNJNXNBL1czRDhybG9kcW8xOWNJNWcxRUdZTVdJQjJL?=
 =?utf-8?B?dnhwSmVjRzZtUHhwbXQ5bDZyUlVMSzd5UlhsMG84YURtSnZzU3dnL0d6VFI2?=
 =?utf-8?B?U0FNUC9jUXN1TGJneXhuR1NDTjBUcklBaWQzVFVUOCs5T2ViVHY4V0hwbDVN?=
 =?utf-8?B?UXF5YllvcTBtdTUzZDMwOGJ2bWhiYkxvOXFQTVVhQS9neENoeVE4R1V6azMy?=
 =?utf-8?B?QWpqVkdnS3d0R0VWeWpXSVRzcnFtYjVyVVhpN05BWW9NVHJ1Zjk3YU1XRmQ5?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fhUsFmlsE22EGcJl48bJICfNxPkwj3j5atnzjSc5Tb2wA3eT/EcIVYk/+Fq9HQGh5zUfQ/nE/hRSJFjgasSAH6uGPOKAJDKYndoqAW9uSgIru5wbLkT19D+ux07c0LEE7jY0n/M8cpbUeyFSwT7zXczHfU3WFccLxn2CH3mwnciqNy59nsrKvNbQbQ/EOLm7SII/F8oT9jzS+7RRZXuXDS0l86RKYWdQjgBUD5hao56vL2BrNZE3H3WS2rs9+yMThffb0oF7Zf3Lzq4xxEcoYaHmQZHD+JTbDI1/T3AC+l0RPHzAEEPbI0NL/C0kpqQdiaNdFk/xQh5hQuIXf1OMHd9lkZ77e8vfoM6nOz4fcR3i5IHr6xGY0UhDI3XW9rcVV0UZB30KFLJWTU4cEjTd2TbUMxRl2Nl4FqLnj/OIkqxNkr2Pdh5kmrXfrXokroEBeaTsDMbc6fZHUFzQrs6mTsYsagmojxc24oLNLVuxvTLsUdMv1X25w3veNkFlVthdOY4W80GZTgaWZ0nJKaJKUeGqf02UjNqgDqqI6JNYpRv/ym51HBV5+mvrshXglpNWpqEw6yI8QiApBcCPyDBeHoxly3hnElzvHKaAmTTy4MfMG1F2Iv/yRhuCnjQugQV+ywU2eAi0ueehz2f1X34rvEusKJtFn8x6zzbUMRYco7hq3yp60XPjExF/kp0ENvRaVg0oRRHQ9K/o6FynjYsNQJPDw9BayAXkx9CrgyiP2kIxHDSn+bNKaUXUusvWQeAXqNcUUXW62sfvIfQukrmjd+YucG0M5Z3RAXBQcupEpwLlhe73Xscvq0uZTJH7e/ot
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a18d73f-ce1c-4eec-1248-08db352392c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:45:11.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfL9l+vCdCLJ9Ry2Kl8XSbb9IBrHxm6zCWJLBcM/zkhhd9qsSHEzyulOamtziLzco1a5IEDuXH9544EB26A4G5/u7EKL1nQ7w/jm6QzDvdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6774

On 04/04/2023 4:16 pm, Jan Beulich wrote:
> On 04.04.2023 11:52, Andrew Cooper wrote:
>> Switch to the newer cpu_policy nomenclature.  Do some easy cleanup of
>> includes.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> v2:
>>  * New
>> ---
>>  xen/arch/x86/cpu-policy.c             | 752 ++++++++++++++++++++++++
>>  xen/arch/x86/cpuid.c                  | 817 +-------------------------
>>  xen/arch/x86/hvm/hvm.c                |   1 -
>>  xen/arch/x86/include/asm/cpu-policy.h |   6 +
>>  xen/arch/x86/include/asm/cpuid.h      |  11 +-
>>  xen/arch/x86/pv/domain.c              |   1 +
>>  xen/arch/x86/setup.c                  |   2 -
>>  7 files changed, 764 insertions(+), 826 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
>> index f6a2317ed7bd..83186e940ca7 100644
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -1,13 +1,19 @@
>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>>  #include <xen/cache.h>
>>  #include <xen/kernel.h>
>> +#include <xen/param.h>
>>  #include <xen/sched.h>
>>  
>>  #include <xen/lib/x86/cpu-policy.h>
>>  
>> +#include <asm/amd.h>
>>  #include <asm/cpu-policy.h>
>> +#include <asm/hvm/nestedhvm.h>
>> +#include <asm/hvm/svm/svm.h>
>>  #include <asm/msr-index.h>
>> +#include <asm/paging.h>
>>  #include <asm/setup.h>
>> +#include <asm/xstate.h>
>>  
>>  struct cpu_policy __ro_after_init     raw_cpu_policy;
>>  struct cpu_policy __ro_after_init    host_cpu_policy;
>> @@ -20,10 +26,332 @@ struct cpu_policy __ro_after_init hvm_max_cpu_policy;
>>  struct cpu_policy __ro_after_init hvm_def_cpu_policy;
>>  #endif
>>  
>> +const uint32_t known_features[] = INIT_KNOWN_FEATURES;
>> +
>> +static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
>> +static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
>> +static const uint32_t __initconst hvm_hap_max_featuremask[] =
>> +    INIT_HVM_HAP_MAX_FEATURES;
>> +static const uint32_t __initconst pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
>> +static const uint32_t __initconst hvm_shadow_def_featuremask[] =
>> +    INIT_HVM_SHADOW_DEF_FEATURES;
>> +static const uint32_t __initconst hvm_hap_def_featuremask[] =
>> +    INIT_HVM_HAP_DEF_FEATURES;
>> +static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
>> +
>> +static const struct feature_name {
>> +    const char *name;
>> +    unsigned int bit;
>> +} feature_names[] __initconstrel = INIT_FEATURE_NAMES;
>> +
>> +/*
>> + * Parse a list of cpuid feature names -> bool, calling the callback for any
>> + * matches found.
>> + *
>> + * always_inline, because this is init code only and we really don't want a
>> + * function pointer call in the middle of the loop.
>> + */
>> +static int __init always_inline parse_cpuid(
>> +    const char *s, void (*callback)(unsigned int feat, bool val))
>> +{
>> +    const char *ss;
>> +    int val, rc = 0;
>> +
>> +    do {
>> +        const struct feature_name *lhs, *rhs, *mid = NULL /* GCC... */;
>> +        const char *feat;
>> +
>> +        ss = strchr(s, ',');
>> +        if ( !ss )
>> +            ss = strchr(s, '\0');
>> +
>> +        /* Skip the 'no-' prefix for name comparisons. */
>> +        feat = s;
>> +        if ( strncmp(s, "no-", 3) == 0 )
>> +            feat += 3;
>> +
>> +        /* (Re)initalise lhs and rhs for binary search. */
>> +        lhs = feature_names;
>> +        rhs = feature_names + ARRAY_SIZE(feature_names);
>> +
>> +        while ( lhs < rhs )
>> +        {
>> +            int res;
>> +
>> +            mid = lhs + (rhs - lhs) / 2;
>> +            res = cmdline_strcmp(feat, mid->name);
>> +
>> +            if ( res < 0 )
>> +            {
>> +                rhs = mid;
>> +                continue;
>> +            }
>> +            if ( res > 0 )
>> +            {
>> +                lhs = mid + 1;
>> +                continue;
>> +            }
>> +
>> +            if ( (val = parse_boolean(mid->name, s, ss)) >= 0 )
>> +            {
>> +                callback(mid->bit, val);
>> +                mid = NULL;
>> +            }
>> +
>> +            break;
>> +        }
>> +
>> +        /*
>> +         * Mid being NULL means that the name and boolean were successfully
>> +         * identified.  Everything else is an error.
>> +         */
>> +        if ( mid )
>> +            rc = -EINVAL;
>> +
>> +        s = ss + 1;
>> +    } while ( *ss );
>> +
>> +    return rc;
>> +}
>> +
>> +static void __init cf_check _parse_xen_cpuid(unsigned int feat, bool val)
>> +{
>> +    if ( !val )
>> +        setup_clear_cpu_cap(feat);
>> +    else if ( feat == X86_FEATURE_RDRAND &&
>> +              (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
>> +        setup_force_cpu_cap(X86_FEATURE_RDRAND);
>> +}
>> +
>> +static int __init cf_check parse_xen_cpuid(const char *s)
>> +{
>> +    return parse_cpuid(s, _parse_xen_cpuid);
>> +}
>> +custom_param("cpuid", parse_xen_cpuid);
>> +
>> +static bool __initdata dom0_cpuid_cmdline;
>> +static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
>> +static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
>> +
>> +static void __init cf_check _parse_dom0_cpuid(unsigned int feat, bool val)
>> +{
>> +    __set_bit  (feat, val ? dom0_enable_feat  : dom0_disable_feat);
>> +    __clear_bit(feat, val ? dom0_disable_feat : dom0_enable_feat );
>> +}
>> +
>> +static int __init cf_check parse_dom0_cpuid(const char *s)
>> +{
>> +    dom0_cpuid_cmdline = true;
>> +
>> +    return parse_cpuid(s, _parse_dom0_cpuid);
>> +}
>> +custom_param("dom0-cpuid", parse_dom0_cpuid);
> Unless the plan is to completely remove cpuid.c, this command line
> handling would imo better fit there. I understand that to keep
> dom0_{en,dis}able_feat[] static, the _parse_dom0_cpuid() helper
> would then need to be exposed (under a different name), but I think
> that's quite okay, the more that it's an __init function.

I'm not sure I agree.  (I did debate this for a while before moving the
cmdline parsing.)

I do have some cleanup plans which will move code into cpuid.c, and
guest_cpuid() absolutely still lives there, but for these options
specifically, the moment I add MSR_ARCH_CAPS into a featureset, their
bit names names will work here too.

So arguably {dom0-}cpuid= don't be a great name moving forwards, but it
is is absolutely more cpu-policy.c content than cpuid.c content.

We can't get rid of the existing cmdline names, and I think documenting
our way out of the "it's not only CPUID bits any more" is better than
adding yet a new name.

>> @@ -149,3 +716,188 @@ int init_domain_cpu_policy(struct domain *d)
>>  
>>      return 0;
>>  }
>> +
>> +void recalculate_cpuid_policy(struct domain *d)
>> +{
>> +    struct cpu_policy *p = d->arch.cpuid;
>> +    const struct cpu_policy *max = is_pv_domain(d)
>> +        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
>> +        : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
> While this is how the original code was, wouldn't this want to use
> hvm_enabled, just like init_guest_cpu_policies() does (patch 10)?

No.  That will fail to link.

This trickery is necessary to drop the compiler-visible reference to
hvm_max_cpu_policy in !CONFIG_HVM builds.

This function is only called after the domain type has already been
established, which precludes calling it in a case where max will
evaluate to NULL, hence the ASSERT_UNREACHABLE() just below.

~Andrew

