Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370B511C42
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 18:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315247.533709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkHG-0005Pt-UD; Wed, 27 Apr 2022 16:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315247.533709; Wed, 27 Apr 2022 16:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkHG-0005N6-RD; Wed, 27 Apr 2022 16:12:30 +0000
Received: by outflank-mailman (input) for mailman id 315247;
 Wed, 27 Apr 2022 16:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njkHE-0005N0-Fu
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 16:12:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3036eec-c644-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 18:12:25 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 12:12:23 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB4877.namprd03.prod.outlook.com (2603:10b6:208:aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 16:12:20 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 16:12:20 +0000
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
X-Inumbo-ID: d3036eec-c644-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651075945;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WgHBk5p+i9oC83s4p7hQ802LRS7nlB1pNsAlFsPx0RU=;
  b=BBi78MLHtUwLVc9oTHFH2nnBMVYq5Qyr0Pk0apnq0VLRcSS8IQ0Pi1ku
   NSEvHl+F96MkvaamjwX/rTMDZs+YRX31Rm9T8jHFd+Iv2FXjFrsH6eCSo
   eWVIxyWU6qw0AAJdXTzS1yaQBueY3Lb+nz/OFlfSrXMiY3aKKslVB4A0P
   c=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 72516553
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e8tZZ6z46gyQ3XP2wdV6t+dDxyrEfRIJ4+MujC+fZmUNrF6WrkUPy
 mYeUD2CPf/ZYmfxKdsnbd7iph4OusTQx9M2QVM9riAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024fhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplmpO9RV8tOav3tstFdQJ4AgB6HPBJ5+qSSZS/mZT7I0zuVVLJmq8rJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHuOTuocwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKWAB9g/I/sLb5UDa0QMs24nMMOaPJMSwHsx5g2GAi
 VjZqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsb5dw21pjiDpBF0ZjZLO+gz6QXIwKyE5Q+cXzIAVmQYN4Rgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZowL/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:BFl2eK62Kj+61SSCRwPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="72516553"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bllBvTTBuG3ZHxm58i3JHUNTEugU/tZCwgBbJh/+mfO1jKjX80L0+QKqZImktOmXJxcajoIg/+98fCnHsns3Z+CTUMXpN9R82N8QU3fvsKPnw2TAZ4nDgg9OIatfL51iFxKxPjzCk2t+tTVsDRAnAb1rRpYQdNBMGKvbkbJ5qgqVrcLWrMQe3UkGOw0YaBpuYiIt/4W2aymdR6/zJxHH6rnszt52SJFLCh2Nn9Nbn/8b9J58OYe/GNVVNWPo/x7fgTmKqA9JpYXR0FePB1HhSDOjfsVh6U6Ox/8J2UCrcO4CmBhPMji9npmr/WJZtCaPBRzQFEEn0ZGle+MNr9AsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGoMGBVNu9dwfwIntFNzK41kXcpk2VmnGfHIW7epseU=;
 b=Zd1g46nETYVAQauZ9ajUkFBxFIw2WxQanmPvHeQiGiMyi5uLV507jsDH0FRFeERziyKjY0uOnLtEgCJwBNQruLLcMKAs+6S6OQ7rqysoiLrt0DtVLvZyDs3M1RIUW+myPtTPGPUrbVu64teaY+nN4bVOJhU/NtHMeP0fI/0viGpnqJOgUlyVGA/db1svrZfX1iwgAOqk6cPYo9M4ValiFatmyvjFg7Id1bdVIByQOFgJVl0r3Bh6cdaRIKsNV3cuVbPCyhrq6cqV9Dd8wbh6KwEJ2OUyRkoxCU9SugxyadC03sXhW/mt5E5LEBI+D+SJHpDQeqimZPA4S3EAIdeWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGoMGBVNu9dwfwIntFNzK41kXcpk2VmnGfHIW7epseU=;
 b=tm5ZukSHiMmMHL+d9vRyH7ZhHytdG5uwBu9BApc9sGB72c3CH0J7ThoLQqQMlAvtpr7vApIHfgaPfrMGZGvJh1IDdF+mORGgZhdJ8zaowrybigZLbr055jxlaIpyKXZ8+FkdUQ1Z0DlrMlzUAp5uoXMmVO183/GCbTVagPzhK5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 18:12:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/4] mwait-idle: add 'preferred_cstates' module argument
Message-ID: <YmlrYNFI75wQlVlg@Air-de-Roger>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
 <Ymk7BjXdyiMUGoc8@Air-de-Roger>
 <47b50c64-b8bd-df95-9de9-175780c50e0b@suse.com>
 <Ymlb2Wly25k9bF0z@Air-de-Roger>
 <d9e797eb-5075-2c95-cfa9-959586577f98@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9e797eb-5075-2c95-cfa9-959586577f98@suse.com>
X-ClientProxiedBy: LO2P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e66754ba-1713-4014-7872-08da2868b505
X-MS-TrafficTypeDiagnostic: MN2PR03MB4877:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB4877336B9E6272491F71EBAD8FFA9@MN2PR03MB4877.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c4v9HAwAdKeGG53A8kHCNRIHHesvzsdgt59fzSrV2vS2GpvKK8omtySTAyIwQNNJI9ZU2ClN5e/E4TZ3OpTq6wfeUqRJLU93SZToZlPuvueHgCPaUsqECLuncLNCImL9Ulo9cXkAH2oWkgPcxTfNZCj8P4Ink5Nb4qAb2aexqbrTLUFgPn+j24o9jjENppRVH264VD9V30zVlX4sPiLz/qwehypcg5S4S2c/33FXz6Pky3l0fFremZMdHMnYRgjPz1QWhALl1cibBivpYN0BqHCArNeTYy5f0/L0Fo0IM0gJFx3dCZqpSN+J9QGngrN7rhZ7IXEO5EJOIr6Gx7pK4J4cU15McFMPRf4jtPzhSXsxfKjZ/7oe4G8W3zErY3HC3Wjvm15vUHj/YgsCWytZJI8tb1NKNKIvpyKGUPPatnSBaSm3GfzCBJqKrLZ1kCo4S+Plr2iPUHUwVn/wGikIDcSBOAKYyO6okbeUDP872w/LH1mehq1Xacq5d61uUctDddqBTNXGuyVN3fjV6AlwJ4wdqJlDsd8VZ55MvqQEWKCdMPoVoMmFV24MNYe9vdDt5B1GMFhvPndyiMotxNolc99sVwnBtKezXm/yOr3Fs71DscYpEUemEckUX0KbLiJ5HvjGDjN3oKDvcy6fKgpTmKITpGDS+V2MYa9AQEce5PqurxRPh4Y8OzT+qY2xpH8on3h0waCcOIsHhFn4v/Ye3ob9Yu6B9GnKXmiUClsKumo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(33716001)(66946007)(5660300002)(2906002)(53546011)(6916009)(316002)(6486002)(82960400001)(508600001)(8676002)(83380400001)(54906003)(86362001)(84970400001)(85182001)(26005)(6512007)(6506007)(9686003)(6666004)(8936002)(66476007)(4326008)(66556008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEx0MXpFY1FHMUhJUkdqNzA3WFh1U1hRT2JpcWFqTG9HWWZSb3RIa0tWRmxi?=
 =?utf-8?B?dE1NOGx4MUoweUZuRWdTeGZXK1JZU1pxYUJsdzJrZ3kxS0tTTXM4UG5LSTVw?=
 =?utf-8?B?MzlOK0M4R0I2WlR5QTVsVHZic0g3RFNFYXEyWDBTVmZiZnNnYmlQMmlwSk56?=
 =?utf-8?B?MCtKN21QZnBsWVo4eVQ5b0NSL1ZwTmdIbUp0cVZ6S210VmlmVlUzK2xWWjg0?=
 =?utf-8?B?czRwamZNNDJMbFNsV2d6cG9qdUlDaWZvMmlMcUIzeWhYRk93djZoc0ZLd056?=
 =?utf-8?B?QUo0NW5ZNDlrOXhTSDZza0tYT01qS085UDg0OFBhRE9jQzNaMFFkZWRLektp?=
 =?utf-8?B?eG92dlpjNUZyVithdEZCc1dicWFhSXJqQWZxSmp3dFBubVdEbFA4UW1qU1RV?=
 =?utf-8?B?a2JaVnZ5VjNlWm0yRHBvU3o3UXZsbFZXSmdWRkpZYkZlL3UyK015SmZvcTJ2?=
 =?utf-8?B?dVZBSXlRV0tycHhtQklWNkhMMTlrcnl6ekN4M1RZSW9jbHlreHg4UllLSU1l?=
 =?utf-8?B?S0R2dHZ5V0NRYnpvbEYzRi9uR3l1bk8zYjFFMXBtMTUrUUY4UWFzRmZUZ0F4?=
 =?utf-8?B?ankyaE95MHlDK3MyZ3lkaS82TmIwT1BreUZ0N0NSQUZVa1l0dFNUUTczTml0?=
 =?utf-8?B?cUNScHVZYnZlNDlrdlV6ZTNOS2g3M01rZUxaSDVHbmJwdEI5dm05TGg2cTk3?=
 =?utf-8?B?b1EyZHpyRWkvWjlWcEtLbitZL1RqYjlidFpWK2ViTkdmbkVkQXBtbEs2UC9u?=
 =?utf-8?B?eldRQkhFLytZeXUwWThJMmhyREZFZWlqK2Ficit2Y1V3YTZSZThmNVJjOFZQ?=
 =?utf-8?B?OWxhRTg4ekR6SGcwUkhkUDgycUVkdUIzUXFWb1BaNHJ0RXkrNUQ1TGMvVGoy?=
 =?utf-8?B?ektSSWdUbCt5QkozdTBmbmY2U2ErcHVkVjI5OU9VR0V0UWI3RXp6WDhDVnBW?=
 =?utf-8?B?NS9aY1pXMllQdTVPeFNkMWE5RkpTNnRzSXp4ZnpsQWNEWVZXTWp0SHJId1J5?=
 =?utf-8?B?VzYzYldld3B3dW0wb2VhTE9FOTRJN2w1Qi9yWTZHNTduR1RQR2pPOXM2aFZ6?=
 =?utf-8?B?b1dOU3A1Sm5ndnlETVI5ZExLQ0dsa0lscUZDbEw2cWpLU3IzaTBsVjNTMDd6?=
 =?utf-8?B?amdVVG9jaXptRk9RVG5lekQ5LzVCTTNXVmp2dS82eHVybWxhTzR1MlJiSkEv?=
 =?utf-8?B?WG1uVlVzRTBWSThqOTBSSXNPdnVyRitvTytZSE43L1lWcEpmZVk3NWNnVlN1?=
 =?utf-8?B?RlJpaEg2RnZPK2N6OVdDSXFjbW1XV2d3T3IyS3cyTmt0ZmI3M3hBSVpLR1ly?=
 =?utf-8?B?ZkJZSjVYOVo4cEE5eWpJdHZTM1JiRXBLQjAzY05aTlRPREdiRzhrRjdaTVlH?=
 =?utf-8?B?cUFsdVZDNkxMd0lFd21aaHA3dlc5S2pjRjhIZi96djZpbkZYdWRYdGhiL2d0?=
 =?utf-8?B?RVdBNFgwdVBsNmZGcWNkWmtQMFpRbHlFN1lRSlB2bnRYZ04vNDBpeFhoVS94?=
 =?utf-8?B?RGlSVEs4VTdVQWVzMForZFhQdTNUM2FzZmVhNkpVK0ErcGE2U2ZWOUd3WXpW?=
 =?utf-8?B?ZSs2dWp3QWJHUk5QWFIramRPcXpWZFUwZkV6WVUyQ3UramR3TlB5RCtuV2Uw?=
 =?utf-8?B?TjEvN0VqQWhPS3hyRVc5aWtGbTFSNWM0bEhIdWdRSkQ3Z3p6NW9XK2VnVFA4?=
 =?utf-8?B?WmtKbkE1ckNpczVnQkkwT0VyU3piejI0a3hEdHhQN0Y0QTFiVGlWVHJva1ZR?=
 =?utf-8?B?b3I0YUNpb05kNy9yT0ppYStHcEZvSUhkT1NkbWhoWGpNSVJ6aXJ1UmdXdWJC?=
 =?utf-8?B?dXJ4d3prdFFucGI2TlNCckJVWUZ2SlNIdVlGenpoaU1UU1hKYS83RnlqMnBI?=
 =?utf-8?B?UVVhTzdBRG9DZnU4bXRRQzJIYXZIdWlReDd4dzd0TTdGc0N5M2dLK1o1cE9N?=
 =?utf-8?B?S2JKMFUzSGI2S0M1YlJCVzBkbnZjK2QxM3FJdmVWd1ZiUnJmR3NBVzB5UW5a?=
 =?utf-8?B?SFc4bkNnZml1Wm5FQmUzUXhUTjJ3bm1ncitQWGg2YVJ0WGFuWHYzQlFBU0s3?=
 =?utf-8?B?Sm9UNXhTY2QrSERHNGRuTnh4Szc0NExvYnBTekM0c29xYXdvYlA5N1BIYUFt?=
 =?utf-8?B?bGZXSlBUYlBsRHhUME4wN0RIQ0J5cjBpN3U1ck5objl6QU1KdlFaZURmT2Iw?=
 =?utf-8?B?WXJHU0V6Tmx4Y21mc1NadFJuaTNvdm9QR081dHV3ZGFRcTRGSFlJMDkzOTdG?=
 =?utf-8?B?a3RXNm1YQnFXckxYMVVQRXEyZGt3MWxxdkZVV2J3YmduMHhHYUlIWVRnbXBz?=
 =?utf-8?B?WVFXUW1WWkMxSWNPSXdRQzJFclV6RDltSDE3eVVqamZQeVJycUwxUFpiY0Y2?=
 =?utf-8?Q?6VaoURtji2XgmMzw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e66754ba-1713-4014-7872-08da2868b505
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 16:12:20.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUZzrb/1p174fsD8t06STEEY4vbSkBAust4qBqT+fxOPBNBOA56WukGV1JAeza3Pps1D8P6grUFu+3Dmpfw+0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4877

On Wed, Apr 27, 2022 at 05:25:35PM +0200, Jan Beulich wrote:
> On 27.04.2022 17:06, Roger Pau Monné wrote:
> > On Wed, Apr 27, 2022 at 03:41:24PM +0200, Jan Beulich wrote:
> >> On 27.04.2022 14:45, Roger Pau Monné wrote:
> >>> On Tue, Apr 26, 2022 at 12:05:28PM +0200, Jan Beulich wrote:
> >>>> --- unstable.orig/xen/arch/x86/cpu/mwait-idle.c
> >>>> +++ unstable/xen/arch/x86/cpu/mwait-idle.c
> >>>> @@ -82,6 +82,18 @@ boolean_param("mwait-idle", opt_mwait_id
> >>>>  
> >>>>  static unsigned int mwait_substates;
> >>>>  
> >>>> +/*
> >>>> + * Some platforms come with mutually exclusive C-states, so that if one is
> >>>> + * enabled, the other C-states must not be used. Example: C1 and C1E on
> >>>> + * Sapphire Rapids platform. This parameter allows for selecting the
> >>>> + * preferred C-states among the groups of mutually exclusive C-states - the
> >>>> + * selected C-states will be registered, the other C-states from the mutually
> >>>> + * exclusive group won't be registered. If the platform has no mutually
> >>>> + * exclusive C-states, this parameter has no effect.
> >>>> + */
> >>>> +static unsigned int __ro_after_init preferred_states_mask;
> >>>> +integer_param("preferred-cstates", preferred_states_mask);
> >>>> +
> >>>>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
> >>>>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
> >>>>  static unsigned int lapic_timer_reliable_states = (1 << 1);
> >>>> @@ -96,6 +108,7 @@ struct idle_cpu {
> >>>>  	unsigned long auto_demotion_disable_flags;
> >>>>  	bool byt_auto_demotion_disable_flag;
> >>>>  	bool disable_promotion_to_c1e;
> >>>> +	bool enable_promotion_to_c1e;
> >>>
> >>> I'm confused by those fields, shouldn't we just have:
> >>> promotion_to_c1e = true | false?
> >>>
> >>> As one field is the negation of the other:
> >>> enable_promotion_to_c1e = !disable_promotion_to_c1e
> >>>
> >>> I know this is code from Linux, but would like to understand why two
> >>> fields are needed.
> >>
> >> This really is a tristate; Linux is now changing their global variable
> >> to an enum, but we don't have an equivalent of that global variable.
> > 
> > So it would be: leave default, disable C1E promotion, enable C1E
> > promotion.
> > 
> > And Linux is leaving the {disable,enable}_promotion_to_c1e in
> > idle_cpu?
> 
> Iirc they only have disable_promotion_to_c1e there (as a struct field)
> and keep it, but they convert the similarly named file-scope variable
> to a tristate.
> 
> > I guess there's not much we can do unless we want to diverge from
> > upstream.
> 
> We've diverged some from Linux here already - as said, for example we
> don't have their file-scope variable. I could convert our struct field
> to an enum, but that would be larger code churn for (I think) little
> gain.

Hm, OK, could gaining the file scope variable would make sense in order
to reduce divergences?  Or are the other roadblocks there?

I think this is ugly, but would make sense as long as it allows us to
keep closer to upstream.

Thanks, Roger.

