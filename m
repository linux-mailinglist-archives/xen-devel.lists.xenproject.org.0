Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED0F6CEBA7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 16:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516303.800223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWwN-0004g4-3m; Wed, 29 Mar 2023 14:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516303.800223; Wed, 29 Mar 2023 14:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWwN-0004dF-0s; Wed, 29 Mar 2023 14:38:19 +0000
Received: by outflank-mailman (input) for mailman id 516303;
 Wed, 29 Mar 2023 14:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOlf=7V=citrix.com=prvs=445effd08=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phWwM-0004d6-15
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 14:38:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d119c6-ce3f-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 16:38:15 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 10:38:10 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6375.namprd03.prod.outlook.com (2603:10b6:a03:399::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 29 Mar
 2023 14:38:08 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 14:38:08 +0000
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
X-Inumbo-ID: 54d119c6-ce3f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680100694;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=r9R669TM5cYwzzypIODXW8RNpEiSdQxFoV4avACRF38=;
  b=fPOsSlIXhKdUdji0ms6A95wSh+c99piTcODombxklvGNzrQuLxysUXCb
   gMpWddmkDMbTpbKUqTamzLqtgwbpPnev2R6oKpvpfkKN0BiYp7bhiAkq8
   /kaLePkj0Y34t8XA34YVdZcYsjCn+FCMmq7+3+nVbusJ0swf+JcAkQTT5
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 103446127
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QIyT66wUPEFo40mZprF6t+cQxyrEfRIJ4+MujC+fZmUNrF6WrkVUz
 zAbXmmHaPmMN2GnctF0bIS+oRgBupCDz4c1QQE6pSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6ET5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWdD2
 aJbOhczVEGens6/m4zqSPM3t9t2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eUwX+lAdhNfFG+3vc7mWXDyk4xMgRIVwWms+u7t3++A80Kf
 iT4/QJr98De7neDVdj4WBuQoXiavwUdUd5dD+077g6WzqPepQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxQ5eIgAQJG4GICUCHQ0M5oC6pJlp10yeCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb+D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:KH8Etq/dVigruBzbnZNuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="103446127"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHWDeFPDcgCPPqmK2Ux8B2L46EZ9Wfypg+7Hcc6uw/34+pUlfx5znkhqvuWZSMwPIYJUZPzy0L6ao96raOyXWIEOM6wjvaRq9hnDL+qVsmoM3ENyTeKos24DfIJMPNxwtwo4yWTYu2sXdH6kY8zWyDrDYtSWiKYJX18/C2pHWZ7qKPWBaUD4zlhIoh3KT/7rmANqOwVhTEnCSMABmn+/Wr8E6VbvqsrwfkKtgEqEtGh96pAioypHNDrCNJfwvPzwZMvNMDrLElBlNUSY7nb3iUJkl7vRnQpxUzFoTW4Smwmr3KP81E6HOStD+6xOgTl/647/NAKSul8V5UgBxhUblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkfeY+F2wGcHsJ1OmBQV1K3YmSGvL5DFvk9/rD+vxSw=;
 b=Q7ZM71ZfAihvFnzpegJYzRYDz8vWIC/X55VPdVgN107lqtQxgn6ML53ObzvqqlvscwPa+B/JLvpCq4SnfxgqHMqMlJUjBMie9pGbJA3FA/9QZWDPR3YeonuW+Gd5dNiO/G/6AWJScWEXEIed0sR7EW9EqAGcyohweOSygsCQitg9YJYkFqU1mES9n8U6r20nbmjp527zLeRfBx+O0nLex+d1iQnwdTEcOfKMhSgU7XSgg3SSil0WLZsTtr7Cb+nrWaMUfXbyGEra8v1XOooA+6P3u4Th+l5yJi1PuDaI8BDuuLWynlE652X6K0iMjbGAeKYKXdlVQGtSTTqnVRuC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkfeY+F2wGcHsJ1OmBQV1K3YmSGvL5DFvk9/rD+vxSw=;
 b=eZG243xXKb8yet5pnp33Fdbc2UE30qekdyzCww5xVg4SyMHf5BZ5mNCP6CoVq1L6EzteldxSpZ0oT6IjMs2wSLn18UIxQafAD1yFKLNG3hSKGQMOIg/w+tqq7cM4Umi8NtNwSYvoChKMGi0lRXz2jwZP+wsGsjs5Yr1ytMncWYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Mar 2023 16:38:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S0ix support in Xen
Message-ID: <ZCRNSeQzfYikJMmG@Air-de-Roger>
References: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
X-ClientProxiedBy: MR2P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::34) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: baf0a0ae-617d-491a-6278-08db306336a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Xi43IbGgcsYdsAt2May3f0l2E6oEPhytPpd/GrvWb3D8T24CXE3Nse3yDuWZHR8rZxXSxh68twELHRFftSqeMDnBAoWur0mFGMeOX3Rh5pX7+/z8OFmO4v33Z9tZyhue2CkvLTfKE1S6OKYh5+skFNDa8UmOLFvKT7kdZVpdqbeiSz0ZkRk9ZEr4vjnyN0g8AZh83oDhagWhrrvmSVj3+dK1xMkIw16/UNsDIQZDRf5Q6qBE2rszm26CF/J/kpKql3/dlQtqqJnNIp8oeS5fubwq6Wdzf4kZGbVBxeeaXsNlkintaaSbpRltmLCJOeqanGjEEKolRou0BcXJO7sk6n6oxnndi3xgU72xY0dUNTVDsXcv1fjFFJ2diJz0C6AsE3rT4qEipFlInXWSGhB3TjmRXWGuypFiaBeRPRnogL69spHufP38x1SV6nRr+R8ZAfYKAAU7OFoqevZE2z/05AmHO8wuyLIqocZOOoNkp1exeEat79E2jQgH7bEY70eF8aX9qrPMxI1sb8wCwb4Hk9O9PSKzom+R1AWjopTZoK2oqUUgSQGWViJ0EfMjG+O0Ax+de8495TqCEDPEUdr8ewsgZQXVapuoY84jb+zzEjlnmzMTJGj4eJjdM6IVTB023rD46WGyeAGu36OjEjZRSxcmxMW0uJwv608zonnD7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199021)(66556008)(85182001)(26005)(6506007)(83380400001)(478600001)(186003)(8936002)(86362001)(9686003)(33716001)(316002)(6512007)(6486002)(66946007)(5660300002)(66476007)(6916009)(38100700002)(4326008)(2906002)(6666004)(8676002)(41300700001)(82960400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUg3Y05lKzlocHVBM0h6WVJINVFRdVBZa2hPZ0RXSXhpMlNZakZ0TCszRVF5?=
 =?utf-8?B?b2hLTXZmZ1l4WWYvcVh5RXRtK1h6eW81cWhZdFpwdXB3TlJVL2djeFNlRHVB?=
 =?utf-8?B?MVVxTFY3aTNybEhyVnVyeloyVHkrZnlOcFVpVXhnK2lUdkNkR2FMT2U0MVVP?=
 =?utf-8?B?SHlndHRwTUVkcldzbFBtNTRTbEJYVmREMnRiK1FSU29NbDhwajA4MXBKcmFJ?=
 =?utf-8?B?VWc4TjFyRzRXdjhVNFk4UzVGSG1GTHF3aXZlRkkxM1JVWjlta1VDUmR2blJu?=
 =?utf-8?B?aklud3R3WnltM1lKR2tQaXVURFNyNEwvcklrY00ydFZhWWFUbHJmWnN3bEtI?=
 =?utf-8?B?TUE1ZFhIUmkyUDNOU05VZWU3Y1BROUZrUjlSREJNbHZnYVd6OGhhNWpzRmZC?=
 =?utf-8?B?eFZqb3BvZ3VITTFaTC93R1ExVUlYcUloWUkxRDZGd2tXeHYyQWpVeWZHMUpt?=
 =?utf-8?B?ZmNVeUVLQVdDSHBndGxrbGVXeG1TOE5RV1hTdWQrRVBpeVQzK0lsMzJ1aFdR?=
 =?utf-8?B?TFR0Slo4WTIrS2t2dkJ0bksvdXJXSEJyWTNaVDc2TXBlZ0VKd0xvdzZTcFhC?=
 =?utf-8?B?STVCT2MydCtaalkvZlZnMkJrVHEwaDczck5IdXpGZEVLam1GSGRZSUxqTFNh?=
 =?utf-8?B?WUNDVHNBL1l5aEJsYkZxSng1NTNXUXcvdjIwTEJqcE9YRTFrY2NzN2x4djNr?=
 =?utf-8?B?R29WNlpCb0s5Mlkyd1ZlZXlOQ2Q3TWxkcnhidVF2UlhWZTBWbWZWV3hXM3Rh?=
 =?utf-8?B?YXY4cVZ6TWkrc3gvSEhvQkhISm8yQjgxUm92WUUyT2J2K0JjbGdqMExpa2lV?=
 =?utf-8?B?T0RZOGNHb1dKWVJ1MkNNVlZrbHpybEZJdHJjRS9hVkdrcHozMUx4UzhuNmt5?=
 =?utf-8?B?UXJoV05tK2RBbUEwaHV0Vm5hR1I4ZFFSQkh4ZnNSZjlIWk1HSTZVS1NBZFFl?=
 =?utf-8?B?MzJVQmUyYVVxSTJ5SGpCUVNyYnVkdWVLOUkzby83Uno2VS94YXpIMUNzZHIr?=
 =?utf-8?B?K3Y4ZTZ5UEgwRE1DMDFBQkpiOS9ZSEFmREVsWi9GTFR5RU5jOU5jUWt6bjU4?=
 =?utf-8?B?aldBMXJsQnZMR2tnRlZFcHJsZTJZckxTa2pqOGY2dkk4NFJOZVZQRmdoMURG?=
 =?utf-8?B?ek9ldWtEbHhTNFQ4OGY5VXNHMzBQanhnRExoVUZxTWhvUzlNL2syUTlIbWhi?=
 =?utf-8?B?TzBqOVhVUlhLWDZXNVdGSkJpRlhiRkNWUUdZWmtSYnRrZlkzMkhkV3RteEFG?=
 =?utf-8?B?MGFzWlloeUNjR1NWaDY4bmtBRVg0TWJNZitoS1k0VG84cDJvMDZneis1UmRm?=
 =?utf-8?B?bmd0UmRoZ1RxUXV6N21yUHFkMXhTT0VaNGZyMmdLM2hxWGRuYm1rbmsrWW03?=
 =?utf-8?B?LzNRQjRkWTdReHpCcjRRcC9HbWoxUWJoSmM2MFBaNWFCS3ZrYy9XOWtMUDNP?=
 =?utf-8?B?TXU4TlUyc3lKTmQ2LzVCWkZLeENMQzVLYVV1blhWWmlFa3ZBcVk0em9XQ01H?=
 =?utf-8?B?Vm1jaFljaHRqUFRlVDkxMVFOMFN4MnN4OWQvQ1BBMVBuWEpCYWNkeE9BMnFJ?=
 =?utf-8?B?bkpSK1VkVTZDNXM0aEFrUWdDUlhiNXJFcEJkbWFHQm01bkhWQW42Q05sN2F6?=
 =?utf-8?B?OTIzL2Y1dlpQZFdmK3ZUcnBDVnU4elEyVTBUZnM4Z2p3Q1ZvOVYzY3Y5bDkr?=
 =?utf-8?B?NTJ2bC8vT3dDVDM1THE4d1dOczN5N08reXdJQUZFSjZUd09pQ2srMVpXUE5L?=
 =?utf-8?B?UGpLUFl3Sjh0WXlWWG1keXNyaFdEbW45dWx2d05pODhtbWI4S05acDk3dWhU?=
 =?utf-8?B?K29IRndrYWFqeCtod2RLUTBFdlV4dDNxSlhNUlE3TW82V2ZDYTVuc2FqQmJJ?=
 =?utf-8?B?Ym1hTFNidnlCWE1Eb09DNEVmYVAzOGhUdUJqcGhnS0Rwb2czOTU5bEEwaFh0?=
 =?utf-8?B?cks2bGV6dXlic2hBeFBMR0NhaDAxNzlnMGxoSmV1c1ZwRmVkMTlaVEViUmpz?=
 =?utf-8?B?eUlza24yOWo0WktnOFpkd0RRbG50bjVONmtROEhBdTZRWGpWVnBIRFFEVG1W?=
 =?utf-8?B?VTJLKzQrNkFoOG9iMm9JQ0Mrcm92NGZoSmMrWUpiOUZ6WDhyaHRKUlQxdjlr?=
 =?utf-8?Q?Lu1uIXuxykItFwyeyLknb8jlO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8OTOJLhJt3q327eAIl0VxLBuQzLf7abqyfHQ+X0WH0YYk/Kfr9aVb5XbI9yuLL3HtuBxJ9JJj9MWXC2b9dDaakTGNAouCUdDEpBZl1RMwhtlfptPAWtlzQjCFegteiJ/sV77QmIVMLDbHO9WD0q0QbZVrkwJ+4YpEt2uASPAxQ9QxwtLv3bV4dgu2zMeq5PhIVMeAnjT+Sb711QhgQGqM4MmlfO4ZjKxEw1WiJ7ruhsw4x9TFRthnRCxR8nWNVH0iZKCYkONqohn/BahrNrYSeqbF7+XJcs6VYg43lRsVB5KJfXCL2y2rftsIUk4wyMYpL4rg1uNlkStUpWWeukhRE99+T5yfhQK4/tvqwst4RRhJpNgcCpEZmVtQa3544kgGp+Oak6Pahe4BNAr1XCaD1OIAWNYp7fO71fsQcJNIVLgnv25qZp9oaJt7O2xYfSutbMlYqKgpnZR7yK2pRekqgWcfscPf3JSaOF9ZrebTyJK8YCVhRKUzVJb/Fvlh5V1eLsKfl7lh5SL32WFkybJ8HDbnkyw7OMVF7ReHmUlHVVXZ9gEqlUgcj1Lv7s6FOoyst/wxjsAz5km9tnlXqJNCC9ISf/bgFydFAeBEhucGBfYj4K+OR1mZhODKeZsnyBTblqilcZ0xHaOcOqcfDqD+HKOwPw5Y3HuqanaVXg8YYAgrZgAf3aEn+1bygl6XQbBS/19qFxW99kscMp4OYhTNnaADsIFyn/VcOXRnnoUhKHfMSZTjZSwagusUxxWVBm1uLZWmLLrwsmP0FIBTN1Wd9n6KGdKVPY2JaYJqL37zNFeA0lgReCEuCXfSX4AdZi5U513738uBtBfrbJ7w4jpXg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf0a0ae-617d-491a-6278-08db306336a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 14:38:08.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4svUbNGeW4TLrtSBBfxyJUSBN1ytUCc6t1HQvaMWZdEiwUXLYVeULRy6dI9irZx01vYbznsJE3SV0GARDsftwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6375

On Mon, Feb 27, 2023 at 12:48:03PM +0100, Simon Gaiser wrote:
> Hi,
> 
> I have been looking into using S0ix with Xen. On systems with with 11th
> gen (Tiger Lake) Intel mobile CPUs or newer this is often the only
> supported suspend method, thus we want to support it in Qubes OS.
> 
> Below a summary of my current understanding of what's needed (and known
> unknowns). I would appreciate some feedback (what's missing, preferred
> solutions, etc.).
> 
> Note this topic is much above my previous experience with Xen and x86
> power management internals, so sorry if I'm missing things that are
> obvious to you.
> 
> PIT timer: During some previous private discussion it was mentioned that
> the PIT timer that Xen initializes for IO-APIC testing prevents S0ix
> residency and therefore that part needs to be reworked. But if I'm
> reading the current code correctly Xen can already use the HPET timer
> instead, either with an automatic fallback if PIT is unavailable or by
> forcing it via hpet=legacy-replacement=1. Looking at the rest I think
> the PIT isn't used if Xen finds another clocksource. Did I miss
> something?

Do you have some reference to documentation related to the S0ix
states?

I would like to understand exactly what's required in terms of
hardware devices the OS can use and still be able to enter such
states.

Thanks, Roger.

