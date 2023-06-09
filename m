Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45818729840
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 13:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545869.852498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7aNK-0003Hg-Dn; Fri, 09 Jun 2023 11:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545869.852498; Fri, 09 Jun 2023 11:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7aNK-0003EL-Ax; Fri, 09 Jun 2023 11:33:50 +0000
Received: by outflank-mailman (input) for mailman id 545869;
 Fri, 09 Jun 2023 11:33:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iE2P=B5=citrix.com=prvs=5173412b1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q7aNJ-0003EF-2u
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 11:33:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e7081fe-06b9-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 13:33:47 +0200 (CEST)
Received: from mail-mw2nam04lp2175.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 07:33:44 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5347.namprd03.prod.outlook.com (2603:10b6:a03:218::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 11:33:42 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Fri, 9 Jun 2023
 11:33:42 +0000
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
X-Inumbo-ID: 7e7081fe-06b9-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686310427;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=T/TjCHREq3AyRvJhWU4LXWI1ZuO08PV1L7sf3TMwlKM=;
  b=fzmfD+aoyfFgadwoF2wTM+vHorTukf4sFyou/9VFHMoC0BCj6YDTjDiP
   FsfqH50tpCQZyLVJl/a/iJ5++z72veuERzi8yW/fR0CyVB0NoCne+Vuob
   qAuKY+Aw9KgLjRClvSlPJxt97cnsoOvvpBB1fqVdaFkoffHPLViiV8voA
   k=;
X-IronPort-RemoteIP: 104.47.73.175
X-IronPort-MID: 112217308
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FguO+6+AgRCAI0y8QCy8DrUDTn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WEeCmyEOvmCZWr3eYtxb42y90hXv5LQzYdrTAZs+CE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6ga5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkluy
 +YBBR8KVyqggtyOyeiwac9xiv8seZyD0IM34hmMzBn/JNN+HdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeIilUujdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWx3miB9lKRNVU8NZgpV+IwVQ9MyQyD3S0iv7gjkGhUPJmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatM8s9QtbSc3z
 VLPlNTsbRRrrbacD3yU8LyZqTevESEPKCkJYipsZSkv7sTnoYozpgnSVdslG6mw5vXqHRngz
 jbMqzIx74j/luYO3qS/uFXY2TSlo8CVShZvv1qKGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWF6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:KCMk7qgpXjvLyyE2+9HYgiNqsHBQXjIji2hC6mlwRA09TyX4rb
 HKoB1/726NtN9/Yh0dcLy7V5VoIkmsl6Kdg7NwAV7KZmCP0waVxedZg7cKqAeQeBEWmNQ96Y
 5wN6xlFpnyAVx2ycH3/hO8H8s8zMLvytHOuc7Oi3N2U0VoZ6Vsqxx0BQaXe3cGIng+ObMpUJ
 6H+I5Fqz6sPW4cZsO9Bn4KG/LIocbGjvvdEHo7Lg9i8gOJljOu5vrxGwWV0BEEQ1p0q4sfzQ
 ==
X-Talos-CUID: 9a23:buFUzG5+MJsKumsUNNss1HAOA+0KdUTn73LuG0biAkVPVbGuRgrF
X-Talos-MUID: 9a23:HP4MawVH0ozCmG7q/DXJhiplDOlT2oD0J08mlswCtNaPFRUlbg==
X-IronPort-AV: E=Sophos;i="6.00,229,1681185600"; 
   d="scan'208";a="112217308"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFGL2XQ4lRCyC2mD7lHHIDdEChivfU+HX/HQWOf39J3joaTbNLGWG09W26A6/ZOuX1RPHHA9QDixtOx0sI1HiCkL3qaRVHmasjBRSmO10UkGqXC5mf+7qB8D8593mIN1v4fI9g98955SccWdB4U/h1BWvbRYOgSAst1Vyt/UWySeReYZ5fYgFlcw7OzJ0RVemDsKUeOvUaSNAo7hpaC9rdfJ25KxmJTucLYf9Ids6ES8jHqyXXnO/0xZAD29LD/FPbUX2AFvta6bZolz8UDjVvJ6gO61HpcHErl2QucW/XzU54kccvqNG1E9uvoRvF3wfoZec/gD72jnl64pmFVxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOsQUTkBx3IDdfRpwia8cJwS2pY3dbVitKXqGD315ks=;
 b=k5zGgXoQH+6hFjzwjdC4/Mg8dtvzVzFeDPSJX3PHOnRqMPl8eJEDiolC5SZjhz/r16N8IQn7ALAvlzN92w3aP+93/p6cqGlzsyrrWXuQ16rpoAvTRePgj6uuflQetqI6WveuQAsls5n9HulNsMxjg8nEi+p2vJObb5x+ok5lw/HzwPwDVcN2/Wa0PbnCzwWa60TLjiklSG9GFml+3pOne3hMtCNsbNaQ+FibQlVZRCV6+onV9LVUzrBnYgSKxah/ImcReC9CNG/Y4csPg0RKKv5F82yntsvLaQCnaE9m3GRYl8yZ6t7OkB+mdTfOEmeSKSkElsomIBog0FDBnHyRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOsQUTkBx3IDdfRpwia8cJwS2pY3dbVitKXqGD315ks=;
 b=tan3zVzT4iKnEcb0ifRrH8PEvAXIFdrQJ+9F2xeAKr0QwW3Qe4Xe2DgmY40L9Fd0HVf7N2OtWty2svz9nOOmQJc+gM8l8ih/IyrJTsziCKfYKkdX8Mz9NnlNpN1X+gaZ8EcFoxwYZnUfM5bP1J2BQoE+ceaARuoziSNcnaQEREI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 9 Jun 2023 13:33:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
Message-ID: <ZIMODwXO87JyJntB@Air-de-Roger>
References: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LNXP265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: a220a197-460e-4c5a-9ac0-08db68dd6080
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JHTBZmcGcj9fkhMvCols+Vge2f32QwOe+8LqKGGffJOppjcC3T7fd5oeqc1uEbuGmG6NK6MhXZs5IcDaEXeIGvzsjxB60PX4vt7Yvycb73nl/n7XHObJxPywpXuDUpP9TMcFzRIIlHeFOAwP5Sfje0b9NWxDrCG6ZkBhBPpNY/F+nQqh9vdfx+gcERjVIDY/lmixmnYd1MXhZb0pk/XSmKsGniP7yXfFifpRVzqqVjcnop7ItpY4+F/ciGL7btPPJVxdXGX3xnPUhsyRkpuOlLErYv+GLrcgCSWW0IlHhY0kYEa63PkewQ4rWN1T6SfSojjsgcQru9UpiQ30PXOlyR9nQD3FGxeLsUgo7KOBhtQ5dgye57dz2eKXWqOMzNeZzhqErTkm35fNtPkgwpbeXKsSK5mZGW6ogAlq2Xs1x3sx9o6HeE1kgKENKvW+fBxiUQQ1yobJB+Q9tX7o7KG727TgfLG65o1k5oGuU3X3zuAdm16W+jiR/NvZ2LY2vXvqTbN5/3g04KyrFmcK1moGLGxQmu0QacTgh/Q5KgbuQSAUwQ1bvZv9wNHNs7eOJB+q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199021)(6486002)(6666004)(85182001)(86362001)(38100700002)(82960400001)(6512007)(6506007)(9686003)(26005)(33716001)(186003)(8936002)(41300700001)(8676002)(4326008)(6636002)(6862004)(2906002)(5660300002)(4744005)(478600001)(316002)(54906003)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm10MHM2OEVJSVgvbXBZeDB5OVRjL3JEMU5qYWdzTGE2UDhyNTYyRXhmdWll?=
 =?utf-8?B?clRucWZZRUNEdFREVjlqeEx6NGlsOEJQd0FjT0trbldNRDFuQjh3OXhUUEtn?=
 =?utf-8?B?M0VXV0NqTXB5YXRYa3UwNmJ2Nk40YTdQNDBLVUo5VnZKcGFJK0hDakdXdmwz?=
 =?utf-8?B?QWlOYTFuREJENkVwVHNJNjBSTUNqM1dPY2lhNkpyQmJoSGk1N0UzV2RpUTV3?=
 =?utf-8?B?RWxISU14RXJjcDl2L3BBVWRqNmVvSGpTM1RURHYzdnlCelpNeEtWN3poc3RM?=
 =?utf-8?B?eVh5VWdVR2tQbzB2cmZncFU0Q0dQM0VxS09hQUtBdFQ5UGQyOHNCTm4rOHVt?=
 =?utf-8?B?YXNJeXpFc0ozVWpRMmQzdW45KzYxM092bjc3b0lReENEeVpzSjdLY2sxVlow?=
 =?utf-8?B?dzNGSGxDRWkvU1J2Tmw4T0tUWTNPZ0l6MDZlUWZKOGhqV0czSU80bkpLWjlG?=
 =?utf-8?B?TVZNc2pvSEZNWkY1M0FlVExPSnk4VVVMWTArdHFjR0RYS09FNG0vejBZK3JE?=
 =?utf-8?B?NVlSb1oyU0d5TzJYeHcrYlVMOG42R3NqUlRzS0dSeWdhN3djWlN5eUN1Qnha?=
 =?utf-8?B?b1VWeHpZY0JjNm9LcUQxNzgrWVJXVEkrY3I4YndrWnN1ZDJGNCtDTExyZDNC?=
 =?utf-8?B?SVVlU1BSRVc2WUEzQktRcEZZaGtjdFRRMXpXblRETFd2RU1tWS9KVStiK1Vx?=
 =?utf-8?B?UzV4WDFMOWFDYVRXd3lBWFp5d2xNbHFHVHo3Y2pXTXNVZUlGVklFd1BSMGZy?=
 =?utf-8?B?dGd3ZTRUa2JGYUtuMHNvNCs0WmdkbGtuN0lHbmppcldkQ1pPdllNU1FVbUs1?=
 =?utf-8?B?Mkl1TTBKS3RmdTFwM09ZKzhBV3Y1T3RMYWtHOW1QNytGUFFvYWJWcVFORjh6?=
 =?utf-8?B?Ky9SaTVMZTNmTFY4NCtnZTNuMUZQZ2dZSEowZVZEeXIyaEd5UXpaWm13T1Bw?=
 =?utf-8?B?TGNtazJmTkU5UFdyNVoydzBWTW0wTkNBVGdQZUhsTG92eStvUUVsMlNFZVh4?=
 =?utf-8?B?S3NjRFhMS0FoVFlFK3ZYZFNZZE85TFF4Q2pjMXVCb0dqVHoyNGJXOVhyenEr?=
 =?utf-8?B?VmdnbGZkTUZCd0ZJTGMrTUF0N0xhSUpoL3ppVjRZWHRubXJNWmVNQjB6U25B?=
 =?utf-8?B?NmxwNm8vSURXY0d2eW90eUw5SFZsUFVXdFRyeHN1d0xDcVlOTFVaNUJBWk9Y?=
 =?utf-8?B?WmF4N3orTHlGQWhhODV3UVpubmxYL1FVVytjZFNlZzV3bU1qRWlxbmExb1Mz?=
 =?utf-8?B?TDVqaEdKZFplUWFCNE9IV2JpaHgrNmlsam9ZL3NoekdpUnVvZXRlamlJamhT?=
 =?utf-8?B?SVFVZkRNZzhOK2w4NGVFd0hldGhndlRuZWRxUnVjVkoyTFd6cmdSUTNKWnp1?=
 =?utf-8?B?R3RJQXhrdVdSMEdhL0JoZ3Z5WXlpL2ZKd2FzTUd2aUFRS2VlbmVwU0RrdWxI?=
 =?utf-8?B?U09Zb2h5QkJab1dEN0lONEdtSUVuU2RCRFlnNjFnZ2NlWml3eFJNbGpIQ3dI?=
 =?utf-8?B?cmVJRWpBV2Q3QXR6UnFKeWNENjEzdlRtenZSSkNMU2R6N2VOcTRMZkRqdCtl?=
 =?utf-8?B?cEN4UDRQQVlNNk5Za2N4aUc4Q2Rsak5hU25sVEZFYm9wcjQzNUtWSkk2czQ3?=
 =?utf-8?B?SGplS3NoM1hoejV5WkFia3MzaTZjN0d4SkN6anc4WGFwWFQwaWsxRjVEd1lh?=
 =?utf-8?B?QXFOQmt0c1ZEaTd5RERMRGJmcWxTNW80SHkzcWdVMytkTURjTmFnOEp5Mk1T?=
 =?utf-8?B?ZGJqVFFtSkg1d2FvdTk5UlpNdVNSNXAzYzA1KzludXRKWVpXL2w2UU8wMHJQ?=
 =?utf-8?B?aGhCTDBSZ2hFdlZ5dVVJZG93YTAwYzk3bXlmbVhTY2RUN01udkxmTHBlOUFv?=
 =?utf-8?B?K0FIQUd5NjRSeFZoajdKSFovYm5IOE1zK3pjckMzcDhjaCtIV21JNWQ0TGRl?=
 =?utf-8?B?bGV1N3BhR0pzZVgrbFg5YklUOE1QQnFtalFDc0RXUnZUV0xRQnNXWW1DM3RB?=
 =?utf-8?B?c2tVMWJkcFZrWHVTVHZsNXNJbFphVFBzdjhTeHdjKzA2V1phVVdkNlRBOVRK?=
 =?utf-8?B?QTJHdjhPYW13ZEM1T1Vsb0JkL3ZlRXFJTFAvVkhjMzB2MjJpa2FwWVNUbFpO?=
 =?utf-8?Q?4gDjRDhLgkDZrqSFQH+E/kHLD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3+8gL77SOGB++0Nx5M1XjerKMvpomh6iYL3geasG0Wv0szuTnAHtBX1aJsISpe8lNEU8xoipwo6rA3QWtystwjyy7FvZhlRVmZobRjKFn+pzH9RorevsHz8fAhxutKv+QXv27b5SWScUoe2Qw37Oq60srKoNHqwTVNgHF5gqlZI+1lc6UUQLtkGWHJBqRWThu2Aqu5MrwilHLlXWDNmp5LtwNdjuE9m0e4/exXdeVmN7Dk8y7HO6m9XPC/M83rioBMOxIz6EeVZe/dpbQ6XdIXnoVFysPGjwCm7MPqcTfg67CsajE6pMijwmTY7imnZNTyZ+EQkD6gjHGAmbTPH+a9x/gjgaXLJ1yuyt7OSOVDRFR79EzpVAepduQo7Nx2k74IpQgnffdz4wY/NNZ9T6U54kfpp6dB41XLOa47iW8gTaJEIJupD9Kh+iiaZuUs/NcV2et8lHf84JEkDje5OpfawskIALOCev0K/feOn3X+zBhUj/wYr6iUYHcNegG9KL+qnVTVJo3pWD06jgu+jwjOcW0uNh2ebALrku84Nbjxqi0BYAfqFB/DUIZbXe5idveSP824brToUh6e3TZOKwbWdunoK2H6hJwvOGHXc9BeQAdcd8VUYRZZO5QfxK7l7SNZg6x8rwlsdrKD1y5GMXE/aWcjTnrjR8/o+d2F6ZnWrEJROklHP/z6e4gXuw9962e0gDXkvUMkqKpmKAAeZfgUlHHmVCVF49j4XLibXBl5sp5drdSB3FyOXZg/+v9peyhj11ueVByyTEDk+QDG8LVU6MfGVeeHfMqacWYuO9HsTusMGGyxvVCn43yy2qr1z8h5EG02A8cEmA6URau5I1SQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a220a197-460e-4c5a-9ac0-08db68dd6080
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 11:33:42.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBFCIs2nIEHKgq3xgRt53hTjdKeArFAn26bnnp6HCkrpzz8dvzWnkOtyUhukuWG/pcRdHIHt+gxTIuPWhMPx0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5347

On Fri, Jun 09, 2023 at 11:11:05AM +0100, Andrew Cooper wrote:
> MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.
> 
> Drop the pair from x86-emulate.h which includes common-macros.h.
> 
> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

