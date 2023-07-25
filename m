Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22BD760DB0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 10:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569546.890388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODp6-0003yF-Qu; Tue, 25 Jul 2023 08:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569546.890388; Tue, 25 Jul 2023 08:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODp6-0003vb-OD; Tue, 25 Jul 2023 08:55:16 +0000
Received: by outflank-mailman (input) for mailman id 569546;
 Tue, 25 Jul 2023 08:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qODp4-0003vV-Ro
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 08:55:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67daa67-2ac8-11ee-b23d-6b7b168915f2;
 Tue, 25 Jul 2023 10:55:12 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 04:55:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN9PR03MB6122.namprd03.prod.outlook.com (2603:10b6:408:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 08:55:07 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 08:55:07 +0000
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
X-Inumbo-ID: f67daa67-2ac8-11ee-b23d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690275312;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=lBPEo/uJxTIuULngR3ksXbeE4m0VS67ZkS5B6xpjoAc=;
  b=B9Q0DDOxIb1qZrj3vNdX33RfCc/VKUH6/8Mto8hC5NyJLz76ieYJIxen
   T/UlP5npC7tj87lVxQWfE/aONuyqSk3u864KnkeOKE/TcYcXrhEZi+1/D
   5qsfHvbIFNOAkpmSiCLBWVL3MED3XegSwd/8THcRJEDhOcAOwHax1LjD0
   4=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 117209085
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ox9926JeRjYbbDYxFE+R9ZQlxSXFcZb7ZxGr2PjKsXjdYENShjdTn
 WJOW2jTM6qKMTDxe9h/PIi0oUtS7MXTmNdmGQZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5eJ0hC8
 +YjOAsqSU+GuMec0Oq4d8lz05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLlmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12bWXzHurBer+EpWGqq5vn2aC/lc8SzgMXHGXmP2V1VSXDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsUTppeNEg8sgsSlQC1
 FCTmMjyLSdyq7DTQnWYnop4thu3MCkRaGUEOikNSFJd58G5+dlpyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsiDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:jk/K66HePF/WM3rZpLqFiZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+tOKH
 LajfA31waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF6ifF6k3F6nID+nXiwViXjT/KptH4fiszD45kiZhCehXUxkI8tJUkuZ
 g7l16xht5yN1ftjS7979/HW1VDkVe1m2Mrlao2g2ZEWYUTRbdNpcg0/V9TEr0HACXmgbpXWd
 VGPYX53rJ7YFmaZ3fWsi1Gx8GtZG06GlO8Tk0LqqWuok1rtUE863Fd6N0Un38G+p54YYJD/f
 74PqNhk6wLZtMKbIpmbd1xD/efOyjoe1bhIWiSKVPoGOUsIHTWsaP6570z+aWDZIEI9p0vg5
 7MOWko+lLaQ3ieSfFm4ac7sSwkGA6GLHbQI4BlltREU4THNfvW2XbpciFqryOiy89vcPEzFc
 zDfK6+OMWTXFcGKbw5oDEWZKMiV0X2cPdlzurTCGj+1f7jG8nNitHxVsr1Cf7ELQsEM1mPcU
 frGgKDafl90g==
X-Talos-CUID: 9a23:Y7zl3GDXD/NsGmf6EwBB3UISAPs1SVr6k3LvBmWoUWVUaKLAHA==
X-Talos-MUID: 9a23:rzvrRwt2Yz2tdqZpvc2num0yMdhT8pyVJwMoi5wsl/CAGXNqEmLI
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117209085"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUfEWuStQz0E5f0BvUI+JdYdmpQ6ijfkLzj7XflszIB01f0z7QDBFibt3GbPe+tlCYdnAwEMsLf8N5wZqZBurX9yr6OsS3T2RHtKglQwEwbqM09yjtcNidnGN5ULpKa0mhHHy09kLVqwz2r2qerO1U1GdzQ0pZic5UEdABvquMVbjr3ajZTebS9sN0GNhACri8S5KAp9RTqoSUQUpLNQPaaew7raPlaDVIXBmKLXvuCP0T/aeNeIARbJ4Hkvitg1KIuhqNLqYVxn6fR6G3qiFWDZX/vdhxi7kOs0lrKm+e34l5t4z2U0KMk5oZc6QTjeZKFp3Uc7FXef6v8+ybSClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VHiboYJH7PGBirLkgaxzMQSUIp5GNznCnvhD78UPtU=;
 b=cHS6DBZ4mVGVOe4DTzXZapO4DhdtcrhXQOPUPfEfiwvBZRcit9SRUuPOtDOjAFJt7/KZETGZLZfavrqlRoRyhLEopXOGRdIoqWbGkLykiOmsmCfKKIHH/RktaCp0ZlLuHQG6fMvSxzrEFNjJTKfAQBkJUjcKWUVRjst4zhOfYoJYuV6q0ZIWpb6LR5wezylz/DcL3X6VgfVgqU25HwsBSot89/fBNJlj1DBNasyHCAXvMjt+M0gm8SKjEpH0X/Ggr7qbtqGVh5qqyxOc82aDmNrFSpY3CCsY8kPy6ZpTdgaJmilYLXnaIOjIfEMTzYg6m1Z3qI10biQoDKDIFTjagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VHiboYJH7PGBirLkgaxzMQSUIp5GNznCnvhD78UPtU=;
 b=v/3XW0dxtXyB7msDuoUrDCjc0Eqa4HpuqM2q6JjYneBH5WhUoKskFSR/iW7Vs0i3OA4d89aK2mtgZk7Rof2GOLypHdjG8zSZX03L8Mgu3mgjq86JdQOhXrbk2VfcU+GzT9d42CQHAxwBabZpR+6xoLR7HiBysjaXqFS3b7Jt76U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Jul 2023 10:55:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Message-ID: <ZL-N5cHkbcusnKqb@MacBook-Air-de-Roger.local>
References: <20230720082540.69444-1-roger.pau@citrix.com>
 <20230720082540.69444-4-roger.pau@citrix.com>
 <022263eb-e10d-4e76-8fdc-2f64ecbb347d@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <022263eb-e10d-4e76-8fdc-2f64ecbb347d@perard>
X-ClientProxiedBy: LO2P265CA0212.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::32) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN9PR03MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 46abaf0f-35aa-4c40-5cb3-08db8cecd845
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lf3ctseIEgT1oAWtwsNcmFTxBLVMAYrl70t8CnCYwn9LtWMx/R03pvJj+m+awASN/D+xPkh9kbXLShSC/fgH2HjNpr4xeNdXn1cx/OS2fNWXOAf1fGx0lONZ1aTUKCSSPsvrzckpOahxyDyYboeul5r9WfWyYElZYSxCtbhY+DiRDEfGCTX4e0VPDtHbLGO7EUZzE9qKY16Vn1YSov9l6zwdt9x6uNvnyNPmQa1GlfsXb+fm7rH8nbLreDEUgGWgTb7C+Rxs+KDMP8gnQLzuEL0VwTnAcaI4aq8VHrnfMB5psuUsgBh+HZUt+F1IBjxSmw3F1/6ZuxS6dNGChv4M47FGNq5uVi7J8551zvldnsi0VJ8Cy9vL/keg033v7fImv0icXk4L03hxrFRQKiYAD7vgkPLGa56Mrl9irDIDICXmuNYGXDK2bsP9TqiCefBqMGqq+XEPMGYpEXKoHIZkWjhwCDBs7tAaC/GZIsYxQNvIxWC6RRvR099rJhMPlKZKo32L+2PtPQol//bmX5n5zoOSMKBQ/EJaq8d6r3QZHShPdNapf95bC6EIUFer5lDx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(26005)(186003)(6506007)(4326008)(66946007)(6636002)(8936002)(66556008)(316002)(66476007)(6862004)(41300700001)(8676002)(6666004)(6512007)(5660300002)(6486002)(9686003)(2906002)(478600001)(54906003)(82960400001)(38100700002)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXA4bVlma29iQVFsMWtiUFF2UDdOWW94ZW1mNVhUYjhQREJMU3U3eXRPemNk?=
 =?utf-8?B?N1prYlhXeENuaStzejZieUNhL3hLelRoOXhUUXBseVBWZ3NVSnlidXJHelZo?=
 =?utf-8?B?SkpsMUN0S1VHZ0NEa3hEdTkzZDU2YzBFQWhPTncxNmFSaHlidEkrK1NWYnZo?=
 =?utf-8?B?YkdqQ2NEckZ0VHhwYVc3MkdIN0xyYWJVY0hITE5CQkp4OFhOL2pMYjl4RGJi?=
 =?utf-8?B?RHVTT1JQMjdjcWZ0T0V4cTdDcGNSbEx2dUFUaWMwT0U2T2dJc0dCaTkxVG1V?=
 =?utf-8?B?b2psWDV2SFVmblM3QVJ2YTlxUm9xN0Z3aWhnRlJlUkRER05NbUtzNVQ5enFk?=
 =?utf-8?B?bEI3Ti9tbEc4dFdRMzhiNWpzRkl5K3AzU3FxS3ZGREM2MEpVd3FpcXl6d3lH?=
 =?utf-8?B?OER0MnVSNGVlOHNXcEVGYi9zTDNWK3JMQk1tdytHM0Y3MVVtTkRSRWxseTR2?=
 =?utf-8?B?NE1oWUNndnJTWTFralB0NU1DZ2duZFAxem05UmZUK29vQWlpamQxd3AyQ2gy?=
 =?utf-8?B?aVNYRkdOYlVpUFpmaXBISmMrUllGZmZhUk50dkFtcHcraHhUR0U4NUNKdWZs?=
 =?utf-8?B?WDA1YkNKMnlPS2FWYlRJMmt0bkZZUmdNcWdXY0QvcnI1bjRKS3lsSmFqQXpK?=
 =?utf-8?B?L3RXWjNSbUJVTWJNaHgyQmJieTQ0RUhFSG0wdDRWNFpOVmdyV0QvZ1hkd2hD?=
 =?utf-8?B?YTU0Q0hBSkNvUnRWMit3Wm9BejlJaVdmZnJhZkJtWkNaU2d4T0g3WkRqNFQ1?=
 =?utf-8?B?NzNYZVJoam5CK0Z1SHJOem02Nlhud1FxeW9MVVNpT1JPWjNKamhIVWlGTVB1?=
 =?utf-8?B?RHZDYXRGK1BCQytKcWNlOWpyQ2t4cVhBVFEwL0ZSZmwzeko0QkxTZDcyZk1w?=
 =?utf-8?B?WjBRUWNqOHJCNmdGZ01UanZoQ1JROVc1aVUxNU1qd1R5SGNSY3RGVnpET1c1?=
 =?utf-8?B?K0hncHUwODNJVFRPSmpFNWNsazlORnBIVXVqMU85K0czTUdDak02ZWFIZFNz?=
 =?utf-8?B?dXBwdXdjaFovWkZ1WCtJaURIYkZ2cVo0Zi9ValJyM0pEWnB0a0R1L2g0c0xa?=
 =?utf-8?B?RVg0Q3BFM3NmZjRJRCs4Q2Z3NFlVdSsvcS90NzdBTHptT0RSUlFtUlRrWm5v?=
 =?utf-8?B?THlOWHNPWkVCWTRLR2k0dS9oSXpCeDRYMzFhaHBWdzYzbEtxUERUMGNBMzlV?=
 =?utf-8?B?ek1FQWhtT0pZM3hvK2FDZy81TCs2bGpQQVdvc3pvU3ZZUk00QnY2L3pqV01G?=
 =?utf-8?B?b0VBdmUyZnF0dHdBd1F5N2VpYm4wRjNDNjVRTmlkamhqczc5T3ZmT1JienRq?=
 =?utf-8?B?QXBhN2JrU1BzbjV6OC9hZUIwS09qUlN4WHhFYVJsbEFKMHhsVm1TYW94bmNN?=
 =?utf-8?B?NnJmZytsbWhpd3E0d04xTzV6ZUFjZkZXOGp0M0VuZTMvUFpvR01IcEdzb2FP?=
 =?utf-8?B?SHRhblFVczVFbnVUVEVRVG5LcWFBQVlOaEJzT3NsemozWlB0NTVtWStvL0ZP?=
 =?utf-8?B?Y1hPbi9aOWRnWHdMSlJHSlFEaUpFSVErSTlkd3BmejdwSWZFYW9DWkttVmRy?=
 =?utf-8?B?VnlTODV1ZjhzSllOTGJ5bnhkK2FnQU5yRjU4U0dtVFJWZUVzUCtBSmRoZTlr?=
 =?utf-8?B?TXZ0QmhNUVEvaUpCZzNDbFZMTkllT09HNUVzTU00dEJ5Qkg0WVJtS1dDMzN3?=
 =?utf-8?B?bkJSVi9Gc2hEeTFaSnZLWERoT3JaOUdrZlRkanZDZjRZdklLU2dKYlpUVTdi?=
 =?utf-8?B?Y2VHbVYxaVJ2cU9ObVkyZFk5NHlsTkpyelYvSkhQMGQ1c1dpa1dLTkY3MEJm?=
 =?utf-8?B?WER1dmxJMUlQS3FYSDk2SktsWlo2RzY2ckM5SU1uaklyamh6WXd0RnZaV2hJ?=
 =?utf-8?B?Q2VXR3EzNkl5cVFPa3NWUXRXenpwTUltbytZZU40L1BxR01KcnVNdjlpRHh5?=
 =?utf-8?B?QVJtQmNYZXYxVjBDMmh5SlNZYmdEdVZqUUhIV0UrTzRrSHJ6cXJNMElzc2JZ?=
 =?utf-8?B?SU80S0VXVDNka041SVdrMnBLYnpPYzNMQUtEN3VjVnJCbjFMVUVOSzRnQzRp?=
 =?utf-8?B?TCtRV2ZOT28vUjNTOEZFRVI4UTRsUHcxcHBQU0dVU21kQy9GRkpyeWsySFNl?=
 =?utf-8?B?UVNSekVWNERyN0wwRTRDR3V6YVNYVlBEQStzM2h1aktpaHNwQWptMUpVYXIy?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a7l8wNLc7EXEKJDnoPMJbxIgnJ2dHCpm5oODBfrGoAKAh6S9TeUYL8Y3xOQfB8S0flEA2cJPqk8vuWSXO2Fgs9pGjbpEUN2yIFfwjLifuQtkAZoQm0BqVUNYty8Z2/ubdg/GT5mUqVBoU4pnr6vfvPtiZYvs9zCMNGy3373FD6cYkTnnhQvL7jCHiEyhClyIXon5rFUTbuaeUHWHAvzEm2GfPcowxpaPm1CJs6PL2wG7uJ9luxzgaitTIaEky2aTYpwgg5HsiH9Mm88B8sIeIOHDDRr4AQ+meCUrfIUppqAg4E33PSD4tUFbX3zwR2os8fQdbr5GoLJyGljfvMONMGHHyMbnlhmmeQ1Oedan3E0kU1FwLVNw4uLgg792cSwZKCcP+YuhjyGuzgcKWLkS+hIv7dOCVJlc3G4VVexnATT5BsEULn8B54io11foxqsp6pwOSMwLKYYjOUMepuf/PVL2kCETC/Mw941OtBu5Wrmg18ZP8oGnqS18KWcwsfksDWCwW/RErqgGiBCuE46BlmGArWnjCJ4kJB7Cudhic8cADu2VTVJV6WikC2nI0iwI11veCS8125icBqFpbzwchJjLiUHepdlG6XRFmVKl8g4modLiSKJv4dyCRfZIh6JCLd8+kb4hwTKbJ1zZhXQxB2fKh2ZTZpMwk6sJ2M8DnF7UbvIzQp0Ggf4DO9sJncopqTbmuWpKBpQmkW0pEQactaA5pLEYHDmaqbe/4E6DP39Y6uuGr7pG7EQ+qQlC2AR24pnqflxBMhpKkSWxaWlhFimYu/jUxr7Ny40d30QI1uZoxNMennWutATti/1PvvDL
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46abaf0f-35aa-4c40-5cb3-08db8cecd845
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 08:55:07.4313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3Z8GlSuPSNvBP3oWsRSmVUhuM1wM4DVXzdyIOlMjsba+OqLOtsedxqUJ+l5FOnM3L/ObhMITawWtFrCMI+kiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6122

On Mon, Jul 24, 2023 at 06:26:42PM +0100, Anthony PERARD wrote:
> On Thu, Jul 20, 2023 at 10:25:37AM +0200, Roger Pau Monne wrote:
> > ---
> > It would be nice to rename the json output field to 'cpu_policy'
> > instead of 'cpuid', so that it looks like:
> > 
> > "cpu_policy": {
> >     "cpuid": [
> >         {
> >             "leaf": 7,
> >             "subleaf": 0,
> >             "edx": "xx1xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
> >         },
> >         {
> >             "leaf": 1,
> >             "ebx": "xxxxxxxxxxxxxxxx00010000xxxxxxxx"
> >         }
> >         }
> >         }
> >     ],
> >     "msr": [
> >         {
> >             "index": 266,
> >             "policy": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1xx1x1"
> >         }
> >     ]
> > },
> > 
> > Sadly I have no idea how to do that, and can be done in a followup
> > change anyway.
> 
> I don't think that would be possible. I think that would mean renaming
> the field in "struct libxl_domain_build_info", and changing a fields
> name seems complicated.

I did wonder whether it would be possible to change the json field
name without changing the libxl_domain_build_info field name, but that
would need a lot of special casing AFAICT.

> > diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> > index 3c8b2a72c0b8..68b797886642 100644
> > --- a/tools/libs/light/libxl_cpuid.c
> > +++ b/tools/libs/light/libxl_cpuid.c
> > @@ -592,17 +641,24 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
> >  {
> >      int i, size;
> >      struct xc_xend_cpuid *l;
> > +    struct xc_msr *msr;
> > +    const libxl__json_object *co;
> >      flexarray_t *array;
> >  
> > -    if (!libxl__json_object_is_array(o))
> > +    if (!libxl__json_object_is_map(o))
> >          return ERROR_FAIL;
> 
> We still need to be able to migrate a VM from a previous release of Xen,
> and we are going to have an array instead of a map. Could you try to
> handle both the old and new format of "cpuid"? If we don't then the
> scenario "migrate then reboot" is going to fail to use the expected cpu
> policy.
> 
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index 9e48bb772646..887824fdd828 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -19,7 +19,7 @@ libxl_mac = Builtin("mac", json_parse_type="JSON_STRING", passby=PASS_BY_REFEREN
> >  libxl_bitmap = Builtin("bitmap", json_parse_type="JSON_ARRAY", dispose_fn="libxl_bitmap_dispose", passby=PASS_BY_REFERENCE,
> >                         check_default_fn="libxl_bitmap_is_empty", copy_fn="libxl_bitmap_copy_alloc")
> >  libxl_cpuid_policy_list = Builtin("cpuid_policy_list", dispose_fn="libxl_cpuid_dispose", passby=PASS_BY_REFERENCE,
> > -                                  json_parse_type="JSON_ARRAY", check_default_fn="libxl__cpuid_policy_is_empty",
> > +                                  json_parse_type="JSON_MAP", check_default_fn="libxl__cpuid_policy_is_empty",
> 
> Maybe we should have json_parse_type as either "JSON_ARRAY | JSON_MAP"
> or just "JSON_ANY" since nothing beside libxl is supposed to do
> something with it, and when migrating from a previous version, we are
> going to have an array.

Yeah, we need to use JSON_ANY and then guess the version by whether
the object is an array or a map.

That should be easy to arrange, let me prepare v4.

Thanks, Roger.

