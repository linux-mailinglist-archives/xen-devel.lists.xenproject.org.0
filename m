Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9932475C7E1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 15:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567543.886742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqFY-0000og-Th; Fri, 21 Jul 2023 13:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567543.886742; Fri, 21 Jul 2023 13:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqFY-0000lM-Q5; Fri, 21 Jul 2023 13:32:52 +0000
Received: by outflank-mailman (input) for mailman id 567543;
 Fri, 21 Jul 2023 13:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMqFX-0000lG-6R
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 13:32:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14b068eb-27cb-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 15:32:49 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 09:32:37 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB4959.namprd03.prod.outlook.com (2603:10b6:208:1a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 13:32:33 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 13:32:33 +0000
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
X-Inumbo-ID: 14b068eb-27cb-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689946369;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sAv8c7htvHksS147dGgne57b/GiMCNuF05wKzQjJYWI=;
  b=IhY25h8KD1TCFu1hMGY65DShadX3jf8AhIWdD95iMO5xQZ+ZwnrWGKDP
   KcP0+Bc91U6v8Lv8IwAWR86s3mSHZQEx7bHQ/BroKEHiMvTk3PwKZMGul
   +rSWduV4/cFhWsNjme4zxxYJ1mdGvUBJ5zrV1AiwcIMzPWkGJfOD/HZ3E
   0=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 119612755
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/z6JwaMoCxEUQjvvrR1ilsFynXyQoLVcMsEvi/4bfWQNrUoj0WQOn
 2RMD2rQMviKN2X3f9snPd639x8PvcCHndFrGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5AVmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0u1ZADB3+
 6c0EhQIYxGAofi5h5C1SeY506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv92LaVwn6mMG4UPLeKyeRq22S3+nxQBhATWHiEgdPnh2frDrqzL
 GRRoELCt5MaykuvSdXsWgyil1SNtBUcRtl4HvUz7UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq10bOZrii7PyQPGkYEaTUZVgsO49Tlo4YbgwrGS5BoF6vdszHuMTT5w
 jTPoC1ggbwW1JYPz//ipQGBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHblrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:cSF236AbmgCBtPflHegysceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssQIb6Ku90ci7MDvhHPtOjbX5Uo3SODUO1FHIEGgm1/qa/9SCIVy0ygc+79
 YGT0EWMrSZYjZHZITBkW+F+r0bsbq6GdWT9ILjJgBWPGNXgs9bjztRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayHqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYD29vac7R6d031loqqh9jJxPr3NtiEhEESjtu/nXvUjZ1TIhkFOnAjm0idWrD
 CLmWZrAy070QKvQom4zCGdpzXIwXIg7WTvxkSfhmamqcvlRCgiA84Eno5BdADFgnBQy+2U/Z
 g7ql5xjaAneS/ojWD4/ZzFRhtqnk27rT4rlvMSlWVWVc8bZKVKpYIS8UtJGNNYdRiKobwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23xdnWx/zUEf2MsD901wgq4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+tBmnEUXv3QRCvyJTcZdI60l722u7KCe8OlZ+XkbQzveoPpK
 g=
X-Talos-CUID: 9a23:lqQ/WG9X29jPNHVR7AGVv0U6G5EcfCbx9lPVLk67L3xmD5+bSlDFrQ==
X-Talos-MUID: 9a23:RiBhhQTZcMA8LB1oRXTmtg54NJxRx5i+S04AlJglhOmuayFZbmI=
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="119612755"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogsUwTFet9R8gsNb1R9746/84bQHX8cmF49lbdE5Z0TCPPrwXIDiF5Wj19dqxyN8G/sOMtmdPrqs4QBrt+7DtqOrf4x8HC82rMo4VCZ6JI7pagmi3V7eaoWAfgwaHbMbvo8QdJQk5wjYJqsjh2cso8rwDf7ACx21Jec9G0+SocuhM/GJDeiR+2dOZ5TCTOCO5D3sNlTtKs2QesiNtzNQ5r4SFX61jpUJHFrgeCYiXsFr8i744/ZUAfsnqIK0nsNdJtlM3DpAML9wKajABkPcJq7cXZ9yw9wkF+YcQnb2/blvmltf7tfjztV6/phODG9TuQ27cFkKtAzTyLGztiBqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjX4rbUtXODxpR5nBCqzRyvBAlJKx81FKUc1/q/oHVY=;
 b=UnQ/MfMJEaHCLRwW11XR5eD5MsMC/AFYn7rIKUDBJs/1srax6EkLCEmQWdcSYcdVD7YPwwqxvtPRU7dD+d6YQGHV9aqj14kvosQKIWToyn8Q5KJAkH0K+ccutSbz/aS8D8K4DoknTTKDTECM6+5iAj3Xf1uF1X9nvMXmxXADcy4e3MJRyrBnSN32RruY2jiIJlyXEd8YIYMIt7Cm9I2rPpt43jXxeNzVHyFxtePnDH+8Q0SyGzhQD9LIkbtiJEaHHUwlsaKJEnycduaY+Tb/qowTtg817eKiSFZNOrzuSWrAhwfgbKauRhOYZ/l9wSkUpK/NEX1323RvGQhyHat6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjX4rbUtXODxpR5nBCqzRyvBAlJKx81FKUc1/q/oHVY=;
 b=vdDTCTcfEjMSKnHJplY1y46D2wzSomF+GlTbchCKeNDpBWSu5/0tl/d4ANhJGi4zgGk7rHz1dpWuu7zJ37HkWGh4S0Pc+j4RhnkCNADkMoLHun1T/OdDtzG39YdRib8XXWX7LoPf5oFjg+6+I0UOJCeNHFsYk8LR1wt1uvbOjKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 15:32:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Message-ID: <ZLqI65gmNj1XDBm4@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-10-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-10-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e354c0-a4d7-4e0b-6cad-08db89eef03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z7erp6L1dxteB39ah88mMbZABbRIXfu2d6t2doLEeefy11QPHnUYwg+8ppFDxdU6Pzk6W38HBovFdmPR7RhhLx/8y9s/TuE9ULc2Bs3J1/sDvxqszsJ49qqaM2HxVUu9usHl49jWc1+TBHWwM9/cG16dkD0SA11ZFWWso89LDti1RQYzZG2tnwft0g+i4w39xOYlxMCXBHzafVewmZEJYfrJVQ6VS4MP1jt23NFag6rhGGaTEgYYftHzUBBsylghVfM3N4WpPQnBnLE0bb2TuIezl8UaMfI65ctbqBHoPf3QJMgaANS9e3xVYHoa8vV+W1PFYcegENaUZ9btDrMJi+vsXQ6G1f5UWDShRqoO7C4KnP86aG4Ua/RDMbZ0q4p+gPXqoKzkwIS5RNqulqpML2r7eG2UJzzl8Fa8kpsIbt9jiXVgM1cHTdt3HVGOv/csF8sILfKTMvvdvTj2aqGdSnczyUxxqfj/oruKMrwuDydbEMKrKyFpOAlmGLfckmLF1/Ri4ek70MgvzyUvmZCrK1Y3gOKqk5EE8YX5xLjsEzDjLISKvSTieRWJRYe/z5Gjg3HUejBTqI9XSIlHmCJPCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(966005)(6486002)(6512007)(6666004)(9686003)(82960400001)(83380400001)(66899021)(6506007)(38100700002)(186003)(26005)(54906003)(316002)(478600001)(66946007)(6916009)(4326008)(86362001)(85182001)(2906002)(66476007)(66556008)(8676002)(8936002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlp2UG1rYnBrQVp1QXJsazR1TzRZVjh3TS9ZeXFIMHI2UDJJUnpyNnRMS1VD?=
 =?utf-8?B?SC9vWjhZa25teEtNbUdUU2FUbUNCSktMcHZ1N0lEUGtLT0JpZHZRWWExTmJ1?=
 =?utf-8?B?eElvVEZuK3FEd1BqVmRxTUtwc3lJTXBFd2YwTllrSVk4UlJMaWpqUGFEYWk5?=
 =?utf-8?B?ZXJhcFpXYlpkQm9oWVcybWRUeHp2UzkzczVwLzN0M3FETnB0T0wwUEp4dmln?=
 =?utf-8?B?ZWNZbUtqNVFmeVZVTWlMM3VOOEhjbDRodlVvZHJqOGQ4WW1ob2lFeWZoZzFZ?=
 =?utf-8?B?bXpLK1RaQXZYbEdaeGpTMGdGVVdDWklGczBZSlJZSVhybW5OVzNMOW1lZGZ4?=
 =?utf-8?B?aExibVpsQS9uQjE3dllNRnFtOXp2OU1JdUxVMzg2NGxlSXlNcmo1a005YmJ5?=
 =?utf-8?B?K1RpUVhXN0cyR2VCNGV6alc2dkpJcU1NbkNaUmtjTzVLSjd5VkxUcWdjbVFY?=
 =?utf-8?B?SUIzWlVQcXhqQ1lDazFSZkg4TnRqd0RhL0RQMjJ1NVZvZjg2ZlZ1MkxqNk94?=
 =?utf-8?B?cndJOU1xT2pZeHJ6ZjFXY0Y5U0JXQy9WdGtUWWk3MHF1alRkR3l5OURNRHRP?=
 =?utf-8?B?Ykk5ZzVnMTNPSW1jYU00ZHVCR3RaNVkzbTBsdGNadmphRW9sb3JuNnliTGxX?=
 =?utf-8?B?cmZFdlUrQkF6VmU0NG9pR2tyb1NFVGV1a3dzT01iQVpNWnJGT1c4U0c3WnZz?=
 =?utf-8?B?SkxMc1ZjQ2ZqbEo4SlN6RS9Fd2Z5MlNJOHFuMDVaSGJMZURUNDZEODkvQXFr?=
 =?utf-8?B?UnM5SkZKTlJOWk9iMTUzNm5yOEJqZ0Q0K1R1endxRXRWcHVxMUtsWUdrM0lq?=
 =?utf-8?B?YTZza0loYmkrRFdPRmdEWGNuR0ZsZVFteFNISm5pVTVFdVRlc3RwRit4cXNn?=
 =?utf-8?B?cUsydmlNYkFlM2R5QTc0N3pRNFBDZmFLQVdHWmFndWtmeUx0VlFQMlY0WXF6?=
 =?utf-8?B?YlZsMUFWcE9ScmVvQ2R2Y1hZS1dBQkNlSVBUcEpZcFljWTUwNGtrMVpJSFFK?=
 =?utf-8?B?eWlnYUtpaTRHTzRPNzhZQXlhZWJOQzlEMzkrZllrUUcvR3h1OFhUaFI5S09l?=
 =?utf-8?B?cVVqeE50UXlyeVQ3VFkrbkJoZ3NmTHR0cyt2V0tRRURicmRNWldRazZFK1FO?=
 =?utf-8?B?WC8zQlNCV2Z2c1RKRmFXM1RWandZYUYxN3ZvV3FlN0JoZ3JFTG8rbFVMR2JG?=
 =?utf-8?B?NkpnYzB2aXhSTTNUQzRxUUd0K3J5YkRYMTdkK05lUDhQTXI1WHRkano0MEtO?=
 =?utf-8?B?UlkrenhScU9BRzUyTVN2OEpuZ2IzYWZuV3VyaUFkU2JjNVlrRWswZFlZQzFC?=
 =?utf-8?B?N1FkNzYwTlNwU2NrbHM5M3ltVjlMZE9sWmFDOTU3WCtVRHduNkRkMzJxUUtS?=
 =?utf-8?B?dVNUaGQybVl6UVVpMDYvY0RFYWlaYTlISnlHVmhrSEI3TE5qbFNKSEE0UmZJ?=
 =?utf-8?B?eW1COVFZZEY4bUIyOUFqeGJZRHdEcURFUndCM0NtMldPRHJQL3UrK1g1NUh4?=
 =?utf-8?B?djBEdEpObFZrNWJ2L21QeGtTcXBxK2ZNQndjOG5zWSt3TG5KZlBSUEQxZmY3?=
 =?utf-8?B?VmlLWU1FWGhmVjhtV3pzU3ZBVWxZVDNMVklQMktLMVlhcERlN1VQWFdvOE9u?=
 =?utf-8?B?bThYQTErMnJWdU9sakp3LzdQYkIzenlrVDFQM254SkVKRmFHdWdDeG5uS3Ex?=
 =?utf-8?B?UW1ZUnpTWEdjQ1k4amFlNkRsbXViRFRhVm43TWwyeEFFR0hxSlVJTUNZNzFO?=
 =?utf-8?B?NFFJbW1rWmlUS1NFZEZ5dGY3MlJLanhIY29mUFg1V2dZcTg4MGNIdG5uMTlU?=
 =?utf-8?B?Q0hJVTlMb3VnS3NlbEtNOFdkcDd1ZXE0cVEzWEhVRDBNM0ZFRzRXamt4Um9L?=
 =?utf-8?B?cE5abFg5VzlVVWtCZkxOekF5ZDVMZUpBQnVJQnBFcVdiWU91b1VuUUZ5SU9Q?=
 =?utf-8?B?eGR6RkFuazJISjNSMU5aWWc3NyszQmdMbEltNWVUVWM1NS80d1dONTVPV2JO?=
 =?utf-8?B?WlY4cTd5WHFla3pRKzA5bXhUTlRTeEZQZW9VMk82T29tSWpxaXRUZjU0dFcr?=
 =?utf-8?B?UjBRUllnWHJqSXoyWGFyRFFXZENyV01NeVUxc1RMTHJHdHk4NHZUYWZRcTgr?=
 =?utf-8?B?WDc0OWRCNGR0cWJ6S2VBSnNjc2c2RnQ1OWhkV1VmTVM2MGVqQ25ySUhYU0lN?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zy2nHfh8g7a6Wt9/KrTKbQQdCDffob2Zl5Jx1MWnktbjwuXmPHgvxiEd6Gl/4UF9USUeEPCbsMQDZE4bS+LuRfh0Yx78f05iY0q7VPJC9iyVv+SkPUaF8oHXY2Age7Kx1BNMPKvaQTxiuMAZ/eSIaTG9i76wROfszH9UwhA83wJF86mMTVJshwd+nxRileOWa+qDpBv0PmzFhtxtGelSKbVCnyP37xNqP281WtpA5Fo8vd9u2eWDfYfZRx+QzG8Kgfa7PtDZ7QNVjDLx85HoZzSL0lt7tkbuF7EJ3OeQeGIJ5Opej8Skz4ZaR79zmVrscVCcvdMK7AYFQfbGTumGPr3rq4IoEyyWMKqRUDPOukN6uIzEI/nC9itOrz6ITm+LgU4G/i8QNSFCbwj+DDD1lFrmUllK/F1UTTmFHS2YBagiuzq/RnUdoBYaLtXiBZxTZpmOb7FcUQnTadljxufKJXTfSNo5EqWiBmF42NgL0lYN61ln0bq9Qk0fFASetX2mrath/COglYTEX1dMbkhDLjkulWg6pVerOmlC1pExRaUm7MPglL3n1e0A/lSjTr1xoUirtyR/7Ao3XMQ0XfJJ94CunWAaKoVReGXLS8IFWdabPZQVBB0046LPoTFOK72PaVStgspTkueOgyAcRJeykq9+J+o8caft18seoyD8Ff06s3hr49cirI7F6IKRVKM0jyhG2MTzeY2qO7QA3ssKpkZoE5v5IBPFUibAjmCq+b//p0AWOJlp87iBCSUZkQ73gtva2bHDtbes9/qmEuI+fK/ZPJ3SH+A0l57XN3reYbc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e354c0-a4d7-4e0b-6cad-08db89eef03e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 13:32:33.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JXIxJ0g944cJ/PHG2Tj68/HnCM3F+Uf78NtVNJE+cBCgtCg297rkx5LQYwrn5BLffh/olc+EjGia4Ox7w+fUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4959

On Thu, Jul 20, 2023 at 12:32:33AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
> to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
> guest's view of this will want to be zero initially, the host having set
> it to 1 may not easily be overwritten with 0, or else we'd effectively
> imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
> proper emulation in order to honor host's settings.

You speak about SERR here, yet in the code all bits are togglable by
domUs.

> There are examples of emulators [1], [2] which already deal with PCI_COMMAND
> register emulation and it seems that at most they care about is the only INTx
                                                                      ^ stray?
> bit (besides IO/memory enable and bus master which are write through).
> It could be because in order to properly emulate the PCI_COMMAND register
> we need to know about the whole PCI topology, e.g. if any setting in device's
> command register is aligned with the upstream port etc.
> 
> This makes me think that because of this complexity others just ignore that.
> Neither I think this can easily be done in Xen case.
> 
> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> Device Control" the reset state of the command register is typically 0,
> so when assigning a PCI device use 0 as the initial state for the guest's view
> of the command register.
> 
> For now our emulation only makes sure INTx is set according to the host
> requirements, i.e. depending on MSI/MSI-X enabled state.
> 
> This implementation and the decision to only emulate INTx bit for now
> is based on the previous discussion at [3].
> 
> [1] https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_config_init.c#L310
> [2] https://github.com/projectacrn/acrn-hypervisor/blob/master/hypervisor/hw/pci.c#L336
> [3] https://patchwork.kernel.org/project/xen-devel/patch/20210903100831.177748-9-andr2000@gmail.com/
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> 
> Since v6:
> - fold guest's logic into cmd_write
> - implement cmd_read, so we can report emulated INTx state to guests
> - introduce header->guest_cmd to hold the emulated state of the
>   PCI_COMMAND register for guests
> Since v5:
> - add additional check for MSI-X enabled while altering INTX bit
> - make sure INTx disabled while guests enable MSI/MSI-X
> Since v3:
> - gate more code on CONFIG_HAS_MSI
> - removed logic for the case when MSI/MSI-X not enabled
> ---
>  xen/drivers/vpci/header.c | 38 +++++++++++++++++++++++++++++++++++++-
>  xen/drivers/vpci/msi.c    |  4 ++++
>  xen/drivers/vpci/msix.c   |  4 ++++
>  xen/include/xen/vpci.h    |  3 +++
>  4 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index e1a448b674..ae05d242a5 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -486,11 +486,27 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      return 0;
>  }
>  
> +/* TODO: Add proper emulation for all bits of the command register. */
>  static void cf_check cmd_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
>  {
>      struct vpci_header *header = data;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        struct vpci_header *header = data;

Why do you need this variable?  You already have 'header' in the outer
scope you can use here.

> +
> +        header->guest_cmd = cmd;
> +#ifdef CONFIG_HAS_PCI_MSI
> +        if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
> +            /*
> +             * Guest wants to enable INTx, but it can't be enabled
> +             * if MSI/MSI-X enabled.
> +             */
> +            cmd |= PCI_COMMAND_INTX_DISABLE;
> +#endif
> +    }
> +
>      /*
>       * Let Dom0 play with all the bits directly except for the memory
>       * decoding one.

This comments likely needs updating, to reflect that bits not allowed
to domU are already masked.

> @@ -507,6 +523,19 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static uint32_t cmd_read(const struct pci_dev *pdev, unsigned int reg,
> +                         void *data)
> +{
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        struct vpci_header *header = data;
> +
> +        return header->guest_cmd;
> +    }
> +
> +    return pci_conf_read16(pdev->sbdf, reg);

Would IMO be simpler as:

const struct vpci_header *header = data;

return is_hardware_domain(pdev->domain) ? pci_conf_read16(pdev->sbdf, reg)
                                        : header->guest_cmd;

In fact I wonder why not make this handler domU specific so that the
hardware domain can continue to use vpci_hw_read16.

> +}
> +
>  static void cf_check bar_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> @@ -713,8 +742,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          return -EOPNOTSUPP;
>      }
>  
> +    /*
> +     * According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> +     * Device Control" the reset state of the command register is
> +     * typically all 0's, so this is used as initial value for the guests.
> +     */
> +    ASSERT(header->guest_cmd == 0);

Hm, while that would be the expectation, shouldn't the command register
reflect the current state of the hardware?

I think you want to check 'cmd' so it's sane, and complain otherwise but
propagate the value to the guest view.

> +
>      /* Setup a handler for the command register. */
> -    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
> +    rc = vpci_add_register(pdev->vpci, cmd_read, cmd_write, PCI_COMMAND,
>                             2, header);

See comment above about keeping the hw domain using vpci_hw_read16.

>      if ( rc )
>          return rc;
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index e63152c224..c37845a949 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -70,6 +70,10 @@ static void cf_check control_write(
>  
>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>              return;
> +
> +        /* Make sure guest doesn't enable INTx while enabling MSI. */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);
>      }
>      else
>          vpci_msi_arch_disable(msi, pdev);
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 9481274579..eab1661b87 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -97,6 +97,10 @@ static void cf_check control_write(
>          for ( i = 0; i < msix->max_entries; i++ )
>              if ( !msix->entries[i].masked && msix->entries[i].updated )
>                  update_entry(&msix->entries[i], pdev, i);
> +
> +        /* Make sure guest doesn't enable INTx while enabling MSI-X. */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);

I think here and in the MSI case you want to update the guest view of
the command register if you unconditionally disable INTx.

Maybe just use cmd_write() and let the logic there cache the new
value?

Thanks, Roger.

