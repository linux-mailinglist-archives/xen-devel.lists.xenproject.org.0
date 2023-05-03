Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FEA6F5B49
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529314.823599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEUh-0007as-9u; Wed, 03 May 2023 15:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529314.823599; Wed, 03 May 2023 15:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEUh-0007X6-6r; Wed, 03 May 2023 15:34:15 +0000
Received: by outflank-mailman (input) for mailman id 529314;
 Wed, 03 May 2023 15:34:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlPw=AY=citrix.com=prvs=4803f4e7c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puEUf-000715-28
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:34:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2e70610-e9c7-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:34:11 +0200 (CEST)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 11:34:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5641.namprd03.prod.outlook.com (2603:10b6:806:b0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 15:34:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:34:05 +0000
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
X-Inumbo-ID: f2e70610-e9c7-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683128051;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ekEcTjd1EIWBQhUD19Z4YcSet7yF/pD6/o03EZiH10w=;
  b=MIv76NJOjg2jly3xtN2tXBk02CxXPERfCCUZr85UqP4z7nPkmJ4r1XvS
   v05g6VmxzKQSiuPpRclUdp1gvbKSyU4xlDdSoLbsO907blPPPk0scJ/0E
   vGmfWG0wE68GJTAS7ELoiZR1LdNHXPFZ+vkSHHnCbNILETez87+VihYNF
   w=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 108143656
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Gda3bK3OGQxlFd4v5vbD5Ztxkn2cJEfYwER7XKvMYLTBsI5bpzICx
 zMbD2uDaPbbNmGhKIh1bIS1o01S7MWBz9RkGQRlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFmPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAlFOp
 fo0LCk3dwmMrriM37mEENNSiZF2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1cZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjCNtOT+PlqJaGhnWBgXc1Mg84SWCk//OIkWmQafByA
 n0Lr39GQa8asRbDosPGdx+3unmfpTYHRsFdVeY97WmlyLfQ4gufLngJSHhGctNOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hTq2NCocK2MYYmkaRA8B7tvkiIo3iQ/DCN1kFcadhdrwHDDs3
 z2QtwAuirMLl8kJ2q6nu1fdjFqEo5nCTgcxoALNTG+hxgp8aMiuYInAwUjW67NMIZiUSnGFv
 WMYgI6O4eYWF5aPmSeRBuIXE9mB5fmfOTnYqVdqFosm8XKm/HvLVYJa7Sx6JUxpGt0ZYjKva
 0jW0Stc6IBSOj22arVwYKq6D8M3we7rEtGNaxzPRt9HY5w0fwje+ihrPBeUxzq0zxNqlrwjM
 5CGd8rqFWwdFals0DuxQaEazKMvwSc9g2jUQPgX0iia7FZXX1bNIZ9tDbdERrlRAH+syOkNz
 +tiCg==
IronPort-HdrOrdr: A9a23:/OOaRq8hh1kQc0ndt+puk+DcI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAH0aLShxHmBi3i5qp8+M
 5bAs9D4QTLfDpHZBDBkWyFL+o=
X-Talos-CUID: 9a23:UDe2XG4CXndJyzvKOtss934USsYJdmTn1W7fChWCFm1WEoerRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A9+s48g+KIpmJTCaX1sSPZGeQf9Uv+IKUGm4Rqop?=
 =?us-ascii?q?YsfifEgJCGRq0vSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,247,1677560400"; 
   d="scan'208";a="108143656"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXDNieHtHUKGnvmk4b3Zxjo2/fB0mBgzGr/wL3cmMwQTO4fFf9+mrZWKFMHPlWdmYt9FTYcbcZIWMvQ/PCIAQnkxRMrLuFr7GRuzDjY1jbCywjrI7SNcdvDtpB+dP9K67zUe2eeZcZQ+ddfGUaH3I583HzKxUgJVSph/942jwG0SnkQNngGnxO1kvpLtws8m/bqqR1InzZiVI0uWyEiUL1gcnaI1y7+mHtAf3tSqRjsI4ttTCdwn27/id9MLL+ONaqdclBxV/ZViKJ8ODUvhbVXJv13MOCDPM2yZ3kZwaNfZ9z8J1s46YTIsx3tNfXNZmPslZk1kpWsA/TPP2+DZYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekEcTjd1EIWBQhUD19Z4YcSet7yF/pD6/o03EZiH10w=;
 b=OzPsNNZs+ZolpP5D/Wzqt5TUvJGSCns3IBQabZDuudoh0fNrwTF5XW1PmJfWeUJ27IFbHKs9yLN4Sy5qYJ0bvSMA79oKuaGqUOlZdCZj9cOdy4h1X7b1cpavU2ByMoBCirGtORg+DkIRsx7WkCdndoLhYHLdiNOUUQG9h7oTpG+Orc/6amzrAp34EPoWomejM2dURXNSmmrc7ZcOPj+Ov4s0TTERCtF1n/4cK1rYsZ2oSfQsCHyxgfTLYtP7SQZVhMwjYcf+d3I2ZSMBknDGl2I5q7urD+vLtPSD/ODec+deSaanHK//RQqjb9+iJ/PI62i5eDp//jNIcp50+d+kEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekEcTjd1EIWBQhUD19Z4YcSet7yF/pD6/o03EZiH10w=;
 b=PNe1IPb+pQWDI04iuPReezREcYUblqU41cqB+OfuoKK9cAjcBs9fIVno5ce95PKYw2SJaRc3Mv1okNHjFcFrT2DSFSEpjWR1lsYyX2n4wPi4viqNgxeODmMV+A0ZkxHML6OpAf+XLVxdtx3m7re8KkoTTL0fZvW4GR22rf4nSSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a32b0131-82af-8828-13ed-dc1feac1fcd4@citrix.com>
Date: Wed, 3 May 2023 16:33:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: andrew.cooper3@citrix.com
Subject: Re: dom0less vs xenstored setup race Was: xen | Failed pipeline for
 staging | 6a47ba2f
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, alejandro.vallejo@cloud.com
Cc: committers@xenproject.org, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
 <c74d231f-75e2-a26d-f2c4-3a135cc1ac10@citrix.com>
 <28235d38-ad7f-f1bd-f093-bd83f9fd6589@xen.org>
 <998dbbeb-94d7-7afe-e4c2-02ef134cbe94@suse.com>
In-Reply-To: <998dbbeb-94d7-7afe-e4c2-02ef134cbe94@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0015.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5641:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea3f220-1edf-4c54-ae9d-08db4bebd43b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bKg+BguLZd3M8LgHp2jBZmxFW1/b7xtoAYyC1RjhYrRqpPncGu0VFVc3eBAyTQgw7GLsauO1jJZh9i016wHQPZz8h9dh7ZEMJcsc/ho0CqAeTw7zgydPneH4XEeDx+3XwWT3LdYWoCsUdPJqgA/GV2UIOxr+gzAaKCavSIM/GV9lHU0wKcfh7goQiSPHXEBEiSeAs3UF+FzT3CY+ygyTJimYFYdz9lUslLsJ54gXgV1fN74109lfx3h3wYRYIFf40E7IDk1yzVgolIJoya+iO0fwNLFwKYuYvLgJUaWPlGs6oVry6ewTxO4QOJZuCk31Bd1OGIwSwBA+YzaDESY3y5WinwP2OvxilnPvXfdGSix7sIhhlRbCSNz2oX7JwubJKE+vV+ouSywAxiuz5X6VRKkUlpV1bmtICHGK02pNVd2IJBW6x7FXJyrQ1vymq4eg77BYl0ZhmVZ9vb+TBkviwBD/+aN2C95ezTihDHycB6vT8ri0qXhFMUtVipgy2SfrV8XverIBmBsTOyzCPVtIn7a0F/V5KUsxgJvlJyzRpFMdBdJ3i9JjOwWX4vtllmEpsfh7aQ3UFkyb+UQHCtxSuEAHqbten/7THpED8mQm2nlO96DbjRac8Uz+qRKrmPya
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199021)(6666004)(186003)(6486002)(83380400001)(2906002)(53546011)(9686003)(6506007)(6512007)(26005)(966005)(110136005)(478600001)(31686004)(2616005)(36756003)(54906003)(66556008)(41300700001)(66946007)(82960400001)(316002)(86362001)(7416002)(38100700002)(5660300002)(8936002)(8676002)(66476007)(4326008)(31696002)(32563001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEF1NVdWVmE5ckNtQXlhQkZRRk5PNXNSSmxZOHViUWRjdW5pdWRRU0RnNjh2?=
 =?utf-8?B?YlFldGNSa3MvdnpUcHFXM2JJc3hBMnBUWjRZOUJ6OS9CSTY5YytJUmMvME9T?=
 =?utf-8?B?clhZQmNleVFMeGRjUlM3Kzl2S25ZNHpJY2pMVGt6a1Q2bzArU0M0cW03OFFL?=
 =?utf-8?B?WDRBZ0dDTUdJemtMb1l3dk5jZDNpK0dKb3R2SWZBcEtZRmRqQXVjdUsyQkVw?=
 =?utf-8?B?aURRT01KQzBVcFREckdPTG0yZ2JsMlRKL3NLaFczNnUwcHF1cDUvaXZHL0JX?=
 =?utf-8?B?dEp3cEtXT2preDdjYnBUZC9oV25EYkNqZnRCZnZnQUtGNkJxWDM5RXRGbmlZ?=
 =?utf-8?B?MVdWN0F4WERRSE5HbmZyVXcrYURFOWl3MWF3SlJLT3FPTHRoVjJIOW5XZDBX?=
 =?utf-8?B?bFg4MnhmcnNwQzdnclBlVitWL1loc09UK0N1Z2xqeDRUcXkxMVliL2ZHODBU?=
 =?utf-8?B?cDNGeUU2RlpVaXR2NktHdndlL1hmcjhScEQrdEV0WXZQTGtkOElaOGRiYzBY?=
 =?utf-8?B?UFg0MmE1dHpybXJqTW5QUUlDRG9wVEx6QUJJMXpvT0J1Ti8yKy91RFlUN20w?=
 =?utf-8?B?QXNqTzd6a0RZMkY2Zis3TDZ4T1R5NVhTYjkwQUIySXEyamtBZ1lWdTJ5YnZz?=
 =?utf-8?B?K3FiaWZMQlhTK29KazVhQTI5MjlEWklxZ3g4MklpSXJFUTJGVjB3V1VxVUpt?=
 =?utf-8?B?eWJQVHEvVGU1WTlNNmNXVFNIcFYwNWExQXVOV2dJMjJCNkg3RHBWeG5McU5z?=
 =?utf-8?B?OFBpajBObFNqRVk5b0RPVVNaby9xMXlGaHJDcStJVkRJbnFuRkF3YnpvZVFI?=
 =?utf-8?B?T0Fjd3h4aXdVaEQ5UHdzMklTVS9XdEdLTkVKMXZ1THVFZHFYczFqM2dhQXpo?=
 =?utf-8?B?ZWRUbzBRTlo1MlVFUEJqRS9kZlJpY3o1RVp5a3Q2dU5rVVFjNDIzZ2xhckJl?=
 =?utf-8?B?ZXZOR3hBQ2h4c0hRV1VwU0R5bytiRFVqQW9pQlEvcXdTeHhDMjhXK3Mza1Ra?=
 =?utf-8?B?UGhoNjJtVm1MbWJpOXZBeUFvSnEydHpJZVIzM3JEc3BCYm16cG9RRjgyL3JL?=
 =?utf-8?B?alNtM3daYUljaWFmZFlMMTRzSmVBc0ZDdDIrc0FFaXdnbk9lRFZPdUcwQ21z?=
 =?utf-8?B?NG9mY3ZKY2pYanhXc2N1SWVGeW1JOWFwb2I1QTc1b3pGZ20vZmR1KzcxOHpW?=
 =?utf-8?B?VE1CVTVBWUIxS2NNa3VqR1VSNzgwRU1aMk5PNHlHQXdaL3hlc2U1eVczK1V2?=
 =?utf-8?B?TmxtU3JBZDFwYUZXMDMrZFkxSUNZdDgvREMyZXMxdFJOSitwMGFYRVlWNWpk?=
 =?utf-8?B?ZGZzZkQwYVRMOTcyRkFhbUhYTHdjRi9rNTd4bXJ0NHREZ3UxbXd5eE1lT08y?=
 =?utf-8?B?MTFnNjZybUtLOEJVWVJWMEk3aWdtSExKM2hMSUF5V01PVThPR2wzbzYvMC9I?=
 =?utf-8?B?VEU4Y1oyUU54UlRLUjlQbzdEK2lhZm82NjF2cHRJUExlWnRSeXo3TGcyR3Zx?=
 =?utf-8?B?dHNHVlM1cy9NdmxrMXY5OXRUNDZTVHNhOThtamp6d2MzbDFRc0lMVTBQMUQ1?=
 =?utf-8?B?R3RGRnNmbkJyaXdyWmtieWV0SXNnRnVNWEtGd1hCeGhjWlZHT0liUDBYV0J5?=
 =?utf-8?B?MGp1ZWhYUTNDVkhySCtmc3h5WHRCZXpwWCtHWG5zY2hoa1Y5VlVYWGVPcUFv?=
 =?utf-8?B?elhJRC80R3haL3hRZzFZeGhYVnBmREtuU1hvbWtNeVdxYTZxZzdaczBrV3Qw?=
 =?utf-8?B?eHF3QlgrcFZGdWFGQmE4REErZERHMFlyR05DWU9VdlFKdUNrRkVjdmVxSjZ4?=
 =?utf-8?B?MjZiaHdDaEZRWDNOWTVhZlc1ZFEwSTNJWEhNTk9Ld0h4YnpxWGdvS0hJQy8x?=
 =?utf-8?B?RE5hK1dTTncvV1c0Z3Bxd3VMRXVlR2dsSG10b2pCc09lOU9LUFp2Sk5FUkZi?=
 =?utf-8?B?cW5DTGIvZ29yekFWRHU4M01rVWlic2w4dzI0cUhGS296QVNvRjU2bVkrZWMr?=
 =?utf-8?B?TlBWV0huY09TMmNFTkhDeFc0YjJDRlQzZzdVWWh2QmRtNGpVWU5jK0JBY3dq?=
 =?utf-8?B?dE9lWThoYkx4Tjd3ZmJ5WVg4eUt5RmIrbTZDVU1OYzgwcXkvY0N0bHhwYkVH?=
 =?utf-8?B?OTNyTHJheFR3TVduRzcrTE1EanU1Q3ViOWFSNS9IVlZFN3d4ZjlPM3pYcUpl?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?UTArT0NlVThwZWJ5SCtETTRnNzBFeXJkTTdrYU9Vd09zN3dXRTVSMHpKWWZZ?=
 =?utf-8?B?ZlBYS3BhM2gvd2FMOU95RVJNQm5uRFQyRUVNSUcxbXRpQmdEWUl5V01pTUM0?=
 =?utf-8?B?S2oxOTF5Vzd0WER6cEZYUVJ4THZQNU1GWkVzM0xZcDQ4MUVkbWgzbmhqc2pO?=
 =?utf-8?B?YWwvYUtXdm9mbjNBVlZvSDAxaUpwcCt1WjNGMWtIb0FraTl0R2FURzIrMmdV?=
 =?utf-8?B?eE45eDFpUGZadXkzYVhxUTBqTVo0VGk4dzcyaG1QQ0Nxbitzc3o5QWlGTExK?=
 =?utf-8?B?V2ExSVA5QnRmWDFSY2xKU1hNVWhGMnhDTy9GaTdXbTU1aXNUeWhncUlITmZD?=
 =?utf-8?B?OSsrT3hPZHBwM21UY2ZaQWJsTmhUTVB0UG94WXVXdTJIUzNFRVN3dldBMjZs?=
 =?utf-8?B?cVNBSGwySTZDQ1FVNDVJMU1XNnNBaU5wQTkraVNIUzZ1TUJoYlVEamdSbXhP?=
 =?utf-8?B?RnFIcnRZVE1EMGVsMU9IRm5LNVFhS0JUY2lwWG9ReVMzK09ZUTlGVng5enBw?=
 =?utf-8?B?Uy9NaUJDZjlZcU9vRzdoN2NtSHN0SHNiWit1elBXSEpFaEsydW9MUVFhTTFC?=
 =?utf-8?B?YWNkMUd1NFNpV3dQU3pYdS9hZFE2QThtazkrcUEzZVdXbTRLK1FETHBmcmFa?=
 =?utf-8?B?UW5RUmxiN2RKL0VweTY3VFFZbGtaSkdrVERMU2IrR0tmVS9RMjNuQnRuVHJh?=
 =?utf-8?B?L3pRUzNpZDRTdkxzVDI0OHErd2UzYVNpN0JPZTJHL0hXNGIzMnV5cC9DVTRT?=
 =?utf-8?B?eWNXcTZneVV4MkZDQ3EyVHlWaHJuV3gyMGhTbncrODFwUXRsMGhMbG5hUDAv?=
 =?utf-8?B?U09HRm0vTWtNcFJaNkVad05zZmR6MWlZTENVeGxmMGdpOUQ5UkcwZ0ZEaTl1?=
 =?utf-8?B?UDZ2VENZS2VIUEtOS21SNG5zWDZwQ3dvOXFiOUhlQmJ2MEtJVVVHaVRIamxM?=
 =?utf-8?B?K05LZUJtUmFZb0tmdk0yVWkrNjFWejdtV2F0Y1Jrc3NIcG0rTXJtbTduTGMr?=
 =?utf-8?B?cUM4OWZlWkRFSXQ2eTZ2NVQycHpqei9KUi9SbmZBVlFyeC9ITUNkaDVjaTZB?=
 =?utf-8?B?QW1QK09tZWZLUnV4R0dENlc3Y3FxZ0ZORDlIdEpxem9uU2VMM0g4UndxT3Fz?=
 =?utf-8?B?ek5hb1kyUHc2QjJGWVJHbDg4Ly81ZFc5TE9Wa2RWL3BkcVJ5ZitzVVI4QmNj?=
 =?utf-8?B?SVo1SUIyQ0ZhcG41dkd5TW9mcmVsLzBBeHhSUC9KK2VnQW51MjdLQncrYWQ1?=
 =?utf-8?B?ek9WYWpDc2VkbUxkSkpxd0czTURxdmpKaFdmSGI0WTJiK05nUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea3f220-1edf-4c54-ae9d-08db4bebd43b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:34:05.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLusJwCxuNLJiGgUqgBRoOb1yYN5fbfr8F4Mwmcqx1jvr/FiHdi0lRI6RVZZGpENJaMhShDgsDXXWO9oZl2o6e2L4txyR9LUSU8sR9JU9qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5641

On 03/05/2023 4:22 pm, Juergen Gross wrote:
> On 03.05.23 17:15, Julien Grall wrote:
>> Hi,
>>
>> On 03/05/2023 15:38, andrew.cooper3@citrix.com wrote:
>>> Hello,
>>>
>>> After what seems like an unreasonable amount of debugging, we've
>>> tracked
>>> down exactly what is going wrong here.
>>>
>>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4219721944
>>>
>>> Of note is the smoke.serial log around:
>>>
>>> io: IN 0xffff90fec250 d0 20230503 14:20:42 INTRODUCE (1 233473 1 )
>>> obj: CREATE connection 0xffff90fff1f0
>>> *** d1 CONN RESET req_cons 00000000, req_prod 0000003a rsp_cons
>>> 00000000, rsp_prod 00000000
>>> io: OUT 0xffff9105cef0 d0 20230503 14:20:42 WATCH_EVENT
>>> (@introduceDomain domlist )
>>>
>>> XS_INTRODUCE (in C xenstored at least, not checked O yet) always
>>> clobbers the ring pointers.  The added pressure on dom0 that the
>>> xensconsoled adds with it's 4M hypercall bounce buffer occasionally
>>> defers xenstored long enough that the XS_INTRODUCE clobbers the first
>>> message that dom1 wrote into the ring.
>>>
>>> The other behaviour seen was xenstored observing a header looking
>>> like this:
>>>
>>> *** d1 HDR { ty 0x746e6f63, rqid 0x2f6c6f72, txid 0x74616c70, len
>>> 0x6d726f66 }
>>>
>>> which was rejected as being too long.  That's "control/platform" in
>>> ASCII, so the XS_INTRODUCE intersected dom1 between writing the header
>>> and writing the payload.
>>>
>>>
>>> Anyway, it is buggy for XS_INTRODUCE to be called on a live an
>>> unsuspecting connection.  It is ultimately init-dom0less's fault for
>>> telling dom1 it's good to go before having waited for XS_INTRODUCE to
>>> complete.
>>
>> So the problem is xenstored will set interface->connection to
>> XENSTORE_CONNECTED before finalizing the connection. Caqn you try the
>> following, for now, very hackish patch:
>>
>> diff --git a/tools/xenstore/xenstored_domain.c
>> b/tools/xenstore/xenstored_domain.c
>> index f62be2245c42..bbf85bbbea3b 100644
>> --- a/tools/xenstore/xenstored_domain.c
>> +++ b/tools/xenstore/xenstored_domain.c
>> @@ -688,6 +688,7 @@ static struct domain *introduce_domain(const void
>> *ctx,
>>                  talloc_steal(domain->conn, domain);
>>
>>                  if (!restore) {
>> +                       domain_conn_reset(domain);
>>                          /* Notify the domain that xenstore is
>> available */
>>                          interface->connection = XENSTORE_CONNECTED;
>
> I think there are barriers missing (especially in order to work on Arm)?

Yes there are.  I think x86 skates by on side effects of hypercalls.

>
> And I think you will break dom0 with calling domain_conn_reset(), as the
> kernel might already have written data into the xenbus page. So you might
> want to make the call depend on !is_master_domain.

And this is why I am very deliberately not doing anything until the
documentation is matches reality, and is safe to use.

For starters, shuffling this doesn't make any difference for a domU
which hasn't been taught about this optional extension.  Ignoring such
cases is not an acceptable fix.

~Andrew

