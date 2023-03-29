Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B926CDC3A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 16:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516289.800183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWfM-0001Gq-MF; Wed, 29 Mar 2023 14:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516289.800183; Wed, 29 Mar 2023 14:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWfM-0001EP-JZ; Wed, 29 Mar 2023 14:20:44 +0000
Received: by outflank-mailman (input) for mailman id 516289;
 Wed, 29 Mar 2023 14:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOlf=7V=citrix.com=prvs=445effd08=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phWfL-0001EJ-5i
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 14:20:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddefe2b9-ce3c-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 16:20:40 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 10:20:14 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6974.namprd03.prod.outlook.com (2603:10b6:8:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 14:20:12 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 14:20:12 +0000
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
X-Inumbo-ID: ddefe2b9-ce3c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680099640;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=655IojzztKO2Y/WzygC/yOWj0GYrcEtwP+FsE7a79DE=;
  b=QSgqO1W2+0tDjjYV9zOAkYmkr1nKtcJJ/CUJWrtUH76y4RrZ1klp0zUB
   jO3j26wpQAm1nhir0iWjy6bi5jdPCE1pU7kALK+xk25IrrWcSMWOWgkz5
   PQlnZOAvC0gZlA5n8KYKJYqk8yjYhX5u+CNLPSE5qsxJWW0WetGWKac6V
   c=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 103553597
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BT6j36COmhHk+BVW/zTiw5YqxClBgxIJ4kV8jS/XYbTApG9xhGEFy
 GFJWW+GbvfeNmP3e9xwPNjk908B7Z6DndRmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwqsR1GU9y9
 /IjORNdXA7dh8+5xe66c7w57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+Oxuuzi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqinx27SSzHyTtIQ6RISoq8d23lKq1C9CDzlRcQWWnubphRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9+4FHhRqubyRDHeCrLGdqGrqPTBPdDdSIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCQEWbZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:dcMlAKrkznIK9PlyxdPEGjEaV5tBLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 xdmstFeaHN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMD2CAJsQizuRZDzrcHGfE2J9dOAE/d
 enl716jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kfEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDymIiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/L8Zan4pWfjbQ9kJl5bhHoe
 t29lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nteIIlXRQXaYXdbcUh40C+0F+FosGAUvBmfYaOd
 grKPuZyOddcFucYXyclm5zwOa0VnB2JRuCSlhqgL3m7xFm2FRCi2cIzs0WmXkNsLgnTYNf2u
 jCOqN00JlTU84/d8tGdag8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hwzP22eaYP0IA5lP
 36IR9lXFYJCgPT4PC1rd12GkinehT/Yd2t8LAS23FBgMyzeFKxWhfzCmzHkKOb0oYi64PgKr
 OO0altco7exFvVaPl0NjLFKudvwFklIbgoU4UAKiazi/OODLHWncrmV9uWDIbRMF8fKxPC6z
 04LXLOGPk=
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="103553597"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwVStKdmaJlLtMp+7a9rMwjy/uH0lH9adVyPdGHDOF6TOUSOeXobd2+w5ClPSSCbAb3OSUsEJ9hKmp4rdkVlRNOnNUo9hrNS4tFIo3wGnvCvCQrUdMCNDB82/FcJuSy0YTTdtQXcx/Xda6nY7Q3n3j3JSukuVzEBIwvXQ4kLHXNUYgjN3zsRlCfTW+MlR++SXsMkXVZhQHNC4o237q3zhKzZz8OUVqLxguwUhG8nQja4jrV9/HSCqFkjzOSlflfl5Q6K59fQ8JHc9hJwC9/qCiCLOG1F10MtSOaxIQvIDg1ExlUxnS/zXE4s+vmRJSI9T03mSF4p+eMZKAxxENKLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqAvuPxhF0UC5OLv0I7PWV09VxCAVxMGI1xMtYDsCaY=;
 b=Zzn8Vfla5TMkd6H6nsO8fF2baLRIBpkpVEx3J1+SpPRVHlryXxLMmWLDIzAw8heEsfQ14G1RwlmPajNIhQ58gj7nsEXTqaWHKnPagZkstYwL9XWh8inEXCp+in7gYBpAkqw1ILwxAyudckK6vBVI1Ox+/vxWf4pl9fH7VnPxGRHfQJnT0BiNvwKh+tM1f+5WBOVyIhq1UQbOxa74Bvc/yPSg3tnUdXxqnbxt1e6KrObRyLjP9ekxkjt9UOrvincvhf+jCLetrc9MU+aVE1HA5gX24gIzB5QBoPgnhGkNaBSPvnooNoQrwzRFAc6JZv56dvorwq/w1eT8lnI9lRo+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqAvuPxhF0UC5OLv0I7PWV09VxCAVxMGI1xMtYDsCaY=;
 b=otCXutVhOkQp/idS9NbMZhpSeoJWo2KWU2pxwc7oZ2k4TIzQtDuZUmmLltc5Pm/T4o5RfiUu5FkAJr4YMPLFy7Moc8OH22WXle6PdjfIk6O271qC0grcKhu92gLPDRhMJbX9W1QVTCGNxsR6UXF77G2aASH4Lhva14gBAycKYVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Mar 2023 16:20:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] vpci/msix: restore PBA access length and alignment
 restrictions
Message-ID: <ZCRJFkaF/ueQEmcC@Air-de-Roger>
References: <20230329101810.84726-1-roger.pau@citrix.com>
 <77d0a652-89f1-af15-0a45-0bf28a826b15@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77d0a652-89f1-af15-0a45-0bf28a826b15@suse.com>
X-ClientProxiedBy: MR1P264CA0174.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: af00e2c8-2857-45a3-bb19-08db3060b565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uCGJWAw5sKShtEQHE3/KmczQHZhf5zx871YulHKiX89QjAzpYFsvhUZN2CtFyDva3D1uybjxFMYvDE5vzJ9Dle0n9hmBbsZs7hhUZvE9lf3y2FvYtVh/PgJxY0ErOL7FWpFbXTlLPWoYKFDBU8yY3OrOk4UJqD/AzIzYjIk4yAKBC9/zgjFGOw8UpI8qI/CJAVCyqmFILN1CkTHMiwW99p7b3sAkXhjdqhjI1t4NvAZrYRNjYbfeLtcaggZR11fnfgWSwOsPbIGT6fCO3s1G4rRCwB78AVpifXuJEAFx2BTQXA7dqTGAf8FsK1D6oG+RkTI1oivRLNL/9wKeweH8Y2lTLs/eV7L1pXn83/eu0K7+X7VTxc+LcYTzzpnqFzU/gSw9W3B4vsPzMrdzm3Y/iCItO7XQm5qTkdwhiCpu0kMUdxRA5srQPMW/blkik6c+CIu5GQj5rTKRRO/wEVynAFmQMebeUKgPERZ4BW8pKul3qLNL8gNCO98tkz8Pv3yZzRWuOvJx9SICWiT0QHlSXVcnPAm6aUYVPpsZzYjDdGqyAIq1UfSh1RuSQGwMXc7j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(82960400001)(33716001)(2906002)(38100700002)(6486002)(66476007)(4326008)(6916009)(41300700001)(66946007)(85182001)(66556008)(316002)(8676002)(478600001)(5660300002)(83380400001)(186003)(86362001)(6512007)(9686003)(6666004)(26005)(6506007)(53546011)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWxVekZMdW90ZUY2VzNuaHBxUitQQ1pEV3VlSjdqc1BPbHRubDQzdjQ2UHpy?=
 =?utf-8?B?VEpDOVltYXA2Z3BvSWpISFVqanBrdzJuQXRKQzdseHRBRkxFVHNjbXBrZStY?=
 =?utf-8?B?NUpSQllRK2x4Z3ZDNFFTTUg5NGVURnZBRzZyNUgvYnM3YzRNNEtCZVAzNnB2?=
 =?utf-8?B?MmJKbTBabFkwMmo3NVNTZDVwTXdvRWhvOEQ3N042TXdkNkJSTmVmSTNFZXNp?=
 =?utf-8?B?YlViTklKd0doSTV0MVhWNFhWWUdIczJrVHhNTzVDK0hzVmJ4b1EvazhxczJL?=
 =?utf-8?B?a01BMnlqb2l6ZEtPR0FPclpJQnh3Lys3bG50ZjZmWGQ0ckFmTTZKYzU5cjQz?=
 =?utf-8?B?Vzliby9HUm85bmhtVi9uVXdvZnFDM0t1dEM1U1hHejhIR2w1TmNSQ1FVYmd3?=
 =?utf-8?B?Tkl6R3BjdnM2WkwvY1dzN3hoendvdEhheFMwMzZYOWVMSFZtdlZwaVM0TERJ?=
 =?utf-8?B?eEM2L2dZZ2QvVXVkTHVBcjBxWStCNXhKUGEvd2QwMElBalpVSlJvR2FBL25T?=
 =?utf-8?B?dERxOGROK3NLL1ZaQzY4dU9uVnhpemNMVnFIVW5aT3VySmRkSzRZVEN2K1Uy?=
 =?utf-8?B?eEdQMmJ6Q0lnYWhSaDBvZWdIMlBkVHZnOUFGdVZWeUVzcDJzcmQxdE9tUEk0?=
 =?utf-8?B?Z1RQYzg3R0JHU1g3STkvQUlOWXJDUEl1Mkw0ZXA3dm4wLzQ2dFVaUjhVcjVV?=
 =?utf-8?B?L0RPUjQ4Sk5UTFlGd0lxeTRUdUlQb0dMRnhBN2ZpSldpOEk3S2hheEE0MHpR?=
 =?utf-8?B?ZHNqcjJ2d1QvNFJENlFnZm1SR2d4blJFLzVDc3hHdUhWc0hiWG5KbVBlUUFP?=
 =?utf-8?B?MFhiT09MRURpSmh4R3ovdEF5SFIwZGwrdUtRNmtLdGFsTmxxeFAvV0dkOU96?=
 =?utf-8?B?bWowNFNYR21pUjcyZDhoZGU5UXh2K1ZsVHQrU2Vha3crbStabW5zcnNZd0xZ?=
 =?utf-8?B?QlV3dm8zSzllcTlkN1FDdE14S2gwc3FlN1cwV3dKVmRETk9lMGFyaUtSVVZs?=
 =?utf-8?B?Uitld2crSm5vbDh2WXpuSGoxc0tDVkxIODQwQjV0UWtnMVZ1QVc1aUVMTkdF?=
 =?utf-8?B?cUtVdDNmOTZBZzhOVDh3WktqbkpQRnB1QUxUTWdyeEZmQVNjeFIwcHRQY2tC?=
 =?utf-8?B?NTNvbFlsR0FTM3A2RjFDai9rTzZ3TXIxbnh3NVVFdlIyQWV6UldKdFlIc1hE?=
 =?utf-8?B?cEZTRlBxY2NsZUIxamVGVHFmQWRzd0EwenBOTjNGS0N4Q2pkMjJCaC9zdW1G?=
 =?utf-8?B?aTU0c2NiR0xNM0EyeTEyTk1VUjdWR1M5YmhqNWt6TlY3T1BSOExvZjUraWxR?=
 =?utf-8?B?VXg1dEp4TzloSy9XR3AxYkJPcE5PU0tCMlJDbEllR0JuM1FqUHBOaXpwVUZO?=
 =?utf-8?B?cENtYW1UNE9OTkl0TEZhUlJMaGlROHZucmxPTFMwV0p3UjA2dlBGSlhFZktC?=
 =?utf-8?B?aE1KL2xKT1J1MFhPc0RwQ0lMYW1INjhSdUdodHNZVkFNSEpXd25kZk1xdjBl?=
 =?utf-8?B?T0dLRTMxUS9yTzBMSW9HeXNSMHNsRjAzdlBGRDNmUTU0ZUp5N0krTkpodjEr?=
 =?utf-8?B?bDVhd3JOVnF0ZHA1c1BWYXpycUFwTC9Pb0h0RnM4STNpdHJTMkU5a2UwVHVV?=
 =?utf-8?B?MXVTbThHZG9NUmlJNWtBUHVKS0tOMG1vdno2Ymdnei9aUnZPd3RoNXRYWDhY?=
 =?utf-8?B?UGZLUEV2d2h5aDlZVTR2QTZmRmdydzhuaFgrWm02MnNMejhpWTVFcmgySjgz?=
 =?utf-8?B?bEhjamtsbm1BeWFOcGZOZWlNM3MrM3RKUEdTVkN1aGtVeUFCZzhUQlNuTGdU?=
 =?utf-8?B?K3ZrbWlkc3JDeUdNU09oUDdya0NRY2ZLbWpxR0c2bFJ2MjVwdXBvMXFyMmIw?=
 =?utf-8?B?RTRYamtWa0ppOStmeGxiUCtibEdnRGgzNjFPc3BJRzlyV1pCSFpXU0t1SVJ1?=
 =?utf-8?B?MzUxZ0xNdnRwUmhWeWR1VVB6UGFScS9wZjRWdmxWQnpnZnFmUWlYRVZvRitq?=
 =?utf-8?B?SnY2eWxrRDJ0Z1JaZDlQb0NaV0t5aWRCQmptSG53YVUzTThEU250V2JyR2J0?=
 =?utf-8?B?dUpwYmNKTWI0OGVpL25VbWRWZ29kWHh1MTd2UXgvME03cmd3bTgzWXNicDlv?=
 =?utf-8?Q?JW94RrumRDjH/ViBtNkWvO1Ic?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZCMBtIZt6eH8Bb/v0lOJWqKGe8aTGIG6Qo7QYy0warWqJN12Jwtj8ptMOO7fCA6EiKhfLuPaQDDgeBgN8JRA6JgyetTfuV8W0Cc/x+W8ivgy6FYg4GjBloG2/DxucdjRWYFBy5u/0YNZ4vuXmtLw1XYLXZgYGAw8it3gfQPb149BQqC1ms2/jK5sdotVqg05du3E7MHg5es907iM20gH4ovHs02tfc7i1o7gDAwSEEQtv0TvCzhxBAXsfUFzHZi3pzluP3MG8QfKxwW2KgcW/o2gBYsn/Zikj7R3rkW0o4HMZiab6DKbM+GDuDcSUYXwgiJWL44W9949xUMKk7VPNc8+J1/68ppcY9rk8A3CWN1DhOS7kS2pBt9MTIotQDrkip8yciVXUMtvfzurco7VLaFzZgyYuBSgkcnSKw1mxKmQnYLmCwkD26xyJVujGzs+kFqNFXq5I0WYPp+Xu7wRlYSSfNOFCPmWsytqMa1BnWiQLF1OBFFT+Gk1KYig12ANKIWBjDXMtan1hkU2i8IpoFxhNNL2U/RIhA3w+jCK18mE2ToZpRYyX89ETnbwWUeKphNaUAjJ11TOOIXNnbjo8k9BeScGDwy3WuPb0UcMs2T/BhWbCaHdz2F/uH/7o226ak6y8wmMchjYWKn/IFeaOHNOJJV/MwMTKZajhO3H81BQrgkGmQ7wGR41Z4USYDODt/BS38OmSLXmgPee0PFjweaV7XhgkOWs/GZC9eHGp9Rl0aDAg94jse+mHnulU16Unz8ncCu5s49sre5yYuggTvfujeBf8x3ciIRb48G58Sw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af00e2c8-2857-45a3-bb19-08db3060b565
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 14:20:12.3269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7LKKQGUbcFakVSHaVNWhPyrgxSv/1oIWOD5nkLV9ik9EAWZEqDfAAhXPAaR22BH4tXU/pdWwK7ezAhM14ovHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6974

On Wed, Mar 29, 2023 at 03:22:34PM +0200, Jan Beulich wrote:
> On 29.03.2023 12:18, Roger Pau Monne wrote:
> > @@ -419,9 +424,8 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
> >       * assumed to be equal or bigger (8 bytes) than the length of any access
> >       * handled here.
> >       */
> > -    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
> > -          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
> > -         !is_hardware_domain(d) )
> > +    if ( VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) &&
> > +         (!access_allowed(msix->pdev, addr, len) || !is_hardware_domain(d)) )
> >          /* Ignore writes to PBA for DomUs, it's undefined behavior. */
> >          return X86EMUL_OKAY;
> 
> While preparing the backport, where I'm folding this into the earlier
> patch, I've noticed that this change has now left the comment stale
> (the problematic part if just out of context). Not sure though whether
> that's worth yet another fixup patch.

I see, thanks for noticing.  I think I can likely adjust in some further change,
or even just drop it, not sure the comment is that relevant anymore if both the
PBA and the access must be aligned now.

Roger.

