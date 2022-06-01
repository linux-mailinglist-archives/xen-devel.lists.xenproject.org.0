Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86B53A044
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 11:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340373.565394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKaU-0004fm-NC; Wed, 01 Jun 2022 09:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340373.565394; Wed, 01 Jun 2022 09:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKaU-0004dr-KA; Wed, 01 Jun 2022 09:24:22 +0000
Received: by outflank-mailman (input) for mailman id 340373;
 Wed, 01 Jun 2022 09:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3TG=WI=citrix.com=prvs=1441e74d4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwKaT-0004dl-CB
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 09:24:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9be4c5a7-e18c-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 11:24:18 +0200 (CEST)
Received: from mail-mw2nam08lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 05:24:15 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB4756.namprd03.prod.outlook.com (2603:10b6:408:9a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 09:24:13 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 09:24:13 +0000
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
X-Inumbo-ID: 9be4c5a7-e18c-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654075458;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NgHhILmzCjHH2AvRA+h6Zw+4fQ+xkyr0fT8znc7hC8U=;
  b=B1reiEnUJCmmLz4nlWhWFVtG15UoZOZXcueuvxtS6meLm9YYJ2gkwbK3
   rzXbx/mDK4FDf4TwxTgRvnAU16yAIMgEp8ken8nIHP2YmHQkdPdNvKizf
   N8dAE5guhNzGe6vs5pOiUNbGMuqudHGgidhNZXv7RZITZ6z7qxcb733Wl
   Q=;
X-IronPort-RemoteIP: 104.47.73.176
X-IronPort-MID: 75137377
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Z9YrYqOs0YY5SsHvrR3TlsFynXyQoLVcMsEvi/4bfWQNrUpw0T1Wz
 GRKWDjXbPnZMWqhKookPdji9xtXvMCHzYRhTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn2tcw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 Nxwu766S1sVNaTRltlBCjlGLiAuIvgTkFPHCSDXXc276WTjKyep5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB5GtaaHPuiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/32yCkLGYH9zp5o4II3UHf6BRtk4SuOYb1a42GGdlMolSh8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FSiU93VTxC+5nmesXYht8F4FuQ77ESI1fDS6gPBVmwcFGceNpohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:VT6P6a+4GiCyykYIVkpuk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXgIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6X9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFz9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcwa+d
 FVfYDhDcttABOnhyizhBgt/DXsZAV/Iv6+eDlNhiTPuAIm3kyQzCMjtbkidzk7hdcAoqJ/lp
 X525RT5c9zp/AtHNJA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.91,266,1647316800"; 
   d="scan'208";a="75137377"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqTquFLpCVmPAEk791LxTZ8zofhFwPQwT+nxrpFgN84BlP9UVW/43fmKu6OHx3kcoM4Jb61sNyCyTBXrGt4MuArMZjyNfmoFuExu3OOSv6Lr1xlWn+x7kyEcisYsyHheLW60Ph+ZnmRsa3iMNKP9F+VvSr/LeIg++vvLs81++vPEV1TrkF3WH3bO7g97+97JhcO+/XdvYwT45moeEdNVi4g5BJ6p8H0XbHzT1QbnIQlpbxdDXso+p/A4e1fGEEJHHxDJMFKK3J4s+EsnG4lOJ1MeORne0OiuqqheoDwx1U0bKrwuh+KufugkHX2s3oMIX0/f467XSB6x6isDRly3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwFMEiCsktYe+ykj4mHdBcUXkDA/aI5nE5HdboBnRqU=;
 b=ln73o00c9PZRGcyZRCfempVcmKmZjWdizPpuz8s7S5cB8iXXCrZCKWHnXkKeIfSlJwXSAysj76kzE9BZvINpAO9PgdMNWQ170xdV4pplIiHTGBN9wVBeGBxBS3BOkhyBHF/fS1mNIDE5fdEvpuorfYZ4noURZeYJyWN96irNvIUf07pPlELOcVSi3TYWVzs7jz8+5rLcZWLyy/Xk5/Iu74eKw0nGOicHvCFzZH3GV3E+j4Ue+3kWWVImsvV5fzL0ikoUJNWdyA3KDG1lX9kJdcdsQ+S0rhmJH73pHm6pAEMDng/WU6RXmVeWo8teok9t24BLSc2QAxgo5WR7gPFtmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwFMEiCsktYe+ykj4mHdBcUXkDA/aI5nE5HdboBnRqU=;
 b=hVce/BE1WNLaAkT0yWES0ri+IZffJO795wcODhEGwV/knW1S3IZH75bj+OjJtQdG6RmaZleD9Xq80AMgk0MIc0IH7cxs7wHJCkKU97GTgQ9eiJQZpUhyDc4BIQ2ZrrXQc52n/ju7a5gVQOBMYDrXTGw1qNgXpTxQ646atkofo5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 1 Jun 2022 11:24:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 03/15] IOMMU/x86: support freeing of pagetables
Message-ID: <YpcwOCBEzI+qvTga@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <614413d8-5043-f0e3-929b-f161fa89bb35@suse.com>
 <YpZBjVxRdJOzJzZx@Air-de-Roger>
 <372325ed-18b6-9329-901d-6596ce6e497d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <372325ed-18b6-9329-901d-6596ce6e497d@suse.com>
X-ClientProxiedBy: LO2P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 824ceb34-f924-4c61-fd3a-08da43b07ddb
X-MS-TrafficTypeDiagnostic: BN8PR03MB4756:EE_
X-Microsoft-Antispam-PRVS:
	<BN8PR03MB47563C50ED584B7EAD5736A58FDF9@BN8PR03MB4756.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f9Q/1ynIPlZ9ZVeEWtfSKie7om0qK6pbhn26n6McWbCMKgAeEEjea2UxqcNISDmR3vp58QhzO6s/ru7esoOJsRCYOU9mxyDRby7rlAYOZb6QR6sXHKWEZeQYRGpj6Y8mvRSSxTi26zVcY97ZPoDPJVTQ/0G/gZA1YlrhIv3o35FghJ8OPg0nWZnNRiKVAG4BSi2Xj89c9626SBRzhrcuUi6yTOK1eb2amoIh5zgouuhiD8iJzEBZziave08uTR7iyJTiCRWJhKsQ42ghShMuUz0DPlLTZ0YtkanteU3f2xjquSwr2hf0INV4kUZ1f0ZYXCdUFQ+zUTGgYF1EP5TiluYsZ3P8MoJjtZ+LcrNCeulcO65FQe3/pwHJVgVf2KQpiEwmTkUjtSNhKDnsC/Cp9FLWh7IOixIBtUYkvI8yktlCBqQCBzD2MqTbBomi7opUDCI+uUKsRcC0yNEsgwy0+mI5/PDbTP8ROIXyo7VKYX77E32qJEAjWbeS3zIjGTXByi5qc5TsIkSlWPKRMws0Y3nMNJzrq9Mqzak7ddUAE3dhsCc+5JjLoljQcQd+mmWYTu2YL0jMbgviVnGotVXNofEgFVyVs2NViOte/xRMCN8V3F3cnsXD8L9BEUu0cbQTS4clkegRrGy6PpRqxrhWYDpHPxWk7HEH4knU60IE3O5m3KPJzpFpqHSaCB0i+Sw/YNxCUV9d2+dbf9t7RUqp4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(33716001)(6486002)(4326008)(186003)(5660300002)(85182001)(86362001)(83380400001)(6916009)(6512007)(6506007)(8676002)(66476007)(54906003)(9686003)(38100700002)(66946007)(53546011)(6666004)(316002)(8936002)(82960400001)(2906002)(26005)(66556008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWdWdXhmRXBqekd6UGhjUlNyZU0yZWYzWUxVMjlLa2tuejcraEN3ZzNzVDlK?=
 =?utf-8?B?SHlqOU02Z29nT3VVTUtmeERlZmFIR2lNbmVxR29ReVlkejM5S3pZUU9DcE5k?=
 =?utf-8?B?eXFpK3BSTVVrQnIxblR3WUNZUWgxYnhaWlFNOStMZC9tK3BaNDh0cnh6blBY?=
 =?utf-8?B?T0hHMGhaeGhvYjFWMjY0QWkzRE1KZ3pOdUVEa1JGN1JKNGd6OEFHcVFWT0VP?=
 =?utf-8?B?dFhDOCtyM2FmV1YxUTBDcUJOMFJyM0hqdGcrTm12andOU2tyTTlNWXNwS0k5?=
 =?utf-8?B?MHNDZER3bXphTGk1TW4zSTc0OFhhOERmYmdMdlphT3hZajFOalFUWlBFYlB0?=
 =?utf-8?B?YTZQQW1SUVRncVVBanlhbEk3aWE4c2RIYzR0NlZISWhIekVjSzVhSXdheG1x?=
 =?utf-8?B?VmM1WDlZKzV2SUcxLzVnZVhXc1V6K1g5d0hmR1BBS2E2VjNjVlVWV0MzelBL?=
 =?utf-8?B?ZlhKN1ZKZERLeFFDV0tvTjhOY2k5WlVpUGMza0tFWnY4SlBSSWhTS002YlNT?=
 =?utf-8?B?TXhocW9SKzhEMWFoYWVvaUZlNlNucU9SNlBCRUN2azZZRVhJOWdzbWw1bWY1?=
 =?utf-8?B?Nkw3TnVLOHlEM3EvTStScE0zVzNEU0hzWS80M0dPRUk4SXdYem5xVEExK0Q1?=
 =?utf-8?B?b3dKbG5iTnVZVXdHNStEZTRKTHdIczFIRG5ad2hKUmZTV0xVeG5qZU81aURB?=
 =?utf-8?B?VEhKdHBqZDdXb1Q0WlBJVDNUYm1BVUFHRXhEa0k4cFFYMDRDOW9pRit6N1hU?=
 =?utf-8?B?ZGdMWGFCMlhEdXdtbXgwVkE0STExaTJIY09BTzhLaEdhZ1dDTzMwaTIwR3Qw?=
 =?utf-8?B?S3UycmpSVnRJdDdBVng5TVM4QXRPRnEyNDhTS1UyVnN0bzNxc0tVMjZXdUVz?=
 =?utf-8?B?d2ZwRXVmWlliTEVzWC9VQ2FXcnBCdXNUSXh1WmdzRFU3M1JqcjdNb0NqdTlx?=
 =?utf-8?B?NFVBV0xJYnlLMFpHM3FXU3pZM1JsZDFxOEVibHZrOEl0RTNkR2RmRG5zbS9J?=
 =?utf-8?B?T2h0ang3c3QwbFlxSFhpMldIc1FuYURzUVdnVWFKeXlpcEVnSmVPbVpxSHhY?=
 =?utf-8?B?NHVhVFdSNHhLRzFuSmc4OVNRakNwS0N3M1pBMkFqdWJwOFdubGFoTFZZaDJt?=
 =?utf-8?B?Qnh5MW9odEVIZVhpeUE5ZGFhUTFuV1Y1c0dqL0ZUU3VsS1oyQ2w0alIwUzRJ?=
 =?utf-8?B?dWxTMVNUNFdKOTdpU3RBNHZKdU1YeEY0eURVY1BrUkZlc01rWUFqZm9aL0Qr?=
 =?utf-8?B?djhFeDgvZEhxWmhBdVF1b05uNWVuYklEK250QXI1Q2R2YVRmYUVNRTdheW9n?=
 =?utf-8?B?STYySlpEYjVDSDBhNHI0cS9iV0NmTHV0N3h0eFNGNDZ6aDhOdzFrNUNzUWJP?=
 =?utf-8?B?ZGN1Wk0yd3VZTDhOY1RjOC9MdGVvUVRzZlp5MXlaaEJiMjYrY09NSURRR3ZI?=
 =?utf-8?B?OXhZK0ZBalNBZEdQQStFWllmbjZqUkpsZmZVWGQ5THF3UTY5ekxKTDZjT2Fv?=
 =?utf-8?B?cFpSdHcvZXcwdjZkcW9uS1A5UkJwOVlTcmxlbnJ4R3dxQlVkRkc0VkFLd1Rr?=
 =?utf-8?B?bVdYdnpaS3hqYmxUWGp6M2lVV09Fa29xMHF5NjF4M0wyTnNIcUEyZnAwK1ZV?=
 =?utf-8?B?Mkh0YmNSY0c4TCtaRUE4Tjl2dS9yMzRGek9CTUpMOWE5V2tMN2Nzb2lsaVhs?=
 =?utf-8?B?MXZNODdTWllvYkpVdjBCMk9Sb2d5YkNON1pxZFFhcElURW9NOXhHZ1FmMXZD?=
 =?utf-8?B?SWp3NFNFZ1RVdEYwbFZvYWZCY3dmVGFVOEdQNGdyc3BwSE0yRDAzb1lWYW02?=
 =?utf-8?B?d2szM2lMcjNaM2w2OW9NRUQ0Wnh2ZGZFVWNmWGlTcWxRQWwzYXJGMVBMMmgr?=
 =?utf-8?B?TnByMElLWFVManlDRW1JQWUvSGdzVjF1SEd1dEUyTUtrTlY0L25OWFlNTVBJ?=
 =?utf-8?B?NjBNa1VuVCtLcTZHaUN4cVhYZnIyY2FlTWQyM29RVzFkRHR1QlZsUlB1WmU0?=
 =?utf-8?B?SXJub3gxWjlncVpmT2grOEpwQTdWUWhEekxlb0dWcE5vdEt2bEM5NTc3Z1hP?=
 =?utf-8?B?OUdURHNGdStxVWJNbGl6ZWZwOCtjWHQ3ME0vT3dONWhUbEMrWjJKNVYyalh5?=
 =?utf-8?B?V3lPT0paVWlzekxaKzYwcXdhUUY2dEMzTElaUzBERkNWK2R5NDdURkpOeDcr?=
 =?utf-8?B?NzVZU0YveFpJRUZFKy85S00wZ25nQ09NSDM4UHRhNDB6QmdNTHd0YlUvcjFD?=
 =?utf-8?B?aHErQW1JaU5MNjhEeW1hd1RCcFhxa0pZdXBMMFlTSnd4dERPVUVSZWJ3czFF?=
 =?utf-8?B?N1liZ2tpaE1Rd2twNmY4ZG1nZTBVMVhpVjlVb09tUlZXOWdqS01MRHp3QkJI?=
 =?utf-8?Q?W0zIHeio0UQ+025I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824ceb34-f924-4c61-fd3a-08da43b07ddb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 09:24:13.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHSvScSNldfmcxiqOFb/xhq920S9LvRCEOGvpDKpGbBK/pxFETylhPewiEFqMWCB85rIQWrDWEbS/TNpKUi9pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4756

On Wed, Jun 01, 2022 at 09:32:44AM +0200, Jan Beulich wrote:
> On 31.05.2022 18:25, Roger Pau Monné wrote:
> > On Fri, May 27, 2022 at 01:13:09PM +0200, Jan Beulich wrote:
> >> @@ -566,6 +567,98 @@ struct page_info *iommu_alloc_pgtable(st
> >>      return pg;
> >>  }
> >>  
> >> +/*
> >> + * Intermediate page tables which get replaced by large pages may only be
> >> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
> >> + * per-CPU list, with a per-CPU tasklet processing the list on the assumption
> >> + * that the necessary IOTLB flush will have occurred by the time tasklets get
> >> + * to run. (List and tasklet being per-CPU has the benefit of accesses not
> >> + * requiring any locking.)
> >> + */
> >> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
> >> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
> >> +
> >> +static void free_queued_pgtables(void *arg)
> >> +{
> >> +    struct page_list_head *list = arg;
> >> +    struct page_info *pg;
> >> +    unsigned int done = 0;
> >> +
> >> +    while ( (pg = page_list_remove_head(list)) )
> >> +    {
> >> +        free_domheap_page(pg);
> >> +
> >> +        /* Granularity of checking somewhat arbitrary. */
> >> +        if ( !(++done & 0x1ff) )
> >> +             process_pending_softirqs();
> > 
> > Hm, I'm wondering whether we really want to process pending softirqs
> > here.
> > 
> > Such processing will prevent the watchdog from triggering, which we
> > likely want in production builds.  OTOH in debug builds we should make
> > sure that free_queued_pgtables() doesn't take longer than a watchdog
> > window, or else it's likely to cause issues to guests scheduled on
> > this same pCPU (and calling process_pending_softirqs() will just mask
> > it).
> 
> Doesn't this consideration apply to about every use of the function we
> already have in the code base?

Not really, at least when used by init code or by the debug key
handlers.  This use is IMO different than what I would expect, as it's
a guest triggered path that we believe do require such processing.
Normally we would use continuations for such long going guest
triggered operations.

Thanks, Roger.

