Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED475B06C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 15:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566621.885685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMU4M-0006mJ-51; Thu, 20 Jul 2023 13:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566621.885685; Thu, 20 Jul 2023 13:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMU4M-0006k7-1V; Thu, 20 Jul 2023 13:51:50 +0000
Received: by outflank-mailman (input) for mailman id 566621;
 Thu, 20 Jul 2023 13:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMU4J-0006k1-G4
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 13:51:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f1a4499-2704-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 15:51:45 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 09:51:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7273.namprd03.prod.outlook.com (2603:10b6:806:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Thu, 20 Jul
 2023 13:51:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 13:51:17 +0000
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
X-Inumbo-ID: 8f1a4499-2704-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689861105;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=91QONlkiI9FBg2xpYdlqxYa5oHQXFiEPy8lwDQNxH1k=;
  b=h/7f2bStgJiQ9F3Z32BshLdS0X8zpGdGE8mecZ21NtuPb8YSRdnQrt5u
   682sXQqbGA9vYHpM8NMO8gssg+dXQwMLviAfWUKIKMIqYQSHvKafu1rX+
   Mf0G7A1w++nIdTobPw2DpSGkyfZfulQLz3VdbUPZS7oDT4knmsfuRnYxQ
   8=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 116745642
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:U/I3mKrSEGv6WaRsXqS6UaNQWlpeBmLLZBIvgKrLsJaIsI4StFCzt
 garIBmEP6mNZWbxfd11b4myoEhXu5aHmIRgSAU5pH0wEnwV8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzSFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADEMdiDahum4+o2EbcBDtJUxE8PFDLpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWNEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtMS+HlqKIw6LGV7k0MEgQsTQT4mOWWs0mgZNdeL
 ExJ/wN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq10bOZrii7PyQPGkYEaTUZVgsO49Tlo4YbgwrGS5BoF6vdpuPyHTb80
 jWbth8Ujr8YjdMI/6ij9FWBiDWpzqUlVSYw7wTTG26gsAVwYdf/Y5TysAeDq/FdMIyeU1+N+
 mAenNST5/wPCpfLkzGRROIKH/ei4PPt3CDgvGOD1qIJr1yFk0NPt6gJvFmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:Uvqj5KiL5ofHz38ODj0yQnQ8OnBQX7p23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nGPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLgCP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQmwoG2jvH8xu1kHHjqcv2SHYTDNdAv5tQdl/851A7tN9x/a
 pX1ybB3qAnRS/orWDY3ZzlRhtqnk27rT4LlvMStWVWVc87ZKVKpYIS0UtJGNMrHT786qogDO
 5yZfusrcp+QBe/VTT0r2NvyNujUjAaGQqHeFELvoiv3z1fjBlCvj4l7f1auk1F2IM2SpFC6e
 iBGL9vjqtyQsgfar84LPsdQOOsY1a9Dy7kASa3GxDKBasHM3XCp9rc+7Mu/tynf5QO0d8bhI
 nBalVFrmQ/EnieRvFm5Kc7siwlfV/NHggEkqplltpEU/zHNfbW2BS4ORETe5DKmYRbPiXZM8
 zDSq6+TcWTaVcGIrw5rzEWa6MiV0X2b/dly+rTe2j+1v4jebeawdDzQbL0GIfHNwoCdyfWPk
 YjNQKDV/moqHrbF0PFvA==
X-Talos-CUID: 9a23:WFEc4WG5AQjOahCmqmJm9VYkQ8EufEfi81D5DH3pG1ljZo2sHAo=
X-Talos-MUID: 9a23:wzZ3egnVMYEWyIjOXi52dnpDK91x2bzxS3kRvqwBpfaBNCtwZjK02WE=
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="116745642"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hklexdhw6smU5GtrkHa+IKPTadcRbPRsgf06/EB5WH5YQXjnHuVJFnhasOA6XoAh86g6R3FoFf9wW1jTZIypBzJyNiMblxDmULxPOMlLBREoCGpRHj0B8IqdCuTqfGMCrByGzYBEE6V+f79shgZIPIyf1dVBJxnfQrQLouMOfWDVdqGTkIwbrGptxqGEBkRVdZ9ATsyfkQ2BeWjzqAvRwlll0r+L96tVmj4p8UUs+TGwG2ZvYrcpAcLG20RRdqrrydgWi3n+52Wb+A5guBpFRK8kyBSVbbnH+VlU54VIQNTV4QmKqFDrjQ8CubiCDlz0y9xAPsyDDxTbrDi8eGSmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCQlYJOl/406gLgRUbair3VkQa9t1mHIdjh+qgkBVbw=;
 b=E1NnCTdsy9Wb4B7szy9cfZuWys47EH24PUYQ7PYPUWpoosl27cNiETN0xpXjA46qlv4CzQrqzBPYkjByhfCXYmJ7FLfEQvptaTbsM8p8se7f82nNC749mSx569NPONLNRCC1UPfauX78N9K2AOdxeT/s0U2wAPpQelTMhPBd5gfYj/jZMPsX8gIOd2NQvxE1biNwzF5SbCaziYh5gLM+S9zUe4+qO6qkak0dpLPJWTt9KILhGQ90K+p0ri1U4YVJRp85DInJtspnAiYglebfW2DMy+oFeJ+IJNixdEupwN4foiuqKMw5oTCn28UP3IIdtssGjJTWMsclIBkONewayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCQlYJOl/406gLgRUbair3VkQa9t1mHIdjh+qgkBVbw=;
 b=IceN4FNUMjKVgwNCpdezRwOXxROD8ZAu2UH1mMoc/P1oGBP4+BN8BFgC9S2a3bu+Qv9zm5x+iIMK2/r40nZs+xim+BSfgYOYd/QqOxIPeA5dedm8KQsp8g+CcrOjvXOiEeP76DJAEh3F+QF4iUIN3y5watUhDafbThCvq1XUg18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Jul 2023 15:50:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZLk7wh39Cc3GdIuB@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
 <08ec7e54-1abf-5e1e-e1ee-7026a69e0279@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08ec7e54-1abf-5e1e-e1ee-7026a69e0279@suse.com>
X-ClientProxiedBy: LO2P265CA0420.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::24) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 322517c2-5cd6-49a4-b027-08db892863d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qBTmrfP1Cxq+yD2UMgvrApvs9m3muflH1RXb1ULs39j9JrMKiiua1kdyewLldGCI4bpflRp+aYAWzU8KOv9SM8GLH4Xyz9VFmgWuqXk+3N5Nu3WJUuwxJG16p3bPmMQyovrrQ9i+xrNKpKXk79vRUSzLLxwtJdZPG5+ZuLDyhOOrmP8nj9/J5acrhJvrMKj6ltQnmn5qEXY45x20yNpX4zq1iaK8Qacd2qtTnOZBig/5Bp3XQWMnHGFd8H9iR+TPI21qP+bbBj8cgd1ypOCuNrxPvztTyUb4535xlimpe7kmnRzAXcvYsOrwIIlsAjyY+5oPbauP6KSwrkTA38SPqyY9w94vQNy3xzFyj+Q4Li6LSjAtYQeFdJmZ0bGBGY20zaZJWT/YXTcxHwp/fR7aRdqYdw2k0woVU/p/+67RC+RVnmrw0h8r50pr6dfCzXmWKE1d2+zwCPn9JnMEUq+s4vuOxsCX8oQ6WJvT8C9UOiBgZBgymMz28huYjmTzprnNjjEmU6e75wJopV/fcZ3KI7L3QKUZTprS4okI60YtZSS/6eYvZ9R72iOYA5vZbInS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(6666004)(9686003)(478600001)(6512007)(86362001)(53546011)(82960400001)(26005)(6506007)(6486002)(4326008)(8676002)(66946007)(54906003)(41300700001)(66556008)(6916009)(2906002)(38100700002)(5660300002)(316002)(66476007)(8936002)(186003)(83380400001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXYzSnNkY0RSdnE4UHd5MVdrY0grQktNUktMb0NWZVhXQmxSdXAyZUFsUUJU?=
 =?utf-8?B?RTdWRnp6ak1FNURURitPU1Jkem8yZEl6YlJydWpwbTFMNjdNYlVqN0YybEQ2?=
 =?utf-8?B?dUJHU091d1ZOWTVOUXFGNEFjNzJGZnZmcHI2b0FtNHA4aE0yTkNPYm1Cd1hm?=
 =?utf-8?B?dFZTRlFkNEZubk9oWVlXRitNRkp0STZESUtIQ0tSN3hiQWxMejNqYmQ4RmJO?=
 =?utf-8?B?UW5yTDhlN1JDOVg5N1pXY283UW1Ma29FZU0xeHo3QWRDbUdpYmowZnliYWsv?=
 =?utf-8?B?WDJxK0pBaTl1VTlWeEpRbitRbzUrejNGcThIbk14MXlRWHJqL0syV1NjNldQ?=
 =?utf-8?B?WXk3QzhCbU5ld1ZkOU82VGxReXVHeFRJUE5ldllxOWJrcXZueEt3MHF5L3ZE?=
 =?utf-8?B?RGZNT0FPTXc5Rnk3S25TYXVvM1ZnOHY1WHJ4V2h4Tm90ZTRySHpDcElOTFNj?=
 =?utf-8?B?RGV4MldyUS9JNjNJRmJsZUpMZkRiOWNpT1NoY25obzdBckRRK3MvQUlMaU5T?=
 =?utf-8?B?UnZsWkUrelVQK05wbUo1L2hVb1VZc1B6Q3JXVXJJUThxSlhhQ21iNi8xT2Nu?=
 =?utf-8?B?WlB6Sy9uWkE4ZHh6c29RYVlxWWozTWFra3VNOW9Md2llNk1JMzFVbGVaS1lY?=
 =?utf-8?B?RlhLSURhVnNGKzEzQVFxVHRnSUxTWDU0amE4c05va00xdUVwNDJHbjRuanow?=
 =?utf-8?B?QjJ4M2U4ZjhNMkRFdXJUVGN2NnQwYW56UjdzUkwwejRJMlVpZEYwaEZpbDEr?=
 =?utf-8?B?RVh2Y1BxYkRzWnhzTUlSQ2ptdnFHZnIwcFhEYTlMUFZlVFJJeVBOK3BJdElE?=
 =?utf-8?B?RVhaNkwrR2lXbG85dGtpa2UySmJubFRzN29rTHpURU1qVFBkcU9nSHdlWEIw?=
 =?utf-8?B?VEJ2NWc5MWRPZ3Q0eWcyWDVNZDZuODJZeUY0Vk1vTVNXK0hWeTlPZGhjbXkx?=
 =?utf-8?B?R0Z2MVJkQkF5aFYwLzcrNmJkK3VRVW1lekFvRE1XTGw1WHoxZXJSZ21SVXJ6?=
 =?utf-8?B?YW9GbUJzVitXTS9WOCtyODh2WUFzMFozQVg3eVUwUUNvYldXK0FGSVJCcUpy?=
 =?utf-8?B?dGI2L0ZBTFk0R3l1YkVpcXhPcjQ4cllqQ096VUFDZEV4blZISXZubVlDZGNN?=
 =?utf-8?B?QmJIMHlrbTBsbkZEWlhSUWx3dmZqc2ZXU0prdTZNNmYzSWNYRCtxVXM4QTNw?=
 =?utf-8?B?eVRXQWdsUHYyUFdPK2RHMy9lUVp2a0dEclp3ajFVYlQ0aTExWStqT0FPZ2tO?=
 =?utf-8?B?ckczcnRXMjJOQk4wM2dTV1dycmRVUVBKOEExUTZvNUR1cmZ2cm1TYTRZTEdG?=
 =?utf-8?B?cFcwUUZIVnJhekN5OXY1UTUzdjBpcHZROGVXT2N0VnJ1VjdodWhXd3N6SDVS?=
 =?utf-8?B?cG1QMWUrZElreVE4YVcrM05GdmtDYlpHKzdPei9GbDRJSlhBVUc4VTUvY0Mr?=
 =?utf-8?B?YlhibFRiZlE2N043WlRJM0FHRFo5eEIvTXduSGlVS1hIVXZ5NE5SVkxJbUo3?=
 =?utf-8?B?MEVvU1hOODV3dk9XeklQNjlxOUw3bmxYcGpzcm9LcnI2aVFrY1NEQW9JMWlG?=
 =?utf-8?B?UjR1RUFZYTdteSswRmJXNkRFNHBpWjBiaFk1TnpQZHhYaWZPWjJlMC9RaVpK?=
 =?utf-8?B?NU1Ba3FuYnhyL2FBdk1oUHpuR2cybTdsVHVIMnhEMG1SNnNZdnp4ajk4TFZT?=
 =?utf-8?B?NnI5clE3VDlERkl6U1FrQmJ3cnFaZGl4djhkSW4ydStqTDhTUkhXSE11WnZr?=
 =?utf-8?B?Q2t0cTcvQlpsOHVkd2o1RzA1YU5VRDVUd2VnNjVScEZkUldqcHE3a0ZPZ1Ev?=
 =?utf-8?B?WW55VlhRbm4vTm0xaE5BZW1pU0IvUmRBT2Y5S2Z0ZFhwM29wSjY2V1J6NTlP?=
 =?utf-8?B?TVBjeURGTkRHSDlLTGt1S3pKRERiSzRRbm9tMEM3ZkpWYUN0WFdkbU5RRE5l?=
 =?utf-8?B?MzRGUXA5RjV1SUVNeUVNVnR1cDV6R1djZnpWV3ZzT0lhSkViYThseGF5azhn?=
 =?utf-8?B?ZWgrdWgxZFM2Q1R0MkhnbXlEUGtLQ1dKeFIzdS9hQ2VGamVHRGpDdVlNRXJ6?=
 =?utf-8?B?c1hQNGpNbTU1VzVWV09aVmRaSWRhMWxCV0hPNUJ6cTczVjdLQXZEM1psbFpJ?=
 =?utf-8?B?bXBINlRNb3c1NlFhWGxyZFJ0NktPSkFRWjBVMjBQSXMzbmNGTFFTQnczUG8x?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dKLw7EY96Cpr7TAJ0ntjOKmHztCGZv3pAs/fuY0Oy57n7F5Y3/lG1MDd1tK8cSJKqGak+RpNsTuLMCvv3zOgTMNKzmVihXtgk4qN5biNNxDlJYbi6HjJlR5vbsCAxwTEbRU6hlfYPwAD3Q7ZGLxFiOR/FmHpGWuIlqkt3F7dS1YesviYL2tGaQxspXcFHCNL+CjGWt66ii5fz/MA8QBMkRVth0WyWFw9eJJiYYdhQe9bsfVTJRshse0k+rHbE+Z2SltFdpMGP/R0a57/GvpxsViGBgbbh0UShBWY4mZl/JVWRkKrELlsGJAw6NR+Pw2TLTEUd5GPfSn/8ZuQtPPVQLsnEFgXlbGi7eGLjGQMa6C57k185jCxt9OSHe7Lq8Qx4TNLAjWmXx2oOv1afqjCXNrZo918RA04df7i0Xem8BzuLst4hU4O73jN54EGoeLFbH0tmzAKQMGBmGlhEoSkMJSaxPQUkWmjVZF/52tRm+RONcdARg/LzLGt+eOEG0i6wiUIr05zCiJ5HahdvrfZlJ49Xw+o665AyRijPXyF5Iwik9UBT3J+sktB3xSfqNIrge1zLiz1QimBg5rNTGNZ7C8wZRxLeMJcMdsLz1sMNOHz1XA8QWTsGoVr9xxyGyikUwBqqWscl1PKJU8GVkcL0zJQ1o9i1ALWWP0TGs43sfO9S2mY2O8j5ClAeC8/2pNdqzWXBjthsoYmpuVPmMm2Yk2GWbtaRVfVryltAIrf9Ei3K6g7NDk7nFECPMzPGL8NINDWnynpgC6accwpznlfr2VSkRT3q/MxZgHjobC2ucQwK4P++2xk48qup9gt3zarEGzF7BT2hbbkjC/JfWbnRw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 322517c2-5cd6-49a4-b027-08db892863d5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 13:51:17.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nV06r7ZCUEAbp6+1IxNZlofv7mgoxB258XNhJwwbCdiTFbfxXmn36CpoBW9/ZBgRztCa6rdnibmwuBiL4c1Vxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7273

On Thu, Jul 20, 2023 at 03:27:29PM +0200, Jan Beulich wrote:
> On 20.07.2023 13:20, Roger Pau Monné wrote:
> > On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> >> @@ -447,8 +476,16 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >>  
> >>      /*
> >>       * Find the PCI dev matching the address, which for hwdom also requires
> >> -     * consulting DomXEN.  Passthrough everything that's not trapped.
> >> +     * consulting DomXEN. Passthrough everything that's not trapped.
> >> +     * If this is hwdom, we need to hold locks for both domain in case if
> >> +     * modify_bars is called()
> > 
> > Typo: the () wants to be at the end of modify_bars().
> > 
> >>       */
> >> +    read_lock(&d->pci_lock);
> >> +
> >> +    /* dom_xen->pci_lock always should be taken second to prevent deadlock */
> >> +    if ( is_hardware_domain(d) )
> >> +        read_lock(&dom_xen->pci_lock);
> > 
> > For modify_bars() we also want the locks to be in write mode (at least
> > the hw one), so that the position of the BARs can't be changed while
> > modify_bars() is iterating over them.
> 
> Isn't changing of the BARs happening under the vpci lock?

It is.

> Or else I guess
> I haven't understood the description correctly: My reading so far was
> that it is only the presence (allocation status / pointer validity) that
> is protected by this new lock.

Hm, I see, yes.  I guess it was a previous patch version that also
took care of the modify_bars() issue by taking the lock in exclusive
mode here.

We can always do that later, so forget about that comment (for now).

Thanks, Roger.

