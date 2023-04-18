Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4956E5DB7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 11:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522711.812246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohrA-0007Lr-V8; Tue, 18 Apr 2023 09:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522711.812246; Tue, 18 Apr 2023 09:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohrA-0007IV-Rs; Tue, 18 Apr 2023 09:42:36 +0000
Received: by outflank-mailman (input) for mailman id 522711;
 Tue, 18 Apr 2023 09:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pohr9-0007IP-6y
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 09:42:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 573e3221-ddcd-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 11:42:33 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 05:42:30 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5439.namprd03.prod.outlook.com (2603:10b6:a03:286::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 09:42:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:42:29 +0000
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
X-Inumbo-ID: 573e3221-ddcd-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681810953;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zMiO3xal1ozoVCsIdD1sflDutLfJhaVg7wxxIE9rD6I=;
  b=f9S+vsP/8nh+c/q8sVkZoioHFK6sm17TjelNEUCh/xGM0tW5Bk1KbdDo
   1YC1fbxiRCC3Z0VilT78Ay7Dd2HTJnS232nhCywfafEZjn4YTT4MGxlWY
   FHi8mmYK2omDLp1OJcKrtAlUE61aZhGXoJZdkRZhAtU/UCYDDaKz8yh2w
   o=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 105274832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OmykAKthamUYH1KUxUq73+W0ZOfnVHBfMUV32f8akzHdYApBsoF/q
 tZmKW2EbPiNMTCneY10YY6wp0oP75HXz4JgHlM/+S9jQS1H+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHxyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGh4dRyqvjOOKnInmVuhO3u47LOL1BdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAN9IS+HoraQCbFu7+XFDBjYpdH+CjfChuFafUIN6E
 3AQw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRVLufgcBRAoBptXm/oc6i0uVSs45SfDlyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:DSNR7a9FlyEUfUm70MBuk+D+I+orL9Y04lQ7vn2ZESYlFPBxl6
 iV/MjzpiWE8Qr5OUtQ5OxoXZPqfZqyz+8Q3WB8B9mftWrdyReVxeNZnOzfKlTbckWSmoFgPM
 9bAtdD4bbLfDtHZLPBkWyF+qEbsbu6Gc6T5Ns2yU0GceggUdAZ0+4wMHfhLqRZfng9OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3A1Kb2AWqrvzV7XiIMw+GHhMPmUfILYlTn4HzRHxO?=
 =?us-ascii?q?DVHpoauW/UV+75poxxg=3D=3D?=
X-Talos-MUID: 9a23:/0jJ7wuaQp5+cUyUTc2nuywyOuxXwoCXJEkVo40nsJihDRB0AmLI
X-IronPort-AV: E=Sophos;i="5.99,206,1677560400"; 
   d="scan'208";a="105274832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5HCY8kGzAoHKtxsj28D3b7ymECnzOp3gNkIK+ieFfnak/pmCUOGDSFYymTPYh3SnL608bgRv2x7gWJDmXv+xdS38wwBJYFathg/eLJzSJ9cDLinvlWDby4MdWSga2M65mYb9XXY7jmfJ7H6Kre2YQjBvza8yMXNju5/wk7NUUSEAH86RETmpOZZdeOjlY5SV86yEps3BykblQvDRzcZsUzfCVoNsJiNE8fia7lyG7d48OXAg7zux1EURwTr6lpRKu7ZfphW5tsLz5lso6qkTs34EE+7rMQOoCLaxzODDwPb5Oc6rykuSdC36jHb2M7gjzJWW2zbByVxFFMf28D/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AIfNzysz2UKvwfdQdACRz8x/Ch40xI0zk4GKK/TY0A=;
 b=fgrN4YbF+X9t0l6aH7+ALJhPP5S6ORTkVh3Pi3XT+G1WGymggCZKB6ZENXfV8o4U+emiXrxTMcbSLEdYwvPbbl1Xa4UPhCRbC5pZ70IJmXKjyNei8H7qezLMGTQEjBByE4ZDZjo+8cljzKY5h697FxecFcR4PO+cpTvdwFv8CrRkTXdRm14o4E7Vl9jwmcBuLoV4WV6uFcn5+viCrdm/NHc9yB52ou3ii8l9JHUBRiFtOLfXdLjXf5gU9HzwFrXOIIe50omtvh7ufpxEr99Mr4Da/5Evr5+Gdk9pm5NDahtFwxGFvUZER88qR5D+d61w2OWYKD7DKOyrgzMVlTf0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AIfNzysz2UKvwfdQdACRz8x/Ch40xI0zk4GKK/TY0A=;
 b=KNN9FZk4GtBbhoahwhmLaHDpGNF7h49CtEz62AaKHlR0j2VLT4NvXUoHornINontASi8QJ4cP3KDrTz6QjqmvnIPwc5mTqgpc81nqR8dwJDd78naJ++dnvR3OJ4HSlKJrX0Pze5s0CDPxqy9fjk3Er6Kg5dizCKKjZ+DQ2+w3h0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Apr 2023 11:42:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: cpu{id,}_policy_updated() can be static
Message-ID: <ZD5l/y15PkJS8jbw@Air-de-Roger>
References: <a24ace58-2ac5-6152-c42b-0037355ce9c4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a24ace58-2ac5-6152-c42b-0037355ce9c4@suse.com>
X-ClientProxiedBy: LNXP265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::31) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5439:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8b182e-5d59-4aeb-6cd4-08db3ff139c1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kO+oPgxm+2w0HMgrDn/63o96NW9lsroRnWO76/88QG/wSbz/jPY8WM1aSQ7swrAksyoijiqjeoBqQrdzD8Fa/UnbVnev4ZzVvMbrFfcLN4Z0w2vDhbZSDtXFef2VbcXJIThl/HFT487HE6Ro83zwM+SVWV4zlBsi1ktu7KZsvbd1Zu/gOHobU8LnG8hSeTja+O/zEpnOYf/C+E7A6GDN1zwp42er3UsWmaliB6Uv0CEq6AF+0Wkm5kNQ1XGUOR7NXJaRpgGrOVgvxwHaYTO+hSJd192n0BMlrTx2vmzIU/xJbTnbG7A4YAETs3+A5mLfb0u32jS6ru1fAfDGRtLteCUHYfT0CA7QTUoktHJLCWQDScJiaPQuNClwEBXPqSlEmIdGstXhjjlqt7fxekaz7xQOog+OYJV1R4rzH4jCl/JJZh8vBkXnlWIHZ57xjx5xrTeavCLb9b+VboLsCR48qePQhSKtf4Uobx9ApLybdxi9jsi/qKF59RjaZVq8aQmUOGYc/LgWkPiOVmcfN+RSeZ1szyPIw7QFmb6VjiPs8SQ8RYfjcEBykgmd/zbuCD3D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6666004)(6486002)(478600001)(86362001)(26005)(83380400001)(85182001)(6512007)(9686003)(6506007)(186003)(82960400001)(38100700002)(33716001)(66556008)(66946007)(66476007)(4744005)(316002)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(41300700001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFRxOXd2c3NPbkhZTTdJMDBwYXhFbnl5dHhvdDhPMWx5aUVFZ29qRG1WRnJI?=
 =?utf-8?B?c01xN2U4cGd1NFZtejV0M3lRQXk5a3JXU3NWWXh3RzBFSTBHbVg3VkNEc0ZC?=
 =?utf-8?B?WE5JaDBKUVArZE51YktkdHBNN01uNnllRnJYM09FRk9CQXlDc0V6MlhBcmlP?=
 =?utf-8?B?YUM1cldSNjNFNEkxMk5mc0lld2tlemVMeWNmSmFTK3FFbGp2aktLZTVqL0Rr?=
 =?utf-8?B?WGFJV3lSY0lFTGR2QjYvYXVxcStySXJuTi9acFNEdDJkNmdtVG9RanRtOC9J?=
 =?utf-8?B?bGxjRmdQanpMMlVSeFlPWlNTQktwNG1PRTV4VG14bWVrMWQyc2JuQldOdnp6?=
 =?utf-8?B?cUw0Yjl2NWlUb2NRcDY5TXVDR2U2b1JkMWJXOWc0RUYwSEtLRm5FY1ZOR2tp?=
 =?utf-8?B?a0kxZFc2eHVQdUVhNFQyeGtSVDlZUmtOMEd3N1UrVzRmNWczRTZXMWxIdWlw?=
 =?utf-8?B?aFpIV0NNU2RXL0lsQ3Y2SFk1NFVxbTFhS0hWQTA1a2NaaHJ3RDZFSjhVK1dx?=
 =?utf-8?B?Q2NyaTdNajhxTytCTjFTSHpqY3pLNWFCYkRwSGpYamF6N2NtYXNpN3VRc1Zo?=
 =?utf-8?B?VzhtTmRLamI5T3R3TXVnc0ROMnhBUFF3R25zQU8rTmxiRzVraWJhSHhJb0VC?=
 =?utf-8?B?MXFxeHdBMnlzeWIwS0gvTlp5VFZpVEt4WnZJWWN0RmMyQ0M3Mk1EVnhoakNk?=
 =?utf-8?B?VVY1L1dpZnVhNDhNOGxHUWlYa3l0MlFxSkZ6TW1CbGJBOCtUNFpVWnA3cmFl?=
 =?utf-8?B?ZnBOd3dPU0JmSHJOM1VIZzErYVFEWHY2YUZwTHhaMk5lV1I0NjlHclBaQXhi?=
 =?utf-8?B?ZTVIeUJoWGVGOFc5U3pWcFdsRk9uNEJBSUk4blU0ZHBPTXJoM2hXK1RRaUhG?=
 =?utf-8?B?TUVMZFZmMWVPUE9ISWhEenduUGYvakh1MTA4T3Y5emdUeTdQRml1YUdoSzls?=
 =?utf-8?B?MEtDNjJNRzBxaDJEYVE5bUZhUEVSZWlkN0xBLzlmKzdieWxrWmhYOFdBeXdK?=
 =?utf-8?B?REpmcUhZMlBZREZlVHpsY29ubmFhejJaQWtpNTJMcUpoZUxOR1Z3Rld6QTB0?=
 =?utf-8?B?eEMvQ0w4c3BJV211Q3ZUTURRN2F2L0hoYXdlQXZST2Zhdk5WbTNvbVpzNFNX?=
 =?utf-8?B?K1FrU3ZSeXZ5WXBVd2w0b2l2ak80QWxBUlNmMldOQjB6VHUvalo2NDV3YSs5?=
 =?utf-8?B?YkFjbldzVEg5dFlsNndwSCtkMW53MGMvWldtRDg1ekRDa21NY09ZdE83L3dF?=
 =?utf-8?B?WXp1VnpQeXliWTEyaFJxSlJTZ1ExaktOamJkRnpkWmZ3elk3ZEpKY09QQitn?=
 =?utf-8?B?TlE5blhuRG82QjVxVTBsZG5Rem5lOWlCeTRSUzd4Wk15b0h5OVU2U05SOUtZ?=
 =?utf-8?B?cG9wK0lIWVpiZWhIdVQ2QWxyeDBMS3FTOXBiZnMvZVo1eFFnMWU2d2U1dTA3?=
 =?utf-8?B?cVlvZFl4c1lIczhiOG1YS1NXZEZ6aFZCTC8xY3hGRUJybG56Uk4vazdTbEdR?=
 =?utf-8?B?K3NPNjc5S0VCOW5hMG5IU1EzUDV1bFlzakpYcWtZL2hHbnNCRXh4WUJJSkxq?=
 =?utf-8?B?SjZyeU1kMUZHU05wTG1VT3RrQlUvSlhFN3VQdnBkTXdtNTBvMW43TGNrc1Nl?=
 =?utf-8?B?OXJoOU5kR1h5NGZienlYbGhOeStBa1dVUFQ5T0hiYm83TWFYKzQrRzloNzNG?=
 =?utf-8?B?dUFsK0phaU05MkZXemtqanl5R3hjK2FOb1VuWDVuMml6cWJ2QWd5SFF3UzZw?=
 =?utf-8?B?U2Q1QVZDWTBKN1o1NzFUa2ZaVjNUNjY3bUc3VWNzVkVmTWZ6b3ZhNE82TTlw?=
 =?utf-8?B?VVhaekxEUGJMWHZCSXdVRkVMeUkxUlNkcmRHZjM5cmVXYlEyQXF4bDZINDg5?=
 =?utf-8?B?d0FCUm5LdGtLOFBWT0QzNDFoZEVWL3VJTi9Rb0JUWWYxZUNySi90Qkw2Unp0?=
 =?utf-8?B?N0FwSTlGamNxaHhaVGorc0NRL3BKS3l1YmNUelE0QmQ3MGZCT3JzcmdRTC9z?=
 =?utf-8?B?V2NyTFUvcldZSmNFR1d4V0dVUTBpdW9xTW14MjhXNFdiWmI4cnNNOHpLdUpz?=
 =?utf-8?B?Y25Da3o1cXpMQnFvWFVhK0xmWHJXYXBqaDdIVmdrRm44Q3hVK2xkNFRGTG1S?=
 =?utf-8?Q?1XWhxEBgZVJw2ehHS3debvwQu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HKLcmV4yacjYfIVx4wPXbh/whWGN6Qrzo9BkmB3kwiylMTymoEht79s2/3lPGIXprsSbbW4wU95GfyupOB85M7SiJ2SEtE9D55nQRSq/vtWU9/rxWXLdV7uuRKY3zn52OAC+Mo/v4KWZJWHLem6b45mnSwjcosA3w5nAYclBMYYzEl6La5E9rLK8YplGLnMyrOvw3qW41F+TdarzAmrLHeoHdMM98zdfp1qqjVlZfRmxHF35iP72SpTWYiTIj68gz98ORlM74Q+75eamxW+j5EfQUibr4JcYpCwI9T4gvg+jPJApFf5WNoElKNL2pr/SzRyt/pfw4uaX/NVJpTPPlcs/ZICUT+JpR4rXouak8CCwXzS/tmqMrbPSqRwIVPwWMqgXkuIpX0WSCugM3KluLypsFdbtv3unPjXkNdXHbDelKvELRqy8l5RZb7jzMwQ/FMm3cPt/9KzEnubVMuPaMZW3RIImecn2L/DWxYo7ijRuokJzU5IakuwHa+NKhuSMpqWKnvrml9b1DElOzHpXuCkbabYQFdD1sgtl5cPopDDTZJ7CW3N42+nFGE2ZXa5Y6oeqC2Lk2xtzu4EWWlMlKUkniLB6ZslKLa4IRM5DIb06lgkc5G5xASDyclIKgozcVEzqFHnr0i3wc5e+e5Uv8i51Hz7r9V9cBPSdCZ2e3p9Gx+u7ZTiYNIMNLPtRU90/9lfq00sdcr660GkVLNythNZJz6JnYcO1EeGZNGd9IPUBF+pl3d9O5BLYHv0F+el7Z6S+aYllA0Y1TV/DGr+e784EXbc2lWftqWzIn+bOTXyVRUHo5erDz31y/7YXNRWg
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8b182e-5d59-4aeb-6cd4-08db3ff139c1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:42:29.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRizxJxUpu8h+QjhkbUfRciSWiHazwNok87Ip21AkVLyvLlkwzBPUcUj7M6+skVG2o98nDEuKCzVs19hU3tx0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5439

On Tue, Apr 18, 2023 at 11:35:41AM +0200, Jan Beulich wrote:
> The function merely needs moving earlier in the file to avoid the need
> for a forward declaration. While moving it, also rename it following the
> recent folding of CPUID and MSR policies.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

We might also want to rename the hvm_function_table hook.

One minor comment below.

> 
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -288,6 +288,16 @@ void update_guest_memory_policy(struct v
>      }
>  }
>  
> +/*
> + * Called during vcpu construction, and each time the toolstack changes the
> + * CPUID configuration for the domain.

The comment also needs to be updated to contain CPUID/MSR or some
such now.

Thanks, Roger.

