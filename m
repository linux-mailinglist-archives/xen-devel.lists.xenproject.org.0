Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0026C66AC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513797.795358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJCY-0003tP-EM; Thu, 23 Mar 2023 11:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513797.795358; Thu, 23 Mar 2023 11:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJCY-0003qK-9r; Thu, 23 Mar 2023 11:33:50 +0000
Received: by outflank-mailman (input) for mailman id 513797;
 Thu, 23 Mar 2023 11:33:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIVP=7P=citrix.com=prvs=439b2ffc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pfJCX-0003Vm-9R
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:33:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92be1f9b-c96e-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 12:33:46 +0100 (CET)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 07:33:25 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB4961.namprd03.prod.outlook.com (2603:10b6:408:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 11:33:22 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 11:33:22 +0000
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
X-Inumbo-ID: 92be1f9b-c96e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679571227;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GGcAGd4mPLIEiQFi3ZEA6dMwANiYTxlbH9HF+Og9cck=;
  b=dtbcjzKTShT79auU+55WrwKGJuGLbMsuQQEdXfhs3aFKhc/iaMQNhKPx
   ni2EUW05/dHsIe725ANPukgft0A5A6XB7vnC2MRXhFISx/tDo4xMMj1/F
   nD+kpLjlKzZkqg5a5yCtTQMCtzMtSk3ZjUOlta8GV4cHcRKIIBizxJ6pn
   k=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 102421579
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sdquLKMSxvrvm4LvrR23lsFynXyQoLVcMsEvi/4bfWQNrUor0mMHz
 msYUTyHa6zeZTekc9sgb97lp0wO6JLRnNFnQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5AdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tl4WUNP5
 NkKEzoyVku4jbKMypvmSuY506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvze7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqijw3LaSwnKTtIQ6Eb+Rx84xvnOv4FcvJi0mVxiXhsW7sxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9+4FHhRqubyRDGmbr7GdqGvoPTBPdTNdIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCUFWbZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:trYS46HwW8nUSeYHpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="102421579"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7/UWVtOEXWPoprxI+er5vLKMERxL9ajt6/E3VyYUe+wdvbBbTYu6cl3bxPfKL0sbkb6ZcjixC08JjTbXIM2dSVxeXqSCHtv7aTT44NQprFnl3zZZ4HZiw8FFzg6OVeJvQY8tIdmnvYzfy3QFgawYVcb41N08WzVAt8mKQt1+9mhfvpXsMQ4rQRRTP3WgwXWZdbBAQJVQuHCFfK8AO+smjFToTs+qu27hCEVPTyF39i+ObgIY4kcNLStphQQ0YoHWA1iT/AyHYzWPn993lSr1nqK3/K0EKr8Jtc67GTjPaiFezvCzoC+MKxMNxhoMsRrsD00A+sfhBYkYWfMCtAcWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9b1cBoxm4YsYIhgQTOJKBTsVzOfORl6msFh8Qxofnwc=;
 b=lXVCo9j03l7X3xDamByse8UnvJqbFmR/QOf1qppjE6fvJvqnIqyXE7QtWJHobxX9yRHDWxt4CFMljHqJVDXkDyoFGuXqD0/YQHe0mesV1yvx9hDrorKebuekkD18RvKVVMZNr/qkHAprC8ewgz6Q4rmt8P0VIYdkQJ14lOH41Foyk/Pe0Igp2nFXIIQ7Z7Y8vbQoYl/5NSWFH4IzE+JLEPdDgfh8hpO1oRWoUoNxIqmSnph0HaBtf5fn5/A9GAUOI/mBx2xEtLjWYA6EQ1bpNSAHsSmEFiUBw9ByE9UVsrCACYpy6GlPEOqguBUWDDSK7++n1+nBB3knaklqfHtoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9b1cBoxm4YsYIhgQTOJKBTsVzOfORl6msFh8Qxofnwc=;
 b=Gts9jb2kW15lw1JoeH7xRGSYCvpBA2Z/CQc5GDiU3iHTYmB0tAKhWGQvoTyc9YND2ORG83Gm+07NbzX1qQaBTVVvqSqhkJy+jdG66467JGfNEaW/IVD1rT4UPeyvDYDrDz8xvfrjeoQho+mLpebbdhvBbo+5ROJwsfsGLjX6VVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Mar 2023 12:33:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] vpci/msix: handle accesses adjacent to the MSI-X table
Message-ID: <ZBw4/Nd2JWL/ZH/6@Air-de-Roger>
References: <20230322143001.66335-1-roger.pau@citrix.com>
 <0a69ba74-71fd-101c-2f06-2cd6ced412b4@suse.com>
 <ZBs1c7ILtkRQOzki@Air-de-Roger>
 <ZBs2BKAfoRap1CjC@Air-de-Roger>
 <d526b87a-374a-8d78-f66f-cf71537790af@suse.com>
 <ZBwku+X6dgqFqdeJ@Air-de-Roger>
 <a9fd699f-9965-bbb1-bdd1-890350cc9238@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9fd699f-9965-bbb1-bdd1-890350cc9238@suse.com>
X-ClientProxiedBy: LO2P265CA0354.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::30) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 8286db1c-9944-406c-c8b5-08db2b926830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZNoxFalsE3+/6VnN2/MhbuCMJjgBgbJIV+2kJWVefyifUtT68IVYsZ/iUa2pTuO2MxjiXWtmSREBtRW8Yu1zCIgfN2ugQo8sNXDPv/JCUAnrZ2o7tMtFl3XBR0sFFuxOVR5n6pfYXXCntbACSYmii7j0QOtgjeQdgeOErCQOEaRykb9JuJcMj+k0tkDEtziMsTxzp4EN96cCyJbqs2k4ZIZHTrTj5g+J9C5pbq5CNDWiALMjjhoqkdrrRETv9ofuzn7Qkkcl69KTR9SMljZI/knVF3wVp/OG3btyLWliRKrlNX6qzQe7MdjjulyVPkcHTcIFJLukYmzZqxlGCN91ZdzniSYaG+tUP5qUq9RXB7PrWSK46URxC1lVhDYfWtKZig4pZ0EUmEGvE79KJrxIQkEYpPbLnptg+4qQtqcP85ciphVdzJgF9kn8tjO5LWm1YygT1q0LHBnUcE5ThXE2er9AQfvRVZ7emr5ioybYpnp/9ucK+Nzoa7jz2pPhVbLdURxzpnHpj1vVd9qDL8CzQGUxCm9AP0x9cgty8HKXu2pR4FUSwJIOdX86pW97ispfe1YuBO0PieA2hcQdFPI2WjEFD9kyvr4WTvr/h+TbXkcJwOSNaaUV+1n6SH/wo4XKzFHXvVig1Vi3FfiFNkoirQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199018)(33716001)(83380400001)(9686003)(53546011)(186003)(6512007)(26005)(6666004)(316002)(6506007)(2906002)(6486002)(478600001)(86362001)(38100700002)(4326008)(6916009)(8676002)(85182001)(82960400001)(8936002)(66476007)(66556008)(66946007)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFMwajMyWGxkeTJSV1JiVE9Ib1hpWlVmUFZjS0duL0UyOWkwTmpudm1UYzZY?=
 =?utf-8?B?L3NsbEFsQWl3WHVzNWd1Skh4NmpEbGFCYm5Ta1JkeDRIbE1rZHlodFMrTjNT?=
 =?utf-8?B?UzRqMVNDTFBOemwrckhzS1BBbm9NN25mQ1Ixek1NS0I1eENwY0JES3RtNmpr?=
 =?utf-8?B?YVhiNGNKOVVzOEZheDZmTTZueG9XODlNcXh3K0pZRUJZSU5JZGFrQlVlZzBm?=
 =?utf-8?B?WWRqNmhsSWdGaG9CQk1TenhKYWZPOFN4T0NwcU1JcUhDS3paWHcvNW5LSnpU?=
 =?utf-8?B?VHdUb0h2Unlma25sL2ozc2c1bWJDK0JxaGUwZklNaUE2SHJFNW4yeGRnTEZz?=
 =?utf-8?B?d2VtUTdSVXhoYzlSMzkwcFlpSFpMZHVWQ1FJbnJJUmhjRzlHTFF5SE5UaUJa?=
 =?utf-8?B?R0czMnp6dkszOXAydXI3MzlUMTgrcjI4Yy9Sem5nM254cmJVeFJJWTlaN2hz?=
 =?utf-8?B?bUUySW02dGc2eWgrQTltUmZ5eTh3UlI3SVU3QlMweTRmek1jUVBNRkRrV2tT?=
 =?utf-8?B?djV0eHM2c2d2QnVrVFpMakhGNmFzZEp5N0syUzZCRjVISnlweGN3Y1NzQytw?=
 =?utf-8?B?MnUyWWZoZXFKdUoraGpoY0pVeUxFUjREK1VBcTFMdGRPVUh4ZWJhRnBwckQ5?=
 =?utf-8?B?RTZ2YnJOb1lJczVSZWpaTjZ2MFRMcTMxR29xSjhiUXRRbTl5RTEzY2N0ZjBr?=
 =?utf-8?B?VVJLWXNrSUs0UWIrQWhaakZYaVIrQU90cm50TmF5c3ZjUitqL2tlR2NCSjQ3?=
 =?utf-8?B?OHBPd3lQS3dQQ1AwTUVNMG9yRFp5aVdtNVBRRkttT0x4VHhLSnJsNE51OE5E?=
 =?utf-8?B?aUw3VHoyS1BuNm9rSFB3ajVOL2dmOWE1Um9zTkFyOVBoQ3M1MjhOaTJ5eHR1?=
 =?utf-8?B?S2lMOEJ4ZjFaYXRmdlo2eFVuVFUwc0t5bGUvUXIycCtOeFI4Vi9vdE04MEcx?=
 =?utf-8?B?UWlEZHJCWUJNTVV0OVlWUkg0MTdsVm9FL0xUL0RiNXdBaTJKWWIxeHFDUnJK?=
 =?utf-8?B?UFR5RWlSS1YxdzVxdS9vbXhISG40VFcxclRhbTU4VnFoY3NnZ3hVajdzMXE2?=
 =?utf-8?B?QXFYNWlZb3VnK1hFbmE1Q1BRY216QXJxZVBZbmZGQzNMcm93dFFmWGRnL2dS?=
 =?utf-8?B?cTB0RHdLS25aVTQzMG1nUEhZMCtKTHZyRVlVTUFoSzNuWlFSS0JIWHFCWTZn?=
 =?utf-8?B?SUd1elprUG5LV3d2Vk53YXBCbGwvTlZqV2NjWDV2SXBhNnNDYzdwY3dIZ2Vk?=
 =?utf-8?B?cjFMd2tqZktLbVcwYzN0UlVaS0JaYjQ3ZUgzNU5Zc1JOdGtSRjlKT2NOaUZw?=
 =?utf-8?B?TDFHRERwYmJITlJ3ZVpZaCsvN2pPYmxkRk0ycFRNcldjMmtXQTcrSmM3VGpE?=
 =?utf-8?B?blpmUUtGYWJvTFVCRFJUQTFXcktDWk1FMkJlYjNIdG5YRjl2R2JEemU1Zzgy?=
 =?utf-8?B?Qi8rOEl1WmliNGNTb1VyaU5vakMzNkZNdDRkNTV0Yy9rdjNkM3RtN0FhSWpH?=
 =?utf-8?B?TEsvREZoUTVicTZZZUxEYkV5U0M3OHpLNUNZc3l2UHNVTWxvektrbDRZUFNZ?=
 =?utf-8?B?cmIrSUoyczRTNWYvNG1oekFaVkRrczFKMDRybG9QVmdUdDJkdXYrK2czZURF?=
 =?utf-8?B?Z1R4SE5JcUx3b2o4Z01CKzZ6K3dSN0pVRFFJTzdnZUhVZyt1Z0g2c291ZlFk?=
 =?utf-8?B?YVFMcDd0L25laDZCU2dMRHh2dEhpNlBnNVhyamU1RVAzWUJ0TEt0L2lHbU96?=
 =?utf-8?B?YmcvVVN3V3ViRGFYUllyQk5mNVNrSTJFQ1B1NUlDQXVBWXdrZEVzNTY1ZGk2?=
 =?utf-8?B?S1BSZ2o3dGt1bWRnM0x6c0JpTW1DUFdISUw3VFB6UThWdTduVjR0am1WWDVp?=
 =?utf-8?B?ZlJ5QjlpeS9MZEo4THZvL28rSXlDMUVVazdlcmZidlBFWXhrK1d1S25sUGlR?=
 =?utf-8?B?akRWY3h2VFBQVldEbW5EKzZKNHZNVnZqWEVVdnVjeUN5VyszbXBZNEprQmIz?=
 =?utf-8?B?ZmFadmxNZnIzUHc2QVlmRzlDYUJ3M1pRTXhxeHNZOXYvd0wwZ0Iyc0lLYXJq?=
 =?utf-8?B?ZVZpZlRnV2ZBQ0hvMjhGMHkvSXJsbFlQMUdKeWlUci9vTlNLN2FETnU4MXhu?=
 =?utf-8?B?dHllM0pnWkZET2ZGYlNTTEZnMTZPZjc0bEVpdGZzTFZEaFRHMHhPSklpejk4?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lNYnkLxPFXwWv1IZ0bfw+nz1/W/9n18gwcgSJCF35AlCj9Ff6GIJr2kJ7Xnd8qliIqdQS2ENH8jvQUIARf1OaWG8S0J77MZd17j+43hpeoWnt5hzr1hfhAMslMZ0ecR+v5hl40Apgr2bELL9VfdjPoZLkisUslDQjWSIrntmbpkaswEV72jkpk3Rx9/F1trbEfyuMMWjWVUQU5TGHk8i9yJfya8xDQWUAHjI8lqukkAAcMwxMIQL+vEv4HBcAPQUbyfNMadLBRZwlPWZektqX+cUzOxl2/JtE6STgedaqgx6uvQW7twSC8/e2gA8m5MNQD+bcCVk4o23hOTKrctCAUQkcDCMT5nOQR4XvcY+68F/lxuuRRBSvWuhDiOnV9OvAGcWmsNxfzsYuzSU7sg1MT3JkAlqEb1ZX3aCOmAHTvXV8UYL/hv/u1mt04/HeFUYmCYw24+yis/7KLprKvl7Wg7sCU62HMGEKw8Qu0A19y3TaZ5R3QicCOym7GQN2pBzcxAjB2owkNj8cYAolJ76OvzRr9LKM+7NpdqqPPYVOBH5DTExRfJdkvBOG8UcYL+6YFTDB3JhELgqv4fO4NMuVFCj3xHb2WNzidxlse53te5k7l8USsWM2wjUHdO1JNPEs/0NIscsIzT9VrMpZCuNGH5pL3QrKM7GCWNPlL0Zn363N/aXb1YLC9gIaBpWHHj+j3OCkmw09m384cm0KvS2Je6TdTaQzv/rM6Nqa8KJj4s2MYhKWVj72fnK8d+ymxN/dgdbg6u1ECNkeeh7F7gzeOS8IuVgloonACZaOeARNUStnQ8kHR057BzR5Dza5clM
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8286db1c-9944-406c-c8b5-08db2b926830
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 11:33:21.8960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISG1qHr3yTNsIeaBqmGAyv/mRsw4HM5Ur5yfT4paGrgYiXETFToHqTPlBHJF9wpSb1Q+pt2wkSzJzd0RafQFMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4961

On Thu, Mar 23, 2023 at 11:58:26AM +0100, Jan Beulich wrote:
> On 23.03.2023 11:06, Roger Pau Monné wrote:
> > On Thu, Mar 23, 2023 at 09:02:31AM +0100, Jan Beulich wrote:
> >> On 22.03.2023 18:08, Roger Pau Monné wrote:
> >>> On Wed, Mar 22, 2023 at 06:05:55PM +0100, Roger Pau Monné wrote:
> >>>> Not sure whether we should consider an access from when the BAR was
> >>>> actually enabled by a different thread could still continue while on
> >>>> another thread the BAR has been disabled and enabled again (and thus
> >>>> the mapping removed).  It's a theoretical race, so I guess I will look
> >>>> into making sure we cannot hit it.
> >>>
> >>> Hm, maybe it doesn't matter much because such kind of trace could only
> >>> be triggered by the hardware domain anyway, and it has plenty of other
> >>> ways to mess with Xen.
> >>
> >> Preferably we should get things to use proper locking. If that turns out
> >> too hard, properly justified such an exception for Dom0 might be
> >> acceptable.
> > 
> > Right, one idea I have would be to use map_pages_to_xen() in
> > vpci_make_msix_hole() to remap any existing virtual addresses to point
> > to the new physical addresses, so that there's no unmap.  I think this
> > would be fine because map_pages_to_xen() does an atomic write of the
> > PTE, but not sure if it's abusing the interface.  Such remap would
> > avoid taking the vpci lock for the whole duration of the access.
> 
> Hmm, no, I'm afraid that won't suffice for another reason: I think these
> mappings need properly removing, and already at the time when memory
> decoding is turned off (hence a potential new address isn't known yet).
> Otherwise we leave too much of a risk that these mappings may actually
> be used when the address range has already been re-purposed (even if I
> think with how the code is written right now there wouldn't be any use
> in reality, but relying on that going forward seems overly fragile to
> me).

Keep in mind it's only dom0 that requires the mappings to be updated.
Hence dom0 playing tricks to read from such addresses when memory
decoding has been disabled seems like an unnecessary hassle, it likely
has plenty of other ways to do so that don't involve relying on races
between memory decoding and BAR accesses.

For domUs the address of the BARs on the real device can never change
while being used by the domU, and hence the mappings don't need
removing on memory decoding toggle.

> I can be convinced otherwise, so let me also consider that case: One
> prereq would imo be that bar->enabled be cleared before memory decoding
> is turned off and set only after it was turned back on. (Unless again
> we want to be forgiving with Dom0.) (Looking at modify_decoding() I
> also wonder why we invoke pci_check_bar() even when we're about to clear
> {,rom_}enabled.)

Hm, I see what you mean: it doesn't make sense to keep the BAR mapped
into the guest physmap if we then turn off memory decoding (or ROM BAR
enabling).  We need to prevent ROM BAR and/or memory decoding from
being turned off if pci_check_bar() returns false for any BAR of the
device.  Let's keep this separate from the issue at hand.

> 
> As to (ab)using map_pages_to_xen() - I wouldn't be very happy about
> playing with ioremap()-ed regions behind vmap.c's back, but I agree it
> looks like technically it would work. In case of future issues we could
> introduce something like vremap() to fiddle with an already mapped
> region (and then perhaps also only changing addresses, but not
> attributes).

I have such a version, which obviously looks very similar to v3.  Let
me try to finalize the comments and see how it looks overall.

> Another option to avoid holding the lock across the entire access might
> be for get_table() to actually acquire a ref on the mapping, with new
> mappings starting out with a single ref, for vpci_make_msix_hole() to
> drop (in place of explicitly unmapping). But that would require further
> precautions to prevent stale mappings to have new refs obtained on
> them, so might easily be getting too complicated for the purpose. As
> would (likely) any other attempt at serializing this properly without
> holding the lock. Which gets to ask: Would it really that bad to hold
> the lock across the entire access? Or could we introduce a 2nd (per-
> device) lock just for this purpose, which might then be an r/w one?

Adding a refcount or another lock seems like too much for my taste, I
would start by just using the vpci->lock for the whole access.

Thanks, Roger.

