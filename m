Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24527921E1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 12:37:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595563.929171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdTQV-0001ZI-3T; Tue, 05 Sep 2023 10:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595563.929171; Tue, 05 Sep 2023 10:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdTQV-0001Vw-0N; Tue, 05 Sep 2023 10:36:55 +0000
Received: by outflank-mailman (input) for mailman id 595563;
 Tue, 05 Sep 2023 10:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VRCr=EV=citrix.com=prvs=6050903fc=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qdTQT-0001Vq-OX
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 10:36:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d64792e-4bd8-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 12:36:49 +0200 (CEST)
Received: from mail-dm3nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Sep 2023 06:36:46 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB7541.namprd03.prod.outlook.com (2603:10b6:806:b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 10:36:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::8a1b:5230:3575:dc68]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::8a1b:5230:3575:dc68%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 10:36:43 +0000
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
X-Inumbo-ID: 1d64792e-4bd8-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693910209;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IgENLZ+IaDkiBAypsbgqja2qkZRSpapleI7yUTSKC3U=;
  b=W/gbLgPEwpQO7xLO5Ynz0M0ZkKioESRu8VTvJehQt7HApujv14jtBbwg
   CFc0ISZcktG89bSPNmVfanrLrdxzTt5aIcX7THdhFDjkZFrCotK7zqARf
   n9qkxJRbCdM+Nl5A+EgmhTtq3vEjCF3a0mqW9yVBPS4cjUPC2hfT+elil
   0=;
X-IronPort-RemoteIP: 104.47.56.49
X-IronPort-MID: 121534171
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HaNf8KpgeeNe2fRIQ2UAacIxtoZeBmILZBIvgKrLsJaIsI4StFCzt
 garIBnXMvneMDD1edB+Pdvlox8HvpOAmNZkGwVoqnwxEnxHo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePzyRNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAEiNk6BnbyJ+qzhU/BFmf0ZCu+3PYxK7xmMzRmBZRonabbqZv2QoPN9h3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearbIu9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAttPT+HhqacCbFu79C8OJhgoaVWAnfiigVycBOMBJ
 G0Jw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z+RpDK2fCQQdmkLYHdeSRNfu4Wy5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr/hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:CrfqvqO+0xFKGMBcT/X155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE9Ar5K0tQ5uxoWZPwMk80kKQY3WB/B8bZYOCLghrOEGgA1/qR/9SDIVyCygc178
 4JHMYOa6yTfD0K6foW+DPZYqEdKbG8gdSVbIzlvg5QpHRRGtpdBnBCe36m+yNNNW977UZQLu
 vo2iNynUvXRZ1bVLX0OlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrIX3FhCJty1uHg+mld0ZkF
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVAi+EsHfuWK1RH5m5+BwlquCm71gn1P
 PWpQ07Ash143TNOkmovBrW3RX62jpG0Q6n9bahuwqknSXFfkN5NyMBv/MbTvLh0TthgDio6t
 MP44qb36AnRy8o0h6NvuQgHCsa6HZcmkBS2tL7v0YvGLf2IIUh3LD3w3klWKvoPBiKpLzPQ9
 MeQ/00oswmMG9yQUqpzlVS/A==
X-Talos-CUID: =?us-ascii?q?9a23=3AgdK6Mmju5O7AlbMQVNLbmXvbpjJuQ1KFknXKfXC?=
 =?us-ascii?q?CFzxwUZSKcGW23v9lnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Am55v7Q2bmfrvKu72OWyJoYz7uDUj0eezJkUzrZs?=
 =?us-ascii?q?9h8ifPj5SZAbDgxWqe9py?=
X-IronPort-AV: E=Sophos;i="6.02,229,1688443200"; 
   d="scan'208";a="121534171"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFzGrGm/h0wTH5IgdVjQLFk9+68n8WJGdqcIOgf6omJVBbeo29nkG9r6wrLpl3y+8GpmRl77BK+lN9lXDfUkvA2/1tTUbhnSHvXry2+lu366k94Oe6UXR1UiPFmiS+fpxv6VJXH9SUWnPJYOpu5jkk/RdHxrP2Ua0lsl29f9KpxVzQEF1jpft5vcTAgvumZJUmMJb1tzDsFpjX3ERvgPbQzXk7lp0M4/ihJt2/keYD6/2jw92uGt8YhLpYHr2mpPINCZQh/IatsniqnTLUPsL/bmCsmGdkz3l+pTe3JP5sXH93zXnQBg0qCRFODT/4nE8bhuydNeuL5XzfeHkdKPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDETOJUBJE9xOpwfPJBxla+FHGSZCMdXh6hZ18IM1wM=;
 b=PO2E1WYcgLcy2QdMyy94G2S6yE+t0u07xphmc1mqxQM1NEV0vRND1sM6wudhybvX5MCb2JANog3HJ+XUcMuhqcayufSeuTKLpz5tDrwmrmIwKkdcRtdfJljdluxYtzNt66B5dVpScfNhZ1IQGadBFgXvyckaQsvT+RIKLE1kGsRgYNgCEUWjDVABHM6iDmvkWmuonYx59va1+5eMDA/bSpECJB07hz2Jp/J3pPM4cn4mOGQfEuRX+IpiZxlS1ajZ7OhWwPq0Ndcjim1UvOwfUn4hDC0zxRUtVCDaML7/NJQXMiTp0xRp2kuyzM06JlTLxhkvT9bMVe7cSMxmRlkgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDETOJUBJE9xOpwfPJBxla+FHGSZCMdXh6hZ18IM1wM=;
 b=SU6/XNzdscsvmfFMKw3K5ZFY6+ejxruvJYX+f3RvtROAaTWSlvDQCTa/4QBuWZMiQRrnyxVoKIXG5mHYbYJRq7gPX+U8IGYBirhH6fbVNufO6Fd/xbFo3dha9TyILQBxVY+b519Nlstgmwz2a7WHr3bYz2buGfCAnAdtHOOvBdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 5 Sep 2023 12:36:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/HVM: adjust hvm_interrupt_blocked()
Message-ID: <ZPcEtALJ6-08yWo7@MacBook-MacBook-Pro-de-Roger.local>
References: <5BC0C4B602000078001F1258@prv1-mh.provo.novell.com>
 <ZPBusqv7NGaJnOoT@MacBook-MacBook-Pro-de-Roger.local>
 <ZPByJJEoJOjV3CIY@MacBook-MacBook-Pro-de-Roger.local>
 <8d894d37-4a03-7d51-9a45-3f764d05a90d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d894d37-4a03-7d51-9a45-3f764d05a90d@suse.com>
X-ClientProxiedBy: MR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 6baccc23-a7c3-4a1b-9962-08dbadfbfeff
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/0rBnSXKcpOhvu/jRls2kFsLWUWXQ2dXTR4fzeSP6WShKabkqdBDcjaLGpO/TLbj9CXG3VYXaeW6qmHcSyYxPWhVr1Yw569KzJrxlAE6OynhWt2Dhp28zwccEYb1nDOKkGjYa3Tj8fV6w09F29vW1O/dyEXv2fjB+SXO5SDdl1pKkJNmUs/A+Zz7m4jITmWokwjpl+N0RgbO2Leb/UNTJGjwh7kYlwDrP03naTOeiallOA73UHcyJCiuKa1+gJXBYbC729u9Me4Jfxz7aTkrfskhOHIchqIj6nPIqSVQU8TN+3gFzY6M18p84YHHfj+/2AWivLIt4uEtNX7eZSbOOLjbOphm/+rXuUdQGhaJNMezy7cW+on2xX5SBdIz8pgu9iHmzhoJTNhUrwak/66NvFT8pcyAvWVVBIsR67kP3E/M1brRV2EAISsFMk21fz0cZUSQkrpiamG0k0yZwBESmU7BHMwoGh0o0MCjxf0BHzFaO/2X1U9m0E3kFhM7qbnkEzd5BYXjIUNqRyx3ddgPL97hlCN2606tw9fSTNqwnDZvoqaAWoSwYuVGydhrQRxC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199024)(186009)(1800799009)(8936002)(8676002)(5660300002)(316002)(85182001)(54906003)(6916009)(66476007)(66556008)(66946007)(2906002)(4326008)(41300700001)(66899024)(6506007)(6486002)(53546011)(9686003)(107886003)(26005)(6512007)(6666004)(82960400001)(38100700002)(478600001)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGJ1aWk0eU93NzRtTmxuMTIyK3ZsdzV4NnBhN282cEVDaFVnOFczOGg1blFQ?=
 =?utf-8?B?L093TmNORCs4NzFnUG9uV0RrNTdhaHpoN0I0S09JNEc3c3pSYUpheTRFekpk?=
 =?utf-8?B?WC8vcnNjZ2NMTHRYczFCQXVzN1AyZGUzTFJxOFBHMnYwbXVwTGxFNGJyM2ZM?=
 =?utf-8?B?Y3pwaFd6RmxlQ3VGejdSN3ovS293eTV1VzRHRTRnVUNPU29jZGI0alQybTRR?=
 =?utf-8?B?enRjVytyVG93eEVveVYvT0dxMDR4QTBnbHMyOVJ0amszNmxpZENNVWswTTE0?=
 =?utf-8?B?MXZsUUxSaFdJLzBSTDhxOTB0V1U0UHhqQUNQYkU0MHBRWjcrYmFPOEU3bXlF?=
 =?utf-8?B?eS9TYjdpQWtSblNyWldidVZQWndjT0RTN0FsMUUxcUFHMUVQand6OU9CYUFB?=
 =?utf-8?B?MmJ0N0lrVkY1Z25MTzhWNGNmNVFFY0FOUEJxcHQ2MXdPT1VvZHhqb25zYk5Z?=
 =?utf-8?B?UTFmMXVNR0Q2Qkg2djRrUHNPT25GbnBTd3I3OUoxam5OanJYS2svNDRJYksw?=
 =?utf-8?B?UEFJdnovbnpxTjNMcHR2b2RhL2ovNW9SektMMVVER2puejFPaldTVjdYZFJY?=
 =?utf-8?B?K0lVL3BaQ0tFRzlQUHlhaVN3bHVIQzQrNnk0Q2ZvUXN5cWVPWk9NOFFKSndz?=
 =?utf-8?B?YTlJWHhtU3Y4cUZPSlR3R2dQNk9mdWdwNHdMZERMbnZUL201enMvTlBCUU9t?=
 =?utf-8?B?N3hwMDQybkVRSUg2bEMzdFdxeG42UEJ1d3FWaTYxYnphVkhOc2VLeDd6SWRy?=
 =?utf-8?B?UVJMU2NkWTVDWjdqQVF1eUs0VWNUYWQ0K05aQi9zaExBQnpucUZFNDZSSVl6?=
 =?utf-8?B?dUFJL3BKN0FFaHRvWStRUVQwLzRLRFF3aFU4TjZkd1dybFNGcVJCMjNNM040?=
 =?utf-8?B?R3FmSjZYeDE1SjlMY3hLdUlQY3l0V2dSMmszUno5VVhLUFRLRGp2R3JNL3Bo?=
 =?utf-8?B?SDFSbmh1cStPNDlkd3Ywd09BWmFJTFNaMmFIZkQ4SUM1dU44dDd1UjVBU0Iv?=
 =?utf-8?B?VkpYZWx5bWMxUnF3U3RkVzR4c0xYV3NOQmFmb25ZTTIrVE45QWplbjJlSnhD?=
 =?utf-8?B?TDV5SlovYXRmWjh6RWYvUjhmMk93ek54cjRUd3lHV1BMZHNFMVdpY0RVSDEr?=
 =?utf-8?B?VjNKZXNVc1psK0YzeDV6bTFtZ0xSK3IxUld6clhYejdneW1NRFNxRXl5ckFK?=
 =?utf-8?B?aXhnZGlLemxkbVpCSGZ2ekcxcUhLc3h5Ylc4TVF3MHNudm5RYXF1T2Jpa2hH?=
 =?utf-8?B?Q0JPT0xRZWxUUFZtU1l4V2cxdVNsbHRRV1duUGY2ZllHVTM1L1htK0Y4S0Rr?=
 =?utf-8?B?Q3V2Zks4QXl2MW1HN05rNERPYlJpdnNPK012eC8xeVRRWEJoKzJMSm0yQmxn?=
 =?utf-8?B?Z2IwL2ROS21BbWhFZE9wR1pLMldoZGZ0Q0p3OFB3UW9zb012NzVXZTgvcjFx?=
 =?utf-8?B?QmtlRFY3RmtnQ0RmUDBoNEJyMk9PczVKR05NUi90T2c3Ujk2djEwVnYxY2xJ?=
 =?utf-8?B?Y00vRUx1aHRiT1ZiWmJqb21zbk9Ia0F4TUhGTVJZUG1LeVlNUTgyWUdkdGNh?=
 =?utf-8?B?bks4SFVISG1wbHZUdW9aTHBnMC9DemtGUHF2WncwemJPMm1NUGZlUkZPN3No?=
 =?utf-8?B?bzFISzA5SXBUN0JmS1RTVm1maXhuUmVhNzhROHRtd0U2UWh0Y3ZXZityN3Ev?=
 =?utf-8?B?TlBjV0dScm9wYXhvWnBxTGx4WkZ3WDl2bERRdnZJR1J6SDZOTWlWcDdUY3hq?=
 =?utf-8?B?QzArdDNkam9iZUdQMEpacHhLd0FSUXhjb0czbElPK2ZpK0NsN2xnVW9FaFdS?=
 =?utf-8?B?YzB6MWJ5eXpuOURYSmxLMHhoU0dTTWE0Z1BYM1IyblNCY09iOFB5enlTUGVD?=
 =?utf-8?B?N0w0SnpLeEY0KzhNWXp1VklFUDZhL2hVTHFtQVVjM2ZaWGlETWplTFloS1Nt?=
 =?utf-8?B?OUQ2NloyNE1uUkxjWmh5azIrNGVSbjRLa254SlRlMnNmNm9QUEFCYkdiK295?=
 =?utf-8?B?aklaTUwxUkJFOW4yLzg3UGhsdVZscFZNK3MwelROcG1JSjdhMU8yNWxxZFNK?=
 =?utf-8?B?TmJiTHZKSlhFdURma0NMUHZ1QmlHNWFIM29MVyt0OHY0QWR0ZmVreUF0Wk5R?=
 =?utf-8?Q?c+oPd91qntY9I+B+DMKMqZblP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AsNeqsvVXwXVcEoKJU5AUBYO2+5TqqfEUdDUqsppg0PfBWAedu8s/JClmtV2JXs4aX8gHepCcMCUHNoqDoiZwqUhKoeO+v3JNBkHcNyBRoEEV52rU0fqRUPO6ZWZShVjVPeGuOquFTl54Yl1A6hHkwtG6I3SMwNd/6x8sN7EJozfTuqJxUsg0tnq7aO2nDWfZmSTaWyddFcJbJZV6fPNKlooN4ZGyoi6tCOoHslaTNIr1wMeEakhILPs0dRggVZxWO/Aa/koLt6t04xmDG8TjJx4yqFpzTnHyDRVSjGhJxlXikWDFtjkgRU0TXQ5hrawEaQLvBk3/ANoPPVUTHF/EIiRLkFoUcdBeBi2VD68dp5l8ntV6bbhcUqfHAJritYL/2yaORSRQenN0BiDCoIHSnhcJbGtVuw2xaS9S8+5TKzdI0L5YX9muhbUXzydGdfRphy1W6jjfe6XnrEeC0EFjjIVzCjaj/j11Uli1WIicTnfDHlyK+K3KizdvbpJnivJbbJvjLNWxYp8E/+jAMrWZKlq51bfPisOpe1WEYRrpA9wFj1t45jijV+oMEGbUtRaZ0t+Q+dXSaNdub9Hgo51ye8GlOwdgEWigbCv4U2z6xqbKQE7HwbEsb+LjcJMUXL9WYrs1iYpXsGqOujvW9xmpyRPPORaxq4T0GDKIIZ5ad5ygYgvo0uPNHuzuK2lhODO4YHogmiIjDFqyN+5n1dDALrd2oy30KI+vJ8fQdLTS4SxoxNW/eUDpOTJ1Qw4xKY2fOvIhBGKAnaoNCxpKTHE1T2WcaenTN4viJ3CQ/5Dnrg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baccc23-a7c3-4a1b-9962-08dbadfbfeff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 10:36:43.3232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWOX9jlTY2o1454lGnaTkDiB0/+1ckSYYsMVqFsfqmivxDi+rhs7qmYtKhSUBvCUOVFQSpgBc5hPAp/W0rX9Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB7541

On Mon, Sep 04, 2023 at 03:40:46PM +0200, Jan Beulich wrote:
> On 31.08.2023 12:57, Roger Pau Monné wrote:
> > On Thu, Aug 31, 2023 at 12:42:58PM +0200, Roger Pau Monné wrote:
> >> On Fri, Oct 12, 2018 at 09:58:46AM -0600, Jan Beulich wrote:
> >>> First of all, hvm_intsrc_mce was not considered here at all, yet nothing
> >>> blocks #MC (other than an already in-progress #MC, but dealing with this
> >>> is not the purpose of this patch).
> >>>
> >>> Additionally STI-shadow only blocks maskable interrupts, but not NMI.
> >>
> >> I've found the Table 25-3 on Intel SDM vol3 quite helpful:
> >>
> >> "Execution of STI with RFLAGS.IF = 0 blocks maskable interrupts on the
> >> instruction boundary following its execution.1 Setting this bit
> >> indicates that this blocking is in effect."
> >>
> >> And:
> >>
> >> "Execution of a MOV to SS or a POP to SS blocks or suppresses certain
> >> debug exceptions as well as interrupts (maskable and nonmaskable) on
> >> the instruction boundary following its execution."
> >>
> >> Might be worth adding to the commit message IMO.
> > 
> > So I've found a further footnote that contains:
> > 
> > "Nonmaskable interrupts and system-management interrupts may also be
> > inhibited on the instruction boundary following such an execution of
> > STI."
> > 
> > So we want to take the more restrictive implementation of STI-shadow,
> > and block #NMI there also.
> 
> Hmm, that text says "may", not will, and imo STI affecting NMI can at best
> be viewed as a quirk (quite possibly intentional, for simplifying some
> internal logic on the processor).

Possibly, but a guest expecting such behavior and Xen not emulating it
would most likely lead to a crash, while forcing the other way around
(Xen blocking NMIs on STI shadow unconditionally) is not likely to
cause issues for OSes not relying on it.

> Plus I'm not convinced AMD allows similar
> leeway in SVM; at least I can't spot any similar statement in their PM.

Hard to tell, in any case I would apply the same reasoning as above,
as IMO implementing STI shadow blocking NMIs is the safer option, and
is what Xen has been doing so far without reported issues that I know
of.

Thanks, Roger.

