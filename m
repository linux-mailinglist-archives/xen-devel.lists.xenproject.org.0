Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC8B70916B
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 10:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536741.835379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvCB-0003BX-Ny; Fri, 19 May 2023 08:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536741.835379; Fri, 19 May 2023 08:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzvCB-00039C-L1; Fri, 19 May 2023 08:10:39 +0000
Received: by outflank-mailman (input) for mailman id 536741;
 Fri, 19 May 2023 08:10:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kTyP=BI=citrix.com=prvs=49624ea57=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzvCA-000396-Mz
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 08:10:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a118e70f-f61c-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 10:10:35 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2023 04:10:30 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5690.namprd03.prod.outlook.com (2603:10b6:806:110::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 08:10:27 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 08:10:26 +0000
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
X-Inumbo-ID: a118e70f-f61c-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684483836;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KAFiJnlkzkUrxQEUmpeMiHZ2ov427VK2wOClmfbY/TE=;
  b=HVS4PV+TeLdh4dy9JhRIEu2DlvSu/O6eNAWqs9TYda82eJsXbjVcteWb
   RdoPahfEQvIRnSveTzvl1c7KTL8ZTuFmvQgOBDgHHXlWIG2sUBo8BWLNS
   BGzp3Xndz/IcFbmXYvR+fK95hbv/tu/z5KEbA+wmsmY0qADOm3pItbxKI
   M=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 108384577
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3DOwFqje8+6GabrAibXkqEzyX161jxEKZh0ujC45NGQN5FlHY01je
 htvXzjVbKuMYmv1c95+bYi1/UkC6pfXmoM3TAI/qitjHyMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QaPzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRfES4CdlOeq97m0e/ldLVSg9ouFpXkadZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGzYbI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjCNlCSODnqZaGhnWT6jUdNA9JemCw+9eZj2KjRe9nd
 0Mbr39GQa8asRbDosPGdwajvHeOsxoYWtxRO+438geAzuzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiIQ6lBfGVNtgOK+zkNzuGDv0z
 iyKrS4xnLEah4gA0KDT1UDKhTOl4ILAQQ886gzUWX+N5wZ1IoWiYuSVBUPz6P9BKMOVSweHt
 X1dwcyGtrlQXNeKiTCHR/gLEPex/fGZPTbAgFlpWZ486zCq/H3ldodViN1jGHpU3g8/UWeBS
 CfuVcl5vfe/4FPCgXdLXr+M
IronPort-HdrOrdr: A9a23:neeTWKiQwQc9X18Y41RZmI61NnBQXioji2hC6mlwRA09TyX5ra
 2TdZUgpHjJYVMqMk3I9uruBEDtex3hHNtOkOos1NSZLW3bUQmTTL2KhLGKq1Hd8m/Fh4xgPM
 9bGJSWY+eAaGSS4/ya3OG5eexQvOVu8sqT9JjjJ6EGd3AVV0lihT0JezpyCidNNW977QJSLu
 vn2iJAzQDQAEg/X4CAKVQuefPMnNHPnIKOW296O/Z2gDP+9Q9B8dTBYmOl4is=
X-Talos-CUID: =?us-ascii?q?9a23=3ARC2R52gb4Zj3ib3WYtXuhEi0dDJuNUTDw2+TPmO?=
 =?us-ascii?q?EWXc0FoPJd1qO9Zk4nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Abbs8dgw/mVcIV2vvrhvmAky9eWqaqKSCUU4xg8o?=
 =?us-ascii?q?pgMLeGwx1FyqDsQzrTYByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,176,1681185600"; 
   d="scan'208";a="108384577"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jF2qEkU3Elai6jkGzZODifUKuUKe8D2srE8mrV8Bjt4Ov5JDHNZtlferx8xbrctVOLjYmDTJQfRLBZVaNZcl449QvaY8YaW686lZub38oj4UCepQQpMfypcE3Gm++TL8KPvk0RLqhjYbTVGmH8dMJCQ/T3jp+5JORt45nFx4rE9iJjclWg6wTKQ2uyTo8V8AR7474z0UbxaRxRMBLGk447gst0HXJHuN7/BKNznkkd6bgahbyyIVQvrhvbUuC0pmAXEsJbXcRxMdLGBv8C2El7fGx+no/w+tm7we+Rwlhc9z2PDtNnQ2pPjEd6ghEYxE1Fxya7069wOuFLqAOCIxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJ5kDOw2hvHWWbUTawynwBSrz8QYr+54VSnF8CoZlv4=;
 b=BBZawzbkQmgK/uOeQSI/37RFicFQltUS6+e9VvYLzXW4tG/r6zu4SkM0zuH0zXPVIl0cUBcAdTxU7J0dzBx2RIVp1T0kiKhykWB3UCJ6aeQVX+dMmx1yPQYyy/jQjVp2svriTsxxQPeJ4P61d/bl5LJZ4eeLXW14ABTZVJ3L0i8OQr8uRSsRxfYW+JBqOEhO+uUub7JMQHrQkPRDnS3P0DXdlD8hDlSS2RkWqiWvE/wp3y5gtPpnkuHilDvv97M7LkGIeGHWpCf17jOgo5hloi9ZlH0SFbDyn0jog3+X1cAzGpVeRV2yYa9LWc1q+uL8qYRmEx3W8CtbZZLuQY7n/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJ5kDOw2hvHWWbUTawynwBSrz8QYr+54VSnF8CoZlv4=;
 b=RfPQFkYnHKg9Xw1e9E1tiMtDnOwiS2p2dfa2t7AdpqJS0HIOl3BSEfbdEj69jHIKf+9apMAfALsJXtYzHsTweDyzXbcNJZ+YbBDuFzBNOteqXojQVQYMNMDnVuN7V1JaIEJvNcSPfwFJPBCYhRlTsuCQw8XxxmfQy99BkzxR0wQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 19 May 2023 10:10:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
Message-ID: <ZGcu7EWW1cuNjwDA@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P123CA0135.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: 7544cd5f-74f9-4afb-c35e-08db584080b7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	izHV6LX47NlpHrf0xIooAiUTifhYd32RPsKrq4cUp73XQdlEd8rmOLl5tnKn6aDnekbqXVUP/xaXQ7Fu8EwFtpn7SSC9yZUUjl4gxVGAeMJEsTYw5dsMaEjzIppXzq8cZ6E/lBa73t0+QNpP3VIhTMB56HBMQWj4S6gwc7Jy/BD4UkpTVGZu9ujA79NJzZtPrlyJp+urs379khrKnii4DSrEavLJHpnfn0ojUL4Gh5m8WX0sAkNcg5VkHIEpVNNhZE76d//CCwM3+cdPWQDJJKVjbtljifagjdDyMZDQOX3hgN2M3KSUC/iLzCsoEORq+czsayvHBlm2JshIAu6lDWlg82VWtXtrB4hr9X+ghjDO3IlGw0OWjG93lhH1qrW7Hf9K325nR8EbqdRwZm4SM5wBJJ/N5/4HKUoOeDDDK46CfZYCsMepMOaykSqtsv6/qL8XNZBEzqjm6xtn+sZIOQPhYLSNPgauFkHnzH78nuI8JOxosA5HVx0wkTH8Ullvh80cg8Yx0zsUEzsY7WB8IW/0d8YpwoR12tYV7FFT+f8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(26005)(6512007)(9686003)(6506007)(966005)(85182001)(83380400001)(86362001)(38100700002)(82960400001)(186003)(33716001)(6486002)(5660300002)(478600001)(2906002)(316002)(6916009)(4326008)(8676002)(8936002)(41300700001)(66476007)(66556008)(66946007)(66899021)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0s4Y3Q3TEpZL3Z2YTl1SStEcmRNQkhZeVFab3VQRnFPQXAvWitkTXloem9a?=
 =?utf-8?B?QXJSbUQyMWVielZqSzhFUTQzRzZ6UUQ3Y1c3UXMxTXROYTlOZlVRc2NkNTFv?=
 =?utf-8?B?c1VHc01ndks2ZXRDNFRPcmxlbmpoZFNRQ3ZsK3RudUtmdElSMnp3a1BDeUZR?=
 =?utf-8?B?ZHpmMTFhdjIwT2FsN1VxL3REWWRrZFZKMDJybVZlN0NOcDRLeWFTcGlaUDQw?=
 =?utf-8?B?VCtoUndSUnVEbDVuQlJzOHZmQnRnYm4rVi9reVlqdWFPQ2JpWXVVdE9lOUpE?=
 =?utf-8?B?MUxmR1FJVnlCR3FiWXV3WVNqSzJoa0hQdVhOTElpdWw2YWVUT1Bmb3U4Wk5N?=
 =?utf-8?B?VlkrWGZMR2c4UjlXN3FNYnhQY1NsT3JMNXFGelF0Q1VXTXk2NGovRjZmdjE0?=
 =?utf-8?B?YmNzKzJnWDg5Wmp1NmluQUVvN0RJMmxtTDhtREorb3hDRkprT2dTR3gvTmdw?=
 =?utf-8?B?L3ZOd21yL0dvNisyY2M2bERoaG5POHdJb1p1YWZOc0hYb1RnMGUweElQK3ZZ?=
 =?utf-8?B?MHZ0YmVZVDMxVTVxLzNCb241SncvR1pwbDJFalRFQ0g5bGhFVkgvVG5wNjlw?=
 =?utf-8?B?R1hIUS9nc1JyeEpoMzRneWhaeHhURnlMM1UvejAzbGxlZlN4eUFVN2lvYktk?=
 =?utf-8?B?cHF3RmJsNEpBaEFMVWFPbjNXZStWaUVWNkl2RFRHQnJjNEVJUlFoL3N4ZENW?=
 =?utf-8?B?UGFCakZCVmY1akNJdnZSaklNWFhKV2lKTWxoSm9RbzEyTjRnSnVOVytaSEFR?=
 =?utf-8?B?d3VCMThWMTMwSFZ5aHpZcnc2cmVsQ2cxT3pwTCtSeXdncG5TcnZhMzhhQjJW?=
 =?utf-8?B?c0U1SE5RTHlJRjFlTDlYT0RIc0pYeXZZemdzeGQrRkh0TEgzZ2IvQTU3UEpM?=
 =?utf-8?B?QTNaT2llaU1XNzVTaDNVMjR2emNLVlkvSXQrTEpTZC91V2YzUURzWG9SL2Fq?=
 =?utf-8?B?aDNJVXhMcU1yQ2NzVXRIVStZTzdpdzVqL044aTRPYjFZMVN2Z1ErZlJUYzE2?=
 =?utf-8?B?OXdoK3FvR3libjF4VjRWZHhRSmdPQUQ1aHg0MzNYVEJUdHVCOTJ5eGVpcGxw?=
 =?utf-8?B?RERpL3Fjbnh4WVdqeXJCY0x6VGxTU1pDeTJIWDdHczdIVERCR2FsMmxZVm16?=
 =?utf-8?B?Y2tLcUVyQTBWTUw4ZVh6a1RSNWZlTGh4VjRMOTNKSmlEQUFQVVpOM2hrUHZt?=
 =?utf-8?B?T2M0bUplR3I3OWtTbU55UmY3RVJLajZHYTV1dzZRLzM3akI5aXNEZllYVEg1?=
 =?utf-8?B?bnRYcmkrSUtHeEVzQTFlTjFKVDZOS3I0d0RCVFR3S1VVd0J6T1B2WFdGR3VU?=
 =?utf-8?B?b1hBaWhQSG85czgvV0NRTlNGRWQ0L2tiQ3k4N1E3ZGZKMzVQem9CblRCazE5?=
 =?utf-8?B?a1d0KzE1OGMrcURXN3pGQmhGVkpMSU4zUzJ0S3Q1QitLcVJ0Wk5FV0JramFS?=
 =?utf-8?B?bUVZcTZIUExjOUJORG5ZZWdFRE9oVDRUK0hraVQxN2pSRXlXMmVxUmpXZjBI?=
 =?utf-8?B?R2N2aGRXMGIwaVdWaE5rZFE1QVdRbFRTVy9LVS9IWXlKV0gxN2xQZXdhU3lG?=
 =?utf-8?B?TVNDRDNRakRsMmlUUzV1UExHZlduaG5KWjVyS2F4dWpTOEcwSUxiRkRhUGVq?=
 =?utf-8?B?SVA1SXl2WHVrNVpmcUI3ZFlyWDBGSUFCeWFubEhqTXVCUlFHOUs3OEh3aUFo?=
 =?utf-8?B?MTlvMEhnZ1d3ZW50ck1zMExvOUZ5cFUwQU04VGk0bkhZVTBHdGFBSXZ5Yjc5?=
 =?utf-8?B?K1U3OWxINDBzNkJrejc0aUxQWTR5bjF2NnlTcGY2Z3JPWkRmeldMeXRZeG1l?=
 =?utf-8?B?Y0pVYTFHYjY0Y1hyUDlmL1U1SzBycndRaGpkMHBuSVVHU3ZYRjhNdXJFK084?=
 =?utf-8?B?U3RKdnkrYWRFZkZoOHRVVWRQOXpKVHhaMi9NSWVZZEg3R0wrR1ozSnl1UXM2?=
 =?utf-8?B?OUwzaXA4YmVndGt5ZVdDVFlYaGhDTENDM0xYRzllSGt6SzdZYU54RTF6bVd5?=
 =?utf-8?B?U1lQSWVHdlZwTC9aaUpSQTBXZTFpZ0krVkhmbzVrb2pZVkNZV2haUTZibFNJ?=
 =?utf-8?B?ejBxM3JhMDI0Mm5WajRvdXc2eFhMZnZadXQzM0VzMkFraEhRdVdGNFNYOTJK?=
 =?utf-8?B?VElCNjlqRkIwYTlUcFAwbk5pT2xCdnlsNWFrTEV0ZDFuSjBBblJ3TmczODNO?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qx3d06sXzRXrYfNVeJXZuChEceG3iEzXyEH4lclt2MxR/fn6Nhejt0b28n/JGdirmF8tR2H8WUE0Drc2uChUYBc/0btZoFDilQC4+6wGjabbmpdB9VUfhvAAE6FO1ajbwTEPwEPxfxZD7UKV+eEtt39tAxYChxG4u1LBjuDDL840No3cQY4i/fkgXP+seP3HBMeZB1sOTuL7DX1deoQUIPJgkWWTIXqHRXi/erogDNFpP2Dg5nBYF6v74V4jThWvL7Ozc+2aYvu5uK0I7zayILjF4bM1PiH1zVyVkMXoYbxkxqJ053OHV62HGEfb7536F/S5DyBlp5Jnd4AJY+1ONCQ7ISAmoOTz814x8OGzdJ9m9fhx9R2l+sPLDOmcsSY9yglSd6UScUY1b/Ycsf2NucXRW21WemQggL73mXIxB5Boo8LfvBpQUGYjZPQk4/RDssXYwOvc6kRyxfIS7LmV+mqfqbDSx8ZgDPdcVBZjPa48ExkDByoIawJ4RX3H4nJh0pRCUYaR2XcNvsWzKfuhmoeSS8MJ7YPgwLwpLi+T8xPdyzYtcH0tZ6vfSuq+eW0wyffvug+Dz2Fs+TUcBhOe1pabcpGw+wAmW+z61bMscMa51HpTWe93tDSxj7BnKJUbXLU4HXq2EBMeLR9tBEBKtqq3WVgdi5rdnQ0+RzZUUdVrEpaxC++jVsT1/n5ZsIMccZtUxoiEaIZThSmP7W3bqJLOsHe0Bmxuu+K0KzmTb1tj0/+jejZ0+foAe4tUQQm3gA1dhV9b39fJ82QWj2i2DcneYv93w2oOxmNWi4QS8t3l8qlRVELCjHvmpkF+09bDwQ7ApYkL+/4/VCyCR9xW/ppm5B1WB3JfmqPYrtrzK9sKcycl7gQ63X2zka8lBnK+bMngRr3XQMpfDvS2IOrPV/SDO7O0AFvlDKl7YkSnVlk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7544cd5f-74f9-4afb-c35e-08db584080b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:10:26.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JN0bg7aHsvvlGpOrFJUwRmpLnlK366WdZIVSIv6ANl8frHaaVFoNLPS2/2eJW63I8yM5A+D6/homHjvfeevZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5690

On Thu, May 18, 2023 at 06:46:52PM -0700, Stefano Stabellini wrote:
> On Thu, 18 May 2023, Roger Pau Monné wrote:
> > On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
> > > Hi all,
> > > 
> > > I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
> > > test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
> > > Zen3 system and we already have a few successful tests with it, see
> > > automation/gitlab-ci/test.yaml.
> > > 
> > > We managed to narrow down the issue to a console problem. We are
> > > currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
> > > options, it works with PV Dom0 and it is using a PCI UART card.
> > > 
> > > In the case of Dom0 PVH:
> > > - it works without console=com1
> > > - it works with console=com1 and with the patch appended below
> > > - it doesn't work otherwise and crashes with this error:
> > > https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> > 
> > Jan also noticed this, and we have a ticket for it in gitlab:
> > 
> > https://gitlab.com/xen-project/xen/-/issues/85
> > 
> > > What is the right way to fix it?
> > 
> > I think the right fix is to simply avoid hidden devices from being
> > handled by vPCI, in any case such devices won't work propewrly with
> > vPCI because they are in use by Xen, and so any cached information by
> > vPCI is likely to become stable as Xen can modify the device without
> > vPCI noticing.
> > 
> > I think the chunk below should help.  It's not clear to me however how
> > hidden devices should be handled, is the intention to completely hide
> > such devices from dom0?
> 
> I like the idea but the patch below still failed:
> 
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0402682b0>] R drivers/vpci/header.c#modify_bars+0x2b3/0x44d
> (XEN)    [<ffff82d040268714>] F drivers/vpci/header.c#init_bars+0x2ca/0x372
> (XEN)    [<ffff82d0402673b3>] F vpci_add_handlers+0xd5/0x10a
> (XEN)    [<ffff82d0404408b9>] F drivers/passthrough/pci.c#setup_one_hwdom_device+0x73/0x97
> (XEN)    [<ffff82d0404409b0>] F drivers/passthrough/pci.c#_setup_hwdom_pci_devices+0x63/0x15b
> (XEN)    [<ffff82d04027df08>] F drivers/passthrough/pci.c#pci_segments_iterate+0x43/0x69
> (XEN)    [<ffff82d040440e29>] F setup_hwdom_pci_devices+0x25/0x2c
> (XEN)    [<ffff82d04043cb1a>] F drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xd4/0xdd
> (XEN)    [<ffff82d0404403c9>] F iommu_hwdom_init+0x49/0x53
> (XEN)    [<ffff82d04045175e>] F dom0_construct_pvh+0x160/0x138d
> (XEN)    [<ffff82d040468914>] F construct_dom0+0x5c/0xb7
> (XEN)    [<ffff82d0404619c1>] F __start_xen+0x2423/0x272d
> (XEN)    [<ffff82d040203344>] F __high_start+0x94/0xa0
> 
> I haven't managed to figure out why yet.

Do you have some other patches applied?

I've tested this by manually hiding a device on my system and can
confirm that without the fix I hit the ASSERT, but with the patch
applied I no longer hit it.  I have no idea how can you get into
init_bars if the device is hidden and thus belongs to dom_xen.

FWIW, I've used the following chunk to make a device RO and enable
memory decoding:

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 07d1986d330a..e4de372af7c9 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1111,6 +1111,16 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
 {
     struct setup_hwdom *ctxt = arg;
     int bus, devfn;
+    pci_sbdf_t hide = {
+        .seg = 0,
+        .bus = 0,
+        .dev = 8,
+        .fn = 0,
+    };
+    uint16_t cmd = pci_conf_read16(hide, PCI_COMMAND);
+
+    pci_conf_write16(hide, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
+    printk("hide dev: %d\n", pci_ro_device(0, 0, PCI_DEVFN(8, 0)));
 
     for ( bus = 0; bus < 256; bus++ )
     {

