Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466986C318D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 13:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512582.792545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peazD-0008AN-8Z; Tue, 21 Mar 2023 12:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512582.792545; Tue, 21 Mar 2023 12:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peazD-00087g-5A; Tue, 21 Mar 2023 12:21:07 +0000
Received: by outflank-mailman (input) for mailman id 512582;
 Tue, 21 Mar 2023 12:21:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKE/=7N=citrix.com=prvs=437062dd9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1peazB-00087a-Nv
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 12:21:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8ace678-c7e2-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 13:21:04 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 08:21:00 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SN7PR03MB7058.namprd03.prod.outlook.com (2603:10b6:806:353::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 12:20:59 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 12:20:59 +0000
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
X-Inumbo-ID: d8ace678-c7e2-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679401264;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RjLxWxBX2FlI+vCKPPgm0AeutULjUDatqgPLyRR/Cx4=;
  b=Wa8nh0+8rKSWaaCPUpXwFx/rINnDc0VT8mTjF3hXlOV+E2XFY1b3wyRe
   d5epiJ0URaFbFAgkTSllp2iapwo/EeoL724mzI9e/bCDVqB//QEwIdT8u
   IxnYre9HR6yb/mRBy7N1mJ8UqIeE8Uxiu/us+PUtijQDiNh93aFEJXuhf
   I=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 104113848
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7CAhWKjK5r2v/AWxia8JUp8WX161CRAKZh0ujC45NGQN5FlHY01je
 htvUWDSbPyDYWbzf9Agadm2/EIP75SDxtVrHAM5/H0yEi0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWHzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQjczA0RDSG39mI+7W2e+lKmO58F9H0adZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGybrI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjBNtLT+3kppaGhnWc3kA3BRErf2KQoMb+hneRZ5VZD
 FQbr39GQa8asRbDosPGdwexsTiEoxcaVPJZFuF84waIooLW6QuEAmkPThZadccr8sQxQFQC/
 1uEj9rvCTF19pGYVHmd+628pDa+fyMSKAcqTi8eTBAZ4tDl5qI0gxTOQf5qFaLzhdrwcRnL3
 z2VpTIiwZUSicIG3b+y+1zvijeg4JPOS2Yd7BjNTGuh6Q9+e4eNaImh6Fyd5vFFRK65SV+Ou
 HUFwo6+8ekIArmEkSDLS+IIdJmL+vKEOXvugVdpELEo8jjr8HmmFahy4Sh/LUEvGcYJfxfgZ
 UOVsgRUjLdIJ2ejZ6JzZ4O3CuwpwLLmGNCjUerbBvJeb540eAKZ8SVGYU+Lw3urgEUqibs4O
 5qQbYCrF3lyNEh85D+/RuNY2rhywCk7nDrXXcqikErh1qeCbnmIT7tDKEGJcu0y8KKDpkPS7
 spbMMyJjR5YVYUSfxXqzGLaFnhSRVBTOHw8g5U/mjKrSua+JFwcNg==
IronPort-HdrOrdr: A9a23:/sDPeKC2TxuWMVflHeg/sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssQIb6Ku90ci7MDrhHPtOjbX5Uo3SODUO1FHIEGgm1/qa/9SCIVy3ygc+79
 YGT0EWMrSZYjZHZITBkW+F+r0bsbq6GdWT9ILjJgBWPGNXgs9bjztRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayAqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYD39vac7R6e031loqqu9jJxPr3MtiHTEESttu+cXvUvZ1RFhkF3nAjg0idprD
 CGmWZbAy060QKtQojym2qn5+Co6kdT11byjVCfmnftusr/WXYzDNdAn5tQdl/D51Mnp8wU6t
 M+44u1jeskMfr7plWJ2/HYExVx0kakq3srluAey3RZTIsFcbdU6YgS5llcHpsMFD/zrNlPKp
 gZMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wi0EY2MsclHEd849Vcegy28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBQnBNWqDSG6XZ53v+0i926IfzI9Fld1CIqZ4s6fasK
 6xLm9liQ==
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="104113848"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoKiFESH8TwSR5jr8tmoPbx0RNbjTuG61rELXO8VEQV8K8kgTAyt3gdwuxlbliq6Y1RfWYdhPEd1ez6MnQE8kDHfjRr1rlNYwvwkJRHACVHV8zHXKctvCUThOvSmePkQbz/JXWB7VU7dZZis57TdyOPAYUuLX/jgCpqYQw9YTMA8CvKWUBSBxkSD3V+PjA//G3umkUpNXAtX9EcNNHWldThZ106gKT44eJYo5Wg1QgQaf2JWD22pkFevMJq6/lmp6JufB9yEuqHu55fIlnyO2+nIUSAJ1E4rb380kF6S0X2+gLT3LatoDh7NtUEkECRWWX9u5aCK2wuQ7vCYhF8dcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mphh6myKqhkw1jrGBoQ+QE7HbFwLDebccK1H7a1gCig=;
 b=l3mJLvjbLWqiTeLK/YUInXJ0+u/3lNdEeVPTLKo5awfJvZxGQlCsk5qTFG+9tcTMA2JWJCLJEXNxmIhtpDdYbLGYiPwqLQ+7tG/qlkD/LtdeiSYknH8BFg24tJDxIoHk7i7VDIRCcEWs+mswDp6tAxd6VngQs+E4Q3ntoyAoE11HogBskirwnbVdMkklLzunpfPtmbi+xuEl2KqoSplzOgbVwMX2EtKGhpI97/CHRm/89YdtaEIh0a+vQG91mtN2D3hdTrPS1CAkMeqAivAwkcXN3voBcW+ZxFkSMqMR74Owso9TQbinxgHr+US+8wA6GtuMrRPJrPYYl9R7OzVohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mphh6myKqhkw1jrGBoQ+QE7HbFwLDebccK1H7a1gCig=;
 b=w6XxOQTr7wmkV3aEEJlvA3E4aRNe70lXcgf3oO8diCLapyVz/1LhsvBVgGTRvTKuQHY+S3TjQVD2r7oJf83LvjG9JtdLvT9SwYOBIulmqWX1NdwTR44nroRp4A+GmLj4J3SuCiEGZfulawzJ3NMW+nJErkXvqPKrpcgJZHTqAeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Mar 2023 13:20:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBmhJfBPtdLPi7X/@Air-de-Roger>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
 <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZBmZxnyZWrni57Ry@amd.com>
X-ClientProxiedBy: LO2P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::32) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SN7PR03MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d35e30-b103-46f0-6571-08db2a06ba4d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+WK12ynwRckkmgSE8nSSbdq/SOoUYy5kvqNZ4irU3hpBI63nMWG/rqxS4OAzKAvqjGGDV9kzr3zfN/C90WIOxbXw5CK2iaDkM4kkVXicxDNueb5ZQyfhwqgbCmYGxSDhH0TYwZ4TlBfNMt4hSBa33kHGKOIGhxinBij0+wZcxwUJ3FLAXS231eWd5rL9RzEWaUn2uv1v6j4D/dMGAzc/kB6lxu/i9Hy9u4oCt4S6rbHgFTu2pdtXdFZ36s7aXis8gwpMnmHfb+/ghP/3cYcl3xSvdvvdWLK6em3dcgzYOfjyWnay26wBIk9t7Yzp+Y5Pu7MIMC+Frd8tOhVGNUiM87IfDrhJn9G/NZDA3Xid+UX+mXU1zKeYxdejWHQQg+61ddYfsNSHIbhM7RMVTpW3ORz5gNvZqEJLrotSdILZ4DgvoFd+h+NsRwDWKPj1L4H+sDTIsPC9EkeJYjQF5Rvvw0o8o9semVryZIyCLbz0FJWI5d2A8MJFmNMg1bdTCstXJ12FvioixIlcdu5gdWXB7QNu9TIXPHUz5ynwqmaIfvdyS7WT1WCjFOzXeA2nGZbTKf7qFGhapGuX7G8s+ZvzsIW35FQNGRr4X99NjCT2AYZqgENXvLOvKfzjL1D0eKDP0WghrPDf9QX+VvvHA6J0JA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199018)(6666004)(186003)(9686003)(478600001)(26005)(8676002)(6486002)(83380400001)(6506007)(54906003)(6512007)(53546011)(316002)(66556008)(66476007)(6916009)(66946007)(8936002)(5660300002)(41300700001)(7416002)(38100700002)(4326008)(82960400001)(2906002)(85182001)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1hNbjFERlZneGlnb2tCV1JpU1RoV3ptZWdwbHNBVGxmR203WDJzNFZvdkVs?=
 =?utf-8?B?bHpSN2t6UlJXeFF0SE1UdnBrOWtUTFJnNUxvM09sMkdtQTBKc0dLaVFPc1JO?=
 =?utf-8?B?TWE0RGJKb21UQzFDTHlMRnppOWlqUjdtUzllWENWQnNFUFpqL1NJTjhjc25l?=
 =?utf-8?B?b3dMTlJPbjhmUEhldGp4Yzhha2lMWGJySUpMMVVIQnJJdkpONkk0MzJubVNa?=
 =?utf-8?B?QzJRK2xmTVJsUEI5bTY0NXdMcmNnSHltckJ1RXk5eTZmdjd4RWkrSFhiTHQ4?=
 =?utf-8?B?MjRrUnQxNG9qamxMZExjVGRUMStuSG1HWmEweEo0eUtzb0ZQaVl2Y1FxQnd0?=
 =?utf-8?B?VlM1eVVVT0hDdXRGUjRDUHFQL2lMUVUyLzA3M0tIVHN1US9sS0kvVzNlc2pm?=
 =?utf-8?B?cUJqQlRGdXFSbWEwTkV4MFBlMjhiSkpsQW5yR2ZqYVBEOG9XVUs5T3BYYVZN?=
 =?utf-8?B?bnV0VEluR2FnakRRY3JCOGozTnJEL2d3TEZZMWNSTVR5SHJRSU1aUE8vbThB?=
 =?utf-8?B?akhaNHIrdXBVRTFzZzA0RzducEcxbFlVTkh4OElhSmNXeXVYUFlycmNhaFZ4?=
 =?utf-8?B?ZHNMT0ZUYlRyWlRUUndrWnJjTmRmTlVJOXplL2VnYVoxZnlPcnJ4eHNPQUIy?=
 =?utf-8?B?OGR4eUJvdnNpa2c0ZHNCYWpnS05LOGNGUDJPbkRiblBDaEI1ZTdBWjZXWVdh?=
 =?utf-8?B?b1FSZld4a2t2OFFpdW9tNm9uRVhzaUFwK09OKzNhVTlYMEZ2ZURzZlJYNEFm?=
 =?utf-8?B?NkxYTTJYc0VQM204U25NSUtXekxvWWNnQWZsdGF5SEtSS290akZGWFdzcDdz?=
 =?utf-8?B?c2ZkUDlHMjNzRlUycFpHelRLUUVYdjBvREh2dzhwN096a3B0R21WQUhSSlZ0?=
 =?utf-8?B?YXZZSnRnc0t1UStvTWdEeXBNd3BONENxUkNEK3hYUmVFeGRWejhNUHlubUFm?=
 =?utf-8?B?WW1iYkR1QlVCTm1Dajg3NXBGSVBycGkvQ00zdjZ0TnkyZ3VvQlpDUDZacldo?=
 =?utf-8?B?Q0V0K2dpa0FuRHppS0JET2lpejhUalZ0eTduSjJRbGpmRVFnYnM4RjQ0QTl6?=
 =?utf-8?B?TFp5Um8vVTBQMDR0M1RIMmRMNWM4ZzlBOG9neDFrTWNoVmVYYWdGSnlQTitq?=
 =?utf-8?B?ek5iT3hFR29KY00waU9Id2pjTWFqZXRRRHE5UG5ib2QzeTVoK3hpSlBubVRK?=
 =?utf-8?B?Q1l6dmt2YThwamVsNkcyM1FHQkcwcnI4ZjJjbVBqOXBiUG5keXA1QkR4ZDNh?=
 =?utf-8?B?ZnVhS0x5WW1mZGUzaDBYK1lhOHRpU1N5WnU1UmJOOWFmcVRCMTBtRTdZVEx5?=
 =?utf-8?B?K0xsWnZzRDViVEZ5cjhmYnlZbHZpU29aRjd1N3Uwa2R2QmF6bmNXbmRSL21z?=
 =?utf-8?B?NVJ5NlZnNEhUNHZRRDN0SFJwZXdOZ2htR25RaS9lRCtwYklLa1ZaSWI4Q3VO?=
 =?utf-8?B?bm9kUGZCK1NHVm5YYmN4aHlWcnczK0dmeUYwL1JEcTlUbXFKWkJFZmVRL08z?=
 =?utf-8?B?UEpmY3BGZjVOZXpnemU2OEZMK2x3QkhFeTk2cExaVEZMWENrc2huRGhwU2VD?=
 =?utf-8?B?RE9ET05OOHBKR2dUNy9RbVF3RUwzdE9rcDlnbU9SNEQwMEhYcDVZcHlEaEU0?=
 =?utf-8?B?WmhoUFIzVFQ0cmV2U05WMWhaS2RIVnVOWDl0dlpSaVhtNTZ3Zlo3NzZYYUtv?=
 =?utf-8?B?dENMQ29OakhhMHBONXlqRkxqb0grN2tWNnFMdFBoTXFTbWoya1dXU0VXWHgw?=
 =?utf-8?B?dTQ5WWZlWmxKci9zQllOTzRWS25YMC9UWGZTNTlDeVJ1ZlQ2OFZ1N3NEa2pR?=
 =?utf-8?B?TEM1U01rdFZvU2ZNV1FwQUJpa2ZORnIyZlpzN21LYlZmV2wxMVBnV1JLQzM4?=
 =?utf-8?B?L3o5SDI0bVRmc3FoR3ZZa08vWWlZODZWUlJ3ODd4MExlRDNtK0FzRldyemZX?=
 =?utf-8?B?WnA1b2JCQ0pUVjBzRGVIbHZYOGpxL3NMZWdxOG16RUJBL2ltS25MTUR0bzhV?=
 =?utf-8?B?SGVqNVlsaXpJUEVYWmJheHNvNHVqdFdUcTlyWjA2ZzRZYjZiRG8rVytoNnVU?=
 =?utf-8?B?Y1I4Vkl5WDdqWVM2dnZoR1lWVzlhNzRSbVdCNVRSdWNxVmF1WUllMkVFbGdL?=
 =?utf-8?B?bW1kSnJOUVFTeWpOV3VVQkNaK0NWWjBPQXl6aUNIWWt3cWpSOTU4bmhhZE5C?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gdt5cZsH/dl3QOPIA9OHfqYuKlgHjHIsYsacHWuG4sphefqEn9MnkH1lWt4BDodEcVc4yYpB9bJE8aMjr0A76RHg9hfKIN+9hPiOYCr2a5ettkcxyrOZ4RV3QY1PDXnjMYSODP+TciykndAnpyXJ2/PcNiw+YJi2vtcW7M/9w2KGNXPhiy2zwT7ACnooVvmfYwAvZmhowH79Y4QBgXxJcYF5tf4e6R+TASGXlcOfaBoZ1S/sFI4E1vDlSA90B8iXeW4bzocgjcznxdH8PE613syEwBdSgu08Cw9u0muxeaf3Cayri4WSrI/8fe/Zt1T6g3htuPVFzSCHhhCgG1cu/y0T3FFvZDvPsq8jpI3ehJ/jmLnt2el2snrqegx+Xu3zK26H9uKfIxrLcnxSd7G8WHy5IAnC3Oo7FR2Lzy3XjbiEabRUkIW27hP+TGjWjk9Zys9TPDpn0cWS51bOKAuiS+Z77pwM0LRXZ8T2K9C6Uw8CpfCcajMDZNHqYYxa+cv2Icqw5efoSng5Eu7QSKjXyl9wcivgDc7OJv7tSsr6Ej0yz0p42//LhfD0SymEOWhM05stLvHemTQLgDSLBo+8oiYPFFUp8//kpOAFgazRNNOmDBurrU1Hl26Ptud5W7fIYrxHFf01RMV/zzJWIyaRnhJcL7p8pP4b1GRf08NhcvW1bCGpRX7AAwcCPOEUEejLwKVmRJNXB8kk824QTO9hgc39cq1l+VbwQrEZ/UIRnHP3De0RxsyhtWznG/L6RelLZ8I+MOJ3M6R5KmxpPLYzgyyLiBcGvYAN+CrrXTp9c0s9t4cu1ETl0LVDj84i86wFYzo2ZENvE1AsNt9uYzvDXaKdyNGZ6jUT+qmzN/6lS2S8Ex4kesTTTPU5x8M6nV95
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d35e30-b103-46f0-6571-08db2a06ba4d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 12:20:58.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hef5/41JcP4TiuSw+Q50BMW310ZR4IpZ0cb9+0amfnxTEZ6VIFYrQngJiZr7nB8DSDEXFC7J4zHJXopE0v+QRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7058

On Tue, Mar 21, 2023 at 07:49:26PM +0800, Huang Rui wrote:
> On Tue, Mar 21, 2023 at 06:20:03PM +0800, Jan Beulich wrote:
> > On 21.03.2023 11:14, Huang Rui wrote:
> > > On Tue, Mar 21, 2023 at 05:41:57PM +0800, Jan Beulich wrote:
> > >> On 21.03.2023 10:36, Huang Rui wrote:
> > >>> On Wed, Mar 15, 2023 at 12:02:35AM +0800, Jan Beulich wrote:
> > >>>> On 12.03.2023 08:54, Huang Rui wrote:
> > >>>>> --- a/xen/drivers/vpci/header.c
> > >>>>> +++ b/xen/drivers/vpci/header.c
> > >>>>> @@ -392,7 +392,7 @@ static void cf_check bar_write(
> > >>>>>       * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
> > >>>>>       * writes as long as the BAR is not mapped into the p2m.
> > >>>>>       */
> > >>>>> -    if ( bar->enabled )
> > >>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> > >>>>>      {
> > >>>>>          /* If the value written is the current one avoid printing a warning. */
> > >>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> > >>>>
> > >>>> ... bar->enabled doesn't properly reflect the necessary state? It
> > >>>> generally shouldn't be necessary to look at the physical device's
> > >>>> state here.
> > >>>>
> > >>>> Furthermore when you make a change in a case like this, the
> > >>>> accompanying comment also needs updating (which might have clarified
> > >>>> what, if anything, has been wrong).
> > >>>>
> > >>>
> > >>> That is the problem that we start domU at the first time, the enable flag
> > >>> will be set while the passthrough device would like to write the real pcie
> > >>> bar on the host.
> > >>
> > >> A pass-through device (i.e. one already owned by a DomU) should never
> > >> be allowed to write to the real BAR. But it's not clear whether I'm not
> > >> misinterpreting what you said ...
> > >>
> > > 
> > > OK. Thanks to clarify this. May I know how does a passthrough device modify
> > > pci bar with correct behavior on Xen?
> > 
> > A pass-through device may write to the virtual BAR, changing where in its
> > own memory space the MMIO range appears. But it cannot (and may not) alter
> > where in host memory space the (physical) MMIO range appears.
> > 
> 
> Thanks, but we found if dom0 is PV domain, the passthrough device will
> access this function to write the real bar.

I'm very confused now, are you trying to use vPCI with HVM domains?

As I understood it you are attempting to enable PCI passthrough for
HVM guests from a PVH dom0, but now you say your dom0 is PV?

Thanks, Roger.

