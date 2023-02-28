Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5B6A5EF8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 19:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503685.776031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX51m-0003up-0a; Tue, 28 Feb 2023 18:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503685.776031; Tue, 28 Feb 2023 18:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX51l-0003rg-U1; Tue, 28 Feb 2023 18:48:41 +0000
Received: by outflank-mailman (input) for mailman id 503685;
 Tue, 28 Feb 2023 18:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzr1=6Y=citrix.com=prvs=4168607d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pX51k-0003ra-Qg
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 18:48:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81ddef8a-b798-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 19:48:37 +0100 (CET)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Feb 2023 13:48:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM8PR03MB6232.namprd03.prod.outlook.com (2603:10b6:8:3d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 18:48:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 18:48:32 +0000
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
X-Inumbo-ID: 81ddef8a-b798-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677610117;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZWnw15mymTWlfo9wIAG8xsZU+fVj5ivozqE0RAPdovc=;
  b=GHtdQTkk9g3iwLoKchLzcPGlfMMvN0XBHQlq4do47Wq89JdghHaPR4Vu
   Fd5Dgb/eWIPblKLg9zV5ZzJ9aY0BBerz9ARfBDJydAP5W1W+lZtO9eTG1
   22olhi3genB2PCY/wiQit/7yaNPfl0VbOk2vgdjSmB+Ia6/+5XUMVEdUX
   Q=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 99309684
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0jr1fa0TJIFlk4UKB/bD5eVwkn2cJEfYwER7XKvMYLTBsI5bpzACy
 mJJWz2HaPqJYmChKd9xatm18BsPu8XSm4JgS1ZppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gZkNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfCmQS+
 fEADm0xUSuCo8yIh/G1F/Q3iZF2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFMZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKqA9pDSu3knhJsqBqfnmoPDTtNbGD4of27k3GOacBAe
 kNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQtvdU6QjEC3
 VaTk9TkQzdotdW9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHeTJobixvOSpNpFvGzh9isQTXom
 WnS8245mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp4
 BDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:nIOiR6Hz65DSBYzbpLqEFceALOsnbusQ8zAXPiFKOGdom6mj/f
 xG88566faZskdpZJhCo7690cu7MBThHPdOiOF7AV7hZniFhILPFvAA0WKI+UyHJ8SRzJ8k6U
 6iScRDIey1I159g8P3pCGgCtomztmB/OSBnP6b73oFd3AOV4hQqyl+DAifHglfXRBLApQ4E5
 bZztNf4xqsPVwTbsygb0N1O9QrZeenqHsrW3E77tcciTWzsQ==
X-IronPort-AV: E=Sophos;i="5.98,222,1673931600"; 
   d="scan'208";a="99309684"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNCPfw0vRTlBwrTFPmIFe25SwCwpLVxWZ2/jkCAlFSzayw0j9tz1X20LlYEUzl7pNmM3RI+Z+YNMG8iWi52F9LJGVftKCviI5CpuC6iXh7bAlTHk7nCrqK195L7cGN4NuG2q5hSni2dgzF0C+E0BNUu9bCUlzCN2j6eOZMuJylHjk6Fh3ng64/jgGDDTx1ld96eRUhqFYEcMYpbV7I0nYC52DvrcjkbiqFQKG/U0lr1yoGfu2vPB1V5iGMwcP+bSyVAHr3GRsWlZ05WUJulmMgd0lc0YPpkMjxi6lnCdnxV0pUObhUvL/a7CzW2lArWyjdxzMDn1B4dY7CBSHzCqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nXjnTlPIJiarTABu89hdaYMD4884O9NphsqENywPOg=;
 b=X6P2rLqQ+VNPU/y6DJgn8+FrLk2wuz1Lq3TrS2gohKSj7f3TsAD2V+B0mCgq94I13AiSF+clYexzZXqHL4oOGmEkCHGlMOQEUyrytUjelKqQJqjf/H8JXEGY5qdBPWRVgZttI/RzyxSVwLzn39fYwsznHJjhNuz5uiEFUb8Y2fAYZ7uz5Xj1qR0GB3dSI/f48mDcY+O2vyBIAuuYKTIUbW7nt17LOc/Nyr1/KmXYwPM/FTnUqpS6xupf4o3gV/PQbykyEH7QLryWJmgIP9D7lFPFx7sEuBaruUSddC/9n5n1lNon1SLK9khfGftvnNg/HQGYBY/iU0CtIsQhuTSo0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nXjnTlPIJiarTABu89hdaYMD4884O9NphsqENywPOg=;
 b=F0yUhv+BCYk88JSRGshQ5jFngN8nKd4kvGdaNyCi1MmwZ+ErN3/EVj4w9zesUhQZmf35Qc1CkzucxemcjYz2X3TrrIrVt8uPJyl3B4h+B7BbvUtIZcaRR2EnnkARMJiSOf3Rhn8eKjwjn5Wd1wM+2RpJJeSbb35zh9Y3A6Grxqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <27e9e2bb-423c-8ad0-aaf0-351b756c6c40@citrix.com>
Date: Tue, 28 Feb 2023 18:48:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] automation: Rework archlinux container
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230228181649.51066-1-anthony.perard@citrix.com>
In-Reply-To: <20230228181649.51066-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0373.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM8PR03MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c3b1f3-dfef-4fe3-7f69-08db19bc639d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QyDn6H+0I3BXdH76rvmm3nE1GPB4YnyOTxaDPcPvlImsXIseCYryHzqSZWREFkg6Oo3En04uBesmzXtBmuZkVjw3/sAtTlnc9NAiu/0vOYEh31r9XGvQ1FvAK4MNRsSYhhrD0tOz1JWs7S2r7u5c/V91SndBjcrnB3H36N55ymDFIk4iiRHRIQ8UlbBlxdF7ny6w56PlyZj2+K0n0XDiu6u7G/XXfdndFnCvwOWnLpN0dWuzFfF5eOc84DaWSPml1sAJDTZJGBNjKf3xDkr8PdN69NHyaPI10ChjV1+z5eRRsYUOzeWXTbloCKVEIYx1NopXDyikI4L0ucRBKm0m40ojBGBtuZX05j98By4KDoc9e/yQDWHjVnrBromdDJP85g/PzM0GmCUmDyDJyT8qu5ZlpUGqHNWphHuqtJ6RDkJtmeShXwWEnLj4zEqVFI5tletuHTMq/0CGUpMULWnHcCFVbKR4Fn9z4xd+eOlNDpSSizyAh4+FT0e+qGwhKHGZMNqhBZ3YiwdTZ6hpL2QevCr+JoNE2LpKIZ63ZVYRTyzinXd+n2nqevqge2wv0VE9iTzi3BE1e5oz0HdqUPwJHQTdMRSdHq9mg/XnRI+5XsCco3j8cHohgNH+bIrHGhGWDYQZ5Q6Sstcf3sVKhIrDLtUnIKq/fgQXiCiZm0o+2d4QnI1smhIk3qTN5LdD4e4TAseOdytvXPEBuABSkkPCKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199018)(66899018)(36756003)(31696002)(86362001)(66946007)(66556008)(66476007)(41300700001)(8936002)(8676002)(5660300002)(2906002)(4744005)(82960400001)(38100700002)(4326008)(6666004)(6486002)(966005)(478600001)(54906003)(316002)(31686004)(83380400001)(186003)(2616005)(53546011)(6512007)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGtrb3VBZmkwSnQzeEZKQXdGczQzTTJJT0VvS0RnNkhtZGwwMjBudVcrNDR1?=
 =?utf-8?B?bWRRZlpBSCt0Uzdza1pVMFY4YmFtREJ3UW8zTGxLd1lQdjFFK0hqVlNxUFds?=
 =?utf-8?B?SHlnaEV5WWYzcTRSREJlR3FlcXFJRE1haFQ1MkEyU3V6MVNENzRGakMraWtS?=
 =?utf-8?B?RW5Zb1JFOFFKcWdHMDBhVUZOM25hMGloY3NJcndsUXZ6QTVON0pTQnVTWHhP?=
 =?utf-8?B?RFhJZFNocDhnNTFTbjFuc2FqdWNqdWY1eGFiRmZVYVg4dWw0NVBUeTdQVk5K?=
 =?utf-8?B?Mm92ZVdjUVpOMGZ2aFIvOGtmQlVlYm5aakgxMnIyM0NtYnhNdGNQQ1U0VmVv?=
 =?utf-8?B?Z0RKa01MdmRocDlFbGJGaHlhOGdHVHdPUzc3TFh1TTh2Q1g3dER0enFsOFUr?=
 =?utf-8?B?bWFaYTEwcldhSmJUMWl4ZGZ0L05lMTNYOEc3NE9qaU8vRTBWUFBKNzVWdHc4?=
 =?utf-8?B?cSsyMkQ2VFAwWmpIamllWXhGYks2MnlUK0V3bVI4T3JZVWNDN3ZkOHkvQk51?=
 =?utf-8?B?YmNDVDlwZytscEJGazZwdTRlL2J3OFZ0MkNhcE02RlI4K0lMYnhuTE9GWVMr?=
 =?utf-8?B?RHFFRHQzUmErOFFuRWN6NUk2QXRsRzF4Q1l6VzBXQkR5enFXMU1HRDM4azF4?=
 =?utf-8?B?SlZQQnNvclM1L2s3MEFPT3ZPTzA3aXNYejJhVDF2a284T1RKeGFHOHJlUXQ2?=
 =?utf-8?B?dVFXUU5VbEZaM1hnV0pyYnJuSndsNENNV0dnaC9VcDBPM1VrRWx2eEpwdFBj?=
 =?utf-8?B?OTEyb2tGOGg4YnBaTFZFcXF1bThjWFp6bmFpZ3JCZ1VxbzM5NjkwWklzQzAz?=
 =?utf-8?B?ZGYraWE0dTFucnp4QkFLempFVWVBNk9IODJMWkwwTVdjZWEwc3l0VnNoZy9s?=
 =?utf-8?B?TCtiS1hrRVhLMGlmeWExbjRhRmpMd1E2M2F2dVN3RFBCTmlSUXdxaElLd2FM?=
 =?utf-8?B?UXJkbDlQQ1hCbmVmL3Z6cHl2S1NyY1NFWUNReDluazJ3dVowZDlxMXA0N2Vh?=
 =?utf-8?B?d05OYnllR1lmb1RqT0s1VTVFeWM2K1BITWZINk5VRk5zL1B0Z2s5dnZ3dElh?=
 =?utf-8?B?dTBXOGFranNGSWpPRFFJcVk5aE14bm5FbkNIOG84R3pEZGhTeDI0VTJIYUM3?=
 =?utf-8?B?TDE1dE5CNXRreTBTd05XZE42ampGM1dtMGNxZmV1STJpUzgyb3VKMWRxbGZy?=
 =?utf-8?B?MmtyQUIvQ092MlJ2c2poaUcrdXVGVkY5MG9ZSEFmajVwMGdEQ2lOWlZEdURV?=
 =?utf-8?B?T1BsaWNYUGsxSnp5cjFSVVNrdmxIbisydGRESzFuTHloT2JPMnU2UWlRRVVy?=
 =?utf-8?B?RmQvTks3RFkrUHpuelpzZVRtS0JyT0R1NGJkT1o1aS9RWjUwbkpZQmRyLzcz?=
 =?utf-8?B?MndyUjJ1bHNEOUQ3RE1hbHl4d0ZQanhLUjlmTkV6aFhwUVNMc3V6REcyeVUr?=
 =?utf-8?B?RGJmNFVheGJqRDBlUE5zZGxFek54RjJmcWhkb2M3MFdzMVYrT3I4TTJPMWNn?=
 =?utf-8?B?RkJIOVlLdzFmSE1OdnJWYmxHVWRhZ2VOc2x6eThCWGN4b0ZUaFI2VlFZVFhj?=
 =?utf-8?B?OFBqTmdaNVVwQVpMMkZuY241eFpVejJNdXpjd0hHMnhyVi9XekUrV1NZVHhV?=
 =?utf-8?B?RHc5YnNWc0NVMXVvMEFIOGd0dUcySUdudHIreGx3bURPOEFPZjJUN3J0ZVBk?=
 =?utf-8?B?NWJKY0kvUkgvT0txNW9yRkc5SHpqNFo4VEV6aTBPUVROaE1DcTMyamd2REN6?=
 =?utf-8?B?VXZRUTE5M0FXSktxZTAyN21lZ3FWK2JKUnYrMFVibldMci9ZdlVaOExXR0JF?=
 =?utf-8?B?NVJnRmtGOC8zWTd2Q1grbExGNHBlT09Jc2EzN0RvRjlNeGF0dG9ickxyek55?=
 =?utf-8?B?d214dkhHMXNRZmdsWTdybXRTNzhKRFRIVFNsdEM4Rll6a2dUQXgyQ2dYTUZw?=
 =?utf-8?B?eGZEM0ptd1JlS2tibEtuV3QrYTExa0pQRDZocXJHc3F4Q0pzazM5UFBERlh4?=
 =?utf-8?B?b0dTS2hTR0tyZ0lNb2trb05IY2NCT3pGaVNmVngvb3U4aWhxLzBNNEg0NkxC?=
 =?utf-8?B?UkxVajAxRlRzeWJDaGhBdjBWa2V4MTRwYkZFSHQ0Y2NtZ0xGdWVwSmhkSjJw?=
 =?utf-8?B?OGJMN3Z4T0ZHem5jQU5DZFA0SmxRSjRENjBoQkFTV1RSbzFCZkV0ZC9TOWtl?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KUgkeG4qlzhuEz5c+bw4CQIh/eSM/3yr99IBGqPIwLfxnAR3HuyTf9L3P+7Op9i3/z7DcVPLyX4n0RliTH4For4O9QwYHNAl57DMix39ZbG5Lb99VkaHRLe7laLLDWybjpv2sysMS1S7CNAkTIR/O6eIWS532LOutUud86F8W8qVKwPFf94ofDpxl83OzMprKD3WBenbFVp8Z7CmwQrMLlUx84nX/JZRDv+e5dTi8ALC+ziXEqKtz/kz9WknaIntwFlS13vE6qFdLGHUzh1GSBb60D2zZ+5TKi7Vt7ryXbmzplfXQEWceDU5jwnD3OZvj304S1IL4HLvlcEQcBeviGRpktERcmwQpvxnGbVCcdoE8+LoVx3/TzVF3iCHkk4N1FKZVqFLkljEcBguhOxWEBVjodosGq3KNnLcAXekJ9uJUVlbCgBVAmsOYLecJh7c0F/TNNeo0wV29Y0DO0wDa11TMovlNzN2n+oBCnYjV2Fg1anQwEWffgXsHNx0PcsV2EteBrKsM8Z0+hGgJv/zzDXXxEP7o4AV9PbCfa8hDozl/0H67DQURAbEusWofe5h5awW4yGrq9ZxTRe4nK618f2zKt2so7byE+crdt5tIJ8Dwcrgzy8FcTy5o08i6h8AHMBRwGCYe+gEJ48PWS03+xoehTq6udrTDFaBAFPw0LUN5jdg3G204Fae3FfRyyh5WLe+KIbkD2gR7w1JSkrfzZYBKZIcAjzzRCxTaEp9SK7FWBKRDA3AvFqHsvtNa2N4TpUV5rXybZwJkI9oAPI3g2zPtyuL9Z4GbASeSyMYGvaCMf90oFh/jhEDYRcGh4j6SE+whw/o9S1yvEzJXf2FLA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c3b1f3-dfef-4fe3-7f69-08db19bc639d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 18:48:32.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5aORRPK0qhb/EBaVXrVvZvP/rdp51oAQpFCqyVwznD/7DqgI8XuKXFH1UpClIx98/m32NdiZGRDaqHeQYzPbln5BZQHHfjUcQeWxrAMBLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6232

On 28/02/2023 6:16 pm, Anthony PERARD wrote:
> Base image "archlinux/base" isn't available anymore,
>     https://lists.archlinux.org/pipermail/arch-dev-public/2020-November/030181.html
>
> But instead of switching to archlinux/archlinux, we will use the
> official image from Docker. Main difference is that the first one is
> updated daily while the second is updated weekly.
>
> Also, as we will install the packages from "base-devel" anyway, switch
> to the "base-devel" tag.
>
> "dev86" package is now available from the main repo, no need for
> multilib repo anymore.
>
> It is recommended to initialise local signing key used by pacman, so
> let's do that.
>
> Replace "markdown" by "discount" as the former isn't available anymore
> and has been replaced by the later.
>
> Also, clean pacman's cache.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

