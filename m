Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1727450B446
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 11:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310778.527689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhpnO-0008CA-MP; Fri, 22 Apr 2022 09:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310778.527689; Fri, 22 Apr 2022 09:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhpnO-000897-JO; Fri, 22 Apr 2022 09:41:46 +0000
Received: by outflank-mailman (input) for mailman id 310778;
 Fri, 22 Apr 2022 09:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJ8Z=VA=citrix.com=prvs=1040bc4e0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhpnN-000891-Hp
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 09:41:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a1be77a-c220-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 11:41:43 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 05:41:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5740.namprd03.prod.outlook.com (2603:10b6:806:11b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 09:41:13 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 09:41:12 +0000
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
X-Inumbo-ID: 6a1be77a-c220-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650620503;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PyavtDa7diMCEF0nVQcKlqv7x/eCnn35yRDzKXxBgdY=;
  b=a0Wfl29VzrjOpigrd9OKf0iifPLBjaaozG4/xxuQp/d4/kJHvinTZElq
   hyKgu77EipE60XDVgVn/jiNj9P9O/kh0ycPGKGU6BmP0Kn9b/kw2JwVis
   X1nfFs1XOUn+QJTIbgiXdlZGhcpyGasFCUk0qUQAxCJbaDyNMEF1eC+7M
   Y=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 69565157
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QuYROKh7QKYoT9AMowSqo24LX1618xEKZh0ujC45NGQN5FlHY01je
 htvXDiCa/fcNmShKd1yaty+oUJUvZ7cxoQxGQtsqCgwFSkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nX4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YV9xZZSQxeo+aj9dCwJ5OoZM9aPof1Hq5KR/z2WeG5ft69NHKRhseKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehWhr7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9gPI+/duvje7IApZ94jub4rZROW2SPpww2+E/
 mj6rn3wDURPXDCY4X/fmp62vcfImS74Q54DD72Q+ftjgVnVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHmAsx0HUtxcCdom+RqNwarZ5QWeLmUcRzsHY9sj3OcpQRQ62
 1nPmMnmbRR1t6afU3Wa9bG8oja7OCxTJmgHDQcGQhEC+MLLu5wog1TESdMLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1VLahzOhoLDZQwhz4R/YNkqb6Qd+aJ+gdpafw1HR5vZdL66UVlCE+
 nMDnqC25u0UEYuEkiDLRewXBayo/N6MKjiaillqd6TN7Byo8n+nOIpWsDd3IR4zNt5eIGCyJ
 kjOpQlW+ZlfemOwarN6aJ6wDMJsyrX8EdPiVbbfad8mjoVNSTJrNRpGPSa4t10BWmBw+U3jE
 f93qfqRMEs=
IronPort-HdrOrdr: A9a23:ZPg/Yqs7ZET/iAgpFLr+F17Z7skC6oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczKgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenkPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesaMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO21GkeKp
 ghMCjg3ocWTbvDBEqp/lWHgebcFEjbJy32DXTr4aeuontrdHMQ9Tpr+CVQpAZDyHsHceg72w
 31CNUWqFhwdL5mUUtcPpZ0fSLlMB27ffrzWFjiUWjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.90,281,1643691600"; 
   d="scan'208";a="69565157"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWlSF8cBTVRIpg0W6/wWZYT+VhUrI5YN8DjlNB8kJSE73ErkRwxbrSvJCyqeOhlZUe1UtlcQc8tl7x3X6jXCD7151wJ59/ArvEBCpqqeHZ2WAejhhzKlxTsZIN8pixbZf4utzZvAryoShiWuaWerIt9SVGB6t7vqYhAwuH8Forh9E6qM4L1bNsOsW8lGtYgN3Izts6v/ezMy5jQlroIhQYycxkJq+AhJypVMHZ/GTH2cM73R2GfEa7t5oVQtMLCIlFAD9PH23VNVPMEYB0rybGsPhuKJkNVk69d9A09BDaGaK1tXZDbZ40F6Shcmu9cM+1aEsr1TfTgctiaLYyqL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nhS6/yUoO05duGe91k/b2AFm/E14+Gs/VbvDYRzq9g=;
 b=XGFGnE0oOlC4OOTGTE3eQxgpFJ4gdU/hy2L4ZNNNlQbqSErYORsEXg0pa6rqY/vjan80U3+g8SqHhgnP7kMNHhoL8E6ixLLqW1gBG6+mYftG7i7c39B4+hEd0gJsZB/aRlkP0eXi4V/aJdVnZ24iG3ajfUr5dQvtl/qsxT+18UeKCz9glhNg/dh0pzg/FDVuKyaNOke4pQo66W9Gn9HKMLbeFlaD2kxIBfoZIvB2APIMiqHYi36fwUb/WzE3Whkg94PplwZ2d6OUwKRha71uQDSvsBPOl3xTpoXnMepGzrmAYpOJRjhhleGvJr/3k5tT5hmHb7XF589Up3paZ3+zKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nhS6/yUoO05duGe91k/b2AFm/E14+Gs/VbvDYRzq9g=;
 b=Fv0M2Cik0jQ3LGrL45KVAIePD53QNFydefMYBcS5vMOiuwv6v/EocG3woYar0HGKbhvdcB0RrDY+icg+DOS4Ea0gQqUI8tM/SB9JUdopolYsJ+BRt6nr76u6K2y2ywKEupWJKNXi5rSGr3PopMqROO0WMX7JB8BADz2Dt4yAzQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 Apr 2022 11:41:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
Message-ID: <YmJ4NLuvA63Irow+@Air-de-Roger>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
X-ClientProxiedBy: LO4P123CA0281.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0becddc0-cb27-4d49-9c3b-08da24443d06
X-MS-TrafficTypeDiagnostic: SA2PR03MB5740:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB57405BB891DBC64F7BF9AA2B8FF79@SA2PR03MB5740.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/HkkQvksdJgwPonQl7GnKXTlOscU+LZAZcOszZuY242OmBO45sJsJLq0VKGI1hP+JCv0VxkSQ1EUpAs85y2AGYSXIgBdnRyD8ayGXYMQjD0fjYPd2rXhcUw8/sFf76egg5fiPwJzTszRjIDXdYtHLy9xVttsUi2guV4qCN8EJqA0mOuP86mFXquHcFt4sxfRw79XFK5gfePWRG9t3NmFX8bFCW7nt+IAJ5CXG8Yh7o/N9rf/V5L2NpzI1DzTSv99KfF79qKSIcb/aJrLsGSGUiwP7LiqhGpPKC7fzusEJU4Ab5EVRXO8DZ8wl0UYp6xNa77YrL1klFJXvFhiATfBRZIKhechpxq3JOFjLW/bonf58FHGKiipcL+rB4JHM/hXXs5Ut4HVWC/5Q4TYHTBZJdsUEqMDFw6GgKyV2LMAz4P91LyRU6bGJtIpsmFXditOW5MGRceZcoaDxjdacQzxH/I1WvFge33mfQgrpEgWltve/klei1rd+z1PwBAYUZwXP958cJXfcqBeg7RZ46qSJUWl4tv8rZfTz856Gfn0Sj30pguEaqdFSpNWxyN0nYoiMELqsa2GwLIbaOPJZ5gW3I4sQ4rpHozZp460YOt7eiCJFe6LfsLPtefQr7AU3onsj9cD+CnSXAnpQ90fWgSirQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66946007)(4326008)(8676002)(83380400001)(5660300002)(66476007)(66556008)(38100700002)(82960400001)(26005)(6512007)(6666004)(9686003)(85182001)(2906002)(7416002)(6916009)(508600001)(54906003)(8936002)(86362001)(6486002)(186003)(6506007)(316002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGhvZ0J4MEJpc1k1Q3lnSXFmdklLdE44VXl6UnptTVBTb0VacVlidThyOU5G?=
 =?utf-8?B?U0NsbnZHaWVGRU92UjVsS2ZFZllEaWYyRTUwYlRoZEFWbzdiTFZ2am52cnNF?=
 =?utf-8?B?Vys2Y1YwK2lWdU1oZWhMMUxHSjJkRXNuVWk3VG9TWmc2YlNCWUcrUFF3RFYv?=
 =?utf-8?B?dU9sT3pqbStrR1JyRzhCc1ZWeEtuOUR4VncySDJycUw2TUhJRDRDek9FNm9w?=
 =?utf-8?B?RW1Vc0JWNkxDdDhXeGpvRFdsZDNuZFZqYWdwK3hNZXJFVE02V3p2a1FlaEYv?=
 =?utf-8?B?ZHFHUUM5REJNS1pDNWVKUUlOdFBHSHVoOFpocUVjSVJwd0NTbm5ORnVRd09u?=
 =?utf-8?B?aFIrS2QvdFR6Y0loZG9wWWYrem9BR1JTR2J2Tlk5cXR6MUdyZUhoNnhEREt2?=
 =?utf-8?B?VDRibDZFQktXV2M1THcxQ0tDd2RFWWQvY2V6Y0RTYU0raHpscGRYNmRlUytq?=
 =?utf-8?B?dHFmOXFmaFZaNi9Fci82NDU0dWRNWHRta3NRK0hndzdaSGZ0MElHMm92QTZP?=
 =?utf-8?B?YmY2N0t2aGh2NTBIT2JMTXlsRm5JTzJoNk5RYk8rczZMeEI0S3lEZ0hXQURZ?=
 =?utf-8?B?bEUyb3VVMzZLV2x2Slk1cTEwM1BxUXpubWNnQko2dWo3SFFTaVpZZU5ad1R3?=
 =?utf-8?B?YlptdlV0ZWh2OS92b0lRWndXUVR4ZW01MnBKRFZ2MDlDTjJnOGw4U2ZqZ1p4?=
 =?utf-8?B?Ny8vUXQ3a0owODBlaCtlMmdvd0R3NGhNK2NiS3pIUVJZaE5GZytyMTJ5VjBS?=
 =?utf-8?B?VTc0VjcwSzZNYm8yc1IxNnNMak9mUU5Lcm9OWFNQUlFpb3dZaDluQ0Z6TW9C?=
 =?utf-8?B?UWhHQ3p1YkNBNEFybkQ2eC9CY3VDUUp0OVZQOFRMeGRPNSt2MDU0K3YvVFM3?=
 =?utf-8?B?eTRCaHAvK1NSbld0SVlzTnZZWnRrc1gveDZQMFFGd2dPNURlT3dSNjB1R0Fo?=
 =?utf-8?B?OVZvb0NZclJpSVN4T09TcExJekVpN3UydzBUOTJRd2x2bEhDSU9ORHEwK1Bq?=
 =?utf-8?B?VmFveGVvdHNLdGlKaU10UnE1T2V3bjZsL1dNV1E4cVhQMnlZQ0J2aVRMb1di?=
 =?utf-8?B?YlF3ZTZ1ZEJ0UnFVd0hyWEZIT01OOUkvZjhwNDdLRHNnM09NNGNNb083L25Z?=
 =?utf-8?B?VDRNemJSL0w1bENQMW5JNGpuRXJQbmtlMTE3WlVBbWVmTFMwVHo1SnJ4S21D?=
 =?utf-8?B?eUc0SkZFd01HRlhidGFVVURVWEZJd1dpaDhadExUOVdwRERaUEduMzB5R0lP?=
 =?utf-8?B?Mjg2SG1sakpYWmV2ZU4yWTdxL204TlZUVm53UnJpU0c3K0gvMlFITVVDdXh3?=
 =?utf-8?B?UlFGUkM1eFBMV3A2UVRxK1JoUDJHZlZnT1Z4YUlVU3dPcVBNWFFibm1jY2ZW?=
 =?utf-8?B?SFVibnNlVlVPMmUzaytsdUZWbUk0Z25sT1NxSm0wSFhSWG1WcDRncytibTNQ?=
 =?utf-8?B?elUvZysxN3RWM3FYdmZ5dHNRdllmeUovUWZocHFlRFVqSWx5Y1BjZTJqc2s1?=
 =?utf-8?B?MW5IcmN1bGluTjhzcFYwWnpMOFRPamZZaTkxam5EaFg1Nkw5Z3FpRHpCbU5v?=
 =?utf-8?B?OWlId3FHSlczMTE0enRtNTZXd2srRUM1ZHppWTRLQXNkd3VTRTU0VjZOOWlQ?=
 =?utf-8?B?aS91cFFFTm40aEIzU2hlWUQ0dmpmZXBmalphU0k3WUdhVWJUWjVDL1dhU1Zz?=
 =?utf-8?B?S1RxL1VOSHpjZDhodWdjY25hWmI5VzJUTjFZbEc4K0wrZXhuNjFlejdubTVW?=
 =?utf-8?B?bnhiTmtwNGVveTFyUFp5WVhhRnNRS2FuMEZrWTJnbjFwZHpxcjNRcitPc3pX?=
 =?utf-8?B?dDJPajdyZTRyckpjSHRXOEdBTHpFMnF6cm40MDgrVXYzVlpTbTdxblcwdlUz?=
 =?utf-8?B?ZzY4Sm1tZ0tNTzNXSi9pTVYzaW5UMjBXY1FqOWxtZGxIRzJCRUtpeEVmbHpx?=
 =?utf-8?B?MWtrUmZETmRUVHpEZXNsVFBEcWFxMXVpNVkyY1hKOVRXNDBtZG1Kd2g0eHd6?=
 =?utf-8?B?MDNERURUN1RlamhuNGdtU0N2N29ESUtvTFBId1lNUTFIK05lTG14L3llaW9T?=
 =?utf-8?B?RHRLTDQrMjFIMkV2Y3JRRmNTaEY0VFpvck5NK2JwNjEyeDd1YUdYTkZnNzBN?=
 =?utf-8?B?SnFWSjJrNVlGdzVBZlFZTW15NU53a1hmNDBvMy9Wd3c2c2RHdlpuYjZneGZK?=
 =?utf-8?B?OW9MdFRFek02RkpRcGxkeXNwbmNpUUFBdEdJZjBITk5jSzlTdjFmL1pjLzNn?=
 =?utf-8?B?eCtFcDQ3NUwzZkxxOXZiMjhSRStPSGFqY05zR0I0TEFoenNPUHYzbU9wSXdG?=
 =?utf-8?B?UXpGVlJMVU90MTRHVmhIZmI1enNNcUI0elFtVUg4c1ZkYVBDWkI1dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0becddc0-cb27-4d49-9c3b-08da24443d06
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 09:41:12.9231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2153OSP5ueBTFATZowyJjL0p4KqyLMK7zPK7uih1nertf/hE/t1bEiduWo8D6lLkz8e68Ry4wR4QiEOQC8rdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5740

On Fri, Apr 08, 2022 at 09:21:04PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds basic support for configuring and assisting virtio-mmio
> based virtio-disk backend (emualator) which is intended to run out of
> Qemu and could be run in any domain.
> Although the Virtio block device is quite different from traditional
> Xen PV block device (vbd) from the toolstack's point of view:
>  - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>    written to Xenstore are fetched by the frontend (the vdev is not
>    passed to the frontend)
>  - the ring-ref/event-channel are not used for the backend<->frontend
>    communication, the proposed IPC for Virtio is IOREQ/DM
> it is still a "block device" and ought to be integrated in existing
> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
> logic to deal with Virtio devices as well.
> 
> For the immediate purpose and an ability to extend that support for
> other use-cases in future (Qemu, virtio-pci, etc) perform the following
> actions:
> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
>   that in the configuration
> - Introduce new disk protocol field to libxl_device_disk struct
>   (with LIBXL_DISK_PROTOCOL_XEN and LIBXL_DISK_PROTOCOL_VIRTIO_MMIO
>   types) and reflect that in the configuration (new "protocol" option
>   with "xen" protocol being default value)
> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>   one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
> 
> An example of domain configuration for Virtio disk:
> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, protocol=virtio-mmio']
> 
> Nothing has changed for default Xen disk configuration.
> 
> Please note, this patch is not enough for virtio-disk to work
> on Xen (Arm), as for every Virtio device (including disk) we need
> to allocate Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree. The subsequent
> patch will add these missing bits. For the current patch,
> the default "irq" and "base" are just written to the Xenstore.
> This is not an ideal splitting, but this way we avoid breaking
> the bisectability.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes RFC -> V1:
>    - no changes
> 
> Changes V1 -> V2:
>    - rebase according to the new location of libxl_virtio_disk.c
> 
> Changes V2 -> V3:
>    - no changes
> 
> Changes V3 -> V4:
>    - rebase according to the new argument for DEFINE_DEVICE_TYPE_STRUCT
> 
> Changes V4 -> V5:
>    - split the changes, change the order of the patches
>    - update patch description
>    - don't introduce new "vdisk" configuration option with own parsing logic,
>      re-use Xen PV block "disk" parsing/configuration logic for the virtio-disk
>    - introduce "virtio" flag and document it's usage
>    - add LIBXL_HAVE_DEVICE_DISK_VIRTIO
>    - update libxlu_disk_l.[ch]
>    - drop num_disks variable/MAX_VIRTIO_DISKS
>    - drop Wei's T-b
> 
> Changes V5 -> V6:
>    - rebase on current staging
>    - use "%"PRIu64 instead of %lu for disk->base in device_disk_add()
>    - update *.gen.go files
> 
> Changes V6 -> V7:
>    - rebase on current staging
>    - update *.gen.go files and libxlu_disk_l.[ch] files
>    - update patch description
>    - rework significantly to support more flexible configuration
>      and have more generic basic implementation for being able to extend
>      that for other use-cases (virtio-pci, qemu, etc).
> ---
>  docs/man/xl-disk-configuration.5.pod.in   |  37 +-
>  tools/golang/xenlight/helpers.gen.go      |   6 +
>  tools/golang/xenlight/types.gen.go        |  11 +
>  tools/include/libxl.h                     |   6 +
>  tools/libs/light/libxl_device.c           |  57 +-
>  tools/libs/light/libxl_disk.c             | 111 +++-
>  tools/libs/light/libxl_internal.h         |   1 +
>  tools/libs/light/libxl_types.idl          |  10 +
>  tools/libs/light/libxl_types_internal.idl |   1 +
>  tools/libs/light/libxl_utils.c            |   2 +
>  tools/libs/util/libxlu_disk_l.c           | 952 +++++++++++++++---------------
>  tools/libs/util/libxlu_disk_l.h           |   2 +-
>  tools/libs/util/libxlu_disk_l.l           |   9 +
>  tools/xl/xl_block.c                       |  11 +
>  14 files changed, 736 insertions(+), 480 deletions(-)
> 
> diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
> index 71d0e86..36c851f 100644
> --- a/docs/man/xl-disk-configuration.5.pod.in
> +++ b/docs/man/xl-disk-configuration.5.pod.in
> @@ -232,7 +232,7 @@ Specifies the backend implementation to use
>  
>  =item Supported values
>  
> -phy, qdisk
> +phy, qdisk, other
>  
>  =item Mandatory
>  
> @@ -244,11 +244,13 @@ Automatically determine which backend to use.
>  
>  =back
>  
> -This does not affect the guest's view of the device.  It controls
> -which software implementation of the Xen backend driver is used.
> +It controls which software implementation of the backend driver is used.
> +Depending on the "protocol" option this may affect the guest's view
> +of the device.
>  
>  Not all backend drivers support all combinations of other options.
> -For example, "phy" does not support formats other than "raw".
> +For example, "phy" and "other" do not support formats other than "raw" and
> +"other" does not support protocols other than "virtio-mmio".
>  Normally this option should not be specified, in which case libxl will
>  automatically determine the most suitable backend.
>  
> @@ -344,8 +346,35 @@ can be used to disable "hole punching" for file based backends which
>  were intentionally created non-sparse to avoid fragmentation of the
>  file.
>  
> +=item B<protocol>=I<PROTOCOL>
> +
> +=over 4
> +
> +=item Description
> +
> +Specifies the communication protocol to use for the chosen "backendtype" option
> +
> +=item Supported values
> +
> +xen, virtio-mmio

From a user PoV, I think it would be better to just select xen or
virtio here, but not the underlying configuration mechanism used to
expose the devices to the guest.

We would likely need to add a different option to select mmio or pci
then, but that should be set by default based on architecture/guest
type.  For example on x86 it should default to pci, while on Arm I
guess it will depend on whether the guest has PCI or not?

In any case, I think we should offer an option that's selecting
between xen or virtio protocol, and the way to expose the
configuration of the device shouldn't need to be explicitly selected
by the user.

Thanks, Roger.

