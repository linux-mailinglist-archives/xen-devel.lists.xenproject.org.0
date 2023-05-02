Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D791F6F4160
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528455.821617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptn9a-0006cK-H5; Tue, 02 May 2023 10:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528455.821617; Tue, 02 May 2023 10:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptn9a-0006aD-Dv; Tue, 02 May 2023 10:22:38 +0000
Received: by outflank-mailman (input) for mailman id 528455;
 Tue, 02 May 2023 10:22:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptn9Y-0006a7-CQ
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:22:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4072e5d8-e8d3-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 12:22:35 +0200 (CEST)
Received: from mail-dm6nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 06:22:32 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6365.namprd03.prod.outlook.com (2603:10b6:510:b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:22:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 10:22:29 +0000
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
X-Inumbo-ID: 4072e5d8-e8d3-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683022954;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8pxjHqsBCnAU/Z0MEF3vX67moRg3lWkjDnto3SsiKW8=;
  b=fL0XBs5qKwHY1p6HaF1FU5IcRpBO3wIQ8r+8hQXppMYMvUw/P55vtBAv
   qeQEIsg9peUdECSZHPN/SfmR9ItKLsz1iBA4YOm1Cx8bYoWq8cyqq2k1c
   FowySZgnD74Odfhkomu41qyVX7QrTA9y0Qz4bR+chVEufece/s10zOLEF
   c=;
X-IronPort-RemoteIP: 104.47.73.42
X-IronPort-MID: 107961572
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dQDlkqKZ8uCw3zWWFE+RE5QlxSXFcZb7ZxGr2PjKsXjdYENS1TUAy
 2EdWzuOa/uJYmH8Ko12OY+29k4GvZTTzYAwSgtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wRkPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5MOW9E3
 9IIJQsfYwmeoeGa7KuZaNtz05FLwMnDZOvzu1lG5BSBUbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTSJpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyrz17GWwHyhMG4UPJCl0+5WjG+q+nACCz83akmn8MC2qVHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O+0z6waX4qPR6hSeAC4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2AYbCsAZQIA6svkpsc4iRenZslnOL64iJvyAz6Y/
 tyRhC03hrFWgctV0ay+pQzDm2j0+sKPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOvBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:sVKx66DDcePI6ujlHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-Talos-CUID: =?us-ascii?q?9a23=3AO5Y1qGt+t6rmJwm6Qa7sRVfX6IseSnPX5lnALnS?=
 =?us-ascii?q?qBH90br65ZUay2pF7xp8=3D?=
X-Talos-MUID: 9a23:NeYeiwuEedxKDw3sJM2nqSxHJPtk0Z2SFFEOs7Q5qdXVDCNTJGLI
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="107961572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThYnrfHIJ4NgPMGG2tGutv1oBmV8nHlsAOplqEVjFfSTWwifAIeWh5WKll3tMrJZ2sNctShM1HPf4GgBsa90t+W/Gm2AKfE8hw/+FTmpJc1HMWbO0uE/qhnRLvNxQT7/U/3aEp4CEOipZd2NeHk93AH7e5MqEX1E2H0b7BdbzJufMRcCb9XMzjL1DJX9Orc334Cqgdx7v0vTTB4Pb48qcoKRHJyfXPQ5yAEUDp6m5UALW9nvD1d5fd/vD6TOBqIvbJ1iqPoAgxl9V0L5dqBiKdG/Tlba00DGzj5rZKDcoGlRsAOaIdItwr4kWRauYcYtlkRUoAZhEsbHNG5h9gULhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUgTXWvqtxnPedM06EBb+hHJ66G71f5SwjS/Ezmc6+Q=;
 b=W6tkrahJ5zOLIBGGd/70YMKuOv1s4JyiQYUQHgtOpeatO0gibls+h40U5kaFCeTrie8ps4z6C2l99NiBs3vVD2gbRawP5ovbP/19g+fHr5/VzQG5IHqL9v7Wo6roLr/ZUy8Neffc3yPwUMJ4O1TldJ08PENecyUJswXnVZVO1vyQqykLuEAte3Ik9PKt3QiNwqVCKf6YdqU6kozicPYbHwT7kMwvq8kLXOTJ3H+/WBU3GIdxIU5AVEoBZgEHK6PQWblxdHrlnubMEsyzOVLe2Ydrvn6dyjIKy8MpFa/pSkKruTVE/XEUPvEDuDw0oPms5gfbO7Rz4PjvDQJNQJHnaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUgTXWvqtxnPedM06EBb+hHJ66G71f5SwjS/Ezmc6+Q=;
 b=MkmmDqCl6yb9nOy/4q/pCN+ft9X5YmMcetNyNGLLL1T0RM0QzfpuzwysWlYiCOG6eS9IzcqIUuUhrkAPwam4ONz+Kmn/VN1HOTvmYwFDFnXjUMbXeP1r2j8ydbMGitR7vtrBC1g9+5BeRU5lcU3fxs0wn2nyHCgeoPnAh6xPrMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 12:22:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ruben Hakobyan <hakor@amazon.com>, xen-devel@lists.xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/msi: dynamically map pages for MSI-X tables
Message-ID: <ZFDkXzflH9c2Duon@Air-de-Roger>
References: <20230426145520.40554-1-hakor@amazon.com>
 <ZFDhr+IlwjCDPOOC@Air-de-Roger>
 <d865ebe2-81b8-465b-710c-81b9b07c9fa5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d865ebe2-81b8-465b-710c-81b9b07c9fa5@suse.com>
X-ClientProxiedBy: LO2P265CA0459.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: ed040652-597b-4d65-9abf-08db4af721bc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r6fApPOMzwTFMHaYgEyM7KVZW0mvUbssuwY1jWB7WWWCITK7/lQ8hdPtGmXGj6ZfVaBcqa40dscoE4qJttF+mTKORdA56F/DJ9TlZb6dqKu+FYx5sP3iiclKBnAths9/cNRABreOZIw/sIjYBBXAH8n85GKUu9qkPvyygpuL6JSt1/WP5PIqOUcy0vVt3Cht/b2Zs0vjqvMhAzuHN3x3oUGaF7UDePw4QLZ5qIv0hGbiEEpJrFw1M1/y+v/zgqbWICxEz3nUVhZ0GnCPRnCb54xRxygdRmoXRMyYk/cyi7bHxBOBmX27BSqraU2Bm9tWTJZOKNc+1itfrP+MvL+GX9k+sgu7AEREYg0AIMD2H/Stkl+RcW+Ij1W5IseCCge2L3jy0iVP0q+LFJY0IUI3Mnk94fuHf7rq9BVFw+GRDhvlBp4EH502vuZ2IW8gnhztU9ivgd22ic7SO+QveSY5Fm0fNbF0kTtMlKpHuh8VvVcMqdIX8E7szbKmOp7fTt3DBk/GsSQrafgFPwAZIlYkDTXehsVxqsgea6QpZw9pcQRV03wRLW6NE5AMhWopanN1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199021)(2906002)(86362001)(6486002)(66946007)(85182001)(6916009)(4326008)(66476007)(66556008)(478600001)(6666004)(54906003)(38100700002)(186003)(5660300002)(83380400001)(33716001)(8936002)(8676002)(6506007)(53546011)(6512007)(26005)(9686003)(316002)(82960400001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amxEZ2FDK3FROUZtdHZQc093VkFDL0JvRmxUTGZubjZXZ2Y5QzZhckVNRzFz?=
 =?utf-8?B?eHRnT2diazlrVS8yYUZXOER3UDNtZjFxSGVnZFlkSXBXc1pKaTdLVTFvQkdt?=
 =?utf-8?B?QnlIY3N5R2lTaDZpVmNWMzFaMVdyU1dVMHFndjVKaTVqN0x0ZWtaQ3ZlWUw3?=
 =?utf-8?B?di9FVG4weWo0VDFNTDdRdUZsUHd0enlTaW5zUVkvT01SdWFiTmhFYXhwUTEz?=
 =?utf-8?B?MFlXSmttdXA2MUljYTBOaGVoU1loV1lhM2x0T1F2aTczZEsrWGVpbk9Xb1dE?=
 =?utf-8?B?bXo4SGhGYk1nMi9Od1h5U0g2dXIzOTBCcS9paFhLaGJHZGRYRm5rbXkrSE1l?=
 =?utf-8?B?K0JFdzArb1dZaFpoWlVrZ25xOHZWY3c2K0EzcG8zUjVTNGFGNHhBMjF4b1pX?=
 =?utf-8?B?cWplK0haTnhVK0NDVkJjQncyTHRwSmZEazhMYVhDb3J5Y3VtVVVxZGY5ZVZQ?=
 =?utf-8?B?RWV5NUhWN0dGTUhnL3hQNmtkVVhObzhpRUtiQUVIb1dqWEVOVFgwSEFURjBj?=
 =?utf-8?B?RHp6VDVQRXNsRFVWVHdIcUQrZm9uMTRHTjZ2R00wdW9SbTlwL1ZwTmhURk83?=
 =?utf-8?B?eUZCSHJNUVVBUDhVNXNpKytBbUE3UWNtWTF5enRvcmcvcWZYSGhrc1h2Wkgx?=
 =?utf-8?B?ZnJpazBCV21qK05NbVI4WGxFQTdZN1U2UUFVM2JqQUM3OG5rK3lFcy9zaFdN?=
 =?utf-8?B?R0I2UnRiNVlNeld1azk5OTZBMTZVRDdRQWVRaGRWTnppd1JqRUlXN3pKa0R1?=
 =?utf-8?B?VFo2MGNhSFhrRkhtMGFVTkIwZHpBZ09qVDJ0N3k5aGRFMDBoTFMxeGljc1dL?=
 =?utf-8?B?eXQ3ZWs3cGcvdnkxVmNIWjFSakp1dmd2VWh5WUtNOUNwMy9DbG8wOGhkRnVx?=
 =?utf-8?B?MUpuMHlkMUo1YVBXSzZDSFNET1RGNHhoU0VkWUVHSTBIMHJ2NlNNejNFUlE4?=
 =?utf-8?B?cHZyamo5NlVuUmR1akt5ZWk1Ym5OdkJva0tKeEphYVZNRFIvZnhwODh1TUI3?=
 =?utf-8?B?SStRckdsWDVQNjB1aGM0K3VCVDBIVXkzazkrcHdvLzZaclArVHp1RFo5T3I3?=
 =?utf-8?B?UEx3Y2NqN1VybW8yN1BCMExTZmU0RWFvV3RxTTQyMFdvRURLVDFtNVhJOWs4?=
 =?utf-8?B?VUV0WHQ1N1A4NEpiZy9KWERxRkt6eDNFaUlnM2pNZ3JmQU1QNEpxVkdRWjNN?=
 =?utf-8?B?Ymp4b3dRa29Iemc3YXppNTFXQTJudDUyN2gxcDdsM1EwQzFNNStQcEV2UUpm?=
 =?utf-8?B?YUQrRnNaeHFha1pld0NCUW9pR1pxaytXQlN6K2Q4bTJ2OW51ZHlxbXNhaGtw?=
 =?utf-8?B?b3FKNUxaQmxzNmtCd3JXSEJMOHlaWDlTUmVjdE5iLzNjQzdxYUdFOUVuZTQx?=
 =?utf-8?B?Wi9CUHVtVWtkeDdodEQ2NkhlVTI0dFk1NFdkaDZFR2MyK1ZpYnRyeDg5YlRk?=
 =?utf-8?B?bE5uU0lIZnMvRnZKQWRtRzViRkRlL0lHZEhuZS9iRXovbEgvZlRodHAxK0I5?=
 =?utf-8?B?VGEyZE01Ti9FSW9wUmZjZW9FV2VkUkd4eVdVcnBKZ1ZjcmRFcGw3L3pYbUpz?=
 =?utf-8?B?cW1ReUFxMjRHUk5pYmJVbWxWTjdCWFg5Q2oxdlMzMFBzNk1ubjFIUkRxYW9X?=
 =?utf-8?B?QitXa1ZqYzZMY3RKZ2JoNFBzTHppQ0laOTFGaXIvbE1qaGtQWkwwV20xTDNO?=
 =?utf-8?B?ZXJ4ZVhMazl1L2ZDdDAyTm50dG96VGxZbnUxaFg5TEEyaUJ4eXpUbGJHNXNJ?=
 =?utf-8?B?eS9aSTVhVmVnZUZrUW43WGpwZ2pMQVBxUzIxaHpyTXc1eUJsUlVRd3VDa3pF?=
 =?utf-8?B?YzdmYzdrOWJ3NFN3ck9veVlWZ0lCNUJYUEN1dnk4bmNyUmdMTXZ0a3prL1BX?=
 =?utf-8?B?OEoxWmg3UmxGSkpvbHFMamtUVjNvYkh5MC9WcTd4VFV1Z3J0UU13YTk0Tkpr?=
 =?utf-8?B?Wk1xNHhGRzdlanorU3dCWnJjY29iYXpOOTI4a2ZDS1BTTUNCOEt5TGpaaW0w?=
 =?utf-8?B?WEduRDN4aVllTjVGSWV6d0tBRFlHSW9jazExbkYwRVlWOTJBcWl5NHBiKzUz?=
 =?utf-8?B?eEVONlBDOGRUZW1VQk05cTUvMWdJd05TU2YyUXljWXY5YUJVcjJ0TE5KVmI2?=
 =?utf-8?B?dEUyVjZMLzZyZWVLQUFmWkxoWVZUajBEQVRKalpHR1AyNmVPRm83cU12UW9v?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e9+Sy8S26P2L1rpLnyIDf27274cz3T6oaSuk60kCnBfVFwPD3FLoibFo4zMe294+PZt5rawCMZzgK7bFTbOYzZsba+Cu1gTcn2qqjmd5LCwPfcgrkBAKo18c3RZEbzkrD+TrRMp6MOlq6+gMH2ADSuUugOyQjZSYXrePev5Il2m9x44lJXNe4HgXW61myzB7tKh0hNZqXxMd40qHpnRRrUhz7eM4MjCuvWubhwNIQSGdK6NrtAKTtRYby8rPE20KZYNK5u5xmp4NjscIAvFmoChV2zWdYVFVO3Coc9C8MRGn+5BXnwCJ9GuNWWAHvEfbh4S5Rtl/WLnMnMSWtT2j/dqm7bvSpSp4rGGwzhAga++bKXzUcLl9mgkODuLnZNE4bpItN9F/rKIsrSfOHkMcVRYySuOTVIQeNpQFbL1AY9MkpMs7+BtrZ9eaLvmtBXEe8lVrrQYAxko72XcrFY0HIcgiomeiTe7/Zdeo2emhEjvoIFvxSXoY8zJNiG3ZwkqhmK2tm9Wb93OgwMuZr6Oe+wxv+hCFFHpKVuCZ9KdF+z3HhrqRu6E9JnBDf3tYfya8cd5/j/1WfepQNZvjX43S5SgwGfhvYgybjsIDep/cnW6jhgT+AqIRcyWN+VacoGEuZFWOVwyzP3J4a0fMUCrZI5E4BjTjqQhc+gc2uKHYOhFHCQM7oVOowfmaaAs4Hc3xqWwfcoIdr6JabjLvF5qj3iP32EImwGw2BiPXBZJq3eIZi2AtxhAsgZJZzP1yJgCLQwfnl5ahQS41ERvqIBfPx0dbY9oSotWydnsVkwsUQsmvY/pVhx60NY9EFQONYkGYDGg/ToxxceXldynrSWZ0g8/IDLzoRa8xSZVCMGAkPdA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed040652-597b-4d65-9abf-08db4af721bc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:22:28.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjWd4/qp+4AzPEAUjKHMloXhgfahB+8/euTcSW+8XlvGImBPCKZqHnxR7Rx6fy36BOaC7x/xorq0gnDdhb82Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6365

On Tue, May 02, 2023 at 12:18:06PM +0200, Jan Beulich wrote:
> On 02.05.2023 12:10, Roger Pau Monné wrote:
> > On Wed, Apr 26, 2023 at 02:55:20PM +0000, Ruben Hakobyan wrote:
> >> Xen reserves a constant number of pages that can be used for mapping
> >> MSI-X tables. This limit is defined by FIX_MSIX_MAX_PAGES in fixmap.h.
> >>
> >> Reserving a fixed number of pages could result in an -ENOMEM if a
> >> device requests a new page when the fixmap limit is exhausted and will
> >> necessitate manually adjusting the limit before compilation.
> >>
> >> To avoid the issues with the current fixmap implementation, we modify
> >> the MSI-X page mapping logic to instead dynamically map new pages when
> >> they are needed by making use of ioremap().
> > 
> > I wonder if Arm plans to reuse this code, and whether then arm32 would
> > better keep the fixmap implementation to avoid exhausting virtual
> > address space in that case.
> 
> I think this would then need to be something that 32-bit architectures
> do specially. Right now aiui PCI (and hence MSI-X) work on Arm targets
> only Arm64.
> 
> > This also have the side effect of ioremap() now possibly allocating a
> > page in order to fill the page table for the newly allocated VA.
> 
> Indeed, but I think the (vague) plan to switch to ioremap() has been
> around for a pretty long time (perhaps forever since 32-bit support
> was purged).

Yup, I'm not saying the above should block the patch, but might be
worth mentioning in the commit message.

Roger.

