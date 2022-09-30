Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510E5F0A13
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 13:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414164.658303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEA1-0007bF-Fn; Fri, 30 Sep 2022 11:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414164.658303; Fri, 30 Sep 2022 11:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEA1-0007Yl-B0; Fri, 30 Sep 2022 11:26:29 +0000
Received: by outflank-mailman (input) for mailman id 414164;
 Fri, 30 Sep 2022 11:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6brQ=2B=citrix.com=prvs=265c464c6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oeE9z-0007Yc-Jh
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 11:26:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b70c2bde-40b2-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 13:26:25 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 07:26:16 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6393.namprd03.prod.outlook.com (2603:10b6:303:120::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 30 Sep
 2022 11:26:14 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Fri, 30 Sep 2022
 11:26:14 +0000
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
X-Inumbo-ID: b70c2bde-40b2-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664537185;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Tt1bQpVV3h3z7//rg9HjAm52F8uM0cKBWpBVCs5ZJW0=;
  b=Y6zKSiSiXp9XnRo6+o2hpdfcBiXhExcVckzUXUT0zSeJvXCAjEvqPpPF
   HVtoCjV6b1vq3a+iVftfA4lVPKiBJ0D+80wYVJiCOVLXHYojjbZ+kLFO+
   h138lmwExH3QR3q1uOwUxNSUzpERRnzuRP9oON7zEOuJ97+bffaz6GVJp
   s=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 84217873
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UaK/QK5sUqTWga9+8puWCwxRtCPGchMFZxGqfqrLsTDasY5as4F+v
 jEdWWiAbvmMNmLxeI9yOdy+pxkGvZfQzdBkHgU9rXgzHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPYwP9TlK6q4mlA7wdmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5KBz1I6
 c4UIwwWc1Oittmkh7emFPtV05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iLw3LaQzXygMG4UPKWb0PEzn0XM/zI8UjhHSFeG//m/lXfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoOYHECRA5cud37+ths1VTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:/plNIqAm5XzuKP7lHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr18jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvS/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kda11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtZqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW/HAbgcYa
 dT5fznlbdrmQvwVQGYgoAv+q3nYp0LJGbIfqBY0fblkAS/nxhCvjklLYIk7zU9HakGOul5Dt
 T/Q9pVfY51P74rhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="84217873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3nogbHadWH9TygPO1iZsPy7/jId0l/OXIKKc6r6by4n48Gxxql5n1Dd2O4o37HrkGFT8Fom7Fx9ziOzFCMQXuwzdvzb7PD5I9nTkr0keF8N4RQv3HA5FmS8Vh+BysFKTt0fzOMUgG6mWynSchSrD9DcrWute/XrVChrXo1coeMhQJebsDEc2pJK0e4uCMmG3iVA4MygbhabbuAHGcMt4QwBL6gnPqBVa/39IOr0asAXdGgrEDWMtrbdog7h5nTYSSbw0fV1Et3C+F49wu7Q4LrqXrmYa71QIWhdgSlgshaCVyIUkE8OIuk8hhFiVDlOWHBCYU+9c9yRuSdqv6Mrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIVZAUxhb/UXh54YljxTBVUeQ60jqhMwKGiOgwkAB7Q=;
 b=c1QjcJKEcGXh7ZJvt+Ul52i/y7CemyvEEyKapQOiQdtmYPLm98eqiZk09ANpOjodQF23cxr8lZo19dqdv6DiIxNESHkfSJ9Ki2hnIfP0sKR65ls2907K1+jG4bfKEmY5H9TMcX/C9YamvLGdHSyP1mQkrFYJyQB/EXNlY6ny/EbdkgBZa9LOW0Z3CYBObwoqCZXdBbYJAV6ptR7+Cs0L/sAH8bGpm9Qi15HTBYLO5X8j58pZmFcfM40M0riy0Rj6ja/BFuuKKRhOp1n+3ZinAdDm8njqtvhUNeiG0JAisT0gZdTb2ESQk7opm0LLc/SlxD9Dq9DEMs5NqLQngrCdog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIVZAUxhb/UXh54YljxTBVUeQ60jqhMwKGiOgwkAB7Q=;
 b=Om6uhJzLJ8LFt+egYGufYSZjFr18bt8xsdnZvp5cShxEIO9qqG0pRTeccMhwcvNv49Fu6DdJyceKCoVl8h3iWW86xj8NRD0enRZHZ6knGTUvMj4BvdtBBELK5oOjdeYCF/il9fnZ1ZpMXT8gxAAwCo3XAB0vZo4DOWRhqzjv9Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 30 Sep 2022 13:25:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/NUMA: improve memnode_shift calculation for multi
 node system
Message-ID: <YzbSKSQD8wyOTXsk@MacBook-Air-de-Roger.local>
References: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
X-ClientProxiedBy: LO2P265CA0222.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f1fee0-85f9-4fd7-a220-08daa2d69592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eMzc20VeAfpZpPHqXTqbKbd38H1Q6+5NtOWk6rE7Hm3aOti0wnyRtXoyQPSKAOpFX06gOR2Sm7G4Ab/RgR1zYFcgO6my0IeH9tgwjR37S3GAGKZPPbdpiwa0cb1f3WzWFuSHanI1rwzi/cRMRcaA9QRd69Q0vaXHMibukDtObDaKJIUW0XaZ88vpCwkcfp1tvfBnRMyEa2i5/UFkPMtL57AHcsbqA+Pd8Dpw/PSCIy8/J+ovHy+H0z6XKKd1Qka5xzvh2isoHuYSawRU3HVvJ82SGrL8M/vauLbjApNBQCus7MqIlgBGOFnpNFmVYFvMIpDTQqmOExRhEPkK6fcwsdnw0v8nstjQrC7bcqMwsbOaUw0xOgC8Zw06LLiE4X9FZ4CzHnAGhegH0kL1vrUzUjDsqakIVOdWL3RIcF+D1pIJkEKQiy/ABEGRkJ06JlaJ4PYP65pY0k1MiXrO0Sr23dFx3z1xDilngbA4JwW92axI5o/6hXgQDX9yydf87v3/WxfNwYc/roz4Ea5DmxQt8Dr8ler8reaaDm1GRD/+mBDt2VdcZAMj6jH/w9ypC9WKme0Vvx3ZoIal4VtsVpJUxTqqxNgMepvpinI54LOrLytoAiBRE3aHsx0tY9Bs9aGoL+gWPvBVtmmDrp9IG24oCDbT3QgqrnpRbxDly++3IFMJWW6HnvdgPL+XYg6gEHey3zL1VTx4mM9xjqVuolJDIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199015)(6666004)(54906003)(9686003)(86362001)(38100700002)(6486002)(316002)(41300700001)(8936002)(83380400001)(4326008)(85182001)(26005)(6916009)(66946007)(186003)(5660300002)(6506007)(6512007)(4744005)(478600001)(82960400001)(2906002)(8676002)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJQRU4rOWwxNW94ZUVETlowSzRNZW5mNlluR2ZPZlo1dUk4K1VFekZLODYy?=
 =?utf-8?B?cTlFWC9WbWY0dlZOYy9HMjl5VzBlSFJSUkpoNVpsVkFWSFZuajAxc3lRem0v?=
 =?utf-8?B?bzZJblN5dUh4WVY0bHdudkpVL0s3aGpMT1YxN2wrRlNjN2hPOEQxUnpoNGtU?=
 =?utf-8?B?QmE0bVBnVUsvY2tYb3pHYW1uWkFqUldMY0xnTVFYdzI4cnI0MmdmNGpYVUV4?=
 =?utf-8?B?WEZDRXNVSDBHcE8vcTJhUTVvNUFtaGRlaDhKcWp2VllNZ0FEd2NIbG4zeWI0?=
 =?utf-8?B?VHlseUova3FmVll3OUh5Q1BtYlJvcEpkSFFaRXRsbXBVWUtycndpUnQ2aU9p?=
 =?utf-8?B?NzEvWDlTMzRzSkx2bHM4VjIwTEFueEVkQTJ0VEljQ3p2emNqRXZQZWd0WEFs?=
 =?utf-8?B?U1BRUWEzOFplMVh2VTdURFJBcmRUZVpHcWNya2hjdGZBbFFhN0s3M3VWdzVh?=
 =?utf-8?B?VHVQZWw3Wmxnc1kxY2laSHQwRlo1Z1NQMkgzNWxmWWppUk1reXkrWkxVNzdQ?=
 =?utf-8?B?YkVyQk5UejZ6RjlrOUF2dzErSnJyRzc5TXR4VGZiM1RDVFZmSE8xbDRjTEFx?=
 =?utf-8?B?UW9UaVpGbnFaTS9NamowQUowZjdFVGsrVG9NTy9iV3NCMEJ3WlhTQ25QalQx?=
 =?utf-8?B?dVRDZFZlMUxKNWg3aFRYcWRZY05XWDZSRXBnek9GYjJ5b04rdldvNmRTRlJy?=
 =?utf-8?B?S0VlRFdYUVJNdGh2eHJacHVXT1E3V04vOFVyeHcrRTh2S1FkbjVZeG84VWtB?=
 =?utf-8?B?dnFqTGkrQWE3OUx0SXFmeHN5cXhFaWZwZHo0cjhoRHdYQVh3aFUvMGZVQStG?=
 =?utf-8?B?THZ3MnJjcVlENHBYWTVhemdvRkNhdzVJano1b09NbDlhVkEzOXg2MWVKUTNO?=
 =?utf-8?B?dVB3Z3FmWEU3SXZMbVNvVm9UMmY5R1dYSkVrNGtIZWZnVzRDQVp1WGdaREtv?=
 =?utf-8?B?TDN5dllsS3l6MnpvcDhkbzBKMExyMmhzK1dGU3R4TXRMNDRVK0ZLSURETjJB?=
 =?utf-8?B?UzFPMDdyWC9wTlYvNUJ2S1plcUxxSmxkWWlEWTF1ZWxuTDFBdkNsOUhMT2pL?=
 =?utf-8?B?Qm9La21kaTV6WjVxL3YySGUyUnNyRnJMdlEwWlhvZVFoNDdHYlFlQ0NCNEo5?=
 =?utf-8?B?R3pTakxmZHNicGYzQ3NVNEF0V1I4RFRqUStqVDErVXBldkhaWjE1cGt0a2tN?=
 =?utf-8?B?ZHZtVkxIbzlyOWZCSkQxR25reDMwUnVEMVdxc215cllHejJ1RFpNYytFSDJG?=
 =?utf-8?B?SndvQzd1alJkbjdrUGtORGZpVjhVVXpwVkZIaDFzdkJvYlh5QVNSemxuak5D?=
 =?utf-8?B?RWxTZytCYytjRWFmN0NSOWhueDNxZUtjZ3Vmb2xOMDN5Si8rVzFtcDBscU9U?=
 =?utf-8?B?ZG5TdjJuVUowc3Nndzl1Mk14MjNMaitYNy9wdjV3V2hSR2w3blFmT21LcFF4?=
 =?utf-8?B?N0o5Y25UWFRiUyt1TldBMXFLOHZ0VzZ3eXowVjIybG9iSHl6RUkydzhxMUV6?=
 =?utf-8?B?Z2cvWG1WVitPTExQQndMNVZ0R2c2ek5Vd1BjcHFDbDBtYWsyTUsvbjdLeTZa?=
 =?utf-8?B?N1pIY242TmVDRU1Qd1VhSDVCczFqUW55NXJiWjFjaHphSmtRN01vSEQ3U0xY?=
 =?utf-8?B?NFJWb1YyWTE1dXZRcnIxdktxZ2FzZE9CdTdaR1p5MnBHYnowK0xGcERsKzla?=
 =?utf-8?B?RUtJQkJxaVFUbVBUMFdURzBoK2xNMHRIUUJ3T0RyRk14dU52VkZ6djRRVkNm?=
 =?utf-8?B?YmlGSVFoYlZ3dlFFM1pXeE1Cd29vV09lNHJWcDUraFQ5cGhEZ2NIUXJZUFBC?=
 =?utf-8?B?WVF1R05DdW9raXVYb3dhMktrMkNZOFlKclllZFBFd2x6ZG5RUG9YaWFFME5F?=
 =?utf-8?B?YzJITW8xcEN6RnFKNUVrRTc2d05QVE1YM3BoS2x4T1BsZHdSWmIyVUVoQytn?=
 =?utf-8?B?OFFZcThJckRleEJwVlhCK3d6UVRyS2FOTjRja1JoVjVwVDNPK2l4TlpJY0Fo?=
 =?utf-8?B?MGRFajVIMWh0bG14QUFjVlBjdVRQQSs0S1ZoY3dTdzd4MW9jUkQwYXAvOWpN?=
 =?utf-8?B?dnBYZWtEcFFXZms0eGZXVzBpVEhBQlc5ZEsxL1hMbTN3dzlpdW1CU0xLT1p5?=
 =?utf-8?B?K3ZsRExIUGNxT3dqSzJRT1NubHdFcVZFR1plbGlDSlk1Zkg4c3R1cC9YRjRi?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f1fee0-85f9-4fd7-a220-08daa2d69592
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 11:26:14.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJjvWVuxSuZxiFdw4r/p/Vvb7Q5XcJTZeWNLpyLXCWErxb2V8MAeeDPHng1Drq5xeQ0r90KP4lDIR1EUVjXcVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6393

On Tue, Sep 27, 2022 at 06:20:35PM +0200, Jan Beulich wrote:
> SRAT may describe individual nodes using multiple ranges. When they're
> adjacent (with or without a gap in between), only the start of the first
> such range actually needs accounting for. Furthermore the very first
> range doesn't need considering of its start address at all, as it's fine
> to associate all lower addresses (with no memory) with that same node.
> For this to work, the array of ranges needs to be sorted by address -
> adjust logic accordingly in acpi_numa_memory_affinity_init().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

