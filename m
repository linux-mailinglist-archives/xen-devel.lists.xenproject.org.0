Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7D6CC0C1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515829.799063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9N9-0002Q4-LI; Tue, 28 Mar 2023 13:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515829.799063; Tue, 28 Mar 2023 13:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9N9-0002OH-Hb; Tue, 28 Mar 2023 13:28:23 +0000
Received: by outflank-mailman (input) for mailman id 515829;
 Tue, 28 Mar 2023 13:28:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K3v=7U=citrix.com=prvs=4442f050c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ph9N8-0002OB-4M
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:28:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 659a272b-cd6c-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 15:28:19 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 09:28:07 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6061.namprd03.prod.outlook.com (2603:10b6:5:390::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 13:28:05 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 13:28:05 +0000
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
X-Inumbo-ID: 659a272b-cd6c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680010099;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Q8eRLYNotjVrJ2sncRr/alVc4U89d7/6a2U+ofYKzE8=;
  b=VPblyt2mviJjY3r7GFe6DqrwFBEJ/4bjh5muaYOGvrUjGzz8MDUByeUL
   XthjjzLj2G1qxZB1aj1XibXeX0OUEEkeTp4wm2nP4FwM9uhdiCtXgzDju
   D+Z7OenehzGQi+O3mBynt9tT1tZfka+SrYx/PGGEjy+dFlaQqsoq0fK3D
   4=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 102148540
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QFGsS6OhfAqD5N3vrR16lsFynXyQoLVcMsEvi/4bfWQNrUp01D1Uz
 GsdXmuDb/jfZ2HyfN50PIu2oUoBsMXTyt42Gwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5AxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s9KBUBr1
 OEXETIiRQuDo/25/o6FFdA506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujeLpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr237OfwH+jMG4UPJGSq8Ipim2O+nNNDSRLeAK8h9Lpj3frDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O+gz8gSE0KfXywefGGkfTzRFZcAmtck5Xjgj3
 BmCmNaBLT5mtrGPWG+e3riRpDK2fyMSKAcqfSYZSSMV7t+lp5s85jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vvt63jp3ATwpw7QKOWGugt1p9fNT8ONTu7kXH5/FdKorfVkOGo
 HUPh8mZ6qYJEI2JkyuOBu4KGdlF+sq4DdEVunY3d7FJythn0yLLkVx4iN2mGHpUDw==
IronPort-HdrOrdr: A9a23:OIXO+aD7TlsDRSXlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="102148540"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwIVhhZI40rF0x+nWNuXr67gJsDEX8Jo0Jgo74T0TP1/ys9Nvi/hzMA7tZVwBYIqHJfCA5RqV5GW9RlA3KXlSoJJb2XXDXri357JaTiiBWgSFWTFtw8P+vDNdqLP532LVTDqldlrB4XDCD/sWzbAXPpuRWGfWYGKnMMW42FwARqqpcUWRC5WzKsybnUE2Nqkdvk+FVM7UlEU6myToQoUSNmTK+92Sv8XNKO5G7Rm2kyQALWAnxwjlFuyWa3voZ+2whLRBJbn0cAYvxpUpjBINMgVED0+QT78alp8lm2RlCTtbf1ZAkgBa4EfdFPe3WFkm6I2TLHwCqHAl43ANnb/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Btt827VBYLFqUue410Zhu8SboxTGCWNkWDFTgaM5Z5I=;
 b=lLItXtaztx//7NgwMvhkLY3mW1/bFJqMSO6kumsK33P8roj3L1uT2Rg2NvAzlaGudU2JBWL+Qy7eB6mljpNh4dO8rJYvv7jsBPN05euJQbjLYOJa/j6Ft4adS531K9v4WWHzL0NV51BC5HvT5Vjw1mdmOILgv+EiYS4VahpyhVgrkvSSW04M0/PelMQgXWV77Syr5BTz4V74+KRo7NtKUBGTDClsvxPDhQyxf1THh87M2wtmRM82UsgXgMMJh7CfEgv1JjzbTbOeUuQQp6jkBSJzSoZFGId5UzTwj+9OiX/xgPoh3EYyQ/pb+RFFbPjgl2JAOJU3FkrGsUhmOhcM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Btt827VBYLFqUue410Zhu8SboxTGCWNkWDFTgaM5Z5I=;
 b=exSswrYPecU0llU1RhozLxQT4kInVHElz7dnINzPNZXQPEK0+8waIm10kLT8IIdm2uGPI2Fuf+ZkwA21fC1kyTbxAEp1G5haS810Gi23TolqhUPXPHt1XykkMw2lSuzEs00mYYxqsv73ifbCCSOx9MEea07WkripKgrriVpxw6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Mar 2023 15:27:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Message-ID: <ZCLrX2TmYlg2kMxL@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com>
 <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com>
 <ZCLl3ePLgrmFTViV@mail-itl>
 <1b530e63-de12-f953-1fb5-4e3c3ea69fea@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b530e63-de12-f953-1fb5-4e3c3ea69fea@suse.com>
X-ClientProxiedBy: LNXP265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::32) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: 484ce4fd-b002-483a-c680-08db2f90432d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RlJeosKmUopRAroDAtWVBJD5icpnVFjBgcBGS1Pdtydk/t+8r0TF9aPgwxR0LOJAXiP3bQR7s3aYfZ/+6TgZ3rNqdY7IcdMSZxoMkG0gcYTw1QxZT0q9dmjM2f0r75lhhZLIvfe7FaNavaJ73pdLpsHHXjkyHn1XxQBK563YuP1SXk0NaO/SPl1pGJKP607IGPZx61TnFnskAdBd20NgwYUBk/8L6GZNRNnfDOsdKr/Z2ZmhqnBo0toQmXAizIjoxvhzGWfcNi3GPJn2TyVSgM+z/3dAvuXpNuslD/46Aw7wFpIoDXHZuYyBkxd98nFYeFTTPKFIoNwfXyCdFVdxQhfFCOzvuz/b4y0QKVJu/FsgPFVA/jZOD16jK/1LYcWJwywLYQMWzgYvIET6ROCKYc8ZGnD1PfGMhhqoBKtO0dW3510eRIYjwzcDpvB1eZ63gBNATwCjOUJeSshFPprNJUSxZ9DUhaUI4SSOaGZiooSRgozvSwU4JWbzKsO3E8+RNmv2Serh73L4MMLnpN4qW/Nfw/9gGG9vzHgtEf3hC/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199021)(82960400001)(5660300002)(8936002)(6916009)(8676002)(66946007)(66556008)(41300700001)(66574015)(4326008)(2906002)(85182001)(38100700002)(83380400001)(66899021)(33716001)(966005)(6486002)(86362001)(66476007)(53546011)(6506007)(26005)(9686003)(6666004)(6512007)(186003)(478600001)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1hscFVISXdlbzlKdjZzMi9WRG5PeEcrTEhuVkhHSUxSMWtMUkZGRTU1RVho?=
 =?utf-8?B?UzkyOXAvWERNQUZ6SGhEa2wwTUUwYkJUTTJnWFp5R2UzYm5JNC9RdzB4THpi?=
 =?utf-8?B?WEFTMWMvdi9BMFBzcVhZZFAzY2c3YVFXU3ZOYzFoY3dzMHFwVzF2WE1UUFVy?=
 =?utf-8?B?ckZZZ3hVbk1KUHUwaG9ZR21GdFR0ZDluZzMzRS9nSS9FNVVoUFpuejNDK3NP?=
 =?utf-8?B?S2ZZNnhJeVkzckljM1hVdng3TUcxRkxoNkY2V0lxbi9oZ1gvMFJtc3pHUFda?=
 =?utf-8?B?bDFSYlNqZ2pkdkFsTWI4dDk0NnRpaGtPeHBKN0hQNnVPWmZNZENyMk1JODBX?=
 =?utf-8?B?ZGw5eWFCNlVwNU5FOXBuK1RrNlRIS0k5U1F3WkZ0ZG5xYWRaTVgwVG42YzMv?=
 =?utf-8?B?TS94YWE2dFBOeWtUcFF3aUpEd3hhMU9sT2NDNHpBcTZBOGxsd3ZEWFZ4dUI2?=
 =?utf-8?B?ajc5ZTkzRDhQVEdpYWZMUU4xcXRkUk56eXFpclZ6Y1NiYkNKalB4WC90aDRF?=
 =?utf-8?B?ZWVwcUN4T25jUjAvQTRkQ29HUHFjb2dmN2tzTFBleTBGTjdxZ3NvMGdseTJD?=
 =?utf-8?B?M3RSUk16bThkanFRKzgyOHpqRXhqeEk0azE1KzU5ZjhSbDByNlB6bWxhSUQy?=
 =?utf-8?B?R2x2cnBPdmErQ1hJWDc2UGFDN3BLNG9scVlIQ1NBbFFqYlE0cThrL0F2SkdV?=
 =?utf-8?B?VndkbzY0dVkvNzhTOEZYL2ZjbFlNTHZTSm4zOUdENjRicVVDL2p3dXlmdlVC?=
 =?utf-8?B?bnB5K2JqbHNpQlZyQ1orWlpaZkVDYnBySWQ2WTJ4QmFiYXkvYU80b2RDV1Nk?=
 =?utf-8?B?R3lyOEhDQW1SQWUwemlmZmhjblpoVm1RS0pobEM3eVVLTTB6LzcrT3NnUTcy?=
 =?utf-8?B?QWNiclhiTVhtZXp4MUh2aEQwYWF6VTd0NkJoQjNMR1B0SzhnQlNGQ3pyQ01t?=
 =?utf-8?B?b2VPeU01VEQ0VUw5WjVGQW9pNWZUcUxTV0ExOFVrWDF5bmNBSkU5Z0Q5U1hQ?=
 =?utf-8?B?bWtGVWNlMjJST3ZWTGVobXMzUUdnRktSblp6akpiNzhnVmFRSXM5ZnBoNGNR?=
 =?utf-8?B?cXpvcUt6ZkNITytIN0tPYXlGQTVXSHhsWHlzNHhpN2dWM1R0SUxEalVrbkhm?=
 =?utf-8?B?UEh0K3p3SnhkemZZOU5ad0ZRazlERHpJUVNTdEYzUnk3eXFlQVl5SC9VL01z?=
 =?utf-8?B?RHgwQkVPOE5kZXdNeTBhU0I2dGVLNXhISGRQVW1YeFlFZUhDU2VmR1FPME5H?=
 =?utf-8?B?ZlJ3cEFZMXZ1SG5JUG54M2lHUFJJVkJ3cWdJVzJrTzhNd0s4aGRvbEhZUVds?=
 =?utf-8?B?WW82cnV6MVZsYTFaa3JvejBHYnlvSlR0N2dJV3YvcUtOQlg5bWwwZ3pYdFda?=
 =?utf-8?B?a0JabTMydkVWMzQxTWVoTk9nc3RQNTY3Z2xxN2JLcnBjakdoc20vWUdoZnNZ?=
 =?utf-8?B?YkxuWFVJc25FZFVpWE0zVDNXUDlqVTBnTFZGRlhVenBxVnBYdE0wRmVWN0VZ?=
 =?utf-8?B?UXluU2xDUkhCOVdDOHF5amV5K0tYUlVzVUJJdkdJRmlmc1N2a0U0cjhzRU5T?=
 =?utf-8?B?bDFja2VSVC9FbnhrbHFkRm8zekdNRGNMaGttaVQzNTFVc0d3Rjl6cFIvbHJU?=
 =?utf-8?B?SXZuMVJxdGRTbnFKUzBOcjR4ZVF2NDZGODRPVzNYZUY4djB0SDg0b1hBQjE4?=
 =?utf-8?B?NFRKTGZqU0w0VVJUVTRMNFNSaDNJMWlVbW9zOXl6aGVCcFpTb29GZk1lWG5r?=
 =?utf-8?B?bU8waFUrQk5XdE5Xc1FYUGtuZFRPMHlsV0tjYk91MlZaRE56SjFpUndsc2JR?=
 =?utf-8?B?cUNVOE9zdGxiSGgvVzdhWHJYUCtuOUtEUlh3TzcwZDhkSU55ZWc0djlaWjds?=
 =?utf-8?B?UC9HZUU3M3hGZWw0Qjk0RFRmbmQrYlJmd2trRGRpQVZLVEt5VjZUT1ZyQndE?=
 =?utf-8?B?SktxR0tWT0Q1dE5uL0pIZkpkQW14N1RUNkFONW1RVXUrYVRaM3JGUjlIQ0d1?=
 =?utf-8?B?YWdzVFdQM2xMczlBNDFWK0toQ3FXWWE5bVIwSDd4cVJ4V0Z3b3U4WTAvM2dL?=
 =?utf-8?B?RlRPb2hkQU1uL0xQOEFaSjduWkwvMDlyZHFEbDBDdlhhNjAxVnMvVnZzSHlR?=
 =?utf-8?Q?G7VdFC6QKw9EnDoTVru2GHWAr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JJQNhb+tq0gfZ6VemC67oXTECS709Hm2y/UneAYs+3TFavtnf8mvzI1NXVrm+lRKJJHEQHJhEftg9CLTdogKwTZgicMgvOlFVANkzDo+2c7pUwocQjFK1kY3xaTrfV7y3Xf449wfgH0Y5X6SBr+Dq06YE0Ewo9rNYJaH03BNdX4GojrTLWAAF8cP+gV2rMNQoY3UIpW9/7Da3tRXgQkImkMAiRgYwi9odBPvYg+526h40gkBMcNmeLm66PMMPB8p1ohxbDDnxMRDHKjjD19wYAKZ2G55odTZx9igljwxTEd9m1ckfElwxOHxxsCOzpD/BGkD8BYw84+hH0FtOt9dGMEQT5Wl/Vq/jLNjvEmH4YLLYSJtj8MAuiKD5MxD+j88lblo7wB9zzsEGsqbr0E3bpz3j0vuR/v6b4ArY/AJWdvP6EJWlzBlrWf3VzYfAZfWWK829BCxX+fBRBpcFz9RyXxOtGzjAkDXYkdWqeNAQuPxMVpQJpzcQc/YGjMr0j65K3fE09b2UQYFTh31M3GWqI37dDuqglQMwlEePpjA9o5v4rCQFahCpePtkQd2OlpjtUJpfYljplTOGkIy3lyMkHRQxuMOzrJnEEI3OTiyi2l8tOX/b0eklgrr/dCF3QkmxVTtdNwevPO/b54PAvN0Y/3mPd1vzanTu2VWmB7PhvlnyQBdFYTST7IAztDvg7wgTHAwtUSwSP/zHfX5YM1yxTMc4rGThVGxrN1lRH4VUHSYlaIRO//uEC0FrGDpbB3KL+aUqO/yLZhAbUSod1ywcjfcynXg8Y0o9gewWc6PryGe/ZeY+2H+eodtPd4nbVZuSK5JkuYOm/6XyZ54rU5gr089XIVnZAWbo5ZjN47yP3lckTT2drEAbdcFmVM6nxC5jpwgcfH/3wVtiteKsDUooTAODR8y5iUWIFWuP4ZeW+I=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484ce4fd-b002-483a-c680-08db2f90432d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:28:05.4269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xe5fZkHdaAyRp3f/fzggXTbFkXYLzPD6Gl+0ivRUJGp/2ZyR6ddIXNlus2HnY25Ng1g8GL60TKtByS6fCKrSyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6061

On Tue, Mar 28, 2023 at 03:23:56PM +0200, Jan Beulich wrote:
> On 28.03.2023 15:04, Marek Marczykowski-Górecki wrote:
> > On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
> >> On 25.03.2023 03:49, Marek Marczykowski-Górecki wrote:
> >>> Some firmware/devices are found to not reset MSI-X properly, leaving
> >>> MASKALL set. Xen relies on initial state being both disabled.
> >>> Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
> >>> setting it due to msix->host_maskall or msix->guest_maskall. Clearing
> >>> just MASKALL might be unsafe if ENABLE is set, so clear them both.
> >>
> >> But pci_reset_msix_state() comes into play only when assigning a device
> >> to a DomU. If the tool stack doing a reset doesn't properly clear the
> >> bit, how would it be cleared the next time round (i.e. after the guest
> >> stopped and then possibly was started again)? It feels like the issue
> >> wants dealing with elsewhere, possibly in the tool stack.
> > 
> > I may be misremembering some details, but AFAIR Xen intercepts
> > toolstack's (or more generally: accesses from dom0) attempt to clean
> > this up and once it enters an inconsistent state (or rather: starts with
> > such at the start of the day), there was no way to clean it up.
> 
> Iirc Roger and you already discussed that there needs to be an
> indication of device reset having happened, so that Xen can resync
> from this "behind its back" operation. That would look to be the
> point/place where such inconsistencies should be eliminated.

I think that was a different conversation with Huang Rui related to
the AMD GPU work, see:

https://lore.kernel.org/xen-devel/ZBwtaceTNvCYksmR@Air-de-Roger/

I understood the problem Marek was trying to solve was that some
devices where initialized with the MASKALL bit set (likely by the
firmware?) and that prevented Xen from using them.  But now seeing the
further replies on this patch I'm unsure whether that's the case.

Thanks, Roger.

